Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E1C89B99F
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 10:02:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701802.1096310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtjwm-0002z1-Ej; Mon, 08 Apr 2024 08:01:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701802.1096310; Mon, 08 Apr 2024 08:01:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtjwm-0002wg-BZ; Mon, 08 Apr 2024 08:01:44 +0000
Received: by outflank-mailman (input) for mailman id 701802;
 Mon, 08 Apr 2024 08:01:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WYQ4=LN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rtjwl-0002wP-CT
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 08:01:43 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3be4c212-f57e-11ee-a1ef-f123f15fe8a2;
 Mon, 08 Apr 2024 10:01:41 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3442f4e098bso781870f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 01:01:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k2-20020a5d5242000000b00343c0c24a65sm8298695wrc.89.2024.04.08.01.01.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 01:01:40 -0700 (PDT)
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
X-Inumbo-ID: 3be4c212-f57e-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712563301; x=1713168101; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=We6JjYSom55Ji/b+JHOf1mU8FrR2Hyb2uPggGwRVkfQ=;
        b=EyVGXwNpcKQzX5QaUZv4G+d/8eKjXgx54XGf94OuT+89yZY+LUCxNzeVd0wB2iJAAU
         uMzm6GCCG8aOx9pZyfW+e4RvaRep3xcN8RCeZzI83K/YnRcVdyOjk11vY1rJ8TWY+cBy
         J4WdC8pfTYA1p837FE7AWBSvihqoV5sH59sgZCOw1wSL1SY/7/gZ9hx/5+4tIze+T8bt
         znZufawg8U/La3iSTZGJkGT6ROqm6A5FYEtuwY8jSL++QSCWM5mUophtxFv+ijUeHU7Y
         qx1fWKC7gydvRsU/1fWsgsDud2gXAgSy/0YZzJoU2d0oUcce2KQ/jRcGBvTy6GqI7ayf
         /cjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712563301; x=1713168101;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=We6JjYSom55Ji/b+JHOf1mU8FrR2Hyb2uPggGwRVkfQ=;
        b=NFhzrHWFl2xuGTNjs0R1QSMFi0Nd297vhvzKTkT9bBbcn9Fhhk4O6+6Hpof03wWFpi
         xS5mItI7s7KQynHboCPLRKzUhvHnCFvltGSSVc4mkz/opb90nAoUJQ6qN7jDLqNz+Nly
         YBKEshF+FoO52V2/QFUVjvRENf/6znT6B+/Ugjos/lbNGs1kHheABZJGUdBrYd+lHsTt
         tXFwTykt3Cs5g1DqpjUYyT3b2uYZi1FD6+25Fs0eCOrJvSh5gTFSankhwKK7EBuXK7Z+
         e/hpuOGNXQ/y5DG5LTuvwqmb8rzMzMoh2QogG2A7KXVtlVImWV8bffnfhuPxa+BMxjiX
         IpXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXitdkbvGalqzhAK0SEc2vEzVTHOvYddMV/EkfubyN8DXkMn/ZFn6t0osoosMa1TtfzlzGbj00ElM1QPw9uSSKUDCnvrA/Z/uW+ja25E/w=
X-Gm-Message-State: AOJu0Yx1+jfefLYxTU9Fpz3c6CusJYrqpJfo3sZ4DfBmCPWAo9g3EmxQ
	yPZeSsHsq+C0Y5ZHsTlcX4cyulzeaJpwVQicdg3bvAFssb5irYMgK662AvwgAg==
X-Google-Smtp-Source: AGHT+IHyK8A2goI8jw4xRk2wTDXpsajsdHMlInRnzqtifD4TWJx+MphsDw1d8KI6PGN7A0vHxucFHw==
X-Received: by 2002:adf:e24c:0:b0:343:bfef:9c39 with SMTP id bl12-20020adfe24c000000b00343bfef9c39mr7326492wrb.6.1712563301145;
        Mon, 08 Apr 2024 01:01:41 -0700 (PDT)
Message-ID: <e04914c5-8859-4e42-aa1a-003e2ff6d974@suse.com>
Date: Mon, 8 Apr 2024 10:01:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 8/9] xen/domain: deviate MISRA C Rule 16.2
 violation
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1712305581.git.nicola.vetrini@bugseng.com>
 <2328b1a43f8bc4c9a9303c46f8eba2847c67a713.1712305581.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <2328b1a43f8bc4c9a9303c46f8eba2847c67a713.1712305581.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.04.2024 11:14, Nicola Vetrini wrote:
> MISRA C Rule 16.2 states:
> "A switch label shall only be used when the most closely-enclosing
> compound statement is the body of a switch statement".
> 
> The PROGRESS_VCPU local helper specifies a case that is directly
> inside the compound statement of a for loop, hence violating the rule.
> To avoid this, the construct is deviated with a text-based deviation.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> I chose a text-based deviation, rather than exempting PROGRESS_VCPU,
> because it's more refined and it's unlikely that more violations
> are introduced, since the rule has only very few violations left on
> both ARM and x86.

This same kind of construct is likely to appear in arch-specific domain
cleanup code, sooner or later. The same SAF comment can then be used there.

Jan

