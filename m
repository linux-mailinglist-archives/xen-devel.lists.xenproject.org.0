Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75157AE3588
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 08:15:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022025.1397724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTaSp-0006jn-NX; Mon, 23 Jun 2025 06:15:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022025.1397724; Mon, 23 Jun 2025 06:15:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTaSp-0006hI-K8; Mon, 23 Jun 2025 06:15:31 +0000
Received: by outflank-mailman (input) for mailman id 1022025;
 Mon, 23 Jun 2025 06:15:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTaSo-0006hC-FL
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 06:15:30 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75faa03a-4ff9-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 08:15:29 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-453426170b6so28017705e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 22 Jun 2025 23:15:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d860a36dsm74164405ad.126.2025.06.22.23.15.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Jun 2025 23:15:28 -0700 (PDT)
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
X-Inumbo-ID: 75faa03a-4ff9-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750659329; x=1751264129; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i/66+BbyWZjipRIbTVLUqDpjpWtyUCNphjAJTGprYlo=;
        b=RIOCe5DRoQnGlq0mX3H4FfPHl5aVhMfDiMwus2qhwUK9G2i6uVKzq7bVX/oyg9Szh2
         7rVON//+3eyF9FGqvSo4WVLoU0ijM5G1M7+Al0/rG1NOeS4y2ZtKbYFeXyaAuCgG3hTn
         jifemAu9p7XbwmDMO8f1HfMfJh9Z32Ztg+yvJx1xET8l0DTqXRPaY+FPDeRFaE7U2TcO
         8IwjWBwkDOG0z12SL5v+TT5RDiFg+vLZ8Fchx7c2hoCY++9z+KzwgQ0F5sCb5UIcK/bC
         kDC9nDcAMuCn0GAxDNeSxXFTpZeMXyTSzyv4vJdHlyg/pi3RDXu01Rx5LrpnkeRGGX+a
         +yvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750659329; x=1751264129;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/66+BbyWZjipRIbTVLUqDpjpWtyUCNphjAJTGprYlo=;
        b=OJHpSO2hRwm4z9edbbZnw1zn6ZziEsQLPchEsxJeXB6UNIfKazEkMOUc3f3Twg/eH3
         s+ClmcUe07Qmgy6Z9ZT5q1TL61TeIgYyseaqoJiE5qAdR+D0bzoafwjpZ4H056HLRAX2
         Do081ht5Ql7CqPrNIFYwU+9WHuKpX4nzlprcQjpTnVrfRsoEsY6dxHB06dzOSSbbJnIC
         yRnF3X+tB9RBLZNG8dg+eWemOoG/PQI3dszRRXJKPflwtIgovlyVshTBHLqsN2CCzYzq
         FWY8Y616k5jz8TQaZcLaJ5TevVNeOf9KhFQw/Eio+vSLBjH2/AdGRmsvkzznQywMaC9v
         Djwg==
X-Gm-Message-State: AOJu0YyqGWfEJ2hqB86JhFJE2wTSPl0tuANX40RyCuRsCSK98AvL2kTQ
	qDs/g0dOHI1UMBMpmps1Z3rxLtIJ9pnU5zHT21JOUmEIGQGngXv1v9tykeqoSozVYA==
X-Gm-Gg: ASbGncsG67CP6E/UB1cXnGglRtSupWJqrPWTmRBcINBdNFBYPHva9J7L7tQjh8dty84
	73Z+g1gVcUix/oprwDDCGQyuWMG53cvehWz5x1W1DKDOvM6qf4kSTlVn/RZ4Y0/cGO4Lk5zlrDH
	Il95/SgZJ+7KaN5R4Q35q6axujapRgHQSLHoeJTPPI3O9UlvhWDpBPjoL9MMBbkV+1qLb1HNdea
	2vxVClW8tl4hTfRUATImqF0ZTNXVjNzmwpFG3dZZyFYONOAi/6xW6rVl9Vzuxy3Tr2Uvvmo/7M9
	VHcUKnpcb5EewujHHHU/BCesMwTzxofuzmZ+vJyuFP2N2yxQwQG9Vd/CHdp620ZaI/aQNCM8apZ
	48qiZQXFYaSWE+kGFnGtP7nT6LMYdQbpKh/tTDHJmmOkDV3c=
X-Google-Smtp-Source: AGHT+IEaRdMTfOBX+25bv97ZJPuzThBsvceXHBR6L+/Vj1YKHrsvfl6X0ocxqJhQwF0AZyLWE9en7g==
X-Received: by 2002:a05:6000:1ac9:b0:3a6:daff:9e5 with SMTP id ffacd0b85a97d-3a6daff0b13mr3157062f8f.7.1750659328838;
        Sun, 22 Jun 2025 23:15:28 -0700 (PDT)
Message-ID: <a81739f7-4f86-4af4-97b1-0da1dd59f835@suse.com>
Date: Mon, 23 Jun 2025 08:15:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] automation/eclair: update configuration of D4.10
To: Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini
 <stefano.stabellini@amd.com>, michal.orzel@amd.com, julien@xen.org,
 roger.pau@citrix.com, bertrand.marquis@arm.com, federico.serafini@bugseng.com
References: <alpine.DEB.2.22.394.2506201918100.2978375@ubuntu-linux-20-04-desktop>
 <bb73b812ea04857c29bdf64c570eaafa@bugseng.com>
 <alpine.DEB.2.22.394.2506221355580.8066@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2506221355580.8066@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.06.2025 22:58, Stefano Stabellini wrote:
> On Sun, 22 Jun 2025, Nicola Vetrini wrote:
>> On 2025-06-21 04:19, Stefano Stabellini wrote:
>>> --- a/xen/arch/x86/include/asm/cpufeatures.h
>>> +++ b/xen/arch/x86/include/asm/cpufeatures.h
>>> @@ -1,6 +1,6 @@
>>> -/*
>>> - * Explicitly intended for multiple inclusion.
>>> - */
>>> +/* This file is intended to be included multiple times. */
>>> +/* #ifndef X86_CPUFEATURES_H */
>>> +/* #define X86_CPUFEATURES_H */
>>>
>>
>> Are these two lines really needed? I may be mistaken, but I think the
>> violation's first location would be the #include below with a comment a couple
>> of lines above captured by the config at the top [1]. @Federico thoughts?
> 
> Without these 2 lines, ECLAIR complains about the following:
> 
> #include <xen/lib/x86/cpuid-autogen.h>
>        ^
>  MC3A2.D4.10non-compliant start of header file

And that's where hence a SAF-8 comment cold be placed, I would think.

Jan

