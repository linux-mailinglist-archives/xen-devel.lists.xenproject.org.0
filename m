Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5D6A67B42
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 18:45:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919694.1324079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tub07-0003yO-HM; Tue, 18 Mar 2025 17:45:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919694.1324079; Tue, 18 Mar 2025 17:45:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tub07-0003wI-Du; Tue, 18 Mar 2025 17:45:15 +0000
Received: by outflank-mailman (input) for mailman id 919694;
 Tue, 18 Mar 2025 17:45:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0H9a=WF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tub05-0003wB-Mi
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 17:45:13 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd87d86f-0420-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 18:45:11 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso24618895e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 10:45:11 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb7eb9d7sm18444324f8f.89.2025.03.18.10.45.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 10:45:10 -0700 (PDT)
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
X-Inumbo-ID: bd87d86f-0420-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742319911; x=1742924711; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Xl+KNJ7T0kgQlwKxRthgLmKrWtqRvkGi5Mmcgx/IhBc=;
        b=AUGRuFuR0aGY78YPce2S+TqCNUb1Zio+3rjanI3gs7Ggv8YlS5EDvyeZ2gmK+K8ljx
         3STlDdv/IFWp3hKNKePscjNZOO9VrbizHc6kYnIXnrcXyehlwghs8cnWqbXUAMj4qDU2
         QZAQamduz+fB98vhbxTdcxmo7BpcKeKgYX/0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742319911; x=1742924711;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xl+KNJ7T0kgQlwKxRthgLmKrWtqRvkGi5Mmcgx/IhBc=;
        b=jpJHBw8JPiRTWItDBxI0C1/l45xYw4ZP8l72LRcoOKTN6JiqJ9m60mWcIPKSQdh5aB
         AuWB4dOZchiLwnCE/I4OVGlD6DO/OnRs7LGmHSRHMpNPunHy3b53jM40AAzCjVXCSojs
         1gR63fBdhBWFLqwtSWKjyelsWtadSzfWA9Et61u/hqVGHHRbgTtb9uQGuOYd23OaNWr3
         OBLePg8XGYvzb+fLvWb99cDL048dl1swD/zZ6BkcfL/sQdErieUFg530D6LVfaX220Gm
         1C5y9jBGa+xTDMwFVo6SmvuipUqMhS56tyl70Oa4tcYViFiutbpcwWXvAdB634Ya/lIz
         m8Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXGNmv9ErOtZAJwk4yzrS+SPxQxLwjOCaljRK6h/XdSWvTNeR9JKWc18sUtTP5uvXJb+ZtUywCNEbE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy3BKyrY29DGLL1aN3FeQW9uozF7dlf53ms4NY1TgmXBhtlgJbh
	nuHg+Y7WGcRKQzw7ZiN3a6Wm6HP5etV4lV3WHDJZzSowoq5eFmcC5OND9h/r5UyJm11mzDSEDfq
	1
X-Gm-Gg: ASbGnctnqqte+KOrrqIeuXvzbhjDHt98/kXQnkjzfQkI90LIrZfF9BDIkCR6goHmnfe
	GOb5GQjrGjDSsRs8lzFasu+4+PmH1zX+VoAxvfZKhQYxKctkbUlNWohU+t60rMenOEaNH0C748b
	3kW1MDpaIVojqLhrYQ3ASPZIHaaRsz+k7NBGJ3Em2DLFKCyR26jipzvq872LJ4zPcdphj2kMtVx
	v4d1UDD4mv6wVime3uQQgcsBm1qAO8BNhCQh1PXGIGIZIhjHJcluGMjtOrIIOsnVL9Zh1GpXj40
	fABSeKGlWfKn9DWJ8Dh0sEl48e1/5dFUURrdHw9UKSJJqHUNS7PX6wnVtiUv/pCJLOUzOjJFUjs
	nLOcJ4FqF
X-Google-Smtp-Source: AGHT+IEQ8dNV4h2ZZZp3tU4gv3H0hSVzBMsP2gcdtKbZ/OjGh3gJ/M5pRvIdhEXRs15M6UqRD1IaLQ==
X-Received: by 2002:a05:600c:8710:b0:43d:649:4e50 with SMTP id 5b1f17b1804b1-43d41aff34amr142015e9.13.1742319910799;
        Tue, 18 Mar 2025 10:45:10 -0700 (PDT)
Message-ID: <720af946-5c2a-43b4-a9fb-163e41bfdeb7@citrix.com>
Date: Tue, 18 Mar 2025 17:45:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] x86/boot: clarify comment about trampoline_setup
 usage
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20250318173547.59475-1-roger.pau@citrix.com>
 <20250318173547.59475-2-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250318173547.59475-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/03/2025 5:35 pm, Roger Pau Monne wrote:
> Clarify that trampoline_setup is only used for EFI when booted using the
> multiboot2 entry point.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/boot/head.S | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> index 1b3bd16fe575..59a2b5005cf6 100644
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -505,7 +505,8 @@ trampoline_bios_setup:
>  
>  trampoline_setup:
>          /*
> -         * Called on legacy BIOS and EFI platforms.
> +         * Called on legacy BIOS and EFI platforms when using multiboot (either
> +         * 1 or 2).
>           */

/* Called for Mutiboot entry, including MB2+EFI. */

is a little more concise?

~Andrew

