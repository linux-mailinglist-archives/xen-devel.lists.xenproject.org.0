Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 780A6A38531
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 14:56:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890477.1299612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk1bK-0003w9-EP; Mon, 17 Feb 2025 13:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890477.1299612; Mon, 17 Feb 2025 13:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk1bK-0003uc-A6; Mon, 17 Feb 2025 13:55:58 +0000
Received: by outflank-mailman (input) for mailman id 890477;
 Mon, 17 Feb 2025 13:55:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IPKs=VI=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tk1bI-0003uF-Cd
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 13:55:56 +0000
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [2607:f8b0:4864:20::c34])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7ebde64-ed36-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 14:55:55 +0100 (CET)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-5f6b65c89c4so1096565eaf.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 05:55:55 -0800 (PST)
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
X-Inumbo-ID: e7ebde64-ed36-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1739800554; x=1740405354; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYKrB7dx7auYQhnj9zMIveyfTzRyDwAPCIrD+9oIFOk=;
        b=BXkXPRXrdYKqGj6/RmrL6cUyzAkdoNYgwSDd9xyKDH9O0Q4hKAN6RYMnq2V2nVKrDE
         mDCZXQ+hX5iYYSt5VwPanczWE33S3Ca7CZ7A8HYy/BpNtKKs/cDLheBwc0e+ISf230Ke
         RVCPsvQZXC/TD6tQSVfiguqGuG3bcPD5us+9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739800554; x=1740405354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYKrB7dx7auYQhnj9zMIveyfTzRyDwAPCIrD+9oIFOk=;
        b=mAQLQMvNMuOoR081yIJ+virrLk1oh9iXD6/TRes+djG6zMx1qmYVBVwPH/CahcF9fp
         kv2O1mujkWbwI6OTtc7weW8Vgmz3BSQYhMJr6YT7vA9oJuz1Bxx1foE0H84Ur0n3y+cj
         pOvQTrnTu5i61jKGp86qhf4cOdXYu+Wq+dKvtOYx2j0UE6DxlmETvM+Zqyrr3ibaaQss
         83NpJw/Z9dyKAA5oibDK0evyRySujb5FjJYyvA1kyAnXF02L9oBE3X0B94pNQsfBOEec
         80IMolHOWkp+wk7hon2ynyYRdXvId6iF3guSNOGQeQAe/68+Kp3/oGBQrqKG/AemnLGO
         gaWA==
X-Forwarded-Encrypted: i=1; AJvYcCVIiSH2AtpdsaeLI+Knct3u8DNOjGp7+wVAlapnM28Z89By5g87i2jx5/OAYIDx3lBtShJ9LTXJR34=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVhpJOyLMYXVFoxrz4EEEF0O7S5QrlHBKzpxcgENmK1SMMKX0I
	j3orVGiLjLl+jj43OsaCwJDzOFY10X2csQrQdQNuDI1AUfgubVWHhCawstUxn9JaIvBLnvTtmC1
	GUqcdA1CDfGw7m9GNTJvWzyv22fxOdgQLJeEHiw==
X-Gm-Gg: ASbGnct4m6qchWt/PFP2VB27Rwlp/RGKix8KddPRe27AcTtPF8xgabsrlRLFCZ0woHx
	cRxCfYK+hz5/SowIGnYApmqn3edTtYAfCJCadJQSPW242YgQo1KiVvjPXZhvZIjakSuLmrQ==
X-Google-Smtp-Source: AGHT+IE8HcXeCQam/AnvgXSewiRnlnBhaUFb/74Nl2jHh6/P9LHrUjR1ugmprts1YaWPOXEg5HejULUHkXoEBibb35E=
X-Received: by 2002:a05:6870:e0c8:b0:29e:290f:7aea with SMTP id
 586e51a60fabf-2bc99d8fcaemr5949577fac.34.1739800554123; Mon, 17 Feb 2025
 05:55:54 -0800 (PST)
MIME-Version: 1.0
References: <20250122101407.52282-1-frediano.ziglio@cloud.com>
 <9d7b6706-7415-43d5-a66e-650eb67437fa@suse.com> <5c9ab6a7-2095-4f7c-8e5b-1942ad54420d@gmail.com>
 <CACHz=Zjru+BYnhFz97W1LGpTQNej+SM6-jZ-rqGE=D6x0rt5+A@mail.gmail.com>
In-Reply-To: <CACHz=Zjru+BYnhFz97W1LGpTQNej+SM6-jZ-rqGE=D6x0rt5+A@mail.gmail.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 17 Feb 2025 13:55:43 +0000
X-Gm-Features: AWEUYZm7ex6ZWOpVg2QoyeOMTB8W7cBWrrCLnzbdIfvom_cKsZGzPxKJDeLK7YA
Message-ID: <CACHz=ZghOk1EET3_N3Rn-1+0anZ7e702cKux7U5bBf862fDfQw@mail.gmail.com>
Subject: Re: [PATCH for-4.20 v5] Avoid crash calling PrintErrMesg from efi_multiboot2
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping

On Wed, Feb 5, 2025 at 11:40=E2=80=AFAM Frediano Ziglio
<frediano.ziglio@cloud.com> wrote:
>
> On Wed, Feb 5, 2025 at 10:24=E2=80=AFAM Oleksii Kurochko
> <oleksii.kurochko@gmail.com> wrote:
> >
> >
> > On 2/4/25 2:07 PM, Jan Beulich wrote:
> >
> > On 22.01.2025 11:14, Frediano Ziglio wrote:
> >
> > Although code is compiled with -fpic option data is not position
> > independent. This causes data pointer to become invalid if
> > code is not relocated properly which is what happens for
> > efi_multiboot2 which is called by multiboot entry code.
> >
> > Code tested adding
> >    PrintErrMesg(L"Test message", EFI_BUFFER_TOO_SMALL);
> > in efi_multiboot2 before calling efi_arch_edd (this function
> > can potentially call PrintErrMesg).
> >
> > Before the patch (XenServer installation on Qemu, xen replaced
> > with vanilla xen.gz):
> >   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
> >   Test message: !!!! X64 Exception Type - 0E(#PF - Page-Fault)  CPU Api=
c ID - 00000000 !!!!
> >   ExceptionData - 0000000000000000  I:0 R:0 U:0 W:0 P:0 PK:0 SS:0 SGX:0
> >   RIP  - 000000007EE21E9A, CS  - 0000000000000038, RFLAGS - 00000000002=
10246
> >   RAX  - 000000007FF0C1B5, RCX - 0000000000000050, RDX - 00000000000000=
10
> >   RBX  - 0000000000000000, RSP - 000000007FF0C180, RBP - 000000007FF0C2=
10
> >   RSI  - FFFF82D040467CE8, RDI - 0000000000000000
> >   R8   - 000000007FF0C1C8, R9  - 000000007FF0C1C0, R10 - 00000000000000=
00
> >   R11  - 0000000000001020, R12 - FFFF82D040467CE8, R13 - 000000007FF0C1=
B8
> >   R14  - 000000007EA33328, R15 - 000000007EA332D8
> >   DS   - 0000000000000030, ES  - 0000000000000030, FS  - 00000000000000=
30
> >   GS   - 0000000000000030, SS  - 0000000000000030
> >   CR0  - 0000000080010033, CR2 - FFFF82D040467CE8, CR3 - 000000007FC010=
00
> >   CR4  - 0000000000000668, CR8 - 0000000000000000
> >   DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 00000000000000=
00
> >   DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 00000000000004=
00
> >   GDTR - 000000007F9DB000 0000000000000047, LDTR - 0000000000000000
> >   IDTR - 000000007F48E018 0000000000000FFF,   TR - 0000000000000000
> >   FXSAVE_STATE - 000000007FF0BDE0
> >   !!!! Find image based on IP(0x7EE21E9A) (No PDB)  (ImageBase=3D000000=
007EE20000, EntryPoint=3D000000007EE23935) !!!!
> >
> > After the patch:
> >   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
> >   Test message: Buffer too small
> >   BdsDxe: loading Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4=
AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
> >   BdsDxe: starting Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE=
4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
> >
> > This partially rollback commit 00d5d5ce23e6.
> >
> > Fixes: 9180f5365524 ("x86: add multiboot2 protocol support for EFI plat=
forms")
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> >
> > I expect we want this in before the release. Oleksii? Maintainers?
> >
> > Interesting it is a fix for a ~3 years old bug ( if to look at when 918=
0f5365524 is introduced ) so it seems it happens not often.
>
> I would say it's quite normal for booting messages, usually we expect
> them to work and not get errors, we are in a pretty "stable" state.
> The problem happens when there are some strange combinations of
> firmware bugs or behavior resulting in errors. There was a bug some
> time ago during the boot phase where a message would be helpful
> instead of a crash, but it exercised a different error path.
>
> > Anyway, I agree that we want this fix before the release:
> > R-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> >
> > Thanks.
> >
> > ~ Oleksii
> >
> > Jan

