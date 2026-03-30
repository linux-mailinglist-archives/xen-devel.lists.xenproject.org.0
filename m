Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNvyHBCYymla+QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 17:34:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D75D635DEF5
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 17:34:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267830.1557311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7EdC-0003Dm-Ig; Mon, 30 Mar 2026 15:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267830.1557311; Mon, 30 Mar 2026 15:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7EdC-0003CL-FB; Mon, 30 Mar 2026 15:34:22 +0000
Received: by outflank-mailman (input) for mailman id 1267830;
 Mon, 30 Mar 2026 15:34:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7EdA-0003CE-MG
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 15:34:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7Ed8-004BIQ-Ss
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 17:34:18 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ca97e5-2eae-0a2a0a5409dd-0a2a4506b698-42
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 17:34:18 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69ca97fa-3034-0a2a45060019-d155802fb8d1-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 17:34:18 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-486fe655187so60538045e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 08:34:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48727192012sm83775255e9.32.2026.03.30.08.34.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 08:34:17 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774884858; x=1775489658; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RpuvXpmUdHMn7YaX3pBXjxq/HVeiMQouQrOyLB0i8lo=;
        b=BzWJ6TaK4AcP9eby3ACGXP3VLQZW8w4I4Jgh3eUvFrgZDTv3Oj1Zlg26sVTw3rVG3H
         DgSWNyl/xwRnJGtkmx24uqnD1cA+rjML6+RehRsOLiHGxV3cl2bn9rsOiqSxGD/SIjmq
         uIVmLCdUJe/QOQtM+Dpd6nBkjqVV29aOqI4gnZ7YPitwewrZUudVGVtJF9I9vnme42U3
         1loDx3O3BDFK5XYW8EIEet/F8o2zFP++1czit1BTpcjAc4ZyYFiOogpFOdgPKmIowTWZ
         A6XnmTTrikjjcorvcpKHnPE4u9Tw5fpIb5KFaMxMNIfI2RCl4nQLIJCGj4QlITHSgqZj
         t93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774884858; x=1775489658;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RpuvXpmUdHMn7YaX3pBXjxq/HVeiMQouQrOyLB0i8lo=;
        b=VG8VOnBBD+tj/gY6WTAk4YmI79lk3fKFNTqhBLI9Kl9W9/IN/9QntMjE5Z+9BiVG2Q
         u4k53QeG8r4KBCDx8e25IeP+1WJWv1ZtmsI0sBzJ+cXgRSz8Sfsx21U+EZJN/rpK0IpI
         QYbfy4B2KOQXjXDevkNwvELdzKrgsLKd0HNVqaemHVOgOGzf1Hg39+gdf4hq+Vc5Gtgv
         jZyP/ilIEC8Ws+eT1YPVRyWX25uOl7dEeMWPahemHeHKLOJhFQrz23rGHM+iCixM6btk
         7s5LNRFJq8L/uitVJIim7T28bGMLOZ5ZMHpfWqcVDf4Sba7dvdlUQY9VxJfJ0rep/efk
         KidA==
X-Forwarded-Encrypted: i=1; AJvYcCXm8lNtoVpmfTbcfaunIOT7iR7cbNOAQPiUd9hkEFjRfu0OTls6Kl0jv+QEf4qXPk/PHXNFoXdkMgo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1nmTxtGYVPAQq6J0dH6DiEOHv2nLSM9fnFIOx04txBvU08+ZY
	2+PZ0Jryx3WwghryRrobtwLFberZwH26MVQnsuuWhRIzMPP1WRpc9APhpAJQ1TJjgQ==
X-Gm-Gg: ATEYQzygp2d/Z1nadah6BYRSyCNDwqkXHWalkrlPK/54TEHADTO2c2b2M5Ed2OSeUGw
	l82UnYxdtH38L9Yg2pcE0Q41v/NXRWrvocvUsZhDCx/YL0ZfWdAVxwuROSAML6emsuxBqBGjI5Q
	rbisXkpu6GZTw9LCgP7UQic3ANFdE+fMpe1IryWhmkQ+c86jR8oAAjZtc8FxCYaPyuo2eod//iu
	YUYh3sFqEfgBk4Sm+gV7kOyfQkCws6S7MDkBofhiVRkUMo/0TuvQDiKQaS3IAdM5PNQ444+9v1S
	DN+YvkRbS7/N9HgEBbnt1dbI/uEUVhqGLfZzdzi/iuR/a80M2gxjRl3KYeY/sxpa6geS0VyQOgY
	2qr6YO4P5D+X5Iz1SMintDhoSKVf0FPTJTIebKI88sJ3Y2UBvd9Wl/L2lFHYM/8irvkhuZ2zCg3
	QK4KUkE67HHcSJ6guLpvXhysHRjxJW+9GPcStwGq9tMXaE8Ypow1U1nW95fJQCmC/gvTAhxiqvU
	NnyiUTPGSMu6trUwnXW8K6sUA==
X-Received: by 2002:a05:600c:1f11:b0:480:1d0b:2d32 with SMTP id 5b1f17b1804b1-48727d638efmr226832975e9.12.1774884858153;
        Mon, 30 Mar 2026 08:34:18 -0700 (PDT)
Message-ID: <4a0f4313-2694-4986-810c-0f4eac191cef@suse.com>
Date: Mon, 30 Mar 2026 17:34:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] xen/riscv: introduce p2m_gpa_bits
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <775374eab7b9868b7cabe6c76fa1b7ac2f8466d8.1774281309.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <775374eab7b9868b7cabe6c76fa1b7ac2f8466d8.1774281309.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1774884858-7B8991C2-8E16372B/0/0
X-purgate-type: clean
X-purgate-size: 2414
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.931];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D75D635DEF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 23.03.2026 17:29, Oleksii Kurochko wrote:
> p2m_gpa_bits is used by common/device-tree/domain-build.c thereby when
> CONFIG_DOMAIN_BUILD_HELPERS=y it is necessary to have p2m_gpa_bits properly
> defined as it is going to be used to find unused regions.
> 
> Introduce default_gstage_mode to have ability to limit p2m_gpa_bits before
> p2m_init() is being called as it will be too late.

This is a somewhat strange way of describing things. Of course you want to
establish globals before doing any per-domain setup.

> Limit p2m_gpa_bits in guest_mm_init() as it could be that default G-stage
> MMU mode uses less VA wide bits than IOMMU,

How does a VA come into play here? And what is "less VA wide bits"?

> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -51,6 +51,24 @@ static struct gstage_mode_desc __ro_after_init max_gstage_mode = {
>      .name = "Bare",
>  };
>  
> +static struct gstage_mode_desc __ro_after_init default_gstage_mode = {
> +    .mode = HGATP_MODE_SV39X4,
> +    .paging_levels = 2,
> +    .name = "Sv39x4",
> +};
> +
> +/*
> + * Set to the maximum configured support for GPA bits, so the number of GPA
> + * bits can be restricted by an external entity (e.g. IOMMU) and the
> + * restriction must happen before the call of guest_mm_init().

DYM before p2m_init()? Because you do the calculation in the named
function.

> + * The widest G-stage mode defined by the RISC-V specification is Sv57x4,
> + * which yields 59-bit GPAs: Sv57 maps 57-bit VAs onto 56-bit PAs (PADDR_BITS),
> + * and the G-stage "x4" extension widens the address space by a further 2 bits,
> + * hence PADDR_BITS + 1 + P2M_ROOT_EXTRA_BITS.
> + */

I fear I don't follow. I can't explain the +1 at all. And adding in
P2M_ROOT_EXTRA_BITS seems wrong too: Whatever the width of output of
guest paging _is_ the width of input to stage-2 paging. There's no way
for a guest to encode 2 extra bits.

> @@ -191,8 +209,13 @@ static void __init gstage_mode_detect(void)
>  
>  void __init guest_mm_init(void)
>  {
> +    unsigned int gpa_bits;
> +    unsigned int paging_levels = default_gstage_mode.paging_levels;

Deriving a global from a default, when ...

>      gstage_mode_detect();
>  
> +    ASSERT(default_gstage_mode.paging_levels <= max_gstage_mode.paging_levels);

... the default isn't the maximum possible, isn't going to fly.

Jan

