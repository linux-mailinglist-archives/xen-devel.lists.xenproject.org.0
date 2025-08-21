Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EC0B2F3A3
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 11:19:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088271.1446035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up1Rg-00040i-M8; Thu, 21 Aug 2025 09:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088271.1446035; Thu, 21 Aug 2025 09:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up1Rg-0003xa-JI; Thu, 21 Aug 2025 09:18:56 +0000
Received: by outflank-mailman (input) for mailman id 1088271;
 Thu, 21 Aug 2025 09:18:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Hha=3B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1up1Re-0003wM-Qe
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 09:18:54 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dabbe609-7e6f-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 11:18:52 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-afcb79f659aso126187166b.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 02:18:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afded2fc541sm352266066b.26.2025.08.21.02.18.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 02:18:51 -0700 (PDT)
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
X-Inumbo-ID: dabbe609-7e6f-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755767932; x=1756372732; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b6/aG7zOORt47TtTgpDNhbpehE6McyGOIen27g6zISg=;
        b=HTLZSVWELxlchi5ZnzY9gOrbPyaVm0BlrQ4dU+jUhiq9POvs/Bmnjfh+h5KwYv1EJZ
         k2nnVMls/EKQQXwZqK2J6jDKXZwNPOqxuj1YNGR+usLAKbyEN3PKFJoJqevVtrwFy0O3
         LXCvM4iI0FDMIPBAkysng512DPOwqLlN3ybbN9nY/H9CgKSbDC9jYrOEKfBkCD2TwEK8
         oajCy4X/12sF3/WKKqbcQRzaTYz34L7LXl0+wRZFRK32IoEwJ1JZJB/PbNe1QE05X2ft
         3Zx0OZiI/iNijaHdejDlEM+t7uUpSW2KO9vOTJKD4NxVH0kxzYWRYENorYEFd3lc6ZJg
         Qfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755767932; x=1756372732;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6/aG7zOORt47TtTgpDNhbpehE6McyGOIen27g6zISg=;
        b=tfsJQG7jn6p1nbdwpsA9Us2LUG9uGIYpJNJKSa4DVDq1eDitD4LX0FL2WZAJLNtonS
         S7DToysm87GZdlIm6Mg8MXKpKE/UbVLHaTKG0P3lwzwg4ZJap+BAodCPLCAUAor5t0mt
         5a1VXXIjgNlyFnRKWXroq9QpcD2QguVCDAidlXq7JBKzFzE0U8sg+ySZqG1pUNPbj16l
         TgZQv9YKvoNPOzQQdiJsBJABNPM8R8E7Qt7DtGLlYO9KBVZOrBp3IxNIm26jx6DiOb/X
         4ut+Um9HpXUmfUzoQuqnU0Ob9Vux7fhlZkCMIlQo4x0VMmbdsTJjH2d/XP8w9N7JJBEX
         Mh0w==
X-Forwarded-Encrypted: i=1; AJvYcCWqku8GdFOO/7KXOoxJjQlwgjLXxwD3r7DLZnu+CY9Ay10h0Aex4v1rGNtGclTonji33W6uGfsVlVQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWhay3qiLtCBjjUlTJmLQQlK1PoFAyqeW9cpqKlTbkepZiAOLN
	og4zMP7tXnyuUn976ZpjDxtxZdjLrZ5dDZ3JudP6ds0Dv0YU7ilijn6c1zTxaoKUVg==
X-Gm-Gg: ASbGnctKLmeJ0xNah4ZJVBIv96btcIjaqP1bSU6aK/akj61PQ+tn8Feud/wFatXK0L+
	critzRdO8/YSIw5idIZTqFkpuKOnhZ79Sd1fpfyzz/PDxiZvaOdtIkM+09ZAB/WnCFfDPii687V
	wpiMaEF9PzfJjdmN8xQE/FPg+MOa/aUVEZjzLwuynOQzzbgBrxN3ZOFOAOLkXNYkEGjlgMMb7fN
	xnfh+DtUfBZtIoDwUKolXP0aBlvn0U5608vcMWkBcf68+V6ZEgJmSvpk19bBxUTV+hjgyzCVl5e
	qzYLOLPzWww4CM0QF1mqnWoBf4M8Zme0ESERdKPL1vbItWA0YHIGTONwtzQ9W2VchQ1vhOQ1JSy
	y3t3OD6rbSo0vsEiudkwAYAR+g0K6SwhVK/dj4A7uWejz0CPymd2oRLCNy0drKzngPm95b/EuyZ
	tW3yqB4to=
X-Google-Smtp-Source: AGHT+IE2TjfJ90Tll2mveg5doi1Agb9W68Yj/glcn6ylD+TR4S3Je32FJt+2jpJvZRkOabwEbIQQ4w==
X-Received: by 2002:a17:907:5ca:b0:ae0:ad8c:a559 with SMTP id a640c23a62f3a-afe07abd710mr163112266b.4.1755767931805;
        Thu, 21 Aug 2025 02:18:51 -0700 (PDT)
Message-ID: <5199396a-685c-4839-b7cb-d32e3f4a0b48@suse.com>
Date: Thu, 21 Aug 2025 11:18:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: add deviation for MISRA C Rule 11.3
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d6a8682c98880d66ea99f882520b3defda0e3fe0.1755672275.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <d6a8682c98880d66ea99f882520b3defda0e3fe0.1755672275.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.08.2025 09:17, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 11.3 states: "A cast shall not be performed between a pointer
> to object type and a pointer to a different object type."
> 
> Violations of this rule arise due to the 'container_of' macro, which casts
> a member of a structure to its containing structure:
>     container_of(ptr, type, member) ({                             \
>            typeof_field(type, member) *__mptr = (ptr);             \
>            (type *)( (char *)__mptr - offsetof(type,member) );})
> 
> The 'container_of' macro is safe because it relies on the standardized and
> well-defined 'offsetof' macro to calculate the memory address of the
> containing structure, while assuming proper alignment and ensuring no
> undefined behavior, provided that the input pointer is valid and points to
> the specified member.
> 
> Configure Eclair to suppress violation reports related to 'container_of
> macro. Update 'deviations.rst' file accordingly. Add Rule 11.3 to the
> monitored list.
> No functional changes.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Looks largely okay; just one nit and a question:

> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -403,6 +403,14 @@ because the semantics of the 'noreturn' attribute do not alter the calling conve
>  }
>  -doc_end
>  
> +-doc_begin="Convesions in the 'container_of' macro are safe because it relies on

"Conversions" (also in deviations.rst)

> --- a/automation/eclair_analysis/ECLAIR/monitored.ecl
> +++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
> @@ -45,6 +45,7 @@
>  -enable=MC3A2.R10.2
>  -enable=MC3A2.R11.1
>  -enable=MC3A2.R11.2
> +-enable=MC3A2.R11.3

While the description mentions this change, it doesn't say why (e.g. "no
violations left" or "only this and that violation left" or some such).

> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -393,6 +393,14 @@ Deviations related to MISRA C:2012 Rules:
>         (i.e., less strict) alignment requirement are safe.
>       - Tagged as `safe` for ECLAIR.
>  
> +   * - R11.3
> +     - Convesions in the 'container_of' macro are safe because it relies on
> +       the standardized and well-defined 'offsetof' macro to calculate the memory

Actually another nit: Here as well as in the description, it would be nice
to add parentheses, so indicate the function-ness of both macros (i.e.
container_of() and offsetof()).

Jan

