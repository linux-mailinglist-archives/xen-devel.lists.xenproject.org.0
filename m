Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8027649BA7
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 11:05:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459317.717063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fgj-0001yM-1n; Mon, 12 Dec 2022 10:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459317.717063; Mon, 12 Dec 2022 10:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fgi-0001wV-UH; Mon, 12 Dec 2022 10:05:32 +0000
Received: by outflank-mailman (input) for mailman id 459317;
 Mon, 12 Dec 2022 10:05:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p4fgi-0001wI-2i
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 10:05:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fgf-0001n7-Gi; Mon, 12 Dec 2022 10:05:29 +0000
Received: from [54.239.6.188] (helo=[192.168.19.227])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fgf-0002JD-9n; Mon, 12 Dec 2022 10:05:29 +0000
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
	bh=qXjcEE9AcQzXIIj0BJVRKHQtPPSytWn+m+YuHqpvSuw=; b=Ok0JMlUx2QAbB/ct6mENQxu8Wo
	m5laM0FXt1B6pFbY5uLixlL24zcs05nshC3EaHh0bFzcpstPZDKcW+sCtlsSGv6n1ccWSHQuJXgSJ
	vPY9oysKqYa9tynkoqmrkt9qVt2xkxxk04CHfA5Kk9ovL/CEfrTiWOvhuGYbtFH3TSCc=;
Message-ID: <e7766518-275c-1030-e8c0-51a5787a9985@xen.org>
Date: Mon, 12 Dec 2022 10:05:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [BUG]Add PCIE devie to SMMUv3 fail
Content-Language: en-US
To: sisyphean <sisyphean@zlw.email>, Rahul Singh <Rahul.Singh@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <793eb471-e68b-c3ff-52e8-20d77252c0bf@zlw.email>
 <A9FCD688-3CA2-484A-ADC1-F1235F18890F@arm.com>
 <75bbfc8c-b89f-9478-63af-c37fda0ad3c0@zlw.email>
From: Julien Grall <julien@xen.org>
In-Reply-To: <75bbfc8c-b89f-9478-63af-c37fda0ad3c0@zlw.email>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12/12/2022 05:49, sisyphean wrote:
> Hi,

Hi,

When submitting a bug report for Arm, can you please CC the Arm maintainers?

> 在 2022/12/9 17:50, Rahul Singh 写道:
> After setting XEN and kernel as above, I tried the following two methods 
> to add a PCIE device passthrough:
> 
> 1. According to your suggestion, use the command xl pci-assignable-add 
> 0002:21:00.0 to set in the Dom0. But in function
> iommu_do_pci_domctl,  after device_assigned is called, ENODEV error is 
> obtained.
> 
> 2. Add xen-pciback.hide=(0002:21:00.0) to dom0-bootargs in the device 
> tree, I encountered the same problem as before
> when initializing the kernel. In function pci_add_device, PCIE devices 
> cannot be added to SMMUv3.
> 
> The kernel version I use is 5.10. Does this have an impact?
> 
> In addition, an error was encountered after XEN enabling ITS:
> 
> In function gicv3_cpu_init, gicv3_its_setup_collection return 
> -ETIMEDOUT. This problem was solved after I made the
> following changes:
> 
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index 9558bad..a12c0d1 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -118,11 +118,11 @@ static int its_send_command(struct host_its 
> *hw_its, const void *its_cmd)
>       }
> 
>       memcpy(hw_its->cmd_buf + writep, its_cmd, ITS_CMD_SIZE);
> -    if ( hw_its->flags & HOST_ITS_FLUSH_CMD_QUEUE )
> +    // if ( hw_its->flags & HOST_ITS_FLUSH_CMD_QUEUE )

This is suggesting that the logic in its_map_cbaser() doesn't detect the 
command queue is uncacheable.

Looking at the code, Xen will write the register with the shareability 
it wants and then read back to confirm the ITS "accept it". If it didn't 
accept, then we will use uncacheable.

Can you print the value read from the ITS in its_map_cbaser()?

Cheers,

-- 
Julien Grall

