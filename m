Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D08D5C57A10
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 14:23:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161510.1489445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXI7-0001YY-PZ; Thu, 13 Nov 2025 13:23:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161510.1489445; Thu, 13 Nov 2025 13:23:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXI7-0001Vw-Li; Thu, 13 Nov 2025 13:23:11 +0000
Received: by outflank-mailman (input) for mailman id 1161510;
 Thu, 13 Nov 2025 13:23:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJXI6-0001Va-Tn
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 13:23:10 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5484712-c093-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 14:23:08 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b7346565d7cso110884266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 05:23:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734ff36ac6sm161537766b.74.2025.11.13.05.23.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 05:23:07 -0800 (PST)
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
X-Inumbo-ID: e5484712-c093-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763040188; x=1763644988; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HI7TmntaBwxD8yMX2ho+tjmS9OR8n5Y7rvtu8Yv/BiE=;
        b=eonv2oidcqS/jeUFuCurQ5deFTAvFWh8UUinAO6TpeHDwkzdWaP12EWXVdjRVPVjcv
         xRep3cn0VoH7CNnVmPcvlNH9vOP7JvMtHL3cy4Bm6kaM4RaFkaBlkBP1rBdJlJRNePHZ
         QaWKjv4cZN13sMCR0iMnUMHSpPVrZrghaHzZBYT7c1veH4On9vPGJLDu8rpOwUPQBFXU
         y4a4TGeVvqjEeQuqCrM9r1T87vDNpGKuUykz4ExRhxBe/VIWg1SMbdqYsXsYvS2Cwrvw
         jO1Rtco4X6gd9PW9kiWhN1cBtfkWwLfMBWEiptE+Sv99+ae5Jc4hi5r4xRto8xSwHynX
         R0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763040188; x=1763644988;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HI7TmntaBwxD8yMX2ho+tjmS9OR8n5Y7rvtu8Yv/BiE=;
        b=KT7QgGbKu73tRHmCFaWBhC49e9C0RVNGXqY2YnK8yR7qeqLw+Cbe+dXjhyBr0AGLP9
         en9OC9zfbohBxqb9vJuJUmkCA2vqbEF0sMFfWmrfJnkg6XLbBpLpdSkfmya6UdWf29Wv
         weofEEglgAgbDVXaJJu0fIFl5Ula7WYe1JnViR4HaQrPevJOJk2/8Khh713y15HwKvEj
         DXxfpzSlbwvWlbgv7DNvqhQYIPntEuSPM8huHQITIBNp89mcw3eKRMejnZLXafHH8I0v
         LGCbJS/hrSugeQh2wRTE8dvR/4CYkcMbA6Y//KqIT6A9B4MD7vopHN5IKtN2lIKfyBK1
         6iEA==
X-Forwarded-Encrypted: i=1; AJvYcCW6zX9AQhs2+xBg31lPS9ZNvX26nnX6VR270lzuH5a0uYbtIRsy/pRJ7vaz3R63LYWMc6RsKlqrA5Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwjqHw3a1LEQZUfLooJi/dErzaXyamNYB/RdxAHyzkgV3vj4ySU
	kIFSlBVnbS42KXWy/CsGlj58p8E8NkPRX3Z0WpBt0TPdYQ5suVviei2apxFqS/RM/A==
X-Gm-Gg: ASbGncsxOt/l/nNe7Yl3OThT6D8ff2NZYkW34X39ZNMThmijcjtcgvQuZjSTAsvDbXo
	pUC0/PiYyHgVMk7D/Y5Ut2Q4DZVJDQs7banq8mlXBco9zIice536nMNBtBaTMn0rDs8TlC/oGIT
	1RRbZnkPLrOZOOv5YexPGNSx7GEq5wGGScMaJsJ1ceAYFhwxihWgNeA6tsT0RtXlyA2jPTxIpSw
	L0A1V0DhFUqsWNxIqS1zO7mfWteaFI3Afjp6XKYWsgPG8f/4OKL+bpNmdGpEIc/9pi4EcqwYOeb
	IfwzCCFe6YiN0QtQw+PiA9MDH0GbSu3f1gYPTAEYazvCxN6Mw2BQQ8wuZ8xtlZX6T2DN5+lQDQy
	Ck6OIocQgw16T6TC8QNBRge9QWjqZVaI7axHhwNV4e9azjZaaAGMWEQOqBjAFRJNqwcpn0CoVav
	CW4JYTTS4OnljL+90h22lhpwTSWjp32n3z9zN8pPmAekDHdFb8v7qX/xWLd7CFKD1iCJ1/dt/mS
	Zk=
X-Google-Smtp-Source: AGHT+IGjCw3/fS3tiKhou68YEvBIe4cjAyQ5BjFGqQxIPoOl3Tx9UXQD6Bl9QETJ+GfDqTZ0XtewJQ==
X-Received: by 2002:a17:907:1c27:b0:b6d:5c4e:b09f with SMTP id a640c23a62f3a-b7331974f42mr592047366b.5.1763040188156;
        Thu, 13 Nov 2025 05:23:08 -0800 (PST)
Message-ID: <be6f958b-ae23-4cd0-9dd7-c096ae36d39b@suse.com>
Date: Thu, 13 Nov 2025 14:23:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 3/5] x86: hvm: factor out compat code under ifdefs
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>
References: <20251111175413.3540690-1-grygorii_strashko@epam.com>
 <20251111175413.3540690-4-grygorii_strashko@epam.com>
 <af736490-5f04-4fa8-9b73-4071b72e1c33@suse.com>
 <4e4aa540-514b-458f-8036-7941a0ecf268@epam.com>
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
In-Reply-To: <4e4aa540-514b-458f-8036-7941a0ecf268@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.11.2025 14:18, Grygorii Strashko wrote:
> On 13.11.25 14:30, Jan Beulich wrote:
>> On 11.11.2025 18:54, Grygorii Strashko wrote:
>>> --- a/xen/arch/x86/hvm/hypercall.c
>>> +++ b/xen/arch/x86/hvm/hypercall.c
>>> @@ -29,10 +29,12 @@ long hvm_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>           return -ENOSYS;
>>>       }
>>>   
>>> -    if ( !vcpu_is_hcall_compat(current) )
>>> -        rc = do_memory_op(cmd, arg);
>>> -    else
>>> +#ifdef CONFIG_COMPAT
>>> +    if ( vcpu_is_hcall_compat(current) )
>>>           rc = compat_memory_op(cmd, arg);
>>> +    else
>>> +#endif
>>> +        rc = do_memory_op(cmd, arg);
>>
>> Why would this be needed when vcpu_is_hcall_compat() already honors CONFIG_COMPAT?
>> (Same question then applies elsewhere, of course.)
> 
> This I do not like by myself, but I was not able to find other options :(
> 
> hypercall-defs.h is autogenerated and it's the only one place where functions
> declarations like do_x_op() are appeared or disappeared.
> So build is failing without ifdefs as compiler can't find compat_memory_op()
> declaration.

Oh, I see; I hadn't thought of that aspect. I wonder if we wouldn't better take
care of that in the machinery there. Cc-ing Jürgen, who did introduce this
originally. Maybe he has concrete arguments against us doing so.

Jan

