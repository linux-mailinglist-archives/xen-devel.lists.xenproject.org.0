Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7038A83ACC0
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 16:05:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671079.1044212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSeoA-0001hF-5H; Wed, 24 Jan 2024 15:04:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671079.1044212; Wed, 24 Jan 2024 15:04:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSeoA-0001eW-1d; Wed, 24 Jan 2024 15:04:54 +0000
Received: by outflank-mailman (input) for mailman id 671079;
 Wed, 24 Jan 2024 15:04:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k9jB=JC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rSeo9-0001eO-0B
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 15:04:53 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec0f8755-bac9-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 16:04:50 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a2f79e79f0cso557088766b.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 07:04:50 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 vo14-20020a170907a80e00b00a31291a0d33sm604577ejc.26.2024.01.24.07.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 07:04:49 -0800 (PST)
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
X-Inumbo-ID: ec0f8755-bac9-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706108690; x=1706713490; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iZL5eUJZwTTNXwvq5U2y+Yu5rih1nBLci8An8OONLNE=;
        b=hU/3IQzklBhWuTCIG0xba56V2arTlM6u3f/mbfQdvE2CLfHNmt34ZvLgQDvFUJvbki
         26DGJWXQ+rqIbJuDC/X5FwaPvuzsXbvl0tnssuVgF/mOOfWUsFP6DSh7G915MyP3UmiU
         SOs0xhwA110jep5054z4s6SWZBMBnt42f/EvpuKSyGwWq1C3Qifua4X860LV2tomY4Il
         lAt11YjLgLww643NaxsHHjgsNYpVgpYhhw6OQJTlbfNtEgVcfpFEunxzqC+CMR6llqlM
         zWX1ekL+Ef0NG5Pfn1Y25PbWjpwsfvXugQfh2ZoTjdjB7tMI7I2U/t0r2JgJEG1N+7Yj
         +Lug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706108690; x=1706713490;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iZL5eUJZwTTNXwvq5U2y+Yu5rih1nBLci8An8OONLNE=;
        b=UGEe29ZfLOpe0KJk5USCnEWOdzmWW9Pwq8ZmrY7btf9yf3PkTvcwsP4GrhUJv8CXT+
         kJnqNDcdIs87tZ8yruXevr6FXUIhtGsKQ/aevQnN8hNeURw2H5+G0WlA8sx5NcTnmfgQ
         TUEVq8GvxKmRdn8T1YQec//fXxUHclKZX5Qod2PbCtYVCScjS0LalYW7qTplXBHVn7W0
         NcmW4ltFqvi05gcYXm5eUxv5ezkMp5/mDAoT5wQEah8+1PJzyJzmjeA0LTod5sQ58ipi
         WWKAUGUh/saQe8NZ+UjTDftr6mFmJsOBcyanB7yLFrbXCgwcwNgyR7zihnCCZ4SYnSza
         SU9g==
X-Gm-Message-State: AOJu0YyFVzzMktg2vvB3WLGlT37MRCSdqckwLp/ycX4cJPDpnYIigH67
	4J3Pt/edMkPjOpu+GMdSROK1nosy3M1jcrkmQZjOA+YNNl8MLScq
X-Google-Smtp-Source: AGHT+IFLVWgiv5+BAyhY3aUqs7vSHoU0SIGXbdkhW1jO3Ej8kWFoBsEdmIXkEw5TAzButHEoG+X1xw==
X-Received: by 2002:a17:907:c787:b0:a31:12cc:1977 with SMTP id tz7-20020a170907c78700b00a3112cc1977mr821937ejc.126.1706108689974;
        Wed, 24 Jan 2024 07:04:49 -0800 (PST)
Message-ID: <d1f0a6d418b228860f2e84b89bcbd18b430e9305.camel@gmail.com>
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
Date: Wed, 24 Jan 2024 17:04:48 +0200
In-Reply-To: <b7c58adb-f3e2-4089-bba4-3f7f0740f111@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <bb47caf6c275d8aea307b96e79828831eab4a703.1703255175.git.oleksii.kurochko@gmail.com>
	 <81e5cac4-90f0-4fff-b891-53ca73c61832@suse.com>
	 <05d685b0b7ccd329454a336b20351979bdf91ea4.camel@gmail.com>
	 <8e60f998-aeb4-4648-a3e9-d083bb8eefde@suse.com>
	 <2974faee197b0a60d6e7ac54356639706c2ecb43.camel@gmail.com>
	 <b7c58adb-f3e2-4089-bba4-3f7f0740f111@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Wed, 2024-01-24 at 12:24 +0100, Jan Beulich wrote:
> On 24.01.2024 10:34, Oleksii wrote:
> > On Tue, 2024-01-23 at 14:37 +0100, Jan Beulich wrote:
> > > On 23.01.2024 13:34, Oleksii wrote:
> > > > On Tue, 2024-01-23 at 12:14 +0100, Jan Beulich wrote:
> > > > > On 22.12.2023 16:13, Oleksii Kurochko wrote:
> > > > > > --- a/xen/common/Kconfig
> > > > > > +++ b/xen/common/Kconfig
> > > > > > @@ -47,6 +47,9 @@ config ARCH_MAP_DOMAIN_PAGE
> > > > > > =C2=A0config GENERIC_BUG_FRAME
> > > > > > =C2=A0	bool
> > > > > > =C2=A0
> > > > > > +config GENERIC_FIND_NEXT_BIT
> > > > > > +	bool
> > > > >=20
> > > > > There's no need for this, as ...
> > > > >=20
> > > > > > --- a/xen/lib/Makefile
> > > > > > +++ b/xen/lib/Makefile
> > > > > > @@ -3,6 +3,7 @@ obj-$(CONFIG_X86) +=3D x86/
> > > > > > =C2=A0lib-y +=3D bsearch.o
> > > > > > =C2=A0lib-y +=3D ctors.o
> > > > > > =C2=A0lib-y +=3D ctype.o
> > > > > > +lib-$(CONFIG_GENERIC_FIND_NEXT_BIT) +=3D find-next-bit.o
> > > > >=20
> > > > > ... you're moving this to lib/. Or have you encountered any
> > > > > issue
> > > > > with building this uniformly, and you forgot to mention this
> > > > > in
> > > > > the description?
> > > > I didn't check. My intention was to provide opportunity to
> > > > check if
> > > > an
> > > > architecture want to use generic version or not. Otherwise, I
> > > > expected
> > > > that we will have multiple definiotion of the funcion.
> > > >=20
> > > > But considering that they are all defined under #ifdef...#endif
> > > > we
> > > > can
> > > > remove the declaration of the config GENERIC_FIND_NEXT_BIT.
> > >=20
> > > What #ifdef / #endif would matter here? Whats in lib/ is intended
> > > to
> > > be
> > > generic anyway. And what is in the resulting lib.a won't be used
> > > by
> > > an
> > > arch if it has an arch-specific implementation.=C2=A0
> > If what is implemented in lib.a won't be used by an arch if it has
> > an
> > arch-specific implementation then, for sure, I have to drop
> > CONFIG_GENERIC_FIND_NEXT_BIT.
> > But I am not really understand if lib.a is linked with Xen, then it
> > should be an issue then if some arch implement find-next-bit
> > function
> > we will have to multiple definitions ( one in lib.a and one arch
> > specific ). Probably, I have to look at how it is done.
>=20
> You're aware how linking works? Objects are pulled out of archives
> only
> if there's no other definition for a to-be-resolved symbol provided
> by
> a particular object in the archive.
I wasn't aware about the case of the archive. Thanks for the
explanation.

>=20
> > > Problems could arise if
> > > an arch had an inline function colliding with the out-of-line
> > > one.
> > > But
> > > that's about the old case where I could see a need to make the
> > > building
> > > of one of the objects conditional. And you'll note that withing
> > > this
> > > Makefile there are pretty few conditionals.
> > Could you please clarify What does it mean "out-of-line" ?
>=20
> "not inline"
>=20
> > > > > > --- /dev/null
> > > > > > +++ b/xen/lib/find-next-bit.c
> > > > > > [...]
> > > > >=20
> > > > > I was going to ask that you convince git to actually present
> > > > > a
> > > > > proper
> > > > > diff, to make visible what changes. But other than the
> > > > > description
> > > > > says
> > > > > you don't really move the file, you copy it. Judging from
> > > > > further
> > > > > titles
> > > > > there's also nowhere you'd make Arm actually use this now
> > > > > generic
> > > > > code.
> > > > I wanted to do it separately, outside this patch series to
> > > > simplify
> > > > review and not have Arm specific changes in RISC-V patch
> > > > series.
> > >=20
> > > Then do it the other way around: Make a separate _prereq_ change
> > > truly
> > > moving the file.
> > So this one patch should be separated by 2? One which moves find-
> > next-
> > bit.c from Arm to xen/lib, and second where xen/lib/Makefile is
> > updated.
>=20
> No, that would break the Arm build. I suggested breaking out this
> patch from the series, and then doing what the description says:
> Actually move the file. I don't think I suggested splitting the
> patch. Even the breaking out of the series was only because you
> said "I wanted to do it separately, outside this patch series".
What I meant was that I would like to have a patch which introduces
generic version of find-next-bit in the current patch series and
provide a separate patch outside of the current patch series which
switches Arm to use generic version.

~ Oleksii

