Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 952D24C2F7F
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 16:23:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278404.475634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNFxl-0001Uz-BP; Thu, 24 Feb 2022 15:23:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278404.475634; Thu, 24 Feb 2022 15:23:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNFxl-0001Ss-8P; Thu, 24 Feb 2022 15:23:25 +0000
Received: by outflank-mailman (input) for mailman id 278404;
 Thu, 24 Feb 2022 15:23:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nNFxj-0001Sm-3a
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 15:23:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNFxi-0008OS-M2; Thu, 24 Feb 2022 15:23:22 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226] helo=[10.7.236.14])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNFxi-00027K-GD; Thu, 24 Feb 2022 15:23:22 +0000
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
	bh=9jzA2z5Ie9oHaG65OsiHnsV+whzyVQIl4hjomkN7oUQ=; b=cmhqsRBkfDSA/AZvLOmsaeKQd4
	eOkKUewbn0lXqCrXvho4tDF3gQDkrY+sHnFUK2oxET/f8g656a7r0uwIWLFuAkaFw9GHrKdVlWBlz
	5Ssokr/K79BqPxbW2yFszW1MLUdlr1wElwXYlNwxSLEqaCE5r2suRChkndYuKzF92K3M=;
Message-ID: <0f8a2619-0d0c-989d-fd2c-8e45d33c2172@xen.org>
Date: Thu, 24 Feb 2022 15:23:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 0/2] Rename psr_mode_is_{32bit/user} to
 regs_mode_is_{32bit/user}
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220222105613.20668-1-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220222105613.20668-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 22/02/2022 10:56, Michal Orzel wrote:
> The request to rename psr_mode_is_32bit to regs_mode_is_32bit was make during
> a discussion [1]. Because psr_mode_is_user shares the same prototype, we should
> rename it as well to keep the naming consistent.
> 
> [1] https://marc.info/?l=xen-devel&m=156457538423787&w=2
> 
> Michal Orzel (2):
>    xen/arm: Rename psr_mode_is_32bit to regs_mode_is_32bit
>    xen/arm: Rename psr_mode_is_user to regs_mode_is_user

I have committed the two patches.

Thanks for the contribution!

Cheers,

> 
>   xen/arch/arm/arm64/vsysreg.c    |  4 ++--
>   xen/arch/arm/include/asm/regs.h |  6 ++---
>   xen/arch/arm/traps.c            | 42 ++++++++++++++++-----------------
>   xen/arch/arm/vcpreg.c           |  4 ++--
>   xen/arch/arm/vtimer.c           |  2 +-
>   5 files changed, 29 insertions(+), 29 deletions(-)
> 

-- 
Julien Grall

