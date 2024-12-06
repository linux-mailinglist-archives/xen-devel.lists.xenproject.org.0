Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D599E7EA1
	for <lists+xen-devel@lfdr.de>; Sat,  7 Dec 2024 08:05:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.850520.1264956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJorL-0003Mu-Dr; Sat, 07 Dec 2024 07:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 850520.1264956; Sat, 07 Dec 2024 07:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJorL-0003Kt-9o; Sat, 07 Dec 2024 07:04:11 +0000
Received: by outflank-mailman (input) for mailman id 850520;
 Fri, 06 Dec 2024 21:33:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gq+l=S7=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tJfwi-0003so-Sm
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 21:33:10 +0000
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id addd39ff-b419-11ef-99a3-01e77a169b0f;
 Fri, 06 Dec 2024 22:33:06 +0100 (CET)
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
X-Inumbo-ID: addd39ff-b419-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=kachd45jjna2bfmskmv7qgdoua.protonmail; t=1733520784; x=1733779984;
	bh=a28murfzlss628d/kTMfKQcWna9mVpTv8n6pyLK5+sU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=OgHA6cn9+BTQmnZOw2/b7ZRNDyVf48ruoWTAupf81rdOPY8TJXotiml5R5xCm0cUE
	 4GC+EuHHs1GYDpPSRrCRGBSszt+Wqjx5CVr2oMM1wCUT6dYoQqG2FFFPixqarOZxNN
	 TjgSkouMmbZdghTCzcgSpRtJC+FJRbToBozZDLQBFa7Y96bP0YW28gVjAsO0YYomXX
	 npPIrFFtjZtyKCZKv5aZlepHQmFXnIjK9zZYPpxF7q/yvrnHi9m8LUjGXwslO9QJnC
	 xGvIuPyg0IxOGIRU8wuuFu9bE3coynf0zupVI4IQqlEpIIx0jtBSkD9qbT1Su/GYSd
	 wpgR4EozR3icg==
Date: Fri, 06 Dec 2024 21:32:57 +0000
To: oleksii.kurochko@gmail.com
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Rahul Singh <rahul.singh@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Shawn Anastasio <sanastasio@raptorengineering.com>, Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 09/36] riscv/domain: introduce domain_has_vuart()
Message-ID: <YlPh-dsRQR3lCD7Xxdhp1kfF24QMKuu8nCzvXkDQAClIhEHlmLvwSxIMLjX6pPpQ_Nup0UJsD4TmPPSUzJUk3wSmsXx2IsZMzxNiqEJJT70=@proton.me>
In-Reply-To: <bc3136303d0e88017a5e3da21f97f9da28213acf.camel@gmail.com>
References: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com> <20241126-vuart-ns8250-v1-v1-9-87b9a8375b7a@ford.com> <bc3136303d0e88017a5e3da21f97f9da28213acf.camel@gmail.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: b049a544b06de699c41cef9d7477863568cdd764
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Wednesday, November 27th, 2024 at 5:02 AM, oleksii.kurochko@gmail.com <o=
leksii.kurochko@gmail.com> wrote:

>=20
>=20
> On Tue, 2024-11-26 at 15:21 -0800, Denis Mukhin via B4 Relay wrote:
>=20
> > From: Denis Mukhin dmukhin@ford.com
> >=20
> > Introduce domain_has_vuart() for RISC-V port to be used in the
> > console driver.
> >=20
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > ---
> > xen/arch/riscv/include/asm/domain.h | 2 ++
> > 1 file changed, 2 insertions(+)
> >=20
> > diff --git a/xen/arch/riscv/include/asm/domain.h
> > b/xen/arch/riscv/include/asm/domain.h
> > index
> > c3d965a559b6ce3661bf17166d0c51853ff295a2..efbc4f1ea2619a187fe30ede17d
> > 96de01e599220 100644
> > --- a/xen/arch/riscv/include/asm/domain.h
> > +++ b/xen/arch/riscv/include/asm/domain.h
> > @@ -10,6 +10,8 @@ struct hvm_domain
> > uint64_t params[HVM_NR_PARAMS];
> > };
> >=20
> > +#define domain_has_vuart(d) false
> > +
> > struct arch_vcpu_io {
> > };
>=20
>=20
> LGTM: Reviewed-by: Oleksii Kurochko oleksii.kurochko@gmail.com

Thanks!

>=20
>=20
> Probably it would be nice instead of having stub ( #define
> domain_has_vuart(d) false ) in arch specific code, just ifdef-ing it
> and put somewhere in
> <xen/domain.h> to not introduce this definition for each architecture
>=20
> which doesn't support vuart now.

Actually, my thought was adding arch-independent vuart layer which can
call into vpl011, duart or ns8250.
This way, domain_has_vuart() will move there, along w/ APIs which
hooked into Xen console driver (e.g. ns8250's vuart_putchar()) will be
all there as well.
I kept this stub as is for now (in the follow on v2).

>=20
> Thanks.
>=20
> ~ Oleksii



