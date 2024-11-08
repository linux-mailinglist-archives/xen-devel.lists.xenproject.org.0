Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 540B69C20B3
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 16:39:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832712.1247990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9R4H-0007mV-DE; Fri, 08 Nov 2024 15:38:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832712.1247990; Fri, 08 Nov 2024 15:38:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9R4H-0007kX-Aa; Fri, 08 Nov 2024 15:38:37 +0000
Received: by outflank-mailman (input) for mailman id 832712;
 Fri, 08 Nov 2024 15:38:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kpLv=SD=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t9R4F-0007kR-5e
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 15:38:35 +0000
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [2607:f8b0:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 817feb4e-9de7-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 16:38:31 +0100 (CET)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-7180f2f5fb0so1475701a34.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 07:38:31 -0800 (PST)
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
X-Inumbo-ID: 817feb4e-9de7-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjozMmEiLCJoZWxvIjoibWFpbC1vdDEteDMyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjgxN2ZlYjRlLTlkZTctMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDgwMzExLjcyMjI2NCwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731080310; x=1731685110; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzkQ6yjrGMHNFOleLn3anvYPdWAO2I6q1VA1NHFPq9g=;
        b=WF72ADTNL5/bwV2Wnr9A7FDXg9QMBzcpSmai+mJoxianfv3fFuc8YGOX/bvxmFhrB0
         PRf+5amfrXuUzXRUVhEIINKkAHALMAjc96Wscj17t6HINMKKZFxV0cQT0LEPWoYt59BS
         TNPyPWt7zJgiL9Gw6jSOxE6VvyoeUaPP4fM0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731080310; x=1731685110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzkQ6yjrGMHNFOleLn3anvYPdWAO2I6q1VA1NHFPq9g=;
        b=U1PtpsotVI2kistLXqW3TX5XOYK3Ii1sdZBZJTgEiI1t0NU11a03/wgNUo8FXYvEzE
         uaHW3ZMutZRCtY3vUA+LYq9mQ2iE2JP1B3uAFcdsE+CXYxlHl2VFm6sC23tGVh0wPaz5
         O7WTIVl3FDVw02HHnLBuVotd+FOuP6jcVXb5ehMUZ2u9yjkvzjQYjsqnQsidukAafBm7
         SygDyAqx6RqqVYdNDXhFRdQY3pMUh4j0Xuxncw0WEhWfuQsJQdrMuCNu6/SBY2Ja627i
         m4l0B3I7UYPsvYxqjaokk3Hqwb+Nzdwck8ljpGqLzO6TzSQKrY+1Co8Cf0vzj+bSHJIl
         DNEQ==
X-Gm-Message-State: AOJu0YypCuDp4DvqKinize8ulVaZq4mZH0uu3LtVMRrdHIh3rNbgE2TI
	dATrC5jW2ZCMQYyFAieb8mOxVzCV3QU2Q/Fc28b5cQfarXl+Mz9c4X5+46LyvM9+oBW0mZLyaLX
	5PJ+IMPe+paklY1SPGtEdZtrkzLoRW4RDZ6GMdQ==
X-Google-Smtp-Source: AGHT+IELsFKkJGA0G9/REqbDphWczSd5IZt69INWGXTBcpeEdSBiR8sQbsdoL7sLiubKSumZbbkwDwpBvY5rTEhRk3w=
X-Received: by 2002:a05:6830:6186:b0:717:d012:a513 with SMTP id
 46e09a7af769-71a1c26869emr4265416a34.19.1731080310153; Fri, 08 Nov 2024
 07:38:30 -0800 (PST)
MIME-Version: 1.0
References: <20241108145335.315884-1-andrew.cooper3@citrix.com>
In-Reply-To: <20241108145335.315884-1-andrew.cooper3@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 8 Nov 2024 15:38:17 +0000
Message-ID: <CACHz=ZgN5UOFFMfH2MqD3ouSmGsk8_T+47W=F61nnUV7vGfV6w@mail.gmail.com>
Subject: Re: [PATCH v2] x86/trampoline: Collect other scattered trampoline symbols
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2024 at 2:53=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> ... and document them too.
>
> No functional change.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Frediano Ziglio <frediano.ziglio@cloud.com>
> CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>
> v2:
>  * Rebase
>
> video.h, edd.h and e820.h also contain trampoline symbols, but they're pr=
etty
> well contained headers already.
>
> kbd_shift_flags seems especially dubious.  It's a snapshot of the keyboar=
d
> state when Xen happened to pass through the trampoline, and surely cannot=
 be
> useful for dom0 in the slightest...

I suppose an OT comment here.
It's just passed as a firmware information back to dom0.
It's used by the Linux kernel. See for instance
https://gfiber.googlesource.com/kernel/bruno/+/801f6772cecea6cfc7da61aa1977=
16ab64db5f9e/arch/x86/xen/enlighten.c.

> ---
>  xen/arch/x86/include/asm/processor.h  |  2 --
>  xen/arch/x86/include/asm/setup.h      |  2 --
>  xen/arch/x86/include/asm/trampoline.h | 15 +++++++++++++++
>  3 files changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/=
asm/processor.h
> index 26e2fb13699a..877651212273 100644
> --- a/xen/arch/x86/include/asm/processor.h
> +++ b/xen/arch/x86/include/asm/processor.h
> @@ -96,8 +96,6 @@ extern void ctxt_switch_levelling(const struct vcpu *ne=
xt);
>  extern void (*ctxt_switch_masking)(const struct vcpu *next);
>
>  extern bool opt_cpu_info;
> -extern u32 trampoline_efer;
> -extern u64 trampoline_misc_enable_off;
>
>  /* Maximum width of physical addresses supported by the hardware. */
>  extern unsigned int paddr_bits;
> diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/=
setup.h
> index d7ed4f40024c..25c15ef9140d 100644
> --- a/xen/arch/x86/include/asm/setup.h
> +++ b/xen/arch/x86/include/asm/setup.h
> @@ -48,8 +48,6 @@ int remove_xen_ranges(struct rangeset *r);
>
>  int cf_check stub_selftest(void);
>
> -extern uint8_t kbd_shift_flags;
> -
>  #ifdef NDEBUG
>  # define highmem_start 0
>  #else
> diff --git a/xen/arch/x86/include/asm/trampoline.h b/xen/arch/x86/include=
/asm/trampoline.h
> index 57a1f85a539e..838c2f0b6fcd 100644
> --- a/xen/arch/x86/include/asm/trampoline.h
> +++ b/xen/arch/x86/include/asm/trampoline.h
> @@ -85,9 +85,24 @@ extern uint32_t trampoline_xen_phys_start;
>  /* A semaphore to indicate signs-of-life at the start of the AP boot pat=
h. */
>  extern uint8_t trampoline_cpu_started;
>
> +/*
> + * Extra MSR_EFER settings when activating Long Mode.  EFER_NXE is neces=
sary
> + * for APs to boot if the BSP found and activated support.
> + */
> +extern uint32_t trampoline_efer;
> +
> +/*
> + * When nonzero, clear the specified bits in MSR_MISC_ENABLE.  This is
> + * necessary to clobber XD_DISABLE before trying to set MSR_EFER.NXE.
> + */
> +extern uint64_t trampoline_misc_enable_off;
> +
>  /* Quirks about video mode-setting on S3 resume. */
>  extern uint8_t video_flags;
>
> +/* BIOS Int 16h, Fn 02h.  The keyboard shift status. */
> +extern uint8_t kbd_shift_flags;
> +
>  /* Extended Display Identification Data, gathered from the BIOS. */
>  extern uint16_t boot_edid_caps;
>  extern uint8_t boot_edid_info[128];
>
> base-commit: 75035c386eeb8bd5dbed1831dbb96a35b31521f6

Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Frediano

