Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFAB80A082
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 11:22:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650544.1016193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBXyz-00068y-8J; Fri, 08 Dec 2023 10:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650544.1016193; Fri, 08 Dec 2023 10:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBXyz-00067U-5W; Fri, 08 Dec 2023 10:21:21 +0000
Received: by outflank-mailman (input) for mailman id 650544;
 Fri, 08 Dec 2023 10:21:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFXw=HT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBXyx-00067O-Ej
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 10:21:19 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 850931b4-95b3-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 11:21:16 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-334af3b3ddfso1891000f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Dec 2023 02:21:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q15-20020a056000136f00b00336098d0e64sm670724wrz.106.2023.12.08.02.21.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Dec 2023 02:21:15 -0800 (PST)
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
X-Inumbo-ID: 850931b4-95b3-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702030875; x=1702635675; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zhm3E4xE/Sb4A+ZXJPLdHZg9ZIHlYv2OPfxmFk8n8sE=;
        b=XOLABq9lYxK3LRSZwOzyXhPvKSOWogan46tMulNZnSk3uyhzz8rNJCfqvLM5r+zb1w
         THBt88HLRdWoNbYy+Uq86Hld6A8Q5G1ikh9l2vVmcyEeXe8u4UQ8+9jJDJ2ILD1CcdxB
         hg0fcL342nPF4cylo3//FwO5oPLGFID/j6amdfMMvtcMjCDVYi5XbLfTZ5GbolXS5O+o
         ZDVFV9odkW6qB3nOTU7qJ2s0zFE3fgcYxXy3z+pyA+r6ZYqILhRS1P4PNb5pCuFC2fdR
         4kLT25tUAyY/gwVE6dtSd6sTSGk2u4BbhP/AlsPBBNtQssxEpU2UH6o3m4c+HDnorXwb
         eBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702030875; x=1702635675;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zhm3E4xE/Sb4A+ZXJPLdHZg9ZIHlYv2OPfxmFk8n8sE=;
        b=Pl4x7yOPLM9Tbr3YgkZ7ZCwSToGwx8MKDxdxqdLYBzU/aomj8qELdiDGKchPG2jPgW
         75nYilzb9+W2qjlGvQh0zQ46WkE/ccfoyvkbd51KK2yWZ6GYvuoR7WPDOWaxH0cZNGRQ
         lOZ6rcluWamUwqhmXjtx4HABFRsvQTckomRykMfoEa/loV+ZG19GuhSiyQ/OHuo01jWP
         m55o8tHmtCNLADFGeZjzppLvZ3blPDx+hvT7tnqAQl2JxxOq67OGBbPr18jiC5SvKAp4
         4WPU4Xr7rWPuCOQ+YE3oPPE+JtoGjIVmjuxCUQOqHkW6tr4Q9gc9lz9xP6G5i84w0VlO
         0mtw==
X-Gm-Message-State: AOJu0YxoLgW5Wr/ABubM1lB5P0QnkYNe1VZZjKcTRAb86XxfjGAqo6Nd
	aPbJUMuo2SLPdMPRPVQK3Dhq
X-Google-Smtp-Source: AGHT+IG5BA5AryVVFNkeqk9QSIf6o1VJe4ffP3b2Whljg8IpX9IyovILq/PbZFBhvQ3WoMsK2Fljeg==
X-Received: by 2002:a5d:6549:0:b0:333:db9:47e2 with SMTP id z9-20020a5d6549000000b003330db947e2mr2080105wrv.63.1702030875403;
        Fri, 08 Dec 2023 02:21:15 -0800 (PST)
Message-ID: <a060e05a-2177-4344-8674-0d62a9095167@suse.com>
Date: Fri, 8 Dec 2023 11:21:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/39] xen/riscv: introduce asm/iommu.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <68be3d368bf6ed96b0bb53b51a2fd07696cb338d.1700761381.git.oleksii.kurochko@gmail.com>
 <ca13b1b0-8b96-47b0-abc5-9711f96ccca0@suse.com>
 <cdc3fe19d7e9e60c348eb1c25c716ecb9486a664.camel@gmail.com>
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
In-Reply-To: <cdc3fe19d7e9e60c348eb1c25c716ecb9486a664.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.12.2023 10:29, Oleksii wrote:
> On Thu, 2023-12-07 at 15:22 +0100, Jan Beulich wrote:
>> On 24.11.2023 11:30, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/iommu.h
>>> @@ -0,0 +1,7 @@
>>> +#ifndef __ASM_RISCV_IOMMU_H__
>>> +#define __ASM_RISCV_IOMMU_H__
>>> +
>>> +struct arch_iommu {
>>> +};
>>> +
>>> +#endif /* __ASM_IOMMU_H__ */
>>
>> Instead of adding this header, didn't we discuss to make the #include
>> in
>> xen/iommu.h depend on CONFIG_HAS_PASSTHROUGH? Also - no SPDX or
>> footer
>> here?
> We had discussion about some stuff in device.h, but we can apply it
> here too. Only to place will be needed to update:
> 
> 
> + #ifdef CONFIG_HAS_PASSTHROUGH
> #include <asm/iommu.h>
> + #endif
> 
> #ifndef iommu_call
> # define iommu_call(ops, fn, args...) ((ops)->fn(args))
> # define iommu_vcall iommu_call
> #endif
> 
> struct domain_iommu {
> + #ifdef CONFIG_HAS_PASSTHROUGH
>     struct arch_iommu arch;
> + #endif
> ...
> 
> I'll do that in the next iteration of this patch series.

What you suggest is to eliminate the need for an asm/ header. I asked
about an asm-generic/ one, though. (But I'd be okay either way, as long
as the redundancy is avoided.)

Jan

