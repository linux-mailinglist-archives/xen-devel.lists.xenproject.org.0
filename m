Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E71C2732146
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 23:03:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549890.858678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9u83-0002e0-4c; Thu, 15 Jun 2023 21:03:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549890.858678; Thu, 15 Jun 2023 21:03:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9u83-0002bZ-11; Thu, 15 Jun 2023 21:03:39 +0000
Received: by outflank-mailman (input) for mailman id 549890;
 Thu, 15 Jun 2023 21:03:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vZfe=CD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q9u81-0002bT-0I
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 21:03:37 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 162ca628-0bc0-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 23:03:34 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 65F6461AC1;
 Thu, 15 Jun 2023 21:03:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8511C433C8;
 Thu, 15 Jun 2023 21:03:30 +0000 (UTC)
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
X-Inumbo-ID: 162ca628-0bc0-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686863011;
	bh=O6fyuygQXydiEtrAx6nEbiKxT2NQRvMIms9FyeLv69c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oQsOI1lS6alqccfJhZfbPTaWw1iMV3DYEooSbCouUph7BXj7qKOrMbttaGQA6pJ2C
	 CvTEa1RH5hE32z3sKO4Kbta9/0Wlp42t0OFDxtdm37vv3kEU6E4qN3Fl/BcG+JApsa
	 EWxjIoJOt5SI0J8WCMhxK2o/rme8l5eXGJ7vxynJtUIPYstuBAEJq8YZTaYLkTFBC5
	 NwohQ6lLqdsBmc0nqr/JhnJxyH/wwRs6ys6zNEpkEXWxkkQfvU67YjUSLqLOJ2hpC5
	 saTpGR+4jpsKyDx8V3ZYCJAxRSK2pK/Lw8jvIqGeNNjReLohLwn1+Yr/HyArfaL3+q
	 7Jd+VmVdD8eCA==
Date: Thu, 15 Jun 2023 14:03:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/4] xen/arm: debug-pl011: Use correct accessors
In-Reply-To: <8d2a300f-1fe9-590f-7481-b0980d23c743@amd.com>
Message-ID: <alpine.DEB.2.22.394.2306151403170.897208@ubuntu-linux-20-04-desktop>
References: <20230607092727.19654-1-michal.orzel@amd.com> <20230607092727.19654-2-michal.orzel@amd.com> <alpine.DEB.2.22.394.2306141836050.897208@ubuntu-linux-20-04-desktop> <8d2a300f-1fe9-590f-7481-b0980d23c743@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 15 Jun 2023, Michal Orzel wrote:
> Hi Stefano,
> 
> On 15/06/2023 03:36, Stefano Stabellini wrote:
> > 
> > 
> > On Wed, 7 Jun 2023, Michal Orzel wrote:
> >> Although most PL011 UARTs can cope with 32-bit accesses, some of the old
> >> legacy ones might not. PL011 registers are 8/16-bit wide and this shall
> >> be perceived as the normal behavior.
> >>
> >> Modify early printk pl011 code for arm32/arm64 to use the correct
> >> accessors depending on the register size (refer ARM DDI 0183G, Table 3.1).
> >>
> >> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> >> ---
> >> Next patch will override strX,ldrX with macros but I prefer to keep the
> >> history clean (+ possibiltity for a backport if needed).
> >> ---
> >>  xen/arch/arm/arm32/debug-pl011.inc | 12 ++++++------
> >>  xen/arch/arm/arm64/debug-pl011.inc |  6 +++---
> >>  2 files changed, 9 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/xen/arch/arm/arm32/debug-pl011.inc b/xen/arch/arm/arm32/debug-pl011.inc
> >> index c527f1d4424d..9fe0c2503831 100644
> >> --- a/xen/arch/arm/arm32/debug-pl011.inc
> >> +++ b/xen/arch/arm/arm32/debug-pl011.inc
> >> @@ -26,13 +26,13 @@
> >>   */
> >>  .macro early_uart_init rb, rc, rd
> >>          mov   \rc, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE % 16)
> >> -        str   \rc, [\rb, #FBRD]     /* -> UARTFBRD (Baud divisor fraction) */
> >> +        strb  \rc, [\rb, #FBRD]     /* -> UARTFBRD (Baud divisor fraction) */
> >>          mov   \rc, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)
> >> -        str   \rc, [\rb, #IBRD]     /* -> UARTIBRD (Baud divisor integer) */
> >> +        strh  \rc, [\rb, #IBRD]     /* -> UARTIBRD (Baud divisor integer) */
> >>          mov   \rc, #WLEN_8          /* 8n1 */
> >> -        str   \rc, [\rb, #LCR_H]     /* -> UARTLCR_H (Line control) */
> >> +        strb  \rc, [\rb, #LCR_H]     /* -> UARTLCR_H (Line control) */
> >>          ldr   \rc, =(RXE | TXE | UARTEN)      /* RXE | TXE | UARTEN */
> >> -        str   \rc, [\rb, #CR]     /* -> UARTCR (Control Register) */
> >> +        strh  \rc, [\rb, #CR]     /* -> UARTCR (Control Register) */
> >>  .endm
> >>
> >>  /*
> >> @@ -42,7 +42,7 @@
> >>   */
> >>  .macro early_uart_ready rb, rc
> >>  1:
> >> -        ldr   \rc, [\rb, #FR]       /* <- UARTFR (Flag register) */
> >> +        ldrh  \rc, [\rb, #FR]       /* <- UARTFR (Flag register) */
> >>          tst   \rc, #BUSY             /* Check BUSY bit */
> >>          bne   1b                    /* Wait for the UART to be ready */
> >>  .endm
> >> @@ -53,7 +53,7 @@
> >>   * rt: register which contains the character to transmit
> >>   */
> >>  .macro early_uart_transmit rb, rt
> >> -        str   \rt, [\rb, #DR]            /* -> UARTDR (Data Register) */
> >> +        strb  \rt, [\rb, #DR]            /* -> UARTDR (Data Register) */
> > 
> > Isn't UARTDR potentially 12-bit? I am not sure if we should use strb or
> > strh here...
> UARTDR is 16-bit register where bits 15:12 are reserved and 11:8 are for indicating errors during READ.
> Here, we perform WRITE meaning the actual register width is 8 bytes. This is also indicated by the PL011 TRM
> which specifies width as "12/8" meaning 12 for READ and 8 for WRITE.

That makes sense

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

