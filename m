Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOC8LZRp1Wm96AcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 22:31:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6843C3B48AD
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 22:31:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275333.1561191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAD4U-0007GQ-Ol; Tue, 07 Apr 2026 20:30:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275333.1561191; Tue, 07 Apr 2026 20:30:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAD4U-0007EF-Le; Tue, 07 Apr 2026 20:30:50 +0000
Received: by outflank-mailman (input) for mailman id 1275333;
 Tue, 07 Apr 2026 20:30:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wAD4S-0007E9-Ka
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 20:30:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAD4R-00HMjN-Iw
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 22:30:47 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69d56976-2eae-0a2a0a5409dd-0a2a450aab18-10
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 22:30:47 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <sstabellini@kernel.org>)
 id 69d56976-ee98-0a2a450a0019-ac6904feb0d2-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 22:30:47 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C8F40600CB;
 Tue,  7 Apr 2026 20:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B976C116C6;
 Tue,  7 Apr 2026 20:30:44 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775593845;
	bh=r7GXZjFcIMrR2G+JamIxXiC7lLfl4g7nO9vEyV6/buI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=u3Sg3O3Z8dxKDuToqJ9r1RsHN1zFh+Og11zvGUIXSDgJD4ZHMcacYU8fX5SXG8mu4
	 xQq+FaAV/i+YxKI/YKt639wAT721BhSme6SxSPuYL2ce5EyajD2ZYFCA5uBCp11uZo
	 wA/B4HoSgN0u007gMEtD3oFeGsTz3b8iV2W9XHXtKK8NP0nHpKmOz8aEHBmYDXJTGe
	 ed49S7eYtQhkQgndNtqo+mVzBfjaD8IgGblYOAkpOtgnlwgj6BPE+7YEL5MrDbmOOh
	 mgphJD93r3C099IWpPVQSdQ0PTKpeXGxBUmjMx7chlfOg37t2tZXjT8D+WoaS83fGn
	 D0IaV2CBIArSQ==
Date: Tue, 7 Apr 2026 13:30:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>, 
    Rahul Singh <rahul.singh@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/2] iommu/arm: smmu: Fix variable shadowing
In-Reply-To: <20260407103434.90838-2-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2604071330270.2873990@ubuntu-linux-20-04-desktop>
References: <20260407103434.90838-1-michal.orzel@amd.com> <20260407103434.90838-2-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-4011c0/1775593847-BC3610B1-D6A22261/0/0
X-purgate-type: clean
X-purgate-size: 2259
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6843C3B48AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 7 Apr 2026, Michal Orzel wrote:
> Rename 'pdev' to 'pci_dev' in the dev_print_pci() macro to avoid
> shadowing local 'pdev' variables at call sites.
> 
> Remove the unused 'ret' declaration from arm_smmu_dt_add_device_generic()
> where the function-scope 'ret' is sufficient.
> 
> Fix shadowing of 'domain' in arm_smmu_assign_dev() by removing the
> inner-scope redeclaration, using the function-scope variable instead.
> 
> This fixes MISRA C R5.3.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/drivers/passthrough/arm/smmu.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 22d306d0cb80..d63c9015510e 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -130,8 +130,8 @@ typedef enum irqreturn irqreturn_t;
>          printk(lvl "smmu: %s: " fmt, dev_name((dev)), ## __VA_ARGS__);  \
>      else                                                                \
>      {                                                                   \
> -        struct pci_dev *pdev = dev_to_pci((dev));                       \
> -        printk(lvl "smmu: %pp: " fmt, &pdev->sbdf, ## __VA_ARGS__);     \
> +        struct pci_dev *pci_dev = dev_to_pci((dev));                    \
> +        printk(lvl "smmu: %pp: " fmt, &pci_dev->sbdf, ## __VA_ARGS__);  \
>      }                                                                   \
>  })
>  #endif
> @@ -927,7 +927,6 @@ static int arm_smmu_dt_add_device_generic(u8 devfn, struct device *dev)
>  	if ( dev_is_pci(dev) )
>  	{
>  		struct pci_dev *pdev = dev_to_pci(dev);
> -		int ret;
>  
>  		/* Ignore calls for phantom functions */
>  		if ( devfn != pdev->devfn )
> @@ -2788,7 +2787,7 @@ static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
>  		/* dom_io is used as a sentinel for quarantined devices */
>  		if ( d == dom_io )
>  		{
> -			struct iommu_domain *domain = dev_iommu_domain(dev);
> +			domain = dev_iommu_domain(dev);
>  			if ( !iommu_quarantine )
>  				return 0;
>  
> -- 
> 2.43.0
> 

