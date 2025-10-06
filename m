Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABB2BBF14D
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 21:15:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138388.1474105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5qgQ-0005U4-9x; Mon, 06 Oct 2025 19:15:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138388.1474105; Mon, 06 Oct 2025 19:15:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5qgQ-0005Rc-6t; Mon, 06 Oct 2025 19:15:42 +0000
Received: by outflank-mailman (input) for mailman id 1138388;
 Mon, 06 Oct 2025 19:15:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iNYA=4P=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v5qgO-0005RW-DP
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 19:15:40 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d796633c-a2e8-11f0-9809-7dc792cee155;
 Mon, 06 Oct 2025 21:15:38 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-46e52279279so35851005e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Oct 2025 12:15:38 -0700 (PDT)
Received: from [192.168.1.183] (host-92-22-57-86.as13285.net. [92.22.57.86])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e619b8343sm272008455e9.2.2025.10.06.12.15.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 12:15:37 -0700 (PDT)
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
X-Inumbo-ID: d796633c-a2e8-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759778138; x=1760382938; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7BMck18dPJN2ugednENxj2gmtTIzkXlkwy4arTW3SXg=;
        b=sdE2GKexPotPCgZsCxCnCTFEDB8PY527g9jm0TCw4PpL6QVYjkkzOj6giECDoI1cb4
         VYZKOuPmDfl/q+TA7OQOdwQWgeubeeSNFQFaCrPQy9PvxNnGra0pFp8qIqhm2kAOOI0n
         QX83db8M33c/aI8tW3ak+3eOurc/NBTbD0hp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759778138; x=1760382938;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BMck18dPJN2ugednENxj2gmtTIzkXlkwy4arTW3SXg=;
        b=qIjLMtNYogR7PffJgYkGl5x6NbqaD6D8/WgU1pYJwD+0wJDe4IPqIKREzlJ+o0OUwN
         3YtUncZVL06Xxo5wCD7FEkr/F/AW6kZvGGg8EwmzN9HNmfGE3/DBkny6but89E/C5KWV
         N/u7g9U+Cz4qnlPJWZOG69cenBc+1I9DQdCaGu1mPisXeiF+Ug7yTvj06IqH/LYOiwZr
         aPCHHLwkGXn/5NThhAuD4YwwE80PV4LvgJaiQ1VVdm9DAdQ4Fi0Oiom2CwKCl8xellGe
         I7xqlMCGrg1GEkaGveYQI7P7sf5RzxO9YwpRXaIL0cg3NgWthtU9L7YBBa/LuTcedXJY
         mZLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2qQ7BlTHlSBrPbLcEFFJ7jggYrJVF8sRITfVyoJITi5LuAJ/GXuNwO/9/+bg56CSXYQIBLqFBfTI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx886sOGVQXJlaJWi0LRAG7tj0gGvWNS0P1snNcAFjDSkYQhqJm
	RSBV9HCMXEhwIbePPTvBZOg5p7svlgEFiMwJ+9FC1fL7nQFVM6idKxjRmQS8zwOdO+U=
X-Gm-Gg: ASbGncutMn2XqglFEZhu9R8psR/LEpeES8NqcFMABetP3UsSspYkPoX4FIAUBY5ddaY
	C6Dr3Zr0Tn89IgodpsKKJ/Rg2JAuCP21lOEIYgNJmccgO6dzPgoAzIEZcFm6E5bAMcQ7LnF3laS
	mOc2VaZACINRnG1cWLomPLW0Qj7AX6eGuLINgSmkaobalGFccCgiGCXMR8rIoiXKEWtPXQfrIDf
	ZYOKYdVmEE1/FCbfo9C+cV+K3lHWMVmPXcl8zB2vsR/zpqbN+SAx1NchLxN71yiwiuUHbOQFoZS
	rh9qQ73zHt2n66nFo9TDFJ4VsPmxWVJUcDZY13xJh3HyKMUVtkFU3e6ib5TrV9QO7urKaES+XHE
	IZTRXV54XpmmdbA5nKaPMIPPmKc9WXxbzoiRwsZzCwFnrlkAQH62DIKXVatDRyQYZnp4fNhyQgZ
	WmdepAKlW75SvT9VRGyVFTPLA=
X-Google-Smtp-Source: AGHT+IHjWGpYxXxiOaKE6vMtTAz8YjTGbQbHIKm9kCDnnCYpGIZ9PjL6fxeRni7FOu+JKrqcKFmtWw==
X-Received: by 2002:a05:600c:6094:b0:46e:39e1:fc3c with SMTP id 5b1f17b1804b1-46e710fff73mr102994665e9.5.1759778137634;
        Mon, 06 Oct 2025 12:15:37 -0700 (PDT)
Message-ID: <258f5150-59b5-4371-b18b-26ed33ffd0fa@citrix.com>
Date: Mon, 6 Oct 2025 20:15:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 1/2] cirrus-ci: install libinotify for FreeBSD
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20251006190757.72757-1-roger.pau@citrix.com>
 <20251006190757.72757-2-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20251006190757.72757-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/10/2025 8:07 pm, Roger Pau Monne wrote:
> FreeBSD QEMU build requires libinotify, otherwise the build fails with:
>
> ./qemu-xen-dir-remote/meson.build:2535:15: ERROR: C shared or static library 'inotify' not found
>
> Install the package and add the /usr/local include and libs paths
> explicitly as QEMU configure options.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
>  .cirrus.yml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/.cirrus.yml b/.cirrus.yml
> index f295c8cb0a02..55dc9b39092a 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -11,6 +11,8 @@ freebsd_template: &FREEBSD_ENV
>    environment:
>      APPEND_LIB: /usr/local/lib
>      APPEND_INCLUDES: /usr/local/include
> +    CONFIG_QEMUU_EXTRA_ARGS: --extra-ldflags=-L${APPEND_LIB}
> +                             --extra-cflags=-I${APPEND_INCLUDES}
>      CIRRUS_CLONE_DEPTH: 1
>      CIRRUS_LOG_TIMESTAMP: true
>  
> @@ -51,11 +53,12 @@ task:
>    install_script: pkg install -y seabios gmake ninja bash
>                                   pkgconf bison perl5
>                                   yajl lzo2 pixman argp-standalone
> -                                 libxml2 glib git python3
> +                                 libxml2 glib git python3 libinotify

I presume this is good on FreeBSD 13 and later ?

>  
>    configure_script:
>      - cc --version
>      - ./configure --with-system-seabios=/usr/local/share/seabios/bios.bin
> +                  --with-extra-qemuu-configure-args="--extra-ldflags=-L${APPEND_LIB} --extra-cflags=-I${APPEND_INCLUDES}"
>      - gmake -j`sysctl -n hw.ncpu` -C xen clang=y defconfig
>  
>    << : *FREEBSD_CONFIGURE_ARTIFACTS

Do we really need both the ENV variable and the --configure parts?

I could believe we need both, but that also feels like something we
ought to fix.

~Andrew

