Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1841595875E
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 14:52:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780372.1189992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgOKX-0001DF-Rt; Tue, 20 Aug 2024 12:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780372.1189992; Tue, 20 Aug 2024 12:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgOKX-0001Ah-PF; Tue, 20 Aug 2024 12:51:21 +0000
Received: by outflank-mailman (input) for mailman id 780372;
 Tue, 20 Aug 2024 12:51:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yfvp=PT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sgOKW-0001Ab-64
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 12:51:20 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e42a393d-5ef2-11ef-8776-851b0ebba9a2;
 Tue, 20 Aug 2024 14:51:17 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a8647056026so97608666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 05:51:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383935636sm757116366b.108.2024.08.20.05.51.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 05:51:16 -0700 (PDT)
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
X-Inumbo-ID: e42a393d-5ef2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724158277; x=1724763077; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=keNEB41MN/8ddQ5FnQk9UfRStxcvk1+CWRTkPzXpGPw=;
        b=f9qvXS1kjpkvyducRm+AQ9JUTCxDUTxyrV4xHAQMtoFc1yEZcq0l7kIahTWws0LGt4
         wc6LO0T9cHfp9SWdMHV9ID9ROHk9Dhp5YldhNHRqixyPKY8aAgEAL2fY/0r8Sjy4FDQc
         goU3Az4gP61PBcfr/JqMYEEeW9MNNE68NjjgbnO10x84wH45eIUbhgign7NO4HqP+KHs
         SuWPwB4/a2f3GSC7dXewiepSsTJywOb8mYQhiSce/YTFfT8AfRv0Og0vhcvM/9NTwDdv
         Wut+eBiRh3P81m27xfgD5jul23MFQ+WrAEzzF/KhoViS7Ph0a5HIR55Tk1QH5eMSpcH3
         LyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724158277; x=1724763077;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keNEB41MN/8ddQ5FnQk9UfRStxcvk1+CWRTkPzXpGPw=;
        b=qQB6qHGsI2RH/Mh+cCmuAjkXHnL+EeEMAQdLTzBJKFFV/5aTQKnehEGyka4lDu3d1N
         /gj7GRrOFQVUoJzyY1RymKLMrh7J2AZQcmtj3ISjNMC16DKA4TpK07u8OtOQyvHIqa7x
         FzuKHEmMaq9x1tmeG254oionSpqPIuq/hAef0jJf+0AClgqRoozlxB8lU5IH3W9KmwXN
         G8qN/tgcFUZpszsnO09jAiJ3phXbs1Lr8wKkFnCl4m+oQmhgTEhjsPHq6zgPXXqycTLU
         R+uH1BCyx+wF2B9w7d0zxH0fDMop4UTqMWlP0JiGorqvn/cT0CxlKADoRUxAxeGsdnuK
         13Mg==
X-Gm-Message-State: AOJu0Yzg7eOuY8FG6uTufmNTpsspLwWYzTmNvT9g5h3RyO52CCk949Iv
	8H77izFQeodsQx/llHgIDCa6Y1U56dhqsTvDZnVY1EuvQECH7pOBR72NLylZkA==
X-Google-Smtp-Source: AGHT+IF18w9ET4OUAyuLQSPcqMx1ue2q4yFv1RTI49cDnqzaCv0xv2XotbOK1MHgTbWHmZOQZnL7ng==
X-Received: by 2002:a17:907:e66a:b0:a7d:d1a6:d943 with SMTP id a640c23a62f3a-a8392956005mr1030984266b.40.1724158277252;
        Tue, 20 Aug 2024 05:51:17 -0700 (PDT)
Message-ID: <5f4d628b-6268-4878-8d87-0174dad818c7@suse.com>
Date: Tue, 20 Aug 2024 14:51:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] xen: make VMAP only support in MMU system
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, Penny Zheng <penny.zheng@arm.com>,
 Wei Chen <wei.chen@arm.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 Julien Grall <julien@xen.org>
References: <20240813171356.46760-1-ayan.kumar.halder@amd.com>
 <20240813171356.46760-3-ayan.kumar.halder@amd.com>
 <6d333d94-80ad-485c-b024-a45a388b96a4@suse.com>
 <ef789757-8c03-4f97-9bfb-8ec2fd2f4ca2@amd.com>
 <dad27ab7-3cbd-4a8e-8200-adea52b26e55@suse.com>
 <597b358e-3b45-4fba-922d-31208b55d15a@amd.com>
 <9fd1801c-1460-44e5-b066-f6da1167543b@xen.org>
 <1a328f00-3b0d-4e9c-856c-97c3a80dfdef@amd.com>
 <febbaf82-5d9a-4bcd-8be9-93ac86b2c1bb@xen.org>
 <55a91ace-a76f-40b9-bdb2-49f816006612@xen.org>
 <e7882491-e916-43c6-ac61-12da83e9c086@amd.com>
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
In-Reply-To: <e7882491-e916-43c6-ac61-12da83e9c086@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.08.2024 13:48, Ayan Kumar Halder wrote:
> So I will do :-
> 
> 1. HARDEN_BRANCH_PREDICTOR will depend on MMU.
> 
> 2. ARCH_VMAP will be selected by PPC and RISCV. The reason is below.
> 
> 3. xen/common/vmap.c will be conditionally compiled on ARCH_VMAP and the 
> "#ifdef VMAP_VIRT_START .. endif" will be from removed within the file. 
> As VMAP_VIRT_START is defined by RISCV and PPC, thus #2 is needed.
> 
> Julien, Jan :- Please let me know if you are ok with #3. This was in 
> response to Michal's comment. While his suggestion makes sense, I am not 
> sure if extending the changes to other architectures is the correct 
> approach. Or do you prefer keeping xen/common/vmap.c unchanged.

No, the VMAP_VIRT_START thing was, from all I recall, merely to cover
for the lack of a way to exclude building of the file from Makefile.
After all this pre-dates the introduction of kconfig in Xen.

And yes, suitably covering PPC and RISC-V is The Right Thing To Do (tm);
their maintainers can shout if they disagree.

Jan

