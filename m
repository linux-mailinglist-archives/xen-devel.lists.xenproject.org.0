Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A199147F3
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 12:59:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746497.1153565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLhOW-0008Gc-RP; Mon, 24 Jun 2024 10:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746497.1153565; Mon, 24 Jun 2024 10:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLhOW-0008F7-Od; Mon, 24 Jun 2024 10:57:56 +0000
Received: by outflank-mailman (input) for mailman id 746497;
 Mon, 24 Jun 2024 10:57:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLhOV-0008E5-FB
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 10:57:55 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b65aabe-3218-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 12:57:54 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ec52fbb50aso24936051fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 03:57:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fa3229f936sm23317445ad.85.2024.06.24.03.57.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 03:57:52 -0700 (PDT)
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
X-Inumbo-ID: 9b65aabe-3218-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719226673; x=1719831473; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SuilJMjDDlKDCz8DRJVWH4zo9JVt7ObGMdKoDOJIBYI=;
        b=HSxCo086w16N2bYqecCNx96v8d1OikWqRO/SmDxTmlAHY139rj8L0djLJtSpTW/9EP
         vdHptHdAOMM+2/i3pBTWq0IHqxFEjt/ef07CARX0Fut6Q3W2GPC74vI3n2liMxXNzqkn
         hmWubmJvCxmfkZGIMlAShN7XyOeDYDOsHzhKMySCb6RLA3XPjijuA9pJkFL/NFaiOKNP
         qIm2zgDWiM1Gh02ZTBmgXTRM+zQnH863cD2eod77wy7krargPRY5t1QbgQH/MrCBOKqu
         kqwUQf2GWdk/ZsF3LA+VYbcBaggePk8sswKgOtBCpkfgwu1yOLAkPAgbtOTryURl97tF
         21rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719226673; x=1719831473;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuilJMjDDlKDCz8DRJVWH4zo9JVt7ObGMdKoDOJIBYI=;
        b=HyAQg2hf4S1O3F03GQk9zMCpbt6UMhEz+zBEoLPV+DgGGBcjqC1Oh66v4ENKyWE5wJ
         OukN4mJIlSamLceq8wjHPKB4mdWPMMKyugXhkyh6QEBgQOBF1k8uwgJRnuy9wU1sx8I2
         ZwnRrafjH5406VUrq8aoYglLaMm4aFkxTAEA0fSE8Mn9IsQRMUI97V5XFkmF41Xhra/p
         qxGUz3ceAKZiu5dl5ZcfWMy7jM1Xk1SHU3iVLRm+hHTgkhOOL2HxZYzJvm0cCmDTTqlt
         8HrmpwTuJp7U2KOxTPzRXLJv/FF8bYr9yWx390DZZLtvs4dn8Cf0L3fHwplW4E7r3AuB
         OsOw==
X-Forwarded-Encrypted: i=1; AJvYcCVU6vtwIT5ieerg0DXKqY2Oxohsp5Zxujk6U7dJdhJzaKOKbL9swSxcz3nsNZEaYnU2w+svNorzGXApkk+53PZ2nEB99MmuGQu/dndifPw=
X-Gm-Message-State: AOJu0YyC9NvEfGMXozla/dhuEFEUtYfYMzUyWR6qmTHRC/8O1XBf8cpI
	v20ex137Juf6F2ufgXqTqG1M9KEZRVRjRfNxNxmjk+MUDAJv0moS0eYEUHhYwJBqZF+wQw5AS+c
	=
X-Google-Smtp-Source: AGHT+IHWfIDFZLgcXocOENQh4oTAOERwiaNz64iMpJcrS52F5BQIuj479xipV9V8gWRzXyhz/QhUuQ==
X-Received: by 2002:a2e:3018:0:b0:2ec:588d:7eb4 with SMTP id 38308e7fff4ca-2ec5b30bd1fmr32544541fa.15.1719226673434;
        Mon, 24 Jun 2024 03:57:53 -0700 (PDT)
Message-ID: <1149f3da-480e-4949-924b-6cdf39b1e17f@suse.com>
Date: Mon, 24 Jun 2024 12:57:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 01/13] automation/eclair: fix deviation of MISRA C
 Rule 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1719218291.git.federico.serafini@bugseng.com>
 <c43a32405cc949ef5bf26a2ca1d1cc7ee7f5e664.1719218291.git.federico.serafini@bugseng.com>
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
In-Reply-To: <c43a32405cc949ef5bf26a2ca1d1cc7ee7f5e664.1719218291.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2024 11:04, Federico Serafini wrote:
> Escape the final dot of the comment and extend the search of a
> fallthrough comment up to 2 lines after the last statement.
> 
> Fixes: a128d8da913b21eff6c6d2e2a7d4c54c054b78db "automation/eclair: add deviations for MISRA C:2012 Rule 16.3"

Nit: Yes, the respective doc says "at least 12 digits", but please also keep
at that going forward.

Jan


