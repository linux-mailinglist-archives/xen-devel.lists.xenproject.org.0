Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFFF83AD6D
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 16:34:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671108.1044273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSfG7-000203-Mo; Wed, 24 Jan 2024 15:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671108.1044273; Wed, 24 Jan 2024 15:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSfG7-0001wn-JY; Wed, 24 Jan 2024 15:33:47 +0000
Received: by outflank-mailman (input) for mailman id 671108;
 Wed, 24 Jan 2024 15:33:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k9jB=JC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rSfG5-0001Nz-V8
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 15:33:45 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f54f8ada-bacd-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 16:33:44 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-51008c86ecbso2295584e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 07:33:44 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a056402018100b00558e2a97fc2sm15001955edv.68.2024.01.24.07.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 07:33:43 -0800 (PST)
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
X-Inumbo-ID: f54f8ada-bacd-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706110424; x=1706715224; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VBUuETU9MYsN9kSlu7mn5y8qBarO7BzcQEFpS3xXJ6o=;
        b=J54VmRbciBI5tTHCUsh2FO13SFQDdk5v9/IlG0Esy7OH8pGJOKI6NV2XgtbW71uh4l
         I/rD7ZCufm+pD5DcKxGL21R+AhO85SEXKZa0B3AmN44i0znCc+aq55O7gDnEiMKB6rwu
         yrPTNSPERR3glLLBJIP+SZETk/5xruLY20v7/BxxFgGTwi1vGTaeeFDwEKRl2QMAG+p5
         uy9aOjFYmG0SdIR42y4SXj/0oRiJ1MC/I0qBUAE4FkN9YwzFPonqRm21pkYknPaw9B7d
         XKGZpeQnmM47/SFzvbdbzDiA3js7GXHk0Cd9OPXqgx5I18MY+SENjEJqWJ2g1cV/C7n7
         NKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706110424; x=1706715224;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VBUuETU9MYsN9kSlu7mn5y8qBarO7BzcQEFpS3xXJ6o=;
        b=atjpKZ4SAsqh040Qp6Ig9QmOgyyXXYSnQb5EVhBFvbaPYzyep4eV6spGnOXlQOOsJt
         3uo6MvnNBDeqVUHfnRtG5b5Y3cNkRrtSjc/yoI1nqKILYX/G97vYa+Ko26kVPLlICFN8
         PXbZDG707B6LpshCyid7ahpOm12FqFM9iKcDfuAQTi5pn4nHuq1Z6cQ2zGIZGO09Z5u/
         Q+k0AJ7NHDvXYaD9xYjXqz/GJyxtvyy+DJvgaJ1C0FoOMcSyejOMcnhPmY1efrO1l5Fk
         aAxIQ4vouTj/xCEZ7ICaDCatUNGEWEcePeRD4yKMxRTEU1mwk47UYPonkfrZmeUe56Eh
         QDuw==
X-Gm-Message-State: AOJu0Yx25ODOX770tMjRISPZIkC8zEG4tmqiclwX4DMa0RFoBeFUcN9I
	5L7nIhUaTq8moUh0S2e2uXsPVOy+V4UZR5ioKu7MUIKEe51k78J6
X-Google-Smtp-Source: AGHT+IHpVHMciTBxBZZkR6RuS0BRWTwDVud3E3zFzaK3ufaajg224uSGCV8FOVSivl3JBLih46plng==
X-Received: by 2002:a05:6512:3e01:b0:50e:ab9b:c32 with SMTP id i1-20020a0565123e0100b0050eab9b0c32mr4922936lfv.78.1706110423465;
        Wed, 24 Jan 2024 07:33:43 -0800 (PST)
Message-ID: <3ae77a2a9c37f0ea68ec7641f72f931ffc92f304.camel@gmail.com>
Subject: Re: [PATCH v3 30/34] xen/riscv: add minimal stuff to processor.h to
 build full Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Wed, 24 Jan 2024 17:33:42 +0200
In-Reply-To: <5f6c35ed-de1f-4a47-897d-33ed979b28db@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <5bd7c5db6638f09dabdc13a6e12f0b204eacb234.1703255175.git.oleksii.kurochko@gmail.com>
	 <aa4d18c5-a8e0-44a6-ae7e-16fd9cd029b4@suse.com>
	 <5f8291916b01a2b29a16bd1345fc20e3d4f29cab.camel@gmail.com>
	 <b8f47c93-43c4-4c61-a569-7d07e811c6ab@suse.com>
	 <22a0c2444201262202cd60d6d5a1cdff62c236bf.camel@gmail.com>
	 <5f6c35ed-de1f-4a47-897d-33ed979b28db@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Wed, 2024-01-24 at 12:27 +0100, Jan Beulich wrote:
> On 24.01.2024 11:12, Oleksii wrote:
> > On Wed, 2024-01-24 at 09:19 +0100, Jan Beulich wrote:
> > > On 23.01.2024 18:08, Oleksii wrote:
> > > > On Tue, 2024-01-23 at 12:39 +0100, Jan Beulich wrote:
> > > > > On 22.12.2023 16:13, Oleksii Kurochko wrote:
> > > > > > @@ -53,6 +56,18 @@ struct cpu_user_regs
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 unsigned long pregs;
> > > > > > =C2=A0};
> > > > > > =C2=A0
> > > > > > +/* TODO: need to implement */
> > > > > > +#define cpu_to_core(cpu)=C2=A0=C2=A0 (0)
> > > > > > +#define cpu_to_socket(cpu) (0)
> > > > > > +
> > > > > > +static inline void cpu_relax(void)
> > > > > > +{
> > > > > > +=C2=A0=C2=A0=C2=A0 /* Encoding of the pause instruction */
> > > > > > +=C2=A0=C2=A0=C2=A0 __asm__ __volatile__ ( ".insn 0x100000F" );
> > > > >=20
> > > > > binutils 2.40 knows "pause" - why use .insn then?
> > > > I thought that for this instruction it is needed to have
> > > > extension
> > > > ZIHINTPAUSE ( according to Linux Kernel source code [1] ) and
> > > > to
> > > > cover
> > > > older version.
> > >=20
> > > Well, of course you'll need to enable the extension then for gas.
> > > But
> > > as long as you use the insn unconditionally, that's all fine and
> > > natural. Another thing would be if you meant to also run on
> > > systems
> > > not supporting the extension: Then the above use of .insn would
> > > need
> > > to become conditional anyway.
> > Then it makes sense to use "pause".=C2=A0
> > Let's assume that for now we are running only on systems which
> > support
> > the extension until we won't face compilation issue for some
> > system.
>=20
> Gives me the impression that you still don't properly separate the
> two
> aspects: One is what systems Xen is to run on, and other is what's
> needed to make Xen build properly. The first needs documenting (and
> ideally at some point actually enforcing), while the latter may
> require
> e.g. compiler command line option adjustments.
I understand that it will be required update "-march=3D..._zihintpause"
and it should be a check that this extension is supported by a
toolchain.

But I am not sure that I know how can I enforce that a system should
have this extension, and considering Linux kernel implementation which
uses always pause instruction, it looks like all available systems
support this extension.

But I agree what I wrote above isn't fully correct.

~ Oleksii

