Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9128A6A89D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 15:33:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922234.1326134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvGxm-0004ZM-2k; Thu, 20 Mar 2025 14:33:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922234.1326134; Thu, 20 Mar 2025 14:33:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvGxl-0004X4-Vi; Thu, 20 Mar 2025 14:33:37 +0000
Received: by outflank-mailman (input) for mailman id 922234;
 Thu, 20 Mar 2025 14:33:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nziT=WH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tvGxk-0004Wu-UO
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 14:33:37 +0000
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [2607:f8b0:4864:20::c2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e03dd82-0598-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 15:33:35 +0100 (CET)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-5f89aa7a101so384405eaf.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 07:33:35 -0700 (PDT)
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
X-Inumbo-ID: 4e03dd82-0598-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1742481214; x=1743086014; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6rTRdyFjGndtKneW/jhqg7ELR/v6zFkQDG6ph5VDo4=;
        b=Go6ilj0XJbFAJW3nUt6E1fLgl1nawNv30C3ybZ+kMLdVWUF9+0W1YwlKBMQXL+q6/U
         aWot5QvWwEaYRfsA957/+pA5i0XPyii+FEXeMBixdjbgWLRqys8Xkox3gx4309SwNOvz
         Re9j2NOeKG3GoOy0C55c48uHwHi3KfFP6m1NA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742481214; x=1743086014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6rTRdyFjGndtKneW/jhqg7ELR/v6zFkQDG6ph5VDo4=;
        b=b57wLCLfnWJ8uVHwN8bzj00WkbBk9aCwOYOqeEczkFM7Yehl4WOnBkkYL38EQd4zaA
         3P4pLnxcFgDkqCmfE4LyifrM7LYNZzbKtCf8u5EhicuDq63SEDakHkmCqJfbJZtXVU5S
         yxAJV0Z+vWuMc8cEiqnn7KseLSvfkNZ3ZlZAmw01LlPyWGOoaH4X+iJLgB0QqhaDxw/k
         xlIUvYEMtaetPunr3p3nfALklt0jvQ2Im3D21Os9vwfiiU9Xa2Gi5lftV2/lEY1b/oRz
         zRo2eXa5i9f5b0GxO8VUX3M0y8ie+ZdNzLYwVBXKf3us6s3EyidS/3N2ocKNJqNC7/JJ
         aNAg==
X-Forwarded-Encrypted: i=1; AJvYcCX5SgPFdsSb655Kqd1shDOhaFsGycAZSKwNbRqQwlmbV1kACfCpM9SAGrbCso1lLbihKepKwWeCQOE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmeZkFzSunqTPMVgJA3kIUfusrmBvaqZZ6Mr57uYeU21Zbps+5
	rU9Q8Dt2gZLApYq+sVR7jmEiIYx3vzbLp2VZE9w6WLOpMAUz2FPrfHHykG8i9smDO9pskvZUlM7
	W/LuVjrBQfuYONWYwv06KYc5KB5JHB5ZUBRdjVw==
X-Gm-Gg: ASbGncvRAJTnn5CoRo4r1rbBXzSpDZzCH7xZRGM40UlTQf1ltrmXOdRHIQrZYVDbPJc
	KR4MPWmrT1B0k2d27gl77mRrRW2p/y8ZlZop55tmn4rw6+wAhDhJukckuA1qmJ3e7Pn95EUhlFw
	3F+jsbjQ/C8rKVCmZMAi3MVnFp5w==
X-Google-Smtp-Source: AGHT+IHeU3WBCyUTgIBXPPZIVCEBPlc83/bN/qbFujRhQ72vwAeokSw4Wo6HG7SNaHZQMty5oqEz87l1zVJcuHHNPx0=
X-Received: by 2002:a05:6820:22a7:b0:601:a677:d121 with SMTP id
 006d021491bc7-6021e351212mr3766127eaf.2.1742481214267; Thu, 20 Mar 2025
 07:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250217162659.151232-1-frediano.ziglio@cloud.com>
 <Z7jf_YojU9tQ1Or7@mail-itl> <CACHz=Zierjby+_Q93dFeO5mjMG1aiSpyHvDshRK6=ZHY5bH-6A@mail.gmail.com>
 <Z7xxQHVdSGwig4hb@mail-itl> <CACHz=ZgHxvCJQyJe_NJFh3YYcuW0sey+qcOEv0O-XxC8daTo+A@mail.gmail.com>
 <Z79jhZ_BGEC6DYl4@mail-itl> <086f7e05-2cab-4a53-8ecb-dff7421e38bc@suse.com> <CACHz=ZjtjMyv5OmUT8dNHAzqrw5c7ij58quo1SuDc2ZBSjQRmw@mail.gmail.com>
In-Reply-To: <CACHz=ZjtjMyv5OmUT8dNHAzqrw5c7ij58quo1SuDc2ZBSjQRmw@mail.gmail.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 20 Mar 2025 14:33:23 +0000
X-Gm-Features: AQ5f1JpNY1Yald9Gt377hfv9WFdb2vOj-5ToZB7GgvuDItt6ICfKMv5xO7eG_jo
Message-ID: <CACHz=ZjLq8vVLtLL40DjcLV5wwxyatLdy4g3rq1ifSVcnATr8g@mail.gmail.com>
Subject: Re: [PATCH v6] Avoid crash calling PrintErrMesg from efi_multiboot2
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 3:02=E2=80=AFPM Frediano Ziglio
<frediano.ziglio@cloud.com> wrote:
>
> On Thu, Mar 6, 2025 at 2:26=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
> >
> > On 26.02.2025 19:54, Marek Marczykowski-G=C3=B3recki wrote:
> > > On Mon, Feb 24, 2025 at 02:31:00PM +0000, Frediano Ziglio wrote:
> > >> On Mon, Feb 24, 2025 at 1:16=E2=80=AFPM Marek Marczykowski-G=C3=B3re=
cki
> > >> <marmarek@invisiblethingslab.com> wrote:
> > >>>
> > >>> On Mon, Feb 24, 2025 at 12:57:13PM +0000, Frediano Ziglio wrote:
> > >>>> On Fri, Feb 21, 2025 at 8:20=E2=80=AFPM Marek Marczykowski-G=C3=B3=
recki
> > >>>> <marmarek@invisiblethingslab.com> wrote:
> > >>>>>
> > >>>>> On Mon, Feb 17, 2025 at 04:26:59PM +0000, Frediano Ziglio wrote:
> > >>>>>> Although code is compiled with -fpic option data is not position
> > >>>>>> independent. This causes data pointer to become invalid if
> > >>>>>> code is not relocated properly which is what happens for
> > >>>>>> efi_multiboot2 which is called by multiboot entry code.
> > >>>>>>
> > >>>>>> Code tested adding
> > >>>>>>    PrintErrMesg(L"Test message", EFI_BUFFER_TOO_SMALL);
> > >>>>>> in efi_multiboot2 before calling efi_arch_edd (this function
> > >>>>>> can potentially call PrintErrMesg).
> > >>>>>>
> > >>>>>> Before the patch (XenServer installation on Qemu, xen replaced
> > >>>>>> with vanilla xen.gz):
> > >>>>>>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
> > >>>>>>   Test message: !!!! X64 Exception Type - 0E(#PF - Page-Fault)  =
CPU Apic ID - 00000000 !!!!
> > >>>>>>   ExceptionData - 0000000000000000  I:0 R:0 U:0 W:0 P:0 PK:0 SS:=
0 SGX:0
> > >>>>>>   RIP  - 000000007EE21E9A, CS  - 0000000000000038, RFLAGS - 0000=
000000210246
> > >>>>>>   RAX  - 000000007FF0C1B5, RCX - 0000000000000050, RDX - 0000000=
000000010
> > >>>>>>   RBX  - 0000000000000000, RSP - 000000007FF0C180, RBP - 0000000=
07FF0C210
> > >>>>>>   RSI  - FFFF82D040467CE8, RDI - 0000000000000000
> > >>>>>>   R8   - 000000007FF0C1C8, R9  - 000000007FF0C1C0, R10 - 0000000=
000000000
> > >>>>>>   R11  - 0000000000001020, R12 - FFFF82D040467CE8, R13 - 0000000=
07FF0C1B8
> > >>>>>>   R14  - 000000007EA33328, R15 - 000000007EA332D8
> > >>>>>>   DS   - 0000000000000030, ES  - 0000000000000030, FS  - 0000000=
000000030
> > >>>>>>   GS   - 0000000000000030, SS  - 0000000000000030
> > >>>>>>   CR0  - 0000000080010033, CR2 - FFFF82D040467CE8, CR3 - 0000000=
07FC01000
> > >>>>>>   CR4  - 0000000000000668, CR8 - 0000000000000000
> > >>>>>>   DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 0000000=
000000000
> > >>>>>>   DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 0000000=
000000400
> > >>>>>>   GDTR - 000000007F9DB000 0000000000000047, LDTR - 0000000000000=
000
> > >>>>>>   IDTR - 000000007F48E018 0000000000000FFF,   TR - 0000000000000=
000
> > >>>>>>   FXSAVE_STATE - 000000007FF0BDE0
> > >>>>>>   !!!! Find image based on IP(0x7EE21E9A) (No PDB)  (ImageBase=
=3D000000007EE20000, EntryPoint=3D000000007EE23935) !!!!
> > >>>>>>
> > >>>>>> After the patch:
> > >>>>>>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
> > >>>>>>   Test message: Buffer too small
> > >>>>>>   BdsDxe: loading Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AA=
EA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
> > >>>>>>   BdsDxe: starting Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-A=
AEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
> > >>>>>>
> > >>>>>> This partially rollback commit 00d5d5ce23e6.
> > >>>>>>
> > >>>>>> Fixes: 9180f5365524 ("x86: add multiboot2 protocol support for E=
FI platforms")
> > >>>>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > >>>>>
> > >>>>> I tried testing this patch, but it seems I cannot reproduce the o=
riginal
> > >>>>> failure...
> > >>>>>
> > >>>>> I did as the commit message suggests here:
> > >>>>> https://gitlab.com/xen-project/people/marmarek/xen/-/commit/ca3d6=
911c448eb886990f33d4380b5646617a982
> > >>>>>
> > >>>>> With blexit() in PrintErrMesg(), it went back to the bootloader, =
so I'm
> > >>>>> sure this code path was reached. But with blexit() commented out,=
 Xen
> > >>>>> started correctly both with and without this patch... The branch =
I used
> > >>>>> is here:
> > >>>>> https://gitlab.com/xen-project/people/marmarek/xen/-/commits/auto=
mation-tests?ref_type=3Dheads
> > >>>>>
> > >>>>> Are there some extra condition to reproduce the issue? Maybe it d=
epends
> > >>>>> on the compiler version? I guess I can try also on QEMU, but base=
d on
> > >>>>> the description, I would expect it to crash in any case.
> > >>>>>
> > >>>>
> > >>>> Did you see the correct message in both cases?
> > >>>> Did you use Grub or direct EFI?
> > >>>>
> > >>>> With Grub and without this patch you won't see the message, with g=
rub
> > >>>> with the patch you see the correct message.
> > >>>
> > >>> I did use grub, and I didn't see the message indeed.
> > >>> But in the case it was supposed to crash (with added PrintErrMesg()=
,
> > >>> commented out blexit and without your patch) it did _not_ crashed a=
nd
> > >>> continued to normal boot. Is that #PF non-fatal here?
> > >>>
> > >>
> > >> Hi,
> > >>    I tried again with my test environment.
> > >> Added the PrintErrMesg line before efi_arch_edd call, I got a #PF, i=
n
> > >> my case the system hangs. With the fix patch machine is rebooting an=
d
> > >> I can see the message in the logs.
> > >> I'm trying with Xen starting inside Qemu, EFI firmware, xen.gz
> > >> compiled as ELF file. Host system is an Ubuntu 22.04.5 LTS. Gcc is
> > >> version 11.4.
> > >
> > > My test was wrong, commenting out blexit made "mesg" variable unused.
> > > After fixing that, I can reproduce it on both QEMU and real hardware:
> > > without your patch it crashes and with your patch it works just fine.
> > > While there may be more places with similar issue, this patch clearly
> > > improves the situation, so:
> > >
> > > Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsla=
b.com>
> >
> > This had to be reverted, for breaking the build with old Clang. See the
> > respective Matrix conversation.
> >
> > Jan
> >
>
> To sum up the failure is:
>
>     clang: error: unknown argument: '-fno-jump-tables'
>

Now that the minimum clang version supports this option, can this
change be applied?

Frediano

