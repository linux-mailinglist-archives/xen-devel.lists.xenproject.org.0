Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0749AB500BC
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 17:13:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117158.1463352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw01t-0007LP-E3; Tue, 09 Sep 2025 15:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117158.1463352; Tue, 09 Sep 2025 15:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw01t-0007Is-B2; Tue, 09 Sep 2025 15:13:09 +0000
Received: by outflank-mailman (input) for mailman id 1117158;
 Tue, 09 Sep 2025 15:13:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wvTB=3U=cloud.com=gerald.elder-vass@srs-se1.protection.inumbo.net>)
 id 1uw01r-0007Im-VN
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 15:13:08 +0000
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [2607:f8b0:4864:20::1136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d1045ef-8d8f-11f0-9d13-b5c5bf9af7f9;
 Tue, 09 Sep 2025 17:13:07 +0200 (CEST)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-71d603a269cso45772237b3.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Sep 2025 08:13:07 -0700 (PDT)
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
X-Inumbo-ID: 7d1045ef-8d8f-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1757430786; x=1758035586; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pxhv7TS3R+BEZMycgEqq+/8pSMfxSRVr+AeF7u8T4Jk=;
        b=EdsSQ+quC+/33HwBXy5/7Gz2WzbHPss+lJmx0n/62NSqPFiddA0FZt+VGC9lnjlyrB
         RxrqqIb627WLNI4IFzwLSCx/oe1sojXRC/F1lXwIyCSCo9mbyhO/iOCEBerkOZ6c+Hr+
         MaB8i9sI5DnN4zNY7kz5HCmQBU57eQBDuEmrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757430786; x=1758035586;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pxhv7TS3R+BEZMycgEqq+/8pSMfxSRVr+AeF7u8T4Jk=;
        b=WfPk/O0uVLOL+AT4I2XeSU+yom4/3pyLwpft7rjjRUZ3MLz+VoMYTS2lmy4W8M5flp
         55ggg/I9vkNTqLsHaf3TEFEMk25mbQf9AWL0VMn2Op5eEZDjQsZD7ei0esMWfWDGbSRw
         H9hkhTyECaWsSHW0le9RAzHjmJ+9PfwbBsY/bF2cxNkEPRQA1NZI7j0DOHqeyrIZVwH9
         SxFA+BI7FFXCCb22xQJVOWt8uQCFV4YbRaFMOKDYeXdzlrSyBpKfuli+el+XobzuZfVT
         0efoQs5APFKAh00+pCfrbzrWFDDGGZEbuJanWxgUcezNkShzEj5PWA8ElhcROldWjbfp
         2hCQ==
X-Gm-Message-State: AOJu0Yyt7XApEhdu+y/CiQqpryf/TZKB/cOLviIFi2VySMh/ezMox4mj
	bFv4y8tH9Zc36EmrSQY9e7eD391FkywX5inY5GeJ4LzeXQboAxr9J6g/cFL8aD250M+PB3AtTdd
	nddk70tCt7K4CeIa9Wh/zPow/yWzgQt5Te5n2hMfXXnm2yAYYhUyt
X-Gm-Gg: ASbGnctUC8Ur1Al8NbGILqTo2ALG/6s770jHqJq4nhCYhgLPfhXSed0e9kx5FRkeUd8
	mWUYm+zPUp6OLaIczm3aHdN4OeO/IuNOx+TKOYBUtragCqs60Hb8neg8KvNLBGg5jvM6Zx0fHAS
	X27M9fAjUMmJ2LxMoV6+49M8MpRPRKIwEVM0+aiDydifXTI+TVA4tkz0PezrHj3syBXbdHK6ght
	Ge1fA==
X-Google-Smtp-Source: AGHT+IEb3ilDdI5KI07EmYGd570ZUWis5ue4km/apKAvqsyRUfkXGnmBMfT8ygjUyTv2utd/k5gX5qK15X5s2SGDv7I=
X-Received: by 2002:a05:690c:d85:b0:71b:f632:54a7 with SMTP id
 00721157ae682-727f2ad75admr101427317b3.4.1757430785588; Tue, 09 Sep 2025
 08:13:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1757421999.git.gerald.elder-vass@cloud.com> <f14b3b9c-5646-4517-b3c5-b1eaffddaa0f@suse.com>
In-Reply-To: <f14b3b9c-5646-4517-b3c5-b1eaffddaa0f@suse.com>
From: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Date: Tue, 9 Sep 2025 16:12:55 +0100
X-Gm-Features: AS18NWBwO2WXeiKYgBCiji89XbxWmBh-jq6rK6PHS0Q5EqToIA70HXp0ndNnt_E
Message-ID: <CAOJ+D-UPMoX2QfO-QKLzntKn4WWzZDau2e+ZQmA+2viCigykXA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] efi: Support Shim LoadImage
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000b157e0063e5fbddb"

--000000000000b157e0063e5fbddb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Apologies I did not realise, as there were outstanding comments I assumed
more changes were required

*Gerald Elder-Vass*
Senior Software Engineer

XenServer
Cambridge, UK

On Tue, Sep 9, 2025 at 4:09=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:

> On 09.09.2025 16:52, Gerald Elder-Vass wrote:
> > Support Shim LoadImage protocol but keep Shim Lock for compatibility
> >
> >
> https://gitlab.com/xen-project/people/geraldev/xen/-/pipelines/2029800410
> > - Saw known unrelated debian-12-x86_64 issue
> >
> > Gerald Elder-Vass (1):
> >   efi: Support using Shim's LoadImage protocol
> >
> > Ross Lagerwall (1):
> >   efi: Add a function to check if Secure Boot mode is enabled
>
> You realize that both patches have gone in already, so adjustments need t=
o
> be incremental patches now?
>
> Jan
>

--000000000000b157e0063e5fbddb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Apologies I did not realise, as there were outstandin=
g=C2=A0comments I assumed more changes were required</div><div><div dir=3D"=
ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div><b><br></b></div><div><b>Gerald Elder-Vass</b></div><div>Seni=
or Software Engineer</div><div><br></div><div>XenServer</div><div>Cambridge=
, UK</div></div></div></div></div><br><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 9, 2025 at 4:=
09=E2=80=AFPM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich=
@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 09.09.2025 16:52, Gerald Elder-Vass wrote:<br>
&gt; Support Shim LoadImage protocol but keep Shim Lock for compatibility<b=
r>
&gt; <br>
&gt; <a href=3D"https://gitlab.com/xen-project/people/geraldev/xen/-/pipeli=
nes/2029800410" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/xen=
-project/people/geraldev/xen/-/pipelines/2029800410</a><br>
&gt; - Saw known unrelated debian-12-x86_64 issue<br>
&gt; <br>
&gt; Gerald Elder-Vass (1):<br>
&gt;=C2=A0 =C2=A0efi: Support using Shim&#39;s LoadImage protocol<br>
&gt; <br>
&gt; Ross Lagerwall (1):<br>
&gt;=C2=A0 =C2=A0efi: Add a function to check if Secure Boot mode is enable=
d<br>
<br>
You realize that both patches have gone in already, so adjustments need to<=
br>
be incremental patches now?<br>
<br>
Jan<br>
</blockquote></div>

--000000000000b157e0063e5fbddb--

