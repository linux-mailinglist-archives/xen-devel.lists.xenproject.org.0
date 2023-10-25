Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE587D684C
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 12:22:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622814.969986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvb1y-0005gJ-OA; Wed, 25 Oct 2023 10:22:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622814.969986; Wed, 25 Oct 2023 10:22:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvb1y-0005dO-LY; Wed, 25 Oct 2023 10:22:30 +0000
Received: by outflank-mailman (input) for mailman id 622814;
 Wed, 25 Oct 2023 10:22:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qvb1y-0005dI-2B
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 10:22:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvb1x-0005qm-Jl; Wed, 25 Oct 2023 10:22:29 +0000
Received: from [15.248.3.4] (helo=[10.24.67.28])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvb1x-0006g6-Aw; Wed, 25 Oct 2023 10:22:29 +0000
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
	bh=up6TETH/uoXk17LWcqq2alTrEYjLfRyWqmEkqEpxmWY=; b=Jz4FXdwVa/Vemp2ouqSNR6B05r
	WXpE3j2RSK7I1M2fCg1As5qEeTqbhCnmzV2EYTt1o+Ny7FwSiSfdTDUj8AcJ40mlrt0ytqunG2at2
	eUhw29NQEvDuokgrRsCH0p+QFXnP62/o/POy5I8fRA01izdxkzxqLtcNgBbAjwszlyzs=;
Message-ID: <163d3326-38f2-40b6-a654-60f0221daa6c@xen.org>
Date: Wed, 25 Oct 2023 11:22:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 4/4] arm/new vgic: Add ITS support to NEW_VGIC
Content-Language: en-GB
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1698225630.git.mykyta_poturai@epam.com>
 <b0b41f2065002e4cf7795ebfbf9f84624c2f150d.1698225630.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b0b41f2065002e4cf7795ebfbf9f84624c2f150d.1698225630.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykyta,

This patch is far too big to review. Can this be split in smaller 
logical change? The same goes for patch #3.

But some high level remarks.

On 25/10/2023 11:13, Mykyta Poturai wrote:
> Add GICv3 ITS support for NEW VGIC. The code is ported from the Kernel
> version 6.0. The code is adapted to Xen's coding style and hooked up
> with Xen's interfaces. The code is adapted to Xen coding style and
> conventions.
> For this version ITS is supported only for hardware domains.
> 
> Remove unsupported flag from config HAS_ITS and add NEW_VGIC dependency.
Even if the code is based on Linux, you are adding a branch new vGIC v3 
ITS implementation. So I don't think we should remove 'UNSUPPORTED' as 
it would imply it is production ready.

Also, AFAICT, the new version of 'depends on' means we will not be able 
to use GICv3 ITS with the current vGIC. Can you explain why?

> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>   xen/arch/arm/Kconfig                  |    4 +-
>   xen/arch/arm/gic-v3-its.c             |   28 +
>   xen/arch/arm/gic-v3-lpi.c             |   11 +

Looking at the change, you mainly add #ifdef in the code. The goal of 
gic-v3-lpi.c was to be agnostic from the different vGIC. So please 
abstract it.

>   xen/arch/arm/include/asm/gic_v3_its.h |   82 ++
>   xen/arch/arm/include/asm/new_vgic.h   |   64 +
>   xen/arch/arm/vgic/Makefile            |    1 +
>   xen/arch/arm/vgic/vgic-init.c         |    7 +
>   xen/arch/arm/vgic/vgic-its.c          | 1945 +++++++++++++++++++++++++
>   xen/arch/arm/vgic/vgic-mmio-v3.c      |   93 +-
>   xen/arch/arm/vgic/vgic-mmio.c         |    6 +
>   xen/arch/arm/vgic/vgic-mmio.h         |   11 +

Cheers,

-- 
Julien Grall

