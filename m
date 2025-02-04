Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2CAA27AE8
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 20:11:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881787.1291953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfOJ8-0002Vn-UB; Tue, 04 Feb 2025 19:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881787.1291953; Tue, 04 Feb 2025 19:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfOJ8-0002RF-Qg; Tue, 04 Feb 2025 19:10:02 +0000
Received: by outflank-mailman (input) for mailman id 881787;
 Tue, 04 Feb 2025 19:10:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2JxC=U3=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tfOJ6-0002AY-Hu
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 19:10:00 +0000
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [2001:4860:4864:20::2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a002059e-e32b-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 20:09:58 +0100 (CET)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-29ff039dab2so2941227fac.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 11:09:58 -0800 (PST)
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
X-Inumbo-ID: a002059e-e32b-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1738696197; x=1739300997; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A1BL98YhVzjZUOJcDyNnz80lzI0LA2MZ6DAr5fCSDj0=;
        b=jFqLaBUIanLOGbJlkXgpse7S7jvHoG9pTNwAfdmp+cbILt8icCuBFE3ndP536H9BlX
         5zvgXqkz353pyLAFahopYBPK9MSPrc8n6fDQOGnVwiOioH/K45za7wY8P096MEMTl36w
         yv/cF4YRpJT9uexzkPQH5+gqPwNF9JeryyIK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738696197; x=1739300997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A1BL98YhVzjZUOJcDyNnz80lzI0LA2MZ6DAr5fCSDj0=;
        b=e+w8qXkrhxVZDUkGzZx85YOr55K51UzMrsm6G7Pxf8iLZi8c+82qKM4lNbDtY2PvzT
         hYtosLRtgv8Gf5OCq0K3QolgCjytigqIWaF5tym41PXGv+X4abdsHtYaiahkAW70/qa9
         20Aqn7dCZL4JGHQJGs5OGokylRjj5O8Jx08XlB6bwUzJDIuURur5XfjMXTrv2lPZ33cL
         RVP4fnbJTprklZRgZvOuhX5U+rqkDdL22gMLbZZbIMTLcbxHMK35XPXKvdGJPvLmN8Ud
         zVMpq0ilsp9SyKcVlDIbNenOYhhVRh9WUwVAjxZ1N3cQNYARoqeseQUM2UiMUScGv5kf
         ra8g==
X-Gm-Message-State: AOJu0YybzA/YYkNGum9iF+v/gjbFwtIzwxtCt23/EIJOuwmzac2ZiSCD
	3K+L5gVCqM6Q9HwqGwRiFw9iCa3uNATWEUqZ1AyB5nqeFGQaCs60m9z9yvewxf0QhtHPKDtXl2j
	j6lwBLR7QI23zBefpKk39EEqKKkA2d/HHhClI5g==
X-Gm-Gg: ASbGncsahkwmzM2ZRRXaEwAUMp7ti0xBOHvnntn+Kvr8W9eBVI2vz+Ey2LdR+7PVEAy
	inAUI1ZvEPMixGpU5nVqqIvLi2D06iPdS8OP+55TviynZos8FFFwqex6RRqTrdkVZAQ61Uw==
X-Google-Smtp-Source: AGHT+IEZYI4ywHhEUqhyvFmnPRCrlsdWHRaSfUKMs93TMQbRqEIz/4TYO9UNa1kqrBzeH1OvkHaHUP6DcmXjB9vVaiU=
X-Received: by 2002:a05:6870:d10c:b0:297:285e:f9f4 with SMTP id
 586e51a60fabf-2b32f2fb7bamr17723991fac.34.1738696197370; Tue, 04 Feb 2025
 11:09:57 -0800 (PST)
MIME-Version: 1.0
References: <20250122101407.52282-1-frediano.ziglio@cloud.com> <e78b9755-76f6-4189-a000-7a7e3588cae9@citrix.com>
In-Reply-To: <e78b9755-76f6-4189-a000-7a7e3588cae9@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 4 Feb 2025 19:09:46 +0000
X-Gm-Features: AWEUYZmuA8Z4n2bEGXJO-Cg89GupLkmvkW-ldLYkQ3rI7Q-Twr2XOn7CTAVpbV8
Message-ID: <CACHz=Zga8KdK=im8xH1R4Ft9n8vw6wdOLgS+GPtY+OmafbS2Nw@mail.gmail.com>
Subject: Re: [PATCH v5] Avoid crash calling PrintErrMesg from efi_multiboot2
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 4:20=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> On 22/01/2025 10:14 am, Frediano Ziglio wrote:
> > Although code is compiled with -fpic option data is not position
> > independent.
>
> This doesn't parse.  ITYM "Although the code is compiled with -fpic,
> pointers in data are not position independent."
>
> >  This causes data pointer to become invalid if
> > code is not relocated properly which is what happens for
> > efi_multiboot2 which is called by multiboot entry code.
>
> "efi_multiboot2()" to highlight that you're naming a function.
>

Should I post a new version or are you fixing the grammar on commit ?

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
>
> 00d5d5ce23e6 needs to be a second fixes tag then too.
>
> In hindsight, it was a naive fix.  But, by reverting this part of it,
> you're reintroducing a build breakage on Clang.
>
> I wrote that construct because it is what Clang-3.8 generated, albeit
> with the proper __initconstrel attribute to make the
> SPEICAL_DATA_SECTIONS check be happy.
>
> Anyway, see:
> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=3Dx=
86/urgent&id=3D1105ab42a84bc11c62597005f78ccad2434fbd66
>
> This needs to be paired with an unconditional -fno-jump-tables covering
> any TU which the MB2+EFI path executes at the wrong address.
>

Newer compiler versions seem to generate position independent jump
tables, but it's not guaranteed. So, yes, it would be better to add
that option.

> ~Andrew

Frediano

