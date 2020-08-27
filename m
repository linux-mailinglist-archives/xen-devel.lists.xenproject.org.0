Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BEA25449E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 13:55:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBGUl-0007IB-0e; Thu, 27 Aug 2020 11:55:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBGUk-0007I6-AV
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 11:55:06 +0000
X-Inumbo-ID: 17f50687-43ed-48bd-b117-6e35a590d332
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17f50687-43ed-48bd-b117-6e35a590d332;
 Thu, 27 Aug 2020 11:55:05 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id c19so3580788wmd.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 04:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CcL7dfpdm/VgIXPONiVDqHkHLSJ7CzeW4Na5/Z6fZis=;
 b=TWkd4WqOyCCx43ZiC14YoUm0rJTc5k8qYspGWgmFWBU5+DpcizC1bnvIQwLBTDaapM
 BRyw6ZMvEeavUhoEzNQY3+EBo+pTOXgTKonYJpxvYfxTQ+WTJrsqZ41mmMpqjGpfk9S/
 TAYM8LTMyUKaxtKt62Qil6TBr8YjyLb/S2/GxptJuk8z82ShiS3Tabdou91hp6hZ2eHj
 6TDSeXFkjAG3cKMjqoDTIo0dMLLmALvE0QzqrXHdkSfjdtHb9KfVlB+3PAEAexYMoWFo
 YxIRh7j+oqqfpmZniLzlxYOOvUHQ+7Zw+hJpLxWM5o/hRq+Wd1J8FynOswm1CoNCE1wb
 UiSQ==
X-Gm-Message-State: AOAM530z9pz9GSH8NGestE+FqcsYOSqs9eF6zzVUptVjYw+vwftrvAaB
 3IrQZNoyaSuKeyGjXbcuyWUCSa285lI=
X-Google-Smtp-Source: ABdhPJw18mKHWRrbThkxFXmr7/Jn5PXV9uoyOfJSBXjT8v2dKf7asB0y2KKt+cZbu6DqR4v1r81raQ==
X-Received: by 2002:a1c:b4c1:: with SMTP id d184mr12045544wmf.26.1598529304218; 
 Thu, 27 Aug 2020 04:55:04 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id w16sm5028931wrp.44.2020.08.27.04.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 04:55:03 -0700 (PDT)
Date: Thu, 27 Aug 2020 11:55:02 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 37/38] tools: add support for library names other than
 libxen*
Message-ID: <20200827115502.iupiakmva4kfbvox@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-38-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-38-jgross@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, Aug 23, 2020 at 11:35:18AM +0200, Juergen Gross wrote:
> All Xen libraries but one (libxlutil) are named libxen...
> 

It this can potentially make your life easier, I think renaming the
library to libxenlightutil to conform to the library naming scheme is
acceptable to me -- obviously we will need to keep the sonames and such.

What do you think?

Wei.

> Add support in the generic library build framework for that different
> naming by adding another indirection layer. For a library
> LIB_PREFIX_<lib> can be set in tools/libs/uselibs.mk. The default is
> "xen", assuming that all libraries are starting with "lib".
> 
> For now don't expand this support to stubdoms, as it isn't needed
> there yet.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  tools/Rules.mk     | 12 ++++++-----
>  tools/libs/libs.mk | 51 ++++++++++++++++++++++++----------------------
>  2 files changed, 34 insertions(+), 29 deletions(-)
> 
> diff --git a/tools/Rules.mk b/tools/Rules.mk
> index 8ecaf063b5..5537056d00 100644
> --- a/tools/Rules.mk
> +++ b/tools/Rules.mk
> @@ -87,11 +87,13 @@ endif
>  # $(SHLIB_libfoo)
>  
>  define LIB_defs =
> - XEN_libxen$(1) = $$(XEN_ROOT)/tools/libs/$(1)
> - CFLAGS_libxen$(1) = -I$$(XEN_libxen$(1))/include $$(CFLAGS_xeninclude)
> - SHDEPS_libxen$(1) = $$(foreach use,$$(USELIBS_$(1)),$$(SHLIB_libxen$$(use)))
> - LDLIBS_libxen$(1) = $$(SHDEPS_libxen$(1)) $$(XEN_libxen$(1))/libxen$(1)$$(libextension)
> - SHLIB_libxen$(1) = $$(SHDEPS_libxen$(1)) -Wl,-rpath-link=$$(XEN_libxen$(1))
> + LIB_PREFIX_$(1) ?= xen
> + LIBREF_$(1) = lib$$(LIB_PREFIX_$(1))$(1)
> + XEN_$$(LIBREF_$(1)) = $$(XEN_ROOT)/tools/libs/$(1)
> + CFLAGS_$$(LIBREF_$(1)) = -I$$(XEN_$$(LIBREF_$(1)))/include $$(CFLAGS_xeninclude)
> + SHDEPS_$$(LIBREF_$(1)) = $$(foreach use,$$(USELIBS_$(1)),$$(SHLIB_$$(LIBREF_$$(use))))
> + LDLIBS_$$(LIBREF_$(1)) = $$(SHDEPS_$$(LIBREF_$(1))) $$(XEN_$$(LIBREF_$(1)))/$$(LIBREF_$(1))$$(libextension)
> + SHLIB_$$(LIBREF_$(1)) = $$(SHDEPS_$$(LIBREF_$(1))) -Wl,-rpath-link=$$(XEN_$$(LIBREF_$(1)))
>  endef
>  
>  $(foreach lib,$(LIBS_LIBS),$(eval $(call LIB_defs,$(lib))))
> diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
> index 8b1ca2aa62..fca8228d25 100644
> --- a/tools/libs/libs.mk
> +++ b/tools/libs/libs.mk
> @@ -9,23 +9,26 @@ LIBNAME := $(notdir $(CURDIR))
>  MAJOR ?= $(shell $(XEN_ROOT)/version.sh $(XEN_ROOT)/xen/Makefile)
>  MINOR ?= 0
>  
> -SHLIB_LDFLAGS += -Wl,--version-script=libxen$(LIBNAME).map
> +my_lib := $(LIBREF_$(LIBNAME))
> +my_name := $(LIB_PREFIX_$(LIBNAME))$(LIBNAME)
> +
> +SHLIB_LDFLAGS += -Wl,--version-script=$(my_lib).map
>  
>  CFLAGS   += -Werror -Wmissing-prototypes
>  CFLAGS   += -I./include $(CFLAGS_xeninclude)
> -CFLAGS   += $(foreach lib, $(USELIBS_$(LIBNAME)), $(CFLAGS_libxen$(lib)))
> +CFLAGS   += $(foreach lib, $(USELIBS_$(LIBNAME)), $(CFLAGS_$(LIBREF_$(lib))))
>  
> -LDUSELIBS = $(foreach lib, $(USELIBS_$(LIBNAME)), $(LDLIBS_libxen$(lib)))
> +LDUSELIBS = $(foreach lib, $(USELIBS_$(LIBNAME)), $(LDLIBS_$(LIBREF_$(lib))))
>  
>  LIB_OBJS := $(SRCS-y:.c=.o)
>  PIC_OBJS := $(SRCS-y:.c=.opic)
>  
> -LIB := libxen$(LIBNAME).a
> +LIB := $(my_lib).a
>  ifneq ($(nosharedlibs),y)
> -LIB += libxen$(LIBNAME).so
> +LIB += $(my_lib).so
>  endif
>  
> -PKG_CONFIG ?= xen$(LIBNAME).pc
> +PKG_CONFIG ?= $(my_name).pc
>  PKG_CONFIG_VERSION := $(MAJOR).$(MINOR)
>  
>  ifneq ($(CONFIG_LIBXC_MINIOS),y)
> @@ -37,7 +40,7 @@ endif
>  
>  PKG_CONFIG_LOCAL := $(PKG_CONFIG_DIR)/$(PKG_CONFIG)
>  
> -LIBHEADER ?= xen$(LIBNAME).h
> +LIBHEADER ?= $(my_name).h
>  LIBHEADERS = $(foreach h, $(LIBHEADER), include/$(h))
>  LIBHEADERSGLOB = $(foreach h, $(LIBHEADER), $(XEN_ROOT)/tools/include/$(h))
>  
> @@ -48,7 +51,7 @@ $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
>  all: build
>  
>  .PHONY: build
> -build: libs libxen$(LIBNAME).map
> +build: libs $(my_lib).map
>  
>  .PHONY: libs
>  libs: headers.chk $(LIB) $(PKG_CONFIG_INST) $(PKG_CONFIG_LOCAL)
> @@ -67,42 +70,42 @@ endif
>  
>  headers.chk: $(LIBHEADERSGLOB) $(AUTOINCS)
>  
> -libxen$(LIBNAME).map:
> +$(my_lib).map:
>  	echo 'VERS_$(MAJOR).$(MINOR) { global: *; };' >$@
>  
>  $(LIBHEADERSGLOB): $(LIBHEADERS)
>  	for i in $(realpath $(LIBHEADERS)); do ln -sf $$i $(XEN_ROOT)/tools/include; done
>  
> -libxen$(LIBNAME).a: $(LIB_OBJS)
> +$(my_lib).a: $(LIB_OBJS)
>  	$(AR) rc $@ $^
>  
> -libxen$(LIBNAME).so: libxen$(LIBNAME).so.$(MAJOR)
> +$(my_lib).so: $(my_lib).so.$(MAJOR)
>  	$(SYMLINK_SHLIB) $< $@
> -libxen$(LIBNAME).so.$(MAJOR): libxen$(LIBNAME).so.$(MAJOR).$(MINOR)
> +$(my_lib).so.$(MAJOR): $(my_lib).so.$(MAJOR).$(MINOR)
>  	$(SYMLINK_SHLIB) $< $@
>  
> -libxen$(LIBNAME).so.$(MAJOR).$(MINOR): $(PIC_OBJS) libxen$(LIBNAME).map
> -	$(CC) $(LDFLAGS) $(PTHREAD_LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,libxen$(LIBNAME).so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $(PIC_OBJS) $(LDUSELIBS) $(APPEND_LDFLAGS)
> +$(my_lib).so.$(MAJOR).$(MINOR): $(PIC_OBJS) $(my_lib).map
> +	$(CC) $(LDFLAGS) $(PTHREAD_LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,$(my_lib).so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $(PIC_OBJS) $(LDUSELIBS) $(APPEND_LDFLAGS)
>  
>  .PHONY: install
>  install: build
>  	$(INSTALL_DIR) $(DESTDIR)$(libdir)
>  	$(INSTALL_DIR) $(DESTDIR)$(includedir)
> -	$(INSTALL_SHLIB) libxen$(LIBNAME).so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)
> -	$(INSTALL_DATA) libxen$(LIBNAME).a $(DESTDIR)$(libdir)
> -	$(SYMLINK_SHLIB) libxen$(LIBNAME).so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)/libxen$(LIBNAME).so.$(MAJOR)
> -	$(SYMLINK_SHLIB) libxen$(LIBNAME).so.$(MAJOR) $(DESTDIR)$(libdir)/libxen$(LIBNAME).so
> +	$(INSTALL_SHLIB) $(my_lib).so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)
> +	$(INSTALL_DATA) $(my_lib).a $(DESTDIR)$(libdir)
> +	$(SYMLINK_SHLIB) $(my_lib).so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)/$(my_lib).so.$(MAJOR)
> +	$(SYMLINK_SHLIB) $(my_lib).so.$(MAJOR) $(DESTDIR)$(libdir)/$(my_lib).so
>  	for i in $(LIBHEADERS); do $(INSTALL_DATA) $$i $(DESTDIR)$(includedir); done
>  	$(INSTALL_DATA) $(PKG_CONFIG) $(DESTDIR)$(PKG_INSTALLDIR)
>  
>  .PHONY: uninstall
>  uninstall:
> -	rm -f $(DESTDIR)$(PKG_INSTALLDIR)/xen$(LIBNAME).pc
> +	rm -f $(DESTDIR)$(PKG_INSTALLDIR)/$(my_name).pc
>  	for i in $(LIBHEADER); do rm -f $(DESTDIR)$(includedir)/$(LIBHEADER); done
> -	rm -f $(DESTDIR)$(libdir)/libxen$(LIBNAME).so
> -	rm -f $(DESTDIR)$(libdir)/libxen$(LIBNAME).so.$(MAJOR)
> -	rm -f $(DESTDIR)$(libdir)/libxen$(LIBNAME).so.$(MAJOR).$(MINOR)
> -	rm -f $(DESTDIR)$(libdir)/libxen$(LIBNAME).a
> +	rm -f $(DESTDIR)$(libdir)/$(my_lib).so
> +	rm -f $(DESTDIR)$(libdir)/$(my_lib).so.$(MAJOR)
> +	rm -f $(DESTDIR)$(libdir)/$(my_lib).so.$(MAJOR).$(MINOR)
> +	rm -f $(DESTDIR)$(libdir)/$(my_lib).a
>  
>  .PHONY: TAGS
>  TAGS:
> @@ -111,7 +114,7 @@ TAGS:
>  .PHONY: clean
>  clean:
>  	rm -rf *.rpm $(LIB) *~ $(DEPS_RM) $(LIB_OBJS) $(PIC_OBJS)
> -	rm -f libxen$(LIBNAME).so.$(MAJOR).$(MINOR) libxen$(LIBNAME).so.$(MAJOR)
> +	rm -f $(my_lib).so.$(MAJOR).$(MINOR) $(my_lib).so.$(MAJOR)
>  	rm -f headers.chk
>  	rm -f $(PKG_CONFIG)
>  	rm -f $(LIBHEADERSGLOB)
> -- 
> 2.26.2
> 
> 

