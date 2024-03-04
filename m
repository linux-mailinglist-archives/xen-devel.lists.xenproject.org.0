Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5BC86FC6E
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 09:55:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688219.1072154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh45y-0005WA-IB; Mon, 04 Mar 2024 08:54:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688219.1072154; Mon, 04 Mar 2024 08:54:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh45y-0005Ud-FV; Mon, 04 Mar 2024 08:54:50 +0000
Received: by outflank-mailman (input) for mailman id 688219;
 Mon, 04 Mar 2024 08:54:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kl9k=KK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rh45x-0005UX-I2
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 08:54:49 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9e5a1d6-da04-11ee-a1ee-f123f15fe8a2;
 Mon, 04 Mar 2024 09:54:46 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a2f22bfb4e6so687951266b.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 00:54:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 yk1-20020a17090770c100b00a42f4678c95sm4533959ejb.59.2024.03.04.00.54.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 00:54:46 -0800 (PST)
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
X-Inumbo-ID: d9e5a1d6-da04-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709542487; x=1710147287; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XCnjEmRHlvJKM6m8BW7+Bp/9cjUdD9Md5fggTNmIsXc=;
        b=BgO6/glgt1n5ol8GmSChdlrif0y+Y0Dt58DRAVaPduQjHca7g685MX+WmLM8gJYCNO
         QyiklUn/6PRS/81ZX3ITfulTrgwU74GoWJEmXRmYvtk/LhziMWE9INXyC7m7evDUtTNP
         mcj5uauhFbOM0d8k4Q7te9SY/7Y+PFNcKlBduYskoisFPHPbkUXsGWm20PiPb4wCFlIz
         TLfpPZzXUfR/aPndLMT0SqxmzY3hGVZUNS/HreF9Pi5CBC9mo591zsL1feMCwoRo8qMP
         1bU6qRneGg5yBO6l3a2pmrw5zA2Z5cAtU4Jz+KXEkckIjEneSz2dSXFVasWH3Uvr8CxG
         zzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709542487; x=1710147287;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XCnjEmRHlvJKM6m8BW7+Bp/9cjUdD9Md5fggTNmIsXc=;
        b=uQlLiDFj2cMN935cK4rgXlgbCCiin34E0a931OFOc4I7jnNSvyx9lNAsUnJ8pV8lwS
         TwNTDM2sO4jXq2UdCTpqu8FOS3qM/RUK7Jp7Z4ieb/a9yuVy7cwa06pJZC4yeMmGedrR
         8ReSNLosQA4O5GQVPHgjIqozXWq7/Q84mx7Nqc67VhJlBujzzGV9FagvndZzL0NyUS4I
         BjlGEk07B7phVmNVm1G952INhqiT3mppQtCgN9D/+255mVhZldsn4+2dg8OmunFjLrZ+
         58+k1DL0cTAtBa5iVO7WvWMUYWWY+M5C+xjj8EQYlF3XEjiaIO3z5KdRWQ/NtRqSTn7Q
         uF4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX4A79crIgzRj3SE3gd1qZTlv19ITtiAdiy4klWttx0hyYUGbvnIGLQZ1LUecgkzjV9aOKfrRQiO5Ine1eO5lJS/PiY+XT232zEJnchdb8=
X-Gm-Message-State: AOJu0Yxdxw/usx+43z8LHPna7t+88sa4BgUWOKu2Scowy87ZZEZnT8jL
	jhRuZvrzoe8FZDGWYWl4ok3yGzNPi7gI7ZlCDewhJzSa+I2VwYjJUDs1vXQaZg==
X-Google-Smtp-Source: AGHT+IG5IsFDgYWyNh0dTQfQGQgwf3/GyANL/rmEeGlMLX8ERFc2rQIdBeLkXYsjQaoXmjmbUfh/Fg==
X-Received: by 2002:a17:907:20b9:b0:a3e:7dbe:298b with SMTP id pw25-20020a17090720b900b00a3e7dbe298bmr5080947ejb.24.1709542486949;
        Mon, 04 Mar 2024 00:54:46 -0800 (PST)
Message-ID: <c415eaf1-78ea-48b7-a423-d085cb80e724@suse.com>
Date: Mon, 4 Mar 2024 09:54:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: re-implement get_page_light() using an atomic
 increment
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240301124228.56123-1-roger.pau@citrix.com>
 <6796aeba-52a2-426b-94e5-1852946dce98@suse.com> <ZeWLP14w8UUeVncq@macbook>
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
In-Reply-To: <ZeWLP14w8UUeVncq@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.03.2024 09:50, Roger Pau Monné wrote:
> On Mon, Mar 04, 2024 at 08:54:34AM +0100, Jan Beulich wrote:
>> On 01.03.2024 13:42, Roger Pau Monne wrote:
>>> The current usage of a cmpxchg loop to increase the value of page count is not
>>> optimal on amd64, as there's already an instruction to do an atomic add to a
>>> 64bit integer.
>>>
>>> Switch the code in get_page_light() to use an atomic increment, as that avoids
>>> a loop construct.  This slightly changes the order of the checks, as current
>>> code will crash before modifying the page count_info if the conditions are not
>>> correct, while with the proposed change the crash will happen immediately
>>> after having carried the counter increase.  Since we are crashing anyway, I
>>> don't believe the re-ordering to have any meaningful impact.
>>
>> While I consider this argument fine for ...
>>
>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -2580,16 +2580,10 @@ bool get_page(struct page_info *page, const struct domain *domain)
>>>   */
>>>  static void get_page_light(struct page_info *page)
>>>  {
>>> -    unsigned long x, nx, y = page->count_info;
>>> +    unsigned long old_pgc = arch_fetch_and_add(&page->count_info, 1);
>>>  
>>> -    do {
>>> -        x  = y;
>>> -        nx = x + 1;
>>> -        BUG_ON(!(x & PGC_count_mask)); /* Not allocated? */
>>
>> ... this check, I'm afraid ...
>>
>>> -        BUG_ON(!(nx & PGC_count_mask)); /* Overflow? */
>>
>> ... this is a problem unless we discount the possibility of an overflow
>> happening in practice: If an overflow was detected only after the fact,
>> there would be a window in time where privilege escalation was still
>> possible from another CPU. IOW at the very least the description will
>> need extending further. Personally I wouldn't chance it and leave this
>> as a loop.
> 
> So you are worried because this could potentially turn a DoS into an
> information leak during the brief period of time where the page
> counter has overflowed into the PGC state.
> 
> My understating is the BUG_ON() was a mere protection against bad code
> that could mess with the counter, but that the counter overflowing is
> not a real issue during normal operation.

With the present counter width it should be a merely theoretical concern.
I didn't do the older calculation again though taking LA57 into account,
so I'm not sure we're not moving onto thinner and thinner ice as hardware
(and our support for it) advances. As to "mere protection" - see how the
less wide counter was an active issue on 32-bit Xen, back at the time.

Jan

