Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEBFACAA4C
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 10:00:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002878.1382280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM05n-0004MO-Ft; Mon, 02 Jun 2025 08:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002878.1382280; Mon, 02 Jun 2025 08:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM05n-0004KH-DD; Mon, 02 Jun 2025 08:00:23 +0000
Received: by outflank-mailman (input) for mailman id 1002878;
 Mon, 02 Jun 2025 08:00:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uM05m-0004KB-8W
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 08:00:22 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0fbf742-3f87-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 10:00:20 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a36efcadb8so3568375f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 01:00:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2eceb0288fsm5057609a12.9.2025.06.02.01.00.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 01:00:19 -0700 (PDT)
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
X-Inumbo-ID: a0fbf742-3f87-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748851220; x=1749456020; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GqmeDNkJdMV6tc0fk79c9Oib5+eJkyYKFPZAKEz0tNE=;
        b=a0niYQ1LoQJQua0fu5KEB/TQUcYmXZs54u8Dny5mMMD0clVy9GHkvLOY12eN1ki2gL
         IHD/KKNn9Jpb23CBWzAwrfDNQlyDtrcn/t6AOx+5lPhTn0ejrPje+1L0ilb63jCVr9Xy
         kDmzM9HrfK2DqmSU0tu1/ru3rMhTiehqWNCfktWBYP0aZkq+jLT506K9BhBSgOytfjdw
         6taYJqX4rHKBDFCwCvEslcNTggRKFc6l48LPsLHNcFSHAFy+fOW1LeX+JDVpjVuBLnoW
         OvIJ+tNw7f1p5Z+hVlljDYNkOsT9wfnGZ8N01k0haLB+GisOfiBSM/YYx1PHKZysm4qB
         uroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748851220; x=1749456020;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqmeDNkJdMV6tc0fk79c9Oib5+eJkyYKFPZAKEz0tNE=;
        b=W3uRl7ofidNWPBD+MmD+Zf7016O6ifxXcBNeeWpvKi9m/KR8yNEPi+Vj3wcfe/HXWO
         edJ7NFsx0qQPScNLkK6HUjWJGf3yxDgRW+BuFWq5weXqIN6Sdw4I5+NGFQymUdKj6Laq
         W4o5fPJd5HqD/6yK1GO77VauHis8sEnfTNvnh6Qk/4XucEroDwC9jkrO3W9thaiMxyNb
         A3ZK9eP6ZDImQqJeOOXr6VvHz3eXlsa4oIgNXIOiwFGmujxLH+j2B9xQK3fXYkNu521f
         I3KvOlU4GzbYSzxngH8HlK+BmyCA+Jcy0sEvfjKtUsxHHtIkIeL3slhfFGd4ZhJm89G7
         gLNA==
X-Gm-Message-State: AOJu0YyYK6qapJ44Y5Ftu7Sr/ICTx8AG0xi/jwdF6Oyku0cQeVHJHHrh
	JuLCyUPRAZRQzqObllREY1BY9JQdxE1XyARbI9SSV/qqYiCwiZjIC3hwxnIxdFr9BA==
X-Gm-Gg: ASbGnctsCE7RzBdRRAZsVQR2+bPQ6dla8XTb5cTJwr4wug7Nz12f8ZFJFOF7F+KRXPX
	8BpohpvaWYshTYXSsE7kI9RPaFYHsTcgmjLxCrb0zy+dXBcqCgu8Oi1qDTN14X5Th5etPj5ZiBZ
	D2/6n8xwFoFY3eGynQrvcKlpFjMvwQIOCfUgdsBuz2pwudsPp5rxt7jjf2HxX7sB6xaWbzjIX0+
	JdzfW3rQopF73GAJV1fcXuIkTgC1H9lHd16ppnBgnIgv6zSp2AIODTcTjwzNriC2lL44/YuPTJc
	sYZpkHsVc/WP1UOjshXhEDOQ53RwOeP3Smvf025eTT7kJvCnhApKf2z0b/Ywa3rA8SD4Xbjvqqr
	aJIjF86zSqrlMK3HG1hzl128wzlTWNQ6YhOPB
X-Google-Smtp-Source: AGHT+IEw8FU7DPK3ZDbfSq7h4rgIWjRGcdSfart7DivhOsBXCLmiwH+LK2gXPKb7QhC2/NgK9/+E9w==
X-Received: by 2002:a05:6000:220b:b0:3a4:ef00:a7bb with SMTP id ffacd0b85a97d-3a4f7a4d637mr9432431f8f.18.1748851219660;
        Mon, 02 Jun 2025 01:00:19 -0700 (PDT)
Message-ID: <af4a3712-bff2-4e39-9c43-77a47cb511cf@suse.com>
Date: Mon, 2 Jun 2025 10:00:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/19] xen/dt: Move bootinfo-independent helpers out of
 bootinfo-fdt.c
To: Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <agarciav@amd.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-16-agarciav@amd.com>
 <alpine.DEB.2.22.394.2505301845410.1147082@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2505301845410.1147082@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.05.2025 03:47, Stefano Stabellini wrote:
> On Fri, 30 May 2025, Alejandro Vallejo wrote:
>> --- /dev/null
>> +++ b/xen/common/device-tree/bootfdt.c
>> @@ -0,0 +1,97 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#include <xen/bootfdt.h>
>> +#include <xen/bug.h>
>> +#include <xen/lib.h>
>> +#include <xen/libfdt/libfdt.h>
>> +
>> +uint32_t __init device_tree_get_u32(const void *fdt, int node,
>> +                                    const char *prop_name, uint32_t dflt)
>> +{
>> +    const struct fdt_property *prop;
>> +
>> +    prop = fdt_get_property(fdt, node, prop_name, NULL);
>> +    if ( !prop || prop->len < sizeof(u32) )
> 
> Ah this is where the u32->uint32_t renaming is done!
> Since we are at it, we can change the u32 in the sizeof
> 
> 
>> +        return dflt;
>> +
>> +    return fdt32_to_cpu(*(uint32_t*)prop->data);

And avoid to cast away const-ness here.

Jan

