Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5983A01203
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 04:09:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865045.1276322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuX4-0003Ln-2j; Sat, 04 Jan 2025 03:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865045.1276322; Sat, 04 Jan 2025 03:08:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuX3-0003JR-Vj; Sat, 04 Jan 2025 03:08:57 +0000
Received: by outflank-mailman (input) for mailman id 865045;
 Sat, 04 Jan 2025 03:08:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTuX2-0003JC-0R
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 03:08:56 +0000
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3afbe7e0-ca49-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 04:08:54 +0100 (CET)
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
X-Inumbo-ID: 3afbe7e0-ca49-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735960133; x=1736219333;
	bh=IA9U2t+VkT9DYeTlIFJe3qSW2L52y3P/FN4ATfk6UWI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=JGxh6sn/gZiwHqa5ABTHT5KnpH6R+jjsYncMTkpBVcDhmkJUm+JOykW6H5zOIaLb1
	 RHlAwGX12QgHd1g5l+iyLix+CYOCrvwC9LTGSskCgyWPoLTncXHuSicEGUJnDh8O1S
	 l7JoH0lkXVHQUlLkUcAe3i57z8OdX7+47A42kRtOes6fjSYpPb9c/fm0JgtxCHrozr
	 qKNIUJpq9os/3pxDn3R2xVgvIHfVXiFPNP3uAcK6Z+p7o0wsq/nz3b0U23xKufQmp5
	 o047vdv1CxjRewACJH15MTzeZ9yG+La001+Ob8lCGEONjKVKwnHCj9gQZEJj67ZVv+
	 /MYSdrIW07eXw==
Date: Sat, 04 Jan 2025 03:08:47 +0000
To: Jason Andryuk <jason.andryuk@amd.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 34/35] xen/console: enable console owners w/ emulated NS8250
Message-ID: <2uZS3QjicwLbB66ako72z5LY6tjKh61sLtGHXFt5t9kx9oSH82sCl5Xzv1MrvqXu7sHefhodIM-MAh-ue_mfwe7YQZcleh8qCN3M4_rVHE0=@proton.me>
In-Reply-To: <1b55c7eb-3e39-43d1-80d2-2d4caf6a0c76@amd.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-34-e9aa923127eb@ford.com> <1b55c7eb-3e39-43d1-80d2-2d4caf6a0c76@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: ee7f8bd31dcf0ddde8d44a71ae8230d6c3262657
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Tuesday, December 10th, 2024 at 2:46 PM, Jason Andryuk <jason.andryuk@am=
d.com> wrote:

>
>
> On 2024-12-05 23:42, Denis Mukhin via B4 Relay wrote:
>
> > From: Denis Mukhin dmukhin@ford.com
> >
> > Enable console focus for domains w/ virtual NS8250.
> >
> > Code change allows to capture the output from the guest OS now and send=
 it to
> > the physical console device.
> >
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > ---
> > xen/drivers/char/console.c | 5 +++++
> > 1 file changed, 5 insertions(+)
> >
> > diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> > index a26daee9c4c4b1134d0ae3d105ffdb656340b6df..798dfdf3412a2feef35e729=
46d6c59bee59a9251 100644
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -41,6 +41,9 @@
> > #ifdef CONFIG_SBSA_VUART_CONSOLE
> > #include <asm/vpl011.h>
> > #endif
> > +#if defined(CONFIG_HAS_VUART_NS8250)
> > +#include <asm/hvm/vuart_ns8250.h>
> > +#endif
> >
> > /* console: comma-separated list of console outputs. */
> > static char __initdata opt_console[30] =3D OPT_CONSOLE_STR;
> > @@ -627,6 +630,8 @@ static void handle_keypress_in_domain(struct domain=
 *d, char c)
> > {
> > #if defined(CONFIG_SBSA_VUART_CONSOLE)
> > rc =3D vpl011_rx_char_xen(d, c);
> > +#elif defined(CONFIG_HAS_VUART_NS8250)
> > + rc =3D vuart_putchar(&d->arch.hvm.vuart, c);
> > #endif
>
>
> I think it would be nicer to just use a single name and avoid ifdef-ery.
> vuart_putchar() is generic and matches domain_has_vuart(), so that
> seems good.
>
> You can then have a default stub that returns -ENODEV for when an
> implementation is not built. (This goes along with Jan's suggestion of
> a common, default domain_has_vuart().) Something like:
>
> #ifndef vuart_putchar
> static inline int vuart_putchar(struct domain *d, char c) {
> return -ENODEV;
> }
> #define vuart_putchar vuart_putchar
> #endif
>
> and ARM can do:
> #define vuart_putchar vpl011_rx_char_xen
>
> x86 would need to change its arguments, but that should be straight forwa=
rd.
>
> What do you think?

I think this is a good suggestion, I had same plans for this code, TBH.
I only planned to do that later, but now addressed in v3.
I solved it by adding arch-independent virtdev-uart.c shim, each vUART
implementation should register itself in this shim.

Fixed.

>
> Regards,
> Jason



