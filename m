Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 807C79EB1B0
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 14:13:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852332.1266160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL03J-0000MW-L1; Tue, 10 Dec 2024 13:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852332.1266160; Tue, 10 Dec 2024 13:13:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL03J-0000K4-IB; Tue, 10 Dec 2024 13:13:25 +0000
Received: by outflank-mailman (input) for mailman id 852332;
 Tue, 10 Dec 2024 13:13:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tL03H-0000Ju-On
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 13:13:23 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87af9be5-b6f8-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 14:13:21 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-434f3d934fcso15859965e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 05:13:21 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:8df1:d232:d9a2:1ff9?
 (p200300cab746063c8df1d232d9a21ff9.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:8df1:d232:d9a2:1ff9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3861f59ccd6sm15794407f8f.32.2024.12.10.05.13.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 05:13:20 -0800 (PST)
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
X-Inumbo-ID: 87af9be5-b6f8-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733836401; x=1734441201; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1aF7XpvhQ6Apl9P2KccD9VrasN0wSy21pMmLhIayMSI=;
        b=MeH+w+h/L3w8QgtOMXK3h8JhAF+Oau7EKmQdBhAuv+17UgEriCv8lP6Xmr63vcVHSD
         Mqc0xehCJHlqEO0iDgSOBM5BuAFYAD01zj44Pct4dKCUp02hWYlVFhoPJ57BQu9zXBu/
         9Ds48ZytUsAqaM72ISmY2O70xx2Dmqyy7LnVGqnRfdn1OqjT1MuFjykm+hrNoXOeVTEV
         YguMuQSfBmC7wqhB3GKntqBoA9lvzC8ZRt9qwODAjGdB4l2bUWozLhMx4GGt6z2fAAi0
         X7/sssDJj+i2pS3pSu51yYippY8NZpJ6DJ8+J8m9HLic5I6XhZVd1VceZWKzan6jrHSe
         9mYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733836401; x=1734441201;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1aF7XpvhQ6Apl9P2KccD9VrasN0wSy21pMmLhIayMSI=;
        b=YaEFbjukPPp9oVzJ9329eO7qy3hLc97elTayH42qrSwxqv3lXofD/S62BTHUloh/u4
         czjt4vG2CBzMAolS6eHgk8kzXtP0oA/Hzbfsdk0X6Pyd5Wk6KfempCuG74kuNn2ZDn8J
         xnqFxJkrHGgtyRR90DlQTW1PM2oEpxVScBFtDtucjD+F1ROw9S5nKJz2UnhbAM88ImGr
         tDCZRLf/Fzv3GGzskLTGBMX4G8910DiMhs8LEhkgspAFGPQsR4/xPoQVv1T0kQgHDb4F
         YfCvmMCrPeSD1hQaevMSAvyV+IxPAJa7nNzqsf/Q57xybJ8uYZWbxYfgnANYuNhvTdSF
         Ao3A==
X-Forwarded-Encrypted: i=1; AJvYcCV57gKmEVlu5v5k0CEUaBgYCcs4yUfc+j6TgGIDqtxMcCqiZnb+hh/I59I7tarV0I5ZHVbQoz/wAoQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDErKMf5F9sY8moSqZdTUebRfJwNqpmekd1/OzUnka2tYuevN4
	mELqx8zgRP7eX8kgpQpTEqtKnnvwsomIMsKzI1DertLdhikgxurH6OVycWe4Vg==
X-Gm-Gg: ASbGnctYKaR5G9F7OuFRv8AV+8L/UjZZzuyWQ+/JM/Iz1vz7EkDYgrTniOiPguVFopE
	PGDOgxZ2S+cbhNUbKhnDBCWyUdQmXU0ibz2U6IbNXRHDK4Tj4yzwfV9O8+kbpI2+dUPHU1rPMZ8
	ps/97v1rlcuWOwjIeWIRUXFzJuYMrttgyoawLlB2MmcURDfryIy+iZFTMyf6br0+r7psk3EmS7b
	M4RRjQ/333yq+gtzf8C/5wg/gCkP6LuQxFaPDA8pnbnf/v3Oq4W3H175ZQGOLhUWbtp7n/YNvyL
	uLmQourh07fY3WjvGOl3M3mrPKAsRFdBrD2nwct9By7Zw73o19ygnFxkEKFjHGnCHJkpeg3quBy
	aWCmJ9ag+YQ==
X-Google-Smtp-Source: AGHT+IETrVvJzmw157A1fHLwbSDF/caGV7/c67mf5FT4o98dZEkOnt4NLUWdBp7iWO6MDLfH7A811w==
X-Received: by 2002:a5d:5989:0:b0:385:dfab:1644 with SMTP id ffacd0b85a97d-386453e316fmr2922258f8f.33.1733836401084;
        Tue, 10 Dec 2024 05:13:21 -0800 (PST)
Message-ID: <a6442bb6-ac06-47e4-a981-512314c8c8b9@suse.com>
Date: Tue, 10 Dec 2024 14:13:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/35] xen: introduce resource.h
To: dmukhin@ford.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-1-e9aa923127eb@ford.com>
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
In-Reply-To: <20241205-vuart-ns8250-v1-1-e9aa923127eb@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
> --- /dev/null
> +++ b/xen/include/xen/resource.h
> @@ -0,0 +1,40 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

GPL-2.0-only

> +/*
> + * System resource description.
> + *
> + * Reference:
> + *   include/linux/ioport.h

I'm unsure of the usefulness of such a reference.

> + */
> +#if !defined(XEN__RESOURCE_H)

Nit: #ifdef / #ifndef please whenever possible (as long as not inconsistent
with adjacent code).

> +#define XEN__RESOURCE_H
> +
> +#define IORESOURCE_BITS         0x000000FFU      /* Bus-specific bits */
> +
> +#define IORESOURCE_TYPE_BITS    0x00001F00U      /* Resource type */
> +#define IORESOURCE_IO           0x00000100U      /* PCI/ISA I/O ports */
> +#define IORESOURCE_MEM          0x00000200U
> +#define IORESOURCE_REG          0x00000300U      /* Register offsets */
> +#define IORESOURCE_IRQ          0x00000400U
> +#define IORESOURCE_DMA          0x00000800U
> +#define IORESOURCE_BUS          0x00001000U
> +
> +#define IORESOURCE_PREFETCH     0x00002000U      /* No side effects */
> +#define IORESOURCE_READONLY     0x00004000U
> +#define IORESOURCE_CACHEABLE    0x00008000U
> +#define IORESOURCE_RANGELENGTH  0x00010000U
> +#define IORESOURCE_SHADOWABLE   0x00020000U
> +
> +#define IORESOURCE_UNKNOWN      (~0U)
> +
> +struct resource {
> +    paddr_t addr;
> +    paddr_t size;
> +    unsigned int type;
> +};
> +
> +#define resource_size(res) (res)->size;

The semicolon surely was wrong before and is wrong now. Plus Misra
demands that such macro expansions be parenthesized, I think.

> +#define foreach_resource(res) \
> +    for (; res && res->type != IORESOURCE_UNKNOWN; res++)

This one isn't being moved, but is being added. It's not used here,
which makes it difficult to judge its correctness. Perhaps better to
introduce this when its first needed, and then right away with the
required parentheses around uses of the macro parameter.

> +#endif /* #if !defined(XEN__RESOURCE_H) */

Just the guard identifier in the comment please.

Jan

