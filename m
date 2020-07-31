Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB1B234655
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:58:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Ubw-0002N1-Nh; Fri, 31 Jul 2020 12:58:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k1Ubw-0002Mv-04
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:58:08 +0000
X-Inumbo-ID: 7985091b-d32d-11ea-abaf-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7985091b-d32d-11ea-abaf-12813bfff9fa;
 Fri, 31 Jul 2020 12:58:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 255FCAC94;
 Fri, 31 Jul 2020 12:58:18 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] x86/hvm: simplify 'mmio_direct' check in
 epte_get_entry_emt()
To: Paul Durrant <paul@xen.org>
References: <20200731123926.28970-1-paul@xen.org>
 <20200731123926.28970-3-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a4856c33-8bb0-4afa-cc71-3af4c229bc27@suse.com>
Date: Fri, 31 Jul 2020 14:58:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200731123926.28970-3-paul@xen.org>
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

On 31.07.2020 14:39, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Re-factor the code to take advantage of the fact that the APIC access page is
> a 'special' page.

Hmm, that's going quite as far as I was thinking to go: In
particular, you leave in place the set_mmio_p2m_entry() use
in vmx_alloc_vlapic_mapping(). With that replaced, the
re-ordering in epte_get_entry_emt() that you do shouldn't
be necessary; you'd simple drop the checking of the
specific MFN. However, ...

> --- a/xen/arch/x86/hvm/mtrr.c
> +++ b/xen/arch/x86/hvm/mtrr.c
> @@ -814,29 +814,22 @@ int epte_get_entry_emt(struct domain *d, unsigned long gfn, mfn_t mfn,
>          return -1;
>      }
>  
> -    if ( direct_mmio )
> -    {
> -        if ( (mfn_x(mfn) ^ mfn_x(d->arch.hvm.vmx.apic_access_mfn)) >> order )
> -            return MTRR_TYPE_UNCACHABLE;
> -        if ( order )
> -            return -1;

... this part of the logic wants retaining, I think, i.e.
reporting back to the guest that the mapping needs splitting.
I'm afraid I have to withdraw my R-b on patch 1 for this
reason, as the check needs to be added there already.

Jan

