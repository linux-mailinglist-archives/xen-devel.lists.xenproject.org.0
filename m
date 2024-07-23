Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1736393A228
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 16:01:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763248.1173509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWG4d-00023W-5Y; Tue, 23 Jul 2024 14:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763248.1173509; Tue, 23 Jul 2024 14:01:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWG4d-00020u-2A; Tue, 23 Jul 2024 14:01:03 +0000
Received: by outflank-mailman (input) for mailman id 763248;
 Tue, 23 Jul 2024 14:01:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ruWa=OX=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sWG4b-00020o-VI
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 14:01:01 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fdf4164c-48fb-11ef-bbfe-fd08da9f4363;
 Tue, 23 Jul 2024 16:01:00 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5a2ffc34722so2032415a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 07:01:00 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30c2f869dsm7563815a12.65.2024.07.23.07.00.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 07:00:59 -0700 (PDT)
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
X-Inumbo-ID: fdf4164c-48fb-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1721743260; x=1722348060; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTEsuhPOmRfr2lCnPmIdNGkEYqjpmr50FbnJaOCfhY0=;
        b=OCPlnEA1rHy599FxAE2YYP/XL7YYSqGmRHslEknE1MYGCwZLEUtvO+8RNDv6dJBT8I
         Oqf19mA8NcwuEJnVtPDabBdkfWjmvtvUFUpFRr0JTtqFsypRMT1UaSOj8VPZFP11No0h
         jhEcTWQWa+DWU7+YaoF/B6th/nMIupEkW35R4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721743260; x=1722348060;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HTEsuhPOmRfr2lCnPmIdNGkEYqjpmr50FbnJaOCfhY0=;
        b=J1YcfJdHbINysB1+cGi+FVp9QUt8Zk1Sx7Q99KPV6R1Yq8mZRbvXAs0YhRSjR4UiaV
         gmmtSQOAzUuoWV0997HdWjAzW88UPR/UtEbZUMc6mM8kfBijw9C3zutEZcMfS1MdWmZS
         M1e8pTqnpQ/XNIpfwnPkDwI0Kh1fujTmykZYMRCUESkgvpZsJC3vNeKyWIQ7TeAE1DV7
         5w2AkIhcjAWJLfKilUgOH7pMdQictXvmiQz3z0YUrEB1yNjYefL9rctjJH6DjAFk0YMl
         cocWuRxQInxcyjRepiohvD6we6WdKDYY46UDKZtxQHlmlZUJxa5mvzLT+Bh2oKEgaWZd
         2cvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqQkm2QneWLQhEu3pyu0p3t98QCqao8ONtUaD7w1knIhmCSfbrDJreRN7PCOSmnUHnhZMeoa9XqiGRXLw7+JZccBqQifAe4CHtpFBjrHM=
X-Gm-Message-State: AOJu0YzP48tnGdXtQCOae8btSTEmE5hcwpsZ+OQwJsqI7a1hcg6o5CFb
	E+1MjhsslTLCu4rJAe4x45LiRp3Jko1vPd5SZ32XEDgrGph261eOoxr6P2IJHzI=
X-Google-Smtp-Source: AGHT+IGUFJ+pXm4HaEv9nkqoh1Aio7n6+APl63vNd/XHnW+e25Z8QhZtd/spJgC5+DgjjYmGr9Dttw==
X-Received: by 2002:a50:8acd:0:b0:57d:4409:4f48 with SMTP id 4fb4d7f45d1cf-5a99e77082fmr2368111a12.15.1721743260160;
        Tue, 23 Jul 2024 07:01:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jul 2024 15:00:57 +0100
Message-Id: <D2WZ1P5AUD7G.3KZXNDB8BMUE8@cloud.com>
Cc: "Gene Bright" <gene@cyberlight.us>, "Jan Beulich" <JBeulich@suse.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P . Smith"
 <dpsmith@apertussolutions.com>, =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 2/2] x86/efi: Unlock NX if necessary
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <20240722101838.3946983-1-andrew.cooper3@citrix.com>
 <20240722101838.3946983-3-andrew.cooper3@citrix.com>
In-Reply-To: <20240722101838.3946983-3-andrew.cooper3@citrix.com>

Well, damn. At least it was found rather quickly.

On Mon Jul 22, 2024 at 11:18 AM BST, Andrew Cooper wrote:
> EFI systems can run with NX disabled, as has been discovered on a Broadwe=
ll
> Supermicro X10SRM-TF system.
>
> Prior to commit fc3090a47b21 ("x86/boot: Clear XD_DISABLE from the early =
boot
> path"), the logic to unlock NX was common to all boot paths, but that com=
mit
> moved it out of the native-EFI booth path.

I suspect you meant boot rather than booth.

>
> Have the EFI path attempt to unlock NX, rather than just blindly refusing=
 to
> boot when CONFIG_REQUIRE_NX is active.
>
> Fixes: fc3090a47b21 ("x86/boot: Clear XD_DISABLE from the early boot path=
")
> Link: https://xcp-ng.org/forum/post/80520
> Reported-by: Gene Bright <gene@cyberlight.us>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> CC: Gene Bright <gene@cyberlight.us>
>
> Note.  Entirely speculative coding, based only on the forum report.
> ---
>  xen/arch/x86/efi/efi-boot.h | 33 ++++++++++++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 3 deletions(-)
>
> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> index 4e4be7174751..158350aa14e4 100644
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -736,13 +736,33 @@ static void __init efi_arch_handle_module(const str=
uct file *file,
>      efi_bs->FreePool(ptr);
>  }
> =20
> +static bool __init intel_unlock_nx(void)
> +{
> +    uint64_t val, disable;
> +
> +    rdmsrl(MSR_IA32_MISC_ENABLE, val);
> +
> +    disable =3D val & MSR_IA32_MISC_ENABLE_XD_DISABLE;
> +
> +    if ( !disable )
> +        return false;
> +
> +    wrmsrl(MSR_IA32_MISC_ENABLE, val & ~disable);
> +    trampoline_misc_enable_off |=3D disable;
> +
> +    return true;
> +}

Do we want "#ifdef CONFIG_INTEL" the contents?

> +
>  static void __init efi_arch_cpu(void)
>  {
> -    uint32_t eax;
> +    uint32_t eax, ebx, ecx, edx;
>      uint32_t *caps =3D boot_cpu_data.x86_capability;
> =20
>      boot_tsc_stamp =3D rdtsc();
> =20
> +    cpuid(0, &eax, &ebx, &ecx, &edx);
> +    boot_cpu_data.x86_vendor =3D x86_cpuid_lookup_vendor(ebx, ecx, edx);
> +
>      caps[FEATURESET_1c] =3D cpuid_ecx(1);
> =20
>      eax =3D cpuid_eax(0x80000000U);
> @@ -752,10 +772,17 @@ static void __init efi_arch_cpu(void)
>      caps[FEATURESET_e1d] =3D cpuid_edx(0x80000001U);
> =20
>      /*
> -     * This check purposefully doesn't use cpu_has_nx because
> +     * These checks purposefully doesn't use cpu_has_nx because
>       * cpu_has_nx bypasses the boot_cpu_data read if Xen was compiled
> -     * with CONFIG_REQUIRE_NX
> +     * with CONFIG_REQUIRE_NX.
> +     *
> +     * If NX isn't available, it might be hidden.  Try to reactivate it.
>       */
> +    if ( !boot_cpu_has(X86_FEATURE_NX) &&
> +         boot_cpu_data.x86_vendor =3D=3D X86_VENDOR_INTEL &&
> +         intel_unlock_nx() )
> +        caps[FEATURESET_e1d] =3D cpuid_edx(0x80000001U);
> +
>      if ( IS_ENABLED(CONFIG_REQUIRE_NX) &&
>           !boot_cpu_has(X86_FEATURE_NX) )
>          blexit(L"This build of Xen requires NX support");

Cheers,
Alejandro

