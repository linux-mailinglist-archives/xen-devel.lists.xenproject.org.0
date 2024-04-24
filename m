Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FD98B0307
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 09:21:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711167.1110928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzWwB-0000mq-82; Wed, 24 Apr 2024 07:21:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711167.1110928; Wed, 24 Apr 2024 07:21:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzWwB-0000jl-58; Wed, 24 Apr 2024 07:21:03 +0000
Received: by outflank-mailman (input) for mailman id 711167;
 Wed, 24 Apr 2024 07:21:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzWw9-0000jV-Kx
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 07:21:01 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33002e58-020b-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 09:20:59 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41b0bc4ce39so1801415e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 00:20:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fc9-20020a05600c524900b0041ac5f19213sm4289749wmb.8.2024.04.24.00.20.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 00:20:59 -0700 (PDT)
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
X-Inumbo-ID: 33002e58-020b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713943259; x=1714548059; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M5X0Zdmp/5vAXHNnlark0kMUOgAR7ijjsaVoa8nppOY=;
        b=RYFn7gYkDelxr2tzV2aNGT1Ax5jpJJv866dP369V4qXp9uH4aj4iJ5us4672GuipWP
         WhPdgyoMyUqolp0LeM4gKxDv/GrhH2/cPNF6UdaR7ggTogSZZStvCK6QfB0VQFb2OQwY
         ht2o3OM+9z1oVYc7TyNfQjrEFfAlrlEDqKyhDJiRBEEK6/Y3WWl83+tNeJkjzXCfEI7J
         WIDe25z5B8avgrwD9/s2rakkaOr+0la78kodHNCVv3z2DQ2Jnb+HcglY80MaA1knCkw5
         dbrxaUJX5CBLFP7reXwyRNIz54KHr37ZPKMkAlgXRQl7F91pVu/cAFZKDKjLSGZcvurm
         c6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713943259; x=1714548059;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M5X0Zdmp/5vAXHNnlark0kMUOgAR7ijjsaVoa8nppOY=;
        b=BzfSxU4eNYeNoLvicsoOZ5hv4CW9pXeCRqAiEDI9WkvkLzxwJsUn51xXT1ukoPgufs
         OYzSxI7Udd4/8APPyk0tZ+ClwvsGnKVYyMsr4WR1wfkUxam+HA2LS3snU8K+d54iLYe4
         vBKMZ+OeWulfU1iLTQDP6CSXNBQvxR1AtK4D63ljEgV63hd9Y+o/AhZs/Fr8XwH8m0Zz
         UkBGFUtEHqdYQpsppV4Vdd33ee683X7hUx9cwDI6UOB0RLL6Eb8NY2I7GkUorBZzSOGM
         oOvDxOhzJo9fqoPamXSKdor+M178SpLwet75JCT/sfDAZB3UDIeOE5TKk6q03n+AEg8D
         eMwg==
X-Forwarded-Encrypted: i=1; AJvYcCVXY5kHHnfX3j78anSDXemt/tabkmyq59g7OxlUBihMYPXWkPsIpDtogiX7sOf6u8z2QizoM9MR2bFy0ykTQr80xpixmxUn7UU26pge28o=
X-Gm-Message-State: AOJu0YxqdbJs0r8pgxw8T0TJBsl5zm7W7hQkHDCZRrA6QBan96VLL+yv
	ozgwzTQs/fu22S2WSsJV8Hckwo/gJTsU40RpL8fwoAZQ8lVNn7RkI+vlvkdhCg==
X-Google-Smtp-Source: AGHT+IEULxHCPLmAb8RAJRvdvw3Fq4bcSMEVGF/ja1bdSfpj5yfv1tUoTMjVGzlCP0r0kuOlM1EU5Q==
X-Received: by 2002:a05:600c:1552:b0:418:f1d7:7029 with SMTP id f18-20020a05600c155200b00418f1d77029mr1597267wmg.6.1713943259227;
        Wed, 24 Apr 2024 00:20:59 -0700 (PDT)
Message-ID: <95736efe-03c2-4e02-b7e0-8385b9119a87@suse.com>
Date: Wed, 24 Apr 2024 09:20:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 02/10] xen/page-defs: address violation of MISRA C
 Rule 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1713885065.git.nicola.vetrini@bugseng.com>
 <d093a4e47ac0c7029e0a1a6144fca922fe7466e0.1713885065.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <d093a4e47ac0c7029e0a1a6144fca922fe7466e0.1713885065.git.nicola.vetrini@bugseng.com>
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



