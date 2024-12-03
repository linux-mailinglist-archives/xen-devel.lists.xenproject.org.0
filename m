Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9457E9E2D32
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 21:34:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848173.1263141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIZa6-0000an-14; Tue, 03 Dec 2024 20:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848173.1263141; Tue, 03 Dec 2024 20:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIZa5-0000YO-Uj; Tue, 03 Dec 2024 20:33:13 +0000
Received: by outflank-mailman (input) for mailman id 848173;
 Tue, 03 Dec 2024 20:33:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=On7Z=S4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tIZa4-0000Xy-C6
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 20:33:12 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce9b80df-b1b5-11ef-99a3-01e77a169b0f;
 Tue, 03 Dec 2024 21:33:08 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aa5302a0901so717119166b.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2024 12:33:08 -0800 (PST)
Received: from [192.168.86.29] ([90.240.255.120])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5996c1408sm647537166b.15.2024.12.03.12.33.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 12:33:07 -0800 (PST)
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
X-Inumbo-ID: ce9b80df-b1b5-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733257988; x=1733862788; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jxR1FGK3+feziYsHaMop3zcgA6TxQT/HkAiZ2onL1zU=;
        b=tw6AXjcoSToWjK7Q8912/17E+JG6jJ4q7L9ZsIOBi3M8ITH+fDQ6U7m+95dWBqQATl
         +nT1uREMTB7YrBdcCxln2k+GC26x7KhDxEB8D4uQMeljsDSNun0hLdNZmiBxz1gGo8XG
         su/vlTkcpFCqnkXK49wBGchanNzyqji5KQrvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733257988; x=1733862788;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jxR1FGK3+feziYsHaMop3zcgA6TxQT/HkAiZ2onL1zU=;
        b=sYOe2FyEQm3Gnyb2IFfCtPiomKqTVvOMnOKRTTaztXR4o+az6cLcyA2VoQqV9LI2o8
         yDwo9S9MaA4y8FCdagFX7tq4UUDVSxqr/rtxhJXoiqzu0LinnNCN8sbfMVKwwQcwRmQk
         snOypnZeqQTRZ3jRuIKFBjFhVWYz3+DS63y4IlFUOx5Ya9coozvldgm5W1HYqG8dq54C
         Ug3cnkW/n399gwsLXKLfHDm1xTOH+Ve+NvHJWslRT+3yzVbpvQXTQxqu/u62o2PKBIGe
         shTtp29w1p8ig/1LBKNcf3PNRL2hExaQ1bSgcrGOZqD1Pa4kRZpf9dD7PNNm9h33HaNJ
         Pgzw==
X-Forwarded-Encrypted: i=1; AJvYcCXYDIPamTDm43AWE8M4gHNtQiAytNxswM1KZJwfcjPKCyQp0Pd32RDp2Xz1tmgbpYC1Roj2jf5Ucqo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwsdLizK8q3D59216KuuHgtHPGLM2h7obqb0+6XJGqbqBtYUvlU
	qsvPetB8TpnLH3jqm0AJA3jxa/7t0C3+xxnJjI4GZ+yJVyX0NaI6UOvBoNzRr2s=
X-Gm-Gg: ASbGncvtvuyhQMs+fOS1TVmiK49Xr5doMxQNrs2yBEsZZMFXPUPXzNd9sJDkptb7Ewf
	551HKLd7WzVM+2ToiSHKPLJ6RpZZiw3QKaUWCvmBWgXV6LXlWd+DrZxa26VNcyPUWckMb1Okn/z
	9ycuaJA34nYpWEMBk6h/froVMAWOC653Gs63gGvxnNA06zvBgI+zq5bZDi1UY4sLOmtANx0iHTo
	QHo+WN4QtoaEGRsnhLZcCtZ4BHo4MIZmfnmlGSME7VZq4IdcFY8ev1S7SDuo/U=
X-Google-Smtp-Source: AGHT+IHGm69XCRGYjxrmkM/uPXIWlpw2vZDkUeUkv3bXslpMX9FgB69SqvM4F0VgdeQCBgnUB/ldVQ==
X-Received: by 2002:a17:907:762d:b0:aa5:1d33:dc10 with SMTP id a640c23a62f3a-aa5f7f0b58bmr271443466b.45.1733257988101;
        Tue, 03 Dec 2024 12:33:08 -0800 (PST)
Message-ID: <4f2f949b-a53e-4a79-8084-d374cabc109e@citrix.com>
Date: Tue, 3 Dec 2024 20:33:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/4] xen: common: add ability to enable stack protector
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241130010954.36057-1-volodymyr_babchuk@epam.com>
 <20241130010954.36057-3-volodymyr_babchuk@epam.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241130010954.36057-3-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/11/2024 1:10 am, Volodymyr Babchuk wrote:
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 90268d9249..64fd04f805 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -213,6 +216,20 @@ config SPECULATIVE_HARDEN_LOCK
>  
>  endmenu
>  
> +menu "Compiler options"
> +
> +config STACK_PROTECTOR
> +	bool "Stack protection"

Call this "Stack Protector".  There is no point deviating from the name
most people know.

> +	depends on HAS_STACK_PROTECTOR
> +	help
> +	  Use compiler's option -fstack-protector (supported both by GCC
> +	  and Clang) to generate code that checks for corrupted stack
> +	  and halts the system in case of any problems.
> +
> +	  Please note that this option will impair performance.

This final sentence isn't interesting.  All hardening options come with
a cost, and stack protector is small compared to some we have in Xen. 
Furthermore, the audience you need to write for is the curious power
user, not a developer.

How about this:

"Enable the Stack Protector compiler hardening option.  This inserts a
canary value in the stack frame of functions, and performs an integrity
check on exit."

> diff --git a/xen/common/stack-protector.c b/xen/common/stack-protector.c
> new file mode 100644
> index 0000000000..b258590d3a
> --- /dev/null
> +++ b/xen/common/stack-protector.c
> @@ -0,0 +1,10 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <xen/lib.h>
> +#include <xen/random.h>
> +
> +unsigned long __ro_after_init __stack_chk_guard;
> +
> +void __stack_chk_fail(void)

asmlinkage.  This MISRA check is now blocking in Eclair.

> +{
> +    panic("Detected stack corruption\n");

At a bare minimum, "Stack Protector integrity violation identified in
%ps\n", __builtin_return_address(0)

It's a little awkward because ending up here means a sibling call from
the same function ended up corrupting the stack, but there's no way of
tracking down which.

> +}
> diff --git a/xen/include/xen/stack-protector.h b/xen/include/xen/stack-protector.h
> new file mode 100644
> index 0000000000..779d7cf9ec
> --- /dev/null
> +++ b/xen/include/xen/stack-protector.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef XEN__STACK_PROTECTOR_H
> +#define XEN__STACK_PROTECTOR_H
> +
> +#ifdef CONFIG_STACKPROTECTOR

This is the header needing to include random.h, or it won't compile in
isolation.

~Andrew

