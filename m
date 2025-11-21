Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBC8C78E67
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 12:49:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168967.1494831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMPdc-0001tF-FD; Fri, 21 Nov 2025 11:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168967.1494831; Fri, 21 Nov 2025 11:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMPdc-0001qP-BH; Fri, 21 Nov 2025 11:49:16 +0000
Received: by outflank-mailman (input) for mailman id 1168967;
 Fri, 21 Nov 2025 11:49:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8OZ7=55=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vMPdb-0001qJ-CM
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 11:49:15 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a019832-c6d0-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 12:49:14 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-64074f01a6eso3400849a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 21 Nov 2025 03:49:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64536443337sm4336025a12.23.2025.11.21.03.49.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Nov 2025 03:49:13 -0800 (PST)
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
X-Inumbo-ID: 1a019832-c6d0-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763725753; x=1764330553; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9/IcYANTiMhNXitch/PVW3L5hiFdwMMfHBLpa1i2++s=;
        b=LjqeNJPSea0XML0mouRl3smodRTIXqVq+OlXliyP4R4bSgg1d4fVpzf6qykTFEqRBC
         pbmTMt4Nq9v3Eel69v+KL/FgEQS6SDyu40f4XmPmmFsWRUDw0bZ8+MMyvpUJKpFsvqT7
         +6WUnqewO3Gh7pWeK2IoL0/Px9v5Ut4ajozclknCbOjcxcdAaqmPxiD+4IQmIZLlGnz3
         dp2lES+mnezs5w+22LpOkgko74SS8R3kOy7FA9P9sGgcHdgTBIjVqSGZsNIw0pFd2hGS
         Jo439xriv99lHGFl/i8fpx8B5jS3KjqUPS8G/0LpGPOd59ap6RmHl+001Ju7HIXwO87O
         B6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763725753; x=1764330553;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/IcYANTiMhNXitch/PVW3L5hiFdwMMfHBLpa1i2++s=;
        b=ioEJQwjv/0guyAXrwb2liq//HP0aofWZH64EShYexJumocT8MsDctWHv6LqjYJCAWJ
         AmLk9eSRCCDDDBoo34fRnGW7hTBFrmXPoEZWGdn+RBZVHKB01hm6CDG4POPToK79K3ET
         5GKgeM1b0PohcaiIUkiA4mg+tyNl47zq1NIWNdVrUbKGDybGtAwpT5ov5opc3EnIeZQu
         Q4uFFLVFK9HQ5R0ntB44TkrfbROGpEGRPgZuA2jaskDqTWrdT7LNHyWr1ZabS0+C1Qn0
         DAmCL4Mx6BVyWveCbF4glj63Ky9rK3haBrCJlzt1v/QlEfM+fSsVDJUqaw6NtLXxyvup
         7kIg==
X-Forwarded-Encrypted: i=1; AJvYcCW7RKlK8gXlT6ctLHw3gfUH/Nqt2qXLO9Y4Kchs/JJnfBZCwb1JtujbYBEacb0Jqannshd9rJOnlvc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLvpyXmpZsyWxVD2fiF+o1888Zvhtm+vhr5gUMeJ5J+YTCUaGT
	oEEyzArxxdLPmgJ22wImIlR/gFu6clN9Bq9Qx3l2CDFm5vtpbkrxqk7x3IilIrdfAA==
X-Gm-Gg: ASbGnctPtomVvbWxBLmCv0k/9I7Dg7ww9LmsGIc/I/vhD4rfVGUw23O0gs2A2kWBCnR
	7DCF5aNk3MDPoX/2RiiNF3zIGcfoaQVGkCFxSCZrwQRly0GrkwnwkuDGfawV9lLhL4kpjIombVQ
	PNgVeQ18/kOmRxw6k/5fgzCQHUyTcNbeqKc3+Uf0a8I0qZMFKm2HcbOqxLTPaRPgb01pbXqrAxf
	cdguZzciq1Psqeupu0QNdTFcIhukkYjYIw6+JSnOGhBAzwAMdQMWJUBGqxNNnF8a8ZnsQLqqm1x
	AvxAInaoMUk2yJYSzeKQRk4ecvLlnwKiXw7KGpxkt4mQGrsrxkQkpHgOl1TDp8Kyi616cJh/y2L
	xnMg0UzSnivolT7KKc/sKc+cGGfVn9DU/Kx1aevALXoeofpFmRLICGx1Z81siOyKfjzWfUKr8v0
	ijg510/h2+yyFtsdubFITWiRAp4+++wgbBH/8i4NoRUnviPqcqhsQKmZUWBe/F5yG7nvLxT6ELO
	Vqq1VpaJNAMpw==
X-Google-Smtp-Source: AGHT+IHiC4Sq3TVdAim0q2RS6+8uJ8jzxYuJq74oMFQjCjmjWwOzqC9l4nNY6u4thoUrAblgw7owRA==
X-Received: by 2002:a05:6402:51d0:b0:643:804a:fb5e with SMTP id 4fb4d7f45d1cf-64555cd9f23mr1374179a12.21.1763725753273;
        Fri, 21 Nov 2025 03:49:13 -0800 (PST)
Message-ID: <aa11b978-a2ab-4a1e-b9c8-04198fe94a49@suse.com>
Date: Fri, 21 Nov 2025 12:49:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/24] xen/domctl: make MGMT_HYPERCALLS transiently
 def_bool
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-5-Penny.Zheng@amd.com>
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
In-Reply-To: <20251121105801.1251262-5-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.11.2025 11:57, Penny Zheng wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -654,7 +654,7 @@ menu "Supported hypercall interfaces"
>  config MGMT_HYPERCALLS
>  	bool "Enable privileged hypercalls for system management"
>  	depends on !PV_SHIM_EXCLUSIVE
> -	default y
> +	def_bool y
>  	help
>  	  This option shall only be disabled on some dom0less systems, or
>  	  PV shim on x86, to reduce Xen footprint via managing unnessary

This is a no-op change, as "def_bool y" means nothing else than "bool" plus
"default y". As long as the prompt is there, people can turn it off manually.

Jan

