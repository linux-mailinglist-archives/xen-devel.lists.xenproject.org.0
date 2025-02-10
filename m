Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BF6A2E7A5
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 10:28:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884497.1294201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thQ55-0007NB-3C; Mon, 10 Feb 2025 09:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884497.1294201; Mon, 10 Feb 2025 09:27:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thQ55-0007LB-0Q; Mon, 10 Feb 2025 09:27:55 +0000
Received: by outflank-mailman (input) for mailman id 884497;
 Mon, 10 Feb 2025 09:27:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thQ53-0007L5-Ir
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 09:27:53 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4aead99f-e791-11ef-b3ef-695165c68f79;
 Mon, 10 Feb 2025 10:27:48 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5de6e26db8eso2177565a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 01:27:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5de3ca503a2sm6854482a12.72.2025.02.10.01.27.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 01:27:47 -0800 (PST)
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
X-Inumbo-ID: 4aead99f-e791-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739179668; x=1739784468; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Zd8Pt0J200QONaybDrIQPZA/aS2yhRK3Q1g+JZo58mc=;
        b=F+kRlFMu9k8+aZ0pycv2OG+GaHEIuXzJLPNhQXainl/dlS49ycGnn2cVpHV56Zyyuc
         8XsJ62k2yewdt5Q+Anlc1UguBLQjsQBLfZ+A9E8Jqm5zVkzjTEEnsJrHGTm4gXgx756B
         tq8/Wa4oJyo6p+Z9zZbYb1N4CWlxOssH4votw2wNZrbAxR1d61PHIS6nh2cw8aNwtFVk
         PSL8lhBa+8fIMMlLrUKC793bcv6MGH1mvLXict94oCS9LEur42AXfFfrcv7pUSps1t8T
         eFfe+WvRllw7VdYVMwYdwONywWPiLpFIwpkQ4avuASN1Q1noa65jH9FEuiEKt8+zw1Ta
         KibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739179668; x=1739784468;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zd8Pt0J200QONaybDrIQPZA/aS2yhRK3Q1g+JZo58mc=;
        b=Rr6RpZfLpYx1MPY5HLSepuIR7j5SzKYvQ1b4aUIC1ScuBIHX2CukNPjdJPSa9D8ziV
         63JdcHbjpBzXCzFnat63xp/wI+mvemvbyrxI/xROf8uUjPHzs160QwTNGG4PYmtTNRhC
         Kigo/d073QzOPFFMbFQjLQHfHARiHhcP85++2GFkkGPuSqb2V6NL/TI83SR0HE2D3brm
         89UrWt1dPi6Z1z1imKQZqgLajqMOxjE6GhMcvv9xDyk0O4L2kxx/hfoIriVkxs3iDTyY
         VU3TkpMDftv4JFABV/+eCrx+wkkOo7AtaTJ+juTaEYnBPjBrJJnXlRKKq0ZpYgL0ZAoU
         VXJA==
X-Gm-Message-State: AOJu0YwfPUjqhZWXBE1qoTvxlu0AMZf3bvbNvL56YjvmPIrnE1qjMCK8
	f6wXUTyIAG0lkNSrJQsx60+9QFA18jxei62reGxYigqcv+Al4lx7rUGd6brmwQ==
X-Gm-Gg: ASbGnct0kJkxag6WtfU496Rg/2uC+w9DHsl6/rGV55A8he4OXBt8Z5se3knpkyNGjHu
	0kTk0tSVzMlOCbtG9/Z/12Nx9uaht9ettL7ytcaF94OmrtdGeDUkhgzZ867UUrDjEn5vjc9L3CZ
	lfJ2wKsgoSZf7h1bWvTvAuO8qsoGDH1UwrPjA46T0UCC8uB/cWbmJHRb1jOHAIkEBHgBBnxjbxn
	It3rJ/LVqZ3vbSaxTG6UeTAT/eYpS91ziageBkoup/5eE7YDZeZLpVLZnRNw/WZk84j1Lmp1Hz5
	CZ8c2YgnPSRV7LeDd9gx5sCUmK3fI8uR/GM8nxW0dezQnhwdIRYTBNrMUEcjJ5j+9Utu81fB2Sp
	j
X-Google-Smtp-Source: AGHT+IE5H1idPqcMZKCT7TxzU4+E1kLWdqFzvTvEquSf78aLWskGgZxnSaiitI9bb20HNQ1OP1vtqQ==
X-Received: by 2002:a05:6402:4615:b0:5d0:cfdd:2ac1 with SMTP id 4fb4d7f45d1cf-5de44fea418mr15119898a12.6.1739179668129;
        Mon, 10 Feb 2025 01:27:48 -0800 (PST)
Message-ID: <a8dcd8a8-8b73-49f1-a030-d9614dc51896@suse.com>
Date: Mon, 10 Feb 2025 10:27:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/include: introduce resource.h
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, dmukhin@ford.com, dmkhn@proton.me
References: <20250207231814.3863449-1-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2502071854231.619090@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2502071854231.619090@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.02.2025 03:54, Stefano Stabellini wrote:
> On Fri, 7 Feb 2025, dmkhn@proton.me wrote:
>> Move resource definitions to a new architecture-agnostic shared header file.
>>
>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Hmm, don't you think ...

>> @@ -70,22 +71,8 @@
>>  #define of_property_read_u32(np, pname, out) (!dt_property_read_u32(np, pname, out))
>>  #define of_property_read_bool dt_property_read_bool
>>  #define of_parse_phandle_with_args dt_parse_phandle_with_args
>> -
>> -/* Xen: Helpers to get device MMIO and IRQs */
>> -struct resource
>> -{
>> -	paddr_t addr;
>> -	paddr_t size;
>> -	unsigned int type;
>> -};
>> -
>> -#define resource_size(res) (res)->size;
>> -
>>  #define platform_device dt_device_node

... one of the blank lines being removed here would better stay?

Jan

