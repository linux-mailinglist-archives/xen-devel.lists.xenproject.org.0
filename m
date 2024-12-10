Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E833C9EB3E3
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 15:49:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852625.1266370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1Xr-0000EF-PU; Tue, 10 Dec 2024 14:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852625.1266370; Tue, 10 Dec 2024 14:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1Xr-0000Bg-MP; Tue, 10 Dec 2024 14:49:03 +0000
Received: by outflank-mailman (input) for mailman id 852625;
 Tue, 10 Dec 2024 14:49:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CVUM=TD=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tL1Xp-0000Ba-KS
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 14:49:01 +0000
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [2607:f8b0:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3659c5c-b705-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 15:48:59 +0100 (CET)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3eb790888c6so121004b6e.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 06:48:59 -0800 (PST)
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
X-Inumbo-ID: e3659c5c-b705-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1733842138; x=1734446938; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgtrdQl4jJcRWigYwaWojZ9z2pPJNU33XrppaF+9j5E=;
        b=LT+qmExJHfcAOYADRA09imqiUOCRUDE5DMIRTyo5kwxLgwFPUCEWdpmCxpBj71Z17N
         q8bofFJOewg1LAZz4h9eQ9maA/dnwlUuKZi6t268zrydHhpysgJf5p2/nbq4XJAix5yr
         +FN7qO+Z5BfFiYHCzeHgNzZZ97YQxUNUSy4bs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733842138; x=1734446938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgtrdQl4jJcRWigYwaWojZ9z2pPJNU33XrppaF+9j5E=;
        b=cyIwPnp12CgMsHONcuYVRnMN/6ulw+4lJcYCc69sCfhf8TdvUlkQf98a7fTkus3FRv
         zj3IfFk3fLiZfcCgpjkV1TmTOWznQiMoNpLqvMHBnxh8sXkVDHQImgDpqFCaySvYEFTa
         2iJLdznxmUw8Hov66KA6IBqhj1PROPrzVkkEFwHqAd5qMr1ZdVRY1gcJZFFIbtW8zNwj
         ifc4BNe88TO2O8dQxk5myGOb8QBBx6el/RGL0Fn9VnRGjGOcr34MZIL0RwqLvXUoeZeh
         vn9hYxzymPJKYO+/5yrX0ilAx0KBQEtyLb76m8Dk7nIARDwL7XFJtdezpLZrP2dEyQ7z
         BDmg==
X-Forwarded-Encrypted: i=1; AJvYcCXVoyKgTqdWllRZN1mMRjqIqVtERSxZWB+AZeNHX3wzE+rztSLk/fq3ZVaqY+B1ymFykYwKb+obfUQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyzRiiBxlA1iOe6ShhzyuCV5RFSy3/f+oCbmFkA+pJp119/JxrJ
	WB/i48sTMAKKQTxWRA71dXMttfoZikYbmbcGW/+N3h7LA2KkA92dnsxbxUplKRZr64juETDq/S6
	JFH0BA33OddgzltJdJgPQGMcby1kAnBZkeSXLRTcFYdMvy6Vn
X-Gm-Gg: ASbGnctXdqCJ87okniQELQfhASHoQ+QIoERT5iKmxWBPrgVmws0Hao4WSQmZqoIeAy9
	bDP3vkUr9JIGflOjySn1XTure4/qzZUur8iaijQ==
X-Google-Smtp-Source: AGHT+IGABqJQfwluXS5vdz2E6nETL+dL80NQkworXSk9lb23QutIK5vNp1ypfeMLMK1hoUAfSkuSdTTu2mM7M+kxsjQ=
X-Received: by 2002:a05:6870:b529:b0:29e:503a:7ea3 with SMTP id
 586e51a60fabf-29fee71c5b9mr2589715fac.36.1733842138442; Tue, 10 Dec 2024
 06:48:58 -0800 (PST)
MIME-Version: 1.0
References: <20241122093358.478774-1-frediano.ziglio@cloud.com>
 <20241122093358.478774-3-frediano.ziglio@cloud.com> <7f74b7a9-1869-4efa-a213-04d56ba48fb1@suse.com>
 <CACHz=Zhpk7HOULDjoK1==mLz-G8qcFLjo4ihWTuQxGqJ1u+zQQ@mail.gmail.com> <d245dcc2-49f8-4ada-9eb0-a922c1171b9d@suse.com>
In-Reply-To: <d245dcc2-49f8-4ada-9eb0-a922c1171b9d@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 10 Dec 2024 14:48:47 +0000
Message-ID: <CACHz=Zhf=B5mvNgTzhAJ6OkYtPFYnDg_TrMsfFsCPdPX64XWAQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] x86/boot: Use header to allows inclusion of public
 xen.h header
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 2:44=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 10.12.2024 15:35, Frediano Ziglio wrote:
> > On Tue, Dec 10, 2024 at 10:32=E2=80=AFAM Jan Beulich <jbeulich@suse.com=
> wrote:
> >>
> >> On 22.11.2024 10:33, Frediano Ziglio wrote:
> >>> This allows to include other headers and avoid duplicated declaration=
s.
> >>>
> >>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> >>
> >> Again it's left unclear what the purpose / goal is.
> >>
> >
> > Reduce duplication avoiding duplicate declarations. The alternative
> > would be to duplicate them, which was proposed already and refused as
> > duplication was not good.
>
> Which declarations specifically?
>
> >>> --- /dev/null
> >>> +++ b/xen/arch/x86/include/boot/public/xen.h
> >>> @@ -0,0 +1,28 @@
> >>> +/* SPDX-License-Identifier: GPL-2.0-only */
> >>> +
> >>> +/* This header allows the inclusion of public xen.h */
> >>> +
> >>> +#ifndef BOOT__PUBLIC__XEN_H
> >>> +#define BOOT__PUBLIC__XEN_H
> >>> +
> >>> +#if !defined(__XEN__) || defined(__XEN_TOOLS__) || __XEN__ !=3D 1
> >>> +#error Unexpected defines
> >>> +#endif
> >>
> >> What is this to guard against? We're in the Xen tree, building Xen.
> >>
> >
> > In include/public/arch-x86/xen.h file there are these declarations:
> >
> > #if defined(__i386__)
> > # ifdef __XEN__
> > __DeFiNe__ __DECL_REG_LO8(which) uint32_t e ## which ## x
> > __DeFiNe__ __DECL_REG_LO16(name) union { uint32_t e ## name; }
> > # endif
> > #include "xen-x86_32.h"
> > # ifdef __XEN__
> > __UnDeF__ __DECL_REG_LO8
> > __UnDeF__ __DECL_REG_LO16
> > __DeFiNe__ __DECL_REG_LO8(which) e ## which ## x
> > __DeFiNe__ __DECL_REG_LO16(name) e ## name
> > # endif
> > #elif defined(__x86_64__)
> > #include "xen-x86_64.h"
> > #endif
> >
> > This header allows us to include that part without compiler errors due
> > to __DeFiNe__ and __UnDeF__ not being C code.
>
> And why exactly can't 32-bit code simply include the compat variant of
> the public header, which is being generated by processing those non-C
> constructs?
>

I suppose I could solve that specific issue in that way. Where are
they generated?

> Jan

Frediano

