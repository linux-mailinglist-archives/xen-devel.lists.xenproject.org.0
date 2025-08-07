Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 041CCB1DDB2
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 21:52:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073745.1436616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk6ei-0000UI-Rm; Thu, 07 Aug 2025 19:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073745.1436616; Thu, 07 Aug 2025 19:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk6ei-0000S1-OJ; Thu, 07 Aug 2025 19:52:04 +0000
Received: by outflank-mailman (input) for mailman id 1073745;
 Thu, 07 Aug 2025 19:52:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ybbA=2T=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uk6UH-0002bD-6O
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 19:41:17 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7afae8a4-73c6-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 21:41:15 +0200 (CEST)
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
X-Inumbo-ID: 7afae8a4-73c6-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754595674; x=1754854874;
	bh=bweBhttY+RKorq/sriT2aTEg4aDPhmF6aPdjup9SFIo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=aqGKJW9q2lEwnTXdNN6UySgCKEahUmdQz2ekJhy9HIBQhgAZ8WYO1b8oTCwF9vUhG
	 sxKSvk/4n3DUFC0nZuhQPkyIf1egb2ko6OhnuBnA0zxqX6R+sPAKilUg84c6Pw3yfa
	 sJoE3QKK7yWr4GU1tg2rrjl08eMa7/z4+pGP/DgpMTn9urxOcps1RurVyak2WTapvo
	 e6ANEeeN48gAcWMLoW7D/KrdfMuBRN9mbXnW+xpPCgHdFrxE7/LJpfL6OwKJgmPanN
	 DMQazYF9LPw+YM35LJsKxJ2Wh1/3hPG6t0Ce6DP3IvIOWQKhaHCMmAXnswhXAVEdVO
	 wbvaMW4Rj/G5g==
Date: Thu, 07 Aug 2025 19:41:09 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 4/8] xen/8250-uart: update definitions
Message-ID: <aJUBUSm9oBPSHC7l@kraken>
In-Reply-To: <b207d809-bd2a-43fb-9592-58e8c37de31a@suse.com>
References: <20250731192130.3948419-1-dmukhin@ford.com> <20250731192130.3948419-5-dmukhin@ford.com> <b207d809-bd2a-43fb-9592-58e8c37de31a@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 0360f84061203a04567f34cd791ddeb5d3ec63e0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 04, 2025 at 12:23:34PM +0200, Jan Beulich wrote:
> On 31.07.2025 21:22, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Added missing definitions needed for NS16550 UART emulator.
> >
> > Newly introduced MSR definitions re-used in the existing ns16550 driver=
.
> >
> > Also, corrected FCR DMA definition bit#3 (0x08) as per:
> >   https://www.ti.com/lit/ds/symlink/tl16c550c.pdf
> > See "7.7.2 FIFO Control Register (FCR)".
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v3:
> > - feedback addressed
> > - made use of new UART_MCR_XXX bits in ns16550 driver
> > - Link to v3: https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v=
3-v1-19-c5d36b31d66c@ford.com/
> > ---
> >  xen/drivers/char/ns16550.c  |  6 ++---
> >  xen/include/xen/8250-uart.h | 50 ++++++++++++++++++++++++++++++-------
> >  2 files changed, 44 insertions(+), 12 deletions(-)
> >
> > diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> > index df7fff7f81df..a899711e2a8b 100644
> > --- a/xen/drivers/char/ns16550.c
> > +++ b/xen/drivers/char/ns16550.c
> > @@ -739,9 +739,9 @@ static int __init check_existence(struct ns16550 *u=
art)
> >       * Check to see if a UART is really there.
> >       * Use loopback test mode.
> >       */
> > -    ns_write_reg(uart, UART_MCR, UART_MCR_LOOP | 0x0A);
> > -    status =3D ns_read_reg(uart, UART_MSR) & 0xF0;
> > -    return (status =3D=3D 0x90);
> > +    ns_write_reg(uart, UART_MCR, UART_MCR_LOOP | UART_MCR_RTS | UART_M=
CR_OUT2);
> > +    status =3D ns_read_reg(uart, UART_MSR) & UART_MSR_STATUS;
> > +    return (status =3D=3D (UART_MSR_CTS | UART_MSR_DCD));
> >  }
> >
> >  #ifdef CONFIG_HAS_PCI
> > diff --git a/xen/include/xen/8250-uart.h b/xen/include/xen/8250-uart.h
> > index d13352940c13..bc11cdc376c9 100644
> > --- a/xen/include/xen/8250-uart.h
> > +++ b/xen/include/xen/8250-uart.h
> > @@ -32,6 +32,7 @@
> >  #define UART_MCR          0x04    /* Modem control        */
> >  #define UART_LSR          0x05    /* line status          */
> >  #define UART_MSR          0x06    /* Modem status         */
> > +#define UART_SCR          0x07    /* Scratch pad          */
> >  #define UART_USR          0x1f    /* Status register (DW) */
> >  #define UART_DLL          0x00    /* divisor latch (ls) (DLAB=3D1) */
> >  #define UART_DLM          0x01    /* divisor latch (ms) (DLAB=3D1) */
> > @@ -42,6 +43,8 @@
> >  #define UART_IER_ETHREI   0x02    /* tx reg. empty        */
> >  #define UART_IER_ELSI     0x04    /* rx line status       */
> >  #define UART_IER_EMSI     0x08    /* MODEM status         */
> > +#define UART_IER_MASK \
> > +    (UART_IER_ERDAI | UART_IER_ETHREI | UART_IER_ELSI | UART_IER_EMSI)
>=20
> At the example of this: It having no users here, how are we to know it'll
> gain some (and hence be useful)? Adding missing base definitions is imo
> fine without immediate users, but for derived ones it's less clear.

There're UART_IIR and UART_IER bits which could be re-used.
Will update ns16550 driver.
Thanks.


