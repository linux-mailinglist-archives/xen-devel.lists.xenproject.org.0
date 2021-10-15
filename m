Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C3F42F6AE
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 17:10:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210800.367799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbOqf-00043f-5w; Fri, 15 Oct 2021 15:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210800.367799; Fri, 15 Oct 2021 15:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbOqf-00040z-1h; Fri, 15 Oct 2021 15:10:17 +0000
Received: by outflank-mailman (input) for mailman id 210800;
 Fri, 15 Oct 2021 15:10:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mbOqd-00040t-UD
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 15:10:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mbOqc-00074t-Ve; Fri, 15 Oct 2021 15:10:14 +0000
Received: from [54.239.6.185] (helo=[192.168.0.140])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mbOqc-0006ar-Og; Fri, 15 Oct 2021 15:10:14 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=vh0ZxInDhydo1ovtUd1g3R0ouVC3IIv2Sn6et1433EU=; b=iyj+LT2ryjjXq0RiDOHUEn8tyj
	VtDwTns+NzKCuKBwKf16Ygt1axFgYYFUEFoPSL6/2IwAW6lVWNZzKxYC/N+xqTTQjcGad3yvH3qSz
	KjvjG/+3cgPNT57HH2i5zpOPFEbEL2KLyrncEF7foKYBzU7JDkhZmSWyd9BQKFqZ/JdM=;
Message-ID: <ec52b9e9-5908-7fd0-dfbf-31906eb8398d@xen.org>
Date: Fri, 15 Oct 2021 16:10:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v7 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org, Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1634305870.git.bertrand.marquis@arm.com>
 <847d430fdeb19e695176ddea71eeb11dcef8b23e.1634305870.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <847d430fdeb19e695176ddea71eeb11dcef8b23e.1634305870.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 15/10/2021 14:59, Bertrand Marquis wrote:
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 3aa8c3175f..082892c8a2 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -766,7 +766,21 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>           list_add(&pdev->domain_list, &hardware_domain->pdev_list);
>       }
>       else
> +    {
> +#ifdef CONFIG_ARM
> +        /*
> +         * On ARM PCI devices discovery will be done by Dom0. Add vpci handler
> +         * when Dom0 inform XEN to add the PCI devices in XEN.
> +         */
> +        ret = vpci_add_handlers(pdev);

Sorry for only noticing it now. Looking at the last staging
  vpci_add_handlers() is annotated with __hwdom_init. On Arm, 
__hwdom_init means the function will disappear after boot.

However, pci_add_device() can be called from a physdev op. So I think we 
would need to drop __hwdom_init. I can't seem to find this change in 
this series. Did I miss anything?

The rest of the changes LGTM.

Cheers,

-- 
Julien Grall

