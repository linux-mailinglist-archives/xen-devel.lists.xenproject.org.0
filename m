Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A77878F6D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 09:05:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691688.1077916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjx8R-0007wI-2z; Tue, 12 Mar 2024 08:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691688.1077916; Tue, 12 Mar 2024 08:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjx8R-0007tr-00; Tue, 12 Mar 2024 08:05:19 +0000
Received: by outflank-mailman (input) for mailman id 691688;
 Tue, 12 Mar 2024 08:05:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=88Ay=KS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjx8Q-0007tl-5i
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 08:05:18 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4291cccc-e047-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 09:05:16 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-563c403719cso6316276a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 01:05:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 sa38-20020a1709076d2600b00a453123b111sm3576776ejc.120.2024.03.12.01.05.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 01:05:15 -0700 (PDT)
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
X-Inumbo-ID: 4291cccc-e047-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710230715; x=1710835515; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EfHZVO2BLVETERud7kLKfDOk+MoyZPE6ri6S0rdi9vc=;
        b=AkY5P5fU/w9I1k53HKdY8qpbKPqPH1GKDkWR7JZ01PzVzyjyyVeBjg2ZBzwNxR5B9Z
         Ice9DQJbnpWgEdKVnRl9m6lo8MLLLQtttyh8yPT0q10dd5NNKQlDLFcemC3bA4AgQlBj
         tb1/594JdrsHdNPZ2IzV3JkfrIv2JuXD4gr676Qwsd431+vDSH4SWdAgW/YRDE02TLaB
         J2Wnsbr6IwGVvfJwn8MoPGbTCi+xV9tGKJfvXUAnrZ0UzXFV/iTozNUL2me8w1q5Y0Wa
         bfSQurcGnVd9rmNJvhEWaX+dlu6i1ljMp3m+3JJ4FzXanGSb8pD3Ex4pZ8oCCJoZgfXb
         mVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710230715; x=1710835515;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EfHZVO2BLVETERud7kLKfDOk+MoyZPE6ri6S0rdi9vc=;
        b=quklJ3s5kZySJ7KnYAErJKhnmE3JjJMyY0cRPObT3BLS9PtHngrtN3MCmdRqoHy0Us
         nm7Vxv4yQcNO92ZfZHK3TPQqitx/EPLqw7oRnsjhHB3AJgV56P3HBvBvnYOZL0QtiSph
         bDI2nUfYWHQkzTlJdpDqiHgXWGlrp6Ps2CgmnPQaYsmTKpmbPi1fqVzFF+jHxk9sAMSC
         yjRN6i0jy9/aU8850cgRP8AFwNjbhex6INmOx0X3+b4oNK/m76/WBQhaXYfczFr04DqJ
         414t6CwA6vRAY6Mc1a80DIrl0jFokku8x3IzJsys4NL3GMGKqMPx1bUIG3/nv9rcCfSZ
         8Jsg==
X-Forwarded-Encrypted: i=1; AJvYcCUImioe3PApWi6rGTUgSBgPHkPlqE50Ac1NQYvv4euyLWgdozpk3xpn5wdraTotTqizlwyEhF9ahvkSHDkhp1pt5juOcYOdBUYlrHHX7lg=
X-Gm-Message-State: AOJu0YxNrtgcWCijsswg49DY8Bkr76j+SoHAfxzIeHeaw6b8GohzrdcZ
	g/KEwJCU378cGqvmGn2G7QA2wf+Ce52LysdiJyeF3z0VwPWbimdBskIxY5z37w==
X-Google-Smtp-Source: AGHT+IFHyLgxPbLb790N0ChakzHvKQ3wnxeo5nLRvK+Yxc+rszRBYdCfPQF7kTSduKXoQ1C5Q5IMBw==
X-Received: by 2002:a17:906:3ac9:b0:a46:2874:ecd5 with SMTP id z9-20020a1709063ac900b00a462874ecd5mr1866010ejd.55.1710230715547;
        Tue, 12 Mar 2024 01:05:15 -0700 (PDT)
Message-ID: <708aad8c-cf06-4a1d-b2d2-d4405cc19213@suse.com>
Date: Tue, 12 Mar 2024 09:05:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/svmdebug: Print sev and sev_es vmcb bits
Content-Language: en-US
To: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org,
 xen-devel@lists.xenproject.org
References: <cover.1710149462.git.vaishali.thakkar@vates.tech>
 <0e688a18a97e495352e2b08cb7634abbc238da1b.1710149462.git.vaishali.thakkar@vates.tech>
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
In-Reply-To: <0e688a18a97e495352e2b08cb7634abbc238da1b.1710149462.git.vaishali.thakkar@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2024 13:40, Vaishali Thakkar wrote:
> While sev and sev_es bits are not yet enabled in xen,
> including their status in the VMCB dump could be
> informational.Therefore, print it via svmdebug.

Yet there are more bits there. I'm okay with leaving off printing of
them here, but it wants clarifying why some are printed and some are
not.

> --- a/xen/arch/x86/hvm/svm/svmdebug.c
> +++ b/xen/arch/x86/hvm/svm/svmdebug.c
> @@ -51,8 +51,11 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
>             vmcb->exitcode, vmcb->exit_int_info.raw);
>      printk("exitinfo1 = %#"PRIx64" exitinfo2 = %#"PRIx64"\n",
>             vmcb->exitinfo1, vmcb->exitinfo2);
> -    printk("np_ctrl = %#"PRIx64" asid = %#x\n",
> -           vmcb_get_np_ctrl(vmcb), vmcb_get_asid(vmcb));
> +    printk("asid = %#x np_ctrl = %#"PRIx64" - %s%s%s\n",
> +           vmcb_get_asid(vmcb), vmcb_get_np_ctrl(vmcb),
> +           vmcb_get_np(vmcb)     ? "NP"     : "",
> +           vmcb_get_sev(vmcb)    ? "SEV"    : "",
> +           vmcb_get_sev_es(vmcb) ? "SEV_ES" : "");

Each of these three string literals needs a leading blank as separator.
In exchange the one in the format string immediately after '-' then
will want dropping. That'll still lead to slightly odd output if none
of the bits is set; imo it would be slightly less odd if you used

    printk("asid = %#x np_ctrl = %#"PRIx64":%s%s%s\n",

instead.

Jan

