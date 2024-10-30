Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5809B6010
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 11:27:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828010.1242798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t65v0-0004Yi-Dw; Wed, 30 Oct 2024 10:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828010.1242798; Wed, 30 Oct 2024 10:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t65v0-0004XE-8v; Wed, 30 Oct 2024 10:27:14 +0000
Received: by outflank-mailman (input) for mailman id 828010;
 Wed, 30 Oct 2024 10:27:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t65uy-0004X8-V6
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 10:27:12 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8532bfad-96a9-11ef-a0c3-8be0dac302b0;
 Wed, 30 Oct 2024 11:27:10 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-431688d5127so60545775e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 03:27:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd97d5fcsm16981395e9.28.2024.10.30.03.27.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 03:27:09 -0700 (PDT)
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
X-Inumbo-ID: 8532bfad-96a9-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMjkiLCJoZWxvIjoibWFpbC13bTEteDMyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijg1MzJiZmFkLTk2YTktMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjg0MDMwLjIwNDEsInNlbmRlciI6ImpiZXVsaWNoQHN1c2UuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730284029; x=1730888829; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CoSDZR5fkUvLaZGhHNLFHVwtm4OxxVMudiWlYIwHK+k=;
        b=TxDhOqv7ktDC4NF/Aw6moKGcr+6Mo5GrLeD6qhPq6iOdNmFKYwzdoftnPbeQ4+UipX
         yiQ9XPbbTcnHi+K2YaW4sTTaaUmUlA6Vkl9xFVeBRzWZkx7s0vYN1d90QJSdFmMtMFmA
         IR/Ugs5iQpUAsmeRPSJlgNK9XwNhkkEtQdxjGQZp46VUvGZiZO2CNOk9clkOJrV9MIP0
         zBoht/QVd3kXmOdBRUdAAVDWY93ZVIcXxUdYfvfz0zwGrQn3S3rXecNL8LqXatJi40NB
         f8IBo6ZjCKsprbrwAOAjVftCgeHowfrq22o+BtABuCGZXrleXNWZYCKiTXz38HEChQFw
         HD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730284029; x=1730888829;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CoSDZR5fkUvLaZGhHNLFHVwtm4OxxVMudiWlYIwHK+k=;
        b=jyD9YVB9rH248SV8uCreZd3pHzHedUcXUfRNcmyehCwMNH6KcMGD4otCoRdt8Vp0Ol
         EQgBFDHJMXYScGW39pLdRm0WswBj6uVbX1vSBY6JbsN9JqJoVUYTq+tQTIgalzs5hlgp
         bd3F9kj0cYpS+Q9cFv4X1jJYGEGhtyayHYsjXkSK1o7cFV3vZVtlur2fy8EgnV7gGBya
         IVNKf0Ztzh244CWua2KFXUovz6fkc6Tm8e8c/TtOKs2Q5Fth9t1d1WLjBN2QpejnsqQz
         N3GCYoh6Zot/PCO5KpQk8xAjFMup1u4FkPwDroFuG7DkeO2TdNXkZuttPCtOqQD985n7
         w7yA==
X-Forwarded-Encrypted: i=1; AJvYcCVGBy6Wgh7q8DnZh6j/OEML5PVw0v0h2oEikp+vtm/pAcnp3n/M00xtL/Y+0s5LsAsXSMscrxUdG0s=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/6JpvEU8i9FkkO1iHc3m3I6vfkrh4qp6pJW89We/El2A6MYQJ
	hiym0YMyTnucRCtHgyZyBVFksmKRucSf6wY5Wg5vwBvJC0bgugLInfqXmZpjVw==
X-Google-Smtp-Source: AGHT+IFvu7frXlQaVdF/9QsPGxpqVJKS3Oir6s6nqv6fzs+iO5j31CMDYfxJcS/Dqio5KyI/ihpjeQ==
X-Received: by 2002:a05:600c:46d4:b0:427:ff3b:7a20 with SMTP id 5b1f17b1804b1-4319ad049a8mr112151105e9.27.1730284029511;
        Wed, 30 Oct 2024 03:27:09 -0700 (PDT)
Message-ID: <7acb9088-4d46-4d06-ac47-cad9043dbd78@suse.com>
Date: Wed, 30 Oct 2024 11:27:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/common: move gic_preinit() to common code
To: oleksii.kurochko@gmail.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <b1ded26dcebf9a3228fe4062825273720e0c59fe.1730220384.git.oleksii.kurochko@gmail.com>
 <a5539c03-4e19-4739-95cf-439aa0bea9a3@suse.com>
 <f26637fa6f315385e0c1f2cbb338389d7c8b0587.camel@gmail.com>
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
In-Reply-To: <f26637fa6f315385e0c1f2cbb338389d7c8b0587.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.10.2024 10:50, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-10-29 at 17:57 +0100, Jan Beulich wrote:
>> On 29.10.2024 17:47, Oleksii Kurochko wrote:
>>> --- a/xen/common/device.c
>>> +++ b/xen/common/device.c
>>> @@ -4,10 +4,14 @@
>>>    *   xen/arch/arm/device.c
>>>    */
>>>   
>>> +#include <xen/acpi.h>
>>>   #include <xen/bug.h>
>>>   #include <xen/device_tree.h>
>>>   #include <xen/errno.h>
>>>   #include <xen/init.h>
>>> +#include <xen/kernel.h>
>>> +#include <xen/lib.h>
>>> +#include <xen/types.h>
>>
>> I don't think non-ACPI configs should include xen/acpi.h here. Surely
>> this
>> can be moved down into the ACPI-only code section?
> xen/acpi.h was included as acpi_disabled is defined there and it is
> needed in commom/device.c for:
> ```
> void __init ic_preinit(void)
> {
>     if ( acpi_disabled )
>         ic_dt_preinit();
>     else
>         ic_acpi_preinit();
> }
> ```

Oh, I see.

Jan

