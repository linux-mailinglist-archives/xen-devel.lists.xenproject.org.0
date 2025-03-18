Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E18D9A67857
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 16:51:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919476.1323912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuZDa-00038y-0b; Tue, 18 Mar 2025 15:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919476.1323912; Tue, 18 Mar 2025 15:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuZDZ-00036t-UH; Tue, 18 Mar 2025 15:51:01 +0000
Received: by outflank-mailman (input) for mailman id 919476;
 Tue, 18 Mar 2025 15:51:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuZDZ-00036i-5n
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 15:51:01 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9b88eba-0410-11f0-9abb-95dc52dad729;
 Tue, 18 Mar 2025 16:51:00 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so35772575e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 08:51:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d40fe4dffsm1123135e9.40.2025.03.18.08.50.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 08:50:59 -0700 (PDT)
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
X-Inumbo-ID: c9b88eba-0410-11f0-9abb-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742313059; x=1742917859; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gW4RLbBaHdp0ERmcz6xbcoJzQqWddkaGXditgrLANb4=;
        b=Z833ZlTzATG/huhoOFEtkDQh+twYdqDVXXULpL51CN6ZKHHrBn6X67ukCrzvMZbLk3
         83z+K8BfIwAY/tRFEIwqCArxbS2ylwChz3GuXtsLC7FV4iT6hMmL4i/rcV9xzODErHBQ
         w2IeBu5qshzms+lC1K1P+dXee9TQ4TWvNrDBbPwOLoUzj4SMKbGSq5ntmjcWG16ALrm4
         XBjSSaxi+MTsJ9bmJ2It52dSepuIHNGnhY6qNuFfUYMgqOLTrBY8QPCq19d2EKdfuBu8
         V6JXiiapNVCUQGNUdZX3oAaeLSbb3rWk7LSNvVmpvfwHvVP4fZ8vlH1wTl7dQDgaHsSs
         ouGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742313059; x=1742917859;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gW4RLbBaHdp0ERmcz6xbcoJzQqWddkaGXditgrLANb4=;
        b=r0oZZJxdzsU0cjLqjUUzGWx0M5M430ONgrQyC/75G1cFkH2AMep9KJhhlBHp6nrSkq
         Wf7F6/OlEkehC9OlzxX+xGGbzDnotOzr9n+EkOi5xm0f9oBUmOEwnnHyE5tB7cYXeqCP
         DDyr9mTPKNIzLD29T69JUIl61XS59dTYoXLWUz/YDcnKSR3j3TCZoNjZkUcVUXvMhILd
         WFHy10IOjxmlmEhORwAvGzIvCetGY4ZlyObaKIgf68MrXJ1GlwFzT0h5PwV3QWk4+BlT
         bXTtDqYgUfha5uRuTXlsmtZgdqfYkt5VTOkNW+D+c8Q74fbhkIkRgCHNiOdl3s3o87SQ
         oe0A==
X-Forwarded-Encrypted: i=1; AJvYcCUOBiyWjJR7TvjhlPbmH/Zg1OMT8xU7h3jt2y8JtTa8gUGxTw6OZqS3/j0rY4sloLx+uGKzVK+nY/8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzUWYRW5qKNa+92XyCZioPNWin3IdZ6RVco+qScyHVPn/DfvjfF
	Ao+t/q28psM/NvZKcsnmJd8hF0hSj+yhhe1MeRLdJ57Kg3XdyAje4Fc9IVj5gvfAonGDlObjmcA
	=
X-Gm-Gg: ASbGncvh1U1yI+hxbdDF1NpL6q2sU0vM1pDiN6EAd2t8mJmukOLnjfK8ce6NFZRsZa9
	YczalQn9S6WcC0GSlAuH2o64zyKEJJU4WVQjobOp4Xg8wExAoWa4vPebgyP2GJNq0Pcp+ipkNUM
	Qi9qaG09OcbrRk1LDw6E50cHXmX3a+YwZb7uC2veynabAvBAYKCZclwp3Y3kiuRTXyHDz68t3Ya
	fDAJAFcrYIap/seTqo3e5s+n607HJ3NMUbR8coKjb7J5VfF5hfEs+QhzCUZoqTGVHGqPlhf3O2M
	PpsFbckUsXz+NT8y2lsKqEQ+o6OFQPI8WHk7P99rwrQfKb/gtplaVcqQZiDG44wHUCVUr6tF2MQ
	aw8popgF3PbrEQ6YPYPr3BfQh/Guoqg==
X-Google-Smtp-Source: AGHT+IG05P3W4s8U70L2uF8T+LrJz04qFHXXtAvaz17dvDIIdsEau6ddqSlp2DZq9fx+xSUp7ni16Q==
X-Received: by 2002:a05:600c:1e0d:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-43d3b9d2e75mr27333045e9.20.1742313059447;
        Tue, 18 Mar 2025 08:50:59 -0700 (PDT)
Message-ID: <06e00c30-90d4-42a1-a1d7-fadd63b9377e@suse.com>
Date: Tue, 18 Mar 2025 16:50:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] x86/xlat: fix UB pointer arithmetic in
 COMPAT_ARG_XLAT_VIRT_BASE
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250318091904.52903-1-roger.pau@citrix.com>
 <20250318091904.52903-4-roger.pau@citrix.com>
 <8ad59d67-02f8-415c-93a0-2361e920c017@suse.com>
 <Z9mSub1DgzoP71-v@macbook.local>
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
In-Reply-To: <Z9mSub1DgzoP71-v@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.03.2025 16:35, Roger Pau Monné wrote:
> On Tue, Mar 18, 2025 at 03:33:03PM +0100, Jan Beulich wrote:
>> On 18.03.2025 10:19, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/include/asm/x86_64/uaccess.h
>>> +++ b/xen/arch/x86/include/asm/x86_64/uaccess.h
>>> @@ -9,9 +9,9 @@
>>>   * a secondary mapping installed, which needs to be used for such accesses in
>>>   * the PV case, and will also be used for HVM to avoid extra conditionals.
>>>   */
>>> -#define COMPAT_ARG_XLAT_VIRT_BASE ((void *)ARG_XLAT_START(current) + \
>>> -                                   (PERDOMAIN_ALT_VIRT_START - \
>>> -                                    PERDOMAIN_VIRT_START))
>>> +#define COMPAT_ARG_XLAT_VIRT_BASE ((void *)ARG_XLAT_START(current) - \
>>> +                                   (PERDOMAIN_VIRT_START - \
>>> +                                    PERDOMAIN_ALT_VIRT_START))
>>
>> Aren't we then (still) dependent on ordering between PERDOMAIN_VIRT_START
>> and PERDOMAIN_ALT_VIRT_START? Would
>>
>> #define COMPAT_ARG_XLAT_VIRT_BASE ((void *)ARG_XLAT_START(current) - \
>>                                    PERDOMAIN_VIRT_START + \
>>                                    PERDOMAIN_ALT_VIRT_START)
>>
>> perhaps be less fragile?
> 
> PERDOMAIN_{ALT_,}VIRT_START are unsigned long, so this might work.
> 
> Note however that even with your suggestion we are still dependant on
> ARG_XLAT_START(v) > PERDOMAIN_ALT_VIRT_START, or else the '-' won't
> work.  I think I prefer my proposed version, because it's clear that
> PERDOMAIN_VIRT_START, ARG_XLAT_START(current) >
> PERDOMAIN_ALT_VIRT_START.

What makes that clear? Can't we move PERDOMAIN_ALT_VIRT_START pretty
much at will?

Jan

>  With your suggestion that's not obvious.
> 
> Thanks, Roger.


