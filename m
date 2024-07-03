Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDCF9263F0
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 16:55:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753165.1161457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP1O3-00071G-D0; Wed, 03 Jul 2024 14:55:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753165.1161457; Wed, 03 Jul 2024 14:55:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP1O3-0006yu-9B; Wed, 03 Jul 2024 14:55:11 +0000
Received: by outflank-mailman (input) for mailman id 753165;
 Wed, 03 Jul 2024 14:55:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=znpO=OD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sP1O1-0006yi-Ub
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 14:55:09 +0000
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [2607:f8b0:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d4c4667-394c-11ef-bbf9-fd08da9f4363;
 Wed, 03 Jul 2024 16:55:08 +0200 (CEST)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3d55e2e0327so2868236b6e.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 07:55:08 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b59e368b6esm54851556d6.15.2024.07.03.07.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 07:55:07 -0700 (PDT)
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
X-Inumbo-ID: 3d4c4667-394c-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720018507; x=1720623307; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rGnDI6SGzWfccGnKzBf/NyaQsaVpF3wD7JkSnyudEK4=;
        b=tKeQmQQuKKno2sjSxKDMmQuyoE5u8eXd+4mDTh9Zj+4AGP1ague/TC/+FOqoYamFpP
         Rq7grZnYKV4kV7EsePpoGRJTVTCsY9rQgpbqpFf6pGUt4Y8eji/KmLBCFaE8tOEbz6KP
         Oq2afhuj7rl1HeDUUlfzh/PkpNBVNO383UBeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720018507; x=1720623307;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rGnDI6SGzWfccGnKzBf/NyaQsaVpF3wD7JkSnyudEK4=;
        b=TQxxL2fkSy6gpNVsfhEpbOUd2h0FsLYI3C734kAOX2YjwTj9hDj3V1pWqPySdqRqmr
         NbKakUYyE35dRYIxiuSL1rDoCdc/S6eubKbXSKgfchtejQq9Y2njsjFv5f+/UYjU4lZU
         ukqjp0kz3kLFhPiGaOY5vj8dPJ9vUshNyK2aNSJFaexh9BizjV5AtSmlbossc+xpQ1oU
         Uyz62maVhoUaT85Bma7QKO7i3GGAtXZF8HtWAKfuS7LIOKJ8OBmKvLedOgAP8QeiaMce
         ftlhHR6XsCPb5Dfx67FKIlwnpe/tBQGSH8cnOgCaoG4BuCPs0j1E9jLLAuFo3QeIL1bt
         5H8w==
X-Gm-Message-State: AOJu0YzBnBH/Z0eJZUAwSd0DvtHqzsKA6ei8Fyd7s31EhABkSa6eO29A
	3/FjGgy8248LRCXJkdeYy1lDNm0J87VdxElG7SQeRPz+AD90hb3OEFhlg1IH97Q=
X-Google-Smtp-Source: AGHT+IGIRgSYQWMWe0Vx/mGRYMZZxhmWzYE/SyBAgkzX97xt+AHeJ6B+4TNrhBeIsx3FRwMTfzhQBQ==
X-Received: by 2002:a05:6808:1b12:b0:3d5:6266:eb6a with SMTP id 5614622812f47-3d6b283dafbmr14659271b6e.8.1720018507378;
        Wed, 03 Jul 2024 07:55:07 -0700 (PDT)
Date: Wed, 3 Jul 2024 16:55:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19 4/4] CI: Rework the CentOS7 container
Message-ID: <ZoVmSWt9bwxDNMuF@macbook.local>
References: <20240703142002.1662874-1-andrew.cooper3@citrix.com>
 <20240703142002.1662874-5-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240703142002.1662874-5-andrew.cooper3@citrix.com>

On Wed, Jul 03, 2024 at 03:20:02PM +0100, Andrew Cooper wrote:
> CentOS 7 is fully End-of-life as of 2024-06-30, and the Yum repo configuration
> points at URLs which have become non-existent.
> 
> First, start by using a heredoc RUN for legibility.  It's important to use
> `set -e` to offset the fact that we're no longer chaining every command
> together with an &&.
> 
> Also, because we're using a single RUN command to perform all RPM operations,
> we no longer need to work around the OverlayFS bug.
> 
> Adjust the CentOS-*.repo files to point at vault.centos.org.
> 
> Take the opportunity to split the Xen deps from Tools deps, and to adjust the
> other packages we use:
> 
>  * We need bzip2-devel for the dombuilder, not just bzip2.
>  * zstd-devel is another optional dependency since the last time this package
>    list was refreshed.
>  * openssl-devel hasn't been a dependency since Xen 4.6.
>  * We long ago ceased being able to build Qemu and SeaBIOS in this container,
>    so drop their dependencies too.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roiger.pau@citrix.com>

> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  automation/build/centos/7.dockerfile | 70 +++++++++++++++-------------
>  1 file changed, 37 insertions(+), 33 deletions(-)
> 
> diff --git a/automation/build/centos/7.dockerfile b/automation/build/centos/7.dockerfile
> index 657550f308bb..9e66d72a5bd5 100644
> --- a/automation/build/centos/7.dockerfile
> +++ b/automation/build/centos/7.dockerfile
> @@ -6,44 +6,48 @@ LABEL maintainer.name="The Xen Project" \
>  RUN mkdir /build
>  WORKDIR /build
>  
> -# work around https://github.com/moby/moby/issues/10180
> -# and add EPEL for dev86
> -RUN rpm --rebuilddb && \
> -    yum -y install \
> -        yum-plugin-ovl \
> -        epel-release \
> -    && yum clean all && \
> -    rm -rf /var/cache/yum
> +RUN <<EOF
> +    set -e
> +
> +    # Fix up Yum config now that mirror.centos.org doesn't exist
> +    sed -e 's/mirror.centos.org/vault.centos.org/g' \
> +        -e 's/^#.*baseurl=https\?/baseurl=https/g' \
> +        -e 's/^mirrorlist=https\?/#mirrorlist=https/g' \

Why do you also need to uncomment baseurl and comment mirrorlist?
Isn't baseurl already enabled, and having extra mirrorlist won't harm
as it's just extra location to search for packages? (IOW: even if they
don't exist it shouldn't be an issue).

Thanks, Roger.

