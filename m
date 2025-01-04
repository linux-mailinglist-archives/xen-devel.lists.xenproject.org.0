Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC00A01208
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 04:12:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865074.1276351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuai-0006cd-25; Sat, 04 Jan 2025 03:12:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865074.1276351; Sat, 04 Jan 2025 03:12:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuah-0006a1-Vk; Sat, 04 Jan 2025 03:12:43 +0000
Received: by outflank-mailman (input) for mailman id 865074;
 Sat, 04 Jan 2025 03:12:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTuag-0006HA-Om
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 03:12:42 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c221f18f-ca49-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 04:12:41 +0100 (CET)
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
X-Inumbo-ID: c221f18f-ca49-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=btgmlqzb4baivnx3wyeuej6bpe.protonmail; t=1735960360; x=1736219560;
	bh=dAFLcwW7G2P2kfaBwRkFuIoy8ZXnlGnuB5gxMkmN+Iw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=AfKnrYIeYvScpQmDGw41prjxFGD3+OpnZLHRf4NfoLFbvO1ITsrx9RBUS4+tocDCs
	 1eMSe/gCECFrJDechfSzCHQqMf3v3Q555nWg4mFL8AE/sV7ZtBUOF7TBTu9GtzVRZ4
	 7AzWshBcTfEelaXsJtUKC1OJIPQxBBHslNhEI5MPcfEXmYKUkwZ8G8UGpm7zC65Eur
	 +tUM0sDImYwrnRGRhkq6ykmAzSBu6Mj2braw94idyzuqHeXqKF9tKlxTKlc9vZLt1v
	 yqyLxtJmcyg+atGqERc7V7LMBgGxWlJR3DAHvdt2f2rTVorhWat/hIm17VKrRd09VZ
	 dHTyrHhINPnEQ==
Date: Sat, 04 Jan 2025 03:12:36 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: Jason Andryuk <jason.andryuk@amd.com>, dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 34/35] xen/console: enable console owners w/ emulated NS8250
Message-ID: <vxCKYk5B5GYFsMxpFSY4eE2gvUrxp0_7T4_z_YpwfuOHZQ4wnBJxEfDjrP_IKUSz9fQyKG9BCmO-V568UTnzSiF0OGzrCSeDpZAdYromYTg=@proton.me>
In-Reply-To: <9fbe795c-f580-4084-9ab4-dede708cd777@suse.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-34-e9aa923127eb@ford.com> <1b55c7eb-3e39-43d1-80d2-2d4caf6a0c76@amd.com> <9fbe795c-f580-4084-9ab4-dede708cd777@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: e0ccbc4846f3e492c9bc2bf13c7172af6462e607
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Tuesday, December 10th, 2024 at 11:38 PM, Jan Beulich <jbeulich@suse.com=
> wrote:

>
>
> On 10.12.2024 23:46, Jason Andryuk wrote:
>
> > On 2024-12-05 23:42, Denis Mukhin via B4 Relay wrote:
> >
> > > From: Denis Mukhin dmukhin@ford.com
> > >
> > > Enable console focus for domains w/ virtual NS8250.
> > >
> > > Code change allows to capture the output from the guest OS now and se=
nd it to
> > > the physical console device.
> > >
> > > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > > ---
> > > xen/drivers/char/console.c | 5 +++++
> > > 1 file changed, 5 insertions(+)
> > >
> > > diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> > > index a26daee9c4c4b1134d0ae3d105ffdb656340b6df..798dfdf3412a2feef35e7=
2946d6c59bee59a9251 100644
> > > --- a/xen/drivers/char/console.c
> > > +++ b/xen/drivers/char/console.c
> > > @@ -41,6 +41,9 @@
> > > #ifdef CONFIG_SBSA_VUART_CONSOLE
> > > #include <asm/vpl011.h>
> > > #endif
> > > +#if defined(CONFIG_HAS_VUART_NS8250)
> > > +#include <asm/hvm/vuart_ns8250.h>
> > > +#endif
> > >
> > > /* console: comma-separated list of console outputs. */
> > > static char __initdata opt_console[30] =3D OPT_CONSOLE_STR;
> > > @@ -627,6 +630,8 @@ static void handle_keypress_in_domain(struct doma=
in *d, char c)
> > > {
> > > #if defined(CONFIG_SBSA_VUART_CONSOLE)
> > > rc =3D vpl011_rx_char_xen(d, c);
> > > +#elif defined(CONFIG_HAS_VUART_NS8250)
> > > + rc =3D vuart_putchar(&d->arch.hvm.vuart, c);
> > > #endif
> >
> > I think it would be nicer to just use a single name and avoid ifdef-ery=
.
> > vuart_putchar() is generic and matches domain_has_vuart(), so that
> > seems good.
> >
> > You can then have a default stub that returns -ENODEV for when an
> > implementation is not built. (This goes along with Jan's suggestion of
> > a common, default domain_has_vuart().) Something like:
> >
> > #ifndef vuart_putchar
> > static inline int vuart_putchar(struct domain *d, char c) {
> > return -ENODEV;
> > }
> > #define vuart_putchar vuart_putchar
> > #endif
> >
> > and ARM can do:
> > #define vuart_putchar vpl011_rx_char_xen
> >
> > x86 would need to change its arguments, but that should be straight for=
ward.
>
>
> Actually, I don't even see a need for the stub:
>
> {
> #ifdef vuart_putchar
> rc =3D vuart_putchar(d, c);
> #endif
> }
>
> This way behavior won't change from what there is now, when vuart_putchar=
()
> isn't defined.

I solved it by adding some arch-independent code for "virtual UARTs" in v3,=
 which,
IMO, looks a cleaner solution.

>
> Jan



