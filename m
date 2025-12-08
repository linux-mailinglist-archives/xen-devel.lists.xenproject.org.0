Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2A1CACB3E
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 10:42:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180317.1503525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSXkZ-00022q-Ar; Mon, 08 Dec 2025 09:41:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180317.1503525; Mon, 08 Dec 2025 09:41:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSXkZ-00020V-7b; Mon, 08 Dec 2025 09:41:47 +0000
Received: by outflank-mailman (input) for mailman id 1180317;
 Mon, 08 Dec 2025 09:41:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSXkY-00020J-Eq
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 09:41:46 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bbfbda0-d41a-11f0-9d1b-b5c5bf9af7f9;
 Mon, 08 Dec 2025 10:41:45 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so47960095e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 01:41:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4792b17588asm120282145e9.17.2025.12.08.01.41.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 01:41:43 -0800 (PST)
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
X-Inumbo-ID: 1bbfbda0-d41a-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765186904; x=1765791704; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0SX9mpPZWe8AaMpbX2GxKQl/7tGq4Y0sUgtNWy/3EII=;
        b=UAd+mTTU3J6MMQpj9PFZyBNE97gqq3lhH64yRHe2Bytiy+du21pmL4Az+ixUlyXvgb
         PnorWOJ13YoRSfXo1oosxsvecOu+vygWYSkLM9SHyOqNjTo2TKYTSztOxSQGkeLpZM78
         Zh4k3+DCfiYSl73CgObDlqgnyD3BcqQPmCPat9r0zX/yAMIOG6hpa6Mk16Blf9vPjG/0
         H0yWY1lMmWqY02TkeINYOhWNWeilu/6CCJCKQSBssrZm+T7jnSLIKKHpHeMMztjGHCjb
         8EzQ9NfJHgUQuJBuUkw2xGqruXxF5QayfH0d+BhWZNRno8kCh/QvS3FdQZ3Genn/w6Uh
         aRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765186904; x=1765791704;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SX9mpPZWe8AaMpbX2GxKQl/7tGq4Y0sUgtNWy/3EII=;
        b=aLynYzYtb/0uE72k//pWMdQmo6joloGbTtD0smlZt3lSi7Ufp9EvLbEeiwvShVBl5r
         IOf6sVpkaZI0BY4FJDufrAGebIbLKgpOgXDg9aXirj5LF4zYCRMd7mAA117zdPfewR5e
         KIBTL1YaI8385GJmHdIy49/cqj+THrVu9dfrmTS9hhycGiMgC8VYYCOfkj25tBMaKLMl
         fHri9ahdAy/14J5nx4/0UgQvzBeMkyBbDspJiOWYO2eGsxgaGtWE7wb5LAhTVcRwK3rm
         utCBazPUThEITJpZVA97W1pCsi5BIeOMLNUeN17KCNThzdDoJuD2jOmbyaQ29djHvBXW
         s22w==
X-Forwarded-Encrypted: i=1; AJvYcCXdgHOiMZaDXZvWwkfjyAca1KROZBmSikw+6GaCFLjix+8hazaYV8hk2COdvPPC/L278s5LQusbK5M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhtdKWf58OCU+se7OQ72TDuxOv1nyFmg7rfabbdZJuTqpVZxQM
	MyB3DoX7IQCZPG0pOavtSlrqePWYfKnrpnvZZve0L01ivn9geB+22gJP9B+wANk6Rw==
X-Gm-Gg: ASbGncsHBOW/9bsNG9h2lJRf+zK9sWpOZpIaxdp85uyrhe/Y3e43+y+ZEmYFtFOqAFw
	MsN8O4yEdUTttnuSMC3GaFQyiCQyz0JyoHpWLwqJnS8RtL/7dLNNu3RMR1g8JUiVgozFs506WmL
	DYuycsJ3ryQ/9MSz12S9gUMnEGJsEu2Q+XuBr0jOoLqq6R8aePvrcBF8vNlOZ4dKXpkWHM/0RRh
	hd6My0/Kj2LZBYGb4RooOsn8TqAnJZ5lfVhiqU9sA435FJn7xgGYAGQlKdRkVxsPU88d3w21bDa
	/79H1xGdvST9cnFCniCob4hvXcJQcDIhEhKkoPy20N+dDB9ImbtzZCiAbyahV+mVCLlsgWpM2tX
	iV5ndDJPHxfnBYmG7LFkjSKSkSzeaEb4f7C3ry7I0TOypVJmAFQGga+63oqrK7mUDdXckg6VwEC
	1PKdCoOYIRnLHkEH4G7AWdWYPL5rbyDufth73E7jMm5eUaq0Hj7GobFwEqFlG3mwkDC1PU+XIyb
	YQ=
X-Google-Smtp-Source: AGHT+IGKour3tMG0hWNJfutLx/0mGbj6qno9ubsLiSKUVp/HIYJ49R2tGmj4EBe4Dao6hAb/fTVgCQ==
X-Received: by 2002:a05:600c:4f15:b0:477:214f:bd95 with SMTP id 5b1f17b1804b1-47939e3a6dcmr71089135e9.23.1765186904321;
        Mon, 08 Dec 2025 01:41:44 -0800 (PST)
Message-ID: <b5e45ef8-40ac-4a7e-b268-2573855a6265@suse.com>
Date: Mon, 8 Dec 2025 10:41:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/amd: Delay amd_init_levelling() until after fixes
 to the CPUID MSRs
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251202105710.1472927-1-andrew.cooper3@citrix.com>
 <20251202105710.1472927-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251202105710.1472927-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.12.2025 11:57, Andrew Cooper wrote:
> There's no need for amd_init_levelling() to be specifically early.  In fact,
> it must be after init_amd() edits the feature MSRs, e.g. enabling TOPOEXT on
> Fam15h, or we revert the change on the next context switch.

However, ...

> @@ -1270,10 +1262,14 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
>  	check_syscfg_dram_mod_en();
>  
>  	amd_log_freq(c);
> +
> +	if (c == &boot_cpu_data)
> +		amd_init_levelling(); /* After CPUID MSR adjustments. */
> +
> +	ctxt_switch_levelling(NULL);
>  }

... this new placement conflicts with the two RDSEED patches which have been
pending for a while / too long. Even moving up wouldn't help, as the TOPOEXT
re-enabling is after the switch() that the RDSEED changes are being fit into.
Surely I could re-base accordingly, but it kind of feels that the older
changes should go in first, with whatever adjustments necessary done either
here, or (in a preparatory and agreed upon manner) right there, or entirely
independently.

Looks like it would be possible to move the TOPOEXT re-enabling ahead of that
very switch(), for the code above then to be inserted between that and said
switch().

Jan

