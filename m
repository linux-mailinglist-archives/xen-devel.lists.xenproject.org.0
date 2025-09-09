Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2397DB50686
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 21:43:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117318.1463472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw4Ey-0004K6-9M; Tue, 09 Sep 2025 19:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117318.1463472; Tue, 09 Sep 2025 19:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw4Ey-0004Id-6J; Tue, 09 Sep 2025 19:42:56 +0000
Received: by outflank-mailman (input) for mailman id 1117318;
 Tue, 09 Sep 2025 19:42:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uw4Ex-0004IX-Ec
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 19:42:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uw4Es-001oNx-2u;
 Tue, 09 Sep 2025 19:42:50 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uw4Es-001zaB-30;
 Tue, 09 Sep 2025 19:42:50 +0000
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
	:Subject:Cc:To:Date:From; bh=BgCy2fco2YaL2eeY84hZc3zf/PPtvizY8/oxBLPjt0A=; b=
	AwuFQzm33VkZrqhg75xm3KgwDfDyiIYx7lFJf+TGHW+PZ1xuRZbQSWircCk+lVdZX+2jIdxfeAuto
	7savx+YCxiaEQWtrpYqVHrQvvSh2Ata0SP8cvhRU94X6c1AGN49ud8wl2+SzCfh/zXZVRDcSS4qT1
	Q9r+yh5ypTDQGh/Ds=;
From: dmukhin@xen.org
Date: Tue, 9 Sep 2025 12:42:49 -0700
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
	dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7 02/16] xen/8250-uart: update definitions
Message-ID: <aMCDOUgqhQMYCjcK@kraken>
References: <20250908211149.279143-1-dmukhin@ford.com>
 <20250908211149.279143-3-dmukhin@ford.com>
 <54211c3c-f911-41c3-b4bd-1e27fcc09f93@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54211c3c-f911-41c3-b4bd-1e27fcc09f93@suse.com>

On Tue, Sep 09, 2025 at 12:05:41PM +0200, Jan Beulich wrote:
> On 08.09.2025 23:11, dmukhin@xen.org wrote:
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
> 
> Here, aiui, ..._MASK covers all known bits. No #define-s for reserved
> ones.
> 
> > @@ -51,12 +54,19 @@
> >  #define UART_IIR_THR      0x02    /*  - tx reg. empty     */
> >  #define UART_IIR_MSI      0x00    /*  - MODEM status      */
> >  #define UART_IIR_BSY      0x07    /*  - busy detect (DW) */
> > +#define UART_IIR_FE       0xc0    /* FIFO enabled (2 bits) */
> >  
> >  /* FIFO Control Register */
> >  #define UART_FCR_ENABLE   0x01    /* enable FIFO          */
> >  #define UART_FCR_CLRX     0x02    /* clear Rx FIFO        */
> >  #define UART_FCR_CLTX     0x04    /* clear Tx FIFO        */
> > -#define UART_FCR_DMA      0x10    /* enter DMA mode       */
> > +#define UART_FCR_DMA      0x08    /* enter DMA mode       */
> 
> Question is whether we can actually use the source you indicate as
> reference. TL16C550C may already be too different from what a "standard"
> 16550 is (where admittedly it also looks unclear what "standard" would be,
> as I'm unaware of a "canonical" spec).

Yeah, I am not sure there's a "standard" spec for NS16550.

> 
> The source I'm looking at says something entirely different. Maybe we're
> better off simply omitting this #define?

All TL16Cx50 I have mentioned, including Synopsys uart databook, say
FCR's "DMA mode select" is Bit 3.

And Linux'es driver defines it as 0x08 (include/uapi/linux/serial_reg.h)

> 
> > +#define UART_FCR_RSRVD0   0x10    /* reserved; always 0   */
> > +#define UART_FCR_RSRVD1   0x20    /* reserved; always 0   */
> > +#define UART_FCR_RTB0     0x40    /* receiver trigger bit #0 */
> > +#define UART_FCR_RTB1     0x80    /* receiver trigger bit #1 */
> > +#define UART_FCR_TRG_MASK (UART_FCR_RTB0 | UART_FCR_RTB1)
> 
> Continuing from the top comment - here, with the TRG infix, the scope is
> clear, too.
> 
> > @@ -98,9 +108,30 @@
> >  /* Modem Control Register */
> >  #define UART_MCR_DTR      0x01    /* Data Terminal Ready  */
> >  #define UART_MCR_RTS      0x02    /* Request to Send      */
> > -#define UART_MCR_OUT2     0x08    /* OUT2: interrupt mask */
> > +#define UART_MCR_OUT1     0x04    /* Output #1 */
> > +#define UART_MCR_OUT2     0x08    /* Output #2 */
> >  #define UART_MCR_LOOP     0x10    /* Enable loopback test mode */
> > +#define UART_MCR_RSRVD0   0x20    /* Reserved #0 */
> >  #define UART_MCR_TCRTLR   0x40    /* Access TCR/TLR (TI16C752, EFR[4]=1) */
> > +#define UART_MCR_RSRVD1   0x80    /* Reserved #1 */
> > +#define UART_MCR_MASK \
> > +    (UART_MCR_DTR | UART_MCR_RTS | \
> > +     UART_MCR_OUT1 | UART_MCR_OUT2 | \
> > +     UART_MCR_LOOP | UART_MCR_TCRTLR)
> 
> Here it's again all non-reserved bits. Yet why do we need #define-s for
> the two reserved ones here? (Same question for FCR, even if there's no
> UART_FCR_MASK.)
> 
> > +/* Modem Status Register */
> > +#define UART_MSR_DCTS     0x01    /* Change in CTS */
> > +#define UART_MSR_DDSR     0x02    /* Change in DSR */
> > +#define UART_MSR_TERI     0x04    /* Change in RI */
> > +#define UART_MSR_DDCD     0x08    /* Change in DCD */
> > +#define UART_MSR_CTS      0x10
> > +#define UART_MSR_DSR      0x20
> > +#define UART_MSR_RI       0x40
> > +#define UART_MSR_DCD      0x80
> > +#define UART_MSR_CHANGE \
> > +    (UART_MSR_DCTS | UART_MSR_DDSR | UART_MSR_TERI | UART_MSR_DDCD)
> > +#define UART_MSR_STATUS \
> > +    (UART_MSR_CTS | UART_MSR_DSR | UART_MSR_RI | UART_MSR_DCD)
> 
> Here it's properly two subsets.
> 
> > @@ -111,6 +142,7 @@
> >  #define UART_LSR_THRE     0x20    /* Xmit hold reg empty  */
> >  #define UART_LSR_TEMT     0x40    /* Xmitter empty        */
> >  #define UART_LSR_ERR      0x80    /* Error                */
> > +#define UART_LSR_MASK     (UART_LSR_OE | UART_LSR_BI)
> 
> But what's the deal here? Why would only two of the bits be covered?
> 
> Jan

