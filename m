Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7289FAB57B0
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 16:55:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983025.1369399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEr22-000548-Ri; Tue, 13 May 2025 14:54:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983025.1369399; Tue, 13 May 2025 14:54:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEr22-000510-OW; Tue, 13 May 2025 14:54:58 +0000
Received: by outflank-mailman (input) for mailman id 983025;
 Tue, 13 May 2025 14:54:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHDm=X5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEr20-00050u-PH
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 14:54:56 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b5fbd62-300a-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 16:54:55 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5fc3f0a5506so3222483a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 07:54:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fd1950e6dbsm4773513a12.80.2025.05.13.07.54.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 07:54:54 -0700 (PDT)
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
X-Inumbo-ID: 3b5fbd62-300a-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747148095; x=1747752895; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h+++0xaQaSV6qY7bRFJoTyZqXPWg4nujXKCNe1Ogx1k=;
        b=NZnUQnxvYF/zB7Dq8V8op1qszlezzNyJMVxAD9V0fX2Tfd0cKnZRkcHLGQRDuTpHW+
         2qt8X0C6Zl3BFevMtkgUxgXSHRNWG1e+iecphhL0iSlvgZ0NzPSGmsjycdtszTl4/3lx
         YQ0oz5HVLjEsSWWpyk2A0vgXXF497nxXBIbwNuzJroLu8u32z4E8CU2qaOvRI5Ab9RuC
         Jjb5vGaEpCgR0tozoH57yTpdma92J4eL1CfjwyX+vIPa2m/3NG5JxNL5gz6h4OfjvbK/
         ifwDfjGY8mPgM9W0TnTeCn9g8P9zqBZAnCqoMvgQRs3p59Pi+ink5IZDjyxk2TPflUjA
         VFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747148095; x=1747752895;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+++0xaQaSV6qY7bRFJoTyZqXPWg4nujXKCNe1Ogx1k=;
        b=jebjOrVZVkQYDP1H5Y4huSmdRjW41+eMxFyHd2l5/iTDwfd8ui6eLTiHjcpkUuTXMO
         ekNEXnJh7nN4EdYevkwhThmq2YzzySjWOiwplGeyhkDxEEIe8dzHOs5tYSGnsnY/hHYA
         mc5yNTfZv6Ow/Tnpgiege9V5PoUwL+hxyKl2neUC/KKO2p7mq3f1Kt4LQDmw+Ckh/1+w
         wr90HjhjPqiY7Pv9etgrH1uYbmy1SaiuZ4pwi+elin4l/LJLFQXT7kKoZGhEG56zGNQO
         L+PhbxmebDrvcuU7jrOLoR6e/uLNznaGuCC7BcAO/+Q2rEB/fOkqzexx/kIaC/w2U8AE
         BSTQ==
X-Gm-Message-State: AOJu0YxvTz2/4OA+7egt9yxq+ZCDPhPpH4i1baxLSLMoyLqy35amLdmM
	lqNfNOovSXAGvsnYi53v+1imnP3nqcmOu2ol9A4mHt7HaADJa9445dDZD8sQ0g==
X-Gm-Gg: ASbGnctx5fRO694DLLtr54XUYrA7K0OZOkx8igKq3fJl68BzNVSQyxgCymIDqhziNpv
	DAspajjUfTlYWAyrA2IPezB/zG1tlj9u0eQmvH8pbH/ghC1w8HxR3Az6R7GKGxn8UnvtfyM5jSw
	8Bl44/d7K/ukkFokWWp6GdXDFpzJWyH8PpransdWy40UcXR/YPAxKb01q6pw1acSNXJdyy/cY0p
	EGShUoZUiKbvCviBXbVMPCsvjHJZsTpmztgThSk9ve/KSiVV0K3JmIuonP44NBQaWUHs2YXtMUT
	dHPsPD5xbZuMVfYiav9Cg4FihVKk6zgKAjnhgfaR0jig3FT3hRaOXcq8eB6LaePEf5jJvehj4BY
	zCLkxEzsUdO2iOUX2svgq4O43TeAHley9HxVK
X-Google-Smtp-Source: AGHT+IFepcTsJCpcjIK4yDIPBNJ6TeQDu6F1Rv4OMAZJWLC0wg/eDV/kWkCaI0wZ0+VSWBUdoq5ftA==
X-Received: by 2002:a05:6402:350d:b0:5fb:206f:784e with SMTP id 4fb4d7f45d1cf-5fca0758c0cmr15461357a12.9.1747148094782;
        Tue, 13 May 2025 07:54:54 -0700 (PDT)
Message-ID: <d6208205-0a60-41f1-b7b8-ac12f13ee63c@suse.com>
Date: Tue, 13 May 2025 16:54:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] cpufreq: Avoid potential buffer overrun and leak
To: Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20250512144656.314925-1-ross.lagerwall@citrix.com>
 <20250512144656.314925-4-ross.lagerwall@citrix.com>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <20250512144656.314925-4-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.05.2025 16:46, Ross Lagerwall wrote:
> If set_px_pminfo is called a second time with a larger state_count than
> the first call, calls to PMSTAT_get_pxstat will read beyond the end of
> the pt and trans_pt buffers allocated in cpufreq_statistic_init() since
> they would have been allocated with the original state_count.
> 
> Secondly, the states array leaks on each subsequent call of
> set_px_pminfo.
> 
> As far as I know, there is no valid reason to call set_px_pminfo
> multiple times for the same CPU so fix both these issues by disallowing
> it.

Iirc it's the processor driver in Linux which would invoke this upon being
loaded. It can be unloaded and loaded again. Will it ignore the errors in
such a case? As suggested to Penny for some of her work in this area, it
may be better to return success instead, to avoid the need for following
bad practice in drivers by ignoring errors.

> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -520,7 +520,7 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
>      if ( perf->flags & XEN_PX_PSS )
>      {
>          /* capability check */
> -        if ( perf->state_count <= 1 )
> +        if ( perf->state_count <= 1 || pxpt->states )

Even without the remark above, there probably would want to be two separate
if()s, each with a distinctive comment. The comment that's there would go
partly stale by the change you suggest. Or perhaps the extra condition could
move (inverted) into the outer if()'s clause.

>          {
>              ret = -EINVAL;
>              goto out;
> @@ -534,6 +534,8 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
>          }
>          if ( copy_from_guest(pxpt->states, perf->states, perf->state_count) )
>          {
> +            xfree(pxpt->states);
> +            pxpt->states = NULL;

Please avoid open-coding XFREE().

Further related to the earlier comment: Beyond the processing of PSS there's
more processing below here. If the PSS part succeeded and some later part
failed, it may actually be necessary to invoke this operation again. I.e.
even more so relevant that it won't fail just because PSS was already
processed.

Jan

