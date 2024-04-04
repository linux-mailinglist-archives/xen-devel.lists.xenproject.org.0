Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CF38982A5
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 09:59:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700727.1094324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsI08-0001Bd-7S; Thu, 04 Apr 2024 07:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700727.1094324; Thu, 04 Apr 2024 07:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsI08-00019H-4D; Thu, 04 Apr 2024 07:59:12 +0000
Received: by outflank-mailman (input) for mailman id 700727;
 Thu, 04 Apr 2024 07:59:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=stKz=LJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsI05-0000oL-Ut
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 07:59:09 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36d31c06-f259-11ee-a1ef-f123f15fe8a2;
 Thu, 04 Apr 2024 09:59:08 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56e1e6e1d01so370121a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 00:59:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cn20-20020a0564020cb400b0056dfc8d12fasm2033320edb.21.2024.04.04.00.59.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 00:59:07 -0700 (PDT)
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
X-Inumbo-ID: 36d31c06-f259-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712217548; x=1712822348; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9m/JQfIAHHD/b1Kzygwaui4us+AKOSdJUa3Lx8Z8FDI=;
        b=UN+e/KtsvnJlkAb4R8JcYL5Ik4MTxxzdyT5EuDZerztoX9skcpW/YsyI5/8k3jB5Cl
         AL4lEc9oOzjWxy9QcnkvnFT9iYRkWIjvPm0lL4UU85LrvKssaOCGDBR+azCZPX3JWxcq
         kv3PBmxD4M0PgYowUDSin3AA1Ko1v/r31SWjwHl8kVSdCO3C1qriupfQc0cNL1dIeifb
         Yq9m2y6+8Hp0mELSBndAGvIWoII+oGGKWbgCv8Tw1JHUC/o0gjxdP1xYelhdyG1ThdIO
         53hXJxsZXh/6lFaNrABFCv08c6RnjxsUqeqPQdTFFZIF1rTXwzCE9oqG2ZFj9a30y6f5
         bi5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712217548; x=1712822348;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9m/JQfIAHHD/b1Kzygwaui4us+AKOSdJUa3Lx8Z8FDI=;
        b=t1PX0PgvjA31xUwn/d2qeIz7cpt25zJuqsV4iwA0yJjjlodE9zSsxK1kvl3FGxjU/U
         mB7mXe/ic0cWhhTcgWqrW6+kKiwr2Ad8zYsfgBYbCV085HABmxkX0BCdvHnfsfwiprpJ
         g8ZdRj8E+te2Kv1wSb9Z6Bvtof2/Pwsb0nrh8g1DYCGBqA9nea86GfwHLof8l8GyP61h
         iCB3fOui4kGCFST4rejodnQGX6DNKs8Bt4m404KlneKhHUhlKyqIfLjE5ziHxlo2zVja
         2yCAgQ/0siIZbE6gP+LFJQSeI8xyrAyGABtcYBkMxC93WzIpEJZy7EEZYAx8uB19lmg2
         5RkA==
X-Forwarded-Encrypted: i=1; AJvYcCVCn6ykL3USM3CDJbUz4srFOrC1/bgiGtePafXIZaPjU0q0F1Xtr3lOTwSSZDCbTu2QqPTY7jhKu/zm1VEB6HFiMvPPlJD1KRR0hlHpv/o=
X-Gm-Message-State: AOJu0YxJi5XSWx/8bW3PF2/CwD2H5fE1Ppb1AWpCISOonHKd74ERk6hD
	PRe3mFasGVv0nGne8boqvMqSX5r2738HMK9xHhxO12YKRDi10AbSoTA5hU2Y+w==
X-Google-Smtp-Source: AGHT+IFHu6t7IVZBt9fdLsRGFhfH6WxOk95FySdXVtvpEeIRnmo8dQtoAzHx838yJkAxcZUaKGRIAQ==
X-Received: by 2002:a50:9f22:0:b0:56b:a077:2eee with SMTP id b31-20020a509f22000000b0056ba0772eeemr1199522edf.4.1712217547718;
        Thu, 04 Apr 2024 00:59:07 -0700 (PDT)
Message-ID: <e1811e99-36d1-49cc-8f08-8813326cf53a@suse.com>
Date: Thu, 4 Apr 2024 09:59:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/2] vsprintf: address violations of MISRA C:2012
 Rule 16.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1712215939.git.federico.serafini@bugseng.com>
 <9705ea09d3dac2e569c075cd9bd7f594796b12c1.1712215939.git.federico.serafini@bugseng.com>
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
In-Reply-To: <9705ea09d3dac2e569c075cd9bd7f594796b12c1.1712215939.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.04.2024 09:49, Federico Serafini wrote:
> MISRA C:2012 Rule 16.3 states: "An unconditional `break' statement
> shall terminate every switch-clause".
> 
> In order to meet the requirements to deviate the rule:
> 1) refactor the for loop to make the switch-clause ending with a
>    return statement (note that adding a break at the end of the
>    switch-clause would result in a violation of Rule 2.1
>    "A project shall not contain unreachable code");
> 2) add pseudo-keyword fallthrough.
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



