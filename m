Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 559632908D1
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 17:47:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8163.21718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTRww-0003Tc-V0; Fri, 16 Oct 2020 15:47:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8163.21718; Fri, 16 Oct 2020 15:47:22 +0000
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
	id 1kTRww-0003TD-RI; Fri, 16 Oct 2020 15:47:22 +0000
Received: by outflank-mailman (input) for mailman id 8163;
 Fri, 16 Oct 2020 15:47:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VWaZ=DX=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kTRwv-0003T8-T6
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 15:47:21 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1d561c8-5aed-4b3d-80a2-55b623e00d55;
 Fri, 16 Oct 2020 15:47:20 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kTRwn-0008Bd-MT; Fri, 16 Oct 2020 15:47:13 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kTRwn-00052Q-Dc; Fri, 16 Oct 2020 15:47:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VWaZ=DX=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kTRwv-0003T8-T6
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 15:47:21 +0000
X-Inumbo-ID: b1d561c8-5aed-4b3d-80a2-55b623e00d55
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b1d561c8-5aed-4b3d-80a2-55b623e00d55;
	Fri, 16 Oct 2020 15:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=JonRfA+TgFx9lcPWATiPevoJJ4wS52nuolyRWYVusfE=; b=lK/egPom8Pf4nczzjrD+P9gbzn
	d4xtlVNO74AjsNA2iWDuBCzDfm/s+zy1UWuJp1LgurkIWvuGpinrT87EGx+8ZDn7reJVEmE3YrwSD
	K9qc0dlUanqW/57mn2dSLAkJgkzBt5Z/Wq49kQYKuXrm7Zac8PVZsgwaJuo951qt+vmY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kTRwn-0008Bd-MT; Fri, 16 Oct 2020 15:47:13 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kTRwn-00052Q-Dc; Fri, 16 Oct 2020 15:47:13 +0000
Subject: Re: [PATCH 2/5] iommu / domctl: introduce XEN_DOMCTL_iommu_ctl
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20201005094905.2929-1-paul@xen.org>
 <20201005094905.2929-3-paul@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <97648df3-dcce-cd19-9074-6ca63d94b518@xen.org>
Date: Fri, 16 Oct 2020 16:47:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201005094905.2929-3-paul@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Paul,

On 05/10/2020 10:49, Paul Durrant wrote:
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 791f0a2592..75e855625a 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -1130,6 +1130,18 @@ struct xen_domctl_vuart_op {
>                                    */
>   };
>   
> +/*
> + * XEN_DOMCTL_iommu_ctl
> + *
> + * Control of VM IOMMU settings
> + */
> +
> +#define XEN_DOMCTL_IOMMU_INVALID 0

I can't find any user of XEN_DOMCTL_IOMMU_INVALID. What's the purpose 
for it?

[...]

> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> index b21c3783d3..1a96d3502c 100644
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -106,17 +106,19 @@ struct xsm_operations {
>       int (*irq_permission) (struct domain *d, int pirq, uint8_t allow);
>       int (*iomem_permission) (struct domain *d, uint64_t s, uint64_t e, uint8_t allow);
>       int (*iomem_mapping) (struct domain *d, uint64_t s, uint64_t e, uint8_t allow);
> -    int (*pci_config_permission) (struct domain *d, uint32_t machine_bdf, uint16_t start, uint16_t end, uint8_t access);
> +    int (*pci_config_permission) (struct domain *d, uint32_t machine_bdf, uint16_t start, uint16_t end, uint8_t access);

I can't figure out what changed here. Is it an intended change?

>   
> -#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
> +#if defined(CONFIG_HAS_PASSTHROUGH)
> +    int (*iommu_ctl) (struct domain *d, unsigned int op);
> +#if defined(CONFIG_HAS_PCI)
>       int (*get_device_group) (uint32_t machine_bdf);
>       int (*assign_device) (struct domain *d, uint32_t machine_bdf);
>       int (*deassign_device) (struct domain *d, uint32_t machine_bdf);
>   #endif
> -
> -#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
> +#if defined(CONFIG_HAS_DEVICE_TREE)
>       int (*assign_dtdevice) (struct domain *d, const char *dtpath);
>       int (*deassign_dtdevice) (struct domain *d, const char *dtpath);
> +#endif
>   #endif

Cheers,

-- 
Julien Grall

