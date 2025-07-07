Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE67EAFAC4A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 08:58:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035239.1407462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYfnw-0003lY-MF; Mon, 07 Jul 2025 06:58:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035239.1407462; Mon, 07 Jul 2025 06:58:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYfnw-0003jv-JO; Mon, 07 Jul 2025 06:58:20 +0000
Received: by outflank-mailman (input) for mailman id 1035239;
 Mon, 07 Jul 2025 06:58:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uYfnv-0003jp-PK
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 06:58:19 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c33b9a0c-5aff-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 08:58:18 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a6d1369d4eso1481729f8f.2
 for <xen-devel@lists.xenproject.org>; Sun, 06 Jul 2025 23:58:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce43d246csm7801480b3a.167.2025.07.06.23.58.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jul 2025 23:58:17 -0700 (PDT)
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
X-Inumbo-ID: c33b9a0c-5aff-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751871498; x=1752476298; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yKH/zyTkqYmZlAzEi+7wsVsu7tzDCdCsBRr+kqkItho=;
        b=P9ZMFsoLs9UDYlR5S+HoyQ+/gNtD17taTlDlNpyiEC/iYJwEfVdGQha9AnH1x4qNIj
         CxhJBTIV8yLxxmZCB5Na8V3AckpcpJY/caEdkAwt9QT8jZxamHrM09ugzPLpNaMaqpFS
         BNDISIL7l5bT6HuuRPWxyDklL5qdhg+OnUahkuLaYNIlWWYZBV3xPKx0MHcw1juksTLw
         kwzBMDVN98Z0bSmSMGjiWkxSRoaukOCvnaok1lIn5CT1ECayoFcLb2qgxmSOR5RG6g60
         VmBDkFinP+dHUVGp4plcWThACAIi7aFtlhVdOFcF4y+YCD8FsV9VvfruLbIlZpConSiT
         RY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751871498; x=1752476298;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKH/zyTkqYmZlAzEi+7wsVsu7tzDCdCsBRr+kqkItho=;
        b=rlatvUoSJSX2YRuSUAG+lrKMj+WfdxLdajNkpsLIJmFgS0jQ7kwopQsicEGiMeCZ29
         NO7AlEA1DiVzBd2vN1JSAQZHN/uSbpaGnX/wKDJ03qTLKC50Gi9mYpSe/xo13Wml8C3i
         Q7n2GVBTTuhdQsZ2ChlC6tak/+fKXbPALAsLJ3dcz2s/RXtY3zxFb4OE8bCt4ynA8o+V
         XskWCT1/kPRzTMZ4cZsHRJc3+JE06Qj0hiBC0184kxmbgf43zNgSWg/X9BA+IYO7ULUX
         6nZ/yjbsYClQ+PM0jxzi256z8IbjvjX5CU0Rslk+RezsYSWCyHNm12/zrrCsMWPu5sM8
         dL4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXuG/UBlUztjo1bvoqrYI+6m4DlPqeHwoUT7ga0Hbrhd/JR1hnR/72HYEEDWB9+8h47QNeCc3qbAi4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZPqj86rPJINfT/K+Xx1I+YEi6KiyqBtZb8S+fejAa61iqyggX
	leLfR5/loOD/2xRpwKqgzEDDHzTDbSz46AMdr3VKs+cGFtKuBFmyAf/za6I0lgkXFn/CgECLSwD
	WqTk=
X-Gm-Gg: ASbGncsmMTjW3KdTjAYUY8JbOt7kJrG0+nZpQg7lZzjrqbA18bD5Mq9BrveYDHwRjLh
	ma2I+3RBh2p+j/6ipdcM0r8MKe/3+Oh8VX7tBASpyJ18Gz+T+9S3F2BFMXlUQAr4gaRkxipD6YE
	JW28oTHVDkmd+Hghu1wZlTj8DoY84RXIJZ72bqzpG5q0rPoaSPnSsg8tsBp5I2b+pb5HwSyn+zQ
	VLI8QVHWCeKBr67NcFgx31lUaPXeMGxvz6naQNe/2LSOXLnzZ5mgsHHQaTlZ0MSdVbIxTfdDjJC
	EncwIgphsINJdqbuFvdbQloePXa3wkrDRpfh22dzJm8RG8URevFyfc6/3VzlpfZBS6pcF0rX+q6
	f4RC3erd+RJXOLTOGc62UqZtc8bk/w/c16/YQvxSb4tBg8yw=
X-Google-Smtp-Source: AGHT+IEBj0yCnpcdTvFxmGOZhDjdrYYj7UBFwdW6YK+LW6ULik40oLmflNsco717oXL3ynL71ev/uQ==
X-Received: by 2002:a05:6000:24c8:b0:3a3:7bad:29cb with SMTP id ffacd0b85a97d-3b49aa88badmr4963957f8f.52.1751871498184;
        Sun, 06 Jul 2025 23:58:18 -0700 (PDT)
Message-ID: <ca0c364a-df7e-45ec-936f-875a07757ffa@suse.com>
Date: Mon, 7 Jul 2025 08:58:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/9] xen/riscv: imsic_init() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1749825782.git.oleksii.kurochko@gmail.com>
 <0b366c5b7c8d34a98c8ec4bedf1f00b070a6fae1.1749825782.git.oleksii.kurochko@gmail.com>
 <2d06fcf9-0aa8-48d7-84bd-4dd700a22da8@suse.com>
 <0064472c-39c0-4ce4-9a5e-725d8658d63e@gmail.com>
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
In-Reply-To: <0064472c-39c0-4ce4-9a5e-725d8658d63e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.07.2025 17:29, Oleksii Kurochko wrote:
> 
> On 6/30/25 4:27 PM, Jan Beulich wrote:
>>> --- a/xen/arch/riscv/include/asm/smp.h
>>> +++ b/xen/arch/riscv/include/asm/smp.h
>>> @@ -3,6 +3,7 @@
>>>   #define ASM__RISCV__SMP_H
>>>   
>>>   #include <xen/cpumask.h>
>>> +#include <xen/macros.h>
>>>   #include <xen/percpu.h>
>>>   
>>>   #include <asm/current.h>
>>> @@ -18,6 +19,18 @@ static inline unsigned long cpuid_to_hartid(unsigned long cpuid)
>>>       return pcpu_info[cpuid].hart_id;
>>>   }
>>>   
>>> +static inline unsigned int hartid_to_cpuid(unsigned long hartid)
>>> +{
>>> +    for ( unsigned int cpuid = 0; cpuid < ARRAY_SIZE(pcpu_info); cpuid++ )
>> We had been there before, I think: Why "cpuid", not "cpu" (as we have it about
>> everywhere else)?
> 
> To be in sync with other already merged functions, f.e. set_cpuid_to_hartid(cpuid, hartid).

To be honest, I'd much rather see such uses of "cpuid" (as a variable or
parameter name; it's less of a concern in function names) be changed.

Jan

