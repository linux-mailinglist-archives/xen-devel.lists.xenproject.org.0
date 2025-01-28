Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB0DA20F48
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 17:57:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878704.1288898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcotS-0004hM-5p; Tue, 28 Jan 2025 16:56:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878704.1288898; Tue, 28 Jan 2025 16:56:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcotS-0004fI-2a; Tue, 28 Jan 2025 16:56:54 +0000
Received: by outflank-mailman (input) for mailman id 878704;
 Tue, 28 Jan 2025 16:56:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcotQ-0004fA-Na
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 16:56:52 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id def4de09-dd98-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 17:56:51 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aab6fa3e20eso992542866b.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 08:56:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6760fbe92sm818784166b.131.2025.01.28.08.56.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 08:56:50 -0800 (PST)
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
X-Inumbo-ID: def4de09-dd98-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738083411; x=1738688211; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=txK94ENtdQMm8AuKPokoFbuC4y9QJF+mwyg+VQoY2UM=;
        b=Xx8DIHvgamwIMe/eMEoM63QqlPIEAkCk1wiMWvpUpvKz+/KHAISNmRwvivIMx8FFPw
         o80mmS9VJxuNtgAJrttryps4kNhPY7dU702M2AV124mmECmKzGdmNktAfuYtMCUpYIKe
         5MhPXfXH3yzPG8hr3XkOyClYel/Kvdyo780Ee+UH0UiAD4kJGDhrwIcdbo8ttEsumwvv
         Rw47g/o6bBawi8BIEz99hSAosA7+R8pE0eDM75xkO/8HjBbAgexvq27yaoAGrKvpl9gx
         P5sdG+TfVeI6yl9OkVVTMjHm1u/l93tuhyZ3oD5yS1JvNk6NvD/keOsbpr8zspKt0iqs
         BM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738083411; x=1738688211;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txK94ENtdQMm8AuKPokoFbuC4y9QJF+mwyg+VQoY2UM=;
        b=ptNNfYQNsyw/aFSaFjK/hrqSZI//WdXtv6/BTYf70Etfh/jUBeSGf0btXeYwZCju+a
         +Js3cwctwgCoAcPQ4bzL3ugNVpfJAtKoE7ELkRGbNyGP6bA4B4sz1Gku2Fa9AGr1r7Kw
         YOxSFBmbv3WfU2RDhBLaxe1b+f5jF5eIGGU24QLpl8zPFwj7wJgrqPeiZwt1AaFLEvEj
         AyUBAKkULp+DIn33nWQf2dlb33qYR3p0q0j3CVbptrVS2+/qHnygw/V0YA5B+zZZR6b4
         qGNS1WBCLdPC5dRHwIgvUE1o1boWiVZlaO6gQRgdjkstqmgMhU7a154NpBtTLdekgSIo
         YNRg==
X-Forwarded-Encrypted: i=1; AJvYcCW9pZPfrEADK0y0yEqSrYuTqJhBwhOji75YXj5QXfbYKNsxevE+LDzXVmuqLzEuH9/4v5j9kvqekjE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbuOiIpUQd+sAwcNpUcVBgRr4Gkvwhwt/AtYliKWQzFMZwfOaB
	8dPyaoL+es2S4xTuw+Yd2t9aKhGNaycDjM4ND8/KEDI0t+Oq78n6O9E9KmyloA==
X-Gm-Gg: ASbGncsmO8f/xgsF1ZYkTlYYy+l3mhRH8RzQf089/jcQf3rZP2hRpEBvNG/a9ApDwiz
	L5wxuNFYOG6iNrtqLo1BNq0yPhd1QtZUa0/aKyQ4K6iNvDMSUCCuzTGZiXgg9VeBMehGxnWTXUB
	FEUTxRa76HLDoUytIjC3rc7UOlAoC6+Ebl9gw2LEvwg5YCRvDN1BjgnQb9dMf2lW9uaLyXkeD+4
	hhW6bh+O32pFNr2KKmV/wxEltiZLkpwOTk+Icu5hGLGOHX7YzRfRIBjHcRBZvApFjZyYR54FvsN
	IhQEUq7wSFqK1wS2XxFN1JBKpn+XBGeLlWPfLLHNt7Un6gJDsU46R0DmRH/Emb1t6vKH5ina7tO
	D
X-Google-Smtp-Source: AGHT+IHHJOw76BjLXqGBnvw43my2VkhquZuadp84pDPIp2kf2AYFivbcZrggsA+azVQI8HRL2Yy1ZQ==
X-Received: by 2002:a17:906:d54d:b0:aae:bac6:6659 with SMTP id a640c23a62f3a-ab38b190d52mr3936652666b.7.1738083411199;
        Tue, 28 Jan 2025 08:56:51 -0800 (PST)
Message-ID: <58d99a7b-4f16-424e-bcbb-c2bc475bce82@suse.com>
Date: Tue, 28 Jan 2025 17:56:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/24] xen/console: flush console ring to physical
 console
To: dmukhin@ford.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-17-c5d36b31d66c@ford.com>
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
In-Reply-To: <20250103-vuart-ns8250-v3-v1-17-c5d36b31d66c@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.01.2025 02:58, Denis Mukhin via B4 Relay wrote:
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -430,23 +430,36 @@ void console_serial_puts(const char *s, size_t nr)
>      pv_console_puts(s, nr);
>  }
>  
> -static void cf_check dump_console_ring_key(unsigned char key)
> +/*
> + * Write characters to physical console(s).
> + * That covers:
> + * - serial console;
> + * - video output.
> + */
> +static void console_puts(const char *str, size_t len)
> +{
> +    ASSERT(rspin_is_locked(&console_lock));
> +
> +    console_serial_puts(str, len);
> +    video_puts(str, len);
> +}
> +
> +/*
> + * Flush contents of the conring to the physical console devices.
> + */
> +static int console_flush(void)
>  {
>      uint32_t idx, len, sofar, c;
>      unsigned int order;
>      char *buf;
>  
> -    printk("'%c' pressed -> dumping console ring buffer (dmesg)\n", key);
> -
> -    /* create a buffer in which we'll copy the ring in the correct
> -       order and NUL terminate */
>      order = get_order_from_bytes(conring_size + 1);
>      buf = alloc_xenheap_pages(order, 0);
>      if ( buf == NULL )
> -    {
> -        printk("unable to allocate memory!\n");
> -        return;
> -    }
> +        return -ENOMEM;
> +
> +
> +    nrspin_lock(&console_lock);

Nit: No double blank lines please.

> @@ -681,10 +707,7 @@ static void xen_console_write(const char *str, size_t len)
>   */
>  static void console_write(const char *str, size_t len, unsigned int flags)
>  {
> -    ASSERT(rspin_is_locked(&console_lock));

Why is this being dropped? Hmm, I see, it moves into console_puts().

> @@ -1061,6 +1084,9 @@ void __init console_init_preirq(void)
>      serial_set_rx_handler(sercon_handle, serial_rx);
>      pv_console_set_rx_handler(serial_rx);
>  
> +    /* NB: send conring contents to all enabled physical consoles, if any */
> +    console_flush();

Aren't you potentially emitting messages a 2nd time this way? Imo
such flushing needs to come immediately after any particular console
is ready.

Jan

