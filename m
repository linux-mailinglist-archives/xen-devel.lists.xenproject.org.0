Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA4D95984C
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 12:49:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781020.1190596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgito-0004Mg-J9; Wed, 21 Aug 2024 10:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781020.1190596; Wed, 21 Aug 2024 10:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgito-0004JV-Fo; Wed, 21 Aug 2024 10:49:08 +0000
Received: by outflank-mailman (input) for mailman id 781020;
 Wed, 21 Aug 2024 10:49:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YIGS=PU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sgitn-0004JP-Jo
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 10:49:07 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fce89cb3-5faa-11ef-a508-bb4a2ccca743;
 Wed, 21 Aug 2024 12:49:06 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-36d2a601c31so3775946f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Aug 2024 03:49:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838c6639sm879469366b.7.2024.08.21.03.49.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 03:49:05 -0700 (PDT)
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
X-Inumbo-ID: fce89cb3-5faa-11ef-a508-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724237346; x=1724842146; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kFo3kgOHIZaKxlPsuAiXF8iQEX4Mppv0LsyhGCyFelA=;
        b=fkwviruJdaM+WosTkJ9+FrWlhQlnCtNf81n76MjBuKGI4myC7X1sYiGLGgrMJ4AIgf
         aregrEXmulTPyL2e0molkg80DNa6RPR2OpAT33INh0PiOowRaJCW4by8xUazIgkT66Kh
         Qja+q9QMA3r3ZB4sMcMIkIB9DBg9c1UBDGt3LV2QVug8MMInqQLzwc9fXAFQGtL0OJfQ
         OmCGh6sH1X6T5UBolYAJVAX5OB2UTTPdSJAHRomJx6+MRY631y8HpH+SfxunecAuS9Pd
         HVc/ObQnmzvCy1nNecX9WaUB04DhS8OOeGnMDm7SOWFNO4F69R6wyKTYlplRrvc/xHBc
         aGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724237346; x=1724842146;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFo3kgOHIZaKxlPsuAiXF8iQEX4Mppv0LsyhGCyFelA=;
        b=FKHwYAbOl4hb3KiZK+3ZyRWNwDZlgYhp68ejYYMVCRgPnwgnZ9rWpGz/GSylRR/IJf
         skwCntQIIc+vttkLjwL0zM1Ft6BuOFE8Vgp4vJ9pOepCY7Qjocv9zYti+YoMvd7iMSqt
         9G679ZpT4iZ0dDNPvyEBYHtHVkhaCJUmsL2klPQNh8NOun+Usqh5OWflbpffDnE7cULr
         hRn3BQRSopmW5d7i3yks0m9cDr3Z4VEbT2Mlm/BLDWyPwPuNRjkUCVcSEKVtAmchnoxl
         Db6RVLgXW72+3hg2EJ2B4xr6NTuUb+vxtv3sAOGFH7THIA7oyd2ltbrQzrSvUM5Oni0R
         AB/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUyGARwhZqk3ikZWQ4Y7QkWAHqcfywCjB0APhSIpwKADL3EbSyhbHQDO+jXYEK366NcSGQUFVO4NuE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1m1084Cf4NpFkNix6/TqCjPjyZ7mW74vLHg/HA8uLeeduekRS
	8M7oXXdyhf31dyrAWwuhB9QVdNb6MMGIm+mjsteFE9UTkqvByaRe2ZOG+CY3pg==
X-Google-Smtp-Source: AGHT+IHrGVFgWKgxpkzOfs7aytxZ0igOIfroS4ImOEp9hGCya4BiutW3tV4HuvJR6IP8BOZq5rgNHA==
X-Received: by 2002:a05:6000:1fa9:b0:371:8319:4dbd with SMTP id ffacd0b85a97d-372fd6d6dfbmr1459893f8f.17.1724237345790;
        Wed, 21 Aug 2024 03:49:05 -0700 (PDT)
Message-ID: <f6e6c550-7f8a-4c00-b6a9-c6362df1f1a2@suse.com>
Date: Wed, 21 Aug 2024 12:49:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: set (fake) operand size for AVX512CD broadcast
 insns
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fb917afb-62d1-42f0-83e6-276cae67569d@suse.com>
 <487bf692-ebd8-41ce-96b0-d4034bdfcef9@citrix.com>
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
In-Reply-To: <487bf692-ebd8-41ce-96b0-d4034bdfcef9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.08.2024 12:35, Andrew Cooper wrote:
> On 21/08/2024 10:28 am, Jan Beulich wrote:
>> Back at the time I failed to pay attention to op_bytes still being zero
>> when reaching the respective case block: With the ext0f38_table[]
>> entries having simd_packed_int, the defaulting at the bottom of
>> x86emul_decode() won't set the field to non-zero for F3-prefixed insns.
>>
>> Fixes: 37ccca740c26 ("x86emul: support AVX512CD insns")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> This is the second such patch.

Indeed. The first one was a result of me doing some AVX10.2 work,
covering new similar insn forms. That finding then prompted me to do
an audit, resulting in this 2nd finding.

>  Does that mean there should be an assertion somewhere?

Not an assertion, as there actually is a check already:

    else if ( state->simd_size != simd_none )
    {
        generate_exception_if(!op_bytes, X86_EXC_UD);

That check is what is causing emulation to fail when op_bytes isn't set
ahead of trying to invoke a SIMD insn via the shared logic near the end
of the function. I don't think it needs to be any stronger than that.
The reason this wasn't noticed so far is merely because no testing we
have in place ever exercises these insns. Which is a shortcoming, yes,
but one that's not very easy to overcome (as in: if we wanted to, that
would likely mean writing quite a bit of new testing code, to cover
everything that isn't covered right now).

For insns not accessing memory the value actually isn't needed / used.
An alternative might therefore be to move that check into the OP_MEM
conditional, and drop the fake setting of op_bytes (there are a few
more similar to the one being added here).

Jan

