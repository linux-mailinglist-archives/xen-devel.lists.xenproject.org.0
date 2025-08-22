Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 100C0B30E90
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 08:13:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089529.1447060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upL21-0002Lh-O7; Fri, 22 Aug 2025 06:13:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089529.1447060; Fri, 22 Aug 2025 06:13:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upL21-0002JV-Kw; Fri, 22 Aug 2025 06:13:45 +0000
Received: by outflank-mailman (input) for mailman id 1089529;
 Fri, 22 Aug 2025 06:13:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDWw=3C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1upL20-0002JP-1z
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 06:13:44 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2771c4ed-7f1f-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 08:13:43 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6197efa570eso3382865a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 23:13:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a757742c4sm6688935a12.37.2025.08.21.23.13.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 23:13:42 -0700 (PDT)
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
X-Inumbo-ID: 2771c4ed-7f1f-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755843223; x=1756448023; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Fw1Gr0d5r5QKop3lweP4odpmosKxUuggeOvzpuKAU7s=;
        b=SToDiGrwL0CRAY7T8khEGNZE6ECAYYByMAzRhF6X1zOit78SI8hujVUpRotZHO+aoG
         ygfGduX8wuTaaJoqNq3uZz2oQDYjsv05Tizaq9B9DsPXpjFzM9QD5xVIJLPgzc8pesKC
         I4HMJ8kkdJJfJzB6tScYy1oNNM5hWSFS4cqVDDH9hG9r/qkqjFfqtnwUo7WkKTF7Sht4
         txodepx0yO1Xwe3KULzDqqZhKRHqrv4RtHlCwfufW9oExjFa9Ogv/SMaHfq9pbVWDQOC
         2fdyf1WU8t6k8AUJDX6bNB5lNyJMdfD5jbgZZPhktMcxHyFdWTjVR5NIAVS5bcMhrwdv
         ndCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755843223; x=1756448023;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fw1Gr0d5r5QKop3lweP4odpmosKxUuggeOvzpuKAU7s=;
        b=CYMG6vyRPQ/6UljFjhNgoT8RHuUOWdqqf6evyfstRDHkD5mM0BOFJUX+6AhH27vCyt
         gzMBSxvEJQKcsIHGWX3qf+x5kN8C+P4uBp5VZfGhoDZ6abdOPB0jXfpXdb4h4eMSXKCT
         YNEXueDMiAJfWfBzvbeNjzLlZTc+y2VMzR1BKWHzv+jkhnD5McyDzfyAeyrGe0qqlk1a
         Nq3i+nw15dtj0UD2tHjkZInIcuk5dDvxNQShk4iMYGDpx+L5z9rG12HFEkKrlk6nKUB6
         mvGaNMZBEe1fbEhiEyE/4+2v4NdeHEfub5ojg6z5gAO/3J4LfXXFjENBenAojMeJlGBA
         9ZXA==
X-Forwarded-Encrypted: i=1; AJvYcCVPi+3lro2weeqoQUu69auG701HbGwlEwzNaw+jbpmOkdKPRlVcKtFWGEWsSU2CDKu3J615o3IZz5o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzZ6RDZ6j/Ldg+ejUMbXmtJ9pC1t1bofwH1K2jOktM12hJYUG5
	yZbXx/x8URLPbBw3FKO/MQfNJ+/ourpLeJZVJwqCcVVgREp+pLmdgGinIw+ZsZgfeAMcRjxpkZB
	FbZU=
X-Gm-Gg: ASbGncvGBGFDNfA/CQD8xC4aQfCJxhqLhyaY1wZa1bcXVoyb8Vwd/qD3fh2SMAzMbvU
	aKyXxWG3W42KMXjIiz14ySJ5t4l4eeroGiREFAhFHifpIkEy6MEciSuimdnQnnnKfkPb2CHfxdB
	ez9l7hjXPret+Ya64ICi4nMMDpac8/Jgp6yGE90uZMS+R5EINr5wQ201Cqc0pP0ZyQ2gCYsjKzv
	yQCfNPu6KzEjyTWdiKtrb+/c4/ZKOEpI9YoSjlvxqq94cNVkfWJPHIyH11DLixJezH5jHwrftqK
	TxxvZ8p0o6QU8Srzh83UiQ9YTrwcBVirQ8PZ11VLEvbK3nftdpF0rOsII6JMlytaj+MQJutjISz
	lAmlSfsA2MJW7eoktTWkUIrP7HNm7IbSiMQy+BnimRZavgmX93H9x2bdf1AjqxPyiYwzrEAt2wB
	1AlZ/T27k=
X-Google-Smtp-Source: AGHT+IE2c+XmHVZotdz24cRySKR05ZSxNS7iLdwIUCXmdqhBPxKnuTVdM0e6IrRvHJydUMe8jLcz1Q==
X-Received: by 2002:a05:6402:51ce:b0:606:ebd9:c58b with SMTP id 4fb4d7f45d1cf-61c1b45c30emr1368763a12.1.1755843222652;
        Thu, 21 Aug 2025 23:13:42 -0700 (PDT)
Message-ID: <19009a27-9d7f-43c0-b33e-52969ec12a59@suse.com>
Date: Fri, 22 Aug 2025 08:13:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/16] x86/msr: Change wrmsr() to take a single
 parameter
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-13-andrew.cooper3@citrix.com>
 <3511e3dc-0c9b-412b-9cb3-e4b726088297@suse.com>
 <ee126e0c-4381-40a8-bbec-544e3286498f@citrix.com>
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
In-Reply-To: <ee126e0c-4381-40a8-bbec-544e3286498f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.08.2025 20:47, Andrew Cooper wrote:
> On 19/08/2025 1:38 pm, Jan Beulich wrote:
>> On 15.08.2025 22:41, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/nmi.c
>>> +++ b/xen/arch/x86/nmi.c
>>> @@ -218,16 +218,16 @@ void disable_lapic_nmi_watchdog(void)
>>>          return;
>>>      switch (boot_cpu_data.x86_vendor) {
>>>      case X86_VENDOR_AMD:
>>> -        wrmsr(MSR_K7_EVNTSEL0, 0, 0);
>>> +        wrmsrns(MSR_K7_EVNTSEL0, 0);
>> Since you switch to non-serializing here, ...
>>
>>> @@ -308,11 +308,11 @@ static void setup_k7_watchdog(void)
>>>          | K7_EVNTSEL_USR
>>>          | K7_NMI_EVENT;
>>>  
>>> -    wrmsr(MSR_K7_EVNTSEL0, evntsel, 0);
>>> +    wrmsr(MSR_K7_EVNTSEL0, evntsel);
>>>      write_watchdog_counter("K7_PERFCTR0");
>>>      apic_write(APIC_LVTPC, APIC_DM_NMI);
>>>      evntsel |= K7_EVNTSEL_ENABLE;
>>> -    wrmsr(MSR_K7_EVNTSEL0, evntsel, 0);
>>> +    wrmsr(MSR_K7_EVNTSEL0, evntsel);
>>>  }
>> ... why not also here?
> 
> An oversight.  Fixed.
> 
>>
>>> --- a/xen/arch/x86/oprofile/op_model_athlon.c
>>> +++ b/xen/arch/x86/oprofile/op_model_athlon.c
>>> @@ -34,7 +34,7 @@
>>>  #define MAX_COUNTERS FAM15H_NUM_COUNTERS
>>>  
>>>  #define CTR_READ(msr_content,msrs,c) do {rdmsrl(msrs->counters[(c)].addr, (msr_content));} while (0)
>>> -#define CTR_WRITE(l,msrs,c) do {wrmsr(msrs->counters[(c)].addr, -(unsigned int)(l), -1);} while (0)
>>> +#define CTR_WRITE(l,msrs,c) do { wrmsr(msrs->counters[(c)].addr, -l); } while (0)
>> This isn't obviously correct (as in: no functional change): The macro is,
>> for example, passed reset_value[] contents, which is of type unsigned long.
>> Quite possible that the original code was wrong, though.
> 
> I'm pretty sure the change is correct.
> 
> Perf counters get programmed to -(count), as they generate an interrupt
> when they overflow.  The K8 is the oldest BKDG I can easily access, and
> the counters are 48 bits wide.  The same is true of Intel systems of of
> the same age.
> 
> Interestingly, it is the singular omission from b5103d692aa7 which
> converts everything including the Intel version of CTR_WRITE() of this
> to use wrmsrl().
> 
> While looking at the mail list archives for b5103d692aa7, I found
> https://lists.xenproject.org/archives/html/xen-devel/2010-06/msg01660.html
> which shows that it was Christoph's attempt to turn rdmsr() and wrmsr()
> into a real C functions, so I'm pretty certain that CTR_WRITE() was an
> omission in b5103d692aa7.

Okay, so mainly in need of having the description point out there is actually
a correction of something in here. Then:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

