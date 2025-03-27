Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F72A72B4D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 09:21:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928612.1331293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txiUk-0000Tz-Kd; Thu, 27 Mar 2025 08:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928612.1331293; Thu, 27 Mar 2025 08:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txiUk-0000SC-H8; Thu, 27 Mar 2025 08:21:46 +0000
Received: by outflank-mailman (input) for mailman id 928612;
 Thu, 27 Mar 2025 08:21:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txiUj-0000S6-RU
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 08:21:45 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 845cb049-0ae4-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 09:21:43 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso4649815e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 01:21:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9ef23esm19048078f8f.81.2025.03.27.01.21.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 01:21:42 -0700 (PDT)
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
X-Inumbo-ID: 845cb049-0ae4-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743063703; x=1743668503; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kOQA30RryXkHcOPMSqNMtCtniI5ngfbnb7V1QtqhSfw=;
        b=bNO2MyhvSGkzQcv24udXuQ3Ag9BnrOMsSzL8llnTNj0+NNFG6a4JjMu463J2vZOl7g
         YVYlhPjIHPzQfAL+PwjBhYAyWO/12D9vu0y7OAExYp8LIP7zPl0DhUaLsz3eO/A4KfNj
         74cWvSqkg6ZqF64ujx8tFyX8XU+RiAiOsFOzBRo6LD746CKsZhso9IGn2k2S25MpYzKa
         eXBv45CyQLzkX/WJOoVid8hTjB67ON6VcEVvJB8ZTlafuo4GdBfVFSREZcLnsue4eXiq
         uvXhVDeaKhzoUxIjvu5Co2E4LsU4YTj93ANubxmuwzRJsOPnWGcsdYFykSxF/HKp5KiE
         Geag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743063703; x=1743668503;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOQA30RryXkHcOPMSqNMtCtniI5ngfbnb7V1QtqhSfw=;
        b=Xf1AraT+M9ObngsMqydtfKoE7tZqKSZLVYDas4K5S9YgWXSPDC7iX79Ll8Em4wQSIL
         KCJqtuI01sHtb3o0DrmyUGXPndA5CwAlnFR29RLjfaVo0kPCJxiW7ibs0d2kgAnQWaiy
         NHeCW7Q1lKFb7Jh3pULdlARYmWzCmt6NFc14ZkHMv+6CkXYkYlFl81BSbRd9LX/PQ2XA
         ARqsACO7wfTvUl1YWM24C57a7p2XGEJnEKInii8jkWiofWDXMDGjlFoS1WVBQ9teVUuV
         ZHBXp4txNoCUlfEIG0GniWEmAsnKbgg9T+4ARD+3IrTGQyXO2UlGo5A0BrepWSpjzb4a
         BmXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOqDZlWVfFxSJouCkZWJKOk9QMjbCSHl0AW08l/NtbF26NLROZgiZHwLXAguwVisT8VhLPA6gwS4g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmBgDI2STCn9PZQwbCXSKgqCzsCRyuLMJzVrXTK0eOuREequO7
	PGqgM79cWZC3U1+p27poIfC1i5DZyz6e+/HyM3PA+bHH9mz0QmfGHt5T3e0Y+g==
X-Gm-Gg: ASbGnctBvq8cSL/9oV6Y9hwgn/ivIQGv/U87M2w9VMmv4Csb8RV0MfIQgvsfi6RHWKc
	E8T9GfbX7fWBiNb4sx5mlxF/JgTfj28MlI1NeIJbT2VLjr5Zw4ZgXQY+R2TmcpKBM5+G301t/QJ
	qkqEy1AjioDuT4pDwAGt8Xog+VFcvvshYeF+s6PP/WrY4jxNd947QWpApQUXZQm5cvJnxLcD3GA
	pWqlyzhKdQOZsze7+iXSMDs7u3L0ad95cet47SDAoattx1wQO3TwlQr5/eO+T/qh3GbcviBr6Yj
	FHCj6SrxzRUOb3j6gcS9OvfilEsU68Eaube3jiBRlKCgpk07lUyA1rkZBa+lvy5YorcEHuXaAPk
	Pw1LZj2JG5Hujv4cUohTBHi7ASUtjRg==
X-Google-Smtp-Source: AGHT+IGEalR9lm09CGeRt4qP0uNmFEgYRTHnO85jQBJzM8w8XvLBPIi5Xj5f/sxwkKuMANq3DMqx2A==
X-Received: by 2002:a5d:59ae:0:b0:391:4873:7943 with SMTP id ffacd0b85a97d-39ad175004emr2108226f8f.32.1743063703289;
        Thu, 27 Mar 2025 01:21:43 -0700 (PDT)
Message-ID: <994b9d44-f82f-4eb7-8742-9041ba2caf17@suse.com>
Date: Thu, 27 Mar 2025 09:21:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/config.h: Move BITS_PER_* definitions from
 asm/config.h to xen/config.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <4f085bcbf5b6f1bc42824bfb08724e8a9bbd4918.1743005389.git.oleksii.kurochko@gmail.com>
 <17a808cf-e676-4c30-9068-34a9a4d568d7@citrix.com>
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
In-Reply-To: <17a808cf-e676-4c30-9068-34a9a4d568d7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.03.2025 01:44, Andrew Cooper wrote:
> On 26/03/2025 5:47 pm, Oleksii Kurochko wrote:
>> diff --git a/xen/include/xen/config.h b/xen/include/xen/config.h
>> index d888b2314d..dbbf2fce62 100644
>> --- a/xen/include/xen/config.h
>> +++ b/xen/include/xen/config.h
>> @@ -98,4 +98,13 @@
>>  #define ZERO_BLOCK_PTR ((void *)-1L)
>>  #endif
>>  
>> +#define BYTES_PER_LONG  __SIZEOF_LONG__
>> +
>> +#define BITS_PER_BYTE   __CHAR_BIT__
>> +#define BITS_PER_INT    (__SIZEOF_INT__ << 3)
>> +#define BITS_PER_LONG   (BYTES_PER_LONG << 3)
>> +#define BITS_PER_LLONG  (__SIZEOF_LONG_LONG__ << 3)
>> +
>> +#define POINTER_ALIGN   __SIZEOF_POINTER__
> 
> See how much nicer this is.  This patch possibly wants to wait until
> I've fixed the compiler checks to update to the new baseline, or we can
> just say that staging is staging and corner case error messages are fine.
> 
> One thing, you have to replace the "<< 3" as you're hard-coding 8 here
> and ignoring __CHAR_BIT__.
> 
> I'd suggest keeping the BITS_PER_BYTE on the LHS, e.g:
> 
> #define BITS_PER_INT    (BITS_PER_BYTE * __SIZEOF_INT__)
> 
> which tabulates better.
> 
> I suggest keeping BITS_PER_XEN_ULONG to be arch-local.

I agree here despite ...

>  ARM is the
> odd-one-out having a non-64bit arch use a 64bit XEN_ULONG.

... not agreeing here: x86 is the odd-one-out; I sincerely hope any new ports
to 32-bit architectures / flavors will avoid compat layer translation by making
this type a proper 64-bit one. Architectures truly being 32-bit only, with no
expectation of a 64-bit flavor ever appearing, would be different.

Jan

