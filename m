Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E212D975278
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 14:35:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796542.1206195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMYs-0000zv-OM; Wed, 11 Sep 2024 12:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796542.1206195; Wed, 11 Sep 2024 12:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMYs-0000yQ-LU; Wed, 11 Sep 2024 12:35:06 +0000
Received: by outflank-mailman (input) for mailman id 796542;
 Wed, 11 Sep 2024 12:35:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soMYr-0000yK-NS
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 12:35:05 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4576056e-703a-11ef-a0b5-8be0dac302b0;
 Wed, 11 Sep 2024 14:35:04 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a8a789c4fc5so146137566b.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 05:35:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9012cf16absm55584466b.147.2024.09.11.05.35.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 05:35:03 -0700 (PDT)
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
X-Inumbo-ID: 4576056e-703a-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726058104; x=1726662904; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M89bF/9r0/e5NiN9PSqpu99XZd1VWC+TeeYrtg0DgHc=;
        b=PFtvkGe0yp9BUbOZfo+fWHt+UDhedInVmFexDCYE5NpblHppYtCOPk/li9DKCcA+bY
         yNvtDbr1cSkws0axwTedvMEmq4xGDRwlR4Qd40ixDuUyswNA+190P5oavjhMuy/avm3+
         Kw/ftJcrRxv8STnX2eQGSERfmHK7g53FgJETZ149DbXLMdmfj2qp18PpX2R2q4zmWCCV
         X21cfpkrzRv5bSn7QXRSWfsYi7bH7+0oHYJtjuNNG2kJ2MS62/gnb+MGrAew1zb3KASb
         2ZBqTzjCWFbM4+9yIMV8K4zGEvyTQtwvTFw8LZkgCCdPq7L/WnBCTn916Sl9tSW3xgDX
         ZBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726058104; x=1726662904;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M89bF/9r0/e5NiN9PSqpu99XZd1VWC+TeeYrtg0DgHc=;
        b=pxNoyB9MQTiUAfkQnXMbdfCeCmJRWD3IxMTewmthwuwXGnm9e7SQ5WO/G13ZswemFX
         +782CAZTO4C3nDXyulyxyTuWjZQVGJePS5DsNgFa+hlcHGjDczkl9wvE2yit4KiYVmh0
         cKfIGmuex/+8wnx8NIpbevMxOCGy3nu+HBuWAqrcO7woIVyUTSEEOrBdvuWHwZRWT8bH
         0UcAfLaEUgc3ssutRrSX8uebcihj0bTW1Zkko0rRSCaWWEp5cG/fgPNrURcgA9F9KqEy
         pJuupjZpgPQ6v0M8IjNY7cZkaejsnBoG6eKiwXSMWIN2zzeufZ9PBhJUrZUitMtyy0vP
         0Vfg==
X-Forwarded-Encrypted: i=1; AJvYcCUjskY5+W5xSGpcS5Rxbw3j9E6VNQ513KL1K2h/joAuzKv1TNrPLfEWksLKEs05V6OaJ6l8dhYXq1U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRsts3nRODJovfA3VL3zJxfktFN7W9QvsKUtzGcgrUlT5XhVjF
	gGXmMBZJH6jBuHAn1N8mtnqSzKV2sXaFrWe+Tnq4ahGxNH2BB8HvlfBSuOLtWLHwq4B6ek1UyyY
	=
X-Google-Smtp-Source: AGHT+IEIznIsCzTm1V0iTon8gyZvVspa12of6JaD+tvocF1gnTAu7WaPTAjEq/f4lR4CtFt6oVj8dw==
X-Received: by 2002:a17:906:6a19:b0:a8d:ee9:3888 with SMTP id a640c23a62f3a-a8ffae3b788mr404146966b.32.1726058104162;
        Wed, 11 Sep 2024 05:35:04 -0700 (PDT)
Message-ID: <764e2c7b-f663-4b0b-95f9-c341d82dd36c@suse.com>
Date: Wed, 11 Sep 2024 14:35:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 08/12] x86/emul: add defensive code
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1725958416.git.federico.serafini@bugseng.com>
 <f5d7929f8919eda3914bcf566d7538e64487cc2d.1725958416.git.federico.serafini@bugseng.com>
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
In-Reply-To: <f5d7929f8919eda3914bcf566d7538e64487cc2d.1725958416.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2024 12:09, Federico Serafini wrote:
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -6831,6 +6831,8 @@ x86_emulate(
>              break;
>          default:
>              ASSERT_UNREACHABLE();
> +            rc = X86EMUL_UNHANDLEABLE;
> +            goto done;
>          }
>          break;
>  #ifdef HAVE_AS_SSE4_2
> @@ -6859,6 +6861,8 @@ x86_emulate(
>  # endif
>          default:
>              ASSERT_UNREACHABLE();
> +            rc = X86EMUL_UNHANDLEABLE;
> +            goto done;
>          }
>          break;
>  #endif

"goto unhandleable" please in both cases, if already further goto-s are needed.

Jan

