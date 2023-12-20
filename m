Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C255F819FC3
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 14:24:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657792.1026885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFwY9-0006iL-RZ; Wed, 20 Dec 2023 13:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657792.1026885; Wed, 20 Dec 2023 13:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFwY9-0006f3-OX; Wed, 20 Dec 2023 13:23:49 +0000
Received: by outflank-mailman (input) for mailman id 657792;
 Wed, 20 Dec 2023 13:23:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rFwY7-0006ex-J1
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 13:23:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFwY6-0005YK-Uv; Wed, 20 Dec 2023 13:23:46 +0000
Received: from [15.248.2.151] (helo=[10.6.7.47])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFwY6-0007Dp-OB; Wed, 20 Dec 2023 13:23:46 +0000
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
	bh=OJt4JJ49m9COGmKExgaop8U379fb+mfRbIigx9BXQIU=; b=poTAbAQiKxW5sxwFC/0yfEsN0X
	s2M7knIlqAUwNxo5YyLvhglXg9Xhg2T3P9ehoYeYoWTDup6zArTWknZvxggOcuTRCTKx6NtISkyd6
	anzOtthZy/euWEekSR0rmFbrLxpoC3kiYMjtkpj6jQnI6hDTJFlpsSVsA0mjJoAJI+tE=;
Message-ID: <4d5ebc23-f7f8-411f-8458-762a09bdf702@xen.org>
Date: Wed, 20 Dec 2023 13:23:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] xen/ppc: Enable bootfdt and boot allocator
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Jan Beulich <jbeulich@suse.com>
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
 <aa67a0dacab0e3f39dabeb30e31732d617cadde1.1702607884.git.sanastasio@raptorengineering.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <aa67a0dacab0e3f39dabeb30e31732d617cadde1.1702607884.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/12/2023 02:44, Shawn Anastasio wrote:
> Move PPC off the asm-generic setup.h and enable usage of bootfdt for
> populating the boot info struct from the firmware-provided device tree.
> Also enable the Xen boot page allocator.
> 
> Includes minor changes to bootfdt.c's boot_fdt_info() to tolerate the
> scenario in which the FDT overlaps a reserved memory region, as is the
> case on PPC when booted directly from skiboot. Also includes a minor
> change to record Xen's correct position on PPC where Xen relocates
> itself to at the entrypoint.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
>   xen/arch/ppc/include/asm/Makefile |   1 -
>   xen/arch/ppc/include/asm/setup.h  | 123 +++++++++++++
>   xen/arch/ppc/setup.c              | 289 +++++++++++++++++++++++++++++-

I might be missing something. But isn't most of the code you add is the 
same as Arm? And if so, shouldn't this be consolidated?

I would also expect RISC-V to need the same.

Cheers,

-- 
Julien Grall

