Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9609C6DC2
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 12:24:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835410.1251281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBBTa-0000uI-2P; Wed, 13 Nov 2024 11:23:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835410.1251281; Wed, 13 Nov 2024 11:23:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBBTZ-0000so-Vv; Wed, 13 Nov 2024 11:23:57 +0000
Received: by outflank-mailman (input) for mailman id 835410;
 Wed, 13 Nov 2024 11:23:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1B9J=SI=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tBBTY-0000sg-Fm
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 11:23:56 +0000
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [2607:f8b0:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c32a42f8-a1b1-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 12:23:53 +0100 (CET)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3e5fa17a79dso4140442b6e.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 03:23:53 -0800 (PST)
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
X-Inumbo-ID: c32a42f8-a1b1-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjoyMzEiLCJoZWxvIjoibWFpbC1vaTEteDIzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImMzMmE0MmY4LWExYjEtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDk3MDMzLjU4Nzg2Mywic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731497032; x=1732101832; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPHFE5kCwXx4Pl6Fmdy987797wTPP1/zVY1hpu4sE5I=;
        b=dJmGnmn4zG7JQzz/24Gq1fpSWhudgSKQeVJyn+9hTOY8Y3dd756ZB3oiDPGbfc3V3Q
         Aaq4Ztu5qlb4jTqzAvU8QuPeKa+sODbD6g0gtfdTKx6MCmoRV80f46jBQVttFxAJv4az
         pXp13XVyt3h/PZzKNwGXmvzxtcu6G75X7Z5lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731497032; x=1732101832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPHFE5kCwXx4Pl6Fmdy987797wTPP1/zVY1hpu4sE5I=;
        b=oTxQq/zXy2xU1h733omaimWZEvWWFhEf7wDLk+H5alr22uSJURnCxdczJyxo9bUoeO
         lM7QaSscCfBdKzyzhyXcV3fBFHVxdTPWwmZtTE8l3QA4VB2HaJLAjccbjsCFvdf7ghOg
         o6+Tlir/PPodwKlLp5oz5x/sfy9a9U1Qv4jVbrXbEHs9SwnvxnWrEZatdy9vq/ovOg5C
         BUHlA/pAT6HFQVzklwD+qspdTPcvBbx/OyyMiDTFp8BMaxbMYfEuYUjzWBYJVjMzrrf0
         0typVddbNPnos3G8dgAc8p15FgDPhU7rmkGg2SBlwJwBHaFLM0ZFXGJfOI6ME96M8APm
         cFjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgEJAqa+FLbiHxKeK5qmSWhdByNcxlopvfFGA8yb8dKyJZv1GQR5+CKjld57W7Hcp1J/EijHH5VRs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxnPunuDUVHfwZA79WosdYO/XhODHqc3tunyNDZ2s4hLB9WNUoi
	uDxH7cVtKecm+A9NIco8vjZ3vjfeTxE5fkHpKlCm84Mc/DDE9zAJmlSuPq7Job4XNX1kPOdZ9UA
	rbWbMlx/w/mFbjMHxgxs3IUP202jd2nRCrf1h0Q==
X-Google-Smtp-Source: AGHT+IH3p8Kyl/HLUSPOvrrobOriQE2J3rXyddnItnpg3bvmyUiR8Fz4CBMDZnLVDfeOGKiJjww52c3MjaCeO5FiO2w=
X-Received: by 2002:a05:6808:3ca:b0:3e7:ab12:b55 with SMTP id
 5614622812f47-3e7ab120c29mr5369605b6e.4.1731497032125; Wed, 13 Nov 2024
 03:23:52 -0800 (PST)
MIME-Version: 1.0
References: <20241113093058.1562447-1-andrew.cooper3@citrix.com>
 <20241113093058.1562447-2-andrew.cooper3@citrix.com> <5f58dda2-1619-4416-b711-c600367d6f47@suse.com>
 <db7d200d-a13c-4cb4-9860-5a40cc039db7@citrix.com>
In-Reply-To: <db7d200d-a13c-4cb4-9860-5a40cc039db7@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 13 Nov 2024 11:23:41 +0000
Message-ID: <CACHz=ZjAbzFrws-PTTYs8DnffHQ24TaDCAY4bm_oihJJaUyTSA@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86/trampoline: Document how the trampoline is laid out
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"Daniel P . Smith" <dpsmith@apertussolutions.com>, 
	Alejandro Vallejo <alejandro.vallejo@cloud.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 11:19=E2=80=AFAM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> On 13/11/2024 10:20 am, Jan Beulich wrote:
> > On 13.11.2024 10:30, Andrew Cooper wrote:
> >> This is, to the best of my knowledge, accurate.  I am providing no com=
ment on
> >> how sane I believe it to be.
> >>
> >> At the time of writing, the sizes of the regions are:
> >>
> >>           offset  size
> >>   AP:     0x0000  0x00b0
> >>   S3:     0x00b0  0x0140
> >>   Boot:   0x01f0  0x1780
> >>   Heap:   0x1970  0xe690
> >>   Stack:  0xf000  0x1000
> >>
> >> and wakeup_stack overlays boot_edd_info.
> >>
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> CC: Jan Beulich <JBeulich@suse.com>
> >> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> >> CC: Frediano Ziglio <frediano.ziglio@cloud.com>
> >> CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> >> ---
> >>  xen/arch/x86/include/asm/trampoline.h | 55 ++++++++++++++++++++++++++=
-
> >>  1 file changed, 53 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/xen/arch/x86/include/asm/trampoline.h b/xen/arch/x86/incl=
ude/asm/trampoline.h
> >> index 8c1e0b48c2c9..d801bea400dc 100644
> >> --- a/xen/arch/x86/include/asm/trampoline.h
> >> +++ b/xen/arch/x86/include/asm/trampoline.h
> >> @@ -37,12 +37,63 @@
> >>   * manually as part of placement.
> >>   */
> >>
> >> +/*
> >> + * Layout of the trampoline.  Logical areas, in ascending order:
> >> + *
> >> + * 1) AP boot:
> >> + *
> >> + *    The INIT-SIPI-SIPI entrypoint.  This logic is stack-less so the=
 identity
> >> + *    mapping (which must be executable) can at least be Read Only.
> >> + *
> >> + * 2) S3 resume:
> >> + *
> >> + *    The S3 wakeup logic may need to interact with the BIOS, so need=
s a
> >> + *    stack.  The stack pointer is set to trampoline_phys + 4k and cl=
obbers an
> >> + *    undefined part of the the boot trampoline.  The stack is only u=
sed with
> >> + *    paging disabled.
> >> + *
> >> + * 3) Boot trampoline:
> >> + *
> >> + *    This region houses various data used by the AP/S3 paths too.
> > This is confusing to have here - isn't the boot part (that isn't in the
> > same page as the tail of the AP/S3 region) being boot-time only, and he=
nce
> > unavailable for S3 and post-boot AP bringup? Both here and with the num=
bers
> > in the description - what position did you use as separator between 2) =
and
> > 3)?
> >
> > Then again it may be just me who is confused: Didn't we, at some point,=
 limit
> > the resident trampoline to just one page? Was that only a plan, or a pa=
tch
> > that never was committed?
>
> The positioning of various things is rather complicated.
>
> Only a single 4k page is mapped into idle_pg_table[].
>
> But, the AP/S3 path use:
>   trampoline_cpu_started
>   idt_48
>   gdt_48
>   trampoline_xen_phys_start
>   trampoline_misc_enable_off
>   trampoline_efer
>
> Which is beyond the content of wakeup.S.  The GDT in particular needs to
> stay valid with paging enabled, to load __HYPERVISOR_CS.
>
> We have /* From here on early boot only. */ in trampoline.S but that
> seems to be the extent of checking.  Everything needed for AP/S3 is in
> the first 0x229.
>
> I'm open to suggestions for how to describe this better, although the
> left hand side of the diagram is already very busy.
>
> I suppose I could do AP+S3 as a single section, along their combined data=
?
>
> >
> >>  The boot
> >> + *    trampoline collects data from the BIOS (E820/EDD/EDID/etc), so =
needs a
> >> + *    stack.  The stack pointer is set to trampoline_phys + 64k and h=
as 4k
> >> + *    space reserved.
> >> + *
> >> + * 4) Heap space:
> >> + *
> >> + *    The first 1k of heap space is statically allocated for VESA inf=
ormation.
> >> + *
> >> + *    The remainder of the heap is used by reloc(), logic which is ot=
herwise
> >> + *    outside of the trampoline, to collect the bootloader metadata (=
cmdline,
> >> + *    module list, etc).  It does so with a bump allocator starting f=
rom the
> >> + *    end of the heap and allocating backwards.
> >> + *
> >> + * 5) Boot stack:
> >> + *
> >> + *    4k of space is reserved for the boot stack, at trampoline_phys =
+ 64k.
> > Perhaps add "ending" to clarify it doesn't go beyond +64k? It's being e=
xpressed
> > ...
>
> Ah yes.  That ended up less clear than I was intending.  I'll adjust.
>

With that

Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Frediano

