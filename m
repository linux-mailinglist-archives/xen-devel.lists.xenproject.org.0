Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB02DAC421B
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 17:09:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997576.1378398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJZRB-0008Vq-Mx; Mon, 26 May 2025 15:08:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997576.1378398; Mon, 26 May 2025 15:08:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJZRB-0008Tj-KK; Mon, 26 May 2025 15:08:25 +0000
Received: by outflank-mailman (input) for mailman id 997576;
 Mon, 26 May 2025 15:08:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkau=YK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uJZRA-0008Td-HE
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 15:08:24 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41fa6105-3a43-11f0-b893-0df219b8e170;
 Mon, 26 May 2025 17:08:19 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-442eb5d143eso25681165e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 May 2025 08:08:19 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f381420fsm236861095e9.32.2025.05.26.08.08.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 May 2025 08:08:18 -0700 (PDT)
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
X-Inumbo-ID: 41fa6105-3a43-11f0-b893-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748272099; x=1748876899; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EU1exnmsdBRhmeyGaKYuOGMB6KVcO4ERcW6t4jayRq8=;
        b=pKgHJLnfOplLOoxa5fma30EPaKHRW5qo+7v4X1bIFicMiwH+dc9YP3Vhem6hiHVuSH
         aWCZ8LB4N1T28wIkAWIeCTh5qYjm4oUlaGhymMdwk2wjw86dh1aUTo3IxjkHMHTys+Jz
         Q8JIhtI1lLwYa7+LOQ2a0Y8ojrCJjSCXi1trA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748272099; x=1748876899;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EU1exnmsdBRhmeyGaKYuOGMB6KVcO4ERcW6t4jayRq8=;
        b=tS/B8YxMOIGKLxOsctuNoSHNd49gH2yxi45gcuMcM/GkwPSBSz4mER2PYSJ6Mlt6wM
         V6dpB9nAy+3Q5JsS+oFYUsNhe+oimupGkHGmnU8BP1rBhu8bSTfTjLe4bgS8riYKlw8i
         phYlqvP01mYY0xh9VgGZssQiA+pwWkiJrH/F7EaJYgTfu7GYVUV1wziwZtZIIxTn2FhE
         bNzuiDIXnwZhSWG7mRc2aQnrTeDEUyPOp7tFx5Rdjhe7P2xmf4LlhujqnnSb2PFtGEDh
         P1YZ019sUqZyWoqnzAIulk+I+dveR+ubF88UH5GG+adKGWbW6e+e6ktGMfIrtttaok8+
         GkFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNzPT7+H/x2yVRd7JtstiD4mNtCRZz35XKMLGTbth4ThSGI/AooGMFnAgc1CSzWGCXdTjW6rKxvx4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy2USMsNA+zM60Wz2us1yJumI8e8qsfAyAK7JUsQSLuR4jiJIx9
	ghar2+QcRsMwjxUYjnjjWjaNCs7fCYx2RO3wgLL4LbBN/m1nZfbEgwwSnNiRokkLIY8=
X-Gm-Gg: ASbGnctgGrvyhJifdwW10+KnJ3giX21FhsSB1o7Qy+VTsHP6rMQIwdexSNzf7pUAeuv
	eloOa7UrL//sAZVLrmZGQXB2bFa9zeUKa1oJXXzEp+5rEE6mkG+IlrQI/Wb4AVyC2IL4GyoUhcm
	hl3ULeUxNO2kFVKTYRnx4ZWmWvOyuG7/ajvye2kgqH9YteMhEzS+dQBvG+60vlzMbuHAwV/7mdx
	OJjW0sZH8ax6dz7UVHuIVh3iLKO1VKpscwG9/fj7lBRF7ZOyFF8mnrs3xv+mE5fPmspt0CP+86J
	BUmb9Sz93H2V4qfiIfMfmpekVMhM0bO8scHXT9JfrGOl7Js+91ZpvTkmAmc7lmpTtOG9rA7XGNR
	YRq0cwnoHrIHCwrQN
X-Google-Smtp-Source: AGHT+IG/OaRwlDk9jTrJ4xxl8oP7SVSrG+mhYG+J8/vnrLQfrrYekKMFLSaYebwbWTFsBF/6Bue5WA==
X-Received: by 2002:a05:600c:470b:b0:441:ac58:eb31 with SMTP id 5b1f17b1804b1-44c92d351d5mr69366565e9.20.1748272098725;
        Mon, 26 May 2025 08:08:18 -0700 (PDT)
Message-ID: <0b17da9c-57db-4a8b-90af-e53e45cb1243@citrix.com>
Date: Mon, 26 May 2025 16:08:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] console: add relocation hook
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.defc562b917978814c8359bbd04f1dadba33fb77.1748182535.git-series.marmarek@invisiblethingslab.com>
 <4f1889dc03ec4aa2cc0cd2bd14523a2c6f670bdb.1748182535.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4f1889dc03ec4aa2cc0cd2bd14523a2c6f670bdb.1748182535.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/05/2025 3:15 pm, Marek Marczykowski-Górecki wrote:
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 25189541244d..3ef819a252e4 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1481,6 +1481,8 @@ void asmlinkage __init noreturn __start_xen(void)
>          highmem_start &= ~((1UL << L3_PAGETABLE_SHIFT) - 1);
>  #endif
>  
> +    console_init_pre_relocate();
> +
>      /*
>       * Iterate backwards over all superpage-aligned RAM regions.
>       *
> @@ -1606,6 +1608,12 @@ void asmlinkage __init noreturn __start_xen(void)
>      if ( !xen_phys_start )
>          panic("Not enough memory to relocate Xen\n");
>  
> +    /*
> +     * Notify console drivers about relocation, before reusing old Xen's
> +     * memory.
> +     */
> +    console_init_post_relocate();
> +

With reference to the next patch, there are printk()'s in this region
which want to work (in case something goes very wrong), so I don't think
setting dbc->suspended is the best approach.

In dbc_uart_init_pre_relocate(), you just wait for all transfers to
complete.  Can't this be merged with post_relocate(), at which point the
intermediate printk()'s will work too?  It will also remove a hook.

Meanwhile, we have things like:

    /* Cache {,compat_}gdt_l1e now that physically relocation is done. */
    this_cpu(gdt_l1e) =
        l1e_from_pfn(virt_to_mfn(boot_gdt), __PAGE_HYPERVISOR_RW);
    if ( IS_ENABLED(CONFIG_PV32) )
        this_cpu(compat_gdt_l1e) =
            l1e_from_pfn(virt_to_mfn(boot_compat_gdt), __PAGE_HYPERVISOR_RW);


in traps_init() which really doesn't belong here, but does belong in
some kind of general "relocation done" mechanism.

I wonder if we want a new type of initcall for this, allowing individual
areas of code to opt in with less boilerpate?

~Andrew

