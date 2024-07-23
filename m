Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A60D193A1E4
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 15:47:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763229.1173489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWFrM-0006XH-Ph; Tue, 23 Jul 2024 13:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763229.1173489; Tue, 23 Jul 2024 13:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWFrM-0006Uq-Mp; Tue, 23 Jul 2024 13:47:20 +0000
Received: by outflank-mailman (input) for mailman id 763229;
 Tue, 23 Jul 2024 13:47:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ruWa=OX=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sWFrL-0006Uj-8n
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 13:47:19 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13098e91-48fa-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 15:47:17 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52f01ec08d6so3198655e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 06:47:17 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c8be3d7sm551225366b.140.2024.07.23.06.47.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 06:47:15 -0700 (PDT)
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
X-Inumbo-ID: 13098e91-48fa-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1721742436; x=1722347236; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41wLimo+GAUwzY99gBr6y7OCaz6N2LtCF8X53iEUQPM=;
        b=iApbp7XOCgbQR8l4ZkjbSvMmk7QORJiooS8JjQCa2D4vVpjXsOo4CBUXmNQcgOGCVB
         vxm1OwepNw40Re9eve1VhJPRbAkKyL9K38CMfj/fM82DvDo0Xy1DN4OZqT6HZjgTit4Q
         XqSKpVeRL7tIa2sm974JWa+mUCywPCvWM2UQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721742436; x=1722347236;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=41wLimo+GAUwzY99gBr6y7OCaz6N2LtCF8X53iEUQPM=;
        b=fKb0K3VJZmUxGyOohVjpb/TKEMVTn/cbhSDb0Q8mUQMDQbF3i4mG/V4HfQGmUkwEYO
         7Guvbnlp5gcaMwUWpVp9wVsnaH7knpbrXG8psnewBM42qoWrKQmrUD6Fa59AjGCIROPU
         2IRYDBVRts1KxKuL8LD0lWsmJvINIVDUPga2NcDmjbK14wHJ1BXk4p8nH74vy6aB+HOj
         iTGKKPMDeYUvxjFiQ3i78q9z8iVUns1kDwXRPBXpXlAq78g0YgdoVUsWm7PluioZ0i6Y
         BHLAd4VIS8Cki3l/9X+Wv9ChELmgDwFt57+LZB/Kt880v8ZXFwuRqr8Uy6YxQl32T9JU
         IPTw==
X-Forwarded-Encrypted: i=1; AJvYcCULL2L1BnYmV1ez1vu8Sk/3acrRXnUWIJnhM6qUwjYf3ej3UUSTTNARQsbnuTAZnKjzShEdKK5FdySBVSZW2qIXsme3qIlMEI2zDiir8zI=
X-Gm-Message-State: AOJu0YwKI9NRp4DNeAp2oVOMLmXqWyubnvsvBN37B/sLzJ1YXGAH/bxC
	5/2qmHqDsrZ0vrPCRvawCOWxVeKKmQUP0LsAWThFzQpIP3gSjxF5G2cItP/G5NI=
X-Google-Smtp-Source: AGHT+IHiq6vw4McMRltRCNCB6huqDqybR+36+mKNH+f0I+lPaCgCC71mr8ZGzhfqo3Rx8nL6TeArIQ==
X-Received: by 2002:a05:6512:2211:b0:52e:76d5:9504 with SMTP id 2adb3069b0e04-52fc403d8dcmr2159669e87.3.1721742436389;
        Tue, 23 Jul 2024 06:47:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jul 2024 14:47:13 +0100
Message-Id: <D2WYR6RSF2NH.3FCEH00B4ZRZ2@cloud.com>
Cc: "Jan Beulich" <JBeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, "Gene Bright" <gene@cyberlight.us>
Subject: Re: [PATCH 1/2] x86/efi: Simplify efi_arch_cpu() a little
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <20240722101838.3946983-1-andrew.cooper3@citrix.com>
 <20240722101838.3946983-2-andrew.cooper3@citrix.com>
In-Reply-To: <20240722101838.3946983-2-andrew.cooper3@citrix.com>

On Mon Jul 22, 2024 at 11:18 AM BST, Andrew Cooper wrote:
> Make the "no extended leaves" case fatal and remove one level of indentat=
ion.
> Defer the max-leaf aquisition until it is first used.
>
> No functional change.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> CC: Gene Bright <gene@cyberlight.us>
> ---
>  xen/arch/x86/efi/efi-boot.h | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
>
> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> index f282358435f1..4e4be7174751 100644
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -738,29 +738,30 @@ static void __init efi_arch_handle_module(const str=
uct file *file,
> =20
>  static void __init efi_arch_cpu(void)
>  {
> -    uint32_t eax =3D cpuid_eax(0x80000000U);
> +    uint32_t eax;
>      uint32_t *caps =3D boot_cpu_data.x86_capability;
> =20
>      boot_tsc_stamp =3D rdtsc();
> =20
>      caps[FEATURESET_1c] =3D cpuid_ecx(1);
> =20
> -    if ( (eax >> 16) =3D=3D 0x8000 && eax > 0x80000000U )
> -    {
> -        caps[FEATURESET_e1d] =3D cpuid_edx(0x80000001U);
> +    eax =3D cpuid_eax(0x80000000U);

Why this movement?

> +    if ( (eax >> 16) !=3D 0x8000 || eax < 0x80000000U )
> +        blexit(L"In 64bit mode, but no extended CPUID leaves?!?");

I'm not sure about the condition even for the old code. If eax had 0x900000=
00
(because new convention appeared 10y in the future), then there would be
extended leaves but we would be needlessly bailing out. Why not simply chec=
k
that eax < 0x80000001 in here?

> =20
> -        /*
> -         * This check purposefully doesn't use cpu_has_nx because
> -         * cpu_has_nx bypasses the boot_cpu_data read if Xen was compile=
d
> -         * with CONFIG_REQUIRE_NX
> -         */
> -        if ( IS_ENABLED(CONFIG_REQUIRE_NX) &&
> -             !boot_cpu_has(X86_FEATURE_NX) )
> -            blexit(L"This build of Xen requires NX support");
> +    caps[FEATURESET_e1d] =3D cpuid_edx(0x80000001U);
> =20
> -        if ( cpu_has_nx )
> -            trampoline_efer |=3D EFER_NXE;
> -    }
> +    /*
> +     * This check purposefully doesn't use cpu_has_nx because
> +     * cpu_has_nx bypasses the boot_cpu_data read if Xen was compiled
> +     * with CONFIG_REQUIRE_NX
> +     */
> +    if ( IS_ENABLED(CONFIG_REQUIRE_NX) &&
> +         !boot_cpu_has(X86_FEATURE_NX) )
> +        blexit(L"This build of Xen requires NX support");
> +
> +    if ( cpu_has_nx )
> +        trampoline_efer |=3D EFER_NXE;
>  }
> =20
>  static void __init efi_arch_blexit(void)

Cheers,
Alejandro

