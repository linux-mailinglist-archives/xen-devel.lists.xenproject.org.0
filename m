Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CB0B222C3
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 11:19:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078461.1439463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ull9y-0006aJ-T4; Tue, 12 Aug 2025 09:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078461.1439463; Tue, 12 Aug 2025 09:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ull9y-0006Xq-Or; Tue, 12 Aug 2025 09:19:10 +0000
Received: by outflank-mailman (input) for mailman id 1078461;
 Tue, 12 Aug 2025 09:19:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ull9y-0006Xk-5N
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 09:19:10 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65672cde-775d-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 11:19:06 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-af95ecfbd5bso871854966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Aug 2025 02:19:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a38aasm2180531366b.37.2025.08.12.02.19.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 02:19:05 -0700 (PDT)
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
X-Inumbo-ID: 65672cde-775d-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754990346; x=1755595146; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ELSosv2fgPF5DzXcT6mtGF4H2FUacSbTCT5sN0nH+v4=;
        b=O8ej28ZOFLRiw0dvUrtbtgydBkvM4fDSYrb1xBeOdIQhexUK5E/zWdU7g9d7wLGKf9
         ruSU7Ht6xxeFrGcDYAniOcLQAOP+wfYbF8vxNQsO6jhWE3JNXyc4UgAuKwrkM+o3b9pX
         SNI2kgx4KOWEd+rJovwuajuYZIUUUeDTebVb4JIZAKUpRCrvX1q+x8vJfFwgcCbM0Uwt
         UolVdEBnW/I1Usb3TblMGLSfFLmZUfLQhgAMfnE2YqNrh/Gf4cht77wqWVD8Cq5xaThN
         VZBssKIK9UpQrgOCRTGLQsnEHIjCRaB8fFdzgellflJHWK6GNDZzpLMA+muejFlG/gRY
         sTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990346; x=1755595146;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELSosv2fgPF5DzXcT6mtGF4H2FUacSbTCT5sN0nH+v4=;
        b=i/8MT0Ul5eNOzyGAjv5jsls1Ly0WFXqDY3Hx2Ev3Do1O/4WSM/jmqRsDOny3bDZL1R
         538CHDNyIff4IX6JqtnA5DBNJKhrxc2K+gEF1So4u7FzZsqXq/sWmQuohU5kYob7uKNm
         bFu2HMWfuz66QgBKc0Hbwz3tWyfSuBVs6FrEvzM+TlViitdvCNfmmUJJnlR/KhqQ4rU5
         TWoxQ1W3fqrepadMPZiPN+GDG9Qytwa0KOJbCrPOh+6OVhjfMhlT2dI1ofxuetk4vShs
         WgrSeZEokmf6RfDDfxDk6qg8HAt3XdRMMyfTT1WxNlDVQC48082TTtGZZUQbtEyV634u
         sLgw==
X-Forwarded-Encrypted: i=1; AJvYcCW6WwrbfsGW80g2dhBdom1oTNgK8C8DFydFnWZWwA90RJrcQh2JAC7qsTpVboORNq1t4dj7rXa7rAM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywbtw0rF2tkMA5WHEyM35kJCVoI/8JbfYF8DCBqSqGMD0Do8F04
	gBEtqVVTSp94Udg0gGTi77caOukdxhFfcQocluEynPjtuSoYBEHWWzLSps2hTP+z4Q==
X-Gm-Gg: ASbGncvElR7SNlFiRRE3QM3icbmp+k0EPVxkSR/bSiP7rcpqZ6xdnwVWR1pqCbIu9Na
	ycWQB5irbn+xVnrju1joDYPZjBrb02aLmv9+47XWACc0PxLEn/fZ8v13GXiAnZCB7OhippH4Fmn
	m3tBXt6v1aSvHowtNRZcpUszzqNkASUA6eBR+3AZDRhzY1EZqLdIXhBbDL3LF3FTTHmvB/RDst0
	Nb1DZHMW+B1DqKuQAPYCiphttpSohlwBB6jTEpgQe+nD5SZn6/4rsNQWy6bNzOZ52q2apmPou39
	JHsRW/RuZFfIGhcAUoR+uvO03UZToVT4n7hmy3p79VfjKuzgz6TsV2eZBhcH64ISnzYwwDn0KBo
	lKXBcg+AhaWdQN1sByTtw8vMFhrFi4FWQYLVimBYqAMUu1+miNqhAJIY/OHkLNsaf8FpRaESn60
	HosAQjyCykz4+gTdbigA==
X-Google-Smtp-Source: AGHT+IG9yCkPznWCKDzoGdKKWYSUYVfUgpd9xM9inioCaBL6iCR0bL1dVQW61/4ys+K1NqpdA6FQNQ==
X-Received: by 2002:a17:906:f5a5:b0:ae3:f903:e41 with SMTP id a640c23a62f3a-afa1e152edamr244877366b.54.1754990346082;
        Tue, 12 Aug 2025 02:19:06 -0700 (PDT)
Message-ID: <a4a88d7a-8c1f-4170-a1fe-afafcad0c8ea@suse.com>
Date: Tue, 12 Aug 2025 11:19:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/22] x86/traps: Move load_system_tables() into
 traps-setup.c
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-10-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250808202314.1045968-10-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.08.2025 22:23, Andrew Cooper wrote:
> Switch it to Xen coding style and fix MISRA violations.

That were all ul -> UL suffix transformations, afaics?

>  Make it static as
> there are no external caller now.
> 
> Since commit a35816b5cae8 ("x86/traps: Introduce early_traps_init() and
> simplify setup"), load_system_tables() is called later on the BSP, so the
> SYS_STATE_early_boot check can be dropped from the safety BUG_ON().
> 
> Move the BUILD_BUG_ON() into build_assertions(),

I'm not quite convinced of this move - having the related BUILD_BUG_ON()
and BUG_ON() next to each other would seem better to me. (Same would
apply to the TSS size related BUILD_BUG_ON(), if in the earlier patch
we ended up agreeing that only the comment wants dropping there.)

> @@ -139,3 +258,16 @@ void asmlinkage ap_early_traps_init(void)
>  {
>      load_system_tables();
>  }
> +
> +static void __init __maybe_unused build_assertions(void)
> +{
> +    /*
> +     * This is best-effort (it doesn't cover some padding corner cases), but
> +     * is preforable to hitting the check at boot time.

Nit: "preferable"

Jan

