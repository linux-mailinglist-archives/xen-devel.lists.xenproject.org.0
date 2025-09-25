Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE90B9FA70
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 15:47:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130562.1470065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1mJ6-0007A3-K0; Thu, 25 Sep 2025 13:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130562.1470065; Thu, 25 Sep 2025 13:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1mJ6-00076x-GR; Thu, 25 Sep 2025 13:46:48 +0000
Received: by outflank-mailman (input) for mailman id 1130562;
 Thu, 25 Sep 2025 13:46:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v1mJ4-00076r-Mj
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 13:46:46 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ef586f7-9a16-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 15:46:38 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b07d4d24d09so192723866b.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Sep 2025 06:46:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353fb5a6b1sm173858866b.49.2025.09.25.06.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 06:46:37 -0700 (PDT)
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
X-Inumbo-ID: 0ef586f7-9a16-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758807997; x=1759412797; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WfpJy7TlMBMd8hvcVkMmj8g87znN76f6f5pz63Zwsqw=;
        b=KngfsZesObbU8PbUrODccLRTw6075EdZEbZ+Co2MgrL7Fedu9JQif3FE+wgOJ/vSZO
         LI8520D4JIv1nA50DBZU5TE0qPMBdPGoNNI6Vwz51Mtbm6WZ/JqlisONgw+CM1Fmg+oB
         j2BNqHQlq5Igohxg3U5yReKENoOoRN4qtivu0YKxzY2X0PlaGhK9ho8qsKBXNrs/wld5
         gLLFzXFUPgj54lZbUWbjf3lG7qHc/ESlyF3ZTA7CcMX6G68zIZ1FNmgXmC5nvsE6x/J7
         qCYYcX6wpP8WwIvyEgi+UwDyEatOa2SEkH71d2sHBeJJ0vkwf893QZ8bM0l9Yd9PmG96
         6TiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758807997; x=1759412797;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfpJy7TlMBMd8hvcVkMmj8g87znN76f6f5pz63Zwsqw=;
        b=o4cx7yqKcPEXcjDPoWqPDf4S0MH0L+Qe1GMdCoWQoYlNdcV54DvMVyxFNl9zFNfyMD
         e/hwG8HSLDUmcBkGPaD7iT0AW8lYw8rqt1U24e+ZQu6RATrccQEdfCLL4GOYrYxQuN7w
         +k/3nCarE+z/lsfGBq2cqJXz0bPgbURpCUCI/yxcaIeFCEoEk4QPvXadK25eDdIpA3wl
         VRvBF84Vk0CHrz2eOyTpXx+amZ1tYdA+DCOYCM7Lq+21mjcVA/EBHElRLRi6Uev0370a
         A4GNaSdT3VC4mAaCMYHDCWkehk6sJ3gSiNTsDHrh6+lv0mVgLb4DoRyz3NZEcwCGM8rr
         b4Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWyBJFd020ZQjpzd0Ly0VhP6NBni2zLFzxFf6VGKr7Eye7A8bxwaN/H/ZodRRWVmiCJaszYrCQnD7A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YziZIZF0Lcvy42orcrxJCWRCXyvLKfusgxAjtQiX6c6R3VT9q64
	6VlMi6Q2GVVpENKRozsZH9q3i5irOJnbnpS7wCq5t4jZqxIa/q9tB41nW/ZQICvI/g==
X-Gm-Gg: ASbGnctolB+GfQ4oj3KGo6szdxtXzFAGPjpjJRvnJ692CIJgHG/Lc/Aa1qezPSi/beb
	3YhR71y2V/GZJ8u4N86CC08+CdKzvDZyx/1YVEmrKGQEJsLmSaaitcice/HBMpL0ND7YV5tGJgb
	VSdSnIzT12SyApV5aT9Gvx9FIrZ3RLUypLmzbdhlwoJn2Lpy9kyiUkMCt+99ZMrefJvRtY0JJjz
	d24idQxWKPO4zTF0kOBw7sK99TSONJCqYhwfHLntsRDPtF4wP3+eZaIfF1858+ebLv+NjKXq0D1
	iKELsD+mRDCKmVFYTJ30By32T/u0g+lBgaXe82W49nCpzZlrIuNsv1vQuHM3mDcuhF/o+OgQQOU
	uHt5f3AyyOEusKlXlQWSjb8PbR2oFNnBNCHOqS7G3cNbkh/pbyOApn+e+EgHcelw5N4iXqEhb3b
	dpHHxU804=
X-Google-Smtp-Source: AGHT+IGC/ssWrq/rpfmwSfNJCyCz38yTd5CGp9GTbjTeT7Xz/NlXCafd4PVIBOHw873jafCdrSqskg==
X-Received: by 2002:a17:907:2d26:b0:b07:b50d:df70 with SMTP id a640c23a62f3a-b34bd44061amr380672566b.34.1758807997491;
        Thu, 25 Sep 2025 06:46:37 -0700 (PDT)
Message-ID: <f6d2806d-26d7-4f7e-a064-23cd34fa2c39@suse.com>
Date: Thu, 25 Sep 2025 15:46:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/18] xen/riscv: detect and initialize G-stage mode
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <7cc37e612db4a0bfe72b63a475d3a492b2e68c83.1758145428.git.oleksii.kurochko@gmail.com>
 <b7fa50ae-8094-4451-8326-53c975f7b441@suse.com>
 <0c4e446b-abe1-481c-91a6-60a49459b486@gmail.com>
 <9777e972-8ea1-4dfa-bab0-ee7e13f0a0e6@gmail.com>
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
In-Reply-To: <9777e972-8ea1-4dfa-bab0-ee7e13f0a0e6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.09.2025 17:00, Oleksii Kurochko wrote:
> 
> On 9/24/25 1:31 PM, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/setup.c
>>>> +++ b/xen/arch/riscv/setup.c
>>>> @@ -22,6 +22,7 @@
>>>>   #include <asm/early_printk.h>
>>>>   #include <asm/fixmap.h>
>>>>   #include <asm/intc.h>
>>>> +#include <asm/p2m.h>
>>>>   #include <asm/sbi.h>
>>>>   #include <asm/setup.h>
>>>>   #include <asm/traps.h>
>>>> @@ -148,6 +149,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>>>>   
>>>>       console_init_postirq();
>>>>   
>>>> +    gstage_mode_detect();
>>> I find it odd for something as fine grained as this to be called from top-
>>> level start_xen(). Imo this wants to be a sub-function of whatever does
>>> global paging and/or p2m preparations (or even more generally guest ones).
>> It makes sense. I will move the call to gstage_mode_detect() into p2m_init()
>> when the latter is introduced.
>> Probably, I will move the current patch after p2m_init() is introduced to make
>> gstage_mode_detect() static function.
> 
> Maybe putting gstage_mode_detect() into p2m_init() is not a good idea, since it
> is called during domain creation. I am not sure there is any point in calling
> gstage_mode_detect() each time.
> 
> It seems that gstage_mode_detect() should be called once during physical CPU
> initialization.

Indeed.

> A sub-function (riscv_hart_mm_init()? probably, riscv should be dropped from
> the name) could be added in setup.c and then called in start_xen(), but
> is it really needed a separate sub-function for something that will be called
> once per initialization of pCPU?

Counter question: Is this going to remain the only piece of global init that's
needed for P2M machinery? Right in the next patch you already add vmid_init()
as another top-level call.

Jan

