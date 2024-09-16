Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDA4979C67
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 10:02:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799298.1209249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq6gf-0004oL-Tm; Mon, 16 Sep 2024 08:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799298.1209249; Mon, 16 Sep 2024 08:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq6gf-0004mC-QJ; Mon, 16 Sep 2024 08:02:21 +0000
Received: by outflank-mailman (input) for mailman id 799298;
 Mon, 16 Sep 2024 08:02:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wse+=QO=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sq6ge-0004m6-Gr
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 08:02:20 +0000
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [2607:f8b0:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcbaac05-7401-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 10:02:16 +0200 (CEST)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-710d5d9aac1so1440710a34.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 01:02:18 -0700 (PDT)
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
X-Inumbo-ID: fcbaac05-7401-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726473737; x=1727078537; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sDc8tjBvIeokrj8aSQ31iKgYJzI6Y2CIbBGkdI+vEUA=;
        b=D/gt+aXbrxH8jqSDCk8plgbYw/+Oue4P67IZBvpqmq51/xU+x80NYFaQ330TJjyhfA
         Jd+NdkDh2KP9bTRJ7s+Ubad7GnV/ghiMz/pFZyMKUaXXs79qXauNbZ5cNK/FxoKfHKtF
         HUL+y6V0IqGa6uhJ6naSdy2JoZzSUXhk4Pdjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726473737; x=1727078537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sDc8tjBvIeokrj8aSQ31iKgYJzI6Y2CIbBGkdI+vEUA=;
        b=QR9+s00wDafnB4TEm0XftgvfLNXbvD24oU3BR30njJqadRGqshQDVoHP1JjdAWOV4b
         NyJP8Byt3DotcX9x8TexqX2L1OqLZqVTY9RzLsxFhaXzlAriqfdV7oh7SzWkNytcZHMU
         SBhFaMv6YORCeEUeShbs+b1kz10D7fg7lZ9ksTbgLHrFmxzHEb9+WpLcRD1ubpL2PQ2h
         L9xqEQX8/7hdjRF03hL76N/f6sroyIcBsK+N6qYAMFDRz/GdZ+gQT0xvgNTxqq6ez164
         n7Dicv6Oef8oGkFJUBDgyooQdMRzi/Lh77MMYo2OiR+pNyZqGrUj538yOuDgOkr2jgx6
         W7JA==
X-Forwarded-Encrypted: i=1; AJvYcCVZpYyxruiTKxFkOLKXkFSYMz00mQn1vmN8jS+Mi5dTY45kt4/2oR5oQ35Ccgsuu5+02xxsYJQVCvk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXXRTjVXC5YxCYVZnWO9pFOpiw8N/oHq7RK1AmafNTWPm0MYjW
	Wfs3lDdjbl1dh3uIW/9lfBgWZh5q6IT9gHLJpi9n69IlhVGC3WSP3nCpQT6chZBr6kqBjes9SBK
	vgtMFrvTo1juYz7d1Q+/sHAYDYIVPnTYqSBlj8Q==
X-Google-Smtp-Source: AGHT+IGSZZHMzrr849GEjCdI4dfzItOLOamZvTNXBEcqQKH1LopuvAhbF7khp6DjKs00FYBYgacAP6oLSsTzBBclpVI=
X-Received: by 2002:a05:6830:d02:b0:710:f38a:191c with SMTP id
 46e09a7af769-7110951b2cbmr9683136a34.11.1726473736867; Mon, 16 Sep 2024
 01:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240910161612.242702-1-frediano.ziglio@cloud.com>
 <20240910161612.242702-3-frediano.ziglio@cloud.com> <cb1e0f12-57ee-41a8-acc1-0db36ed14c4c@suse.com>
In-Reply-To: <cb1e0f12-57ee-41a8-acc1-0db36ed14c4c@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 16 Sep 2024 09:02:05 +0100
Message-ID: <CACHz=ZjTzg8X_oxgb67Br+pP-2QKM4m04te9LXAt4QKdWUqzaA@mail.gmail.com>
Subject: Re: [PATCH 2/3] x86/boot: Refactor BIOS/PVH start
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 15, 2024 at 7:16=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 10.09.2024 18:16, Frediano Ziglio wrote:
> > --- a/xen/arch/x86/boot/head.S
> > +++ b/xen/arch/x86/boot/head.S
> > @@ -25,6 +25,9 @@
> >  #define MB2_HT(name)      (MULTIBOOT2_HEADER_TAG_##name)
> >  #define MB2_TT(name)      (MULTIBOOT2_TAG_TYPE_##name)
> >
> > +#define BOOT_TYPE_BIOS 1
> > +#define BOOT_TYPE_PVH 2
>
> Did you consider using 0 and 1, to be able to use XOR on the BIOS
> path and TEST for checking?
>

Not clear what you are trying to achieve. Fewer bytes using the XOR? I
think the TEST in this case is only reducing readability, it's an
enumeration.
If you are concerns about code size I would use an 8 bit register (I
would say DL) and use EBP register to temporary save EAX, 8 bit
registers have usually tiny instructions, MOV has same size as XOR you
mentioned not loosing any readability or forcing to change values.

> > @@ -409,13 +412,28 @@ cs32_switch:
> >  ELFNOTE(Xen, XEN_ELFNOTE_PHYS32_ENTRY, .long sym_offs(__pvh_start))
> >
> >  __pvh_start:
> > -        cld
> >          cli
> > +        mov     $BOOT_TYPE_PVH, %ebp
> > +        jmp     common_bios_pvh
> > +#endif /* CONFIG_PVH_GUEST */
> > +
> > +__start:
> > +        cli
> > +        mov     $BOOT_TYPE_BIOS, %ebp
> > +
> > +common_bios_pvh:
>
> I think labels like this one don't need to show up in the symbol
> table, and hence would better start with .L.
>

Done

> > +        cld
>
> So you fold the STDs but not the STIs, despite that not even having
> been first on the PVH path. This decision wants explaining in the
> description, even if just briefly.
>

Just in case, I disable interrupts ASAP. Not that this should change
much the result.
Would you prefer to fold it too?
By "description" do you mean having an additional comment in the code
or something in the commit message?

> > @@ -433,14 +451,9 @@ __pvh_start:
> >          /* Set up stack. */
> >          lea     STACK_SIZE - CPUINFO_sizeof + sym_esi(cpu0_stack), %es=
p
> >
> > -        call    initialise_bss
>
> I'm little puzzled: The previous patch moved it "as early as possible"
> just for it to be moved to a later point again here?
>

The rationale is being able to use C, for that you need a stack,
correct segments and BSS.
Are you suggesting any change?

> > -        mov     %ebx, sym_esi(pvh_start_info_pa)
> > -
> > -        /* Force xen console.  Will revert to user choice in init code=
. */
> > -        movb    $-1, sym_esi(opt_console_xen)
> > -
> > -        /* Prepare gdt and segments */
> > +        /*
> > +         * Initialize GDTR and basic data segments.
> > +         */
> >          add     %esi, sym_esi(gdt_boot_base)
> >          lgdt    sym_esi(gdt_boot_descr)
>
> No real need to change the comment? In any even it wants to remain a
> single-line one.
>

It's not changed, it's the exact comment from the second copy of this
code (the BIOS path).
I think this comment is more clear than the first, I'll change to be one li=
ne.

> > @@ -449,67 +462,44 @@ __pvh_start:
> >          mov     %ecx, %es
> >          mov     %ecx, %ss
> >
> > -        /* Skip bootloader setup and bios setup, go straight to trampo=
line */
> > -        movb    $1, sym_esi(pvh_boot)
> > -        movb    $1, sym_esi(skip_realmode)
> > -
> > -        /* Set trampoline_phys to use mfn 1 to avoid having a mapping =
at VA 0 */
> > -        movw    $0x1000, sym_esi(trampoline_phys)
> > -        mov     (%ebx), %eax /* mov $XEN_HVM_START_MAGIC_VALUE, %eax *=
/
> > -        jmp     trampoline_setup
> > -
> > -#endif /* CONFIG_PVH_GUEST */
> > +        /* Load null descriptor to unused segment registers. */
> > +        xor     %ecx, %ecx
> > +        mov     %ecx, %fs
> > +        mov     %ecx, %gs
>
> The comment said "descriptor", yes, but it's a null selector that
> we load here. Perhaps worth adjusting as the comment is moved.
>

I'll do.

> > -initialise_bss:
> >          /*
> >           * Initialise the BSS.
> >           *
> >           * !!! WARNING - also zeroes the current stack !!!
> >           */
> > -        pop     %ebp
> >          mov     %eax, %edx
> > -
> >          lea     sym_esi(__bss_start), %edi
> >          lea     sym_esi(__bss_end), %ecx
> >          sub     %edi, %ecx
> >          xor     %eax, %eax
> >          shr     $2, %ecx
> >          rep stosl
> > -
> >          mov     %edx, %eax
> > -        jmp     *%ebp
> > -
> > -__start:
> > -        cld
> > -        cli
> >
> > -        /*
> > -         * Multiboot (both 1 and 2) specify the stack pointer as undef=
ined
> > -         * when entering in BIOS circumstances.  This is unhelpful for
> > -         * relocatable images, where one call (i.e. push) is required =
to
> > -         * calculate the image's load address.
> > -         *
> > -         * This early in boot, there is one area of memory we know abo=
ut with
> > -         * reasonable confidence that it isn't overlapped by Xen, and =
that's
> > -         * the Multiboot info structure in %ebx.  Use it as a temporar=
y stack.
> > -         */
> > -
> > -        /* Preserve the field we're about to clobber. */
> > -        mov     (%ebx), %edx
> > -        lea     4(%ebx), %esp
> > +#ifdef CONFIG_PVH_GUEST
> > +        cmp     $BOOT_TYPE_PVH, %ebp
> > +        jne     1f
> >
> > -        /* Calculate the load base address. */
> > -        call    1f
> > -1:      pop     %esi
> > -        sub     $sym_offs(1b), %esi
> > +        mov     %ebx, sym_esi(pvh_start_info_pa)
> >
> > -        /* Restore the clobbered field. */
> > -        mov     %edx, (%ebx)
> > +        /* Force xen console.  Will revert to user choice in init code=
. */
> > +        movb    $-1, sym_esi(opt_console_xen)
> >
> > -        /* Set up stack. */
> > -        lea     STACK_SIZE - CPUINFO_sizeof + sym_esi(cpu0_stack), %es=
p
> > +        /* Skip bootloader setup and bios setup, go straight to trampo=
line */
> > +        movb    $1, sym_esi(pvh_boot)
> > +        movb    $1, sym_esi(skip_realmode)
> >
> > -        call    initialise_bss
> > +        /* Set trampoline_phys to use mfn 1 to avoid having a mapping =
at VA 0 */
> > +        movw    $0x1000, sym_esi(trampoline_phys)
>
> I realize you merely move this, yet I question the use of MOVW here.
> You use 32-bit operations e.g. to set %ebp; perhaps the same should
> be done here, even if that means a 1 byte code size increase. In any
> even this would preferably use PAGE_SIZE imo.
>

So movl instead of movw and PAGE_SIZE instead of 0x1000. I'll do.

> Jan

Frediano

