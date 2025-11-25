Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D986EC8381E
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 07:38:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171685.1496692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNmhG-0000wq-TJ; Tue, 25 Nov 2025 06:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171685.1496692; Tue, 25 Nov 2025 06:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNmhG-0000uF-PQ; Tue, 25 Nov 2025 06:38:42 +0000
Received: by outflank-mailman (input) for mailman id 1171685;
 Tue, 25 Nov 2025 06:38:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNmhG-0000u9-BW
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 06:38:42 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 617a082e-c9c9-11f0-9d18-b5c5bf9af7f9;
 Tue, 25 Nov 2025 07:38:41 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4779a637712so30896195e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 22:38:41 -0800 (PST)
Received: from ?IPV6:2003:ca:b70c:6a8e:d5b9:723c:3555:44bc?
 (p200300cab70c6a8ed5b9723c355544bc.dip0.t-ipconnect.de.
 [2003:ca:b70c:6a8e:d5b9:723c:3555:44bc])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf3b4eb2sm230927675e9.12.2025.11.24.22.38.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 22:38:40 -0800 (PST)
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
X-Inumbo-ID: 617a082e-c9c9-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764052720; x=1764657520; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vHHXTgoZ8mnRsxhFycHqAEurI+rzK7ScuK05ATo6Cxg=;
        b=GsDuLyEG0wHK5+tWMMGkCIERmGgImvmtUnaHPZwIUmA7J5fUn08YNWcEabNfFXGBLg
         NgAZQjtKrn9MXg6cqRL0pmtMsF4cE1hYk/IkaxMWR8qpolf4h8nK/liN3dmr4UKhIlpU
         GTZNuy6uDh1Js0O/Z7y1b1GqTAgg/qfAwu7z4tSaenv20mW9tFmHdimhbJNI/KWgEKlK
         sxMo78tq+vV1mfTtUeEO6Dd3AkkCLksTdzTPXo0xBKMp4JInKvgiTExnABKjYmlReFG4
         TdFgMQJFD9C6iqPRDKKd2mrcmlRsaD0VxeupTR77aj9xOyo0f9Qq76kbhvXciw3+2X1j
         H2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764052720; x=1764657520;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHHXTgoZ8mnRsxhFycHqAEurI+rzK7ScuK05ATo6Cxg=;
        b=d8i2qmZRR2i4U7y7M6XEV+JnC+kNy6E0FpiKB2I+LdVeMGPK3I4Zc1LBXVFsktJaCG
         LL1w4aBLLlsyz8UZ6KimXIg0crsuFAXPQGJGNRTnDqb3CvYw9C6MGlDAsTMho7hiqZ6v
         pvCwK0aHYZ1XrYuLppikT/BLw1gDLRGDveicyTnvdhPv3nynpXNeowIxMVqfD1P5/PMZ
         i3kHzYfEN5pTuk1CZk+wMd14Kme56HAYDkHTK0JL6REyXYTWXC2MIUtnSbyMmv0UN+Vy
         cMAZwEvIA9tflpiUjmNwAjS9PpOI77iz+bNryrC3o90yhPFFTwuocrh5KXgYJEQZ9nVD
         u0jA==
X-Forwarded-Encrypted: i=1; AJvYcCWsTieoLXYW7KQ9WYt3lFwBjqhrXDtbl/V04OBZKBdoVU3qUeYwR5qHBpzhH5F96NvgX6AXMwGGhHM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMLHvr6P/wx5ju0JV9xAoQNx2fjT2BWsCwN8yDEweQhfaVroO9
	+mnNv49h74h9wh/dI6vvfCFmc4Sq0VyI7SP54xBSLUMl95trhueW+5Y/IhrUGoBttg==
X-Gm-Gg: ASbGnctDJU82mvZXA4cFMlNACHzuESKe8BJ393nuY3AKtiLuahxNy9uIPW4VBfmwy9L
	vSKlT711JtQ+bf4t+C6giiP6oaAWZyhUlkPQ3gsarmqiYkEDywXCuxyTpKWm8pQj3hp5dGt04Tv
	7IoWsx3fKUHcHX2nve1oWFAf7HF3M8ug4fxAM8Yi8vaLiAAaNVcEhORwaqS2ewC2Yi/JTlqh7Pi
	lu6cD+8TxOLIhHL+yiFMioR4o/IfVRGNadtv8Nb/Pqb4Pu+dtrOKhHnm4Oka1sZce8e1P8DT/P4
	NVN+WzGD4j5fcquo3Pk1KTtMN8lQt1Ho12HDNFMjFERwALmN0l4h3SdeXyi1NudW2IPZhZijebX
	L2c5DK7a5OlNHPETDYWLS8ivhzY6EeHsNE0EhEaa5EYPeebQ/PQj37JX2vU8lXIQTIaGvWUxXWw
	G3y5Rw8nHEASSR1n+FUGYdXmAmWpEsPZ1Ax3XInLDe1aIOhmlNHzzjUGWCJ4T9IyAd9e4sGTbzi
	t20eIYKUtGdd182DaPT2Om+VSnh0RxQLelYUHddYxYu9NUb
X-Google-Smtp-Source: AGHT+IFDEUe3QkpJjg9wCas9AYA9q/aflW6wryax3Enh7iJkS7bWIYJwHpxzZKRfOA0B3dwb347gRA==
X-Received: by 2002:a05:600c:450f:b0:46d:ba6d:65bb with SMTP id 5b1f17b1804b1-477c01eb9bdmr158715315e9.31.1764052720484;
        Mon, 24 Nov 2025 22:38:40 -0800 (PST)
Message-ID: <6781dbd7-ddce-49c1-a359-0910e91bda43@suse.com>
Date: Tue, 25 Nov 2025 07:38:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/24] xen: consolidate cpuid library
To: Penny Zheng <Penny.Zheng@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-3-Penny.Zheng@amd.com>
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
In-Reply-To: <20251121105801.1251262-3-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.11.2025 11:57, Penny Zheng wrote:
> There are some cpuid library functions only referenced in
> XEN_DOMCTL_get{,set}_cpu_policy-case, and shall be wrapped with
> CONFIG_MGMT_HYPERCALLS later, otherwise they will become unreachable when
> MGMT_HYPERCALLS=n, and hence violate Misra 2.1
> - x86_cpu_policy_clear_out_of_range_leaves
>   - zero_leaves
> - x86_cpuid_copy_to_buffer
>   - copy_leaf_to_buffer
> - x86_cpuid_copy_from_buffer
> We seperate these functions by moving other functions to a new file named
> cpuid-generic.c, and modify related Makefile-s to retain same behavior.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v3 -> v4:
> - new commit
> ---
>  tools/fuzz/cpu-policy/Makefile               |   2 +-
>  tools/fuzz/x86_instruction_emulator/Makefile |  10 +-
>  tools/libs/guest/Makefile.common             |   2 +-
>  tools/tests/cpu-policy/Makefile              |   2 +-
>  tools/tests/x86_emulator/Makefile            |   2 +-
>  xen/lib/x86/Makefile                         |   1 +
>  xen/lib/x86/cpuid-generic.c                  | 273 +++++++++++++++++++
>  xen/lib/x86/cpuid.c                          | 260 ------------------
>  8 files changed, 283 insertions(+), 269 deletions(-)
>  create mode 100644 xen/lib/x86/cpuid-generic.c

Andrew - what's your take on such a split? Personally I'm not overly
happy to see related functions be scattered across two files. The
separation also feels pretty random, posing the risk that later some
of the code may need to move back.

Penny, I also don't think "consolidate" is what is happening here.
Perhaps "split" would be getting closer?

Jan

