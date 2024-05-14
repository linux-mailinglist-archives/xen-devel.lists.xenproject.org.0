Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EF18C59AE
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 18:23:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721674.1125284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6uvf-0003Jr-Nz; Tue, 14 May 2024 16:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721674.1125284; Tue, 14 May 2024 16:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6uvf-0003HY-LN; Tue, 14 May 2024 16:23:03 +0000
Received: by outflank-mailman (input) for mailman id 721674;
 Tue, 14 May 2024 16:23:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6uve-0003HS-OS
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 16:23:02 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3babf022-120e-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 18:23:01 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a5a88339780so49246466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 09:23:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7d7csm747656166b.140.2024.05.14.09.22.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 09:23:00 -0700 (PDT)
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
X-Inumbo-ID: 3babf022-120e-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715703781; x=1716308581; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oRpWNAdQnTo0N4docaodQ5ZeZukKlehSHQL6Z/WP0yk=;
        b=TDVANDcfV7VzAIznUVDPU2NRRJ8IJwsJHpaNWFIhvvovzdZqeKubGtW9ycxel4cP8/
         G6F+cjn2Mdb0JcDFLG1OMoTy+2Tq/FhsKzsSCH/BniDD5uVcAafQJqdRHWUAwu7mQwjk
         fcxyU+KdsOErRCYz8689LshNKSJ5VCt9qUaIQzCXGS6F0TU+0xkezulZ7e/TNrxHxu7p
         WcPflgqhGGDmaCWBs2qM8lW1oivs18MEeRPzK1XoM/9faPA1IADiYnrTGcnG17FWtcfM
         WJCNilk8/wzmOHuOn7zOyGaGSREk6Och3bdBzOJ0ILGkaW8SqbXWeV0yiasM8fR/4pAX
         PUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715703781; x=1716308581;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oRpWNAdQnTo0N4docaodQ5ZeZukKlehSHQL6Z/WP0yk=;
        b=N0N0KOYEh9MCvbOjUn66ihofOK1jA3Q27FuJMVN4WadYY5ssDDChCqPL/CVeDgLhE2
         eGfSXfUOerNmtAg1J30PeyjuOQoq7JhkXTEJNt/EBpQ7P2BjEr786Df29fj0dhAmJEmM
         4+t84aXy+4j3ofazJk8hxBd3aaPbs3g/3xPsq6F7duIkMGwHagYDuzFOVoYXdYtRZPWr
         4m2AusLWKxgIVQleQuD/6BEUVnnQfRpnrA3zZZXmcEHqgyD0LyL3P3MX7kLceC3SCMGu
         2EjXYU5l/hRpAw/NHIFj1HHfQOYn9s5oGmxpnYOTf6PsanvkKDnAy2MZun8NwHqPCj7l
         7DKA==
X-Gm-Message-State: AOJu0YyTdPWPNP3ROEV4G3YHQSG7q3OETn5yDhqf5K0DwAzuNceSmzCm
	u1870BqLKjSgvr5bEgDshcKbuVYWVVUAoBcscL2u/PuBpRQj4AQhd+9L0ZM+Nw==
X-Google-Smtp-Source: AGHT+IFRMQjxQ73KMM3725entLj5SIT2+iszFANr7+FRawFJniLXz66SGb/jsIgXE9GoBylDXPfRGA==
X-Received: by 2002:a17:906:48cc:b0:a59:cdc9:6fdf with SMTP id a640c23a62f3a-a5a2d54c0c9mr821509366b.4.1715703780751;
        Tue, 14 May 2024 09:23:00 -0700 (PDT)
Message-ID: <df8cc51d-60ea-452b-809e-c75aab957929@suse.com>
Date: Tue, 14 May 2024 18:22:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 (resend) 14/19] Rename mfn_to_virt() calls
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
 dwmw@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>,
 Elias El Yandouzi <eliasely@amazon.com>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-15-eliasely@amazon.com> <ZkOHHtRPTqC4Zvnp@macbook>
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
In-Reply-To: <ZkOHHtRPTqC4Zvnp@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.05.2024 17:45, Roger Pau Monné wrote:
> On Mon, May 13, 2024 at 01:40:41PM +0000, Elias El Yandouzi wrote:
>> Until directmap gets completely removed, we'd still need to
>> keep some calls to mfn_to_virt() for xenheap pages or when the
>> directmap is enabled.
>>
>> Rename the macro to mfn_to_directmap_virt() to flag them and
>> prevent further use of mfn_to_virt().
> 
> Both here and in the following patch, I'm afraid I'm unsure of it's
> usefulness.  I'm leaning towards this being code churn for very little
> benefit.

I expect this patch is a response to an earlier comment of mine. I'm
rather worried that at the time this series actually goes in, un-audited
mfn_to_virt() uses remain (perhaps because of introduction between patch
submission and its committing). Such uses would all very likely end in
crashes or worse, but they may not be found by testing.

> Also, I'm not sure I see how the patch prevents further usage of
> mfn_to_virt(), as (for Arm) the existing macro is not removed.  If
> anything I would prefer a comment clearly stating that the macro
> operates on directmap space, and avoid the name change.

But Arm isn't switched to this sparse direct map mode, I think? At which
point uses in Arm-specific code continue to be okay.

Jan

