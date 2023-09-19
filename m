Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2051F7A6473
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 15:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604689.942204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiaUN-0002uU-CY; Tue, 19 Sep 2023 13:10:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604689.942204; Tue, 19 Sep 2023 13:10:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiaUN-0002sZ-9r; Tue, 19 Sep 2023 13:10:03 +0000
Received: by outflank-mailman (input) for mailman id 604689;
 Tue, 19 Sep 2023 13:10:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qiaUM-0002iy-D5
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 13:10:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qiaUL-0003Jr-SW; Tue, 19 Sep 2023 13:10:01 +0000
Received: from [15.248.3.4] (helo=[10.24.67.44])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qiaUL-0004Xp-L2; Tue, 19 Sep 2023 13:10:01 +0000
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
	bh=sHFh1wywUBC4n4ly7yBKcD0Tw34AizwbGApx7yGRwYY=; b=UWSs+LI5Rgkigf27lKUQFCaI35
	3sym3RtZKR+CGQkN5oXhmNLNgJCPN9ojFiQDLSsSOdy271Si860S6nEwoOI2zON+adjLIBq89Ttwi
	x5nvtLc/t9EifyTKOB/RQxIJqse4jrApuVRTor2yo3LO5Mh2BZuDrtWN97LsrmFuzEFo=;
Message-ID: <0cd6a4db-3678-446e-afd8-c99b47945a6a@xen.org>
Date: Tue, 19 Sep 2023 14:10:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] ARM: GICv3 ITS: flush all buffers, not just
 command queue
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20230919112827.1001484-1-volodymyr_babchuk@epam.com>
 <20230919112827.1001484-4-volodymyr_babchuk@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230919112827.1001484-4-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Volodymyr,

On 19/09/2023 12:28, Volodymyr Babchuk wrote:
> ITS manages Device Tables and Interrupt Translation Tables on its own,
> so generally we are not interested which shareability and cacheability
> attributes it uses. But there is one exception: ITS requires that DT
> and ITT must be initialized with zeroes. If ITS belongs to the Inner
> Cacheability domain there is no problem at all.
> 
> But in all other cases we need to do clean CPU caches manually, or
> otherwise CPU can overwrite DT and ITT entries. From user perspective
> this looks like interrupts are not delivered from a device.
> 
> Also, we will rename HOST_ITS_FLUSH_CMD_QUEUE flag to
> HOST_ITS_FLUSH_BUFFERS because now this flag controls not only command
> queue.

Reading the specification, CBASER will indicate the cacheability for the 
command queue. But I couldn't find any reference saying this will apply 
to the ITT as well.

If such reference doesn't exist then...

> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>   xen/arch/arm/gic-v3-its.c             | 7 +++++--
>   xen/arch/arm/include/asm/gic_v3_its.h | 2 +-
>   2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index 72cf318810..63e28a7706 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -107,7 +107,7 @@ static int its_send_command(struct host_its *hw_its, const void *its_cmd)
>       }
>   
>       memcpy(hw_its->cmd_buf + writep, its_cmd, ITS_CMD_SIZE);
> -    if ( hw_its->flags & HOST_ITS_FLUSH_CMD_QUEUE )
> +    if ( hw_its->flags & HOST_ITS_FLUSH_BUFFERS )
>           clean_dcache_va_range(hw_its->cmd_buf + writep, ITS_CMD_SIZE);
>       else
>           dsb(ishst);
> @@ -335,7 +335,7 @@ static void *its_map_cbaser(struct host_its *its)
>        */
>       if ( !(reg & GITS_BASER_INNER_CACHEABILITY_MASK) )
>       {
> -        its->flags |= HOST_ITS_FLUSH_CMD_QUEUE;
> +        its->flags |= HOST_ITS_FLUSH_BUFFERS;
>           printk(XENLOG_WARNING "using non-cacheable ITS command queue\n");
>       }
>   
> @@ -699,6 +699,9 @@ int gicv3_its_map_guest_device(struct domain *d,
>       if ( !itt_addr )
>           goto out_unlock;
>   
> +    if ( hw_its->flags & HOST_ITS_FLUSH_BUFFERS )
> +        clean_dcache_va_range(itt_addr, nr_events * hw_its->itte_size);

... I think we need to have this flush unconditional like Linux does.

Cheers,

-- 
Julien Grall

