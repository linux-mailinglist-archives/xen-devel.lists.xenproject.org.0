Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FD11D91E9
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 10:17:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaxRE-0003Jm-1n; Tue, 19 May 2020 08:17:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IbQz=7B=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jaxRB-0003Je-Rv
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 08:17:21 +0000
X-Inumbo-ID: 2924948a-99a9-11ea-b07b-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2924948a-99a9-11ea-b07b-bc764e2007e4;
 Tue, 19 May 2020 08:17:21 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id i15so14746800wrx.10
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2020 01:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rPvsYD8u9NYxPAtjlCpCo+A9TeCrz0m4y0nIF0xzGoY=;
 b=f90jlETaMAK37uZJSvfVQh5BjieUZ2saCm7ExFdhoiZrUj104p4V8QLlW/2l0fcd53
 +li26pWKTB0RCTFjTfKOG0NZOKkkMdwupigYcgmyN/sWdvn4QfrjUmtq4ZCp1Gu2X2eK
 D4AJcvV7u/CSGxVozA+zo20dpDvGWzXmbHwnIJQ+YegIJNj6vymyfKiwSkhCZBwjmH4J
 OmHEWIZQo19YhgxwBw1v3nZ/uCrCOfSVOyMDRM7O1XGSBOGnAqbq2NxXHk+reXlHNvhn
 YyNKDBnjZdsxwiNz+w8coz9Zzb4JY83v7YAgPvWd45YhiUUFKetKFdrBwhSf6R4NgHDd
 6ThA==
X-Gm-Message-State: AOAM532eNXdKnqR076bFiDD35DYaBzttQ00K3A3iDPP2iX1mQTNuJGDk
 C/fMT32obM0jfbrvXv9kwmY=
X-Google-Smtp-Source: ABdhPJxzNTIywS28ZPLHd20SnUo68SfhSE+H31hG8Z1rBke1hX1NpKT0ILUz8d4ye6S1VjnedsbKCQ==
X-Received: by 2002:adf:e783:: with SMTP id n3mr23864842wrm.157.1589876240380; 
 Tue, 19 May 2020 01:17:20 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id b7sm2784796wmj.29.2020.05.19.01.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 01:17:19 -0700 (PDT)
Date: Tue, 19 May 2020 08:17:18 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v10 10/12] tools/libxl: use libxenhypfs for setting xen
 runtime parameters
Message-ID: <20200519081718.tkp7rsd3fseqmyzv@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20200519072106.26894-1-jgross@suse.com>
 <20200519072106.26894-11-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519072106.26894-11-jgross@suse.com>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 19, 2020 at 09:21:04AM +0200, Juergen Gross wrote:
> Instead of xc_set_parameters() use xenhypfs_write() for setting
> parameters of the hypervisor.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V6:
> - new patch
> ---
>  tools/Rules.mk               |  2 +-
>  tools/libxl/Makefile         |  3 +-
>  tools/libxl/libxl.c          | 53 ++++++++++++++++++++++++++++++++----
>  tools/libxl/libxl_internal.h |  1 +
>  tools/libxl/xenlight.pc.in   |  2 +-
>  tools/xl/xl_misc.c           |  1 -
>  6 files changed, 52 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/Rules.mk b/tools/Rules.mk
> index ad6073fcad..883a193f9e 100644
> --- a/tools/Rules.mk
> +++ b/tools/Rules.mk
> @@ -178,7 +178,7 @@ CFLAGS += -O2 -fomit-frame-pointer
>  endif
>  
>  CFLAGS_libxenlight = -I$(XEN_XENLIGHT) $(CFLAGS_libxenctrl) $(CFLAGS_xeninclude)
> -SHDEPS_libxenlight = $(SHLIB_libxenctrl) $(SHLIB_libxenstore)
> +SHDEPS_libxenlight = $(SHLIB_libxenctrl) $(SHLIB_libxenstore) $(SHLIB_libxenhypfs)
>  LDLIBS_libxenlight = $(SHDEPS_libxenlight) $(XEN_XENLIGHT)/libxenlight$(libextension)
>  SHLIB_libxenlight  = $(SHDEPS_libxenlight) -Wl,-rpath-link=$(XEN_XENLIGHT)
>  
> diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
> index 69fcf21577..a89ebab0b4 100644
> --- a/tools/libxl/Makefile
> +++ b/tools/libxl/Makefile
> @@ -20,7 +20,7 @@ LIBUUID_LIBS += -luuid
>  endif
>  
>  LIBXL_LIBS =
> -LIBXL_LIBS = $(LDLIBS_libxentoollog) $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxenstore) $(LDLIBS_libxentoolcore) $(PTYFUNCS_LIBS) $(LIBUUID_LIBS)
> +LIBXL_LIBS = $(LDLIBS_libxentoollog) $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxenhypfs) $(LDLIBS_libxenstore) $(LDLIBS_libxentoolcore) $(PTYFUNCS_LIBS) $(LIBUUID_LIBS)
>  ifeq ($(CONFIG_LIBNL),y)
>  LIBXL_LIBS += $(LIBNL3_LIBS)
>  endif
> @@ -33,6 +33,7 @@ CFLAGS_LIBXL += $(CFLAGS_libxentoolcore)
>  CFLAGS_LIBXL += $(CFLAGS_libxenevtchn)
>  CFLAGS_LIBXL += $(CFLAGS_libxenctrl)
>  CFLAGS_LIBXL += $(CFLAGS_libxenguest)
> +CFLAGS_LIBXL += $(CFLAGS_libxenhypfs)
>  CFLAGS_LIBXL += $(CFLAGS_libxenstore)
>  ifeq ($(CONFIG_LIBNL),y)
>  CFLAGS_LIBXL += $(LIBNL3_CFLAGS)
> diff --git a/tools/libxl/libxl.c b/tools/libxl/libxl.c
> index f60fd3e4fd..621acc88f3 100644
> --- a/tools/libxl/libxl.c
> +++ b/tools/libxl/libxl.c
> @@ -663,15 +663,56 @@ int libxl_set_parameters(libxl_ctx *ctx, char *params)
>  {
>      int ret;
>      GC_INIT(ctx);
> +    char *par, *val, *end, *path;
> +    xenhypfs_handle *hypfs;
>  
> -    ret = xc_set_parameters(ctx->xch, params);
> -    if (ret < 0) {
> -        LOGEV(ERROR, ret, "setting parameters");
> -        GC_FREE;
> -        return ERROR_FAIL;
> +    hypfs = xenhypfs_open(ctx->lg, 0);
> +    if (!hypfs) {
> +        LOGE(ERROR, "opening Xen hypfs");
> +        ret = ERROR_FAIL;
> +        goto out;
>      }
> +
> +    while (isblank(*params))
> +        params++;
> +
> +    for (par = params; *par; par = end) {
> +        end = strchr(par, ' ');
> +        if (!end)
> +            end = par + strlen(par);
> +
> +        val = strchr(par, '=');
> +        if (val > end)
> +            val = NULL;
> +        if (!val && !strncmp(par, "no", 2)) {
> +            path = libxl__sprintf(gc, "/params/%s", par + 2);
> +            path[end - par - 2 + 8] = 0;
> +            val = "no";
> +            par += 2;
> +        } else {
> +            path = libxl__sprintf(gc, "/params/%s", par);
> +            path[val - par + 8] = 0;
> +            val = libxl__strndup(gc, val + 1, end - val - 1);
> +        }
> +
> +	LOG(DEBUG, "setting node \"%s\" to value \"%s\"", path, val);

Indentation is wrong, but this can be fixed upon committing.

I would very much like the parsing be moved to libxlu. That can wait
till another day.

Acked-by: Wei Liu <wl@xen.org>

