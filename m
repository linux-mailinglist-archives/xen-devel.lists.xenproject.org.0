Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB000A66E27
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 09:29:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918598.1323251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuSJv-0002FJ-D9; Tue, 18 Mar 2025 08:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918598.1323251; Tue, 18 Mar 2025 08:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuSJv-0002Cs-AQ; Tue, 18 Mar 2025 08:29:07 +0000
Received: by outflank-mailman (input) for mailman id 918598;
 Tue, 18 Mar 2025 08:29:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuSJu-0002Cm-7O
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 08:29:06 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d10534a-03d3-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 09:29:04 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3996af42857so637540f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 01:29:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb7ea197sm17137830f8f.84.2025.03.18.01.29.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 01:29:03 -0700 (PDT)
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
X-Inumbo-ID: 0d10534a-03d3-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742286543; x=1742891343; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UfHz/ivDr3V8zIZ0HSmnHb6L7TfKKLfdJCyzThwmLbE=;
        b=ab3KGeOLLD+o4cGS1U6ZglFALGWhjRIpqL3HWzpNLqHyzSOig/Xa0AszBceYc1+23h
         7y/UBVupKEed0qgXyEK8GCPRMsd5zXVCLSfk/I+JLnwJ9IYaQL6+1lz/+U47nkvQr3ma
         sTczqyG8yuPlpenl5az76Q0AZnHio0bbvmcRcV71FNJ75YCkoGnpYsDcFAETzyfVct9N
         f7OTix6e4KesKwJchUwBJTjePNXuLH1UXLP5QjK4edf2cH6Ndt0bufiD4355B20SpqcD
         hUNCaaTpmuFfZTk6ASYL9zqvaX1r8LGyF5Bj27yVuseZoHkaK1RmQkOB2Gpchijl1Phb
         saTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742286543; x=1742891343;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfHz/ivDr3V8zIZ0HSmnHb6L7TfKKLfdJCyzThwmLbE=;
        b=aKU5GpJZ4bliqZi8RDSIMgXQCByjCJbjXch2piKuyKKIYN1irqEjPdSMa7JVyWuuF2
         xQ6XeFPH+OhQXeNYbjx/eHmF043uYTygjFy6lES1nB5m+5kiXfI3wtEa+dRkp3LNuTQC
         QkyUvc2VighDoXhU5Ez5RFcFtaZUYuiMI0BwdSaBCkOLjlDxC65dL1TR1l7R3eUQd60j
         rIxKw2GYO1Vx1RTgzdehmCTf7Q6CVgJ7tRXdAaLtI6T91tS9EDNXCWaly8pzgRAqobRI
         yYVHEdMZ/GED8/g2JMuELkjHLlkBP7fZEDFZtoLQ5LoWlajUFhe717a/1KkDT4XpJmPV
         e7Rg==
X-Forwarded-Encrypted: i=1; AJvYcCV0sXajnPYNqsdxU+iHq2lpDthm4galqwFaeJDp1S9ZXfSWEc3Fl3eLDhgvisE3vuhFLJlUbeEbUGE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTQ9LEIvTl/fJIfHe9tPJBRWHU6AB1fjl86eCLpL6b46Y3DhSP
	h7CH9pNaIDyKVFJEgY0vJVZzu4yXoxYHKMXAm3Oa1ldFM8G15Nv3xrHz7/Q+aw==
X-Gm-Gg: ASbGncvr1I9Zq69nFtWVmOoT98nOIyhKZEVbQgoeKbDSkErsSpKLuHIwfmwThy01vNz
	2EnFMHtx2XFOKuuseAjfPfOrWTjlpEMIUk+Od/XtckuUtWUKTTksXmLiBqCme9ceG0w+xzMh6n2
	boHzolnUh8C7T7Ma6WKr/qn47Qmry9qgsGSYWJGsqDwu+TJleZnyuIvma2Iasc2KcES6+O5bEkp
	2MNYw+Q34mLmKcY6ExxRvSe3I9b/4G2KIc4yx9uBAt3N/u3VC91GsBZax/7RZPVtZ8sECM0A4jp
	Io4/W9YK7mbIVXQnLVZAPY558NVFfKQa1+Fy+b5flMCdRMezLSS/tziUIMyrVjaU/e2K4omQH0b
	UPtJBcpM9v6pAcKwmglrdnKavckXKwrFjn5ALwHSb
X-Google-Smtp-Source: AGHT+IG9PmxYcB5UMhEq2CKQ9PXLstPBNT7FMUo98CavZijKt/eO1PQGh3jA30p6ot1Q2EMgCyjuqA==
X-Received: by 2002:a5d:648b:0:b0:391:2eaf:eca1 with SMTP id ffacd0b85a97d-3996ba46ab1mr1662854f8f.2.1742286543610;
        Tue, 18 Mar 2025 01:29:03 -0700 (PDT)
Message-ID: <3fdd1144-ede9-4b07-a479-39baf05b3a7f@suse.com>
Date: Tue, 18 Mar 2025 09:29:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/emul: Emulate %cr8 accesses
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250317184044.560367-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250317184044.560367-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.03.2025 19:40, Andrew Cooper wrote:
> Petr reports:
> 
>   (XEN) MMIO emulation failed (1): d12v1 64bit @ 0010:fffff8057ba7dfbf -> 45 0f 20 c2 ...
> 
> during introspection.
> 
> This is MOV %cr8, which is wired up for hvm_mov_{to,from}_cr(); the VMExit
> fastpaths, but not for the full emulation slowpaths.  Wire %cr8 up in
> hvmemul_{read,write}_cr() too.
> 
> Reported-by: Petr Beneš <w1benny@gmail.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Like in a few other cases I guess there's no good Fixes: tag to use, as the
omission must have been there basically forever.

> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -2285,6 +2285,11 @@ static int cf_check hvmemul_read_cr(
>          *val = current->arch.hvm.guest_cr[reg];
>          TRACE(TRC_HVM_CR_READ64, reg, *val, *val >> 32);
>          return X86EMUL_OKAY;
> +
> +    case 8:
> +        *val = (vlapic_get_reg(vcpu_vlapic(current), APIC_TASKPRI) & 0xf0) >> 4;

I think it would be nice to add a #define to apicdef.h that could be utilized to
use MASK_EXTR() here (and MASK_INSR() below). Otherwise even without such a
#define I'd like to ask that we use the two macros here.

> +        return X86EMUL_OKAY;
> +
>      default:
>          break;
>      }
> @@ -2325,6 +2330,11 @@ static int cf_check hvmemul_write_cr(
>          rc = hvm_set_cr4(val, true);
>          break;
>  
> +    case 8:
> +        vlapic_set_reg(vcpu_vlapic(current), APIC_TASKPRI, ((val & 0x0f) << 4));
> +        rc = X86EMUL_OKAY;
> +        break;

Both SDM and PM say #GP upon writes to reserved bits, without there being a place
where it is said which bits are reserved. Don't we therefore need to treat bits 4
and up as must-be-zero, implying that all bits which have no meaning are reserved?

Jan

