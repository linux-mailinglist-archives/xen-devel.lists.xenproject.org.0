Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3988B33E7
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 11:26:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712598.1113390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Hq9-0003lD-3t; Fri, 26 Apr 2024 09:25:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712598.1113390; Fri, 26 Apr 2024 09:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Hq9-0003j9-1A; Fri, 26 Apr 2024 09:25:57 +0000
Received: by outflank-mailman (input) for mailman id 712598;
 Fri, 26 Apr 2024 09:25:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J3OG=L7=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1s0Hq8-0003j3-28
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 09:25:56 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb286e02-03ae-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 11:25:55 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-34be34b3296so1541067f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 02:25:54 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 x5-20020a5d6b45000000b003472489d26fsm21974894wrw.19.2024.04.26.02.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 02:25:50 -0700 (PDT)
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
X-Inumbo-ID: fb286e02-03ae-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714123554; x=1714728354; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UpuDc7zcag0/D6dYvuRGi4pgWz0ebzRcf9NiHHIglAc=;
        b=NoglMQOnxJ3MXyAJkiA+JOUHemjUzov8vmkSXzE0rlVPYLZcuWU+zfThybc9IM6ohL
         cx5WGP04D1qQk/zjsl6/UItH6Qpdtg6An7eonmMHUDIKV1u0K5iaK6lR3nr416bQh8gm
         sAxUdwTO8WpB69i8d1Iq2h/SmAsKdsMsVHwr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714123554; x=1714728354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpuDc7zcag0/D6dYvuRGi4pgWz0ebzRcf9NiHHIglAc=;
        b=ikszbJkTPRwVviT1DR64EODBCfsmAKPy5su+YxDucAwMyERA2FRX/sw5o5XEpV3KM2
         8BeTjYrvHKhZwfIxWRyKi3rgFSI6dY5EfmhdSLjcqP8pEy2cbMWJU0SZw+BzTY7OJ48l
         uBYl2uqVKmnj4tcEMC7KJPIY0Y4IpIBQyFMWaKFsjMxaXWF1CUv4gQW5w8TcURiZ9Q+s
         i+boBzDh81+Zr44fRWi8xlWALU2UhtVQ0fBtL08acTOXZ2SHiahPBO8W99ccNUIN1lVU
         A67Z8bf4A3XSmklT+y2tYmBaBNknx92qmGImHu15e2xf5yyw7Tt6r8wgfr+8s5uQnBVE
         FxwA==
X-Gm-Message-State: AOJu0Yx00Abtybpk//ry1C1u09O9YbUXPKBAXEhslRrWe59mEz4prnpR
	w9Dsugpq4idIxTpsLXH96M+XdSjTOVNNk1a2VAMrW6CI8QTAv7WNVpzX7pfgb6A=
X-Google-Smtp-Source: AGHT+IEfBZVsjntNTd5oyOOqw1EHYyXilNHuNt5lLrXfLYyTR4jPX3I5hEtXibLyPen8GY2uNRIoBg==
X-Received: by 2002:a5d:68c3:0:b0:34c:5448:7074 with SMTP id p3-20020a5d68c3000000b0034c54487074mr1314173wrw.53.1714123554013;
        Fri, 26 Apr 2024 02:25:54 -0700 (PDT)
Date: Fri, 26 Apr 2024 10:25:50 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	Edwin =?iso-8859-1?B?VPZy9ms=?= <edwin.torok@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/2] tools: Drop libsystemd as a dependency
Message-ID: <6047d346-a4e6-4bab-a0fe-b9f76b9ea143@perard>
References: <20240425173216.410940-1-andrew.cooper3@citrix.com>
 <20240425173216.410940-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425173216.410940-3-andrew.cooper3@citrix.com>

On Thu, Apr 25, 2024 at 06:32:16PM +0100, Andrew Cooper wrote:
> diff --git a/m4/systemd.m4 b/m4/systemd.m4
> index 112dc11b5e05..aa1ebe94f56c 100644
> --- a/m4/systemd.m4
> +++ b/m4/systemd.m4
> @@ -41,15 +41,6 @@ AC_DEFUN([AX_ALLOW_SYSTEMD_OPTS], [
>  ])
>  
>  AC_DEFUN([AX_CHECK_SYSTEMD_LIBS], [
> -	PKG_CHECK_MODULES([SYSTEMD], [libsystemd-daemon],,
> -		[PKG_CHECK_MODULES([SYSTEMD], [libsystemd >= 209])]
> -        )
> -	dnl pkg-config older than 0.24 does not set these for
> -	dnl PKG_CHECK_MODULES() worth also noting is that as of version 208
> -	dnl of systemd pkg-config --cflags currently yields no extra flags yet.
> -	AC_SUBST([SYSTEMD_CFLAGS])
> -	AC_SUBST([SYSTEMD_LIBS])
> -
>  	AS_IF([test "x$SYSTEMD_DIR" = x], [
>  	    dnl In order to use the line below we need to fix upstream systemd
>  	    dnl to properly ${prefix} for child variables in
> @@ -83,23 +74,11 @@ AC_DEFUN([AX_CHECK_SYSTEMD_LIBS], [
>  AC_DEFUN([AX_CHECK_SYSTEMD], [
>  	dnl Respect user override to disable
>  	AS_IF([test "x$enable_systemd" != "xno"], [
> -	     AS_IF([test "x$systemd" = "xy" ], [
> -		AC_DEFINE([HAVE_SYSTEMD], [1], [Systemd available and enabled])
> -			systemd=y
> -			AX_CHECK_SYSTEMD_LIBS()

I think you need to keep calling AX_CHECK_SYSTEMD_LIBS() here,
otherwise, nothing sets $SYSTEMD_DIR or $SYSTEMD_MODULES_LOAD.

> -	    ],[
> -		AS_IF([test "x$enable_systemd" = "xyes"],
> -			[AC_MSG_ERROR([Unable to find systemd development library])],
> -			[systemd=n])
> -	    ])
> +	systemd=y
>  	],[systemd=n])
>  ])
>  
>  AC_DEFUN([AX_CHECK_SYSTEMD_ENABLE_AVAILABLE], [
> -	PKG_CHECK_MODULES([SYSTEMD], [libsystemd-daemon], [systemd="y"],[
> -		PKG_CHECK_MODULES([SYSTEMD], [libsystemd >= 209],
> -				  [systemd="y"],[systemd="n"])
> -	])

Instead, or in addition, you could AX_AVAILABLE_SYSTEMD() in
configure.ac by AX_ENABLE_SYSTEMD(). (Or AX_ALLOW_SYSTEMD()).

With the current patch, AX_CHECK_SYSTEMD() will enable systemd
"support", even if it supposed to be disabled by default. So it's better
to use AX_ENABLE_SYSTEMD() as this will set the correct help message.

And can you add an entry in CHANGELOG? As systemd support isn't
automatically enabled with the presence of the libs anymore.

Thanks,

-- 
Anthony PERARD

