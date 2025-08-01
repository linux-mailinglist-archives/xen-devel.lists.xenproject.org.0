Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD3EB17B66
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 05:28:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066749.1431859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhgRV-0000eG-Fk; Fri, 01 Aug 2025 03:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066749.1431859; Fri, 01 Aug 2025 03:28:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhgRV-0000ce-C6; Fri, 01 Aug 2025 03:28:25 +0000
Received: by outflank-mailman (input) for mailman id 1066749;
 Fri, 01 Aug 2025 03:28:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GtvS=2N=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uhgRS-0000cY-FK
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 03:28:23 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91f51ed7-6e87-11f0-a320-13f23c93f187;
 Fri, 01 Aug 2025 05:28:21 +0200 (CEST)
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
X-Inumbo-ID: 91f51ed7-6e87-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754018898; x=1754278098;
	bh=xpQcuWE2Srq1OrS6YWkW2AaQ+rh9ZESSnvzioC/47bg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=aXFlDKW6XiLn5mn5n51o9ytQjN3y+Ngyfb5XE5BxOYIX9rwQg7KdN/dBJKVx5dVDz
	 taU9RQ1pU6exuHLZW/Z+ibs2ChhtvkQcmm1IGa6qAd0aZvDZZvHHHGddezQaNWH1TJ
	 /1hn+P768GCaEYoGgebiBJ/HXptutyy0JBuo3fr7hkJqXppDlem0pw876g8ILhWDW3
	 THZQm4yUCrq7PujEVq3u4fSDZUEwrHuBlXm0lbc7Sn1jGOkppkjyEj7LzM9VP1Qfz2
	 W8BgohT+WN4gdFzAlllPd+mbgP679cuRTCm7jAR3qoAY5ojkE2ZMef84SaP/c8SHVZ
	 CsXZOrIY4Mgmg==
Date: Fri, 01 Aug 2025 03:28:14 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v4 5/8] emul/vuart-ns16550: introduce NS16550-compatible UART emulator (x86)
Message-ID: <aIw0SmU8RIbClWCD@kraken>
In-Reply-To: <alpine.DEB.2.22.394.2507311647480.468590@ubuntu-linux-20-04-desktop>
References: <20250731192130.3948419-1-dmukhin@ford.com> <20250731192130.3948419-6-dmukhin@ford.com> <alpine.DEB.2.22.394.2507311647480.468590@ubuntu-linux-20-04-desktop>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 3e8cdafa9f9802db10a97ac9263de613a8921cb0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 04:57:00PM -0700, Stefano Stabellini wrote:
> On Thu, 31 Jul 2025, dmkhn@proton.me wrote:

[..]

> > +/*
> > + * Emulate 8-bit write access to NS16550 register.
> > + */
> > +static int ns16550_io_write8(
> > +    struct vuart_ns16550 *vdev, uint32_t reg, uint8_t *data)
> > +{
> > +    uint8_t *regs =3D vdev->regs;
> > +    uint8_t val =3D *data;
> > +    int rc =3D 0;
> > +
> > +    if ( ns16550_dlab_get(vdev) && (reg =3D=3D UART_DLL || reg =3D=3D =
UART_DLM) )
> > +        regs[NS16550_REGS_NUM + reg] =3D val;
> > +    else
> > +    {
> > +        switch ( reg )
> > +        {
> > +        case UART_THR:
> > +            if ( regs[UART_MCR] & UART_MCR_LOOP )
> > +            {
> > +                (void)ns16550_fifo_rx_putchar(vdev, val);
> > +                regs[UART_LSR] |=3D UART_LSR_OE;
>=20
> Why is UART_LSR_OE set unconditionally here instead of checking if
> ns16550_fifo_rx_putchar returned -ENOSPC?

Thanks!
Yes, overrun condition should be emulated once FIFO is full.

[..]

> > +
> > +            /* Calculate changes in modem status */
> > +            if ( (msr_curr & UART_MSR_CTS) ^ (msr_next & UART_MSR_CTS)=
 )
> > +                msr_delta |=3D UART_MSR_DCTS;
> > +            if ( (msr_curr & UART_MCR_RTS) ^ (msr_next & UART_MCR_RTS)=
 )
> > +                msr_delta |=3D UART_MSR_DDSR;
>=20
> Should we check UART_MSR_DSR instead of UART_MCR_RTS to set
> UART_MSR_DDSR ?

Good catch!
Thanks.

[..]


