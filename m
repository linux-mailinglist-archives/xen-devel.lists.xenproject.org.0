Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A909ECC2B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 13:38:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854761.1267885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLLyl-0006Su-5s; Wed, 11 Dec 2024 12:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854761.1267885; Wed, 11 Dec 2024 12:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLLyl-0006RB-39; Wed, 11 Dec 2024 12:38:11 +0000
Received: by outflank-mailman (input) for mailman id 854761;
 Wed, 11 Dec 2024 12:38:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YxMG=TE=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1tLLyk-0006QZ-Ai
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 12:38:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5d643fd-b7bc-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 13:38:08 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 13F5F5C66F0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 12:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 402A2C4CEE3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 12:38:06 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-3022598e213so28209941fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 04:38:06 -0800 (PST)
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
X-Inumbo-ID: c5d643fd-b7bc-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733920686;
	bh=6A/dn3jhCarDUX1HaOcKFvjQuIdb9vSoHfumK815F90=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=q4DSz1GLCbO8+y0aP5+TQn+JjZKD3ctl3GQzExXHYIGHidHL7mAXgTvSucnbISs3A
	 uLFE4RwEqMyU3BH2GzAeSvtYS3n8goBVm08DdxqEhH2bf6HkTHTeiSe3DkrplF7F9z
	 CB4DlVQmKTKRyWVPwAomyA63vGwAa+y0GZ9oOZrz7WkCRVWKQS7JTib8/P6sEc4dtS
	 s82zbC5xFXIVoDQsiAZJZtjNmqcw71X+IQ2KFj77WCggvT5zhBz20C3QtKU/bjDmax
	 /blejr9s+lXe7vJEBZAI9JCOtkiwnOV8fiKXhEs+yGs+dfZcYWazx1LGfnTuPAYGp1
	 QCLHJY2AI5gHA==
X-Forwarded-Encrypted: i=1; AJvYcCUbd2GA2n3AZd3DJd7dzbsqVBUIOngY/zH0++N+ZfCL301WPHv5TNQwujFtkgWQxr5dgKlirW36ltM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywd8qf4SYVkDUa3ZuLfufDgVCmPsHtzdzNy/MI0vt/GNNa5r7dT
	xxwYRJ4ZJrJzOTgA7vxocsbn90Jwj1Z9MU9q6YLbOE8KtXgylV3FLwtnb6SDH6qm+dxil7yl2B8
	jEUmiKtgWxsgjKzpKY04R+KHfVbc=
X-Google-Smtp-Source: AGHT+IG209dne0Tl3T71dc7VTtvkNHUQ3p5KRJK5FqQ+uJfsXMe55P5rmszraCwAe9lOAQ+gFW57du1YR1C48KbWC1I=
X-Received: by 2002:a2e:bc25:0:b0:300:1aa5:4938 with SMTP id
 38308e7fff4ca-30240cfb89amr8571701fa.18.1733920684444; Wed, 11 Dec 2024
 04:38:04 -0800 (PST)
MIME-Version: 1.0
References: <Z1l6XbHP6BTTZSwr@mail-itl> <fe8db5b2-7524-49ea-ab8e-21f831dc009f@suse.com>
 <CAMj1kXHSiCo7FH0Mo-_R9HjxhthddPUZfgm5c8yj7vjGvgfTPg@mail.gmail.com> <Z1mF0UZPNLjYAJI7@mail-itl>
In-Reply-To: <Z1mF0UZPNLjYAJI7@mail-itl>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 11 Dec 2024 13:37:52 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFVd+2n1fRoOriwmAPH8yX22gSy7_m_1SVjtoG3r_=-Tw@mail.gmail.com>
Message-ID: <CAMj1kXFVd+2n1fRoOriwmAPH8yX22gSy7_m_1SVjtoG3r_=-Tw@mail.gmail.com>
Subject: Re: [REGRESSION] Linux 6.6.64 crashes when booting as PVH domU
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, 
	Jason Andryuk <jandryuk@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, regressions@lists.linux.dev, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(cc Greg)

On Wed, 11 Dec 2024 at 13:30, Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Wed, Dec 11, 2024 at 01:24:08PM +0100, Ard Biesheuvel wrote:
> > On Wed, 11 Dec 2024 at 12:53, J=C3=BCrgen Gro=C3=9F <jgross@suse.com> w=
rote:
> > >
> > > Jason, Ard,
> > >
> > > I guess there are some prereq patches missing in stable 6.6.y branch?
> > >
> > >
> > > Juergen
> > >
> > > On 11.12.24 12:41, Marek Marczykowski-G=C3=B3recki wrote:
> > > > Hi,
> > > >
> > > > With Linux 6.6.64 I get the following crash on domU boot:
> > > >
> > > > (XEN) d5v0 Triple fault - invoking HVM shutdown action 1
> > > > (XEN) *** Dumping Dom5 vcpu#0 state: ***
> > > > (XEN) ----[ Xen-4.19.0  x86_64  debug=3Dn  Tainted:  M     ]----
...
> > > >
> > > > Linux 6.6.63 works fine.
> > > >
> > > > Looking at the changes, I suspect one of those:
> > > >
> > > >      83d123e27623 x86/pvh: Call C code via the kernel virtual mappi=
ng
> > > >      f662b4a69e1d x86/pvh: Set phys_base when calling xen_prepare_p=
vh()
> > > >
> >
> > The second patch shouldn't have been backported. It is unnecessary,
> > given that in the old situation, the kernel image needs to be loaded
> > at a fixed address. And it assumes  that %rbp is set to the physical
> > load offset, but those patches were not backported.
>
> It has this tag:
>
>     Stable-dep-of: e8fbc0d9cab6 ("x86/pvh: Call C code via the kernel vir=
tual mapping")
>

That was added by the stable maintainers - someone grabbed a patch
from the middle of an unrelated series to make e8fbc0d9cab6 apply
without lexical conflicts.

> Does it mean neither of them should be backported?
>
> But then, the e8fbc0d9cab6 has "Fixes:" tag (pointing at very old
> commit).
>

If someone thinks e8fbc0d9cab6 should be backported, they should
rebase it onto v6.6.y, not backport random other patches until
git-apply stops complaining. And ideally, someone would build and boot
the result to check whether it works.

For now, it would be better to revert both.

