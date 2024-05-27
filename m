Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D588D004D
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 14:43:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730720.1135883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBZhE-0002qU-Q7; Mon, 27 May 2024 12:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730720.1135883; Mon, 27 May 2024 12:43:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBZhE-0002oy-NU; Mon, 27 May 2024 12:43:24 +0000
Received: by outflank-mailman (input) for mailman id 730720;
 Mon, 27 May 2024 12:43:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O60l=M6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sBZhD-0002or-5a
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 12:43:23 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3770559-1c26-11ef-90a1-e314d9c70b13;
 Mon, 27 May 2024 14:43:21 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-572c65cea55so9597057a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 05:43:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5785240d1f9sm5763350a12.51.2024.05.27.05.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 05:43:21 -0700 (PDT)
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
X-Inumbo-ID: b3770559-1c26-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716813801; x=1717418601; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+QaOBFvZ06TO5nsytNdlDNIECp34V16fy6mGEJPwn38=;
        b=V8IQcxEy50BIucgl76try8A05uhe720ixeF9u6L4c2dq9Of+BUCgb60Cpb8hQAONy7
         N8wflAqXfoJrzXon2TwPDLuwsiulGy8vOvmPshlEgo9Ct7tXLW4C38IwJqRekreslrLQ
         XZuBWTTmmPuLtZ9FuKHeM2w+HTxSLqRhIP1Kdiu1LObYiKxcW23IMjJQQ/tc4K8ucTUc
         AnXyki5iLtIAbh1SNGwQDaNmLlbsuTgCm8kXxvCIOiyLMA1Na4KN5L9ttZi6vDrROcXU
         +OfMaAX+xJYptb6KDDluYFBJUzpb7MsLRKFH2sS+2Efu0phwkuhbevnNGt3TbA86giOW
         ynXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716813801; x=1717418601;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+QaOBFvZ06TO5nsytNdlDNIECp34V16fy6mGEJPwn38=;
        b=dVqeyQbgFJZbBgXCmW3lSXkjujcLqkhDJ1/urrn+UC4Ho7biTLoHDtAHiKx7ygrFNf
         sfCOS7fEQDJ8UoHbq93Q7CxJj26dDZFIoHO4AD4pIZvgkABnW0J1NcmpHtwAX48LP5ho
         BSv1ymrd8I7VRXdlfR5kEznZZZQnMD1Z5xZz2M2XrHZsrFiDKlIGanAY0rGXOiLav8R+
         VOxeBeVU0bXRPpFxJRiID0vUSo4W6/nGPCY+MuByBXaY5JIVEXhaG8Jbxp993bgpzS64
         7XCfaghdds14YMJ6YqMjYXKTzAoGwDGCUKxoYhyi2dKwxH/4xHyBMxeQpc98xjByr8GK
         aeGA==
X-Forwarded-Encrypted: i=1; AJvYcCX/edS+AuRxXiVM6HIm4we1S8TEf5m9dapRd2bpxlbvgqNakI4c1vSyWqH+HDIpQnEQEBEYRc8WbDTw7XsQgwVSv8CIieiLpNd0TVygA9U=
X-Gm-Message-State: AOJu0YxIoj8vKAPQiVBdvrrCPUN9NamuNh52u0CIRe9DgrQ5MfYv0sis
	ITYd5+v8qG/j33zr+LBVxMFlhvbak4FZSvNrpoRGx6f8LTa5s6Ng8BIOoFf9HA==
X-Google-Smtp-Source: AGHT+IHKgLSBgAuP+vB89eWE0GtmsyHtfLICeKn5NCPyIJIR9ZZHIA/WvKJnRmV0rLhr4INrzKX2bw==
X-Received: by 2002:a50:9f63:0:b0:578:69be:6e7a with SMTP id 4fb4d7f45d1cf-57869be803amr4999912a12.1.1716813801331;
        Mon, 27 May 2024 05:43:21 -0700 (PDT)
Message-ID: <db5f4449-e333-426f-bbe8-e5b77daba16d@suse.com>
Date: Mon, 27 May 2024 14:43:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/13] xen/bitops: Implement ffsl() in common logic
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
 <20240524200338.1232391-9-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240524200338.1232391-9-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.05.2024 22:03, Andrew Cooper wrote:
> Just like ffs() in the previous changes.  Express the upper bound of the
> testing in terms of BITS_PER_LONG as it varies between architectures.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> @@ -458,6 +441,24 @@ static always_inline unsigned int arch_ffs(unsigned int x)
>  }
>  #define arch_ffs arch_ffs
>  
> +static always_inline unsigned int arch_ffsl(unsigned long x)
> +{
> +    unsigned int r;
> +
> +    /* See arch_ffs() for safety discussions. */
> +    if ( __builtin_constant_p(x > 0) && x > 0 )

See remark on arch_ffs() for possible slight reduction of code.

Jan

