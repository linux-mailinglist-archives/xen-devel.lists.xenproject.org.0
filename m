Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9939152A7
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 17:40:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746787.1153980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLlnN-0004iR-OS; Mon, 24 Jun 2024 15:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746787.1153980; Mon, 24 Jun 2024 15:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLlnN-0004gK-Jv; Mon, 24 Jun 2024 15:39:53 +0000
Received: by outflank-mailman (input) for mailman id 746787;
 Mon, 24 Jun 2024 15:39:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLlnM-0004gC-2E
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 15:39:52 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id febfd656-323f-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 17:39:51 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ec002caf3eso66106821fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 08:39:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70690b37fabsm672594b3a.1.2024.06.24.08.39.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 08:39:50 -0700 (PDT)
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
X-Inumbo-ID: febfd656-323f-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719243590; x=1719848390; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tj4zI2GZ67oH9YMXRkbGvk6m3r1bXu3FxAJ+dIdPskU=;
        b=BSDaR5ayQZG1t0aB/V2hs50Ga5yrcs4zK+5usLYwJWDVn+EqvAY3IDtXO3hrWb4oSe
         0mj+gZgB/qQ1oOy58buFCc6zAWqto22Vo91KlkHchu4CQaSLviXjfRamDi+3qtcmjRWj
         GyS6h9Z6KTGlBt/aNsgamQ8dSg8dF4Gjfc4UokURQ0jZTO1qIgi3zbp+fFvfmiUmBEWp
         INs3DNfVOuT8WjkZz7cjDWIGxFfEK6fOwycjQX3fzNlx1yP8agpDBy2aflNBGN/5OhWT
         9eZXtccimV1bqlG2khx43DyS24PzuOmdu8Zgj0kLnrj/2cP4cEB3JapMIaXEsGLVkC3R
         HJlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719243590; x=1719848390;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tj4zI2GZ67oH9YMXRkbGvk6m3r1bXu3FxAJ+dIdPskU=;
        b=Cot2OlaI/ldT4C7LvYD686HvKLykuvRiwvStaBPDalfp29t4ql3v8gHYrWytN6MDfR
         kOjLZlChmf+Mw9upoXqJoa5L5yXG5vVjH+XmlpgMx7J+BxzTf/WFUHGI7DzXx4rlaNix
         ap3ZXbqTpkmUnmHqfFCxIejKIhWRds2X0nDISSft8Q0nCo9EeoVuoXZMmvPsZK6yPW3W
         CJFxNTRTxcV6z79aBr/wzz5hPOTNNWQv0qBcOwKOszZluAjHVVMiuz6HxTXnpYYzCRVi
         9X6Py0wfU7+RDQQX6p/tOtmavu2sHkRY+LAv2bWwAJ5nGazO4anDpic588gs2qC+uqIs
         nN6g==
X-Forwarded-Encrypted: i=1; AJvYcCUFRjNgBJN3olEwfCGcwpk/P83dQihVqixuVfByfbSCKVyFhe3YifdUrQZXiXkkjYX5pgjvRHMC3wiyRiZsUXPAZN/MulIhq9T3sU3EErs=
X-Gm-Message-State: AOJu0Yw2nQL8LuxSMaZXWrq/h0NG663xuToBMcWDk0jy6EegdmSjuG3B
	zWggLICXeElNw6mKa2IaxO4uxK5fqPoSsQSs8lM2hietyjI2+0dfzf/Ln0FjFw==
X-Google-Smtp-Source: AGHT+IExCypMDn22LVbzFwPHYV4dyN8AtYVDl2zIEN953g28HqxGuFwLyYzOZ43VDuXnAEVou56fUA==
X-Received: by 2002:a05:651c:1055:b0:2ec:efb:8b60 with SMTP id 38308e7fff4ca-2ec5b2d480amr37451551fa.13.1719243590587;
        Mon, 24 Jun 2024 08:39:50 -0700 (PDT)
Message-ID: <3ba59d21-bf67-4585-8e94-5a01cff18ec3@suse.com>
Date: Mon, 24 Jun 2024 17:39:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 09/13] x86/mm: add defensive return
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1719218291.git.federico.serafini@bugseng.com>
 <f3adf3d5dac5c4c108207883472f3ebcfa11c685.1719218291.git.federico.serafini@bugseng.com>
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
In-Reply-To: <f3adf3d5dac5c4c108207883472f3ebcfa11c685.1719218291.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2024 11:04, Federico Serafini wrote:
> Add defensive return statement at the end of an unreachable
> default case. Other than improve safety,

It is particularly with this in mind that ...

> this meets the requirements
> to deviate a violation of MISRA C Rule 16.3: "An unconditional `break'
> statement shall terminate every switch-clause".
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>  xen/arch/x86/mm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 648d6dd475..2e19ced15e 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -916,6 +916,7 @@ get_page_from_l1e(
>                  return 0;
>              default:
>                  ASSERT_UNREACHABLE();
> +                return 0;
>              }

... returning "success" in such a case can't be quite right. As indicated
elsewhere, really we want -EINTERNAL for such cases, just that errno.h
doesn't know anything like this, and I'm also unaware of a somewhat
similar identifier that we might "clone" from elsewhere. Hence we'll want
to settle on some existing error code which we then use here and in
similar situations. EINVAL is the primary example of what I would prefer
to _not_ see used for this.

Jan

