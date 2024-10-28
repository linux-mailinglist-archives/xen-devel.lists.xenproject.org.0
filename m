Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 683D19B3759
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 18:08:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826877.1241311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5TDH-00070e-3C; Mon, 28 Oct 2024 17:07:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826877.1241311; Mon, 28 Oct 2024 17:07:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5TDH-0006xq-0P; Mon, 28 Oct 2024 17:07:31 +0000
Received: by outflank-mailman (input) for mailman id 826877;
 Mon, 28 Oct 2024 17:07:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnZV=RY=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t5TDG-0006xk-5s
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 17:07:30 +0000
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [2607:f8b0:4864:20::c33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bab759e-954f-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 18:07:27 +0100 (CET)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-5ebc04d495aso2606118eaf.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 10:07:27 -0700 (PDT)
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
X-Inumbo-ID: 1bab759e-954f-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730135246; x=1730740046; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8gsRkgHtnhlFLoiFdA//3m3mbNeQBSnuTTdr/hYpPc=;
        b=HCh5zqaTCdqEXu4ZQAqB6sneHhL14Gr/K+GcDlxmYVns0brIE9fKfo+0aOMO3oW7Mh
         jQ85/Qivj3fkd6x3dcKr2HWfMoPa3rfee8XZfUmXgYzpEzZGpEPbrz3zsr9FHp7Ci1Ij
         9326hrMtkYLD/ggQFDwcL1nL9ciGcsEFIQXA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730135246; x=1730740046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b8gsRkgHtnhlFLoiFdA//3m3mbNeQBSnuTTdr/hYpPc=;
        b=FiaHJHTk/DJDq1WuPoe85r6HxI4KXxH4Q8/tQfJnQab7oIWEVq3JdhYrpw0DukgzsP
         AMwsyAIlRzU5cxmAPNJXdG0fReBYvKk6q3s0xww7L2naYRh3CBZecoXY0v+cGlfExSb4
         47Q8wb8ZLhhcTxsbkgM6B5W0x+0izsCaoM+/q4Oxg748F7UF4VCH3eTacLaZaAMAVVde
         rw/ImEMID/g/xNrUlf8t7T2i+9q+8fdLFJ79FEndsSuUBpYYcQfFRVwkDTXRUlG0nUQE
         dPg7sAN5+xsvtaCevnq4HOXoGmLmuJzfJuEvBXEA39onIn51EIACMRTmRkfrJNKCPuKR
         AVeg==
X-Forwarded-Encrypted: i=1; AJvYcCUiJE2oDQlmVU85kRc6wk4UyCG8+kOI61YalhjPZB51QeaoCOdnatPyLX1uKfi1VhmiMG0F/xgFq2Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZyLgAgubO0QtqYfJNix8sNpf/4jdMRYfPv/2MShGERhBQoy6Z
	rM/jBKOyhlZm/blGanb2wgHWmzwfEnT1c2KBxb2Gu/o9bTPrVt3wB85PTrr1vwXsulHn1pfwokp
	ZXaissQfuFvXpx/fQ+0JbAPx88vlqIBD7+cCz6g==
X-Google-Smtp-Source: AGHT+IGKlf7QZqiLyrwjx0m87hPy7ricMF3gP3tzyYYH6KJVW0l1M3p/N0DUbFNyFS9ota8nIppL59fi7qXE7JPiS6A=
X-Received: by 2002:a05:6820:2218:b0:5eb:7e7c:5303 with SMTP id
 006d021491bc7-5ec237d1a4cmr5888437eaf.2.1730135246513; Mon, 28 Oct 2024
 10:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <b2fdb048-cfc5-4f61-8507-bf8020e02132@suse.com>
 <764c0116-88ed-48af-8e53-f2a0f6e850a3@citrix.com> <c618e09f-b88c-45c8-8cbd-8aae82891c6e@suse.com>
 <ecd11958-2ce8-41fc-87f8-7b6b090c74b5@citrix.com> <aab91022-5115-4af0-8f9d-569c63a296bb@suse.com>
 <f8f4e221-fbf1-4e0b-98d0-bc19e0c604a9@citrix.com> <fee34f7d-6d2e-44c6-aa76-e1d6d4856ddf@suse.com>
In-Reply-To: <fee34f7d-6d2e-44c6-aa76-e1d6d4856ddf@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 28 Oct 2024 17:07:15 +0000
Message-ID: <CACHz=Zgn06KXoqo0rct=-AL4_utBdsdhmGgRakO_86x7WgTvXg@mail.gmail.com>
Subject: Re: [PATCH] earlycpio: constify find_cpio_data()'s "data" parameter
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 4:51=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 28.10.2024 17:45, Andrew Cooper wrote:
> > On 28/10/2024 4:25 pm, Jan Beulich wrote:
> >> On 28.10.2024 17:18, Andrew Cooper wrote:
> >>> On 28/10/2024 4:12 pm, Jan Beulich wrote:
> >>>> On 28.10.2024 17:07, Andrew Cooper wrote:
> >>>>> On 28/10/2024 4:03 pm, Jan Beulich wrote:
> >>>>>> As with 9cbf61445cda ("xen/earlycpio: Drop nextoff parameter"): Wh=
ile
> >>>>>> this is imported from Linux, the parameter not being pointer-to-co=
nst is
> >>>>>> dubious in the first place and we're not plausibly going to gain a=
 write
> >>>>>> through it.
> >>>>>>
> >>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>>> You haven't tried compiling this, have you?
> >>>> Of course I have. Is there any subtlety with compiler versions? Or w=
hat
> >>>> else am I missing?
> >>> struct cpio_data's copy of this field is non-const (which you keep on
> >>> noting that new compilers will object to),
> >> New compilers? I'm afraid I'm missing context. With gcc14 the patch bu=
ilds
> >> fine. I didn't try _older_ ones (but I see no reason why they might ob=
ject;
> >> see below).
> >>
> >>> and you can't change that
> >>> without breaking the build in microcode.
> >> I don't need to change that, "thanks" to
> >>
> >>                      cd.data =3D (void *)dptr;
> >>
> >> casting away const-ness. That is - compilers ought to be fine with the
> >> change; Misra won't like it.
> >
> > You have literally complained about patches of mine on the grounds of
> > "GCC is about to start caring about casting away const on a void pointe=
r".
>
> I still don't remember what context this was in, I'm sorry.
>
> > So which is it.
>
> I'm not adding any such casts; the (potentially problematic) cast is
> there already. I therefore still don't see what's wrong with the patch.
>

You usually don't want some const data to be silently transformed to
no-const data. In this case the "find_cpio_data" is getting a no-const
pointer "data" and returning it into "cpio_data.data". As
"cpio_data.data" is no-const for the previously stated rule the
initial data (that is "data" pointer) should not be const.

Internally you change from no-const to const with the assignment to
"p" and than "dptr". However the "find_cpio_data" function has
knowledge of the original no-const so it uses that knowledge for the
no-const conversion done by "cd.data =3D (void *)dptr". That makes that
conversion less "silent".

> >>> Nothing of this form can be taken until the constness is consistent i=
n
> >>> microcode, after which yes it can mostly become const.
> >> We can move there in steps, can't we?
> >
> > Or you can stop trying to insist that I rebase around an
> > incorrect/incomplete patch, just for the sake of the const of one void
> > pointer, which can still be laundered by this function.
>
> Okay, I won't insist; take my ack as unconditional one. I still consider
> it a bad precedent though that we'd set, when elsewhere we ask for const-
> correctness wherever possible.
>
> > Especially when you could wait the ~day it will take to get an
> > otherwise-good series in, and then change cpio and get all of the const
> > problems in one go.
>
> If that turns out to be true, all will indeed be fine in the end. Questio=
n
> is whether we really want to diverge earlycpio.c by more than minimal
> changes.
>
> Jan
>

Frediano

