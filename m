Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F83A86CD22
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 16:35:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687219.1070339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfiRN-0007TF-M3; Thu, 29 Feb 2024 15:35:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687219.1070339; Thu, 29 Feb 2024 15:35:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfiRN-0007Rg-IL; Thu, 29 Feb 2024 15:35:21 +0000
Received: by outflank-mailman (input) for mailman id 687219;
 Thu, 29 Feb 2024 15:35:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfiRM-0007Ra-Lz
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 15:35:20 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 250e24df-d718-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 16:35:19 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a44628725e3so54629666b.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 07:35:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 vb9-20020a170907d04900b00a4446655ceasm682001ejc.110.2024.02.29.07.35.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 07:35:18 -0800 (PST)
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
X-Inumbo-ID: 250e24df-d718-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709220919; x=1709825719; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MDGlgUYloOERxBLTOm/aU3tqCwar96Q0mrxOXuvrUGo=;
        b=E1TbkBBgMhi3EyDjEBIGurWgZ7T3suHp4xloIb3lOVi8o22SDAtMBrqWfNbfYV4L82
         s9grj54F3M8HZ842yBaeFP/kAI10aX2JHpAlQGosp595NGmol3svwhLn1+Nfs47wdeRM
         6aaNktoXeG/YZMvA/Zgkn6V1OS5ZHR1OrAzAVHd/4Wq8fMkfdwvj1ZItHMrZ29ybynf4
         LbDdj5xviCiSlYmv2bjPGPj/2xyu+3jFBJRzw5oBvozusDF0CKNOuqeml5FgN56q+O0K
         iR4Woq3fr1w6LqHex35fqoQpJFd5W4TNuGaOmy9b73LVuSMP2D1qoyG4p8vtpL36ur+0
         8qyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709220919; x=1709825719;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MDGlgUYloOERxBLTOm/aU3tqCwar96Q0mrxOXuvrUGo=;
        b=WOPzY5BK1Vo35Ix91CSt5BVesEoBLmatJJ9JpPYWbwY50QRCPi+DDsQnHHhWzRqF1b
         MMXIOCOeG++5Ao3xEYBtPL7K6S0eywPhEg+vdt5X9Ao0ekU50SWGlV/ZyzMxsPFnSjWF
         Kd/4AmRwB0gMwYRAoHOkWt9sQCZVsL99kGPJEmMRqOv8lDsq1mpJS2Rt4BH/RB9EAIHl
         2Tn76e1Qp8pPaS5xy/iMA4QXDcZkBAaCqc2FwZLL8QG6n1BwXIFvDps6P/1zuqQAxLoB
         Oa4DKhkvTnP6y6glu3jCYsrK19ugS5TCgkg1D+Y0WHzGT58PKEjxbcjgEaW1sNrtOcSY
         767A==
X-Forwarded-Encrypted: i=1; AJvYcCXBwEWYGDZd2xdEllFHSbRi6LdTNSgodrZtYIRLWbkaya+ZXCebOrbUQ0WuxNziXYPK1BnaYumlf+x6HTZXpHs3REKNFU0Eh3gYM9l6Xpk=
X-Gm-Message-State: AOJu0YxGTUEH7gF9LxdM8RC82hOsjWKA+0w1eIll5C8SZXMNHEVIkcK7
	AYsoHsXpnzXBXgljalZqq1RH8RLtxsL5l7or3MmuuRFRs+3Gl0XjiEgigeHc5w==
X-Google-Smtp-Source: AGHT+IGSl9a1D1i2NsuYJEoevvYwoVL1zN+fJ70zZOS/ljAtRtiVXgp9mjvV8jMoTDVXRltjmIw/Ug==
X-Received: by 2002:a17:906:3bd2:b0:a41:3e39:b918 with SMTP id v18-20020a1709063bd200b00a413e39b918mr1811293ejf.24.1709220919196;
        Thu, 29 Feb 2024 07:35:19 -0800 (PST)
Message-ID: <d7a49ea9-cb32-4d7b-b093-a86dda43333d@suse.com>
Date: Thu, 29 Feb 2024 16:35:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/12] xen/spinlock: remove indirection through macros
 for spin_*() functions
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-12-jgross@suse.com>
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
In-Reply-To: <20231212094725.22184-12-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2023 10:47, Juergen Gross wrote:
> In reality all spin_*() functions are macros which are defined to just
> call a related real function.
> 
> Remove this macro layer, as it is adding complexity without any gain.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with the same remark as on patch 04.

Jan

