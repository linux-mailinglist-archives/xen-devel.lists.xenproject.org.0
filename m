Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DF6AE372E
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 09:45:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022098.1397814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTbrJ-0005FD-Oe; Mon, 23 Jun 2025 07:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022098.1397814; Mon, 23 Jun 2025 07:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTbrJ-0005CF-LF; Mon, 23 Jun 2025 07:44:53 +0000
Received: by outflank-mailman (input) for mailman id 1022098;
 Mon, 23 Jun 2025 07:44:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTbrI-0005C9-UM
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 07:44:52 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed82e2e4-5005-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 09:44:44 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a365a6804eso2040844f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 00:44:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d8673d1asm77030375ad.172.2025.06.23.00.44.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 00:44:42 -0700 (PDT)
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
X-Inumbo-ID: ed82e2e4-5005-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750664683; x=1751269483; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1Pc10lhOrmmJANx4DJ1lM5+pLLzbiArb9KyfJUHnyJI=;
        b=Y1jV+oVTlH5iNaA8jXFpSHAPNDeK14KEH86xe1DtkbLYsZ51SZ9uvzdAjMEItXwBIH
         dAnbkvGrBDyOSWqNn2eS3aHEyJXs05og+a1h0i8elw6bjhIChV8H1pufoeZYLD/9Sslx
         wddTQ2AC8us740Ouqlwt6obD4jL6O5rHnKU83txE/yGtSAeh0/3HFMscMTJYuhYfuse3
         oq/IpEbLBc/w0khdoVbG6MnjyjYwJqNZoZZPkTYk/ac3+WaGdUoNVyXVifN1WkLPzDGg
         q8w8e6/MCRjTkZBWraKVf9tK6ufNdfJIJA1CRm98y2loXD00U/Ss1Rva27ptVT50wvaI
         tHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750664683; x=1751269483;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Pc10lhOrmmJANx4DJ1lM5+pLLzbiArb9KyfJUHnyJI=;
        b=mJ5yZsbX/BShxAVSWKLp2x8M8zL9V9tt+9WUd+LXPVqj0rK9IWEYfD1eQpW86vU3KO
         MM7YHGMQn3X1JA2wvxG1aFGJVEP3znIlJhHjpK5CX8N3SoaIJoB1GkJXUb7G9MX8cXZT
         O/zYt2N6KPzN5lRAvPGufik9/vHYHYBYa2nByllpWetJHyhFqSRzX/GgYXFIggZOmdmd
         nVQm32uqE0CfEx9z7mCyRES9BIIsq5zPhChClC6Nb5D5LuP0COqxONVtxlnkxw7Hr7fC
         EjtNr8vW1NuelaXNptVcOV2Y3fvLrXJA/6s072g2maJ5wyrkzi/bciAFKADF9i9EWTnA
         YPlg==
X-Forwarded-Encrypted: i=1; AJvYcCXHtFk2QegPuG1msHPe4h8R2e/buUocx7n5GolG0YmpdTv/CA0FgXj2QlimkuZRXnnFsfutbgzfMMI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUuKh8Mxow0dPFVmvgCqaaXewy005buVVDMOuwBRokc/bRUTmq
	yWELbLZ5+Qy7JpBO7ZOSWVLn50ITJ4seHIorqo7+fBzoSler3Akh3A1Zja5K/AQbpQ==
X-Gm-Gg: ASbGncsLAQWMrERMv64jiJxu4uT3/WC7VxOY/GnFDXwReQnwhmxXl8zRhnJVpV0h2ki
	23k1S1KiWW/FeIN1EmLAwXLtu5Na1T7RHbW8aeKzVoWt1YF5SJKkTpMnhZaaycts41nXRDOkGXy
	k+eXrf8JCcqpxiESteBdl/cr0XpP3L+FBev0WCZmhvsQumpvHO0962cH77NKiIYx/ejPh205pX1
	+fk3Q4IXwQzhCXk3uNh0AFzr2qcI5kLINwzXpVEXqwFTLLWNF1OiFXsKzp3z4Qi2mugQ2xcvLbA
	L/fJ+wtfvUfriAtLZ3CG8l/OyEOxoAHhqeqKDwtq1Y+eXiwdfVlB6B3ljqWJq0za7706qC+QNoY
	V0fDrK3rUiO2qXXRBTiFyYYJltm/G+x+h9g5+kwm713IaTig=
X-Google-Smtp-Source: AGHT+IGRMvaZ7IQgV0B9zgCHnTqCKyFse5ZmlU7i2T/yx8vqY31nI9oGd034icazSRu3QSh27cYr6A==
X-Received: by 2002:a05:6000:645:b0:3a5:2cf3:d6af with SMTP id ffacd0b85a97d-3a6d1329be4mr8799083f8f.45.1750664683441;
        Mon, 23 Jun 2025 00:44:43 -0700 (PDT)
Message-ID: <faf255a2-a0d1-4c6b-ad94-0395d8af1e58@suse.com>
Date: Mon, 23 Jun 2025 09:44:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/12] xen/dt: ifdef out DEV_DT-related bits from
 device_tree.{c,h}
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <20250620182859.23378-1-agarciav@amd.com>
 <20250620182859.23378-12-agarciav@amd.com>
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
In-Reply-To: <20250620182859.23378-12-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.06.2025 20:28, Alejandro Vallejo wrote:
> device-tree.c stops requiring CONFIG_HAS_DEVICE_TREE_DISCOVERY and may
> function with DOM0LESS_BOOT.
> 
> Without this, there's a clash with x86's definition of device_t. Because
> x86 doesn't discover devices in the DT it can simply skip the code
> to do so during the unflattening phase.
> 
> Not a functional change on architectures that currently use these files,
> as they already select CONFIG_HAS_DEVICE_TREE_DISCOVERY.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
>  xen/common/device-tree/device-tree.c | 2 ++
>  xen/include/xen/device_tree.h        | 4 ++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
> index 725ff71646..741e2ce585 100644
> --- a/xen/common/device-tree/device-tree.c
> +++ b/xen/common/device-tree/device-tree.c
> @@ -2029,9 +2029,11 @@ static unsigned long unflatten_dt_node(const void *fdt,
>              ((char *)pp->value)[sz - 1] = 0;
>              dt_dprintk("fixed up name for %s -> %s\n", pathp,
>                         (char *)pp->value);
> +#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
>              /* Generic device initialization */
>              np->dev.type = DEV_DT;
>              np->dev.of_node = np;
> +#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
>          }
>      }

Without something said to that effect in the description, this contradicts

obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += device-tree/

that the previous patch put in place, and that only the subsequent patch
will further change.

Jan

