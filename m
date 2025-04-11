Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BF1A8561C
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 10:05:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946788.1344562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u39Nk-0007jj-5O; Fri, 11 Apr 2025 08:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946788.1344562; Fri, 11 Apr 2025 08:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u39Nk-0007hA-2Q; Fri, 11 Apr 2025 08:05:00 +0000
Received: by outflank-mailman (input) for mailman id 946788;
 Fri, 11 Apr 2025 08:04:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u39FH-0000vb-FI
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 07:56:15 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 706d0efe-16aa-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 09:56:13 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso13422035e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 00:56:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f205ecf30sm78586015e9.1.2025.04.11.00.56.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 00:56:12 -0700 (PDT)
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
X-Inumbo-ID: 706d0efe-16aa-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744358173; x=1744962973; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+KjXIw8FI2PzdtNvc8plifnFiviczaJ9R+32T6oYD8=;
        b=d0lAqNHxzf08W0SCNvnYU+Qc62mVtaDevp0Y/NLZLo8vYOCHtMio6vEvY/3N+/QyFL
         CPDGD8HwDM1W0rkJ4bAbqUHPRYqdj8cNj7wvyHdjKcAX/Biktig5Y2UIOGNAEXbl0Lsc
         l37FjiFG1vI6XR37Y9KBt6iACfruWzJ1j2cncGTvdwmQfYcRKnvDXT1RapvsE+D4Bwr+
         zFG8mNggZEx4wJTldLDAnx5y/b+8+pJM/4eoYH/QGxk7LCIZ31jkDQLpAZIyQUPyxz91
         h54SKl4/DqRPWbSth9Xol/AC4jUHKRpEskx5/pB8TXZnnviMLgUEZyBrSxDyvPSuPmhG
         XQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744358173; x=1744962973;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+KjXIw8FI2PzdtNvc8plifnFiviczaJ9R+32T6oYD8=;
        b=R2cFwR9oR8m+JIMVwwui0+UauriAuORc8eCHGomvIpETnAEO/oJaPgM5gi1qAcs9DH
         G9f6RRoJGa9TrnlaLnul+a0Cdsshb+vEUmVqcCF9l7bzGxRdsbSzrk/WXyQgHLddhrT6
         fNZBSFuDTfzkrRey/jpk9cE3qelRF8OUnCR8JsE4g/Uqzot/tIjzOTnmidDuuWMiew+a
         NdV6zdRaNioDRWC+gz+48D0p0WJvoYbwZkkHVMGrkAyjQ4pQvkJFw8OlVR2TXOz1iQUI
         6jQz5kiTASMpRoX0FMkgeEiE1f5+9GqEjW4vxsrlxAxhgTN80FTS4qXDiFoR06wxSwRy
         D0Qg==
X-Forwarded-Encrypted: i=1; AJvYcCXomNZ8T8F+1bpH4c4v7V3PZjBfaAeMqhzhIsq6G8nlpobCKwAYrqYpydnLZ6ZobGW2C1wjCpbqLfg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVwBWXAoMTjePn7POLM9bvQAWIBpkF/cmr9Gy3S3PB7P3HaQtl
	QVtYGzG9meiJbx8rOuBArIRPv3QwwuOrv54AcQ2FrZdIK+dMsBpFQjiuhGJOMQ==
X-Gm-Gg: ASbGncupQrttKIB1PIXq//SK3NPqEQMZhBbYYBPwznC4/EmSfXMnWX7XcxLI3PGtSV1
	VdRAKN6kws3L9CBl5afdgkcuAkV34u/XrjiOEGaULvi1WeHB2OsB8MoCyg1SUJa78LdzDhWj19d
	ki5KBbhR8kuroyXlTnN7bBgY3OSXGCn4glMVuhfi8UVtjGRX2sf79EwOWCU0N6AO/dOW7loHR5h
	1hPC6WtLhR43p5kIcMrTRuFt05CtgPw82mGc9jWKTaGbhx8unWXkCaePs8phwgcd70lfCiwWS/+
	J1GcWEWrdEgoh2Dd/EVNfMnJtnyuow/FheB91XN8WWZ72g/KGfEw044XX7exbj0sAtSqbrqI24T
	T6Xv3wU7DaPFwKpf0K7UlduMQ/Q==
X-Google-Smtp-Source: AGHT+IEv2g4SgkdgA0zu9HWhWjf+YMU9foxg8B4I4HIEjQibN7HJ3PPsAXoLHJ5FxphBFZICO5eWfQ==
X-Received: by 2002:a05:600c:1396:b0:43c:e7a7:1e76 with SMTP id 5b1f17b1804b1-43f3a926c7bmr10788745e9.1.1744358173168;
        Fri, 11 Apr 2025 00:56:13 -0700 (PDT)
Message-ID: <9c68e431-c4eb-433d-99a8-9ece747246c3@suse.com>
Date: Fri, 11 Apr 2025 09:56:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] xen/x86: allow overlaps with non-RAM regions
To: Jason Andryuk <jason.andryuk@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xenia.Ragiadakou@amd.com, Alejandro.GarciaVallejo@amd.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2504031755440.3529306@ubuntu-linux-20-04-desktop>
 <e8ca1efb-384f-4c60-94b2-95528301a156@suse.com>
 <dbec0b5d-e15b-4a7b-8b11-126c8345052c@amd.com>
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
In-Reply-To: <dbec0b5d-e15b-4a7b-8b11-126c8345052c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.04.2025 22:55, Jason Andryuk wrote:
> On 2025-04-04 04:07, Jan Beulich wrote:
>> On 04.04.2025 03:01, Stefano Stabellini wrote:
>>> On one Sapphire AMD x86 board, I see this:
>>>
>>>
>>> (XEN) [0000003943ca6ff2]  [00000000f0000000, 00000000f7ffffff] (reserved)
>>> (XEN) [00000039460886d9]  [00000000fd000000, 00000000ffffffff] (reserved)
>>> [...]
>>> (XEN) [    4.612235] 0000:02:00.0: not mapping BAR [fea00, fea03] invalid position
>>
>> I, too, see something like this on an SPR system. That's a firmware issue,
>> which hence first of all should be dealt with at the firmware side.
>>
>>> Linux boots fine on this platform but Linux as Dom0 on Xen does not.
>>> This is because the pci_check_bar->is_memory_hole check fails due to the
>>> MMIO region overlapping with the EFI reserved region.
>>
>> And then what's the actual, observable problem? On my system I haven't
>> noticed anything going wrong yet, albeit the affected device is also left
>> without a driver.
> 
> The nvme drive (0000:02:00.0 with the invalid position above) fails to 
> work and no root drive is available.

And what - if anything - does baremetal Linux say about this pretty obvious
firmware bug?

Jan

