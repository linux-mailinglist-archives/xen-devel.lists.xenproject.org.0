Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D088C968274
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 10:54:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787658.1197090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl2og-0005IN-Ba; Mon, 02 Sep 2024 08:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787658.1197090; Mon, 02 Sep 2024 08:53:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl2og-0005Fx-8j; Mon, 02 Sep 2024 08:53:42 +0000
Received: by outflank-mailman (input) for mailman id 787658;
 Mon, 02 Sep 2024 08:53:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uQw9=QA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sl2of-0005Fr-2w
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 08:53:41 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8b16c39-6908-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 10:53:38 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c26311c6f0so351260a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 01:53:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891d6d36sm536731766b.149.2024.09.02.01.53.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 01:53:38 -0700 (PDT)
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
X-Inumbo-ID: d8b16c39-6908-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725267218; x=1725872018; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mvV18IYPneHaWXpn1BozbGbXVHPuRygCuqzEJTCtW6M=;
        b=KYV5RsI9YyYcesptOcvKLU6rmhfLpyZzh0JTl2Lz5ufgUZIhlBeomoakvlbVZZIOiX
         AdtuLbme6ELBGMvHL/4EKxfrl5YPyBD1NhTXVsG3EGV2iETkVzUgd/Cz1z5oJiFdfAAT
         B0CVcfOKdm7qH0sTkmOfPbGB+Vhym+f56XHFOxpW5g8xiIgPRTFiDi1rcmWvFV5pp5e6
         GQT9KFWqItPURNaBDfV2KLTJ3RYOKUGSrHnDRwLsCjwrdKZ29lc7cN8lKDKBYVx9bspm
         P5OCuaOJyoctDzLNmBFh+LzBnm7J1r1TN/OMQVv4pBpW3PDIi8LmXVHUjPPHOrU4hQpb
         e86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725267218; x=1725872018;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvV18IYPneHaWXpn1BozbGbXVHPuRygCuqzEJTCtW6M=;
        b=OBeiyKqo9xceNoZYNZs0pMIq71Xh92S7dtQ3L5lvRzWz/3xNJZGRVpa3vVgyYbukQK
         1NURxLxpqNZueNbTIe6VUc/Edkk1M0foi3eCNG2QIG1eZE0+LC0z+eeICRducuXFIY21
         BoJLCTAgcgLnmHuxiNbJFfrgHVxgO6p7b8N0bbB93IHaDJ3EFoOcM3b57iEeE7xkemI7
         D5l11d0jnl225T4Ptqgayc7CKBwFRkEueJzGYx1T7ARBEgnLzW0zjVhd2Aur9MGrrZRw
         j8FGQjE85suf1IB+/jv8FW5DPEw/3k/NJ/aslgWgaNPHG8bzw71Jsr1reE/TxE0fOWkf
         eluw==
X-Forwarded-Encrypted: i=1; AJvYcCXDyX7i21eItnw68a4oBYOUW8VeTibKaSdXoXr4seLow6vFDs8X7IBBDhgNVTFI8OOcPFc7LIbg8uo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yww3/n9QTO1skRN/uFFRkbAVe75fsYmAHMOHjFnxaKa1cNXgqAF
	yGmAj267fDmTzkAqRiQbSqtIQrT3WUq14Qry2c6Ig0xSIbFMWL+WLGIzB8OuWQ==
X-Google-Smtp-Source: AGHT+IFWht3rz7BJSY3zOztM/9/RyRDHfX+ofG+DnSMccLlfWGI+jx9pkftYWYBZ3AuQSbNQP0Aorw==
X-Received: by 2002:a17:906:da82:b0:a7d:e956:ad51 with SMTP id a640c23a62f3a-a89fadc10a3mr237548866b.21.1725267218437;
        Mon, 02 Sep 2024 01:53:38 -0700 (PDT)
Message-ID: <708376e5-8257-43c8-b7c5-ed17dc311787@suse.com>
Date: Mon, 2 Sep 2024 10:53:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/cpufeatures: Add new cpuid features in SPR to
 featureset
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Matthew Barnes <matthew.barnes@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <248b4ea259aa78a17b7b05043ed211a00863bf94.1724247366.git.matthew.barnes@cloud.com>
 <88f54c3f-a81b-4323-a7cf-3a6be41a9207@suse.com>
 <D3VO124CG8DF.FE5DXND84RJT@cloud.com>
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
In-Reply-To: <D3VO124CG8DF.FE5DXND84RJT@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.09.2024 10:46, Alejandro Vallejo wrote:
> On Wed Aug 21, 2024 at 5:07 PM BST, Jan Beulich wrote:
>> On 21.08.2024 17:34, Matthew Barnes wrote:
>>> Upon running `xen-cpuid -v` on a host machine with Sapphire Rapids
>>> within Dom0, there exist unrecognised features.
>>>
>>> This patch adds these features as macros to the CPU featureset,
>>> disabled by default.
>>>
>>> Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
>>
>> I don't strictly mind the patch in this shape, but ...
>>
>>> @@ -276,10 +283,13 @@ XEN_CPUFEATURE(TSX_FORCE_ABORT, 9*32+13) /* MSR_TSX_FORCE_ABORT.RTM_ABORT */
>>>  XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*A  SERIALIZE insn */
>>>  XEN_CPUFEATURE(HYBRID,        9*32+15) /*   Heterogeneous platform */
>>>  XEN_CPUFEATURE(TSXLDTRK,      9*32+16) /*a  TSX load tracking suspend/resume insns */
>>> +XEN_CPUFEATURE(PCONFIG,       9*32+18) /*   PCONFIG insn */
>>>  XEN_CPUFEATURE(ARCH_LBR,      9*32+19) /*   Architectural Last Branch Record */
>>>  XEN_CPUFEATURE(CET_IBT,       9*32+20) /*   CET - Indirect Branch Tracking */
>>> +XEN_CPUFEATURE(AMX_BF16,      9*32+22) /*   Tile computational operations on bfloat16 numbers */
>>>  XEN_CPUFEATURE(AVX512_FP16,   9*32+23) /*A  AVX512 FP16 instructions */
>>>  XEN_CPUFEATURE(AMX_TILE,      9*32+24) /*   AMX Tile architecture */
>>> +XEN_CPUFEATURE(AMX_INT8,      9*32+25) /*   Tile computational operations on 8-bit integers */
>>>  XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (used by Intel) */
>>>  XEN_CPUFEATURE(STIBP,         9*32+27) /*A  STIBP */
>>>  XEN_CPUFEATURE(L1D_FLUSH,     9*32+28) /*S  MSR_FLUSH_CMD and L1D flush. */
>>
>> ... having had a respective (more complete) patch pending for years I really
>> wonder if it shouldn't be that one to be taken. While it would need adjustment
>> to go ahead of other stuff (as posted in v3), I don't think it has any true
>> dependency on earlier patches in the AMX series. IOW I could re-post v4
>> standalone, and then we'd have a more complete view on AMX as well as proper
>> dependencies in place.
>>
>> Thoughts?
>>
>> Jan
> 
> Oh! I had no idea you already posted patches to enable AMX. Is this the one?
> 
> https://lore.kernel.org/xen-devel/322de6db-e01f-0b57-5777-5d94a13c441a@suse.com/

Yes. And specifically patch 9 there for the purposes here, suitably re-based
of course and extended to cover AMX-FP16 and AMX-COMPLEX.

Jan

