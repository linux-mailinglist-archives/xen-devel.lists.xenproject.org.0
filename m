Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F58A011F4
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 03:47:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864957.1276222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuC5-0001dX-IS; Sat, 04 Jan 2025 02:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864957.1276222; Sat, 04 Jan 2025 02:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuC5-0001bE-FZ; Sat, 04 Jan 2025 02:47:17 +0000
Received: by outflank-mailman (input) for mailman id 864957;
 Sat, 04 Jan 2025 02:47:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTuC3-0001b8-0x
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 02:47:16 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33816763-ca46-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 03:47:13 +0100 (CET)
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
X-Inumbo-ID: 33816763-ca46-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735958832; x=1736218032;
	bh=v0dZXYl3I8TdMVIKNgDz74hwFkHaf02jvjOPF4zphk0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=EKwYgyBc3Cum37TJevh+FBjldyBUu4OrXeWmdkMD9F59vzU2HIcS7FUmzuQzghVNh
	 Kzq8L8VpTo4Aghbgb0Y3MqfKBlH2FgV5cCF8mop2kB5WrB4KGRFmD4SusZpS4FJl7X
	 9BEALHEXHvuu66yPOOXu+0pHCvO94KUFiuwV3BhPWGRMxotfHvzj+teiCg3tHE8QZ5
	 wZDouBxs6HtyybQlINROUPiBiR/jraJbEENg9RO4uAj2zPAhrsslIy4PLLnyHhiQx0
	 SDfe5OvaxFbKnyMGMShRHDr/l0w/PQD8EX1TmrUwohRvdNJNcaheDx3XELYgzbHlfF
	 BLwEhcUVPd7lg==
Date: Sat, 04 Jan 2025 02:47:08 +0000
To: oleksii.kurochko@gmail.com
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 09/36] riscv/domain: introduce domain_has_vuart()
Message-ID: <eI9HkQxhCvgWZi_5mg7CqB3OZuwbBaPRvpzmgYemCVuUrNoIIlzMyg3hHGF3XDDPiQvOxw2_M2fsDgIO_wd6KNQFRe3grJYTUjc6LJ3m8gE=@proton.me>
In-Reply-To: <YlPh-dsRQR3lCD7Xxdhp1kfF24QMKuu8nCzvXkDQAClIhEHlmLvwSxIMLjX6pPpQ_Nup0UJsD4TmPPSUzJUk3wSmsXx2IsZMzxNiqEJJT70=@proton.me>
References: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com> <20241126-vuart-ns8250-v1-v1-9-87b9a8375b7a@ford.com> <bc3136303d0e88017a5e3da21f97f9da28213acf.camel@gmail.com> <YlPh-dsRQR3lCD7Xxdhp1kfF24QMKuu8nCzvXkDQAClIhEHlmLvwSxIMLjX6pPpQ_Nup0UJsD4TmPPSUzJUk3wSmsXx2IsZMzxNiqEJJT70=@proton.me>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 70c6f9aff06a10cde2bb7c4739230a63222d2878
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Friday, December 6th, 2024 at 1:32 PM, Denis Mukhin <dmkhn@proton.me> wr=
ote:

>=20
>=20
>=20
> On Wednesday, November 27th, 2024 at 5:02 AM, oleksii.kurochko@gmail.com =
oleksii.kurochko@gmail.com wrote:
>=20
> > On Tue, 2024-11-26 at 15:21 -0800, Denis Mukhin via B4 Relay wrote:
> >=20
> > > From: Denis Mukhin dmukhin@ford.com
> > >=20
> > > Introduce domain_has_vuart() for RISC-V port to be used in the
> > > console driver.
> > >=20
> > > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > > ---
> > > xen/arch/riscv/include/asm/domain.h | 2 ++
> > > 1 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/xen/arch/riscv/include/asm/domain.h
> > > b/xen/arch/riscv/include/asm/domain.h
> > > index
> > > c3d965a559b6ce3661bf17166d0c51853ff295a2..efbc4f1ea2619a187fe30ede17d
> > > 96de01e599220 100644
> > > --- a/xen/arch/riscv/include/asm/domain.h
> > > +++ b/xen/arch/riscv/include/asm/domain.h
> > > @@ -10,6 +10,8 @@ struct hvm_domain
> > > uint64_t params[HVM_NR_PARAMS];
> > > };
> > >=20
> > > +#define domain_has_vuart(d) false
> > > +
> > > struct arch_vcpu_io {
> > > };
> >=20
> > LGTM: Reviewed-by: Oleksii Kurochko oleksii.kurochko@gmail.com
>=20
>=20
> Thanks!
>=20
> > Probably it would be nice instead of having stub ( #define
> > domain_has_vuart(d) false ) in arch specific code, just ifdef-ing it
> > and put somewhere in
> > <xen/domain.h> to not introduce this definition for each architecture
> >=20
> > which doesn't support vuart now.
>=20
>=20
> Actually, my thought was adding arch-independent vuart layer which can
> call into vpl011, duart or ns8250.
> This way, domain_has_vuart() will move there, along w/ APIs which
> hooked into Xen console driver (e.g. ns8250's vuart_putchar()) will be
> all there as well.
> I kept this stub as is for now (in the follow on v2).

I ended up w/ domain_has_vuart() defined in xen/domain.h in v3:
   https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-6-c5d36b31=
d66c@ford.com/

>=20
> > Thanks.
> >=20
> > ~ Oleksii

