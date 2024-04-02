Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 108A6895942
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 18:07:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700217.1093000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrgei-0002Ub-UQ; Tue, 02 Apr 2024 16:06:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700217.1093000; Tue, 02 Apr 2024 16:06:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrgei-0002SH-Rc; Tue, 02 Apr 2024 16:06:36 +0000
Received: by outflank-mailman (input) for mailman id 700217;
 Tue, 02 Apr 2024 16:06:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hiiI=LH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rrgei-0002SB-0l
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 16:06:36 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa408f13-f10a-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 18:06:34 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4161d6b2582so4201225e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 09:06:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g18-20020a05600c4ed200b0041495d17992sm18406176wmq.34.2024.04.02.09.06.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 09:06:33 -0700 (PDT)
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
X-Inumbo-ID: fa408f13-f10a-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712073994; x=1712678794; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uN0mMZ7+4fJU1viAYXRongmOALft35oC1xjYQwR87Pg=;
        b=MaNcfG6T2KbXixp8FbBwk20JVFnKrwh3ZsYpmQ4vi8Fhpv1K5eVqK8Mg9ToHnGr1os
         fbckaSypnfGOmsOZsaqPhdZlBAF7bIN913hMJsyPCj5YEPaZXqx8yNEPcc73FS8qC2cu
         x8s28i7Jehs6GnpZmaQnicfHxb8zio1tcpudV4CkScwOwF+MyJCJq/zcF9elLh5/Z5Mg
         nL5vt3ZknJCb/gdf8KqqMxJuPa9W9DejZzcjQebFDQPDjLSHvhPlgI6tBEgSMATH3gzG
         vIBrvCL9MiWmIsZ9k/TcMy3G5SD0NOfRPZanWd6t435iZFRFU07YgRpq+c4lVqVMunVC
         LvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712073994; x=1712678794;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uN0mMZ7+4fJU1viAYXRongmOALft35oC1xjYQwR87Pg=;
        b=AO75CKNR9qMLAkKPFM74GRnF8i9xpyyP0wc9Wh30+N4r9j6XCTAmiOsWWmXNrBzZgA
         g8YUX6ZltRl5K4VzUenv9tQ8e2AdNwuXliflgAxkUUdHimkZCKsgLPPoHwf8aWEI8afC
         ML5avuljBcHPgAQx2Da+0qAqe6eQMvyMezzvzy1zjk8+o0PsPBgpdMihn/s9JPr9vRLZ
         kUKcyAL/2hNSQH7USPUVx1aFOEyutJpQEGrJAKPY2yIlR4PWOrDLb1f0HWTKxW8i3PXH
         ZCXCoHV1Ed3IG4pssPdxyOk9EqZp02p10+XdvMDNhK8Txyg1UglGRNSqb0lahyM8wITv
         v9Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUfV7LG0l50zz7IlaSi9Kzmv7a+LvQ0dhZxb+yFuj1xMSPpfX4X1V3sScpmBr1vO0SC3zZYJNJApOqAUxAXFf/nvSqzCwRd6+aOuHHTYKc=
X-Gm-Message-State: AOJu0Yya4f3lTd9gQWY9uG7NFA3vu1ex+PO9bTM4xOnUW4JBCkR0UA63
	vSgwNZwkklEaT0oBaadU+Le3f+zN6YAui0LnQbTNtEcotqQCLj8/kAD+FFkT5Q==
X-Google-Smtp-Source: AGHT+IE2KcgTk7MOR+FhpTRKWrk3Ga/93V4Xh61pax6AWdxzOGnDQVXYyihN7uU/SvdiFbzo03WZMg==
X-Received: by 2002:a05:600c:b56:b0:414:cd1:e46d with SMTP id k22-20020a05600c0b5600b004140cd1e46dmr176683wmr.23.1712073994106;
        Tue, 02 Apr 2024 09:06:34 -0700 (PDT)
Message-ID: <5f5b2904-48ca-493a-a353-4c2f9038f5d3@suse.com>
Date: Tue, 2 Apr 2024 18:06:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Address MISRA Rule 13.6
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240402154339.2448435-1-andrew.cooper3@citrix.com>
 <35fc596e-8134-4471-83d4-40b01f5821bf@suse.com>
 <6ac9cb14-2e68-41d6-b061-c7caa74fde5b@citrix.com>
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
In-Reply-To: <6ac9cb14-2e68-41d6-b061-c7caa74fde5b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.04.2024 17:54, Andrew Cooper wrote:
> On 02/04/2024 4:46 pm, Jan Beulich wrote:
>> On 02.04.2024 17:43, Andrew Cooper wrote:
>>> MISRA Rule 13.6 doesn't like having an expression in a sizeof() which
>>> potentially has side effects.
>>>
>>> Address several violations by pulling the expression out into a local
>>> variable.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> with one caveat:
>>
>>> --- a/xen/arch/x86/irq.c
>>> +++ b/xen/arch/x86/irq.c
>>> @@ -1150,8 +1150,9 @@ static void cf_check irq_guest_eoi_timer_fn(void *data)
>>>      {
>>>          struct domain *d = action->guest[i];
>>>          unsigned int pirq = domain_irq_to_pirq(d, irq);
>>> +        struct pirq *pirq_info = pirq_info(d, pirq);
>> Misra won't like the var's name matching the macro's. Can we go with just
>> "info"?
> 
> Ah - missed that.
> 
> I can name it to just info, but I considered "struct pirq *info" to be a
> little odd.

I agree, but what do you do with another "pirq" already there.

Or wait, what about

        struct pirq *pirq = pirq_info(d, domain_irq_to_pirq(d, irq));

?

Jan

