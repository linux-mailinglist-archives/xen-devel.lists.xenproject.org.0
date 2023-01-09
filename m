Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 385FB6620B1
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 09:55:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473397.733973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEnwB-0000cd-EU; Mon, 09 Jan 2023 08:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473397.733973; Mon, 09 Jan 2023 08:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEnwB-0000Zw-BV; Mon, 09 Jan 2023 08:55:23 +0000
Received: by outflank-mailman (input) for mailman id 473397;
 Mon, 09 Jan 2023 08:55:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GnCm=5G=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pEnwA-0000Zq-2g
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 08:55:22 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59026008-8ffb-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 09:55:21 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id bp15so11864142lfb.13
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jan 2023 00:55:21 -0800 (PST)
Received: from [192.168.0.145] ([195.234.76.149])
 by smtp.gmail.com with ESMTPSA id
 n26-20020a05651203fa00b0049464d89e40sm1502263lfq.72.2023.01.09.00.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 00:55:20 -0800 (PST)
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
X-Inumbo-ID: 59026008-8ffb-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nYOajGftRdTkdrjBSRQwUgFFIaAX9r6zGeq9XIW/ws4=;
        b=DdkCHQiSyTD2dFrDCmzf+zYN4WGp1iT2WSB2urYTar/CCN4vroT6ukONTKtx5PYcWA
         bu3A1mUs2SX74BOxqBjJw3XvWY+WhgLsXVqV9mMhkpr7bs+9g4amaer0Gq5EYo02/Uyz
         OQAm4s092ior6vzU5dPTLf06ED7doJ2QpPmhjXhAevABzNOBvuZ5A6YovJfTzyGs5jRx
         P0xqRhGh+5yzCXQliJSIoS6x1tSSjrEaiR5v1WhNFHW2RluDdoDc6MJENu3Z8sDH+aiF
         R64RRPAOs0d1nIqjPNcbKzPoUMkx5xvG2e68n+vvHckp+XzI8ad0kImALUzj4RR1XKRC
         7eEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nYOajGftRdTkdrjBSRQwUgFFIaAX9r6zGeq9XIW/ws4=;
        b=25RHpqYXefMdCFw3yaHFRzMuQsTMnrypurMyiltwaTY1UzcAc2ZK/pXk/X1MvIf12r
         ncY6cNk6bpMwjy0mthxNULiDY9AuLfFtdGoLNI8ntgPsyRE6WiY+G5Gx72wV/62Ca1Q6
         7PzaIGfWdElkHRfhi1FOmlLq+9s16GgPxCtWyBJf/tGFNDmEkI5jKgWix5rbCUJH2igU
         H52mkv+1jFu6EPrFzMRsrHPIFzCyA9X0PTf4LZrScXimykHxeBnDJJ5r2bY41R74o7rC
         NNUwTFHbcxuQnGY6Q0owFomoXjXn7shgw7rcYevFwrcSH4u3vuyZQJKgWC+RrmPbfbx5
         upnw==
X-Gm-Message-State: AFqh2kqjl9//y0grZLllU/5BAPUfJCX26M+gwNxUJNtL40tBYviOW7nD
	/uk9LoV94nwwnOgqqyICnWM=
X-Google-Smtp-Source: AMrXdXvhMxVXiiZqFaweyeLj5UV+VElqYeT2rSPHzTV9zTcfjhd6AHcMj6YW2lk4qTHMexNBt7Kj5A==
X-Received: by 2002:a05:6512:6d6:b0:4a4:68b9:609b with SMTP id u22-20020a05651206d600b004a468b9609bmr21181328lff.38.1673254520712;
        Mon, 09 Jan 2023 00:55:20 -0800 (PST)
Message-ID: <572f67e83b0da55acf28d15826a3ecde43b6c8a5.camel@gmail.com>
Subject: Re: [PATCH v1 2/8] xen/riscv: introduce asm/types.h header file
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>,
 xen-devel@lists.xenproject.org
Date: Mon, 09 Jan 2023 10:55:19 +0200
In-Reply-To: <204d2288-df9a-0d53-2c42-a52ad0c0c0f7@suse.com>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
	 <ce66a86285e966700acb13521851aca5b764a56e.1673009740.git.oleksii.kurochko@gmail.com>
	 <204d2288-df9a-0d53-2c42-a52ad0c0c0f7@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0

On Fri, 2023-01-06 at 15:12 +0100, Jan Beulich wrote:
> On 06.01.2023 14:14, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0xen/arch/riscv/include/asm/types.h | 73
> > ++++++++++++++++++++++++++++++
> > =C2=A01 file changed, 73 insertions(+)
> > =C2=A0create mode 100644 xen/arch/riscv/include/asm/types.h
> >=20
> > diff --git a/xen/arch/riscv/include/asm/types.h
> > b/xen/arch/riscv/include/asm/types.h
> > new file mode 100644
> > index 0000000000..48f27f97ba
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/types.h
> > @@ -0,0 +1,73 @@
> > +#ifndef __RISCV_TYPES_H__
> > +#define __RISCV_TYPES_H__
> > +
> > +#ifndef __ASSEMBLY__
> > +
> > +typedef __signed__ char __s8;
> > +typedef unsigned char __u8;
> > +
> > +typedef __signed__ short __s16;
> > +typedef unsigned short __u16;
> > +
> > +typedef __signed__ int __s32;
> > +typedef unsigned int __u32;
> > +
> > +#if defined(__GNUC__) && !defined(__STRICT_ANSI__)
> > +#if defined(CONFIG_RISCV_32)
> > +typedef __signed__ long long __s64;
> > +typedef unsigned long long __u64;
> > +#elif defined (CONFIG_RISCV_64)
> > +typedef __signed__ long __s64;
> > +typedef unsigned long __u64;
> > +#endif
> > +#endif
>=20
> Of these, only the ones actually needed should be introduced. We're
> in the process of phasing out especially the above, but also ...
>=20
Got it. I will take it into account when the next version of patch
series will be ready.
> > +typedef signed char s8;
> > +typedef unsigned char u8;
> > +
> > +typedef signed short s16;
> > +typedef unsigned short u16;
> > +
> > +typedef signed int s32;
> > +typedef unsigned int u32;
> > +
> > +#if defined(CONFIG_RISCV_32)
> > +typedef signed long long s64;
> > +typedef unsigned long long u64;
>=20
> ... all of these.
>=20
> > +typedef u32 vaddr_t;
>=20
> (New) consumers of such types should therefore use {u,}int<N>_t
> instead.
>=20
> Jan


