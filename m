Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BAAAF6F0B
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 11:44:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031906.1405640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXGTx-0005H3-HK; Thu, 03 Jul 2025 09:43:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031906.1405640; Thu, 03 Jul 2025 09:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXGTx-0005Fb-E9; Thu, 03 Jul 2025 09:43:53 +0000
Received: by outflank-mailman (input) for mailman id 1031906;
 Thu, 03 Jul 2025 09:43:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lE7m=ZQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uXGTv-0005FV-9n
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 09:43:51 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36993494-57f2-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 11:43:46 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4535fbe0299so32015285e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 02:43:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31a9cc5a2d9sm1960791a91.16.2025.07.03.02.43.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 02:43:44 -0700 (PDT)
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
X-Inumbo-ID: 36993494-57f2-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751535825; x=1752140625; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mq/IODv+qT+flfSlgUaSPKELZMU6DtYq6ANyKXh4Fvo=;
        b=KKJVUOFTHKn74TO8C1kVE/ce/peptcLqm43R4RxitXAaybqZkn84AF+/W7sbAODZrz
         QTHcx3qXU4Vt0bLPNRRamtV1t469cz4bsC14hqVJOqqYufMNrhNbKfoQZ/msR201UEEY
         ZwtclmoLksgkb6sHpUHLQbaifl0JmO/gdxznINuw2b2zNz7B2+Vjc5717EDgjdgivakf
         NwfqNYhlxyOw7RYYRPH4nJfTFbLQoM2ah67uFBcwTFt6MQ+2vboWqe7GL8wVATdxuLqW
         Poy7OQ1FgPhzuWeoJRPBnhAAgQwge1NuXPG5jasD7k2CMZdipGJRi1tkYPXEgZZ6X2C3
         /52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751535825; x=1752140625;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mq/IODv+qT+flfSlgUaSPKELZMU6DtYq6ANyKXh4Fvo=;
        b=S3tjieYcMZfvRIg3qK5sAgNZVgUvwOYe7gdDiY95uif9T7GSIVNseM9Aa5tDBSRe+U
         fDQRlRpN3r63xZAcqe6HZ9rRk1KPfweSAMd1X5m/l4kr165yEKyEUIgLMQZEsdiRuROT
         IgkD99wFCP5AqyPTkzU0ihXZBP7QfCxZUzF/9CDvSTWnnGaTUle3aYr7OD65TBsEE4T4
         uCIkAOmcT1t5E/iMXh8QaSNE7G5xnQ1DIUD+pR7IAgoCzky2sLUGKVE6a7j8USBUnFvZ
         dPJVIGsn/GAsqO0sjIkRz/0tDTDcXvfR2hYOiDNSDjMKLPYRLbywfSSB9XOHXYd8A+O7
         lPeA==
X-Forwarded-Encrypted: i=1; AJvYcCUGXdfYfQl6QwDVg62ae963/Wxumr0xdE8czFVsCa2Vj9bkgU9kMGu9G1gT0ooe2mEglY/9wZN/2RY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAf5MfJ3Z7+I3M2bfwBgp1Xc+8W176VzZqxlP0/OMszuLy6jzE
	ZMejQq3Gw/nqrA5xhads3Xg0ElcmI/6K6+7pEPmD2vrPCtB64H6zrCailNewt7ldbQ==
X-Gm-Gg: ASbGnctO+K1Z2ySm+i1NiurfFO5GMCvTc6C4T5Ib1Myzjp+SyRwrui5GeXyzJZXVy2l
	gMXgKrWf3w8DEAfxEy6q/gSbTEya++rdqpQ3AcAifgWbAVBcOcSwyGc7Zml7jXymWHEq0wNpN8D
	2AhePoALOxq5LUCN+xBq81YvvUEV4adyNer/n2DUfW2/WRlIgJrvswNXbP3Cwa5wRLbwdDp7hnn
	BMhBZuEMYzKvnDrciOncmBhFIXkoDlaLDUIoUSc1hy7N/kHqm0nFlDn/l6QaFsjBPXmzUNqq+3l
	ZMCVFZH4CkadYrM5J+bchOPs9VPDhtaqKa2p6HhIS4mucmmMgf2RHF9ipN3VRT7c4GMPEL/WnFt
	aOTm8BQgxvwhHSZfz7iVzlVco9K95NUwWWuGn7LebQGHTNtKRdFeQluOkHw==
X-Google-Smtp-Source: AGHT+IEIApFF4e+202hzQPXTET2gKQ/LGZ4KqWcEz7dPsyQZh3cZqh63ix+IHKBPufNn2k+aecPdlw==
X-Received: by 2002:adf:9cc4:0:b0:3b4:cb0:b6e8 with SMTP id ffacd0b85a97d-3b40cb0be82mr227679f8f.42.1751535825301;
        Thu, 03 Jul 2025 02:43:45 -0700 (PDT)
Message-ID: <5ad4dc09-981f-4ad4-9e20-2125f727046c@suse.com>
Date: Thu, 3 Jul 2025 11:43:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] x86/idle: Fix buggy "x86/mwait-idle: enable
 interrupts before C1 on Xeons"
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
 <20250702144121.1096448-7-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250702144121.1096448-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.07.2025 16:41, Andrew Cooper wrote:
> @@ -461,12 +468,19 @@ void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
>  
>      monitor(this_softirq_pending, 0, 0);
>  
> +    ASSERT(!local_irq_is_enabled());
> +
>      if ( !*this_softirq_pending )
>      {
>          struct cpu_info *info = get_cpu_info();
>  
>          spec_ctrl_enter_idle(info);
> -        mwait(eax, ecx);
> +
> +        if ( ecx & MWAIT_ECX_INTERRUPT_BREAK )
> +            mwait(eax, ecx);
> +        else
> +            sti_mwait_cli(eax, ecx);

Actually, I'm curious: It seems quite likely that you did consider an
alternative resulting in assembly code like this:

	test	$MWAIT_ECX_INTERRUPT_BREAK, %cl
	jz	0f
	sti
0:
	monitor
	cli

CLI being a relatively cheap operation aiui, is there anything wrong or
undesirable with this (smaller overall) alternative?

Jan

