Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C27493930E
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 19:17:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762283.1172429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVweg-00052J-G4; Mon, 22 Jul 2024 17:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762283.1172429; Mon, 22 Jul 2024 17:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVweg-0004z8-D3; Mon, 22 Jul 2024 17:16:58 +0000
Received: by outflank-mailman (input) for mailman id 762283;
 Mon, 22 Jul 2024 17:16:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QQNa=OW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sVwee-0004xq-PX
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 17:16:56 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 314cffac-484e-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 19:16:54 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a77b550128dso471459966b.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 10:16:54 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c785d4esm444252866b.31.2024.07.22.10.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 10:16:53 -0700 (PDT)
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
X-Inumbo-ID: 314cffac-484e-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721668614; x=1722273414; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2vnbpmEWp6ptBNgiiYYoA+qqGXGQfN/jSRUKWK8YTys=;
        b=EMJseyJbc5OW0VJjGnEFSQHu0hH99Yg299WSyxETq1W2LhumIG7jsuHv010mmffoaa
         OH0Sf0SV3fenYCW0x6ht2eLc4LwWW46Ke1cGLYF8FG0swqH2R+eCEIWcgzQr0UbMtUPp
         lG3LSPiF4KT2irj7CL2g9hNE5VrDpMM48wVcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721668614; x=1722273414;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vnbpmEWp6ptBNgiiYYoA+qqGXGQfN/jSRUKWK8YTys=;
        b=qYn4aTCVMDUPhYFR0niXfINPWoakx11B60kw8ZqhQyt8P1Jb1um7hD7RDd79L0sRb5
         ssjCFmbz6dMmfsz3KQuEVeFcCYmbCVuB/AWLYWRHtDMbdFaWufknJ2F1JKoyWwvy8HPM
         K/szBylf6wdOjSsPp+RYFbw0aTz1npsx8jzuFsIZOzQOml/G0qWzPfyCM7aKQlFDIhTN
         9FBUlO38zouTm1N7X6zYZhkOH8uAstQ/LnHt9g40uawPLuJ0KqrWGmzfw0LMX5ZQIxXd
         hhMG5dgHUNKOeF0jkuXZVj6r9UbtORT+gloLoiRWetW/OPBC19r7pjlJhZmw4Sd//491
         8lDg==
X-Forwarded-Encrypted: i=1; AJvYcCXzvJmUXlpGMb+4nTVLmbgCjkLORStAIfjU+6EQPJ1DTGoL89M2q7+i9SjJDTvAEXfTfQLYFXjyfD9z9BzgwfY29edoDQkATSDrT39B39I=
X-Gm-Message-State: AOJu0YzlFfVUpLnh2GPARRsBMeEXEdCL+KDVecnaosrgDWyVQctw23O4
	9io5XrQCXZT0fdxgkWEuBWPC0/eW7loKgR9ZAkxcvGJoPgBYtZNZsSpG2TBwPW8=
X-Google-Smtp-Source: AGHT+IGL2/wvuJFo7V3v9rek7vlLg2f3dYb2ZwwlkhRwMreMgqFtsioKR/aw+D4QpEoEX/ifhFDubQ==
X-Received: by 2002:a17:907:3ea1:b0:a75:2495:a6a3 with SMTP id a640c23a62f3a-a7a4c584107mr561882466b.67.1721668613896;
        Mon, 22 Jul 2024 10:16:53 -0700 (PDT)
Message-ID: <0a640ce6-fd10-45e5-af98-3a0f92cb6850@citrix.com>
Date: Mon, 22 Jul 2024 18:16:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CI: workaround broken selinux+docker interaction in yocto
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240720001508.1673856-1-marmarek@invisiblethingslab.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240720001508.1673856-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/07/2024 1:15 am, Marek Marczykowski-Górecki wrote:
> `cp --preserve=xattr` doesn't work in docker when SELinux is enabled. It
> tries to set the "security.selinux" xattr, but SELinux (or overlay fs?)
> denies it.
> Workaround it by skipping selinux.selinux xattr copying.
>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> Tested here:
> https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/7386198058
>
> But since yocto container fails to build, it isn't exactly easy to apply
> this patch...
> "kirkstone" branch of meta-virtualization seems to target Xen 4.15 and
> 4.16, so it isn't exactly surprising it fails to build with 4.19.

Why is the external version of Xen relevant to rebuilding the container ?

Or is it that kirkstone has updated since the container was last built?

I'm not familiar with yocto, and a quick glance at the docs haven't
helped...

~Andrew

>
> I tried also bumping yocto version to scarthgap (which supposedly should
> have updated pygrub patch), but that fails to build for me too, with a
> different error:
>
>     ERROR: Layer 'filesystems-layer' depends on layer 'networking-layer', but this layer is not enabled in your configuration
>     ERROR: Parse failure with the specified layer added, exiting.
>     ...
>     ERROR: Nothing PROVIDES 'xen-image-minimal'. Close matches:
>       core-image-minimal
>       core-image-minimal-dev
>     Parsing of 2472 .bb files complete (0 cached, 2472 parsed). 4309 targets, 101 skipped, 0 masked, 0 errors.
> ---
>  automation/build/yocto/yocto.dockerfile.in | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/automation/build/yocto/yocto.dockerfile.in b/automation/build/yocto/yocto.dockerfile.in
> index fbaa4e191caa..600db7bf4d19 100644
> --- a/automation/build/yocto/yocto.dockerfile.in
> +++ b/automation/build/yocto/yocto.dockerfile.in
> @@ -68,6 +68,10 @@ RUN locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 \
>  ENV LANG en_US.UTF-8
>  ENV LC_ALL en_US.UTF-8
>  
> +# Workaround `cp --preserve=xattr` not working in docker when SELinux is
> +# enabled
> +RUN echo "security.selinux skip" >> /etc/xattr.conf
> +
>  # Create a user for the build (we don't want to build as root).
>  ENV USER_NAME docker-build
>  ARG host_uid=1000


