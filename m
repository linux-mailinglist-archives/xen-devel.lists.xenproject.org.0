Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5DF86755E
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 13:43:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685516.1066342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reaJc-0002CI-N2; Mon, 26 Feb 2024 12:42:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685516.1066342; Mon, 26 Feb 2024 12:42:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reaJc-000296-JX; Mon, 26 Feb 2024 12:42:40 +0000
Received: by outflank-mailman (input) for mailman id 685516;
 Mon, 26 Feb 2024 12:42:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1reaJa-000290-FD
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 12:42:38 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85992e24-d4a4-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 13:42:37 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a3f893ad5f4so430379766b.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 04:42:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x8-20020a170906710800b00a4138c3f065sm2386071ejj.56.2024.02.26.04.42.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 04:42:37 -0800 (PST)
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
X-Inumbo-ID: 85992e24-d4a4-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708951357; x=1709556157; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zHplMMXsHba0zwdPMLcvoMdIb4TN6dCnVRyffeOQgUE=;
        b=Js9asqG7LPdtlHhS1/oflT/hgA6+96v4o96WQuDQag5nqOAKtOaiVi5pNVlgNKr5S9
         Z2SACrUPm33VYsDg01ROrE7ivAcK978S9NRmL51QlqEr3Gr9F0pDecz18y/Oa0OzbPTE
         sngD6hl+0GW62dYneaQl4Zkt1+A++WhT1+R2TrqS1RzcpNVKxjiL00pvWqoRvFo5o6lX
         kTghtx7RyAFDZTyoHIkZJ3FDv+MeD4P6ZmhDdv+MyFHRr3KOoHVVcUFAKo1hfY8xcdMr
         sMoz5YFoqhVyYtt9k/izEcvuwUPhHNBGudR+VD1xAjteevcgSJBXPtPqXPcFXop7D6ga
         7Dxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708951357; x=1709556157;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHplMMXsHba0zwdPMLcvoMdIb4TN6dCnVRyffeOQgUE=;
        b=sXrv/UhK2bJcSXbHhoZOAE4t0i+NljxjFwzXYNnltGfvveBZfBECD9kigj7/RVQk9I
         zvYnmC5XuvHW0uv1i1HFjUfmGrJyc42tgxP/AsqzVsMBDR4GjLpBrLf90SpUTG3/mckY
         BZpbxExOMFn1fsowTB/e0sjEZACROyleEXEGevM5e21OuY9O8I7zGrMZ9M2WcLPprDfI
         X7tsfb51VjR1p1AQuJuk8RkumzDpD5UfJDOjcE5Uo8kUjQC0ZN1u5EYxMj/pK4WCJ7PN
         TuQ7FSHyjjSVV3hRkK40v7n/SPNZ1NJfrTzgloOrxMwm7yWpH6GGVsQT0Py5kslrifLA
         4SUg==
X-Forwarded-Encrypted: i=1; AJvYcCXEXfVFBKkdqHk88EvAF6GOv5q++xw14XGyPKPjwOsfRzpy2YjICkI6i4zzZ7DwRpt1Td5Hk8cfNXjo1lMA1Rp2dFaNCzXvmi3ej/V7GLk=
X-Gm-Message-State: AOJu0YxyY54nyRD0JUYv7T6vT+z8lSoi38Vw9VSO0G8QlpfPHa6ImEyw
	hAhBoMlHfdda+FS/4IJKg/mWJCcRiMBpLXMkrxOYFH9nVEp8rYXtG/X2g3DqwQ==
X-Google-Smtp-Source: AGHT+IFQlm8me7Nta3WJCYKA2l+2lxnWL7UbR1sJvAdtEi7EVeDvXahYBBJYXPZTccw2wTw5DVd7+A==
X-Received: by 2002:a17:906:7c44:b0:a3e:90ec:2287 with SMTP id g4-20020a1709067c4400b00a3e90ec2287mr3965558ejp.26.1708951357283;
        Mon, 26 Feb 2024 04:42:37 -0800 (PST)
Message-ID: <767fbe0c-2c71-4f8b-a405-ae90a33e991b@suse.com>
Date: Mon, 26 Feb 2024 13:42:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] x86/spec: fix BRANCH_HARDEN option to only be set
 when build-enabled
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240226110748.80254-1-roger.pau@citrix.com>
 <20240226110748.80254-3-roger.pau@citrix.com>
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
In-Reply-To: <20240226110748.80254-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.02.2024 12:07, Roger Pau Monne wrote:
> The current logic to handle the BRANCH_HARDEN option will report it as enabled
> even when build-time disabled. Fix this by only allowing the option to be set
> when support for it is built into Xen.
> 
> Fixes: 2d6f36daa086 ('x86/nospec: Introduce CONFIG_SPECULATIVE_HARDEN_BRANCH')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



