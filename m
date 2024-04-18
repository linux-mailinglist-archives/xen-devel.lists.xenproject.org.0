Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5164B8A93EB
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 09:22:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707992.1106488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxM66-0006uq-7K; Thu, 18 Apr 2024 07:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707992.1106488; Thu, 18 Apr 2024 07:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxM66-0006re-4L; Thu, 18 Apr 2024 07:22:18 +0000
Received: by outflank-mailman (input) for mailman id 707992;
 Thu, 18 Apr 2024 07:22:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxM65-0006rT-1h
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 07:22:17 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 611744d2-fd54-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 09:22:14 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-418a0256381so3927485e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 00:22:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s9-20020a05600c45c900b004180c6a26bdsm3859495wmo.1.2024.04.18.00.22.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 00:22:14 -0700 (PDT)
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
X-Inumbo-ID: 611744d2-fd54-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713424934; x=1714029734; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LoDQQ3fb388UBFQXm0Jk4QZ5q5FukwHSab0/plpL3/o=;
        b=JUJl0QJ1lP2nLrQe2wGqQ1HeY1jbw4DBsUxzJcvQuaggoflIKUeGPqa4jjYUJoo7ng
         oBxU+AvB7PMRyp6vSkQQHyeWQ6VyecCUciskFhj9vrQ157vFMHSwd21/pKtp1vahEO8B
         AyU7eMV8E0LwaIjbISZrWVQ0uCqCEAUeqJ6g4Z2LQ859atEgm7lhyyPaD1FrwP177BFq
         DpuZ3+YRITNaf6IooWSRvQ4LtPWWVrSpkunrSvEgNgOo1vERPqJBG1Fs8PCeKx/dKRry
         BUO1MHAOiilInBCcwfGYMD2pj60YuCnoWC2uG77MuRw4PphsckhO62RJDy83bZ2j1pjo
         UJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713424934; x=1714029734;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LoDQQ3fb388UBFQXm0Jk4QZ5q5FukwHSab0/plpL3/o=;
        b=pwNuUPI5+lzANZdNls8Z12IckpQM+OxfOuBV+/I4YpAgNo2uPAevor3IujQ6RHWc0R
         3Eeh47HhEPl6+pdvZvMF3kt0T43o/q7SK+0vXt8rsbU2fLrZsvrrj4X/ZPPrcBl6bV2k
         dBd8MuIdDpw8RtCBQNoODoPNic24leFpm4KMQS+lnjs4sNW4zQeASyXW4DJy5bx28NxC
         BAlSh49N+zHkY+XDEt0aWvVwJoOtR4fV8K/ljt3RVFvyf/HCpK6hUL4Nc8WvGyHjk7ZR
         glSZYc5HIodnCvNKXmAmLEm7ayOs1H69bQt70yBwX6QD6d2SwHZNscxuGD2lHGM05OIP
         clVA==
X-Forwarded-Encrypted: i=1; AJvYcCV3HiIp5+j3yEbzvyhaVuQEfiu0/uVGVq4h+cxKNI0GDhyS0gAciohf8g5AD/S9bEp7JtO4aQhNeSCQNnx2BqdUlWmJAzETZewPxPWYGZI=
X-Gm-Message-State: AOJu0YwoYmnp6r6RIqRz4yykJx7cMNBG/Z5zlMAeDgB9OcOmOHY/cM1h
	F6mr2/q2lnCxJRgYfKjDP1O0DWljtJ9F71QSowb/+Uo22q66mEgWPYENWSUN7g==
X-Google-Smtp-Source: AGHT+IFmhdeDlL3VKzC63mKN8caDeDRKlRi3vRNKpgNWsy4wb5D0Rqiubtj+g0bj5auuD23QgCEoYQ==
X-Received: by 2002:a05:600c:5026:b0:418:ee2f:cb79 with SMTP id n38-20020a05600c502600b00418ee2fcb79mr218293wmr.27.1713424934435;
        Thu, 18 Apr 2024 00:22:14 -0700 (PDT)
Message-ID: <2d890f61-6f51-4d64-844e-24207805a65c@suse.com>
Date: Thu, 18 Apr 2024 09:22:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair_analysis: substitute deprecated
 service
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
References: <4850cedd9680e521cfac350930b24af19cdf1ab8.1713338908.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <4850cedd9680e521cfac350930b24af19cdf1ab8.1713338908.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.04.2024 16:51, Nicola Vetrini wrote:
> --- a/automation/eclair_analysis/ECLAIR/toolchain.ecl
> +++ b/automation/eclair_analysis/ECLAIR/toolchain.ecl
> @@ -44,8 +44,8 @@
>  -doc_end
>  
>  -doc_begin="See Section \"6.19 Structures with No Members\" of "GCC_MANUAL"."
> --config=STD.emptrecd,behavior+={c99,GCC_ARM64,specified}
> --config=STD.emptrecd,behavior+={c99,GCC_X86_64,specified}
> +-config=STD.anonstct,behavior+={c99,GCC_ARM64,specified}
> +-config=STD.anonstct,behavior+={c99,GCC_X86_64,specified}
>  -doc_end

I'm irritated by this, which may be in part because of too terse a description.
"emptrecd" looks like an abbreviation of "empty record" to me, in line with
"Structures with No Members". "anonstct" otoh looks an abbreviation of
"anonymous structures" to me, which is something different (structures without
names).

Jan

