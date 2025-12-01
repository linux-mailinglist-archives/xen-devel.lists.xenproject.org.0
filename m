Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0463CC961A3
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 09:24:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175563.1500189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPzBc-0003Bd-Pt; Mon, 01 Dec 2025 08:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175563.1500189; Mon, 01 Dec 2025 08:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPzBc-00039r-MF; Mon, 01 Dec 2025 08:23:08 +0000
Received: by outflank-mailman (input) for mailman id 1175563;
 Mon, 01 Dec 2025 08:23:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0dw1=6H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vPzBb-00039l-Jr
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 08:23:07 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f574ee17-ce8e-11f0-980a-7dc792cee155;
 Mon, 01 Dec 2025 09:23:04 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42e2ce8681eso1031310f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Dec 2025 00:23:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1c5c30c4sm25329429f8f.9.2025.12.01.00.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Dec 2025 00:23:03 -0800 (PST)
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
X-Inumbo-ID: f574ee17-ce8e-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764577384; x=1765182184; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tVPM5a/fUWecAKcZ+uBvajHH3ZHtuTKVH+T2J+RzBuk=;
        b=P7G74Mb4izes13KlQL/urw1fD7bFGyasaLQrgD6RqxHfGGdeQH3QutpmTCs1ltsWTg
         1FFWwt9rvqBWVctzEKeZjrWBEXd5hrNs/pBP/X5PRIahCbALyAg0tXZz1iItroNyYSBJ
         VzuUZsVXrBq23nVrcnLpmNVRI6vqJwCw5PoIQWPrjgU+LgpgQSQL4feym8omJ7tblfJd
         IWKz2Ra7NVWAnEfLJIJQVbdSDn1Gm3N58EzeZQzLUM0oRcH2V5tHbnTEU4ZjnTqQxUR1
         Lm7SMErMwMWYk20yNQpXskiY8v+W7toMEQRCg41nIo57r0uUoGCZCEvKvUeJzJXfGbBf
         jriA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764577384; x=1765182184;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVPM5a/fUWecAKcZ+uBvajHH3ZHtuTKVH+T2J+RzBuk=;
        b=BvgPP1ltrrpfmjLq6WTELL2/uixIr7f8c8o8cmbk4ofNV0Uv542kGgehlxGrGxLugJ
         anN6zQ/y2rZXmOWhOlZyIbuMvbAwVDxIGRZDMBReLKwmLsZiJnEEK75rr4lOK7gJTOTp
         DkNfeS29Zk7AxClJ3V3rPs09noXW95avqo3dbvKejyh5DZ7TySfXuOEBt5hudFuziMM6
         Y4ZeKLsx8Es7g3YK5UXT6fkGUC36RpGQrwGd5btYX4C9bfF7FGu0F7QvnJ5aCgyOo+H4
         ec9g+RHBdW+2pD7IQdDy1rTaIHM4bRkz3NyeIW/ScKMXR9c7aFeeqOfvir2UNTCj3fuw
         vIyA==
X-Forwarded-Encrypted: i=1; AJvYcCWCjEIpiVajIrH2DiTHSEFu/LVUTdNZdH1+DEjH+Iff7gWglGZJfDoYseu75WVE/5tYrzh7gw1V0Os=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwK6pMkWRb5T92hcv2JdWjP5VyjtQG3YArpHDYo0q7joQWFJzea
	DmDZ3VET9vAHVQPS+AURXk6dvZ2blhyDFERZqQUS7mVihdn/E7R+JVQGq+ApiSGKXQ==
X-Gm-Gg: ASbGncvwQpfKHngL0pGnABXeMXs2jH1L990pdXLDvQag2irsenthOR5XZSGcJ71osM7
	s6bMOosgZg0ZqrpRVYBHwUojHz7DoyqB1hJ9zq6OfB8aBLTlU42LCPDKSJtRBMhtkJ1FkUWexyw
	TNHrycrSskZ3PnsU8ngQx0pp4Pz6FUxVM3n62NAOaJyoUyOYji0cOTFGN5dJ2FpP+IuXoeoYEUZ
	g4DrXsRZkm6Ji1dskQVTKQA4E3pgs1/sYYW2HVrtgLMDn/y+On6YmbFZa414zsYSQi7i9DDo8vZ
	PVR42pYvMvey8KNZ0MdFu11MsRiOi3gX1VKFqtcU98tZG8UiMbZlrpeDfLWGgWrXL75WiLADpdC
	gvK6HhdDD4sOCKRJVAClSK1D0SYEjK4fsZm6a/sPYSuX7RuPL5qNfjLfCmCKyTVCDqdOPOQaoLZ
	iIjpJCNTOCfGnfdm03m0MOJKTss4PTaTeDTc0bjaR/rFfqykjc/dSHB176GIPRuWfMgujkUcmaK
	0g=
X-Google-Smtp-Source: AGHT+IGkjAAAEqjQZr2+oOKCnszf3Wbk+6Z/rQCujmBVAH54SKmmfJjiuzrUbeeU+Os0a/uY8pA7cQ==
X-Received: by 2002:a05:6000:40cb:b0:42b:2fc8:18c with SMTP id ffacd0b85a97d-42cc1d15526mr40813787f8f.32.1764577384288;
        Mon, 01 Dec 2025 00:23:04 -0800 (PST)
Message-ID: <a37b1779-6516-4e9a-8736-003c8e61aeb9@suse.com>
Date: Mon, 1 Dec 2025 09:23:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/24] xen: consolidate cpuid library
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 "grygorii_strashko@epam.com" <grygorii_strashko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-3-Penny.Zheng@amd.com>
 <6781dbd7-ddce-49c1-a359-0910e91bda43@suse.com>
 <DM4PR12MB84515C97AE3F68E676FED174E1DBA@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB84515C97AE3F68E676FED174E1DBA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.12.2025 07:57, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, November 25, 2025 2:39 PM
>> To: Penny, Zheng <penny.zheng@amd.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; grygorii_strashko@epam.com; Roger
>> Pau Monné <roger.pau@citrix.com>; Anthony PERARD
>> <anthony.perard@vates.tech>; Juergen Gross <jgross@suse.com>; xen-
>> devel@lists.xenproject.org
>> Subject: Re: [PATCH v4 02/24] xen: consolidate cpuid library
>>
>> On 21.11.2025 11:57, Penny Zheng wrote:
>>> There are some cpuid library functions only referenced in
>>> XEN_DOMCTL_get{,set}_cpu_policy-case, and shall be wrapped with
>>> CONFIG_MGMT_HYPERCALLS later, otherwise they will become unreachable
>>> when MGMT_HYPERCALLS=n, and hence violate Misra 2.1
>>> - x86_cpu_policy_clear_out_of_range_leaves
>>>   - zero_leaves
>>> - x86_cpuid_copy_to_buffer
>>>   - copy_leaf_to_buffer
>>> - x86_cpuid_copy_from_buffer
>>> We seperate these functions by moving other functions to a new file
>>> named cpuid-generic.c, and modify related Makefile-s to retain same behavior.
>>>
>>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>>> ---
>>> v3 -> v4:
>>> - new commit
>>> ---
>>>  tools/fuzz/cpu-policy/Makefile               |   2 +-
>>>  tools/fuzz/x86_instruction_emulator/Makefile |  10 +-
>>>  tools/libs/guest/Makefile.common             |   2 +-
>>>  tools/tests/cpu-policy/Makefile              |   2 +-
>>>  tools/tests/x86_emulator/Makefile            |   2 +-
>>>  xen/lib/x86/Makefile                         |   1 +
>>>  xen/lib/x86/cpuid-generic.c                  | 273 +++++++++++++++++++
>>>  xen/lib/x86/cpuid.c                          | 260 ------------------
>>>  8 files changed, 283 insertions(+), 269 deletions(-)  create mode
>>> 100644 xen/lib/x86/cpuid-generic.c
>>
>> Andrew - what's your take on such a split? Personally I'm not overly happy to see
>> related functions be scattered across two files. The separation also feels pretty
>> random, posing the risk that later some of the code may need to move back.
>>
> 
> Right now, I could not think a better way to guard x86_cpuid_copy_from{,to}_buffer with MGMT_HYPERCALLS without split, any better suggestion? Or maybe I could add up some explanations on the file cpuid_generic.c head note to explain the diffs between itself and cpuid.c, something like:
> ```
> The difference between cpuid.c and cpuid_generic.c is that the former contains library functions that has only been referenced in management hypercalls, such as sysctl, domctl, etc. See comment for MGMT_HYPERCALLS.
> ```

If one of the files is to have only MGMT_HYPERCALLS related stuff (and if, prior
to that, using #ifdef-ary in the existing file was proven unwieldy), then imo
the more "natural" split would be to have a separate cpuid-mgmt.c file, where
then from its name alone it already becomes halfway clear what it to live there.

Another option might be to properly library-fy the copy-in and copy-out functions,
one per source file, and then referenced by lib-y (or lib-$(CONFIG_...)) from the
Makefile.

Jan

