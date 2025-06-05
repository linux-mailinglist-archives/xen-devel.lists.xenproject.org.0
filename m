Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B544ACEED5
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 14:03:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006729.1385953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN9Ih-0004Oe-1b; Thu, 05 Jun 2025 12:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006729.1385953; Thu, 05 Jun 2025 12:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN9Ig-0004MA-UZ; Thu, 05 Jun 2025 12:02:26 +0000
Received: by outflank-mailman (input) for mailman id 1006729;
 Thu, 05 Jun 2025 12:02:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uN9If-0004M3-BK
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 12:02:25 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f08ee2cb-4204-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 14:02:23 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ad56829fabdso139936266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 05:02:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5d82becbsm1257481566b.39.2025.06.05.05.02.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 05:02:22 -0700 (PDT)
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
X-Inumbo-ID: f08ee2cb-4204-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749124943; x=1749729743; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SQV8GbkNSTmuawmHHmwq6Mz/OtVanuxGcNVmOTgjei8=;
        b=SVgoQGAAR42jK8xhjkqz2LgNvrFmO5lOOqj8Pri4X1y9bheTrhEf3Uutz11obui+x4
         9bA5bTsN2RDoGyla1et0iAgg+JbCu1Mf7YG33RiPKR3n8/EolUQiYabCrGLkrYuy0Uz2
         us6RX9Kl6bCWEjTDkPx+4Wu7KRp219Ag2UP+KaF9RljSZ8xARf01J4r3iH+PkduoXzwr
         2+Ca1DWQA+RVpSDjrPERDstQlB23gyfS3q2yGop20TTjjm6LTsf4LLYfUyWUY5vTmSWJ
         JM5IQKgVUumljk554i4a5kEOYoE0dEelWjGktGxCwTQ5JlScBmQRs5eGp8ede36JTWU8
         ahxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749124943; x=1749729743;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQV8GbkNSTmuawmHHmwq6Mz/OtVanuxGcNVmOTgjei8=;
        b=fEAvJvJXouxVieFmfZDYHUv/CdkmgSDuZsE8K+PTJ2sCCTSiVWkhWu6qIf3bQp1ja+
         hWW5r8zWuTKntVkUl7s/OeCAJ77aDyV6tl6sYd8Nly3Ms+RmQKiDkWxnTL9cOX+BzZKC
         8a9cRX6lqjNtvlXwobysJHXcE9aQ3A1tbW0lLa4g1/WhyCNLgD5NCWf9uEaQb3mFsXbg
         4fVC6FgG6wm/Y5yzGpwE8s+YY/BR+L2GKZw1JGMwM1/wv4T8jUJPmtPs2caM3DlReLVU
         +ulHKerWpw96tabqd4uAkiXXW8RXYbvaoVxcokHdivCbldNtPddmamQhqyuT2+d00Su9
         BSug==
X-Forwarded-Encrypted: i=1; AJvYcCUngLMXXPD7Ffes/uyBeEm/k+FeBAgS7YQv+R3iIFP9BXU6uqPknlea96SNLJ476VYbD6rwhahZl8Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4opGdG8JQgBSckxfOSUwdKKKYCUemhJhIHsZ0Ha1lyZK+Ug1m
	rQwmyU5fRY6hrFSYBzv93bHtATEm2rN0giw6ZMN5/i0sl4RKxuxU5U5f5XFdtZ4Vcg==
X-Gm-Gg: ASbGncsFs5Cdkfd9cu3nrhoENW1BoENSujILl11ukBUxZSl7x6rqVR953kNoV0iszOH
	l0Oo5ic/1PkQHmyrVNg8X/uh4ANKhlfHj1zmBww7jlcphejvlCByXuOvHhjfwW8Jg30Ew31XKUM
	x2GNAAcMHW+WtEj0iQ2fvlK1mAnEfbyjYfEFuZKPxdR8rqtsR1slijwv3UfEY8evkaUwdl2M1Kf
	PGQ9Cczq3BH7Addspvy5m8Gz53KhWiBHXX2xQLZ54aTyCGw+8XkogMI8aytRASbBlL4cm0zq768
	VPcxNzPoULoumqq8YAhvZbaabijdEGiYp4lDi53rESff7n7c/rHa2lJVejp/IWH0dul+3WlP1rX
	4F6xMRx5JepVRP+ZGbBn1EItYDGsQgvxva+34GEZ5TF1f5AY=
X-Google-Smtp-Source: AGHT+IESPNP0Bz4oFj6jHnrxYw+Ps3evLuAI/M+SsVvhZp0u8niGoorfsIJv8WvyQ5mi1qI4y1n/Xw==
X-Received: by 2002:a17:907:7b8e:b0:ad8:93a3:29b0 with SMTP id a640c23a62f3a-addf8f79a1dmr589093466b.45.1749124942549;
        Thu, 05 Jun 2025 05:02:22 -0700 (PDT)
Message-ID: <0a314400-126a-4c2a-b36c-dda61bb0b751@suse.com>
Date: Thu, 5 Jun 2025 14:02:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/EFI: Fix detection of buildid
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250605111638.2869914-1-andrew.cooper3@citrix.com>
 <20250605111638.2869914-2-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <20250605111638.2869914-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.2025 13:16, Andrew Cooper wrote:
> The format of the buildid is a property of the binary, not a property of how
> it was loaded.  This fixes buildid recognition when starting xen.efi from it's
> MB2 entrypoint.
> 
> Suggested-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'll pick this up without a Fixes: tag, but I think it ought to have one. (I
didn't check whether MB2 or build-id support came later, hence introducing the
issue.)

> --- a/xen/common/version.c
> +++ b/xen/common/version.c
> @@ -203,8 +203,11 @@ void __init xen_build_init(void)
>      rc = xen_build_id_check(n, sz, &build_id_p, &build_id_len);
>  
>  #ifdef CONFIG_X86
> -    /* Alternatively we may have a CodeView record from an EFI build. */
> -    if ( rc && efi_enabled(EFI_LOADER) )
> +    /*
> +     * xen.efi built with a new enough toolchain will have a CodeView record,
> +     * not an ELF note.
> +     */
> +    if ( rc )

Instead of dropping the efi_enabled(), I think you want to replace EFI_LOADER
by EFI_BOOT.

Jan

