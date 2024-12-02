Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EDF9DFCE0
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 10:18:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846405.1261577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI2Za-0002RR-QB; Mon, 02 Dec 2024 09:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846405.1261577; Mon, 02 Dec 2024 09:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI2Za-0002OY-Mz; Mon, 02 Dec 2024 09:18:30 +0000
Received: by outflank-mailman (input) for mailman id 846405;
 Mon, 02 Dec 2024 09:18:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tI2ZZ-0002OS-GX
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 09:18:29 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62f6d26e-b08e-11ef-a0d2-8be0dac302b0;
 Mon, 02 Dec 2024 10:18:26 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5d0bde80b4bso3394805a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 01:18:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa59997354bsm485983066b.199.2024.12.02.01.18.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 01:18:26 -0800 (PST)
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
X-Inumbo-ID: 62f6d26e-b08e-11ef-a0d2-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzYiLCJoZWxvIjoibWFpbC1lZDEteDUzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjYyZjZkMjZlLWIwOGUtMTFlZi1hMGQyLThiZTBkYWMzMDJiMCIsInRzIjoxNzMzMTMxMTA2LjU0NDIzOSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733131106; x=1733735906; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CTMYv9d3cfWh0HEUPIB/Gr79MfSWy56vdEWuAXD2450=;
        b=Xfdu54RIJ2tiQHik+k80onf7V4doj/tOSZdCkce02aadlh/N0fN3pK4ejtfEST9IUm
         cI3jTBI1l9JY1bzFC+513k6hcywSebyoyXpoDjQZdroguVxkIxwPE2zt1T7kqBo8YI3E
         fJkJkwz1eovRsVRcc2ruWFYexZX8nqtI/7Y/USdwvIE/SpSs8Vd+jtSzvzOtwTNWxHgX
         eJVp41/ApTS2fa6u+vad1p4c/PsIAQXYQmKNLjmg7ISOxAKtq/y5keN8bDLf0e+XA3h/
         286MHI9soaMVodERxdikS+zEieXCtnTtZLtsDDzhnYGcGyVzQzqNa4QwlY0VRxyDwVff
         /TaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733131106; x=1733735906;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTMYv9d3cfWh0HEUPIB/Gr79MfSWy56vdEWuAXD2450=;
        b=rk2LtYY2DKhYpAfKt0/root3V+bzExLeBufTr1fda88mFxEzwEpP6udEuhkrm2B4AD
         eXHweg5nVZCmSK3PME4n7CZacNoKybD4NFdxjrDl/AgKq/bi7oLU1YNHvXQx83C0BSrS
         xdfZLxW/+RhHLy6FJn2i/PwUmL/a2aF6Sp3d8QMDGu55/xtuPoc4QCmwl7u0zIiI3UHe
         sdK8pTe5EUOYK+R/drPyW2X2v3Ov2tVTwVICvuGGk+zSyxKEpyeJRWy7Y6IkClC2oTIE
         6PgLUQL1FQGE1TWAcYGFIIVL/Rn/l2fLPQzyPf8CRzvi3h1tsgoi/GHbM6cFHrq21NP3
         DWAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiyYNCHT2CE0g+zL2f+GgmD99Eo5w7326jR7WnKKw8pTnIgg3U3ItvjyBiZYKBPs1GhsgPbOBAZsg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9tFBf02lcb1WSFVguGOYiBHyXVQtZ6lkZtbjmHXplz4BBMxRx
	R+rA0KNCNDf+ojivc5A5pX3RDdKCzP9XytwjWb59E7Yqum5XrZCE6p5+ipIMAg==
X-Gm-Gg: ASbGncsKVKtYZ1IXAWTkkMta0xHIjntKsogQqfsOmqDGoRPEpNOh/PkSmdZo4NENVYz
	5v0hM2XDp+dvYnLAoCtJzj6Rp52O4BbtaBuGwPuQgACY4gR4dRq9HLxDtTUSWRFcmJtYfvGYnbt
	5KCFe5MhoVKkH0hqBNNmUW7AtkR/eWxBUbqcY5N1gLtSzTI5kG9uIjpEdTR4bPSJ0ISqYr2L6Lf
	1GRVxAU1CucRrausJlTDa+rXcW39P9Z7VZPCPbVwMpbifqTU6jjptYxQUkhNF0ldUXK285Xne96
	h2u1Sx44d0KSaNXxDaXkKQCiwZ4QmMGqXgM=
X-Google-Smtp-Source: AGHT+IGdwjydmASO6XyecgOzDtfEZv+XzVTtvZifyY2weKVOs6/99qmciU7P+Hwgb2R748e0jAkXrw==
X-Received: by 2002:a17:907:7852:b0:aa5:2edf:2795 with SMTP id a640c23a62f3a-aa580f1b90emr1981589166b.20.1733131106349;
        Mon, 02 Dec 2024 01:18:26 -0800 (PST)
Message-ID: <e80c333d-e9f0-4fed-9cac-dc63577df410@suse.com>
Date: Mon, 2 Dec 2024 10:18:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/10] tools/x86: Synthesise domain topologies
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
 <20241021154600.11745-11-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241021154600.11745-11-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.10.2024 17:46, Alejandro Vallejo wrote:
> Expose sensible topologies in leaf 0xb. At the moment it synthesises
> non-HT systems, in line with the previous code intent.
> 
> Leaf 0xb in the host policy is no longer zapped and the guest {max,def}
> policies have their topology leaves zapped instead. The intent is for
> toolstack to populate them. There's no current use for the topology
> information in the host policy, but it makes no harm.

How does this (and hence ...

> @@ -619,6 +616,9 @@ static void __init calculate_pv_max_policy(void)
>      recalculate_xstate(p);
>  
>      p->extd.raw[0xa] = EMPTY_LEAF; /* No SVM for PV guests. */
> +
> +    /* Wipe host topology. Populated by toolstack */
> +    memset(p->topo.raw, 0, sizeof(p->topo.raw));
>  }
>  
>  static void __init calculate_pv_def_policy(void)
> @@ -785,6 +785,9 @@ static void __init calculate_hvm_max_policy(void)
>  
>      /* It's always possible to emulate CPUID faulting for HVM guests */
>      p->platform_info.cpuid_faulting = true;
> +
> +    /* Wipe host topology. Populated by toolstack */
> +    memset(p->topo.raw, 0, sizeof(p->topo.raw));
>  }

... these, at least comment-wise) fit with Dom0 also needing some data
there?

Also nit: Multi-sentence comments want full stops after every sentence.

Jan

