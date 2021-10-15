Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 684B942FA3A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 19:25:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210998.368054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbQxT-0004pV-Co; Fri, 15 Oct 2021 17:25:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210998.368054; Fri, 15 Oct 2021 17:25:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbQxT-0004nK-9c; Fri, 15 Oct 2021 17:25:27 +0000
Received: by outflank-mailman (input) for mailman id 210998;
 Fri, 15 Oct 2021 17:25:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mbQxR-0004nE-Py
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 17:25:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mbQxQ-0001Yi-GW; Fri, 15 Oct 2021 17:25:24 +0000
Received: from [54.239.6.185] (helo=[192.168.0.140])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mbQxQ-0005QR-9l; Fri, 15 Oct 2021 17:25:24 +0000
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
	bh=7sSLGKOU3aysiKP+Wl2yfjUUJ+GBcj+e9bj2WiEMcBU=; b=BvoxRQakAuLmWNXGr2NZrvAWjx
	D8XVq101RuVw4Jqd/QqCoIoNvqCy8rRHCjireFw8USoalj67wtgri1P8Z0vm8YiVT5czcpOSznsBn
	kU5HstDVgDqSGnejdMP+JUB95RC1je5+zvJJ8zA0YeW00HS7KkmAARKX+Q6xWhyhcN98=;
Message-ID: <cef8d2a6-91c1-2d4d-2078-98d0a92b067a@xen.org>
Date: Fri, 15 Oct 2021 18:25:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org, sstabellini@kernel.org,
 Rahul Singh <rahul.singh@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1634315461.git.bertrand.marquis@arm.com>
 <e2b10f56043155e4bb8eae824723045ccc042f8e.1634315461.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e2b10f56043155e4bb8eae824723045ccc042f8e.1634315461.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 15/10/2021 17:51, Bertrand Marquis wrote:
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 3aa8c3175f..35e0190796 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -756,6 +756,19 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>       if ( !pdev->domain )
>       {
>           pdev->domain = hardware_domain;
> +#ifdef CONFIG_ARM
> +        /*
> +         * On ARM PCI devices discovery will be done by Dom0. Add vpci handler
> +         * when Dom0 inform XEN to add the PCI devices in XEN.
> +         */
> +        ret = vpci_add_handlers(pdev);

I don't seem to find the code to remove __init_hwdom in this series. Are 
you intending to fix it separately?

With that addressed:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,


-- 
Julien Grall

