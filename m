Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 015D48AE8AC
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 15:52:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710649.1109982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzGYa-0005Jt-7o; Tue, 23 Apr 2024 13:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710649.1109982; Tue, 23 Apr 2024 13:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzGYa-0005Hp-54; Tue, 23 Apr 2024 13:51:36 +0000
Received: by outflank-mailman (input) for mailman id 710649;
 Tue, 23 Apr 2024 13:51:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ck89=L4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzGYY-0005HN-Ab
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 13:51:34 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97dfe89f-0178-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 15:51:32 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41a1d88723bso18061215e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 06:51:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bg11-20020a05600c3c8b00b0041a9c3444a6sm3817429wmb.28.2024.04.23.06.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 06:51:32 -0700 (PDT)
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
X-Inumbo-ID: 97dfe89f-0178-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713880292; x=1714485092; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6p64LwaZAdUFtzNLap1xXwnhZr5O4ic7GnnFeUhYJ00=;
        b=J0ZVN+0Lf0TrfcGQIDjaFMDCh7lAiqm18JNIr5b8vUKkpEfh2qRFEIgJVjBXVGbfGU
         R84o2UKDfso81cSi0vedIiZgT6FTx99uKW/TiEKzXezK2L5N5daHs3xH103l02Nn/SDw
         2ah9w1Ac1hoEtxAH1E4uDaT80ASczv+VufNWTvI4mbzfqLPnsmzrU3AbPV2WE0OrJvTx
         ommP4Dk0D0dTjiJK4be92lD6NpM0gfWu0m2N0tOQi7k0t7loE2bdjuesilRHBzyZMkCj
         WFcPJorQq/+gdD2SD+seqsFDgfnLMVx0SRzSKf8pjtgcg+VIHzp2LZdiI1U/KikfBn7+
         pDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713880292; x=1714485092;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6p64LwaZAdUFtzNLap1xXwnhZr5O4ic7GnnFeUhYJ00=;
        b=oLj26Y96rWUVNOl76J7tNM1ChW6edWkSV2IA/f1qHS3449cg9bwcDP0wVN6Cg+km4O
         boR0Wp/WhSWmKTSxKHoQ/QCsIiNGEx1eo0Kre0DnX1s4CxJuJffLpR6Y+00q5p2Qm9Vm
         iF8z93NEiof0rzTNufPBq96ErLiZJdnOBijlxNfHeJtpMVPfsVDL+cZ33Hcl37tw2x6q
         gnrXq5dofYOmWEmSjCmmdibfAqPZMvjmuvSCTX2NEG0jKhIgeE2vxULPvYyFb79F+Q7m
         BHyAYDhhnkRa8OdTvViWlnichjB9uCopBLTtiA6p/oXJkYgrwSxgstfjS1HsR9byZSjO
         TLTw==
X-Forwarded-Encrypted: i=1; AJvYcCXJxigFWK0+jyQQ33BwOg2HzpRXi/5OQ0WCXwjxkm/eSz6sgSVSy0m83Jm9dG9wlfD1n/fFfV/pXWBdxpUQCF1mxRiEoQ6cDU+Td3vaIA8=
X-Gm-Message-State: AOJu0YxDqEvJ0XHsJ5J5cesRgHWGgJLSr9W0K+Pt6QfaDBH6EC8UoxEG
	acBa/Srzdj9nB+cZWcl1uChbkZAH6kxU1w3pSx1LXeO0WrSWnDDDA6TQmpdhyQ==
X-Google-Smtp-Source: AGHT+IECXA9l6/PkHv+ZPVKVxydp41OBSDgmgjxnOMCFklwknBSy9baedzn31bAmi0sQdSElIyM0KQ==
X-Received: by 2002:a05:600c:3506:b0:41a:2b9:7764 with SMTP id h6-20020a05600c350600b0041a02b97764mr6683708wmq.27.1713880292242;
        Tue, 23 Apr 2024 06:51:32 -0700 (PDT)
Message-ID: <b76f105b-ac92-4759-8e93-64b97232a60c@suse.com>
Date: Tue, 23 Apr 2024 15:51:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] x86/livepatch: perform sanity checks on the
 payload exception table contents
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20240423131249.29825-1-roger.pau@citrix.com>
 <20240423131249.29825-5-roger.pau@citrix.com>
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
In-Reply-To: <20240423131249.29825-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.04.2024 15:12, Roger Pau Monne wrote:
> Ensure the entries of a payload exception table only apply to text regions in
> the payload itself.  Since the payload exception table needs to be loaded and
> active even before a patch is applied (because hooks might already rely on it),
> make sure the exception table (if any) only contains fixups for the payload
> text section.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

In principle
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Still two comments:

> --- a/xen/arch/x86/extable.c
> +++ b/xen/arch/x86/extable.c
> @@ -228,3 +228,21 @@ unsigned long asmlinkage search_pre_exception_table(struct cpu_user_regs *regs)
>      }
>      return fixup;
>  }
> +
> +#ifdef CONFIG_LIVEPATCH
> +bool extable_is_between_bounds(const struct exception_table_entry *ex_start,

s/between/in/ or even s/is_between/in/? "Between", to me at least, reads
very much like meaning "exclusive at both ends".

> +                               const struct exception_table_entry *ex_end,
> +                               const void *start, const void *end)
> +{
> +    for ( ; ex_start < ex_end; ex_start++ )
> +    {
> +        const void *addr = (void *)ex_addr(ex_start);
> +        const void *cont = (void *)ex_cont(ex_start);

Might be nicer to use _p() here, or not do the comparisons with pointers, but
instead with unsigned long-s.

Jan

