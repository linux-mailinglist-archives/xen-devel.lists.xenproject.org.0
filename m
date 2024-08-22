Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 871CD95B303
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 12:36:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781714.1191200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh5Am-0005by-1R; Thu, 22 Aug 2024 10:36:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781714.1191200; Thu, 22 Aug 2024 10:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh5Al-0005a5-Uv; Thu, 22 Aug 2024 10:36:07 +0000
Received: by outflank-mailman (input) for mailman id 781714;
 Thu, 22 Aug 2024 10:36:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sh5Al-0005Zz-5y
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 10:36:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sh5Ak-0002G8-Qx; Thu, 22 Aug 2024 10:36:06 +0000
Received: from [15.248.2.26] (helo=[10.24.67.18])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sh5Ak-0003jX-JV; Thu, 22 Aug 2024 10:36:06 +0000
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
	bh=Ijoeu8VSnkTWhaxtMnYk4cCGxxQdiMO8XjhTec5NBkM=; b=CD6F1rtfH06RFLRi4Kvx9fFtdk
	N9v+VjTBwbV3fhurrEjJUQSTxKTL2sPOD8jiVHROKHmrC7ohMSxJ/5woi50dgEkK7XphiaS5b8jxn
	E9pusWsorm8i+NlZ9xlwPKw2EP6ITCn1MaYEHXpfGvi82AdWQ4gijtvOezHKV/u2XddU=;
Message-ID: <d33e1ef7-3d8e-41d0-a0f1-9bcbb4ce7848@xen.org>
Date: Thu, 22 Aug 2024 11:36:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] xen/arm: drop {boot_}phys_offset
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240814094303.23611-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240814094303.23611-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 14/08/2024 10:43, Michal Orzel wrote:
> This has been on a TODO list for quite some time now. There is no real need
> for these variables since we can ask the MMU to do the virt->maddr translation.
> 
> Michal Orzel (2):
>    xen/arm: Drop {boot_}phys_offset usage
>    xen/arm: head: Do not pass physical offset to start_xen

I have committed the series.

Cheers,

> 
>   xen/arch/arm/arm32/head.S     | 12 +++++-------
>   xen/arch/arm/arm64/head.S     | 12 +++++-------
>   xen/arch/arm/include/asm/mm.h |  2 +-
>   xen/arch/arm/mmu/setup.c      | 16 ++++++----------
>   xen/arch/arm/setup.c          |  5 ++---
>   5 files changed, 19 insertions(+), 28 deletions(-)
 >

-- 
Julien Grall


