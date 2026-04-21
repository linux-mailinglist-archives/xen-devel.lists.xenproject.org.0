Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAoSERg952no5QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 11:02:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0B64388C1
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 11:02:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288689.1568927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF6zW-0004uh-CS; Tue, 21 Apr 2026 09:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288689.1568927; Tue, 21 Apr 2026 09:01:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF6zW-0004tI-8Q; Tue, 21 Apr 2026 09:01:58 +0000
Received: by outflank-mailman (input) for mailman id 1288689;
 Tue, 21 Apr 2026 09:01:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wF6zU-0004tC-Tw
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 09:01:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF6zU-00AJv4-AY
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 11:01:56 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e73d04-e002-0a2a0a5209dd-0a2a4509d0de-0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 11:01:56 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e73d04-2497-0a2a45090019-d1558034d908-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 11:01:56 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4852b81c73aso33841305e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 02:01:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc14a61asm326686455e9.15.2026.04.21.02.01.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 02:01:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1776762116; x=1777366916; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8wG57sSj3MTDSw8kHpjCY8D2TcEEJUl94PH8ftaAEZI=;
        b=UDKIUOIYuY3aGSwEPaao4w/V4O1w1SBl8TsTBDDo8lGUZei44Vm/6QGFOiqH6wfWLp
         mcIAqKQ/1d0OaxSEcQbJCwwADP2DgS7zwwynUVGgPxEX+g6FRatiGk0xwIUsMz0nmzff
         iJwW3S1JQelwOnC6FAbBauIXJH2ur+ag6Wr6537wWky6xnVUjj3h/h1MMacgtBcHX4Og
         si550XQIovPOoXzVh3D8maYFdf/PUCkpPX0HA3TQ8qE7R+Bu21qLL3pkeXC+JWUNTjzq
         pggjgK3EF8jilmqcVK7+PH9kOit48aIRfg3Nwpqt19CqTD/vk27LS4LgKgHQ9h1BKuhO
         2MWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776762116; x=1777366916;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wG57sSj3MTDSw8kHpjCY8D2TcEEJUl94PH8ftaAEZI=;
        b=aByH0suSekCTw17i7Bm3cVPngZWMJ9UgZZifjWptzg9AD6d1/QYgWFGxrIF5qgPzU8
         DuKvplgfOulOBJq4hOSrtwMynXJ66QnDRccv0ckGcmVCJ4Cmly21/XT3uNLywQwKzE0S
         fKf16ruXC5OwxGQIZYQzR6//g9QSkyjKnkMW2CB3EwDOVSixwVbKXIqpPaiKjtvyfA7j
         4qqthVw0aIEK+gimdg7wPc0QKnVwe5UmPw4gq9g2dKXzfvXdg5XWBekeKBJJt+55hdW6
         eK+h0jDufmrWlNztR+u74vs3IE5CYP3pE7fAdWsiPLkwtY/gFDDBE19iiy5ZYH+yA206
         LcIQ==
X-Forwarded-Encrypted: i=1; AFNElJ/T9Uox/0wef5eqded2FyCEzr9sbIRfF6MNv8hF8TLNOrS8nesBVbOeA0ahleKd+ZNIRZYB7JWeMGg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAB3i+2tIaxEyG+fke0KFXQS+lbwo1oZDSv5SGTEqe/OPwqZCR
	inEe61xvBzVW+oI2NgZseJHG8bW4mAAqHiHCajvf49yjc2X9oy+frWaG+sFI9cz62Q==
X-Gm-Gg: AeBDieu6o1SnOsI17MzgaT+f90V3FjFEw2+PFyAbcr026lMkA0NJRuHnLcuXfi+kLz2
	LAHkBvFEwacCtw8q2bJFS04Kt5wXqFn4C2hjQrn0RZe8cVAJtYiVpcXN/SWuf/W51HoezWR/aJ1
	+9o3yokBKoVmn/c2MyONJychcSVzUjMacYrjjNAYsNYNPbWF1jRXu2IVPnEDLbt1UHSFTuGMfvb
	tv3qNyPE9XsUdJg+ahJQbwWE8X2auWc6gEnBChqcA4Yx11ZkiI/Nxvtri79oBzXEc2PajhHdojw
	KZqljB7VP2jHyt79PA6WywueOkBXhaEPYP/uH33uzqw5SKUkNETF6cJsLaaZZJANnC8pWR5jw1I
	ifS6iI6uOTVqcS0u0n7/mEge0lUg+kwaOX3xo/2wywaOecPfFlN+qJknIWAW6vS2msCE251pUfe
	SVBx9gd0xv4fTeqlzfJchEKB9om6Lj5KOoQ8heSvl1soZsDEst7lZVKjjWC1qc+QBX3NEqG1rD9
	cV2gFMrSxeGGQI6sLBWFwDdoA==
X-Received: by 2002:a05:600c:450c:b0:487:55c:e0c1 with SMTP id 5b1f17b1804b1-488fb768816mr239286935e9.14.1776762115569;
        Tue, 21 Apr 2026 02:01:55 -0700 (PDT)
Message-ID: <03cd29a1-32fe-4664-9c4d-91172df369d8@suse.com>
Date: Tue, 21 Apr 2026 11:01:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] xen/riscv: add kernel loading support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1775836193.git.oleksii.kurochko@gmail.com>
 <29ec8e444792caa925ba92cdc406ef8c0b3bd678.1775836193.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <29ec8e444792caa925ba92cdc406ef8c0b3bd678.1775836193.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1776762116-414B1A53-9152CC60/0/0
X-purgate-type: clean
X-purgate-size: 2066
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
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
X-Rspamd-Queue-Id: CB0B64388C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.04.2026 17:54, Oleksii Kurochko wrote:
> +/* Check if the image is a 64-bit Image */
> +static int __init kernel_image64_probe(struct kernel_info *info,
> +                                       paddr_t addr, paddr_t size)
> +{
> +    /* riscv/boot-image-header.rst */

Is this meant to refer to Linux'es Documentation/arch/riscv/boot-image-header.rst?
This needs making unambiguous.

Jan

> +    struct {
> +        uint32_t code0;         /* Executable code */
> +        uint32_t code1;         /* Executable code */
> +        uint64_t text_offset;   /* Image load offset, little endian */
> +        uint64_t image_size;    /* Effective Image size, little endian */
> +        uint64_t flags;         /* kernel flags, little endian */
> +        uint32_t version;       /* Version of this header */
> +        uint32_t res1;          /* Reserved */
> +        uint64_t res2;          /* Reserved */
> +        uint64_t magic;         /* Deprecated: Magic number, little endian, "RISCV" */
> +        uint32_t magic2;        /* Magic number 2, little endian, "RSC\x05" */
> +        uint32_t res3;          /* Reserved for PE COFF offset */
> +    } image;
> +    uint64_t effective_size;
> +
> +    if ( size < sizeof(image) )
> +        return -EINVAL;
> +
> +    copy_from_paddr(&image, addr, sizeof(image));
> +
> +    /* Magic v1 is deprecated and may be removed.  Only use v2 */
> +    if ( le32_to_cpu(image.magic2) != IMAGE64_MAGIC_V2 )
> +        return -EINVAL;
> +
> +    effective_size = le64_to_cpu(image.image_size);
> +
> +    if ( effective_size && size > effective_size )
> +        return -EINVAL;
> +
> +    info->image.kernel_addr = addr;
> +    /* Actual size in the binary file */
> +    info->image.len = size;
> +    /* Total memory the kernel occupies at runtime */
> +    info->image.image_size = effective_size;
> +    info->image.text_offset = le64_to_cpu(image.text_offset);
> +    info->image.start = 0;
> +
> +    info->load = kernel_image_load;
> +
> +    return 0;
> +}

