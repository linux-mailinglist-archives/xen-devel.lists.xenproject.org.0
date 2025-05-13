Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26769AB593E
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 18:01:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983095.1369457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEs3x-00010l-Iq; Tue, 13 May 2025 16:01:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983095.1369457; Tue, 13 May 2025 16:01:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEs3x-0000xv-GD; Tue, 13 May 2025 16:01:01 +0000
Received: by outflank-mailman (input) for mailman id 983095;
 Tue, 13 May 2025 16:01:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHDm=X5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEs3w-0000xn-M1
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 16:01:00 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75b54b37-3013-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 18:00:58 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-acb39c45b4eso944037066b.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 09:00:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad23a99f9fbsm602254566b.25.2025.05.13.09.00.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 09:00:57 -0700 (PDT)
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
X-Inumbo-ID: 75b54b37-3013-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747152058; x=1747756858; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AE0hqb5OlK5hyIP+I7gmgtxT2HfhXK3XdJVlDu1JXKA=;
        b=enpBLHmYtw9sgIhH6IGycuJvsmw4ayXgib9JfiUZd9AWQID7ZyFi/y0P3JBnQmbtTM
         +ykv0M805ADwGzy0hhKPk88+IkKJYupkItpDNNWrHkEVWJgDIYChppdaygU06DFInP7E
         FUpzU64mm9sEUVAQ/ZLsUdg/sTE/Ekz8qdWwfmv34uqio9966Qof0l32MMrhezsiyvK+
         SBRCw/uCZhPxkkxvOw/m1RbN0wVq+TFEag4Y/LFL1wJQNcdCAhVAEOitTwodlBQWgRZ/
         mfsoFWs4BXQ199K9xCNxSpP2eFRFGQi6ub7Va2K61r6G7oTRlWQoynekmY6jnndU0VeG
         Gneg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747152058; x=1747756858;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AE0hqb5OlK5hyIP+I7gmgtxT2HfhXK3XdJVlDu1JXKA=;
        b=SLtwmwUCcA2s7nxcSIDqWFAgNBuDXI7QbBahWJMPzQ2Z/Qup0SCbTtYIY81haJdC5C
         ymAI2ZTPCnyxFr3ZYzZE9zqwSDCcfr3k0Bd5lSbBT1fcm1DiwK5a5QsUsEpFVnFBcqaG
         KGQ/EVxJmP9VTBrc49uvAbe5rzMHxcmdUupmEN/WFrmXs9x8fiPIXK8ulk5bqNieoEE/
         p1lZaF2bE48wxWBNGQloiz6hwokqVxz/UWIgJlbSsnCa1nFuSua0jZIeUOtsxxlpwdr7
         cHObhrRnSb6bhQz+cypUEZqeHiunvoOZk0djVyJQd2Xg4qStfA4vLAPfZFfaPpQUWXeF
         pMdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfIzbtYar6zUFzTZV3aSuVdMyyhgh1u/GzEXWa3vf13ALyGrpM7BqT1zc641K8y5AZNBe8+oH+8nQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxsOXj0ZKHyGvP+Mk9R/FhFs6TKLOgY0z/RFOd3KdjDbdtsQA9
	XdSlKYA1m07CCleeU6KcEefRtWj3RvpF0LMKgC/pmp/fFn7fVZlE5OrR1FGMiA==
X-Gm-Gg: ASbGncsUjaj3eTvVmAWJHzOlx2Dyc5vd2hKu8c6C38Z454d94PdjZNr6WkU+Wps3vkR
	5u49vqYBcNXZFaqLAJ/vkksgxXqiFr60nLjmpwNu4yKCFwe516+3Om4pUCfUyP5X6koS9ErLM3G
	/7CS0TGASltBRD1e0+RQXLN+WREzOYgFp+k9uSh+W60hkB4e5nnWKuVjC3a9e1lYGQ1263Oak4M
	oO9+gJeTEFD6s1/05CgI8hJMHKX4N8rIsrAR3ZfORq4i9MQw2qpRTGZVMTcFFc20lCnrffclKdf
	JKG45imwlhjOncFHq0NoK1JsSuqmdw0yguVs3SGwND3LWusH29XQc7aQJBvIyYCu2kRkUNDHT1m
	VE7UBjDTeOlPYRWDllWoRXpdqc1v/CECWeFJu
X-Google-Smtp-Source: AGHT+IHFPVHYpTk15GgH+3kiy9gG5IO5Z7h0Q61qN8gI2xntgB2WuwXVftSuoyjLb1aKSZF/Ln0w7w==
X-Received: by 2002:a17:907:c003:b0:ad2:40e0:3e56 with SMTP id a640c23a62f3a-ad4f74d3f1amr6499266b.57.1747152058045;
        Tue, 13 May 2025 09:00:58 -0700 (PDT)
Message-ID: <cf70c0c5-aec5-4bab-ac99-1e23ae06ee7b@suse.com>
Date: Tue, 13 May 2025 18:00:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/16] xen/riscv: introduce support of Svpbmt extension
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <da9273c20dc7ac1c131322e38a8cef361dfd86a9.1746530883.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <da9273c20dc7ac1c131322e38a8cef361dfd86a9.1746530883.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2025 18:51, Oleksii Kurochko wrote:
> Svpbmt extension is necessary for chaning the memory type for a page contains
> a combination of attributes that indicate the cacheability, idempotency,
> and ordering properties for access to that page.

The title suggest use of the extension is optional.

> --- a/xen/arch/riscv/Kconfig
> +++ b/xen/arch/riscv/Kconfig
> @@ -10,11 +10,25 @@ config RISCV
>  config RISCV_64
>  	def_bool y
>  	select 64BIT
> +	select HAS_SVPBMT

Such redundant ...

>  config ARCH_DEFCONFIG
>  	string
>  	default "arch/riscv/configs/tiny64_defconfig"
>  
> +config HAS_SVPBMT
> +	bool
> +	depends on RISCV_64

... dependencies are frowned upon, afaik. And it's pretty certainly not
needed here.

> +	help
> +	  This config enables usage of Svpbmt ISA-extension ( Supervisor-mode:
> +	  page-based memory types).
> +
> +	  The memory type for a page contains a combination of attributes
> +	  that indicate the cacheability, idempotency, and ordering
> +	  properties for access to that page.
> +
> +	  The Svpbmt extension is only available on 64-bit cpus.

I don't mind the help text, but for a prompt-less option it's of little
use (beyond what a comment could also achieve).

> --- a/xen/arch/riscv/include/asm/page.h
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -46,6 +46,8 @@
>  #define PAGE_HYPERVISOR_RX          (PTE_VALID | PTE_READABLE | PTE_EXECUTABLE)
>  
>  #define PAGE_HYPERVISOR             PAGE_HYPERVISOR_RW
> +#define PAGE_HYPERVISOR_NOCACHE     (PAGE_HYPERVISOR_RW | PTE_PMBT_IO)
> +#define PAGE_HYPERVISOR_WC          (PAGE_HYPERVISOR_RW | PTE_PMBT_NOCACHE)

Hmm, odd - NOCACHE doesn't really mean "no cache" then? I think this
would require a comment then.

> @@ -56,8 +58,21 @@
>  #define PTE_SMALL       BIT(10, UL)
>  #define PTE_POPULATE    BIT(11, UL)
>  
> +/*
> + * [62:61] Svpbmt Memory Type definitions:
> + *
> + *  00 - PMA    Normal Cacheable, No change to implied PMA memory type
> + *  01 - NC     Non-cacheable, idempotent, weakly-ordered Main Memory
> + *  10 - IO     Non-cacheable, non-idempotent, strongly-ordered I/O memory
> + *  11 - Rsvd   Reserved for future standard use
> + */
> +#define PTE_PMBT_NOCACHE    BIT(61, UL)
> +#define PTE_PMBT_IO         BIT(62, UL)

Unlike PTE_SMALL and PTE_POPULATE these are arch-defined; I think they
want to move up to where the other arch-defined bits are, thus also
maping them appear before their first use.

Jan

