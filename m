Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 938438AE9C3
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 16:44:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710721.1110112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHNg-0006TZ-55; Tue, 23 Apr 2024 14:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710721.1110112; Tue, 23 Apr 2024 14:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHNg-0006RC-1u; Tue, 23 Apr 2024 14:44:24 +0000
Received: by outflank-mailman (input) for mailman id 710721;
 Tue, 23 Apr 2024 14:44:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ck89=L4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzHNe-0005uu-3l
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 14:44:22 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8828595-017f-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 16:44:21 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-41a523e2888so17182835e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 07:44:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r18-20020a05600c35d200b00418d434ae4esm20451714wmq.10.2024.04.23.07.44.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 07:44:20 -0700 (PDT)
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
X-Inumbo-ID: f8828595-017f-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713883461; x=1714488261; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5R7s02c8bPhRZ4CE6CnK1FXEnzWNWhfeaNeAUVkLHRI=;
        b=Ec9qAFEll+mAZ94Vh70dzgPA/EsvqZTkecS3XYhFHD7sUl7VIYDHJHuYZGhZYSdXeI
         A1yz9aBJvS4oc57f5kY+CpGZ3zO2HP20u7egdAEdcbpE2IO9XkKxn18n368eR6FWOat8
         Pva3gqC4etfu4ZYAHHO1SwhcSJwxbO1CUI1zNKJIusZfaaLrk2JNgr6cA1kT/2lwU7/m
         X0A4t8xxw+MudW43t3hYHr7NldfUbXesxjra9IbpFK7MUeSjk6VJzeuyR0+jECUiiPfu
         clkK/OGnnOkhm/lXQ/uTpyURzk7eo2X7y9DcNiLvfVoCMo7JKixeRA9/3fBHOkSA9akQ
         s5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713883461; x=1714488261;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5R7s02c8bPhRZ4CE6CnK1FXEnzWNWhfeaNeAUVkLHRI=;
        b=UY2jI/XBT5WTC9QMYaXUrd8bPF3rDITtOfVvzoHRCNmg6lHicOaPd2t3U51yKcFRJX
         fyk1/ni9gwV5UzyjIUVv1/irHqrNa5viFjL7cQitSOV6AZROk78yFalxOr2iHc+5qY4M
         kUK54GdIl0bF4ZkCvZ65J+s2uP8BnlVVzJu1aZEoBr95smBFGPbFWz44Of4nqNeGtX0t
         hLsjpNEkbtZzVC1xmiBY30lM34LtopZLKwMTxfUSvY120kLX5SwhrtsxysG4hFGBVVTK
         oDOmP6PX1paUD20QkgmcemWF84ZratoejlxaxE6Ni/hiDwimMwC+blAKU7pwYNWU8OPl
         xn0w==
X-Forwarded-Encrypted: i=1; AJvYcCV6z/NSnFiyH9oDzv0lcUtKInxgCbk+q9C9WpwAuY6417a985FTBrwMb5Wlefop5xqERNcepil42kgCVI4I5PZ1pn1c2YLu0yq0bmSxZe8=
X-Gm-Message-State: AOJu0Yx/S3TZ9/Y3+i3mmFD/KncT4cj2e1kAPaL28GzUhTU3graJnF5L
	zJtQT744R/Fj4jMszxWKWbpv8jZ+3+NDjqsBcNk5RlgVxvNZ2DxWutMnQdEFxg==
X-Google-Smtp-Source: AGHT+IEifz09LEg355SuCBD7w2uaRejBiwSQxtPDH4Fg3veYD+I7r0Atwrf1CnxHSnHoODUyWJsB5Q==
X-Received: by 2002:a05:600c:34cb:b0:41a:5d49:6143 with SMTP id d11-20020a05600c34cb00b0041a5d496143mr4596319wmq.12.1713883460945;
        Tue, 23 Apr 2024 07:44:20 -0700 (PDT)
Message-ID: <b1333d62-b738-4a61-9c68-ba7903f2e92d@suse.com>
Date: Tue, 23 Apr 2024 16:44:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] x86/alternative: Walk all replacements in debug
 builds
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240422181434.3463252-1-andrew.cooper3@citrix.com>
 <20240422181434.3463252-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240422181434.3463252-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.04.2024 20:14, Andrew Cooper wrote:
> In debug builds, walk all alternative replacements with x86_decode_lite().
> 
> This checks that we can decode all instructions, and also lets us check that
> disp8's don't leave the replacement block.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

With pointed-to types consistently constified, technically:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

One further suggestion and a question, though:

> @@ -464,6 +465,54 @@ static void __init _alternative_instructions(bool force)
>  void __init alternative_instructions(void)
>  {
>      arch_init_ideal_nops();
> +
> +    /*
> +     * Walk all replacement instructions with x86_decode_lite().  This checks
> +     * both that we can decode all instructions within the replacement, and
> +     * that any near branch with a disp8 stays within the alternative itself.
> +     */
> +    if ( IS_ENABLED(CONFIG_DEBUG) )
> +    {
> +        struct alt_instr *a;
> +
> +        for ( a = __alt_instructions;
> +              a < __alt_instructions_end; ++a )
> +        {
> +            void *repl = ALT_REPL_PTR(a);
> +            void *ip = repl, *end = ip + a->repl_len;
> +
> +            if ( !a->repl_len )
> +                continue;
> +
> +            for ( x86_decode_lite_t res; ip < end; ip += res.len )
> +            {
> +                res = x86_decode_lite(ip, end);
> +
> +                if ( res.len <= 0 )
> +                {
> +                    printk("Alternative for %ps [%*ph]\n",
> +                           ALT_ORIG_PTR(a), a->repl_len, repl);
> +                    panic("Unable to decode instruction at +%u in alternative\n",
> +                          (unsigned int)(unsigned long)(ip - repl));

Instead of the double cast, maybe better use +%lu? And really we ought to
have support for %tu, allowing the other cast t be dropped here, too.

> +                }
> +
> +                if ( res.rel_type == REL_TYPE_d8 )
> +                {
> +                    int8_t *d8 = res.rel;
> +                    void *target = ip + res.len + *d8;
> +
> +                    if ( target < repl || target > end )
> +                    {
> +                        printk("Alternative for %ps [%*ph]\n",
> +                               ALT_ORIG_PTR(a), a->repl_len, repl);
> +                        panic("'JMP/Jcc disp8' at +%u leaves alternative block\n",
> +                              (unsigned int)(unsigned long)(ip - repl));
> +                    }
> +                }

Why's Disp8 more important to check than Disp32? A bad CALL in a
replacement can't possibly be encoded with Disp8, and both JMP and Jcc
are also more likely to be encoded with Disp32 when their target isn't
in the same blob (but e.g. in a different section).

Jan

