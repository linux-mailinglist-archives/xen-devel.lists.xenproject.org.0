Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4BF1ADBB5
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 12:58:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPOgX-000683-7n; Fri, 17 Apr 2020 10:57:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jPOgV-00067y-F8
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 10:57:23 +0000
X-Inumbo-ID: 36cb8d50-809a-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36cb8d50-809a-11ea-b58d-bc764e2007e4;
 Fri, 17 Apr 2020 10:57:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 19B07AD33;
 Fri, 17 Apr 2020 10:57:21 +0000 (UTC)
Subject: Re: [PATCH] x86/vtd: fix EPT page table sharing check
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200417102650.20083-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c3589851-7084-e3a4-f776-6157bc4de762@suse.com>
Date: Fri, 17 Apr 2020 12:57:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417102650.20083-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.04.2020 12:26, Roger Pau Monne wrote:
> The EPT page tables can be shared with the IOMMU as long as the page
> sizes supported by EPT are also supported by the IOMMU.
> 
> Current code checks that both the IOMMU and EPT support the same page
> sizes, but this is not strictly required, the IOMMU supporting more
> page sizes than EPT is fine and shouldn't block page sharing.

Meaning the check isn't wrong, just too strict. Hence maybe
"relax" instead of "fix" in the subject?

Also "... page table sharing."

> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -1914,8 +1914,10 @@ static int __init vtd_ept_page_compatible(struct vtd_iommu *iommu)
>      if ( rdmsr_safe(MSR_IA32_VMX_EPT_VPID_CAP, ept_cap) != 0 ) 
>          return 0;
>  
> -    return (ept_has_2mb(ept_cap) && opt_hap_2mb) == cap_sps_2mb(vtd_cap) &&
> -           (ept_has_1gb(ept_cap) && opt_hap_1gb) == cap_sps_1gb(vtd_cap);
> +    return ((ept_has_2mb(ept_cap) && opt_hap_2mb) ? cap_sps_2mb(vtd_cap)
> +                                                  : true) &&
> +           ((ept_has_1gb(ept_cap) && opt_hap_1gb) ? cap_sps_1gb(vtd_cap)
> +                                                  : true);

I have to admit that I always find it odd to have "true" or "false"
as the 2nd or 3rd operand of a ternary. How about simply changing
== to <= in the original expression?

Jan

