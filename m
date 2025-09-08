Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FC9B482B2
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 04:50:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114479.1461386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvRxm-0000kP-20; Mon, 08 Sep 2025 02:50:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114479.1461386; Mon, 08 Sep 2025 02:50:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvRxl-0000hV-VF; Mon, 08 Sep 2025 02:50:37 +0000
Received: by outflank-mailman (input) for mailman id 1114479;
 Mon, 08 Sep 2025 02:50:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uvRxl-0000hP-0z
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 02:50:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvRxj-00D1wl-2b;
 Mon, 08 Sep 2025 02:50:36 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvRxj-0033rs-2D;
 Mon, 08 Sep 2025 02:50:35 +0000
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
	:Subject:Cc:To:Date:From; bh=hIv4ykq8ac5blmGw/LxJFPOEr5vgHwq5Zrw9UqPrRio=; b=
	1MiXjEco+hXgMNfLrEX/eOS94NBciA9y8/XMjgkUT/hV/dYyTWgyxAxzTHg+z/k1ltM1yv+BBUhT1
	M67KP6T9RdzezkqrLEBgcv8Qdi5iuS1T4QT+1kBfGWgEZKaGY6rxHJp7YQQypQe7dwmBe7UTkNSsg
	FpuiKsAnOboQNzp3o=;
From: dmukhin@xen.org
Date: Sun, 7 Sep 2025 19:50:34 -0700
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v6 10/15] emul/ns16x50: implement THR register
Message-ID: <aL5EelNb8IZgVqok@kraken>
References: <20250905232715.440758-1-dmukhin@ford.com>
 <20250905232715.440758-11-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2509051830070.1405870@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2509051830070.1405870@ubuntu-linux-20-04-desktop>

On Fri, Sep 05, 2025 at 06:59:30PM -0700, Stefano Stabellini wrote:
> On Fri, 5 Sep 2025, dmukhin@xen.org wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
[..]
> > @@ -439,6 +523,16 @@ static int ns16x50_io_read8(
> >  
> >          case UART_IIR: /* RO */
> >              val = ns16x50_iir_get(vdev);
> > +
> > +            /*
> > +             * Since there's no baud rate emulation, transmits are immediate
> > +             * to the guest. Clear IIR scratch location to make sure there
> > +             * will be interrupt generated once guest re-enabled ETHREI in
> > +             * IER.
> > +             */
> > +            if ( val & UART_IIR_THR )
> > +                regs[NS16X50_REGS_NUM + UART_IIR] &= ~UART_IIR_THR;
> 
> Why clear UART_IIR_THR here?
> 
> UART_IIR_THR should be set if the out buffer is not full and should not
> be set of the out buffer is full?

Now that the THR/FCR register emulation _may_ clear UART_IIR_THR, clearing
UART_IIR_THR here is not needed. 

Thanks for the catch!

> 
> Given that the only function adding to out is ns16x50_fifo_tx_putchar,
> and given that ns16x50_fifo_tx_putchar clears the out buffer when full
> by calling ns16x50_fifo_tx_flush if ns16x50_fifo_tx_full, then basically
> we can keep UART_IIR_THR set all the time?

