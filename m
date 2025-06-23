Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5CFAE44D5
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 15:46:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022366.1398157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThUp-0004Bf-VC; Mon, 23 Jun 2025 13:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022366.1398157; Mon, 23 Jun 2025 13:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThUp-000496-Rl; Mon, 23 Jun 2025 13:46:03 +0000
Received: by outflank-mailman (input) for mailman id 1022366;
 Mon, 23 Jun 2025 13:46:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uThUp-00048y-0V
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 13:46:03 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 661cb234-5038-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 15:46:01 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a6e2d85705so508813f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 06:46:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3159df71ea8sm8975409a91.7.2025.06.23.06.45.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 06:45:59 -0700 (PDT)
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
X-Inumbo-ID: 661cb234-5038-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750686360; x=1751291160; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gjB7LXNA11ANRGLY6mxcZIWZHspd3cLci/CHRCIPqC0=;
        b=eIpDJOFDCS0wgwpznZpq95KKc/HtsKOj4rJkmkkDOod/ugUGzhazVboT2uzpspkEYU
         t27EVvm7UV8azFPdMmnX6+nBjmo3nq0ZVALl9xk5VSXSMeakRFrg3AzT4Vw61HhQGoxt
         /lMb+K18N1o3amJNJB4xrGeikfXR7FDLGYfptAuXvAbwQsyJwcU5UDbCu+xGygbRWzUI
         +lzdgWDDIykBU4cO/C1JgkFfuIQtQPvisI8ZJgpwpXxl1hupPM8VDSXWPRQ+eD1QT8FE
         hgTVaJ2Sq4+c4x0UnHIXk9QCdZ11n+gKsOE7lYgQjR0RpLjf6+4Z6Gxb/q3keCxRUCgA
         LW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750686360; x=1751291160;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjB7LXNA11ANRGLY6mxcZIWZHspd3cLci/CHRCIPqC0=;
        b=iNHC+zz09Ziid+Adfv7aUUExysfAAK/jXjLSBFWmx9AuPzpV0diH/Suej9FmyfYILG
         F03oNcGoiUIanF+Hgb9Z5j+OzhVpomI0lh1uzDKnffsop5VLuiRKwdP9MqNAa0CbpuFh
         gMeHRNOmNDMG21DHf5wO534v0aBExytoK7/8cvKAnyAIvnlIQTBTRMrDCIt306fa/muN
         HYy4XuyOp1rKGobcS1luXY9KV2jJrXJj2h7OyWOOPsYIAIfJg1H86GYKd5PayEOo0TmW
         KiOmn3vrFhvBFNJtk2Y9EKibvn+srOhNK4crd3kD8BRYpve4mkkCcPvcEihPtlmR93BT
         mUZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAEjXG+clQhYRUQhzh7BX9Wj9QDeWISMfepNJXp9HGzcfV5thaGvdoRlWcWLCn4cSQxaHM+nm+ILs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKLut+F9qypQ5009oUWl4qyPmzihdaYP66QvIlXNpSlkvs53rc
	8O+XRoQCm2+omFl3b+sAoaV7Ge+1+4g0DhNL2jgahuXRPW7yOM+WUwH3TZus62SJ9Q==
X-Gm-Gg: ASbGncsv0FgBc1op8S7KJDD5shVEdoTh0l5saV32lIbOSgq27pstduBnUf+HiNu4hm+
	vDsSWP3nkQasYAAw/EES8UPIXEFnvCbbygXWyjuiPfLEcfm11esaIGQ6wgSWTHea8ABM0IRs8+W
	6byOD8mV0AOrqSozULV9PXKHkcw65Hz2xvoJUpww2jT71Fz0JTRy0XgkhTxXltLiRelFG3fIp5h
	BVXivwFqsZodRZvtRXTwP1QfylReu7+DIB1hPHtonWtl1eQTAKpsQFkKcRxLkpj4SJyRgjaVa+0
	RfOdTTpzA4xkDONXDOCH6DUl4Dljn0HGz2vqJC6BR0slmIpiZqqadXsi4pwIAfKLvQ+GrYDA9j+
	bS5DlC2YbkmSxVV65x5jcf3uDfkSZr+5JrOYnZpT+O2tu9Pg=
X-Google-Smtp-Source: AGHT+IFx76gsozdaKi6xjmh/Nqqv2oX3gQsULzt9gRpwwJp/FB2dcXYZNh/9y6RJvhlUo6mKFxaBVQ==
X-Received: by 2002:a05:6000:461e:b0:3a5:2949:6c31 with SMTP id ffacd0b85a97d-3a6d12e1a29mr8976507f8f.42.1750686360564;
        Mon, 23 Jun 2025 06:46:00 -0700 (PDT)
Message-ID: <f393b2fe-51cb-4a0e-8afd-801d65713f24@suse.com>
Date: Mon, 23 Jun 2025 15:45:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/12] xen/dt: ifdef out DEV_DT-related bits from
 device_tree.{c,h}
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <20250620182859.23378-1-agarciav@amd.com>
 <20250620182859.23378-12-agarciav@amd.com>
 <faf255a2-a0d1-4c6b-ad94-0395d8af1e58@suse.com>
 <DATXXZ432HNT.36S8Y01SVXYJO@amd.com>
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
In-Reply-To: <DATXXZ432HNT.36S8Y01SVXYJO@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.06.2025 15:18, Alejandro Vallejo wrote:
> On Mon Jun 23, 2025 at 9:44 AM CEST, Jan Beulich wrote:
>> On 20.06.2025 20:28, Alejandro Vallejo wrote:
>>> device-tree.c stops requiring CONFIG_HAS_DEVICE_TREE_DISCOVERY and may
>>> function with DOM0LESS_BOOT.
>>>
>>> Without this, there's a clash with x86's definition of device_t. Because
>>> x86 doesn't discover devices in the DT it can simply skip the code
>>> to do so during the unflattening phase.
>>>
>>> Not a functional change on architectures that currently use these files,
>>> as they already select CONFIG_HAS_DEVICE_TREE_DISCOVERY.
>>>
>>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>>> ---
>>>  xen/common/device-tree/device-tree.c | 2 ++
>>>  xen/include/xen/device_tree.h        | 4 ++++
>>>  2 files changed, 6 insertions(+)
>>>
>>> diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
>>> index 725ff71646..741e2ce585 100644
>>> --- a/xen/common/device-tree/device-tree.c
>>> +++ b/xen/common/device-tree/device-tree.c
>>> @@ -2029,9 +2029,11 @@ static unsigned long unflatten_dt_node(const void *fdt,
>>>              ((char *)pp->value)[sz - 1] = 0;
>>>              dt_dprintk("fixed up name for %s -> %s\n", pathp,
>>>                         (char *)pp->value);
>>> +#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
>>>              /* Generic device initialization */
>>>              np->dev.type = DEV_DT;
>>>              np->dev.of_node = np;
>>> +#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
>>>          }
>>>      }
>>
>> Without something said to that effect in the description, this contradicts
>>
>> obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += device-tree/
>>
>> that the previous patch put in place, and that only the subsequent patch
>> will further change.
>>
>> Jan
> 
> Would replacing the last paragraph of the commit message with...
> 
>   Not a functional change because the whole file is gated by
>   CONFIG_HAS_DEVICE_TREE_DISCOVERY already. A later patch allows the file to be
>   usable without it, for which this ifdefs are a prerequisite.
> 
> ... help?

Yes, afaic.

Jan

