Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA6A79CE8A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 12:38:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600378.936015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg0my-00032r-4X; Tue, 12 Sep 2023 10:38:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600378.936015; Tue, 12 Sep 2023 10:38:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg0my-0002zk-1T; Tue, 12 Sep 2023 10:38:36 +0000
Received: by outflank-mailman (input) for mailman id 600378;
 Tue, 12 Sep 2023 10:38:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mt1s=E4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qg0mw-0002zc-9N
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 10:38:34 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8560d773-5158-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 12:38:33 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-402cc6b8bedso61780935e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Sep 2023 03:38:33 -0700 (PDT)
Received: from [192.168.20.115] (ip-185-104-136-29.ptr.icomera.net.
 [185.104.136.29]) by smtp.gmail.com with ESMTPSA id
 y23-20020a7bcd97000000b003fee6f027c7sm15790746wmj.19.2023.09.12.03.38.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 03:38:32 -0700 (PDT)
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
X-Inumbo-ID: 8560d773-5158-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694515113; x=1695119913; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F3EtqXrry0ueazV4mCBYkQeluUr85c2GdrizbaULfGY=;
        b=EFDSoz1NPKV+n47gnDKOlWXruhDFyJqFaXyVBCqrHB/ZRSs0VObrpc4FulQi6M4lbA
         tg6zxcQSIVcNEdt5WFZjSol2gAaFYPU7GxKOn0kQtqMw5iQ44EaHW790MK8LZaIfmD4b
         HfnXdsiK/638PaUvLGVLy3IasLDm+KhTtc/CQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694515113; x=1695119913;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F3EtqXrry0ueazV4mCBYkQeluUr85c2GdrizbaULfGY=;
        b=px4/vQh7BZ6g86/uJE2xftteWUy9Vo/ozSjF+XkBYC16qZG3bHVBoDg65a5Er7f+tH
         UpY6n4GTa5hRMgiIiiUVSTx6L9fe9Zo0dxy0JEG3ByWdww/hQoJ+J0N8P5sV9pVxRiwP
         ttdBr671j3Kw9zJ81xw47HjnBvjON7KBDYvdJpr4JyOwK4vxKYN/CloP1WSDKjh1fZYZ
         wOfvPhh3UJTsKtQzTRvBKiKOT6wRWCNf6tPPh6HMa2yi3xiJUnC066AIqD5cu+Y7Hga0
         JdOeB6o/10FKkHEYBaZGgP3z+lxQE2riCjZD7A4+Te6NnK1Kxrkbom6WxiFzBFP5hINH
         +6eg==
X-Gm-Message-State: AOJu0YxKgyxeYTcieJyOP85MQe9fMIctdRSp3lrcESdt87YhOq35GBSq
	wxb3YERlNSbG3XaNjZNhEPV1UA==
X-Google-Smtp-Source: AGHT+IGWhwmIKkO3gbEzAKdxw3be8Mk0JKlzbKfELNl3bSq7PNSrPi29AZ5bT/0D+QTnvpxlIIsUGQ==
X-Received: by 2002:a7b:c84b:0:b0:401:d2cb:e6f2 with SMTP id c11-20020a7bc84b000000b00401d2cbe6f2mr9887916wml.32.1694515112752;
        Tue, 12 Sep 2023 03:38:32 -0700 (PDT)
Message-ID: <fdf87d82-aa3c-fd2e-6271-848f1a806fb2@citrix.com>
Date: Tue, 12 Sep 2023 11:38:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v2 3/5] tools: don't use distutils in configure nor
 Makefile
Content-Language: en-GB
To: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 George Dunlap <george.dunlap@cloud.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
References: <cover.1694450145.git.javi.merino@cloud.com>
 <7b3ecf211f60e0d6f7a4d146b62f9c28eff003f5.1694450145.git.javi.merino@cloud.com>
In-Reply-To: <7b3ecf211f60e0d6f7a4d146b62f9c28eff003f5.1694450145.git.javi.merino@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/09/2023 5:51 pm, Javi Merino wrote:
> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>
> Python distutils is deprecated and is going to be removed in Python
> 3.12. The distutils.sysconfig is available as sysconfig module in
> stdlib since Python 3.2, so use that directly.
>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

This breaks Py2, doesn't it?

> ---
>  m4/python_devel.m4       | 28 ++++++++++++++--------------
>  tools/libs/stat/Makefile |  4 ++--
>  2 files changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/m4/python_devel.m4 b/m4/python_devel.m4
> index bbf1e0354b..bb60857b03 100644
> --- a/m4/python_devel.m4
> +++ b/m4/python_devel.m4
> @@ -5,21 +5,21 @@ ac_previous_libs=$LIBS
>  AC_PATH_PROG([pyconfig], [$PYTHON-config], [no])
>  AS_IF([test x"$pyconfig" = x"no"], [
>      dnl For those that don't have python-config
> -    CPPFLAGS="$CFLAGS `$PYTHON -c 'import distutils.sysconfig; \
> -        print("-I" + distutils.sysconfig.get_config_var("INCLUDEPY"))'`"
> -    CPPFLAGS="$CPPFLAGS `$PYTHON -c 'import distutils.sysconfig; \
> -        print(distutils.sysconfig.get_config_var("CFLAGS"))'`"
> -    LDFLAGS="$LDFLAGS `$PYTHON -c 'import distutils.sysconfig; \
> -        print("-L" + distutils.sysconfig.get_python_lib(plat_specific=1,\
> +    CPPFLAGS="$CFLAGS `$PYTHON -c 'import sysconfig; \
> +        print("-I" + sysconfig.get_config_var("INCLUDEPY"))'`"
> +    CPPFLAGS="$CPPFLAGS `$PYTHON -c 'import sysconfig; \
> +        print(sysconfig.get_config_var("CFLAGS"))'`"
> +    LDFLAGS="$LDFLAGS `$PYTHON -c 'import sysconfig; \
> +        print("-L" + sysconfig.get_python_lib(plat_specific=1,\
>          standard_lib=1) + "/config")'`"
> -    LDFLAGS="$LDFLAGS `$PYTHON -c 'import distutils.sysconfig; \
> -        print(distutils.sysconfig.get_config_var("LINKFORSHARED"))'`"
> -    LDFLAGS="$LDFLAGS `$PYTHON -c 'import distutils.sysconfig; \
> -        print(distutils.sysconfig.get_config_var("LDFLAGS"))'`"
> -    LIBS="$LIBS `$PYTHON -c 'import distutils.sysconfig; \
> -        print(distutils.sysconfig.get_config_var("LIBS"))'`"
> -    LIBS="$LIBS `$PYTHON -c 'import distutils.sysconfig; \
> -        print(distutils.sysconfig.get_config_var("SYSLIBS"))'`"
> +    LDFLAGS="$LDFLAGS `$PYTHON -c 'import sysconfig; \
> +        print(sysconfig.get_config_var("LINKFORSHARED"))'`"
> +    LDFLAGS="$LDFLAGS `$PYTHON -c 'import sysconfig; \
> +        print(sysconfig.get_config_var("LDFLAGS"))'`"
> +    LIBS="$LIBS `$PYTHON -c 'import sysconfig; \
> +        print(sysconfig.get_config_var("LIBS"))'`"
> +    LIBS="$LIBS `$PYTHON -c 'import sysconfig; \
> +        print(sysconfig.get_config_var("SYSLIBS"))'`"

I know the code was terrible to start with, but it's absurd to fork
multiple processes just to append different fields into the same variable.

Why not have a config.py in this directory which takes
CPPFLAGS/LDFLAGS/LIBS as an input prints everything it needs.  Then you
can repeat the import trick to prefer sysconfig and fall back to
distutils if sysconfig isn't available.

~Andrew

