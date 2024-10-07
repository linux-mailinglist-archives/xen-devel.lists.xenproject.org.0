Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D00D19926C3
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 10:16:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811705.1224388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxiuJ-0007Oh-9W; Mon, 07 Oct 2024 08:15:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811705.1224388; Mon, 07 Oct 2024 08:15:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxiuJ-0007MX-6u; Mon, 07 Oct 2024 08:15:55 +0000
Received: by outflank-mailman (input) for mailman id 811705;
 Mon, 07 Oct 2024 08:15:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWQm=RD=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sxiuH-0007MR-TB
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 08:15:53 +0000
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [2607:f8b0:4864:20::c2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e1e7cd1-8484-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 10:15:52 +0200 (CEST)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-5e7e14594f9so920970eaf.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 01:15:52 -0700 (PDT)
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
X-Inumbo-ID: 5e1e7cd1-8484-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728288951; x=1728893751; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNfOtc0USAVbZN8avUG0QPZqNqvwgdiET3BO2LfJ9fo=;
        b=jgI1klxDBvtDMM3+/3u8qboAsYKO3+XWet3gW9KEXK8PYze/q/pdsgM1jZIBjsvtxZ
         faS2rgmymQrCvQ/lfQ1w33jl+8tPl/X+lZ5eVzNEYhHk+ZbZBUojApIisDKLYXrzkrK0
         VkmvR81AiJ5pOhz9b6qUrLKLeUw9YirLm+3pU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728288951; x=1728893751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNfOtc0USAVbZN8avUG0QPZqNqvwgdiET3BO2LfJ9fo=;
        b=e6lM6v5I9Y6u5SMO7suonU27QX4NW7LQTmMJPVvHFskMseUp58EayZKMuoWZ3j0T7q
         TqC5OZ0UBDvGmdQ1agmkwF5Gddov2Qy6YJYr2TT5oAKh10XIMOqvyOxQlmV0Uiol326t
         2IjLQIT8wlPONDG2rSwrne4S826NRUtbbj00v0BPIQHG/x3vnJ9BwIXFWQW+ek/kge1d
         04jwCFVs7Wf0pf6AUSZ01KorE1op5QMI/srplaY15M2EG2i7gyOJasl3PNly8hoOyH+g
         mU2Ew6LohLX4Im7zyql9wWO/68P2Mxc93fycB/xzfaJ+e9uUpSTXsCH7o/pMeC1hylRT
         bL6A==
X-Forwarded-Encrypted: i=1; AJvYcCXFdmAHHvsNX+imYmUSKIjWPXApBhw0veEz9sUJv4QVVhqyEQ+hCdKnAVaBvyrbq9p+p6jsZslJKqg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygZpQpN0tD3/83CQa15QB1+Ubxt6qETfLxmIdnhZoTdlN5V+BX
	X4/uwFb7kyb6KqjmmZy/H5QRS8fQ1+HT6HNssRYD4uBTllUrilWPgofhBC1bwlYe4oxs6I20gv3
	+VIJimhe5fpb/DqOu7Tkj8nV5NEhqSrFvccBYUA==
X-Google-Smtp-Source: AGHT+IGel2iufVWE7yEaXpiUCOzSGhpWA1BLe8FeSt7fhAc564KN+Bkzi+N7ZzjWlot25bVnoMqBzEW8ipt2gWvdhbE=
X-Received: by 2002:a05:6870:ec86:b0:24e:8987:6f34 with SMTP id
 586e51a60fabf-287c1d38c6fmr6879006fac.3.1728288951492; Mon, 07 Oct 2024
 01:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20241005080233.1248850-1-frediano.ziglio@cloud.com>
 <20241005080233.1248850-3-frediano.ziglio@cloud.com> <e7e5200e-4577-4f67-bb3e-6f71086fc663@citrix.com>
 <0bfcd06d-cc3a-4048-bab4-0d5cd794fa1a@suse.com> <CACHz=Zg3R4Ybr0GwhSaYsOo72mWtapnpQ7w-Wb=wjrf-or1J_g@mail.gmail.com>
In-Reply-To: <CACHz=Zg3R4Ybr0GwhSaYsOo72mWtapnpQ7w-Wb=wjrf-or1J_g@mail.gmail.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 7 Oct 2024 09:15:40 +0100
Message-ID: <CACHz=ZjCAEE2kiWdce0ApQqtA-3urSMFJYRdKv8Qa_-BrZZ8bw@mail.gmail.com>
Subject: Re: [PATCH 2/3] x86/boot: Reuse code to relocate trampoline
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 7, 2024 at 9:07=E2=80=AFAM Frediano Ziglio
<frediano.ziglio@cloud.com> wrote:
>
> On Mon, Oct 7, 2024 at 8:03=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
> >
> > On 05.10.2024 15:21, Andrew Cooper wrote:
> > > On 05/10/2024 9:02 am, Frediano Ziglio wrote:
> > >> --- a/xen/arch/x86/boot/Makefile
> > >> +++ b/xen/arch/x86/boot/Makefile
> > >> @@ -1,6 +1,6 @@
> > >> -obj-bin-y +=3D head.o cbundle.o
> > >> +obj-bin-y +=3D head.o cbundle.o reloc-trampoline.x64.o
> > >
> > > Ah.  I think the $(obj)/%.x64.o rule you had in the previous patch wa=
nts
> > > introducing here.
> > >
> > > That said, x64 is the one name for 64bit that we reliably don't use.
> > > Also...
> > >
> > >> -head-bin-objs :=3D cmdline.o reloc.o
> > >> +head-bin-objs :=3D cmdline.o reloc.o reloc-trampoline.o
> > >
> > > ... head-bin-objs isn't really correct now seeing as they're not
> > > binaries in head.S.  Also ...
> > >
> > >>  nocov-y   +=3D $(head-bin-objs)
> > >>  noubsan-y +=3D $(head-bin-objs)
> > >
> > > The no$(foo)'s needs extending to the 64bit objects too.  They're als=
o
> > > used early enough to explode.
> > >
> > > In Xen, 64bit objects are the norm, and it's 32bit ones which are the
> > > exception, so how about we special case *.i386.o instead.  Then
> > >
> > > obj32 :=3D cmdline.i386.o
> > > obj32 +=3D reloc.i386.o
> > > obj32 +=3D reloc-trampoline.i386.o
> >
> > I'd like to advocate for ix86 or i686. i386 gives a wrong impression im=
o.
> >
> > Jan
>
> Why not simply x86 ? We already use it.
>

Looking at current files, we also use (to distinguish more clearly 32
and 64 bit) x86_32.

Frediano

