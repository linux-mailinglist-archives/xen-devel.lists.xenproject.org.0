Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8B698438B
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 12:23:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802560.1212844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st2h7-0006Ik-U0; Tue, 24 Sep 2024 10:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802560.1212844; Tue, 24 Sep 2024 10:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st2h7-0006HC-Qs; Tue, 24 Sep 2024 10:22:57 +0000
Received: by outflank-mailman (input) for mailman id 802560;
 Tue, 24 Sep 2024 10:22:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CoXS=QW=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1st2h6-0006H6-1B
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 10:22:56 +0000
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [2607:f8b0:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f558bca8-7a5e-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 12:22:54 +0200 (CEST)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3e03981dad2so606191b6e.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 03:22:54 -0700 (PDT)
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
X-Inumbo-ID: f558bca8-7a5e-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727173373; x=1727778173; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9AgC2YelAA008BmhUWxmM/kHMzs8pMVY5AVAi0/sxto=;
        b=YjMeHyo/Ofn1I9JZkETBtq9gRNp2vw/z5ZC626i+ur6jJMcMm6bd1ZAXhpXjXWQ8T0
         3aMtCJex1gygV32cUYm26miL2ZMUslAlADp0lO/zq2ndkvUo06XQkvh4VGeA0AYFtSkw
         xRiRzuqdWJBbC/NW+jRgPmp8LixJM8FI/bA/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727173373; x=1727778173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9AgC2YelAA008BmhUWxmM/kHMzs8pMVY5AVAi0/sxto=;
        b=DTIyth5rs55k26pLTEynY41HO6RjA8bP4u9911cra6NQ7dnCf8cgUglf8ZFd2m+fHm
         //AVIZMDlmsEdHTnp0X2m+4VWzv6zDbMJxyNwIES8eyVRCf6Ww0oZdjC0E0QDx/cPOcn
         PHHda1pXl6IsVIIS63Wb5wC3oPkta0e2HSH1iV6U8HicUb8D2AEetD5+K759ih6NY+zj
         HXnmGRNJSFd17Sr1D0bRsj0DH+imJ+CaORQep7R28hWe47X6i+R5O74FodRMQivLDzHL
         DoJ98xvMDvvYeuqO6qaWLGKUCnJpdZq/gSi+swb58PGUnQQa9nNvfOEUFD3QAKYUNrW/
         gtuw==
X-Forwarded-Encrypted: i=1; AJvYcCX4ioEEEGbftqA6337YIzJ5CbxP6X3tlx08LwWqYiSgeRbbw0p2/xXcbIFnumX0FGdvHr3EeyApLA0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/sCKKvu8ormjDoIniVE94JRZHmi4jQKEhQ6dYUgIUoBOI0XXL
	Ck+vURvmmXqJWRueqWctfeIjfCIuyIEXtqJKAxVoNIqFMxc7xxJ2sYBVrrA5f4poHFfJz7unyJX
	eiCp7uQNze7oXStXNkvS0YOstOoUOQoNs/IesCw==
X-Google-Smtp-Source: AGHT+IFaTEZ8usoq/RBOG8LberbgmDHMMwyx8t53WU32Ipjo5NR2WGPNu4BK6J/0o9oGK9vzO9qOBM9mflvdVlhw//o=
X-Received: by 2002:a05:6808:1904:b0:3e0:3b50:6fcd with SMTP id
 5614622812f47-3e29220c23amr1239242b6e.5.1727173372800; Tue, 24 Sep 2024
 03:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240919080021.20155-1-frediano.ziglio@cloud.com>
 <20240919080021.20155-4-frediano.ziglio@cloud.com> <f928cf8a-e047-43f0-bf1d-c864d5d0e317@suse.com>
 <CACHz=ZiFyiSaihgTL_rSqfNNag761+1QyAhytQhn5zM6tOUSsw@mail.gmail.com> <ac8a299d-ec25-431a-aa56-d8a10ca1220a@suse.com>
In-Reply-To: <ac8a299d-ec25-431a-aa56-d8a10ca1220a@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 24 Sep 2024 11:22:41 +0100
Message-ID: <CACHz=Zh_Cr_Qfpz4vntBZfZ-HqYGH+DspEAJkVmeBKMNk_z-_g@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] x86: Align output sections for UEFI CA memory
 mitigation requirements
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 9:14=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 23.09.2024 18:06, Frediano Ziglio wrote:
> > On Mon, Sep 23, 2024 at 4:54=E2=80=AFPM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 19.09.2024 10:00, Frediano Ziglio wrote:
> >>> All loadable sections should be page aligned.
> >>
> >> What about .buildid? .reloc otoh is discardable, and hence presumably =
okay
> >> if mis-aligned.
> >
> > Currently, internally we have a patch to make ".reloc" not discardaeble=
.
> > The problem is that in case of direct EFI loading, that section is
> > used to relocated back to the final location. On bootloaders
> > discarding that section, you'll get a crash :-(
>
> Indeed, if such EFI loaders exist we have an issue (I don't think we
> actively mark the section discardable, I think that's something the
> linker decides).
>

There are indeed some oddities in the final executable(s):

From "objdump -x":

xen/normal/xen.efi:     file format pei-x86-64
xen/normal/xen.efi
architecture: i386:x86-64, flags 0x0000013b:
HAS_RELOC, EXEC_P, HAS_DEBUG, HAS_SYMS, HAS_LOCALS, D_PAGED
start address 0xffff82d04062bfdc
...
The Data Directory
Entry 0 0000000000000000 00000000 Export Directory [.edata (or where
ever we found it)]
Entry 1 0000000000000000 00000000 Import Directory [parts of .idata]
Entry 2 0000000000000000 00000000 Resource Directory [.rsrc]
Entry 3 0000000000000000 00000000 Exception Directory [.pdata]
Entry 4 0000000000000000 00000000 Security Directory
Entry 5 00000000009489a0 000016c0 Base Relocation Directory [.reloc]
Entry 6 00000000004871c8 0000001c Debug Directory
Entry 7 0000000000000000 00000000 Description Directory
Entry 8 0000000000000000 00000000 Special Directory
...
There is a debug directory in .buildid at 0xffff82d0404871c8
...
Sections:
Idx Name          Size      VMA               LMA               File off  A=
lgn
 0 .text         0018c5f6  ffff82d040200000  ffff82d040200000  00001000  2*=
*4
                 CONTENTS, ALLOC, LOAD, CODE
 1 .rodata       000871c8  ffff82d040400000  ffff82d040400000  0018e000  2*=
*2
                 CONTENTS, ALLOC, LOAD, DATA
 2 .buildid      00000035  ffff82d0404871c8  ffff82d0404871c8  002151e0  2*=
*2
                 CONTENTS, ALLOC, LOAD, READONLY, DATA
 3 .init.text    0004775b  ffff82d040600000  ffff82d040600000  00215220  2*=
*2
                 CONTENTS, ALLOC, LOAD, READONLY, CODE
....

Some notes:
1- I don't understand why the debug directory points to .buildid section
  (I suppose that's the reason for the "There is a debug directory..." mess=
age);
2- .buildid follows .rodata (this is expected);
3- .buildid is not page aligned but the loader I tried seems to be
happy with that,
  I think it should be aligned;
4- .rodata for some reason is not marked as READONLY, even on ELF you
get the same issue.

For 3) I'll add the alignment.
For 1) and 4) I have no idea why.

Any suggestion on how to fix are welcome

> > Isn't ".buildid" a kind of subsection with the same attributes of
> > container section?
>
> In ELF maybe. In the PE binary it's following directly after .rodata,
> meaning it typically shares its space with .rodata's last page. (Aiui
> in PE/COFF it is illegal for multiple sections to overlap, unlike for
> ELF's "segments", i.e. what the program header entries describe.)
>
> > Maybe I have BUILD_ID_EFI not defined?
>
> Possible, albeit would be odd.
>
> Jan

Frediano

