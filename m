Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8429083F6
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 08:46:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740421.1147514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI0hF-00055c-U0; Fri, 14 Jun 2024 06:46:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740421.1147514; Fri, 14 Jun 2024 06:46:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI0hF-00052e-RC; Fri, 14 Jun 2024 06:46:01 +0000
Received: by outflank-mailman (input) for mailman id 740421;
 Fri, 14 Jun 2024 06:46:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5IQt=NQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sI0hE-00052Y-Fd
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 06:46:00 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1f93146-2a19-11ef-90a3-e314d9c70b13;
 Fri, 14 Jun 2024 08:45:59 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-57a5bcfb2d3so972208a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 23:45:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da83asm1832865a12.25.2024.06.13.23.45.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 23:45:58 -0700 (PDT)
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
X-Inumbo-ID: c1f93146-2a19-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718347559; x=1718952359; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PXgLrd85ARxcZJPOzvD6zAvkCTekLQfVFWsxeuf+ouI=;
        b=UA7IZQKDDyAIbooLVsav7vKmgGtGmEyv7QCAhb9Obt9JlrdgaJc0Ho/zaIK8dB3xNs
         cCkxYpH1YCYo2IEV3+/l60FIrNDhmi7LeBol7XEHNtKajY0lq0cRNq9II9jKu1Zysnth
         B8PkXS7aaD7vJGUl0VqrT2OPVcPt5eqnGnzNVr1SnO+qY2XKGpVFHpOoX2t6tiqYYlHm
         8oyLhuWmmWv5EkWe/fw7TfQ+OBqqLwwP75rbI58ecHu1ECfRcwJWNUQTG1eZZ8aJy4BL
         YgfGp9lHVu1h16V1YGvsQkS1G1wQp5VN2x08I2l0AZwub4cMCzCqaRqtYVkPRC6cYqmI
         OVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718347559; x=1718952359;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXgLrd85ARxcZJPOzvD6zAvkCTekLQfVFWsxeuf+ouI=;
        b=cOhRfBRnQOMeubE7x68ZRs7yP01qe4hwyv48X5izVFyfB3EJKGwJrPQR3x4fVada+C
         fja0EUKZv2v4H1yYnD/RNvXCyOybLtztkuTgyCfArGGAsd9rbG/0Vz+ZXP0dn73SjKLt
         fI0kxYmpp4c+MhclPAy+4QbMNu9k/wFrBE3Fk8xuz9ByrtHOWnfYqisBlL+oFYjeR9HQ
         AcOiEEwLUqSfAz+BMaNTGHdeLT2L/QNzc+N2vqbahodiDghjzKviNg9PO2fUzUcEyV0M
         68vF9wW0jurTxlilzAK4TPqXW+YaqSd1maNgtOYUOFLvSP4vqfLafTAlS/Co4ZVW98uX
         FOsA==
X-Forwarded-Encrypted: i=1; AJvYcCXfE0mRyOCP6sUwKzPrKMy7va5RuqPShczWiP/1Fydwu5rlPv6Oy4k6n3OXD5bG83BTz1P1JxKsZBjnLhZ3BSzZ0KXTp5BQIEK1JY6PAiw=
X-Gm-Message-State: AOJu0Yz7qaGMKs44XQVPHBZp2wTD/7pE/Np5BXy9YAVIcWUhhkcHpG+r
	LZ7/OHFbMiqNaq/YWZPmvrg94J7l9zXAif6BDwhX8dkg8W1GTbfOTjjr07jeQA==
X-Google-Smtp-Source: AGHT+IEuLd6zpPtA1Z4B4oXzHduerSkaHlqsAzYyrUhzcH4XJukV6HFr/baqtZBi36kG6DGFGCTY6A==
X-Received: by 2002:a50:cd0e:0:b0:57c:a7fe:b155 with SMTP id 4fb4d7f45d1cf-57cbd68487bmr1409480a12.15.1718347558734;
        Thu, 13 Jun 2024 23:45:58 -0700 (PDT)
Message-ID: <39020e27-0b25-4b7e-b7d6-6171f4e30c41@suse.com>
Date: Fri, 14 Jun 2024 08:45:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] automation/eclair: add deviation for MISRA C Rule
 17.7
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <5d4294f9a33cd647b6365614d88665b19a89d62b.1718346542.git.federico.serafini@bugseng.com>
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
In-Reply-To: <5d4294f9a33cd647b6365614d88665b19a89d62b.1718346542.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.06.2024 08:31, Federico Serafini wrote:
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -413,6 +413,10 @@ explicit comment indicating the fallthrough intention is present."
>  -config=MC3R1.R17.1,macros+={hide , "^va_(arg|start|copy|end)$"}
>  -doc_end
>  
> +-doc_begin="Not using the return value of a function do not endanger safety if it coincides with the first actual argument."
> +-config=MC3R1.R17.7,calls+={safe, "any()", "decl(name(__builtin_memcpy||__builtin_memmove||__builtin_memset||cpumask_check))"}

While correct here, ...

> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -364,6 +364,15 @@ Deviations related to MISRA C:2012 Rules:
>         by `stdarg.h`.
>       - Tagged as `deliberate` for ECLAIR.
>  
> +   * - R17.7
> +     - Not using the return value of a function do not endanger safety if it
> +       coincides with the first actual argument.
> +     - Tagged as `safe` for ECLAIR. Such functions are:
> +         - __builtin_memcpy()
> +         - __builtin_memmove()
> +         - __builtin_memset()
> +         - __cpumask_check()

... there are stray leading underscores on the last one here. With that
adjustment (and perhaps "s/ do / does /") the deviations.rst change would then
look okay to me, but I don't feel competent to ack deviations.ecl changes.

Still, as another question: Is it really relevant here that the argument in
question is specifically the 1st one?

Jan

