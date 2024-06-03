Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 516498D7B1A
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 07:59:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734690.1140770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE0iL-0002lo-4V; Mon, 03 Jun 2024 05:58:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734690.1140770; Mon, 03 Jun 2024 05:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE0iL-0002kJ-1Y; Mon, 03 Jun 2024 05:58:37 +0000
Received: by outflank-mailman (input) for mailman id 734690;
 Mon, 03 Jun 2024 05:58:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=29W0=NF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sE0iJ-0002kD-HF
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 05:58:35 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f1dd34d-216e-11ef-b4bb-af5377834399;
 Mon, 03 Jun 2024 07:58:33 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42134bb9735so15126915e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 02 Jun 2024 22:58:33 -0700 (PDT)
Received: from ?IPV6:2003:ca:b724:4976:f1a7:a03d:19f7:6554?
 (p200300cab7244976f1a7a03d19f76554.dip0.t-ipconnect.de.
 [2003:ca:b724:4976:f1a7:a03d:19f7:6554])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4213ab7ca26sm38200405e9.25.2024.06.02.22.58.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Jun 2024 22:58:32 -0700 (PDT)
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
X-Inumbo-ID: 4f1dd34d-216e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717394312; x=1717999112; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IPvT6jy0s4j9O9+2tmG66NrXggrPlQni7x5Sszi+yxI=;
        b=FwXlLfXypTNdvFWyiH1QUQ8IOEnE2p3BtojFuCzEAF5IaaNh5pKw8ufvi2kdr/JoZ7
         KHdm2RiZEeUu5k6PbnC/YjaoMRm5JEKnb6/Jsau6mDEZ3RkL0VJnifrmvDcBwg3cEmOX
         rRyLoV8ioq13cc0Pc6kGZgcNHInltFF+5iWMeeCZnTz8CRwkdIJgLFO1reg2uFIuP67v
         3DwTOyYQK37eacSAaj/qe5N8G7xnPmGXq/Peiygdtxi7QcHfZuzlFTkz0OXTb+r63ME+
         AqNeD0bEer7WaeJb/kwGgIiOUdu8uPuKK07wObpZ3gKwW3gqFV3cm9A0E50/1cHDTgEQ
         V3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717394312; x=1717999112;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPvT6jy0s4j9O9+2tmG66NrXggrPlQni7x5Sszi+yxI=;
        b=SvLkRHX3L8Xpiq83UOojdEt75y8uSIgz7qT1lkgI7oQ0Xyl9nDMpxkkUwBP/8jVZrh
         YwTaS+muRfwheFEP566eNvtmXfWslTJxyeoEV/CaO2ncqXcMljdrhxCf8Xn7PAqTMXGW
         G9hQxapTe/EbDUy5t2Voh9IOA52S7xnY70q7+uf1vkN/146J9yBX0LU9hDrbNsYjCyJ+
         6kdT7idw1z7O2OTeu++pTfIBFfvdzbUB0pWddGz/ZowuSNW0sjSheSNGh4bUjsTJaCzK
         vSYTS3vx8uxcygs5jHmC2a59BxtQuxNo/5bxN55SJCtu1FToTqsCqRQXYFhI2dhRUBCz
         X5hw==
X-Forwarded-Encrypted: i=1; AJvYcCX6tufW9Nbjy9aVUwDDwne1wh6+E/CKJKfN/Nn3OmbcT8tBz1G6ZnBMWaFsg8nQycUaUcsdHytfUkbyxjylu5gBezL9Hk3HctMcd5Czm7U=
X-Gm-Message-State: AOJu0Yyzc1HCYkza27lZy4emiUvHDqE4DOQcboAd7jLg3fiMifsHXoZN
	xuqkpIqxJH7df/xk7dK+xzSnO8D916LXUP6Zv5lnlUx6oNF8fVfLrVctCv7gyQ==
X-Google-Smtp-Source: AGHT+IFKWAamOY0F3twXzaGHTrkpI3MeQIoceCYLoX6cqL9weHF+ij89NL0mb/YCViqq55bGudNjhA==
X-Received: by 2002:a05:600c:19c9:b0:41b:e84d:67a3 with SMTP id 5b1f17b1804b1-4212e0065e0mr66128555e9.0.1717394312362;
        Sun, 02 Jun 2024 22:58:32 -0700 (PDT)
Message-ID: <90c40d6a-d648-46bb-9cb0-df11ac165bd7@suse.com>
Date: Mon, 3 Jun 2024 07:58:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 4/5] automation/eclair_analysis: address remaining
 violations of MISRA C Rule 20.12
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
References: <cover.1717236930.git.nicola.vetrini@bugseng.com>
 <ba7e17494f0bb167fe48f7fe0a69fabc1c3f5d1a.1717236930.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <ba7e17494f0bb167fe48f7fe0a69fabc1c3f5d1a.1717236930.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.06.2024 12:16, Nicola Vetrini wrote:
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -483,6 +483,12 @@ leads to a violation of the Rule are deviated."
>  -config=MC3R1.R20.12,macros+={deliberate, "name(GENERATE_CASE)&&loc(file(deliberate_generate_case))"}
>  -doc_end
>  
> +-doc_begin="The macro DEFINE is defined and used in excluded files asm-offsets.c.
> +This may still cause violations if entities outside these files are referred to
> +in the expansion."
> +-config=MC3R1.R20.12,macros+={deliberate, "name(DEFINE)&&loc(file(asm_offsets))"}
> +-doc_end

Can you give an example of such a reference? Nothing _in_ asm-offsets.c
should be referenced, I'd think. Only stuff in asm-offsets.h as _generated
from_ asm-offsets.c will, of course, be.

Jan

