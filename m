Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DBD8133FC
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 16:07:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654619.1021744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDnIY-0007DN-5J; Thu, 14 Dec 2023 15:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654619.1021744; Thu, 14 Dec 2023 15:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDnIY-0007AD-25; Thu, 14 Dec 2023 15:06:50 +0000
Received: by outflank-mailman (input) for mailman id 654619;
 Thu, 14 Dec 2023 15:06:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDnIW-0006bc-SH
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 15:06:48 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 667b76c4-9a92-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 16:06:47 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-551c03ae050so3336240a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 07:06:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 vc12-20020a170907d08c00b00a1d4a920dffsm9411358ejc.88.2023.12.14.07.06.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 07:06:46 -0800 (PST)
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
X-Inumbo-ID: 667b76c4-9a92-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702566406; x=1703171206; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jT14e8FY/SU3IyrpMxl+ok9YoOzRkTPgRFdpVhB8/t8=;
        b=XPzmrJNBGC2uszxebeMa5LGn6ZQACheNDR018UPCWXEGX0Z3Erhk9HO8PFmTAs993o
         Fuq8EGGmsXtwNJQna/9Xi/Wz+1SDk5o4mNeSgawbcYd/A3FKXLadF+hKqfkGBLew/Y/y
         TzouZUCcMEV1YRIBVM1xCFA2rGcCfs90hKtdWPFmDNmn1Ynk4MwSwd1YG8r2z1YkIy4B
         FNjweY7ny/c5Rw1ah+wR2nvMi+t6VCcSgZLzk5r2bO0XOT3U1Ki3BaRrSTAxBhqrhsHk
         2X00GZ0lLd8kRECaU2kEXvz7xP9QxDCz5ThrwxNYUY10G7IfCkfy2+RwXhvFrbiofRpO
         Oepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702566406; x=1703171206;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jT14e8FY/SU3IyrpMxl+ok9YoOzRkTPgRFdpVhB8/t8=;
        b=XkkAggo0zRbi7ar1zfz17z1V6VegBkqFuQkyWvVuogl9s+urEFm/KyHdN9+Ni/ZxSv
         2yadiR+4vdgbKZbHJM24oD6ZLoO6oxeJkOHfoEyULXjk2doTM22pnXQ5ahIcAgJ+QV1g
         gzaesPs29WMhQtRzJDka6yDarAYs37x9E+8kLlfBBT3wpDONfV+SGheXhK9O0pFnOpu+
         zIAZPakFvYOFY+qImPVrFhboRkaIn8xbBhbKf0abateluDcRGmEHb+qODyOZqfu/gnzc
         9Wg4SRl4QsPC+e1+mbGU7c1dGwY8bvJlgbPK/F7vaYJdUwhF+xW5b9dhCUWGokHNoY4f
         csYw==
X-Gm-Message-State: AOJu0YwBlmz9HvUowat7adGvcBs3tLpOVlb3utju7D6Lv2knfjZMscTX
	HA0fghETvCnhHRB0wKH04Z/q
X-Google-Smtp-Source: AGHT+IEB8kU7dppZUSoI2c9kAttMgRxDT+qD1xt0YyWkchijiEqAaxdbj79Hf/qPL9IROiuufe1iYQ==
X-Received: by 2002:a17:907:6094:b0:9fe:5d39:41c6 with SMTP id ht20-20020a170907609400b009fe5d3941c6mr5601291ejc.51.1702566406648;
        Thu, 14 Dec 2023 07:06:46 -0800 (PST)
Message-ID: <96e877a8-a98e-4275-9d99-da7b1b6dea4b@suse.com>
Date: Thu, 14 Dec 2023 16:06:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 27/39] xen/riscv: introduce asm/time.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <ab09f88d1c43478938811511c54c9d425f4080d6.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <ab09f88d1c43478938811511c54c9d425f4080d6.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/time.h
> @@ -0,0 +1,19 @@
> +#ifndef __ASM_RISCV_TIME_H__
> +#define __ASM_RISCV_TIME_H__
> +
> +#include <xen/bug.h>
> +#include <asm/csr.h>
> +
> +struct vcpu;
> +
> +/* TODO: implement */
> +static inline void force_update_vcpu_system_time(struct vcpu *v) { BUG(); }
> +
> +typedef unsigned long cycles_t;
> +
> +static inline cycles_t get_cycles(void)
> +{
> +	return csr_read(CSR_TIME);
> +}
> +
> +#endif /* __ASM_RISCV_TIME_H__ */
> \ No newline at end of file

With this taken care of (and the SPDX header added)
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

