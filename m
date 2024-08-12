Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3523594F5E5
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 19:36:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775699.1185926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdYxU-0005Zq-2E; Mon, 12 Aug 2024 17:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775699.1185926; Mon, 12 Aug 2024 17:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdYxT-0005XR-Vs; Mon, 12 Aug 2024 17:35:51 +0000
Received: by outflank-mailman (input) for mailman id 775699;
 Mon, 12 Aug 2024 17:35:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KPBI=PL=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sdYxS-0005XL-LZ
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 17:35:50 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e919385-58d1-11ef-8776-851b0ebba9a2;
 Mon, 12 Aug 2024 19:35:48 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5a156556fb4so5335042a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Aug 2024 10:35:46 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bd1a5dfc9fsm2280308a12.66.2024.08.12.10.35.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Aug 2024 10:35:44 -0700 (PDT)
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
X-Inumbo-ID: 4e919385-58d1-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723484146; x=1724088946; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFPlrxZoLMv9hf55212UKVptTgMELOiCvhI0eA1MZ18=;
        b=BSF2/FCKEqZQfGj0PQdwEY8AU/sbW3RNnKm7486PMA3aDJkTkZQLCPKeZ1NcmmksLC
         uclHZ0Gu+PFMlmWXLr66itoSk8YFsZ1XCpC/iuMCl3PIhJGlkYzp0F9YL0C9oHclVAZV
         F2RhcIsoGfhMCPDjC7kp+wLco+Lqe7Fiwo5ik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723484146; x=1724088946;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mFPlrxZoLMv9hf55212UKVptTgMELOiCvhI0eA1MZ18=;
        b=ILMP5SwOAai/Ibj5pD1GOmPGIlz9MG77C4HtijYPNB9V/xgA4GS/scxJJ4s/PlI/m8
         95eLpsG/d58r8mXnMxdPnh9waqnqq3mWHGpcSFe1ofTEDHx6k2G8Dg6CxgyijU2ar6iV
         LEQkjqcPlEozC0cJYQJfSw/EyWmbIsUQzhJMovx51gMFXwGnpniqstMews2YoYANcm2E
         ay5/byY7vBQI7FgADCAPbx3p63c/jE3VKwghWvbiBarHN6boXn8LtCH5kS5MbkGlzPwj
         u6CzmWVIiQIOv+XMx5AQOhzy29K8w3gs8PLWCx/vU3km8wYBypoe6kc0WlVAxLQLZ5CA
         ZVmA==
X-Forwarded-Encrypted: i=1; AJvYcCX7PdI9q7MU9YXh0dmBzpZHwDRBvPYwi99m//dtSRr8t1O90nIEeF0PhN19KklT2yiWkgIq/miAHKWAW8r3GEoug+XefdlG10W2wydo7AE=
X-Gm-Message-State: AOJu0Yy2LM4fN1JVKxDfPy+6LQxXXZpWwVl0wXz5CLIm6Kq7IEK6u4Eu
	xQNDvwknUtYDovz/yhVKxcaVVIPB1y8D3DlCu+1joESfaW9jUHr0zNz9pKgsjNI=
X-Google-Smtp-Source: AGHT+IHbINypJ8c0OvDvKeWOF5JlsSRrxIvKJdOvQ60cSLLTOGFaowPdYNucrU76OpkRRqj48ssnZg==
X-Received: by 2002:a05:6402:e87:b0:5a2:94ef:5573 with SMTP id 4fb4d7f45d1cf-5bd44c78087mr691259a12.37.1723484145413;
        Mon, 12 Aug 2024 10:35:45 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Aug 2024 18:35:43 +0100
Message-Id: <D3E4510X007T.23EWZ5W1418HP@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86: slightly simplify MB2/EFI "magic" check
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.17.0
References: <f2186827-62e6-4b24-8a6c-0c2a9499c232@suse.com>
 <D3E0A9YVBOAD.LLLJMNX31BG6@cloud.com>
 <53c6c9ba-de64-4e46-9e29-2e03a9d8224b@suse.com>
In-Reply-To: <53c6c9ba-de64-4e46-9e29-2e03a9d8224b@suse.com>

Hi,

On Mon Aug 12, 2024 at 3:43 PM BST, Jan Beulich wrote:
> On 12.08.2024 16:34, Alejandro Vallejo wrote:
> > On Thu Aug 8, 2024 at 9:49 AM BST, Jan Beulich wrote:
> >> A few dozen lines down from here we repeatedly use a pattern involving
> >> just a single (conditional) branch. Do so also when checking for the
> >> boot loader magic value.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> I further question the placement of the clearing of vga_text_buffer,
> >> just out of context: Shouldn't that be placed with the increments of
> >> efi_platform and skip_realmode? Or else is the terminology in comments
> >> ("on EFI platforms") wrong in one of the two places? In the end, if we
> >> are entered at __efi64_mb2_start but the magic doesn't match, we simpl=
y
> >> don't know what environment we're in. There may or may not be a VGA
> >> console at the default address, so we may as well (try to) write to it
> >> (just like we do when entered at start).
> >=20
> > It's fair to assume we're in 64bits, and in that situation it's also fa=
ir to
> > assume the text console is long gone (pun intended).
>
> How is being in 64-bit mode correlated with there being a VGA console?
> (I question "fair to assume" here anyway. We're on a path where we know
> something's wonky.)

The only way in which you could plausibly have a text-mode console in 64bit=
s is
if you booted from BIOS and didn't set a VESA mode, so it boils down to wha=
t
failure modes you want to consider. For "anything goes" you're right that w=
e
can't even be sure of being in 64bit (or 32bit) mode, but that's too dracon=
ian
an assumption to try to uphold, imo. I think that while details in the boot
protocol might be incorrect (like the magic tag), broad strokes (like being=
 in
long mode and having a UEFI runtime) must still hold. Trying to use the ser=
ial
is fine (worst-case scenario it doesn't work), but trying to use a framebuf=
fer
you're not sure about is not unlikely to triple fault your machine prematur=
ely
and then debugging it is a pain even with an emulator.

>
> >> --- a/xen/arch/x86/boot/head.S
> >> +++ b/xen/arch/x86/boot/head.S
> >> @@ -233,13 +233,11 @@ __efi64_mb2_start:
> >> =20
> >>          /* Check for Multiboot2 bootloader. */
> >>          cmp     $MULTIBOOT2_BOOTLOADER_MAGIC,%eax
> >> -        je      .Lefi_multiboot2_proto
> >> =20
> >>          /* Jump to .Lnot_multiboot after switching CPU to x86_32 mode=
. */
> >>          lea     .Lnot_multiboot(%rip), %r15
> >=20
> > I don't think there's much benefit to this, but it would read more natu=
rally if
> > lea was before cmp. Then cmp would be next to its (new) associated jne.
>
> You did look at the pattern though that I'm referring to in the descripti=
on?
> Knowing that generally paring the CMP/TEST with the Jcc, I would have
> switched things around. Yet I wanted to make things as similar as possibl=
e,
> in the hope that be(com)ing consistent would make it easiest to get such =
a
> minor change in.
>
> Jan

I'm not sure about the pattern you mention. Seems like a standard set of
doX+check+cond_jump finished in an unconditional jump. All of them pretty
normal.

Regardless, I'm not arguing against this. While I happen to find it easier =
to
mentally parse it in its current form we do save a jump instruction after y=
our
change. It's just that it'd be easier to follow with the mentioned reversal=
 of
lea and cmp.

Cheers,
Alejandro

