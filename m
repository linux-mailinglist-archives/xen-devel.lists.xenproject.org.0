Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F24F598A5A7
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 15:43:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807411.1218846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svGg7-00052y-4j; Mon, 30 Sep 2024 13:43:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807411.1218846; Mon, 30 Sep 2024 13:43:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svGg7-00050S-1G; Mon, 30 Sep 2024 13:43:07 +0000
Received: by outflank-mailman (input) for mailman id 807411;
 Mon, 30 Sep 2024 13:43:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Slsa=Q4=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1svGg6-00050M-30
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 13:43:06 +0000
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [2001:4860:4864:20::2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eac17355-7f31-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 15:43:04 +0200 (CEST)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-286f0599436so1992869fac.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 06:43:04 -0700 (PDT)
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
X-Inumbo-ID: eac17355-7f31-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727703783; x=1728308583; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWnwdnA9LhXOsb5+JVR0b6duqIA4DhrCVehMdrhjPQQ=;
        b=Vng1rBqWAYH+G5iZVGYR1Cuixld1YobrlHjctRECYOzr1OeHY9WCideXpinUo+fhOx
         htNtSaaKdZ92/9rk/+8VfqJiC0wR3pYPyP+ZEXSRn7IbLuw1I2Lt4u3Il41Oev/vd6yt
         HlOKL8H/PZRvXYEB2P4thxNFuWAKhuLX7d6KY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727703783; x=1728308583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xWnwdnA9LhXOsb5+JVR0b6duqIA4DhrCVehMdrhjPQQ=;
        b=XPsP9W4z8iGFsdocRAdhdsLJ5eGN32izT/RUT4aSh2OUmIidL8OuuMUfbmco3j/qhN
         141KH2lWLksgCyyQ+awpdyOx2628KJH3U0KlEmGo80DKK6b7MK3KPuzjk+tajztfH9f/
         wBuQyVDM0nEmctSAe+l7tXyx2zhIqqMOgCN8/69OpuUB0mBM7OtSuiDy/iHKPWcbyTkN
         dRtj8UTCEqBD5BCOg80BJWnV96AedRv/kGRqv+9Mc/1dwyvbCEcyqXd9uyU68bK7/GLV
         XZDunO1+fApGH22/1/8ju5KMDhkkOnNVhobH7cuMDxNRSezyjIoBSSLgwOX5pj9n9q8V
         ctmA==
X-Gm-Message-State: AOJu0YyZyZ9YGzNHy1M3vSptWzfD6cjV5eEtWBOjXM1P8YraO3Fz5Gmz
	JJ+DGDkiLT1a6kluMuBz37C0a6axn7KenQf9mR/YxNHmLdZxV6u7FxVufLxQs7tMmAHvs+SbgEX
	tVxSFMnuKzSnLQDRPty+1pRPsVtY2QbWPvyAHpw==
X-Google-Smtp-Source: AGHT+IFFr2/Mmt281Aj5ZPWs3kiUIVjs6wkYZBXOuTVtZRYcSi8TbW7flQu4edSfmMfmjRO4B87wQm3fnl6bO2QJiXQ=
X-Received: by 2002:a05:6871:419c:b0:270:463e:4b72 with SMTP id
 586e51a60fabf-28710a35846mr7122316fac.20.1727703783628; Mon, 30 Sep 2024
 06:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240819142953.415817-1-frediano.ziglio@cloud.com> <20240930120628.1072839-1-andrew.cooper3@citrix.com>
In-Reply-To: <20240930120628.1072839-1-andrew.cooper3@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 30 Sep 2024 14:42:52 +0100
Message-ID: <CACHz=ZiBY+qHkY1-z2kPbEc1j7jFTu_Mg4wmL4utvLsMxNavcg@mail.gmail.com>
Subject: Re: [PATCH RFC] x86/boot: Call efi_multiboot2() at it's linked address
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Daniel Smith <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 1:06=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> When entering via MB2+EFI, the early EFI code hasn't been relocated down =
to
> it's load address.  As a consequence, efi_multboot2() is still expecting =
to
> run at high address.
>
> To set this up, we need Xen's high mappings, while also retaining the EFI
> physical-mode mappings in the low half.  Introduce a new efi_l4_bootmap[]=
 for
> the purpose.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Frediano Ziglio <frediano.ziglio@cloud.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Daniel Smith <dpsmith@apertussolutions.com>
>
> Very RFC, compile tested only.

Tested, it crashes. But not the point of a RFC.

> ---
>  xen/arch/x86/boot/head.S   | 69 +++++++++++++++++++++++++++++++++++++-
>  xen/arch/x86/boot/x86_64.S |  4 +++
>  2 files changed, 72 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> index e0901ee40044..ef07f30d13da 100644
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -344,6 +344,66 @@ __efi64_mb2_start:
>          lea     .Lmb2_no_ih(%rip),%r15
>          jz      x86_32_switch
>
> +        push    %rax
> +        push    %rcx
> +        push    %rdx
> +        push    %rsi
> +        push    %rdi
> +
> +        /* Merge lower half of EFI pagtables with upper half of Xen page=
tables */
> +        mov     %cr3, %rsi
> +        lea     efi_l4_bootmap(%rip), %rdi
> +        mov     $L4_PAGETABLE_ENTRIES / 2, %ecx
> +        rep movsq
> +        lea     ((L4_PAGETABLE_ENTRIES / 2) * 8) + idle_pg_table(%rip), =
%rsi
> +        mov     $L4_PAGETABLE_ENTRIES / 2, %ecx
> +        rep movsq
> +
> +        /* Switch to merged pagetables */
> +        lea     efi_l4_bootmap(%rip), %rax
> +        mov     %rax, %cr3
> +

I agree with Jan, we are presuming firmware to behave in some way we
can't guarantee.
For instance, it could assume that pages after %cr3 are leafs of the first.
Or for some reason restore %cr3 at some point, making your code crash.
This could be alleviated with a trampoline setting back %cr3 before
calling EFI code but looks like quite some work to do.

Ignoring those, it could work.

> +        lea     __image_base__(%rip), %esi
> +
> +        /* Map Xen into the higher mappings using 2M superpages. */
> +        lea     _PAGE_PSE + PAGE_HYPERVISOR_RWX + sym_esi(_start), %eax
> +        mov     $sym_offs(_start),   %ecx   /* %eax =3D PTE to write ^  =
    */
> +        mov     $sym_offs(_end - 1), %edx
> +        shr     $L2_PAGETABLE_SHIFT, %ecx   /* %ecx =3D First slot to wr=
ite */
> +        shr     $L2_PAGETABLE_SHIFT, %edx   /* %edx =3D Final slot to wr=
ite */
> +
> +1:      mov     %eax, sym_offs(l2_xenmap)(%esi, %ecx, 8)
> +        add     $1, %ecx
> +        add     $1 << L2_PAGETABLE_SHIFT, %eax
> +
> +        cmp     %edx, %ecx
> +        jbe     1b
> +
> +        /*
> +         * Map Xen into the directmap (needed for early-boot pagetable
> +         * handling/walking), and identity map Xen into bootmap (needed =
for
> +         * the transition into long mode), using 2M superpages.
> +         */
> +        lea     sym_esi(_start), %ecx
> +        lea     -1 + sym_esi(_end), %edx
> +        lea     _PAGE_PSE + PAGE_HYPERVISOR_RWX(%ecx), %eax /* PTE to wr=
ite. */
> +        shr     $L2_PAGETABLE_SHIFT, %ecx                   /* First slo=
t to write. */
> +        shr     $L2_PAGETABLE_SHIFT, %edx                   /* Final slo=
t to write. */
> +
> +1:      mov     %eax, sym_offs(l2_bootmap)  (%esi, %ecx, 8)
> +        mov     %eax, sym_offs(l2_directmap)(%esi, %ecx, 8)
> +        add     $1, %ecx
> +        add     $1 << L2_PAGETABLE_SHIFT, %eax
> +
> +        cmp     %edx, %ecx
> +        jbe     1b
> +

I think in addition to these settings, you need to adjust the pointers
already present in the half table you are copying (I suppose that's
why it crashes).

> +        pop     %rdi
> +        pop     %rsi
> +        pop     %rdx
> +        pop     %rcx
> +        pop     %rax
> +
>          /* Save Multiboot2 magic on the stack. */
>          push    %rax
>
> @@ -354,8 +414,15 @@ __efi64_mb2_start:
>           * efi_multiboot2() is called according to System V AMD64 ABI:
>           *   - IN:  %rdi - EFI ImageHandle, %rsi - EFI SystemTable,
>           *          %rdx - MB2 cmdline
> +         *
> +         * Call via the high mappings
>           */
> -        call    efi_multiboot2
> +        lea     __image_base__(%rip), %r10
> +        lea     efi_multiboot2(%rip), %rax
> +        sub     %r10, %rax
> +        mov     $__XEN_VIRT_START, %r10
> +        addq    %r10, %rax
> +        call    *%rax
>
>          /* Just pop an item from the stack. */
>          pop     %rax
> diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
> index 04bb62ae8680..93938d0b03f8 100644
> --- a/xen/arch/x86/boot/x86_64.S
> +++ b/xen/arch/x86/boot/x86_64.S
> @@ -206,3 +206,7 @@ GLOBAL(l2_bootmap)
>  GLOBAL(l3_bootmap)
>          .fill L3_PAGETABLE_ENTRIES, 8, 0
>          .size l3_bootmap, . - l3_bootmap
> +
> +efi_l4_bootmap:
> +        .fill L4_PAGETABLE_ENTRIES, 8, 0
> +        .size efi_l4_bootmap, . - efi_l4_bootmap
>
> base-commit: 457052167b4dbcda59e06300039302479cc1debf

Another way to alleviate the "relocation issues" could be to relocate
to the lower addresses, but this could end up setting some pointers
that won't be relocated back to upper addresses.

Another way would be to consider this code as a separate loader,
making sure it's all data and code position independent (sorry, no
compiler option could do, that's why I wrote that RPC script to check
it).

Note: not saying this patch could not work.

Frediano

