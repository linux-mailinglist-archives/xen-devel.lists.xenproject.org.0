Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8378AAD4737
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 02:10:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011261.1389644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP92r-0001EG-BJ; Wed, 11 Jun 2025 00:10:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011261.1389644; Wed, 11 Jun 2025 00:10:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP92r-0001Cp-8e; Wed, 11 Jun 2025 00:10:21 +0000
Received: by outflank-mailman (input) for mailman id 1011261;
 Wed, 11 Jun 2025 00:10:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SK+0=Y2=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uP92p-0001Cj-Rt
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 00:10:19 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 749b7ab8-4658-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 02:10:17 +0200 (CEST)
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
X-Inumbo-ID: 749b7ab8-4658-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749600616; x=1749859816;
	bh=4k2/rtVBqWmO8ALzV5sZST8mlZxcVLEGjugepK8Ge4M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=C06D2xadvXe5qZEzy79s8CIvi/UooHQPllD5H0XEB+aeHESuzTY7XhGqrF6JYw8uk
	 ggWXEvDPCG97QzqcIm75VSm5tuF0Hb9r56+IUY8ydCnZfQlBLpZN1cTzw1FAsHjty4
	 /174Ki2h8tJPSGNV5cfOyWCPF/h3xzKYCnTgw5L5n8mNHp7ExeyfhYN/gMBEVe9QMY
	 ecAVZSg/bisAQpUlmmTRMvg7NojVAXJRfLO0X1K3wA4sKUaKeXmdszOe+cu4WizGtp
	 B5GSaRycYMfz4T5GgLgUQ+y2KarfLYsk6qowWeq96DWpJFOy7zB40gNivlmfjqZftj
	 LSo52c3LofZAQ==
Date: Wed, 11 Jun 2025 00:10:11 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 2/2] xen/console: unify printout behavior for UART emulators
Message-ID: <aEjJXH36f48kul+4@kraken>
In-Reply-To: <8585aaa1-65fc-44cf-822b-d69429d81020@suse.com>
References: <20250531000417.81750-1-dmukhin@ford.com> <20250531000417.81750-3-dmukhin@ford.com> <71318dd2-0724-4c2a-9786-40b676411e56@suse.com> <aEDrcJ9JE3p6Xj7Q@kraken> <8585aaa1-65fc-44cf-822b-d69429d81020@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 5f9b343467aaed7604d63be29835ad90f693172f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 05, 2025 at 08:15:15AM +0200, Jan Beulich wrote:
> On 05.06.2025 02:57, dmkhn@proton.me wrote:
> > On Wed, Jun 04, 2025 at 12:48:05PM +0200, Jan Beulich wrote:
> >> On 31.05.2025 02:04, dmkhn@proton.me wrote:
> >>> --- a/xen/arch/x86/hvm/hvm.c
> >>> +++ b/xen/arch/x86/hvm/hvm.c
> >>> @@ -577,7 +577,7 @@ static int cf_check hvm_print_line(
> >>>      if ( (cd->pbuf_idx =3D=3D (DOMAIN_PBUF_SIZE - 1)) || (c =3D=3D '=
\n') )
> >>>      {
> >>>          cd->pbuf[cd->pbuf_idx] =3D '\0';
> >>> -        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cd->pbuf);
> >>> +        guest_printk(cd, "%s\n", cd->pbuf);
> >>>          cd->pbuf_idx =3D 0;
> >>>      }
> >>
> >> Why this and ...
> >>
> >>> @@ -755,7 +765,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_=
PARAM(char) buffer,
> >>>              else
> >>>              {
> >>>                  cd->pbuf[cd->pbuf_idx] =3D '\0';
> >>> -                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cd->pbuf, =
kbuf);
> >>> +                guest_printk(cd, "%s%s\n", cd->pbuf, kbuf);
> >>>                  cd->pbuf_idx =3D 0;
> >>>              }
> >>
> >> ... this change? There's no compensation for it ...
> >>
> >>> @@ -1013,12 +1023,21 @@ void printk(const char *fmt, ...)
> >>>      va_end(args);
> >>>  }
> >>>
> >>> +/*
> >>> + * Print message from the guest on the diagnostic console.
> >>> + * Prefixes all messages w/ "(dX)" if domain X does not own physical=
 console
> >>> + * focus.
> >>> + */
> >>>  void guest_printk(const struct domain *d, const char *fmt, ...)
> >>>  {
> >>>      va_list args;
> >>> -    char prefix[16];
> >>> +    char prefix[16] =3D "";
> >>> +    struct domain *consd;
> >>>
> >>> -    snprintf(prefix, sizeof(prefix), "(d%d) ", d->domain_id);
> >>> +    consd =3D console_get_domain();
> >>> +    if ( consd !=3D d )
> >>> +        snprintf(prefix, sizeof(prefix), "(d%d) ", d->domain_id);
> >>> +    console_put_domain(consd);
> >>>
> >>>      va_start(args, fmt);
> >>>      vprintk_common(fmt, args, prefix);
> >>
> >> ... here afaics, so it looks like you're undermining rate-limiting of
> >> those messages.
> >
> > I droppped behavior change for I/O debug port on x86 and HYPERVISOR_con=
sole_io
> > hypercall.
> >
> > But my understanding is that all guest debugging facilities, if enabled=
, should
> > not be rate-limited.
>=20
> I certainly disagree there. How much rate limiting to apply to guest outp=
ut is a
> matter of the guest_loglvl=3D command line option. Its default settings a=
re the way
> they are for a reason.

Oh, I see!
Thanks for clarification!

>=20
> Jan
>=20


