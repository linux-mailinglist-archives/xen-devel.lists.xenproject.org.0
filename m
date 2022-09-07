Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB665B08AB
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 17:37:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401979.643962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVx6z-0006Y3-86; Wed, 07 Sep 2022 15:37:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401979.643962; Wed, 07 Sep 2022 15:37:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVx6z-0006VD-5U; Wed, 07 Sep 2022 15:37:09 +0000
Received: by outflank-mailman (input) for mailman id 401979;
 Wed, 07 Sep 2022 15:37:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVx6x-0006V7-Oa
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 15:37:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVx6x-0000Qa-1m; Wed, 07 Sep 2022 15:37:07 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVx6w-00016a-N9; Wed, 07 Sep 2022 15:37:06 +0000
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
	bh=vT/JAnTVTovb4nyCPBr2/JItdrtQKlyTOQeHpuWB90Y=; b=VtyCb0n6P+hxLkDaaVWuJ0OgSr
	TXV5hvplCzQO45gOfk6AgTLM5JTt9t/MqkhI9J6exIdP5w0FthjdFEKex9f4qsXVQKO65/+G2gTvQ
	X6XSTMgh0o3W3UUcjoKQ2aFuGplRdo86o481ohVnPvcs06b2FBDvDxn/h2merQ5OXDow=;
Message-ID: <a5ecba11-39e8-d4f2-a50c-c4200dae52cc@xen.org>
Date: Wed, 7 Sep 2022 16:37:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v4 2/4] docs, xen/arm: Introduce static heap memory
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Penny Zheng <penny.zheng@arm.com>
References: <20220907143532.15397-1-Henry.Wang@arm.com>
 <20220907143532.15397-3-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220907143532.15397-3-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 07/09/2022 15:35, Henry Wang wrote:
> +Static Heap Memory
> +==================
> +
> +The static heap memory refers to parts of RAM reserved in the beginning of
> +boot time for heap. The memory is reserved by configuration in the device
> +tree using physical address ranges.
> +
> +The static heap memory declared in the device tree defines the memory areas
> +that will be reserved to be used exclusively as heap.
> +
> +- For Arm32, since there are separated heaps, the static heap will be used
> +for both domheap and xenheap. The admin should make sure that the static
> +heap region should contain enough memory below 4GB to cater 32-bit DMA.
> +
> +- For Arm64, since there is a single heap, the defined static heap areas
> +shall always go to the heap allocator.
> +
> +The static heap memory is an optional feature and can be enabled by adding
> +below device tree properties in the `chosen` node.
> +
> +The dtb should have the following properties:
> +
> +- xen,static-heap
> +
> +    Property under the top-level "chosen" node. It specifies the address
> +    and size of Xen static heap memory. Note that at least a 64KB
> +    alignment is required.
> +
> +- #xen,static-heap-address-cells and #xen,static-heap-size-cells
> +
> +    Specify the number of cells used for the address and size of the
> +    "xen,static-heap" property under "chosen".

Logging here just because it is easier to keep track of open questions 
:). For the future, I would suggest to list them after --- so they don't 
get lost.

We need to agree on the naming scheme before this gets committed.

> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 5815ccf8c5..31610ccd65 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -22,11 +22,31 @@ typedef enum {
>       BOOTMOD_UNKNOWN
>   }  bootmodule_kind;
>   
> +enum membank_type {
> +    /*
> +     * The MEMBANK_DEFAULT type refers to either reserved memory for the
> +     * device/firmware (when the bank is in 'reserved_mem') or any RAM (when
> +     * the bank is in 'mem'.

Typo: Missing ')'

This can be updated on commit if we decide to keep the current naming 
scheme.

Cheers,

-- 
Julien Grall

