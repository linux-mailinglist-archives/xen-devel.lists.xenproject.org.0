Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D01903FF4
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 17:25:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738519.1145295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH3N2-0005tX-NC; Tue, 11 Jun 2024 15:25:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738519.1145295; Tue, 11 Jun 2024 15:25:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH3N2-0005rZ-Ke; Tue, 11 Jun 2024 15:25:12 +0000
Received: by outflank-mailman (input) for mailman id 738519;
 Tue, 11 Jun 2024 15:25:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=887E=NN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sH3N1-0005rT-5F
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 15:25:11 +0000
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [2607:f8b0:4864:20::102c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c911243a-2806-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 17:25:09 +0200 (CEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2bfff08fc29so4920748a91.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 08:25:08 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c2ee465711sm6203613a91.45.2024.06.11.08.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 08:25:06 -0700 (PDT)
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
X-Inumbo-ID: c911243a-2806-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718119507; x=1718724307; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O/lyxeDYB0BtkQX1JRbiTJgbbHqOyGOFegqTxPt6Ejs=;
        b=IM5eyyBonLQbuiz4kWfU8okWHO/RSt6hZzYzyJTEHJRVLeoeo5j07ky30Yk9T9hhvC
         nSCr4NPqpJO3TvsboVd8PXb4Z3yMh8R1dCm78nXdN5F/Kgr658wTJ9pOJH241QUoSb7s
         JFERb5GV11awJboVpXrJhBznCkiuOCvN1vjQf6HwD8G1opfItB8rFDl/2JZMKAi0W+pp
         S6ZcEeE3Zof6w6JytY3cZNFryXN+u9fHEQB7bsnuLTV0vcI9d0/mWbenY4la/fp/Y7rw
         SWxWC3MPiaKa9gwEFokyA9c1rWrGrslCgfosU9e+BCWAzYhX4tnZKZlCMZZt0N+/g+dL
         MFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718119507; x=1718724307;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O/lyxeDYB0BtkQX1JRbiTJgbbHqOyGOFegqTxPt6Ejs=;
        b=b2c/S+asu3rUVp2b6XfpckoI4hWU+L7oYpAAwEIqP3gHj3fVzuVF3y8acAExaesbK+
         +OtdYJJYkxIsislCgFLG/A8xA4O5MOGc9pzi4RZmSwNI5zhVvDvJoggzkPSh+BcWSc/h
         fIF91/xOLhxKfEjH7ZVbFOgsvHQtAxeXW9QKyF5JIkOSLFlkQ3xYDiZba21vMXnjLE5r
         gsonAeEbHzJl6edIvtwmhz/NnWNo9bYr0ILrDWpRWzZeeY+ZJeEeOGpjtz6BI4AZdVOT
         OZev0g4dOTJFrZipnJ8moJRoL0+ZC3VfHlHII7Cdgy/VyMxoEJEvcTrfq3ol0ydHgrSo
         wedQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy9GlTUDUp0pB9Uvm1uyh9r0wnh9523bslVkEmN4y7kPGlldbzL/5SZtolHGYxW5Zv2pvonIlzqUKNB2G7N8BG87ulyH24un7vRr1N4w4=
X-Gm-Message-State: AOJu0Yyj0fLrql6cfqXo2btTBY7gvPGhNVXeiZ0UjjM1V0/HIWKh3K5n
	QBPVBnAkaFSJn6d3QYGWxTbn1jfPFXxF7A5FL1BntcJg/7B+ZLsZ
X-Google-Smtp-Source: AGHT+IE30y7NoPBSKIKC0FcjoEDs9Cx3FWO8hRWeqEvhlmlyRA7JBHeCflWG/5LszAA9bkoDLeohgA==
X-Received: by 2002:a17:90b:188c:b0:2c2:1d86:f785 with SMTP id 98e67ed59e1d1-2c2bcc855cdmr10563511a91.47.1718119507103;
        Tue, 11 Jun 2024 08:25:07 -0700 (PDT)
Message-ID: <ff3a6de3c5cb08f4ebf55bc0ab26a02272a57c74.camel@gmail.com>
Subject: Re: [PATCH v12 5/8] xen/riscv: add minimal stuff to mm.h to build
 full Xen
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,  Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Date: Tue, 11 Jun 2024 17:25:02 +0200
In-Reply-To: <70128dba-498f-4d85-8507-bb1621182754@citrix.com>
References: <cover.1717008161.git.oleksii.kurochko@gmail.com>
	 <d00b86f41ef2c7d928a28dadd8c34fb845f23d0a.1717008161.git.oleksii.kurochko@gmail.com>
	 <70128dba-498f-4d85-8507-bb1621182754@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Thu, 2024-05-30 at 18:23 +0100, Andrew Cooper wrote:
> On 29/05/2024 8:55 pm, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > Acked-by: Jan Beulich <jbeulich@suse.com>
>=20
> This patch looks like it can go in independently?=C2=A0 Or does it depend
> on
> having bitops.h working in practice?
>=20
> However, one very strong suggestion...
>=20
>=20
> > diff --git a/xen/arch/riscv/include/asm/mm.h
> > b/xen/arch/riscv/include/asm/mm.h
> > index 07c7a0abba..cc4a07a71c 100644
> > --- a/xen/arch/riscv/include/asm/mm.h
> > +++ b/xen/arch/riscv/include/asm/mm.h
> > @@ -3,11 +3,246 @@
> > <snip>
> > +/* PDX of the first page in the frame table. */
> > +extern unsigned long frametable_base_pdx;
> > +
> > +/* Convert between machine frame numbers and page-info structures.
> > */
> > +#define
> > mfn_to_page(mfn)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 (frame_table + (mfn_to_pdx(mfn) - frametable_base_p=
dx))
> > +#define
> > page_to_mfn(pg)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 pdx_to_mfn((unsigned long)((pg) - frame_table) +
> > frametable_base_pdx)
>=20
> Do yourself a favour and not introduce frametable_base_pdx to begin
> with.

To drop frametable_base_pdx if the following changes will be enough:
   diff --git a/xen/arch/riscv/include/asm/mm.h
   b/xen/arch/riscv/include/asm/mm.h
   index cc4a07a71c..fdac7e0646 100644
   --- a/xen/arch/riscv/include/asm/mm.h
   +++ b/xen/arch/riscv/include/asm/mm.h
   @@ -107,14 +107,11 @@ struct page_info
   =20
    #define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
   =20
   -/* PDX of the first page in the frame table. */
   -extern unsigned long frametable_base_pdx;
   -
    /* Convert between machine frame numbers and page-info structures. */
    #define mfn_to_page(mfn)                                            \
   -    (frame_table + (mfn_to_pdx(mfn) - frametable_base_pdx))
   +    (frame_table + mfn - FRAMETABLE_BASE_OFFSET))
    #define page_to_mfn(pg)                                             \
   -    pdx_to_mfn((unsigned long)((pg) - frame_table) +
   frametable_base_pdx)
   +    ((unsigned long)((pg) - frame_table) + FRAMETABLE_BASE_OFFSET)
   =20
    static inline void *page_to_virt(const struct page_info *pg)
    {
   diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
   index 9c0fd80588..8f6dbdc699 100644
   --- a/xen/arch/riscv/mm.c
   +++ b/xen/arch/riscv/mm.c
   @@ -15,7 +15,7 @@
    #include <asm/page.h>
    #include <asm/processor.h>
   =20
   -unsigned long __ro_after_init frametable_base_pdx;
    unsigned long __ro_after_init frametable_virt_end;
   =20
    struct mmu_desc {


>=20
> Every RISC-V board I can find has things starting from 0 in physical
> address space, with RAM starting immediately after.
>=20
> Taking the microchip board as an example, RAM actually starts at
> 0x8000000, which means that having frametable_base_pdx and assuming
> it
> does get set to 0x8000 (which isn't even a certainty, given that I
> think
> you'll need struct pages covering the PLICs), then what you are
> trading
> off is:
>=20
> * Saving 32k of virtual address space only (no need to even allocate
> memory for this range of the framtable), by
> * Having an extra memory load and add/sub in every page <-> mfn
> conversion, which is a screaming hotpath all over Xen.
Are you referring here to `mfn_to_pdx()` used in `mfn_to_page()` and
`pdx_to_mfn()` in `page_to_mfn()`?

My expectation was that when CONFIG_PDX_COMPRESSION is disabled then
this macros doesn't do anything:
/* pdx<->pfn =3D=3D identity */
#define pdx_to_pfn(x) (x)
#define pfn_to_pdx(x) (x)


>=20
> It's a terribly short-sighted tradeoff.
>=20
> 32k of VA space might be worth saving in a 32bit build (I personally
> wouldn't - especially as there's no need to share Xen's VA space with
> guests, given no PV guests on ARM/RISC-V), but it's absolutely not at
> all in an a 64bit build with TB of VA space available.
Why 32k? If RAM is started at 0x8000_0000 then we have to cover 0x80000
entries, and the size of it is 0x8_0000 =3D 524288 * 64 =3D 33554432, so it
is 32 Mb.
Am I confusing something?

P.S.: Should I map this start 32 mb? Or it is enough to have a slide (
FRAMETABLE_BASE_OFFSET ).

~ Oleksii

>=20
> Even if we do find a board with the first interesting thing in the
> frametable starting sufficiently away from 0 that it might be worth
> considering this slide, then it should still be Kconfig-able in a
> similar way to PDX_COMPRESSION.
>=20
> You don't want to be penalising everyone because of a
> theoretical/weird
> corner case.
>=20
> ~Andrew


