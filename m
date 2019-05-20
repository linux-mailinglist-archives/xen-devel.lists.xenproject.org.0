Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 089AA24025
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 20:17:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSmoK-00050p-NS; Mon, 20 May 2019 18:14:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rume=TU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hSmoJ-00050h-OM
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 18:14:55 +0000
X-Inumbo-ID: 2a6d2d49-7b2b-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2a6d2d49-7b2b-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 18:14:54 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2C737208C3;
 Mon, 20 May 2019 18:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558376093;
 bh=4JpaFgDIE4iXPtOUWHMQnrS8ap11eF0MXwobKPr2ftk=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=BOLiKD0c7IE1VTKA/DzlsPSrVjSeVGcwD63G8r1POYeM3JuwD/FUdr18XQxZJ5/3f
 XN5XZqELqSiEGDszuKTAn9r4YxtskcgQtgDfMu1Z/1wMXtnnId1XBo/oO9e9Hy78Um
 qRUTSGKOHam2a4n6jMP2GdC7gExb/0Wp0CRg844I=
Date: Mon, 20 May 2019 11:14:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190515201730.19079-1-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1905201109530.23519@sstabellini-ThinkPad-T480s>
References: <20190515201730.19079-1-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1592109277-1558375800=:23519"
Content-ID: <alpine.DEB.2.21.1905201114430.23519@sstabellini-ThinkPad-T480s>
Subject: Re: [Xen-devel] [PATCH] xen/arm: traps: Avoid using BUG_ON() to
 check guest state in advance_pc()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: =?UTF-8?Q?Lukas_J=C3=BCnger?= <lukas.juenger@ice.rwth-aachen.de>,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, Andrii_Anisov@epam.com,
 Oleksandr_Tyshchenko@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1592109277-1558375800=:23519
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.1905201114431.23519@sstabellini-ThinkPad-T480s>

On Wed, 15 May 2019, Julien Grall wrote:
> The condition of the BUG_ON() in advance_pc() is pretty wrong because
> the bits [26:25] and [15:10] have a different meaning between AArch32
> and AArch64 state.
> 
> On AArch32, they are used to store PSTATE.IT. On AArch64, they are RES0
> or used for new feature (e.g ARMv8.0-SSBS, ARMv8.5-BTI).
> 
> This means a 64-bit guest will hit the BUG_ON() if it is trying to use
> any of these features.
> 
> More generally, RES0 means that the bits is reserved for future use. So
> crashing the host is definitely not the right solution.
> 
> In this particular case, we only need to know the guest was using 32-bit
> Mode and the Thumb instructions. So replace the BUG_ON() by a proper
> check.
> 
> Reported-by: Lukas Jünger <lukas.juenger@ice.rwth-aachen.de>
> Signed-off-by: Julien Grall <julien.grall@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>     This patch needs to be backported as far as possible. Otherwise Xen
>     would not be able to run on processor implementing ARMv8.0-SSBS,
>     ARMv8.5-BTI or ARMv8.5-MemTag. The former is actually the most
>     critical as this is used for controlling mitagion for SSBD (aka
>     Spectre v4) in hardware.
> ---
>  xen/arch/arm/traps.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index d8b9a8a0f0..798a3a45a4 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1650,12 +1650,9 @@ int check_conditional_instr(struct cpu_user_regs *regs, const union hsr hsr)
>  void advance_pc(struct cpu_user_regs *regs, const union hsr hsr)
>  {
>      unsigned long itbits, cond, cpsr = regs->cpsr;
> +    bool is_thumb = psr_mode_is_32bit(cpsr) && (cpsr & PSR_THUMB);
>  
> -    /* PSR_IT_MASK bits can only be set for 32-bit processors in Thumb mode. */
> -    BUG_ON( (!psr_mode_is_32bit(cpsr)||!(cpsr&PSR_THUMB))
> -            && (cpsr&PSR_IT_MASK) );
> -
> -    if ( cpsr&PSR_IT_MASK )
> +    if ( is_thumb && (cpsr & PSR_IT_MASK) )
>      {
>          /* The ITSTATE[7:0] block is contained in CPSR[15:10],CPSR[26:25]
>           *
> -- 
> 2.11.0
> 
--8323329-1592109277-1558375800=:23519
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1592109277-1558375800=:23519--

