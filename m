Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEFC23446F
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 13:15:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Szk-0003Ri-1H; Fri, 31 Jul 2020 11:14:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k1Szh-0003Rd-O8
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 11:14:33 +0000
X-Inumbo-ID: 012ae8a9-d31f-11ea-ab9f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 012ae8a9-d31f-11ea-ab9f-12813bfff9fa;
 Fri, 31 Jul 2020 11:14:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 79EC5AB55;
 Fri, 31 Jul 2020 11:14:44 +0000 (UTC)
Subject: Re: [PATCH] x86/hvm: set 'ipat' in EPT for special pages
To: Paul Durrant <paul@xen.org>
References: <20200731104644.20906-1-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <317725c7-4db4-c844-ec97-6f677b047661@suse.com>
Date: Fri, 31 Jul 2020 13:14:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200731104644.20906-1-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31.07.2020 12:46, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> All non-MMIO ranges (i.e those not mapping real device MMIO regions) that
> map valid MFNs are normally marked MTRR_TYPE_WRBACK and 'ipat' is set. Hence
> when PV drivers running in a guest populate the BAR space of the Xen Platform
> PCI Device with pages such as the Shared Info page or Grant Table pages,
> accesses to these pages will be cachable.
> 
> However, should IOMMU mappings be enabled be enabled for the guest then these
> accesses become uncachable. This has a substantial negative effect on I/O
> throughput of PV devices. Arguably PV drivers should bot be using BAR space to
> host the Shared Info and Grant Table pages but it is currently commonplace for
> them to do this and so this problem needs mitigation. Hence this patch makes
> sure the 'ipat' bit is set for any special page regardless of where in GFN
> space it is mapped.
> 
> NOTE: Clearly this mitigation only applies to Intel EPT. It is not obvious
>       that there is any similar mitigation possible for AMD NPT. Downstreams
>       such as Citrix XenServer have been carrying a patch similar to this for
>       several releases though.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

However, ...

> --- a/xen/arch/x86/hvm/mtrr.c
> +++ b/xen/arch/x86/hvm/mtrr.c
> @@ -830,7 +830,8 @@ int epte_get_entry_emt(struct domain *d, unsigned long gfn, mfn_t mfn,
>          return MTRR_TYPE_UNCACHABLE;
>      }
>  
> -    if ( !is_iommu_enabled(d) && !cache_flush_permitted(d) )
> +    if ( (!is_iommu_enabled(d) && !cache_flush_permitted(d)) ||
> +         is_special_page(mfn_to_page(mfn)) )
>      {
>          *ipat = 1;
>          return MTRR_TYPE_WRBACK;

... shouldn't we leverages this (right away?) to do away with the
APIC access page special case a few lines up from here? It is my
understanding that vmx_alloc_vlapic_mapping() uses
set_mmio_p2m_entry() just in order to get ipat set on the resulting
EPT entry. Yet with the allocation using MEMF_no_refcount, this will
now be the result even if no artificial MMIO mapping was created.

Jan

