Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D23BC1FE9
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 17:55:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139078.1474616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6A1a-0005A5-QJ; Tue, 07 Oct 2025 15:54:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139078.1474616; Tue, 07 Oct 2025 15:54:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6A1a-000570-N7; Tue, 07 Oct 2025 15:54:50 +0000
Received: by outflank-mailman (input) for mailman id 1139078;
 Tue, 07 Oct 2025 15:54:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6A1Z-000561-Uo
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 15:54:49 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f44496ce-a395-11f0-9d15-b5c5bf9af7f9;
 Tue, 07 Oct 2025 17:54:49 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b3b3a6f4dd4so1202170966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Oct 2025 08:54:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4865e7e8b7sm1412709766b.40.2025.10.07.08.54.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 08:54:48 -0700 (PDT)
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
X-Inumbo-ID: f44496ce-a395-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759852489; x=1760457289; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E4lNXHU1tirSiTyZbFK+egYdQltVJSblJbKEtar6COc=;
        b=Bar/RIlBCcDqzIsl+YWXZaQeZQMyXsrf6Yoj2bFbdxBBPkCzoQg7cJ+7nNjx/yMKSM
         8KsylDRy3xZbJGvLIEWkevRF13hePjtc4ugzdtmspsDm+wpEB7jgpPAOH5nbPxT8J6BN
         NgdOafbgU/i+SDLhGikIFWL3eXTDNA4fdWVzXr2c07ACnJ+D0cJMsGFqHthZuEHXKnq9
         NPN7lXuCmdMW8dEWCl/VSkusMpsXMMiuOeBQr5tM39qFkGtLxDlUoN5aR6EDa33FRfs/
         J9mBIwEKvH8qOpdZ7QaMZcDJvLg+2BW7SZJptJscyGd+58cd3kbkjR0TtIeliDZJN2Jw
         4G/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759852489; x=1760457289;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4lNXHU1tirSiTyZbFK+egYdQltVJSblJbKEtar6COc=;
        b=ZIVFL7cuj297AOa/bBvnh9yBB1Kkk0UFSIu8K0QKfjqXjPMxFADgDWsnpaEz3Q5ii9
         RXG1p/I4HQEExba9bFulRkrwxrbcd4x4sVc3qKjDT+kaWH2K7knLW1dVDKUvB0PWp8Aw
         F4kfuLKNZxmmhwna/tyfD1lgQr12CpvoyBUeuv1sq4jWyinme3hV2jSB9CrjXa9xmn+v
         NVJ4+0bD4pSAzS0IT9B8UprBz8xJ7wK+MBrUMjO78NBbazyUBkukFs9M8VEg8ifKxocw
         +t3NT6Dp6/jb0B5OSrg25YNPmP+xqe6+SqilroFz9gPzlH/CBau6O0CSug44SpqclzER
         02uA==
X-Forwarded-Encrypted: i=1; AJvYcCVSyBWhFPnRZg9ENgK2niRHY/2JPKBTNHvexBuJZP3VDEjBbespjEEg9wHcDmfjLX1ad8p5mqpHx8I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwokUcddIvPXZSEO5f7k3HmPBofJnXypjD+snhifBI7Ks+K2X34
	WawCSy5XIzngb5j6eBs7a7QidTnQOMc+zHblDpSa+yYscwcqieWFHN0on74aG/OYWgzpZ5CmTgn
	FvuQ=
X-Gm-Gg: ASbGncv8kRwXmakWG8YfklhkGYmGcmxMMfu5kNJbHo0WE0ORCwv7yUWV6LrQ+ys2Vbo
	JucW5sl+48c4Ucbx7yiufNMmM/LcuNfkq8xGQJmT5dmTRxLKZLAClV/fE+482YWKkNWwpB18l2x
	hJUsdhdQEKd208D1kdTrVhDot6KzWVsPJikhntMBVRt0oUaoJaR/918bNNExBKmEGEWh/fGicrJ
	d2X8usguuSsvIxdVEq106TwM4c/jWjSOxSzfcb3g/cq0h9voaVaQHzI4dlTIUDSAoNfY9BNxLkB
	4Hg7m6LBzSCm1Zx2UParZd1Z3xBjKoJJdakEnfGg9xkArr/BWFi3axgiuPdO/hk3O4i/nS7nVgT
	4cdsQj2e5Wg2X3gw5WHm8mXvZvwWAwq3KcbsHxoIYkeIyZ8Yya6eVawmZwt0ANhYytsF99twMu0
	xCeMu4jJS1lfTKSI0M3OzOQoitygidSKocoiaQc6MzQw==
X-Google-Smtp-Source: AGHT+IFxkKZs7LXdrMIQvWMSfnukcWIg/pKqwBo5JZ6OhXpggunxyJUp72RW828Hz3eps7KVHQLXBQ==
X-Received: by 2002:a17:906:f5a6:b0:b3e:9818:30e0 with SMTP id a640c23a62f3a-b50ab08a127mr12385866b.29.1759852488782;
        Tue, 07 Oct 2025 08:54:48 -0700 (PDT)
Message-ID: <78d23acc-c70f-413a-afac-24d2016264ea@suse.com>
Date: Tue, 7 Oct 2025 17:54:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/22] x86/fsgsbase: Improve code generation in
 read_registers()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
 <20251003225334.2123667-6-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251003225334.2123667-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.10.2025 00:53, Andrew Cooper wrote:
> It turns out that using the higher level helpers adjacent like this leads to
> terrible code generation.  Due to -fno-strict-alising, the store into state->
> invalidates the read_cr4() address calculation (which is really cpu_info->cr4
> under the hood), meaning that it can't be hoisted.
> 
> As a result we get "locate the top of stack block, get cr4, and see if
> FSGSBASE is set" repeated 3 times, and an unreasoanble number of basic blocks.
> 
> Hoist the calculation manually, which results in two basic blocks.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit preferably with ...

> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -118,9 +118,18 @@ static void read_registers(struct extra_state *state)
>      state->cr3 = read_cr3();
>      state->cr4 = read_cr4();
>  
> -    state->fsb = read_fs_base();
> -    state->gsb = read_gs_base();
> -    state->gss = read_gs_shadow();
> +    if ( state->cr4 & X86_CR4_FSGSBASE )
> +    {
> +        state->fsb = __rdfsbase();
> +        state->gsb = __rdgsbase();
> +        state->gss = __rdgs_shadow();
> +    }
> +    else
> +    {
> +        state->fsb = rdmsr(MSR_FS_BASE);
> +        state->gsb = rdmsr(MSR_GS_BASE);
> +        state->gss = rdmsr(MSR_SHADOW_GS_BASE);
> +    }

... a brief comment added towards the deliberate open-coding.

Jan

