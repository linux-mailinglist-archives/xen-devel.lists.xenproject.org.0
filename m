Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A458E2B95A4
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 16:02:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30889.61081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kflS4-00071k-Iy; Thu, 19 Nov 2020 15:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30889.61081; Thu, 19 Nov 2020 15:02:24 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kflS4-00071L-FB; Thu, 19 Nov 2020 15:02:24 +0000
Received: by outflank-mailman (input) for mailman id 30889;
 Thu, 19 Nov 2020 15:02:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kflS3-00071G-HV
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 15:02:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9198f529-1b12-41de-84cd-0ceaa10b0ffc;
 Thu, 19 Nov 2020 15:02:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ED54EABD6;
 Thu, 19 Nov 2020 15:02:21 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kflS3-00071G-HV
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 15:02:23 +0000
X-Inumbo-ID: 9198f529-1b12-41de-84cd-0ceaa10b0ffc
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9198f529-1b12-41de-84cd-0ceaa10b0ffc;
	Thu, 19 Nov 2020 15:02:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605798142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kcL9z9jC7iEJLcAtPdDO0JaXD92KDhIUbO9txRAzG28=;
	b=VP3vVEi6t/Ncea3SRMsFMig3iscpmhvsTvXoukVL5UhVgEiFCnqezJBK0r5Uat6avniSaX
	u6uuwo+qu1EcOQosWNLXLpn50VDI6Uqsfz4zaoFu5Y0n1NKVFrbmmlF3VrmPzF8QZ90Ej6
	jSJm59a9sDZZkJQM+4CssLaP0vZZNWY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id ED54EABD6;
	Thu, 19 Nov 2020 15:02:21 +0000 (UTC)
Subject: Re: [PATCH] xen/iommu: vtd: Fix undefined behavior pci_vtd_quirks()
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20201119145216.29280-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fe1a3c21-47a0-18bc-23ff-1f4730e84d69@suse.com>
Date: Thu, 19 Nov 2020 16:02:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201119145216.29280-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.11.2020 15:52, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> When booting Xen with CONFIG_USBAN=y on Sandy Bridge, UBSAN will throw
> the following splat:
> 
> (XEN) ================================================================================
> (XEN) UBSAN: Undefined behaviour in quirks.c:449:63
> (XEN) left shift of 1 by 31 places cannot be represented in type 'int'
> (XEN) ----[ Xen-4.11.4  x86_64  debug=y   Not tainted ]----
> 
> [...]
> 
> (XEN) Xen call trace:
> (XEN)    [<ffff82d0802c0ccc>] ubsan.c#ubsan_epilogue+0xa/0xad
> (XEN)    [<ffff82d0802c16c9>] __ubsan_handle_shift_out_of_bounds+0xb4/0x145
> (XEN)    [<ffff82d0802eeecd>] pci_vtd_quirk+0x3d3/0x74f
> (XEN)    [<ffff82d0802e508b>] iommu.c#domain_context_mapping+0x45b/0x46f
> (XEN)    [<ffff82d08053f39e>] iommu.c#setup_hwdom_device+0x22/0x3a
> (XEN)    [<ffff82d08053dfbc>] pci.c#setup_one_hwdom_device+0x8c/0x124
> (XEN)    [<ffff82d08053e302>] pci.c#_setup_hwdom_pci_devices+0xbb/0x2f7
> (XEN)    [<ffff82d0802da5b7>] pci.c#pci_segments_iterate+0x4c/0x8c
> (XEN)    [<ffff82d08053e8bd>] setup_hwdom_pci_devices+0x25/0x2c
> (XEN)    [<ffff82d08053e916>] iommu.c#intel_iommu_hwdom_init+0x52/0x2f3
> (XEN)    [<ffff82d08053d6da>] iommu_hwdom_init+0x4e/0xa4
> (XEN)    [<ffff82d080577f32>] dom0_construct_pv+0x23c8/0x2476
> (XEN)    [<ffff82d08057cb50>] construct_dom0+0x6c/0xa3
> (XEN)    [<ffff82d080564822>] __start_xen+0x4651/0x4b55
> (XEN)    [<ffff82d0802000f3>] __high_start+0x53/0x55
> 
> Note that splat is from 4.11.4 and not staging. Although, the problem is
> still present.
> 
> This can be solved by making the first operand unsigned int.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/drivers/passthrough/vtd/quirks.c
> +++ b/xen/drivers/passthrough/vtd/quirks.c
> @@ -435,7 +435,7 @@ void pci_vtd_quirk(const struct pci_dev *pdev)
>      case 0x3728: /* Xeon C5500/C3500 (JasperForest) */
>      case 0x3c28: /* Sandybridge */
>          val = pci_conf_read32(pdev->sbdf, 0x1AC);
> -        pci_conf_write32(pdev->sbdf, 0x1AC, val | (1 << 31));
> +        pci_conf_write32(pdev->sbdf, 0x1AC, val | (1U << 31));

I can see a couple of similar uses in arm/ipmmu-vmsa.c and
arm/smmu.c. These are all #define-s though, so would be an issue
only if these #define-s actually get used anywhere.

Jan

