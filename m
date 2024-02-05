Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A117B849D3A
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 15:40:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676157.1052096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX099-00016p-Vy; Mon, 05 Feb 2024 14:40:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676157.1052096; Mon, 05 Feb 2024 14:40:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX099-00014j-TB; Mon, 05 Feb 2024 14:40:31 +0000
Received: by outflank-mailman (input) for mailman id 676157;
 Mon, 05 Feb 2024 14:40:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX098-00007n-BM
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 14:40:30 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8152a711-c434-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 15:40:28 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2d09faadba5so20792801fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 06:40:28 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a2e9088000000b002d0932543cdsm940125ljg.88.2024.02.05.06.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 06:40:27 -0800 (PST)
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
X-Inumbo-ID: 8152a711-c434-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707144028; x=1707748828; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XGQD37hKVqUpnFueHaxsgJwTWNtOEI0LC1x5sFXSaTU=;
        b=eCCiPXUCcVdSJBUm3KiYgUxr8KE70fNby5Q1oiN+wRifUg1EzUP2/XSJN76hKNffxu
         XjxHIlLg1SQTFdRFRYNnT1VSLPghT1Vzi9fekxlkp2euMCYLlJl+WNSvl5t//hV569S/
         5eClg042FA7Tcq4bulFPNrTkWlCSa2IXxH+7x6nmYiCo3eE2YnR+2WcgIEn9hCjCcUsQ
         OgVy9XUn0Xf2856dIfr6ir/GDqY2dWIb4RmPctKIUqPXh4yOjVf79SUeBaOzPxUEB8qf
         wLMGuZ9MfymUqRp50DGOkEPTbw3Iezm9IehR5KoTmRXDLqNulJQUEkFwqXY7mT4DopRq
         6LqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707144028; x=1707748828;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XGQD37hKVqUpnFueHaxsgJwTWNtOEI0LC1x5sFXSaTU=;
        b=MDkf7pmicPg1Aj6j24PewAck29/a9/2k4MyjdX15sA2sFPLRs+8yzwsNURShaUQxbR
         SQiMbyqKo/SbgNG3EcwB8VC+Yz6ls/XmiIn92wOEn2X7S7JbYhjnONwnLIfabCpyGipn
         xyJJZs/o6k8fOI6U5aovBD/T6n0ItzzkJDf+2oIVYUagsqVSClPbOInLcBuwAawclVt7
         W38XVaPxQdX5zw7kJpPXyU5dqEMdPZV6qfcjbdPBR5VzNv3sIkGjlmM0ozlhovrFX9uT
         YDFxyE0K+HQmV2uv0CAu6Ogqasl5lMgYNKuQSORKflyzusRS5lGM0B3DDCO6V/rvJD4E
         Vgsg==
X-Gm-Message-State: AOJu0YxgSh6WaLaQRsAQvGtfirOi84CAyM+LOYA/JoCDwPpv/VVzBC95
	16jtvA/QOr3/DIres5F7tfFnqg3yHp8g1SpgUM/S/zyVdQoE9Qz5
X-Google-Smtp-Source: AGHT+IEwornWo29oo9AHaoTgL7XfVBWkxNUiNYnSQnortDLO1rVn3k7WNNnwUJXQqP7a8T0cNWc6SA==
X-Received: by 2002:a2e:9bd8:0:b0:2d0:b244:5f09 with SMTP id w24-20020a2e9bd8000000b002d0b2445f09mr1002003ljj.51.1707144027533;
        Mon, 05 Feb 2024 06:40:27 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVTJUlUusCDwKe3Dp8gTrJ031Q4G8JRtHdCfZsCcBsxTMgu5r7MI4+44LRbnFmcLPxK4HUmddJuWRKGXmrshRV/lpsy0uaU+b8DWvsTJOAL/mkN/kqbSHh5upNRx/GDDAJ9EeshUy2Kb5VioXMrB5/GkBy3XYs1rOW86USxfCRAtX4cuk5WeIZMhl4387Wtw/zePXcjkbMXIsAE6EF2H7TyYb792Zasxfeto64rRF2mBcFyfyfSh1EL3H/kAR4BaogwRlIaIh15RlsHHLOn1Ta/4RqTcuoU76jTnvmuex2234N4mNSetnc=
Message-ID: <9f3cd4f8940d46b7698de0cb8038a252058e21f6.camel@gmail.com>
Subject: Re: [PATCH v3 31/34] xen/riscv: add minimal stuff to mm.h to build
 full Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Mon, 05 Feb 2024 15:40:26 +0100
In-Reply-To: <8b71122a-8446-4619-992e-ec2475e602d0@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <4411f6af38586074b347cd6005f19f9c670faa74.1703255175.git.oleksii.kurochko@gmail.com>
	 <d347c4d9-e93b-4937-8e33-e5fbbdcd6bfb@suse.com>
	 <f3858360fba14a2c5b794bdd0400cd7ab8e66f73.camel@gmail.com>
	 <44a9a92c-ac4c-43d0-bc1e-685818e4331d@suse.com>
	 <211e7d7fb7d52d0bc7dbb12d5619a39f98d5b21c.camel@gmail.com>
	 <8b71122a-8446-4619-992e-ec2475e602d0@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-02-05 at 15:05 +0100, Jan Beulich wrote:
> On 05.02.2024 13:49, Oleksii wrote:
> > On Mon, 2024-02-05 at 08:46 +0100, Jan Beulich wrote:
> > > On 02.02.2024 18:30, Oleksii wrote:
> > > > On Tue, 2024-01-23 at 14:03 +0100, Jan Beulich wrote:
> > > > > On 22.12.2023 16:13, Oleksii Kurochko wrote:
> > > > > > +/* Convert between Xen-heap virtual addresses and page-
> > > > > > info
> > > > > > structures. */
> > > > > > +static inline struct page_info *virt_to_page(const void
> > > > > > *v)
> > > > > > +{
> > > > > > +=C2=A0=C2=A0=C2=A0 BUG();
> > > > > > +=C2=A0=C2=A0=C2=A0 return NULL;
> > > > > > +}
> > > > > > +
> > > > > > +/*
> > > > > > + * We define non-underscored wrappers for above conversion
> > > > > > functions.
> > > > > > + * These are overriden in various source files while
> > > > > > underscored
> > > > > > version
> > > > > > + * remain intact.
> > > > > > + */
> > > > > > +#define virt_to_mfn(va)=C2=A0=C2=A0=C2=A0=C2=A0 __virt_to_mfn(=
va)
> > > > > > +#define mfn_to_virt(mfn)=C2=A0=C2=A0=C2=A0 __mfn_to_virt(mfn)
> > > > >=20
> > > > > Is this really still needed? Would be pretty nice if in a new
> > > > > port we
> > > > > could get to start cleanly right away (i.e. by not needing
> > > > > per-
> > > > > file
> > > > > overrides, but using type-safe expansions here right away).
> > > > We still need __virt_to_mfn and __mfn_to_virt as common code
> > > > use
> > > > them:
> > > > =C2=A0* xen/common/xenoprof.c:24:#define virt_to_mfn(va)
> > > > mfn(__virt_to_mfn(va))
> > >=20
> > > Are you meaning to enable this code on RISC-V.
> > Yes, that is what I meant.
>=20
> And why would you do that? Even Arm doesn't use it, and I'd expect no
> newer port would care about this very old interface.
Oh, sorry, I read your question wrongly. I am not going to enable that
config.

~ Oleksii

