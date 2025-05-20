Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 817E6ABE564
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 23:02:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991171.1375078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHU6F-0001jJ-4z; Tue, 20 May 2025 21:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991171.1375078; Tue, 20 May 2025 21:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHU6F-0001gC-1a; Tue, 20 May 2025 21:02:11 +0000
Received: by outflank-mailman (input) for mailman id 991171;
 Tue, 20 May 2025 21:02:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BmRr=YE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uHU6D-0001fn-Si
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 21:02:09 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0b9f1dd-35bd-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 23:02:08 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a35c894313so3811294f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 14:02:08 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca5a892sm17187164f8f.24.2025.05.20.14.02.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 14:02:06 -0700 (PDT)
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
X-Inumbo-ID: b0b9f1dd-35bd-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747774927; x=1748379727; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bKrzXzo8HG+/E0Y6LVc9S8OCNl/Zfeqv+vR2YpFSpzo=;
        b=GiTco9uJTS+CDccGwN9nTS3yM5r+K4eMlQUyjp+gfOgLs7ZL9NHO0DrfP0VcYG8+8h
         vd8xsNC360YYoJQWFjrxPK+rRW418R0kM6x5mMj3EMeyAl8OQ0yTA8b96BSZJ+9PqpFP
         P3BdRFn0frUZ5gxvHanu3n6Sh06qorpqmMULc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747774927; x=1748379727;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKrzXzo8HG+/E0Y6LVc9S8OCNl/Zfeqv+vR2YpFSpzo=;
        b=Wi0Jy5+aESRmTr/btiBofhA+4In8bKToVCreeBE4siEpBWKiTeKEHTJ4h41Dvyg0uq
         2FtUSVNkFooM2Zey/BI8fSYB4E7A4RLMdVscISeetSHI8aui4t3kVAuuVMffA4guD01k
         NTblDRJlIoBBZ5OGMXAIGQ8OThq3o/SgXm/aMtaeLYmpukIdXG7A8vWVMmCWaaVyQqT+
         V0i+R4qh63l9fYnQHsSGpZePpGZjEpGQRJsJMon9MeQbcLiRE+Iwli8mq47eXHKRY3Kn
         Q5AcLYDTk9JjqbVqR76K8C7Wc9SJ7DlD9hHHNHve7tOzr0a80V/SzWiCUPcgeTbQLXy9
         lihw==
X-Gm-Message-State: AOJu0YywGbatqfzWGuZzqPtKqVc6xFCowkqF3aHgizEhHHOYBxTjibDw
	bmFtVSpBVWgZUexdsnjzAwTrRYwAlDmOIZV/WgABSwlgnv2PHJXJNZI/bAzYOTzP6uHzjlNNwXw
	KTp+Z
X-Gm-Gg: ASbGncvvTYI7hVn6vkxkA9hSYT3sh7iz+AgVkTnH1+eU/zBMsrfhQ8rHUtYEuw4H6fF
	ZL+NoECfC7zPmRLtzQDGp1G/Oepp167ffh28gF48JKMBKMvy7bfAFaGlm8g2kk0iyui8Mal+sWT
	vz9IV2gIHHdT4y1KIgpvjdswpLVrUUJjar1ULM7vk1YofXizZEjMgL9Bs6BFM0mqIkuiiBw6Y1A
	QyhVJ6e0+AGspyhOZ2J99bPssczbfmDdZZHfiBPpF+UElxuF750afgLDPRxOXIIsolMjg+YBM/a
	Ko+ZuGcGnFneko0BkBKtiNaHlKNrkAAMLEnhGgYQFisemObgZwdmgQojq57X/KtD2K+vZk4vhX5
	PkgeJ8qPACtAE32Tg
X-Google-Smtp-Source: AGHT+IFWZoOeDbSv9U8x3wlaEWeVvlD0PEwg+/g5fLbDDIdBmcj4AuaFLFIMx2pD2JcctP2YtpkrNw==
X-Received: by 2002:a5d:5889:0:b0:3a3:7096:a217 with SMTP id ffacd0b85a97d-3a37096a495mr7201569f8f.17.1747774927203;
        Tue, 20 May 2025 14:02:07 -0700 (PDT)
Message-ID: <724b77b5-3b78-436e-bd20-726c34bef03b@citrix.com>
Date: Tue, 20 May 2025 22:02:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools: Add install/uninstall targets to
 tests/x86_emulator
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony@xenproject.org>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240516110710.3446-1-alejandro.vallejo@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240516110710.3446-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/05/2024 12:07 pm, Alejandro Vallejo wrote:
> Bring test_x86_emulator in line with other tests by adding
> install/uninstall rules.
>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>  tools/tests/x86_emulator/Makefile | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/tools/tests/x86_emulator/Makefile b/tools/tests/x86_emulator/Makefile
> index 834b2112e7fe..30edf7e0185d 100644
> --- a/tools/tests/x86_emulator/Makefile
> +++ b/tools/tests/x86_emulator/Makefile
> @@ -269,8 +269,15 @@ clean:
>  .PHONY: distclean
>  distclean: clean
>  
> -.PHONY: install uninstall
> -install uninstall:
> +.PHONY: install
> +install: all
> +	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
> +	$(if $(TARGET-y),$(INSTALL_PROG) $(TARGET-y) $(DESTDIR)$(LIBEXEC_BIN))
> +
> +.PHONY: uninstall
> +uninstall:
> +	$(RM) -- $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/,$(TARGET-y))
> +
>  
>  .PHONY: run32 clean32
>  ifeq ($(XEN_COMPILE_ARCH),x86_64)

[starting a clean thread]

x86_emulator is not special enough to behave differently to the rest of
tools/.

Theoretical concerns over cross compiling test_x86_emulator for non-x86
can be fixed by whomever first wants to do this.

The very real problem is that this doesn't run in x86 CI, because and
only because it doesn't have an install target.

~Andrew

