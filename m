Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D0D9A0D99
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 17:05:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820101.1233602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t15aO-0000lu-SY; Wed, 16 Oct 2024 15:05:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820101.1233602; Wed, 16 Oct 2024 15:05:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t15aO-0000ir-PC; Wed, 16 Oct 2024 15:05:16 +0000
Received: by outflank-mailman (input) for mailman id 820101;
 Wed, 16 Oct 2024 15:05:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zOTK=RM=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t15aN-0000il-9i
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 15:05:15 +0000
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [2607:f8b0:4864:20::c32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b99adac-8bd0-11ef-a0be-8be0dac302b0;
 Wed, 16 Oct 2024 17:05:14 +0200 (CEST)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-5eb148f42a2so2916033eaf.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 08:05:14 -0700 (PDT)
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
X-Inumbo-ID: 0b99adac-8bd0-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729091113; x=1729695913; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Ik4JquTEynZE8a0heVCGuxaBC0VR8UNr+gq9i5P/iw=;
        b=OI1Fd0e6W7c8eHsX3Y6Ye1WFJCgeapmY29olXwhD5EYU9LEKyjYycn+8vXKDJ05nxA
         bF2rjUD2vzu30WfZAZ7qE4jSRoNLJlqIyrU+Rb/0QssqbLgsRE0qbyBIM80a+/w82HD7
         1xuZIkZEQEebZC1pHRf/G+PZ7PzwscgWzCz2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729091113; x=1729695913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Ik4JquTEynZE8a0heVCGuxaBC0VR8UNr+gq9i5P/iw=;
        b=gsEsYcFAzMi1qhf+dU67LNdrsenBH1uMQbaLhPmg8Edy/fA3Mxuw3DZJXbl7j9QgvF
         4w/JGqQz365WtoeSSgbtoFydR664augfkVsW9Seh2+9uz4fywsMv6CwXXfVPuHWElsCp
         y+SYSRVkcHFS0jVSlZ0KisaBUXqQbOLvL0EtGLdPCbEtNYS4t8qgRXmBLxaJE51X6sEf
         quq+o27I/vlky6d0ZLrfjI1t+xnL+wYzSTWd6TcbDTqvQVAGesd50vzg4tC7nG+aagYG
         zzNTdsL9wa6+ZCJsILNdxMGDk1VvtRWUmaRdFib5pBOiTFfw7hb+E4sxLasnSFOeFUPl
         2aDg==
X-Gm-Message-State: AOJu0YxMleBQUNal71cJNSdF5YqrN7hi1yr1bT2A71N57CXRxwwIqvUs
	+7Gw2w95BDQ9MafOLdTnaQy/SL5ws7N7diozuVbcKihqVWJUXKysupsTyMYCq3uqmOmuQYCHDuk
	uAm2ZLht/YQWkxifuW83h2uma6To9geyposUX8g==
X-Google-Smtp-Source: AGHT+IFCebBjXfqD4qCl9j1joxdrKK6lkwa3Weerd43yzMvAAivLYfHhUzBDBZ4dG0PZrae9qHuIdtE5tiPApE4xZ4k=
X-Received: by 2002:a05:6820:221d:b0:5e5:c517:4d88 with SMTP id
 006d021491bc7-5eb260ed21bmr8873436eaf.0.1729091112824; Wed, 16 Oct 2024
 08:05:12 -0700 (PDT)
MIME-Version: 1.0
References: <20241014085332.3254546-1-frediano.ziglio@cloud.com>
 <20241014085332.3254546-3-frediano.ziglio@cloud.com> <Zw05Tb8UvCQAIo+n@l14>
 <CACHz=ZiaSyr_6y=tniF6Kq7JcFjeoVse-dAX7TF3bsvL-r3jRg@mail.gmail.com>
 <Zw5zSURbpInM5oBY@l14> <CACHz=ZgN9qNygJWuWovpiU+MCGcJu9qaxaRT1VkkiHsYwbEN4A@mail.gmail.com>
 <Zw+it8oVVTrS62wx@l14>
In-Reply-To: <Zw+it8oVVTrS62wx@l14>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 16 Oct 2024 16:05:00 +0100
Message-ID: <CACHz=ZgD-Zf7_R+RWWO1o8qkZbEC0uPjmz2kMJ83qQ8jXmd2JA@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] x86/boot: create a C bundle for 32 bit boot code
 and use it
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 12:25=E2=80=AFPM Anthony PERARD
<anthony.perard@vates.tech> wrote:
>
> On Wed, Oct 16, 2024 at 09:33:32AM +0100, Frediano Ziglio wrote:
> > On Tue, Oct 15, 2024 at 2:51=E2=80=AFPM Anthony PERARD <anthony.perard@=
vates.tech> wrote:
> > > On Mon, Oct 14, 2024 at 05:32:26PM +0100, Frediano Ziglio wrote:
> > > > On Mon, Oct 14, 2024 at 4:31=E2=80=AFPM Anthony PERARD <anthony.per=
ard@vates.tech> wrote:
> > > > > On Mon, Oct 14, 2024 at 09:53:28AM +0100, Frediano Ziglio wrote:
>
> > > BTW, do we need the rules that generate the input of this rules
> > > (built_in_32.tmp.o that is), or can this one takes all 32bit objects =
as
> > > input?
> > >
> >
> > Better not to do it In some conditions it can generate slightly
> > different results (like different object alignments) making the
> > algorithm fail.
>
> Ok. Thanks for the explanation.
>
> > > > > > +# generate final object file combining and checking above bina=
ries
> > > > > > +$(obj)/built_in_32.S: $(obj)/built_in_32.other.bin $(obj)/buil=
t_in_32.final.bin
> > > > >
> > > > > So, "other" isn't part of "final", I don't really know what those=
 two
> > > > > things contains so naming wise I can't suggest anything useful.
> > >
> > > Instead of "other", is "control" (like in science experiment where yo=
u
> > > have a control group), or "offseted" (which seems to be how this seco=
nd
> > > binary is constructed) would be better names for this *.bin? It seems
> > > the script take both input and play the game of the 7 differences, to
> > > find clues about the location of some symbols, right?.
> > >
> >
> > I don't know the game and I think people not familiar with it won't
> > find new names more readable but less.
>
> Sorry, the "game" as nothing to do with the name I've proposed. I was
> just asking if the script take both *.bin and was looking for
> differences.
>
> (The game of 7 differences is simple: there's two similar pictures and
> you just look for the 7 differences between them, that's it.)
>
> > Not saying that current names are good, they just need to be located
> > at different addresses with some "magic" in the middle.
>
> Well to me "other" evoke a binary that contains functions that are not
> in "final", but instead they both contain the sames functions with
> slight variation of placement in the file (with added offset, gap), as I
> understand. But if you don't like my proposal, so be it.
>

What about "base" and "offsetted" ? I don't know why "offsetted"
sounds weird to me but I didn't find anything better. I hope some
native English speaker could come with a better proposal.

> > > I can think of one example where $(if_changed,) is going to really he=
lp,
> > > by looking at this command line:
> > >     One does update the .c file to add a function that they like to
> > >     export, run `make`, realize they forgot to update the makefile so
> > >     update it, run `make`, it's still doesn't work...
> > >     Maybe run `make clean; make`, or something else...
> > >
> > > So, could you use $(if_changed,) ?
> > > Probably:
> > > quiet_cmd_combine =3D GEN     $@
> > > cmd_combine =3D $(PYTHON) ...
> > > $(obj)/built_in_32.S: $(obj)/built_in_32.other.bin $(obj)/built_in_32=
.final.bin FORCE
> > >     $(call if_changes,combine)
> > > targets +=3D built_in_32.S
> > >
> > > GEN, for generate, or it could be PY instead, because python script c=
an
> > > be slow to compile which could explain why the build system output is
> > > making a pause on this target (on slow machines that is). Or it could=
 be
> > > COMBINE, or something else, but it's not really necessary to explain,
> > > the target name is often enough to figure out what's happening, when
> > > needed.
> > >
> >
> > It just looks more complicated to me.
>
> I'm sorry if writing makefile is complicated. GNU make doesn't help with
> writing build system that work well, especially when doing incremental
> builds. So we need to use more complicated construction, especially for
> a complex project like Xen.
>

It was more a balance consideration. Considering the cases that seem
to solve (and your case did not much apply) I don't feel that worth.
Also, dependency to Makefile would solve without additional macros and
indirection. Do you mind posting a full working change?

Frediano

