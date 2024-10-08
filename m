Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 530E4993EC7
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 08:41:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812667.1225459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy3uf-0006eR-F2; Tue, 08 Oct 2024 06:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812667.1225459; Tue, 08 Oct 2024 06:41:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy3uf-0006bp-Bo; Tue, 08 Oct 2024 06:41:41 +0000
Received: by outflank-mailman (input) for mailman id 812667;
 Tue, 08 Oct 2024 06:41:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vy9o=RE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sy3ud-0006bh-Bg
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 06:41:39 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e6a91ee-8540-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 08:41:38 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c89f3f28b6so7573733a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 23:41:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a993fd777e6sm390280166b.79.2024.10.07.23.41.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 23:41:37 -0700 (PDT)
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
X-Inumbo-ID: 5e6a91ee-8540-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728369697; x=1728974497; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qQD0m0Q0QJDu4tcwfWlE9/BItmbriET4OngEe69afxk=;
        b=LVwxfSavKAIYjVTGjl3gBll8/gWZEDuEXfzq+neqTvSfML4kgzlmMCaiFDOSsSB3Rn
         N0D07GGhktX39H3BoASEqiHfY5StpYeQSpJfQybP/0dNu+wsX3LFSpI/KbpYKbD69O+E
         PlXlmXQwAGJvP0MzC653sHAzSDtIxV19k6PZkD2Iui8PEUvhvaMk5/4KaP54f2Q9m+Jj
         MOY55d/cEakZ3I+2NuHzpthm+DdesPdggRMq4eesLgsYdV2xf0Wbb/D9YrULZS1q6Hpz
         uLX7tKoQbRUSAhr0F8kzsPgfilCGoz/A6XyZ/3Ah7wyl2K1H5BIwiS+XhZnf4uRENmTX
         ZkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728369697; x=1728974497;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQD0m0Q0QJDu4tcwfWlE9/BItmbriET4OngEe69afxk=;
        b=MxgvpL16E625Ck1uzNMhsxVtuYSHv8kq1xnPgH9ZZEkk1ki+v+/zP0/yQ81d8zNyn7
         vnru8tDDNCBa8Mm1ez2SpCgTNxNsmx9eC0k306tiBtxiUNnjqDPWBKhlhrexUfySIYNO
         6y4mq9t8eyTHkvKHfVMEQjTS9+DY0l8QeudVEDIbQYYUFvQUHtzyMf4hA2Bw/klmasUn
         dmIqe18HOcGgQOckm/Os6ts1vvZXJnnLAt/zIJFIR0Kibv0H6kbtZplV+s+SzMbJvVtQ
         6CL2zR89a0XyE0YvuA5eDFGsU2kBliOP+7YL/TeTiq8K8d6ihDlba0Uo1rICQws0wsX4
         66rw==
X-Forwarded-Encrypted: i=1; AJvYcCUJwwXIFmW3osajLqg0VXtnDzhm7hfy3BsSE4zHR5GLucHjDku1DeXFzH7Q1msX0BfGUSWPSdf4KWc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxyORWnmJjhig/YRV3fCZSr/PYrlJiz3iuGDilYg4P2NJFGLanO
	f4RMkZTyvxr7PUPNv2XzXpf8SEOr/941gu/I9xeYMgV4oeC92nGMsZMlfe1j3A==
X-Google-Smtp-Source: AGHT+IHus3z9RlIARnEcLZiQVnzGehqTko/fW6UJ41h+cLIoyW0vkWa7FlcEmSDdobfyeUiKmBtEXA==
X-Received: by 2002:a17:906:f590:b0:a99:4278:8df8 with SMTP id a640c23a62f3a-a99427898f3mr1014612066b.34.1728369697520;
        Mon, 07 Oct 2024 23:41:37 -0700 (PDT)
Message-ID: <87f57db3-3784-47b2-a923-ca09cfee91b2@suse.com>
Date: Tue, 8 Oct 2024 08:41:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/44] x86/boot: move x86 boot module counting into a
 new boot_info struct
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-2-dpsmith@apertussolutions.com>
 <1e3d6e99-37df-4824-8702-3e8ae7a4923f@amd.com>
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
In-Reply-To: <1e3d6e99-37df-4824-8702-3e8ae7a4923f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.10.2024 19:57, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> --- /dev/null
>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>> @@ -0,0 +1,29 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Copyright (c) 2024 Christopher Clark <christopher.w.clark@gmail.com>
>> + * Copyright (c) 2024 Apertus Solutions, LLC
>> + * Author: Daniel P. Smith <dpsmith@apertussolutions.com>
>> + */
>> +
>> +#ifndef __XEN_X86_BOOTINFO_H__
>> +#define __XEN_X86_BOOTINFO_H__
> 
> I haven't been following closely, but I think if we follow Frediano's 
> naming scheme, it would be:
> ASM__X86__BOOTINFO_H

The new scheme became "official" only after Daniel posted the series, by me
actually committing what previously was only a proposal (coming from Bugseng
originally, as a result of long winded discussions). But yes, now that it's
official new headers ought to adhere to it.

Jan

