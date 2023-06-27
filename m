Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC4F740433
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 21:58:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556259.868640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEEnr-0001Zx-8T; Tue, 27 Jun 2023 19:56:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556259.868640; Tue, 27 Jun 2023 19:56:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEEnr-0001Y8-4W; Tue, 27 Jun 2023 19:56:43 +0000
Received: by outflank-mailman (input) for mailman id 556259;
 Tue, 27 Jun 2023 19:56:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1X7u=CP=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qEEnp-0001Y2-09
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 19:56:41 +0000
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [2607:f8b0:4864:20::112a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b96a9524-1524-11ee-8611-37d641c3527e;
 Tue, 27 Jun 2023 21:56:37 +0200 (CEST)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-5704ddda6dfso54929907b3.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jun 2023 12:56:37 -0700 (PDT)
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
X-Inumbo-ID: b96a9524-1524-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687895796; x=1690487796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zdquro6/1dmVZnYjtrQgFcMxkU4TUJVZmkWoLqAkDfs=;
        b=f28I8lHAi89ozlaNg/BctKdKMs3ZV6m8KXjBDM6pClsFtWadf95y0x4g3i//E8BwZz
         W+z8+saIIFbmoUgBUaIpSnUEoRcLDnuqLYQnOFRS+j34fc48uptWzZzEtuGsHAJp24eW
         schrHDJX1LmM4MqcKy9Kl1+LnP3eq11QJcl+8rxobGaBQBGKgLHNc4OHDPWjyNPyHr8O
         3NCVuR4QFNH+Qpn6H6NXaags2ruLb1/5mkhPFAz5CmyBZqkztlzk4kjRiIcxN74282q0
         ok16c0PiSUSoXbXu9Py6nAmtPZ8zTkEwR31ZaDkNSc5taFwAdZNAWg6IT3kt5o5vZVZ6
         A8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687895796; x=1690487796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zdquro6/1dmVZnYjtrQgFcMxkU4TUJVZmkWoLqAkDfs=;
        b=iZN9hwRZg2+xc1hmEsYSODYZLRjxdVEkpnEwBm91k/+tubcoK+FRYtnytVcfK2FN2v
         2IpAk9zbRwF0MB1r9Sep+RK2x+1uUSA3XhNF7qWS+jZB7adWK8loRI3bF9ZHyho5WDhO
         pM8B3g5lLSyBqTpmGf4qho2HGQJaoEwcr+vrW9cVGh4wzvZNShARhh4sV2ATvWYJGApX
         wQX/4dWdqgNNmDcLKSke+itoAa34z/ywLoRe0XelndhQn1ABQFLUueTBhxirDIklNxEC
         RFpNND1qWds5HI47KtYKhl2LTAwT7qCk4581qOp9mzCalBlZ7/O+zycZGMQkmofiZs3y
         MMnA==
X-Gm-Message-State: AC+VfDy33UpUXZQ4an027QAoLgH42X2I2fkx/mrVzXv2rM/XNj8+DiV4
	ZnUAf6WNgz8Cy3iVX2BBJ2ZhjDLpmRv7i1H27tc=
X-Google-Smtp-Source: ACHHUZ5reIcGnTN97W0IND8v2qM1C2Qu4uLolES6NdKMr/CmT1WqgUFXujo/fo7+ykti4Dwr2zsHLXj/ugW36Uy1oLg=
X-Received: by 2002:a0d:de45:0:b0:576:e678:21d6 with SMTP id
 h66-20020a0dde45000000b00576e67821d6mr4351768ywe.12.1687895796450; Tue, 27
 Jun 2023 12:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230622205745.79707-1-vishal.moola@gmail.com>
 <20230622205745.79707-27-vishal.moola@gmail.com> <13bab37c-0f0a-431a-8b67-4379bf4dc541@roeck-us.net>
 <CAOzc2px6VutRkMUTn+M5LFLf1YbRVZFgJ=q7StaApwYRxUWqQA@mail.gmail.com>
 <cc954b15-63ab-9d9f-2d37-1aea78b7f65f@roeck-us.net> <b6a5753b-8874-6465-f690-094ee753e038@roeck-us.net>
In-Reply-To: <b6a5753b-8874-6465-f690-094ee753e038@roeck-us.net>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Tue, 27 Jun 2023 12:56:25 -0700
Message-ID: <CAOzc2pxdqeaRjYLfOqvMW-AEobTzD9xOP+MyP9nxgEbi1T2r7Q@mail.gmail.com>
Subject: Re: [PATCH v5 26/33] nios2: Convert __pte_free_tlb() to use ptdescs
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
	Hugh Dickins <hughd@google.com>, Dinh Nguyen <dinguyen@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 27, 2023 at 12:14=E2=80=AFPM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On 6/27/23 12:10, Guenter Roeck wrote:
> > On 6/27/23 10:42, Vishal Moola wrote:
> >> On Mon, Jun 26, 2023 at 10:47=E2=80=AFPM Guenter Roeck <linux@roeck-us=
.net> wrote:
> >>>
> >>> On Thu, Jun 22, 2023 at 01:57:38PM -0700, Vishal Moola (Oracle) wrote=
:
> >>>> Part of the conversions to replace pgtable constructor/destructors w=
ith
> >>>> ptdesc equivalents.
> >>>>
> >>>> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> >>>> Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
> >>>
> >>> This patch causes all nios2 builds to fail.
> >>
> >> It looks like you tried to apply this patch on its own. This patch dep=
ends
> >> on patches 01-12 of this patchset to compile properly. I've cross-comp=
iled
> >> this architecture and it worked, but let me know if something fails
> >> when its applied on top of those patches (or the rest of the patchset)=
.
> >
> >
> > No, I did not try to apply this patch on its own. I tried to build yest=
erday's
> > pending-fixes branch of linux-next.
> >
>
> A quick check shows that the build fails with next-20230627. See log belo=
w.

Ah it looks like this one slipped into -next on its own somehow? Stephen, p=
lease
drop this patch from -next; it shouldn't be in without the rest of the
patchset which
I intend to have Andrew take through the mm tree.

> Guenter
>
> ---
>
> $ git describe
> next-20230627
> $ git describe --match 'v*'
> v6.4-12601-g53cdf865f90b
>
> Build reference: v6.4-12601-g53cdf865f90b
> Compiler version: nios2-linux-gcc (GCC) 11.4.0
> Assembler version: GNU assembler (GNU Binutils) 2.40
>
> Building nios2:allnoconfig ... failed
> --------------
> Error log:
> <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
> In file included from mm/memory.c:86:
> mm/memory.c: In function 'free_pte_range':
> arch/nios2/include/asm/pgalloc.h:33:17: error: implicit declaration of fu=
nction 'pagetable_pte_dtor'; did you mean 'pgtable_pte_page_dtor'? [-Werror=
=3Dimplicit-function-declaration]
>     33 |                 pagetable_pte_dtor(page_ptdesc(pte));           =
        \
>        |                 ^~~~~~~~~~~~~~~~~~
> include/asm-generic/tlb.h:666:17: note: in expansion of macro '__pte_free=
_tlb'
>    666 |                 __pte_free_tlb(tlb, ptep, address);             =
\
>        |                 ^~~~~~~~~~~~~~
> mm/memory.c:194:9: note: in expansion of macro 'pte_free_tlb'
>    194 |         pte_free_tlb(tlb, token, addr);
>        |         ^~~~~~~~~~~~
> arch/nios2/include/asm/pgalloc.h:33:36: error: implicit declaration of fu=
nction 'page_ptdesc' [-Werror=3Dimplicit-function-declaration]
>     33 |                 pagetable_pte_dtor(page_ptdesc(pte));           =
        \
>        |                                    ^~~~~~~~~~~
> include/asm-generic/tlb.h:666:17: note: in expansion of macro '__pte_free=
_tlb'
>    666 |                 __pte_free_tlb(tlb, ptep, address);             =
\
>        |                 ^~~~~~~~~~~~~~
> mm/memory.c:194:9: note: in expansion of macro 'pte_free_tlb'
>    194 |         pte_free_tlb(tlb, token, addr);
>        |         ^~~~~~~~~~~~
> arch/nios2/include/asm/pgalloc.h:34:17: error: implicit declaration of fu=
nction 'tlb_remove_page_ptdesc'; did you mean 'tlb_remove_page_size'? [-Wer=
ror=3Dimplicit-function-declaration]
>     34 |                 tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte))=
);      \
>        |                 ^~~~~~~~~~~~~~~~~~~~~~
> include/asm-generic/tlb.h:666:17: note: in expansion of macro '__pte_free=
_tlb'
>    666 |                 __pte_free_tlb(tlb, ptep, address);             =
\
>        |                 ^~~~~~~~~~~~~~
> mm/memory.c:194:9: note: in expansion of macro 'pte_free_tlb'
>    194 |         pte_free_tlb(tlb, token, addr);
>        |         ^~~~~~~~~~~~
> cc1: some warnings being treated as errors
> make[3]: *** [scripts/Makefile.build:243: mm/memory.o] Error 1
> make[3]: *** Waiting for unfinished jobs....
> make[2]: *** [scripts/Makefile.build:477: mm] Error 2
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [Makefile:2022: .] Error 2
> make: *** [Makefile:226: __sub-make] Error 2

