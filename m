Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B32899567B0
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 11:56:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779520.1189233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfz7B-0004sb-9Z; Mon, 19 Aug 2024 09:55:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779520.1189233; Mon, 19 Aug 2024 09:55:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfz7B-0004qR-6D; Mon, 19 Aug 2024 09:55:53 +0000
Received: by outflank-mailman (input) for mailman id 779520;
 Mon, 19 Aug 2024 09:55:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sfz79-0004qL-LF
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 09:55:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sfz78-0000ix-PO; Mon, 19 Aug 2024 09:55:50 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sfz78-0005IB-IK; Mon, 19 Aug 2024 09:55:50 +0000
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
	bh=4TZOcAlEVvtZv36VJJaMzltq4oCXE3YQbOCGzPnK9Bg=; b=4gTb4z/s4LRQiP2c5KbeUAVFCX
	H3L9FTaKAVEk71Vycvq3qn5jIINhQQFlYAsZ6A66yLjSlL8JEZ12KMa8ZRZISh+HfGcQBpkiK99dW
	fWhzuXSJ9DLfdKDP3XJg2+oOVf7RGXyzxkEgRQeyq7trvknqg1JPCo6Tzsco1dolAC0Q=;
Message-ID: <febbaf82-5d9a-4bcd-8be9-93ac86b2c1bb@xen.org>
Date: Mon, 19 Aug 2024 10:55:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] xen: make VMAP only support in MMU system
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, Penny Zheng <penny.zheng@arm.com>,
 Wei Chen <wei.chen@arm.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com
References: <20240813171356.46760-1-ayan.kumar.halder@amd.com>
 <20240813171356.46760-3-ayan.kumar.halder@amd.com>
 <6d333d94-80ad-485c-b024-a45a388b96a4@suse.com>
 <ef789757-8c03-4f97-9bfb-8ec2fd2f4ca2@amd.com>
 <dad27ab7-3cbd-4a8e-8200-adea52b26e55@suse.com>
 <597b358e-3b45-4fba-922d-31208b55d15a@amd.com>
 <9fd1801c-1460-44e5-b066-f6da1167543b@xen.org>
 <1a328f00-3b0d-4e9c-856c-97c3a80dfdef@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1a328f00-3b0d-4e9c-856c-97c3a80dfdef@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 19/08/2024 10:45, Ayan Kumar Halder wrote:
> I am ok with this. This has the benefit that the change can be contained 
> within arch/arm if we do the following :-
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index cb2c0a16b8..26f7406278 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -329,7 +329,9 @@ void asmlinkage __init start_xen(unsigned long 
> boot_phys_offset,
> 
>       setup_mm();
> 
> +#ifdef CONFIG_MMU
>       vm_init();
> +#endif
> 
>       /* Parse the ACPI tables for possible boot-time configuration */
>       acpi_boot_table_init();
> 
> Are we ok with this ?
> 
> The definition of vm_init() is in xen/include/xen/vmap.h. If I enclose 
> it using any CONFIG_XXX (like I have done in the current patch), then I 
> need to introduce it in common/Kconfig and define it for x86 and PPC. I 
> would prefer to contain the change within arch/arm only if possible.

Just to clarify, are you suggesting to just protect the call vm_init(). 
In other word, common/vmap.c would still be included in the final binary 
for the MPU?

If yes, then I think it would be a bit odd... Someone could still call 
vmap() and this would not break until runtime.

So I don't see how we could get away from modifying the common code.

Cheers,

-- 
Julien Grall


