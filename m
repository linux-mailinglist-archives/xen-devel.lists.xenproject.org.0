Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D55AAAD3711
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 14:47:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010738.1388912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyNR-000792-6h; Tue, 10 Jun 2025 12:46:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010738.1388912; Tue, 10 Jun 2025 12:46:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyNR-00077C-3Z; Tue, 10 Jun 2025 12:46:53 +0000
Received: by outflank-mailman (input) for mailman id 1010738;
 Tue, 10 Jun 2025 12:46:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uOyNP-000776-3s
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 12:46:51 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f97fb559-45f8-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 14:46:49 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-442fda876a6so48321625e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 05:46:49 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a532464e3csm12395498f8f.99.2025.06.10.05.46.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 05:46:48 -0700 (PDT)
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
X-Inumbo-ID: f97fb559-45f8-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749559608; x=1750164408; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yDfzxJo6IHn2ojseQNrafzKIlvdEC0AItMszJe8rsEQ=;
        b=GsHIw87q2AosZO2HrqVzKYO+e+RJd5X6kzHk773rDIRQ1gBY8zopRmRW4a27/w4zdH
         3YquuhjQZdhISe9cwcz4oYEq9pG949So/XwrL4sy6bHeWlqeScN2cP/TpI9/amuCKU1J
         rERkYETVnyh/kx0ICWYBTIDnGRwJt81AamzHuT7ssP3Rm1H2mVFafVsPkBz4FcYG+g/K
         wl9+9tQfKFjFPgT9sZuLZq0XwmbKZdivbh3v6X+3teJLvPQKRhjgCFV1fDrppuAzjwX5
         d01yRCTSH9eCi8hGpIYneHDFlq7H10aYat+qGQYHu9kpSr5WkuZVSQkox6TWDrpYAeNf
         1QaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559608; x=1750164408;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDfzxJo6IHn2ojseQNrafzKIlvdEC0AItMszJe8rsEQ=;
        b=V9+gll6ft4xgHKADR3E0D3nYIFhQRjU+n0bKOisPLYYASyjXSAy228+/+OTGAum7Kx
         o6mWd0Wd5PLmF02g88orOIJLeZaVUdt6Po/lNCn15zoFAmkL9k9UPSAYYFFRBGyBz9kc
         7fknqPiQ2xBuCvoUFok7gxbQ8CLsaYDjhPr0QYh58oI/W0BcFCvFZJBoqZCHoBks0dXU
         hmxyojYxK+HG/VHgJWWBgO/Spf1HK/zE1HvAniRM3XmnXRMJuUNVojsn3dHCsc/NwktK
         EkMRfH2ZnwwbBF+dMe0k2TwQMfkUb2DeTQR0kr/GTPUpQKaEyScAEt0fKtoJtsx68OZ5
         DpmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV01jH3P2UeqQ3zseYDOqsMZM/Y/d4+cFr2U63cO/VaVh8O0XM69ewMZQ1CDNw8/B8ejVawAmRP4Ts=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3cF0si7nqnEtEsm7x8arQNPSgOmmwNMgGMV5mcQJbru3zVP/D
	sVh8qthOyHp3nHNhxDrpUgOny/33NxszRFMNHR8IjMYWE+4rpFnYMwA9arGxqLtyIw==
X-Gm-Gg: ASbGncvY2CfPYCGaL8O3lllXaWtJtG06FPY9UubyOvW6SMx+mT9FHN3e+DFREmk+PDm
	k//M5udD1Og77VmlLcletmLvPmmxclSRD7JsFZxIyeaQs1Lc3e9/I9aSzjniMygaesLvOT/5A9x
	QGEgRpxP6RMwbdWWiubbzXarZbV1wjOSaaBVx77zi8KUWyzRcUKNY3WqfArs2/oqPhVuHU+SvrZ
	NzMXiKdYVjkfCk4GE2lIlPN/LYpDQ3ubYymtQzFgwveBeY0dQycvphPuK5k+0q69HeYjxngSEqK
	ZIo6kBN7oaVwhbOs4RF9hCMNXw4ALbuDc1yMsZQ7DE9qD17hPINrkcfBG3kPTHWMeiN9tYOO5kG
	ZYnD4q/fvuuMH2QVGnan0WsnxlH0LwlhVw9ys3I9AzRUICIKB2Lk5wbXozZJcu9L0KY+9bt8shk
	4+ufShWufQUB0CPzMhUHpJ7xwRzwDfyBo=
X-Google-Smtp-Source: AGHT+IFcizkwiewT60FnJVnN9g1Q0MgChMgA74ylY3euXamUBKI/dq73UeUVTTfpCxWt9IKN7kR/Mg==
X-Received: by 2002:a05:600c:1913:b0:453:9bf:6f7c with SMTP id 5b1f17b1804b1-45309bf71a7mr101084055e9.9.1749559608442;
        Tue, 10 Jun 2025 05:46:48 -0700 (PDT)
Message-ID: <6f705281-f7e3-4929-ab56-5fbe4e1db14c@suse.com>
Date: Tue, 10 Jun 2025 14:46:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] drivers/char: make dbc_uart_dump() a bit more
 useful
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.defc562b917978814c8359bbd04f1dadba33fb77.1748182535.git-series.marmarek@invisiblethingslab.com>
 <faf72a48d11a45de8139c9c1d3904cf7130393cb.1748182535.git-series.marmarek@invisiblethingslab.com>
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
In-Reply-To: <faf72a48d11a45de8139c9c1d3904cf7130393cb.1748182535.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.05.2025 16:15, Marek Marczykowski-Górecki wrote:
> Make it safe to call also if xhci console is not enabled. And make it
> non-static, to require one less modification when actually using it.
> When using it, one still needs to add its declaration in some header
> (or just next to the call site).
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> IIUC Misra would not be happy about a declaration of an usused function.
> And I'd rather avoid extending DBC_DEBUG scope beyond that single file.

It's not going to be happy about a non-static one without declaration
either. Misra-wise this is pretty much a no-go.

Jan

> --- a/xen/drivers/char/xhci-dbc.c
> +++ b/xen/drivers/char/xhci-dbc.c
> @@ -1498,11 +1498,14 @@ static void dbc_dump(struct dbc *dbc)
>                readq(&r->cp) == virt_to_maddr(dbc->dbc_ctx));
>  }
>  
> -static void dbc_uart_dump(void)
> +void dbc_uart_dump(void)
>  {
>      struct dbc_uart *uart = &dbc_uart;
>      struct dbc *dbc = &uart->dbc;
>  
> +    if ( !dbc->enable )
> +        return;
> +
>      dbc_dump(dbc);
>  }
>  #endif


