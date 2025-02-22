Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A2EA40512
	for <lists+xen-devel@lfdr.de>; Sat, 22 Feb 2025 03:18:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894753.1303469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlf4n-00073B-L4; Sat, 22 Feb 2025 02:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894753.1303469; Sat, 22 Feb 2025 02:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlf4n-0006zm-IQ; Sat, 22 Feb 2025 02:17:09 +0000
Received: by outflank-mailman (input) for mailman id 894753;
 Sat, 22 Feb 2025 02:17:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V16X=VN=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tlf4k-0006zd-Pk
 for xen-devel@lists.xenproject.org; Sat, 22 Feb 2025 02:17:08 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b01e822-f0c3-11ef-9aab-95dc52dad729;
 Sat, 22 Feb 2025 03:17:03 +0100 (CET)
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
X-Inumbo-ID: 1b01e822-f0c3-11ef-9aab-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1740190622; x=1740449822;
	bh=1Nsdt6vhlRKlbmChImfBsKmxTUIofhFvsJwz/8Lygsw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Ow1wb/y2INSDvTHMX2uCjv4n5YNmV29QFR9MkRCvpQYW1UVHCokawnomg7PZfQZE4
	 8K7eLTiywchuVjOrMhwQpiLlH/VzsMZt+IUy3QhRJGTIS/LN6EYqP2qxnM5R9HPDCx
	 xU4Krdmhp+m97yqghr+HxSggtFl0mkqP24n5qIBmNNSiGr+G5oYUSMnbu9S3Ddfiab
	 Dcgn5Gg5N/sr2GMeBCdeq748L7nZxVd3POYNFhyeWEYO/mXUR7z0caZ++1+hxlFYCu
	 lzmTJ1vLBt6VlZMNiFMaKJNuQYM6zXSb0TAnOJJISZ3b8erM3s9ERNCkuo3KWwKL0s
	 PH5IZLktr5y/w==
Date: Sat, 22 Feb 2025 02:16:56 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/console: introduce console_{get,put}_domain()
Message-ID: <YtrkmGki0COOOUR9vS2hLGSvW8F1mJa6baK9kHYeodaVVzjasEh5d7mWsZpyuSfWVHj4xnZ6ZKtfuT8t9LEeJnpoIFKIZDarDFFsI_b2hqI=@proton.me>
In-Reply-To: <2238f00f-b5b4-4382-9045-09dc6b7cee6b@suse.com>
References: <20250218083048.596012-1-dmkhn@proton.me> <2238f00f-b5b4-4382-9045-09dc6b7cee6b@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 8e1881864b35076a2468f637f2d00fe3521c1bf6
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wednesday, February 19th, 2025 at 5:52 AM, Jan Beulich <jbeulich@suse.co=
m> wrote:

>=20
>=20
> On 18.02.2025 09:31, dmkhn@proton.me wrote:
>=20
> > @@ -546,31 +555,23 @@ static void __serial_rx(char c)
> > * getting stuck.
> > */
> > send_global_virq(VIRQ_CONSOLE);
> > - break;
> > -
> > + }
> > #ifdef CONFIG_SBSA_VUART_CONSOLE
> > - default:
> > - {
> > - struct domain d =3D rcu_lock_domain_by_id(console_rx - 1);
> > -
> > - if ( d )
> > - {
> > - int rc =3D vpl011_rx_char_xen(d, c);
> > - if ( rc )
> > - guest_printk(d, XENLOG_G_WARNING
> > - "failed to process console input: %d\n", rc);
> > - rcu_unlock_domain(d);
> > - }
> > -
> > - break;
> > - }
> > + else
> > + / Deliver input to the emulated UART. */
> > + rc =3D vpl011_rx_char_xen(d, c);
> > #endif
> > - }
> >=20
> > #ifdef CONFIG_X86
> > if ( pv_shim && pv_console )
> > consoled_guest_tx(c);
> > #endif
> > +
> > + if ( rc )
> > + guest_printk(d, XENLOG_G_WARNING
> > + "failed to process console input: %d\n", rc);
>=20
>=20
> Wouldn't this better live ahead of the four shim related lines?
>=20
> Also please correct the log level specifier here. I realize you only move
> what was there before, but I consider i bad practice to move buggy code.
> gprintk() already prepends XENLOG_GUEST, so instead of XENLOG_G_WARNING
> is should just be XENLOG_WARNING. (Line wrapping is also odd here, at
> least according to my taste. But since that's not written down anywhere,
> I wouldn't insist on adjusting that as well.)
>=20
> With both adjustments (provided you agree, of course)

Thanks a lot for help and review!

> Reviewed-by: Jan Beulich jbeulich@suse.com
>=20
> Given they're reasonably simple to make, I could once again offer to
> adjust while committing (provided an Arm ack also arrives).
>=20
> Jan

