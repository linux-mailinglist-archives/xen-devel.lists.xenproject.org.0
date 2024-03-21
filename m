Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E921C88550E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 08:42:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696213.1086913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnD40-0004P4-Jh; Thu, 21 Mar 2024 07:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696213.1086913; Thu, 21 Mar 2024 07:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnD40-0004NX-Gi; Thu, 21 Mar 2024 07:42:12 +0000
Received: by outflank-mailman (input) for mailman id 696213;
 Thu, 21 Mar 2024 07:42:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ILtd=K3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rnD3z-0004NR-1u
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 07:42:11 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85dc81ed-e756-11ee-afe0-a90da7624cb6;
 Thu, 21 Mar 2024 08:42:10 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-56bcede226eso139785a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 00:42:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ht17-20020a170907609100b00a461b1e814asm8100759ejc.130.2024.03.21.00.42.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Mar 2024 00:42:08 -0700 (PDT)
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
X-Inumbo-ID: 85dc81ed-e756-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711006929; x=1711611729; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wcKuzrxoHdnias99bLqWOpEMPtTA0R5+Juke4jB9svk=;
        b=ca53vl93Dc9Z+63ZR2nzNEnR3n1omrrAePAXtPv2jrVNa6RO+N7bs+RstWstMpzP5x
         5eUmUBk4+c2W70MjDbrZ1hgDB3/u9rRYIdWK5hgrF2BXdWCYQ0G5QuZKjkS252yeovK0
         9TxqQoFr1EVi3nshbXxAFo1ERuOXe10ePxzNyjCJvQdH+CAZH0Y/KkYuEfffAdd7Wfl1
         iVMuIEG3TKuHGpOQ1NtZnoDi9tlRiAXbrP76XkknojWoh/IDDvIcv0XHcUTCahKZUAK4
         YNVCXy524YNVomRxNTdxm3dabFGqeP22+s3maD7BognNVoUk9MBjBmlnL32bMIAb4hxd
         iP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711006929; x=1711611729;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wcKuzrxoHdnias99bLqWOpEMPtTA0R5+Juke4jB9svk=;
        b=tToElFTyXK/jrLq9zz41xp0UK0rzWXtYw+V6HG3kyvNSIuiPDBw1mkvnKpWGEoBrXu
         FIrJCGpFC34EHNQSBAR/MiIP9rDM+bFxf309PmAJ7eBGvEGYsqHXvc1wVKbABqyqlfEC
         EBqG3z4OpXp0Xc8kVG4/uSpjXjjlzYPaRvU+szOYHohgOV0T8Hxm12oMurpOK7y7NwBm
         B+5DGX24qmPD46gdcobS4h7mmJJfY7begUqRFQ2K9sKQ069Fyka+3JMVhj9pm9Efk7jc
         loDNSza64bzYYp7Fk7ZuVEdbsdxNhGN5QVW3fJtCJLJ6XGJx1sGueLxxIvyRkcvVUSB/
         G2mQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqfPvnrwXg0kYUvtl3q3t+DJz11QYFbkx5wqHMTJ0ji4Je4BNUQLicpwtDVA8kY5DPorqCZ8fIBAAThfDPKAjyt3lxnN7/dEeNWUFIyFM=
X-Gm-Message-State: AOJu0YxeUtj6wjMM/vbsw78p0GmjMu6a9h9g8kk6Ap5ZhosPa9Wxi1Q0
	4c5g0McMG4amuU0YX2VD0PF8+cuc/xAvI1IDV+im/TFk56onafR1pGxrGxOwcw==
X-Google-Smtp-Source: AGHT+IHlR0WzSjB8MsDETDN+9F6oXFfwD8Lag54vS6TclocPxK79uO2FGYTyvxc8jZlaY/rDuU4yfg==
X-Received: by 2002:a17:907:6d1a:b0:a46:9ae2:1927 with SMTP id sa26-20020a1709076d1a00b00a469ae21927mr3243996ejc.67.1711006928969;
        Thu, 21 Mar 2024 00:42:08 -0700 (PDT)
Message-ID: <98996023-f47c-45fd-b804-77440f333fc6@suse.com>
Date: Thu, 21 Mar 2024 08:42:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] xen/device-tree: Move Arm's setup.c bootinfo
 functions to common
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
 <039524d4157dddb2faf6887739a727f6e993b53f.1710443965.git.sanastasio@raptorengineering.com>
 <152e76ee-6e75-4881-aa88-313f0ae058be@suse.com>
 <8adb6bf8-9804-4313-b1e1-5cf96d643d5e@raptorengineering.com>
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
In-Reply-To: <8adb6bf8-9804-4313-b1e1-5cf96d643d5e@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.03.2024 19:07, Shawn Anastasio wrote:
> On 3/15/24 4:16 AM, Jan Beulich wrote:
>> On 14.03.2024 23:15, Shawn Anastasio wrote:
>>> Arm's setup.c contains a collection of functions for parsing memory map
>>> and other boot information from a device tree. Since these routines are
>>> generally useful on any architecture that supports device tree booting,
>>> move them into xen/common/device-tree.
>>>
>>> Suggested-by: Julien Grall <julien@xen.org>
>>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>> ---
>>>  MAINTAINERS                       |   1 +
>>>  xen/arch/arm/setup.c              | 419 --------------------------
>>>  xen/common/Makefile               |   1 +
>>>  xen/common/device-tree/Makefile   |   1 +
>>>  xen/common/device-tree/bootinfo.c | 469 ++++++++++++++++++++++++++++++
>>>  5 files changed, 472 insertions(+), 419 deletions(-)
>>>  create mode 100644 xen/common/device-tree/Makefile
>>>  create mode 100644 xen/common/device-tree/bootinfo.c
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 56a6932037..e85fbe6737 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -301,6 +301,7 @@ M:	Stefano Stabellini <sstabellini@kernel.org>
>>>  M:	Julien Grall <julien@xen.org>
>>>  S:	Supported
>>>  F:	xen/common/libfdt/
>>> +F:	xen/common/device-tree/setup.c
>>
>> Perhaps more generally
>>
>> F:	xen/common/device-tree/
>>
>> ?
>>
> 
> This was done to allow bootfdt.c (next patch) to remain under ARM's
> maintainership, which I believe was your suggestion in v2.
> 
> Perhaps it would make sense to leave both setup.c and bootfdt.c under
> ARM's maintainership, or would it be acceptable to move both to device
> tree?

What exactly is wanted needs to be sorted by the maintainers (Arm / DT).
To me, having everything DT under DT maintainership (which is a subset
of Arm maintainers anyway) would make most sense.

Jan

