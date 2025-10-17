Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA881BE6A4C
	for <lists+xen-devel@lfdr.de>; Fri, 17 Oct 2025 08:24:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144947.1478136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9dsf-000503-Hl; Fri, 17 Oct 2025 06:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144947.1478136; Fri, 17 Oct 2025 06:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9dsf-0004xU-EA; Fri, 17 Oct 2025 06:24:01 +0000
Received: by outflank-mailman (input) for mailman id 1144947;
 Fri, 17 Oct 2025 06:24:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9dse-0004xN-Vt
 for xen-devel@lists.xenproject.org; Fri, 17 Oct 2025 06:24:00 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd66c9c1-ab21-11f0-980a-7dc792cee155;
 Fri, 17 Oct 2025 08:23:58 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3ee64bc6b85so1403231f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 23:23:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426fc54b32dsm9285789f8f.30.2025.10.16.23.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 23:23:57 -0700 (PDT)
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
X-Inumbo-ID: dd66c9c1-ab21-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760682238; x=1761287038; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=89hCIi5dsMDnTwjBm1BqkAEpIOXlh1NBwRjMATfpyWE=;
        b=daZBPI8bQFmKLabRE/J1CQ3zmAPYcZQAD6soARXZSDJ5KXuK3M5UZT0Y9pY9xrXiNB
         ftl+y/6j2WgC9QTOvG0crTx4OECAk+ey24cc9e/Mumx1L7f9SwkjbE9H1SHsmwk3Y+D1
         jBPkfy1GtqBn3v0APwoUm2+ja+pmjg2gWtUYEerC/CuSPUtvQZinf3UaMrEOIOu2PYcm
         Gi6R+2Xzc223Nx0ulnQ5pGHbF1S69L5Zt3cpOfqdkOPMNMyxTXuLyMZ5DRB6QogxNvV/
         9ZfahbIOVnsmjCU6+I7dmIHn0wfCQ0Me8PJ8SXvpWGViwoNCDoL/GeyvEyxv6A753k04
         9cvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760682238; x=1761287038;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89hCIi5dsMDnTwjBm1BqkAEpIOXlh1NBwRjMATfpyWE=;
        b=AK0r6xBiNpA+XofUpSCHDh0n7Sj+XRsPD28r48Pxo4HH/guRXBetG8zkt+lavUbGxf
         KFGXr+eXQtT2x7228C9fhZDM49zrLLhyO4S95ZZVIMHrJyo5Z6AD7J77JmXRVfWqYx5Y
         ZISFnyoKa/LDW6euigX4MQZ+aE7P6uXd2p0r81RNs5PZYGRZKLQlUX4Qhnz1t9pViK0d
         o8NPfSymAsLAyTB5wTKcmfes7zhb8lnpQGLznYpgc2oDOICCW2DcDiLJA2TLJg4HalgO
         Egy1F7LsajpqTRbpqz1ByZFxBvUbBdC0a3a9rZFTYgWrBxT/AfTeU92QkPdm+JyvF/zM
         c13w==
X-Forwarded-Encrypted: i=1; AJvYcCWqtLWEyfqSFpmikqDNtVHzf9DMcmZz8e5GEAgrPWfAXeWKN7gu66Ixv9dVqqnEB+xQitJYiKq8obw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxS91KoVf5DhoX6Q+NKwlZkfHTTPBg+fx6tHGsF4qsUsxuicf0
	0T7RDnApNDnsy2FT/B0CxEciUPS5Yx8p6zw/EFaQUyyqEeaKQtaH6ad7+WDhKn8gOQ==
X-Gm-Gg: ASbGncsnwTp5Meraw+z4FoiCeEBH/BHsDUuH62Vs2+WFhr7CUKsUHPQX8blVcjXvlrx
	4P11lgHd4cQKEn6bp97/oinkexpJe88uiM+4XVKW2PcKPtMtXonEUmOWE6hD4QoFCDG2KYW5z8n
	+WTE8qrH27yYC8bkJPCDD07F0EdDywBiApnWzfF8414YA9xLq5vJoCODR5zzOUyE2Ys5V9dMpje
	bjP3Y4HwBbtDDcR2FO471Ms97GK1eArplr6TaWVvARtf1qBXLGhdrSp1hbuKlHcyE1XsB8W+Y/s
	WWnik8Rokor/n3Ito1UP50wMRjzpINJ4VmsnxaXezIiQUbYt99abmpfgh5FNbSTSrqbj8ZAoCOn
	HXteR/qIuwuD547nmOlJERzR+vGODHg2hN7tZYPgltbhkVcOMzURVKSw4Y8oOd6+fhjpgroyPvd
	FOEq9O4p5QQYbPnZGJLDpx5LscdOAJPPC66DXUd4bFg6kJHaEc1V98ZWU5j5dZTiq8O13dHunX5
	9DAtBZ6cg==
X-Google-Smtp-Source: AGHT+IEqOQf8zZL8g13a/t7tQnV5O7w1RuICTNzFn5p7aeDyLMUIGwiWjtu4VkZ/Xm4eZAZuaTecDQ==
X-Received: by 2002:a05:6000:2dc1:b0:414:6fe6:8fbd with SMTP id ffacd0b85a97d-42704dc4a3emr1740966f8f.54.1760682238038;
        Thu, 16 Oct 2025 23:23:58 -0700 (PDT)
Message-ID: <1d991549-b25e-49a9-bfac-f5463819807e@suse.com>
Date: Fri, 17 Oct 2025 08:23:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 03/10] x86/HPET: use single, global, low-priority
 vector for broadcast IRQ
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
 <64d52793-be70-4ae8-9bae-ad88f6379395@suse.com>
 <d4b8ebac-fdb4-48fc-8ff1-d16492d440d2@citrix.com>
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
In-Reply-To: <d4b8ebac-fdb4-48fc-8ff1-d16492d440d2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.10.2025 19:01, Andrew Cooper wrote:
> On 16/10/2025 8:32 am, Jan Beulich wrote:
>> Using dynamically allocated / maintained vectors has several downsides:
>> - possible nesting of IRQs due to the effects of IRQ migration,
>> - reduction of vectors available for devices,
>> - IRQs not moving as intended if there's shortage of vectors,
>> - higher runtime overhead.
>>
>> As the vector also doesn't need to be of any priority (first and foremost
>> it really shouldn't be of higher or same priority as the timer IRQ, as
>> that raises TIMER_SOFTIRQ anyway), avoid any "ordinary" vectors altogther
>> and use a vector from the 0x10...0x1f exception vector space. Exception vs
>> interrupt can easily be distinguished by checking for the presence of an
>> error code.
>>
>> Fixes: 996576b965cc ("xen: allow up to 16383 cpus")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> This is so cunning that it took me a while to figure out how this even
> functioned, given no apparent change to TPR.

Yeah, the TPR part took me a while to figure out. I was scratching my head
as to why I wasn't seeing any interrupts, until I figured I need to make
that adjustment to FIRST_IRQ_VECTOR.

> Having this behaviour under FRED is easy.  In fact, allowing the use of
> vectors 0x10-0x1f under FRED is one "extra" I haven't gotten around to
> doing yet.

Ah yes.

> But, the problem it introduces under IDT is that for all the other
> reserved exceptions, we'll panic if we see them.  That was the point of
> setting TPR to 0x10 originally.

Which would be a clear indication of something being wrong, rather than
things misbehaving (likely) entirely silently. So more of a benefit than
a downside?

Of course, if we were afraid of other vectors getting signaled, other
entry points may need amending similarly to what I do to entry_AC(). It
then isn't quite clear to me what, if anything, to do to entry points of
exceptions coming without error code.

Jan

