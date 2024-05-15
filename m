Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C52B8C69CA
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 17:32:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722522.1126582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Gbt-0000ad-EJ; Wed, 15 May 2024 15:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722522.1126582; Wed, 15 May 2024 15:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Gbt-0000Xc-AM; Wed, 15 May 2024 15:32:05 +0000
Received: by outflank-mailman (input) for mailman id 722522;
 Wed, 15 May 2024 15:32:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ly6O=MS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s7Gbr-0000V1-Q6
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 15:32:03 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 476b3fde-12d0-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 17:32:03 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52389c1308dso1648071e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 08:32:03 -0700 (PDT)
Received: from [192.168.226.248] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bea65b5sm9252304a12.6.2024.05.15.08.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 08:32:00 -0700 (PDT)
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
X-Inumbo-ID: 476b3fde-12d0-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715787123; x=1716391923; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bV5W8qkpNA6NJqllCxpyCGe72hVUACqRwRXGeTpi5L4=;
        b=aQZvLU1/GKoY+BPaJuICWv5vUkkBrcuCfpccaEwHKV9BbhDPE/iwLt0kfnvoA2sBia
         idWE6giOQLDq3+53t4rc2t35uvFGoyA/PAqYuG83FwQYlukVdTGbvA0zz6S/QW0lbHvP
         OWveBVmK+/Mg8Uk52igMVCVvPGA4DIZAbwLoR76IYC6PjAM0bzqsTrw21MURgwcU9n7Z
         6kShFwXIkZHaA/2VOANfnUXPtTMvYNumH2Sso52J/N/zkvvpt/4CWdOWoJcDnW8FkG+v
         9hE9y08OJXr1d59aKWYwveRs5itJUyaDj2C2/VYC3Ubk8qw3u9PRtZ8wR/WQ22x92hWK
         8i7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715787123; x=1716391923;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bV5W8qkpNA6NJqllCxpyCGe72hVUACqRwRXGeTpi5L4=;
        b=NasNhn3laaXJGzy6/WvXtrPTOuFnx4hTJPLRRDKChX4xBYZ/NEn+u8uBIclj2IeuGe
         UXzo31+HPz9mVIdBYZ4a6gvFSBXTXPAq6a4mlpOqrVDs3KwVrL9PkIGxonZpORk7KCuz
         KrFi8sYHhXa9sI2BsVYPeqjx2Bf/nOjpmmQO9ZUYjM4WaHvNWh1JOh94wzAseDjHJ1uV
         9bl06U5orzglEZ1LoIuw74O1xdnoAPuV404Ep4od3bufX6KCp8kNWjmXAiz+qfwGTYbM
         eJz/KsTjRk0nTgow6pU+VGXaH8XtuP2O7qZdtyX2qApmsLwdBa9n0vWyqK++5wdFvtyu
         JPvg==
X-Forwarded-Encrypted: i=1; AJvYcCWDF1ggT2e/FPlS0hI3wwgjHtpqotT/6D641sTPEt8iOi97TxkxiS69vLfGl+fWvBPPj4iI8dUzbE7Iof9oFl3x8N65VdxDr7wZvtN6LN4=
X-Gm-Message-State: AOJu0YxZm1DU3rAXmPtF7ZfVk65gSEiJXYajmeY+YxmaSvPv5WSXKMJj
	+RSKWuyMoYfxt1mB2PSB02VO/VOt0dCYB2xCjwwnPDDA0AfzDXVR
X-Google-Smtp-Source: AGHT+IEjg2E4GcwP/o0Qm0xWsyOPhy2uqP93kEieiqj87h8jTpNzzb5D15fuvUH7eo8zjEHDyOeR0Q==
X-Received: by 2002:a05:6512:2149:b0:516:e8b1:9ed5 with SMTP id 2adb3069b0e04-52210279e56mr8863916e87.59.1715787120647;
        Wed, 15 May 2024 08:32:00 -0700 (PDT)
Message-ID: <2b5281df104e265211b35a1d8fdc556857426574.camel@gmail.com>
Subject: Re: [PATCH v9 03/15] xen/bitops: implement fls{l}() in common logic
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Date: Wed, 15 May 2024 17:31:59 +0200
In-Reply-To: <ea90fd21-1ec4-46b5-b157-810466b3f0ab@suse.com>
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
	 <fe183f7e8ada7c3fb00ebf9b38f1fffffcc9c2d7.1714988096.git.oleksii.kurochko@gmail.com>
	 <c16c0554-c376-41f4-bfe8-04c977702a04@suse.com>
	 <46fd5c698fc13ffa3e8e82ed507bcfa67a9ef819.camel@gmail.com>
	 <ea90fd21-1ec4-46b5-b157-810466b3f0ab@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Wed, 2024-05-15 at 16:07 +0200, Jan Beulich wrote:
> On 15.05.2024 15:55, Oleksii K. wrote:
> > On Wed, 2024-05-15 at 11:09 +0200, Jan Beulich wrote:
> > > On 06.05.2024 12:15, Oleksii Kurochko wrote:
> > > > Changes in V9:
> > > > =C2=A0- update return type of fls and flsl() to unsigned int to be
> > > > aligned with other
> > > > =C2=A0=C2=A0 bit ops.
> > >=20
> > > But this then needs carrying through to ...
> > >=20
> > > > --- a/xen/arch/arm/include/asm/arm64/bitops.h
> > > > +++ b/xen/arch/arm/include/asm/arm64/bitops.h
> > > > @@ -22,17 +22,15 @@ static /*__*/always_inline unsigned long
> > > > __ffs(unsigned long word)
> > > > =C2=A0 */
> > > > =C2=A0#define ffz(x)=C2=A0 __ffs(~(x))
> > > > =C2=A0
> > > > -static inline int flsl(unsigned long x)
> > > > +static inline int arch_flsl(unsigned long x)
> > >=20
> > > ... e.g. here. You don't want to introduce signed/unsigned
> > > mismatches.
> > Do you mean that generic flsl() uses 'unsigned int' as a return
> > type,
> > but arch_flsl continue to use 'int'?
>=20
> Yes.
>=20
> > > Also why do you keep "inline" here, while ...
> > >=20
> > > > --- a/xen/arch/x86/include/asm/bitops.h
> > > > +++ b/xen/arch/x86/include/asm/bitops.h
> > > > @@ -425,7 +425,7 @@ static always_inline unsigned int
> > > > arch_ffsl(unsigned long x)
> > > > =C2=A0 *
> > > > =C2=A0 * This is defined the same way as ffs.
> > > > =C2=A0 */
> > > > -static inline int flsl(unsigned long x)
> > > > +static always_inline int arch_flsl(unsigned long x)
> > >=20
> > > ... you switch to always_inline here?
> > Because Adnrew's patch with bitops.h for x86 changes to
> > always_inline,
> > so to be consistent, at least, for architecture.
>=20
> And why not extend this to Arm?
No specific reason, just wanted to do minimal amount of necessary
changes. I'll do that in the the next patch version.

~ Oleksii

