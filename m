Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B028B76AE
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 15:14:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714877.1116238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1nIz-0007En-Hh; Tue, 30 Apr 2024 13:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714877.1116238; Tue, 30 Apr 2024 13:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1nIz-0007DB-DY; Tue, 30 Apr 2024 13:13:57 +0000
Received: by outflank-mailman (input) for mailman id 714877;
 Tue, 30 Apr 2024 13:13:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q3to=MD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1nIx-0007D4-6v
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 13:13:55 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dd28226-06f3-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 15:13:53 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-34b64b7728cso4432651f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 06:13:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 y7-20020a5d6207000000b00346f9071405sm32107850wru.21.2024.04.30.06.13.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 06:13:52 -0700 (PDT)
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
X-Inumbo-ID: 7dd28226-06f3-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714482832; x=1715087632; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dtGolclzq88uODJEm3nxLOJqxwhPT4nbX6t8cqdZ4LY=;
        b=d0f93irxGQhkGgGdctp++rI6wTtt6B3MiODkMHwrVG9M9iUv5URXMGEh/22Q7Q8wGt
         q8oLdiPt9MzDMnN25JBfConm8QzgUfUYRmx115lWsWhG4h0KbLE3HA+B7/gaQ+Vz/WmI
         9QPV62zgnkHfpTuzEZHC3DCbRXFAx5YXuTcUhiaewSFdM+Ani1xSHhZkdVnzAKWetjHt
         b6Sg2MISVd/gKe3+a8dCRXrXG9DrWqd20sOodwQLlvX0gd7SHCCb4/DXCUeyQif5136Q
         eDWi0q4gmo2mjOuBQJ2rpMl4u7HQicH2ilvyyWLsyLsY2SX1GnWs404JmCr33QseY2iK
         +j/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714482832; x=1715087632;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dtGolclzq88uODJEm3nxLOJqxwhPT4nbX6t8cqdZ4LY=;
        b=jQnt/5RFybHz7h6bFyDYx+x2w90rB6RpbiWmwxKnEOG/9fzyNPwSDSzJfSJgz9iCF7
         rfpfMGSIYnmBj/NpTPaqukKfF2W9GPfnA2STu4xcW/9N6fddu+58pHahmg7J8N9GSp0t
         lDWS2HoDbhU6Q3wB0JpdpTuja5eHBlpwj9+GJnbbIK1sNgGqAz982jFeVODpa9YGN8oQ
         1VAKtOmFfd45HhGVwnnDo1zzs7D836cg56fsOwOhIMlSjDIqeeSwLPzOwtXsmmOAYsoI
         r9PFyS5Ivk0z3Gne0nGrRZVIVQmL3KLAQRvqSz2OQWG14a31Vz/73kt7aTN8rIhBODq5
         DO2A==
X-Forwarded-Encrypted: i=1; AJvYcCXVPSdCzuBCFaetws7i74bhiHOSt2ypoIXWZrVy0sHisWxx00J5AWTiC9VcCtKLMK1JFxNCv/KoCWlvMlum3/moFtVPTPP3r4bKcqOAJ/A=
X-Gm-Message-State: AOJu0YyUVnWrVLTu1aWWBomy9XL8oNfOsWUohNOFXuaTvw4NPk1LKkaF
	UF/je37rzoA3SiYyqWMEa8YxaghR3WH3P+8PKqqgaY/2Wng//BToFfl9kfmTsQ==
X-Google-Smtp-Source: AGHT+IHoI3WcYHUIzQjmXd7ZeymLwe08bWpgPOpNcV7NUpx0+jPsRLH8utoP+/n/+v/krZsrCcRlEA==
X-Received: by 2002:adf:f504:0:b0:34d:9dff:1119 with SMTP id q4-20020adff504000000b0034d9dff1119mr960226wro.64.1714482832479;
        Tue, 30 Apr 2024 06:13:52 -0700 (PDT)
Message-ID: <9915888b-018c-40c6-a26e-77e2011715a2@suse.com>
Date: Tue, 30 Apr 2024 15:13:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] x86/spec-ctrl: Remove open-coded check of
 SVM_FEATURE_SPEC_CTRL
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Andrei Semenov <andrei.semenov@vates.fr>,
 Vaishali Thakkar <vaishali.thakkar@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240429151625.977884-1-andrew.cooper3@citrix.com>
 <20240429151625.977884-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240429151625.977884-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.04.2024 17:16, Andrew Cooper wrote:
> Now that the SVM feature leaf has been included in normal feature handling, it
> is available early enough for init_speculation_mitigations() to use.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
even if ...

> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h
> @@ -217,6 +217,9 @@ static inline bool boot_cpu_has(unsigned int feat)
>  #define cpu_has_rfds_no         boot_cpu_has(X86_FEATURE_RFDS_NO)
>  #define cpu_has_rfds_clear      boot_cpu_has(X86_FEATURE_RFDS_CLEAR)
>  
> +/* CPUID level 0x8000000a.edx */
> +#define cpu_has_v_spec_ctrl     boot_cpu_has(X86_FEATURE_V_SPEC_CTRL)

... the names here were to change (see comment on the earlier patch). In
fact ...

> @@ -1896,12 +1895,8 @@ void __init init_speculation_mitigations(void)
>           *
>           * No need for SCF_ist_sc_msr because Xen's value is restored
>           * atomically WRT NMIs in the VMExit path.
> -         *
> -         * TODO: Adjust cpu_has_svm_spec_ctrl to be usable earlier on boot.
>           */
> -        if ( opt_msr_sc_hvm &&
> -             (boot_cpu_data.extended_cpuid_level >= 0x8000000aU) &&
> -             (cpuid_edx(0x8000000aU) & (1u << SVM_FEATURE_SPEC_CTRL)) )
> +        if ( opt_msr_sc_hvm && cpu_has_v_spec_ctrl )
>              setup_force_cpu_cap(X86_FEATURE_SC_MSR_HVM);
>      }

... the use here demonstrates my earlier point quite well: It being AMD's
feature is completely invisible here when not considering the code being
replaced. But yes, when looking at the entire comment / block, it still
is visible.

Jan

