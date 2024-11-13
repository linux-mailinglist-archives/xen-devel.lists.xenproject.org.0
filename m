Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE6F9C6A3E
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 09:02:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835079.1250911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB8K6-00006t-HV; Wed, 13 Nov 2024 08:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835079.1250911; Wed, 13 Nov 2024 08:01:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB8K6-00005K-EW; Wed, 13 Nov 2024 08:01:58 +0000
Received: by outflank-mailman (input) for mailman id 835079;
 Wed, 13 Nov 2024 08:01:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tB8K4-00004w-Iv
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 08:01:56 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b239d10-a195-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 09:01:53 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43193678216so62862235e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 00:01:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed9973e8sm17735874f8f.48.2024.11.13.00.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 00:01:52 -0800 (PST)
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
X-Inumbo-ID: 8b239d10-a195-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmIiLCJoZWxvIjoibWFpbC13bTEteDMyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjhiMjM5ZDEwLWExOTUtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDg0OTEzLjAyNjQ5NSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731484912; x=1732089712; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rNGnoSaBajSY/448NxC4SQnS4VAkrt0UA59g8cZ4TE0=;
        b=gO0CUhtUTAyL+DUStEAU1PxseBWMinSPm+0h92j89r0zs1TDdowoLIK4X+yCCq86MS
         HiAoekY5YQ24Ir97rItyS+owWBlDfMImLTYw5LVl3VAuN2qgE+yy1taXT82HscT2wAo8
         D+va8w9Elr533EMzdHo+D/yNFKEPZ1OyjjoOa68cwSrVbUZyw/kyd62JJv9xNcQGNeWz
         uv+uGS8kQuuNzKaqBr6wGXV3io7nGxpfUnnOlkiz0sRTDJKwi2HqRJXtFlSg39cUdVTe
         G4UvfOsj1QgaUWb8YAM/RFWqNlWK/tQ/52funush7cF+doBf/9F7imrBaJqe+du/nBtP
         TkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731484912; x=1732089712;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNGnoSaBajSY/448NxC4SQnS4VAkrt0UA59g8cZ4TE0=;
        b=PRstXQrrVy6g1lHLF6pHlROo3VgIt6hcYL7GhljTnU1tVoP031SrIq+f145P5TrajM
         2iUl+3moF4ELgnbXAk6qTqBxtUqca1s8sYYi030tgLCC0MXooimSwFUOGKjk9G5NdkKK
         BOGfzxinPnNm2tT9IUb0mraVntstes6Gz9cqKeZe77RbjssKwO9nZjfEYhraP4Zj98fi
         1hPlrH2VIJbULpic4guaN6Cf7dPhmWbR9+zskUVTyFxVWPXa09zPfveoUMhqZ1n7jdhG
         8XwMKCTptcqjEcpfWG7k+7COxyFONcPjPEibj6K3G8szwWyXrZIbTnT5KuS1x/w9k/BA
         FD6Q==
X-Forwarded-Encrypted: i=1; AJvYcCViujaZZfSY/iHGIpMzNM+gE+9AHZAFjVHtb/V0yTyuR8E2d987Zd6WKuJMuUzb5x6up5e7TacSLwk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgnY+fbotOTIbf4rfgR3reWso9uIb6mVurJQJnyMv8HU9BacDJ
	2KhiVX4P4KdV2d2k2z5wxiRHO+hFH+bj8769WPmY7K5DMcaxzhxxbKJzkQepwg==
X-Google-Smtp-Source: AGHT+IGTcFmrowtUM4RxdJ6OXoPjddiogF5QHZi15nRgPn2SqErbOEhoMrs+MKflVjPqqdG6ELGrew==
X-Received: by 2002:a05:600c:4ecc:b0:42c:c28c:e477 with SMTP id 5b1f17b1804b1-432b751688bmr160993705e9.23.1731484912520;
        Wed, 13 Nov 2024 00:01:52 -0800 (PST)
Message-ID: <3788f564-7f02-4e2e-ac4c-b29214206e0d@suse.com>
Date: Wed, 13 Nov 2024 09:01:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86emul: ignore VEX.W for BMI{1,2} insns in 32-bit
 mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <367ba117-f376-433b-bd70-586d7519d94c@suse.com>
 <39de64e1-c615-4ec3-ad05-ff99f27a8e30@suse.com>
 <6442a109-de9a-4b81-a283-2d72bbc3d284@citrix.com>
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
In-Reply-To: <6442a109-de9a-4b81-a283-2d72bbc3d284@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2024 01:24, Andrew Cooper wrote:
> On 12/11/2024 3:00 pm, Jan Beulich wrote:
>> While result values and other status flags are unaffected as long as we
>> can ignore the case of registers having their upper 32 bits non-zero
>> outside of 64-bit mode, EFLAGS.SF may obtain a wrong value when we
>> mistakenly re-execute the original insn with VEX.W set.
>>
>> Note that the memory access, if any, is correctly carried out as 32-bit
>> regardless of VEX.W.
> 
> I don't understand why this is true.

This talks about the access to guest memory, which is op_bytes based.
And op_bytes determination handles VEX.W correctly afaics. I've added
"guest" near the start of the sentence for clarification.

> If we write out a VEX.W=1 form of BEXTR/etc and emulate while in 64bit
> mode, it will have an operand size of 64.
> 
> I can believe that ...
> 
>>  Internal state also isn't leaked, as the field the
>> memory value is read into (which is then wrongly accessed as a 64-bit
>> quantity when executing the stub) is pre-initialized to zero.
> 
> ... everything else treats the memory operand as 32bit, and uses the
> bottom half of the internal buffer, and generally does the right thing.

No, if I'm getting right what you say it was the other way around:
Right now we
- read guest memory (ahead of the big switch()); that's always a 32-bit
  access for VEX-encoded GPR insns in 32-bit code (the value is read
  into an internal field which is pre-set to zero, i.e. when used as a
  64-bit quantity, it's effectively the zero-extended value that was
  read from guest memory),
- emit a VEX-encoded insn into the stub with VEX.W set,
- execute that insn, resulting in a 64-bit memory access to the internal
  field, where as per above the upper half is zero.
It's only this way that it can be explained why the new testcase added
would previously have failed (wrongly set EFLAGS.SF).

Jan

