Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A568133F6
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 16:06:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654616.1021735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDnHf-0006ez-TE; Thu, 14 Dec 2023 15:05:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654616.1021735; Thu, 14 Dec 2023 15:05:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDnHf-0006bk-Ox; Thu, 14 Dec 2023 15:05:55 +0000
Received: by outflank-mailman (input) for mailman id 654616;
 Thu, 14 Dec 2023 15:05:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDnHe-0006bc-5M
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 15:05:54 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45b56e3c-9a92-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 16:05:52 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a22f59c6aeaso280760266b.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 07:05:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 vc12-20020a170907d08c00b00a1d4a920dffsm9411358ejc.88.2023.12.14.07.05.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 07:05:51 -0800 (PST)
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
X-Inumbo-ID: 45b56e3c-9a92-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702566351; x=1703171151; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+L5gw5Yv3RDA4ugjWXkflGlmHLIiRgfU6reN/U0aBM8=;
        b=L33m31pcWn6IK9qih8NTUmo6A55dqH11cOXPghU0mpD3iEJddzyY9kG1EEXSy8skqQ
         UzRGZy/vRQ7hRaF7pVtmkBhK2AA9o40t9rc6zuQCq3Ph36mxwioLNd1FgV0Z8EDDs0Lj
         M0vZgVPkThhu/0xd1LX4jSXgFFoH1M7MFuu88bc9Q5LECYcDbIunUTBcVgl6xPvyw6pW
         Rf6BxmgilnSOqSdLNNOqwqsw+9DnU1pX74d1BV14tTC5q6egDoQ1tByifbLQXZBp31ML
         CY5y1ewXn2aOb0TNg1m+rvr82J60JDe9LLYdGHznDYmUyh/5aJSY3Gu73NTNwDcI1p+/
         xhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702566351; x=1703171151;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+L5gw5Yv3RDA4ugjWXkflGlmHLIiRgfU6reN/U0aBM8=;
        b=GOFXkL+ZTFwRDINqaJQ+++c8tj0qTg3cEqQHxnsjeJP7lMaNZ2ShI77bI7AmNF8WHu
         iZlSyJ2Yoik7atq70k4YIxEgewOFoF3BdQB+dg1ZCaFra08SNMrd17HmddU/wAgSWf4y
         2gXfTJbZNHooxdD6uZvn7RungbTm9vYHBZyRb9FMEsN88jisEfOuW7Vx0vcs9ubhGkpx
         nFDENAVFN4FHlaYcnqQ1QFmlfZBI8n79BbS3RdJLWmct67358W6nfzVYmQyP2qBYQdKA
         IPplzXdQ/Iz8EPAG1HHVs3oj8R5Zv6M9vfdxOw8paCHDeIy8swLfjXPH8gVpxUvVwlby
         a6gw==
X-Gm-Message-State: AOJu0Yx45Up8/464jS4Ts9qhF8atp0gR3P0Osstaa/McVWjcsWfAG3GQ
	ThqJ3xOhfsuWrDuxIYaMT9Ri
X-Google-Smtp-Source: AGHT+IG+u4pX1V7gEqz4/YlQG5gNoSB5ikcqRkyZNPIR5KUOt13GOFEEeKM/TZ322iaiuLneG81zfw==
X-Received: by 2002:a17:906:58:b0:a23:c66:2d9a with SMTP id 24-20020a170906005800b00a230c662d9amr755879ejg.7.1702566351726;
        Thu, 14 Dec 2023 07:05:51 -0800 (PST)
Message-ID: <8802a6d5-ac99-4276-a9d4-3443f5f20358@suse.com>
Date: Thu, 14 Dec 2023 16:05:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/39] xen/riscv: introduce asm/regs.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <073c9a03abe429c1e45f6f66b648a25aff87e9f3.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <073c9a03abe429c1e45f6f66b648a25aff87e9f3.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/regs.h
> @@ -0,0 +1,26 @@
> +#ifndef __ARM_RISCV_REGS_H__
> +#define __ARM_RISCV_REGS_H__
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <xen/bug.h>
> +#include <asm/current.h>

Does one of these bring in asm/processor.h, for ...

> +#define hyp_mode(r)     (0)
> +
> +static inline bool guest_mode(const struct cpu_user_regs *r)

... struct cpu_user_regs to be available? Else a forward declaration
would be needed here.

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

