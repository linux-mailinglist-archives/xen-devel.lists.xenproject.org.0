Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E047596460B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 15:14:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785874.1195395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjeyc-00017Y-C5; Thu, 29 Aug 2024 13:14:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785874.1195395; Thu, 29 Aug 2024 13:14:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjeyc-000152-97; Thu, 29 Aug 2024 13:14:14 +0000
Received: by outflank-mailman (input) for mailman id 785874;
 Thu, 29 Aug 2024 13:14:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjeyb-000142-A0
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 13:14:13 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94d3d192-6608-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 15:14:11 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c0abaae174so691112a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 06:14:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891d8109sm78764766b.174.2024.08.29.06.14.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 06:14:10 -0700 (PDT)
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
X-Inumbo-ID: 94d3d192-6608-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724937251; x=1725542051; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4X/l2g8Liqe3GrPATDRGihZCqaRvKpc7lPGiV6oW+cw=;
        b=WietnjVy6XjQYoWW1nKTFKHAbIM04kV7hTzYsaKftobgzZo0nEzHfaP06n+mXyFXkx
         /w/DGmi6sdllbb/cg6yhoSCoBFQewvMfB7R3cfPB/JeMtqrv//Vns3c8PcFNZjq4eoqr
         bvKOHUycvVgmwPjGYhZNOQfnn7gqik+1vk4wvnPXKu1VYwqwLahl5hQVb0Atp3HbIs+M
         Qmhe90ZmTGwF2IDwC/j6+yX4SPdbYluHoXfW1gfuvzhsiYebLucshFD4fYNvuSe0SeOy
         U3dDfJ7n0sbX0bgB3gCCOR3m+NsGxbNOrbpouvSn7wD9PjzuU0o6zUSeLV+4pWgZV35b
         atzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724937251; x=1725542051;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4X/l2g8Liqe3GrPATDRGihZCqaRvKpc7lPGiV6oW+cw=;
        b=lyNEp40OP/Gf23Vy2H68SiHMyKecUVcdUcTF0Og2DMl/W/mi+4F6kcKAVPiUA14gSL
         bbeqwqYhWyDJHrO+KnaI3StAsMSeEaJysgmZ00XteKDLgkxg9y1oHkJbzqJnTcv8cPWV
         /KIBLGfVHxDb5uYB9Y5pEz5RQ8FMULGT126WPbTm+pc5Yu1tVp0BPDPoXnD2vEtXGnrx
         enAi+XZ0znWRgHhTfjU7K2N5EvUI/I7c/+tPJ550jVoiXsYt1rdONzc8gp6D7eAICc7g
         S2/vn91ajxUNnMXO9XYLTE/93243GFFXeSy2IuMzxw+A9q2ttsZxLO4SlANGD9Fh8AZ6
         PWrA==
X-Forwarded-Encrypted: i=1; AJvYcCXze1BnmpxmWJmgMQgN+khbRQbs3MYGZoDBlYzoiMaWiP+iCKWEuVNjdElLS2Ok5zHgJbBRGv+NCbk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxfAh6eKveEC7zlLpq0A0QESqKg+z1V3+TB8nYLiQAVYdc8YWtG
	f5PeWq7NRhmF9pcXgI0GcSOpvJ022HyqorEzB/cFgEhdU/ogIlPrAAsTOAHMgw==
X-Google-Smtp-Source: AGHT+IGvX9Pb5YK5jbwb38dWYfS40DXJtneicOcCjOaL3swubEfr1/ioEMNqSyqfi8/oMRkcec59ng==
X-Received: by 2002:a05:6402:51d2:b0:5be:eb90:183c with SMTP id 4fb4d7f45d1cf-5c21ed314abmr2804857a12.6.1724937250823;
        Thu, 29 Aug 2024 06:14:10 -0700 (PDT)
Message-ID: <74fa2ddb-a7be-4d58-9717-5c14eee7782a@suse.com>
Date: Thu, 29 Aug 2024 15:14:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] types: replace remaining uses of s64
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b1ded557-63b8-4999-98ca-de80488ebad1@suse.com>
 <50ffc0e1-ff3d-421f-a703-295541357e17@suse.com>
 <737c8726-f290-4abf-b46a-344dd63862fa@citrix.com>
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
In-Reply-To: <737c8726-f290-4abf-b46a-344dd63862fa@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.08.2024 14:51, Andrew Cooper wrote:
> On 29/08/2024 1:01 pm, Jan Beulich wrote:
>> --- a/xen/arch/x86/time.c
>> +++ b/xen/arch/x86/time.c
>> @@ -66,10 +66,10 @@ struct cpu_time {
>>  struct platform_timesource {
>>      const char *id;
>>      const char *name;
>> -    u64 frequency;
>> +    uint64_t frequency;
>>      /* Post-init this hook may only be invoked via the read_counter() wrapper! */
>> -    u64 (*read_counter)(void);
>> -    s64 (*init)(struct platform_timesource *);
>> +    uint64_t (*read_counter)(void);
>> +    int64_t (*init)(struct platform_timesource *);
>>      void (*resume)(struct platform_timesource *);
> 
> I'm surprised that we haven't seen MISRA complaints about this.  That,
> or I've not been paying enough attention.

What Misra concerns do you see here?

>> --- a/xen/common/ubsan/ubsan.c
>> +++ b/xen/common/ubsan/ubsan.c
>> @@ -21,7 +21,6 @@ static DEFINE_PER_CPU(struct xen_ubsan[1
>>  #define current this_cpu(in_ubsan)
>>  #define dump_stack dump_execution_state
>>  #define u64 long long unsigned int
>> -#define s64 long long int
> 
> This block of defines was my magic to use ubsan.c otherwise unmodified
> from Linux.
> 
> It ought to use linux-compat.h now it exists, rather than swapping away
> from {u,s}64.

Except that this doesn't work without retaining the hunk adjusting
val_to_string(). I'm actually surprised Linux gets away with that, seeing
their include/uapi/asm-generic/int-l64.h (which is the model we use,
resulting in -Wformat warnings). Thoughts?

Jan

