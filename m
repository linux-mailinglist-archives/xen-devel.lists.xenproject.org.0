Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B8123BC29
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 16:30:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2xwc-00055t-2o; Tue, 04 Aug 2020 14:29:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3j1i=BO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1k2xwa-00055o-Nm
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 14:29:32 +0000
X-Inumbo-ID: 1cafba08-b793-41f6-aaca-1a48390beab4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1cafba08-b793-41f6-aaca-1a48390beab4;
 Tue, 04 Aug 2020 14:29:31 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id a5so27647740wrm.6
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2020 07:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=mYMQB7mHofMy/iv+wAwdLHYSBZ2zh1IlGeawKmZRVq8=;
 b=C44aj/r7XOyUYbks6ByBNfpY77hXeaCraU/oMYVwmVElTc97s4FmsDAnUI7xs+21nX
 zmGipLu720ln5PBTeSdkbP9+7xol0EwC2IgNGpHbdGb6g/SiPPRExwK0Qex5/znF9YDn
 1k0ljaAFLyQhmqDPWXv1v60LqOe8PZZKstZIOJHFWLEHx9TFye61+Ami+JfwJiNLDxV1
 PykC9T/JQrzYlqczaDTI2UWj7bWaFKxuC4FfJuDKt7LUNpiuKs6qvLNGlOTLNUULsFf+
 jaljiwMQ4EPifKLuNMJMuC410ygoy1XGlqEImKNtinr3N5nc5WRaBYNqag0JR4TmfCPm
 hbtA==
X-Gm-Message-State: AOAM5330EXkHif8TM0JcHC0g/CMoQJ/vBR8N/sUmY6fFtFi9IxNCmC/q
 JZzvkHHIm7f8btRX4ZKimvU=
X-Google-Smtp-Source: ABdhPJxP5BFIi+jzViOmDltZ0TpM950BHhYSUJof95hSw+vr1joSQ3PCJt4vRbeLChM6hH4ntSuK0Q==
X-Received: by 2002:adf:b1cf:: with SMTP id r15mr21255479wra.118.1596551371130; 
 Tue, 04 Aug 2020 07:29:31 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id 111sm31265608wrc.53.2020.08.04.07.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 07:29:29 -0700 (PDT)
Date: Tue, 4 Aug 2020 14:29:28 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/5] tools/foreignmem: Support querying the size of a
 resource
Message-ID: <20200804142928.z6rpby4zydzu5jqn@liuwe-devbox-debian-v2>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
 <20200728113712.22966-6-andrew.cooper3@citrix.com>
 <ed045b42-55aa-7b63-fda9-ff7788e03ff9@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed045b42-55aa-7b63-fda9-ff7788e03ff9@citrix.com>
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
Cc: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>,
 =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jul 28, 2020 at 03:14:39PM +0100, Andrew Cooper wrote:
> On 28/07/2020 12:37, Andrew Cooper wrote:
> > With the Xen side of this interface fixed to return real sizes, userspace
> > needs to be able to make the query.
> >
> > Introduce xenforeignmemory_resource_size() for the purpose, bumping the
> > library minor version and providing compatiblity for the non-Linux builds.
> >
> > Its not possible to reuse the IOCTL_PRIVCMD_MMAP_RESOURCE infrastructure,
> > because it depends on having already mmap()'d a suitably sized region before
> > it will make an XENMEM_acquire_resource hypercall to Xen.
> >
> > Instead, open a xencall handle and make an XENMEM_acquire_resource hypercall
> > directly.
> >
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > ---
> > CC: Ian Jackson <Ian.Jackson@citrix.com>
> > CC: Wei Liu <wl@xen.org>
> > CC: Paul Durrant <paul@xen.org>
> > CC: Michał Leszczyński <michal.leszczynski@cert.pl>
> > CC: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
> 
> I've folded:
> 
> diff --git a/tools/Rules.mk b/tools/Rules.mk
> index 5ed5664bf7..b8ccf03ea9 100644
> --- a/tools/Rules.mk
> +++ b/tools/Rules.mk
> @@ -123,7 +123,7 @@ LDLIBS_libxencall = $(SHDEPS_libxencall)
> $(XEN_LIBXENCALL)/libxencall$(libextens
>  SHLIB_libxencall  = $(SHDEPS_libxencall) -Wl,-rpath-link=$(XEN_LIBXENCALL)
>  
>  CFLAGS_libxenforeignmemory = -I$(XEN_LIBXENFOREIGNMEMORY)/include
> $(CFLAGS_xeninclude)
> -SHDEPS_libxenforeignmemory = $(SHLIB_libxentoolcore)
> +SHDEPS_libxenforeignmemory = $(SHLIB_libxentoolcore) $(SHDEPS_libxencall)
>  LDLIBS_libxenforeignmemory = $(SHDEPS_libxenforeignmemory)
> $(XEN_LIBXENFOREIGNMEMORY)/libxenforeignmemory$(libextension)
>  SHLIB_libxenforeignmemory  = $(SHDEPS_libxenforeignmemory)
> -Wl,-rpath-link=$(XEN_LIBXENFOREIGNMEMORY)
>  
> diff --git a/tools/libs/foreignmemory/Makefile
> b/tools/libs/foreignmemory/Makefile
> index 8e07f92c59..f3a61e27c7 100644
> --- a/tools/libs/foreignmemory/Makefile
> +++ b/tools/libs/foreignmemory/Makefile
> @@ -4,7 +4,7 @@ include $(XEN_ROOT)/tools/Rules.mk
>  MAJOR    = 1
>  MINOR    = 4
>  LIBNAME  := foreignmemory
> -USELIBS  := toollog toolcore
> +USELIBS  := toollog toolcore call
>  
>  SRCS-y                 += core.c
>  SRCS-$(CONFIG_Linux)   += linux.c
> 
> to fix the build in certain containers.

Acked-by: Wei Liu <wl@xen.org>

