Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2CBB2C3DB
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 14:39:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086533.1444744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoLbZ-0003tG-Gw; Tue, 19 Aug 2025 12:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086533.1444744; Tue, 19 Aug 2025 12:38:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoLbZ-0003qy-Dm; Tue, 19 Aug 2025 12:38:21 +0000
Received: by outflank-mailman (input) for mailman id 1086533;
 Tue, 19 Aug 2025 12:38:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm9j=27=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uoLbX-0003qs-QD
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 12:38:19 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61902f3a-7cf9-11f0-a32a-13f23c93f187;
 Tue, 19 Aug 2025 14:38:17 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-afcb7347e09so853170966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Aug 2025 05:38:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdd04e4d9sm1004208166b.113.2025.08.19.05.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 05:38:16 -0700 (PDT)
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
X-Inumbo-ID: 61902f3a-7cf9-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755607097; x=1756211897; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7go6Ug4EJDI1PHHDSplUTJAc4Cu+u+fNuTxHp06eBI4=;
        b=YJS1k1d6RHNFA8rbPiQYIndpOmCsG6ObYd1GR6oDWnz4Lk3J5M7GVSMa0Q9RDPJwJp
         0PyJqqfAXjd/ZUAoN5N6ZAZe2xEpVhQTWkdfriplicHYhLhrD+v6hYksTXosU05RQwJW
         kC+IjA1Wr73SyCpQ0UeKuVlTIejCK8DsKXfBbPaip/Db9cYGjXKZ4+jeXJG4rUECyp7Y
         rnoeW1uZr+Wuyn+QaDjOrGtuQGYMP/rpECVVc132RiarKz7Uzs6Duu8YIpP/YbJfh3AW
         p7CjofE60w92iopjVjMIEsGi92Ta6XJQ0j/F1Hw3iHjVla8VpkJR6FFB60roAkuhKlY7
         AkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755607097; x=1756211897;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7go6Ug4EJDI1PHHDSplUTJAc4Cu+u+fNuTxHp06eBI4=;
        b=Jx2tFn6qRiFfpNQjMB/xvbXdevYZwKEbf6Uv4vkgJPTx0HZldOOMFqBd2uzCIynLZE
         Lcl9B7itPwk7em6KMnwDfUf2sT6jpXFY6fP3+FEPuCzoGjbSN741Pa/0a2cNbSZWsuNS
         LjqPOgIXqXWWc5v4FUIp9aBZ+SqZ8PJwwTNaJSDKz1nV3flgbuoRbgQaGZr+8GjG7M9G
         qMKRG423275F7MU8N+f32SasRDD8fltHJHPWC7OzLrP7rCZV/+PtFChOhRDUPwgQOpty
         FIJ+txbvtARCfidvsIQVB1XargrRzKOawCCrsHnIRslYlz/9/wM67mQFcH9r+Xyw2W3q
         tBGw==
X-Forwarded-Encrypted: i=1; AJvYcCWsX8DKyEdhQMcwJU+txcjCTMPsL3mFW9i9Cr6kRPXQIlnmFqVJ/gguUdMNAaouFEgNrYLd1kTdo2g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQlK3wfV+z40lANR2OBBX5DJILUrame/cZrJFiegw5pEr0vY4c
	OJSAHJa7ts0ihjjQxW8oS0zF8QxEFL1v+xxOZ5pNP6vpqMWw7Jpwo3l5vBeFwfDEQw==
X-Gm-Gg: ASbGncvS9XZYAcb8NnR8Iy4FyXMQ0LN3BwBUJW4lfGHniv4Q+Z97NLXBv3UWZA1dctz
	K+msnciFbM9IKEPjrSmEvJwPj0Da6fTPvmD8KcPMaHPp7F5fZ1wa4My4T8aWgk/lfDXracI/6hP
	9YmNI55RLtSc6rpcGJUVsbYZOWxFVW/joBP3n7+cP51WYZDf7cI+VzeYsfFqEBNRmcX5wXk+MJ+
	uusMAd42meYYMmCetXXQsM31yoPrOvfkjCjHkqr31A7IO00Hd6iO6TTZ3PEflgcZG2v28zaijv9
	0sRIFaWpCXN5cSwm4JH4DdJ7NhmNEzFTFEVUyvc1KJGWhpbramOA80DEFGWCo4jO1M6csMmEtxf
	Ugrx0C22qtFAcq1oCMJNu0Ab+b42U9myICrW0+7xEBtQ6+JqnZ4yEh79MLSBFb9NczhxJZR1hCc
	vP9z9y87weDtpu5UFktg==
X-Google-Smtp-Source: AGHT+IGk8Uh5UQQGo+pOsfMjsYj1TeMjhtyBSe8ImrIK9i0edj99zfqLy16F78Y+uAQNMEa9OeGFPA==
X-Received: by 2002:a17:907:72c5:b0:ae3:bb4a:91fb with SMTP id a640c23a62f3a-afddd235196mr267231366b.59.1755607097116;
        Tue, 19 Aug 2025 05:38:17 -0700 (PDT)
Message-ID: <3511e3dc-0c9b-412b-9cb3-e4b726088297@suse.com>
Date: Tue, 19 Aug 2025 14:38:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/16] x86/msr: Change wrmsr() to take a single
 parameter
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-13-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250815204117.3312742-13-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.08.2025 22:41, Andrew Cooper wrote:
> --- a/xen/arch/x86/nmi.c
> +++ b/xen/arch/x86/nmi.c
> @@ -218,16 +218,16 @@ void disable_lapic_nmi_watchdog(void)
>          return;
>      switch (boot_cpu_data.x86_vendor) {
>      case X86_VENDOR_AMD:
> -        wrmsr(MSR_K7_EVNTSEL0, 0, 0);
> +        wrmsrns(MSR_K7_EVNTSEL0, 0);

Since you switch to non-serializing here, ...

> @@ -308,11 +308,11 @@ static void setup_k7_watchdog(void)
>          | K7_EVNTSEL_USR
>          | K7_NMI_EVENT;
>  
> -    wrmsr(MSR_K7_EVNTSEL0, evntsel, 0);
> +    wrmsr(MSR_K7_EVNTSEL0, evntsel);
>      write_watchdog_counter("K7_PERFCTR0");
>      apic_write(APIC_LVTPC, APIC_DM_NMI);
>      evntsel |= K7_EVNTSEL_ENABLE;
> -    wrmsr(MSR_K7_EVNTSEL0, evntsel, 0);
> +    wrmsr(MSR_K7_EVNTSEL0, evntsel);
>  }

... why not also here?

> --- a/xen/arch/x86/oprofile/op_model_athlon.c
> +++ b/xen/arch/x86/oprofile/op_model_athlon.c
> @@ -34,7 +34,7 @@
>  #define MAX_COUNTERS FAM15H_NUM_COUNTERS
>  
>  #define CTR_READ(msr_content,msrs,c) do {rdmsrl(msrs->counters[(c)].addr, (msr_content));} while (0)
> -#define CTR_WRITE(l,msrs,c) do {wrmsr(msrs->counters[(c)].addr, -(unsigned int)(l), -1);} while (0)
> +#define CTR_WRITE(l,msrs,c) do { wrmsr(msrs->counters[(c)].addr, -l); } while (0)

This isn't obviously correct (as in: no functional change): The macro is,
for example, passed reset_value[] contents, which is of type unsigned long.
Quite possible that the original code was wrong, though.

In any event l wants parenthesizing.

Jan

