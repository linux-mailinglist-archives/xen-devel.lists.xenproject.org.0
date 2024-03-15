Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAED87CAC6
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 10:35:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693716.1082130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl3xd-000167-9Z; Fri, 15 Mar 2024 09:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693716.1082130; Fri, 15 Mar 2024 09:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl3xd-00013M-6X; Fri, 15 Mar 2024 09:34:45 +0000
Received: by outflank-mailman (input) for mailman id 693716;
 Fri, 15 Mar 2024 09:34:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZGBu=KV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rl3xc-00013G-79
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 09:34:44 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40b20d66-e2af-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 10:34:42 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a449c5411e1so242193966b.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 02:34:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 sa15-20020a1709076d0f00b00a45bbeeea9asm1514832ejc.167.2024.03.15.02.34.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 02:34:42 -0700 (PDT)
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
X-Inumbo-ID: 40b20d66-e2af-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710495282; x=1711100082; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dhjjVOC80pNyBwiTU+xpcfNzWvp0QP/7r2RStgUYOWI=;
        b=XwfiDxiKEZctADj2rDtK0rcI0fVEVGpETFZEM3JjK0psHL+aSxMhm2woF+mCTvrcCh
         /WeLGxSIM8oWEJAuc0ODyVJNPyRmEMLamwpT2u6EkcB9KWgNWmtqxGmSg5ofMqNnDvmf
         eyQXlQT6bTx5FV56QUwSmRxSaOIVMP31gmT1vHdaqOuLiH1HPUWedMVexbeA8e7UadrB
         CbhmhjSIXCD+sFCRAKgRHG0XGYrM1QjKk4o5H2NK3gKPTEIh9622/xZBSZGXjxPJcDLd
         CUu8FE/xR7AOdKoiUCBVbUXIUymyIQnD+oxG+8gA2lGzk7+RvjXsGWfcK4xq4pVyNiQZ
         VHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710495282; x=1711100082;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dhjjVOC80pNyBwiTU+xpcfNzWvp0QP/7r2RStgUYOWI=;
        b=V4pwB3NU0Q8fNs0SQilSs508LKtDn3qqOsgYZEzbjI+HTA8l8MlyyrlWIGqxV/CJ3l
         PuKAFasjZlzeL3V7+UNos3m/GwaesSu4DmbO0HJq+GT7JaSHQuCM35Lxm3mraOGi7mKi
         l7FZZKFs+YkZOpNOaDYLYsb4Kd9doq5h+g0qaBMut1tTkB/oor26xDsH401ga19U0gLP
         kBkxbd/ilL4HfK7CZbVKvJhgotvx1Ms6jSXx7ghRXUC1Sd3675tkuXmqca5+BGVrgZxS
         DaN4QbMy+QDOQNoyJct1kLJzZwbAmJBoMQ+H/C3RcLuK+KlT+N6GowuhR3JwagIVTnZy
         a6iw==
X-Forwarded-Encrypted: i=1; AJvYcCWFOzYgbn0szv0yFfsGmT9NYfxTVm04MS0Kz7DrT0jWuDMkpw559EZN27Z7OcaqkuBq6EAPs6ap1PqzlVocGxjRFPpy6shvuCwvGSDguAI=
X-Gm-Message-State: AOJu0YzuMGs1HAi2YVMLL12R+w2FNCdQjf+4gNisA+wQXgTIPiZ6mTRQ
	phCq4HkD6EsNYQiwRWwLiBJGrLlp5NvtQOzHc2XsU/PmT2A8cYlbyPK987/1CQ==
X-Google-Smtp-Source: AGHT+IHLkBNfzonNvhwYRmmMfxkDb1+FfnTIizyDzKMhmmkykGxyIvEnB4xtU5ydmZFT2CqI0Nooag==
X-Received: by 2002:a17:906:6a1c:b0:a46:8d93:6c4d with SMTP id qw28-20020a1709066a1c00b00a468d936c4dmr590268ejc.25.1710495282445;
        Fri, 15 Mar 2024 02:34:42 -0700 (PDT)
Message-ID: <5a4533e5-c6f3-418c-811b-2bd0a631f1ad@suse.com>
Date: Fri, 15 Mar 2024 10:34:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs/misra/rules.rst: add rule 5.5
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, bertrand.marquis@arm.com,
 george.dunlap@citrix.com, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2403141733460.853156@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2403141733460.853156@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2024 01:35, Stefano Stabellini wrote:
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -181,6 +181,21 @@ maintainers if you want to suggest a change.
>         headers (xen/include/public/) are allowed to retain longer
>         identifiers for backward compatibility.
>  
> +   * - `Rule 5.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_05.c>`_
> +     - Required
> +     - Identifiers shall be distinct from macro names
> +     - Macros expanding to their own name are allowed, e.g.::
> +
> +           #define x x
> +
> +       Clashes between names of function-like macros and identifiers of
> +       non-callable entities are allowed. Callable entities having an
> +       identifier that is the same of the name of a
> +       function-like macro are not allowed. Example (not allowed)::
> +
> +           #define f(x, y) f(x, y);

The semicolon here wants dropping, just to not give questionable constructs
as examples.

> +           void f(int x, int y);

With this not allowed and there (iirc) being examples of such in the code,
I'll be curious how it is meant to deal with them.

Jan

