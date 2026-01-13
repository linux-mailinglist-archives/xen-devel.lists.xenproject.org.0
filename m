Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C7CD17F99
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 11:22:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201357.1517012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfbXd-0005qn-Mi; Tue, 13 Jan 2026 10:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201357.1517012; Tue, 13 Jan 2026 10:22:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfbXd-0005pb-JI; Tue, 13 Jan 2026 10:22:25 +0000
Received: by outflank-mailman (input) for mailman id 1201357;
 Tue, 13 Jan 2026 10:22:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=thT7=7S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfbXc-0005ds-MS
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 10:22:24 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfa0ecc0-f069-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 11:22:22 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-42fbbc3df8fso3889016f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 02:22:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5ee5e3sm43108976f8f.35.2026.01.13.02.22.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 02:22:21 -0800 (PST)
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
X-Inumbo-ID: bfa0ecc0-f069-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768299742; x=1768904542; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L95vZiSfr8055GhKSrBi/zrW9/uFZkjsgBOfStb58Bg=;
        b=Pjaeui2EJg8X4WHZhMEU3tncbw2IWVutaEDuaV851BiiJVWc0VNSoRDlzqB513vLP8
         8HHt3GjaWn+i4JuiqKLn1+T6awHfUdm3PEjlrvrYDaqqeuiIzbPeCqs044mA52TTr/99
         +8QPf8L1qHWNwuzc77OjaUlGqTRqlb/YWJ1JKqEjgh2Hv7LHjZ7AECVpOa3Ww+R7kdSn
         tSili/zL2xT/UX22WpIccD/SNZ3IoZHOvVMmIFSGIANg2pmpcqy+A8YXM/nHaBbzXdls
         qe3W1JxOhzGis3o67JQyhZ4P0YeJjB53puX3qzdNZoleKVVAUYVgX66EzU0wg0ykePLa
         nnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768299742; x=1768904542;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L95vZiSfr8055GhKSrBi/zrW9/uFZkjsgBOfStb58Bg=;
        b=koC6OISIaDsnilWItRJDGl7abIGV96lXoUNmQZss5TTRabJu2V7JoEjTTF8MVWYVVL
         Yq6kNKv1S8jA3y5d2AaxKj/eZHWgmFmyWPCwjZxtiPQ6jpyWgTxZnY4AwF4ao7A5O1Qt
         fkmkg0XR2jU0TzeXBmNFtvPaGS+1V1stGzIm2VJfKFr61DAGIOrtc35kNIZTXjG5DDjZ
         seRl4QdgI6mujOSuNU+5lJkjhuXqS0snxoQf2oeM/ToQebtjYzQ2Bicaz31vhOSDsdFF
         RLW0uUJEIQIYy6gAr1ud6tBO8L52uWTkjfOjYG14u4ddn2nr85Dx0/y2G9W5e/cIFoSg
         tLag==
X-Forwarded-Encrypted: i=1; AJvYcCVvWDkTSRmG7zxAzjZI5tJ6FmWWbgXz8pJ4ntPJuYfZ65SdCCcAnpm4lVeh+mBxtmi3QRFbfwUL9iw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwjEccgfri4R3O9meYyofq51UAuRpVkhNPuLKzbhlhwydH89TgF
	J+ZyTzPXz4vIqDO7s8c2yTyO5W1nUpkzcJFPKLmBccemd9lqxcYX4wsWiofjV4rnUg==
X-Gm-Gg: AY/fxX4Ce20UqW2b2QlEi/GxsIdSWBYduM+EMuAi0WLNs5U3A+PZYqoggJsZbB34v1t
	kXkoOon3hWHyPQYIkNvzKyRX/lcB/ra7qdbogx1l1IoRynYnDHNLGH1/5eZ7QnABT+mAvL7hplS
	V7yPi7IcjeXoo4lBOCUxosBpgWYMFZoNmQ/EcFdYfxzE0Ops24FhtYVs74EaxclksJHwXAoHnav
	rys14LuqzPMIwp6tXT5qgcNRQdf0Pv2ML4o1ctvWPcTWza7aF4jSXVf/JrRXTQuzXCobUiBMs1V
	P6fxeY2BnSrJGzX50TfAAfQmTKPXJNcxgU2jetF7fAdxhGSXlBVUG8CbrsVLiGCmUR3YkcTo8Qj
	ShQ7nN4orQRxEpym079LrMrHUO9/+RdbnjETC7n8IEsM5tKRTK2uU9ILJQ5r7g+MAqIQ0sQ97w7
	B4zFI5rrvvMdWVM6EB0J2ZNtgQcFUxiTk8wfd5wh7NhANFf3O2yOzfTVMUoiPPQjZ5Qw8zQ9zHC
	tc=
X-Google-Smtp-Source: AGHT+IFPLPGTyTMGDx3F7z+aGHH7tJwtCt0nSbgA9qFf5q1q1KKz+9SyaG1Yu5yB21l8Idx4FzB9sQ==
X-Received: by 2002:a05:6000:240f:b0:431:864:d4a9 with SMTP id ffacd0b85a97d-432c3772035mr20632079f8f.8.1768299741905;
        Tue, 13 Jan 2026 02:22:21 -0800 (PST)
Message-ID: <2786eab5-ff25-4d8d-b0d1-84a1d2727f9f@suse.com>
Date: Tue, 13 Jan 2026 11:22:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/15] xen/riscv: implement stub for
 smp_send_event_check_mask()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <837c863f5995cc4371e82b481211b053656ec7e7.1766595589.git.oleksii.kurochko@gmail.com>
 <319e6162-7a5b-4030-ae9f-a86a48e73605@suse.com>
 <94c0cd09-7aaa-4ae1-913e-57d883916682@gmail.com>
 <b08265c6-6c19-4935-be34-face486bf994@suse.com>
 <92cfc028-cabd-4686-b6b9-7cc047a909c9@gmail.com>
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
In-Reply-To: <92cfc028-cabd-4686-b6b9-7cc047a909c9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.01.2026 10:58, Oleksii Kurochko wrote:
> 
> On 1/12/26 6:05 PM, Jan Beulich wrote:
>> On 12.01.2026 17:53, Oleksii Kurochko wrote:
>>> On 1/7/26 4:47 PM, Jan Beulich wrote:
>>>> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>>>>> @@ -13,3 +14,10 @@
>>>>>    struct pcpu_info pcpu_info[NR_CPUS] = { [0 ... NR_CPUS - 1] = {
>>>>>        .processor_id = NR_CPUS,
>>>>>    }};
>>>>> +
>>>>> +void smp_send_event_check_mask(const cpumask_t *mask)
>>>>> +{
>>>>> +#if CONFIG_NR_CPUS > 1
>>>>> +# error "smp_send_event_check_mask() unimplemented"
>>>>> +#endif
>>>>> +}
>>>> CONFIG_NR_CPUS is 64 by default for 64-bit arch-es, from all I can tell, also
>>>> for RISC-V. And there's no "override" in riscv64_defconfig. How is the above
>>>> going to work in CI? Then again I must be overlooking something, as the config
>>>> used in CI has CONFIG_NR_CPUS=1. Just that I can't tell why that is.
>>> It is 1 because of the defintion of NR_CPUS in KConfig:
>>> config NR_CPUS
>>> 	int "Maximum number of CPUs"
>>> 	range 1 1 if ARM && MPU
>>> 	range 1 16383
>>>           .... ( all other range props are condtional and there is no RISC-V in dependency)
>>> so for RISC-V "range 1 16383" used and CONFIG_NR_CPUS is set to the minimal of this range,
>>> so it is 1.
>> I fear I don't follow: Why would the lowest value be picked, rather than the
>> specified default (which would be 64 for RV64)? That's what I thought the
>> default values are there (among other purposes).
> 
> But there is no default for RISC-V for config NR_CPUS:
> 
>    config NR_CPUS
> 	  int "Maximum number of CPUs"
> 	  range 1 1 if ARM && MPU
> 	  range 1 16383
> 	  default "256" if X86
> 	  default "1" if ARM && MPU
> 	  default "8" if ARM && RCAR3
> 	  default "4" if ARM && QEMU
> 	  default "4" if ARM && MPSOC
> 	  default "128" if ARM
> 	  help
> 	    ...

Oh, indeed, that's what I was overlooking.

> So a value from range [1, 16383] is chosen and based on the code of sym_validate_range():
>          ...
> 	val = strtoll(sym->curr.val, NULL, base);
> 	val2 = sym_get_range_val(prop->expr->left.sym, base);
> 	if (val >= val2) {
> 		val2 = sym_get_range_val(prop->expr->right.sym, base);
> 		if (val <= val2)
> 			return;
> 	}
> 	if (sym->type == S_INT)
> 		sprintf(str, "%lld", val2);
> 	else
> 		sprintf(str, "0x%llx", val2);
>          sym->curr.val = xstrdup(str);
> 
> First initialization of val2 it is the left value of the range [1, 16383],so it is 1
> and val is 0 (I assume so that it is by initialization 0), thereby val2 = 1 will be
> used as a value for NR_CPUS.

But is this behavior documented anywhere? Wouldn't RISC-V (and PPC) better
gain suitable defaults, making explicit what is wanted (for the time being)?
E.g.

config NR_CPUS
	int "Maximum number of CPUs"
	range 1 1 if ARM && MPU
	range 1 16383
	default "256" if X86
	default "1" if !ARM || MPU
	default "8" if RCAR3
	default "4" if QEMU
	default "4" if MPSOC
	default "128"

Jan

