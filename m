Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E681B466B8
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 00:33:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112525.1460748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuezp-0000EA-8y; Fri, 05 Sep 2025 22:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112525.1460748; Fri, 05 Sep 2025 22:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuezp-0000CW-66; Fri, 05 Sep 2025 22:33:29 +0000
Received: by outflank-mailman (input) for mailman id 1112525;
 Fri, 05 Sep 2025 22:33:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uuezn-0000CQ-Qq
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 22:33:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uuezm-00894h-1w;
 Fri, 05 Sep 2025 22:33:26 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uuezm-0002Pq-1r;
 Fri, 05 Sep 2025 22:33:26 +0000
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
	:Subject:Cc:To:Date:From; bh=vKkKEq91YPtWCfB8OjxhVAxgHU3Ca3IXZSEt2vQMv9Y=; b=
	6/KM+KljAHqPx0mmqWIwfwKxR73YLQUh4Q+ySado7AxcXqKkUih8MeJQYBcUkncTxoWJeKfotU6I9
	ktAHCWxQ9U2MCrA3maqv0xfaT0JnxJzz0MEJvFMd2EZAKb3lxAWdCb/h/5MAckY8Ef0Hajb6hbDms
	sr3yF6FwWYWl+SYUs=;
From: dmukhin@xen.org
Date: Fri, 5 Sep 2025 15:33:25 -0700
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v5 07/15] emul/ns16x50: implement FCR register
 (write-only)
Message-ID: <aLtlNeuk18rDSs4p@kraken>
References: <20250828235409.2835815-1-dmukhin@ford.com>
 <20250828235409.2835815-8-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2508291335260.341243@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2508291335260.341243@ubuntu-linux-20-04-desktop>

On Fri, Aug 29, 2025 at 01:38:02PM -0700, Stefano Stabellini wrote:
> On Thu, 28 Aug 2025, dmukhin@xen.org wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> > 
> > Add emulation logic for FCR register.
> > 
> > Note, that does not hooks FIFO interrupt moderation to the FIFO management
> > code.
> > 
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v4:
> > - new patch
> > ---
> >  xen/common/emul/vuart/ns16x50.c | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> > 
> > diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
> > index efb2f4c6441c..65ca96dd8bd3 100644
> > --- a/xen/common/emul/vuart/ns16x50.c
> > +++ b/xen/common/emul/vuart/ns16x50.c
> > @@ -363,6 +363,30 @@ static int ns16x50_io_write8(
> >  
> >              break;
> >  
> > +        case UART_FCR: /* WO */
> > +            if ( val & UART_FCR_RESERVED0 )
> > +                ns16x50_warn(vdev, "FCR: attempt to set reserved bit: %x\n",
> > +                             UART_FCR_RESERVED0);
> > +
> > +            if ( val & UART_FCR_RESERVED1 )
> > +                ns16x50_warn(vdev, "FCR: attempt to set reserved bit: %x\n",
> > +                             UART_FCR_RESERVED1);
> > +
> > +            if ( val & UART_FCR_CLRX )
> > +                ns16x50_fifo_rx_reset(vdev);
> > +
> > +            if ( val & UART_FCR_CLTX )
> > +                ns16x50_fifo_tx_flush(vdev);
> 
> Should UART_FCR_CLTX actually emit data or only clear the buffer?

Yes, thanks; should be just "tx_reset".

> 
> set UART_IIR_THR ?

Will do, thanks.

> 
> 
> > +
> > +            if ( val & UART_FCR_ENABLE )
> > +                val &= UART_FCR_ENABLE | UART_FCR_DMA | UART_FCR_TRG_MASK;
> > +            else
> > +                val = 0;
> > +
> > +            regs[UART_FCR] = val;
> 
> 
> ns16x50_irq_check ?

ns16x50_irq_check() is poked after the switch statement.

> 
> 
> > +            break;
> > +
> >          default:
> >              rc = -EINVAL;
> >              break;
> > -- 
> > 2.51.0
> > 

