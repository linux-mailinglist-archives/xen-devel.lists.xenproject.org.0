Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5C3A4DD48
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 13:00:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901011.1308998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpQwV-0003uo-5w; Tue, 04 Mar 2025 12:00:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901011.1308998; Tue, 04 Mar 2025 12:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpQwV-0003t3-32; Tue, 04 Mar 2025 12:00:11 +0000
Received: by outflank-mailman (input) for mailman id 901011;
 Tue, 04 Mar 2025 12:00:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7o8j=VX=gmail.com=milandjokic1995@srs-se1.protection.inumbo.net>)
 id 1tpQwT-0003sr-7s
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 12:00:09 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 368108df-f8f0-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 13:00:07 +0100 (CET)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-7c3d3147b81so27749685a.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 04:00:07 -0800 (PST)
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
X-Inumbo-ID: 368108df-f8f0-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741089606; x=1741694406; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+H7SNK9JGZmYpCyWpBbWvFRnZn0JK9gD9GuGZW8fNQ=;
        b=BnlP/FgktDkSudHY2lMk2zjAXBtLOTtrmhypQna5jSLFEhqu7Dvm0vs3yC0u9RiRhn
         tOZj4wLY5PefPQ4/mkQzWf41t4leafGeZMtYwz9MD9jwffT8/q6veK2Xas9fIpr6JNC3
         uG7229dR5Io08rAxwIpaSg3ScOzGatriDc3WRziqlO6L0cKgyeUZBLcz//yHB1tEM1/F
         ZjJhZLZMUmTdUq0i2ffQmx1sBK7EOhEMOC0WnBSJ+b/tFjpPm3pB918iXSX0qEr5lPd0
         xCykn3X/clTCoJ2h1mQq8JKLxDBLF+E5hTafznKvO/ralosOG8fT3XpgX//iVJFeo/v/
         8A+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741089606; x=1741694406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X+H7SNK9JGZmYpCyWpBbWvFRnZn0JK9gD9GuGZW8fNQ=;
        b=XR6xZ0ZuAjbC6CP9LgU79TVjk+eN7YSkbBX5xBj5RXGDj5a6wh+Tl8n3LwvkNyytTe
         HTAU2My1tnFbz82D+shtWwR4zhztA3dKeH8QZ+GgEIR6pU4cijRqxa83e4fqxmDKrzwL
         lct0/f1QY9Ir1UEsQleNKq/HJmixAPzcdAtIce0Wp1rqpfepZi2+nJXWj7laUKbdLI53
         OaNP6IX+NlozDPXP9+uXSxEv8DQ7K6iiz/5rmxLoh2AXHriNVBuTFQbMuaHq0B4vlmko
         RJ/pCRkCV9eUXzYDVe4ahVQdqLy4NtRe2XCLkJWQ0BPpxR+LDEbSGx1L/RXCYM7LdrRs
         cR/g==
X-Gm-Message-State: AOJu0YzpoArHBN7cv4mIId2kNWG5934wQdk8QPiuPvtBK6zjsrb3diHR
	AoIUU0/eS83xqfNbU5/KLWLfSGYdDamJZf7HucPP0qCxGaxKAyGI1inFANeSjzqUv/Ylcp9l00D
	GNNJuDKe8uTtlLBOYgMb3kGgHNeI=
X-Gm-Gg: ASbGnctlXoFvWe9SZnfGpeGjXxldvbBC8xou9sdGxPlIvOit5CxmuNEU9L+phTY5mE2
	F1F93a/Hv0TkdMC41RHVYmZn665mGM995uar1I5MuuuduRaF+sYDzxsndqzTznlUArGBLf4peAA
	qLUO4DJJSekQrZOAUTZRZ2NHm6jg==
X-Google-Smtp-Source: AGHT+IFKTk+4OnAxj3Vo5UnhquqfHYV/0SyPnLWSG5pIISnELpstaDAjv50rAeWdYGLUj1zvoDJ3+owrWFQnbg/FlfY=
X-Received: by 2002:a05:620a:c44:b0:7c0:b2ab:2693 with SMTP id
 af79cd13be357-7c39c677674mr2639805285a.49.1741089605855; Tue, 04 Mar 2025
 04:00:05 -0800 (PST)
MIME-Version: 1.0
References: <dae753618491b2a6e42f7ed3f24190d0dc13fe3f.1740754166.git.Slavisa.Petrovic@rt-rk.com>
 <ffdc90de-1407-4b9c-aaae-78d41dc79c86@citrix.com>
In-Reply-To: <ffdc90de-1407-4b9c-aaae-78d41dc79c86@citrix.com>
From: =?UTF-8?B?TWlsYW4gxJBva2nEhw==?= <milandjokic1995@gmail.com>
Date: Tue, 4 Mar 2025 12:59:54 +0100
X-Gm-Features: AQ5f1Jp13hFi3Hmzs4FLP2eMeH6GC3rSvMfMg6Wx0ve9Dc0v4eiJRFuIYRcRHE8
Message-ID: <CAKp59VEmM4OOkU+WTOCTR=4gmw1gTQSv-zfHs1fc0WoOO847xw@mail.gmail.com>
Subject: Re: [PATCH] xen/riscv: copy_to_guest/copy_from_guest functionality.
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Milan Djokic <Milan.Djokic@rt-rk.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Andrew,
On Fri, Feb 28, 2025 at 4:47=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 28/02/2025 2:59 pm, Milan Djokic wrote:
> > From: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>
> >
> > This patch implements copy_to_guest/copy_from_guest functions for RISC-=
V.
> > These functions are designed to facilitate data exchange between guest =
and hypervisor.
> >
> > Signed-off-by: Milan Djokic <Milan.Djokic@rt-rk.com>
> > Signed-off-by: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>
> > ---
> > Tested on qemu with xcp-ng latest branch https://gitlab.com/xen-project=
/people/olkur/xen/-/merge_requests/6
> > Full description on how to setup test environment can be found in attac=
hed PR link (Linux kernel patching to support copy_from_guest/copy_to_guest=
 for RISC-V).
> > Linux kernel patch shall be upstreamed after these changes are merged.
>
> Several things.  First, it's probably worth setting you up with Gitlab
> access, seeing as that's the first step of RISC-V CI.
>
We already have access to mirror gitlab repo owned by Oleksii where
our changes are tested through CI jobs
Or you refer to mainstream xen gitlab? For this one, I don't know who
should we contact for access

> Second, where can I read about the semantics of h{l,s}v?  That looks
> alarmingly like a virtual address, and there's a world supply of corner
> cases that can come with it, including incorrect translations.
>
> Also, I very desperately want RISC-V (and PPC) not to inherit
> 2-decade-old x86-ISMs which we're currently trying to remove, because
> starting without them is 10x easier than to fix them after the fact.
>
hlv/hsv are part of the RISC-V ISA H extension
(https://five-embeddev.com/riscv-priv-isa-manual/Priv-v1.12/hypervisor.html=
,
Chapter 5.3 Hypervisor Instructions).
Handling of corner cases with possible incorrect translations will be
part of the upcoming patch version.

> > diff --git a/xen/arch/riscv/addr_translation.S b/xen/arch/riscv/addr_tr=
anslation.S
> > new file mode 100644
> > index 0000000000..7e94774b47
> > --- /dev/null
> > +++ b/xen/arch/riscv/addr_translation.S
> > @@ -0,0 +1,63 @@
> > +#include <asm/riscv_encoding.h>
> > +#include <asm/asm.h>
> > +
> > +.macro add_extable lbl
> > +.pushsection .extable, "a"     /* Start .extable section */
> > +.balign      8                 /* Align to 8 bytes */
> > +.quad        \lbl              /* Add label address to extable */
> > +.popsection                    /* End section */
> > +.endm
> > +
> > +.section .text
> > +
> > +/*
> > + * size_t _copy_to(uint64_t dest, const void *src, size_t len)
> > + *
> > + * a0 - dest
> > + * a1 - src
> > + * a2 - len
> > + *
> > + */
> > +
> > +.global _copy_to
> > +_copy_to:
>
> For assembly code, please use the linkage macros.  See 7015f337a217 as
> an example.
>
> However, as far as I can tell, the only interesting thing h{s,l}v.b, at
> which point a simple piece of inline asm is surely easier, and would
> simplify guestcopy.c too.
>
> Exception table entries are perfectly easy to do in inline asm.  See
> _ASM_EXTABLE() in x86 for an example.
>
We have updated the patch where this part is done completely in c with
inline assembly for hsv/hlv.
Prepared for the next patch version, thanks for the detailed explanation.

Best regards,
Milan

