Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA8281307E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 13:46:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654562.1021584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDl6T-0005lK-As; Thu, 14 Dec 2023 12:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654562.1021584; Thu, 14 Dec 2023 12:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDl6T-0005j8-6O; Thu, 14 Dec 2023 12:46:13 +0000
Received: by outflank-mailman (input) for mailman id 654562;
 Thu, 14 Dec 2023 12:46:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDl6R-0005j2-B5
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 12:46:11 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0f04129-9a7e-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 13:46:09 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a1f6433bc1eso112589466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 04:46:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 sa16-20020a1709076d1000b00a1da72b8752sm9274533ejc.212.2023.12.14.04.46.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 04:46:08 -0800 (PST)
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
X-Inumbo-ID: c0f04129-9a7e-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702557968; x=1703162768; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lsyAzTx9akiZfijKEWKipOctHdoPXGdStYQoTmxwkGU=;
        b=eStyOKTsV5WnerSd/USp5Mq5Pw2EmB2K7k68I/gzokcXlopB/CORCFtiiszjC20C/Y
         KhmQxviyPP4bkq5l0WQqfSHltTFnkFNYk1AoUTZDe2bkwBs6b2EcBp51fiM5uKb5oyqR
         YC6FLarNXhTKoifOI2gWrs1e3RoSDzaKylAP2GZzWlURdPSMzwAygAzH4xo6KVkJXMpU
         UraN2/leefd5ao16diTxjOdkUwm8zNwtmL953Bf6FeFyFk81JbWZaXNXTOx7kd1zCM5d
         cBXnQaAAJrslXgHdePKvtxaTsFuTU7REg3PPJAQOHCrXVtfuUQhAHbDYUHTmpVStbsdm
         5PbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702557968; x=1703162768;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lsyAzTx9akiZfijKEWKipOctHdoPXGdStYQoTmxwkGU=;
        b=sTvq2nPJkYwJQgsWZUO0qMujfiY6GvxRLVn/pWsHzZp7D72dGwJItt8hJWX27HaaKG
         li0OXOqsyqr9yLknXAcHuo7orgd68r022ohq0xN2ZZbqezT+kufdyZBi9B45Wwlr/vAz
         yJKAnxocuGjCvyvskx1MIatW5R46svimhgHPkB0jwhVFmOBJZRyrFvhvIJ4GcJttG39H
         8mju68NQ6JB1um4wjkt+XeOBD7yBPK4jDVZ+mL6iXME3wqf6JEDXz2zWK9Jn2KHTVl/W
         RvpyBthsFuTrcJEgXX+DwdjehlijdjNE/AOb1TQeKv67z8EQqyDWFteVRH6cWJArIPAh
         RbwA==
X-Gm-Message-State: AOJu0YwEUiZPMI2As2Cj/wBkwZ9NwCuF3ltcveNnQSmw4XX3ka++sXLw
	GRwQKoYO4D4x8YSBb48DxBfK
X-Google-Smtp-Source: AGHT+IFe0NUpJ/WdwQm9RA1sMz8NDzACSVxNQLCnOYiT4onmNHJgmXkRrHJOD03a94tVZbFeI2CAaQ==
X-Received: by 2002:a17:907:7e8b:b0:a1d:58c0:ed7a with SMTP id qb11-20020a1709077e8b00b00a1d58c0ed7amr10745143ejc.38.1702557968377;
        Thu, 14 Dec 2023 04:46:08 -0800 (PST)
Message-ID: <ea5d25db-f035-47b5-999d-72a6f670fcd6@suse.com>
Date: Thu, 14 Dec 2023 13:46:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] xen: add deviations for Rule 11.8
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Cc: consulting@bugseng.com, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1702555386.git.maria.celeste.cesario@bugseng.com>
 <854747a97c4c7a70bfe1a30a038f2cc6aebfb566.1702555387.git.maria.celeste.cesario@bugseng.com>
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
In-Reply-To: <854747a97c4c7a70bfe1a30a038f2cc6aebfb566.1702555387.git.maria.celeste.cesario@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.12.2023 13:07, Simone Ballarin wrote:
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -292,6 +292,18 @@ constant expressions are required.\""
>  # Series 11
>  #
>  
> +-doc_begin="Violations caused by container_of are due to pointer arithmetic operations
> +with the provided offset. The resulting pointer is then immediately cast back to its
> +original type, which preserves the qualifier. This use can be deemed as safe.
> +Fixing this violation would require to increase code complexity and lower readability."
> +-config=MC3R1.R11.8,reports+={safe,"any_area(any_loc(any_exp(macro(^container_of$))))"}
> +-doc_end
> +
> +-doc_begin="This function is made to explicitly cast an error-valued pointer to a void
> +pointer type to make it clear that's what's going on, so the violation is deliberate."
> +-config=MC3R1.R11.8,reports+={deliberate,"all_area(context(^ERR_CAST\\(.*$))"}
> +-doc_end

While the wording is okay here, ...

> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -248,6 +248,19 @@ Deviations related to MISRA C:2012 Rules:
>         If no bits are set, 0 is returned.
>       - Tagged as `safe` for ECLAIR.
>  
> +   * - R11.8
> +     - Violations caused by container_of are due to pointer arithmetic operations
> +       with the provided offset. The resulting pointer is then immediately cast back to its
> +       original type, which preserves the qualifier. This use can be deemed as safe.
> +       Fixing this violation would require to increase code complexity and lower readability.
> +     - Tagged as `safe` for ECLAIR.
> +    
> +   * - R11.8
> +     - This function is made to explicitly cast an error-valued pointer to a
> +       void pointer type to make it clear that's what's going on, so the
> +       violation is deliberate.
> +     - Tagged ad `deliberate` for ECLAIR.

... "This function" here is entirely unclear. However, seeing ERR_CAST() has
no users, wouldn't we be better off simply removing it? (Otherwise, nit:
"Tagged as ...".)

Jan


