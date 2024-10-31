Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E769B79FA
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 12:48:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828645.1243627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Tey-0000hr-Vm; Thu, 31 Oct 2024 11:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828645.1243627; Thu, 31 Oct 2024 11:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Tey-0000fY-Sw; Thu, 31 Oct 2024 11:48:16 +0000
Received: by outflank-mailman (input) for mailman id 828645;
 Thu, 31 Oct 2024 11:48:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zW4/=R3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t6Tey-0000fS-Bz
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 11:48:16 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0238aadb-977e-11ef-a0c3-8be0dac302b0;
 Thu, 31 Oct 2024 12:48:13 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-37d5aedd177so630037f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 04:48:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c113e69fsm1872533f8f.69.2024.10.31.04.48.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 04:48:12 -0700 (PDT)
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
X-Inumbo-ID: 0238aadb-977e-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmQiLCJoZWxvIjoibWFpbC13cjEteDQyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjAyMzhhYWRiLTk3N2UtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMzc1MjkzLjM4NzY5OSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730375292; x=1730980092; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DMCDBOWUI09z9Jlcqj1rkmnaoRWuUUDa5AthHtb0/4g=;
        b=AdWct1dPpHz11R/HRX48+Q8CkRH01icCO+1BRNo808+LylfdNAo9goBaAcEZiYzdWz
         so7cpHhuIMH/1NqfXJWia4eJfunknrBWcdR20t5Bje1dARBRlttLiGzWd/g+GuU8WOqs
         wHz30sZOEmtpOwFVVjpxrPqF5miVI4nlrjxwfZLJvgcmaRXVv7zPvzKpZ2Lw3klBDgyA
         KZPXAp90YqXSkVIrq37+wCIekE4EaBU92ET34pbxU4DPdUsoqQMcUwsOQMTr+ykav5FN
         igF0gygGKtrffwqhkzwX91+Pj+D9hgGNGz7w49GRdHljjMZF6lpoMp7SDA1OZ3PCT9X3
         UaQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730375292; x=1730980092;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMCDBOWUI09z9Jlcqj1rkmnaoRWuUUDa5AthHtb0/4g=;
        b=wF0lsNuUsQc7pV4YJ/0QxQI/USsVj01reYxdeCccYmfRcP7NV3LE0AsGf5Q0kpJMk0
         T6YXxFCNSOxKMcPJKgbhLunRF25XUdYwtcuoYVGeGIcDH8M+vN4wD54ErJxyLKH7oAAd
         tXUQI7A8fD9x0bFcnR82ICN9M9d5MtX6v9zxnPLb3DcKVbplXom6MaSiXhcqAxwz+tAe
         djdNg7NJ+HqHhnfSQxVAcyOL+Fh5GlblMBtH9NoHrGxY/U1hXDRR9hJLjIqUginWhiX1
         xzsX2dZNRs2VS4kffjN/lsEOEU7GOu29zGLvd720DpinS5sqNyfCTen+mv4y0/lae1Hg
         /SQg==
X-Forwarded-Encrypted: i=1; AJvYcCVGE3RyPfmebVzISEYL175GAxfjr1o4vLHsoBcw4v+trXx9+gFZBLyORSYVGA0DTfhGFr9Td3cShmA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLggf7rG1xBv2VgcjSGYuyNqPyXDbHo8/u7OeXk7/jHcAVxnKs
	4Vpj9vGQuW3tN3cFmQqbdmU9B2nKmAGjIvvcHAVQ0h10ulOP3lZKQ745kfCQ2A==
X-Google-Smtp-Source: AGHT+IGKsLVZWcRBvVB3pSbJ8xbFqJKGocXFtnHwV+7s/ZNk4YdvYbJthu0dbptM1UKhAq/LJNMeBQ==
X-Received: by 2002:a05:6000:188f:b0:37c:cd71:2b96 with SMTP id ffacd0b85a97d-381be906966mr2389533f8f.36.1730375292627;
        Thu, 31 Oct 2024 04:48:12 -0700 (PDT)
Message-ID: <6aa697a2-a0bf-4135-89ee-8c2c2f0e0fcf@suse.com>
Date: Thu, 31 Oct 2024 12:48:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: ensure L2 is always freed if empty
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241030114852.55530-1-roger.pau@citrix.com>
 <90996cfa-1c41-4113-846c-eade5c849104@suse.com>
 <ZyNdxj8XMV7OIjdN@macbook.local>
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
In-Reply-To: <ZyNdxj8XMV7OIjdN@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.10.2024 11:36, Roger Pau Monné wrote:
> On Thu, Oct 31, 2024 at 10:59:36AM +0100, Jan Beulich wrote:
>> On 30.10.2024 12:48, Roger Pau Monne wrote:
>>> The current logic in modify_xen_mappings() allows for fully empty L2 tables to
>>> not be freed and unhooked from the parent L3 if the last L2 slot is not
>>> populated.
>>>
>>> Ensure that even when an L2 slot is empty the logic to check whether the whole
>>> L2 can be removed is not skipped.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>>> ---
>>> I've attempted to find a Fixes tag for this one, but I'm afraid there have been
>>> many changes in the function, and it's possibly the code that introduced the L2
>>> freeing (4376c05c31132) the one that failed to originally adjust this case.
>>
>> Yes, that looks to be the one. It has been a long while, but I think it was
>> (wrong) similarity considerations with the corresponding L3E handling (near
>> the top of the main loop) that resulted in me not touching that "continue".
>> We certainly don't want to ever free L3 tables (vacating L4 entries); since
>> the 32-bit case still mattered back then, the "continue" also couldn't have
>> been simply replaced (as there that same consideration applied to L2 tables
>> and L3 entries, for further extended reasons imposed by PAE).
> 
> I agree we don't want to free L3 tables and thus zap L4 entries.
> 
> Feel free to add:
> 
> Fixes: 4376c05c3113 ('x86-64: use 1GB pages in 1:1 mapping if available')
> 
> If you want.

Done so. Despite the tag I'm uncertain whether to backport.

Jan

