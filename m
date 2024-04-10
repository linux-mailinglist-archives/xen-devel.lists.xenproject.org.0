Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD7589EFC6
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 12:24:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702995.1098751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruV86-0001m0-H2; Wed, 10 Apr 2024 10:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702995.1098751; Wed, 10 Apr 2024 10:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruV86-0001kG-DO; Wed, 10 Apr 2024 10:24:34 +0000
Received: by outflank-mailman (input) for mailman id 702995;
 Wed, 10 Apr 2024 10:24:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5G6/=LP=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1ruV84-0001kA-DK
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 10:24:32 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84cc6650-f724-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 12:24:31 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-56c5d05128dso7351761a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 03:24:31 -0700 (PDT)
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
X-Inumbo-ID: 84cc6650-f724-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712744671; x=1713349471; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=und2lZIMFp+EXPIJ10OTL9dUopKiN4VcTGNIt2LV+4I=;
        b=EOUABQ2nIBtRKjrZdgkuWkx7FwwwOKJByPEDrxOFR/ym7Dh5Xxutuo8JVbZHUdboXS
         sNmhWHDW/qjBkVlhctrbPT7qgJ/Fz5GE0CkGXne9nksMRtzhiGrDFNQMZ5dsO8C/a6q4
         SRC3Cn25Rw12f3vW7q1Yek83FK+YhFrbztRInaPJWPVxoIkKwSCBA7eXI+h53JMSZCHd
         s388JQ9JoXaeHGKw2V0k3USmTJx2qdF1gzxoH5D7twYz66g3FGNelMzq5m++rMrGCVI0
         5FmF/r4ArN9WhnOb060DcI5G0CUbwGmJPgDqoDu+UAtHs3EBqoampJY5hcakpttK+zQr
         7Ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712744671; x=1713349471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=und2lZIMFp+EXPIJ10OTL9dUopKiN4VcTGNIt2LV+4I=;
        b=uqALo3WjHg02l1DHpRFo3flrKgwxl6ghXNfhEmvfwXhnegLexezzlUfW8oEVeTRwG/
         71PyJYgtPzq/vYSN6zW8h72akz2WXFhjc5qVsYglrogeP9bUyzqfnAJyVfxJp4Swrc88
         tRmViqRH6vtkPAzinFLVs1ldf2pTwo6G0+kgmc7wbMXmHo+uVR5KlQXxUr0XcF0OBVqO
         Ms1QhN0n43K+7wA6t1Nhg9NNB5Hai7UeVrVkZUDAfPkFfyXIAU5Ew+gRMQYEYmVIoZak
         5cSkJgu503FNp5EHO6QoXuPf0xCekM2yq1hbDVn8ALP//xYcYEIw3k9ZCDaYnZmODjgv
         0xOw==
X-Gm-Message-State: AOJu0YwQkzMGksd9anRDKwZvGl6lzi6MV1MnDzjdAZTGgNx21HMGFDki
	E1INA2Bn7OGWtRs5kKKcvez8SJ4z2X4e48CRdgBaT0iO5qiu3CI+7vfwjaMwAajGSMIcdHkwV8y
	Yrccrhx7dcOdKiWvqtDUZBgPnglE=
X-Google-Smtp-Source: AGHT+IH7ZbyWXQ+Q6XCtwUG1D6xf5VCyjubmwLL5d20Q6/HCgzIvdqi9jrPS4x5MxgN9rrd9Sx/SqkTpSGQ7T77AdAU=
X-Received: by 2002:a50:a415:0:b0:56e:cde:8983 with SMTP id
 u21-20020a50a415000000b0056e0cde8983mr1474424edb.7.1712744670775; Wed, 10 Apr
 2024 03:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240410091947.1498695-1-edgar.iglesias@gmail.com>
 <20240410091947.1498695-2-edgar.iglesias@gmail.com> <9f12ebbb-5080-4eff-a965-8d5ab8e3ccd0@citrix.com>
In-Reply-To: <9f12ebbb-5080-4eff-a965-8d5ab8e3ccd0@citrix.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Wed, 10 Apr 2024 12:24:18 +0200
Message-ID: <CAJy5ezraDhjVvAp_VCG0FO0smNK7=5goVOwcnCEY_8LycjwWYQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/2] xen/arm64: entry: Use xen/linkage.h to
 annotate symbols
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
	bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
	jbeulich@suse.com, edgar.iglesias@amd.com
Content-Type: multipart/alternative; boundary="000000000000b152ac0615bb714e"

--000000000000b152ac0615bb714e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2024 at 12:21=E2=80=AFPM Andrew Cooper <andrew.cooper3@citr=
ix.com>
wrote:

> On 10/04/2024 10:19 am, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> >
> > Use the generic xen/linkage.h macros when annotating symbols.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > ---
> >  xen/arch/arm/arm64/entry.S | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
> > index f963c923bb..6188dd2416 100644
> > --- a/xen/arch/arm/arm64/entry.S
> > +++ b/xen/arch/arm/arm64/entry.S
> > @@ -480,9 +480,9 @@ guest_fiq_invalid_compat:
> >  guest_error_compat:
> >          guest_vector compat=3D1, iflags=3DIFLAGS__AI_, trap=3Dguest_se=
rror
> >
> > -ENTRY(return_to_new_vcpu32)
> > +FUNC(return_to_new_vcpu32)
> >          exit    hyp=3D0, compat=3D1
>
> In the new world, you want an END() too, which sets the size of the symbo=
l.
>
> A good cross-check of this annotation stuff is:
>
> readelf -Wa xen-syms | grep return_to_new_vcpu32
>
> which in this case will tell you that the symbol called
> return_to_new_vcpu32 still has a size of 0.
>

Thanks Andrew,

Patch 2/2 adds the END, I should probably have squashed them into one...

Best regards,
Edgar

--000000000000b152ac0615bb714e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 10, 2024 at 12:21=E2=80=
=AFPM Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.com">andrew=
.cooper3@citrix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 10/04/2024 10:19 am, Edgar E. Iglesias wrote:<br>
&gt; From: &quot;Edgar E. Iglesias&quot; &lt;<a href=3D"mailto:edgar.iglesi=
as@amd.com" target=3D"_blank">edgar.iglesias@amd.com</a>&gt;<br>
&gt;<br>
&gt; Use the generic xen/linkage.h macros when annotating symbols.<br>
&gt;<br>
&gt; Signed-off-by: Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@=
amd.com" target=3D"_blank">edgar.iglesias@amd.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 xen/arch/arm/arm64/entry.S | 12 ++++++------<br>
&gt;=C2=A0 1 file changed, 6 insertions(+), 6 deletions(-)<br>
&gt;<br>
&gt; diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S<b=
r>
&gt; index f963c923bb..6188dd2416 100644<br>
&gt; --- a/xen/arch/arm/arm64/entry.S<br>
&gt; +++ b/xen/arch/arm/arm64/entry.S<br>
&gt; @@ -480,9 +480,9 @@ guest_fiq_invalid_compat:<br>
&gt;=C2=A0 guest_error_compat:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guest_vector compat=3D1, iflags=3DIF=
LAGS__AI_, trap=3Dguest_serror<br>
&gt;=C2=A0 <br>
&gt; -ENTRY(return_to_new_vcpu32)<br>
&gt; +FUNC(return_to_new_vcpu32)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit=C2=A0 =C2=A0 hyp=3D0, compat=3D=
1<br>
<br>
In the new world, you want an END() too, which sets the size of the symbol.=
<br>
<br>
A good cross-check of this annotation stuff is:<br>
<br>
readelf -Wa xen-syms | grep return_to_new_vcpu32<br>
<br>
which in this case will tell you that the symbol called<br>
return_to_new_vcpu32 still has a size of 0.<br></blockquote><div><br></div>=
<div>Thanks Andrew,</div><div><br></div><div>Patch 2/2 adds the END, I shou=
ld probably have squashed them into one...</div><div><br></div><div>Best re=
gards,</div><div>Edgar</div><div><br></div></div></div>

--000000000000b152ac0615bb714e--

