Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A964A306D5
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 10:22:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885196.1294983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thmTE-0005ao-VJ; Tue, 11 Feb 2025 09:22:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885196.1294983; Tue, 11 Feb 2025 09:22:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thmTE-0005Yr-S7; Tue, 11 Feb 2025 09:22:20 +0000
Received: by outflank-mailman (input) for mailman id 885196;
 Tue, 11 Feb 2025 09:22:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thmTD-0004Wg-8N
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 09:22:19 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afea29ba-e859-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 10:22:17 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aaf3c3c104fso930934866b.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 01:22:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7dc2943c2sm112394466b.168.2025.02.11.01.22.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 01:22:16 -0800 (PST)
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
X-Inumbo-ID: afea29ba-e859-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739265737; x=1739870537; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gD8HEq5tm6mag5YOyqyHzIA4+bxaK5MK3Qq1OXPOkrs=;
        b=NdSfD1Wi8OSieph3Kh99BMtAtL5JONRaYRZBKp0/9YOEqul6Mj/LoMdn4/THAzVKOS
         jCy3dor0G+v9F9hNaSz7mL7m6cCqNrFu+Ww9JvvAGlyeZ8OxHNfyC5Z3FvP+bdMJVJt9
         FhootX0XejvwMOg5M8IxZXWLIuAJv4D45FJhT0ihxHHRDDGMs+t8NFenuaWb98n9wV7R
         PuRg21jEr8DyFoAj///sA6X7VLR/5muoWSe0CFk7gCxhXblsMM2EfKKE2PMJ8omVb87q
         igmuZ2l7icOj2DeSNcyvmHeLQLM3rLX+iposxhwxT4Dad2bgl2czUo0YKBwRXZ0R5g8B
         37YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739265737; x=1739870537;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gD8HEq5tm6mag5YOyqyHzIA4+bxaK5MK3Qq1OXPOkrs=;
        b=KJ+Fuhn5fG5XfX1Ft3j7C0Q4cwWTfup92ZSjG8RMmsoa4KJMtn12npktsfF7SBk2EE
         uUtTDlhJNbjivnXLejqn/BT6SoZMX4c3zcJTx5EFgiOtOzHLTv7l8uxdzFpnjBMv0o5s
         6NZRwO5CYRHjZdyaVz1YzgbHLxaDZwUgsEVVwzy4+tdfIYeIOlDApPfSYfT2v0mpb4/q
         Twtj7wzPpRu8yrQ1b4RO+2dky1QYpIgiUQeEdg8MaIrfqXcjx5Wq99A03z/Apm4hOc48
         24Fjzv56MiY8wX1AaSELlnnkUvA8euHkNAePbcOLAMvkDF2Tquz/YMMOVWOApXyWI8h6
         o4hw==
X-Forwarded-Encrypted: i=1; AJvYcCXwfIvHF//TjvBRquskuXrBDuWk9fErmBDYK/GEhXx6qSm/Kte3XBsGS6YZe688qqKsxZC3pTxvNGM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyR9pF86B14lnYY+1LplqmSiu+w0a/UtOUDhPOR/hSCQB551bjq
	3DyYaeCaN8JGBF4vwkia0yw+HY3t1NpOoUsAS+p9cw3USaQfqQxi3PkaOFv8aA==
X-Gm-Gg: ASbGnctTPscdKw8dR0PWFbGYeyQhQnbt5mw7Kz+wq5xLWM2phOBCfb5CL2iA/nB3o6V
	hCeDapwxOoN77Ud3bzLFfyphxhOUQBcyORcEBEwJMqW0L6C8M044Yvl9DF0oN7/WYCNI0Mm31Z+
	wHFnoy6GeuMLRmqCyzCalOfF3YohWSFaLS4P5BePj/em+uE8lixY9lx1Vz6gaCo8EdxErGNF6Lo
	ssjQDsXTU9QqsnAWA35QY3aBUND/agZiEuXU4NraYGgEsN7+Q3cUWJnSOOshNT5Lo8xwSBJCook
	GWyiEeZFKYnJR0wA5kVnutYJTmyJ2spAc4qDiMgoX1sGa/uqLAj4D3fsqt7LKzwXmq3uaDaW3VH
	M
X-Google-Smtp-Source: AGHT+IEQXAw4rj6cSMsFIwqtfyRCKMizbNQuVmW4v33Xe9Nfugk7f2FmGXBJWdEsy4K6qCB7WRAvGw==
X-Received: by 2002:a17:907:1c22:b0:ab7:647:d52d with SMTP id a640c23a62f3a-ab789c6e8c9mr1715597866b.51.1739265736822;
        Tue, 11 Feb 2025 01:22:16 -0800 (PST)
Message-ID: <ba937c72-b894-4e27-a730-d1ccf4e00174@suse.com>
Date: Tue, 11 Feb 2025 10:22:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/include: introduce resource.h
To: Denis Mukhin <dmkhn@proton.me>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, dmukhin@ford.com
References: <20250207231814.3863449-1-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2502071854231.619090@ubuntu-linux-20-04-desktop>
 <a8dcd8a8-8b73-49f1-a030-d9614dc51896@suse.com>
 <Ko-G31widhmIv5ESo26CR7Pt0D5th5XG_jfm1eORblFZav8mMWP5G3UWNfqrrRiI0ttw7-nUhU7glYoAX1jHrmcQtZRxSCRMt5AzCpQjIbc=@proton.me>
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
In-Reply-To: <Ko-G31widhmIv5ESo26CR7Pt0D5th5XG_jfm1eORblFZav8mMWP5G3UWNfqrrRiI0ttw7-nUhU7glYoAX1jHrmcQtZRxSCRMt5AzCpQjIbc=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.02.2025 08:43, Denis Mukhin wrote:
>> On 08.02.2025 03:54, Stefano Stabellini wrote:
>>> On Fri, 7 Feb 2025, dmkhn@proton.me wrote:
>>>
>>>> Move resource definitions to a new architecture-agnostic shared header file.
>>>>
>>>> Signed-off-by: Denis Mukhin dmukhin@ford.com
>>>
>>> Reviewed-by: Stefano Stabellini sstabellini@kernel.org
>>
>>
>> Hmm, don't you think ...
>>
>>>> @@ -70,22 +71,8 @@
>>>> #define of_property_read_u32(np, pname, out) (!dt_property_read_u32(np, pname, out))
>>>> #define of_property_read_bool dt_property_read_bool
>>>> #define of_parse_phandle_with_args dt_parse_phandle_with_args
>>>> -
>>>> -/* Xen: Helpers to get device MMIO and IRQs */
>>>> -struct resource
>>>> -{
>>>> - paddr_t addr;
>>>> - paddr_t size;
>>>> - unsigned int type;
>>>> -};
>>>> -
>>>> -#define resource_size(res) (res)->size;
>>>> -
>>>> #define platform_device dt_device_node
>>
>>
>> ... one of the blank lines being removed here would better stay?
> 
> I think the block of assorted macros (the first macro is not of not of_xxx() type)
> does not need an extra newline.
> 
> The resulting block of macros looks like the following:
> [[
> 
> /* Alias to Xen device tree helpers */
> #define device_node dt_device_node
> #define of_phandle_args dt_phandle_args
> #define of_device_id dt_device_match
> #define of_match_node dt_match_node
> #define of_property_read_u32(np, pname, out) (!dt_property_read_u32(np, pname, out))
> #define of_property_read_bool dt_property_read_bool
> #define of_parse_phandle_with_args dt_parse_phandle_with_args
> #define platform_device dt_device_node
> 
> ]]

And I think the of_* ones would better be separated by blank lines
from the others. Arguably platform_device might then want to move up,
immediately next to device_node.

Jan

