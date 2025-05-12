Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED96AB36DA
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 14:19:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981383.1367780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uES7l-0005JM-6W; Mon, 12 May 2025 12:19:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981383.1367780; Mon, 12 May 2025 12:19:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uES7l-0005Hf-2y; Mon, 12 May 2025 12:19:13 +0000
Received: by outflank-mailman (input) for mailman id 981383;
 Mon, 12 May 2025 12:19:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uES7i-0005HW-RM
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 12:19:10 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4de92d8c-2f2b-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 14:19:08 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ad21cc2594eso458855766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 05:19:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad219746730sm617518866b.94.2025.05.12.05.19.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 05:19:07 -0700 (PDT)
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
X-Inumbo-ID: 4de92d8c-2f2b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747052348; x=1747657148; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EVWA36RgFiCmqoJ9uRX+CTqmQc93aIquu6iaXIi+lnc=;
        b=cf6e52vkacJ5SDDzkV+zZtyJBGyEgkZ5ajL1q1ZDj3Gah/IurttkOLIX+PCCKwTgGa
         qyXWLMYhvGLwLaTgKNhGplvndnwZX/WeVuFl6m5I8lASkVceO/Xomu+R+RT8GJhWvqRe
         qC5dvVi4lkFDr/YkiYX8HtTxnb2XhlNbIwqkPVCVQJXf5ToUTnykuhwTSHdelDAgHCc8
         rq8w3AYdAYYpYXah+HO7zgerbZxPhb9axZ/x9MSWntB2uwyzxHewKHdUQh+7FyA2vbt2
         NBbpd3WCA6CGMnTehaU8MSFls1L70oQj9kchCwqOPqgUcnoTZh44y3v/fprXEO98mt8G
         Y4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747052348; x=1747657148;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVWA36RgFiCmqoJ9uRX+CTqmQc93aIquu6iaXIi+lnc=;
        b=govefViUFe2UNMgzQQBg2oU3HrWD9diciCE7HD7q1qbJYd6ME4MQZ8E8/Tcckop0Rl
         L3ySKG0/VfoCL3izt5kXCd4jHiHQSCUILE0vDlBEbLSP5c7bXXdM+NtowEVdF/je/9NF
         6bxaIUyXvRGrj2ra8z5x0Xg+RlPTEnbz25U5OKcPSpo9dZrIeAKPeQw04WxTFKPdgy4M
         i6k/f605XLS0UJHnL8I4byetRmDnjaNbutiRajGrMgelHz0ts5jQT6GhwLyt6MgNim5T
         Z/uSE8JSnOLXnw2vCQnN4luD8TSerBEc/N8bDR9YStcnchLVxdwQGqJwjX22Xo+5wgmF
         ozdA==
X-Forwarded-Encrypted: i=1; AJvYcCW1ZPG2WVsJzMK/eroNn1k46fyl1zUnJK8OH1IVNM7xPUsBYAc8M/rl4O/HOcB8AaFod/XudJB51+0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzUCIHe1s5C8BXEClc3swtgo7HQ9oWYvmo+21OW5caDD3KoJweN
	gTZCRe4tZ23YAyThENo6VNzb+xTTumiT3OzA1okkBwV03E3NKzjAOv2HaT0Svw==
X-Gm-Gg: ASbGnctbmZPjLmszBXWZVbvkCT3I6NHBv4EOz/MTnDEGlurBLQis3nmTWqfiF9IpK7o
	vhKmOHNhc1py8g0kal2KEOQurIv+eHf7djZMd23Hk4dmfSvoleG6nPq1nXfdMw3bslF9cenCZxi
	9bhMZ32oR3m2tgCAZsd+3W25X7x7daI5+uv55R7zmfF2JMuDLnusaEfYI4V+3q0PaEm58U4D1v5
	8JUjCGpqOEIYJvdhhwFdrvD8bWYRoRWxgdt/vIYWR75ErNRHbDRdsJqsB5RtOVsqC6Kn8q8zLHJ
	Gy45ZsF9GQztYpG+PEUC1/MbAL4E1171C9sOhnbv/M60UdKpusJH3JMR9UFi8vxqz0rwDE/LdOD
	lKlyEflx10bHKovMMMEBHRuABsk8LBjbZT4TE
X-Google-Smtp-Source: AGHT+IFHd8A2Hw/TR1YrbrgH4TYBQepQqVSzp0DYLOCzNUbvB/kRcYSur7Vker0Wz+dj+apwTZjBzg==
X-Received: by 2002:a17:907:cb83:b0:ad2:321d:2726 with SMTP id a640c23a62f3a-ad2321d2b5amr929900466b.38.1747052347997;
        Mon, 12 May 2025 05:19:07 -0700 (PDT)
Message-ID: <5e3a8054-53aa-490f-a60e-44ed34cbc74b@suse.com>
Date: Mon, 12 May 2025 14:19:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] docs: Introduce live patch signing
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250506143218.1782603-1-ross.lagerwall@citrix.com>
 <20250509161846.45851-1-ross.lagerwall@citrix.com>
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
In-Reply-To: <20250509161846.45851-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.05.2025 18:18, Ross Lagerwall wrote:
> --- a/docs/misc/livepatch.pandoc
> +++ b/docs/misc/livepatch.pandoc
> @@ -917,6 +917,58 @@ The normal sequence of events is to:
>   3. *XEN_SYSCTL_LIVEPATCH_ACTION* with *LIVEPATCH_ACTION_APPLY* to apply the patch.
>   4. *XEN_SYSCTL_LIVEPATCH_GET* to check the `->rc`. If in *-XEN_EAGAIN* spin. If zero exit with success.
>  
> +## Signature Checking
> +
> +While loading live patches would generally be restricted to a privileged
> +process in dom0, in certain cases signature checking in Xen may be required.
> +For example, when Secure Boot is enabled live patches need to be verified
> +before being loaded.
> +
> +Xen live patches are ELF binaries but there is no standardized mechanism for
> +signing ELF binaries. One approach used by Linux is to append a signature to
> +the end of the binary, outside of the ELF container. While this works, it tends
> +to be fragile since tools that handle ELF binaries do not correctly handle the
> +signature. Instead, the approach taken here is to use an ELF note for the
> +signature.
> +
> +The ELF note section name shall be `.note.Xen.signature` with note name `Xen`
> +and type `0`.
> +
> +The note data shall contain a header followed by the signature data:
> +
> +    #define SIGNATURE_SUPPORTED_VERION 1

I don't think this is a good name (leaving aside the typo); conceptually
multiple versions could be supported. Otoh live patches are hypervisor
build specific anyway, so it's hard to see why a version would be needed
in the first place. Alternatively should version or ...

> +    #define SIGNATURE_ALGORITHM_RSA 0
> +    #define SIGNATURE_HASH_SHA256 0

... these two be encoded in the note's type, instead of leaving that
effectively unused?

> +    struct payload_signature {
> +        uint16_t version;
> +        uint8_t algo;        /* Public-key crypto algorithm */
> +        uint8_t hash;        /* Digest algorithm */
> +        uint32_t sig_len;    /* Length of signature data */

Should there be a minimum length specified, to ensure security at least
for the moment (before e.g. quantum computers can break things)?

> +    };
> +
> +To sign a live patch:
> +
> +1) Add a new note section with a populated payload signature and zeroed out
> +   signature.
> +2) Generate a detached signature over the entire binary.
> +3) Fill in the signature in the note section.
> +
> +During live patch load, Xen shall verify the signature using the following
> +steps:
> +
> +1) Copy the signature out of the note section.
> +2) Zero the signature.
> +3) Generate a detached signature over the entire binary.
> +4) Compare against the signature from (1).
> +
> +Initially, to avoid including DER / X.509 parsing of certificates, handling
> +chains, etc. Xen shall verify signatures against a compiled in RSA key in
> +exponent/modulus form.

And this is sufficient to satisfy (Microsoft's?) requirements?

Jan

