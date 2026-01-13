Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D65D1A816
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 18:04:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202229.1517852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfhoH-0006jq-Ct; Tue, 13 Jan 2026 17:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202229.1517852; Tue, 13 Jan 2026 17:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfhoH-0006gu-97; Tue, 13 Jan 2026 17:04:01 +0000
Received: by outflank-mailman (input) for mailman id 1202229;
 Tue, 13 Jan 2026 17:03:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=thT7=7S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfhoF-0006QQ-Pa
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 17:03:59 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da03c57b-f0a1-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 18:03:58 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47ed9b04365so6872945e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 09:03:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f68f69dsm411421175e9.1.2026.01.13.09.03.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 09:03:57 -0800 (PST)
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
X-Inumbo-ID: da03c57b-f0a1-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768323838; x=1768928638; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zLM1ROU9knuDPN1FMDY7x1s6BCM3gJz8FviC93uuB6Q=;
        b=ONinaUCZWCcv0cjF8uzlldIkY2RXGo9DkAyS0E2GC1XZ74hEUVaftozZ8f5IFZuENU
         zzX9+GOt1zG4hElf4F0qPyjMjiUPXUk7ulvyDF8i/1pp0+gtBtHbckZK/GhccZymFJvM
         u9KTDBrA5id2+kGvGrE9I6X/g0aPV19RUHCtOunOEnaaNSgYvpblfYZ2EsdHVXxwmJye
         WMLDKLX4ngdTuH4NxXvpk/EC6J2egH5HG6uHxQ/rCDvmzVzR6rUxVs6bHRPrAiJSY1++
         Venz06XYzD78qvfsG+KAoWgvE5XTXs7jqjSsOZ08bGgpGAuooTzCK2cAH4+xg+wE+G1d
         xkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768323838; x=1768928638;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLM1ROU9knuDPN1FMDY7x1s6BCM3gJz8FviC93uuB6Q=;
        b=D4KcKgR7LW/tNnQC1Ugg/0ujDHNwLIibWve1524UlR9xPNkyJVRl+IpjSJ+1XHBJTK
         OYoqtwk6AeAl70HjqHGmxzTl4J1TqqfU0WNE1YvtbwZ2lGd+5APKRA7SC27BUXzlm4g6
         sNv8J7MDob3pS6YqktymCY1OgAKGZkh5jJEoRCyER7w3mfsqRwEQrawCNDuIw9y+IXEj
         jYf0WcLWnmWbpcLfGYfys6qCcg8M5AUAOV4OvD0l3VH9frWY/9iuaXogGzuOi5ckkOyd
         jbSicpZtwq6+2xpk023E9m+k0fMjXIQ6hLkesmaWZe3XPd04RaHQQFTG75DPoLP2wCvW
         sTvg==
X-Forwarded-Encrypted: i=1; AJvYcCX0Qwcywbf3PQsqfmRMltkO0DuWM3p/KEL0PS/trx4UTS0pfnXHoCuAQ+42sPOu7ByPWhmFKzOlTDw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyS4zVzlU4cIhkCIjlpYUS0SnCm+d67i3oghvkh7n/trSMF1zKl
	FAJVpIO/dkgwVNW5XYPqm9l3xKz03GB75UjjsGjmQkZZft3oukEhrNBjw7gdED2Nwg==
X-Gm-Gg: AY/fxX6MhNlcbLIDAZ4I7MnUM6/KiaA0fJ8NbwlAu7qBjn6xMrPqOZsL8pwjjVxO4LQ
	MVAnFZ9sdYOAJb/W4eSfpE93vuq7vlN9BEiHny2dCI7PzrXNCcqaWwD6CSmCGeMDNnY3oOd+S8j
	WuUWWwlmgTeO+yZ4UQP3+txcJr5gMmh2tNeOgiJBgm30RLZ8+4DiV4ZbLcm3E19xCzfXB2+b8KO
	2p5TxSSgjSAtjqSPnYaVT+13QQPpa+ovrug9Z+/pBTIA0E9S7e+3+k9I7Coq3uYacGimKC6ZSNI
	ES1+ecZPUdqNRnYhm05zNdvyOWIhHYR5stNwzSRop4FTn1pY9q8VJqt3+osZFas9Nl8yUqrXARO
	L3qLfuc+t91mrugVgrdrcUh6w3ZMGVlhupRu5EANEpnJCfrjJFmXUImdeMr9AvENw2l0k/nPfgq
	nfRTsyE3JnBkzI2lRODAB7TenVFrXvjqtu7Uj9JF6woshY/GrMAW8Qh5VUVVuJC/aXun9PwRSq6
	QY=
X-Google-Smtp-Source: AGHT+IFknbWApso6ojWx/OEso85mLW78fbPqadbrL/xymn7ASp9M+y6EE5vjXn+piZsBzojlcSk6BQ==
X-Received: by 2002:a05:600c:3b27:b0:477:429b:3b93 with SMTP id 5b1f17b1804b1-47d8fc55375mr169262275e9.18.1768323838106;
        Tue, 13 Jan 2026 09:03:58 -0800 (PST)
Message-ID: <8b67ed04-28c0-4c0a-97cc-f2ad56cfdf9d@suse.com>
Date: Tue, 13 Jan 2026 18:03:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] x86/ucode: Add Kconfig option to remove microcode
 loading
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20260113122109.62399-1-alejandro.garciavallejo@amd.com>
 <20260113122109.62399-5-alejandro.garciavallejo@amd.com>
 <0706617f-fdb8-47c1-94f4-6aa92abd07ec@suse.com>
 <DFNLDTH4EKQS.1UL1S5Q9OEQ5O@amd.com>
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
In-Reply-To: <DFNLDTH4EKQS.1UL1S5Q9OEQ5O@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.01.2026 17:12, Alejandro Vallejo wrote:
> On Tue Jan 13, 2026 at 4:27 PM CET, Jan Beulich wrote:
>> On 13.01.2026 13:21, Alejandro Vallejo wrote:
>>> @@ -469,7 +471,7 @@ struct ucode_buf {
>>>      char buffer[];
>>>  };
>>>  
>>> -static long cf_check ucode_update_hcall_cont(void *data)
>>> +static long cf_check __maybe_unused ucode_update_hcall_cont(void *data)
>>>  {
>>>      struct microcode_patch *patch = NULL;
>>>      int ret, result;
>>
>> Why this change when ...
>>
>>> @@ -613,6 +615,7 @@ static long cf_check ucode_update_hcall_cont(void *data)
>>>      return ret;
>>>  }
>>>  
>>> +#ifdef CONFIG_MICROCODE_LOADING
>>
>> ... this can simply be moved up accordingly? After all ...
>>
>>>  int ucode_update_hcall(XEN_GUEST_HANDLE(const_void) buf,
>>>                         unsigned long len, unsigned int flags)
>>>  {
>>> @@ -645,6 +648,7 @@ int ucode_update_hcall(XEN_GUEST_HANDLE(const_void) buf,
>>>       */
>>>      return continue_hypercall_on_cpu(0, ucode_update_hcall_cont, buffer);
>>
>> ... this is the only user of that other function.
> 
> To minimise the scope of the ifdef. It's hard to know where things start/end
> when they cover several functions. This way it's (imo) clearer.
> 
> I don't mind much though.
> 
>>
>>> --- a/xen/arch/x86/cpu/microcode/intel.c
>>> +++ b/xen/arch/x86/cpu/microcode/intel.c
>>> @@ -408,17 +408,20 @@ static const char __initconst intel_cpio_path[] =
>>>      "kernel/x86/microcode/GenuineIntel.bin";
>>>  
>>>  static const struct microcode_ops __initconst_cf_clobber intel_ucode_ops = {
>>> -    .cpu_request_microcode            = cpu_request_microcode,
>>> +    .cpu_request_microcode            = MICROCODE_OP(cpu_request_microcode),
>>>      .collect_cpu_info                 = collect_cpu_info,
>>> -    .apply_microcode                  = apply_microcode,
>>> -    .compare                          = intel_compare,
>>> -    .cpio_path                        = intel_cpio_path,
>>> +    .apply_microcode                  = MICROCODE_OP(apply_microcode),
>>> +    .compare                          = MICROCODE_OP(intel_compare),
>>> +    .cpio_path                        = MICROCODE_OP(intel_cpio_path),
>>>  };
>>
>> While I appreciate the intention with MICROCODE_OP(), I'm not really happy
>> with function pointer members left in place just for them to be NULL
>> everywhere. What if a call site remains unguarded? With PV guests that
>> would be a privilege escalation XSA.
> 
> I see where you're coming from, but these are already NULL if microcode
> loading is not exposed by the underlying hypervisor (if any), or is blocked by
> hardware in Intel, so arguably that worry is orthogonal to this.

Yes and no. Paths taken differ between what we have now and what we will have
when your work has gone in.

> Also, only a privileged domain can perform late microcode loading, so the XSM
> check would prevent any such XSA from coming to pass. dom0 crashing the system
> on a bad hypercall (while wrong) would just be unfortunate, not a security
> issue, as far as I can tell.

Okay, together with Andrew's response it wouldn't be calls through NULL, so
perhaps indeed not an XSA. The hypercall being Dom0-only I am, however, less
convinced would necessarily matter here. We interact with remote CPUs, after
all, and hence having one which happens to run a PV DomU call through NULL
would still be in need of an XSA.

Jan

