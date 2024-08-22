Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1C595AF29
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 09:23:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781582.1191081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh29q-0001Ad-Da; Thu, 22 Aug 2024 07:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781582.1191081; Thu, 22 Aug 2024 07:22:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh29q-000195-AH; Thu, 22 Aug 2024 07:22:58 +0000
Received: by outflank-mailman (input) for mailman id 781582;
 Thu, 22 Aug 2024 07:22:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m19V=PV=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1sh29p-00018p-JD
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 07:22:57 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a51a4e1-6057-11ef-a50a-bb4a2ccca743;
 Thu, 22 Aug 2024 09:22:56 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2f3ce5bc7d2so4504741fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 00:22:56 -0700 (PDT)
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
X-Inumbo-ID: 5a51a4e1-6057-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724311376; x=1724916176; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XQOp5hF11YdDpd5Az2ZdoDZpQ8hEqedUkefTlMm/ERs=;
        b=b9vw5qejKC11lw8pY+pxa5f3nhB3D8/lZrk6jhkv0SloVf4NrNNfDNiptHiFr+3jzZ
         Eq8ALo2TzdrmaVgy0nxWz48111iC7D+8Mc7R2+QIxvUDxTwJlWQ9PEHzU03DsMhCz1v/
         uxIFFZM2fR8ATcOV7E2d/ZjVbBI8ULIBBJRx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724311376; x=1724916176;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQOp5hF11YdDpd5Az2ZdoDZpQ8hEqedUkefTlMm/ERs=;
        b=paff5fnODKLBqNpFQOB0X5LLy1vdbpHzlzE2AST0dec5nyEGqPuq6uTcuJXq+ndwz9
         8K6wbPOJUCUP5UzG6iuLOzc8t/LdMppfib/k8fXWMLJv7yH/bOJ6ShgG59vnQLuGh7gD
         4LXuwkEuiFZWBhspIpndL0kGSxGIVN0swmfj0TED+kQ49B+UyJtuW0FEiIhuOyNKZndG
         U2E2PqBojEd32QW6ngwuULSj2Bku77kI/ua5qcso/xOl8tkoYLPe5FSB9dbyxvS1YvQP
         UHJC1DzGzaKjQxSca67LvJ27OMGuVXzoXE98Uyb9VimyZ7E3GQPUstdgxZAtMd8iUvsQ
         HSYw==
X-Forwarded-Encrypted: i=1; AJvYcCUY6CELpM8xkSXLByEMMUtFLO/jjFbWoEpmLgYzXW08xYZJkEfZ8PU/nPdCCgoA7W1TIY6i4D66uHY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzm4sqgzS9kokmmBxMKyYSs5gMyu+R/H6UQ1nbM/pNoqG7LUMHL
	J0ja78jvjfXlYM8qZH3o0ul6lawA1jVTDF+2OwCJWoIsxViEvRVa9L8KiExnNQIBD2qX/QEzHTu
	XP3wo63Cu4vs80ouplP68kUkAiqf9lik3fuFwSaZj4Yf+gmk/
X-Google-Smtp-Source: AGHT+IFui6WY5E3Idghflkp51tgdltzD7wCTo1QJJ1ylt4UzdSx5pQa8bboUbHIwgrV0I9G7M0HOhXeVdU/cpO1u0eU=
X-Received: by 2002:a2e:bea0:0:b0:2ef:295b:4946 with SMTP id
 38308e7fff4ca-2f405c83db7mr5742091fa.4.1724311375464; Thu, 22 Aug 2024
 00:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240725082725.2685481-1-fouad.hilly@cloud.com>
 <20240725082725.2685481-5-fouad.hilly@cloud.com> <f0925d77-db8d-410c-873f-0bf38727aca9@suse.com>
 <CAJKAvHY1CiXM+S1TNLrasPFZZPrdZo5QsJvhxCbptJFPyBqtqA@mail.gmail.com> <0f17e8ff-caef-4494-8478-c8203992c1df@suse.com>
In-Reply-To: <0f17e8ff-caef-4494-8478-c8203992c1df@suse.com>
From: Fouad Hilly <fouad.hilly@cloud.com>
Date: Thu, 22 Aug 2024 08:22:43 +0100
Message-ID: <CAJKAvHaWOewWLAb9K+Fc=rk=mDvT22G8wUOV5wHmtbv7fJxmhg@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] x86/ucode: Utilize ucode_force and remove opt_ucode_allow_same
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000004704d062040874a"

--00000000000004704d062040874a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 10:22=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:

> On 19.08.2024 10:57, Fouad Hilly wrote:
> > On Mon, Jul 29, 2024 at 12:30=E2=80=AFPM Jan Beulich <jbeulich@suse.com=
> wrote:
> >> On 25.07.2024 10:27, Fouad Hilly wrote:
> >>> --- a/xen/arch/x86/cpu/microcode/core.c
> >>> +++ b/xen/arch/x86/cpu/microcode/core.c
> >>> @@ -90,6 +90,11 @@ struct ucode_mod_blob {
> >>>      size_t size;
> >>>  };
> >>>
> >>> +struct patch_with_flags {
> >>> +    unsigned int flags;
> >>> +    struct microcode_patch *patch;
> >>
> >> Pointer-to-const? If the const was omitted here just because of
> >> microcode_free_patch(), then I think the issue should be taken care
> >> of there.
> >
> > This struct is required as is, I initially added a similar struct with
> > const (which was removed in v6).
> > updated control_thread_fn()
> > -static int control_thread_fn(const struct microcode_patch *patch)
> > +static int control_thread_fn(struct microcode_patch *patch,
> > +                             unsigned int flags)
>
> And why's that change necessary, other than to cater for the omitted cons=
t
> in the struct?
>

I see your point, I will keep const and update microcode_free_patch() as
needed in v7.

>
> Jan
>


Thanks,

Fouad

--00000000000004704d062040874a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 19, 2024 at 10:22=E2=80=
=AFAM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=3D"_blank=
">jbeulich@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 19.08.2024 10:57, Fouad Hilly wrote:<br>
&gt; On Mon, Jul 29, 2024 at 12:30=E2=80=AFPM Jan Beulich &lt;<a href=3D"ma=
ilto:jbeulich@suse.com" target=3D"_blank">jbeulich@suse.com</a>&gt; wrote:<=
br>
&gt;&gt; On 25.07.2024 10:27, Fouad Hilly wrote:<br>
&gt;&gt;&gt; --- a/xen/arch/x86/cpu/microcode/core.c<br>
&gt;&gt;&gt; +++ b/xen/arch/x86/cpu/microcode/core.c<br>
&gt;&gt;&gt; @@ -90,6 +90,11 @@ struct ucode_mod_blob {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 size_t size;<br>
&gt;&gt;&gt;=C2=A0 };<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; +struct patch_with_flags {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 unsigned int flags;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 struct microcode_patch *patch;<br>
&gt;&gt;<br>
&gt;&gt; Pointer-to-const? If the const was omitted here just because of<br=
>
&gt;&gt; microcode_free_patch(), then I think the issue should be taken car=
e<br>
&gt;&gt; of there.<br>
&gt; <br>
&gt; This struct is required as is, I initially added a similar struct with=
<br>
&gt; const (which was removed in v6).<br>
&gt; updated control_thread_fn()<br>
&gt; -static int control_thread_fn(const struct microcode_patch *patch)<br>
&gt; +static int control_thread_fn(struct microcode_patch *patch,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int flags)<br>
<br>
And why&#39;s that change necessary, other than to cater for the omitted co=
nst<br>
in the struct?<br></blockquote><div><br></div><div>I see your point, I will=
 keep const and update microcode_free_patch() as needed in v7.</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
Jan<br></blockquote><div><br></div><div><br></div><div>Thanks,</div><div><b=
r></div><div>Fouad=C2=A0</div></div></div>

--00000000000004704d062040874a--

