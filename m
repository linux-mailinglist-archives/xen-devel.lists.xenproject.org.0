Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E44F47C8C2A
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 19:17:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616770.959013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrLlc-0004Lb-4v; Fri, 13 Oct 2023 17:16:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616770.959013; Fri, 13 Oct 2023 17:16:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrLlc-0004JT-27; Fri, 13 Oct 2023 17:16:04 +0000
Received: by outflank-mailman (input) for mailman id 616770;
 Fri, 13 Oct 2023 17:16:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qrLla-0004JN-IX
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 17:16:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrLla-0007aQ-9d; Fri, 13 Oct 2023 17:16:02 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrLla-0006Us-3j; Fri, 13 Oct 2023 17:16:02 +0000
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
	bh=eZg3bM1qV5BLRih7ZtZMbaLokgoq4cJiSXGM6vJeY5g=; b=px0lvh/XPzh1UKZx7LQ6qjq4FY
	dqDQhdKqWRtvTn+AZpEHXanfeKsSCLQW2C784+3IZRivvjFK/COzy+uIq9J439BhDk3ecE4DaeelW
	BboCKx0EKSqvxtPCTfJoTM5gzbmcKmcXIk5vxyJ+VwUvjmv+eacxG4tmsLwaPrVYdSfc=;
Message-ID: <48223382-531f-4638-870c-fdcc58bb0e97@xen.org>
Date: Fri, 13 Oct 2023 18:16:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/8] xen/arm: Split MMU system SMP MM bringup code to
 mmu/smpboot.c
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Penny Zheng <penny.zheng@arm.com>
References: <20231009010313.3668423-1-Henry.Wang@arm.com>
 <20231009010313.3668423-3-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231009010313.3668423-3-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 09/10/2023 02:03, Henry Wang wrote:
> +#ifdef CONFIG_ARM_64
> +int init_secondary_pagetables(int cpu)
> +{
> +    clear_boot_pagetables();
> +
> +    /*
> +     * Set init_ttbr for this CPU coming up. All CPus share a single setof
> +     * pagetables, but rewrite it each time for consistency with 32 bit.
> +     */
> +    init_ttbr = virt_to_maddr((uintptr_t) xen_pgtable);

The cast should be necessary. With this dropped:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

