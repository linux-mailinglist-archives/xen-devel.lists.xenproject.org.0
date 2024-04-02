Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A938953FA
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 14:55:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700120.1092751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrdfA-0005Cb-Id; Tue, 02 Apr 2024 12:54:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700120.1092751; Tue, 02 Apr 2024 12:54:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrdfA-00059q-FG; Tue, 02 Apr 2024 12:54:52 +0000
Received: by outflank-mailman (input) for mailman id 700120;
 Tue, 02 Apr 2024 12:54:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hiiI=LH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rrdf9-00059j-GJ
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 12:54:51 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f56cc0d-f0f0-11ee-a1ef-f123f15fe8a2;
 Tue, 02 Apr 2024 14:54:47 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4161eb1aa1fso1073845e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 05:54:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 u22-20020a05600c139600b00414906f1ea1sm17770718wmf.17.2024.04.02.05.54.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 05:54:46 -0700 (PDT)
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
X-Inumbo-ID: 2f56cc0d-f0f0-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712062487; x=1712667287; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eknjOBB2PMJ+HupsDO9jp+LC4BS6OyB3CgBI8NRPLEY=;
        b=FOJtON2Cjb04K86bW1OEt76Jj/8Hve3EPUpAYd+E17/mJXGPhiPHkXjV1iiBoq/W0G
         9K2hMswMCizHDaw3RuhkVVSA+OYb5CaB4hlw/Lse79pgAnL+OSv2gNEntdViCtNu87Wp
         +S18+UIDPg2G/UOWp9tkT1ExX5TMofxKx1YXoh+gIS4Y/vetvF9IIncpf8UIj77puZkh
         9mrztxU431LKtciOd/hIDc7bvHIlPWnDkKkZedp2MVj5MosR75+qwcBwNHXsr5mmrCok
         QcAW1pMU+MguvnOaZXLtn3IyUeSlAUCWhYN5+i0vhFO/siVz1W9WcCRXXwTpWwRKwquM
         5SVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712062487; x=1712667287;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eknjOBB2PMJ+HupsDO9jp+LC4BS6OyB3CgBI8NRPLEY=;
        b=qGL56gvWqB6mauJ5/+cPr+CqyZbnHi561ZMvAx7bGg2h7E6Vo5+x8yUAbMqZFzhpHZ
         RrpampBckTmL9wvnxiVMiQFZn01cwP2ExubjA+OBzSgi1xOj7GaBZdid/tdRIk6iKEgg
         VQZipXgNPHEdb+pUroNRUk/Rkk8ouYKKWl7XxMvbFaNxqFe0crm7qM+R6MLa59oriz9o
         Buu9d25lgN1dJB5oUr4YzzbqD3Bih5bil7mBothn7M59e7yjVxjmry0OK0WDA52jsFNo
         8FJ+3hn0WtgYeVGIw5wvxw8aJo1LE746ztNV+Y2CfgbGw5YrAI0KUfqKQQtaqHhDlMmk
         u5jw==
X-Forwarded-Encrypted: i=1; AJvYcCX8lplsyswXzvrgGhozwWLEW38iIjHjBTXBi2XqBM8OwmtC5Ymmo26bo9BZFZTCPixnZlXuQarB68R8DLWt+Dg3G19AYClZHXbVwmdWrBQ=
X-Gm-Message-State: AOJu0YxdPEqWZAfZAmmUt1xooDmFfC5SDezA/2tORAnnh32YvfGD8bvG
	X/uZyQe4kIDzCQK+maZ63Soc7+qWWqiX7dWva12pTQP9EyGU7jTZdZEccvzmRQ==
X-Google-Smtp-Source: AGHT+IEk7MLczKWxtB+fPwci9u2gdKFUzzxNlXx3jXys+BP6P8imMAP1XWSZdQ4RvzAKbW3jpD2toA==
X-Received: by 2002:a05:600c:5710:b0:414:9103:e38c with SMTP id jv16-20020a05600c571000b004149103e38cmr8387656wmb.22.1712062486798;
        Tue, 02 Apr 2024 05:54:46 -0700 (PDT)
Message-ID: <76fa325b-2074-438f-a953-f2ed4a23fcb3@suse.com>
Date: Tue, 2 Apr 2024 14:54:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/20] xen/riscv: introduce cmpxchg.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
 <bf65ce1ff5f683cc6b638fa7de0c54d5e0aead33.1710517542.git.oleksii.kurochko@gmail.com>
 <6f73368c-ea73-4d86-a6a1-8f9784c4b01f@suse.com>
 <87a51cb7a2d663f292ccddbba78e41fd6a1c12db.camel@gmail.com>
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
In-Reply-To: <87a51cb7a2d663f292ccddbba78e41fd6a1c12db.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.04.2024 13:43, Oleksii wrote:
> On Thu, 2024-03-21 at 13:07 +0100, Jan Beulich wrote:
>>> + * If resulting 4-byte access is still misalgined, it will fault
>>> just as
>>> + * non-emulated 4-byte access would.
>>> + */
>>> +#define emulate_xchg_1_2(ptr, new, lr_sfx, sc_sfx) \
>>> +({ \
>>> +    uint32_t *aligned_ptr = (uint32_t *)((unsigned long)ptr &
>>> ~(0x4 - sizeof(*(ptr)))); \
>>> +    unsigned int new_val_pos = ((unsigned long)(ptr) & (0x4 -
>>> sizeof(*(ptr)))) * BITS_PER_BYTE; \
>>
>> You parenthesize ptr here correctly, but not in the line above.
>>
>> Instead of "_pos" in the name, maybe better "_bit"?
>>
>> Finally, here and elsewhere, please limit line length to 80 chars.
>> (Omitting
>> the 0x here would help a little, but not quite enough. Question is
>> whether
>> these wouldn't better be sizeof(*aligned_ptr) anyway.)
> 
> I'm unsure if using sizeof(*aligned_ptr) is correct in this context.
> The intention was to determine the position for the value we're
> attempting to exchange.
> 
> Let's consider a scenario where we have 0xAABBCCDD at address 0x6. Even
> though this would result in misaligned access, I believe new_val_pos
> should still be calculated accurately. Let's say we want to exchange
> two bytes (AABB) with FFFF.
> 
> With the current implementation, we would calculate:
> 0x6 & 2 = 2 * 8 = 16, which is the value on which the new value should
> be shifted.
> 
> However, if this value is then ANDed with sizeof(*aligned_ptr):
> 0x6 & 4 = 6 * 8 = 48, which is not the expected value.
> 
> Am I overlooking something?

I'm afraid I can only reply with a counter question (feels like there is
some misunderstanding): Do you agree that 0x4 == 4 == sizeof(*aligned_ptr)?
It's the 0x4 that the latter part of my earlier reply was about. I'm pretty
sure you have, over the various reviews I've done, noticed my dislike for
the use of literal numbers, when those aren't truly "magic".

Jan

