Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1E39E16A4
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 10:05:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847491.1262571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOpv-0007Tr-6v; Tue, 03 Dec 2024 09:04:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847491.1262571; Tue, 03 Dec 2024 09:04:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOpv-0007SN-4H; Tue, 03 Dec 2024 09:04:51 +0000
Received: by outflank-mailman (input) for mailman id 847491;
 Tue, 03 Dec 2024 09:04:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D5Za=S4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tIOpt-0007SH-CY
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 09:04:49 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5212674-b155-11ef-99a3-01e77a169b0f;
 Tue, 03 Dec 2024 10:04:47 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aa549d9dffdso846728666b.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2024 01:04:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa599953f9fsm588899866b.195.2024.12.03.01.04.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 01:04:46 -0800 (PST)
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
X-Inumbo-ID: a5212674-b155-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733216687; x=1733821487; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VtLwP3ekoMvcsVWikQLByRg6fVccSAjy9eZqzLqxRvI=;
        b=gpfKvSroi1l3zxADYY20Q0NZ5yjMs6xaKHtA0gL8Hwg0wJ8nivx3KdrvKnBt4V/1Qq
         RwOC+GA6vbmdPepVryM8cQvz79qmZmqbup/VREMUZ/+KOTiEdWPOHPQ4rwh2E2+62Kft
         jGQ8PNeIO6MST948kolYmrZM4UguI+UXJk92hc/pZetWVDgPEQ4PoCMFFLrCKranrJNP
         djg/SZZoWmcdyvPoeotdcSlK8AV05L3XBJWNm4k0l7TD12IDUZZ3rUSM0QBslRw0IoDa
         y3Dwel+65rGEg6d6T0dJhmhKUoWIeWlSy2fPFOmEQ35j8iYKB77FrfmqCtAanzX1Jq9i
         nKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733216687; x=1733821487;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VtLwP3ekoMvcsVWikQLByRg6fVccSAjy9eZqzLqxRvI=;
        b=sDHYP92qoMgNJGoqyOZJvtNrkVP+GQEa/NUByb6r2LDoq11grMB6nMAEuhg/HNit80
         mr2HUCchePBtSUpkU+x+imydYLb19uWlo6WvyhW0Ejnw/By8h+knhHgQclRMl8/xSs4P
         H33f67Ptm3Iohm2DwCEMDtxXkn1xDR15cg+39rap0NsgdPLwS5daWHaTFtoravDDd/G9
         b5LtN8o+pQhXiOAn+noxfOaVXPVT09eC8oLIiUz0eLkD+u4Gqrf2xREPbWxn8FkUrdk0
         OmNQEh44oPgc+8D/tigitvGWa6/5xyvGEV3LHxIRzwy6uy+QEvVSlVAIqsYuqzPW9DSU
         lm/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVTnM01sUHlscHrutkQnZEqLQnkfyzouAyqq06/7lPZ4XkodzkP3CPHHGxq3CI3M1eirCKzh+qiLLw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx44rkmFeEd0Kp80EdBiaKAWJ1CPW91gMjzSpY0WrGtzZra/f+g
	+FRhyk0I0WkVlhZ3oDKyk1512rG2AbXnTHxYoJqdVcry53lBu90Bhu6YcneZdwi+2YgsJpnvJPo
	=
X-Gm-Gg: ASbGncv+V3MCwhDPFKYZheFomhQY2d4UyJonEU9J0W/C0JYvZ4waQXLoa+PfuWhkuoV
	lTS4ipXDmyRb4LQopSpAGMlO6zN07r6r4ZLpcXNmr3CsCfrnbJk32xuxsIsfMGki06EG6mD6QZY
	dLopYObRBMJZCetT8Ul5bVJqmuBqjrNY7NeZ9CdWUwCzBHBJEzN1kcIfP0Vyq/WlJb/jnY4cIK8
	uVkf/ocFNYBmtyF7oJctCP9S6VweXwjV5jDZlp5zUofwz2hEuGsSRKl/5RWVJljnh3RNKxwUwlj
	aAcNweqk/SMRyCVMBDnzN63WHkkekpAZiIA=
X-Google-Smtp-Source: AGHT+IF3uBdlUcmUDYUstUEdTAi9dBk2kTBOC2+1XOH5oAzJbHV3QidF3PSZ3Ckus2z6pI5FXGRThQ==
X-Received: by 2002:a17:906:30cf:b0:aa5:274b:60e4 with SMTP id a640c23a62f3a-aa5f7d9558cmr132091366b.29.1733216686907;
        Tue, 03 Dec 2024 01:04:46 -0800 (PST)
Message-ID: <01fd16b9-f886-499e-b19c-59d20a089735@suse.com>
Date: Tue, 3 Dec 2024 10:04:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libs/guest: Fix migration compatibility with a
 security-patched Xen 4.13
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241203001629.132594-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241203001629.132594-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.12.2024 01:16, Andrew Cooper wrote:
> xc_cpuid_apply_policy() provides compatibility for migration of a pre-4.14 VM
> where no CPUID data was provided in the stream.
> 
> It guesses the various max-leaf limits, based on what was true at the time of
> writing, but this was not correctly adapted when speculative security issues
> forced the advertisement of new feature bits.  Of note are:
> 
>  * LFENCE-DISPATCH, in leaf 0x80000021.eax
>  * BHI-CTRL, in leaf 0x7[2].edx
> 
> In both cases, a VM booted on a security-patched Xen 4.13, and then migrated
> on to any newer version of Xen on the same or compatible hardware would have
> these features stripped back because Xen is still editing the cpu-policy for
> sanity behind the back of the toolstack.
> 
> For VMs using BHI_DIS_S to mitigate Native-BHI, this resulted in a failure to
> restore the guests MSR_SPEC_CTRL setting:
> 
>   (XEN) HVM d7v0 load MSR 0x48 with value 0x401 failed
>   (XEN) HVM7 restore: failed to load entry 20/0 rc -6
> 
> Fixes: e9b4fe263649 ("x86/cpuid: support LFENCE always serialising CPUID bit")
> Fixes: f3709b15fc86 ("x86/cpuid: Infrastructure for cpuid word 7:2.edx")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



