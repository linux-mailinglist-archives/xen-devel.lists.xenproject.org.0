Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE678CD5FD
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 16:40:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728591.1133567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9c4-0002iH-FJ; Thu, 23 May 2024 14:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728591.1133567; Thu, 23 May 2024 14:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9c4-0002fm-CS; Thu, 23 May 2024 14:40:12 +0000
Received: by outflank-mailman (input) for mailman id 728591;
 Thu, 23 May 2024 14:40:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfYh=M2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sA9c3-0002ff-23
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 14:40:11 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a5d610d-1912-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 16:40:08 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-51f72a29f13so8471526e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 07:40:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a8b634cdcsm1273944166b.93.2024.05.23.07.40.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 May 2024 07:40:08 -0700 (PDT)
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
X-Inumbo-ID: 5a5d610d-1912-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716475208; x=1717080008; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xqmg/5bHXpvAGEEaqsoUjDPL7Nq0u+YnyGx8vXG1hqE=;
        b=EOr79bkXTWBKk2Io6oo51ZETSbuWYihiN+3IHX1oH2ef8qRd3NfBoa+OEqNoKTIHTR
         H8l/F+0SGw/59kw7O3bEoCtu19z2AYI+mbyL2hACiZW+8wgHp/FiR+lvdOuxMDTVjBUH
         NdTG+8cUJ9E/v3luAb+3yHR+JskK4eh+E35b9QQ1jZWzuxPmSWQN9upiSwvL1Cy2ALb6
         jE6GliwooDQq8jy/2W4gi+XVfoMrJairbGjk/OQTVTQK5NxpZewUin7xQuh7ncRVr7HG
         CMeVEMnHYUQpbGrmocfPH3/cScr7F2ANEINct0yzOLRo8g45l+UR/CxSFhCusEeWwVov
         cy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716475208; x=1717080008;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xqmg/5bHXpvAGEEaqsoUjDPL7Nq0u+YnyGx8vXG1hqE=;
        b=TRV4lQU6h8xR7t4osCmxHTtVcbPvIYKRkThdeZoZJ36LDBIDlhBZBAQCOT6d5kA6/g
         y7ECmMeWEcyzMOrUNBUrVLHgeGMK6DO8o9gCmnt635gKHCNSEhHS9inzvtLGXpnvp3gC
         8EP5Flw+6wqMnhmr+xXVFnAbFyDizY9Vr4bluL74vDgo5lQyCk971C35aAxPQtgPh0+r
         xeM1ilUwUOiNrhNWqpOzopK8UPnt3HJonLJS0XMJVzqeqp3EZuCCgP+Gvpah9+O6SQ1H
         o7a9XPT1msiCxyFrcNegiYBuGPAKA24pWgsu6B3u/wgDhRN3p/Q9BtFRVcIZg7wZQshs
         7/TQ==
X-Gm-Message-State: AOJu0Yy6NTbk53VGAOjDGXnKvEczJSgyex1gvxnudUZL6zMZBVL2Ngwc
	QKCEFBCoCgvp0J9rZasLfqBLvAo+3cxh02fNmlk6LXcg1uMOM5UjeMs8EG44Ew==
X-Google-Smtp-Source: AGHT+IEItCjRFcPmFHxm1roTCY7vzDOBfQ5d/etwRM880v92g4LJoIuF3mg/asujHHrqrPEZAbYBJw==
X-Received: by 2002:ac2:4844:0:b0:51f:b781:72a7 with SMTP id 2adb3069b0e04-526bf451ca3mr3348299e87.60.1716475208349;
        Thu, 23 May 2024 07:40:08 -0700 (PDT)
Message-ID: <8dd92e22-2a7e-414b-98b2-c10ae449f825@suse.com>
Date: Thu, 23 May 2024 16:40:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] xen/x86: Simplify header dependencies in x86/hvm
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
 <00ce7005d1d6db5c1ffc2d5023d34d4bd34ff841.1715102098.git.alejandro.vallejo@cloud.com>
 <Zk9Upg9y03IYZEXd@macbook>
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
In-Reply-To: <Zk9Upg9y03IYZEXd@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.05.2024 16:37, Roger Pau Monné wrote:
> On Wed, May 08, 2024 at 01:39:21PM +0100, Alejandro Vallejo wrote:
>> --- a/xen/arch/x86/include/asm/hvm/hvm.h
>> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
>> @@ -798,6 +798,12 @@ static inline void hvm_update_vlapic_mode(struct vcpu *v)
>>          alternative_vcall(hvm_funcs.update_vlapic_mode, v);
>>  }
>>  
>> +static inline void hvm_vlapic_sync_pir_to_irr(struct vcpu *v)
>> +{
>> +    if ( hvm_funcs.sync_pir_to_irr )
>> +        alternative_vcall(hvm_funcs.sync_pir_to_irr, v);
> 
> Nit: for consistency the wrappers are usually named hvm_<hook_name>,
> so in this case it would be hvm_sync_pir_to_irr(), or the hvm_funcs
> field should be renamed to vlapic_sync_pir_to_irr.

Funny you should mention that: See my earlier comment as well as what
was committed.

Jan


