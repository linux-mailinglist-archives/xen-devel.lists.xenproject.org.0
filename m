Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7158F8AE9FF
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 17:00:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710750.1110172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHcR-0005FN-MB; Tue, 23 Apr 2024 14:59:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710750.1110172; Tue, 23 Apr 2024 14:59:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHcR-0005Cb-J4; Tue, 23 Apr 2024 14:59:39 +0000
Received: by outflank-mailman (input) for mailman id 710750;
 Tue, 23 Apr 2024 14:59:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ck89=L4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzHcP-0005BY-IX
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 14:59:37 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19cd403f-0182-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 16:59:36 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41adf3580dbso1586275e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 07:59:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b7-20020adff907000000b0034b3394f0e1sm4327148wrr.10.2024.04.23.07.59.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 07:59:35 -0700 (PDT)
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
X-Inumbo-ID: 19cd403f-0182-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713884376; x=1714489176; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hIHrnErZ7OOglAOjL9WjrTxuohtA+jXYvSjBDzTnG08=;
        b=FK+7udYFqNsWCU1MEfeWE2B2jdtjGyGV5wMJcugCDn2wu9pVCq3FoiVvZKE9Q5+ATd
         39Kxn8NpPjQsFrHvvOxJ3KWNTkhqpHxCyI8KBze+Uc1zRVpwB2t6qd+0CtSYbCBMI7Xg
         oLZGudI4TDDvC7TQ1Sr7lVNraPiJt+44lPF8HqI/6a8RgqY8u3zh4syuptiFNm8Isgep
         XkERjeREI5WuiAkRQ03mtfhk0Uv3J+jt+DU7rb9FiKeiQKxLcYixh6cnEpkhQTTX8mQY
         lURJZBkyfJUoJBXi2f5fdsK0ISoZ41YbiWuxqhri9P4eNH79z40f9nC9JfF8P4VdI8LM
         DBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713884376; x=1714489176;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hIHrnErZ7OOglAOjL9WjrTxuohtA+jXYvSjBDzTnG08=;
        b=H5uAFdS589aU8X4rPbAePT87JPDPSX9IpdJCVB60uLhie5vbgRIHuezW/cE1e3P+zq
         zO0ULxZ3CPm5YFV8GAHfLZ3rH+6YEKFNN+0OBCcgTsbS/DIb1XiHcQm2DHqdo6anxuAV
         d5anUmnXKCRLLOF5zJSgO+Pj8qUwzIOifqX8Fh73t6TwK/hHbwyExk6HB1Kvfhrxv5rL
         S2//RCSN8fQVeDT649T6b55YlOS63L5mr8tmQfWyQwCH9RQiijTqVyxUCozdAozH3c8Q
         3OlV9BX6rA+UL9uoqJXekhEo5C3N0jbR4wlg6+zlw1effiomvd4DYMVvRH81bCHWE1pc
         mVVA==
X-Forwarded-Encrypted: i=1; AJvYcCVFXg5gVa0bak2ZROldo2/Q4V9qFdXAt/DZtxUjJJNe7rKIlaL/eqCnfq9UCyboDKpuNV/1k7laklr6ptdUBdhYaHmxN8vuR2gbEeVA6f8=
X-Gm-Message-State: AOJu0YwJ6thNFlY2wNevRZ96N4RkV2Y+CFnVR8qMyzqxqTgiYT1QX5R6
	mKE8Z3X5KS9uucs8823LfneHLFqBsWlOwvujRuEcDfIivHnkx18z3qtXWB6eLN8K7f6xh3CDySs
	=
X-Google-Smtp-Source: AGHT+IHGNYQJTMr0ffnI7y8CYhNgiWXq54adSQfYtm5VRhmkp7OEAkfp2uvjMrWvyeNtEd54h3UV8A==
X-Received: by 2002:a05:600c:314b:b0:418:f6e7:3599 with SMTP id h11-20020a05600c314b00b00418f6e73599mr2203633wmo.3.1713884375748;
        Tue, 23 Apr 2024 07:59:35 -0700 (PDT)
Message-ID: <b0412697-d258-447a-9470-09590744c2c9@suse.com>
Date: Tue, 23 Apr 2024 16:59:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] x86/alternative: Relocate all insn-relative fields
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240422181434.3463252-1-andrew.cooper3@citrix.com>
 <20240422181434.3463252-6-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240422181434.3463252-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.04.2024 20:14, Andrew Cooper wrote:
> --- a/xen/arch/x86/alternative.c
> +++ b/xen/arch/x86/alternative.c
> @@ -244,10 +244,31 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
>  
>          memcpy(buf, repl, a->repl_len);
>  
> +        /* Walk buf[] and adjust any insn-relative operands. */
> +        if ( a->repl_len )
>          {
> -            /* 0xe8/0xe9 are relative branches; fix the offset. */
> -            if ( a->repl_len >= 5 && (*buf & 0xfe) == 0xe8 )
> +            uint8_t *ip = buf, *end = ip + a->repl_len;
> +
> +            for ( x86_decode_lite_t res; ip < end; ip += res.len )
>              {
> +                int32_t *d32;
> +                uint8_t *target;
> +
> +                res = x86_decode_lite(ip, end);
> +
> +                if ( res.len <= 0 )
> +                {
> +                    printk("Alternative for %ps [%*ph]\n",
> +                           ALT_ORIG_PTR(a), a->repl_len, repl);
> +                    printk("Unable to decode instruction in alternative - ignoring.\n");
> +                    goto skip_this_alternative;

Can this really be just a log message? There are cases where patching has
to happen for things to operate correctly. Hence if not panic()ing, I'd
say we at least want to taint the hypervisor.

> @@ -317,14 +338,23 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
>                           */
>                          goto skip_this_alternative;
>                      }
> +
> +                    continue;
>                  }
> -                else if ( force && system_state < SYS_STATE_active )
> -                    ASSERT_UNREACHABLE();

This (and the other one below) is related to altcall patching, which you
say you mean to leave alone: During the 2nd pass, no un-processed CALL /
JMP should occur anymore that aren't altcall related.

Jan

