Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E2CB14DC7
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 14:39:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062621.1428338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugjcG-0002BS-0N; Tue, 29 Jul 2025 12:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062621.1428338; Tue, 29 Jul 2025 12:39:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugjcF-00028z-TQ; Tue, 29 Jul 2025 12:39:35 +0000
Received: by outflank-mailman (input) for mailman id 1062621;
 Tue, 29 Jul 2025 12:39:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugjcE-0001vE-Qz
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 12:39:34 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 146cd701-6c79-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 14:39:34 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b792b0b829so392838f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 05:39:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7640881ee75sm8116957b3a.2.2025.07.29.05.39.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 05:39:32 -0700 (PDT)
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
X-Inumbo-ID: 146cd701-6c79-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753792773; x=1754397573; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TWaHxzMJ3YvBCEs+nTu8NvI4hhT7wcNxwXihoP6QSXM=;
        b=A+ch9NBGSCEaC4EPo8jFJ5Qdk7wWE/Fn1TjuudnFXgBPB7VKwD85rUMU9mE+vDM0FM
         ussg8elqT2RBvCeYUr+T0ccIIcVl1P93E3UYEGycEOBXt3N13eLJ0Z/010O0WgoEO6LO
         XauA/r74GgBpm3mDXqZlxCXNkavSiAIzdktFkq840fNhnv/VMsfJ6O76Ep3MO5LDZG5t
         +7N7N8mMZk/QK4YFwNpQpJMeINtHQY+jRqcMILxtfKlOOgIIWrtzJqG90B/vsVjnAvTt
         sA5oowrtFvm/2xesULB3xVX4YSB7xwMYRcKRlV7JmtFu2ygDLrsXVyKuqDJd7ESf/K46
         DXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753792773; x=1754397573;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWaHxzMJ3YvBCEs+nTu8NvI4hhT7wcNxwXihoP6QSXM=;
        b=csAnFeOAaIMypLW0QoGPZ9TORoYAERaLZSQ1UxGhc2i7WRWkSfAYbMWtZqBUUcEVUA
         dklQlO7uTRHLUpiroJ6CERBeHBcsO4wz/cdlEy2f5//2h9GdC0PxpNw2vqy1B3+fQcxv
         llAtovOsZ5gOdMrbW4G5a/g+hkDXt4Tbbp33BKjAC+wiaA6aXoC4FH7quwPKl/i2hKRg
         0VJL1tUJaCTbiDbLwQtBmnKUtyaGT3yOObdj0Zc4RN28fbIac9b5F24yq1J01ee9YDwt
         CxZGt7GkkRg7jfoqCgI4/hlyxT2vqH90OjEfnGUHKSqZ3KSDuYjeTHj/psbANOcrNEnU
         gNNg==
X-Forwarded-Encrypted: i=1; AJvYcCWq396ac9LKj1LLwuwHiVoPeCRbQ9/5DZdENxCtMuI3l72htDmHEqAwx/yVR235xOcRLvgcf0XJ5M8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1N+BMgbW0bowCaWLNP08+hQorVBaettlExpBWVoEaUsnbXECS
	8YjqCkidQh0ijNASQDxHWNxVFYB5j90hlFqeXqO/i9h2b0VxVppVi4pnzm52zq5mfg==
X-Gm-Gg: ASbGncve32IYbtKgTju3umVJ2CTsdXqnh7CZjG30ZTUzjUw3UPvD1c7bivQ5RQd8EKt
	l8hiM5AjTOPMIdwM5U3EJAKtE5OguetICmm1reyp1jeJPR2QdvtzoMcH/yKFVHo5wW63sPi+WJS
	WQSM0hlt6kEZMngBDhPecaGdE9L4L8NaAGe2cn/Q8dSz8qy8l+/QP3dqYWO6iweSxfX3PW5Q6eI
	1db0xAclb6NxIu7iWY1aTY3hOLcY5KjOpU8tYNWYmQ2X1CRrJcrSJGToll57GQ5YrtQCcZcDs0Y
	3ZsNN4jlc93tgBqcP2LGf9BxRyeryRQASRoqXElzje3du2X+yAwTZqwJChZvUjzMG7gi2U7dnwi
	aYl80fNsJzXduHyWMGvpou2s31v223CzsNU93jmvPTXQTdHjqACSp+rTdm6m5+xq3YA1277SqF2
	WTNV8GPDU=
X-Google-Smtp-Source: AGHT+IGEifTODASnz/2rbfJeyP3DIrOpoy0IHbDDNkI3TWF6xxYcMPXhgCblmUKQcmvgGYpqK02cUg==
X-Received: by 2002:a05:6000:2289:b0:3a4:d64a:3df6 with SMTP id ffacd0b85a97d-3b7765ebec1mr11525773f8f.3.1753792773366;
        Tue, 29 Jul 2025 05:39:33 -0700 (PDT)
Message-ID: <2ef0d0a9-065c-4288-badd-21de4cfc5d14@suse.com>
Date: Tue, 29 Jul 2025 14:39:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misra: allow 'noreturn' as safe for function pointer
 conversions
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3b821bc506b04bf7ff8bf5a3712449d45429dc90.1753791398.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <3b821bc506b04bf7ff8bf5a3712449d45429dc90.1753791398.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.07.2025 14:21, Dmytro Prokopchuk1 wrote:
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -367,6 +367,13 @@ constant expressions are required.\""
>  }
>  -doc_end
>  
> +-doc_begin="The conversion from 'void noreturn (*)(void *)' to 'void (*)(void *)' is safe
> +because the semantics of the 'noreturn' attribute do not alter the calling convention or behavior of the resulting code."
> +-config=MC3A2.R11.1,casts+={safe,
> +  "kind(bitcast)&&to(type(pointer(inner(return(builtin(void))&&all_param(1, pointer(builtin(void)))))))&&from(expr(skip(!syntactic(),
> +   ref(property(noreturn)))))"} 
> +-doc_end

As I understand it, this is about any function, not just void (void *) ones.
Hence throughout anything textual in this patch, may I ask that this be made
explicit by inserting e.g. "e.g." everywhere?

I'm also on the edge of complaining again about the patch subject, as that's
still not quite accurate: It's only one direction in which things are safe.

Jan

