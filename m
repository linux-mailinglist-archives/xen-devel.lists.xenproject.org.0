Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9EAB2C0E8
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 13:48:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086485.1444669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoKox-0004KE-Ub; Tue, 19 Aug 2025 11:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086485.1444669; Tue, 19 Aug 2025 11:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoKox-0004Ho-RU; Tue, 19 Aug 2025 11:48:07 +0000
Received: by outflank-mailman (input) for mailman id 1086485;
 Tue, 19 Aug 2025 11:48:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm9j=27=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uoKow-0004Hg-9E
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 11:48:06 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d5e1916-7cf2-11f0-b898-0df219b8e170;
 Tue, 19 Aug 2025 13:48:04 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-afcb731ca8eso831848166b.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Aug 2025 04:48:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdcfccd2csm995431066b.64.2025.08.19.04.48.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 04:48:02 -0700 (PDT)
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
X-Inumbo-ID: 5d5e1916-7cf2-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755604083; x=1756208883; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=My2ElW1CsGaUg2rzbVlSnaqbwMsFuvhdNanh+sAhnxA=;
        b=dhy+5rb7jEGozIZdU08zYlmNriykoDNDb8ALsWbWVpOYbpW7PG60cQ7CkXeQtfNaul
         039/ASmbaYqZrdvzoFrnSBackkDZ8NValfVx25tf9t2cMtp4sDeA7hvrZ00TM5emXcQW
         NiaLSFUXG1tOmTYsCJaXVfU2NO+HJkjpvpEau88Eq4EWG+aABiG9x7n+KPaAtvN52hPX
         2pDm6N3NHPgvpLQCJOEULWAB3ATMl0AC1MpHouph8FtpeOG1wTLcN3jFld/03PUQEj6P
         jrvdjWVDm5rs5n0KYrVt2oSniAlZLZsdMzQaLXQxDb+JbiycKfoz24hX3MPWIF/5Nyl8
         ditA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604083; x=1756208883;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=My2ElW1CsGaUg2rzbVlSnaqbwMsFuvhdNanh+sAhnxA=;
        b=AiJmXibDdUeCGQqK5/h+UgPUCZoLvwiWTzgiK72v5qBQRkjSCgiTb0vT2uww7ngkPZ
         ZsyT4FixWJsK5KzHTn5I53YnTNuTTGnVDWsKj9jcKsIplJzwOLQUNCSVU0nkotTGz3Vy
         WOGXfI4sOTmRCJU43FBHlzQ8XAuWAvo1AMdaDWTzJPlyMZlZPK2UQ60kekqRKJdzZcCh
         g9umQ9Nexx4m11SGCQfi4azvzL/LvzV9svh+6baSFm4Sq8i1A3aCGGN/1obUT1TFBvIl
         Irni/FXp8yxT683186+ahKJKVwrN2xZCBcfd49p9PNwhkbiabadxk+JKY9mBA+yuuAxL
         F3GA==
X-Forwarded-Encrypted: i=1; AJvYcCXnoJQn1WhJjYcB9gzfwM0ZdOP3qmtit41mc67sXb/Smafbg8eBEFQsJY2Nk3IemFa7ul9ffjel0jE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzpOjNJhgLSSuZBAFBGkvtjVLhGef1TcQjosfTFsnglw4UhmKae
	ZvAJZNDkAKqAzhdML3AGCfuU2jjfPv8mcl0CnQ77FHa6E9BetQ8+YvMBEVzhi8LTzQ==
X-Gm-Gg: ASbGncs2csZ8ugSCIUCuTSlw/ZUfkz+y805MJPLNjqMSVTBPRg3HbicgV5nwbHabdpm
	85xCT3HcbxJF9KCYsq5cywqkD+qFEEWRi25NyhKsBwvzvGCtt4uSa7kPza2KDM4G2NpdrU6BtVq
	bHimCgNiMmjS/RVAFq/lNSREVKSFdxsJJkKIsMkmuYu1orl2quOC/iu6YSrqvrCJ3AwPB4mPIoo
	gIjcyuO43Np809bPBXoHB8codK2pqnCCU4VoVJtyQHMZK1CSJPZ138MkI+7PcOCbwlgxwqmu/mG
	4Z+dRz+ZlRzoPwXqhy9k26UTlQH5Rd7Nsh1Fx1YHnyC/B7e/xxPBD0qNWFR+FUY43h19tcwrL54
	QszURdQkMe7hNwX+S8HF5opVAdTg38vmhmQY7CIZUcQ3J9Gp2S7chzm86yoj8x+vndwtqHYPu3B
	ElpAW1PwI=
X-Google-Smtp-Source: AGHT+IFJ7Qt+cEYGPN1crwlMkRDH8kRKy/cPG5jbUN8CgyxuspUjzGm24MXleu0wtEdhdSUGeF8KbA==
X-Received: by 2002:a17:907:969e:b0:afa:1b05:69c3 with SMTP id a640c23a62f3a-afddd1e905amr179355366b.47.1755604082776;
        Tue, 19 Aug 2025 04:48:02 -0700 (PDT)
Message-ID: <718dda6c-120f-443c-ac9e-de948bcd6ce4@suse.com>
Date: Tue, 19 Aug 2025 13:48:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/16] x86/svm: Rename variable in
 svm_msr_write_intercept()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-11-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250815204117.3312742-11-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.08.2025 22:41, Andrew Cooper wrote:
> We're about to turn the rdmsr() macro into a real function, at which point
> Eclair complains that we're now shadowing an identifer.
> 
> Rename rdmsr to is_rdmsr.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -2087,14 +2087,14 @@ static int cf_check svm_msr_write_intercept(
>  static void svm_do_msr_access(struct cpu_user_regs *regs)
>  {
>      struct vcpu *curr = current;
> -    bool rdmsr = curr->arch.hvm.svm.vmcb->exitinfo1 == 0;
> -    int rc, inst_len = svm_get_insn_len(curr, rdmsr ? INSTR_RDMSR
> -                                                    : INSTR_WRMSR);
> +    bool is_rdmsr = curr->arch.hvm.svm.vmcb->exitinfo1 == 0;

Could also have used the shorter "read" or "rd" instead.

Jan

> +    int rc, inst_len = svm_get_insn_len(curr, is_rdmsr ? INSTR_RDMSR
> +                                                       : INSTR_WRMSR);
>  
>      if ( inst_len == 0 )
>          return;
>  
> -    if ( rdmsr )
> +    if ( is_rdmsr )
>      {
>          uint64_t msr_content = 0;
>  


