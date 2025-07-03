Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31280AF6EDB
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 11:35:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031894.1405621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXGLi-0002pu-I5; Thu, 03 Jul 2025 09:35:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031894.1405621; Thu, 03 Jul 2025 09:35:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXGLi-0002mn-Ei; Thu, 03 Jul 2025 09:35:22 +0000
Received: by outflank-mailman (input) for mailman id 1031894;
 Thu, 03 Jul 2025 09:35:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lE7m=ZQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uXGLg-0002mh-NO
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 09:35:20 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08aa83d2-57f1-11f0-a314-13f23c93f187;
 Thu, 03 Jul 2025 11:35:19 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-453634d8609so55639335e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 02:35:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31a9cc6467bsm1930404a91.11.2025.07.03.02.35.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 02:35:18 -0700 (PDT)
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
X-Inumbo-ID: 08aa83d2-57f1-11f0-a314-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751535319; x=1752140119; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ejbuar872RX0ar6RZ7L8TcL8AzuYV2ho4Qgr0Z3Yh2c=;
        b=Vt98qZ90YXYo7bntsLuCyRYMyZKWkiN6AYRnj7YqkTUO7jw6TUkXcfkCaSlt6XiJRp
         r8OpXfpPa9cYjnGdvMrXvwLVpL91vCOTsvJW3xf3CX+XrBcdSsnz+NcXcDi6o0kF2zLK
         eb36BF8WNQG2uX9NeRUMA0P5Z8XIDM8QueZ75QV8Yo3kQBajpst+qz46b43wevU63T7p
         1/G6gzZ7hxlCatKj+5jFCgYqZ58ymHYorp9X/FH/uGTIJPZEponpnFP7A5CT/kPkISbb
         tpmaDbuxOExzo6c8nDsRjH5EGwsOD42KJJtwWqSHM7OurHZy5M2X4s50oDR43xjIR2Uh
         FJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751535319; x=1752140119;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ejbuar872RX0ar6RZ7L8TcL8AzuYV2ho4Qgr0Z3Yh2c=;
        b=RyS9Fl6pg0hA1giMSr88W1HqQ6oa7fB56M0cO1lwoHD9A+MgsGD5kAjNYtAnmiTIMK
         f0gogN2yEUQcNVWl3aFeY0/qwLDJvbd5N5lxl6w7QxTN/nHhvHPq/t+Mc9N2DEdMGHVi
         hcjm9TqNAVHU5IVMbJL2RjF+5kkKw2ewHkfevQsZNTMeDSSSpiFkNiMxxTxEq8nBDNew
         QBMXqlzBN503mJqTZ+uLYT4nAf8AkNf76wvTGqubZDQTPz0LSgrKr9iyvw/GmoaFMEsy
         99oy5AVVtkY7nAYwD8j7haA6RXlN2sadqNEGwK9HjzfTb/rEoZVLkO2pxmejPOmb6UCc
         INxw==
X-Forwarded-Encrypted: i=1; AJvYcCVyagSyr4UoN5oeZIYrdXW0bmfxupthX1t5ZHjP7X1OcRf5HaB5sNT8K0/JlcAkqyyk0SPUXpZQFBY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKEeuHSu674/dBbUemvxWJoMAzOCoe399AKlEl4pTCMtmXqJKH
	HuMs+V0+lKcUbXe2muJd9LWKpeT6lenOTzoG+QQboT+J8u2GtT6btOZabEWDoWa4jQ==
X-Gm-Gg: ASbGncsKeQwOC2aHkr2KQYS2NGRgzm+4eahEa5Cf0fnES2Td+x6OBNaaoEXCMwq+QxK
	hM57JjHNikatLgKWxxvxPWhXZ9GSlfjKFgQAvgQEJAybKsx/Pgr4ZsfExbiV6Xy6pZgz5/4ecVj
	f6J72vBSaxh5/1NLzaIdz3PUD6gJ+GDBB3XacRJaN/8Z8ASm70E8hPYVrLR7zBMirVk8ohYGh75
	zTPl06zrBRCePDWpaI/LP6vk/u28nOpU7moW8Zfz4GxUjNo+N7iVBkstblj/Ua2LJ9aAQX1sUzB
	zOCB0Ek243mS9Go6Aprs8AZIKF4esF0l6mlw6arvTpvBS+GSKEN+4YwLCLrq56XD3Ov0Qhx/ys4
	CDPF17NTKWQ9ADhlFaspg3o2MfXRCX2kyOBMkrVoSQUEQKIimMd0zZEIE+g==
X-Google-Smtp-Source: AGHT+IGeGSSbMjteUzKrYi5Wjlp7NwhAtEX47nRm5/ecel80uKAyqpp14vzj4m1elbrF9yT7s+ZJfQ==
X-Received: by 2002:a05:6000:4805:b0:3a4:e6bb:2d32 with SMTP id ffacd0b85a97d-3b32d00524cmr2052841f8f.22.1751535318628;
        Thu, 03 Jul 2025 02:35:18 -0700 (PDT)
Message-ID: <554a43b8-db14-4966-b1f0-bb6c156b38a1@suse.com>
Date: Thu, 3 Jul 2025 11:35:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] x86/idle: Fix buggy "x86/mwait-idle: enable
 interrupts before C1 on Xeons"
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
 <20250702144121.1096448-7-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250702144121.1096448-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.07.2025 16:41, Andrew Cooper wrote:
> The check of this_softirq_pending must be performed with irqs disabled, but
> this property was broken by an attempt to optimise entry/exit latency.
> 
> Commit c227233ad64c in Linux (which we copied into Xen) was fixed up by
> edc8fc01f608 in Linux, which we have so far missed.
> 
> Going to sleep without waking on interrupts is nonsensical outside of
> play_dead(), so overload this to select between two possible MWAITs, the
> second using the STI shadow to cover MWAIT for exactly the same reason as we
> do in safe_halt().
> 
> Fixes: b17e0ec72ede ("x86/mwait-idle: enable interrupts before C1 on Xeons")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- a/xen/arch/x86/cpu/mwait-idle.c
> +++ b/xen/arch/x86/cpu/mwait-idle.c
> @@ -946,12 +946,8 @@ static void cf_check mwait_idle(void)
>  
>  	update_last_cx_stat(power, cx, before);
>  
> -	if (cx->irq_enable_early)
> -		local_irq_enable();
> -
> -	mwait_idle_with_hints(cx->address, MWAIT_ECX_INTERRUPT_BREAK);
> -
> -	local_irq_disable();
> +	mwait_idle_with_hints(cx->address,
> +                              cx->irq_enable_early ? 0 : MWAIT_ECX_INTERRUPT_BREAK);

... indentation here switched to Linux style (to match the rest of the file).

Jan

