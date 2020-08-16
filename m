Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E99C245770
	for <lists+xen-devel@lfdr.de>; Sun, 16 Aug 2020 13:48:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7H84-0002pV-4i; Sun, 16 Aug 2020 11:47:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=thk9=B2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k7H83-0002ok-0L
 for xen-devel@lists.xenproject.org; Sun, 16 Aug 2020 11:47:11 +0000
X-Inumbo-ID: 7ee669dc-77e9-434e-8e34-3c350858d183
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ee669dc-77e9-434e-8e34-3c350858d183;
 Sun, 16 Aug 2020 11:47:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5D706AAC7;
 Sun, 16 Aug 2020 11:47:32 +0000 (UTC)
Subject: Re: [PATCH I v2 6/6] tools: generate most contents of library make
 variables
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
References: <20200815130341.27147-1-jgross@suse.com>
 <20200815130341.27147-7-jgross@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7d439e56-e685-e893-8df7-09f1bb8e1a03@suse.com>
Date: Sun, 16 Aug 2020 13:47:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200815130341.27147-7-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 15.08.20 15:03, Juergen Gross wrote:
> Library related make variables (CFLAGS_lib*, SHDEPS_lib*, LDLIBS_lib*
> and SHLIB_lib*) mostly have a common pattern for their values. Generate
> most of this content automatically by adding a new per-library variable
> defining on which other libraries a lib is depending.
> 
> This in turn makes it possible to drop the USELIB variable from each
> library Makefile.
> 
> The LIBNAME variable can be dropped, too, as it can be derived from the
> directory name the library is residing in.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Uh, this patch has a bug. The other 5 are fine, though. Will send an
updated version of this one soon.


Juergen

> ---
>   tools/Rules.mk                    | 70 ++++++++++---------------------
>   tools/libs/call/Makefile          |  2 -
>   tools/libs/devicemodel/Makefile   |  2 -
>   tools/libs/evtchn/Makefile        |  2 -
>   tools/libs/foreignmemory/Makefile |  2 -
>   tools/libs/gnttab/Makefile        |  2 -
>   tools/libs/hypfs/Makefile         |  2 -
>   tools/libs/libs.mk                |  8 ++--
>   tools/libs/toolcore/Makefile      |  1 -
>   tools/libs/toollog/Makefile       |  1 -
>   10 files changed, 27 insertions(+), 65 deletions(-)
> 
> diff --git a/tools/Rules.mk b/tools/Rules.mk
> index 5d699cfd39..06827ad1d8 100644
> --- a/tools/Rules.mk
> +++ b/tools/Rules.mk
> @@ -12,14 +12,24 @@ INSTALL = $(XEN_ROOT)/tools/cross-install
>   LDFLAGS += $(PREPEND_LDFLAGS_XEN_TOOLS)
>   
>   XEN_INCLUDE        = $(XEN_ROOT)/tools/include
> -XEN_libxentoolcore = $(XEN_ROOT)/tools/libs/toolcore
> -XEN_libxentoollog  = $(XEN_ROOT)/tools/libs/toollog
> -XEN_libxenevtchn   = $(XEN_ROOT)/tools/libs/evtchn
> -XEN_libxengnttab   = $(XEN_ROOT)/tools/libs/gnttab
> -XEN_libxencall     = $(XEN_ROOT)/tools/libs/call
> -XEN_libxenforeignmemory = $(XEN_ROOT)/tools/libs/foreignmemory
> -XEN_libxendevicemodel = $(XEN_ROOT)/tools/libs/devicemodel
> -XEN_libxenhypfs    = $(XEN_ROOT)/tools/libs/hypfs
> +
> +LIBS_LIBS += toolcore
> +USELIBS_toolcore :=
> +LIBS_LIBS += toollog
> +USELIBS_toollog :=
> +LIBS_LIBS += evtchn
> +USELIBS_evtchn := toollog toolcore
> +LIBS_LIBS += gnttab
> +USELIBS_gnttab := toollog toolcore
> +LIBS_LIBS += call
> +USELIBS_call := toollog toolcore
> +LIBS_LIBS += foreignmemory
> +USELIBS_foreignmemory := toollog toolcore
> +LIBS_LIBS += devicemodel
> +USELIBS_devicemodel := toollog toolcore call
> +LIBS_LIBS += hypfs
> +USELIBS_hypfs := toollog toolcore call
> +
>   XEN_libxenctrl     = $(XEN_ROOT)/tools/libxc
>   # Currently libxenguest lives in the same directory as libxenctrl
>   XEN_libxenguest    = $(XEN_libxenctrl)
> @@ -99,45 +109,11 @@ endif
>   # Consumers of libfoo should not directly use $(SHDEPS_libfoo) or
>   # $(SHLIB_libfoo)
>   
> -CFLAGS_libxentoollog = -I$(XEN_libxentoollog)/include $(CFLAGS_xeninclude)
> -SHDEPS_libxentoollog =
> -LDLIBS_libxentoollog = $(SHDEPS_libxentoollog) $(XEN_libxentoollog)/libxentoollog$(libextension)
> -SHLIB_libxentoollog  = $(SHDEPS_libxentoollog) -Wl,-rpath-link=$(XEN_libxentoollog)
> -
> -CFLAGS_libxentoolcore = -I$(XEN_libxentoolcore)/include $(CFLAGS_xeninclude)
> -SHDEPS_libxentoolcore =
> -LDLIBS_libxentoolcore = $(SHDEPS_libxentoolcore) $(XEN_libxentoolcore)/libxentoolcore$(libextension)
> -SHLIB_libxentoolcore  = $(SHDEPS_libxentoolcore) -Wl,-rpath-link=$(XEN_libxentoolcore)
> -
> -CFLAGS_libxenevtchn = -I$(XEN_libxenevtchn)/include $(CFLAGS_xeninclude)
> -SHDEPS_libxenevtchn = $(SHLIB_libxentoolcore)
> -LDLIBS_libxenevtchn = $(SHDEPS_libxenevtchn) $(XEN_libxenevtchn)/libxenevtchn$(libextension)
> -SHLIB_libxenevtchn  = $(SHDEPS_libxenevtchn) -Wl,-rpath-link=$(XEN_libxenevtchn)
> -
> -CFLAGS_libxengnttab = -I$(XEN_libxengnttab)/include $(CFLAGS_xeninclude)
> -SHDEPS_libxengnttab = $(SHLIB_libxentoollog) $(SHLIB_libxentoolcore)
> -LDLIBS_libxengnttab = $(SHDEPS_libxengnttab) $(XEN_libxengnttab)/libxengnttab$(libextension)
> -SHLIB_libxengnttab  = $(SHDEPS_libxengnttab) -Wl,-rpath-link=$(XEN_libxengnttab)
> -
> -CFLAGS_libxencall = -I$(XEN_libxencall)/include $(CFLAGS_xeninclude)
> -SHDEPS_libxencall = $(SHLIB_libxentoolcore)
> -LDLIBS_libxencall = $(SHDEPS_libxencall) $(XEN_libxencall)/libxencall$(libextension)
> -SHLIB_libxencall  = $(SHDEPS_libxencall) -Wl,-rpath-link=$(XEN_libxencall)
> -
> -CFLAGS_libxenforeignmemory = -I$(XEN_libxenforeignmemory)/include $(CFLAGS_xeninclude)
> -SHDEPS_libxenforeignmemory = $(SHLIB_libxentoolcore)
> -LDLIBS_libxenforeignmemory = $(SHDEPS_libxenforeignmemory) $(XEN_libxenforeignmemory)/libxenforeignmemory$(libextension)
> -SHLIB_libxenforeignmemory  = $(SHDEPS_libxenforeignmemory) -Wl,-rpath-link=$(XEN_libxenforeignmemory)
> -
> -CFLAGS_libxendevicemodel = -I$(XEN_libxendevicemodel)/include $(CFLAGS_xeninclude)
> -SHDEPS_libxendevicemodel = $(SHLIB_libxentoollog) $(SHLIB_libxentoolcore) $(SHLIB_libxencall)
> -LDLIBS_libxendevicemodel = $(SHDEPS_libxendevicemodel) $(XEN_libxendevicemodel)/libxendevicemodel$(libextension)
> -SHLIB_libxendevicemodel  = $(SHDEPS_libxendevicemodel) -Wl,-rpath-link=$(XEN_libxendevicemodel)
> -
> -CFLAGS_libxenhypfs = -I$(XEN_libxenhypfs)/include $(CFLAGS_xeninclude)
> -SHDEPS_libxenhypfs = $(SHLIB_libxentoollog) $(SHLIB_libxentoolcore) $(SHLIB_libxencall)
> -LDLIBS_libxenhypfs = $(SHDEPS_libxenhypfs) $(XEN_libxenhypfs)/libxenhypfs$(libextension)
> -SHLIB_libxenhypfs  = $(SHDEPS_libxenhypfs) -Wl,-rpath-link=$(XEN_libxenhypfs)
> +$(foreach lib,$(LIBS_LIBS),$(eval XEN_libxen$(lib) = $(XEN_ROOT)/tools/libs/$(lib)))
> +$(foreach lib,$(LIBS_LIBS),$(eval CFLAGS_libxen$(lib) = -I$(XEN_libxen$(lib))/include $(CFLAGS_xeninclude)))
> +$(foreach lib,$(LIBS_LIBS),$(eval SHDEPS_libxen$(lib) = $(foreach use,$(USELIBS_$(lib)),$(SHLIB_libxen$(use)))))
> +$(foreach lib,$(LIBS_LIBS),$(eval LDLIBS_libxen$(lib) = $(SHDEPS_libxen$(lib)) $(XEN_libxen$(lib))/libxen$(lib)$(libextension)))
> +$(foreach lib,$(LIBS_LIBS),$(eval SHLIB_libxen$(lib) = $(SHDEPS_libxen$(lib)) -Wl,-rpath-link=$(XEN_libxen$(lib))))
>   
>   # code which compiles against libxenctrl get __XEN_TOOLS__ and
>   # therefore sees the unstable hypercall interfaces.
> diff --git a/tools/libs/call/Makefile b/tools/libs/call/Makefile
> index 7994b411fa..81c7478efd 100644
> --- a/tools/libs/call/Makefile
> +++ b/tools/libs/call/Makefile
> @@ -3,8 +3,6 @@ include $(XEN_ROOT)/tools/Rules.mk
>   
>   MAJOR    = 1
>   MINOR    = 2
> -LIBNAME  := call
> -USELIBS  := toollog toolcore
>   
>   SRCS-y                 += core.c buffer.c
>   SRCS-$(CONFIG_Linux)   += linux.c
> diff --git a/tools/libs/devicemodel/Makefile b/tools/libs/devicemodel/Makefile
> index d9d1d1b850..42417958f2 100644
> --- a/tools/libs/devicemodel/Makefile
> +++ b/tools/libs/devicemodel/Makefile
> @@ -3,8 +3,6 @@ include $(XEN_ROOT)/tools/Rules.mk
>   
>   MAJOR    = 1
>   MINOR    = 3
> -LIBNAME  := devicemodel
> -USELIBS  := toollog toolcore call
>   
>   SRCS-y                 += core.c
>   SRCS-$(CONFIG_Linux)   += linux.c
> diff --git a/tools/libs/evtchn/Makefile b/tools/libs/evtchn/Makefile
> index d7aa4d402f..aec76641e8 100644
> --- a/tools/libs/evtchn/Makefile
> +++ b/tools/libs/evtchn/Makefile
> @@ -3,8 +3,6 @@ include $(XEN_ROOT)/tools/Rules.mk
>   
>   MAJOR    = 1
>   MINOR    = 1
> -LIBNAME  := evtchn
> -USELIBS  := toollog toolcore
>   
>   SRCS-y                 += core.c
>   SRCS-$(CONFIG_Linux)   += linux.c
> diff --git a/tools/libs/foreignmemory/Makefile b/tools/libs/foreignmemory/Makefile
> index 823989681d..cf444d3c1a 100644
> --- a/tools/libs/foreignmemory/Makefile
> +++ b/tools/libs/foreignmemory/Makefile
> @@ -3,8 +3,6 @@ include $(XEN_ROOT)/tools/Rules.mk
>   
>   MAJOR    = 1
>   MINOR    = 3
> -LIBNAME  := foreignmemory
> -USELIBS  := toollog toolcore
>   
>   SRCS-y                 += core.c
>   SRCS-$(CONFIG_Linux)   += linux.c
> diff --git a/tools/libs/gnttab/Makefile b/tools/libs/gnttab/Makefile
> index c0fffdac71..d8d4d55e27 100644
> --- a/tools/libs/gnttab/Makefile
> +++ b/tools/libs/gnttab/Makefile
> @@ -3,8 +3,6 @@ include $(XEN_ROOT)/tools/Rules.mk
>   
>   MAJOR    = 1
>   MINOR    = 2
> -LIBNAME  := gnttab
> -USELIBS  := toollog toolcore
>   
>   SRCS-GNTTAB            += gnttab_core.c
>   SRCS-GNTSHR            += gntshr_core.c
> diff --git a/tools/libs/hypfs/Makefile b/tools/libs/hypfs/Makefile
> index b4c41f6189..668d68853f 100644
> --- a/tools/libs/hypfs/Makefile
> +++ b/tools/libs/hypfs/Makefile
> @@ -3,8 +3,6 @@ include $(XEN_ROOT)/tools/Rules.mk
>   
>   MAJOR    = 1
>   MINOR    = 0
> -LIBNAME  := hypfs
> -USELIBS  := toollog toolcore call
>   
>   APPEND_LDFLAGS += -lz
>   
> diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
> index 764f5441e2..19efc5e743 100644
> --- a/tools/libs/libs.mk
> +++ b/tools/libs/libs.mk
> @@ -1,18 +1,18 @@
>   # Common Makefile for building a lib.
>   #
>   # Variables taken as input:
> -#   LIBNAME: name of lib to build, will be prepended with "libxen"
>   #   MAJOR:   major version of lib
>   #   MINOR:   minor version of lib
> -#   USELIBS: xen libs to use (e.g. "toolcore toollog")
> +
> +LIBNAME := $(notdir $(CURDIR))
>   
>   SHLIB_LDFLAGS += -Wl,--version-script=libxen$(LIBNAME).map
>   
>   CFLAGS   += -Werror -Wmissing-prototypes
>   CFLAGS   += -I./include $(CFLAGS_xeninclude)
> -CFLAGS   += $(foreach lib, $(USELIBS), $(CFLAGS_libxen$(lib)))
> +CFLAGS   += $(foreach lib, $(USELIBS_$(LIBNAME)), $(CFLAGS_libxen$(lib)))
>   
> -LDUSELIBS = $(foreach lib, $(USELIBS), $(LDLIBS_libxen$(lib)))
> +LDUSELIBS = $(foreach lib, $(USELIBS_$(LIBNAME)), $(LDLIBS_libxen$(lib)))
>   
>   LIB_OBJS := $(SRCS-y:.c=.o)
>   PIC_OBJS := $(SRCS-y:.c=.opic)
> diff --git a/tools/libs/toolcore/Makefile b/tools/libs/toolcore/Makefile
> index 85ff2b26fd..34b08a4236 100644
> --- a/tools/libs/toolcore/Makefile
> +++ b/tools/libs/toolcore/Makefile
> @@ -3,7 +3,6 @@ include $(XEN_ROOT)/tools/Rules.mk
>   
>   MAJOR	= 1
>   MINOR	= 0
> -LIBNAME  := toolcore
>   AUTOINCS := include/_xentoolcore_list.h
>   
>   SRCS-y	+= handlereg.c
> diff --git a/tools/libs/toollog/Makefile b/tools/libs/toollog/Makefile
> index 2d3ae4e627..3f986835d6 100644
> --- a/tools/libs/toollog/Makefile
> +++ b/tools/libs/toollog/Makefile
> @@ -3,7 +3,6 @@ include $(XEN_ROOT)/tools/Rules.mk
>   
>   MAJOR	= 1
>   MINOR	= 0
> -LIBNAME  := toollog
>   
>   SRCS-y	+= xtl_core.c
>   SRCS-y	+= xtl_logger_stdio.c
> 


