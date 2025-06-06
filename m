Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD70BACFD3D
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 09:06:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007981.1387182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNRAD-0004YW-65; Fri, 06 Jun 2025 07:06:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007981.1387182; Fri, 06 Jun 2025 07:06:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNRAD-0004Wc-3Q; Fri, 06 Jun 2025 07:06:53 +0000
Received: by outflank-mailman (input) for mailman id 1007981;
 Fri, 06 Jun 2025 07:06:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fxa/=YV=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uNRAB-0004WO-Ls
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 07:06:51 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0bde79e-42a4-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 09:06:49 +0200 (CEST)
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
X-Inumbo-ID: d0bde79e-42a4-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749193608; x=1749452808;
	bh=F9GJcWMma2EoiodwWTOaBiwQYbZpsYFPaJI18LDuaNA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=NiGJyfwfh8+lNcFjkou755Sj6KzFT131Q9F/iBKniO8gxDfc2OiTv+tDOJNOUZGm8
	 6SpMvKZJGVQ0pJtghn4xnLcj30bc8v/S9hz4aZpABqgJq+FMLGqORemh/61gO0BBkm
	 BFzTqSfpQBB+ujJdg+6+RQucIwDbSvhdnLa/pHHcZMjUO1AI90MqhZM+rHc3jeDhwu
	 3GHaOlibKW0aIICljRxEJnNLGvJZO0l+uNV4Cf2vbIbVeWBi8plw+78j7J4shsPR4S
	 63s+ORYrGYh9jrfZUML8WNIUZhNK4auixT57DY0RMHRbcZVuhkqULlQObY/oXGx9jj
	 Zv3FpMM8ZQuZg==
Date: Fri, 06 Jun 2025 07:06:44 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v2 2/2] xen/console: unify printout behavior for UART emulators
Message-ID: <aEKTfxwSZwE78mr5@kraken>
In-Reply-To: <842528df-d0ba-4ab2-b182-b6f824c82dc1@suse.com>
References: <20250605004601.1142090-1-dmukhin@ford.com> <20250605004601.1142090-3-dmukhin@ford.com> <842528df-d0ba-4ab2-b182-b6f824c82dc1@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 350579f0741ba047922ec9ffb663dccc7066337b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 05, 2025 at 08:18:34AM +0200, Jan Beulich wrote:
> On 05.06.2025 02:46, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > If virtual UART from domain X prints on the physical console, the behav=
ior is
> > updated to (see [1]):
> > - console focus in domain X: do not prefix messages;
> > - no console focus in domain X: prefix all messages with "(dX)".
> >
> > Use guest_printk() without rate-limiting in all current in-hypervisor U=
ART
> > emulators. That aligns the behavior with debug I/O port 0xe9 handler on=
 x86 and
> > slightly improves the logging since guest_printk() already prints the d=
omain
> > ID. guest_printk() was modified to account for console focus ownership.
> >
> > Modify guest_console_write() for hardware domain case by adding domain =
ID to
> > the message when hwdom does not have console focus.
> >
> > [1] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2412121655360=
.463523@ubuntu-linux-20-04-desktop/
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v1:
> > - dropped change for debug port and for HYPERVISOR_console_io hypercall
>=20
> Yet then what about ...
>=20
> > --- a/xen/arch/arm/vuart.c
> > +++ b/xen/arch/arm/vuart.c
> > @@ -89,7 +89,7 @@ static void vuart_print_char(struct vcpu *v, char c)
> >          if ( c !=3D '\n' )
> >              uart->buf[uart->idx++] =3D '\n';
> >          uart->buf[uart->idx] =3D '\0';
> > -        printk(XENLOG_G_DEBUG "DOM%u: %s", d->domain_id, uart->buf);
> > +        guest_printk(d, "%s", uart->buf);
> >          uart->idx =3D 0;
> >      }
> >      spin_unlock(&uart->lock);
>=20
> ... this dropping of XENLOG_G_DEBUG? In fact I'd have expected such to
> be _added_ where presently missing.

vUART is a debugging facility. This flavor of UART is specifically for gues=
t OS
early boot debugging.
I think it is not desirable to potentially lose guest messages while doing =
such
early guest OS boot debugging.

>=20
> Jan


