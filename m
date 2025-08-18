Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0399B2A03A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 13:23:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085956.1444206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unxxl-0008Gu-7Q; Mon, 18 Aug 2025 11:23:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085956.1444206; Mon, 18 Aug 2025 11:23:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unxxl-0008EV-4G; Mon, 18 Aug 2025 11:23:41 +0000
Received: by outflank-mailman (input) for mailman id 1085956;
 Mon, 18 Aug 2025 11:23:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1unxxj-0008EP-Te
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 11:23:39 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8eb19c5-7c25-11f0-b898-0df219b8e170;
 Mon, 18 Aug 2025 13:23:37 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6188b5ad681so5622332a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 04:23:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-618af9d3429sm7056189a12.7.2025.08.18.04.23.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 04:23:36 -0700 (PDT)
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
X-Inumbo-ID: c8eb19c5-7c25-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755516217; x=1756121017; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5nVtqkLnTj5A0xGXZojylCejMyrz3zv/rUp+gncqiNs=;
        b=akVUmNhtap9vzxlql22SJAR2NDBm+URPlHbibkMO0INIYZZG35lmie47fIzk+KXmbf
         V9hQZIANmhYE4VECvDgiwaOnd/8fC7tngQUNn/u89BUxJiRhzSfR+U0BXpjlMehwqCV3
         DI8l3k9FZVTD+OD4+V3DKLgb9cd/6b7YHELJz2KLbnGox/229vTce+dtVfhM04wqot0X
         PYcd3V/87R5gaLifwq8YCQ0kCLEgcjmAR30vibvnoJ0TIp8K0MKcyOz3eyfHVkVKcJeu
         DKK06f615O2rTlvREEi03WnPaaQXg2+WE7mLnRPA2ACRUR5iLErfsJFoB95OUd5jgGqx
         J8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755516217; x=1756121017;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5nVtqkLnTj5A0xGXZojylCejMyrz3zv/rUp+gncqiNs=;
        b=w9+IJIjfiKv+r0zf655oc3C8bPBXW5vOshpCeYjUY233+6Fam4c/WdwgRPfcxzsEFX
         co8wZacW32FnqCTDHQMPuqhKQ+hnwZh5QLfpcMu6uld9i7ebjyXznUCLJQDegIEV0AJb
         P5CSZ3X4qujvpx1ZKRhEd3jPb1DzgFgkc7+t58Jnz7v/zzQnsTU8rDGWLjRqARjqhvJR
         CjUAJrqRtCXaO7DBw0ngQSME4A3auhT2DszgsQ4qjdBeYWKmA3QvXTUnmdlPzTt3GqKE
         Q0kexxbmIgaUiy59o+ANM+Nyvh6QaAKbC2ozc25wQD6mgrj5/nj6a8eFld+Ln4Td7jP+
         mZig==
X-Forwarded-Encrypted: i=1; AJvYcCWhP3qWF4MTLY5sBwI0gU6sQ0m7I6YnQSqjXV3Y6x6nGEzpdPL+l/eNvZiOWXLAEVbXLs4XTQxu1Bs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJCicJGys+IRnfEa9Sbk6kf3jaZvyJ/bDmtXotQv3BaZGKFd1h
	efnNIVV3h6sk+pBdaCJCW16D6T/PUwsZwH2WVibK7Wk42sMcxXnA5FbIB7ctHARz+Q==
X-Gm-Gg: ASbGnct/PRC7z37xqM0oEtlpvoM9GSzGie3h1ACdwbFSMwspe8ryhNfRLt2iBR7IxUe
	6O9H8yRmBlw34vrPaE9Zz579H83aZok6J4eGHktRFKDU56eFp4HHBOOcmOGdYEV9ynhm3MLgLBg
	Y3Q4iSKzffBTf+N4M9bQDrxtcvoqutyS4ueHPOtT++Rp17pIsyNhA6CZSLWTX4MfyhntdYjBSSl
	QItMKrPmKSA787o1U462FMvgTOyP+LU1szoCMOljEawO/jDvCg8g1RNqlWTmm8hgE4yPCVKr/ou
	GFLU0gSgg1SXOxbSIz9bQjWYshn8b5Cpfqdkgzrnu6SHsoyVx5Wn20vjdpTzmWJFYarXIA26/CE
	vdo25Ki9T74qeoWLZLJLXX2Ui+HVMkcYeeeqDawH1j7ZGB5aiFPXTDUcj9+VAzPalCvqsfAaQf+
	kM9AkYc/Nk2nPc6BmNqw==
X-Google-Smtp-Source: AGHT+IFnGPmvyE84qnokHwEOTdAS9lE+VbR2qDwRik4nu4P93ketyHm4ruGM18hClQS+Bo3+jOU/gg==
X-Received: by 2002:a05:6402:254b:b0:617:cd9d:e2a4 with SMTP id 4fb4d7f45d1cf-619b6f65d8cmr7158680a12.2.1755516217051;
        Mon, 18 Aug 2025 04:23:37 -0700 (PDT)
Message-ID: <e3b37ba8-72df-403b-816d-3be9011b8203@suse.com>
Date: Mon, 18 Aug 2025 13:23:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] x86/msr: Implement rdmsr_safe() in C
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250815204117.3312742-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.08.2025 22:41, Andrew Cooper wrote:
> ... in preparation to be able to use asm goto.
> 
> Notably this mean that the value parameter must be taken by pointer rather
> than by value.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

In principle
Reviewed-by: Jan Beulich <jbeulich@suse.com>
However, having looked at patch 2 first, ...

> @@ -879,14 +879,14 @@ static void intel_init_ppin(const struct cpuinfo_x86 *c)
>      case 0x8f: /* Sapphire Rapids X */
>  
>          if ( (c != &boot_cpu_data && !ppin_msr) ||
> -             rdmsr_safe(MSR_PPIN_CTL, val) )
> +             rdmsr_safe(MSR_PPIN_CTL, &val) )
>              return;

... with this, wouldn't we be better off using ...

>          /* If PPIN is disabled, but not locked, try to enable. */
>          if ( !(val & (PPIN_ENABLE | PPIN_LOCKOUT)) )
>          {
>              wrmsr_safe(MSR_PPIN_CTL, val | PPIN_ENABLE);
> -            rdmsr_safe(MSR_PPIN_CTL, val);
> +            rdmsr_safe(MSR_PPIN_CTL, &val);

... plain rdmsr() here, thus not leaving it open to the behavioral change
patch 2 comes with?

Jan

