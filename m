Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F9CC4C344
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 08:57:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158779.1487200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIjFZ-0000JW-3U; Tue, 11 Nov 2025 07:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158779.1487200; Tue, 11 Nov 2025 07:57:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIjFZ-0000H8-0u; Tue, 11 Nov 2025 07:57:13 +0000
Received: by outflank-mailman (input) for mailman id 1158779;
 Tue, 11 Nov 2025 07:57:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJwk=5T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vIjFX-0000H2-OY
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 07:57:11 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0667002e-bed4-11f0-9d18-b5c5bf9af7f9;
 Tue, 11 Nov 2025 08:57:10 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b71397df721so440684566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Nov 2025 23:57:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf407a01sm1297204466b.22.2025.11.10.23.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 23:57:09 -0800 (PST)
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
X-Inumbo-ID: 0667002e-bed4-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762847829; x=1763452629; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+RlQP2cvCnOd+Wo5mKtYktJLrGWk9650R0nBrzw2baY=;
        b=KyWTKWZ/FQSR3bkvKDiiLw/Djow1IQYZ45JYt7O9ckOGLD7hAcCfivu+Qh1mjO5sql
         Zjmo8/qCGwvO4Iv9bIKsrcnMoVIL6bI5wh6tUFCnzUrqH2iHIqdRO1xkQeLpPI6u6fAx
         u2mmNxEmthITzo4/jOHVC3LvQ8/GdEYAEHlgiAnThZ7AQy0yzq6ENOKcOX1DmKNC9jyN
         r0qCDWQtY8m0w5TfNupA+HVpE6P7SYLmdfnftIbEiMaybWoBh30ZrAcSTY9bgQ6kkngl
         dF9jjuuTBzQAY8z1lE9Up+2F1v0fLVnUOo8f4kv7qZM6NkNDQLFQN96PY3mo3x3ON78S
         G59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762847829; x=1763452629;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RlQP2cvCnOd+Wo5mKtYktJLrGWk9650R0nBrzw2baY=;
        b=qOvXvoY/G2ORg+Qybvn9hdKFO5AqR4uONfbQycGfZtQN6j5V784OTSMsOVyimeBE4R
         +71pQNfg/VrXdtHiqH2cfC6S2HsvOjuEQRSO+pu+ot2Nobv7rt/g7uQ+LllZivH8ivvw
         nMo9G10FJ67wLzdZsI7TkI3z9SyaNsvRFQstbDu82IZqKo0pLacb1Q67ZTyoqFct5RqY
         WHc/e+0ONidJvJNs+scPuEKvj86aUAhkF1EmIR4/4w4yvMtHr0nL5vm0Ln7fX0tDXCmp
         XAC8Vv4ZUN8yYi0LAI/N6jtNnFi4gi8qtnhkJqtm80YcECr44Dd+RyFNmdq3UOCPho1g
         exag==
X-Forwarded-Encrypted: i=1; AJvYcCXPqemwjJjxYZmSdtb6JdegoJCKN7YwXZ0UZlexvqN2E8l7a2SElYX5brOODXwzsMlgB8R9QFoibg8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwChB41mE51DjCxUZgdjbtipmdhADwGO/tPIBvjvMeACsPuont2
	axwhcqHkbXXwOfKLd2QVJ7SBoDnhE34/3QJsM44jSj33UyW0CcEfXiwf3uGc5F9aWA==
X-Gm-Gg: ASbGncsXeyzIOkKK8Smab68n/MQvlsS2xQ0qdwFc5MWtfu0T5jRkFD0pUaXluZ/dT7v
	zKCNTzXo9mNMuUXC0n2IjjJWrkD8+BW/ENljMwv12aRNtue6/0rleiil2ks/AHWlAW8bWh+5uMd
	5YOV7uYpTn4E1bDGKaMDwQ9kbD0pG1P/WSiofv1uMUzkFZK57up+luEsVoZKq6xj1YF+eRXj9VR
	XGHteXwVhBzpbqhtNT0gvBbv8LKbUoSnDkR8gmRrSMsmliuszHoV+pNJDDqI1qDxa+J5tfqtmwY
	OUYkqOf3V5qsOAZ0dNyxOl1z7yEW81lxidlF9zEY5xfMs4GatNTTLqp696JM/K+TP8cy9dxs8lU
	G7xGCKvnIV3ELGWCgxL6fhVcNlA9q2+30kaUK9N4cYKWA4qOJVqViQ3rLAeRCio0F8RKYfmlHr6
	OvYBSaJAbPH89RSLKbzb1dj/bJv7FpuNYd2b45LB3+dyvS5AuDUc5JfgPf/EoL20wn7ECzf3WGM
	c4=
X-Google-Smtp-Source: AGHT+IHqhdnPYLfomifchMVb3SbhFefafO8Q9uxvvY5rsVCEdZNCai3J+Rsgjhg7n8JndwxkxbZ2dg==
X-Received: by 2002:a17:907:a0c8:b0:b70:50f1:3daa with SMTP id a640c23a62f3a-b72e053a7f4mr1147872766b.57.1762847829388;
        Mon, 10 Nov 2025 23:57:09 -0800 (PST)
Message-ID: <b0f84506-f299-41d7-b888-606c8c45b99d@suse.com>
Date: Tue, 11 Nov 2025 08:57:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen: Support LLVM raw profile versions 5, 6, 7, 8, 9,
 and 10
To: Saman Dehghan <samaan.dehghan@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wentao Zhang <wentaoz5@illinois.edu>,
 Matthew L Weber <matthew.l.weber3@boeing.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <06646f747f21c3f388cf6e9d59a20238a4a91170.1761263588.git.samaan.dehghan@gmail.com>
 <6f708273afb6de9c5f26f2c71c34c98e957904a0.1761599320.git.samaan.dehghan@gmail.com>
 <b701374d-61b4-4657-bd01-4c6975741fbd@citrix.com>
 <ed198b16-f15f-40f2-ae38-85292e52dad1@suse.com>
 <CAHFNDNjcUYC2AiU12eifOeqAbveAqCGHX6+=2oE15-bQ8NzjGw@mail.gmail.com>
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
In-Reply-To: <CAHFNDNjcUYC2AiU12eifOeqAbveAqCGHX6+=2oE15-bQ8NzjGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.11.2025 22:26, Saman Dehghan wrote:
> On Mon, Nov 10, 2025 at 8:03 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 27.10.2025 23:36, Andrew Cooper wrote:
>>> On 27/10/2025 9:30 pm, Saman Dehghan wrote:
>>>> This change enables compatibility for measuring code coverage
>>>> with Clang versions 11 through 20 by supporting their respective raw
>>>> profile formats.
>>>>
>>>> 1- Added support for LLVM raw profile versions 5, 6, 7, 8, 9, and 10.
>>>> 2- Initialized llvm_profile_header for all versions based on llvm source
>>>>    code in compiler-rt/include/profile/InstrProfData.inc for each version.
>>>> 3- We tested this patch for all Clang versions from 11 through 20
>>>>    on x86 platform.
>>>> 4- Fixed linking warnings related to LLVM profile sections in x86.
>>>>
>>>>
>>>> Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>
>>>> Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>> Tested-by: Wentao Zhang <wentaoz5@illinois.edu>
>>>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> Changes from v3 to v4:
>>>>   1- Use LLVM_PROFILE_VERSION in preprocessor conditionals
>>>>      instead of __clang_major__.
>>>>   2- Use DIV_ROUND_UP helper.
>>>>   3- Remove unnecessary zero initialization inside struct.
>>>>   4- Remove fallback macro definitions in linker script.
>>>> Changes from v2 to v3:
>>>>   1- Additionally support raw profile version 5, 6, 7 in clang 11, 12, 13.
>>>>   2- Fix coverage related linking warnings in x86.
>>>>   3- Revert unnecessary type changes, casting, etc.
>>>> ---
>>>
>>> Excellent.  Thankyou.  This all looks in order.  I've committed it.
>>
>> I thought I would backport this, but I would need a variant that wouldn't
>> regress profile version 4 on the older branches
> 
> Thanks Jan for offering to backport this. Which target branches do you
> have in your mind?

The two ones in general maintenance, 4.20 and 4.19. I expect a single patch
will do, i.e. will apply to both equally.

>> regress profile version 4 on the older branches
> 
> Do you mean some of these branches are still using clang < 11 so that
> we need to adapt our patch accordingly? Let me know how we can help.

Well, the introduction of 11 as the baseline requirement did happen in the
4.21 dev cycle. Prior to that, 3.5 was the baseline. As we only had support
for profile version 4 (Clang 3.9 onwards as it looks), only that version
would need covering. Of course, if other versions could be easily supported,
that might be fine as well. Yet this isn't a requirement at all.

Jan

