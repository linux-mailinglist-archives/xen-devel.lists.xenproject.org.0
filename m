Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12900838D43
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 12:19:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670380.1043112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSEnu-0003n4-U2; Tue, 23 Jan 2024 11:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670380.1043112; Tue, 23 Jan 2024 11:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSEnu-0003kI-Qb; Tue, 23 Jan 2024 11:18:54 +0000
Received: by outflank-mailman (input) for mailman id 670380;
 Tue, 23 Jan 2024 11:18:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9pmr=JB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSEnt-0003kC-Db
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 11:18:53 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3043edf5-b9e1-11ee-98f4-6d05b1d4d9a1;
 Tue, 23 Jan 2024 12:18:52 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2cf1524cb17so4310071fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 03:18:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t15-20020a05663801ef00b0046d4105b7e8sm3535097jaq.49.2024.01.23.03.18.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 03:18:51 -0800 (PST)
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
X-Inumbo-ID: 3043edf5-b9e1-11ee-98f4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706008732; x=1706613532; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LgTlDuWTx9Av8T+5zpz2+6w96kIyvbiIwt9d1nsglRk=;
        b=JLttFsMNzLDr3r/JTaH6koyxRQzF9Lj7Hs0p6uJu2nsqCVUltt71/aDAKEgR+eY5ys
         VQPvxx7suJQjj0sEhw6mmPJwYvk2+MX3JxSPQoB7vUT25IHYSX+gXAERRqJ8KOMfYmSn
         UZ429YnfYpGqL8ysEWwdqw7ude8FtkgpnwuDXC5TkzPLUaP0PCcscUwmiLAasQATndNe
         Q/4/sBlVfHnkUZAfLdgfo+cFtGjJMyKUmAcR67Ko27sUk3d+tLa8Cp/uaD4GHUSAH6ih
         L0P2tDFyM4bZ9fOA3iT6+4DS78M6MaE2VuRUVEB9YUb5aPoVNQlP/iAZSjHW9BQlKusr
         5Urg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706008732; x=1706613532;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LgTlDuWTx9Av8T+5zpz2+6w96kIyvbiIwt9d1nsglRk=;
        b=pgmvvXeFQxTtbzh1+bnrp6WyD9TRxqkpaVB0/vpxCkIy0rrOhnMpz0Z93EY+tuGfZn
         yZlPyDCGQRN7ytbVj2RDR8z5XcNcrG7jqkb0YYJnz+SK+TZgDw8dC7JF4Hl9sD1c80IC
         Fo0ir3REpML4z94NyPMjRPmFqKOgoFNEfmLU+iy6Z/0QEL6sYEXZU+U3HuJVzTpWxJnS
         yjytdYeA381XSYPxikopNcCOn7ptdVWSXN6KXxsRmIJzVIFxxnusLAqtY4jfUJCbSKR1
         YouWGdrcoLbN8tYuwuk7cdac0GI7UldbGhe8Hk9haQ9M2GInJPbcKN3ztfD6Stba/L6r
         AP3g==
X-Gm-Message-State: AOJu0Yyo4QXOhaiSIgLM4atdoXKecOwWCoNcNPHnrSYAWTkmDpEzwQ4Z
	yZIotz0hTDJrvmh2nWavC3eYujW1vWNKlRU/wXgTO/bd+iSvlM23SfE0B/IjVQ==
X-Google-Smtp-Source: AGHT+IHdwauVDiUPEI/JNa5+mEH51/q0r4WOTGudh3oRxqHbrsTTFLVDx5wyu22kOqTTGX7n8+YBYw==
X-Received: by 2002:a2e:a54e:0:b0:2cd:f5d3:11db with SMTP id e14-20020a2ea54e000000b002cdf5d311dbmr2755524ljn.82.1706008732042;
        Tue, 23 Jan 2024 03:18:52 -0800 (PST)
Message-ID: <a9e80aeb-67e1-453f-b8be-1c6295d95dff@suse.com>
Date: Tue, 23 Jan 2024 12:18:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/34] xen/riscv: introduce irq.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <11613eb5a0378315d70fc2f4d4f744ede579cca3.1703255175.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <11613eb5a0378315d70fc2f4d4f744ede579cca3.1703255175.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2023 16:13, Oleksii Kurochko wrote:
> +static inline void arch_move_irqs(struct vcpu *v)
> +{
> +    BUG();
> +}

As I think you said you're doing the conversion already - with this
becoming the "canonical" BUG_ON("unimplemented"):
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

