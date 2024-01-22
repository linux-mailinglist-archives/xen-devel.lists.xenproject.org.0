Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F2B835F07
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 11:05:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669722.1042078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRrAd-0002Qy-NG; Mon, 22 Jan 2024 10:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669722.1042078; Mon, 22 Jan 2024 10:04:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRrAd-0002O7-JJ; Mon, 22 Jan 2024 10:04:47 +0000
Received: by outflank-mailman (input) for mailman id 669722;
 Mon, 22 Jan 2024 10:04:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VPlZ=JA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rRrAc-0002O1-6y
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 10:04:46 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa27e285-b90d-11ee-9b0f-b553b5be7939;
 Mon, 22 Jan 2024 11:04:43 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2cd8bd6ce1bso28820331fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 02:04:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q6-20020a056638238600b0046ef34ae391sm40671jat.99.2024.01.22.02.04.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 02:04:42 -0800 (PST)
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
X-Inumbo-ID: aa27e285-b90d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705917883; x=1706522683; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x+rf32GmCPQOsHmXK9Mo+KAY16DOZ0NexQtH0ATNr04=;
        b=fzKCfIL4cunAcACBFfjlVe6UMEodH/z69vJFxIc10W6faPwTMRtQSLxNfZZeW8LtwE
         t/A6th/YeRA6fLV7cQwIXjuYi9O+InsXwUrD9o6Cp75zXYbWjlk2RvT5IlGoRk8ae4Yu
         v+u/UQeJGxS5wFefuy7r1bZSGx9iT5SEAZORknyJoO1yX8kpa6VPAWvePBPR4qEbd1vP
         WZClyULtK/GWR1Z9ZCjFN3D8DO2+GzhzQaEFlwexyygw0FwjmNtLlBSjGJ+TYZ8ti7Kz
         58ShdQk5g3zOXsjTIxQ68yHaeXApTPQwKlqhqit48d1o4J7ZEkkoZ1ZayKxg0uQNyC+m
         yEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705917883; x=1706522683;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x+rf32GmCPQOsHmXK9Mo+KAY16DOZ0NexQtH0ATNr04=;
        b=uG3Zmhhw6kUdN3AKEOf1hE6w/tSQuycxBVZ/eq/WsUvnotgjjmAIC6yUSbt40NZmAQ
         jOLk3A4aRE5k9sdfgCLFoqh0NqR2r8MYLsVfdSC7seCelTRxTZZu/jzf1MdYE/Ri/tCT
         YF9Dhz4Js2nF3wk7SrkWTDcVyA7YdlByQBle3NwD39ukY0r1onsLhzHX+z8LGByKXVgI
         tNj5Sqo7FvgQG9CkTarfIWTG1rqR6vrHN2BKuq70elNyP8GBJvJf6y7KkgOKyr58H0bf
         N/fK3SVDwPxYAQnY8KED0cUOuWF4x+JnunLJQlg4TxcFWx0cFrZcAGd+Nl3vbpvwYpAJ
         HjlA==
X-Gm-Message-State: AOJu0YyMx6qpjKsvLgLf0mlUAMPMQJHhDh2E35KaB3aVMDbbJCHgo63z
	TdzQZZmfu3WGrWc4Q/3F6CXsn3VFm23taD4LAtM4ApChwLWX5zhLkUAkqXTIkQ==
X-Google-Smtp-Source: AGHT+IEtoU+NsZeYjTWN2b6KOKmBMMl14Zp9zPWvwhG+e99i4tpHvYbalJCdL35uYwUDTMiXuRJW7g==
X-Received: by 2002:a05:651c:b0e:b0:2cd:f588:8b8 with SMTP id b14-20020a05651c0b0e00b002cdf58808b8mr1116986ljr.107.1705917883147;
        Mon, 22 Jan 2024 02:04:43 -0800 (PST)
Message-ID: <0437c4eb-8438-44a8-a749-aef6c4c93ef0@suse.com>
Date: Mon, 22 Jan 2024 11:04:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coverage: filter out lib{fdt,elf}-temp.o
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org,
 Michal Orzel <michal.orzel@amd.com>
References: <20240118120641.24824-1-michal.orzel@amd.com>
 <8057ae41-43b5-4469-b691-4e7f16b8dd4d@suse.com>
 <e399890c-0299-4ec5-884e-0637ae6cb5b0@perard>
 <9d552e6d-eb5d-4ccf-a35d-a359df7c4478@amd.com>
 <0a1c749b-8169-43b5-9921-961096f8570d@perard>
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
In-Reply-To: <0a1c749b-8169-43b5-9921-961096f8570d@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.01.2024 16:25, Anthony PERARD wrote:
> On Fri, Jan 19, 2024 at 09:43:30AM +0100, Michal Orzel wrote:
>> Is my understanding correct that by switching from extra-y to targets we are preventing these objects to
>> appear in non-init-objects (and thus having COV_FLAGS appended) while retaining the proper if_changed behavior?
>>
>> According to docs/misc/xen-makefiles/makefiles.rst:
>> Any target that utilises if_changed must be listed in $(targets),
>> otherwise the command line check will fail, and the target will
>> always be built.
> 
> Indeed, and $(extra-y) is added to $(targets) via
> $(targets-for-builtin).
> 
> While switching from $(extra-y) to $(targets) prevents the objects from
> been added to $(non-init-objets), it doesn't matter because "libelf.o"
> is in that variable, so $(COV_FLAGS) is added to $(_c_flags) and its
> value is used in all the prerequisites of "libelf.o" which includes
> "libelf-temp.o" and for example "libelf-dominfo.o". So the only thing
> preventing $(COV_FLAGS) from been added when building "libelf-tools.o"
> for example is that we set `COV_FLAGS:=` for "libelf.o".

Yet doesn't that (again) mean things should actually work as-is, yet
Michal is observing this not being the case?

Jan

