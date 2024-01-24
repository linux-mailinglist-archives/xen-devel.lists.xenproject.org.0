Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DFF83A588
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 10:34:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670850.1043909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSZe7-0002w6-VF; Wed, 24 Jan 2024 09:34:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670850.1043909; Wed, 24 Jan 2024 09:34:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSZe7-0002u1-SG; Wed, 24 Jan 2024 09:34:11 +0000
Received: by outflank-mailman (input) for mailman id 670850;
 Wed, 24 Jan 2024 09:34:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k9jB=JC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rSZe6-0002ts-Ju
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 09:34:10 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9c6265e-ba9b-11ee-98f5-6d05b1d4d9a1;
 Wed, 24 Jan 2024 10:34:09 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-510133ed214so305811e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 01:34:09 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a0564020e8c00b00557aa8d72c9sm16167140eda.25.2024.01.24.01.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 01:34:08 -0800 (PST)
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
X-Inumbo-ID: b9c6265e-ba9b-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706088849; x=1706693649; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UzfRtJKxBWFrwkUQPlxfRl0S//YXEUIvD8RXNlzy1hk=;
        b=UE1+9lMGvsnqodXSnbCzOTWmLkN6ErQvLB8WAHp4KZjFsjy4ShReLMFLFnzGVmdJIa
         JgsUGZJ3FTqjHLXNE+HR2ppeGxM94Sp3WXhGDZkVyIJLo/iC5aD1EJe/WWg5WKYPSslq
         FVc0JYT2dyfpJsAu/ppGYlOoLXe6rpUW4yeU444oV4r6HmlUA/yBMyPPm9BCtOqP46W1
         hV/vROZRvrEYuxLVnVj7YIq8kaoQYxRRe9OD/wvTfS7qczW9nZXNW6EqQq8BgV7dyMFS
         TGn8lStfBiRJ2PJV4L4jlNZP+gPsPzc00bXafBDWKATZy7rYReWHPhx7DPlSOFk3SSar
         tmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706088849; x=1706693649;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UzfRtJKxBWFrwkUQPlxfRl0S//YXEUIvD8RXNlzy1hk=;
        b=V1sV5DiUfzH8vyb66GIljLy/6znymHiR9xwzTwaVvLIyp7z8J3f/w/0jK8no0Oj6bk
         58EhIHKX/6QPPV4g/yFFi/4OrMSTdEFvE/J7ApIS2lWvqxs+rvoYZs5lNwjnYdPnM+vP
         BRm158woK2Sg60VuMWCxrfAW1h929DZzNyJubPA8s0yiqQkGxkJfAn7Q8U/eHWb+dR1Y
         6tViWZRgOaTYQibCS62iqYLhia0UxG3XXt7k1yQDUUrZSdA1ULhZRJ9PHl8B64FGk30b
         jmv4sWfPQR+F6zx5vq9h9N+HgtXHeU4wA8uK14+0aM3TxMEsn6JHdazifOCC71kFwFY+
         3R1g==
X-Gm-Message-State: AOJu0YxFE15gNQn7mQUC0duCCS9MRK8S3xtdy+mmJemKs9d4ZorIyFr1
	T4Ji1qoJgo++fkxj35Nn02AozenQ8fDXY6rVbVPh440Tf2GpMMiO
X-Google-Smtp-Source: AGHT+IEPZhHAUxhu2MAXxAn8Jc/Xtm9Zat35sWOpXWnm4qNL68kOxMCp4aAaQsLSWTDjSXsSieEgsw==
X-Received: by 2002:a05:6512:2206:b0:50e:3fbc:7c12 with SMTP id h6-20020a056512220600b0050e3fbc7c12mr3635733lfu.126.1706088848779;
        Wed, 24 Jan 2024 01:34:08 -0800 (PST)
Message-ID: <2974faee197b0a60d6e7ac54356639706c2ecb43.camel@gmail.com>
Subject: Re: [PATCH v3 16/34] xen/lib: introduce generic find next bit
 operations
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Wed, 24 Jan 2024 11:34:07 +0200
In-Reply-To: <8e60f998-aeb4-4648-a3e9-d083bb8eefde@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <bb47caf6c275d8aea307b96e79828831eab4a703.1703255175.git.oleksii.kurochko@gmail.com>
	 <81e5cac4-90f0-4fff-b891-53ca73c61832@suse.com>
	 <05d685b0b7ccd329454a336b20351979bdf91ea4.camel@gmail.com>
	 <8e60f998-aeb4-4648-a3e9-d083bb8eefde@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Tue, 2024-01-23 at 14:37 +0100, Jan Beulich wrote:
> On 23.01.2024 13:34, Oleksii wrote:
> > On Tue, 2024-01-23 at 12:14 +0100, Jan Beulich wrote:
> > > On 22.12.2023 16:13, Oleksii Kurochko wrote:
> > > > --- a/xen/common/Kconfig
> > > > +++ b/xen/common/Kconfig
> > > > @@ -47,6 +47,9 @@ config ARCH_MAP_DOMAIN_PAGE
> > > > =C2=A0config GENERIC_BUG_FRAME
> > > > =C2=A0	bool
> > > > =C2=A0
> > > > +config GENERIC_FIND_NEXT_BIT
> > > > +	bool
> > >=20
> > > There's no need for this, as ...
> > >=20
> > > > --- a/xen/lib/Makefile
> > > > +++ b/xen/lib/Makefile
> > > > @@ -3,6 +3,7 @@ obj-$(CONFIG_X86) +=3D x86/
> > > > =C2=A0lib-y +=3D bsearch.o
> > > > =C2=A0lib-y +=3D ctors.o
> > > > =C2=A0lib-y +=3D ctype.o
> > > > +lib-$(CONFIG_GENERIC_FIND_NEXT_BIT) +=3D find-next-bit.o
> > >=20
> > > ... you're moving this to lib/. Or have you encountered any issue
> > > with building this uniformly, and you forgot to mention this in
> > > the description?
> > I didn't check. My intention was to provide opportunity to check if
> > an
> > architecture want to use generic version or not. Otherwise, I
> > expected
> > that we will have multiple definiotion of the funcion.
> >=20
> > But considering that they are all defined under #ifdef...#endif we
> > can
> > remove the declaration of the config GENERIC_FIND_NEXT_BIT.
>=20
> What #ifdef / #endif would matter here? Whats in lib/ is intended to
> be
> generic anyway. And what is in the resulting lib.a won't be used by
> an
> arch if it has an arch-specific implementation.=C2=A0
If what is implemented in lib.a won't be used by an arch if it has an
arch-specific implementation then, for sure, I have to drop
CONFIG_GENERIC_FIND_NEXT_BIT.
But I am not really understand if lib.a is linked with Xen, then it
should be an issue then if some arch implement find-next-bit function
we will have to multiple definitions ( one in lib.a and one arch
specific ). Probably, I have to look at how it is done.

> Problems could arise if
> an arch had an inline function colliding with the out-of-line one.
> But
> that's about the old case where I could see a need to make the
> building
> of one of the objects conditional. And you'll note that withing this
> Makefile there are pretty few conditionals.
Could you please clarify What does it mean "out-of-line" ?
>=20
> > > > --- /dev/null
> > > > +++ b/xen/lib/find-next-bit.c
> > > > [...]
> > >=20
> > > I was going to ask that you convince git to actually present a
> > > proper
> > > diff, to make visible what changes. But other than the
> > > description
> > > says
> > > you don't really move the file, you copy it. Judging from further
> > > titles
> > > there's also nowhere you'd make Arm actually use this now generic
> > > code.
> > I wanted to do it separately, outside this patch series to simplify
> > review and not have Arm specific changes in RISC-V patch series.
>=20
> Then do it the other way around: Make a separate _prereq_ change
> truly
> moving the file.
So this one patch should be separated by 2? One which moves find-next-
bit.c from Arm to xen/lib, and second where xen/lib/Makefile is
updated.

>=20
> > Regarding a proper diff, you would like me to make git shows that
> > it
> > was copy from Arm and it is not newly created file. Am I understand
> > you
> > correctly?
>=20
> Not quite, I think. Git has move detection (and we've seen that in
> action in other patches of yours). So when truly moving a file, what
> (if anything) is changed is easily visible.
I think I am still a little bit confused. But I think the answer on my
question above can clarify that.

~ Oleksii

