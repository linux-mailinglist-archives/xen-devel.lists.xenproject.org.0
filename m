Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CED29EB1F8
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 14:33:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852422.1266221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL0Mk-0006va-C3; Tue, 10 Dec 2024 13:33:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852422.1266221; Tue, 10 Dec 2024 13:33:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL0Mk-0006tM-9R; Tue, 10 Dec 2024 13:33:30 +0000
Received: by outflank-mailman (input) for mailman id 852422;
 Tue, 10 Dec 2024 13:33:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tL0Mi-0006t0-45
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 13:33:28 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55a10427-b6fb-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 14:33:26 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-435005192d1so12343215e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 05:33:26 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:8df1:d232:d9a2:1ff9?
 (p200300cab746063c8df1d232d9a21ff9.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:8df1:d232:d9a2:1ff9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434fbec5ee6sm56777465e9.35.2024.12.10.05.33.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 05:33:25 -0800 (PST)
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
X-Inumbo-ID: 55a10427-b6fb-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733837606; x=1734442406; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OuWYudG9spRJE1PJmgun6GbyDsZzVlaB16S+5fdWykU=;
        b=Q0lDtLRRnUCCbCvw0qx9W2aYrobba1/uLIkd0xYV/sjiOW5yA1BX6UvYIO+WF90DAj
         XUwsejZTskZqhLsKJcB1yWOMnDp6PBz30PsL7svfVllaknmU3N33NEcg/0Z6CpsmswF+
         518adDMFebqaoRjkJcPAAnmgsFBBOrF4Fo20rByknZ6Kz+6WadWan9PHj5qL4QLkXzmg
         BmAjZVqGi/kRrEuuUARGFTXRMETYqvH4c04j85j1rENuu0BGQcDu5nWrP6FOeh35zWQC
         Dxf5XZ39Y8s6aUcbvjfYb4jtAOfR1K8Pokky1DYTZD5uJxaovTGl8m4sGEVA0wmOZSkO
         cLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733837606; x=1734442406;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OuWYudG9spRJE1PJmgun6GbyDsZzVlaB16S+5fdWykU=;
        b=OFkp2Or+T0kbELB4QMCrw8dytRaXxcwJls48pGMzuKHTlxWuKpFbLfbEHYq/m2M2YZ
         EydWFWnzPNk2oK+70y3SyiMQRoOV498Xt/uGWe6heflUoUIeMaMDesYdJSktcNIVQwe6
         UPFwnWRJk81cM+tnbuf0CtVtjbFzthXmP515z3zuIiI4rPCfLUpvsrcgecd8nezMUIhy
         kdqzxtAaVvjVKCHcQaaaiHMV3HLIIBFNX+p7r/6phruZegIDXVv6SrB5dL3ZPoloAYsE
         D5Ok/44agpxU3IoQZdU8rQarCw7/p1d19Lht0S19qEqMmfxULO8ngpgsXyD7dsZ44BAZ
         IS9A==
X-Forwarded-Encrypted: i=1; AJvYcCUwLwaE/GRiXtCatMJWC/GYv9FcHxl9MNYZJhYF/Ha6dS0ZxtsQ4+oACyJEQM4myfAcZtJC/OunWuU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBdp8FKwJ7v/vmEX1VNBGH9UfakCJjSl3GLepvBjHtSEtaV5GH
	nHbMHKH3L1J5Fcxfs0dFu32KZdpLIF6/3085YS319ab8+lnA6oiILQCtw2rCPQ==
X-Gm-Gg: ASbGncuMiF77c74/tzGJRFgmfEvbxSSUQwGZthOJCTTNarBEjze/5RyBrcS6WXc9gvs
	4tuoQGmFmXMB8bvy1xOnbYfjHO39Un6YwmMs1Dysaz0QNX5BjQ8p2C03wO5IQ1sVrrpvCeMx0cf
	KngmrLN34pldLKFMr7w05EPNh7OtXF0tGOzK2IYfOjlTgcJuyjXvqw2popPDkrJuj4by2UtEJck
	e5O4UGgw3OQWtW1KQ+4f/rbZex4GJfmUeGJhLGvD/b6waWWYXUsf+v1b+qHUY48ZGdcJ5DH4Ppc
	13SScGIJq0ukL0BkMwagpoAd0f7OSrvGht1rL4gWNYylsoAbfzJsof6zNahyWNHFgS9/SxfxDwn
	AsXj6iQD4gA==
X-Google-Smtp-Source: AGHT+IENzRvwwzRbPyaZKA3r1zjrC6iztnsDJifXbpt78lzCcRJ2BCDl9fV0LZ3/kZSUFybBaZHnaw==
X-Received: by 2002:a05:600c:1e27:b0:434:f804:a992 with SMTP id 5b1f17b1804b1-434f804ac4emr57309265e9.32.1733837605644;
        Tue, 10 Dec 2024 05:33:25 -0800 (PST)
Message-ID: <ad47f490-c2a2-4a61-b9ed-a5830d93c3a4@suse.com>
Date: Tue, 10 Dec 2024 14:33:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/35] xen/console: move vpl011-related code to vpl011
 emulator
To: dmukhin@ford.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-12-e9aa923127eb@ford.com>
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
In-Reply-To: <20241205-vuart-ns8250-v1-12-e9aa923127eb@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
> --- a/xen/arch/arm/include/asm/vpl011.h
> +++ b/xen/arch/arm/include/asm/vpl011.h
> @@ -69,7 +69,7 @@ struct vpl011_init_info {
>  int domain_vpl011_init(struct domain *d,
>                         struct vpl011_init_info *info);
>  void domain_vpl011_deinit(struct domain *d);
> -void vpl011_rx_char_xen(struct domain *d, char c);
> +int vpl011_rx_char_xen(struct domain *d, char c);

If you make the function return an error indicator, ...

> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -559,9 +559,7 @@ static void __serial_rx(char c)
>           * domain, without a full PV ring to Dom0 (in that case input
>           * comes from the PV ring), then send the character to it.
>           */
> -        if ( d != NULL &&
> -             !d->arch.vpl011.backend_in_domain &&
> -             d->arch.vpl011.backend.xen != NULL )
> +        if ( d != NULL )
>              vpl011_rx_char_xen(d, c);
>          else
>              printk("Cannot send chars to Dom%d: no UART available\n",
> 

... how come that return value then isn't used anywhere?

Jan

