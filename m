Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0400D9BAD68
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 08:47:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829843.1244749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7rnZ-0004ZH-9x; Mon, 04 Nov 2024 07:46:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829843.1244749; Mon, 04 Nov 2024 07:46:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7rnZ-0004Xn-7F; Mon, 04 Nov 2024 07:46:53 +0000
Received: by outflank-mailman (input) for mailman id 829843;
 Mon, 04 Nov 2024 07:46:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r6Gf=R7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t7rnY-0004Xh-8W
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 07:46:52 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f18aa84d-9a80-11ef-99a3-01e77a169b0f;
 Mon, 04 Nov 2024 08:46:47 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-37d41894a32so2056347f8f.1
 for <xen-devel@lists.xenproject.org>; Sun, 03 Nov 2024 23:46:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10b7bb7sm12533298f8f.3.2024.11.03.23.46.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Nov 2024 23:46:46 -0800 (PST)
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
X-Inumbo-ID: f18aa84d-9a80-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzIiLCJoZWxvIjoibWFpbC13cjEteDQzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImYxOGFhODRkLTlhODAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNzA2NDA3LjI1Njk1NCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730706406; x=1731311206; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lrX7xyRVk4EF1+z5y51a1kFwUZBIyaHnwg1hv2XCqWs=;
        b=D5pxAUgPcvvBIKms29YyOPj4kv3295ZapcBy/OHIeESziLYKuq1a7tqyrC+CnHGK6k
         EOCqNgKG8jCrcMRKnPclRoEgJwQJ7NMmn66DEwYLh+avyLUshoZGFp8XGX82FeyP06xi
         8SzSh+bjENm3LYRMN6YxmuFkvWLsEolRjVIbAB602c5KCJjOK9gLwz/pw3p1PnwApItw
         uYsBjiqihWt5HRrn8J7WL/QT+NkrpPc6gWiTnAQRMPFzRFxeYiFanf60gHcYfG8rl4mS
         kUEyAJ55BarXsir0Mt93n+h559gKUY2nfHXAiE/v5boxjKFIkD+dS0Jd44o2Ddwx8mDI
         DJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730706406; x=1731311206;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrX7xyRVk4EF1+z5y51a1kFwUZBIyaHnwg1hv2XCqWs=;
        b=AOhhC93DQEP+4KYGEOKRJ2RnMZh4cKIMtWl5nZwS2v68DdltLrkteKwUuC1OPJYcDb
         g+0/098pCMdgx/2EhED/YJAjuuIpo1nfbhIZ98f7Wo5ggd7PB7MJPU13kEPziedKWk6o
         oljZypJkcCuP0c8JVrF9i2xg2MxoWL9wIjmCut+5ehwKeVeQHSVaEVHMJW6gSun5k77L
         K3kaOMzdLCfALxpuqxwxxQatiax2RgCMBCq3/npy7mYyR5VDs4XTlk7pb1O8yTwF5Nmc
         OlXb17pLizfFQzTBitbmwa41RUxwCs87wOQekPuLps/2TIkLb64zRB9HkseYeSciDNNU
         axGg==
X-Gm-Message-State: AOJu0YzRj+MBwRo1w/drk7kcZ3b/k8w6m6nDDAnqIBM/LXTtbzSqhzue
	9vOJ5vRlWDeXBMW6iAmfD6GV9N2h47RAdsAQwpbnXRGR0kWer1Tn3Z8GhikDsw==
X-Google-Smtp-Source: AGHT+IEeTnMcjoAelt476tVAMJ1soy2Yb3nLu1p22MnKD5B8TNJVf/vBBaPHwipFP1bAkwbY4OPQSQ==
X-Received: by 2002:a05:6000:4189:b0:381:c779:726c with SMTP id ffacd0b85a97d-381c7797421mr6733088f8f.10.1730706406546;
        Sun, 03 Nov 2024 23:46:46 -0800 (PST)
Message-ID: <8d5b6935-183f-460d-8107-4ed3119c4d8c@suse.com>
Date: Mon, 4 Nov 2024 08:46:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/4] xen/arm: ffa: Introduce VM to VM support
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1729069025.git.bertrand.marquis@arm.com>
 <0475e48ace0acd862224e7ff628d11db94392871.1729069025.git.bertrand.marquis@arm.com>
 <93715b7e-d968-4526-96c5-497a7a1f9dfa@citrix.com>
 <765C7E37-0ECB-4BFC-B98C-57FCE303828B@arm.com>
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
In-Reply-To: <765C7E37-0ECB-4BFC-B98C-57FCE303828B@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.11.2024 08:19, Bertrand Marquis wrote:
> Hi Andrew,
> 
>> On 1 Nov 2024, at 12:05, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> On 16/10/2024 10:21 am, Bertrand Marquis wrote:
>>> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_partinfo.c
>>> index fde187dba4e5..d699a267cc76 100644
>>> --- a/xen/arch/arm/tee/ffa_partinfo.c
>>> +++ b/xen/arch/arm/tee/ffa_partinfo.c
>>> @@ -77,7 +77,21 @@ void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
>>>     };
>>>     uint32_t src_size, dst_size;
>>>     void *dst_buf;
>>> -    uint32_t ffa_sp_count = 0;
>>> +    uint32_t ffa_vm_count = 0, ffa_sp_count = 0;
>>> +#ifdef CONFIG_FFA_VM_TO_VM
>>> +    struct domain *dom;
>>> +
>>> +    /* Count the number of VM with FF-A support */
>>> +    rcu_read_lock(&domlist_read_lock);
>>> +    for_each_domain( dom )
>>> +    {
>>> +        struct ffa_ctx *vm = dom->arch.tee;
>>> +
>>> +        if (dom != d && vm != NULL && vm->guest_vers != 0)
>>> +            ffa_vm_count++;
>>> +    }
>>> +    rcu_read_unlock(&domlist_read_lock);
>>> +#endif
>>
>> ...
>> struct domain *dom;
>>
>> if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
>> {
>>     /* Count the number of VM with FF-A support */
>>     rcu_read_lock(&domlist_read_lock);
>>     ...
>>     rcu_read_unlock(&domlist_read_lock);
>> }
>>
>> drops the explicit ifdef.  Hiding function-level variable declarations
>> behind an ifdef like that works exactly once, and it doesn't make
>> pleasant code.
> 
> Ack I will fix that.

While at that, please also name struct domain * type variables "d", not
"dom". For consistency with (almost) all other code we have.

Jan

