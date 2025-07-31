Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD27B16C81
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 09:16:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064910.1430210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhNWD-0002vg-LD; Thu, 31 Jul 2025 07:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064910.1430210; Thu, 31 Jul 2025 07:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhNWD-0002u2-IO; Thu, 31 Jul 2025 07:16:01 +0000
Received: by outflank-mailman (input) for mailman id 1064910;
 Thu, 31 Jul 2025 07:16:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhNWC-0002tw-Lk
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 07:16:00 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 357a6d39-6dde-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 09:15:59 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b7823559a5so321692f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 00:15:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8976c40sm9854385ad.84.2025.07.31.00.15.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 00:15:58 -0700 (PDT)
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
X-Inumbo-ID: 357a6d39-6dde-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753946159; x=1754550959; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K4fL8gv+3uIwYJVDBV2x3qltl4Kds33aotaZv2bivb0=;
        b=gMfVSqWunC4j91KIL9drPpU/Gpd6d2PwadiBGd1hyjGpJLDxlMxyEyifEnvdNKAslf
         ceMY+3IOydxsVJ6Pbv/z1oMJJVVlAC4G68Ug+2OqQeM3BxyYRGhwAUiB+fnd8zj9oIgE
         EvGdIYf0YtAbejkdXw3DlGHjQ/n5yy/bphMuwfqHvgvKFIqnpkW0ZB8KRoZq0xRtVTDi
         Ya2YNZKL/X4bLkcX+wHQ0DoiTOESC3Ii6yZ8lcNOjfNC5pIfJXT0rNSaGHKdoSxe9Vq9
         OCq4jJEMxUg49pXfmqhOEA6MmiIPfIHZnGC8zP540O6cczrnNmOzHmaygQjBtecfXalz
         eHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753946159; x=1754550959;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4fL8gv+3uIwYJVDBV2x3qltl4Kds33aotaZv2bivb0=;
        b=NLPJeslsOKOdQSQYTZAjLrpvlgnneDJAAvU73lV9f4zN/3eASbCL9lzzZkVraf6gL/
         NmsbVkZmz7vXShsD05cdB5hSfMQ00I35ly89AqR/7PlmylGcfBvkIA3CEcU8LUKno1ji
         ulqET0YyPcbm5/9kXdEicf99rK+6eBRMTw5F1NG8KGToT2d8N/pHPWeKlwcuomFXd0Rh
         Ilgap6fxk8kBgzvjCU20vMz6g8xLVfAMVPFiaby7Ty1ehqZDedCWPg/DGTHDLppPpEvA
         aCeEqJzPxZtuMKsHFF7p1SSAvseplSuc31YEb6FEh3j2sjxYzeJs00Td0uq+jVWUlong
         Zslg==
X-Forwarded-Encrypted: i=1; AJvYcCWGh6/xg26R/VHeJkUGUxug+lWTsOJ5hLosF/Zhaoy3DutqSN4lcW3PWG7y55UMJlMCei+9VuqmdhI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHofW2E+4HKyUp8tSaQiJdcSACb/dzYIa947M6TMWKizY7bffn
	uWsGU9xNZ0YK1B7sHC0aHVr/+nCrhTQCRaXcUgriLUzmJmCI+J8LclhrdOirq1Kutg==
X-Gm-Gg: ASbGncvsZqYgDsGhSzEFji1dEXIzTlUwz0lAy5I2PoBa2BarG/ZcguIq/fur+bXTbfZ
	LfVz8v3rs8s79zimeVIV23eWzEPJmz8B8JF8mbyDND9X9I15GkjBPMMR0THG4aYkXC7W6r011yT
	kywKzxLyKDecQsHEwuZX273Q40DtCaZR1TIo6BaUpwvjWCbhRf828AU8FBDF4aINzeFDIx9azqa
	JPRsbML9Wgi6UK/VBvnXAbN8DL6yI2a+cjDbh/KtxxuOYDKm2FjMW4hXrJauz3q9JLGtFkQrim6
	bsHBwjNNx4tGEPwtbQfQVlcu3PeBTbDXcTjr+izzOVMG8KYnlLTqizj75vVoi8tnULWjpacB9Xt
	qB6bRe7dPTtQJRSbGTU8CH59wP9XhAe9aYcA8ZyvcTUxSpfpAghWP7lrNMeageJ4RhW1QkHe4UP
	uCgJdQusI=
X-Google-Smtp-Source: AGHT+IEtfbgD7NCzp7Z86GMFmi33yGmywFiCnLcZrx0ylht4SLJweTs1EsGhkeBpiPV8HXX+um8NRw==
X-Received: by 2002:a05:6000:26ca:b0:3a4:d9fa:f1ed with SMTP id ffacd0b85a97d-3b794fecd1bmr4840086f8f.13.1753946159051;
        Thu, 31 Jul 2025 00:15:59 -0700 (PDT)
Message-ID: <2be39e0f-25c6-4fe0-8b80-71c020dd3b0e@suse.com>
Date: Thu, 31 Jul 2025 09:15:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] misra: add deviations of MISRA C Rule 5.5
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e681e0c083d945f48e6d0add1aee32af16be224e.1753911247.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <e681e0c083d945f48e6d0add1aee32af16be224e.1753911247.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.07.2025 23:39, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 5.5 states that: "Identifiers shall
> be distinct from macro names".
> 
> Update ECLAIR configuration to deviate clashes:
> specify the macros that should be ignored.
> Update deviations.rst and rules.rst accordingly.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Nit (along the lines of my comments on the other patch): Make better use of line
capacity here.

> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -117,6 +117,16 @@ it defines would (in the common case) be already defined. Peer reviewed by the c
>  -config=MC3A2.R5.5,reports+={deliberate, "any_area(decl(kind(function))||any_loc(macro(name(memcpy||memset||memmove))))&&any_area(any_loc(file(^xen/common/libelf/libelf-private\\.h$)))"}
>  -doc_end
>  
> +-doc_begin="Clashes between bitops function and macro names are deliberate.
> +These macros are needed for input validation and error handling."
> +-config=MC3A2.R5.5,ignored_macros+="name(__test_and_set_bit||__test_and_clear_bit||__test_and_change_bit||test_bit||set_bit||clear_bit||change_bit||test_and_set_bit||test_and_clear_bit||test_and_change_bit)"
> +-doc_end

I have no idea whether regular expressions could be used here. If so, shortening
this at least some may be desirable.

> +-doc_begin="Clashes between grant table functions and macros names are deliberate.
> +These macros address differences in argument count during compile-time, effectively discarding unused parameters to avoid warnings or errors related to them."
> +-config=MC3A2.R5.5,ignored_macros+="name(update_gnttab_par||parse_gnttab_limit)"
> +-doc_end

No restriction to common/grant_table.c?

> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -142,6 +142,28 @@ Deviations related to MISRA C:2012 Rules:
>         memmove.
>       - Tagged as `deliberate` for ECLAIR.
>  
> +   * - R5.5
> +     - Clashes between bitops ('__test_and_set_bit', '__test_and_clear_bit',
> +       '__test_and_change_bit', 'test_bit', 'set_bit', 'clear_bit', 'change_bit',
> +       'test_and_set_bit', 'test_and_clear_bit', 'test_and_change_bit')
> +       functions and macros names are deliberate and are needed for input

Nit: "macro names"

> +       validation and error handling, ensures that the size of the object being

s/ensures/to ensure/ ?

> +       pointed to by 'addr' meets the minimum requirements for the bit operation,

'addr' is pretty meaningless here.

> +       preventing unsafe operations on improperly sized data types that could
> +       lead to undefined behavior or memory corruption.
> +       The macros encapsulate this conditional logic into a single, reusable form;
> +       which simplifies the code, avoids redundant function call.

What's "redundant" referring to here?

> +       Also this bitops API was inherited from Linux and should be kept for familiarity.

At least this line is clearly beyond 80 chars.

Jan

