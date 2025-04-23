Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C85A9848C
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 11:01:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964247.1355094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Vym-0004em-5l; Wed, 23 Apr 2025 09:01:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964247.1355094; Wed, 23 Apr 2025 09:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Vym-0004cg-21; Wed, 23 Apr 2025 09:01:16 +0000
Received: by outflank-mailman (input) for mailman id 964247;
 Wed, 23 Apr 2025 09:01:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7Vyk-0004Zc-Hn
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 09:01:14 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 812ead0d-2021-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 11:01:12 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso70968595e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 02:01:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4a4d67sm18271358f8f.94.2025.04.23.02.01.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 02:01:11 -0700 (PDT)
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
X-Inumbo-ID: 812ead0d-2021-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745398872; x=1746003672; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B3dvFG9iWRanZSV7bn6YlsQ0m12g56pjRmpydzDPJbc=;
        b=H1DMGJqf+EALTdqSHufBpsn0baRCqR+MZJf4ua2L97kL2mLj5aXcJ39kABOogpHQ7e
         xNb48FU54JLGf6JIthGnjRZ1gFuSNaEAanp3Y5TjMuLHI7uN/3a5ZoRXavBFEp43IZep
         qGJpnM7wIBCFcRFZbYUCCC7GI43FRsZ94LaGstZTP8QBSl01LKr9RPd4OZz98Kt3US2l
         IwH42VzwGiAADEV5iYMKNUaAffFTA5RwwcdrmGU7Qv2l4fQMi2FohV6SzKDPjgnkm6JN
         9J5xocxlLwXA0waEl6ayFtkFZnt0o09RdNFkTdsqDg/EmTva0ZXnoVqnu1EYe/EjCtTf
         n40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398872; x=1746003672;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B3dvFG9iWRanZSV7bn6YlsQ0m12g56pjRmpydzDPJbc=;
        b=l64CLbPZYocbFCM5GZx0Epw4EyjAMX9Wx7uEMxb8NQaS+z1ERFdqTfL6O2RtrZcS1o
         J/Uo8BMn/rXTktgA3OelW/qnHWGjk0cEOic+e6eZyZ8TUqx+oh0/BSDhZHlc4ZY1aT/y
         dMQFEOMfP8AOFvwlUJlbLErpCZUFiH5Rsm8WtKYbk3Cc0+xgLWUYwkOIwTDPMbt/lyO6
         yuikU7/3oz0E/xxXQnd+KVduIxRKK+vx9bSRUhXmUbBCuPfOKADqAd3PtK05pNy4AdNV
         pOK4KZLrSX5VLBKQaYkxkp7hUJI2TTaCTTZ+R51jRIzJxmESzAN1Q/nH4cFk8wqVnOQn
         86tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVOvfIjMVB5yz8dzW4dLGmTQpcj9a/+a0IJIBo/OhewSPpPal7pH7Nh85l7rAwzn2q5sUlyn1vQWE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwQdgZhjHtyRt6MMc8EMsVkuM+TGAg6t/6uuz4qAWmutaNpN1u
	YPkH3ZJHMw9hAScqZpyAdWlnZYDErqinxZwdArG0rNvOp8tFGhyXKtWcZMqsQQ==
X-Gm-Gg: ASbGncvSc5VQVyPXp1vc8z6d+JhE5fL1cMP/kYB8MkankT4EcdGH8WgdWNfkJObfBNh
	Q8EjVEum6WlqJqMlNnX/2JKlzRHaqEFIDo/qdw1Wcq1YH7R28SAUjsFk1dK3nxKa+ns1npg+jME
	vDsgNDK8/NZSCo2uwh/zsUm/9oEs4vAYa/Toaq3fm/mdKEPJDAolNZD1omcHUjumgC7GARPEzMA
	b7ywIJtdyN0kWNxLCyn08uuSJrZUmMBOuiRGLy080d4GaGpYE6n9asKJGNl1IaxlCtHt7MV4bkf
	RPgHNZGh0RRdxRZPpj2K7vg4iRXG2ETWvl4otT6SafmXZcs2yDQbURvNyl4+yiR6Hf9DupIPS49
	TnC6xdkcwdtTVC0ZMFDfWeDJupA==
X-Google-Smtp-Source: AGHT+IHPn0NOnzZ88ejJ0tlUlcPnkNyRMDW73gL+FBi5BSGcPS8AiMDuUt1K1eYzb8DQch8i8ted5Q==
X-Received: by 2002:a05:6000:1888:b0:390:f358:85db with SMTP id ffacd0b85a97d-39efba5edf2mr14567436f8f.30.1745398871758;
        Wed, 23 Apr 2025 02:01:11 -0700 (PDT)
Message-ID: <e90b8723-3c15-4488-bc7f-b765dcc92ef6@suse.com>
Date: Wed, 23 Apr 2025 11:01:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] x86/altcall: Switch to simpler scheme
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250423010237.1528582-1-andrew.cooper3@citrix.com>
 <20250423010237.1528582-8-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250423010237.1528582-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2025 03:02, Andrew Cooper wrote:
> --- a/xen/arch/x86/alternative.c
> +++ b/xen/arch/x86/alternative.c
> @@ -378,13 +378,6 @@ static int init_or_livepatch _apply_alternatives(struct alt_instr *start,
>          text_poke(orig, buf, total_len);
>      }
>  
> -    /*
> -     * Clobber endbr64 instructions now that altcall has finished optimising
> -     * all indirect branches to direct ones.
> -     */
> -    if ( force && system_state < SYS_STATE_active )
> -        seal_endbr64();
> -
>      return 0;
>  }
>  
> @@ -533,6 +526,8 @@ static int __init cf_check nmi_apply_alternatives(
>              rc = apply_alt_calls(__alt_call_sites_start, __alt_call_sites_end);
>              if ( rc )
>                  panic("Unable to apply alternative calls: %d\n", rc);
> +
> +            seal_endbr64();
>          }

Are you deliberately losing the comment? Other than this:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

