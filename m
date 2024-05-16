Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BE48C7550
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 13:35:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723204.1127860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ZOQ-0004Vp-7u; Thu, 16 May 2024 11:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723204.1127860; Thu, 16 May 2024 11:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ZOQ-0004Ta-52; Thu, 16 May 2024 11:35:26 +0000
Received: by outflank-mailman (input) for mailman id 723204;
 Thu, 16 May 2024 11:35:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h+4+=MT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s7ZOO-0004TU-R3
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 11:35:24 +0000
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [2607:f8b0:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 615ea7e8-1378-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 13:35:23 +0200 (CEST)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3c99c66a40fso46747b6e.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 04:35:22 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792eb161bbcsm311246885a.101.2024.05.16.04.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 04:35:19 -0700 (PDT)
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
X-Inumbo-ID: 615ea7e8-1378-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715859321; x=1716464121; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nBEBKPB35mNcVwksdSFx/MSARJZfyiJx4PSMiiGT4bQ=;
        b=n1kvDsjRe0ypxlZtiyn7WM9b7MiG3TlznbzqmhJdn2LqwI0MBwgEws9XFREifv/dxC
         pgh7o0xV36bH1l7c8kQzEPcqe83bYAi/SNToHvSv7Exh34getsKogHMpcOngVKK3hors
         uQuxrJSy/kQGr533VRsX4pnfwiaZ6QJ3+4VgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715859321; x=1716464121;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBEBKPB35mNcVwksdSFx/MSARJZfyiJx4PSMiiGT4bQ=;
        b=E/YMqBVMzb2QTpqBMs5u686ikpWqq0kv/ZUthc+pXXa4QIlSv2DT+uxC4/WXrDGnQr
         9DaCiofYGAx++981MzbHj7iJiS0HnBBeaBXWcFi3J1ChK7XrMR+gN9wm1FgEReA0oHtp
         4wNu/TMSBTs/xWfwMw62U53uTK0dbDwogpGSMmWFeZ/vMSYIAifowF0e5O0uY4TZW63n
         CkMzEf72j3x/HjdLmaRsxJ9WKC5/PtEOfLljFs+CoKtgVdv0xeyOAd7z7NFnTiICh5F2
         ilQ5JpOy2NnN4C+AulLIUur7C/W0Lz5EchV+KMPQyvsM/bM2FcN6wEyfmjqN49Kvsrop
         E5yA==
X-Gm-Message-State: AOJu0YzuriCUK6R6mVfYlYPHrq4jv4BcDYIy30HMHrq0p8dVmkbEmQb6
	7lqSMKjj9vYEqVNh63EhZr+38vXy3xw+kpmyQQsspk/V0DJOXxm8xJJLJ7dyW5c=
X-Google-Smtp-Source: AGHT+IH84BgWpR5JzLbArnHdBU75mkXFyzkcEqYUThLfhB1UruUj5XCItLsyVv82UfUYwjxTZnmq2A==
X-Received: by 2002:a05:6808:4408:b0:3c9:93f1:c7ac with SMTP id 5614622812f47-3c9970cdc49mr17668074b6e.40.1715859320262;
        Thu, 16 May 2024 04:35:20 -0700 (PDT)
Date: Thu, 16 May 2024 13:35:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: Re: [PATCH] tools: Add install/uninstall targets to
 tests/x86_emulator
Message-ID: <ZkXvdWf2mVkPW458@macbook>
References: <20240516110710.3446-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240516110710.3446-1-alejandro.vallejo@cloud.com>

On Thu, May 16, 2024 at 12:07:10PM +0100, Alejandro Vallejo wrote:
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

FWIW, should you check that HOSTCC == CC before installing?  Otherwise
I'm unsure of the result in cross-compiled builds, as the x86_emulator
is built with HOSTCC, not CC.

Thanks, Roger.

