Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED60224D7C
	for <lists+xen-devel@lfdr.de>; Sat, 18 Jul 2020 20:19:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwrPv-0002JU-KO; Sat, 18 Jul 2020 18:18:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+0x8=A5=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1jwrPt-0002JP-Tj
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2020 18:18:33 +0000
X-Inumbo-ID: 155b6196-c923-11ea-b7bb-bc764e2007e4
Received: from hera.aquilenet.fr (unknown [2a0c:e300::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 155b6196-c923-11ea-b7bb-bc764e2007e4;
 Sat, 18 Jul 2020 18:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 64CC32939;
 Sat, 18 Jul 2020 20:18:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Zsg89KWktZu; Sat, 18 Jul 2020 20:18:28 +0200 (CEST)
Received: from function.home (unknown
 [IPv6:2a01:cb19:956:1b00:9eb6:d0ff:fe88:c3c7])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 1F3C21A5D;
 Sat, 18 Jul 2020 20:18:28 +0200 (CEST)
Received: from samy by function.home with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1jwrPn-009BGe-23; Sat, 18 Jul 2020 20:18:27 +0200
Date: Sat, 18 Jul 2020 20:18:27 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] mini-os: don't hard-wire xen internal paths
Message-ID: <20200718181827.7jrs5ilutt3jzp4i@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org, wl@xen.org
References: <20200713084230.18177-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200713084230.18177-1-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
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
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 wl@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Juergen Gross, le lun. 13 juil. 2020 10:42:30 +0200, a ecrit:
> Mini-OS shouldn't use Xen internal paths for building. Import the
> needed paths from Xen and fall back to the current values only if
> the import was not possible.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V2: correct typo (XCALL_APTH -> CALL_PATH)
> ---
>  Config.mk | 15 ++++++++++++++-
>  Makefile  | 35 ++++++++++++++++++-----------------
>  2 files changed, 32 insertions(+), 18 deletions(-)
> 
> diff --git a/Config.mk b/Config.mk
> index f6a2afa..cb823c2 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -33,6 +33,19 @@ endif
>  #
>  ifneq ($(XEN_ROOT),)
>  MINIOS_ROOT=$(XEN_ROOT)/extras/mini-os
> +
> +-include $(XEN_ROOT)/stubdom/mini-os.mk
> +
> +XENSTORE_CPPFLAGS ?= -isystem $(XEN_ROOT)/tools/xenstore/include
> +TOOLCORE_PATH ?= $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/toolcore
> +TOOLLOG_PATH ?= $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/toollog
> +EVTCHN_PATH ?= $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/evtchn
> +GNTTAB_PATH ?= $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/gnttab
> +CALL_PATH ?= $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/call
> +FOREIGNMEMORY_PATH ?= $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/foreignmemory
> +DEVICEMODEL_PATH ?= $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/devicemodel
> +CTRL_PATH ?= $(XEN_ROOT)/stubdom/libxc-$(MINIOS_TARGET_ARCH)
> +GUEST_PATH ?= $(XEN_ROOT)/stubdom/libxc-$(MINIOS_TARGET_ARCH)
>  else
>  MINIOS_ROOT=$(TOPLEVEL_DIR)
>  endif
> @@ -93,7 +106,7 @@ DEF_CPPFLAGS += -D__MINIOS__
>  ifeq ($(libc),y)
>  DEF_CPPFLAGS += -DHAVE_LIBC
>  DEF_CPPFLAGS += -isystem $(MINIOS_ROOT)/include/posix
> -DEF_CPPFLAGS += -isystem $(XEN_ROOT)/tools/xenstore/include
> +DEF_CPPFLAGS += $(XENSTORE_CPPFLAGS)
>  endif
>  
>  ifneq ($(LWIPDIR),)
> diff --git a/Makefile b/Makefile
> index be640cd..4b76b55 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -125,23 +125,24 @@ OBJS := $(filter-out $(OBJ_DIR)/lwip%.o $(LWO), $(OBJS))
>  
>  ifeq ($(libc),y)
>  ifeq ($(CONFIG_XC),y)
> -APP_LDLIBS += -L$(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/toolcore -whole-archive -lxentoolcore -no-whole-archive
> -LIBS += $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/toolcore/libxentoolcore.a
> -APP_LDLIBS += -L$(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/toollog -whole-archive -lxentoollog -no-whole-archive
> -LIBS += $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/toollog/libxentoollog.a
> -APP_LDLIBS += -L$(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/evtchn -whole-archive -lxenevtchn -no-whole-archive
> -LIBS += $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/evtchn/libxenevtchn.a
> -APP_LDLIBS += -L$(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/gnttab -whole-archive -lxengnttab -no-whole-archive
> -LIBS += $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/gnttab/libxengnttab.a
> -APP_LDLIBS += -L$(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/call -whole-archive -lxencall -no-whole-archive
> -LIBS += $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/call/libxencall.a
> -APP_LDLIBS += -L$(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/foreignmemory -whole-archive -lxenforeignmemory -no-whole-archive
> -LIBS += $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/foreignmemory/libxenforeignmemory.a
> -APP_LDLIBS += -L$(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/devicemodel -whole-archive -lxendevicemodel -no-whole-archive
> -LIBS += $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/devicemodel/libxendevicemodel.a
> -APP_LDLIBS += -L$(XEN_ROOT)/stubdom/libxc-$(MINIOS_TARGET_ARCH) -whole-archive -lxenguest -lxenctrl -no-whole-archive
> -LIBS += $(XEN_ROOT)/stubdom/libxc-$(MINIOS_TARGET_ARCH)/libxenctrl.a
> -LIBS += $(XEN_ROOT)/stubdom/libxc-$(MINIOS_TARGET_ARCH)/libxenguest.a
> +APP_LDLIBS += -L$(TOOLCORE_PATH) -whole-archive -lxentoolcore -no-whole-archive
> +LIBS += $(TOOLCORE_PATH)/libxentoolcore.a
> +APP_LDLIBS += -L$(TOOLLOG_PATH) -whole-archive -lxentoollog -no-whole-archive
> +LIBS += $(TOOLLOG_PATH)/libxentoollog.a
> +APP_LDLIBS += -L$(EVTCHN_PATH) -whole-archive -lxenevtchn -no-whole-archive
> +LIBS += $(EVTCHN_PATH)/libxenevtchn.a
> +APP_LDLIBS += -L$(GNTTAB_PATH) -whole-archive -lxengnttab -no-whole-archive
> +LIBS += $(GNTTAB_PATH)/libxengnttab.a
> +APP_LDLIBS += -L$(CALL_PATH) -whole-archive -lxencall -no-whole-archive
> +LIBS += $(CALL_PATH)/libxencall.a
> +APP_LDLIBS += -L$(FOREIGNMEMORY_PATH) -whole-archive -lxenforeignmemory -no-whole-archive
> +LIBS += $(FOREIGNMEMORY_PATH)/libxenforeignmemory.a
> +APP_LDLIBS += -L$(DEVICEMODEL_PATH) -whole-archive -lxendevicemodel -no-whole-archive
> +LIBS += $(DEVICEMODEL_PATH)/libxendevicemodel.a
> +APP_LDLIBS += -L$(GUEST_PATH) -whole-archive -lxenguest -no-whole-archive
> +LIBS += $(GUEST_PATH)/libxenguest.a
> +APP_LDLIBS += -L$(CTRL_PATH) -whole-archive -lxenctrl -no-whole-archive
> +LIBS += $(CTRL_PATH)/libxenctrl.a
>  endif
>  APP_LDLIBS += -lpci
>  APP_LDLIBS += -lz
> -- 
> 2.26.2
> 

-- 
Samuel
 Moralité : le modem et le cablerouteur font comme les filles, ils
 papotent toute la journée.
 -+- RB in NPC : Et en plus, ils ne parlent que de bits -+-

