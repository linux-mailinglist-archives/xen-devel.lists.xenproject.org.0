Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 430229D9304
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 09:03:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843388.1258997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFqXA-0001vC-Nq; Tue, 26 Nov 2024 08:02:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843388.1258997; Tue, 26 Nov 2024 08:02:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFqXA-0001sl-L0; Tue, 26 Nov 2024 08:02:56 +0000
Received: by outflank-mailman (input) for mailman id 843388;
 Tue, 26 Nov 2024 08:02:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zjIj=SV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFqX9-0001sf-Jk
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 08:02:55 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d53a0854-abcc-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 09:02:51 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aa51d32fa69so528449766b.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 00:02:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa52b498ac1sm462867366b.50.2024.11.26.00.02.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 00:02:50 -0800 (PST)
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
X-Inumbo-ID: d53a0854-abcc-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzYiLCJoZWxvIjoibWFpbC1lajEteDYzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQ1M2EwODU0LWFiY2MtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjA4MTcxLjI3NTA4OSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732608170; x=1733212970; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wB18a7J2z8gFcS2516Qh9Ws996zgJsx94/3rK2Cmf4o=;
        b=BYwDesj5eDltGLYFXZAKYYi27Up+34nsUhef8915KFgG7TZUnqyWJG1txBa8HighIo
         X4Spk3N8ttrqPrjYQmaFuUNkRVrbkVd8LjRP1vAAYqJgufQA66LB+lOXi4BzFPHbSU/D
         8Pj9mIg+f96/ly/YT4GrgCO7TwZvpjEx8fXwQh0FpQLidAVVtlig8cBLu2CGZgu3c0UY
         gzWZf3SS0XSRHH3+rfbZagwLvFmFhlbytbQGCI9tDSbdj+4BYcPjvirbEH5WH+UKf3zW
         63sF6ixHxJEfxz6Qa5RAhSr1xrkDLy3jruTaSZtAs2k5OKW87e7HEXraSXjg4233Qonr
         0XTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732608170; x=1733212970;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wB18a7J2z8gFcS2516Qh9Ws996zgJsx94/3rK2Cmf4o=;
        b=Hod92tYFo8s2FhmBS9qDmFskor3Az+zS0FhwjJroDN+TQDpVKoRJ/MjlnqIO8aF9vf
         srS7HdZzQ4tPjgp0LzN6Sa0jWgFgPX2nX2Kv7WtZwwSQ6+Z48d7bTXZGwG15RR9w/R13
         z+B22K4gGgU7jHvvMUdHqOUgll94IU8Nkbja4nZHlHCRcwJotb4u+IMo49qtaFW3Qo6Z
         xHHo+HXWtkE/ZTJfGj4oR4sTqyW1520LwGYIpPxTjF9/9ezd0puNPzSpEePvfG04LmxH
         UrA+aLmLe8cNA5KgoURCjm+2wzn04+FlY38aGAKuPdESUWWjdxSxASQPQJPWMDk5SS9P
         pPiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2pQMbeWRuMfLu2lntkskQzJwoSOxW4wrT0EMc+0OcOaEfQZ1hlLVXZ+HAKqFzqx1zzB0wmuBzTyM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8Z7vgwb1Vj1LZ8rl4B55qeKtFqVTxreGazemQxulcgzzSnwb5
	+GkndVbOnjZBgJCE9uri85VAW138TDhXacAv8wfWi/vTMrxT8RPw/Z35oqsSgQ==
X-Gm-Gg: ASbGncvpgx34VlL7iBjI62vfb7a0gemFYNRPJ14QxxREFAehGwu8urEtDOF2ZYhSY94
	NncsdTzKRryBI9uaL4fZI5+x0ffxSE5zwaREvlPme9u41IcAjfy/nAB5W44J03SFYRCi2p34olY
	GxquE3fwweLSt/mxrYICQFuy0DsSjtm9FQNE8Tyyv23hbzMCoGLhP7GMcUOV7sjg1P15QyutfVk
	YRDoCkUszeMQvSLuxc6x9oHjqjztwMb1fO73HxJLekBMkvS/x51OFdpNgwlW0kJBmOH42cCV8gY
	2Fm3chb34uP7QGR5EAvboDl6Rk7mSn7+cfg=
X-Google-Smtp-Source: AGHT+IGRolwIbNU81w9nIvAhHUHQFExoyqTwHrbQQf5Mm/rZgET6MbGJJ1IQlq5AFY+sYqgUlmWNkA==
X-Received: by 2002:a17:907:3da4:b0:aa4:9ab1:19d5 with SMTP id a640c23a62f3a-aa509d3fb30mr1500931366b.42.1732608170551;
        Tue, 26 Nov 2024 00:02:50 -0800 (PST)
Message-ID: <2d3c14c1-d4e8-41a0-98a7-3da1a3a89e24@suse.com>
Date: Tue, 26 Nov 2024 09:02:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] mm: allow page scrubbing routine(s) to be arch
 controlled
To: Julien Grall <julien@xen.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Bobby Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com>
 <49b0a003-3fae-4908-ba63-a1c764293755@suse.com>
 <70389f10-5706-4fb4-a186-984a9fd52d76@xen.org>
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
In-Reply-To: <70389f10-5706-4fb4-a186-984a9fd52d76@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.11.2024 23:17, Julien Grall wrote:
>> --- a/xen/arch/arm/include/asm/page.h
>> +++ b/xen/arch/arm/include/asm/page.h
>> @@ -144,6 +144,12 @@ extern size_t dcache_line_bytes;
>>   
>>   #define copy_page(dp, sp) memcpy(dp, sp, PAGE_SIZE)
>>   
>> +#define clear_page_hot  clear_page
>> +#define clear_page_cold clear_page
>> +
>> +#define scrub_page_hot(page) memset(page, SCRUB_BYTE_PATTERN, PAGE_SIZE)
>> +#define scrub_page_cold      scrub_page_hot
> 
> This block seems to be common between all the arch but x86. Should we 
> add an header in asm generic?

I'd say that largely depends on the intentions of Arm, RISC-V, and PPC.
Personally I've always found it odd that memset() / memcpy() are used for
page clearing / copying. Surely there are better ways, and pretty certainly
about every arch also has distinct means to efficiently do "hot" and "cold"
clearing. Therefore keeping these #define-s in per-arch headers imo serves
as a reminder that something wants doing about them.

Jan

