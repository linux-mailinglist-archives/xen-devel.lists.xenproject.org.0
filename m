Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 028D4CCCBEF
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 17:24:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189926.1510648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWGnH-0000xv-KA; Thu, 18 Dec 2025 16:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189926.1510648; Thu, 18 Dec 2025 16:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWGnH-0000vo-HF; Thu, 18 Dec 2025 16:23:59 +0000
Received: by outflank-mailman (input) for mailman id 1189926;
 Thu, 18 Dec 2025 16:23:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YG3a=6Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vWGnG-0000vh-PR
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 16:23:58 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f375514c-dc2d-11f0-9cce-f158ae23cfc8;
 Thu, 18 Dec 2025 17:23:56 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b7cf4a975d2so115007966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 08:23:56 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b585b3718sm2914823a12.1.2025.12.18.08.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 08:23:55 -0800 (PST)
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
X-Inumbo-ID: f375514c-dc2d-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766075036; x=1766679836; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TkvTjPGABZvfWjx04OAgcqxOPuaaxo42CLwM5rh3+3Y=;
        b=FN0170A2bq219Q1rEk0XZ9/j/0GxcFn1ERaTWpFIvxcHsNEcGJ4gxQ63rVW2p47D9Q
         f83F4l02+dxZPPc4gFZ3EdMzNi7Ry0Kbj2CyNXNuKIGGhGz0/6KXK1oCSojmZHvpX3N0
         wwofpwXFdIh/z1W2+X6PQU1gRuDu3rht/r7Iz8G9UmcYjoh0RVBZmmyh4+PDs03yEPEl
         AcofCFBthwgh6KVMzgEhz82cfPJB2oOenNG0drPVX2/NdOdpmwZe7ReJXVWAw8RP/nWc
         C+Wk9hJdjNiSR7MKxxjPoVAhk06rCnhQJfm7I8+cmKcyct2D0IZKKTSgwxPqqol0czlp
         +UkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766075036; x=1766679836;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TkvTjPGABZvfWjx04OAgcqxOPuaaxo42CLwM5rh3+3Y=;
        b=XYU85GpaIheyECP6KNmdteT7A/tAkpn0DdMehy9eBpjB6WJbsT0318w8RQix3rZTpR
         OvqoLlFF4RaKow+zccmhb4HxRHe07+PLNVOqbQ106E6Tl+skNOSDa8yFiBV8+n6nf9xG
         HEKeBC5G70sXl3Qkcu4qTIp9DpsIc6Wj8m83NXWu91KlOtT54j/qEkr/aR5XHmOZU+3j
         pYa+FjzeXyHKlBNpF9S9QkNFf84EzYM8D3M/0GlDbBwjnkTZlhqnn9G1J7WZ+Qlz0OHz
         kMkcKNMjdkDoB5QwaJtTjJzCSRKDm7oxNQIhkhuUhlS+N8AZHZfnNzxGehplbTDP/VkX
         /5Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUxROBAQPdTZw0NtC400KT0i9kyS2gGwpPZA8NlXKTRdpWMjb0imVWeFoWv/HMPUcGOlXQl4omWOpA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuBoYvb0ipC40Cj+Bq3c8SySatNkewxu6ZM31xk5OskAc8DYo8
	37UW+Ya2anZXOWBmRqubHt6Y7ayeKQX2UbgmYTgOzx8VTUsXpowRAUdk
X-Gm-Gg: AY/fxX6QWmPX4bD0gAK+rsyIzn1Y4TjPDksro9BK5SvlVNJHDyfNjjVMRGIgfIZhS/A
	EuZLPlbUxf4oWTYy5ZhRSbDsq6ZdtCnEA/MElNqbUBAMS78e3rg7GslHuwFvnAu10KmwC4RK7fk
	1BNtzCipdan7NqSapxpArH1klR2pvE1s8LAG6Ke8enHN7rn9hU2GlaKPgDFfDq069WDZUa6579Q
	HSL2B4Yuld9/umYiEYfW8lmHq1IIu6+syUQrN//5o//RkNa67dz7kmfwWqCADczHmYLbL3gaWgW
	RNiyFj5BDN5TUbrV3MoxXjkBpaCW9UvqzV9oQYpoJeACF69Pz8tpmrzSDHocw/0RfzTUssVfsPy
	KzXPk1rMv3Gs0THH6fGF3X3pOt4wGMURGb7lM6Jcy88v3w3juC5XRwuoGUMPxZGY02ux712sP7t
	CZEYmIrZE/QvCSwgdx3k+WWeqF2+2B3rcmCO11vmOE21bED2M44OvzHleoar86/Kf9
X-Google-Smtp-Source: AGHT+IHBo3YrtZXnk25pghJvHov7HRv4BzXdiiXN0L+bhJGYPDlHxUkadTS0UNZWrxlasGQC33qW8Q==
X-Received: by 2002:a17:907:d92:b0:b72:b433:1bb2 with SMTP id a640c23a62f3a-b7d235d07a3mr1975827866b.7.1766075035626;
        Thu, 18 Dec 2025 08:23:55 -0800 (PST)
Message-ID: <bf0c335c-454b-4434-85d5-6fd58fd3bba9@gmail.com>
Date: Thu, 18 Dec 2025 17:23:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/19] xen/riscv: add root page table allocation
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1765879052.git.oleksii.kurochko@gmail.com>
 <0c85ea3e9e00ee1f00d6e143a15f118d714d128f.1765879052.git.oleksii.kurochko@gmail.com>
 <935d4342-aff0-4ba5-b23b-b281e2427ffb@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <935d4342-aff0-4ba5-b23b-b281e2427ffb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/18/25 2:58 PM, Jan Beulich wrote:
> On 16.12.2025 17:55, Oleksii Kurochko wrote:
>> @@ -30,6 +34,11 @@ struct p2m_domain {
>>       /* Pages used to construct the p2m */
>>       struct page_list_head pages;
>>   
>> +    /* The root of the p2m tree. May be concatenated */
>> +    struct page_info *root;
>> +
>> +    struct gstage_mode_desc mode;
> Why would this need a copy (instance) of the struct? Can't this be a
> (const) pointer into the static array that currently is local to
> gstage_mode_detect()? Similarly there max_gstage_mode could be a pointer
> rather than a separate instance of the struct.

Good point. I will take that into account when will deal with TODO.

Thanks.

~ Oleksii

>
> Yes, there is a connection to ...
>
>> @@ -124,6 +193,24 @@ int p2m_init(struct domain *d)
>>       rwlock_init(&p2m->lock);
>>       INIT_PAGE_LIST_HEAD(&p2m->pages);
>>   
>> +    /*
>> +     * Currently, the infrastructure required to enable CONFIG_HAS_PASSTHROUGH
>> +     * is not ready for RISC-V support.
>> +     *
>> +     * When CONFIG_HAS_PASSTHROUGH=y, p2m->clean_dcache must be properly
>> +     * initialized.
>> +     * At the moment, it defaults to false because the p2m structure is
>> +     * zero-initialized.
>> +     */
>> +#ifdef CONFIG_HAS_PASSTHROUGH
>> +#   error "Add init of p2m->clean_dcache"
>> +#endif
>> +
>> +    /* TODO: don't hardcode used for a domain g-stage mode. */
>> +    p2m->mode.mode = HGATP_MODE_SV39X4;
>> +    p2m->mode.paging_levels = 2;
>> +    safe_strcpy(p2m->mode.name, "Sv39x4");
> ... this TODO, but surely this code could similarly be made reference the
> (then) global array.

