Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7108CA600A5
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 20:08:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913389.1319436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsnuF-0007Ar-MP; Thu, 13 Mar 2025 19:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913389.1319436; Thu, 13 Mar 2025 19:07:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsnuF-00078E-J9; Thu, 13 Mar 2025 19:07:47 +0000
Received: by outflank-mailman (input) for mailman id 913389;
 Thu, 13 Mar 2025 19:07:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2IX=WA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tsnuE-000788-HA
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 19:07:46 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7232f6f2-003e-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 20:07:45 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso9159755e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 12:07:45 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb318aa1sm3107921f8f.64.2025.03.13.12.07.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 12:07:43 -0700 (PDT)
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
X-Inumbo-ID: 7232f6f2-003e-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741892865; x=1742497665; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n4M7QB00+B44fpKgjSqyj4KKHn4WFk8WpJcQMngINto=;
        b=aqKLC18NglUgJqPrlEmGUxxoBi21VG1+9/wvMfwn+smzMnFm3Y8SPhYTA50asuDZWw
         QiVDDemmtz0LwNo6Q0eX4FcVbPlZuXuh3r1ZqR3GOfuJ1r7Ezy9kiqx9J4FgzR4NEpzG
         qSfpe501/x7mLZ0+/jCdhqmtscbKDBGXWkVIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741892865; x=1742497665;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4M7QB00+B44fpKgjSqyj4KKHn4WFk8WpJcQMngINto=;
        b=Z9+eIIxPHeq2V0F3nzU0i4vCYbhdcJgfH2h4uvistDpQ4bJoerUFKxUtUE6uzHA3Yg
         pXfCiiTss0LeOz1oYhdJy2da0w9pxdTDfTTXU/e6cH9B6UmLUC5DO4MN8hLMW/QkmCO7
         eWzZPzFSrQtnpSLVM+oXu7dHtuuGVAsapBbVonnxdSBoVKEePq2tMuYoIXF43c0xNDqY
         m/wbUc3R+/G21NKXzv4MhF0WAqK5j5d+eKaZcGgwuh3Z3ZWfBWw1h0+1XVH9PDZpD9I1
         ACKhu/hQYnc08cHHBJU+tht+3b7Gukc0iwFUMpxI6Hp81PoI4sjL41M4SCUy5SUqMeis
         RpKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUB3fBHYXB5fP95uWR/E8mkLrLDiG44v/woACMiaq3XZj4A977nd4p3E2huqusOpSzfkqSW5OiOtRA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz14ALJ8PggOSuIe71JIUWe8biqvplw8sObPFFY1Y/rUTwUFCsh
	4/czLp11SMOhmI+kQapX6EevANGv5eWjPFCF+FpGSU1QEe7tOlKAJLu4fd5jVpc=
X-Gm-Gg: ASbGncuKWZKtgKfaCcuyN4wa4OJeZkGCj38RTQbwj+Q5JxQqKDtvYT1FJXD4ZtYcVLH
	G+wQ7iyqcUKQq74eNn/oN7uSfdxna6Gfu6wFexQe7JwIwXyN9ffG9UiPPdO0U6DakfkoktB2SYN
	EOzX83Vp4uub4gN14XNq4BVEOB5AgyokQFwzzD4K1zm0JcXX368f/U+kK+yu0E4shfyVtbwbDmx
	glmF9jJWOVeG135Ph4ChdU0Tkqw/rPMZY4r3+ZQXhQWdt7wSrHSAv9aI471rkCnyhKcas1apL/9
	J95lRSHX8v7PB/L1lwbZiBGH9c1TtJokKWgjT5SCmVuVgnudJ7RpcwFfE4iHgMGR2PFE+Gp6Fki
	IwU/sFM+cb+cit13PZpo=
X-Google-Smtp-Source: AGHT+IGmG57tzvTxtBdGFowO3jSvOz85AyyzH4dEKVm/WR+xoWSEs62VggwTDMmkBAQNX77zVguK8w==
X-Received: by 2002:a05:600c:580c:b0:43c:fab3:4fad with SMTP id 5b1f17b1804b1-43d1d97c682mr7988585e9.16.1741892864807;
        Thu, 13 Mar 2025 12:07:44 -0700 (PDT)
Message-ID: <a51d185c-0d7b-4244-b891-c56496e012f7@citrix.com>
Date: Thu, 13 Mar 2025 19:07:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] x86/wait: prevent duplicated assembly labels
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250313153029.93347-1-roger.pau@citrix.com>
 <20250313153029.93347-3-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250313153029.93347-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/03/2025 3:30 pm, Roger Pau Monne wrote:
> diff --git a/xen/common/wait.c b/xen/common/wait.c
> index cb6f5ff3c20a..2fcbbe8d0c71 100644
> --- a/xen/common/wait.c
> +++ b/xen/common/wait.c
> @@ -170,6 +162,54 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
>          : "0" (0), "1" (cpu_info), "2" (wqv->stack),
>            [sz] "i" (PAGE_SIZE)
>          : "memory", "rax", "rdx", "r8", "r9", "r10", "r11" );
> +}
> +
> +/*
> + * Since context_save() is noinline, context_restore() must also be noinline,
> + * to balance the RET vs CALL instructions.

Why are you caring about balancing CALLs and RETs?

This infrastructure exists for cases which don't.

> +#ifdef CONFIG_SELF_TESTS
> +static void __init __constructor test_save_restore_ctx(void)
> +{
> +    static unsigned int __initdata count;
> +    struct waitqueue_vcpu wqv = {};
> +
> +    wqv.stack = alloc_xenheap_page();
> +    if ( !wqv.stack )
> +        panic("unable to allocate memory for context selftest\n");
> +
> +    context_save(&wqv);
> +    if ( !count++ )
> +        context_restore(&wqv);
> +
> +    if ( count != 2 )
> +        panic("context save and restore not working as expected\n");
> +
> +    free_xenheap_page(wqv.stack);
> +}
> +#endif

The wait infrastructure is incompatible with CET-SS.  (yet another
reason why I want to delete it.)

The only reason this wont blow up in CI because shadow stacks are
enabled later in boot, but I was hoping to change this with FRED.

~Andrew

