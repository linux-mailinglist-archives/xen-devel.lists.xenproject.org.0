Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8008180F392
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 17:51:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653329.1019798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD5yY-0003sv-Vg; Tue, 12 Dec 2023 16:51:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653329.1019798; Tue, 12 Dec 2023 16:51:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD5yY-0003qk-Sf; Tue, 12 Dec 2023 16:51:18 +0000
Received: by outflank-mailman (input) for mailman id 653329;
 Tue, 12 Dec 2023 16:51:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A/PU=HX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rD5yX-0003oH-KG
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 16:51:17 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa6d16fe-990e-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 17:51:16 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33621d443a7so2288512f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 08:51:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v14-20020a5d4a4e000000b003333541a5bdsm11240295wrs.80.2023.12.12.08.51.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Dec 2023 08:51:15 -0800 (PST)
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
X-Inumbo-ID: aa6d16fe-990e-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702399876; x=1703004676; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ER0YuL4YyE/Qa4bQFqyGgDTCu49JTc++v1bdP7gyW7A=;
        b=TFeYhwzOcb5Td97SxSN2fDj+tfn5+XtU8WPnEFDRQzL+iBwd4cY7fAnogOFrMHYLki
         YIjHmJf973b5HOIwIfLYxbbtD7Z4R9AKynnfLHN2jltTq+PCYgKvImjeaO/8a90335I+
         kyNMhLlFFNbPgmChYovzwQTKkqYBtIyF4KjlJ/dn8yM3MXWS0cKbpnmmvNCGjBful4mo
         8YimJSzX52xH/k1YKk+pzavF2YmtKiBssYbbZzP7STdcLKT6UO5H7pYzNcD36gpJEqQz
         FXfHDVkQVJn5FhuaJa6nyluD4hgvpke8ESEIK2i8A3fU9ioqICTV4Hql/J9NMdv2Tdzd
         Dagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702399876; x=1703004676;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ER0YuL4YyE/Qa4bQFqyGgDTCu49JTc++v1bdP7gyW7A=;
        b=s3tQPplluIxucc18b2gO/ftlDZZTCHOCR8HMZN+v4qkuSRCeBPE0aCH/aoPgpZolv/
         B8WkONhSxqx6MgeJKi05pDmx+5gUgQp7JDJHLxOU6Fzbc1dgoM2CcXVYAI4v7a0gC9Cs
         fjhK6/I410H/eGdOn+DgBEua0CdW6ma1r2cAvV1pu5eS6Cn07eLbZfAPvGnDMxEEUIrz
         JR6CQPobpV58UiKUEbZmmBOmN2BoiEgcwFSE0r7d5O5G8fB+p+upt1FtW8KUNjZIO1rq
         jjJAU9wCRzhKxwrUCa8AJcMiG7pW+sX3tpHCNVulDofNLBOPDDaidaKun0aIsrhlEG1I
         Pmuw==
X-Gm-Message-State: AOJu0Yxz6HCQ4bA0Q18+0MkoUDoxXwOMY9mJeQEEi/wPQhRstxaWqIar
	KBpOi3MY31nhkx9SiUYz1sBw
X-Google-Smtp-Source: AGHT+IFpmzl/FGuSr1jgua5SwLd27VzYOnkCBs3jTHBk8C1h3FaMXiKrafc4EF6m0kGsPQw25jAjVQ==
X-Received: by 2002:a5d:574b:0:b0:336:3740:5274 with SMTP id q11-20020a5d574b000000b0033637405274mr6390wrw.79.1702399876007;
        Tue, 12 Dec 2023 08:51:16 -0800 (PST)
Message-ID: <9f0bac57-5851-4d40-9b9c-3f430d58b0b2@suse.com>
Date: Tue, 12 Dec 2023 17:51:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/39] xen/riscv: introduce cmpxchg.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <981cabb593fb4b5d8927071d456ec7016891fe71.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <981cabb593fb4b5d8927071d456ec7016891fe71.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V2:
> 	- update the comment at the top of the header.
> 	- change xen/lib.h to xen/bug.h.
> 	- sort inclusion of headers properly.
> ---
>  xen/arch/riscv/include/asm/cmpxchg.h | 379 +++++++++++++++++++++++++++
>  1 file changed, 379 insertions(+)
>  create mode 100644 xen/arch/riscv/include/asm/cmpxchg.h
> 
> diff --git a/xen/arch/riscv/include/asm/cmpxchg.h b/xen/arch/riscv/include/asm/cmpxchg.h
> new file mode 100644
> index 0000000000..c535bc9660
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/cmpxchg.h
> @@ -0,0 +1,379 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + *  Taken and modified from Linux.

Depending on how heavily this file was modified, further adjustments may or
may not be advisable. Can the description here please be non-empty to cover
how close to the original the result is, plus also what version or commit
you started from?

Jan

