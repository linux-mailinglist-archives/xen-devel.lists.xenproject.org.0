Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F43A54E7D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 16:02:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903707.1311683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqCkH-0006wG-6g; Thu, 06 Mar 2025 15:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903707.1311683; Thu, 06 Mar 2025 15:02:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqCkH-0006uM-44; Thu, 06 Mar 2025 15:02:45 +0000
Received: by outflank-mailman (input) for mailman id 903707;
 Thu, 06 Mar 2025 15:02:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e45K=VZ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tqCkF-0006pO-Sx
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 15:02:43 +0000
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [2001:4860:4864:20::31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d21cb2a-fa9c-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 16:02:42 +0100 (CET)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-2b38896c534so359387fac.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 07:02:42 -0800 (PST)
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
X-Inumbo-ID: 0d21cb2a-fa9c-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741273361; x=1741878161; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAgqhpyvO8liwlGn5res9GBryBANZw5l5xsrBg96Y3M=;
        b=LF9UpZduUIDiYHD3p8zG7DHdPrAzFk7BVhPvT3BbdSjWi1mSXst5J3/jPg/GEYdyLn
         K1q4+wl2YhZZygJSQVZxClK/yi65NaelmoDa5VYeDQA6MUdCVos++iSV/FNr/1yDY6Dn
         ip4mQB/0gphUZqcpbNfnwj+98BT8q6R2vpQt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741273361; x=1741878161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vAgqhpyvO8liwlGn5res9GBryBANZw5l5xsrBg96Y3M=;
        b=lDNFj67wma//nDicmuAA4loaPLQU/8PzVem/fLrePoiZx73dBBBdTQxA4UWZEU8hRX
         YQafJTdGwKmUHML8kYKZ9ILhZDOdRY/7CnwrRf2C6T4TpDJ3YWM/KDguPsH9RLj5YP8+
         tgmBf2o7gHAEQ4AjBKLsZAaBBZEn/JK3iIIIzI+Zy41x3h6LHQ/+qNWmhdTkUsE9Lqs2
         IG8smpy04tE9bevghLvmfrPEquRvUj3X/ZQO7mZ1n1NAstvM1v0MHcl4qcnXg51/sY7r
         kQ39P21s6YR+jfns3BY+KhXYDermwOOWhaTrbgygJWBnt1zeZsBImPbaUEh7OzV0+Ae2
         EpxA==
X-Forwarded-Encrypted: i=1; AJvYcCUtH11LEuHDp/eoQ+Xvv+EkdGemZkM0RCaFAio3grfsomtP4uBobfqxZyM3p40QeieT0G8MKvCNyFg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKrEmGEKeK0690jKcRiZS9Y6yK6TaSjmUd7w3D0YABdLR4qh5a
	PTqOjAgx50HkOz+6IlToMAKIH0+SfSRKooMdUz64s6UNggXFCHgCCAnzXmy7bD2KunoqQmnQFSO
	sAmDFuYYw9bqy6i5GpeHYIqBc+JFtILKmthlguXtdWEDfOlQd9slR5Q==
X-Gm-Gg: ASbGncvD7Rn/K04aUuZS/21akYvOyCP5YEjLczE+hpRzE6HPlWdkCQDKlUvUGr9sqXF
	0Wmw6zJjGfo4/3EAOAtm1QwuOi83fsTvyxSL6KYU6f1CI8+7wdyUpoSAj/kqnmuUhpihjm7HWDH
	HiuvpbJ+ayO7q8eICxekEm0ebEqg==
X-Google-Smtp-Source: AGHT+IF/Dl5p62ywElAFDKz4LBKlSh/Mr2kUpUKRnS4th2v8dPMTqDXOFDEV9aLHAPV3oF6YogCppyYLEQBNfxvhKy4=
X-Received: by 2002:a05:6870:d1c4:b0:29d:c764:f873 with SMTP id
 586e51a60fabf-2c21cdb8e00mr4250438fac.31.1741273360359; Thu, 06 Mar 2025
 07:02:40 -0800 (PST)
MIME-Version: 1.0
References: <20250217162659.151232-1-frediano.ziglio@cloud.com>
 <Z7jf_YojU9tQ1Or7@mail-itl> <CACHz=Zierjby+_Q93dFeO5mjMG1aiSpyHvDshRK6=ZHY5bH-6A@mail.gmail.com>
 <Z7xxQHVdSGwig4hb@mail-itl> <CACHz=ZgHxvCJQyJe_NJFh3YYcuW0sey+qcOEv0O-XxC8daTo+A@mail.gmail.com>
 <Z79jhZ_BGEC6DYl4@mail-itl> <086f7e05-2cab-4a53-8ecb-dff7421e38bc@suse.com>
In-Reply-To: <086f7e05-2cab-4a53-8ecb-dff7421e38bc@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 6 Mar 2025 15:02:28 +0000
X-Gm-Features: AQ5f1JqnXqzHSHQaEKHGKXG145n3i3LPJZzApOnQIagFDn96sf2URMgtlyI5MRM
Message-ID: <CACHz=ZjtjMyv5OmUT8dNHAzqrw5c7ij58quo1SuDc2ZBSjQRmw@mail.gmail.com>
Subject: Re: [PATCH v6] Avoid crash calling PrintErrMesg from efi_multiboot2
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 2:26=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 26.02.2025 19:54, Marek Marczykowski-G=C3=B3recki wrote:
> > On Mon, Feb 24, 2025 at 02:31:00PM +0000, Frediano Ziglio wrote:
> >> On Mon, Feb 24, 2025 at 1:16=E2=80=AFPM Marek Marczykowski-G=C3=B3reck=
i
> >> <marmarek@invisiblethingslab.com> wrote:
> >>>
> >>> On Mon, Feb 24, 2025 at 12:57:13PM +0000, Frediano Ziglio wrote:
> >>>> On Fri, Feb 21, 2025 at 8:20=E2=80=AFPM Marek Marczykowski-G=C3=B3re=
cki
> >>>> <marmarek@invisiblethingslab.com> wrote:
> >>>>>
> >>>>> On Mon, Feb 17, 2025 at 04:26:59PM +0000, Frediano Ziglio wrote:
> >>>>>> Although code is compiled with -fpic option data is not position
> >>>>>> independent. This causes data pointer to become invalid if
> >>>>>> code is not relocated properly which is what happens for
> >>>>>> efi_multiboot2 which is called by multiboot entry code.
> >>>>>>
> >>>>>> Code tested adding
> >>>>>>    PrintErrMesg(L"Test message", EFI_BUFFER_TOO_SMALL);
> >>>>>> in efi_multiboot2 before calling efi_arch_edd (this function
> >>>>>> can potentially call PrintErrMesg).
> >>>>>>
> >>>>>> Before the patch (XenServer installation on Qemu, xen replaced
> >>>>>> with vanilla xen.gz):
> >>>>>>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
> >>>>>>   Test message: !!!! X64 Exception Type - 0E(#PF - Page-Fault)  CP=
U Apic ID - 00000000 !!!!
> >>>>>>   ExceptionData - 0000000000000000  I:0 R:0 U:0 W:0 P:0 PK:0 SS:0 =
SGX:0
> >>>>>>   RIP  - 000000007EE21E9A, CS  - 0000000000000038, RFLAGS - 000000=
0000210246
> >>>>>>   RAX  - 000000007FF0C1B5, RCX - 0000000000000050, RDX - 000000000=
0000010
> >>>>>>   RBX  - 0000000000000000, RSP - 000000007FF0C180, RBP - 000000007=
FF0C210
> >>>>>>   RSI  - FFFF82D040467CE8, RDI - 0000000000000000
> >>>>>>   R8   - 000000007FF0C1C8, R9  - 000000007FF0C1C0, R10 - 000000000=
0000000
> >>>>>>   R11  - 0000000000001020, R12 - FFFF82D040467CE8, R13 - 000000007=
FF0C1B8
> >>>>>>   R14  - 000000007EA33328, R15 - 000000007EA332D8
> >>>>>>   DS   - 0000000000000030, ES  - 0000000000000030, FS  - 000000000=
0000030
> >>>>>>   GS   - 0000000000000030, SS  - 0000000000000030
> >>>>>>   CR0  - 0000000080010033, CR2 - FFFF82D040467CE8, CR3 - 000000007=
FC01000
> >>>>>>   CR4  - 0000000000000668, CR8 - 0000000000000000
> >>>>>>   DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 000000000=
0000000
> >>>>>>   DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 000000000=
0000400
> >>>>>>   GDTR - 000000007F9DB000 0000000000000047, LDTR - 000000000000000=
0
> >>>>>>   IDTR - 000000007F48E018 0000000000000FFF,   TR - 000000000000000=
0
> >>>>>>   FXSAVE_STATE - 000000007FF0BDE0
> >>>>>>   !!!! Find image based on IP(0x7EE21E9A) (No PDB)  (ImageBase=3D0=
00000007EE20000, EntryPoint=3D000000007EE23935) !!!!
> >>>>>>
> >>>>>> After the patch:
> >>>>>>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
> >>>>>>   Test message: Buffer too small
> >>>>>>   BdsDxe: loading Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA=
-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
> >>>>>>   BdsDxe: starting Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAE=
A-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
> >>>>>>
> >>>>>> This partially rollback commit 00d5d5ce23e6.
> >>>>>>
> >>>>>> Fixes: 9180f5365524 ("x86: add multiboot2 protocol support for EFI=
 platforms")
> >>>>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> >>>>>
> >>>>> I tried testing this patch, but it seems I cannot reproduce the ori=
ginal
> >>>>> failure...
> >>>>>
> >>>>> I did as the commit message suggests here:
> >>>>> https://gitlab.com/xen-project/people/marmarek/xen/-/commit/ca3d691=
1c448eb886990f33d4380b5646617a982
> >>>>>
> >>>>> With blexit() in PrintErrMesg(), it went back to the bootloader, so=
 I'm
> >>>>> sure this code path was reached. But with blexit() commented out, X=
en
> >>>>> started correctly both with and without this patch... The branch I =
used
> >>>>> is here:
> >>>>> https://gitlab.com/xen-project/people/marmarek/xen/-/commits/automa=
tion-tests?ref_type=3Dheads
> >>>>>
> >>>>> Are there some extra condition to reproduce the issue? Maybe it dep=
ends
> >>>>> on the compiler version? I guess I can try also on QEMU, but based =
on
> >>>>> the description, I would expect it to crash in any case.
> >>>>>
> >>>>
> >>>> Did you see the correct message in both cases?
> >>>> Did you use Grub or direct EFI?
> >>>>
> >>>> With Grub and without this patch you won't see the message, with gru=
b
> >>>> with the patch you see the correct message.
> >>>
> >>> I did use grub, and I didn't see the message indeed.
> >>> But in the case it was supposed to crash (with added PrintErrMesg(),
> >>> commented out blexit and without your patch) it did _not_ crashed and
> >>> continued to normal boot. Is that #PF non-fatal here?
> >>>
> >>
> >> Hi,
> >>    I tried again with my test environment.
> >> Added the PrintErrMesg line before efi_arch_edd call, I got a #PF, in
> >> my case the system hangs. With the fix patch machine is rebooting and
> >> I can see the message in the logs.
> >> I'm trying with Xen starting inside Qemu, EFI firmware, xen.gz
> >> compiled as ELF file. Host system is an Ubuntu 22.04.5 LTS. Gcc is
> >> version 11.4.
> >
> > My test was wrong, commenting out blexit made "mesg" variable unused.
> > After fixing that, I can reproduce it on both QEMU and real hardware:
> > without your patch it crashes and with your patch it works just fine.
> > While there may be more places with similar issue, this patch clearly
> > improves the situation, so:
> >
> > Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.=
com>
>
> This had to be reverted, for breaking the build with old Clang. See the
> respective Matrix conversation.
>
> Jan
>

To sum up the failure is:

    clang: error: unknown argument: '-fno-jump-tables'

Frediano

