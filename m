Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C01728F34
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 07:05:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545586.852104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7UJS-0002YG-B5; Fri, 09 Jun 2023 05:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545586.852104; Fri, 09 Jun 2023 05:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7UJS-0002Qh-7p; Fri, 09 Jun 2023 05:05:26 +0000
Received: by outflank-mailman (input) for mailman id 545586;
 Fri, 09 Jun 2023 02:33:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g3GI=B5=gmail.com=yshxxsjt715@srs-se1.protection.inumbo.net>)
 id 1q7Rw2-0001ua-Kp
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 02:33:06 +0000
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [2607:f8b0:4864:20::b30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3d20993-066d-11ee-8611-37d641c3527e;
 Fri, 09 Jun 2023 04:33:02 +0200 (CEST)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-bacf685150cso1248072276.3; 
 Thu, 08 Jun 2023 19:33:01 -0700 (PDT)
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
X-Inumbo-ID: f3d20993-066d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686277980; x=1688869980;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Le5TsvdsK/7RBEoOC22sDwIJqqYwFldtkLeYfBEYa/g=;
        b=X1baz/rCTHp01pMXuCLxiIa9k24EZ6wms3JN2v6EWNonqh4f7LU4YelF9WguIL7cAd
         AMomTsD7Pt9bcxuv/gx2EkvLs+IwEMHixsrireNpzqnkWHK7RZ7zv0IJiYZLLmMC7Occ
         bj5N665qaycUay48xUnVz2On8hb1gS/aZcJYNVbFFoKVDmI6GjEvM4pJevIY7MK93aAF
         CV4HryK7j485Vjs1VspHuMXy4qfua8ExQ1EQHH6lu9igRUK3V9jao21WHPx4P+1qArLC
         frZtzkN8H8yy62TgYQBAqwu+jcQV2DS1xCGsGNnAIPW6vu+p4PDY0C0sx/2RR4uCoqWC
         R9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686277980; x=1688869980;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Le5TsvdsK/7RBEoOC22sDwIJqqYwFldtkLeYfBEYa/g=;
        b=UeesAQYvDY7sV6rUYn+KSrhww86uk3C0Hk8IzzgywwE/P8SAitAULKt2gUog7g+WvF
         n/5Umi/fWGC9Mm0OloA2w9Z4BF8oBsXIJB/yIswcaPb5dHN/IzzK+KQpgqwPuCHcHtfc
         dhcsT0JsXAkvPJot1c54dmvnD3RI40GXIuM4gHNwogwPRbKFs0RxZbWzC78MEiwFYlVY
         XncikPCBlU6yK0cmOIwzqI9XqhwVKj8QIb9/sbMDk4IB4zaYNbcCq506wQtuIWuqUr99
         /jxtwPgkTaDSUdKeMUaYWNW/J2aI2jaW+vsAK0ixt3p0gii4/MONqRIyCBDk2odl0JZQ
         Ohog==
X-Gm-Message-State: AC+VfDwQRc/ANQlFwVgF7O9CVc7agyIur+UEtGeLJodoTc0DNrMfo6DA
	9r44bqFzdOkV1t3J7/5OT9gEKlp7/VNckKbKXLA=
X-Google-Smtp-Source: ACHHUZ42ZwLV7jR7njZJKxzkhKAKb1MoAdpbsBrdhUfr28u7/7SK2j2lwtz/BXGMzOjJoA0tq080l+uBcHPJ21RkzRU=
X-Received: by 2002:a25:8c92:0:b0:ba8:792c:1a2f with SMTP id
 m18-20020a258c92000000b00ba8792c1a2fmr1255748ybl.40.1686277980215; Thu, 08
 Jun 2023 19:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <CALqm=ddiMwWvdYMgyCtaKMocUEkEJyTgSQup9wJiXm4PrcDuVw@mail.gmail.com>
 <alpine.DEB.2.22.394.2306081537590.3803068@ubuntu-linux-20-04-desktop> <e729d60e-b290-dec3-e35b-65c24ffbfda6@xen.org>
In-Reply-To: <e729d60e-b290-dec3-e35b-65c24ffbfda6@xen.org>
From: Jiatong Shen <yshxxsjt715@gmail.com>
Date: Fri, 9 Jun 2023 10:32:49 +0800
Message-ID: <CALqm=ddc3BhqRQmPDjnZ3TeMEXPTMUDfj7JCSj0QEDxnMaKLvw@mail.gmail.com>
Subject: Re: Asking for help to debug xen efi on Kunpeng machine
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-users@lists.xenproject.org, 
	xen-devel@lists.xenproject.org, bertrand.marquis@arm.com
Content-Type: multipart/alternative; boundary="00000000000000deac05fda9304c"

--00000000000000deac05fda9304c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for your answer. Can you teach me how to verify if acpi is
enabled?

Best regards,.
Jiatong Shen

On Fri, Jun 9, 2023 at 9:34=E2=80=AFAM Julien Grall <julien@xen.org> wrote:

>
>
> On 08/06/2023 23:39, Stefano Stabellini wrote:
> > Hi Jiatong,
> >
> > Do you have access to the serial? If so, it is possible that the boot
> > is actually successful and it is only the screen initialization the
> > problem.
> >
> > If kunpeng 920 is a UEFI/ACPI machine, we know that there are issues
> > with screen initialization.
>
> More importantly, you may want to check that if Xen was compiled with
> ACPI enabled (unlikely if this is the package from Debian). If not, you
> will need to build your own Xen.
>
> Cheers,
>
> --
> Julien Grall
>


--=20

Best Regards,

Jiatong Shen

--00000000000000deac05fda9304c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for your answer. Can you teach me how to verify =
if acpi is enabled?<br><div><br></div><div>Best regards,.</div><div>Jiatong=
 Shen</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Fri, Jun 9, 2023 at 9:34=E2=80=AFAM Julien Grall &lt;<a href=
=3D"mailto:julien@xen.org">julien@xen.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 08/06/2023 23:39, Stefano Stabellini wrote:<br>
&gt; Hi Jiatong,<br>
&gt; <br>
&gt; Do you have access to the serial? If so, it is possible that the boot<=
br>
&gt; is actually successful and it is only the screen initialization the<br=
>
&gt; problem.<br>
&gt; <br>
&gt; If kunpeng 920 is a UEFI/ACPI machine, we know that there are issues<b=
r>
&gt; with screen initialization.<br>
<br>
More importantly, you may want to check that if Xen was compiled with <br>
ACPI enabled (unlikely if this is the package from Debian). If not, you <br=
>
will need to build your own Xen.<br>
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><br><div>Best Regards,</div><div><br></div><div>Jiatong Shen=
</div></div></div>

--00000000000000deac05fda9304c--

