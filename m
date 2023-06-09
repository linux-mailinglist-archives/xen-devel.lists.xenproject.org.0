Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6963272A6A3
	for <lists+xen-devel@lfdr.de>; Sat, 10 Jun 2023 01:16:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546320.853104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7lKu-0004WH-JQ; Fri, 09 Jun 2023 23:16:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546320.853104; Fri, 09 Jun 2023 23:16:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7lKu-0004Sw-FH; Fri, 09 Jun 2023 23:16:04 +0000
Received: by outflank-mailman (input) for mailman id 546320;
 Fri, 09 Jun 2023 23:16:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g3GI=B5=gmail.com=yshxxsjt715@srs-se1.protection.inumbo.net>)
 id 1q7lKt-0004SS-BG
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 23:16:03 +0000
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [2607:f8b0:4864:20::112f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9741f100-071b-11ee-8611-37d641c3527e;
 Sat, 10 Jun 2023 01:15:58 +0200 (CEST)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-56ce53c0040so1059177b3.2; 
 Fri, 09 Jun 2023 16:15:58 -0700 (PDT)
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
X-Inumbo-ID: 9741f100-071b-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686352557; x=1688944557;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q5u7UmKDqzvsT6LNfui1HYOMbYQ0/ZnTiHilzyTkbsQ=;
        b=DbSUIhUaO8+zlc1G+ZDSXkx44rfbHTZ0Fcq+NRvYMbfn/gJISmXgkqPtTPx9dkPAJw
         45jYGj8NPVttIXWhgpxa5WoJAqCcCF6WGv5IUkW6NBA6RIwTQ9ksw9/15UboY6MUDKbk
         FYTG+ss7Ih0kZAJOUSXcAOxPuF8Sg0C42ihiBddM5N/I2Y6/G094oBg7MZiekOrPYpXR
         OWXKDWfq+XDCI1nkilTuHa3XnTJlr+ee+8zvH62PSKz3aGXsUMEgRr2PkGIobgWtXTPl
         OInl8y3H6clCIfA1bejnyfNGWd6x2YOTj3chY6UoJT6MQtUwo3Xt4vfodENdIDk8iXR4
         zYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686352557; x=1688944557;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q5u7UmKDqzvsT6LNfui1HYOMbYQ0/ZnTiHilzyTkbsQ=;
        b=aWE4KvvHWLFVgxPa4YRFs368qUywiEar8/VJqD2EEAX16m/b8ehMm3KvO9FLtcazJ8
         QtxuuCuYsEurKnpP+Alo/mmgMBnSqGufscudaZj3eQq5dbGrdjZ5dmg28L7oSJMim50p
         o5UzKgrv/RfiPkaA/YcRBmg4t8+p93or/tdvzg5F5++pjF4iWbrQXOd0SkLuV+6JU5G1
         Io05eEr3JfK03GEGP8DN8hwbR/v6/G4gnyIdmprOB4s0wghJbxhudfTmCTpN8cmCV7Z6
         7krGb70gWSX7YDjYVlGE8z4jd1qw6MHxRK399soFFZGZJubGhKEL4IobFh346X/DT2fS
         kZXA==
X-Gm-Message-State: AC+VfDwZKPhkfZktsoGBiKIAH71eFApHvCxyspOBlfqZSvTeQmZkl0Zf
	w8nstFA1gUKxarUZAH9dgNfu3vFvzvKzcXznusM=
X-Google-Smtp-Source: ACHHUZ6YoXET9vnqDxNUzUGj/+o5Jr3dx9Jiu1tMVbBm63Rewfqg6QdjT3Bm4+POt5u5e53c/Y88oOWiIrrH8C11cHM=
X-Received: by 2002:a0d:db8a:0:b0:565:7025:610a with SMTP id
 d132-20020a0ddb8a000000b005657025610amr2478367ywe.27.1686352557251; Fri, 09
 Jun 2023 16:15:57 -0700 (PDT)
MIME-Version: 1.0
References: <CALqm=ddiMwWvdYMgyCtaKMocUEkEJyTgSQup9wJiXm4PrcDuVw@mail.gmail.com>
 <alpine.DEB.2.22.394.2306081537590.3803068@ubuntu-linux-20-04-desktop>
 <e729d60e-b290-dec3-e35b-65c24ffbfda6@xen.org> <CALqm=ddc3BhqRQmPDjnZ3TeMEXPTMUDfj7JCSj0QEDxnMaKLvw@mail.gmail.com>
 <78899eac-9de8-3626-8f40-98f993984f95@xen.org>
In-Reply-To: <78899eac-9de8-3626-8f40-98f993984f95@xen.org>
From: Jiatong Shen <yshxxsjt715@gmail.com>
Date: Sat, 10 Jun 2023 07:15:46 +0800
Message-ID: <CALqm=dfrudbnsy7RdP9GdSmyO2m9JN=8mKD7wQvz2WBv6afJhQ@mail.gmail.com>
Subject: Re: Asking for help to debug xen efi on Kunpeng machine
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-users@lists.xenproject.org, 
	xen-devel@lists.xenproject.org, bertrand.marquis@arm.com
Content-Type: multipart/alternative; boundary="00000000000024218f05fdba8d3a"

--00000000000024218f05fdba8d3a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Julien,

    Thank you very much for your help!

Best,

Jiatong Shen

On Fri, Jun 9, 2023 at 4:48=E2=80=AFPM Julien Grall <julien@xen.org> wrote:

> Hello,
>
> On 09/06/2023 03:32, Jiatong Shen wrote:
> > Thank you for your answer. Can you teach me how to verify if acpi is
> > enabled?
>
> You usually look at the .config. But I am not sure if this is provided
> by the Debian package. If not, then your best option would be to build
> your own Xen. To select ACPI, you want to use the menuconfig and select
> UNSUPPORTED and ACPI.
>
> Cheers,
>
> --
> Julien Grall
>


--=20

Best Regards,

Jiatong Shen

--00000000000024218f05fdba8d3a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Julien,</div><div><br></div>=C2=A0 =C2=A0 Thank=
 you very much for your help!<br><div><br></div><div>Best,</div><div><br></=
div><div>Jiatong Shen</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Fri, Jun 9, 2023 at 4:48=E2=80=AFPM Julien Gr=
all &lt;<a href=3D"mailto:julien@xen.org">julien@xen.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
On 09/06/2023 03:32, Jiatong Shen wrote:<br>
&gt; Thank you for your answer. Can you teach me how to verify if acpi is<b=
r>
&gt; enabled?<br>
<br>
You usually look at the .config. But I am not sure if this is provided <br>
by the Debian package. If not, then your best option would be to build <br>
your own Xen. To select ACPI, you want to use the menuconfig and select <br=
>
UNSUPPORTED and ACPI.<br>
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><br><div>Best Regards,</div><div><br></div><div>Jiatong Shen=
</div></div></div>

--00000000000024218f05fdba8d3a--

