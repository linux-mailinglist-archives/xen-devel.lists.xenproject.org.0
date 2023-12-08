Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D81A980A704
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 16:13:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650669.1016384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBcXc-0002s9-Q2; Fri, 08 Dec 2023 15:13:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650669.1016384; Fri, 08 Dec 2023 15:13:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBcXc-0002qU-Mx; Fri, 08 Dec 2023 15:13:24 +0000
Received: by outflank-mailman (input) for mailman id 650669;
 Fri, 08 Dec 2023 15:13:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z4V2=HT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rBcXb-0002qJ-GT
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 15:13:23 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 528b3e33-95dc-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 16:13:20 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40c09f4bea8so23568745e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 Dec 2023 07:13:20 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 g9-20020a5d4889000000b0033609584b9dsm1927597wrq.74.2023.12.08.07.13.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Dec 2023 07:13:18 -0800 (PST)
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
X-Inumbo-ID: 528b3e33-95dc-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702048399; x=1702653199; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ql0yT0iu4ksnsHxfeVj9hW6biAF9TBkuTmNyqFMhkzY=;
        b=veg2errvZubHrNqv5jaPXAt6qbrNhslB/RvGqqn+tXP4Guwy/tHJL8G/3CYmSl/o1J
         +Cxg0OwE2Tu0IQqAMwfqVffvIv8n9BGm+LeRu4BluDPGIn3GWhktluCMoEosfAFe5l1+
         M4MyLEzUon0zsH61otYbOyR8cvoSqoTwCfgeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702048399; x=1702653199;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ql0yT0iu4ksnsHxfeVj9hW6biAF9TBkuTmNyqFMhkzY=;
        b=Y8zRuNvliE8HOorUcwvAj1mH3w6YYzFOPytRpo1PLSDHtUyX4JGkyvFTxKdYE67j1b
         GsiCyA4UlB5Tra/nEqBMRkiiSVuI5B3agD7a6qUQX+oX0JQ6V6M8PjDbZV5tij0YAnFs
         Il9pTTnizK84pSKZhf1NWkLIY/tOfOQk7Pdfd+oFb2ajfn911QuiVoG9t3tgKEMPKAZ9
         u3DVHX5HgFi6/CKtrStG6exGtODltekVuE//3ZGex36nORV3HEBP8ma1w4RkOCZNhfiX
         y3hSJCeq2iTzp/3/TOVGeVpPoqQYfygSIYv4BAIXGlTHBL77ax9pi7qkGUQBB1kTAm2M
         Ievg==
X-Gm-Message-State: AOJu0YzxoKWY1mGn2uGfRTuiEGPmZvzql89iIgtt5iMm8NpBfaFtGaM9
	BEMeJwTvsl0L63NFvLCOKKEHmDhxGmSUhOuAa3I=
X-Google-Smtp-Source: AGHT+IFNhenJY3EwBwIxGiBXc8V2WQ4OPs5J5wmsWWHy7XsAU9DqheRUHUgT4RoHxVllPebmfBfIUQ==
X-Received: by 2002:a05:600c:4995:b0:40c:2366:2417 with SMTP id h21-20020a05600c499500b0040c23662417mr68533wmp.124.1702048399208;
        Fri, 08 Dec 2023 07:13:19 -0800 (PST)
Message-ID: <232da84f-08d0-4bec-9eca-0bef023dae37@citrix.com>
Date: Fri, 8 Dec 2023 15:13:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/pygrub: Drop compatibility symlink
Content-Language: en-GB
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>
References: <20231123163023.2158134-1-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20231123163023.2158134-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Ping.

On 23/11/2023 4:30 pm, Andrew Cooper wrote:
> This was declared deprecated in commit 10c88f1c18b7 ("tools: Install pv
> bootloaders in libexec rather than /usr/bin") in 2012
>
> Take it out fully now, 11 years later.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> ---
>  CHANGELOG.md          | 3 +++
>  tools/pygrub/Makefile | 6 ------
>  2 files changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 4ecebb9f686a..36a8ef89d8e4 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -16,6 +16,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>  ### Removed
>  - caml-stubdom.  It hasn't built since 2014, was pinned to Ocaml 4.02, and has
>    been superseded by the MirageOS/SOLO5 projects.
> +- /usr/bin/pygrub symlink.  This was deprecated in Xen 4.2 (2012) but left for
> +  compatibility reasons.  VMs configured with bootloader="/usr/bin/pygrub"
> +  should be updated to just bootloader="pygrub".
>  
>  ## [4.18.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.18.0) - 2023-11-16
>  
> diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
> index 4963bc89c6ed..d5e291ea0619 100644
> --- a/tools/pygrub/Makefile
> +++ b/tools/pygrub/Makefile
> @@ -22,15 +22,9 @@ install: all
>  	$(setup.py) install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
>  		--root="$(DESTDIR)" --force
>  	$(INSTALL_PYTHON_PROG) src/pygrub $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
> -	set -e; if [ $(bindir) != $(LIBEXEC_BIN) -a \
> -	             "`readlink -f $(DESTDIR)/$(bindir)`" != \
> -	             "`readlink -f $(LIBEXEC_BIN)`" ]; then \
> -	    ln -sf $(LIBEXEC_BIN)/pygrub $(DESTDIR)/$(bindir); \
> -	fi
>  
>  .PHONY: uninstall
>  uninstall:
> -	rm -f $(DESTDIR)/$(bindir)/pygrub
>  	if [ -e $(INSTALL_LOG) ]; then \
>  		cat $(INSTALL_LOG) | xargs -i rm -f $(DESTDIR)/{}; \
>  	fi
>
> base-commit: f96e2f64576cdbb147391c7cb399d393385719a9


