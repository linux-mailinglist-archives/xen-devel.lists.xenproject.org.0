Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D76CDA64D85
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 12:58:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916632.1321692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu975-0003WX-Vc; Mon, 17 Mar 2025 11:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916632.1321692; Mon, 17 Mar 2025 11:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu975-0003UI-Rj; Mon, 17 Mar 2025 11:58:35 +0000
Received: by outflank-mailman (input) for mailman id 916632;
 Mon, 17 Mar 2025 11:58:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tu973-0003UC-T8
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 11:58:33 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 263069c6-0327-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 12:58:32 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3913fdd003bso2069816f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 04:58:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb7eb9ccsm15012209f8f.96.2025.03.17.04.58.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 04:58:32 -0700 (PDT)
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
X-Inumbo-ID: 263069c6-0327-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742212712; x=1742817512; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rgEO0PeoKySJPi2pZcFUggHZkaqCfYA/m5Z8JDn1H/E=;
        b=bsrMnmx2BQEi+D0XQM54pydClKRwUjyZSWpXMjqHJ7HA7DCOTLPA1wL7VST9sHR3F9
         eUNyl1/d0XsCSCHpj8BI/2o5hrrOzAUJyYsNc5Ls0wIEK2rOMTgtUnKlIj0TJMW2/fGY
         DUlJzXSfWNQaORGkbgQBqr3HhNqJ7C2d4+bP0qZa4YdkbPQV8hqz5eRGt5xXiMvfYpN3
         Aeq6amAQ8tHsebn8z/SJyShX7NBZ2Ob3cn4vvXVUHjg1G9v+tV/1HQSAQ0sFpC4EnlCc
         4+xGOdr1P33RLAg+tsqDz1zHMuuHwjpUvmzYCml/3208jXVDBzOK+9WNX1fI0KGt/eTu
         p2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742212712; x=1742817512;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgEO0PeoKySJPi2pZcFUggHZkaqCfYA/m5Z8JDn1H/E=;
        b=A/mB+BtOdBm0X9H35F4pGUwu34AcU9I9SKV3BmtU9L/StJCB4ejoxfMNgoXcPOs/YW
         ZuY8tJeS4DdeDcWaN4ncJwFV6eOW30Gq3fTmGIZleq6IhZGydThqLI5TO4APkpriqzVm
         XH07047wYOVTPYvZklnKyBOJ7k5Vjt/dJV9we/m8hEO8n3JBw1fHB4SjLpqFNtAQKltT
         jH2M4gVR33ADY/ZWxehLEgsw/oh4Be/IyvO0w6fkIL/25+XPD9BcfMr0St8EMykIstE/
         DDfLIjAEozHti/+5XEvWM0GhqLNfkqG5QDe+Yibk01KqAPi3PGaUJ1jNElHn4aHaPitb
         DH8w==
X-Forwarded-Encrypted: i=1; AJvYcCU5+gy6441OfZo2AsKzc0mjK0+m60JJ7cePR+8W+2Yev1PSRTaxpilvKzHTjkgXN+TLKBg7KQ9swHs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzzXg/lIZQCdObGykordNQgMl5sg4ggeDXSBPN6n8bmlRq4+zk5
	Xs+9UNTaHO7OIN7Wee0DtLnzuqEi5NDI3FL+4MteKTsie8jD+//j9gbqQQ/RZQ==
X-Gm-Gg: ASbGncvSj1h6l9IaBcPlV78rCzOX0GJ7pg/bHtrVCFszPMujJvqeOSLx4oH77Un7GY3
	0rnaVeqUgkCeSyJnjJPfzoR8Bho1proFh9wzEgGHCI7CfQBJgiAiT/YK39sMPayME3pXcwzrLOt
	FHxZ08HHqjZPhOSgTQ0lR2UThTvo9Kz9E+PHQg7uYwVU1k4akTsekgWwA6JRGPERzexhU7Q/4UM
	Rk/cTMtjCwnPxuDsIIuPdasfCi3E7IbGJohawTAPInissKUhDTwJBd7kyxxJIGsJJWiVRP/IBxA
	6TKmiF5tUfdzaGm3sBKxNXcU+ByYm0p9KhUXd+aBseWTFVSS5AWI2MVsDd02WhxpH01BR+r9YRm
	U4bSf8G12kmu6WtF3HAp3V8jyIzTRbg==
X-Google-Smtp-Source: AGHT+IEAb0XtIWUoe0e/KMpTBHVf1rtqiF0dt8dTC2sKyDKLP14eLCznxCPYJmQOW2EcdmSSlA3T/Q==
X-Received: by 2002:a05:6000:1562:b0:38d:dc03:a3d6 with SMTP id ffacd0b85a97d-395b70b7668mr16673892f8f.4.1742212712418;
        Mon, 17 Mar 2025 04:58:32 -0700 (PDT)
Message-ID: <b7c1c9e3-8663-4ac4-baf2-969df742ff38@suse.com>
Date: Mon, 17 Mar 2025 12:58:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] x86/pv: Store the data segment selectors outside of
 cpu_user_regs
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
 <20250311211043.3629696-7-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250311211043.3629696-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2025 22:10, Andrew Cooper wrote:
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1211,10 +1211,10 @@ int arch_set_info_guest(
>          v->arch.user_regs.rflags            = c.nat->user_regs.rflags;
>          v->arch.user_regs.rsp               = c.nat->user_regs.rsp;
>          v->arch.user_regs.ss                = c.nat->user_regs.ss;
> -        v->arch.user_regs.es                = c.nat->user_regs.es;
> -        v->arch.user_regs.ds                = c.nat->user_regs.ds;
> -        v->arch.user_regs.fs                = c.nat->user_regs.fs;
> -        v->arch.user_regs.gs                = c.nat->user_regs.gs;
> +        v->arch.pv.es                       = c.nat->user_regs.es;
> +        v->arch.pv.ds                       = c.nat->user_regs.ds;
> +        v->arch.pv.fs                       = c.nat->user_regs.fs;
> +        v->arch.pv.gs                       = c.nat->user_regs.gs;
>  
>          if ( is_pv_domain(d) )
>              memcpy(v->arch.pv.trap_ctxt, c.nat->trap_ctxt,
> @@ -1238,10 +1238,10 @@ int arch_set_info_guest(
>          v->arch.user_regs.eflags            = c.cmp->user_regs.eflags;
>          v->arch.user_regs.esp               = c.cmp->user_regs.esp;
>          v->arch.user_regs.ss                = c.cmp->user_regs.ss;
> -        v->arch.user_regs.es                = c.cmp->user_regs.es;
> -        v->arch.user_regs.ds                = c.cmp->user_regs.ds;
> -        v->arch.user_regs.fs                = c.cmp->user_regs.fs;
> -        v->arch.user_regs.gs                = c.cmp->user_regs.gs;
> +        v->arch.pv.es                       = c.nat->user_regs.es;
> +        v->arch.pv.ds                       = c.nat->user_regs.ds;
> +        v->arch.pv.fs                       = c.nat->user_regs.fs;
> +        v->arch.pv.gs                       = c.nat->user_regs.gs;

I assume you mean c.cmp-> here. Then:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

