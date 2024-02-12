Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12219850F75
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 10:14:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679370.1056809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZSNq-0002Ax-PD; Mon, 12 Feb 2024 09:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679370.1056809; Mon, 12 Feb 2024 09:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZSNq-000291-MG; Mon, 12 Feb 2024 09:13:50 +0000
Received: by outflank-mailman (input) for mailman id 679370;
 Mon, 12 Feb 2024 09:13:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6iVD=JV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZSNp-00028V-Eq
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 09:13:49 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07bd684b-c987-11ee-8a4c-1f161083a0e0;
 Mon, 12 Feb 2024 10:13:48 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-410980dfddeso11438635e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 01:13:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w17-20020a05600c475100b00411062c123esm588355wmo.26.2024.02.12.01.13.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 01:13:47 -0800 (PST)
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
X-Inumbo-ID: 07bd684b-c987-11ee-8a4c-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707729228; x=1708334028; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HFjzuwMBDZJ7f9kgbBbpIVc5q05kTOXXs6u4l/tVAr4=;
        b=er1W4W1S1DXov3u50QhFmcGMSoctZnp9D147U//DkbWUsUAuTncc+9f7EqnXPD7nHb
         TK38uFRHAVarz3jM/3LUcpB0SWXfClYMcgZ4Mnr7GpWJTFU9cIU1gY4Rbc22fHMo4cSl
         yELRAWxfuM/uVAY++NkRzY37P5ftZMKa5VLCRULsaVURpDM/aE93ZKASvRTYTDPR3E45
         sMIQxfEK6kmvZJ9gTMZmgl53F+EUfi3brB9jJbJYQO7yvLCtdrwSIKccDWrFv1ZviGsy
         wB1y8OmNIb1AtCEob9syf+a6b5DOm40eOz/TcRlBrwv6P3ltpVIvrI1AMPMV3iCRTAcy
         i8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707729228; x=1708334028;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HFjzuwMBDZJ7f9kgbBbpIVc5q05kTOXXs6u4l/tVAr4=;
        b=VvP604fvSBLcinX7oDP/q18e/yrYdMZcEkmJBG7KJWMP8tn/T5lTWvSQF1+AIko26/
         kToc9YfRdzB63Xn1nVubS68z2EeldRAVGwAYcEl76uojtTjd8XjemWVfk3XkyfOHyjWf
         mDoLIgB47yhZUUpmVb+VRVThlhHb6T5YC09QhZ0eHFI5C1ml2RLM5Bg3LdMkwMuaAb3H
         8LcdLRaU5mfeuLosEz3Ip0HHFsWKAq/UNpW9wx+iPCdxA2Tq+z5KhrOlDajtoGFn/o05
         uj1EoAQYcL4CVxZf6+67VmEiSx7kSnOdrQvCX821PabNrE/Zl3GbnpRMoNDy7jFbjGHA
         QuCA==
X-Forwarded-Encrypted: i=1; AJvYcCVrRYyTwxbmyXZO8vdBb0G2Oxh1k4lFMgemIxaHwz9i8WI/zUNYGqOibtlJfoT/tU3XytSRAIdf4N7yS3ymH1qCZx+o+CTKrMldpIDAKT4=
X-Gm-Message-State: AOJu0YzGxjaAsg2+Ii1vYijmmFx1K6hQO3//FI/noFLT+ILZTaiNi4we
	IvLluglDBJiKB+d73tbP9QTWtiP3Z0dVBoSm62VZxAKwfUQ6JPx8dOkB1nTalg==
X-Google-Smtp-Source: AGHT+IETY46VMWDlS4gCkA+GYk7DDmwNianw74Rrxna2C6hWdU6DMK5nXa/pUSy3PxCS66Y7koD27g==
X-Received: by 2002:a05:600c:190f:b0:410:c804:e891 with SMTP id j15-20020a05600c190f00b00410c804e891mr2266232wmq.16.1707729227827;
        Mon, 12 Feb 2024 01:13:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXlC8c60wPosj/b3crQMiWAXZStE4Rc78XWIyH+1ooLP/Ob+tz5aac8CJmY8Ycnvmw2MuNKQ6wd6xevx7TJrMXZVK9IPUoLCeZ9GwK5HlFy+9yBbbhOwZBq1QihhyystEOeUUfF+0/oZGTfpdRMmt2bLbx7A2hzDWVM3NpktF6JIe2pkIH2+X6Sc53dsQ==
Message-ID: <bdba33b7-7fc2-4836-8b78-0d56edb30871@suse.com>
Date: Mon, 12 Feb 2024 10:13:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] keyhandler: drop regs parameter from
 handle_keyregs()
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ebc330a9-eafa-4858-b5cf-5694c4da911d@suse.com>
 <5258d8a9-a7ef-4342-9b5c-fc0078139bb2@suse.com>
 <0bbe2028-946c-459f-b6cc-419869d22b35@xen.org>
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
In-Reply-To: <0bbe2028-946c-459f-b6cc-419869d22b35@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.02.2024 23:09, Julien Grall wrote:
> On 05/02/2024 13:28, Jan Beulich wrote:
>> In preparation for further removal of regs parameters, drop it here. In
>> the two places where it's actually needed, retrieve IRQ context if
>> available, or else guest context.
>>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> As an alternative to the new boolean parameter, I wonder if we couldn't
>> special-case the idle vCPU case: It's only there where we would not have
>> proper context retrievable via guest_cpu_user_regs().
> 
> I am trying to understand the implication. Looking at the code, it seems 
> in the case where we pass NULL, we would expect to call 
> run_in_exception_handler().

Right, when NULL was passed so far, and when true is passed now, that's
to indicate to invoke run_in_exception_handler().

> If I am not mistaken, at least for Arm, regs would not be the same as 
> guest_cpu_user_regs(). So I think your current approach is more correct.
> 
> Did I miss anything?

Whether regs are the same isn't overly relevant here. The thing that's
relevant is whether what would be logged actually makes sense. And
invoking guest_cpu_user_regs() in idle vCPU context makes no sense.
Whereas in other contexts its result is good enough to show the present
state of the CPU; there's no real need in such a case to go through
run_in_exception_handler().

The present approach therefore isn't necessarily "more correct", but it
is closer to prior behavior.

The corner case that makes me prefer the presently chosen approach is
when a CPU is in the middle of scheduling, especially considering x86's
lazy switching (when current != this_cpu(curr_vcpu). The main reason to
mention the alternative is because iirc Andrew had suggested to move
more in that direction.

Jan

