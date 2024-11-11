Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 760B99C3E09
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 13:11:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833660.1248842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tATGH-0002lF-Al; Mon, 11 Nov 2024 12:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833660.1248842; Mon, 11 Nov 2024 12:11:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tATGH-0002jA-78; Mon, 11 Nov 2024 12:11:17 +0000
Received: by outflank-mailman (input) for mailman id 833660;
 Mon, 11 Nov 2024 12:11:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YTX=SG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tATGF-0002j1-Mp
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 12:11:15 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b28ed7c-a026-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 13:11:13 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-37d41894a32so2525360f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 04:11:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b0530599sm177370415e9.1.2024.11.11.04.11.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 04:11:12 -0800 (PST)
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
X-Inumbo-ID: 0b28ed7c-a026-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmIiLCJoZWxvIjoibWFpbC13cjEteDQyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjBiMjhlZDdjLWEwMjYtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzI3MDczLjA0MTc0Miwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731327072; x=1731931872; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=93IDoFpNJkX5Olo6ww+EkNzhD5qJ6XcWxZlQMsJPw8g=;
        b=NpWE6Ebge6Dcllecb6Nz7eOmsoDK59j+iDvf5LY/S+ZhbD1ba+ecmF84XiQqYC7b9B
         LSIDU3au695b87h4EMizcxSuxUa/Wv0rPqaOIINf0TaGDbaUjKPIa70qTj+VwqXX+/Lx
         qeehE3ztlbRx7n3qhkP5m0HdZfy7jMxYEvuhEiiFXdCwpaMFqwq5g8E/+NCOw3zWs3Dt
         SxgYPlB8m0dHRLTlIx8KUPrC1I1F+Dc9iSH+pI4AYJW/I2G1G4QMDnBA0fgiNaFJHQaJ
         KwRpav+VhYS1IBAgdM9s4z3Fy/kzeLdIFE+eppoKGOKRq9llk5nFOuAlj8t/yoiQ0OYv
         TIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731327072; x=1731931872;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93IDoFpNJkX5Olo6ww+EkNzhD5qJ6XcWxZlQMsJPw8g=;
        b=XuElrQ+yh+aSpZdv21by2PWV4C+sNaKxwNTt9m227LxGphJAnGTlStI5u2uN7Bo23C
         jyg7VlfRugnx9zVGvxFpYD5eGrBLdt1E5P9RGTvAbORZUnRNA1AbRYRCI4wxHPIEzxoE
         WYix+2I2FEi+HmfJesbv24TKyVEQPAhegsl1JapOGM09jBrUoB3pB49wFBt+DfOVv8zI
         wDMvlOzoUjuHRpkZkdKcQJgDNMY5oc6HpiZv5EgK9oJCVLv7jmRvJlo6wBkh2Pr/dBIl
         KKveMTsSgxfpxFR1lXxm+/ajKnROlr6SOS55L7RK7cm0pg2Y9QHrvo+wbEbNdIaR/jsE
         viIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBXyv8GOzA92jR1BfhIHr2B4b+QIMRyeys9EfsapFSpxkiGfG+eGFm5fQB2uDkPwLNP2HB/j7HZU8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzsVFgK3mGhYSNOlVTgM/DiWcHnBr9oa9UkgknD4OcJTxydg9Am
	6bjT9sllZzTfGRr8E6n7dlC3sUQ+MvNgPa+lIQ3G0lsHAAC9yjEykK1lQ6dhug==
X-Google-Smtp-Source: AGHT+IFyAv+/QBjsGShCgjYEabtabr4/3tcumlgOVSI43vVys/lvEkjZ4YoyIFTY6mP9rW/BKBs1Sw==
X-Received: by 2002:a05:6000:4107:b0:381:f587:1c2c with SMTP id ffacd0b85a97d-381f5871d05mr8273542f8f.20.1731327072437;
        Mon, 11 Nov 2024 04:11:12 -0800 (PST)
Message-ID: <e0e38922-dd4a-4bbd-aa58-ab00821fa8d0@suse.com>
Date: Mon, 11 Nov 2024 13:11:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/boot: Setup correctly fs segment for
 bogus_real_magic
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241111111822.6795-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20241111111822.6795-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.11.2024 12:18, Frediano Ziglio wrote:
> --- a/xen/arch/x86/boot/wakeup.S
> +++ b/xen/arch/x86/boot/wakeup.S
> @@ -20,6 +20,8 @@ ENTRY(wakeup_start)
>          movw    %ax, %ds
>          movw    %ax, %ss        # A stack required for BIOS call
>          movw    $wakesym(wakeup_stack), %sp
> +        movw    $0xb800, %ax
> +        movw    %ax, %fs
>  
>          pushl   $0              # Kill dangerous flag early
>          popfl

If put here, I think it needs to be accompanied by a comment, to avoid
it (wrongly) being deemed redundant again. Personally I would prefer if
it was put where it's needed, at bogus_real_magic itself (at which
point no commentary would be needed).

Jan

