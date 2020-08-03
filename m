Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB2723A9F0
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 17:54:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2cm7-0002QP-3y; Mon, 03 Aug 2020 15:53:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k2cm5-0002QK-6g
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 15:53:17 +0000
X-Inumbo-ID: 70fc0b2e-d5a1-11ea-af4f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70fc0b2e-d5a1-11ea-af4f-12813bfff9fa;
 Mon, 03 Aug 2020 15:53:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ED53EB02A;
 Mon,  3 Aug 2020 15:53:29 +0000 (UTC)
Subject: Re: [PATCH v3 01/11] x86/iommu: re-arrange arch_iommu to separate
 common fields...
To: Paul Durrant <paul@xen.org>
References: <20200803122914.2259-1-paul@xen.org>
 <20200803122914.2259-2-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2a5a0a65-81aa-2c1f-c98a-5e6fd54ba3df@suse.com>
Date: Mon, 3 Aug 2020 17:53:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200803122914.2259-2-paul@xen.org>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03.08.2020 14:29, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> ... from those specific to VT-d or AMD IOMMU, and put the latter in a union.
> 
> There is no functional change in this patch, although the initialization of
> the 'mapped_rmrrs' list occurs slightly later in iommu_domain_init() since
> it is now done (correctly) in VT-d specific code rather than in general x86
> code.
> 
> NOTE: I have not combined the AMD IOMMU 'root_table' and VT-d 'pgd_maddr'
>       fields even though they perform essentially the same function. The
>       concept of 'root table' in the VT-d code is different from that in the
>       AMD code so attempting to use a common name will probably only serve
>       to confuse the reader.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with a remark (can be taken care of while committing if no other
need for a v4 arises):

> @@ -598,11 +600,12 @@ static void amd_dump_p2m_table(struct domain *d)
>  {
>      const struct domain_iommu *hd = dom_iommu(d);
>  
> -    if ( !hd->arch.root_table )
> +    if ( !hd->arch.amd.root_table )
>          return;
>  
> -    printk("p2m table has %d levels\n", hd->arch.paging_mode);
> -    amd_dump_p2m_table_level(hd->arch.root_table, hd->arch.paging_mode, 0, 0);
> +    printk("p2m table has %d levels\n", hd->arch.amd.paging_mode);
> +    amd_dump_p2m_table_level(hd->arch.amd.root_table,
> +                             hd->arch.amd.paging_mode, 0, 0);

At least where you touch the format string anyway, converting %d
to %u where you converted fron plain int to unsigned int would be
nice.

Jan

