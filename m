Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3479DA011FE
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 04:01:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865019.1276292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuOy-0000Rp-U9; Sat, 04 Jan 2025 03:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865019.1276292; Sat, 04 Jan 2025 03:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuOy-0000QC-QL; Sat, 04 Jan 2025 03:00:36 +0000
Received: by outflank-mailman (input) for mailman id 865019;
 Sat, 04 Jan 2025 03:00:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTuOx-0000JL-7M
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 03:00:35 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10eddb6b-ca48-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 04:00:34 +0100 (CET)
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
X-Inumbo-ID: 10eddb6b-ca48-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735959633; x=1736218833;
	bh=wb6okQq/hzkDRz9Y13fWObj06Tss0gNPxgVdOiymwHU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=JZ4ajQ/l/y8TfQyikbzNH+M+MiiGeKPRyq6rR+ZBogL+ZhKG651aYqJp12cvpc48I
	 nb7mdtBFxwHhZMdApr977NAlfOYVC/12FrIg+aeXbGDQg3NRYkDN93VQp4yMpBpBy7
	 8nuPmqoEJIWaEUc4ItOJt5Yih4KzjX+H5l4jxmmSQWhoOo87Jbc5cD09irAzoxNPiX
	 w8qAsPx+XQTckyoAdzEBYxIsH5m6oy+ftwPd9AzcSLH4SUelkpmpxQm+AfGovFpZ2M
	 gqsm24FKQTe7OrQIUNzUr0IEU9rk17lXBAt6eSJWiXQRhxOHHK4sQ8t1bJC7e9jCX+
	 LTtoca0PkgWuw==
Date: Sat, 04 Jan 2025 03:00:30 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 17/35] xen/console: introduce consoled_is_enabled()
Message-ID: <dbgW8XOq7JPdwZfOVtTFNzR4sEKb8gtxLEa1gygWzrm3gtGw28Rh4rxtwROJZ63-oMBOdfrzck3uET7uXNAjd3DW_NNRcgU_WbsCaFTmC0g=@proton.me>
In-Reply-To: <1968c658-595d-4d36-8558-8f178f8ed531@suse.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-17-e9aa923127eb@ford.com> <1968c658-595d-4d36-8558-8f178f8ed531@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: b52792a9315fd4d8f807dfab8d20d7d9ccb0a8a1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, December 10th, 2024 at 6:31 AM, Jan Beulich <jbeulich@suse.com>=
 wrote:

>
>
> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
>
> > --- a/xen/drivers/char/consoled.c
> > +++ b/xen/drivers/char/consoled.c
> > @@ -43,13 +43,13 @@ struct xencons_interface *consoled_get_ring_addr(vo=
id)
> > static char buf[BUF_SZ + 1];
> >
> > /* Receives characters from a domain's PV console */
> > -void consoled_guest_rx(void)
> > +int consoled_guest_rx(void)
> > {
> > size_t idx =3D 0;
> > XENCONS_RING_IDX cons, prod;
> >
> > if ( !cons_ring )
> > - return;
> > + return 0;
> >
> > spin_lock(&rx_lock);
> >
> > @@ -91,15 +91,17 @@ void consoled_guest_rx(void)
> >
> > out:
> > spin_unlock(&rx_lock);
> > +
> > + return 0;
> > }
> >
> > /* Sends a character into a domain's PV console */
> > -void consoled_guest_tx(char c)
> > +int consoled_guest_tx(char c)
> > {
> > XENCONS_RING_IDX cons, prod;
> >
> > if ( !cons_ring )
> > - return;
> > + return 0;
> >
> > cons =3D ACCESS_ONCE(cons_ring->in_cons);
> > prod =3D cons_ring->in_prod;
> > @@ -118,6 +120,7 @@ void consoled_guest_tx(char c)
> >
> > cons_ring->in[MASK_XENCONS_IDX(prod++, cons_ring->in)] =3D c;
> >
> > +
> > /* Write to the ring before updating the pointer */
>
>
> No excess blank lines please.

Fixed.

>
> > @@ -125,6 +128,13 @@ void consoled_guest_tx(char c)
> > notify:
> > /* Always notify the guest: prevents receive path from getting stuck. *=
/
> > pv_shim_inject_evtchn(pv_console_evtchn());
> > +
> > + return 0;
> > +}
>
>
> For both of the functions - what use is it to make the functions return
> a value, when all they'd ever return is zero (and callers don't care)?

Fixed.

> I'm also having a hard time seeing how this adjustment is related to ...
>
> > +bool consoled_is_enabled(void)
> > +{
> > + return pv_shim && pv_console;
> > }
>
>
> ... the introduction of this function (which by itself is probably fine).

That will be a cleanup in console driver on the code path I touched wrt con=
sole
focus switch.

>
> Jan



