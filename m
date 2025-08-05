Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57252B1B700
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 17:03:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070578.1434184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujJBh-0006m0-H1; Tue, 05 Aug 2025 15:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070578.1434184; Tue, 05 Aug 2025 15:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujJBh-0006is-E0; Tue, 05 Aug 2025 15:02:49 +0000
Received: by outflank-mailman (input) for mailman id 1070578;
 Tue, 05 Aug 2025 15:02:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujJBf-0006gv-PL
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 15:02:47 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3eb969de-720d-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 17:02:46 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-615756b1e99so6797563a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 08:02:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8feaf2fsm8518276a12.38.2025.08.05.08.02.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 08:02:45 -0700 (PDT)
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
X-Inumbo-ID: 3eb969de-720d-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754406165; x=1755010965; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R9riBH9SDWMGad/w+P2+OiUlMix4MWymTMwpITxxLzs=;
        b=NcbfVMqmIelV95fQfd/k+n/hp6D/bhF3ABfqc6xzyAnSj+APYkDLyR5cZ1CDsyhvJG
         JO4yx7pkG087eNdp/Wl8TEletlKCp4G0EEcelvHfvV42moJF1SbTC55I77KgsQh1zJEz
         OYeWfbmzWwh56kvhPqZ98mFTth8Ar3MERcDpiuXH8Znd11Es06VNPbP5rJTeQVcaQD/a
         e3laSau7g/jv3JoHgwK5UwHZwVwUKQS4cIWKsfxJld6sSN4RHKDQjWJQUZml/zQVx291
         0rYpiQ9fP/A9fquWvlBxVGX1yZIRYCkGaEnxfOFFw0OAO2OOhSnoWayVMym5w42T6l6m
         mcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754406166; x=1755010966;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9riBH9SDWMGad/w+P2+OiUlMix4MWymTMwpITxxLzs=;
        b=fBYYDeL4+JKxDDpWvWCl3kpRinh6hRAlKv2eTmtz60A9LHJJT0cMqc6gD/02Mihpt7
         xDrq6JPok+URW6WKoeSG8XOy+I4c1VAP1c/TXZSb1BZcE0gpK9eA1+xSOClLIbKXg6An
         z7ZUGcY+FGTN+AzB9GSXEAgStJR5vZCaGjmVTF4Thb28atWp34c0qF4dy9uauYAXkNq6
         r9Gfye1hw1bTopXTaCJERtGAI/6ps8t6Zho0VSmwnxdmIbrPyyDod4LDAZCgZDqv5Efm
         xZUWaZx8YPCYbGugfvbtwG/zeDAKVxzUOKfSiK35D0QUD+VL9Res4iBQCxGprYbVTgfT
         df5w==
X-Forwarded-Encrypted: i=1; AJvYcCWRZNOKhha6bCfFMFBIbMBxm3UY/DopnzZCMnxEhDuO3iRnx2GoICxO4Swp1+Y+OjwsaNl17iZ0VYs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxPyaSfvt77OBIrfHjF+QaMNozxpaV2Xn68hMzdYmGywVkvxxbt
	BtPdDOQJdC9IQ0hJa/lY34yEevyeSdeflrhoDfzvk8fhXQ60Mhs3XOOFq/STgG9t6A==
X-Gm-Gg: ASbGncsEiaXWeqLxZmtc5tY7Zj+iVGL7GM/V1rfiIiWG2JKNIC2mR+s8tsTIIVN6AD8
	ZqGX7vrbLjAUnwfOprowwkzRIXlVLfRWqgD/bGY1oxE06efbpL0p2F2rJREG9uAFFkVROS1qAH+
	9vN8BPb+cxZzHH1EvVQK4/xyRc/2xSmYZtE6gwXQNuw7EPeWeh0JFn4GDyNKSuF6NnvQWAk4Eyt
	VGEmKis6U5vPviFBO2ObFHQqKoCjT8bAI53GpxfG3w67w1Cjbun6Trw68mmNvXHe+dQHaCakfHo
	HG3tYe2bhx5Lw5w21uhvBiAWfE6rCKUSBRbaeEBIYyCJaB9G8qx7q+cEsQwOvmse89z66jq05uh
	Q2HWwDYyYE5XaluXSTyvgn6lWsd2d1Ti5w+2ALW1ZB1jSZJRsfZ/8PgVp4n3DWQlPKn16DKQ8oI
	nNgXh2m5U=
X-Google-Smtp-Source: AGHT+IHFNozQVxfxZFqwcLyF62VoMgBDJ+xaKNweKJAmM1YVAnjcao1Vn+5GtPZZvKHUp7/OKdZDVg==
X-Received: by 2002:a05:6402:50cc:b0:615:cb9c:d5a2 with SMTP id 4fb4d7f45d1cf-615e7186fc5mr11200256a12.18.1754406165537;
        Tue, 05 Aug 2025 08:02:45 -0700 (PDT)
Message-ID: <d1cc3bea-b247-4704-9b69-e5d2c81cb587@suse.com>
Date: Tue, 5 Aug 2025 17:02:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] pdx: allow per-arch optimization of PDX conversion
 helpers
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250805095257.74975-1-roger.pau@citrix.com>
 <20250805095257.74975-5-roger.pau@citrix.com>
 <c077b195-171f-458e-b8df-644b37d50dfb@suse.com>
 <aJITOc6LSUULdxYQ@macbook.local>
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
In-Reply-To: <aJITOc6LSUULdxYQ@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.08.2025 16:20, Roger Pau Monné wrote:
> On Tue, Aug 05, 2025 at 02:11:22PM +0200, Jan Beulich wrote:
>> On 05.08.2025 11:52, Roger Pau Monne wrote:
>>> There are four performance critical PDX conversion helpers that do the PFN
>>> to/from PDX and the physical addresses to/from directmap offsets
>>> translations.
>>>
>>> In the absence of an active PDX compression, those functions would still do
>>> the calculations needed, just to return the same input value as no
>>> translation is in place and hence PFN and PDX spaces are identity mapped.
>>>
>>> To reduce the overhead of having to do the pointless calculations allow
>>> architectures to implement the translation helpers in a per-arch header.
>>> Rename the existing conversion functions to add a trailing _xlate suffix,
>>> so that the per-arch headers can define the non suffixed versions.
>>>
>>> Currently only x86 implements meaningful custom handlers to short circuit
>>> the translation when not active, using asm goto.  Other architectures use
>>> generic macros that map the non-xlate to the xlate variants to keep the
>>> previous behavior.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Once again:
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks, I didn't carry your RB due to the changes requested by Andrew,
> that was a bit too much to carry a RB after those.

Of course, and I didn't mean to suggest you should have kept it. All I
wanted to indicate is that I'm as okay withe change as I was before.

Jan

