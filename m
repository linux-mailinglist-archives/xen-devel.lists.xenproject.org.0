Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9ABA136E9
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 10:46:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873390.1284356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYMSU-0000XB-Hk; Thu, 16 Jan 2025 09:46:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873390.1284356; Thu, 16 Jan 2025 09:46:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYMSU-0000V7-EZ; Thu, 16 Jan 2025 09:46:38 +0000
Received: by outflank-mailman (input) for mailman id 873390;
 Thu, 16 Jan 2025 09:46:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EPy+=UI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tYMSS-0000V1-Qw
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 09:46:36 +0000
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [2a00:1450:4864:20::644])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c601f7b3-d3ee-11ef-a0e2-8be0dac302b0;
 Thu, 16 Jan 2025 10:46:35 +0100 (CET)
Received: by mail-ej1-x644.google.com with SMTP id
 a640c23a62f3a-aafc9d75f8bso129322766b.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 01:46:35 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95af7besm896403266b.143.2025.01.16.01.46.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2025 01:46:34 -0800 (PST)
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
X-Inumbo-ID: c601f7b3-d3ee-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737020794; x=1737625594; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VIwPoNhHywa1w9kcouUWgx2Kas2F5uNyWXSuZbapdhI=;
        b=YCbGd1IIGkFF/8L68nKwyGg6lvE8DYkivVWde8MMAOL275/pf0QJqhpg3+PhrFe1Rr
         S42UG7fdlmLdZKsP6LDsZFv6X7YzoNaNZYSfQiDis0XioXQ/8eQU9k1i5UEunFD+Y737
         MGiYv/D2D5FQGX0WlRxoY6CLElnQjCumF4eNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737020794; x=1737625594;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIwPoNhHywa1w9kcouUWgx2Kas2F5uNyWXSuZbapdhI=;
        b=KEgsRavliAqZlu3kVAiGZJ0rIg1XqDibaFpytk8Ntu30DN3DIU4qUev7VHkXO5UKDn
         Bln5X+xazobIUpdgmop0LKX6aVOBemuS5SOnIiuAD5+RPKMcSYXCIqbNZTI4PByMRGPZ
         OLDg7ncqbEGjhVUXxZ4AagV0l2FxV5Y2yFWf/iOVgC4nEZ/kpWkUxDy7Dmt9vdFL58X8
         Nl+Q5PGeV29YRub4NnvmowCnBxnasmgf4t/vyoprNHV+Pl00W1V+YN+A1fVvEfcxoEiB
         v0V1X2IFfLMUlScD3GKINJ5Zb5f4jcZEXU8ZpXbWNMH3UgH4I6P+eG4ts8mMcxvFCtI4
         wzpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDAEXcTMtC8t89cIL/BQ5wP9yoVhhjpTZNbH/eg9NbjNEBJcfLXYPCUVbfhAJ7sX5dNluRVlKi3FI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+ZCLonI0gn5FlQ4V3nd9kJ1p6l3Kgw/78cLTiMJtbVN3jHvdF
	juIUOzjsseiJ9RtBso4eFJgSJYwhuayU7pduDc8+LqxellDxZJMjRZnBFHOP194=
X-Gm-Gg: ASbGnctYbe+L+UZ5fbxktaqS5+y8mHgJaCgHcrhx5q6+PCpZhZ0AhZVpzyIIp/XK+PA
	+XFWyOqufLxmJOGjG71/du+ILT9UNdKojeydLHQQexcH8CFbd44LQ0Re7V4ewucb6MhyK9AnoqH
	xeVRUArq8J/yPDVExKFd6ymklVaSkq2mgIqEtk1mTqHgOmBt0ZnU77KfAo899PeeTiz35lrAh9Q
	yL9HJdqu6C+bkYNHTs9mx212KXt+IjiQuj27qO5i2V/e6vX6p3+l3y/jratNUBBAi8nV2aigDlA
	ecDwlq6Vc0wgwJPXVw3j
X-Google-Smtp-Source: AGHT+IHBbqUIzhTFw2aIFGuf4dG458UqjTq9i9/Ui6iMvzkHiNDF6KmFGvqVLIVyhbahG0SW6d0D6A==
X-Received: by 2002:a17:907:36c8:b0:aa6:4494:e354 with SMTP id a640c23a62f3a-ab2abc92570mr3297558966b.42.1737020794373;
        Thu, 16 Jan 2025 01:46:34 -0800 (PST)
Message-ID: <7984d25d-66ac-4791-929b-a3ce037e960c@citrix.com>
Date: Thu, 16 Jan 2025 09:46:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 2/2] automation/cirrus-ci: introduce FreeBSD
 randconfig builds
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250116085852.78273-1-roger.pau@citrix.com>
 <20250116085852.78273-2-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250116085852.78273-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/01/2025 8:58 am, Roger Pau Monne wrote:
> Add a new randconfig job for each FreeBSD version.  This requires some
> rework of the template so common parts can be shared between the full and
> the randconfig builds.  Such randconfig builds are relevant because FreeBSD
> is the only tested system that has a full non-GNU toolchain.
>
> While there remove the stale `python` package install in the full build
> case: this is no longer needed if `python311` is also specified.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  .cirrus.yml | 64 +++++++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 50 insertions(+), 14 deletions(-)
>
> diff --git a/.cirrus.yml b/.cirrus.yml
> index ee80152890f2..f3ea29102cbf 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -1,11 +1,24 @@
>  # https://cirrus-ci.org/guide/tips-and-tricks/#sharing-configuration-between-tasks
> -freebsd_template: &FREEBSD_TEMPLATE
> +freebsd_13: &FREEBSD_13
> +  freebsd_instance:
> +    image_family: freebsd-13-4
> +freebsd_14: &FREEBSD_14
> +  freebsd_instance:
> +    image_family: freebsd-14-2
> +freebsd_15: &FREEBSD_15
> +  freebsd_instance:
> +    image_family: freebsd-15-0-snap
> +
> +freebsd_template: &FREEBSD_ENV
>    environment:
>      APPEND_LIB: /usr/local/lib
>      APPEND_INCLUDES: /usr/local/include
>  
> +freebsd_full_build_template: &FREEBSD_FULL_BUILD_TEMPLATE
> +  << : *FREEBSD_ENV
> +
>    install_script: pkg install -y seabios gmake ninja bash
> -                                 pkgconf python bison perl5
> +                                 pkgconf bison perl5
>                                   yajl lzo2 pixman argp-standalone
>                                   libxml2 glib git python311
>  
> @@ -15,20 +28,43 @@ freebsd_template: &FREEBSD_TEMPLATE
>      - ./configure --with-system-seabios=/usr/local/share/seabios/bios.bin
>      - gmake -j`sysctl -n hw.ncpu` clang=y
>  
> +freebsd_randconfig_template: &FREEBSD_RANDCONFIG_TEMPLATE
> +  << : *FREEBSD_ENV
> +
> +  install_script: pkg install -y gmake python bison

It's odd having python311 for the full build but only python for the
randconfig build.

IIRC, it's just for Qemu, so there is a split based on whether we build
tools or not.

What will happen when python becomes 3.12?  Does pkg have a way of
asking "I want any python as long as it's 3.11 or later" ?

Relatedly, how likely is python to transform into 3.12 in a bump to the
minor FreeBSD versions?

~Andrew

