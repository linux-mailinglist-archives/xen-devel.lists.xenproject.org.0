Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 822B69E9BB9
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 17:31:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851693.1265725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKget-0007M5-0k; Mon, 09 Dec 2024 16:30:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851693.1265725; Mon, 09 Dec 2024 16:30:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKges-0007Jh-U7; Mon, 09 Dec 2024 16:30:54 +0000
Received: by outflank-mailman (input) for mailman id 851693;
 Mon, 09 Dec 2024 16:30:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKger-0007Gv-Jf
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 16:30:53 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f46e7c73-b64a-11ef-99a3-01e77a169b0f;
 Mon, 09 Dec 2024 17:30:51 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-385e27c75f4so3471879f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 08:30:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21637c96975sm32532835ad.25.2024.12.09.08.30.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 08:30:50 -0800 (PST)
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
X-Inumbo-ID: f46e7c73-b64a-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733761851; x=1734366651; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OgT9yQcxy5ylQ9TY0cyrN1Lr58fZdERdHTNBqjI9JIY=;
        b=DOE+dxZ/YggViBR8LqhNnNXCe2woQXTfBsXM1HY3OoUXYtxdSPx03uYtXnl+W6jibR
         qF7k9EoZ+KQyJ/uT7lJg61B7KckYP/6eZ0zC642QTNCRF+AkJED7XU2F75tFLPFWtdSO
         lst4LlIcNcEAL9QZanoViuJmUptlqRMVKzOOixXUYdhej8yFB3OYz34qxRyz3x9qcxdg
         pGn11vdYByyMF6M/XuOql1PZrC2XgtnEe6qIlQJdRjH4dGoYr5XcUyd8rKSkc1Q+M6uZ
         ldH2Pj8fJP1N/gFmvlVJfw7zeiLQwutyMQuEK9WL+M3i1uHoSU7awhEagVOWaLeJha7q
         kt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733761851; x=1734366651;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgT9yQcxy5ylQ9TY0cyrN1Lr58fZdERdHTNBqjI9JIY=;
        b=U90cWT3c7feAilD60uAzehqsWxnGu4GOTd7RSA+cpvFT1ZiqDxwmfFHCksvFb54JOP
         mOxgwJdcBsYahQW8ThVEV/cMpI5vYI5kCHsMCCaqc2SeqIDyrrguIMMzL9wO485E2BNO
         WoFB/pWTNBoDRz6NJlZVcanFevdqBF62GxFpe3VgLGcO5htm08WPKQH/KKYFhYt8N+Zb
         OUQ+5Np5YqkdJnqZUVmpdnkX6uDqp9lZ0ksOyB4PYbp4B59eYspO8g24bpqod36bWYB9
         ZBo3omURMlvBVcj+9JZNO4NHp5ya16CTdv24Wo3KUss5L3Ysq9IBsca/bu1Dr3gjH9hv
         KkzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIBgAsAGIeHokmGe83PIEII3KBvqJqW4ww0BeSkePB98+et27BA2R3QXSdzSUq4VwW7iIbtutCw2U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgGt+CCv0zEXPIw6xnh8Vt4mu4sl8JM1frSs8Z3rqn2OzIr9Tw
	LLauxoAkuLnzWFmX21SEAwR7AHNOySaDvWI1FYctpcwZXgHZBAggMu36rGQTew==
X-Gm-Gg: ASbGncuZLgmPuntPa9xehqIaLGp7F8zjGCikpQ0MSC526UgLLFR6Q+ncmB7inb/0VCi
	vUXLs18iybo8xhdwtnQJ0XxHbW8KDPjSgB0UX1ZgoNTlnoAqrNFDRqx1kLMisgCDtaYy9pigCcn
	TE7rk4bi5sdpIMxYUBcMD/w1qFzkkvftMZm4mQmOwDa2fpDwaETGolxiUOvUPkiyj3+aN0o9nmO
	OzZxo/VdeP3iHKp88EKYKN9yItemO3r1KgdBZ3tC5sfST0ll+Xfczo092RvqMZH33Cc1Uhz6MOZ
	XhmwVjp6RpgTwBf7U+GFX/p3s8+nyKRFK1c=
X-Google-Smtp-Source: AGHT+IHrwxIJ1vlPzSGfYUj2/oul7ya/PxJfseCTKosApilHfeElst02rw35+HBDKHsGnu8f9K0FgA==
X-Received: by 2002:a05:6000:1565:b0:385:e1f5:476f with SMTP id ffacd0b85a97d-386453fbd25mr705317f8f.39.1733761851181;
        Mon, 09 Dec 2024 08:30:51 -0800 (PST)
Message-ID: <7e36137b-ce1f-4e78-9a41-fbfdbe9c0d87@suse.com>
Date: Mon, 9 Dec 2024 17:30:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/13] x86/mpx: Map/unmap xsave area in in
 read_bndcfgu()
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
 <20241105143310.28301-11-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241105143310.28301-11-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.11.2024 15:33, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/xstate.c
> +++ b/xen/arch/x86/xstate.c
> @@ -1022,9 +1022,10 @@ int handle_xsetbv(u32 index, u64 new_bv)
>  
>  uint64_t read_bndcfgu(void)
>  {
> +    uint64_t bndcfgu = 0;
>      unsigned long cr0 = read_cr0();
> -    struct xsave_struct *xstate
> -        = idle_vcpu[smp_processor_id()]->arch.xsave_area;
> +    struct vcpu *v = idle_vcpu[smp_processor_id()];

Can this be pointer-to-const? Certainly right now, so the question is rather
meant to be forward looking.

> +    struct xsave_struct *xstate = VCPU_MAP_XSAVE_AREA(v);

This certainly can be pointer-to-const, just like ...

>      const struct xstate_bndcsr *bndcsr;

... this is.

Jan

