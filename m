Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AA7A7BB76
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 13:22:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.938150.1339025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0f7g-0002kL-1A; Fri, 04 Apr 2025 11:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 938150.1339025; Fri, 04 Apr 2025 11:22:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0f7f-0002ij-SS; Fri, 04 Apr 2025 11:22:07 +0000
Received: by outflank-mailman (input) for mailman id 938150;
 Fri, 04 Apr 2025 11:22:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9O5F=WW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u0f7f-0002ia-1f
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 11:22:07 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a089aa2-1147-11f0-9eaa-5ba50f476ded;
 Fri, 04 Apr 2025 13:22:05 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso13199335e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Apr 2025 04:22:05 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec366b571sm43611045e9.40.2025.04.04.04.22.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 04:22:04 -0700 (PDT)
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
X-Inumbo-ID: 0a089aa2-1147-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743765725; x=1744370525; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8LesR/SGC8EeZNPqAcM23dHESKkyarxpefBGVTvvUoY=;
        b=jSBOJ8fBuXelAfX1WfhMyX/BbXcpTf/Ys3XeNSshyykns48wiAqYN1F5DXeFBH6TIU
         AKgDQuNCJKRkth1zwhvs5B/dt7pMyTS5JhiEaSVK5jKKrt0pbFqdJ1Hs6WUzExAaPhPA
         X0ErSu2hHPT0E2KJLD1RE3fJX/xZZyZG7diyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743765725; x=1744370525;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8LesR/SGC8EeZNPqAcM23dHESKkyarxpefBGVTvvUoY=;
        b=TxARkN495PyS6DhZC/jtL0mysmOTXRTOzhzPddcIi3Yi01oMKzAZsNwy2kJSU5yzfj
         ZurLLMrPYVmpGM1BA7McTIq7H7dl28Dfom6PBBuRn9rAHqM6z+xAT26tVnCfN1o8Y/FG
         PmrfW6aexhvQuUJYSU28tvlqBTnmmu0RIhnQDECXvQRa1QOGoKrmmMr7xXNCi1vrX/It
         xFA1jnQ4G5Z8vK6Oll5C/0bgRwiHCDSDodtYmkfWoht/ABve58YX130rzwF4aC6fA1ou
         hN6sMC6NyV5FY6moSebR+yF3pkRYW2jkoC8WNYMgEPHpXyihABTLjzTrq7Cuh+iW3PtA
         R0iA==
X-Forwarded-Encrypted: i=1; AJvYcCXkVxr+eW/+rge0y3XuU4BpjvjhQinqk9G+nkl2xqjTb7eJDd81qNn7qIjrCqiPJHXDibRI4kw+iZI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1xtq8UHFPSyb64IeBPlnfyIMh3yXm7aHmfJOqegrKnteGGULu
	NfbnUKc7XbRd+ucmfCTw1pZ3Zt/L6HJ1WyN9JTShZE6K6+MiXGOIE7o8PjZa+U0=
X-Gm-Gg: ASbGncuQD2y/FQD22kQ6AIZwVnkCnWrZFqOuFwI4XmkZS5fNTBpFWD11FaCbnT6X5pO
	FNF1QDZr7Bv4EOyVmjnIOF2L2F7ooPY0NmDjv44n8cX42lO/zKRp2wuWd11wXM991s60xrNCa3X
	eyu2SkiHlYMDCZfwZpwAjdSbP5D2LFs8hsh5Cdjuf4kFZLtMhIIZn39AWrZO3ijADZiONlP/vq8
	AVc55XeNJCjjAKqJ6t4KgH6rCf2LhCd+TulKhX/s9Q07EBq6PxeopQPt7ZceEb3tjcoT7shygJI
	USlv/32+TXgbwJdHpMrQnsxEulY1gsyytlxYM9Z9N7MmwnRIEN4zSoNtteOlHWEKoU4mkwr5UpE
	ucLuYFJdcxg==
X-Google-Smtp-Source: AGHT+IGshNrsYh++Jd6BAG9tWRzyY47uKo+cB11OBjMRZyLvB8cOAr5HXZu1gTm3Ova/r1CcfGvtWA==
X-Received: by 2002:a05:600c:1e1b:b0:43d:16a0:d98d with SMTP id 5b1f17b1804b1-43eceee3375mr28424645e9.15.1743765725169;
        Fri, 04 Apr 2025 04:22:05 -0700 (PDT)
Message-ID: <4059e6bd-5538-4f6f-ba05-1d9e32ec04c0@citrix.com>
Date: Fri, 4 Apr 2025 12:22:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/amd: Enable TCE in Xen
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1743756934.git.teddy.astie@vates.tech>
 <460c58c78e956ca62cc80356536dbdb45fa73779.1743756934.git.teddy.astie@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <460c58c78e956ca62cc80356536dbdb45fa73779.1743756934.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/04/2025 10:49 am, Teddy Astie wrote:
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index d70abb7e0c..0e2e7d012f 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -2008,6 +2008,14 @@ void asmlinkage __init noreturn __start_xen(void)
>      if ( cpu_has_pku )
>          set_in_cr4(X86_CR4_PKE);
>  
> +    if ( cpu_has_tce )
> +    {
> +        printk("Enabling AMD TCE\n");
> +
> +        write_efer(read_efer() | EFER_TCE);
> +        trampoline_efer |= EFER_TCE;

This doesn't do what you think it does. (it writes into the copy of the
trampoline in .init, not the one placed in low memory).

You need to use bootsym() to get to the real trampoline.

I'm also not sure the prinkt() is useful.  It's about universal on AMD
systems.

~Andrew

