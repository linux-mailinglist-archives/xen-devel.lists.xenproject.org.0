Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 286D6A2897F
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 12:40:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882183.1292367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfdls-0006Wd-It; Wed, 05 Feb 2025 11:40:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882183.1292367; Wed, 05 Feb 2025 11:40:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfdls-0006VE-Fd; Wed, 05 Feb 2025 11:40:44 +0000
Received: by outflank-mailman (input) for mailman id 882183;
 Wed, 05 Feb 2025 11:40:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IR4Y=U4=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tfdlr-0006V6-C3
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 11:40:43 +0000
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [2607:f8b0:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06a797b1-e3b6-11ef-99a4-01e77a169b0f;
 Wed, 05 Feb 2025 12:40:41 +0100 (CET)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3ebb1652729so3707198b6e.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2025 03:40:41 -0800 (PST)
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
X-Inumbo-ID: 06a797b1-e3b6-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1738755640; x=1739360440; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+CwoSfbhVL49OnFHvrIM1Z+kLGoqQwR2M25Xd6bTvw=;
        b=gs0A7fafI3sYOuy4x0LRTtbzjEicvrxQFaqSr22fel3GP5qBNTETapUUuV762JuIT/
         yivAjUUZxVq9PJ2rGY2HMAalamhvs8I2zhtbNOcuet+Mr9Wm8bZIJA4za+IE7yErRx6y
         CXomnVvjP26XyHdmlNhd0Uv+q8qbx4QVoj9fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738755640; x=1739360440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+CwoSfbhVL49OnFHvrIM1Z+kLGoqQwR2M25Xd6bTvw=;
        b=icCHTl+QGfqX4wTEhiIzqeybyd2+QZPxh+8gztotr+m44q0E3MbDdH6sDEdVlmbLjX
         uxRfcOIPwib/IgjOMjds2rH7YF+SqeLDKceStegZ0O91RZWd52yBLQVF7GFkW1l58nz1
         ihtoUEGMI6RkCeANN5RfxmtN4ZJdDkVJaLQ18TnLELtncvbA85PaaGPXuAtHCjKQM1vl
         PvlJeFTTuj6y0UcQeL5zueVK8m0L0GBUU5xBlgDWAnvPzntUMI4nty8u0ocYmYzo3lQG
         FrkuxrdbsG+VT3YDDpT2Kf0/WzDaW8UzoDi2tO8RYuOvtuDZLzSaAlT+PUb+Y3fpqirq
         /+Qw==
X-Forwarded-Encrypted: i=1; AJvYcCW5DhFmK5nrRSb9LQLIvKtIKc3YBKgxQI4jPRqAGLsIlw1zw/2ZqVaYD6PJqPwtPV43/uUjLvYKKEs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwiqKuhYDkSh/KjAfpfbXDuTf/uIWUf9xIKiEn4SyHAVaL1QAjC
	jnlmzskQNG6nHOWRTGhfTrmoBMO+DHEDkQ893NsU1lOc+ALxIv9zG1CMBMjQJRCihvoEzW06KOX
	IVol/E3pbqLjeMZJqlUs5VcOOeWW8R2iQG6Nv0l8nvdiBlmVx7Os=
X-Gm-Gg: ASbGnctutSm0wcO9OuN3Y0WZ8LmzWnoxgz4vefLx0KV9dxwKpglFi5NUvl638+vnmc3
	ER5hkSBPmuqar33/J9cDfPxPzD1/2qTKf8jPDJnqW5jywUPMFws6/kwwMHoXsE0HKTHUxOw==
X-Google-Smtp-Source: AGHT+IFiqFWWAhnl3nT3usnRyvB2DHW1J5/FcRs3ybZJWnxu+rrqybBLDLef+3SnOmrfX0SZQa3bZs/ok5DHLu+NB74=
X-Received: by 2002:a05:6870:14cd:b0:29e:247b:4f77 with SMTP id
 586e51a60fabf-2b804fa4050mr1310611fac.20.1738755640068; Wed, 05 Feb 2025
 03:40:40 -0800 (PST)
MIME-Version: 1.0
References: <20250122101407.52282-1-frediano.ziglio@cloud.com>
 <9d7b6706-7415-43d5-a66e-650eb67437fa@suse.com> <5c9ab6a7-2095-4f7c-8e5b-1942ad54420d@gmail.com>
In-Reply-To: <5c9ab6a7-2095-4f7c-8e5b-1942ad54420d@gmail.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 5 Feb 2025 11:40:29 +0000
X-Gm-Features: AWEUYZlxxTNrC1APXSby2CtNWZFXoHwRPrYixCcr0S3KFM-McaonywhunuZ5k90
Message-ID: <CACHz=Zjru+BYnhFz97W1LGpTQNej+SM6-jZ-rqGE=D6x0rt5+A@mail.gmail.com>
Subject: Re: [PATCH for-4.20 v5] Avoid crash calling PrintErrMesg from efi_multiboot2
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 10:24=E2=80=AFAM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
>
> On 2/4/25 2:07 PM, Jan Beulich wrote:
>
> On 22.01.2025 11:14, Frediano Ziglio wrote:
>
> Although code is compiled with -fpic option data is not position
> independent. This causes data pointer to become invalid if
> code is not relocated properly which is what happens for
> efi_multiboot2 which is called by multiboot entry code.
>
> Code tested adding
>    PrintErrMesg(L"Test message", EFI_BUFFER_TOO_SMALL);
> in efi_multiboot2 before calling efi_arch_edd (this function
> can potentially call PrintErrMesg).
>
> Before the patch (XenServer installation on Qemu, xen replaced
> with vanilla xen.gz):
>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
>   Test message: !!!! X64 Exception Type - 0E(#PF - Page-Fault)  CPU Apic =
ID - 00000000 !!!!
>   ExceptionData - 0000000000000000  I:0 R:0 U:0 W:0 P:0 PK:0 SS:0 SGX:0
>   RIP  - 000000007EE21E9A, CS  - 0000000000000038, RFLAGS - 0000000000210=
246
>   RAX  - 000000007FF0C1B5, RCX - 0000000000000050, RDX - 0000000000000010
>   RBX  - 0000000000000000, RSP - 000000007FF0C180, RBP - 000000007FF0C210
>   RSI  - FFFF82D040467CE8, RDI - 0000000000000000
>   R8   - 000000007FF0C1C8, R9  - 000000007FF0C1C0, R10 - 0000000000000000
>   R11  - 0000000000001020, R12 - FFFF82D040467CE8, R13 - 000000007FF0C1B8
>   R14  - 000000007EA33328, R15 - 000000007EA332D8
>   DS   - 0000000000000030, ES  - 0000000000000030, FS  - 0000000000000030
>   GS   - 0000000000000030, SS  - 0000000000000030
>   CR0  - 0000000080010033, CR2 - FFFF82D040467CE8, CR3 - 000000007FC01000
>   CR4  - 0000000000000668, CR8 - 0000000000000000
>   DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 0000000000000000
>   DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 0000000000000400
>   GDTR - 000000007F9DB000 0000000000000047, LDTR - 0000000000000000
>   IDTR - 000000007F48E018 0000000000000FFF,   TR - 0000000000000000
>   FXSAVE_STATE - 000000007FF0BDE0
>   !!!! Find image based on IP(0x7EE21E9A) (No PDB)  (ImageBase=3D00000000=
7EE20000, EntryPoint=3D000000007EE23935) !!!!
>
> After the patch:
>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
>   Test message: Buffer too small
>   BdsDxe: loading Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF=
6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
>   BdsDxe: starting Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4A=
F6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
>
> This partially rollback commit 00d5d5ce23e6.
>
> Fixes: 9180f5365524 ("x86: add multiboot2 protocol support for EFI platfo=
rms")
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>
> I expect we want this in before the release. Oleksii? Maintainers?
>
> Interesting it is a fix for a ~3 years old bug ( if to look at when 9180f=
5365524 is introduced ) so it seems it happens not often.

I would say it's quite normal for booting messages, usually we expect
them to work and not get errors, we are in a pretty "stable" state.
The problem happens when there are some strange combinations of
firmware bugs or behavior resulting in errors. There was a bug some
time ago during the boot phase where a message would be helpful
instead of a crash, but it exercised a different error path.

> Anyway, I agree that we want this fix before the release:
> R-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> Thanks.
>
> ~ Oleksii
>
> Jan

