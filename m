Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C709077F7
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 18:13:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740105.1147120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHn4G-00019v-Sh; Thu, 13 Jun 2024 16:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740105.1147120; Thu, 13 Jun 2024 16:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHn4G-00017d-Pw; Thu, 13 Jun 2024 16:12:52 +0000
Received: by outflank-mailman (input) for mailman id 740105;
 Thu, 13 Jun 2024 16:12:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHn4F-00017X-WE
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 16:12:52 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7b1c369-299f-11ef-b4bb-af5377834399;
 Thu, 13 Jun 2024 18:12:50 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a6ef8e62935so168707166b.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 09:12:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56fa674bsm86448666b.210.2024.06.13.09.12.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 09:12:49 -0700 (PDT)
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
X-Inumbo-ID: c7b1c369-299f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718295169; x=1718899969; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LjBNhA9kYYmdqZKBwleySkHS0tySokdVtq7hkjjJu7I=;
        b=QRDUAtKlqlZURw6QegbH6B7xZt5uvBtQF3JhOK4wdVkmTb/0WsZ5PKPF9B3sPhc0oY
         yPbhZSYQeN7VdrBtLb/hbd5l3jwbJoJ5hFIqbRNJ6Hy9wuSApdIfzLKziQJ/6TRoYEsA
         bxZL13f9gRts1Fj3E/DeJ3d4d21ltujeCc9MEPL9kU81mrrRnByK6oVsncyTUHHjVHQZ
         IZKsyGZaMK6RpDxVCOGRRgblI0eEXssqAWYqnt6wNs2vHVjI5GgxeWJvhgMQM7PoY1+I
         YZFJA1ebcZLtgcmfHq0YgVzS2EvF0hhVe33OAjCY5sjEHPUDFQZ85y+RVJywkoZ6RGbS
         fYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718295169; x=1718899969;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LjBNhA9kYYmdqZKBwleySkHS0tySokdVtq7hkjjJu7I=;
        b=eGhcyagaa+Z6KbhhvHskTh+/t118hl6QT4dNejX8Ijzl9EvwDzcBj10+XG78oZFPV+
         6eiJ1u6vwjtBAv+P2axivKzeMWmMAe7/UOVvQMJhKc45gxfJJ8waU1QLUarpQtUNHm+X
         K5hS1/DlanOINIM3mGrfYEfI/BtdqAVYkcnbhX9LE27NJ41c/sTlM5KeLpndRT+yffI0
         STqgibAKlCJwUW4U7EozOvMf6TC77kTMccvawpBcGf+IsNKQjR/Si+i9t4CiG2PNcpp+
         HMAmZIUXZcf11MP5EPNzScmojaFvWc+O3hA1gRDH9UbTCdcim9cNtM4Vsa7SzlYFoCX1
         XGIg==
X-Gm-Message-State: AOJu0YzXKq/4smYIahatKXC5ADMWhwKcexTnzuZO+29nv4QETocBvRT9
	DsuypwnrjKTP4lUa988XlKC1O8XDyK3L2xzwAAaw3N8BMciuj5g9gzur/8VYv9q9Cn9fIMtU3YY
	=
X-Google-Smtp-Source: AGHT+IGB75onHmcJLItz5KHxsXY8gnkMDeEK6AYiBOEXazUiHLQoGOCfuBQbsBl4IOM3XSx6JZ4/lA==
X-Received: by 2002:a17:906:3c56:b0:a6f:12:8c48 with SMTP id a640c23a62f3a-a6f60d5f66bmr15917466b.39.1718295169217;
        Thu, 13 Jun 2024 09:12:49 -0700 (PDT)
Message-ID: <4f518072-572e-469c-baed-349c34e7ddfc@suse.com>
Date: Thu, 13 Jun 2024 18:12:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.19?] x86/Intel: unlock CPUID earlier for the BSP
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <82277592-ea96-47c8-a991-7afd97d7a7bc@suse.com>
 <ZmsNSUmum8mRxkCs@macbook> <4cb42dae-430b-4740-bddd-df5c4c783724@suse.com>
 <ZmsYdA6uwR4nGEYp@macbook>
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
In-Reply-To: <ZmsYdA6uwR4nGEYp@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.06.2024 18:04, Roger Pau Monné wrote:
> On Thu, Jun 13, 2024 at 05:53:02PM +0200, Jan Beulich wrote:
>> On 13.06.2024 17:16, Roger Pau Monné wrote:
>>> On Thu, Jun 13, 2024 at 10:19:30AM +0200, Jan Beulich wrote:
>>>> @@ -315,16 +329,7 @@ static void cf_check early_init_intel(st
>>>>  	    bootsym(trampoline_misc_enable_off) & MSR_IA32_MISC_ENABLE_XD_DISABLE)
>>>>  		printk(KERN_INFO "re-enabled NX (Execute Disable) protection\n");
>>>>  
>>>> -	/* Unmask CPUID levels and NX if masked: */
>>>> -	rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
>>>> -
>>>> -	disable = misc_enable & MSR_IA32_MISC_ENABLE_LIMIT_CPUID;
>>>> -	if (disable) {
>>>> -		wrmsrl(MSR_IA32_MISC_ENABLE, misc_enable & ~disable);
>>>> -		bootsym(trampoline_misc_enable_off) |= disable;
>>>> -		printk(KERN_INFO "revised cpuid level: %d\n",
>>>> -		       cpuid_eax(0));
>>>> -	}
>>>> +	intel_unlock_cpuid_leaves(c);
>>>
>>> Do you really need to call intel_unlock_cpuid_leaves() here?
>>>
>>> For the BSP it will be taken care in early_cpu_init(), and for the APs
>>> MSR_IA32_MISC_ENABLE it will be set as part of the trampoline with the
>>> disables from trampoline_misc_enable_off.
>>
>> The way the original code works, it allows to deal with the BSP having the
>> bit clear, but some or all of the APs having it set. I simply didn't want
>> to break that property.
> 
> Oh, I see.  This looks like something we would unconditionally like to
> set in trampoline_misc_enable_off?  Except that would trigger an
> unnecessary write to the MSR if the CPU already has it disabled.

Might be an option; the extra MSR access may not be _that_ harmful.

> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> I think the printk could be made a printk_once, since it doesn't even
> print the CPU where the bit has been seen as set, but anyway, that
> would be further adjustments.

Well, yes and no. Having it the way it is now and seeing the message twice
in a log would be indicative of a problem.

Jan

