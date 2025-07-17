Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF66B0867C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 09:23:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046266.1416569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucIxW-0002Ea-4z; Thu, 17 Jul 2025 07:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046266.1416569; Thu, 17 Jul 2025 07:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucIxW-0002Cv-2D; Thu, 17 Jul 2025 07:23:14 +0000
Received: by outflank-mailman (input) for mailman id 1046266;
 Thu, 17 Jul 2025 07:23:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucIxV-0002Cp-03
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 07:23:13 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4753da7-62de-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 09:23:10 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a6e8b1fa37so436984f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 00:23:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4285ed6sm136671735ad.25.2025.07.17.00.23.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 00:23:09 -0700 (PDT)
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
X-Inumbo-ID: e4753da7-62de-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752736990; x=1753341790; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nQHVVel9fWfxqXJGS4NGCuRsBW4m3tr7F/NxEDu7SIU=;
        b=a8ghX0aOfxIhIDCNTRrMSWvXWZDp8liHjujyCN3QSupp1OUFDhEFL2LpOYTfqYTDL3
         cWPmIPb/r7FyWFgEFAFESv9LiiDU6y9ABC10aL5RIt6dXtiujJZ1alweOpicIiQt0f/L
         SmTcuhTgbSQvpXNZlHu3XbpWh27ZIgE+DocPKA3PwYnOqC/GNUsPkowIfnOB09IpUDK5
         ab2lstSGiVkTD1q3kw2c+co5Dd3pKlMGI0Y/AsaJm/bzV8ZDka8cWs5sR+bDR4+lOIfu
         TZN+mE3v9249/cT2b9mM9gJra6usWnmLCO0Xhp3ekrFYGjxHesV1gLzkXKq9jjFI5D88
         iymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752736990; x=1753341790;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQHVVel9fWfxqXJGS4NGCuRsBW4m3tr7F/NxEDu7SIU=;
        b=b7xvDqgN90tSS5mm79xuM8arv9iMiVXbHDgxhk2Sudq0lY5RBvZGdRI6Q5jUiHeSNB
         NoRhkVQGZ1ElwuPYSq+F8opk2Q7UXX7HtiFNfNNVd+fKlRVo7f1GmVXEsFB/U/chv2G0
         aXpAeX7ppetykhF+d6aafWVkob9zyYlK8wXgnADufmnJWd8LpyfRMgvBlpp36hMrtbPz
         cSbBpDf5rXXOTBd9+UbDxPHNr9mhnNL8J7nTBfueU4ov3ZagKoFYyarNqtQdKkxyHZUZ
         3GGRBeH4crJYh93gB0KhF+TEz6ghP3z3rorBSQwW04bTU8LJcmC2VNpPZ0gu3A+tr3Y5
         oKyg==
X-Forwarded-Encrypted: i=1; AJvYcCXATrjNmVwyb2zLnYbJWZ68pSJy7He2/FEUlv19b3Hf24MKBHw4QCMc2l3gG30bg5hWgVYcc11DxNM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwjcqOwbiAeEfR6AZMJXCDnFtG4sGeQKawp7ZhQbBhfmSVcrF+H
	u/v8EvwmvTpALMjveHBO8nCHwngpoFfgUgf7aSgjvLmNe7rsSJiMMClAPQghr1OayA==
X-Gm-Gg: ASbGncuyFD4w22bhyXnLPixpEpV8iBRzx5sragBLakPuOPPuO8QiwZXpIe4x/EdFIKM
	4pwwZPZ+VYgVt1LqmziQyMopGs2yGYetHfAmgrWXnZw4lfybH588U3wIRMEdeFHEF/AUWnXjekV
	qqVRx5sHP9VLxbV+EKz3i8ruz1onIm/5uDYfIB0avXfzV+o0EFM3hVKvs75HlDomXNEyjOMnUUL
	us6tmZAsdV/zJEI+pm9bqtoFkp+lqXJyu28DhR2pcwxBW9MqCvvEgnpq6xy0+4vsQTG355511UO
	K6pcQuh1IIZEZfU1xK9yVCOnDNn4BGM4EAJlxMItFNLJAYaXGEshtYw1A0uZsW9JuOrCZ744st2
	YK6pydzYS5NJ98EG+CKnrYOmPm7lo7K1Jq9EAGkUM2jqSmTY5YKL24Zozmp/1nQ2weMTu9yrgCB
	kwHNv86MY=
X-Google-Smtp-Source: AGHT+IEZu5OvfEU99FqtaYM4lDMyjxa/kYEIqlRUB99Jd2ibg4ekqV0zEEWlUCtS4oEiN0i9PFaYoQ==
X-Received: by 2002:a05:6000:288a:b0:3b2:fe84:a10 with SMTP id ffacd0b85a97d-3b60e440dddmr3926297f8f.0.1752736989857;
        Thu, 17 Jul 2025 00:23:09 -0700 (PDT)
Message-ID: <6e1a6ee3-033c-4b44-bb50-be3e90026a8e@suse.com>
Date: Thu, 17 Jul 2025 09:23:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] x86: Break struct x86_cpu_id out of processor.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
 <20250716173132.2213891-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250716173132.2213891-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2025 19:31, Andrew Cooper wrote:
> Only 5 files use struct x86_cpu_id, so it should not be in processor.h.  This
> is in preparation to extend it with VFM support.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with two nits:

> --- /dev/null
> +++ b/xen/arch/x86/include/asm/match-cpu.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef X86_MATCH_CPU_H
> +#define X86_MATCH_CPU_H
> +
> +#include <xen/stdint.h>
> +
> +struct x86_cpu_id {
> +    uint16_t vendor;
> +    uint16_t family;
> +    uint16_t model;
> +    uint16_t feature;
> +    const void *driver_data;
> +};
> +
> +/*
> + * x86_match_cpu() - match the CPU against an array of x86_cpu_ids[]
> + *
> + * @table: Array of x86_cpu_ids. Last entry terminated with {}.

This reads slightly odd to me: I'd have expected "Last entry needs to be ..."
or "Table terminated with ...".

> + * Returns the matching entry, otherwise NULL.

Perhaps add "first"? Due to use of wildcards, multiple entries could in
principle match.

Jan

