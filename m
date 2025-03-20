Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13398A6AF02
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 21:12:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923134.1326800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvMEU-0000O3-Ar; Thu, 20 Mar 2025 20:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923134.1326800; Thu, 20 Mar 2025 20:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvMEU-0000LD-7n; Thu, 20 Mar 2025 20:11:14 +0000
Received: by outflank-mailman (input) for mailman id 923134;
 Thu, 20 Mar 2025 20:11:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nziT=WH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tvMES-0000Kn-35
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 20:11:12 +0000
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [2607:f8b0:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75823b65-05c7-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 21:11:08 +0100 (CET)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-7273b01fe35so734751a34.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 13:11:08 -0700 (PDT)
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
X-Inumbo-ID: 75823b65-05c7-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1742501467; x=1743106267; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3o9MNS3F3przhy/Vdl/s3P9tRARp8NAO1wS3I1uhMe4=;
        b=dcu+PaS7loPtdW50n7jyONy0R1qv7FM4biDPSvqVyW/Bieoee9ITq4ZsVe1wIvQeK7
         Zu1x02rx0iITVWAlvrz6gh9/ieB1ucsPDKkEwMWOZTbspJ/zBHXMY+1eZM0taErd7jbR
         BWOVbyogln9xhLBWFL/wP+31DzrJa+TFKElBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742501467; x=1743106267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3o9MNS3F3przhy/Vdl/s3P9tRARp8NAO1wS3I1uhMe4=;
        b=e3Gl31pHQ2riqrXRELGK1stR/OG8W+MEmBJo4kmD5zhxC5OSZAjk1SLBgxWjoFRQKk
         Gk/tPW26riFf3mq1WCUZ+c30TZHdeQUNnVXrD3F0CRHJhu6NqreM9HCmKQYzY1QyOYfe
         6FB5CdKmRCNUk/5zVfT/L1SrQWeF7dEB0Ej8linHppceOL5pJ1FD0jrvnYAFYow9vJJW
         qOh/YR6ewwQWP85UIxQyedgucclwMKsmlWgT+nriNmeW65TaoG0jSZuDwK5G7j7QX2Ny
         iVRymiIX6LoWG2QEa8fZc4YjhMJ+K0x1JHM4EQiwRC1xjO14Wuof4VsTdSuIhbXsR7Zf
         wu0g==
X-Forwarded-Encrypted: i=1; AJvYcCU4IYuA5INk1+oLGy6srQhawcyTtkjf9NLNMegjz6K8ro9VPqKdyQ5GhlaR/GHWj7QBjZSSI4ou+2o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+EOVrCsXy5m0FKLfV6QmKzANBKcCABLVdf4VZEvT+1Sv/mYE9
	alg70N+N3DOEzaK+tT0GyvURQAjZy1xpKh+kwRS3tW0adKraCbVOW+6VqqmYQM8RS6kkZL96tJk
	ZHnXByvMVHQPzMCekP7McmV2mtacm2oNNgsnehw==
X-Gm-Gg: ASbGncs308msOygwfuRylOaLF9cXAL6U4YYDIzY7Lr0CqXF2L1/1eDINmXRzSGkxREu
	fRCzDs8kaKKvVfs+TI3V5PMP4rLsF1fFb93FD3eorcdN740T7PELDnG2xgKv+qmF1YyD0eZd0KC
	qySoen2J7VNrUxCfb3RYfXZWQ=
X-Google-Smtp-Source: AGHT+IHkuSV9WWiptfV1+JLNlwyQpBDQ9ntefH//TmvccOnL8/kgGlvOrnPoilnagJ777Pf3DM61Z4TIONFY08mQvrQ=
X-Received: by 2002:a05:6808:2199:b0:3fb:49cd:6bf5 with SMTP id
 5614622812f47-3febf7944bemr370781b6e.32.1742501466821; Thu, 20 Mar 2025
 13:11:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250217162659.151232-1-frediano.ziglio@cloud.com>
 <Z7jf_YojU9tQ1Or7@mail-itl> <CACHz=Zierjby+_Q93dFeO5mjMG1aiSpyHvDshRK6=ZHY5bH-6A@mail.gmail.com>
 <Z7xxQHVdSGwig4hb@mail-itl> <CACHz=ZgHxvCJQyJe_NJFh3YYcuW0sey+qcOEv0O-XxC8daTo+A@mail.gmail.com>
 <Z79jhZ_BGEC6DYl4@mail-itl> <086f7e05-2cab-4a53-8ecb-dff7421e38bc@suse.com>
 <CACHz=ZjtjMyv5OmUT8dNHAzqrw5c7ij58quo1SuDc2ZBSjQRmw@mail.gmail.com>
 <CACHz=ZjLq8vVLtLL40DjcLV5wwxyatLdy4g3rq1ifSVcnATr8g@mail.gmail.com> <cd29d79c-fa6a-48a7-aefe-7e8abba9bf95@suse.com>
In-Reply-To: <cd29d79c-fa6a-48a7-aefe-7e8abba9bf95@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 20 Mar 2025 20:10:55 +0000
X-Gm-Features: AQ5f1Jry2BbyfeIlVuRgfKU_Lt1Gln-sYmhs0VmRs-TZZA-xpen31-Ct-KK2kkc
Message-ID: <CACHz=ZjW8_sbHUAZtPXeG+Nc3CdKFgESkg2n3r7MWTqPBcWWBA@mail.gmail.com>
Subject: Re: [PATCH v6] Avoid crash calling PrintErrMesg from efi_multiboot2
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 3:15=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 20.03.2025 15:33, Frediano Ziglio wrote:
> > On Thu, Mar 6, 2025 at 3:02=E2=80=AFPM Frediano Ziglio
> > <frediano.ziglio@cloud.com> wrote:
> >>
> >> On Thu, Mar 6, 2025 at 2:26=E2=80=AFPM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>>
> >>> On 26.02.2025 19:54, Marek Marczykowski-G=C3=B3recki wrote:
> >>>> On Mon, Feb 24, 2025 at 02:31:00PM +0000, Frediano Ziglio wrote:
> >>>>> On Mon, Feb 24, 2025 at 1:16=E2=80=AFPM Marek Marczykowski-G=C3=B3r=
ecki
> >>>>> <marmarek@invisiblethingslab.com> wrote:
> >>>>>>
> >>>>>> On Mon, Feb 24, 2025 at 12:57:13PM +0000, Frediano Ziglio wrote:
> >>>>>>> On Fri, Feb 21, 2025 at 8:20=E2=80=AFPM Marek Marczykowski-G=C3=
=B3recki
> >>>>>>> <marmarek@invisiblethingslab.com> wrote:
> >>>>>>>>
> >>>>>>>> On Mon, Feb 17, 2025 at 04:26:59PM +0000, Frediano Ziglio wrote:
> >>>>>>>>> Although code is compiled with -fpic option data is not positio=
n
> >>>>>>>>> independent. This causes data pointer to become invalid if
> >>>>>>>>> code is not relocated properly which is what happens for
> >>>>>>>>> efi_multiboot2 which is called by multiboot entry code.
> >>>>>>>>>
> >>>>>>>>> Code tested adding
> >>>>>>>>>    PrintErrMesg(L"Test message", EFI_BUFFER_TOO_SMALL);
> >>>>>>>>> in efi_multiboot2 before calling efi_arch_edd (this function
> >>>>>>>>> can potentially call PrintErrMesg).
> >>>>>>>>>
> >>>>>>>>> Before the patch (XenServer installation on Qemu, xen replaced
> >>>>>>>>> with vanilla xen.gz):
> >>>>>>>>>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
> >>>>>>>>>   Test message: !!!! X64 Exception Type - 0E(#PF - Page-Fault) =
 CPU Apic ID - 00000000 !!!!
> >>>>>>>>>   ExceptionData - 0000000000000000  I:0 R:0 U:0 W:0 P:0 PK:0 SS=
:0 SGX:0
> >>>>>>>>>   RIP  - 000000007EE21E9A, CS  - 0000000000000038, RFLAGS - 000=
0000000210246
> >>>>>>>>>   RAX  - 000000007FF0C1B5, RCX - 0000000000000050, RDX - 000000=
0000000010
> >>>>>>>>>   RBX  - 0000000000000000, RSP - 000000007FF0C180, RBP - 000000=
007FF0C210
> >>>>>>>>>   RSI  - FFFF82D040467CE8, RDI - 0000000000000000
> >>>>>>>>>   R8   - 000000007FF0C1C8, R9  - 000000007FF0C1C0, R10 - 000000=
0000000000
> >>>>>>>>>   R11  - 0000000000001020, R12 - FFFF82D040467CE8, R13 - 000000=
007FF0C1B8
> >>>>>>>>>   R14  - 000000007EA33328, R15 - 000000007EA332D8
> >>>>>>>>>   DS   - 0000000000000030, ES  - 0000000000000030, FS  - 000000=
0000000030
> >>>>>>>>>   GS   - 0000000000000030, SS  - 0000000000000030
> >>>>>>>>>   CR0  - 0000000080010033, CR2 - FFFF82D040467CE8, CR3 - 000000=
007FC01000
> >>>>>>>>>   CR4  - 0000000000000668, CR8 - 0000000000000000
> >>>>>>>>>   DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 000000=
0000000000
> >>>>>>>>>   DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 000000=
0000000400
> >>>>>>>>>   GDTR - 000000007F9DB000 0000000000000047, LDTR - 000000000000=
0000
> >>>>>>>>>   IDTR - 000000007F48E018 0000000000000FFF,   TR - 000000000000=
0000
> >>>>>>>>>   FXSAVE_STATE - 000000007FF0BDE0
> >>>>>>>>>   !!!! Find image based on IP(0x7EE21E9A) (No PDB)  (ImageBase=
=3D000000007EE20000, EntryPoint=3D000000007EE23935) !!!!
> >>>>>>>>>
> >>>>>>>>> After the patch:
> >>>>>>>>>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
> >>>>>>>>>   Test message: Buffer too small
> >>>>>>>>>   BdsDxe: loading Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-A=
AEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
> >>>>>>>>>   BdsDxe: starting Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-=
AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
> >>>>>>>>>
> >>>>>>>>> This partially rollback commit 00d5d5ce23e6.
> >>>>>>>>>
> >>>>>>>>> Fixes: 9180f5365524 ("x86: add multiboot2 protocol support for =
EFI platforms")
> >>>>>>>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> >>>>>>>>
> >>>>>>>> I tried testing this patch, but it seems I cannot reproduce the =
original
> >>>>>>>> failure...
> >>>>>>>>
> >>>>>>>> I did as the commit message suggests here:
> >>>>>>>> https://gitlab.com/xen-project/people/marmarek/xen/-/commit/ca3d=
6911c448eb886990f33d4380b5646617a982
> >>>>>>>>
> >>>>>>>> With blexit() in PrintErrMesg(), it went back to the bootloader,=
 so I'm
> >>>>>>>> sure this code path was reached. But with blexit() commented out=
, Xen
> >>>>>>>> started correctly both with and without this patch... The branch=
 I used
> >>>>>>>> is here:
> >>>>>>>> https://gitlab.com/xen-project/people/marmarek/xen/-/commits/aut=
omation-tests?ref_type=3Dheads
> >>>>>>>>
> >>>>>>>> Are there some extra condition to reproduce the issue? Maybe it =
depends
> >>>>>>>> on the compiler version? I guess I can try also on QEMU, but bas=
ed on
> >>>>>>>> the description, I would expect it to crash in any case.
> >>>>>>>>
> >>>>>>>
> >>>>>>> Did you see the correct message in both cases?
> >>>>>>> Did you use Grub or direct EFI?
> >>>>>>>
> >>>>>>> With Grub and without this patch you won't see the message, with =
grub
> >>>>>>> with the patch you see the correct message.
> >>>>>>
> >>>>>> I did use grub, and I didn't see the message indeed.
> >>>>>> But in the case it was supposed to crash (with added PrintErrMesg(=
),
> >>>>>> commented out blexit and without your patch) it did _not_ crashed =
and
> >>>>>> continued to normal boot. Is that #PF non-fatal here?
> >>>>>>
> >>>>>
> >>>>> Hi,
> >>>>>    I tried again with my test environment.
> >>>>> Added the PrintErrMesg line before efi_arch_edd call, I got a #PF, =
in
> >>>>> my case the system hangs. With the fix patch machine is rebooting a=
nd
> >>>>> I can see the message in the logs.
> >>>>> I'm trying with Xen starting inside Qemu, EFI firmware, xen.gz
> >>>>> compiled as ELF file. Host system is an Ubuntu 22.04.5 LTS. Gcc is
> >>>>> version 11.4.
> >>>>
> >>>> My test was wrong, commenting out blexit made "mesg" variable unused=
.
> >>>> After fixing that, I can reproduce it on both QEMU and real hardware=
:
> >>>> without your patch it crashes and with your patch it works just fine=
.
> >>>> While there may be more places with similar issue, this patch clearl=
y
> >>>> improves the situation, so:
> >>>>
> >>>> Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
> >>>
> >>> This had to be reverted, for breaking the build with old Clang. See t=
he
> >>> respective Matrix conversation.
> >>
> >> To sum up the failure is:
> >>
> >>     clang: error: unknown argument: '-fno-jump-tables'
> >
> > Now that the minimum clang version supports this option, can this
> > change be applied?
>
> Not sure. I for one would expect that we actively reject building with
> too old tool chains then, which is yet to be carried out. Plus I think
> you'd want to re-submit, with all tags dropped. The change was wrong to
> go in at that earlier point, and hence any such tags weren't quite
> accurate.
>
> Jan

Hi,
  not sure what you intend with "tags" in the above sentence. Git tags ?
Not sure we need to carry on using old tool chains if we decide to
bump the minimal versions.

Frediano

