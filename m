Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A83B26751
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 15:30:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081728.1441741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umY1y-0007DW-2A; Thu, 14 Aug 2025 13:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081728.1441741; Thu, 14 Aug 2025 13:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umY1x-0007Ac-V6; Thu, 14 Aug 2025 13:30:09 +0000
Received: by outflank-mailman (input) for mailman id 1081728;
 Thu, 14 Aug 2025 13:30:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umY1x-0007AW-2x
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 13:30:09 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb709a6a-7912-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 15:30:08 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-afcb78fb04cso150578666b.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 06:30:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a1e8306sm2608020566b.83.2025.08.14.06.30.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 06:30:06 -0700 (PDT)
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
X-Inumbo-ID: cb709a6a-7912-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755178207; x=1755783007; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1iIUrcmnSM5eogYqDCcCjFRVuLj75gpAVQMZtG6TB2o=;
        b=SA5Vmf/2BZ5qUOBiv4xzaw4/6FxAUnih4REK8UpIEJSu9WE8ldBuHnyfgYYrawYizc
         YxT55NRvpe1wyRyQV/56jBzROzBeHtB0cl+tdeP2z8AMSbxPWKqdeS87/Iku7s83adZb
         6OnJT+r2Pq80IutpO7Z2TEAuHNAu9rvKg1vF4QV6YxARoOtOEwsqxbJ9R+5z7T8IRCnR
         20IoAi9myCro9ipjCgohhZvEBnLHPPM3dbB9YbR5oE0ZYeNMwpDqhA+DffKPb4QA1Qai
         PsnlaSgG+LKsvMa9odSY1ekhuqFtned2xp+G8pD8jmD89hzYIDhIK8qwj1zXk/mvOPal
         MvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755178207; x=1755783007;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1iIUrcmnSM5eogYqDCcCjFRVuLj75gpAVQMZtG6TB2o=;
        b=jhejyevhJhhad7sNClKWVUNQ2lQ1lkXqDCexuHoSwNVLTXz8/KnMPnObBm+CbarEfi
         Ejnw8wm/IB+GL7xIMD0Uevb0BqcnEeRlzYR9Sn4DelSXODeqk/se+yBYwNYHmglB5fme
         3hM+7Kj4s1bnpD14/R5R5Dg+8C6LVBOBR1wCSX/twOj4GYI3Q3N9gv7U6sGICZjqnwWe
         q4ATPmaIIlc/0oWAGr7UGeltXEL5PMzz/afpu171QExI/+G522M0HisQH4IMlW7Lr0He
         53XIwDRPBSjYJx8mZtrzgjLBBPvgjcyQI5Tug/cR3oDSY9iF5NnuXcBLLU0jC19njyV9
         ehgA==
X-Gm-Message-State: AOJu0YyTXu0yvSB4KSqhbCY+k9ulba9vLGFe7sPuiNT5Si3h51aqvFci
	4SVQfmkUxMvfwVCMm0wE/t0HBnSu/bFo3cCyd6TvC19DkqkiAPrrAsgijJPyGMTJJDzu12ryOTq
	xGo4=
X-Gm-Gg: ASbGncscS1vsP+nn2/eE5J23mr13Wxw3FO94z/BEmjpyebPT83ue1VfbU7f8Bi5Kpd1
	A1n4tMh5PNB+OQ6FSm8kJW/OdgfbRghL5qeS6aP3E9IAOk6BJaBlnUj/0V6nvv6HFmrS4kDqvPw
	wRQr7rJmx8wB8cI3x/XYYNQAo2VQvTc4do/6OpyEHeTgSP2iNSVEfOBGcMjdmJkFBGURgWJSYXj
	RuINr6/l5OmrGzaBo67VxvcNR3TM0qf+Bwh88h8nmtx516x3RA4XVUcbx2b2bhbeAL4tUz1l2FP
	xAMgEVMwdCeFUXSo2q9InohPITJA3+W5tyMf56amG0OiRCyTBeIlvH93gd6e1MM/fMFEWcBB9tG
	x2PUhKsRA/HvexVDBPTdq1C/XnO6dXRQ2PSBv49K61DM3IsWwQWeZNVk7rD6Yv0GL0Sj+qdoldO
	s+R0cxbxF9PhbklJoGO4kGK9krIH1m
X-Google-Smtp-Source: AGHT+IGBomTxEt8gXR/H3fLzs4mEoKoviCqbnHyXfWeXIKEOqVJKIE9YphHyTC1jsUEqOOl4VlYS7g==
X-Received: by 2002:a17:907:72c3:b0:af9:3ad2:6923 with SMTP id a640c23a62f3a-afcb996b207mr334753166b.38.1755178207183;
        Thu, 14 Aug 2025 06:30:07 -0700 (PDT)
Message-ID: <0a6b6fce-2cc8-4933-8703-399e4a4fdad6@suse.com>
Date: Thu, 14 Aug 2025 15:30:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/22] x86/traps: Introduce opt_fred
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-16-andrew.cooper3@citrix.com>
Content-Language: en-US
Cc: Xen-devel <xen-devel@lists.xenproject.org>
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
In-Reply-To: <20250808202314.1045968-16-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.08.2025 22:23, Andrew Cooper wrote:
> ... disabled by default.  There is a lot of work before FRED can be enabled by
> default.
> 
> One part of FRED, the LKGS (Load Kernel GS) instruction, is enumerated
> separately but is mandatory as FRED disallows the SWAPGS instruction.
> Therefore, both CPUID bits must be checked.

See my (further) reply to patch 13 - I think FRED simply ought to depend on
LKGS.

> @@ -20,6 +22,9 @@ unsigned int __ro_after_init ler_msr;
>  static bool __initdata opt_ler;
>  boolean_param("ler", opt_ler);
>  
> +int8_t __ro_after_init opt_fred = 0; /* -1 when supported. */

I'm a little puzzled by the comment? DYM "once default-enabled"? Then ...

> @@ -305,6 +310,32 @@ void __init traps_init(void)
>      /* Replace early pagefault with real pagefault handler. */
>      _update_gate_addr_lower(&bsp_idt[X86_EXC_PF], entry_PF);
>  
> +    if ( !cpu_has_fred || !cpu_has_lkgs )
> +    {
> +        if ( opt_fred )

... this won't work anymore once the initializer is changed.

> +            printk(XENLOG_WARNING "FRED not available, ignoring\n");
> +        opt_fred = false;

Better use 0 here?

> +    }
> +
> +    if ( opt_fred == -1 )
> +        opt_fred = !pv_shim;

Imo it would be better to have the initializer be -1 right away, and comment
out the "!pv_shim" here, until we mean it to be default-enabled.

> +    if ( opt_fred )
> +    {
> +#ifdef CONFIG_PV32
> +        if ( opt_pv32 )
> +        {
> +            opt_pv32 = 0;
> +            printk(XENLOG_INFO "Disabling PV32 due to FRED\n");
> +        }
> +#endif
> +        printk("Using FRED event delivery\n");
> +    }
> +    else
> +    {
> +        printk("Using IDT event delivery\n");
> +    }

Could I talk you into omitting the figure braces here? Hmm, or perhaps you
mean to later move code here.

Jan

