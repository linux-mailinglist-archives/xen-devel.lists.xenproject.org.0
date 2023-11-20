Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 521E57F1D26
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 20:11:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637158.992923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r59eh-00028o-Td; Mon, 20 Nov 2023 19:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637158.992923; Mon, 20 Nov 2023 19:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r59eh-00025X-Pb; Mon, 20 Nov 2023 19:09:59 +0000
Received: by outflank-mailman (input) for mailman id 637158;
 Mon, 20 Nov 2023 19:09:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r59eg-00025R-LX
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 19:09:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r59eg-0005fE-8X; Mon, 20 Nov 2023 19:09:58 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.18.184]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r59eg-00012S-0s; Mon, 20 Nov 2023 19:09:58 +0000
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
	bh=ImuFywwIa5lZ56Omb8eAXNN1m6GhuoHO9B8/FHp+SxA=; b=mG0l/RofcS04ss1nYzZk+JyBt1
	mwzn3sVtahv0JR+1SNCx0KHGrIB8LimCZxatp5Q6Pm6o8FjA235CxJuytjV72dCuma6Mu2wA4x71x
	X1baMkW8jSx4midiwUbdQYHVR5ilYyCztBiaz/As1GxyCXUdYqrq+WZaptIpDRlpdet8=;
Message-ID: <f27fc7bb-c61a-45e1-acbe-780c13ed66d4@xen.org>
Date: Mon, 20 Nov 2023 19:09:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/8] xen/arm: Split MMU code as the prepration of MPU
 work
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Penny Zheng <penny.zheng@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231116145032.1651305-1-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231116145032.1651305-1-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 16/11/2023 14:50, Henry Wang wrote:
> Based on the discussion in the Xen Summit [1], sending this series out after
> addressing the comments in v8 [2] as the preparation work to add MPU support.
> 
> Mostly code movement and function folding, with some of Kconfig and build
> system (mainly Makefiles) adjustment.
> 
> This series is based on:
> 6cd046c501 xen/arm: Enlarge identity map space to 10TB
> 
> [1] https://lore.kernel.org/xen-devel/AS8PR08MB799122F8B0CB841DED64F4819226A@AS8PR08MB7991.eurprd08.prod.outlook.com/
> [2] https://lore.kernel.org/xen-devel/20231023021345.1731436-1-Henry.Wang@arm.com/
> 
> Henry Wang (6):
>    xen/arm: Split page table related code to mmu/pt.c
>    xen/arm: Split MMU system SMP MM bringup code to mmu/smpboot.c
>    xen/arm: Fold mmu_init_secondary_cpu() to head.S
>    xen/arm: Extract MMU-specific MM code
>    xen/arm: Split MMU-specific setup_mm() and related code out
>    xen/arm: Fold pmap and fixmap into MMU system
> 
> Penny Zheng (2):
>    xen/arm: Rename init_secondary_pagetables() to prepare_secondary_mm()
>    xen/arm: mmu: move MMU specific P2M code to mmu/p2m.{c,h}

I have committed the series. Thanks for the series. Looking forward to 
review the rest of the MPU support!

Cheers,

-- 
Julien Grall

