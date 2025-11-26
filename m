Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 960EEC88F8F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 10:34:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172426.1497497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOBui-0002ij-9G; Wed, 26 Nov 2025 09:34:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172426.1497497; Wed, 26 Nov 2025 09:34:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOBui-0002gS-6T; Wed, 26 Nov 2025 09:34:16 +0000
Received: by outflank-mailman (input) for mailman id 1172426;
 Wed, 26 Nov 2025 09:34:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOBug-0002gM-EE
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 09:34:14 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10522ec4-caab-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 10:34:11 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-477b91680f8so50871325e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 01:34:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f2e598sm38788653f8f.4.2025.11.26.01.34.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 01:34:10 -0800 (PST)
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
X-Inumbo-ID: 10522ec4-caab-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764149650; x=1764754450; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u1letOt/PF0D+BOLnQ50xiHDpOAEeo3oCI43bzUEmp4=;
        b=X7Otvx1lGVjuDUPRqeur6iS6qmMobH1mIMy8Z6VQZKdkA+H5VdKIengccb8NLx+YH2
         4c6qQow4EDY2rDfsx+CXKiMj4HH4yoN9LpFRK9mTwVbEWfZGcIw5FYT3AZqHT1ulXU2Y
         hf6FdmpnmLQI83uJGEIJzOhd3hgp3AhLw+ZqX2rSjBteDNZS+2IsE1Jg/7rDqX4nFaKp
         P5OGt3x5KAEpKdGBSKKE9IkLKDqDRU9QOqgyn/h+rruJZyJSuRI4Gz1qWFFxDXFqv5g7
         9iUDzDj8y1gsLjkaV5Oc5ySXquMIDl7rcaIvywC1WG5ELo9dkS+Xi0IThrqsomBYQfqB
         PoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764149650; x=1764754450;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1letOt/PF0D+BOLnQ50xiHDpOAEeo3oCI43bzUEmp4=;
        b=VNWHKU4x8RMt0h7bhP3ia5rX2DxM+Gciu22EhAMZdWnQZdT0C5+0qmbIjca5LrQnrt
         Kvz61be4I2AcoAWN6Idn8uTyNWbCbCZKkuTHu32SJpOw+CC/KsoXKrcz84uW+etRe5DW
         isJrnbUE/20w0ta5PNxtCwgC7c/7/hVCgxlzssiKPKD6tcvHrfW3jY5JvrwMMWAnJQHX
         jFYlbqmfnaFxEHGYB4Ks1voRWIYJJykgu7oBJvvGKnYk1KgyuIYp0U9CB+laGMKlDu4F
         XruIfH422gIJ39laVYxKgVyfCfos3OJBtBTGMqYAaFI8ZEkcQP1ADuMwB1a5FJJcfkae
         aCOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSc0nMHJ9Tjt3iwvGsojXNXVuNOsihAQulyC/7GL3OB3AQam8bL+DbZgbjxocfqI9eW+Le+zsIN0Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0DaM6+sRLB0dfs8N8r475v8ef8HUQcSMoX2nr2upUuK71I96A
	laj2rGiw3npiCdE1q4sL2kW4ypxYSivfSfbdeDSNCJaHGhwT1CaxZ1jti0BRbY38Mw==
X-Gm-Gg: ASbGncsyd0aWr5eKh/C/zLckNeME+U/wOioM80bSQuVGCpzOtJIhSbhZ58Fu5vf6vBH
	sszmwlL6cbT6tIyU1KTNpFsfojDW9qYLD6wsdV2m2ZTLzkJ6lpbUht70w0ApktpjpmlRNBhdd7m
	d0NVO5gHAJvtyWi4E0lDhpj5prV5Q0PMif8RYkl4uiX416vfiz5aF4SZ5keAzd6rjNqt06v55C5
	99d8sUHGGx4ZOZH3+A1/gbEebJ7vvAPqdtyNJyI+Qve3YxTzfmBZUEtiDL3pXXvChfg9tazRNub
	HtYb4vUFTd0VDsHGaIEhDMf2sy0HGbZ45sEbnPHfS7ptuefpIdf7dC/hOtHaJUZDNuu8Lv5QGAE
	NGFkr7uczhVAakQxhvJgQPVELU0WDIy2Dlmte5JJk/C41Hdp6hToznk93bLLfsmvinDyumcBEX9
	QGlmQ7kgRtYCcY/o+VpxBT+RZ2H1dXlPEqehTM3vEMZTp36RmUcgesEH4MoYgDiwp74tynd3y4b
	a8=
X-Google-Smtp-Source: AGHT+IEIEd6CInBiSXcm+yV+r2PHHKq2rDMpzact1mpk7jnAF+tHVQsd5CugjdGlcf60Tr7DPPMzig==
X-Received: by 2002:a05:600c:5489:b0:45d:5c71:769a with SMTP id 5b1f17b1804b1-477c112400amr162908925e9.26.1764149650475;
        Wed, 26 Nov 2025 01:34:10 -0800 (PST)
Message-ID: <55d23825-fb8c-472c-9d31-5b482f32e915@suse.com>
Date: Wed, 26 Nov 2025 10:34:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 24/24] xen: move MGMT_HYPERCALLS out of
 PV_SHIM_EXCLUSIVE
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-25-Penny.Zheng@amd.com>
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
In-Reply-To: <20251121105801.1251262-25-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.11.2025 11:58, Penny Zheng wrote:
> As we're aiming at moving away from PV_SHIM_EXCLUSIVE=y, we are
> moving MGMT_HYPERCALLS out of it.

How are we "moving away from PV_SHIM_EXCLUSIVE=y"? It's the "depends on
!PV_SHIM_EXCLUSIVE" (and related Makefile constructs) which we decided to
get rid of.

> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -30,6 +30,7 @@ obj-bin-y += dmi_scan.init.o
>  obj-y += domain.o
>  obj-bin-y += dom0_build.init.o
>  obj-y += domain_page.o
> +obj-$(CONFIG_MGMT_HYPERCALLS) += domctl.o
>  obj-y += e820.o
>  obj-y += emul-i8254.o
>  obj-y += extable.o
> @@ -79,7 +80,6 @@ obj-$(CONFIG_VM_EVENT) += vm_event.o
>  obj-y += xstate.o
>  
>  ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
> -obj-$(CONFIG_MGMT_HYPERCALLS) += domctl.o
>  obj-y += platform_hypercall.o
>  obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
>  endif

A change like this fits under the subject.

> --- a/xen/arch/x86/hvm/Kconfig
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -1,6 +1,5 @@
>  menuconfig HVM
>  	bool "HVM support"
> -	depends on !PV_SHIM_EXCLUSIVE
>  	default !PV_SHIM
>  	select COMPAT
>  	select IOREQ_SERVER

This, however, is entirely unrelated afaics.

> --- a/xen/arch/x86/include/asm/paging.h
> +++ b/xen/arch/x86/include/asm/paging.h
> @@ -55,7 +55,7 @@
>  #define PG_translate   0
>  #define PG_external    0
>  #endif
> -#if defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE) && defined(CONFIG_MGMT_HYPERCALLS)
> +#if defined(CONFIG_PAGING) && defined(CONFIG_MGMT_HYPERCALLS)
>  /* Enable log dirty mode */
>  #define PG_log_dirty   (XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY << PG_mode_shift)
>  #else

Whereas this could fit here if the subject was e.g. "decouple PV_SHIM_EXCLUSIVE and
MGMT_HYPERCALLS".

Further, because of prior issue: Can you please clarify that you have tried builds
with all (possible) combinations of the involved Kconfig settings? The set isn't
that big, so exhaustive testing is possible.

Jan

