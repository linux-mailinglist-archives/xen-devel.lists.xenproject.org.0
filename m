Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F0698BA27
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 12:56:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808000.1219789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svaYI-0001BB-OO; Tue, 01 Oct 2024 10:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808000.1219789; Tue, 01 Oct 2024 10:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svaYI-00018I-Ld; Tue, 01 Oct 2024 10:56:22 +0000
Received: by outflank-mailman (input) for mailman id 808000;
 Tue, 01 Oct 2024 10:56:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svaYG-00017M-TD
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 10:56:20 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5fc3b52-7fe3-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 12:56:18 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8d2daa2262so617986566b.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 03:56:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c297bc6fsm684867866b.184.2024.10.01.03.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 03:56:12 -0700 (PDT)
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
X-Inumbo-ID: c5fc3b52-7fe3-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727780172; x=1728384972; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iUun+lrwmpBBe72wDTtf+uLOH4m8joMfYJjJkNv/w4o=;
        b=Z7xlO4AFrb29QlFBuQ1Ubl4SOeAC7sR7EQrBvc3hdfZBBB5ELVYjoqWXMj/zqfIRM4
         5JqkIX6KJYjCMb8jkFW1/wiWRyU4OlMVST/NTmFanhLKsGKSVrcPA2qHPVd2XBsExLeN
         4dN84Erinw02q18r30ukyX/aIVWKDTqQKarIPYHxoYTcRJkEpF4RLyEn+sygeLFpJR5l
         ok49qUnC78JV1pXA28B4J5/fP/GggJqGvG3sV428TxheeqU1471QD7dMuVT+7Hqy6qnw
         i0sm1qOSba7ev23OZMu+pOQ6x0o0dMmCPbyOP8mGDFHIIayQIrheDdBwhFKAWIRuuBiy
         19Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727780172; x=1728384972;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iUun+lrwmpBBe72wDTtf+uLOH4m8joMfYJjJkNv/w4o=;
        b=AaQ7qXu7xHLUITJOx6n5Ec2yMLXgzRsNmMbxAiFIYhco5mbmoIwfPg6fb2WQhfulA5
         uBQU2HYpp4NuFQsppviKo9GlEEltIiQUlbDY1XUNKpDoFmNkAsw4JJr+XSyUOh2tyaIi
         zvml/mdmd0/hLYSno4flaM8CTH0kPBD/tcN74dC8EZVpACQAi1OKkgbJRV9A7E/5a0MV
         8kK4gLBwCs5Pj7y8ikWF9rAesB0c+1qP+rRqnOfdfSjhFhQ7qzuIr1ko+9tJlRe0ZJn8
         0GhTxHA8tzmmViORETpRPn9CA+SjBwKVdyMaHH4S8noFzHITuVK7q8cy5SN1IqTvkv7f
         lyQg==
X-Forwarded-Encrypted: i=1; AJvYcCW30riprGnIUHjHHWhtcpLv5G5zUm4ebJDrR0k9dx30j8CL3ooYf4X/qeP99zo2/Z0SA2RkCeiaMpo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz52DX5Ta7z3f5wVvqtLCiyyEik5IH5rBs6ntWXDTOP+AjeuVzV
	IMwIT/rRoY0Bsyqfth0cZJJQdyowYu+UfmmP1assprpjpj3aVgLn/bqqzexRlA==
X-Google-Smtp-Source: AGHT+IEBZHfLUy4AuHvzrxrINutcel8aHHxjJL2UY7F8v0bxesmiOYfFoz9Cs6pF0JT9cF/oemSDdw==
X-Received: by 2002:a17:907:a0b:b0:a8d:2c3e:7ece with SMTP id a640c23a62f3a-a93c492d4e1mr1650231466b.31.1727780172327;
        Tue, 01 Oct 2024 03:56:12 -0700 (PDT)
Message-ID: <14f5fee5-778a-48bb-9952-7e390a020f95@suse.com>
Date: Tue, 1 Oct 2024 12:56:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/pv: Handle #PF correctly when reading the IO
 permission bitmap
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240930161837.1248144-1-andrew.cooper3@citrix.com>
 <20240930161837.1248144-3-andrew.cooper3@citrix.com>
 <4045d42b-76dd-464d-af26-85fd9b0b9f05@suse.com>
 <5cf7ef35-1887-494a-89c4-faa8f4f3e575@citrix.com>
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
In-Reply-To: <5cf7ef35-1887-494a-89c4-faa8f4f3e575@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.10.2024 12:41, Andrew Cooper wrote:
> I think Xen's internal variable wants renaming to not be a limit, and
> the comment for PHYSDEVOP_set_iobitmap wants extending to note that,
> like a real TSS, Xen might read one byte beyond the end of the bitmap.
> 
> I think this wants doing in a separate patch.  Thoughts?

That's probably going to be best.

Jan

