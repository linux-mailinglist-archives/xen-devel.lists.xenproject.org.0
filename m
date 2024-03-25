Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C4088A94F
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 17:29:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697820.1088966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ronCL-0001Tx-Lo; Mon, 25 Mar 2024 16:29:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697820.1088966; Mon, 25 Mar 2024 16:29:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ronCL-0001RP-J6; Mon, 25 Mar 2024 16:29:21 +0000
Received: by outflank-mailman (input) for mailman id 697820;
 Mon, 25 Mar 2024 16:29:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x9L4=K7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ronCK-0001RJ-SP
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 16:29:20 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d48902ab-eac4-11ee-afe3-a90da7624cb6;
 Mon, 25 Mar 2024 17:29:19 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5159f9de7fbso2710802e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 09:29:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p12-20020a05640243cc00b00568afb0e731sm3125505edc.63.2024.03.25.09.29.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 09:29:18 -0700 (PDT)
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
X-Inumbo-ID: d48902ab-eac4-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711384159; x=1711988959; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2N9eBXLMBlXsRNH82awHVSsQHNH8RgBb8IQ7LI5k6aM=;
        b=L36S+gx5hYeCBj2KtrHsZsGjoMvgUgDM94BkwfNzMNUz2HjYsducoMXRpOW8G9nWZ0
         hny1AL6Ivd0AQMRGa9iFhBRNgAjpN7SnbjsOWtpLYuMu5Wa4X1wcyOKRm1Wrd4mnU3d6
         ttKZXmut7RxVSWXJQjdoKDIFkN/UvVm40jsh4NZ331A29MH3cx45cQ/60Rk2ErBAgzzR
         idNc9KXZUCh91m1fSAfT6cZ3NEVHHhTMmv0/O1/cVb3wmZZdcKYYmk96amOA9ELfk1wo
         pp2GAhB1BMpn6C8vaqVDSykm4t23szzciY6pLlrZAeDXaZHHPoC9oZWAqFfiNAOrPSu0
         +YHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711384159; x=1711988959;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2N9eBXLMBlXsRNH82awHVSsQHNH8RgBb8IQ7LI5k6aM=;
        b=F1E0viffy00BtCvy6FYJV8yvcllwPQofKV9yVRqGinYKR0lfwYLLHedOLOVts4rMIS
         YQeQ6J4XD4VDBTssK6nSj9bAswUmYhEKqar2IJ7S8u6oPwjOLWgpiVpGdX4J1qWzdUg7
         SM86Uf1prhrzcYIcYtSITc5xDSL1ZryRpaOi7HEiD1jr0BljtP+5UCsypvRmKBGASBd/
         6AEhnas4146gtg3DZZRm+0P429Xnl4XnUD0+dzTRBxWRne8g5wnvFmhXY0SHyzxlzpAW
         IAjUXN1uCol1SYwVPA23y0CpmCYOt8OfCRblPiWnUfh7+QtgDBBliaARK15cMLKpegcw
         FAow==
X-Forwarded-Encrypted: i=1; AJvYcCVdaqCShBh9rF5UKbnFIF7a0BBohBGddnTNcGInUwBoNAjRgCWgfnVq6yOfgnGfyC8Ey5pRPM1Z9nlDpeZoDalWno4rN6NWcTjH6o1vGrA=
X-Gm-Message-State: AOJu0YxEsI0Pf1jyGQy7c+ZAQ0R7CavAL04h+z3kYKlljP9CjclNPmM+
	EkKYLtg5Gl60oBmpGIi+L7ES/Z06LqBOUpuz2i1+uTvqL+ZdzLGijW7mIdl13Q==
X-Google-Smtp-Source: AGHT+IHW6Gb9m2DU1jo92YOMCIuxIp/YltamAgw1Z1WXoa6CoPJQn3HQQEjW67cwnnaSvpfhHXqsAA==
X-Received: by 2002:a05:6512:1cc:b0:513:cf52:3c15 with SMTP id f12-20020a05651201cc00b00513cf523c15mr4971677lfp.49.1711384159145;
        Mon, 25 Mar 2024 09:29:19 -0700 (PDT)
Message-ID: <4648a287-7d65-4a55-9800-4389229b79a7@suse.com>
Date: Mon, 25 Mar 2024 17:29:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/2] x86: Refactor LBR feature to MSR_DEBUGCTL feature
Content-Language: en-US
To: Matthew Barnes <matthew.barnes@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1710524011.git.matthew.barnes@cloud.com>
 <2f690a115fc78989bfc2e331221d7e10b5dcb196.1710524011.git.matthew.barnes@cloud.com>
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
In-Reply-To: <2f690a115fc78989bfc2e331221d7e10b5dcb196.1710524011.git.matthew.barnes@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2024 18:52, Matthew Barnes wrote:
> Last Branch Record and Bus Lock Detect both belong to the same MSR.
> 
> The same mechanism that restores LBR also restores BLD.
> 
> Therefore, the name of the feature that enables this mechanism should
> reflect restoring the MSR, instead of one field.
> 
> No functional change.
> 
> Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>

So this in part is what I asked about in reply to patch 1. However,
afaict the order of patches wants flipping and ...

> @@ -2129,10 +2129,10 @@ void percpu_traps_init(void)
>              return;
>          }
>  
> -        setup_force_cpu_cap(X86_FEATURE_XEN_LBR);
> +        setup_force_cpu_cap(X86_FEATURE_XEN_MSR_DEBUGCTL);

... besides here you also want to engage the feature when using BLD
(in the other patch, once that comes comes on top of this one).

>      }
>  
> -    if ( cpu_has_xen_lbr )
> +    if ( cpu_has_xen_msr_debugctl )
>      {
>          host_msr_debugctl |= IA32_DEBUGCTLMSR_LBR;
>          wrmsrl(MSR_IA32_DEBUGCTLMSR, host_msr_debugctl);

This can't be quite right - LBR shouldn't be enabled without the
respective command line option present.

And btw - I don't think there's a need for the _msr_ infix in the new
names you use.

Jan

