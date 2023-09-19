Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 413207A5A07
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 08:37:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604395.941753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiUM8-0006v7-09; Tue, 19 Sep 2023 06:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604395.941753; Tue, 19 Sep 2023 06:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiUM7-0006qa-St; Tue, 19 Sep 2023 06:37:07 +0000
Received: by outflank-mailman (input) for mailman id 604395;
 Tue, 19 Sep 2023 06:37:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=72lO=FD=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qiUM6-0006qU-Fx
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 06:37:06 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2a67161-56b6-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 08:37:05 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-403004a96eeso56388285e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Sep 2023 23:37:05 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (cpc92302-cmbg19-2-0-cust781.5-4.cable.virginm.net. [82.1.211.14])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a5d568d000000b0031fd849e797sm14441453wrv.105.2023.09.18.23.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 23:37:04 -0700 (PDT)
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
X-Inumbo-ID: f2a67161-56b6-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1695105424; x=1695710224; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YmV6sdTaKR0TrFgSc5YWSd0XWZ7cK6cdDHoIHYLMZ0s=;
        b=GwBl/G8bYeM127EjPElLTp0bLPlplp12/tmm9lOh1EeV43FbCtVXCGJ8Nho8PRVZN9
         u3pTsO8gYebRAj7ACrJWqEJeB61QOC6lsHCl3Sc04DS0VTEAOj4UKNNHMacNoCLjDAd+
         1m2MTDB56CINk/lK3+CtC6B2ahkQEOZGyIYJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695105424; x=1695710224;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YmV6sdTaKR0TrFgSc5YWSd0XWZ7cK6cdDHoIHYLMZ0s=;
        b=s4VHhFRH85NahnOGK2uWEi12tbLn5Kbu4xkwLaANkutoITo12sRL5oDGU0kARonsMZ
         WgkW1akM/+EajduXDR+9KiZQRD34g68ArT7lYVhOKnsqkj+UTkjdKW4vQqlk4/7hS4ND
         X14/ObrjHVBi6ciBgGL3UTcod6FvqdJwTiUu/JDQVDanVue2yG8xj7g00beg1UZRlJd5
         UEMi9AxKkDNxQWT1yBDFhU/yCq/OJcn8zdUpP6o5HWMidJI8rCyPVsO6AqLqX52NmLFi
         MocYkGpn2Duyljep5Eyz2n4DfN+gZbxyQQUb5iVd9xOBK+IhotMDnhqDz9pFGY/2NwKl
         JbwQ==
X-Gm-Message-State: AOJu0YyOxGzqFGKfEKUgkt/dao6Qmmz9/0mI3aSFFKMIALq6JdlE5RQ9
	Gr9NUrrIp5UqLslUFVTtIs97rGk0kfWbUXsCu3A=
X-Google-Smtp-Source: AGHT+IE6WPzFgMdAGhyBneLdsYA+QQnJc94Iv2T+2hi6sOcNO6IiKEK/QImU89luROIRIqy2waYA+Q==
X-Received: by 2002:a05:600c:2218:b0:401:be5a:989 with SMTP id z24-20020a05600c221800b00401be5a0989mr9033357wml.23.1695105424616;
        Mon, 18 Sep 2023 23:37:04 -0700 (PDT)
Date: Tue, 19 Sep 2023 07:37:02 +0100
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: 
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH v3 3/4] tools: don't use distutils in configure nor
 Makefile
Message-ID: <sdso5zzhr5ydrydyr6j4hey6ge7ilwu4vntcwjrpy3sd34mz7l@q7tfs53u2kkx>
References: <cover.1695104399.git.javi.merino@cloud.com>
 <9647bf6e5ae1f06ed95db3f9bd67920dfb6b613b.1695104399.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9647bf6e5ae1f06ed95db3f9bd67920dfb6b613b.1695104399.git.javi.merino@cloud.com>

On Tue, Sep 19, 2023 at 07:30:28AM +0100, Javi Merino wrote:
> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Python distutils is deprecated and is going to be removed in Python
> 3.12.  distutils.sysconfig is available as the sysconfig module in
> stdlib since Python 2.7 and Python 3.2, so use that directly.
> 
> Update the README to reflect that we now depend on Python 2.7.
> 
> Regenerate configure after the m4/python_devel.m4 change.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Javi Merino <javi.merino@cloud.com>
> ---
>  README                   |  4 ++--
>  m4/python_devel.m4       | 28 +++++++++++-----------
>  tools/configure          | 52 ++++++++++++++++------------------------
>  tools/libs/stat/Makefile |  4 ++--
>  4 files changed, 38 insertions(+), 50 deletions(-)
> 

[...]

> diff --git a/tools/configure b/tools/configure
> index 96218cadc4..ae10f6cecd 100755
> --- a/tools/configure
> +++ b/tools/configure
> @@ -774,7 +774,6 @@ infodir
>  docdir
>  oldincludedir
>  includedir
> -runstatedir
>  localstatedir
>  sharedstatedir
>  sysconfdir
> @@ -905,7 +904,6 @@ datadir='${datarootdir}'
>  sysconfdir='${prefix}/etc'
>  sharedstatedir='${prefix}/com'
>  localstatedir='${prefix}/var'
> -runstatedir='${localstatedir}/run'
>  includedir='${prefix}/include'
>  oldincludedir='/usr/include'
>  docdir='${datarootdir}/doc/${PACKAGE_TARNAME}'
> @@ -1158,15 +1156,6 @@ do
>    | -silent | --silent | --silen | --sile | --sil)
>      silent=yes ;;
>  
> -  -runstatedir | --runstatedir | --runstatedi | --runstated \
> -  | --runstate | --runstat | --runsta | --runst | --runs \
> -  | --run | --ru | --r)
> -    ac_prev=runstatedir ;;
> -  -runstatedir=* | --runstatedir=* | --runstatedi=* | --runstated=* \
> -  | --runstate=* | --runstat=* | --runsta=* | --runst=* | --runs=* \
> -  | --run=* | --ru=* | --r=*)
> -    runstatedir=$ac_optarg ;;
> -
>    -sbindir | --sbindir | --sbindi | --sbind | --sbin | --sbi | --sb)
>      ac_prev=sbindir ;;
>    -sbindir=* | --sbindir=* | --sbindi=* | --sbind=* | --sbin=* \
> @@ -1304,7 +1293,7 @@ fi
>  for ac_var in	exec_prefix prefix bindir sbindir libexecdir datarootdir \
>  		datadir sysconfdir sharedstatedir localstatedir includedir \
>  		oldincludedir docdir infodir htmldir dvidir pdfdir psdir \
> -		libdir localedir mandir runstatedir
> +		libdir localedir mandir
>  do
>    eval ac_val=\$$ac_var
>    # Remove trailing slashes.
> @@ -1457,7 +1446,6 @@ Fine tuning of the installation directories:
>    --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
>    --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
>    --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
> -  --runstatedir=DIR       modifiable per-process data [LOCALSTATEDIR/run]
>    --libdir=DIR            object code libraries [EPREFIX/lib]
>    --includedir=DIR        C header files [PREFIX/include]
>    --oldincludedir=DIR     C header files for non-gcc [/usr/include]
> @@ -3397,7 +3385,7 @@ else
>      We can't simply define LARGE_OFF_T to be 9223372036854775807,
>      since some C++ compilers masquerading as C compilers
>      incorrectly reject 9223372036854775807.  */
> -#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
> +#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
>    int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
>  		       && LARGE_OFF_T % 2147483647 == 1)
>  		      ? 1 : -1];
> @@ -3443,7 +3431,7 @@ else
>      We can't simply define LARGE_OFF_T to be 9223372036854775807,
>      since some C++ compilers masquerading as C compilers
>      incorrectly reject 9223372036854775807.  */
> -#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
> +#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
>    int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
>  		       && LARGE_OFF_T % 2147483647 == 1)
>  		      ? 1 : -1];
> @@ -3467,7 +3455,7 @@ rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
>      We can't simply define LARGE_OFF_T to be 9223372036854775807,
>      since some C++ compilers masquerading as C compilers
>      incorrectly reject 9223372036854775807.  */
> -#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
> +#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
>    int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
>  		       && LARGE_OFF_T % 2147483647 == 1)
>  		      ? 1 : -1];
> @@ -3512,7 +3500,7 @@ else
>      We can't simply define LARGE_OFF_T to be 9223372036854775807,
>      since some C++ compilers masquerading as C compilers
>      incorrectly reject 9223372036854775807.  */
> -#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
> +#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
>    int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
>  		       && LARGE_OFF_T % 2147483647 == 1)
>  		      ? 1 : -1];
> @@ -3536,7 +3524,7 @@ rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
>      We can't simply define LARGE_OFF_T to be 9223372036854775807,
>      since some C++ compilers masquerading as C compilers
>      incorrectly reject 9223372036854775807.  */
> -#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
> +#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
>    int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
>  		       && LARGE_OFF_T % 2147483647 == 1)
>  		      ? 1 : -1];

My copy of autoconf 2.69 generated these hunks that are not related to
the changes in this patch.  I have decided to keep the output of
autoconf untouched for the patch, but I'm happy to remove them if
it is unwanted noise.

> @@ -7852,21 +7840,21 @@ fi
>  
>  if test x"$pyconfig" = x"no"; then :
>  
> -        CPPFLAGS="$CFLAGS `$PYTHON -c 'import distutils.sysconfig; \
> -        print("-I" + distutils.sysconfig.get_config_var("INCLUDEPY"))'`"
> -    CPPFLAGS="$CPPFLAGS `$PYTHON -c 'import distutils.sysconfig; \
> -        print(distutils.sysconfig.get_config_var("CFLAGS"))'`"
> -    LDFLAGS="$LDFLAGS `$PYTHON -c 'import distutils.sysconfig; \
> -        print("-L" + distutils.sysconfig.get_python_lib(plat_specific=1,\
> +        CPPFLAGS="$CFLAGS `$PYTHON -c 'import sysconfig; \
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
>  
>  else
>  

Cheers,
Javi

