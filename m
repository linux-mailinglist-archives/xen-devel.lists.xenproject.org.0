Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 807ADA7332B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 14:17:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929275.1331892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txn6L-0000Oy-9t; Thu, 27 Mar 2025 13:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929275.1331892; Thu, 27 Mar 2025 13:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txn6L-0000Mw-7E; Thu, 27 Mar 2025 13:16:53 +0000
Received: by outflank-mailman (input) for mailman id 929275;
 Thu, 27 Mar 2025 13:16:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txn6K-0000Mq-28
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 13:16:52 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdb4447c-0b0d-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 14:16:49 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so7042115e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 06:16:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8835e627sm22453235e9.29.2025.03.27.06.16.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 06:16:48 -0700 (PDT)
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
X-Inumbo-ID: bdb4447c-0b0d-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743081409; x=1743686209; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g04q3r3/XBBSddqd5hkgdzm1q1G/ev3Ipb2FeHvZ1eY=;
        b=HyM+WdJeF1Eg+oVk/oMOAgx/l0iWkvv1KigVWxgH6IwYqnozPz35lNDeK9Y2RQItn4
         moHh/2fUoxWB7/JNpQVf8J7MnPs/kTXJ/YcRCmx7Oa/HMFDhjRlrYPOE6QS+bKFog/oc
         726N8GcjtWKcimtXQJwrP51bKCHlWWqTM0ag9SCXV1XX8cIZb33JiU+BDr+JE7cFp9s1
         v0IOr8NewybFh99A2fW4RZemAHJGCIlDvR1XgdLagyK+s/FyvlKvYduj0XVVmeBAM2NS
         j91Oii30W8l55hfqNeEhiHPAtfrQEwkc3s1CEWnKuV966DpYSr0NwALwduOjHd0HkZT8
         dXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743081409; x=1743686209;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g04q3r3/XBBSddqd5hkgdzm1q1G/ev3Ipb2FeHvZ1eY=;
        b=UoUKEOtHB5lYY9FTl9dqgC2/Od7kiYRLSlMAf4p7TS514jwwXjSYVwBiMeRUZ0VdRP
         Kb+9s2PlAlKnkmPIKwbtGLgPbjn6sPk8RhbRiUukVyidBuzojCx5IDFLoURuT5SMVsn5
         d0GZ8pQD2/TtxDDHFEO2bVsv/6GreEzqugxTwDgS9EtFhP/P/x3KwXwj3yqa9CPG+nU3
         bkI5+T55xr6X3KBk4V07CCqprMTFEVzniOdNzq9Sw7F1lpr7yfG7hwnDXuuFTrzzApaX
         6RTjiXgtn4ji9j0rvVZBzALZTYt3r6C4pNts6aTTd9yFxF5Vbq0b49dyn5vLsNycD7qD
         sEDg==
X-Forwarded-Encrypted: i=1; AJvYcCU5YWNMrmOsVRlyDSGsaaopGs/0VQN/Dj9GYy/k2V235gRXX7PedGBvIk2MOfUhVycsSm68ljSYjJk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyN8dmMnFQ5uUDg98k9DiKbVavNwtPn6UnVm00BrIEul3sZe+fn
	ebq6LN4N7PJP7LQId5BBdzo3Fj/s7Yb4Svu+HdckcRVzAzQzfB3zgBgErJkbKQ==
X-Gm-Gg: ASbGnctIdrB2tK0Tbaw3VrWOnOMG19pUqHlg4UW1QsmmNpd9KyMFMCXGCpkHFWz6T8n
	1HHjzLXhaJZZqHjplElbbZAh+bJL92wPa4y/Ydq7RnLbo2ru5iP2fV87wv791/oII/rhcgNmMVs
	uO1D/G+9NqockGc2Yaak4FwK/VAnfumVuNML6KOIHB2cK6dXnuuvaVP/5kh0AhtmIUymFijXJH1
	p94Fpb5Fec6Jvi3EKY9B43Jxk+zgv/0k/GWC2KVlgMeChisisl2A24w9GbWF4hFhhZl5cwOYeKD
	TpqViaRC1OyVnSVeA3UwFqwSp5SZaZzARBbbKxyrnN93mMeZPutuxIYtplB/8X7/0075lQ1FT95
	JXVf+8as/awWFHvmGYkSFc3UqgqPKmQ==
X-Google-Smtp-Source: AGHT+IEJBbsXlyGzIhfEJG7mCoBzbE3NZ1nmIptbsyoxy4cA1LVTBw7WpYZ0PAVjjrQkQf3F2LNCFw==
X-Received: by 2002:a5d:6daa:0:b0:391:42f2:5c7b with SMTP id ffacd0b85a97d-39ad17466a4mr3908674f8f.16.1743081408792;
        Thu, 27 Mar 2025 06:16:48 -0700 (PDT)
Message-ID: <14d9be78-39c9-44b2-b6d8-6ff5fe1b8409@suse.com>
Date: Thu, 27 Mar 2025 14:16:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/config.h: Move BITS_PER_* definitions from
 asm/config.h to xen/config.h
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>
References: <4f085bcbf5b6f1bc42824bfb08724e8a9bbd4918.1743005389.git.oleksii.kurochko@gmail.com>
 <17a808cf-e676-4c30-9068-34a9a4d568d7@citrix.com>
 <c3d6a46c-c372-43f2-81d4-8128ebcb1b2b@gmail.com>
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
In-Reply-To: <c3d6a46c-c372-43f2-81d4-8128ebcb1b2b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.03.2025 13:50, Oleksii Kurochko wrote:
> 
> On 3/27/25 1:44 AM, Andrew Cooper wrote:
>> On 26/03/2025 5:47 pm, Oleksii Kurochko wrote:
>>> diff --git a/xen/include/xen/config.h b/xen/include/xen/config.h
>>> index d888b2314d..dbbf2fce62 100644
>>> --- a/xen/include/xen/config.h
>>> +++ b/xen/include/xen/config.h
>>> @@ -98,4 +98,13 @@
>>>   #define ZERO_BLOCK_PTR ((void *)-1L)
>>>   #endif
>>>   
>>> +#define BYTES_PER_LONG  __SIZEOF_LONG__
>>> +
>>> +#define BITS_PER_BYTE   __CHAR_BIT__
>>> +#define BITS_PER_INT    (__SIZEOF_INT__ << 3)
>>> +#define BITS_PER_LONG   (BYTES_PER_LONG << 3)
>>> +#define BITS_PER_LLONG  (__SIZEOF_LONG_LONG__ << 3)
>>> +
>>> +#define POINTER_ALIGN   __SIZEOF_POINTER__
>> See how much nicer this is.  This patch possibly wants to wait until
>> I've fixed the compiler checks to update to the new baseline, or we can
>> just say that staging is staging and corner case error messages are fine.
> 
> Do you mean this patch:https://lore.kernel.org/xen-devel/20250320153241.43809-3-andrew.cooper3@citrix.com/?
> 
> I haven't checked clang but if to look at gcc then these builtin macros was introduced in
> 024a85aeb6a("c-cppbuiltin.c (builtin_define_type_sizeof): New function.") and it seems like even older then gcc5
> contains this patch:
> $ git tag --contains 024a85aeb6a912811d917f737eaad39140c2fb0c
>    ...
>    releases/gcc-4.3.0
>    ...
> 
> Am I missing something?

The check yet to be adjusted is looking for 4.1, so 4.3 would already be "too new".

Jan

