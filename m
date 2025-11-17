Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A29C65384
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 17:43:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164192.1491200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL2Jp-0003je-E3; Mon, 17 Nov 2025 16:43:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164192.1491200; Mon, 17 Nov 2025 16:43:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL2Jp-0003hU-B3; Mon, 17 Nov 2025 16:43:09 +0000
Received: by outflank-mailman (input) for mailman id 1164192;
 Mon, 17 Nov 2025 16:43:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vL2Jn-0003hO-GS
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 16:43:07 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7da2727a-c3d4-11f0-9d18-b5c5bf9af7f9;
 Mon, 17 Nov 2025 17:43:05 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b7373fba6d1so445856366b.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 08:43:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fd7f37bsm1100532766b.35.2025.11.17.08.43.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 08:43:04 -0800 (PST)
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
X-Inumbo-ID: 7da2727a-c3d4-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763397785; x=1764002585; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IjRdqVHf7CGvQFRplILXqdPk5vr+nqbPupMgIVWk79w=;
        b=eFg1Q0ArPv9qEHEO2nciv8nuqU7iTAlEcSuOvdYA1UvXadgM/vHYjg/cSzMr9P4FWP
         R5jeIt61HvqxKghU50o7VE54y7mbV70eyzNOKcJZWWKZIn2HLR2tdaJ5NKVQA/6221Dq
         CA2gSjDW3t1R8qRw35pdddu5OHNNnBe6KZ5f02X8nX5rD+3Mdql809C8TAGt6bFr2B//
         t2pKRYd32mrdmckCW935mJKxWb6vg+/w0x1lsuz20tSdGVWy5f21jlbFFgHWFYCD9fb3
         YZO93ou+UqZ/26iS8Wo66ZbwKCjSQhrXn/Ml5Tjvk+l3dm1Vdx/D8wWb/6Vk5Z7mjw0e
         QBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763397785; x=1764002585;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjRdqVHf7CGvQFRplILXqdPk5vr+nqbPupMgIVWk79w=;
        b=BdSejerIpPODDSAD1QAODOi/kAa9udNWiYDFwsOkm4S79Scfrygf7oauoOMno21YBa
         dSmI2BD0cOcKOtvzhl9savq0vgC4+aNGE0YrABVC0MS/kigDyH4HWosfrOwItt8CcDGR
         PzNOYvbfGbgvKU7CUbKreTuTvf3AkMt/MuxlB9MTrDSLURH4r8dToE93Ha5Zv52EcBvG
         qrHjwJqztj4BZqFVagYKfCbwTDAK3r2FS2nDmXVMFS1N55zV6Dmg7GCfmcaU/a7vfHUI
         S3T4ti/4/CEbKSvdW3EdRR0kWVpZ+ExI8z5vAxhELNTi84D8Y/Dm/PGo6W8pLNybVEKz
         i3DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlqspkIbCVsZY06y5JILg7xjk5tsGX6BV5p7BKhO8Fu5nPzMyMkFLFB0jTh4NI/cDIWHMe3Fi4+a4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1i6JXVdmcXo2JdW9FUPFn0mgTLTS8xNiQrIFsY69qtrLzeSas
	OmDe+C3ya7mgJHcThkH5vHZjmuXRWjelVMQxox936sDIUgU4PvgcQKXV4ZwqVqiMh5QwGd5pPOu
	+yxg=
X-Gm-Gg: ASbGncs+dyxUHq4P7QcMB2ACYd9CkaX+VxwcXgr/4ESMk+kMbC8TQj5N2dybqHhdc2I
	LSPK99ReF8ycm7n4OFPFHbuWLLF+nV5SAxtbF+qkUF6h0ODDOeXzVeN5hApcgRTqYltReEGB28o
	LZLmcoLXw5eADSDq1vxkmj6jXFkwakATUv2hU/D8QMe1SUDYGSXwTBr0FDpgS9+bjSpjGZWvOd/
	O18Fs8zfm5zeTYU80piFyDzzyYK6QAwOmPSTVpuD0OCewqr7b5vULlKwrEjWYV09224diDqQ/39
	jmpJk0pCVITEUZrP21Wg2dRgEeshuEmdmzEyLRtvAEsWzY42RBTGPfmxwniMlCrP2OmaVI5g3sP
	zgGDUn07yLcZKogUGDyA4kGMjPjmJxhhk+k7XR2oZAhehCQ13d16fhA65nJ/GNKiSIZAVvszB1e
	UEsK/w6DWcQbce/ZVFQTSvG7knu3pzW9IPfgUM2sDdvyXpbLF7viGiiD1XA3nkZvLuZddmgvu8L
	4GIYpj7RSJKUw==
X-Google-Smtp-Source: AGHT+IEAKfRlt99Z3CAEFxgNqzWtkgqsDI+CZiJ0JlmBpb+CsToKYPc+slOOLNFit9eFw5Xw0oYZUg==
X-Received: by 2002:a17:907:6d08:b0:b72:aa52:6034 with SMTP id a640c23a62f3a-b73678969c0mr1289987766b.21.1763397785150;
        Mon, 17 Nov 2025 08:43:05 -0800 (PST)
Message-ID: <11c3929a-977b-4ef8-aaaa-9aea01657b04@suse.com>
Date: Mon, 17 Nov 2025 17:43:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v4] xen/x86: guest_access: optimize raw_x_guest() for
 PV and HVM combinations
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251114140117.270461-1-grygorii_strashko@epam.com>
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
In-Reply-To: <20251114140117.270461-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.11.2025 15:01, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Xen uses below pattern for raw_x_guest() functions:
> 
> define raw_copy_to_guest(dst, src, len)        \
>     (is_hvm_vcpu(current) ?                     \
>      copy_to_user_hvm((dst), (src), (len)) :    \
>      copy_to_guest_pv(dst, src, len))
> 
> This pattern works depending on CONFIG_PV/CONFIG_HVM as:
> - PV=y and HVM=y
>   Proper guest access function is selected depending on domain type.
> - PV=y and HVM=n
>   Only PV domains are possible. is_hvm_domain/vcpu() will constify to "false"
>   and compiler will optimize code and skip HVM specific part.
> - PV=n and HVM=y
>   Only HVM domains are possible. is_hvm_domain/vcpu() will not be constified.
>   No PV specific code will be optimized by compiler.
> - PV=n and HVM=n
>   No guests should possible. The code will still follow PV path.
> 
> Rework raw_x_guest() code to use static inline functions which account for
> above PV/HVM possible configurations with main intention to optimize code
> for (PV=n and HVM=y) case.
> 
> For the case (PV=n and HVM=n) return "len" value indicating a failure (no
> guests should be possible in this case, which means no access to guest
> memory should ever happen).
> 
> Finally move arch/x86/usercopy.c into arch/x86/pv/usercopy.c to use it only
> with PV=y.
> 
> The measured (bloat-o-meter) improvement for (PV=n and HVM=y) case is:
>   add/remove: 3/8 grow/shrink: 3/89 up/down: 1018/-12087 (-11069)
>   Total: Before=1937280, After=1926211, chg -0.57%
> 
> [teddy.astie@vates.tech: Suggested to use static inline functions vs
> macro combinations]
> Suggested-by: Teddy Astie <teddy.astie@vates.tech>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

I would guess that this R-b would have needed dropping, ...

> ---
> changes in v4:
> - move usercopy.c into arch/x86/pv/
> - rework to always dynamically check for HVM vcpu(domain) by using is_hvm_vcpu()
>   as requested by Jan Beulich

... with at least the latter of these two changes.

> --- a/xen/arch/x86/pv/Makefile
> +++ b/xen/arch/x86/pv/Makefile
> @@ -14,6 +14,10 @@ obj-y += ro-page-fault.o
>  obj-$(CONFIG_PV_SHIM) += shim.o
>  obj-$(CONFIG_TRACEBUFFER) += trace.o
>  obj-y += traps.o
> +obj-$(CONFIG_PV) += usercopy.o

Just obj-y with the movement.

However, is the movement (and was the adding of $(CONFIG_PV) in the earlier
version) actually correct? The file also produces copy_{from,to}_unsafe_ll(),
which aren't PV-specific. This may be only a latent issue right now, as we
have only a single use site of copy_from_unsafe(), but those functions need
to remain available. (We may want to arrange for them to be removed when
linking, as long as they're not referenced. But that's a separate topic.)

Jan

