Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8E0B3F10B
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 00:28:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105608.1456491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utD0p-0007bJ-R8; Mon, 01 Sep 2025 22:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105608.1456491; Mon, 01 Sep 2025 22:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utD0p-0007ZS-OL; Mon, 01 Sep 2025 22:28:31 +0000
Received: by outflank-mailman (input) for mailman id 1105608;
 Mon, 01 Sep 2025 22:28:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1utD0o-0007Z4-Bc
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 22:28:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1utD0m-001Mub-2z;
 Mon, 01 Sep 2025 22:28:29 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1utD0m-00CPmO-2s;
 Mon, 01 Sep 2025 22:28:29 +0000
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
	s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:Date:From; bh=cPp7hDa5h8fSCLCzSE9D8VYRRaCm78mxCPYXlYmi7Bg=; b=
	fZsMdM4hGBjpz1uVsscM14g2Te0QfGei85W8GawZja6En/UZxIhJfsSjGSZvO+kzdQFHF5QcBThXr
	LT0JfJ8Bu4n64nUIlumLSsyYE/Bh5e9SpkQQrzyZgqm8SnT4XiWXzSk8nFKwGW/RPlKLKW0uDlOuJ
	iHGczT+wz+r5rjnlI=;
From: dmukhin@xen.org
Date: Mon, 1 Sep 2025 15:28:28 -0700
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v5 02/15] xen/8250-uart: update definitions
Message-ID: <aLYeDIrXwMPt4w5y@kraken>
References: <20250828235409.2835815-1-dmukhin@ford.com>
 <20250828235409.2835815-3-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2508291232390.341243@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2508291232390.341243@ubuntu-linux-20-04-desktop>

On Fri, Aug 29, 2025 at 12:32:46PM -0700, Stefano Stabellini wrote:
> On Thu, 27 Aug 2025, dmukhin@xen.org wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> > 
> > Added missing definitions needed for NS16550 UART emulator.
> > 
> > Newly introduced MSR definitions re-used in the existing ns16550 driver.
> > 
> > Also, corrected FCR DMA definition bit#3 (0x08) as per:
> >   https://www.ti.com/lit/ds/symlink/tl16c550c.pdf
> > See "7.7.2 FIFO Control Register (FCR)".
> > 
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v4:
> > - reused newly introduced UART_IIR and UART_IER bits in ns16550 driver
> > - Link to v4: https://lore.kernel.org/xen-devel/20250731192130.3948419-5-dmukhin@ford.com/
> > ---
> >  xen/drivers/char/ns16550.c  | 16 ++++++------
> >  xen/include/xen/8250-uart.h | 50 ++++++++++++++++++++++++++++++-------
> >  2 files changed, 49 insertions(+), 17 deletions(-)
> > 
> > diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> > index df7fff7f81df..0e80fadbb894 100644
> > --- a/xen/drivers/char/ns16550.c
> > +++ b/xen/drivers/char/ns16550.c
> > @@ -388,7 +388,7 @@ static void __init cf_check ns16550_init_preirq(struct serial_port *port)
> >  
> >      /* Check this really is a 16550+. Otherwise we have no FIFOs. */
> >      if ( uart->fifo_size <= 1 &&
> > -         ((ns_read_reg(uart, UART_IIR) & 0xc0) == 0xc0) &&
> > +         ((ns_read_reg(uart, UART_IIR) & UART_IIR_FE) == UART_IIR_FE) &&
> >           ((ns_read_reg(uart, UART_FCR) & UART_FCR_TRG14) == UART_FCR_TRG14) )
> >          uart->fifo_size = 16;
> >  }
> > @@ -728,20 +728,20 @@ static int __init check_existence(struct ns16550 *uart)
> >       * Mask out IER[7:4] bits for test as some UARTs (e.g. TL
> >       * 16C754B) allow only to modify them if an EFR bit is set.
> >       */
> > -    scratch2 = ns_read_reg(uart, UART_IER) & 0x0f;
> > -    ns_write_reg(uart,UART_IER, 0x0F);
> > -    scratch3 = ns_read_reg(uart, UART_IER) & 0x0f;
> > +    scratch2 = ns_read_reg(uart, UART_IER) & UART_IER_MASK;
> > +    ns_write_reg(uart, UART_IER, UART_IER_MASK);
> > +    scratch3 = ns_read_reg(uart, UART_IER) & UART_IER_MASK;
> >      ns_write_reg(uart, UART_IER, scratch);
> > -    if ( (scratch2 != 0) || (scratch3 != 0x0F) )
> > +    if ( (scratch2 != 0) || (scratch3 != UART_IER_MASK) )
> >          return 0;
> >  
> >      /*
> >       * Check to see if a UART is really there.
> >       * Use loopback test mode.
> >       */
> > -    ns_write_reg(uart, UART_MCR, UART_MCR_LOOP | 0x0A);
> > -    status = ns_read_reg(uart, UART_MSR) & 0xF0;
> > -    return (status == 0x90);
> > +    ns_write_reg(uart, UART_MCR, UART_MCR_LOOP | UART_MCR_RTS | UART_MCR_OUT2);
> > +    status = ns_read_reg(uart, UART_MSR) & UART_MSR_STATUS;
> > +    return (status == (UART_MSR_CTS | UART_MSR_DCD));
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
> >  #define UART_DLL          0x00    /* divisor latch (ls) (DLAB=1) */
> >  #define UART_DLM          0x01    /* divisor latch (ms) (DLAB=1) */
> > @@ -42,6 +43,8 @@
> >  #define UART_IER_ETHREI   0x02    /* tx reg. empty        */
> >  #define UART_IER_ELSI     0x04    /* rx line status       */
> >  #define UART_IER_EMSI     0x08    /* MODEM status         */
> > +#define UART_IER_MASK \
> > +    (UART_IER_ERDAI | UART_IER_ETHREI | UART_IER_ELSI | UART_IER_EMSI)
> >  
> >  /* Interrupt Identification Register */
> >  #define UART_IIR_NOINT    0x01    /* no interrupt pending */
> > @@ -51,12 +54,19 @@
> >  #define UART_IIR_THR      0x02    /*  - tx reg. empty     */
> >  #define UART_IIR_MSI      0x00    /*  - MODEM status      */
> >  #define UART_IIR_BSY      0x07    /*  - busy detect (DW) */
> > +#define UART_IIR_FE       0xc0    /* FIFO enabled (2 bits) */
> >  
> >  /* FIFO Control Register */
> > -#define UART_FCR_ENABLE   0x01    /* enable FIFO          */
> > -#define UART_FCR_CLRX     0x02    /* clear Rx FIFO        */
> > -#define UART_FCR_CLTX     0x04    /* clear Tx FIFO        */
> > -#define UART_FCR_DMA      0x10    /* enter DMA mode       */
> > +#define UART_FCR_ENABLE     BIT(0, U)   /* enable FIFO          */
> > +#define UART_FCR_CLRX       BIT(1, U)   /* clear Rx FIFO        */
> > +#define UART_FCR_CLTX       BIT(2, U)   /* clear Tx FIFO        */
> > +#define UART_FCR_DMA        BIT(3, U)   /* enter DMA mode       */
> > +#define UART_FCR_RESERVED0  BIT(4, U)   /* reserved; always 0   */
> > +#define UART_FCR_RESERVED1  BIT(5, U)   /* reserved; always 0   */
> > +#define UART_FCR_RTB0       BIT(6, U)   /* receiver trigger bit #0 */
> > +#define UART_FCR_RTB1       BIT(7, U)   /* receiver trigger bit #1 */
> > +#define UART_FCR_TRG_MASK   (UART_FCR_RTB0 | UART_FCR_RTB1)
> > +
> >  #define UART_FCR_TRG1     0x00    /* Rx FIFO trig lev 1   */
> >  #define UART_FCR_TRG4     0x40    /* Rx FIFO trig lev 4   */
> >  #define UART_FCR_TRG8     0x80    /* Rx FIFO trig lev 8   */
> > @@ -96,11 +106,32 @@
> >  #define UART_LCR_CONF_MODE_B	0xBF		/* Configuration mode B */
> >  
> >  /* Modem Control Register */
> > -#define UART_MCR_DTR      0x01    /* Data Terminal Ready  */
> > -#define UART_MCR_RTS      0x02    /* Request to Send      */
> > -#define UART_MCR_OUT2     0x08    /* OUT2: interrupt mask */
> > -#define UART_MCR_LOOP     0x10    /* Enable loopback test mode */
> > -#define UART_MCR_TCRTLR   0x40    /* Access TCR/TLR (TI16C752, EFR[4]=1) */
> > +#define UART_MCR_DTR            BIT(0, U)   /* Data Terminal Ready  */
> > +#define UART_MCR_RTS            BIT(1, U)   /* Request to Send      */
> > +#define UART_MCR_OUT1           BIT(2, U)   /* OUT1: interrupt mask */
> 
> is OUT1 an interrupt mask actually?

Yep, thanks, that should be just "Output #1".

> 
> 
> > +#define UART_MCR_OUT2           BIT(3, U)   /* OUT2: interrupt mask */
> > +#define UART_MCR_LOOP           BIT(4, U)   /* Enable loopback test mode */
> > +#define UART_MCR_RESERVED0      BIT(5, U)   /* Reserved #0 */
> > +#define UART_MCR_TCRTLR         BIT(6, U)   /* Access TCR/TLR (TI16C752, EFR[4]=1) */
> > +#define UART_MCR_RESERVED1      BIT(7, U)   /* Reserved #1 */
> > +#define UART_MCR_MASK \
> > +    (UART_MCR_DTR | UART_MCR_RTS | \
> > +     UART_MCR_OUT1 | UART_MCR_OUT2 | \
> > +     UART_MCR_LOOP | UART_MCR_TCRTLR)
> > +
> > +/* Modem Status Register */
> > +#define UART_MSR_DCTS           BIT(0, U)   /* Change in CTS */
> > +#define UART_MSR_DDSR           BIT(1, U)   /* Change in DSR */
> > +#define UART_MSR_TERI           BIT(2, U)   /* Change in RI */
> > +#define UART_MSR_DDCD           BIT(3, U)   /* Change in CTS */
> 
> Changes in DCD, can be done on commit

Will fix.

> 
> 
> > +#define UART_MSR_CTS            BIT(4, U)
> > +#define UART_MSR_DSR            BIT(5, U)
> > +#define UART_MSR_RI             BIT(6, U)
> > +#define UART_MSR_DCD            BIT(7, U)
> > +#define UART_MSR_CHANGE \
> > +    (UART_MSR_DCTS | UART_MSR_DDSR | UART_MSR_TERI | UART_MSR_DDCD)
> > +#define UART_MSR_STATUS \
> > +    (UART_MSR_CTS | UART_MSR_DSR | UART_MSR_RI | UART_MSR_DCD)
> >  
> >  /* Line Status Register */
> >  #define UART_LSR_DR       0x01    /* Data ready           */
> > @@ -111,6 +142,7 @@
> >  #define UART_LSR_THRE     0x20    /* Xmit hold reg empty  */
> >  #define UART_LSR_TEMT     0x40    /* Xmitter empty        */
> >  #define UART_LSR_ERR      0x80    /* Error                */
> > +#define UART_LSR_MASK     (UART_LSR_OE | UART_LSR_BI)
> >  
> >  /* These parity settings can be ORed directly into the LCR. */
> >  #define UART_PARITY_NONE  (0<<3)
> > -- 
> > 2.51.0
> > 

