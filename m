Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B47A98867AA
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 08:56:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696683.1087790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnZkw-0004y4-GG; Fri, 22 Mar 2024 07:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696683.1087790; Fri, 22 Mar 2024 07:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnZkw-0004vT-D7; Fri, 22 Mar 2024 07:56:02 +0000
Received: by outflank-mailman (input) for mailman id 696683;
 Fri, 22 Mar 2024 07:56:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bHXv=K4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rnZkv-0004vN-Bj
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 07:56:01 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e97d003-e821-11ee-afe0-a90da7624cb6;
 Fri, 22 Mar 2024 08:56:00 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a44665605f3so212122266b.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Mar 2024 00:55:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z27-20020a170906715b00b00a470dfe7e06sm733098ejj.118.2024.03.22.00.55.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Mar 2024 00:55:58 -0700 (PDT)
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
X-Inumbo-ID: 9e97d003-e821-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711094158; x=1711698958; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YFxXQpkh7JGNlEyCKQ+2+VA78aIIL4f5uVYsQolcK+0=;
        b=fjzyu7kZZHEWvfv/ABGBQf45U9Nu4touu3KoAa11FDV4sNsRdnhkhOCkd0kzYoS0vi
         I8tN/37pU9ZLRqFfSC2Zd5V5JvRgR6srrsLIthHE/q2xZCVRu0MmsjPxIqAORs1WmAXu
         WdBgDw6mY0zwTEHFUuibqBefTkCxufkDTSTLmn5ltwjX5qVzPWz9JvswfxRUD8PEu4Lr
         KjnJkplBpKmxAlkOWtcC3QTjGDd9Huj7W8dW0v9OHbz7hX8h/BBjMsY51GChPG7FoOhF
         B4V0T0zDqkjh0G1E7BedEURmNdK6w6N0GuQJPtRoVGZjjctHXyALLxKgJjsJtM3SEpcd
         3O3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711094158; x=1711698958;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YFxXQpkh7JGNlEyCKQ+2+VA78aIIL4f5uVYsQolcK+0=;
        b=L0uy4Uirls/Sp2MZiqFcZ6XRqwv6ck7+7X57plmAnQaDitncEsy6nmF56z0tnzkC1s
         NfVHA+mItfJpJemEhktSWE62k1J83G11EsbAbR4orQwgLAxb08laTWJcVEknalz9qOvu
         zRf+7fvGoH2sNr9NDmesV1kAUqvXKgBVQXvKy/NuaYaPPkmOexDfCfH+vuUYoFbJYXFL
         F4xB8n3eHSJsXWZtww3zJOyWgk1iPSkO7FDWOGovKEullRrT+FzeKEXfGYhNwgY5hUvP
         IHpEvipcO03EjlSuq+bI2ee3e+UdGTiMeiT8cSEb12eJrA/3DBJAYvxgsEU2IgrAeglp
         WZwg==
X-Forwarded-Encrypted: i=1; AJvYcCXSjfNeNKVm/BEMPxSfbKxL3U5z5t46qtDW/e6fHin1ch5mO1CQIHYBAbOVG4mvjQBMKZb9hTj9AbOt9JP8pimUHdbNiVzYPOCWo49O3/4=
X-Gm-Message-State: AOJu0YyztZbGWU9KTYwklS5vl6TvcUgVLHUo4hEa8+YKdc8TLDl3Tzgi
	3CVt2Qp7i47J8KGdOTBErLIFpfh3/eOWzkvMX8PGI4LvRtUeB/syGBMGP7BaIQ==
X-Google-Smtp-Source: AGHT+IE/H8K8ML+12BQz94m7zC/R1jnshkZPpeOUkZc4s4yW+jrRZie0WdZEuXIofG0xwfz1bLDJRw==
X-Received: by 2002:a17:906:d9ca:b0:a47:ae0:160 with SMTP id qk10-20020a170906d9ca00b00a470ae00160mr1130903ejb.73.1711094158328;
        Fri, 22 Mar 2024 00:55:58 -0700 (PDT)
Message-ID: <4268b0de-e959-42aa-bc5c-0c48a359ea1d@suse.com>
Date: Fri, 22 Mar 2024 08:55:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] xen/device-tree: Move Arm's setup.c bootinfo
 functions to common
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
 <039524d4157dddb2faf6887739a727f6e993b53f.1710443965.git.sanastasio@raptorengineering.com>
 <19c4d0c2-c69c-4310-bf02-28d3894f8006@xen.org>
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
In-Reply-To: <19c4d0c2-c69c-4310-bf02-28d3894f8006@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.03.2024 18:47, Julien Grall wrote:
> On 14/03/2024 22:15, Shawn Anastasio wrote:
>> Arm's setup.c contains a collection of functions for parsing memory map
>> and other boot information from a device tree. Since these routines are
>> generally useful on any architecture that supports device tree booting,
>> move them into xen/common/device-tree.
>>
>> Suggested-by: Julien Grall <julien@xen.org>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> ---
>>   MAINTAINERS                       |   1 +
>>   xen/arch/arm/setup.c              | 419 --------------------------
>>   xen/common/Makefile               |   1 +
>>   xen/common/device-tree/Makefile   |   1 +
>>   xen/common/device-tree/bootinfo.c | 469 ++++++++++++++++++++++++++++++
> 
> The new bootinfo.c is exported quite a few functions. Please introduce
> an generic header with the associated functions/structures.

By "generic" you don't mean a header in asm-generic/, do you?

Jan

