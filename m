Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 991D99D2842
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 15:34:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840298.1256066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDPJ8-0005C7-WC; Tue, 19 Nov 2024 14:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840298.1256066; Tue, 19 Nov 2024 14:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDPJ8-0005AN-TN; Tue, 19 Nov 2024 14:34:22 +0000
Received: by outflank-mailman (input) for mailman id 840298;
 Tue, 19 Nov 2024 14:34:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UMhk=SO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tDPJ7-0005AH-EL
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 14:34:21 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c013af6-a683-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 15:34:18 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-382433611d0so2358047f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 06:34:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38246b7db13sm6486982f8f.91.2024.11.19.06.34.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2024 06:34:17 -0800 (PST)
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
X-Inumbo-ID: 5c013af6-a683-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmQiLCJoZWxvIjoibWFpbC13cjEteDQyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjVjMDEzYWY2LWE2ODMtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDI2ODU4LjgxMDIzMiwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732026858; x=1732631658; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XcmnzsAoLOw/iAf1TPFm4c897+oHJKMZZOqnZsweXEU=;
        b=WrOt1man0ZHWXEweoYlQB8RbMIt5/Pci0vyOa9uAXe/dPtK13L6bzwfQywLMqYO+51
         PWEUkxfqPsZ/3vAoCKmjhFidw4LiZ0ebaM5XOaUm5t2tmi6cVUwZK6Dq6Z7EzH+b9Bxd
         Uxt/B1VhwP0vn7T40cftqM3+NifD1D0bqYQCGOyeVMWSdwfrdZQd29CeEwLsxSkUXuWa
         A1/xZVVzLXeJrTPuV1qJlSCapxxLig7twEjQ/kQLhpHQ0DR7YELfuhXgW1RvC4tSJiA9
         fcynjgH6SOoFo0B/Ow84MjCf0+ZOiTjA3AKuEXiP4VQRmH1YbPDYiG6gdj74+1EWLx8j
         TFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732026858; x=1732631658;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcmnzsAoLOw/iAf1TPFm4c897+oHJKMZZOqnZsweXEU=;
        b=PntKoOdP4OsAQGOtDLLJBORCmKydg0NkP2U0hxd+0WdFwTu3PdcHAqHz7Conh95z8T
         pRtWkE0dY4bG3z3JOoi8036tcc6ThkLLJpb8bW4+2gNJQpY105TY+XiPJYBxjr1K2/wT
         87+wqNJ/3iLlI438qkCYySkaAgWAV8xVAKJwGK0AH9xxqSumnOiIWQ2TBYHZimYSPPns
         hIzTV8N7qVL4zPDXxkA6T+3+JoQI6oEOQDiGq/h1BUFjpiC/LH9ZJrCohYgHn5Yu9GbF
         9n31nv7oWipiPy4Hl2aahYx3GabICyFKKY9iPqyFhVBr/tmxnprjJpp46bQceAnlchj6
         w14g==
X-Forwarded-Encrypted: i=1; AJvYcCV9HGxYBcifoqV5GvPBc+K4JojbOeUyOogzyuq0S81kEURvnWt/r3CHJGPvbypevZYVa6UIXY3RC5k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/JbnztTaASvJufGIMjdmgfxKP9HJ7UGhK2FUXm7QphL6EH0Ap
	aG6pWZx5hY+bnKyUmJGoIIjv7rlUyMqa9dd5sL/JAtCRGJ1a1QIXwKr+SPAlLg==
X-Google-Smtp-Source: AGHT+IFf3sEtLDaRyfpZTWdHzxwwtPEUFzBES16yB/VqDITda14p4KmP7jpxv9GG4wCO5iXcd/5PGg==
X-Received: by 2002:a05:6000:2d82:b0:382:5141:f63d with SMTP id ffacd0b85a97d-3825141f7f2mr841256f8f.53.1732026858182;
        Tue, 19 Nov 2024 06:34:18 -0800 (PST)
Message-ID: <d92cf59a-a798-4223-9439-85ae215b7daa@suse.com>
Date: Tue, 19 Nov 2024 15:34:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mce: Compile do_mca() for CONFIG_PV only
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241119125904.2681402-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241119125904.2681402-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.11.2024 13:59, Andrew Cooper wrote:
> Eclair reports a Misra Rule 8.4 violation; that do_mca() can't see it's
> declaration.  It turns out that this is a consequence of do_mca() being
> PV-only, and the declaration being compiled out in !PV builds.
> 
> Therefore, arrange for do_mca() to be compiled out in !PV builds.  This in
> turn requires a number of static functions to become static inline.

Which generally we advocate against. The #ifdef variant you pointed at on
Matrix wasn't all that bad. Plus ...

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> 
> Bloat-o-meter on a !PV build reports:
> 
>   add/remove: 0/6 grow/shrink: 0/0 up/down: 0/-3717 (-3717)
>   Function                                     old     new   delta
>   x86_mc_mceinject                              31       -     -31
>   do_mca.cold                                  117       -    -117
>   x86_mc_msrinject                             147       -    -147
>   x86_mc_msrinject.cold                        230       -    -230
>   do_mc_get_cpu_info                           500       -    -500
>   do_mca                                      2692       -   -2692

... what's the effect of the addition of "inline" on a PV=y build? By
using the keyword, we may end up talking the compiler into inlining of
code that better wouldn't be inlined.

Jan

