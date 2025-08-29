Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5460CB3B362
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 08:30:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100602.1453969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urscU-0007HQ-7x; Fri, 29 Aug 2025 06:29:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100602.1453969; Fri, 29 Aug 2025 06:29:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urscU-0007Fn-5B; Fri, 29 Aug 2025 06:29:54 +0000
Received: by outflank-mailman (input) for mailman id 1100602;
 Fri, 29 Aug 2025 06:29:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urscS-0006zk-KH
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 06:29:52 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91205e77-84a1-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 08:29:50 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-afeceee8bb1so251358766b.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 23:29:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afefca0e0basm131617866b.39.2025.08.28.23.29.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 23:29:49 -0700 (PDT)
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
X-Inumbo-ID: 91205e77-84a1-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756448990; x=1757053790; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NKPuM8A6pdXjZulZnYRD439gNJuM9nVaFGmGH2Ryd1w=;
        b=RnzCnl69Tggumc85G4xipX5ybH9yjyBznjB4wf5oNymJZxG1rQKfgoF7hlcyzlhY+7
         LE5R1dSs4xs9tJNq+X5sBiPdFIOs5fAOPBh3REYViBqBwm6mHCEJT489yevJZ9O6ozaQ
         sqPtQM56vYxwICbA3UJfSne1jSIGxkGYzgkkWlVIPMSfMjhMWF6XSp7PLoGx3J44RUZR
         YxpNGlPH08Nrgb21gXyOF+o691UAnolowRT7CE89G7JTPT3gT3r0+rMiahJDhSPSvYxe
         uL+78eE8rcrHAeNCbyEHBQM4Ga4SMGPzkn91v0G3mH/3EE/dU/Irx4kc6MXo+QzLw2eQ
         dyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756448990; x=1757053790;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKPuM8A6pdXjZulZnYRD439gNJuM9nVaFGmGH2Ryd1w=;
        b=U84ETxOAUN5L/CaTCV5sAUz0TMxmNTAy4f55kiLnoIIe57uqJG0OpJ8g8a4l3DjIyg
         pnXRo8vnMjJ1bhVzdlyTatNXw/jMDATuGHJfMCSBJlCV0tMdV8WjRFvFMEx0QqPM+2QG
         gV6t8uGQj8+QJs/sNZk9O1yfpUmaWu5/6Ad9RdYZ1wO49sIxvjsJm63pzIuyTHpNsc8T
         uV/Ft4FQ2W9Wxsf8TnHo5el0RD0pyFoG6eAp2wXaJmF5gSe+Ncwaeku19FW8/EAHnLV7
         4LnFO0pw77eXxuv2Ow7J2iQRpukhl4RDdqvHsaZXaQULr4WPg3edlW+7MJkgBHeDcWs6
         mxAw==
X-Forwarded-Encrypted: i=1; AJvYcCWjUZWSq3be1Wofy7zaEFUFRsc3x1p5a8ssyfK2M1N7upf1yfAVjr9Owl9JqP5NQh5XOv9W9BfkknY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzjASQZcDUekb3vTwmIH/chx4yl3NkTjWXoHREq8BfkRaxJmQzE
	W2uC62xU35u07ou2Qw0PgLwKfmhnUmnvjw57vvDE08i8R6CuLDiquOcioqGS8UBE2g==
X-Gm-Gg: ASbGncuxjjEYRektRgH2FLCpaHB/vITMFmh2VG79677cFw5tL+9BgJFwYJUCPXmqobW
	ofoYy7Td+fRQkK/oe1BDyDzn25MXb3MTlY5LTlqCJ3+s3Xqgx6eoP099PiAOmIHVSZn3lGlh/WJ
	Eyb4MQ+Bc3wZdB2t5eBIDpwWiWd2ez5+xPePUHcNVWlu58ykw4WtdQidlWTepDQD0X/G9151YsQ
	iEAgaOEA/xCXoL0ZONyTDf6X0aqspWBUVTJi/4N39L+MzpjOyvAvmt9Ul+6zF2IGQJnQVMzBEwJ
	92ISyd/fT1Yo1uLNt4ZYd0pRbbWY0oadyL9hU1cyN8q9s6Ck4gTQ87EVjqiUaQjvy9FjdyE86Kl
	d3A5qqN1pCg37EQe/vqesY7z/OjpLrcqCdNa5XXqmrjwcUkoUJoFKsjs1jtARDjX7uje2NyNWmW
	7QO7c6IHs=
X-Google-Smtp-Source: AGHT+IF+/WaFyPVArHuBEtqNrGhAAzVnbk/ZU9kCfN4nsXGLiQ//JCCMgfmyLCNNBZKhZJmLYXlsKQ==
X-Received: by 2002:a17:907:2d10:b0:afe:c1e4:5554 with SMTP id a640c23a62f3a-afec1e457b6mr854676066b.38.1756448990175;
        Thu, 28 Aug 2025 23:29:50 -0700 (PDT)
Message-ID: <2b34c868-7562-4824-8a1a-72df7348dbea@suse.com>
Date: Fri, 29 Aug 2025 08:29:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: introduce "hot" and "cold" page copying functions
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1b9e5d46-20a8-4b5f-b938-e28a0429c770@suse.com>
 <4d06bd13-6f75-4dcf-aa4d-c225139c2575@amd.com>
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
In-Reply-To: <4d06bd13-6f75-4dcf-aa4d-c225139c2575@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 23:33, Jason Andryuk wrote:
> On 2025-08-28 05:17, Jan Beulich wrote:
>> The present copy_page_sse2() is useful in case the destination page isn't
>> going to get touched again soon, or if we want to limit churn on the
>> caches. Just rename it, to fit the corresponding {clear,scrub}_page_*()
>> naming scheme.
>>
>> For cases where latency is the most important aspect, or when it is
>> expected that sufficiently large parts of a destination page will get
>> accessed again soon after the copying, introduce a "hot" alternative.
>> Again use alternatives patching to select between a "legacy" and an ERMS
>> variant.
>>
>> Don't switch any callers just yet - this will be the subject of subsequent
>> changes.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks.

>> To avoid the NOP padding (also in clear_page_hot()) we could use a double
>> REP prefix in the replacement code (accounting for the REX one in the code
>> being replaced).
> 
> Did my tool chain do it automatically?
> 
> 0000000000000000 <.altinstr_replacement>:
>     0:	b9 00 10 00 00       	mov    $0x1000,%ecx
>     5:	f3 f3 a4             	repz rep movsb %ds:(%rsi),%es:(%rdi)

Interesting. That looks like a bug to me, when source code merely has

        rep movsb

Did you also check what copy_page_movsq (i.e. "rep movsq") expands to?
What gas version is this? With 2.45 I get

0000000000000000 <.altinstr_replacement>:
   0:	b9 00 10 00 00       	mov    $0x1000,%ecx
   5:	f3 a4                	rep movsb (%rsi),(%rdi)

(the omission of segment indicators when there's no segment override is
indeed a change in 2.45).

Jan

