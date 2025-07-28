Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C54B13F88
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 18:07:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061747.1427342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugQNo-00046E-Ag; Mon, 28 Jul 2025 16:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061747.1427342; Mon, 28 Jul 2025 16:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugQNo-00044S-80; Mon, 28 Jul 2025 16:07:24 +0000
Received: by outflank-mailman (input) for mailman id 1061747;
 Mon, 28 Jul 2025 16:07:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+J0z=2J=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1ugQNm-0003pW-Lm
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 16:07:22 +0000
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [2607:f8b0:4864:20::933])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0911727-6bcc-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 18:07:20 +0200 (CEST)
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-87f32826f22so35450241.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 09:07:20 -0700 (PDT)
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
X-Inumbo-ID: f0911727-6bcc-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753718839; x=1754323639; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Yj5zrjv1A2u1LA+HuVBSJBwA6lsXBLIb+9HdIpubRg=;
        b=kc/0BI4P7MnMqpZtdhzUs3NWuMRfD8u4OOpgS5JdBXFZjJygP4XhrXNDnKvg4G3B8k
         98zAGz4Q4gacNXzWgjevhgUsDe+VFnYKi/RJV6CUNe+4LOp4Y6TYkJrJifxQxGi5UOTc
         XqpB0+v43wNceQ3E7mWjxW4bgb0lm1emd3HT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753718839; x=1754323639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Yj5zrjv1A2u1LA+HuVBSJBwA6lsXBLIb+9HdIpubRg=;
        b=tkhX/qQTI/3E0TdvvC/i/chmIeVOamfkTV2gNlY9ion0ZdtursCNttksA1/XtXgygB
         IZ8xhRJrxp1AVGqHvpSW/QesIYqTgCbexNRbFdvTC+X/3XEnbswfQp9+N5XKpC2nsyNf
         lW/NZFOI4H/neN4SPnG25o/1wrH8CUnx/EbJPMHeXFqr4r3T6geCbDNic3dIkVEHwZau
         LOoM24RUky4Six5tL00xgE1O8NCZlVq7u2BdGU0iZ09cKymW9udO0a6o7yrLxgAMRfTX
         KSYDzMmjuHdneQd9VhPtLT6K03kfE4xRRcUny3xCvXeOZh7wOsK+0LC4u6iExfa2x4Ww
         cUtw==
X-Gm-Message-State: AOJu0YzPp9PMTFrirLZ2Q3Ww/WoXNjhz7NrSz1YytK/KhIC7hrTx/l6B
	I295FtWH6kAuJWlrnX4R1Sivds9EjHtI+tpxKPim3gm0WaOlvUFlsoA2ILX6/6pMiUWu87kExaA
	Co0FTHBwHzppzkkoPZjjARzRjvI0Bc5xFtMK2LFm02A==
X-Gm-Gg: ASbGncsKGogbrscP2mBSI1zibj3AoSuuqMwAH0BXR3JYvSr+mOEfp9nMCn+byrZbGaN
	bieM8MedPzQVXSdu4x4CtFuorI11sGRIosfiN+rB2WTQmlml77kB9rMEuMgEfcOFNMaUKMkAn8U
	LvytI+KIi/daxqsA/CWWVlQIulscM+8OgneZWcxGDsmgbjwW0QJIknftsdaBaPVJn1PnDEQZjCz
	B8L3dUzEg==
X-Google-Smtp-Source: AGHT+IFVDz1N/D17VMGNolDUQloe1+FH7v/uTwlkzhC5N3HRlAD8wn0fCuf8nAQhIOtaTrbiDWfAQqTaSguev0Jn4TY=
X-Received: by 2002:a05:6122:4f97:b0:524:2fe0:61bc with SMTP id
 71dfb90a1353d-5390f4c41a2mr146700e0c.5.1753718839237; Mon, 28 Jul 2025
 09:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1753372928.git.edwin.torok@cloud.com> <99651231c4b535cdba21c852f3ec7c28c00a8088.1753372928.git.edwin.torok@cloud.com>
 <e309b129-32d9-467a-8577-c25771721e47@suse.com>
In-Reply-To: <e309b129-32d9-467a-8577-c25771721e47@suse.com>
From: Edwin Torok <edwin.torok@cloud.com>
Date: Mon, 28 Jul 2025 17:07:08 +0100
X-Gm-Features: Ac12FXwh8m1LOKiwLfxrHna1WKrNUtrL3B6GIxLQCIwXJCRKaEGSu-xIGTytRfU
Message-ID: <CAEfZLvkpj6_BhkCL0YfyTb89k=Vkb=qk7wRA3+mMhqKSQmYpBg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 03/10] arch-x86/pmu.h: convert ascii art drawing to Unicode
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	andriy.sultanov@vates.tech, boris.ostrovsky@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 28, 2025 at 11:23=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 25.07.2025 17:06, Edwin T=C3=B6r=C3=B6k wrote:
> > Use `aa2u` (ascii-art-to-unicode from Hackage) to convert to
> > Unicode box drawing characters.
> >
> > The full list of supported drawing characters can be seen in the
> > examples at:
> > https://github.com/fmthoma/ascii-art-to-unicode/blob/master/src/Text/As=
ciiArt.hs
> >
> > For future maintenance: conversion can be done incrementally
> > (mixing ascii art with already converted Unicode,
> >  and running the conversion tool again), or by hand.
> >
> > No functional change.
> >
> > Signed-off-by: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
> > ---
> >  xen/include/public/arch-x86/pmu.h | 120 +++++++++++++++---------------
> >  1 file changed, 60 insertions(+), 60 deletions(-)
>
> I'm already unconvinced of the earlier patch: The whole construct isn't s=
elf-
> explanatory, and it lacks a legend. There's also the question of legibili=
ty.
> The change here has the main problem of making readability dependent upon=
 the
> capabilities of the editor / viewer / etc one is using. For example, the =
'=E2=94=86'
> character as well as the arrow ones I can't get Win10's console subsystem=
 to
> display properly.
>

The original ASCII diagram could also be moved to another file that
contains only documentation and is not used during compilation.
There is https://ivanceras.github.io/svgbob-editor/ which can then
create an SVG out of it if needed.
The SVG (or its ASCII source) wouldn't be restricted to 80 chars, and
could contain more details.

Although if it is a separate file it is more likely to go stale when
the .h is updated.

Here is a solution that works with ASCII instead then (the diagram
itself is not very readable in pure ASCII).
I think my main goal was to understand what the flexible array member
would contain, and that could actually be explained in a sort of
pseudo-C.
Something like:

```
struct ... {
 uint32_t fixed_counters;
 uint32_t arch_counters;
....
  union {
      uint64_t regs[];
      struct {
           uint64_t fixed[fixed_counters];
           struct xen_pmu_cntr_pair arch[arch_counters];
      }
  }
}
```

This isn't (yet?) valid C, although it follows the trend the C
standard is evolving to, e.g. you can already refer to array
dimensions in function arguments, where the array dimension is another
function argument, in fact the manpages already started to get updated
to follow this new style, and newer versions of GCC support it, e.g.
memcpy: https://man7.org/linux/man-pages/man3/memcpy.3.html
I don't know whether future C  standards would ever add support for
flexible array members where the size depends on another struct field,
but it should be fine as a comment, and perhaps easier to maintain
than a diagram. If it ever becomes valid C it can be promoted from a
comment to actual code.

It'd retain the main benefit: being able to see the memory layout,
without having to read through the source code and all the
sizeof/offset pointer calculation to figure out what is actually
stored in regs[] and how big it could be.

What do you think?

> In addition this pretty extensive use of Unicode chars then raises a conc=
ern
> that was brought up for the binutils project a little while ago [1]. As I
> have indicated in replies there, isolated uses may be appropriate in cert=
ain
> cases. A larger comment like the one here is different though, as the
> slipping in of problematic characters (now or in the future) might go
> unnoticed.

https://github.com/rurban/libu8ident might help (there is also a
configuration there that'd match what is proposed for C26)
GCC 12+ also has some protection against it
https://developers.redhat.com/articles/2022/01/12/prevent-trojan-source-att=
acks-gcc-12
Safely using Unicode in source code is a rather complex (and perhaps
not entirely solved) topic, so I understand if you'd rather avoid
extensive Unicode
use.

Best regards,
--Edwin

>
> Jan
>
> [1] https://inbox.sourceware.org/binutils/72219ed1-147d-4dd3-b503-363d981=
528a2@arm.com/

