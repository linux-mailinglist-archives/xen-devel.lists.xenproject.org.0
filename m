Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2310C6D20C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 08:31:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165558.1492270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLcfB-0003vx-3e; Wed, 19 Nov 2025 07:31:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165558.1492270; Wed, 19 Nov 2025 07:31:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLcfB-0003tB-0J; Wed, 19 Nov 2025 07:31:37 +0000
Received: by outflank-mailman (input) for mailman id 1165558;
 Wed, 19 Nov 2025 07:31:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nJND=53=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLcf8-0003t5-Ry
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 07:31:34 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5f08727-c519-11f0-9d18-b5c5bf9af7f9;
 Wed, 19 Nov 2025 08:31:33 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b72b495aa81so823306466b.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 23:31:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fda933fsm1515954966b.56.2025.11.18.23.31.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 23:31:32 -0800 (PST)
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
X-Inumbo-ID: c5f08727-c519-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763537493; x=1764142293; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UII7YPSLmZoWfgLAFslF5ozU1ThOMhF5VR0aPZsMdSw=;
        b=QkvAeXcmtmhApbcVbSAUzUUFrxjFiWPbqUUBamrWqYgv9E3nRhk3PSNv+k8db5Sog8
         Xp9dENLkb4Q1nhtBbFbD2FbZGnv92XmpA0vL7Eszh9sdnGIOf5PoiGLylmOSeN7P3jOt
         FXmlAdexDPD5Uw2LVl4s9NdXfLgb1Ra2PzATcOgkK6+pf8Fxk4+SPXYkpRNQ8idI0RkU
         iHd3YWaBMq2zXyRmceO8R/+K5WfbCu5/4pO9v1Zbg/vMSiuZ55BiaVWVcY46Wpnt3fNz
         kk93tW9Rsm94zcrrTLAMenAbIC8kkQ+weYjlmfE4GaW9/4DGm1fBn1OzpFYNZ1SHwoPa
         D89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763537493; x=1764142293;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UII7YPSLmZoWfgLAFslF5ozU1ThOMhF5VR0aPZsMdSw=;
        b=RO4x+M47I074RDR/T67iUV0SJGKaXwHl1/wXn5JjNk4q5hJ9lr0c641iZjXLVudAPE
         XzSDdLDEnXKhnUpleOW+cni24S2G6qkCahyWVznh3RhOPgFPKT7xJijaVN6V7vn5WzE1
         vc5S1xaz9jk0WusFz0cbjeA0yR6hS4ZfO/e0PUVAtLIjBLa5Wbq2vnb5TpczUkKjTF2g
         q4v0Gf5oJb9yHj/OCGEGdEMfxMr1cWOkea+2ePOVcV8kZk3gTFT9RLKcMcIHKwjlEind
         JrwMfBfskT5Y6RpCgHLz1AdqbzeqWzuGB/FyLdilMYvCcZYQKItyj8ryowNDEUEo3xQh
         Ikrw==
X-Forwarded-Encrypted: i=1; AJvYcCVS3sLrIFkAgNySZErUTPRafbuT0kF1mEMkTZfJ8RgLjkN/3rWkK/9PriueRFVqEg/LMdwdk88qSok=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZbv57ZSW4IqDcOpBfcLxAy5WsHOX2HTVGm4NUdfwNBhbziARH
	sgO4BH60lSxMXgiVCJolFQRq77jUF5t4NTio3+ZMsq9bv03T1JsJWaX5AmmcvmLa6g==
X-Gm-Gg: ASbGnctaC8bnRaMG73ky75RG8DTpIsNB8GwdUVyG/3uT3LlGeUk9KrUTd6/7X0hzULg
	JOgGCsKmtTaxz+Nx8j0JsCri+TjbrgOPoBEYlxBxb8HwCWfY22R+QzZFETU8ZwS8EQXQpIrqwab
	ryKou2lF6Dop+HvKhuqbR+O20v92+QU1tHFnq+rRlsiVciwAzWTSjo53q473ebkZGjV5AU0v/wZ
	cACjYAJuvdP6VxYb/zOnzvwCELmfgiBVqSFOsrj98ZcvgzraxFBvRMQ6QtHbu/7/+P/MNsXyLqu
	/uQ+v0yuJnJReH1Hejlu5TXU3ji8TjJORRb6wKcDEJR5ooJ34WKoNlIGODUUrDddHSKSwqV8Q6x
	gRTTmt6dRskxEr7oxfnebIASYE/+J06lbcDclNgF2qvkREkEP/ha1I3MwKm2yrz9nN9SyY1DARg
	Rs8UgsF+N0wimRld5P9uHm2o1aZWpkpOC5M/ta+zwKXg8Nrwjnjq0bW4kwn/ZDzbw/00ANVKL0V
	i4=
X-Google-Smtp-Source: AGHT+IGubwQkaG7UvhT1WMkpNs86+5/GrsY+cFyNLyZwwaXCLZKni2NkLLB7Ecohq2V/NHjP7JM1mA==
X-Received: by 2002:a17:907:3e03:b0:b3d:b8c3:768d with SMTP id a640c23a62f3a-b736780af1dmr2255109366b.7.1763537492961;
        Tue, 18 Nov 2025 23:31:32 -0800 (PST)
Message-ID: <19a735cc-23fb-4d26-8090-ee61f4a92e37@suse.com>
Date: Wed, 19 Nov 2025 08:31:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] x86: rename ARAT feature flag
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <53ef6c9a-1115-4bb4-bb7f-e2595ab9d0b6@suse.com>
 <bd4f2601-a2fc-4c58-b1a9-3b2c40076eab@suse.com>
 <828b87a8-9521-40c5-95ff-f46e55fd5f71@citrix.com>
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
In-Reply-To: <828b87a8-9521-40c5-95ff-f46e55fd5f71@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.11.2025 17:38, Andrew Cooper wrote:
> On 18/11/2025 3:07 pm, Jan Beulich wrote:
>> Add a XEN infix, to properly distinguish it from the CPUID feature flag
>> (leaf 6 EAX bit 2).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Question is whether we still need opt_arat (and the command line option),
>> or whether we could go directly from the CPUID bit (overriding it to on
>> for older AMD [and Hygon?] CPUs). Or whether to have opt_arat affect the
>> (host) CPU policy directly.
> 
> I have no particular love for opt_arat.  I added it when there was no
> way to force a system to fall back to an older timer.
> 
> As long as we've got some way of configuring the exact timer to, I'm not
> fussed about keeping the top level boolean.

But the question is what the replacement would look like. Is it okay to
override bits to true in the host policy? (It may be as long as we don't
expose this in the guest policies, but at some point we may want or even
need to.) Would the command line option also go away (in favor of
integrating with cpuid=, which would require extra logic as long as we
don't put leaf 6 bits in public/arch-x86/cpufeatureset.h)?

IOW for the patch at hand I wouldn't mean to make adjustments. The remark
was more towards further, future adjustments.

Jan

