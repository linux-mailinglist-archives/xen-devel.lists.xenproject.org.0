Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B32C994EFAA
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 16:35:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775614.1185836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdW84-00064d-Tv; Mon, 12 Aug 2024 14:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775614.1185836; Mon, 12 Aug 2024 14:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdW84-00062I-Qt; Mon, 12 Aug 2024 14:34:36 +0000
Received: by outflank-mailman (input) for mailman id 775614;
 Mon, 12 Aug 2024 14:34:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KPBI=PL=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sdW82-00062C-KE
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 14:34:34 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd5399d1-58b7-11ef-8776-851b0ebba9a2;
 Mon, 12 Aug 2024 16:34:32 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a6265d3ba8fso365026766b.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Aug 2024 07:34:32 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80bb0e124bsm235876566b.61.2024.08.12.07.34.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Aug 2024 07:34:31 -0700 (PDT)
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
X-Inumbo-ID: fd5399d1-58b7-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723473272; x=1724078072; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WI2O/JEw/2cmYdCIjcKiyYFHJkpvo0tYHK+TgeV4Ww=;
        b=T+o3GEJS1qSQt4GXFB2B34rVt0SL1ocyJadNvkD/VyvJiabu0UJvHHyFoi1M+gvjsv
         sPb+TBH5dhMET5c+59HR60heqDu8Y8zyfK5mJ8NIaChdjfLcPdEebIjMp0mtkyJNSqcD
         I/2rgV0dHZHN2E/98o40aPSJmJuuTFFDrPLDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723473272; x=1724078072;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5WI2O/JEw/2cmYdCIjcKiyYFHJkpvo0tYHK+TgeV4Ww=;
        b=FkAqkMx29G4ecuhvpgeHUI2wwruvCeDLnOg2zecDKYKPIjLWh93rDRwzHeHfHQwwBE
         xrsdI3Pc3oT2zF96Ffoh/IjDWasV9Phf5anueImVAAOFLtwskpQsyL3Dm+BPh7Pj3ZOu
         Tw+8X7UzwAa7EN4prXG8c+f06puo4ryWW79Rl8RX0gGsqcryTdNwKot4W6+ijJXPa+7T
         rOg1ClK0ClgWxerm5WFFHBL2NGs+2nIVtEFjNki7d9nZbZWlZW2m0Z7Cvy0ygfpDOgHg
         9IDKtd5rt8qhNbU7Oxs0k5AX52oXcByAQ4phvKeDC8/RbP1YGAM/E6tDZb51TnC/5VAG
         6D9A==
X-Forwarded-Encrypted: i=1; AJvYcCVmO00k7IFUpH0TXHVlEp+Ks3dnDxCirCkDVTvb5vtSjXUUR/6iStRK1JBYDyqSfK3icGaA3HSsk1yXuTpeiHXR9G+k3oa1T+3LsTEXlGA=
X-Gm-Message-State: AOJu0Yycss/YP8BbjNYVQlAtVFZOEzOtwiHJ7IAbBBsFSgfdl2pQQM6h
	OjCZM3vqe+ESlSp3sIq3H3+lnGtziZnrrGy9i8D+xx7hUTPxOFjUPl62G7T06Mo=
X-Google-Smtp-Source: AGHT+IEP9UT2arazht5Q4saQ5irCg0pUPRMFyTje4XJpyjY3u5GetlxHQdNq+YJXgo4qXReaz2fhTQ==
X-Received: by 2002:a17:906:6a17:b0:a7a:952b:95ae with SMTP id a640c23a62f3a-a80ed2cba3bmr33616166b.47.1723473271820;
        Mon, 12 Aug 2024 07:34:31 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Aug 2024 15:34:30 +0100
Message-Id: <D3E0A9YVBOAD.LLLJMNX31BG6@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86: slightly simplify MB2/EFI "magic" check
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <f2186827-62e6-4b24-8a6c-0c2a9499c232@suse.com>
In-Reply-To: <f2186827-62e6-4b24-8a6c-0c2a9499c232@suse.com>

Hi,

On Thu Aug 8, 2024 at 9:49 AM BST, Jan Beulich wrote:
> A few dozen lines down from here we repeatedly use a pattern involving
> just a single (conditional) branch. Do so also when checking for the
> boot loader magic value.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I further question the placement of the clearing of vga_text_buffer,
> just out of context: Shouldn't that be placed with the increments of
> efi_platform and skip_realmode? Or else is the terminology in comments
> ("on EFI platforms") wrong in one of the two places? In the end, if we
> are entered at __efi64_mb2_start but the magic doesn't match, we simply
> don't know what environment we're in. There may or may not be a VGA
> console at the default address, so we may as well (try to) write to it
> (just like we do when entered at start).

It's fair to assume we're in 64bits, and in that situation it's also fair t=
o
assume the text console is long gone (pun intended). Seeing how this would =
be a
boot protocol bug, I think the most reasonable thing to do is to leave a po=
ison
value in RAX and then hang (deadbeef..., badcafe..., take a pick). That wou=
ld
point the poor sod debugging this to the right part of the code.

Though this is a largely theoretical issue that I can't see happening in
practice.

>
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -233,13 +233,11 @@ __efi64_mb2_start:
> =20
>          /* Check for Multiboot2 bootloader. */
>          cmp     $MULTIBOOT2_BOOTLOADER_MAGIC,%eax
> -        je      .Lefi_multiboot2_proto
> =20
>          /* Jump to .Lnot_multiboot after switching CPU to x86_32 mode. *=
/
>          lea     .Lnot_multiboot(%rip), %r15

I don't think there's much benefit to this, but it would read more naturall=
y if
lea was before cmp. Then cmp would be next to its (new) associated jne.

> -        jmp     x86_32_switch
> +        jne     x86_32_switch
> =20
> -.Lefi_multiboot2_proto:
>          /* Zero EFI SystemTable, EFI ImageHandle addresses and cmdline. =
*/
>          xor     %esi,%esi
>          xor     %edi,%edi

Cheers,
Alejandro

