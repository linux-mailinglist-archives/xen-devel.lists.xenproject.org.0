Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A224B8B0338
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 09:29:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711193.1110998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzX48-0005JD-DQ; Wed, 24 Apr 2024 07:29:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711193.1110998; Wed, 24 Apr 2024 07:29:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzX48-0005Hh-9h; Wed, 24 Apr 2024 07:29:16 +0000
Received: by outflank-mailman (input) for mailman id 711193;
 Wed, 24 Apr 2024 07:29:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzX46-0004nO-VB
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 07:29:14 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5948ead1-020c-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 09:29:13 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2d858501412so88263071fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 00:29:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o12-20020a05600c4fcc00b00418a6d62ad0sm26604454wmq.34.2024.04.24.00.29.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 00:29:12 -0700 (PDT)
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
X-Inumbo-ID: 5948ead1-020c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713943753; x=1714548553; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M5X0Zdmp/5vAXHNnlark0kMUOgAR7ijjsaVoa8nppOY=;
        b=NnuidmpGvlzRWcJlc+zansh+D8+dDzHUEnepaJg32xKjBLBj2to/9KoiLp60xDL9pj
         hSeoSBamor6T5DXR60r3wsy532FfWme//UoaR6rp7IP4tUBqxAghVjTfXgiB0f3pYBeL
         3KSmVKL3J2h4ALzcZ5GR2fXAgxDNdW/0wG6lNAWean3TJXjHokpMpkA/OeNUzu/q3lHe
         bYe8fwWgfnQX8ZrXT/W+msUqdbzMqEa2yNcA6UhNj2LRmm9VbNWHpq7hlN0BdE6/xWz6
         mp8f371+1DweXtWJhTglxy8qIgnvLDTwJykrZDyVhZdnboBvqroPr8lH+WHdxQ176cOm
         Azog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713943753; x=1714548553;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M5X0Zdmp/5vAXHNnlark0kMUOgAR7ijjsaVoa8nppOY=;
        b=q9jD4kX0DsbDxOEwZmFLF/LUO6kC2CDu0T+HPOC+Ocq/Zu7DeEJSxfuM+ktvfecYx1
         cw+Unt6rcwfL9yHyMNnVISuUwmuToSAPN84HwiieB6iyKwL9JGZ7zqY1I2txLmhyLnKY
         LKBldqiQfE2dT6iOB+86w86ZtVf2qGe6OyhTUCH+bhJu3SczWl3odcFhULpOli3SgW8G
         /ARww0jeurv3+hLtlHyN0cYqnQuyzQqCsdxm+vtxqwUkHDsIiwryZ8eyBayv/i7HS1/Y
         ujvNpIhJoUzytJ1xeVvmj5A9rX3hQWpKoZ5O7wQPBty3+yPy+7Tfy6l8NME+z8YjfTCI
         Uumw==
X-Forwarded-Encrypted: i=1; AJvYcCUrQiOjm+MBAeXrKS/U3NdV/w2KSnF//5uEQLqOf3P6WQGFnk5AlPuwwV5NC0KTN7Y/U4xS4GSFGYptqIo8soRbMLSLrTL/9yvqDifWCGI=
X-Gm-Message-State: AOJu0YzFXr8GLS3pPEWuVdOlR+E1L9LPrrJt3Rq2rrHbDJmMrJb+y9zC
	DCyU5nH1ZAJ2YsLAauL86UPwbcfnuRdcxJsavT1M754ZVATjTccUkqouHqOHSA==
X-Google-Smtp-Source: AGHT+IGUCpHXxwLCl9TkKuIuTnbA1DaO6PAabZNZB/I/p7UCY8QZSwFcRRiVDXDzTBXXPB92PBn8rg==
X-Received: by 2002:a2e:b94e:0:b0:2d9:fde1:dcf1 with SMTP id 14-20020a2eb94e000000b002d9fde1dcf1mr744651ljs.41.1713943753047;
        Wed, 24 Apr 2024 00:29:13 -0700 (PDT)
Message-ID: <aec91df6-fac0-4528-bbdb-32d8564d5764@suse.com>
Date: Wed, 24 Apr 2024 09:29:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 10/10] x86/mm: address violations of MISRA C Rule 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1713885065.git.nicola.vetrini@bugseng.com>
 <067c2c22f84f7d1ed1c89d65859f70ac2fd7610a.1713885065.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <067c2c22f84f7d1ed1c89d65859f70ac2fd7610a.1713885065.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2024 17:12, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



