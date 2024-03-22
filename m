Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BFC886C6A
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 13:55:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696864.1088058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rneQU-0004Ar-Ck; Fri, 22 Mar 2024 12:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696864.1088058; Fri, 22 Mar 2024 12:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rneQU-00048m-9E; Fri, 22 Mar 2024 12:55:14 +0000
Received: by outflank-mailman (input) for mailman id 696864;
 Fri, 22 Mar 2024 12:55:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L8LS=K4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rneQS-00048g-P0
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 12:55:12 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b6cbc2f-e84b-11ee-afe0-a90da7624cb6;
 Fri, 22 Mar 2024 13:55:11 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-513e6777af4so3870607e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Mar 2024 05:55:11 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 j5-20020a05651231c500b005139cc8eac0sm341449lfe.106.2024.03.22.05.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Mar 2024 05:55:10 -0700 (PDT)
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
X-Inumbo-ID: 6b6cbc2f-e84b-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711112111; x=1711716911; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WTJEqnKqXXDTO52MW7q91FCQbF34RdBsK1V7FUEPR64=;
        b=DGleBpfcfspwN8cGwyTU2n468riM2UgZEljHT1XlUF35DNmKMg55PisMkXOVnMaPEm
         GUdm//7hb9JT2NTHGw1bROlmFJzTjA90RIJPDWI4LHGYDmVcnJF9nltLkj/fu3KV4bkG
         HBwgvC7v6AFQeiXQMoIkZx2G+X8EBUkaxv4sYYHAkUmsddFDRxEhbQrvgWA/NOfsbaBO
         p/rsHMwJU+pzjW7lRH33/UlNMeFbINfG1fYDQf/dPFKxLhIkLiGnUAvFBj1dPdoYQ4Ij
         kv2PObuATy2cKlT4emv22CxpOImuLe3YIF2STEZoxucp+P8LQT5DfrwttyRhmAyVHtD+
         88+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711112111; x=1711716911;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WTJEqnKqXXDTO52MW7q91FCQbF34RdBsK1V7FUEPR64=;
        b=VQQoK6Vy5WxpeBsndWP8/PTcmLPfDg+5FVlcVZTnP1HYHvPYhhpUPnJXo+6jUyPEg4
         xDuapCRYyIeoVylaPJw8/93SRVlkvHnSygR9pl96p3mmU5cIV8E72/fxrKBTL9244EuJ
         5jnRpmEZx8W+WsyR31UBUgSLxEqu4oPQSZigwNytbrXHL51GZgnAsNbciLFAnaKfUGxo
         MczN55puswvbxn/780mR/R0Cc2d/74sGXPCErcFEuptJIODq4U6ivVzKivZe9ms707Gp
         aPflfh663cPyxF9csOK6a/g8D8h6NPMmpSIHxr604mAyTbvFqOZNVCn41eGza2y3XMGS
         663Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbVOTllB29a4IovjwPnoii2iegHnpnXoP4705LuKPi3CKTLhDvxgtl7H5lH9dvDptzKbKQgnVPIDwb2N8TC53GQU9HaAdnFTfxbH7rDOg=
X-Gm-Message-State: AOJu0YwaLKK1UgxCvz9ui5ozhkBvL7lcJk7Hb+4PS0PVLpgUq/UCLI99
	JysA8chdWld9Qix0AOSJ08sxtwBK9+CvvJP2A2UoJGfy7//Tf7sP
X-Google-Smtp-Source: AGHT+IHMY7YtG+6STD16si7FERrV+f+Z53pS02/u9lq7fTSZLlmjqHjQOy8b1u8wAUmeQixS46QTgw==
X-Received: by 2002:ac2:5214:0:b0:513:c50d:db59 with SMTP id a20-20020ac25214000000b00513c50ddb59mr1888190lfl.15.1711112111232;
        Fri, 22 Mar 2024 05:55:11 -0700 (PDT)
Message-ID: <c943c5f473d59806b612604553c094dad9133e99.camel@gmail.com>
Subject: Re: [PATCH v6 09/20] xen/riscv: introduce io.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Fri, 22 Mar 2024 13:55:10 +0100
In-Reply-To: <9b40aeeb-ca7a-47c0-acde-407631ae9db7@suse.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
	 <dae9f595e5afd1e6a46149919e6689afe263e1ce.1710517542.git.oleksii.kurochko@gmail.com>
	 <49dd40b6-4558-4e0c-b6ab-eee5b814dd8d@suse.com>
	 <2a2779011db8ba6db04e8d2e4355479b50e48e01.camel@gmail.com>
	 <9b40aeeb-ca7a-47c0-acde-407631ae9db7@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Fri, 2024-03-22 at 12:36 +0100, Jan Beulich wrote:
> On 22.03.2024 12:02, Oleksii wrote:
> > On Thu, 2024-03-21 at 13:27 +0100, Jan Beulich wrote:
> > > On 15.03.2024 19:06, Oleksii Kurochko wrote:
> > > > --- /dev/null
> > > > +++ b/xen/arch/riscv/include/asm/io.h
> > > > @@ -0,0 +1,167 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > +/*
> > > > + *=C2=A0 The header taken form Linux 6.4.0-rc1 and is based on
> > > > + *=C2=A0 arch/riscv/include/asm/mmio.h with the following changes:
> > > > + *=C2=A0=C2=A0 - drop forcing of endianess for read*(), write*()
> > > > functions
> > > > as
> > > > + *=C2=A0=C2=A0=C2=A0=C2=A0 no matter what CPU endianness, what end=
ianness a
> > > > particular
> > > > device
> > > > + *=C2=A0=C2=A0=C2=A0=C2=A0 (and hence its MMIO region(s)) is using=
 is entirely
> > > > independent.
> > > > + *=C2=A0=C2=A0=C2=A0=C2=A0 Hence conversion, where necessary, need=
s to occur at a
> > > > layer up.
> > > > + *=C2=A0=C2=A0=C2=A0=C2=A0 Another one reason to drop endianess co=
nversion is:
> > > > + *=C2=A0=C2=A0=C2=A0=C2=A0
> > > > https://patchwork.kernel.org/project/linux-riscv/patch/201904111156=
23.5749-3-hch@lst.de/
> > > > + *=C2=A0=C2=A0=C2=A0=C2=A0 One of the answers of the author of the=
 commit:
> > > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 And we don't know if Linux =
will be around if that
> > > > ever
> > > > changes.
> > > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The point is:
> > > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 a) the current RISC-V=
 spec is LE only
> > > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b) the current linux =
port is LE only except for this
> > > > little bit
> > > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 There is no point in leavin=
g just this bitrotting
> > > > code
> > > > around.=C2=A0 It
> > > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 just confuses developers, (=
very very slightly) slows
> > > > down
> > > > compiles
> > > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and will bitrot.=C2=A0 It also wo=
n't be any significant
> > > > help to
> > > > a future
> > > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 developer down the road doi=
ng a hypothetical BE RISC-
> > > > V
> > > > Linux port.
> > > > + *=C2=A0=C2=A0 - drop unused argument of __io_ar() macros.
> > > > + *=C2=A0=C2=A0 - drop "#define _raw_{read,write}{b,w,l,d,q}
> > > > _raw_{read,write}{b,w,l,d,q}"
> > >=20
> > > In the commit message I'm not worried as much, but at least here
> > > the
> > > odd mention
> > > of d as suffixes would better be purged.
> > Probably, I use incorrect words, but what I meant that it was
> > dropped:
> > =C2=A0=C2=A0 #define _raw_{read,write}{b,w,l,d,q}
> > _raw_{read,write}{b,w,l,d,q}
> > before declaration/definition of inline functions (
> > __raw_{read,write}{b,w,l,d,q} ).
>=20
> But where did you find a raw_readd() or raw_writed() (with no matter
> how
> many leading underscores)?
Oh, {d} options didn't exist. Missed that, wrote it automatically.
Thanks I'll update the commit message and the header comment.

~ Oleksii

