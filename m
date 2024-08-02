Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655A6945D18
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 13:18:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771018.1181600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZqIU-0000Ya-VN; Fri, 02 Aug 2024 11:18:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771018.1181600; Fri, 02 Aug 2024 11:18:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZqIU-0000WK-RE; Fri, 02 Aug 2024 11:18:10 +0000
Received: by outflank-mailman (input) for mailman id 771018;
 Fri, 02 Aug 2024 11:18:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZqIT-0000WB-3h
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 11:18:09 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4a10162-50c0-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 13:18:07 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2f15dd0b489so9508901fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 04:18:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9d437bbsm86671366b.121.2024.08.02.04.18.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Aug 2024 04:18:05 -0700 (PDT)
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
X-Inumbo-ID: e4a10162-50c0-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722597487; x=1723202287; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Lqo+36Qc1nlXNyw/C5M1bynBVeWABxzqvPSrqc8LcMg=;
        b=AetRudV7aiNp0EuE2dc55dZAudxlbav2AIgOFhLP4INtTvwNEu7ecOoiKseVdYUnLB
         sDrUSISl+8v2QEnrf0ZFmAKc26037lye/3fMaAnX9HcuUFdpQOkJY0b39Q3ERs2iMWuj
         hsP1rW+gVrHzuAHT9qj9i6CoWOuCLwLTZNTcWTLjDNG30pQ8gu4wHKqDsMMes3R7jDwL
         1ep+HsIlw2e8awTI+q0KqXr/3Eht+zhUcKt+IiFuD7Jr2iZTCJMemgDI2X+CY/kGjDOu
         snJdNNc4qkbO/qBE0Ka2CNfIl7jWqNJPD8RJTC7K67pjNAqFeKy8Lvfg8u2bpTuC7cUA
         kvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722597487; x=1723202287;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lqo+36Qc1nlXNyw/C5M1bynBVeWABxzqvPSrqc8LcMg=;
        b=FQA2FE524JYA31zk8pArNKddiT2nSqdB1jiFFsfLsbAKinQZ+UQNTqWCpxi0SoIkjq
         NZMHv6GmEpMISWEoHws8LlDS66TPjOMyWKXYi9SQk+hI/+GGgXGC4kd2BPmonglG4/ws
         +rKPG7qTAppzeL9emIFJSHUHIMoUApoG/u9O7pv0QzCLIj0epxIQNg6ENzVMRpkFKDdR
         QShq8Bsm88Aya/JjTlYTfOHjORlRbTcovp6SX36bYMTFiwo6uMMq0Zi6TvK61g9y4nOT
         XXVzP1b2o0CIUyt73JbKTwH9mREDzWOyZ2KC+LGu3bSAphyUwAqR3ThhiIJivnxdLN+m
         wCeg==
X-Gm-Message-State: AOJu0YxJ7DZVGxDpasT2lzdko3vRaZJ/4xhAhtpLLrY+PRfxeSYvs55L
	qnEbBSjUgDMDT5UKrgJuY3mJVAPbnYZsNNv0mfMozyMzvwCYvctQdYrbyeGIyQ==
X-Google-Smtp-Source: AGHT+IF5uOSvj97YAe8JI5nIAM8aSmBICP+rG8gwDMEg6ano6clXFj196AmNWWuayT8vzwT/QE6TDw==
X-Received: by 2002:a05:6512:3da6:b0:52c:9725:b32b with SMTP id 2adb3069b0e04-530bb36f8ddmr2050031e87.17.1722597486492;
        Fri, 02 Aug 2024 04:18:06 -0700 (PDT)
Message-ID: <6f339355-4f82-4b84-b437-cc72dc063b64@suse.com>
Date: Fri, 2 Aug 2024 13:18:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/5] xen/riscv: enable GENERIC_BUG_FRAME
To: oleksii.kurochko@gmail.com
Cc: xen-devel@lists.xenproject.org
References: <cover.1721731887.git.oleksii.kurochko@gmail.com>
 <b79bcfb9031564fc8d275af66fa94c1e82e54de2.1721731887.git.oleksii.kurochko@gmail.com>
 <7c03ed78-7c80-45bf-acf3-a916b7abb7d5@suse.com>
 <6c379c6a0ac3e046c67647fa63d085a341906224.camel@gmail.com>
 <83e20f26-ae59-4191-a12d-f31f779c91e2@suse.com>
 <a16ac4cd3fe0143e40f8b5ec993cd6049d41ea3d.camel@gmail.com>
 <1d3ef706-fa3d-4dee-818c-83904012ca35@suse.com>
 <1b3aff2873f3e9a46b6dd7936717c32945ecf30f.camel@gmail.com>
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
In-Reply-To: <1b3aff2873f3e9a46b6dd7936717c32945ecf30f.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.08.2024 13:02, oleksii.kurochko@gmail.com wrote:
> There is something what we need is mentioned here:
> https://github.com/riscv-non-isa/riscv-asm-manual/blob/main/riscv-asm.md#instruction-aliases
> But the problem is that is "de-facto" standard, but not really standard
> instruction. Anyway, I will update the patch to use (C0001073) instead
> of ebreak.

Well, the official spec, in the C extension, mentions 0x0000 as "defined
illegal instruction". Wouldn't using that work? It's going to be undefined
no matter whether the C extension is actually implemented.

Jan

