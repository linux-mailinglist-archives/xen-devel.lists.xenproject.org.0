Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84653956D54
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 16:31:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779786.1189476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg3Pb-0007Un-FO; Mon, 19 Aug 2024 14:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779786.1189476; Mon, 19 Aug 2024 14:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg3Pb-0007Sn-Cj; Mon, 19 Aug 2024 14:31:11 +0000
Received: by outflank-mailman (input) for mailman id 779786;
 Mon, 19 Aug 2024 14:31:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lvcB=PS=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sg3Pa-0006ns-Lh
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 14:31:10 +0000
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [2607:f8b0:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab1097ba-5e37-11ef-a506-bb4a2ccca743;
 Mon, 19 Aug 2024 16:31:06 +0200 (CEST)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3db1d4dab7fso2346744b6e.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 07:31:06 -0700 (PDT)
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
X-Inumbo-ID: ab1097ba-5e37-11ef-a506-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724077865; x=1724682665; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8ACXTgx7pjAI9HoG5EjJ+PgOQp4yhJ5AQsnfGaII3E=;
        b=DoftXNdjjZdKQoh2htymTH8zokQodKvVzlYKPneuRZHIxd+mv2sw56mG8QHlW/YKez
         Hmnlz03qamDp9YB5NYDHT8a92ilvxPYDedXA5lLdRtXpVBRPl+6tSN25G1C/Vq9G35a9
         1BLJGDVK4XpaIsWI/e+3Tz4wsmbl7CCVIs6wA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724077865; x=1724682665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m8ACXTgx7pjAI9HoG5EjJ+PgOQp4yhJ5AQsnfGaII3E=;
        b=Ee2ZxLP3ATPGsoRZKwSBWkyD5q/BsoVGST5QtEbkROHCBc1et9rf4SiqtzNtKqmWpp
         QDL5KJZVdohO5pE18vt+K0HnW1J4ziQk6LnkbzoR4wMvhPVbub8+Igf4IedvE/BXFGrv
         3XYx0Oi4lqtPaVeztiBD5saYtPRuEm6mo8/raXnZqCyn8GO/yWfECRBVAgqCxEuGTRaR
         mQv0WDN7Y6Xb8w6vwxCPe2tnr2k2xykD27c5HcggsHL62Eohr+QRKPwfX/HPaWvmmVOA
         vAHfuzbgoWmL2JPQw71CBGLx+cGg8d9FeQJiEM00RAj/Ps6iyrnG4Ibb99zprHCtlI0f
         mxSw==
X-Forwarded-Encrypted: i=1; AJvYcCUDuGqTTUtGl287rcGT3fTDd+fAL1GIVonoqmkISMMekmrd5Z9BE7rJYPWsv2t7skOpkgh+hJudFfDcMXjEs68dAT/ZkwFGTHpThckEhW4=
X-Gm-Message-State: AOJu0Yz2AEQk4BHT2u6MxCTKf0qizl3jriWWVM9vJuXhRyrJofSpWZ1p
	QRfgkOKik2lbIhBHHW+FShgHrf/PFDNVEJunluhNZfHNmWPcO9h3bV+0ZGp+utzi+w0t4njIGgu
	9zg/gNmwlDXDzqEzmAHL8ooRx3UFq5l4Q8SLi3Q==
X-Google-Smtp-Source: AGHT+IH3GG90n/r67aZuDu1/4yaBiTHCxxC+RFYhir//ShzTTJBnlLIPACiXHbzEbbPRWQTSrczNgtt68fADVG9vUGA=
X-Received: by 2002:a05:6808:3a15:b0:3da:dffb:d22b with SMTP id
 5614622812f47-3dd42eadedbmr9104287b6e.29.1724077865317; Mon, 19 Aug 2024
 07:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240819125401.218931-1-frediano.ziglio@cloud.com>
 <edbf5a9d-2a13-4755-80f4-5bab93cb8053@suse.com> <CACHz=ZgW4WZkEV6R+2YJbRN8yBNq3rMGgsvHDtaDm4w47=Cwrg@mail.gmail.com>
 <e2e609a8-b27c-4f6d-a7b4-f9d74b69befd@suse.com>
In-Reply-To: <e2e609a8-b27c-4f6d-a7b4-f9d74b69befd@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 19 Aug 2024 15:30:54 +0100
Message-ID: <CACHz=Zh43cRULZB21sP8S+tF9cXzYroKwjjdhBxU4iyZyqy_Gw@mail.gmail.com>
Subject: Re: [PATCH v3] Avoid crash calling PrintErrMesg from efi_multiboot2
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 3:14=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 19.08.2024 16:02, Frediano Ziglio wrote:
> > On Mon, Aug 19, 2024 at 2:19=E2=80=AFPM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 19.08.2024 14:54, Frediano Ziglio wrote:
> >>> Although code is compiled with -fpic option data is not position
> >>> independent. This causes data pointer to become invalid if
> >>> code is not relocated properly which is what happens for
> >>> efi_multiboot2 which is called by multiboot entry code.
> >>>
> >>> Code tested adding
> >>>    PrintErrMesg(L"Test message", EFI_BUFFER_TOO_SMALL);
> >>> in efi_multiboot2 before calling efi_arch_edd (this function
> >>> can potentially call PrintErrMesg).
> >>>
> >>> Before the patch (XenServer installation on Qemu, xen replaced
> >>> with vanilla xen.gz):
> >>>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
> >>>   Test message: !!!! X64 Exception Type - 0E(#PF - Page-Fault)  CPU A=
pic ID - 00000000 !!!!
> >>>   ExceptionData - 0000000000000000  I:0 R:0 U:0 W:0 P:0 PK:0 SS:0 SGX=
:0
> >>>   RIP  - 000000007DC29E46, CS  - 0000000000000038, RFLAGS - 000000000=
0210246
> >>>   RAX  - 0000000000000000, RCX - 0000000000000050, RDX - 000000000000=
0000
> >>>   RBX  - 000000007DAB4558, RSP - 000000007EFA1200, RBP - 000000000000=
0000
> >>>   RSI  - FFFF82D040467A88, RDI - 0000000000000000
> >>>   R8   - 000000007EFA1238, R9  - 000000007EFA1230, R10 - 000000000000=
0000
> >>>   R11  - 000000007CF42665, R12 - FFFF82D040467A88, R13 - 000000007EFA=
1228
> >>>   R14  - 000000007EFA1225, R15 - 000000007DAB45A8
> >>>   DS   - 0000000000000030, ES  - 0000000000000030, FS  - 000000000000=
0030
> >>>   GS   - 0000000000000030, SS  - 0000000000000030
> >>>   CR0  - 0000000080010033, CR2 - FFFF82D040467A88, CR3 - 000000007EC0=
1000
> >>>   CR4  - 0000000000000668, CR8 - 0000000000000000
> >>>   DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 000000000000=
0000
> >>>   DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 000000000000=
0400
> >>>   GDTR - 000000007E9E2000 0000000000000047, LDTR - 0000000000000000
> >>>   IDTR - 000000007E4E5018 0000000000000FFF,   TR - 0000000000000000
> >>>   FXSAVE_STATE - 000000007EFA0E60
> >>>   !!!! Find image based on IP(0x7DC29E46) (No PDB)  (ImageBase=3D0000=
00007DC28000, EntryPoint=3D000000007DC2B917) !!!!
> >>>
> >>> After the patch:
> >>>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
> >>>   Test message: Buffer too small
> >>>   BdsDxe: loading Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3E=
E4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
> >>>   BdsDxe: starting Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3=
EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
> >>>
> >>> Fixes: 00d5d5ce23e6 ("work around Clang generating .data.rel.ro secti=
on for init-only files")
> >
> > ^^^^ here ??
>
> Did you not see ...
>
> >>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> >>> ---
> >>>  xen/common/efi/boot.c | 46 ++++++++++++++++++++++++++++++-----------=
--
> >>>  1 file changed, 32 insertions(+), 14 deletions(-)
> >>> ---
> >>> Changes since v1:
> >>> - added "Fixes:" tag;
> >>> - fixed cast style change.
> >>>
> >>> Changes since v2:
> >>> - wrap long line.
> >>
> >> And what about the Fixes: tag?
>
> ... my respective v2 comment then? There I said:
>
> "I don't think this is right. While this is where the array was introduce=
d,
>  it was correct at that time afaict. It went wrong when MB2 support was a=
dded
>  about a year later. 9180f5365524 ("x86: add multiboot2 protocol support =
for
>  EFI platforms") may be reasonable to blame, albeit I'm not sure that was=
 the
>  final one, after which MB2 support was considered complete."
>
> Jan

Yes, missed, updated

Frediano

