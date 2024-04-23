Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE0D8AEA09
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 17:01:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710758.1110202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHeR-0007aJ-IT; Tue, 23 Apr 2024 15:01:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710758.1110202; Tue, 23 Apr 2024 15:01:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHeR-0007YV-Ej; Tue, 23 Apr 2024 15:01:43 +0000
Received: by outflank-mailman (input) for mailman id 710758;
 Tue, 23 Apr 2024 15:01:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ck89=L4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzHeQ-000791-Ce
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 15:01:42 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63d03bb3-0182-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 17:01:40 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-346359c8785so4749391f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 08:01:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q2-20020adff942000000b00346bda84bf9sm14974870wrr.78.2024.04.23.08.01.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 08:01:39 -0700 (PDT)
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
X-Inumbo-ID: 63d03bb3-0182-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713884500; x=1714489300; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GSz894s7Pk7pyEVQS5m8p0g7OkU+eqYYBBbcuSTrb7w=;
        b=ToKpMcPnZLgFd9BYFdcu0TY86XTdTXGcdYTriJjN6w2a9D7+/2lVWAUprDNaPKS9eJ
         utIEZNCddFpW78VPN+nYzMbIo8DEA9vccpHtD+IU5bdFYvJgnUKm3HEYV/3gljn0NLeo
         d/Wj/owwsqmnimuHJjl27XGLChxsVDCIx1ykfArQh8UD8Cgd7DZeCSq4WKBx1Zg33BzT
         y18G8YOALtoqBuPwNQC2JSlYdwWY6eBTBc19oEPuWqU0mv8Fj7gEfqBKVAsZvcJx/OlD
         KS3DtG3sUjmU7iuTS/gWdtktnMvywBIVdXIu5PdQO77NgIbPco1R2HdY4qBwEtdJhfTq
         XiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713884500; x=1714489300;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GSz894s7Pk7pyEVQS5m8p0g7OkU+eqYYBBbcuSTrb7w=;
        b=rREOQJIuwBbHVvVov8YlprlZoCQoeOuyeCZw3FmwOX4/I1I7HpymWMRHKywrtPe5bB
         nBAY7XWM+26cgYHYQbp/KoxKzdRRBaJEk95piMkmNgu7FuHgs6+RJQS5jGUEE8K93CUM
         TCVhUfbHL49LdPkvsu50djsIpYZwJ8Sb3Pn8bcOux4jk1EUteYWlJbk2xRWb+Fgio87G
         MpOZyEsyYDUWeLA6Evf7SPdLcHCf9FhCG1DS/MHY81LGYSo7r694M+ExLP4kkRe6vOQV
         xDgSievSEUpO0WjJPe1fSbcWlby6+BA7DMshs0oZYsJItLxPcojIlCw+2nCTmbf4P+lQ
         Ijhw==
X-Forwarded-Encrypted: i=1; AJvYcCUhyT8C6EIxCyw/NJDgBCH/zcpraeMVsnPE3mHx3DkpG6sUfxtwde9/2TMvwcAUSnJjADUtEpg0IinpS80LJyqHI1lLUHZhYE2H9q15kEA=
X-Gm-Message-State: AOJu0YyHoKyyn71hzyqVUVbRsH8FZa1w3N8ACISERsWhBtlYtnN+bTIu
	w3H/AUVNSBiT0AlmEV7NDM5QbIxbnKtsnJv3yGeYkiySvcAF/9gspU/mg6svVQ==
X-Google-Smtp-Source: AGHT+IGGxoy7FwrpgJSInu1rgiIkfD5J/tK5PhOLE7tJgLT+XneJFP/WZLOOZQ1SpoR0KGGsZLax2A==
X-Received: by 2002:a05:6000:928:b0:346:c7ed:22de with SMTP id cx8-20020a056000092800b00346c7ed22demr8866031wrb.14.1713884499834;
        Tue, 23 Apr 2024 08:01:39 -0700 (PDT)
Message-ID: <9941bce5-aab2-465e-8813-612b94d03a9c@suse.com>
Date: Tue, 23 Apr 2024 17:01:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] x86/alternative: Intend the relocation logic
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240422181434.3463252-1-andrew.cooper3@citrix.com>
 <20240422181434.3463252-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240422181434.3463252-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.04.2024 20:14, Andrew Cooper wrote:
> ... to make subsequent patches legible.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
even if (perhaps due to changes in the "real" patch) some of this re-
indenting wants doing differently, just with ...

> --- a/xen/arch/x86/alternative.c
> +++ b/xen/arch/x86/alternative.c
> @@ -244,78 +244,80 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
>  
>          memcpy(buf, repl, a->repl_len);
>  
> -        /* 0xe8/0xe9 are relative branches; fix the offset. */
> -        if ( a->repl_len >= 5 && (*buf & 0xfe) == 0xe8 )
>          {
> -            /*
> -             * Detect the special case of indirect-to-direct branch patching:
> -             * - replacement is a direct CALL/JMP (opcodes 0xE8/0xE9; already
> -             *   checked above),
> -             * - replacement's displacement is -5 (pointing back at the very
> -             *   insn, which makes no sense in a real replacement insn),
> -             * - original is an indirect CALL/JMP (opcodes 0xFF/2 or 0xFF/4)
> -             *   using RIP-relative addressing.
> -             * Some branch destinations may still be NULL when we come here
> -             * the first time. Defer patching of those until the post-presmp-
> -             * initcalls re-invocation (with force set to true). If at that
> -             * point the branch destination is still NULL, insert "UD2; UD0"
> -             * (for ease of recognition) instead of CALL/JMP.
> -             */
> -            if ( a->cpuid == X86_FEATURE_ALWAYS &&
> -                 *(int32_t *)(buf + 1) == -5 &&
> -                 a->orig_len >= 6 &&
> -                 orig[0] == 0xff &&
> -                 orig[1] == (*buf & 1 ? 0x25 : 0x15) )
> +            /* 0xe8/0xe9 are relative branches; fix the offset. */
> +            if ( a->repl_len >= 5 && (*buf & 0xfe) == 0xe8 )
>              {
> -                long disp = *(int32_t *)(orig + 2);
> -                const uint8_t *dest = *(void **)(orig + 6 + disp);
> -
> -                if ( dest )
> +                /*
> +                 * Detect the special case of indirect-to-direct branch patching:
> +                 * - replacement is a direct CALL/JMP (opcodes 0xE8/0xE9; already
> +                 *   checked above),
> +                 * - replacement's displacement is -5 (pointing back at the very
> +                 *   insn, which makes no sense in a real replacement insn),
> +                 * - original is an indirect CALL/JMP (opcodes 0xFF/2 or 0xFF/4)
> +                 *   using RIP-relative addressing.
> +                 * Some branch destinations may still be NULL when we come here
> +                 * the first time. Defer patching of those until the post-presmp-
> +                 * initcalls re-invocation (with force set to true). If at that
> +                 * point the branch destination is still NULL, insert "UD2; UD0"
> +                 * (for ease of recognition) instead of CALL/JMP.
> +                 */
> +                if ( a->cpuid == X86_FEATURE_ALWAYS &&
> +                     *(int32_t *)(buf + 1) == -5 &&
> +                     a->orig_len >= 6 &&
> +                     orig[0] == 0xff &&
> +                     orig[1] == (*buf & 1 ? 0x25 : 0x15) )
>                  {
> -                    /*
> -                     * When building for CET-IBT, all function pointer targets
> -                     * should have an endbr64 instruction.
> -                     *
> -                     * If this is not the case, leave a warning because
> -                     * something is probably wrong with the build.  A CET-IBT
> -                     * enabled system might have exploded already.
> -                     *
> -                     * Otherwise, skip the endbr64 instruction.  This is a
> -                     * marginal perf improvement which saves on instruction
> -                     * decode bandwidth.
> -                     */
> -                    if ( IS_ENABLED(CONFIG_XEN_IBT) )
> +                    long disp = *(int32_t *)(orig + 2);
> +                    const uint8_t *dest = *(void **)(orig + 6 + disp);
> +
> +                    if ( dest )
>                      {
> -                        if ( is_endbr64(dest) )
> -                            dest += ENDBR64_LEN;
> -                        else
> -                            printk(XENLOG_WARNING
> -                                   "altcall %ps dest %ps has no endbr64\n",
> -                                   orig, dest);
> +                        /*
> +                         * When building for CET-IBT, all function pointer targets
> +                         * should have an endbr64 instruction.
> +                         *
> +                         * If this is not the case, leave a warning because
> +                         * something is probably wrong with the build.  A CET-IBT
> +                         * enabled system might have exploded already.
> +                         *
> +                         * Otherwise, skip the endbr64 instruction.  This is a
> +                         * marginal perf improvement which saves on instruction
> +                         * decode bandwidth.
> +                         */
> +                        if ( IS_ENABLED(CONFIG_XEN_IBT) )
> +                        {
> +                            if ( is_endbr64(dest) )
> +                                dest += ENDBR64_LEN;
> +                            else
> +                                printk(XENLOG_WARNING
> +                                       "altcall %ps dest %ps has no endbr64\n",
> +                                       orig, dest);
> +                        }
> +
> +                        disp = dest - (orig + 5);
> +                        ASSERT(disp == (int32_t)disp);
> +                        *(int32_t *)(buf + 1) = disp;
>                      }
> -
> -                    disp = dest - (orig + 5);
> -                    ASSERT(disp == (int32_t)disp);
> -                    *(int32_t *)(buf + 1) = disp;
> -                }
> -                else if ( force )
> -                {
> -                    buf[0] = 0x0f;
> -                    buf[1] = 0x0b;
> -                    buf[2] = 0x0f;
> -                    buf[3] = 0xff;
> -                    buf[4] = 0xff;
> +                    else if ( force )
> +                    {
> +                        buf[0] = 0x0f;
> +                        buf[1] = 0x0b;
> +                        buf[2] = 0x0f;
> +                        buf[3] = 0xff;
> +                        buf[4] = 0xff;
> +                    }
> +                    else
> +                        continue;
>                  }
> +                else if ( force && system_state < SYS_STATE_active )
> +                    ASSERT_UNREACHABLE();
>                  else
> -                    continue;
> +                    *(int32_t *)(buf + 1) += repl - orig;
>              }
> -            else if ( force && system_state < SYS_STATE_active )
> +            else if ( force && system_state < SYS_STATE_active  )

... this undone.

Jan

