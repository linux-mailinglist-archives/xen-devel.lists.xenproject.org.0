Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F139715A2
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 12:52:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794269.1203077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbzw-00041F-Q5; Mon, 09 Sep 2024 10:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794269.1203077; Mon, 09 Sep 2024 10:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbzw-0003zk-NB; Mon, 09 Sep 2024 10:51:56 +0000
Received: by outflank-mailman (input) for mailman id 794269;
 Mon, 09 Sep 2024 10:51:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dA/l=QH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1snbzv-0003ze-DB
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 10:51:55 +0000
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [2607:f8b0:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85c24d92-6e99-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 12:51:53 +0200 (CEST)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3e03c234f27so971844b6e.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 03:51:53 -0700 (PDT)
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
X-Inumbo-ID: 85c24d92-6e99-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725879112; x=1726483912; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K3/RUUoeuY4CyrP3jYsTUf8JioVVYZSzT88gAa6sreQ=;
        b=dAZNdfqJTdLdjg5/Wo/iXy8/9jJQf7AkoQDbgDYT96AvD/kkIt7CjrFC3iV7GcwCPH
         C1vrgsjRfDVr6wVeqs57Id+x4yx0thJXQUmCXMPcVdjvyb8vDMbmvu/lCENoS8BnoT4I
         16hgNczY/yxjVVmEV9Vu1+9Pqlj0OThNUgxkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725879112; x=1726483912;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K3/RUUoeuY4CyrP3jYsTUf8JioVVYZSzT88gAa6sreQ=;
        b=GC79DRBGsDvjq4GNxkTt4c/45J1s+eESpTj/OcNpl0Zc/WFQNc060rRjKiTXQ7UmSl
         7AUhiWR3HQjbCs1BlZcRI94LXgXkI0JS4Djimh1uY8IyHSjFlLhk8DPpZx2L8O/St1fy
         TfqYVB22667BclRnwXTCXff0+gaXxA/DjYB+c3sfw+IQfyhP05euCUq8mpgHX13X1bCW
         AzsKMBphp+7ilDq1gI/mnYOfzL59pbczIHl2Hl2ct9qJM7QgZUpOqDqQCMZZqjH9hLxZ
         o5cMqvLrHsvC6iHDJBP1cYK2+vUmmNOloXMOVlw40U7V9t7m07w++UmI9bvZtRQ3GzSZ
         2zow==
X-Gm-Message-State: AOJu0YxWew+cG8QbzuVNb2wTcRhEgpOpQoy+mTx44PqmSZYcmMVNtX3C
	WEu06M2nlIJW8Y2bEN0f5MKlw/ABNs9ncG0sQAWvAVJwXh2XiOGAO3or1pwtgTjZdZokOsFr+70
	TwOIFpCBjLrABX6bO47kN8GmQ/Rur42VYcBveLw==
X-Google-Smtp-Source: AGHT+IE5yuM7+29b1T6w7MEJQ/+1o3gmX6Ol9buH0FsSVyUG7gZb7C2B3AAj6Z6Iq/LEKyHWc4/ew3DWM6+2nmccUR4=
X-Received: by 2002:a05:6808:19a7:b0:3e0:4758:8ed5 with SMTP id
 5614622812f47-3e047589095mr1777981b6e.10.1725879111904; Mon, 09 Sep 2024
 03:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240909104402.67141-1-frediano.ziglio@cloud.com> <6cbc9587-5e9c-4f59-b61f-940bcd7f408a@citrix.com>
In-Reply-To: <6cbc9587-5e9c-4f59-b61f-940bcd7f408a@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 9 Sep 2024 11:51:41 +0100
Message-ID: <CACHz=ZjNFqoFbzi5ZAPzdZq1-S34p09tM++WZ-GD5Mv1KdbYpg@mail.gmail.com>
Subject: Re: [PATCH v2] x86/boot: Optimise 32 bit C source code
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000640e6e0621ad8b8d"

--000000000000640e6e0621ad8b8d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 11:47=E2=80=AFAM Andrew Cooper <andrew.cooper3@citri=
x.com>
wrote:

> On 09/09/2024 11:44 am, Frediano Ziglio wrote:
> > The various filters are removing all optimisations.
> > No need to have all optimisations turned off.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > ---
> >  xen/arch/x86/boot/Makefile | 1 +
> >  1 file changed, 1 insertion(+)
> > ---
> > Changes since v1
> > - reuse optimization level from XEN_CFLAGS.
> >
> > diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
> > index 8f5bbff0cc..8352ce023b 100644
> > --- a/xen/arch/x86/boot/Makefile
> > +++ b/xen/arch/x86/boot/Makefile
> > @@ -16,6 +16,7 @@ $(call
> cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
> >  CFLAGS_x86_32 +=3D -Werror -fno-builtin -g0 -msoft-float -mregparm=3D3
> >  CFLAGS_x86_32 +=3D -nostdinc -include $(filter
> %/include/xen/config.h,$(XEN_CFLAGS))
> >  CFLAGS_x86_32 +=3D $(filter -I%,$(XEN_CFLAGS))
> > +CFLAGS_x86_32 +=3D $(filter -O%,$(XEN_CFLAGS))
>
> I'm pretty sure this can be part of the prior expression,
>
> CFLAGS_x86_32 +=3D $(filter -I% -O%,$(XEN_CFLAGS))
>
> Happy to fix on commit.
>
>
>
No objections.

On a similar subject we don't pass -D__XEN__ to these files, this looks
wrong to me, they are Xen sources.
Should I send a separate patch after this with that change?

Frediano

--000000000000640e6e0621ad8b8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Sep 9, 2024 at 11:47=E2=80=AFAM Andrew Cooper &lt;<a href=3D=
"mailto:andrew.cooper3@citrix.com">andrew.cooper3@citrix.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 09/09/2024 1=
1:44 am, Frediano Ziglio wrote:<br>
&gt; The various filters are removing all optimisations.<br>
&gt; No need to have all optimisations turned off.<br>
&gt;<br>
&gt; Signed-off-by: Frediano Ziglio &lt;<a href=3D"mailto:frediano.ziglio@c=
loud.com" target=3D"_blank">frediano.ziglio@cloud.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 xen/arch/x86/boot/Makefile | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; ---<br>
&gt; Changes since v1<br>
&gt; - reuse optimization level from XEN_CFLAGS.<br>
&gt;<br>
&gt; diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile<b=
r>
&gt; index 8f5bbff0cc..8352ce023b 100644<br>
&gt; --- a/xen/arch/x86/boot/Makefile<br>
&gt; +++ b/xen/arch/x86/boot/Makefile<br>
&gt; @@ -16,6 +16,7 @@ $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EX=
TRA_CFLAGS))<br>
&gt;=C2=A0 CFLAGS_x86_32 +=3D -Werror -fno-builtin -g0 -msoft-float -mregpa=
rm=3D3<br>
&gt;=C2=A0 CFLAGS_x86_32 +=3D -nostdinc -include $(filter %/include/xen/con=
fig.h,$(XEN_CFLAGS))<br>
&gt;=C2=A0 CFLAGS_x86_32 +=3D $(filter -I%,$(XEN_CFLAGS))<br>
&gt; +CFLAGS_x86_32 +=3D $(filter -O%,$(XEN_CFLAGS))<br>
<br>
I&#39;m pretty sure this can be part of the prior expression,<br>
<br>
CFLAGS_x86_32 +=3D $(filter -I% -O%,$(XEN_CFLAGS))<br>
<br>
Happy to fix on commit.<br>
<br><br></blockquote><div><br></div><div>No objections.</div><div><br></div=
><div>On a similar subject we don&#39;t pass -D__XEN__ to these files, this=
 looks wrong to me, they are Xen sources.</div><div>Should I send a separat=
e patch after this with that change?<br></div><div><br></div><div>Frediano<=
/div><div><br></div></div></div>

--000000000000640e6e0621ad8b8d--

