Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9BEB2C470
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 15:01:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086570.1444774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoLxa-0000dB-SO; Tue, 19 Aug 2025 13:01:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086570.1444774; Tue, 19 Aug 2025 13:01:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoLxa-0000bi-PI; Tue, 19 Aug 2025 13:01:06 +0000
Received: by outflank-mailman (input) for mailman id 1086570;
 Tue, 19 Aug 2025 13:01:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm9j=27=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uoLxZ-0000aL-Ia
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 13:01:05 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f9cb34a-7cfc-11f0-a32a-13f23c93f187;
 Tue, 19 Aug 2025 15:01:03 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-afcb7a2befdso710798366b.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Aug 2025 06:01:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce53e04sm989342966b.14.2025.08.19.06.01.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 06:01:02 -0700 (PDT)
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
X-Inumbo-ID: 8f9cb34a-7cfc-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755608463; x=1756213263; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Nu8ovCptOWQM0oj5TnuZHtwoUS/8jrhVrBMfhE7I0hQ=;
        b=GWM0Cq0pOcaCbcfnV31zJ68Wh5VWQpdDSDURUK0tumfXfdzFzMeU3WaPoXgtyeXgYc
         AxvgP27R04P429N2Yqjgt0V6/nr4v8SkqkCgviGDe085Lql+sXD/wxFTfQOSibyNN8RA
         orM017cDqvzervCvAqRJa+JFFRhI3r9od+6TceVOek2MwElJQbN4EPB/0Vj4Wzdyhrue
         QNez01MaCr9ac1MROmUlC5h3teAn3w5c692QRAwPZi3v/YXWFmmrUsKbksHTiO7Dhgwc
         BPQlOyfGWjwUqeD9WmUePWdQ972BNpACkiQXFGCZyObVJ77OI96B/+JKug0vuX0SzPRH
         pzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755608463; x=1756213263;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nu8ovCptOWQM0oj5TnuZHtwoUS/8jrhVrBMfhE7I0hQ=;
        b=CKgJzDl49wxvkYmVyNmdbdJDI6g8in2fzHbx975MFHGKIQIqN9V3JLVXQNjPvEjQNZ
         qGTS7Xmm9X7mxLslbvr+3NMCgvPNa+rpJgYVJCBTKmEx3bRTOVgWNu8QLbP/JSVukpIa
         sUo/BbelWXcRbTK/0a2O5uwZ/CTwIw8iJVfQEXcKaaBb2Ho25yEOuvmOwBlTHxApSjdM
         XePuKRABkB5X9XtuZig9SE33Y1d33GGnwo2VYf1idLcN1wgTu2PVjTMpBMEoKn7PfY22
         a+oSR2TeAPLIw978qShbNOhT2Hi3pUTJw8RxH2lDJ7+M6fQOWMUr7oS8s0PltIKBZ16F
         07tQ==
X-Forwarded-Encrypted: i=1; AJvYcCX08LhOyf1u4zMdzDuOxgKGouL1UUNAMolzqz5F03qTXl5xzrhkebVY9ebhtXwCjWjOat7KK1OpXxU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLXBbS+YonE/axgbS233ZxqUOD38vwIgbl88zZXCnrTDcDv+rw
	XIdTcXneGEwrA3mPjwtmtq1Alr3yekPiQsgXwfaDR5+cIUoI2Qf6VMTeN3JVc1zGDw==
X-Gm-Gg: ASbGncsotm8Ok1TlU1cS5qgxpxDDuoFwbehnCPnMVFgYFQHcpNOpAgNw2nWd+LWvxzm
	V8qlj9ThJmBO3GfGM3QQPGJYyb1bL3xNMhE+Rz2ELFLVEPfquijcW9Ch+3BKFL6nLRTe3LVnjZ7
	UAa6ql/bsW+Tv9vh6/u/TSAIHvteVVjI3+c9jBls1Mfsq2qDdxB6c46pkRFD+7AtKCOEJYI3CGU
	2QFTcFuBhn1/xg9GToDr3f1xPwop8Spy0D48ylk9oCSO+pewFy7L0eeqsIInh2uVFb1z3whfKuW
	aF94gvdNdtFf1AvFtKzOgD/dbUSRKKU/c9EOQ5P90ItcIZ+q/3kmUpvCchHikHbGvY8F0LGhCxt
	3jEpXVbyS1mLDDerpZTsRnFUgOX1tPoEH+EmVkOfzC8N0lqqSr4j7y3pujiQwjhuZpV3mCb4ihM
	BogglLsITsBtIbxTGhYQ==
X-Google-Smtp-Source: AGHT+IEEB5MH7hry23BIaJ4yahi2+heHXFLa8C2d7BT7UV0FYQKCLhK/Pko1cRKq7kq9p3sXvCaU1A==
X-Received: by 2002:a17:907:9810:b0:afd:d994:cac with SMTP id a640c23a62f3a-afddd23d1bfmr237174466b.62.1755608462525;
        Tue, 19 Aug 2025 06:01:02 -0700 (PDT)
Message-ID: <740ce507-de96-41e0-a5ae-999b5b6d8726@suse.com>
Date: Tue, 19 Aug 2025 15:01:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/16] x86/fsgsbase: Split out __{rd,wr}gskern()
 helpers
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-15-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250815204117.3312742-15-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.08.2025 22:41, Andrew Cooper wrote:
> Right now they're inline in {read,write}_gs_shadow(), but we're going to need
> to use these elsewhere to support FRED.

But why "kern"? We're not dealing with GS in kernel / user terms, but in
real / shadow ones. I'm also not quite happy with the double leading
underscores, fwiw.

As to using them elsewhere to support FRED: How can we when they use SWAPGS,
which isn't available under FRED?

> --- a/xen/arch/x86/include/asm/fsgsbase.h
> +++ b/xen/arch/x86/include/asm/fsgsbase.h
> @@ -32,6 +32,17 @@ static inline unsigned long __rdgsbase(void)
>      return base;
>  }
>  
> +static inline unsigned long __rdgskern(void)
> +{
> +    unsigned long base;
> +
> +    asm_inline volatile ( "swapgs\n\t"
> +                          "rdgsbase %0\n\t"
> +                          "swapgs" : "=r" (base) );

Again strictly speaking "=&r", if already you open-code rdgsbase() now.

Jan

