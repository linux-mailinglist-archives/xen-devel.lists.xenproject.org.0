Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F0E9DFBEE
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 09:29:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846346.1261511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI1oP-0001GE-6y; Mon, 02 Dec 2024 08:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846346.1261511; Mon, 02 Dec 2024 08:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI1oP-0001DF-3W; Mon, 02 Dec 2024 08:29:45 +0000
Received: by outflank-mailman (input) for mailman id 846346;
 Mon, 02 Dec 2024 08:29:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tI1oN-0001D7-JO
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 08:29:43 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 930004c8-b087-11ef-a0d2-8be0dac302b0;
 Mon, 02 Dec 2024 09:29:40 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-53df67d6659so5624811e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 00:29:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5997d55eesm481814466b.80.2024.12.02.00.29.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 00:29:40 -0800 (PST)
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
X-Inumbo-ID: 930004c8-b087-11ef-a0d2-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMjkiLCJoZWxvIjoibWFpbC1sZjEteDEyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjkzMDAwNGM4LWIwODctMTFlZi1hMGQyLThiZTBkYWMzMDJiMCIsInRzIjoxNzMzMTI4MTgwLjU3NzUwOCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733128180; x=1733732980; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YBnG0jgYVPf8aIoX2AG24CNnm8979480L+azcJ+l19o=;
        b=JcEr3vuDSg8qYpGpw6+GWtbXxiVuQfkMsIU1LSsVwJH+S9nJI3L+TuWNK17xQMO1J/
         Bo7U8CkTq3eQrfVcawadX2Jd9O7DDMQavRQzUatehlDYEUov1QpKUzMPbV5IMNCGw2m8
         urf5yq3zpjQk6Q9Kc6X+mPAkbB8iKWIF/yUIfZKIPmHCQrYHeCCaRQWCtH8qGEhBmslt
         dMrtiwm/rPmii7ytM49pmfgtvXd8ni7LVQz0zcX5pKPookCn7K7fabiMrOCsbodkF/D9
         BL9WOj3QmaSXgPBmmpn+2OA9WvHk3imIU8qzvpiYNgjz4xqROKhYca4l8BDX0U1SXV0+
         k1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733128180; x=1733732980;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBnG0jgYVPf8aIoX2AG24CNnm8979480L+azcJ+l19o=;
        b=dNNU7O+k5oKJJ8oWgoFuh+9DA7jjfUQpXSrRcy9QCNPN66sQs4miWmzLh2ZIh4p3fK
         dPCTVsILaIMeD2zfzSRWTZATtjFf28F+FP2TfV6KDjEBX0lMtJOc1Cww3MEyTPluM17N
         4X3eDbND+c0NUv1Tw/TPrzJShf/ftV5vXZq1RxIJ1yykWRFYJibA9L4n8DCmZbMx4c18
         xYddIcTKRUxsqhwQHM8yVGx97TtsX+VarSthN2VpWanGzXBL6x3MFZ6Q9Ea/SpYdPjNS
         BB6PVR6cS1wpMozhW54gdSc/q89Ni9EVDdWcXvU4KNJR9uc3ldqil/7CCHvb3CQBUSHU
         ICxg==
X-Forwarded-Encrypted: i=1; AJvYcCVZSsGiwhSaJ7yLGH9cKbVO2p7mcLYlSBTTsdY+69LGQaWVNdv0D85yBn51TTDissUnTbVVCNU9wp0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywi+uj/0s2rpTF6p6FAQ6/dluNTwxWIS6suO6PV1K+M8LAsg7uB
	rz5kmtAYQhZKRZr0F4NV5xgjsaVMX6U7mHKuJiCVUCin9bGrsQun5MeNoAYK5w==
X-Gm-Gg: ASbGnctZq3AddZoVfV1a30Oz+WKBR84FHRFcVjq24ugFoIBjfnoulGkItcHe0kw38PR
	WJIZ98savKhMfMdw2iTxo8V+IXPSoKLrJE8i5gEMHIc+c1shPjBfXZ+mILDJ6EZ0c61ThGURQMT
	lGA8iqzZvz8eUsNSKuIp4R1oyaJpeQiurIbrK81gNWwi4jtCJxtWN7hBKvmx7dLwZD3q3CVwAuK
	ZdJTaHeRmQdUfIRCkRl8gDd0hB6I55may5aHEfe1WhZi7Ti8//rXq9Y8SvtBkBCDGVco5pdyZYW
	baPxZhegEe5lYr+7lsavxXxuyASD1W7A7dU=
X-Google-Smtp-Source: AGHT+IHmVda+hYlUcPppcnC9b39ra8GFvlKGc8JKvNVBW8NCXEfbAq8pABFez3hRE40xd6tFdyJh5w==
X-Received: by 2002:a05:6512:3d87:b0:53d:ecfc:306d with SMTP id 2adb3069b0e04-53df00cf62dmr13460297e87.19.1733128180426;
        Mon, 02 Dec 2024 00:29:40 -0800 (PST)
Message-ID: <ce0ff646-94c0-47f8-9aca-ee5b714fc8e6@suse.com>
Date: Mon, 2 Dec 2024 09:29:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] xen: common: add ability to enable stack protector
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20241130010954.36057-1-volodymyr_babchuk@epam.com>
 <20241130010954.36057-3-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20241130010954.36057-3-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.11.2024 02:10, Volodymyr Babchuk wrote:
> --- /dev/null
> +++ b/xen/common/stack-protector.c
> @@ -0,0 +1,10 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <xen/lib.h>
> +#include <xen/random.h>
> +
> +unsigned long __ro_after_init __stack_chk_guard;
> +
> +void __stack_chk_fail(void)
> +{
> +    panic("Detected stack corruption\n");
> +}

That's very little information that'll end up in the log to understand
what has gone wrong.

> --- /dev/null
> +++ b/xen/include/xen/stack-protector.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef XEN__STACK_PROTECTOR_H
> +#define XEN__STACK_PROTECTOR_H
> +
> +#ifdef CONFIG_STACKPROTECTOR
> +
> +extern unsigned long __stack_chk_guard;
> +
> +/*
> + * This function should be always inlined. Also it should be called
> + * from a function that never returns or a function that with
> + * stack-protector disabled.
> + */
> +static always_inline void boot_stack_chk_guard_setup(void)
> +{
> +	__stack_chk_guard = get_random();
> +	if (BITS_PER_LONG == 64)
> +		__stack_chk_guard |= ((unsigned long)get_random()) << 32;
> +}

The hard tabs here make it look like Linux style, when - unless there's a
specific reason - new files want to be Xen style.

Jan

