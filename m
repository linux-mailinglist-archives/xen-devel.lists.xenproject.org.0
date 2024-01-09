Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68693828420
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 11:40:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664382.1034567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN9WW-0004zq-Vr; Tue, 09 Jan 2024 10:39:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664382.1034567; Tue, 09 Jan 2024 10:39:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN9WW-0004xy-T7; Tue, 09 Jan 2024 10:39:56 +0000
Received: by outflank-mailman (input) for mailman id 664382;
 Tue, 09 Jan 2024 10:39:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RTBC=IT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rN9WV-0004xo-D8
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 10:39:55 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c3f2660-aedb-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 11:39:53 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ccae380df2so29704431fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 02:39:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k34-20020a056638372200b0046e29c56401sm566861jav.0.2024.01.09.02.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jan 2024 02:39:52 -0800 (PST)
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
X-Inumbo-ID: 6c3f2660-aedb-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704796793; x=1705401593; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ChCLdSPHGvk+kvmsqaKEzcj9QdGiqx/L/a/o70wiuMU=;
        b=UwCZ7sZlmJGbv9Ri3xJMx5PfwqMFIiPeiZWF9fcNbhGHwfQ2WaDXDgNDPqAVpWzgzs
         B6H+34FpzZKUfywO9o+rf9e94xN8N4aAuH/rMHyVg7oc4oOGK4+OZq7igcHqzi5A61lA
         aahJ7TR856V09ORjnjnHUUH9APixhaQNCkDPSduQcDWmqeZIaxRhqLiQ16vOGFCoGmKS
         Gde28lxxyJ6AUZDLX1cTohLI5+gX5TEWIHMui2xj1nOeoo8qVvpizdclMJ0V910t6jtG
         7Tr7CegtiaGL9fT3Rz0fcGHB9tC7PonG12y4iQfhNuCFyftNCYL32XVPsZzxadpKobOB
         qQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704796793; x=1705401593;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ChCLdSPHGvk+kvmsqaKEzcj9QdGiqx/L/a/o70wiuMU=;
        b=DIJZxdvF+Oay81GalW1Kloolur/0WkfgxS9vg3xOGIhGAhuXCHopVIIZejNYkn3+tb
         fINaBmAtfk/5YaK8gdfpWy7EMbuKQ8Qy2G9isbjYxEzh+xgcRxnCGtvUanY832BgGUMy
         LxCRjVYGlwCCCSbdO/DfYzZ8VlShbBrWYP1VzcXOJSDWqrG4yIGGfXvaljD48bLSuz/m
         1f8GJzEFllQGcDZqtusvbxptfvjGHoXQ2A0eK7Y8zvQDFiDtjsjIlHGjWlaF3+mcSFsi
         /ARdHLdni8YpHNOpSlZYvUmCaXTcImfhsLBG025mK0dm879ODOpCy9rdXGIn3xunmrx3
         k3xA==
X-Gm-Message-State: AOJu0Yx3tv3QWvFOQugncQzAUZvPNTZtBUQVzAfLpyvNuxeeX9k/8MV9
	wWj6+vLk+mTdVSoO8vEedA9mMuKur8dQ
X-Google-Smtp-Source: AGHT+IGCBaOz6BIrSFVgn1RHFsCHv+7rmSBcuQ+HesiDF+fJ36x77qb5oH3ugb8qVQ8fK80iL1764w==
X-Received: by 2002:a05:651c:c5:b0:2cd:17aa:5216 with SMTP id 5-20020a05651c00c500b002cd17aa5216mr1914999ljr.86.1704796792840;
        Tue, 09 Jan 2024 02:39:52 -0800 (PST)
Message-ID: <772125e3-4745-4402-b0bb-4075cc10574b@suse.com>
Date: Tue, 9 Jan 2024 11:39:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [xen-unstable test] 184285: regressions - FAIL
Content-Language: en-US
To: osstest service owner <osstest-admin@xenproject.org>
References: <osstest-184285-mainreport@xen.org>
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <osstest-184285-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.01.2024 10:54, osstest service owner wrote:
> flight 184285 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/184285/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-arm64-pvops             6 kernel-build             fail REGR. vs. 184271

In the earlier flight it was the qemu build where gcc ICE-ed, while here
it's the Linux build. Is there really no compiler update available that
addresses at least some of these recurring but random issues?

Jan


