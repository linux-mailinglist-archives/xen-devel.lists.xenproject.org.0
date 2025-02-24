Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE35A4230F
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 15:31:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895199.1303792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmZUM-0005AD-4K; Mon, 24 Feb 2025 14:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895199.1303792; Mon, 24 Feb 2025 14:31:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmZUM-000581-14; Mon, 24 Feb 2025 14:31:18 +0000
Received: by outflank-mailman (input) for mailman id 895199;
 Mon, 24 Feb 2025 14:31:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4VeJ=VP=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tmZUK-00057v-2O
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 14:31:16 +0000
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [2607:f8b0:4864:20::c29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fffc3af1-f2bb-11ef-9aae-95dc52dad729;
 Mon, 24 Feb 2025 15:31:14 +0100 (CET)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-5fcd124dd1cso2492041eaf.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2025 06:31:14 -0800 (PST)
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
X-Inumbo-ID: fffc3af1-f2bb-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1740407473; x=1741012273; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFkoNCbNAVDa7Fax+KNGJqiYNMNzkx3tt+UCI1I3Rpw=;
        b=d+36rce14nCr60GHcROLa+8sCxOA+iqiVUSGa9Tb7K3TQopFaUO16zSafMAVHCVgZp
         xO/X8SGZaIKOinkyRStG095R6zA/NslkfJWHHwdeMGtm14lb7QPc72f+loOX4WKp9MT2
         JtBQKES+gwOn6v0zqXMB+BboU2utrlPr67Mr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740407473; x=1741012273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFkoNCbNAVDa7Fax+KNGJqiYNMNzkx3tt+UCI1I3Rpw=;
        b=go+U8yC+8q5lFDKAXovLXIbZyXUuU00prttQorLywaPU7wmWq7/EBe93xE9m8nxnN0
         CARim7S6JZs7KC0b4gpzHRxJCyyfsmAEnOUJncgoFg3r/t+KbMKDgDPN/G3DyQLeiUL1
         bA9zIRDTGp0wZYahuWnkCi8omNdtX6ysZTtk23a5h1wjoHWBWmXiHIieEPNhyBAjkFcj
         S2Av7SO7GdF5XN7/6E7n9zBnFK6nhROnddTkeDQLb7G0+69nwWRFA5SNnx0vlp15CTlw
         3g7xwsG0QyuuoC/+rEeJj7xUruoFMC/42zktConAxdLBxjcfP6KnA/th1Zjf1dANuLwB
         PsqQ==
X-Gm-Message-State: AOJu0Yyg80EpWYQN94UT1+/0uoPgjKgQabatltgRFvocTViRmd6FhlDq
	C8YlcvAtmZkojyDXQFgubNRSx3yu00wOP5i3IoCDK4oVLCQBPUPzv2YT6xFFE+Tjp5Wnud4q91L
	kqFAp+9jbm8y/38H8UZYmEeVN6hzpu7jNrnvguw==
X-Gm-Gg: ASbGncsk5g/ofjoHZPU1ZfHskF8Z4MWHP9LLjxxrrcqVSqfT/jiye5YPf2ax5ohi6sa
	/FnEL74M8Vj7sAfkeVYUW7grTkXQ3hYS5ho+ySwJvk0S3tZ1LE/5afcTWm8SAI1va07LBr9a9mc
	jYLbT/QLk=
X-Google-Smtp-Source: AGHT+IFjL+hb1lWdTEvuwyXXanxwRI03GVNJq2usyo+oY89dRIMoE51PcaAcips7oiiL4dyD+IqSoyk7IeXaCrBHXiY=
X-Received: by 2002:a05:6820:608:b0:5fc:a89b:a33c with SMTP id
 006d021491bc7-5fd1964f723mr7524230eaf.4.1740407473299; Mon, 24 Feb 2025
 06:31:13 -0800 (PST)
MIME-Version: 1.0
References: <20250217162659.151232-1-frediano.ziglio@cloud.com>
 <Z7jf_YojU9tQ1Or7@mail-itl> <CACHz=Zierjby+_Q93dFeO5mjMG1aiSpyHvDshRK6=ZHY5bH-6A@mail.gmail.com>
 <Z7xxQHVdSGwig4hb@mail-itl>
In-Reply-To: <Z7xxQHVdSGwig4hb@mail-itl>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 24 Feb 2025 14:31:00 +0000
X-Gm-Features: AWEUYZmGUlrxb1TEgl78zZssbPmMJvCroJw1zgf4yzjXGDxQXqhH1bv-66mJmm8
Message-ID: <CACHz=ZgHxvCJQyJe_NJFh3YYcuW0sey+qcOEv0O-XxC8daTo+A@mail.gmail.com>
Subject: Re: [PATCH v6] Avoid crash calling PrintErrMesg from efi_multiboot2
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2025 at 1:16=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Mon, Feb 24, 2025 at 12:57:13PM +0000, Frediano Ziglio wrote:
> > On Fri, Feb 21, 2025 at 8:20=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
> > <marmarek@invisiblethingslab.com> wrote:
> > >
> > > On Mon, Feb 17, 2025 at 04:26:59PM +0000, Frediano Ziglio wrote:
> > > > Although code is compiled with -fpic option data is not position
> > > > independent. This causes data pointer to become invalid if
> > > > code is not relocated properly which is what happens for
> > > > efi_multiboot2 which is called by multiboot entry code.
> > > >
> > > > Code tested adding
> > > >    PrintErrMesg(L"Test message", EFI_BUFFER_TOO_SMALL);
> > > > in efi_multiboot2 before calling efi_arch_edd (this function
> > > > can potentially call PrintErrMesg).
> > > >
> > > > Before the patch (XenServer installation on Qemu, xen replaced
> > > > with vanilla xen.gz):
> > > >   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
> > > >   Test message: !!!! X64 Exception Type - 0E(#PF - Page-Fault)  CPU=
 Apic ID - 00000000 !!!!
> > > >   ExceptionData - 0000000000000000  I:0 R:0 U:0 W:0 P:0 PK:0 SS:0 S=
GX:0
> > > >   RIP  - 000000007EE21E9A, CS  - 0000000000000038, RFLAGS - 0000000=
000210246
> > > >   RAX  - 000000007FF0C1B5, RCX - 0000000000000050, RDX - 0000000000=
000010
> > > >   RBX  - 0000000000000000, RSP - 000000007FF0C180, RBP - 000000007F=
F0C210
> > > >   RSI  - FFFF82D040467CE8, RDI - 0000000000000000
> > > >   R8   - 000000007FF0C1C8, R9  - 000000007FF0C1C0, R10 - 0000000000=
000000
> > > >   R11  - 0000000000001020, R12 - FFFF82D040467CE8, R13 - 000000007F=
F0C1B8
> > > >   R14  - 000000007EA33328, R15 - 000000007EA332D8
> > > >   DS   - 0000000000000030, ES  - 0000000000000030, FS  - 0000000000=
000030
> > > >   GS   - 0000000000000030, SS  - 0000000000000030
> > > >   CR0  - 0000000080010033, CR2 - FFFF82D040467CE8, CR3 - 000000007F=
C01000
> > > >   CR4  - 0000000000000668, CR8 - 0000000000000000
> > > >   DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 0000000000=
000000
> > > >   DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 0000000000=
000400
> > > >   GDTR - 000000007F9DB000 0000000000000047, LDTR - 0000000000000000
> > > >   IDTR - 000000007F48E018 0000000000000FFF,   TR - 0000000000000000
> > > >   FXSAVE_STATE - 000000007FF0BDE0
> > > >   !!!! Find image based on IP(0x7EE21E9A) (No PDB)  (ImageBase=3D00=
0000007EE20000, EntryPoint=3D000000007EE23935) !!!!
> > > >
> > > > After the patch:
> > > >   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
> > > >   Test message: Buffer too small
> > > >   BdsDxe: loading Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-=
3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
> > > >   BdsDxe: starting Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA=
-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
> > > >
> > > > This partially rollback commit 00d5d5ce23e6.
> > > >
> > > > Fixes: 9180f5365524 ("x86: add multiboot2 protocol support for EFI =
platforms")
> > > > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > >
> > > I tried testing this patch, but it seems I cannot reproduce the origi=
nal
> > > failure...
> > >
> > > I did as the commit message suggests here:
> > > https://gitlab.com/xen-project/people/marmarek/xen/-/commit/ca3d6911c=
448eb886990f33d4380b5646617a982
> > >
> > > With blexit() in PrintErrMesg(), it went back to the bootloader, so I=
'm
> > > sure this code path was reached. But with blexit() commented out, Xen
> > > started correctly both with and without this patch... The branch I us=
ed
> > > is here:
> > > https://gitlab.com/xen-project/people/marmarek/xen/-/commits/automati=
on-tests?ref_type=3Dheads
> > >
> > > Are there some extra condition to reproduce the issue? Maybe it depen=
ds
> > > on the compiler version? I guess I can try also on QEMU, but based on
> > > the description, I would expect it to crash in any case.
> > >
> >
> > Did you see the correct message in both cases?
> > Did you use Grub or direct EFI?
> >
> > With Grub and without this patch you won't see the message, with grub
> > with the patch you see the correct message.
>
> I did use grub, and I didn't see the message indeed.
> But in the case it was supposed to crash (with added PrintErrMesg(),
> commented out blexit and without your patch) it did _not_ crashed and
> continued to normal boot. Is that #PF non-fatal here?
>

Hi,
   I tried again with my test environment.
Added the PrintErrMesg line before efi_arch_edd call, I got a #PF, in
my case the system hangs. With the fix patch machine is rebooting and
I can see the message in the logs.
I'm trying with Xen starting inside Qemu, EFI firmware, xen.gz
compiled as ELF file. Host system is an Ubuntu 22.04.5 LTS. Gcc is
version 11.4.

Regards,
   Frediano

