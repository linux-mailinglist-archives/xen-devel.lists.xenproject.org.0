Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1121E98B8E8
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 12:04:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807948.1219710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svZkJ-0004Xb-7B; Tue, 01 Oct 2024 10:04:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807948.1219710; Tue, 01 Oct 2024 10:04:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svZkJ-0004VY-4K; Tue, 01 Oct 2024 10:04:43 +0000
Received: by outflank-mailman (input) for mailman id 807948;
 Tue, 01 Oct 2024 10:04:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svZkH-0004VS-FO
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 10:04:41 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92436e81-7fdc-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 12:04:39 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a8a6d1766a7so774413566b.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 03:04:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27ed053sm685985066b.93.2024.10.01.03.04.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 03:04:38 -0700 (PDT)
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
X-Inumbo-ID: 92436e81-7fdc-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727777079; x=1728381879; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RZCXAbrHKz7DVVCCaFP9YEWhq0hbpxKqJljgHoXZMMk=;
        b=S4zoYsRTOLOuQirabxdu14Jsa65c4WVKKkqK3eoTB/r8KmUrvRZa9ivwzOsbtE+Heg
         D/EoivjoLn+PmqGDIcg3WwWyE6Tl9sUCWG5EpSoN/zGwWJ7LO+Zov9DsGjSthf51XTMH
         3umA27ybvpgBQVlE6xUuzeX7+cmrawVwbGOTrM48y5gtbxhDeqd19QrgqTaMjqY6b6ZA
         YXzODWqibMCobOK+ABVBemDafUwwveq6DXryG8r1Xo1UkuPFkY0oQNT6DW6cQlq5SHAB
         qgfgG4ThNJ0T7A2SK3PkBR3sJpmm8WacNkuQ5RdQTLlD9VqrQoU0xy7fMsaHfBbEQb+N
         IdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727777079; x=1728381879;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZCXAbrHKz7DVVCCaFP9YEWhq0hbpxKqJljgHoXZMMk=;
        b=aLpauGZka6TtvNM4GiJ3K/F1nnkCDuOKGMOiUM1/Tfup/2Z200P+h25MHPdH2CLVmi
         5y1t+fWbNRvdA2GGCPyBvhAsWbHFWTEXOe2uw7oPJz9Ilu0IOex111gKLRwkGmfplVtH
         LXpCg0Y0rmluNA2HRvAZH7ftSTNWMXJxVFZaNW1C+y6R7MIXFDzGi38fK+kI761xajjb
         Ri6io14JDOmWjsnxdWeq/pbu/j4zWAN3DPDANLcFKcIo22y3H5hkWFeJ+rOiRB027b2Q
         jI/O2jmcFzWPLXEhTQQiyhRGyjn/qDqF7sZORCSLLqQFxQ7XVAGZTNVSV+MJBp4/ilnp
         3I9g==
X-Forwarded-Encrypted: i=1; AJvYcCVNTs+c3vrdA9lwnHokOPsZKbP4Y4q3K3dOEudCS2ZuOKDq2akLDMBbvhMicNhQGQSZ7pVkMTC/AdA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4PqEW31I0w/aGDksz490YH9TIS9lsg42xjoHwRFK4+GnrdrFK
	wRpQw74Bhp73tQ8x50LvOaPZnJdQJGaiO87UEDKvljVBT8FcXRcz3vb+LzjjEA==
X-Google-Smtp-Source: AGHT+IFPPhcqAh/86G2qQsEoeh4IgMLieY9t/yfm20AEhodZej+KjfAssVGvY3uI+OB1+7fXAiIrjg==
X-Received: by 2002:a17:907:9344:b0:a8d:55ce:fb7f with SMTP id a640c23a62f3a-a93c4c40561mr1521495666b.62.1727777079046;
        Tue, 01 Oct 2024 03:04:39 -0700 (PDT)
Message-ID: <2f1bb7ef-01f4-443e-8be5-5459fb6e618b@suse.com>
Date: Tue, 1 Oct 2024 12:04:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/pv: Rework guest_io_okay() to return X86EMUL_*
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240930161837.1248144-1-andrew.cooper3@citrix.com>
 <20240930161837.1248144-2-andrew.cooper3@citrix.com>
 <76819790-abde-4b61-8dd7-68dd9db8cfd1@suse.com>
 <e31a6eaa-2f19-479b-8e1f-ae7d7743d27f@citrix.com>
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
In-Reply-To: <e31a6eaa-2f19-479b-8e1f-ae7d7743d27f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.10.2024 12:02, Andrew Cooper wrote:
> On 01/10/2024 8:11 am, Jan Beulich wrote:
>> On 30.09.2024 18:18, Andrew Cooper wrote:
>>> @@ -190,10 +192,12 @@ static bool guest_io_okay(unsigned int port, unsigned int bytes,
>>>              toggle_guest_pt(v);
>>>  
>>>          if ( (x.mask & (((1 << bytes) - 1) << (port & 7))) == 0 )
>>> -            return true;
>>> +            return X86EMUL_OKAY;
>>>      }
>>>  
>>> -    return false;
>>> +    x86_emul_hw_exception(X86_EXC_GP, 0, ctxt);
>> do_general_protection() has
>>
>>     /* Pass on GPF as is. */
>>     pv_inject_hw_exception(X86_EXC_GP, regs->error_code);
>>
>> which may make a difference in case the insn changes under our feet.
> 
> It would make a difference if we chose to raise #GP[non-0].
> 
> But, see how the call to pv_emulate_privileged_op() is guarded on
> error_code == 0.

Oh, good point - I overlooked that.

> Prior X86EMUL_UNHANDLEABLE can't ever have raised anything other than
> #GP[0], (excusing cases of memory corruption in regs->error_code).
> 
> So, there is not a change in behaviour, even if the reason why is
> less-than-obvious.

I agree then.

Jan

