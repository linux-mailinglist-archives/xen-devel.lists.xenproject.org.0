Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB994BC9D32
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 17:37:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140774.1475559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6shr-0005BP-GC; Thu, 09 Oct 2025 15:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140774.1475559; Thu, 09 Oct 2025 15:37:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6shr-000582-Da; Thu, 09 Oct 2025 15:37:27 +0000
Received: by outflank-mailman (input) for mailman id 1140774;
 Thu, 09 Oct 2025 15:37:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6shp-00057w-Rt
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 15:37:25 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da475866-a525-11f0-9d15-b5c5bf9af7f9;
 Thu, 09 Oct 2025 17:37:24 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-46e504975dbso7099635e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Oct 2025 08:37:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb49bdfd0sm732565e9.10.2025.10.09.08.37.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 08:37:23 -0700 (PDT)
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
X-Inumbo-ID: da475866-a525-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760024244; x=1760629044; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sle44azmJmsJEk1pulNiFcMUpRaootCjeTnw5YSXt8w=;
        b=FgfLT+md/l+MC4+dFGAP/+L7qKpMdY3Zmq9CNWZG1SvfAq0ZewZR+kk0Cr/YX+9jYf
         SFrUXXLyd+geqb3X7HaI1VlsepB/Ic5uxjaqWcA4ovSMIRLpseT/WalUEDbqhtD4jQV0
         u3Grw9jMOuJLMp+UHLO++2TgS4lMcX42JhzwpHytsWj/ZyOpI+mstzE/xGPJgp7gVh/4
         3UYMOrca1kpLfsSPMgmQJ5qVPv5urWkwUGwF1X8HfMpT+YjBcPbciFZDYyAORPDnWoKK
         HVxWXOh2ETcDL26+4rPJ8S6Bc0suXK4J/llwLLQ5e4czpMTZy8ShBfTIwdIeGDzUaEXC
         lKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760024244; x=1760629044;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sle44azmJmsJEk1pulNiFcMUpRaootCjeTnw5YSXt8w=;
        b=BII5SVv3hJydN1aJSoEzl5vJ+PcmVWIXuNzpyD7BtibTd/yTpZAG04H76Rkh9Kc12e
         S3M4azz0GpLCn1EeU+Zcaj5P6Lba0EdqGFFzFVmk5ox5a9C8Lfb3IK0oFf9JBMLatpFU
         z2vNmHc12Oq6bx3VVFp86Nz0IBVdH5VukewIQUtQHIYbbOvqk8COmL00CgOaeRfEXRbF
         CYlL3C5j7QrCY9bzq88E19T/+MUBCvGYU3i1ucZYFwucDlNmpMlWvyvQORkkTUwSTztp
         NAO2v4AYKgWftE7FIoaM9e9ekSek+uqx2PpVX6Q0fgOnH0vfbg1HVORcxhWMWwjlD9rK
         jAdw==
X-Forwarded-Encrypted: i=1; AJvYcCV2biGIyI3c67vihnUNdSZTuQGj/C4egwUThsg3Zr2mdb7h1QEk/fgjCL8AFjBIKRWSt9qrLVDzgqw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztNHf2W12vLCCoR5KkXDskhHKg27KQEcdcurFjVy14m3mDGtO6
	NOH1NEptxbKW5WwG6ADk0+OidYAFgqXhAjz4aE2zVLMPB85TqkrZMlcO1sq7FJqRWQ==
X-Gm-Gg: ASbGncufZbQzG451yj9ZfafKMeV4FqknvnVkeayM+6YY+p0diBFQG0+zE57QjKJanvy
	Bqf4Z5htRVJUjcocnRmCVzkvEBlYJjgnx2qc6jZRM8oDJazW51Heu2oMJ+OtUtp/y8XhZsqRvFS
	78krVB9R24ujFMAZFsViSpzi4ZZJkL+RXJa5EqA2XA/wKsWiY8iAcqRSDMY9RBuoTe6TGH6TilV
	nxIWljM8bfIK7CK9KbSeu+hlKDPFFnEYtV8q2cXQaCBTpxlfJoiwVCmzue++SNrggoE5YD8bRYw
	8KgOzdHxta9TfjyuYL1GZSUJm16iwRQfKCcojcgjMelB7EGtc52TSrRcShQ3G+gQIao5e2d+Uqj
	qJ37kPoKGz0DTXgoPlVn+TCayusCgSFutzaUVTY44MuP8g+LXAhJrftAOCyJb8b0M737/TAr/TP
	xnkjAWiVDXpOSCoT6pe1SywvdFQXr5CG4=
X-Google-Smtp-Source: AGHT+IH6jYzabLdUWveIO3NOnAjYQWSWYOKh+H3lLnsVZXdfnDthl+7xlNX521eubtqGxqDMARsNvA==
X-Received: by 2002:a05:600d:416a:b0:46e:3f75:da49 with SMTP id 5b1f17b1804b1-46fa9b11794mr48907655e9.37.1760024243817;
        Thu, 09 Oct 2025 08:37:23 -0700 (PDT)
Message-ID: <8161d5b7-cc0e-41c3-8664-620988bc399e@suse.com>
Date: Thu, 9 Oct 2025 17:37:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21??? 3/3] x86/vLAPIC: properly support the CMCI LVT
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <amc96@srcf.net>, Oleksii Kurochko
 <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <265d5053-af61-42cb-a3b9-ef60df39c21b@suse.com>
 <61a05ec1-aca7-4c3f-be6f-1bb053b2cd00@suse.com>
 <4477b803-4941-4032-be83-85cc126ceacb@epam.com>
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
In-Reply-To: <4477b803-4941-4032-be83-85cc126ceacb@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.10.2025 17:08, Grygorii Strashko wrote:
> On 08.10.25 15:09, Jan Beulich wrote:
>> --- a/xen/arch/x86/hvm/vlapic.c
>> +++ b/xen/arch/x86/hvm/vlapic.c
>> @@ -31,10 +31,13 @@
>>   #include <public/hvm/ioreq.h>
>>   #include <public/hvm/params.h>
>>   
>> -#define LVT_BIAS(reg)                   (((reg) - APIC_LVTT) >> 4)
>> +#include <../cpu/mcheck/x86_mca.h> /* MCG_CMCI_P */
> 
> This include... You probably do not like it also
> It is dependency outside HVM code.
> 
> I've been thinking about something like vlapic->caps which can be filed before vlapic_init()
> or passed as parameter, but seems x86 toolstack is considered to be able overwrite anything,
> including v->arch.vmce.
> 
> Seems, no better options here.

Same here, hence why I used it despite not liking it.

>> @@ -697,8 +701,17 @@ int guest_rdmsr_x2apic(const struct vcpu
>>           return X86EMUL_EXCEPTION;
>>   
>>       offset = reg << 4;
>> -    if ( offset == APIC_ICR )
>> +    switch ( offset )
>> +    {
>> +    case APIC_ICR:
>>           high = (uint64_t)vlapic_read_aligned(vlapic, APIC_ICR2) << 32;
>> +        break;
>> +
>> +    case APIC_CMCI:
>> +        if ( !(v->arch.vmce.mcg_cap & MCG_CMCI_P) )
> 
> Could it be done using wrapper, like vmce_has_cmci()?
> As this is Intel specific it's candidate to be opt-out eventually.

Possible. I wanted to limit the churn, hence why I preferred not to introduce
a wrapper. Such an abstraction I wouldn't like to be a function taking a vCPU;
really this should be a domain property imo.

Jan

