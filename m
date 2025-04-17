Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 466FCA91636
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 10:11:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957100.1350294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5KLJ-0001id-N1; Thu, 17 Apr 2025 08:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957100.1350294; Thu, 17 Apr 2025 08:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5KLJ-0001gD-Is; Thu, 17 Apr 2025 08:11:29 +0000
Received: by outflank-mailman (input) for mailman id 957100;
 Thu, 17 Apr 2025 08:11:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u5KLI-0001fv-4O
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 08:11:28 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ee04ea9-1b63-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 10:11:26 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39c13fa05ebso331008f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 01:11:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd2198926sm11719428b3a.20.2025.04.17.01.11.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 01:11:25 -0700 (PDT)
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
X-Inumbo-ID: 8ee04ea9-1b63-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744877486; x=1745482286; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ag5MbaY2A4khSUryKdB90DoK5JPKhKov8MtQLPKhPcc=;
        b=Y76saS0yX5fQHWImwA4JhK9Bc3WtER6Nk2HQb8WeAtm9oWfwtNq5YNJRFl6LuwNvAA
         Ddkng9wZvqQQznADMCCjB1GOF9Eb5OYktAXpOtxiFnqDtYWlj2qCoYknx0avsz7ILulo
         HiCH91Lprvb9i5w4v/8xDF95pyzFfOsghWcHgeBTyfe/nM5vOFHkJpXGFI8QuRfIZUQ9
         ppv1pZ0fA87gAkcqpe+Y3inQeR+3l6hAOB7lLKs3YLWo2YM7qszGRaNDJdaIMMayAkOj
         92L0Nm1Iw32p+2a+mux4RW8FLRSQLxQiyjYb3PuGNu6vuhY+0tb07ZiwNnRpRHzp6+Db
         3+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744877486; x=1745482286;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ag5MbaY2A4khSUryKdB90DoK5JPKhKov8MtQLPKhPcc=;
        b=H0U8mrVqQo1HsiiKKn3UHR2FpjEeoYUhgYiWQW7YSdflYxqeVyp8zS19lOa351KtlA
         KzbxD+andAURna2HdICZv1npBSiXoMwrLQ41d0FnNPLhpd9kDMy5Pt5j5iymIBznav2K
         BuTU+8ssN8tVvwK7F6WtLx+2hKcmQrQmHsQEFH6aZxKSp+LAN4IHn6BjgBZnS2src6j/
         C3iXOFeidbq8oV72S1Y/QYpnA92d49sGSqGu3Q5P0kLv/uB/mWruprOoZJ5PPVnNX3Jr
         /yPZ5LiqOw7R3GaITwM97LmVJP7HNFIkEeRN8h1Cpe06KSx4Eps+uOPaunDQL86Nm5FH
         IpsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJVBW/7bRgbfZJp+Ncka3WFmARQlaFvkYyobqrKRWYCRqu4athOn/iJhruWQf/g+YWya03LpkshuA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHEyQWiPHsQWvoI5fqaAOJNYNN3Ln0Kz8s2BT96soJzUOwM/5o
	26AmVMvgrGfTSG5baRS49R34fHsrxRJ2lt+qjct3pdB+KPnARer0vxXD5zXytg==
X-Gm-Gg: ASbGncsBd48ngWpRlcTrixNx15v3kGgMuWax9gGnktdGCiY/mTcDElc3YuLqhVz9/LQ
	3USegTLHPqeSLRVHk5GnoSqEQ/7IkMYKD0boRngQ84Mq4w6+Uc96vgutXjKToRq1X0H9aDqKwwH
	htDjcAhrni6+mq7QQUUma1SQZp0ZrDD0TdenQxj/wO8WwEWxaiHtjCmVlf3Uho4dZ+W4/Q/g4uT
	mkatBrZ10NzcG5Du/xVnOlpwpPdHI10Mytv2nS4ZWkNkGI/TerElwr3b7mYV4hucuy746iVq0O9
	cjkaqwDi/1PfKQ40pZ/lomY7N+xkDndxD3tN2gLTq55TjWE8Q9+oWo/K3IaM27cpGp7bReqGrgo
	jXR7JHKyDkE2Jjl2du27KJnNg6g==
X-Google-Smtp-Source: AGHT+IHkwWV6FV92pRq3+4+ztsU74wi/Q6Hb74nIowZ1SZh1DzFgPzxaLnjt/jNZxMQFHUM6zF3TnA==
X-Received: by 2002:a5d:598e:0:b0:39e:e557:7d9 with SMTP id ffacd0b85a97d-39ee5b12f6amr4485945f8f.5.1744877485637;
        Thu, 17 Apr 2025 01:11:25 -0700 (PDT)
Message-ID: <3d20ca0f-8b11-4348-8802-03ac5b96f7f2@suse.com>
Date: Thu, 17 Apr 2025 10:11:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] xen/common: dom0less: make some parts of Arm's
 CONFIG_DOM0LESS common
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1744626032.git.oleksii.kurochko@gmail.com>
 <c31977cb20be408ac695ec44edaa6e058e6ec10f.1744626032.git.oleksii.kurochko@gmail.com>
 <6e0ec1f3-08e5-475f-8d66-f3814e047760@amd.com>
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
In-Reply-To: <6e0ec1f3-08e5-475f-8d66-f3814e047760@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.04.2025 10:08, Orzel, Michal wrote:
>> --- /dev/null
>> +++ b/xen/include/asm-generic/dom0less-build.h
>> @@ -0,0 +1,40 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
> empty line here please
> 
>> +#ifndef __ASM_GENERIC_DOM0LESS_BUILD_H__
>> +#define __ASM_GENERIC_DOM0LESS_BUILD_H__
>> +
>> +#include <xen/stdbool.h>
>> +
>> +#ifdef CONFIG_DOM0LESS_BOOT
>> +
>> +#include <public/domctl.h>
>> +
>> +void create_domUs(void);
>> +bool is_dom0less_mode(void);
>> +
>> +int construct_domU(struct domain *d, const struct dt_device_node *node);
> I don't see necessary headers included for these structs

Just to mention it - it shouldn't be extra headers, but forward decls. We
aim at keeping header dependencies down where possible.

Jan

