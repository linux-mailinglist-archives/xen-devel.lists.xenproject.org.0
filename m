Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED34A40513
	for <lists+xen-devel@lfdr.de>; Sat, 22 Feb 2025 03:18:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894761.1303480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlf5t-0007XA-TT; Sat, 22 Feb 2025 02:18:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894761.1303480; Sat, 22 Feb 2025 02:18:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlf5t-0007Um-Qj; Sat, 22 Feb 2025 02:18:17 +0000
Received: by outflank-mailman (input) for mailman id 894761;
 Sat, 22 Feb 2025 02:18:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V16X=VN=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tlf5r-0007UV-KN
 for xen-devel@lists.xenproject.org; Sat, 22 Feb 2025 02:18:15 +0000
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44b61ed1-f0c3-11ef-9896-31a8f345e629;
 Sat, 22 Feb 2025 03:18:13 +0100 (CET)
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
X-Inumbo-ID: 44b61ed1-f0c3-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1740190692; x=1740449892;
	bh=X2AaSgpUvbk67T1nHvQ+aWE8u2l2HCy31S0NXNrU9C4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=DjiJvqoiFbC3iPi2l1efTtn7e+FxCN21oqLpHXQlmnI+Mn3ysUqWBdAeQN5rzQHUn
	 2NCXVjJ9eiDKVstA2kW4e5XHFVWUZ8GNuFhlxspe0hQJnzqvMzfE06h3XhKVGU//8l
	 8Snc3O+wFFSBrdeWVzNDOS6mEiO7vBmudjo1wyz1umPmOrJxRjIRVWO7a04Qwnghup
	 X1gChtMxfodLzi7Lv1Mh+StPyzUA/q8CYW1GrHNJM+Thxb04eJo4zH8LWx53zBwSw6
	 Vq5ViDaINFM5vc6EUpBtsZNLw0uJutv6h6dHjvHxKM1mEbgiRcN4f5fU97VhYXCNFJ
	 wAIc468RxHf2A==
Date: Sat, 22 Feb 2025 02:18:06 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
From: Denis Mukhin <dmkhn@proton.me>
Cc: Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/console: introduce console_{get,put}_domain()
Message-ID: <wsZONBBVF-KfySpsU636DUF1yr1dR9hm7JjNJRAimJoEBkSmz1OEVGWnZi6VMIzTkizRFPawKDcji-v_b3QfpIcCr9rBxpDnRoRDC5buJbU=@proton.me>
In-Reply-To: <alpine.DEB.2.22.394.2502211604390.1791669@ubuntu-linux-20-04-desktop>
References: <20250218083048.596012-1-dmkhn@proton.me> <2238f00f-b5b4-4382-9045-09dc6b7cee6b@suse.com> <alpine.DEB.2.22.394.2502211604390.1791669@ubuntu-linux-20-04-desktop>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 61fb57210e92555e7e68e62000a9fe4333d6df63
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Friday, February 21st, 2025 at 4:04 PM, Stefano Stabellini <sstabellini@=
kernel.org> wrote:

>=20
>=20
> On Wed, 19 Feb 2025, Jan Beulich wrote:
>=20
> > On 18.02.2025 09:31, dmkhn@proton.me wrote:
> >=20
> > > @@ -546,31 +555,23 @@ static void __serial_rx(char c)
> > > * getting stuck.
> > > */
> > > send_global_virq(VIRQ_CONSOLE);
> > > - break;
> > > -
> > > + }
> > > #ifdef CONFIG_SBSA_VUART_CONSOLE
> > > - default:
> > > - {
> > > - struct domain d =3D rcu_lock_domain_by_id(console_rx - 1);
> > > -
> > > - if ( d )
> > > - {
> > > - int rc =3D vpl011_rx_char_xen(d, c);
> > > - if ( rc )
> > > - guest_printk(d, XENLOG_G_WARNING
> > > - "failed to process console input: %d\n", rc);
> > > - rcu_unlock_domain(d);
> > > - }
> > > -
> > > - break;
> > > - }
> > > + else
> > > + / Deliver input to the emulated UART. */
> > > + rc =3D vpl011_rx_char_xen(d, c);
> > > #endif
> > > - }
> > >=20
> > > #ifdef CONFIG_X86
> > > if ( pv_shim && pv_console )
> > > consoled_guest_tx(c);
> > > #endif
> > > +
> > > + if ( rc )
> > > + guest_printk(d, XENLOG_G_WARNING
> > > + "failed to process console input: %d\n", rc);
> >=20
> > Wouldn't this better live ahead of the four shim related lines?
> >=20
> > Also please correct the log level specifier here. I realize you only mo=
ve
> > what was there before, but I consider i bad practice to move buggy code=
.
> > gprintk() already prepends XENLOG_GUEST, so instead of XENLOG_G_WARNING
> > is should just be XENLOG_WARNING. (Line wrapping is also odd here, at
> > least according to my taste. But since that's not written down anywhere=
,
> > I wouldn't insist on adjusting that as well.)
> >=20
> > With both adjustments (provided you agree, of course)
> > Reviewed-by: Jan Beulich jbeulich@suse.com
> > Given they're reasonably simple to make, I could once again offer to
> > adjust while committing (provided an Arm ack also arrives).
>=20
>=20
> Acked-by: Stefano Stabellini sstabellini@kernel.org

Thank you!

