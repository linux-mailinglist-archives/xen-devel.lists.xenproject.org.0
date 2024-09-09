Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FD79718E8
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 14:04:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794399.1203316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snd7u-0002jj-U0; Mon, 09 Sep 2024 12:04:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794399.1203316; Mon, 09 Sep 2024 12:04:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snd7u-0002hb-RT; Mon, 09 Sep 2024 12:04:14 +0000
Received: by outflank-mailman (input) for mailman id 794399;
 Mon, 09 Sep 2024 12:04:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dA/l=QH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1snd7t-0002hP-KU
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 12:04:13 +0000
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [2607:f8b0:4864:20::c2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0433d23-6ea3-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 14:04:12 +0200 (CEST)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-5e1b72fc5f3so1251777eaf.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 05:04:12 -0700 (PDT)
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
X-Inumbo-ID: a0433d23-6ea3-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725883451; x=1726488251; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VYcuSuyuhC3DJlmVd353NRJwcrxM6mqAWTcYk0iyJYE=;
        b=KNXas4flIfN/Qk9QaDzOJR685X/Bxov5uayrvOAugNiFvhFyzw26rq22F0/V2/fpON
         4Q3jlZ6uYyI+Mzuei7VC+EJkGaDEemPwO3JCNxNV7N23CDf8PJpvprG6VOh6IXV0geDW
         /g/ezo05qHw9djPnfjUhPcmtv6/PRwL4zfpvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725883451; x=1726488251;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VYcuSuyuhC3DJlmVd353NRJwcrxM6mqAWTcYk0iyJYE=;
        b=KauIwcJQcGWacPsSbBja8rdMQ04m84T0SLFaNF2oaw1f62ZhDly+Lv8QwGnta7I/HL
         jyQSqLFQS5UKs4/h5FzFta8yunWn4d6PKRzadXUmdiZe+0nPNTfMHwEFYdv7raVslmET
         yjUdeIpBUThwvsZ++DXp8aoPhsIbvxxRH6/EIpWVEKOkwYzXzdY2/rxFl5ZG6nG/Q1AZ
         FqnmHs+XPPWjSzV7o7pZVIZWgdn/ISLGZH1TZG74xRGrh8f8dHgL+VWjXSFweVaITnGB
         /8vH1B0SfYf0Qj75ZJ/AnYkirdVhIjF53QtKCkLn6JP0i95YuYGyVUG2OQtxTyB8SREj
         uuoA==
X-Gm-Message-State: AOJu0YxB+MtNSiVddZTc+xNnlX31ciOZ1dfVFMDXt1LI0bfj3kFGm6MX
	EITtTki6AT5NbwmSnMLfl8w4bRdhD7mMzWd9U+rN7w/Zcjl5ijNSfnIgaiAgJOLVeHy9EjZV0IQ
	YXTgVF7hexwMmkHAfpu09ThJ14jCg50Q3T83P2A==
X-Google-Smtp-Source: AGHT+IHjTRh044xebUMDNCOACfT5WJO6ARZ1qThVx2q1zkhMSj6m0MJCGNc/qOpjzFML78SGYL88xgxnLEHBqjp0u/g=
X-Received: by 2002:a05:6820:1b89:b0:5e1:dd48:dffc with SMTP id
 006d021491bc7-5e1dd48eed0mr537904eaf.8.1725883450945; Mon, 09 Sep 2024
 05:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240909110329.84512-1-frediano.ziglio@cloud.com>
 <20240909110329.84512-2-frediano.ziglio@cloud.com> <c05e0a14-269a-4608-9858-d6a64ae96fb9@suse.com>
In-Reply-To: <c05e0a14-269a-4608-9858-d6a64ae96fb9@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 9 Sep 2024 13:04:00 +0100
Message-ID: <CACHz=ZiQmduDU0TiSCXZwyPOESYFMFa+cW==LhAqDgP32Jp8Dg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] x86/boot: Add missing __XEN__ definition
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000000485c80621ae8ebe"

--0000000000000485c80621ae8ebe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 12:21=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:

> On 09.09.2024 13:03, Frediano Ziglio wrote:
> > --- a/xen/arch/x86/boot/Makefile
> > +++ b/xen/arch/x86/boot/Makefile
> > @@ -15,7 +15,7 @@ CFLAGS_x86_32 :=3D $(subst -m64,-m32
> -march=3Di686,$(XEN_TREEWIDE_CFLAGS))
> >  $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
> >  CFLAGS_x86_32 +=3D -Werror -fno-builtin -g0 -msoft-float -mregparm=3D3
> >  CFLAGS_x86_32 +=3D -nostdinc -include $(filter
> %/include/xen/config.h,$(XEN_CFLAGS))
> > -CFLAGS_x86_32 +=3D $(filter -I% -O%,$(XEN_CFLAGS))
> > +CFLAGS_x86_32 +=3D $(filter -I% -O%,$(XEN_CFLAGS)) -D__XEN__
>
> Any reason not to similarly make this -D% as a filter expression?
>
> Jan
>

I saw that a lot of defines are about processor support which do not make
sense for 32 bit.

Do you want me to add a comment in the commit?

Frediano

--0000000000000485c80621ae8ebe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Sep 9, 2024 at 12:21=E2=80=AFPM Jan Beulich &lt;<a href=3D"m=
ailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On 09.09.2024 13:03, Frediano Zig=
lio wrote:<br>
&gt; --- a/xen/arch/x86/boot/Makefile<br>
&gt; +++ b/xen/arch/x86/boot/Makefile<br>
&gt; @@ -15,7 +15,7 @@ CFLAGS_x86_32 :=3D $(subst -m64,-m32 -march=3Di686,$=
(XEN_TREEWIDE_CFLAGS))<br>
&gt;=C2=A0 $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))=
<br>
&gt;=C2=A0 CFLAGS_x86_32 +=3D -Werror -fno-builtin -g0 -msoft-float -mregpa=
rm=3D3<br>
&gt;=C2=A0 CFLAGS_x86_32 +=3D -nostdinc -include $(filter %/include/xen/con=
fig.h,$(XEN_CFLAGS))<br>
&gt; -CFLAGS_x86_32 +=3D $(filter -I% -O%,$(XEN_CFLAGS))<br>
&gt; +CFLAGS_x86_32 +=3D $(filter -I% -O%,$(XEN_CFLAGS)) -D__XEN__<br>
<br>
Any reason not to similarly make this -D% as a filter expression?<br>
<br>
Jan<br></blockquote><div><br></div><div>I saw that a lot of defines are abo=
ut processor support which do not make sense for 32 bit.</div><div><br></di=
v><div>Do you want me to add a comment in the commit?<br></div><div><br></d=
iv><div>Frediano</div><div>=C2=A0<br></div></div></div>

--0000000000000485c80621ae8ebe--

