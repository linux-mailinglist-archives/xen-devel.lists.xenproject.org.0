Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9B6A67734
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 16:05:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919240.1323736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuYUm-0000W8-Bh; Tue, 18 Mar 2025 15:04:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919240.1323736; Tue, 18 Mar 2025 15:04:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuYUm-0000UJ-8t; Tue, 18 Mar 2025 15:04:44 +0000
Received: by outflank-mailman (input) for mailman id 919240;
 Tue, 18 Mar 2025 15:04:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuYUl-0000UD-Fm
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 15:04:43 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 523ef351-040a-11f0-9abb-95dc52dad729;
 Tue, 18 Mar 2025 16:04:42 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso33065465e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 08:04:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df402esm18088631f8f.1.2025.03.18.08.04.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 08:04:39 -0700 (PDT)
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
X-Inumbo-ID: 523ef351-040a-11f0-9abb-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742310282; x=1742915082; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rGK4Ftrj+XdoAh0/IYrB9GghAWeBhcXrl2SHpxmlLVA=;
        b=X9s/QnLrX9qbwehJ6CrM02TRkT2n5iOXVDCe1DYVUVfEL83niVFvg4MoyearAOovcW
         NbsVPNFXrXaZ+7e1g5cGcHVC8lLcXx1qPfq+Fx1wOTeoHUm8rX/mxr6NmKcRLz7oPyJ+
         cNdZe3EcA976mHMmFjuhyO39VaNQKxb76Xz/KWpFND65dgCw4CC7DabDg5Wfrhk8ZOL9
         W5IsGu75OmTGxKHqV/TwIkk38XDrRjwz8fbWNGNG0cmTM37KwR4KLls0H1K4QD0NJcxO
         IcONtoOAquOEao2Cusp2qFQNbFNEMn+EpHu7ZvWtoZt1DThcx/MGxvT2p5801os9jW+l
         ACGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742310282; x=1742915082;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGK4Ftrj+XdoAh0/IYrB9GghAWeBhcXrl2SHpxmlLVA=;
        b=o9Y5hM9opBhraUb8pgSYd8RQto56C7lhXkyVHZcMC5xvlZKy1x2ASgt1mt4iZS+7Td
         r2MxgFN85/IDEmyl0MLN8PT4ztm2RH/pXH4wfoKoIMA05PabOXJ6si4pUuAXepJm+cPM
         ueAypsRYODJbH4XC1D6CTb5ZZtAGPppvBBX4eR7uAhaXrnJzDe9XIoDWgtbKONRogp40
         pOIOu8PJrre2uAwfbAG7YKD8za8tc51cNDkNpYTk+twutiSJNAguuDamEyJGXqaO9VHw
         Wgwmuz6SVMt8vAH/AEISoVNZJzCieIlqgCK2es9AQv8NC9/Xl9mPzhuT3iGoCB5/ByBE
         XGFA==
X-Forwarded-Encrypted: i=1; AJvYcCW5Nc/zOOipT1xK9WasIG5C9JqxeBuwidxfRTr458lEc8gnNwG+HnJPbyETaCDBJiZeGXwZndJUKFo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBI3EslcOr+1IDavrVclTddoZwbN4pAqcmQZfqBDIjX4eG5yBi
	SpNC+NkbAvhDSkDXaOhexkUIMPFVG555f4z1J6/ak4yyA4P02LEWJxDhXZz2Jw==
X-Gm-Gg: ASbGncvpeXvH2tnPzhRKv8I7j+GsiKPD5cWEJ/mHd5Jmv/nkCmgrJiVdglBQyOtc/MF
	iesqCcHZ7/d9WWHW0YRGFOqzjIdM9sXsQOIcNAvLIfVFWngldbRR4ua74FjN6X92ebBkmhBaEbW
	wUckr198icHlsSjdMnpexZOcpM/hMN9UqU6jCjcqV3GkAd/Dbi5Eg2gfc1HaCpO5lkyi4DsSmXT
	U3H5qjwAlpR+GYKE9vbayXoD9uHQD2IAKRvD1ShQKxjfjZEFUYqLiDkWs3TRO2gS7c0fIvWSxx1
	D5aoUZd5vLN8HaffhedsRLsa0cqrJpX99dmbUNzqsdGRRrsq29LEaHiTXRyubr+AZH7WdLsWibh
	j8CxaNGWo9WKI/QEEX1ln9uP6Gh+rOA==
X-Google-Smtp-Source: AGHT+IGStquB1Q+f7fkxdfDvV2PPK4NTRJ/9i+eCAtbHXVl7SxOxhkOnc3CmbEq63cyfwPTdD3pZGw==
X-Received: by 2002:a05:600c:a4b:b0:43c:fb95:c76f with SMTP id 5b1f17b1804b1-43d3b98d8bbmr24701245e9.9.1742310279774;
        Tue, 18 Mar 2025 08:04:39 -0700 (PDT)
Message-ID: <29d2d036-1e4f-44b9-a3a9-843f572f3f2e@suse.com>
Date: Tue, 18 Mar 2025 16:04:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86/traps: Move percpu_traps_init() into
 traps-setup.c
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250317192023.568432-1-andrew.cooper3@citrix.com>
 <20250317192023.568432-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250317192023.568432-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.03.2025 20:20, Andrew Cooper wrote:
> Move the declaration from asm/system.h into asm/traps.h.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/traps-setup.c
> +++ b/xen/arch/x86/traps-setup.c
> @@ -3,5 +3,20 @@
>   * Configuration of event handling for all CPUs.
>   */
>  #include <asm/idt.h>
> +#include <asm/msr.h>
> +#include <asm/system.h>
> +#include <asm/traps.h>
>  
>  DEFINE_PER_CPU_READ_MOSTLY(idt_entry_t *, idt);
> +
> +/*
> + * Set up per-CPU linkage registers for exception, interrupt and syscall
> + * handling.
> + */
> +void percpu_traps_init(void)
> +{
> +    subarch_percpu_traps_init();

At some point this may then want expanding into here, seeing that we don't
have any subarch anymore, and don't expect to re-gain one any time soon?

Jan

