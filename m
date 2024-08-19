Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 105E4956C9D
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 16:04:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779741.1189427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg2yQ-0008Nr-Jv; Mon, 19 Aug 2024 14:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779741.1189427; Mon, 19 Aug 2024 14:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg2yQ-0008LL-Gq; Mon, 19 Aug 2024 14:03:06 +0000
Received: by outflank-mailman (input) for mailman id 779741;
 Mon, 19 Aug 2024 14:03:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lvcB=PS=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sg2yO-0008LF-QN
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 14:03:04 +0000
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [2607:f8b0:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c00410c4-5e33-11ef-a506-bb4a2ccca743;
 Mon, 19 Aug 2024 16:03:03 +0200 (CEST)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-70936061d0dso2615247a34.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 07:03:03 -0700 (PDT)
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
X-Inumbo-ID: c00410c4-5e33-11ef-a506-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724076182; x=1724680982; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmL9c/tA2yFVZRXgvEnGZGSU39/eiuu8BuU16309P4Q=;
        b=ldkXBzDC1OVyrB51J4l9krnTyueEzUGymS9J1X4FUdn45454QCX38o7T5MhisaZRW1
         rheKtmXbraTJhdMxAS9j1AyfaciXM/BMqVHMcT8nV9idOeKiC+IyniNGgLNCXnSr/Obe
         YrXo54BZTqFDA+LpNn6SKwhHPvNibXUdXa19g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724076182; x=1724680982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xmL9c/tA2yFVZRXgvEnGZGSU39/eiuu8BuU16309P4Q=;
        b=b6XRYrOoYRSJgwHAZgN1sz83aUZ7uyW8gH8ArMgQqCZR2Y6i8J+D7lwiqc9zMtp2E9
         1o+FybVsUMJT3PDSo8IaaMvcalghRhajqVwaJpR971UqZPbV0gtVRPW9u3WXEcTOtjp5
         FvHgClikWR+6bJIp5KU1d7ELzcVNwBW5SAuyrck8FK1N64MUIKTv1YRorFLiJdXwCxES
         isyW0aFdttNHZft4P+7xCje5RXIUo0RCzhvfAnAo88B7wDytUomK4759O0k8Rb1Y971J
         WBiwQrboy5GCWky2gX0SPxiQC0qhvzhaq5zrate681cEdFqXBkuXz1ibzzkXfJfg/CnF
         D2CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmbDmWQf6+Jy3NLTri/9nX0WtxLMXd5CKH+m9TX1IhtRF21YP73gA1d8qCG61tJ9RbzD4GQvfWGWkf3Y/HyTH9yqdWTHZSFaWOgcKVv38=
X-Gm-Message-State: AOJu0YxReHi0BrK9Xz0d5PVnVpPe0x824IXAbs6tIZCDmpk5h4YlccRz
	LBtdhozj5cO9ouazAwNTTyM+J1TNTeSlXcz04OR3dWjwb1KHACp4E1jlg6cpOZJqweuU+gLid0G
	srBzp1V4NYPd3FDMGOLrm59t2E5XEKkKcWBtzsw==
X-Google-Smtp-Source: AGHT+IGajrxX6u4cBtC5EitLWeogD9yGyIl5HZxEDAkLezUgE1NNwCrGzexIkZaKR0ot6+pXtCgzjZQfPteBjlI5dp4=
X-Received: by 2002:a05:6830:3708:b0:703:6341:5171 with SMTP id
 46e09a7af769-70cac8567a2mr12734097a34.15.1724076182474; Mon, 19 Aug 2024
 07:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240819125401.218931-1-frediano.ziglio@cloud.com> <edbf5a9d-2a13-4755-80f4-5bab93cb8053@suse.com>
In-Reply-To: <edbf5a9d-2a13-4755-80f4-5bab93cb8053@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 19 Aug 2024 15:02:51 +0100
Message-ID: <CACHz=ZgW4WZkEV6R+2YJbRN8yBNq3rMGgsvHDtaDm4w47=Cwrg@mail.gmail.com>
Subject: Re: [PATCH v3] Avoid crash calling PrintErrMesg from efi_multiboot2
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 2:19=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 19.08.2024 14:54, Frediano Ziglio wrote:
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
> >   RIP  - 000000007DC29E46, CS  - 0000000000000038, RFLAGS - 00000000002=
10246
> >   RAX  - 0000000000000000, RCX - 0000000000000050, RDX - 00000000000000=
00
> >   RBX  - 000000007DAB4558, RSP - 000000007EFA1200, RBP - 00000000000000=
00
> >   RSI  - FFFF82D040467A88, RDI - 0000000000000000
> >   R8   - 000000007EFA1238, R9  - 000000007EFA1230, R10 - 00000000000000=
00
> >   R11  - 000000007CF42665, R12 - FFFF82D040467A88, R13 - 000000007EFA12=
28
> >   R14  - 000000007EFA1225, R15 - 000000007DAB45A8
> >   DS   - 0000000000000030, ES  - 0000000000000030, FS  - 00000000000000=
30
> >   GS   - 0000000000000030, SS  - 0000000000000030
> >   CR0  - 0000000080010033, CR2 - FFFF82D040467A88, CR3 - 000000007EC010=
00
> >   CR4  - 0000000000000668, CR8 - 0000000000000000
> >   DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 00000000000000=
00
> >   DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 00000000000004=
00
> >   GDTR - 000000007E9E2000 0000000000000047, LDTR - 0000000000000000
> >   IDTR - 000000007E4E5018 0000000000000FFF,   TR - 0000000000000000
> >   FXSAVE_STATE - 000000007EFA0E60
> >   !!!! Find image based on IP(0x7DC29E46) (No PDB)  (ImageBase=3D000000=
007DC28000, EntryPoint=3D000000007DC2B917) !!!!
> >
> > After the patch:
> >   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
> >   Test message: Buffer too small
> >   BdsDxe: loading Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4=
AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
> >   BdsDxe: starting Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE=
4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
> >
> > Fixes: 00d5d5ce23e6 ("work around Clang generating .data.rel.ro section=
 for init-only files")

^^^^ here ??


> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > ---
> >  xen/common/efi/boot.c | 46 ++++++++++++++++++++++++++++++-------------
> >  1 file changed, 32 insertions(+), 14 deletions(-)
> > ---
> > Changes since v1:
> > - added "Fixes:" tag;
> > - fixed cast style change.
> >
> > Changes since v2:
> > - wrap long line.
>
> And what about the Fixes: tag?
>
> Jan

