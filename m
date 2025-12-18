Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7332CCC3F4
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 15:21:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189710.1510408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWEsJ-0000xc-FV; Thu, 18 Dec 2025 14:21:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189710.1510408; Thu, 18 Dec 2025 14:21:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWEsJ-0000uv-CD; Thu, 18 Dec 2025 14:21:03 +0000
Received: by outflank-mailman (input) for mailman id 1189710;
 Thu, 18 Dec 2025 14:21:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vWEsI-0000up-FL
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 14:21:02 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c33e8b1e-dc1c-11f0-b15b-2bf370ae4941;
 Thu, 18 Dec 2025 15:20:54 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-477bf34f5f5so5057295e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 06:20:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432449ade52sm5067027f8f.41.2025.12.18.06.20.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 06:20:53 -0800 (PST)
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
X-Inumbo-ID: c33e8b1e-dc1c-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766067654; x=1766672454; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DaO9i08OkU05whvdD850C4mWkAu1OL9jIelLce/0NFQ=;
        b=T+/ofYtFKnzpBUyQCsKORTi6aIrJgVaOFJ5oTuPE+7AOX/GhGDYQgxAA1Na9CIMyZg
         QA/T/ieOAm/q/wqb+9Ga5ZWGrDLKy/18nSn805BHhaPRVIycVOiQYdxDlrKqUyrMB3yW
         f8KxKziGpn5ajpaXJz6E64uUBwtbrEZw4ICZIc4tVsemT70Y5UU58jI8O3P9YnHoZEPo
         nfAe9bNqyvhPe/VRTaXtFyRszV9G4G+C0NyZH69F+kHmXfdXEFL44UG+i/UDS4q/cmSx
         w2xzubCVK1Zp0gsbAdLoKm+h0aUCXIpQnzw36JLf2Zscuxx4MRCIo4cJay+9ucN4IY1l
         yJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766067654; x=1766672454;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DaO9i08OkU05whvdD850C4mWkAu1OL9jIelLce/0NFQ=;
        b=PVMrmUBgM17u62K91X/XXjSgpEqm5si+MOwvoMEnzXbgXog9oz6N3FOW2xnIfRBCBy
         cwp1W66+7OUai4B+If/H5fx/M3gMh/3eCGm+TmtZ6v4lE2OHhROlJM4aStxW5ZDv6Lnw
         1nTERwqM951ba5DAGUyuWCTfGZ0nItZxR5LU8Q3Fu4spBG2X+AfAiDqdG3Os0YCebF01
         5Ac99jDnh2TKRj6xx1B2V1KjaH1t5MGhLJHsa6AYUH03oHFtOQ4quBn/A63cXbaSo9/q
         RAHo42SVpfoK2jHSMWyx772x5R027+51WX6GFFR7GTZCDhuJSH7Jq/vdTQdFKkmCqa2k
         6ITA==
X-Forwarded-Encrypted: i=1; AJvYcCXemr8dzS9x4WmyQrv+j1T1Z6Tt1IjcZswh7RIfoMYgfLVvtG24l9bepYbVb+AvuS+SXEmss3/wGYM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YycFAXpf05F5/tK4ZzS3AANfspDUwxeuk48BYx426KtqF6NAT3V
	Dr/WxzaxTPR2TqZmH526vxbpv2y7sfIE5LbXyHWx5O+vUS2Aqdi4k+XR01e66GbgrA==
X-Gm-Gg: AY/fxX6WtFwIqbHMQTHtgMB9fn6xyiLQhZkA1/SMjcuGl3kjkyyxXoanM6nfWWW/S8N
	jMO2gmhpD4WObv/ovtSBs8q12o8j8RDkRWFnGWtIAEeVBA9oU30v0b4abKF6bQCZoROLl9bGtmP
	0Xe3zKqXtNIFbFBQFoODAcLxrzeKaH9QQgbPJ7LVWPKUyDx46D5F5uUbjQybHH9V/boEwY9rm4X
	ClRy7lswHKQeXrR7sv9aNqXd4+LHQcddTGA7mTuetxYHfAf6nwEQPgQF9f7y+JyReg6ru5TjBln
	/A12bQERslDGmboASs0Kcs5nbPsnFsuMDHfqsau1KwAFpaor3ZCY1QWp4yFbD8B9L/eTxfPZlI7
	KGoLbSTm6HvMc8nsElaBL0Q9sWZ60icqaH/HGwoDw7d61e+VkNR8ajA9lOauW7sZwdrVWqQ+fCT
	JmeO1tQUBIRHheZnBIjnYa+yUn0osQLPTJK2zHV7wxoayzBaaHwS/A2WF2QSEUIh6kHKbG1zMfG
	/rETZHoMSFAfg==
X-Google-Smtp-Source: AGHT+IFACwxr0g/Y3TpmLH240B1+d8SiK93Q/xp5LsDTnnhWInjXn88dNPCI0AOR/PAsx3gD4PExpw==
X-Received: by 2002:a05:600c:3b05:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-47a8f8ab546mr226447445e9.6.1766067653565;
        Thu, 18 Dec 2025 06:20:53 -0800 (PST)
Message-ID: <08105722-0920-462a-aeba-a36f8044a5dc@suse.com>
Date: Thu, 18 Dec 2025 15:20:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/riscv: add RISC-V legacy SBI extension support
 for guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1765888425.git.oleksii.kurochko@gmail.com>
 <df7a7e94fba79265138d6cc8d23b1f6b958f5bd5.1765888425.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <df7a7e94fba79265138d6cc8d23b1f6b958f5bd5.1765888425.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.12.2025 17:54, Oleksii Kurochko wrote:
> This commit adds support for legacy SBI extensions (version 0.1) in Xen
> for guest domains.
> 
> The changes include:
> 1. Define all legacy SBI extension IDs (0x0 to 0x8) for better clarity and
>    completeness.
> 2. Implement handling of legacy SBI extensions, starting with support for
>    SBI_EXT_0_1_CONSOLE_{PUT,GET}CHAR.

I can't spot any actual support for GETCHAR.

> --- /dev/null
> +++ b/xen/arch/riscv/vsbi/legacy-extension.c
> @@ -0,0 +1,65 @@
> +
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/console.h>
> +#include <xen/lib.h>
> +#include <xen/sched.h>
> +
> +#include <asm/processor.h>
> +#include <asm/vsbi.h>
> +
> +static void vsbi_print_line(char c)

Misleading function name? The parameter doesn't fit the name, and ...

> +{
> +    struct domain *cd = current->domain;

I guess you copied this code from somewhere, but a variable of this type and
contents wants to be named "currd".

> +    struct domain_console *cons = cd->console;
> +
> +    if ( !is_console_printable(c) )
> +        return;
> +
> +    spin_lock(&cons->lock);
> +    ASSERT(cons->idx < ARRAY_SIZE(cons->buf));
> +    if ( c != '\n' )
> +        cons->buf[cons->idx++] = c;
> +    if ( (cons->idx == (ARRAY_SIZE(cons->buf) - 1)) || (c == '\n') )
> +    {
> +        cons->buf[cons->idx] = '\0';
> +        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cons->buf);

... you also only print a line under certain conditions.

> +        cons->idx = 0;
> +    }
> +    spin_unlock(&cons->lock);
> +}
> +
> +static int vsbi_legacy_ecall_handler(struct vcpu *vcpu, unsigned long eid,
> +                                     unsigned long fid,
> +                                     struct cpu_user_regs *regs)
> +{
> +    int ret = 0;
> +
> +    switch ( eid )
> +    {
> +    case SBI_EXT_0_1_CONSOLE_PUTCHAR:
> +        vsbi_print_line((char)regs->a0);

The cast isn't really needed, is it? And just to double-check: The spec demands
the upper bits to be ignored? (A link to the spec could have been useful, e.g.
in the cover letter.)

> +        break;
> +
> +    case SBI_EXT_0_1_CONSOLE_GETCHAR:
> +        ret = SBI_ERR_NOT_SUPPORTED;
> +        break;
> +
> +    default:
> +        /*
> +         * TODO: domain_crash() is acceptable here while things are still under
> +         * development.
> +         * It shouldn't stay like this in the end though: guests should not
> +         * be punished like this for something Xen hasn't implemented.
> +         */

Question then is why SBI_EXT_0_1_CONSOLE_GETCHAR gets a separate case block.

Jan

