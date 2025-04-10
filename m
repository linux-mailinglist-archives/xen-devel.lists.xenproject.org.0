Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D65E0A842F3
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 14:22:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945583.1343762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qvI-0001rD-MN; Thu, 10 Apr 2025 12:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945583.1343762; Thu, 10 Apr 2025 12:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qvI-0001o8-J6; Thu, 10 Apr 2025 12:22:24 +0000
Received: by outflank-mailman (input) for mailman id 945583;
 Thu, 10 Apr 2025 12:22:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2qvH-0001cw-8z
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 12:22:23 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73b3c20c-1606-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 14:22:21 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so6954625e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 05:22:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2066d0fcsm53197075e9.19.2025.04.10.05.22.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 05:22:20 -0700 (PDT)
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
X-Inumbo-ID: 73b3c20c-1606-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744287741; x=1744892541; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JpR1IWtnC+kJ0PDE7ywEcjhjjCmDWrQDcDdKwWsu6uM=;
        b=ZOlejGGBm+qBKCktjb1EMblWONnatZdzAIqXGZvqmZ39qRhRDCekQYWOkH41drlHp4
         fms5D6OqGvUhqJ1YiRavpSrh9p4KX2QUD3cPG07VGZZhZ73nrpwBIt9mHle/eT/pl/k6
         T9x3aWuc3cq2Owq4QNP8Xwk0Bfrd+TYJqvRRyjfFtWBDfcRpEp1E0XEHwb5RQlmRwbW1
         B9/F7hg8e83cEkVTIHb6ib+VDlVHfp7wO4gvQfhHyxJpcmcmaap6y2lmTnh3Uq1ochu0
         wZKziZwV906cGBbIzmFEauUAa67fToOmG34mW9N7z/2CgAhphY7kbImk2dHsq2EYFK3a
         q+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744287741; x=1744892541;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JpR1IWtnC+kJ0PDE7ywEcjhjjCmDWrQDcDdKwWsu6uM=;
        b=EzhANOy15tU3ZVHOsulgaVHwFQr+gzvYFIGZvZYbsEFsFqM9DUrppe7iT5DVK3Ti/m
         Cxf1XSogprnrY4BTU1DQJQKPW2s3dDi5SrCCh9Hsq366HqjBsGNF0HsMMEwwHxhDEac8
         W30X26A7883gs4MeQkx1LZDM3+rVc3O+xOomHXE2k71mSJDjat7SeG8i5AQMtCHUfRlP
         xogK40jeY3OUM4cla4X3vjcOS8KXUkH8SN6S/bCHiA3hEUVXUihQ7BPo2nMyx1oCJwoq
         XR6NbKLpg/RKrkV3TuC2FR7qOZeinA1PyCyEfLkc6HL+InRzcktSPnEVmqOzfcL/QG2j
         /mwg==
X-Forwarded-Encrypted: i=1; AJvYcCX/jNLXsYqwvb4ABJu23b1J2uqwh6Cv2+vwNWotu3oOcwHWTgDYweD6y52A/n3+1GAMQ+Bewsf9fVU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzuQEW8/T7X2FPPvfPynxbmI65RE9keQj7ef4T9xksDNFumHahD
	wvtU6r1WTd/vNhs1EI/NiERKmiFPYZZD8Dl419mZ/2yCbOCueft92nvPKyHiFA==
X-Gm-Gg: ASbGncta3D0qx5OI/w4WX4E+vAa5yd3si6G8lJipC00M/foQ4/NtUTjCpVXYITJBttd
	AMiOwoPrm7vXgkc2WFJnftpF4w7siGPri1ZAzsKd5xQo8HM5v7ptMOZ1aTOnoCgH0z/g+zSAja9
	KSbFeM/0PiyCFBq0iaM8TPMcL2ReF2lIRBotvLoAEg5QNW5zx78Z0NQt4GnDVNSbVYPGb/pBYg+
	cDINq0ucLMqmTbmVZeRocZqtvgnt0v00jYAwS7lz89xnOon+sXDMq+gjPJN5NWuZRYdLNGg+vMA
	JRytgFd0tJCQMfWcz/8Om7NzxvZbK8pQvKWcZz7tVaEJ3WrfHriVgyOeTs9QKnb0ggJfsumhHXr
	yWv2JDQGTHj1DWL7SzYBxKMK3Qw==
X-Google-Smtp-Source: AGHT+IHK1qSl663r+jjkyC6KyW8qC3rvJw2g3Qt7UK3PaD9noYbOlTg1BLFshxOUSyxIiMeF4h/icQ==
X-Received: by 2002:a05:600c:511c:b0:43c:fa24:873e with SMTP id 5b1f17b1804b1-43f2d7b88d3mr28494835e9.13.1744287741052;
        Thu, 10 Apr 2025 05:22:21 -0700 (PDT)
Message-ID: <6f37afce-7901-45a8-80ed-86f43313bbfe@suse.com>
Date: Thu, 10 Apr 2025 14:22:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Ping: [PATCH] x86/EFI: sanitize DLL characteristics in binary
From: Jan Beulich <jbeulich@suse.com>
To: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <90354241-4ebb-4d52-809c-0af788d2b860@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <90354241-4ebb-4d52-809c-0af788d2b860@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.04.2025 10:51, Jan Beulich wrote:
> In GNU ld --disable-reloc-section implies --disable-dynamicbase (and
> also --disable-high-entropy-va, just fyi). Therefore to yield
> functionally identical binaries independent of whether mkreloc needs to
> come into play, add --dynamicbase as well.
> 
> GNU ld further defaults to --high-entropy-va (along with --dynamicbase
> and --nxcompat) unless "Cygwin-like". This seems wrong to me; that
> default should be dependent upon "MinGW-like" instead; for the purpose
> of building EFI binaries with a PE32+-capable ELF linker neither
> "Cygwin-like" nor "MinGW-like" ought to be true. We certainly don't mean
> to have this bit set in the DLL characteristics, so suppress its
> setting.
> 
> Sadly while --high-entropy-va is supported by GNU ld 2.25,
> --disable-high-entropy-va was introduced only in 2.36. Luckily the
> defaulting to --high-entropy-va was also only introduced in 2.36. Plus
> --disable-reloc-section was introduced precisely there, too. Hence
> leverage the probing we do as to base relocation generation, to also
> determine whether to pass --disable-high-entropy-va.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Despite the file being modified suggesting this needs an x86 maintainer
ack, I think it's rather one of the two of you who should ack (or
otherwise comment on) this.

Jan

> ---
> I remain uncertain about the applicability of DLL characteristics to
> non-DLLs, i.e. images without IMAGE_FILE_DLL set; current MS doc says
> nothing either way. Yet producing consistent binaries still seems
> desirable, even if the field wasn't to be used by loaders.
> 
> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -113,6 +113,7 @@ efi-nr-fixups := $(shell LC_ALL=C $(OBJD
>  
>  ifeq ($(efi-nr-fixups),2)
>  MKRELOC := :
> +EFI_LDFLAGS += --disable-high-entropy-va
>  else
>  MKRELOC := arch/x86/efi/mkreloc
>  # If the linker produced fixups but not precisely two of them, we need to
> @@ -123,6 +124,8 @@ EFI_LDFLAGS += --disable-reloc-section
>  endif
>  endif
>  
> +EFI_LDFLAGS += --dynamicbase
> +
>  endif # $(XEN_BUILD_PE)
>  
>  export XEN_BUILD_EFI XEN_BUILD_PE


