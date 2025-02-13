Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C029A33ADB
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 10:16:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887296.1296822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiVKu-0005vc-6k; Thu, 13 Feb 2025 09:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887296.1296822; Thu, 13 Feb 2025 09:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiVKu-0005tj-1T; Thu, 13 Feb 2025 09:16:44 +0000
Received: by outflank-mailman (input) for mailman id 887296;
 Thu, 13 Feb 2025 09:16:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tiVKs-0005sG-Ty
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 09:16:42 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c43d051-e9eb-11ef-b3ef-695165c68f79;
 Thu, 13 Feb 2025 10:16:41 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5de5a853090so1475703a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 01:16:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba5325b58bsm91116766b.74.2025.02.13.01.16.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 01:16:40 -0800 (PST)
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
X-Inumbo-ID: 3c43d051-e9eb-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739438200; x=1740043000; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zRkrWPOd0IsaAl/i1cBAd/UOOJHGETsQN4vhzcb7v/E=;
        b=ShANXfrShPb/liGqFwAOq92AsSpsgPf0VH/xwXVMYhNZ6ii2wL8S5fVnKhrbCpmsR9
         q7ax7pWbs2shaskXClcv8bVKarw2YJd53dNX0Adl59KDr5P9ZgBXkXUBVz0G52iwiyt8
         Yd3R4bJH3+YeE1nleARVP2qXtfUUXoW5iS7wtzn8Wr00oQ/WRjHFVbXSLIfrXmJPvAOq
         n00NatrpA/1zcZ0fZ2vuyuWgK3CIsNFMO/KTWq7wdPcs6ov5wPuAFGkABlvnlTOk7ppt
         VwNmfpivGLUA8Lb9rGK+44yjkPds0/7GEbHGl2A3psePVlAOcB23s8y8CQI7NLMHmC8/
         eNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739438200; x=1740043000;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRkrWPOd0IsaAl/i1cBAd/UOOJHGETsQN4vhzcb7v/E=;
        b=U2b6hVPEyAMVMrZxqHjWnZkFvngAWrZTNfLkGNcXikRws98Jtz920MS0WRF/pDH8SA
         x9aSXry7s7UduSRgpV2IN8xPZ+idC6kR7kc44j2y/br5aEM5iQp5+9d+U2gpJ7QnDo+y
         SUAU8UiQDOCq4P9YliY31uo32AMfyjTRphDr3k1QqJ8oRxYlMxK474bFKwDdOQ0Z84ig
         rn8b24ZVzoHh7wcz3pa8NX65A61PTRdths3k4a6nO+oiketh40FETq3HGbdyJotzWtLx
         ytI3vpZXrXE7ac0w9QAVXCWpn+vbXx2C2fr60UHqk6xfQqNx43w0VSCB21W4KE0Au/WQ
         1zwA==
X-Forwarded-Encrypted: i=1; AJvYcCUW+15/z8ncUFJroGIU/Pg75wRNSb/8ynNvnnB7ottr/550i2jQcodwQ7EFFLaB0kcizpeadajgTEc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4DpwVKqUpcEet831SOwKGdiVZF2GCOj+BMZFBSbCeuISG8jtr
	V+xUF9mzKfSvQtg8MecNmJqWgvCetBwzKLdAKcmb7trbdXF1pIGKEBM86m6RGQ==
X-Gm-Gg: ASbGncv3xuWmFjMxptCbBZtOByuvXsyVWBIgKmuO+hausaRwUyCLu/ZVHd+dkw7IcYW
	J/oOYbjgrSNsiHCcPh+3OkbWHJF9UZuotSRF3HM8TgYKn0IOtqdhg37w3I28TJiemSzygcodIqq
	U8Qu9nrXJFW6hKcIYMwK1DbdJxYFQshHnKSmz1M/m4CFLmtN50TE8z5JM4syvhfWHVmP060CPHy
	jv43tj5cFsv/FrCZ3kZz24fbcm/7MWUY76D7eDPw+TedhWwsX7kMn8TsxdPIR+wtRpTn9H/b1J+
	xQlJCGQT4ACjVi8kCkbwXDCszpe0I7iCoyOl1vvnJkuY9CFIscAj00v28sj5mzuR2a/W9DPRVsQ
	d
X-Google-Smtp-Source: AGHT+IHWRf/+KzG9HrxCQBidwzrnatPQtCqKYeDgQtIB6T/iJ+L0xT4HnzOW1pZMcfuVnIaruw9ImQ==
X-Received: by 2002:a17:906:c10c:b0:ab7:d6c:5781 with SMTP id a640c23a62f3a-ab7f33a1557mr632279566b.24.1739438200532;
        Thu, 13 Feb 2025 01:16:40 -0800 (PST)
Message-ID: <b6eac47f-648f-4197-8f6d-96bc71cf15b8@suse.com>
Date: Thu, 13 Feb 2025 10:16:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/xen: allow larger contiguous memory regions in
 PV guests
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 Alan Robinson <Alan.Robinson@fujitsu.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
References: <20250213085538.17060-1-jgross@suse.com>
 <20250213085538.17060-3-jgross@suse.com>
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
In-Reply-To: <20250213085538.17060-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.02.2025 09:55, Juergen Gross wrote:
> Today a PV guest (including dom0) can create 2MB contiguous memory
> regions for DMA buffers at max. This has led to problems at least
> with the megaraid_sas driver, which wants to allocate a 2.3MB DMA
> buffer.
> 
> The limiting factor is the frame array used to do the hypercall for
> making the memory contiguous, which has 512 entries and is just a
> static array in mmu_pv.c.
> 
> In order to not waste memory for non-PV guests, put the initial
> frame array into .init.data section and dynamically allocate an array
> from the .init_after_bootmem hook of PV guests.
> 
> In case a contiguous memory area larger than the initially supported
> 2MB is requested, allocate a larger buffer for the frame list. Note
> that such an allocation is tried only after memory management has been
> initialized properly, which is tested via a flag being set in the
> .init_after_bootmem hook.
> 
> Fixes: 9f40ec84a797 ("xen/swiotlb: add alignment check for dma buffers")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Tested-by: Alan Robinson <Alan.Robinson@fujitsu.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



