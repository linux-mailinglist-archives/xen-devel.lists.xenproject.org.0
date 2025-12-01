Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A66C964EC
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 10:02:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175621.1500238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPznZ-0002Dk-Kt; Mon, 01 Dec 2025 09:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175621.1500238; Mon, 01 Dec 2025 09:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPznZ-0002BS-IG; Mon, 01 Dec 2025 09:02:21 +0000
Received: by outflank-mailman (input) for mailman id 1175621;
 Mon, 01 Dec 2025 09:02:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0dw1=6H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vPznX-00029w-Ju
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 09:02:19 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fa488b5-ce94-11f0-980a-7dc792cee155;
 Mon, 01 Dec 2025 10:02:17 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-477b198f4bcso26871385e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Dec 2025 01:02:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4791dd135d9sm49372115e9.2.2025.12.01.01.02.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Dec 2025 01:02:16 -0800 (PST)
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
X-Inumbo-ID: 6fa488b5-ce94-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764579737; x=1765184537; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6xUAFiWi0Ksfg3GF1JP4kl6rTs30VL0+0fE1agqihzY=;
        b=BgXu2ClhCTYhO6B0RCER65l1HuCo684jhnHCMhOtCBzR+CVV+6oPMhmLJy99ZyAcVQ
         S7Aa0M9hrK8blLj+xRZEYwjMC0R6bIPDnPsGeXOgE1om7B9g0u8pLtvos1DUBiWyOtmD
         4aNghAq/xkAUr9413GhkCV9S/au2jPmhc/pNRRHeb0NuDqQETnw+R/+xgUzxWpzZu+JC
         ttVLqz5RODVXhk7e/piHjUHOkSFAgoFX3jDo9MylhRoPQkGV0hLz1HLNsVvXI343hsMA
         ABBNiyTqr/cLskTIOGNOaFcir9gl3tzAbkrFCcNPJk4FtbJLJazM8tzTAAMMCXjV5qOc
         twSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764579737; x=1765184537;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xUAFiWi0Ksfg3GF1JP4kl6rTs30VL0+0fE1agqihzY=;
        b=whgxyIJu3UPwFqXKk3fC6kjy9gSD2z5OKj8DwKR8Hr95eiTxtq1DWVzoX7UaeGQoUp
         FZUWJJhzMxb6QsyxdogBNjxllk39i6PE6b84JKjSSDC1hqWuzZ8Ytz6EcT1Vf7QTOidq
         Euyp5/sfi9Db143ofZaNEhbVZzFJuNpyJ3vs6zlZVP726nnl1y9Iio8MOURCir+oT56l
         9vUfT+XZNVfgwHCjg3avIoSFU3xjV7hoUiTmMDf95y0pEaLfCp5E2jGeNh3JsDZFRuMC
         70mZmdH4qAxoqZWFwUrFl3WEsHbCGNAvw2xkvKV8brP5XteEjaTzV5vaJWpsRMdRbaCs
         4PaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRoa5aFrpYV1w+2ZFjlloLX0Mm8xsvnpepPphgQsHsCNtbEVL/ZuPrtKg5IqZD4cBZZEs39QsUMa0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8A8RfzfxduU0BRZjWWkRD6rYOMSx+Jc47AyQAgsq6unn0pevV
	JBk5202bkG3fKdab0OagpfuHlZNIBg+105wL1l2fwCoqWVftBiCDVMtsx/+AhwbVzQ==
X-Gm-Gg: ASbGncuAb67nP5PS1G4wXSfx8GdB330ItCVB2DyWzRZSx0NmMknGwJPOeGVReMICLda
	UHvGDGwaUa40aco1TAjPAoujvWJWIhaMnMsiG/Nzljr1Qd22cnTOxB2BGCmK6znNMQlJmmtZiPf
	W+V1tzgrqZTgl/Z+Q4zHNKkmoqajWTDGrSP0H1vlTnKXAq1445pNVLC25T8Qjl6BFoxgNk0BssL
	CuD2M1BzPjDI8ZP412v4Ahfw4MrYvRlT5ntoebjbLb48CSD7HcD0RpwwK1yaw040P9RmQpu7j0v
	hM3lJ6fFOBW8AmviXInpmGPzzWur3aQRb57YQWwvkIGkNUoZKE4ev1EQzlehAcbVMLGH8tJ5F+w
	8NkHY+2n+mqP6xWgECO4hK8CUDFt85SRyaJrVd0L12luWJoNfoT+KZhiSo86AeDfrJO1bWBlwqO
	/yv6ASrzVRNof8inKJwxQOvlblxXPMGtEAV8FToFJ07zmqCN6xUGvtG8WFSwzS1ZXAU6QmiKVX0
	C8=
X-Google-Smtp-Source: AGHT+IHf0W4zmO3A+wQiAtPcRpcq1ZqTU5Rfi1CySt5nQeHb06ykCJnClKyiTg0QIeoXJ/K0j/roJg==
X-Received: by 2002:a05:600c:3541:b0:477:9650:3184 with SMTP id 5b1f17b1804b1-477c0165bc3mr381558615e9.2.1764579736622;
        Mon, 01 Dec 2025 01:02:16 -0800 (PST)
Message-ID: <796dccdb-0cc4-4904-b776-d651ebb012c2@suse.com>
Date: Mon, 1 Dec 2025 10:02:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Unilaterally inject #UD for unknown VMExits
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251128174735.1238055-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251128174735.1238055-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.11.2025 18:47, Andrew Cooper wrote:
> While we do this for unknown user mode exits, crashing for supervisor mode
> exits is unhelpful.  Intel in particular expect the unknown case to be #UD
> because they do introduce new instructions with new VMEXIT_* codes without
> other enablement controls.  e.g. MSRLIST, USER_MSR, MSR_IMM, but AMD have
> RDPRU and SKINIT as examples too.

USER-MSR has MSR_USER_MSR_CTL, so doesn't fully fit here? (It's still not us
to directly control exposure of the insns, but an OS would need to use the
MSR to do so, and hence we need to properly handle writes to that MSR for
the respective exits to become possible.)

MSRLIST has a dedicated exec control, so whether the exits can occur is
under our control.

RDPRU and SKINIT have dedicated intercepts, without use of which the
respective exit can't occur aiui.

IOW it looks to be really only MSR-IMM which is special.

> @@ -3083,8 +3067,13 @@ void asmlinkage svm_vmexit_handler(void)
>          gprintk(XENLOG_ERR, "Unexpected vmexit: reason %#"PRIx64", "
>                  "exitinfo1 %#"PRIx64", exitinfo2 %#"PRIx64"\n",
>                  exit_reason, vmcb->exitinfo1, vmcb->exitinfo2);
> -    crash_or_fault:
> -        svm_crash_or_fault(v);
> +        fallthrough;
> +    case VMEXIT_MONITOR:
> +    case VMEXIT_MWAIT:
> +    case VMEXIT_SKINIT:
> +    case VMEXIT_RDPRU:
> +    inject_ud:
> +        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
>          break;
>      }
>  

Should this be brought more in line with respective VMX code (kept) below,
in never bypassing the gprintk() by any of the case labels? Basically
meaning that the case labels you move could simply be dropped for the time
being (or else, like the INVCPID one visible in context below, would want
re-inserting a few lines earlier).

Jan

> @@ -4902,14 +4903,9 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
>      case EXIT_REASON_INVPCID:
>      /* fall through */
>      default:
> -    exit_and_crash:
> +    unexpected_vmexit:
>          gprintk(XENLOG_ERR, "Unexpected vmexit: reason %lu\n", exit_reason);
> -
> -        if ( vmx_get_cpl() )
> -            hvm_inject_hw_exception(X86_EXC_UD,
> -                                    X86_EVENT_NO_EC);
> -        else
> -            domain_crash(v->domain);
> +        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
>          break;
>      }
>  
> 
> base-commit: 117a46287427db2a6f5fe219eb2031d7ca39b603


