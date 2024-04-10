Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D8389F06D
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 13:13:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703018.1098801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruVso-0003gK-VP; Wed, 10 Apr 2024 11:12:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703018.1098801; Wed, 10 Apr 2024 11:12:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruVso-0003el-Sb; Wed, 10 Apr 2024 11:12:50 +0000
Received: by outflank-mailman (input) for mailman id 703018;
 Wed, 10 Apr 2024 11:12:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5G6/=LP=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1ruVsm-0003bF-Os
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 11:12:48 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4372e8e9-f72b-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 13:12:48 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-516d1ecaf25so7054881e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 04:12:48 -0700 (PDT)
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
X-Inumbo-ID: 4372e8e9-f72b-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712747568; x=1713352368; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ALT6kqEnrjbh1nQAK2UvKfGb74xu8lPYLkMQ+6mKJxs=;
        b=SI2x/StvdQPlwJGsHve/p7eV1sb7Wp9OU764y7SqXPyWQ2eO+1W7RklsY3EX28e2fA
         LqXsYNKRZyYUjbgADEoYhOjtF5mvx6afATirWstvr4M/V3+A/Fv30IhSmpQ+eYBAlUBw
         nOFUP9bP4p60RaXQNn1+KzmUwkUHOPdQdJma8pmb2Lfooz3KyFo66sB6aheyooPSRU1o
         KO1RIgqvxJSDG6BGtMZeE1HDiCTqBHlJ8zUIACtUlsWeh5VvFucmzrkHnrmK3wd+5bPy
         N2SMzF6ZZjM/nHhKfzpW/wIc5V6bcfY5dCX+l5gvBVXQrpmwGbjkETHslAJjc+qodumZ
         IUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712747568; x=1713352368;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALT6kqEnrjbh1nQAK2UvKfGb74xu8lPYLkMQ+6mKJxs=;
        b=vUI+6DtKNCSyTTdBMzLcspbtr/mf2qXM6bw+BTmVjgnzCq6tBHqZn2OlGrRTk8EgCb
         +STcYwvQ1cuhjW1QUq60JlTwviIFHqs5oR44QtoYVjpkFL+10el2uXEFxdu4gFJBioNy
         nMVmbDYIdgXdgvy2fq2migBOglkoRCatYHfX4UYVBOBEyMRGXMTCkbkvtzsaPYeVK92R
         id7UqHhQJp5OqDh3mwUDDRPreJUK6jG0LmOeWu1HQATUTzoiwJkt+Er8BGzeRTQ1rsxP
         xO/speGfST1sVotxXBA9pEngGlfakoIhmUBreqr8fLHmFxtzaJQx1goqDU1zzlWLV+FX
         /2Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXTpfm9lHqnofZJVNF78sZOriOHeoT2K/W5FhFfhWteM5eDbWTyvE20NyBB2pG1k4cIssSUuv5p1UALugHH1/TULoDK3ha4oka0i64C4KQ=
X-Gm-Message-State: AOJu0Yxt1OaPXl9qal3t22/7MIRU1jAY9JXWsoOaJo2ZX8dzhqvlJYmF
	tOmUHhMPlshAB3xLz8fs0+EUOLVBEov0Dl6BEfaR/uLWrOh5RGmTrbS/2IVxPX2jdJ7IJtp0e9Y
	i0uo9vDepX0mdG60yVp5c0aZmVxY=
X-Google-Smtp-Source: AGHT+IEcfMnAGY+YId1/vKeyCz6HCH/seMLuFbXPkv+qzkzyvPCN43a5QYTzcwAeKjoODGKkTEYUg8tHJxVPcN/UUM4=
X-Received: by 2002:ac2:5450:0:b0:516:d4f5:9382 with SMTP id
 d16-20020ac25450000000b00516d4f59382mr1328455lfn.52.1712747567575; Wed, 10
 Apr 2024 04:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240227223501.28475-1-vikram.garhwal@amd.com>
 <20240227223501.28475-3-vikram.garhwal@amd.com> <875xy659op.fsf@draig.linaro.org>
In-Reply-To: <875xy659op.fsf@draig.linaro.org>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Wed, 10 Apr 2024 13:12:36 +0200
Message-ID: <CAJy5ezqbMq=gCPZJYsQZNq7V5OP-2BjA6kp7RbvZzyKzxC71mA@mail.gmail.com>
Subject: Re: [QEMU][PATCH v3 2/7] xen: add pseudo RAM region for grant mappings
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org, sstabellini@kernel.org, 
	jgross@suse.com, Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000005af99c0615bc1ee1"

--0000000000005af99c0615bc1ee1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 1, 2024 at 3:06=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@linaro=
.org> wrote:

> Vikram Garhwal <vikram.garhwal@amd.com> writes:
>
> > From: Juergen Gross <jgross@suse.com>
> >
> > Add a memory region which can be used to automatically map granted
> > memory. It is starting at 0x8000000000000000ULL in order to be able to
> > distinguish it from normal RAM.
>
> Is the Xen memory map for HVM guests documented anywhere? I couldn't
> find anything googling or on the Xen wiki. I'm guessing this is going to
> be shared across all 64 bit HVM arches in Xen?
>
> Anyway:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

--0000000000005af99c0615bc1ee1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Mar 1, 2024 at 3:06=E2=80=AFPM Al=
ex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@li=
naro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Vikram Garhwal &lt;<a href=3D"mailto:vik=
ram.garhwal@amd.com" target=3D"_blank">vikram.garhwal@amd.com</a>&gt; write=
s:<br>
<br>
&gt; From: Juergen Gross &lt;<a href=3D"mailto:jgross@suse.com" target=3D"_=
blank">jgross@suse.com</a>&gt;<br>
&gt;<br>
&gt; Add a memory region which can be used to automatically map granted<br>
&gt; memory. It is starting at 0x8000000000000000ULL in order to be able to=
<br>
&gt; distinguish it from normal RAM.<br>
<br>
Is the Xen memory map for HVM guests documented anywhere? I couldn&#39;t<br=
>
find anything googling or on the Xen wiki. I&#39;m guessing this is going t=
o<br>
be shared across all 64 bit HVM arches in Xen?<br>
<br>
Anyway:<br>
<br>
Reviewed-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org"=
 target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
<br></blockquote><div><br></div><div>Reviewed-by: Edgar E. Iglesias &lt;<a =
href=3D"mailto:edgar.iglesias@amd.com">edgar.iglesias@amd.com</a>&gt;<br></=
div><div><br></div></div></div>

--0000000000005af99c0615bc1ee1--

