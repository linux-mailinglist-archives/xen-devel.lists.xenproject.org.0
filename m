Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77934A02304
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 11:33:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865658.1276912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUkPe-0004KH-Tp; Mon, 06 Jan 2025 10:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865658.1276912; Mon, 06 Jan 2025 10:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUkPe-0004HT-QW; Mon, 06 Jan 2025 10:32:46 +0000
Received: by outflank-mailman (input) for mailman id 865658;
 Mon, 06 Jan 2025 10:32:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9khw=T6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tUkPd-0004HN-7j
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 10:32:45 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8fb8fdba-cc19-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 11:32:43 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-385eed29d17so6689328f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 02:32:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e43dsm48316262f8f.70.2025.01.06.02.32.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 02:32:42 -0800 (PST)
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
X-Inumbo-ID: 8fb8fdba-cc19-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736159562; x=1736764362; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b000T26MrIM2i9K9ongnpnfhmN/t2W9V0DgkR7Eu9A8=;
        b=KBaXG+q9hK+akFMK4EZ4C7n74FclIY7ACIJr0AG8wDtApvTRYNVdzGuCPj+Sgev4z5
         YsmhCqsCTcK+q00rWj5S7K5IN9Q3wtdMxFzgK0gm6bIALPuxFX0LpHkKe+EFoUy2EE0o
         KMRtKCWpHvj7LZ0UifRuEXjRUr/l52h459iM8lWOo9w6wl/rv0IS+lNE0Vd29szP0rRo
         TyBUUxLUckNcJyuuFMUFy9EtWaEmK4x+HU9DMkmSovCkvSAjphr7O2jXnfhVAM7rZ8ac
         OP1Ps7kwziG1QdBpw1WxBffIHYJNxy7ZND8/KVrHCuGmTvIaw7/YeszTndJCd72SZ59s
         RR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736159562; x=1736764362;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b000T26MrIM2i9K9ongnpnfhmN/t2W9V0DgkR7Eu9A8=;
        b=hTTXQodhOCo6YYO8FJnKspF+VAQWfeOXGCGr3+Q2Mvv/eAXxRV7Kbv/ysfWG8jnwql
         7cFruJxETUNZfPXgFgjp9+3CauJO8KX+gK2Sb7FiCXdqNKwwn5TU11gMzCAb69rjVmLb
         nMk0jyiwV9sy7yD56TJLXOQMwD6umsvCoYJITH8EQoJS+3Ji8Q45+QE1n2hyXdMR1XjF
         40uPjgwbVaA65v00dR8POfV76VwpC5eedZA/MDsxHQYpKsRQNJ5JLR4cgsP3KWPh36HH
         xGo+XGRPgVgq4KcJFukr0DaNhGQRv1eE24hu6/JcAJskRHQFbFu3dhVwG6ZO9g7wBNYA
         QMVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7aTZE6gtWVU4drM0PljUy00PDg9EJYZ8euGo6wjo/XIUmy1Qg+GkahmCynR6nZOfHjzh7i/apW7c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRshEzepnnL0EjrgqVW5o1P6XUxe7g/QEq876jBtkSXP7Sxfgo
	/mpV27U24YTijeaQBQjklEtABpBhahb/iJXKbTl3Oj/bCCx+2wrV6HfC3e80Dg==
X-Gm-Gg: ASbGncvRUYWMryrH8bav0EpkttpANoo0HYEew1M28eZok51ZfHAFoi3HrPKzLTCpunG
	cGkQ13PuHDV9e2yErXTd38I664AY8+ydSagWhIsMj5Qe7uOSOqGHvzmwr71OhaijjyNeWcwqFro
	3gqOd6TPzK7fsRDJ3nq4si4AE/3FBF9VUjs6dSL1+gZFU/sWlJZpRLJrLEDO+vTEzlDba9Fxsxu
	2n5CkDv2HSONGLpg/5ALpJ6y0xNtXmi+oel80vmnI1Jkv3I0FMvF0iyJmH2rJx9Qu7up2wl89eL
	84TGJaM72h4DO28I41Fhty02/grdliEQvEHRz3lD4g==
X-Google-Smtp-Source: AGHT+IFG+TcUIS8tmhSFsHZqKub2NXNyRBahLa5Wx8ykMpugXutDTzbpKBsk5buWF15Tv6BF2mv16w==
X-Received: by 2002:a5d:6c6e:0:b0:385:f9db:3c4c with SMTP id ffacd0b85a97d-38a221e2e0amr44465852f8f.9.1736159562355;
        Mon, 06 Jan 2025 02:32:42 -0800 (PST)
Message-ID: <398b7216-1564-424e-ad5c-8952795317ea@suse.com>
Date: Mon, 6 Jan 2025 11:32:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/4] x86/pv: Fix build with Clang and CONFIG_PERF_COUNTERS
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250102192508.2405687-1-andrew.cooper3@citrix.com>
 <20250102195512.2406928-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250102195512.2406928-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.01.2025 20:55, Andrew Cooper wrote:
> Clang, of at least verion 17 complains:
> 
>   arch/x86/pv/hypercall.c:30:10: error: variable 'eax' is used uninitialized
>   whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>      30 |     if ( !compat )
>         |          ^~~~~~~
>   arch/x86/pv/hypercall.c:87:29: note: uninitialized use occurs here
>      87 |     perfc_incra(hypercalls, eax);
>         |                             ^~~
> 
> This function is forced always_inline to cause compat to be
> constant-propagated through, but that is only a heuristic to try and get the
> compiler to do what we want, not a gurantee that it does.
> 
> Clang doesn't appear to be able to see that the only case where compat is
> true (and therefore the if() is false) is when there's an else clause on the
> end which sets eax too.
> 
> Initialise eax to -1, which ought to be optimised out, but if for whatever
> reason it happens not to be, then perfc_incra() will fail it's bounds check
> and do nothing.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



