Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ED99E9B66
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 17:17:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851621.1265666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKgRp-0001JX-FC; Mon, 09 Dec 2024 16:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851621.1265666; Mon, 09 Dec 2024 16:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKgRp-0001HI-Bb; Mon, 09 Dec 2024 16:17:25 +0000
Received: by outflank-mailman (input) for mailman id 851621;
 Mon, 09 Dec 2024 16:17:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKgRo-0001HC-2J
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 16:17:24 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1281ab45-b649-11ef-a0d5-8be0dac302b0;
 Mon, 09 Dec 2024 17:17:23 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-385d7b4da2bso3837031f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 08:17:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725e054b3bbsm3257948b3a.42.2024.12.09.08.16.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 08:16:52 -0800 (PST)
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
X-Inumbo-ID: 1281ab45-b649-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733761042; x=1734365842; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kgZBGhZwbc3YtaGwh0Sp7Dx1oAkn5DYtUhx1DnSqQPg=;
        b=QPrtKJV2yxRcED8oHXyUO9xqzVzmifbbxie6UzCjHHpyGMDgc1q3N/hyDB/7y127OO
         Ej8mRKRHOrqPZg4QpA1VcW1D4s+TNk+TUJ50rcHeXrO78ZHv6qnbEUF1Bym+gV2Mifwy
         vTw1++uRVEoSseYhIco9mgC+d5f39FJgwF2a/OUt/evIQfLDUB6QEgbnfbq5nDpIwezW
         Sb+E70hukh7kAxja6ItWKkaF0DBhH4YiclXe4OPo5cx/P2DdJiOxjn5cr+z7grDg5Zm1
         EF17QZ96UR57OsDirGTBASngkrJIWXe8Q9RA2+gX5mCFmobd0mvl7LjGbTpqUzVDi8Fw
         S3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733761042; x=1734365842;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgZBGhZwbc3YtaGwh0Sp7Dx1oAkn5DYtUhx1DnSqQPg=;
        b=C9q1CPuyJX1mtycZ9XlrlTbRsuIi9cP40b6U78U8R6YJnInOx1ReG9CDKwu29EmSm8
         p1pxFLXP9wKuqxgw1Lj78OtoqlyySrdqpeli2hr9AlhLfG/PzrXZYs4oCfq5SYnT7xUP
         tBBkbnGIwX9uUGHUAi0WAvCFD7pFL0cKhKIWNQETFL9IDtX8xwR1wI5x0KiVH/ad6LWG
         A83+f5p8rfIe2I9d1m5L5wbfc9D2iUTyq9DvnIlX4zKgGkQrcfTbqGH01yKfEUODfK70
         dSCuhmQqVF5IAPgSEKpyxNXrHsX5Xn8cv0O5dib5F9oLA34b+wU8gfQYY6/pJq1B/kYk
         7KWA==
X-Forwarded-Encrypted: i=1; AJvYcCXUmqLJGDX4vLH5gF+SCqJRhGHzFhBCcpp8mpIaKhqSdQIdVkcs/kMzL/6PmxCE5rAtygY7iDcLm3o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+TxWwCPZwP36j/WvziaguCXLaCQLK3dNwhsJtWlMQ7FYm9s6y
	E1evSbGTl/3ywY3hFpKKX9JRWGVL+V2L2RvBpsHmqdFRwwvFBK8GrAQEQ739HA==
X-Gm-Gg: ASbGncth2cqQtd/IiwzdEOGiDq7MR0dFc/7Q/IPoIWS/AK8VaFXlLjqoYKCirJzqmno
	8ExrBlcXPkMdD9J8LKRYxMEJ1bHuirqiIJwkSNp0K7uvIKUDzeVhdLuyEJVIcTRFEyqdmUW0YEh
	qtkyD69NzMI/iolPGWlYQgbeBEk3prej0saVyotbaDM5EzAwUWSQFVThgOKDG6c7jtGhVa+dj79
	BLJKVDVKiShKoosoiqEpIX7PvziFUgb0Sn/yQ7KtRH/UrPxVVf98nn/PDhUN+HeNPEa8RAn/lPX
	Etia8dAaUni/uYy8G/q3P7N2xAL8riqqBGI=
X-Google-Smtp-Source: AGHT+IGaWggHeLj4QU/2f1Mg8nIO+RF40XpSELE6qVsekFnWkJk05kr/mElKFOk9baJStEAdK/drpQ==
X-Received: by 2002:a5d:584b:0:b0:386:3672:73c7 with SMTP id ffacd0b85a97d-386453d931amr1350434f8f.17.1733761012731;
        Mon, 09 Dec 2024 08:16:52 -0800 (PST)
Message-ID: <fb3bafe4-73f3-4aa1-981a-8faff5f92f9f@suse.com>
Date: Mon, 9 Dec 2024 17:16:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/13] x86/xstate: Map/unmap xsave area in
 xstate_set_init() and handle_setbv()
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
 <20241105143310.28301-6-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241105143310.28301-6-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.11.2024 15:33, Alejandro Vallejo wrote:
> No functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- a/xen/arch/x86/xstate.c
> +++ b/xen/arch/x86/xstate.c
> @@ -993,7 +993,13 @@ int handle_xsetbv(u32 index, u64 new_bv)
>  
>          clts();
>          if ( curr->fpu_dirtied )
> -            asm ( "stmxcsr %0" : "=m" (curr->arch.xsave_area->fpu_sse.mxcsr) );
> +        {
> +            /* has a fastpath for `current`, so there's no actual map */
> +            struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(curr);

... comment style adhered to (capital 'H').

Jan

