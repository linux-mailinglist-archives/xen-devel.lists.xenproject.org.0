Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F1096E9AA
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 08:04:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791554.1201445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smS4Y-0004LY-9U; Fri, 06 Sep 2024 06:03:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791554.1201445; Fri, 06 Sep 2024 06:03:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smS4Y-0004J2-6H; Fri, 06 Sep 2024 06:03:54 +0000
Received: by outflank-mailman (input) for mailman id 791554;
 Fri, 06 Sep 2024 06:03:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ayfn=QE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1smS4X-0004Iv-3N
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 06:03:53 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8f216be-6c15-11ef-99a1-01e77a169b0f;
 Fri, 06 Sep 2024 08:03:50 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a86883231b4so239119966b.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 23:03:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a61fbad9dsm225705466b.31.2024.09.05.23.03.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 23:03:48 -0700 (PDT)
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
X-Inumbo-ID: c8f216be-6c15-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725602629; x=1726207429; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zVwKlxCTwU2T3+wH/+7c3ZnI9DV9xuObjjguB16tIss=;
        b=JgWxfIwU0ydui36R5iTX+RmWvMZoR5JWgd3V0N6n85WOcoFt3C/hSX9RJOWQ6ESwWJ
         xk2d4jiixw/YAHY+Jf4nqTRChJ5D/sLWHjMdNx8ywLygFYbNgyahARSION5f6egR6HZ9
         7pjS7zovCH5KL8pbSmccKOemNZq0jGzD76FwN5bP/e+GdTAbJVki0qMbAfjo8BQIuuPm
         yId4ko7coNBRDVb21Az7ebhgGDW+bxiOcyGrhmc88NUQ2cu3m98jvpz9AbQCr9JZFjEH
         qB8AfbJ/4bsKVFNwkbCcitB6hSdP/qsRrFZlfe2fsseYkwR9I82tgY/WWplFu7rFIjfm
         SOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725602629; x=1726207429;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zVwKlxCTwU2T3+wH/+7c3ZnI9DV9xuObjjguB16tIss=;
        b=hp1AeDCjMpohTmitWzPnyWrW6dD3PRT257dolwNk5hG+3Jg8T1qEkCX4nfTa810fH8
         1nwH3vjce2XnL2cUDN2EZFc1eZNhNL2hmAQmC2Jnhwmux2zZ9M/zF3YUzD6wfAlYTw6H
         iYdKzVEeSR5Lf2nfDKTkfbBD4wbj25Vp3KfpME0pGZ6nUIRgCcqslalvGwp/81QIcejq
         Z9odoBVPQxqNX9BX2QvrhSQnsev3/HwRlDjWZV1IfbnEU9fhqL7ZlG4p+pxba5zAa63B
         qaIGfklKO205b2O8YSGUfNsQQ+hiDci82IZLXZub+6wsl8nEGfAsJ1mSGmq4Wkov5CNE
         qQQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVl7I2QrEWzQUdp0VpsXGOnHFG/9XAxrORcXor5yyUZTaw0Dn+cdhrLGH5pDXzc6x6DMIldPNQarT8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwvFoXqXJnFAn7toin0XOIFYdyZHhbm8f+y7+tiZURBp353qNYG
	000+ZvJfpp6NtbFv/Mnmry8JG6SWBWi8CP5wTAeC7DG2ZCqqmS4V9TNi0vYFOw==
X-Google-Smtp-Source: AGHT+IHKp4IHs30ecNt9wnyuxQO309PuThKJ/RkGbC9ZYUqu19ZDxS2io3iqMz3A2E9XD37mvzxgiQ==
X-Received: by 2002:a17:907:36c9:b0:a86:8059:58a8 with SMTP id a640c23a62f3a-a8a8866835fmr108185666b.38.1725602628742;
        Thu, 05 Sep 2024 23:03:48 -0700 (PDT)
Message-ID: <be454840-76ae-409a-89c5-255cff3be00a@suse.com>
Date: Fri, 6 Sep 2024 08:03:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair_analysis: address violations of
 Rule 18.2
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <e36f121a91d229ca5edfc8102c4513c2e0530230.1725554126.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <e36f121a91d229ca5edfc8102c4513c2e0530230.1725554126.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.09.2024 18:37, Nicola Vetrini wrote:
> MISRA C Rule 18.2 states: "Subtraction between pointers shall
> only be applied to pointers that address elements of the same array".
> 
> Subtractions between pointer where at least one symbol is a
> symbol defined by the linker are safe and thus deviated, because
> the compiler cannot exploit the undefined behaviour that would
> arise from violating the rules in this case.
> 
> To create an ECLAIR configuration that contains the list of
> linker-defined symbols, the script "linker-symbols.sh" is used
> after a build of xen (without static analysis) is performed.
> The generated file "linker_symbols.ecl" is then used as part of the
> static analysis configuration.
> 
> Additional changes to the ECLAIR integration are:
> - perform a build of xen without static analysis during prepare.sh
> - run the scripts to generated ECL configuration during the prepare.sh,
>   rather than analysis.sh
> - export ECLAIR_PROJECT_ROOT earlier, to allow such generation
> 
> Additionally, the macro page_to_mfn performs a subtraction that is safe,
> so its uses are deviated.
> 
> No functional changes.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Macro page_to_pdx is also the cause of some caution reports:
> perhaps that should be deviated as well, since its definition is very
> similar to page_to_mfn.
> 
> Relevant CI runs:
> 
> - arm64: https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/bugseng/xen/ECLAIR_normal/MC3R1.R18.2/ARM64/7754928624/PROJECT.ecd;/by_service/MC3R1.R18.2.html
> 
> - x86_64: https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/bugseng/xen/ECLAIR_normal/MC3R1.R18.2/X86_64/7754928613/PROJECT.ecd;/by_service/MC3R1.R18.2.html
> - x86_64 (without page_to_pdx reports): https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/bugseng/xen/ECLAIR_normal/MC3R1.R18.2/X86_64/7754928613/PROJECT.ecd;/by_service/MC3R1.R18.2.html#{"select":true,"selection":{"hiddenAreaKinds":[],"hiddenSubareaKinds":[],"show":false,"selector":{"enabled":true,"negated":false,"kind":0,"domain":"message","inputs":[{"enabled":true,"text":"^.*expanded from macro `page_to_pdx'"}]}}}
> ---
>  automation/eclair_analysis/ECLAIR/analyze.sh  |  6 ----
>  .../eclair_analysis/ECLAIR/deviations.ecl     | 11 +++++++
>  .../eclair_analysis/ECLAIR/generate_ecl.sh    |  3 ++
>  .../ECLAIR/generate_linker_symbols.sh         | 31 +++++++++++++++++++
>  automation/eclair_analysis/prepare.sh         |  6 +++-
>  automation/scripts/eclair                     |  3 ++
>  docs/misra/deviations.rst                     | 10 ++++++
>  7 files changed, 63 insertions(+), 7 deletions(-)
>  create mode 100755 automation/eclair_analysis/ECLAIR/generate_linker_symbols.sh

Nit: Dashes instead of underscores in names of new files, please.

Jan

