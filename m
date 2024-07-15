Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6CF9310EE
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 11:12:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758774.1168246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTHkZ-0000qU-Pd; Mon, 15 Jul 2024 09:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758774.1168246; Mon, 15 Jul 2024 09:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTHkZ-0000ok-Ms; Mon, 15 Jul 2024 09:12:03 +0000
Received: by outflank-mailman (input) for mailman id 758774;
 Mon, 15 Jul 2024 09:12:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FSyp=OP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sTHkX-0000ob-Q2
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 09:12:01 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4afafa5b-428a-11ef-bbfb-fd08da9f4363;
 Mon, 15 Jul 2024 11:12:00 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-58b447c511eso5010701a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 02:12:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc516dasm35971155ad.288.2024.07.15.02.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 02:11:57 -0700 (PDT)
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
X-Inumbo-ID: 4afafa5b-428a-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721034720; x=1721639520; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rSTBsxiYaa0O15fZnIp5eYWvvrk2jnLgXowQaDiNrWk=;
        b=GWOAuQ9+qpRC8aEkWGnpXuqmF3d6Zkzewj9C8CdIXF6MpsAJLgiJT+HySjDS+NCVaR
         xbSe3WzptPKSSX4cP8KcWe3f18SBdplWqI3V35ltGVSusRI4+2PXdTWEEongAjkJpVNa
         2EU9ej9YsU8AV6wBfWFPW5S0PLX1Cjim8BdF9Wny4LYTjPkJvlNDxrH+FAZV6llkfFHm
         Pw7Mr2kFKhEskXYNMgYqNVIIjEUImUuUWmnWVQ81d0UB7QV4T4oZN2seCbdnRo71Lr06
         n9dlHHg64HxP6npaokHWMeHS1M+EmiEpF09kdm2MGrUTTToN5u7q6l7cIExzRtCWP/zk
         bGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721034720; x=1721639520;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSTBsxiYaa0O15fZnIp5eYWvvrk2jnLgXowQaDiNrWk=;
        b=BVKvVM+MQyLqHY91gYTcHifcd0qZA57N8EjbbUPN5WwCrJ+KHSxCXwSZfzJ3FnS8fw
         HtaZcz9nINcyx3GuOG30urVpjT63+HjiUy8OHTqmaCKZdBAJ7vo49ywM4GGwbhSeAGX8
         uMJBu6Whbd5gQKWvLRpVOYnXq2wbMPS38JLgVGmT3yPOeO2iGP1SFPPVHN+ojrRXeGei
         dAtf/0tZnnXdVQxDkgJRcGZ8n+Zk2wUuX3ThYIyUuCssnuauDPE95edyv3uvpf+cBLDl
         q5iXhBhZvCpvL68Ur9dKrLnAOjXCCNbQFSWhjL0P/O6o2DChnCUeaxz0TXqQvHwYLS8/
         70bg==
X-Forwarded-Encrypted: i=1; AJvYcCU5t36JfSCSb323XQa19vWH8+xCr0vgZpdOi/+W6dlHMN/8cvS64AMa+mn83MnaElnKvhHHUmeJb0gmWTyYJ+AJ5iXKT3bZZt8JmHBOLP8=
X-Gm-Message-State: AOJu0YxQ5TlZfifmYuQP1LBxgG9Xe3TfSFPPxZqwC1vYMJnJrD9JHW4J
	QWTGVBpDevku0RlnePaKA2YaTe2800Slyf9KqPsXpODF8361UF7SBBdyJ+VPoQ==
X-Google-Smtp-Source: AGHT+IGVgAtodJ4HEU8P4/yvjh2g8kIwvjd6KYIxqnjJJVATRpQnfOIPqgwAn1eea9XcMB1PjSCcgA==
X-Received: by 2002:a17:907:7da8:b0:a72:4320:19f3 with SMTP id a640c23a62f3a-a780b70088cmr1587562166b.39.1721034717834;
        Mon, 15 Jul 2024 02:11:57 -0700 (PDT)
Message-ID: <115b1eaf-960e-4d8d-9168-cb84e43961ae@suse.com>
Date: Mon, 15 Jul 2024 11:11:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] Arm64: amend "xen/arm64: head: Add missing code
 symbol annotations"
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f7228594-fa64-4fd8-b55b-506d004b73cb@suse.com>
 <99ba7e4e-7a0e-4a1b-85c9-5c21f767beda@xen.org>
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
In-Reply-To: <99ba7e4e-7a0e-4a1b-85c9-5c21f767beda@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.07.2024 23:29, Julien Grall wrote:
> Hi Jan,
> 
> On 10/06/2024 14:37, Jan Beulich wrote:
>> While the change[1] didn't go in yet, there is the intention for the ELF
>> metadata annotations from xen/linkage.h to also effect honoring of
>> CONFIG_CC_SPLIT_SECTIONS. In code that's placement / ordering sensitive,
>> these annotations therefore need using with some care.
> 
> Looking at the code, I think the ordering only really matter for 
> 'start'. The rest can be ordered in any way within the assembly file. So...
> 
>>
>> [1] https://lists.xen.org/archives/html/xen-devel/2024-02/msg00470.html
>>
>> Fixes: fba250ae604e ("xen/arm64: head: Add missing code symbol annotations")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> An alternative would be to use LABEL{,_LOCAL}() instead of FUNC{,_LOCAL}().
>> That would avoid the need for any override, but would also lose the type
>> information. 
> 
> ... I would suggest to only convert FUNC(start) to LABEL(start).
> 
>> Question is whether the annotated ranges really are
>> "functions" in whichever wide or narrow sense.
> 
> Everything but 'start' are functions.

Well, maybe, but that's not the only criteria here. Expressions like

        .long   _end - real_start               /* SizeOfCode */

need to be possible for the assembler to resolve. Which requires both
symbols to live in the same section, or the subtrahend to live in the
current section. IOW I then also need to convert real_start to use
LABEL_LOCAL(). Is that going to be okay?

Jan

