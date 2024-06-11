Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38ACF903419
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 09:45:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737967.1144505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGwBT-0007Of-Jo; Tue, 11 Jun 2024 07:44:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737967.1144505; Tue, 11 Jun 2024 07:44:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGwBT-0007Mt-H4; Tue, 11 Jun 2024 07:44:47 +0000
Received: by outflank-mailman (input) for mailman id 737967;
 Tue, 11 Jun 2024 07:44:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBrw=NN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGwBR-0007Ml-V5
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 07:44:45 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77e7df4a-27c6-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 09:44:44 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a6efe62f583so56867866b.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 00:44:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f1b7f5b12sm270687566b.196.2024.06.11.00.44.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 00:44:43 -0700 (PDT)
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
X-Inumbo-ID: 77e7df4a-27c6-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718091884; x=1718696684; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RqT0W4YHSax70D5wSkQzykxk2VA8rXEPlBhJzRJ7a4I=;
        b=bFx40jl48VNROPcfbp4dgeb/Qcgvuc0eEXsNcqLRlma83Ga3/VN4D4KwkDTA5KWOKg
         pJG6IftdTht2WHPyqhXQudUgs5GTPrUqzJvq8miiZ3HVCGTY5dPU0XZ6+xtphnLRLpxF
         15FlKtHwxxxiooTtTOtBQYxNXGx5Q4iRpk9LnErPtEdjGexkSHaMC+cQspWzX2W3vWAc
         CxJWG/XRoQiESSMnTGfQi8TyxJZV7jOFHt8nkzH24C+Cmf7Pfsm49SKoN+geWB5DDmoO
         O04jv9QFIY6Yog9gCKhPkX4u06qotOfwzlgzOewMuUK/yE/t3rJHj9zrZ495Z9Eaicir
         x0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718091884; x=1718696684;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqT0W4YHSax70D5wSkQzykxk2VA8rXEPlBhJzRJ7a4I=;
        b=fi+Pmc0UZotbEwCkZlZ39ZSILfCaVHC9PH1knWwUhRhMn+TUusUR1D+aHflmq/jauZ
         OLPZt5WNljkxPgwiJyh1RG1mL1umyPu4WbNRHF0hhImbufbHtKZujgTNtMIIo/aiu8a9
         TsqH+6S6kJfV9uX97CEE9PoyN0No0pjowt0zEwmSb39ukV7f7TEprbJWM8aMkw0et+no
         1MqCatn1CZquIP69iaEzMvjb9A1YgHU/Bb3sOTuDtYbfcnj1V2WA3NdGUbf/tbn9oUTh
         qFQfptU2aykDbV0wG1kUJ2kiYsPLXmXorBKRrFUYV/3nsb2ztlW/TBrNSs7Wxa/2mtHi
         uvaA==
X-Forwarded-Encrypted: i=1; AJvYcCW21Viu0ibl9aWwgJ8tJy+JyThduj6YSaPCgZ1yFyp7gFK9CZlD2RbpS+IfY3d4LMl1WnxrvIdFw4fR3osDsvL+tcGYJMyZYOw6FPq5nao=
X-Gm-Message-State: AOJu0YzxA9/SlKXlz2HzkZAmBVRE6oIx7yjKwDFSevA3s7CtpfgGe5ig
	12zz+0Q2Kbe66PGLNoKphYwspT4MpF+nIftpYMEgUxN24R3VwIVTeCHHn6nKrw==
X-Google-Smtp-Source: AGHT+IHQDjqgxm5+PCebhgYwTsf2wmns2k0ZghhWnAMv9pJ95vbQIuAxVDBA6MDwxCJ2Bnhhjq+i8w==
X-Received: by 2002:a17:906:94f:b0:a6f:3155:bb89 with SMTP id a640c23a62f3a-a6f3155bbf1mr144096666b.70.1718091883604;
        Tue, 11 Jun 2024 00:44:43 -0700 (PDT)
Message-ID: <9048733a-e942-4384-b926-e8a304095356@suse.com>
Date: Tue, 11 Jun 2024 09:44:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] x86/irq: describe how the interrupt CPU movement
 works
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240610142043.11924-1-roger.pau@citrix.com>
 <20240610142043.11924-3-roger.pau@citrix.com>
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
In-Reply-To: <20240610142043.11924-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.06.2024 16:20, Roger Pau Monne wrote:
> The logic to move interrupts across CPUs is complex, attempt to provide a
> comment that describes the expected behavior so users of the interrupt system
> have more context about the usage of the arch_irq_desc structure fields.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



