Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECAB4C4886
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:16:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279280.476978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcKp-0001LF-OF; Fri, 25 Feb 2022 15:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279280.476978; Fri, 25 Feb 2022 15:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcKp-0001Gu-JW; Fri, 25 Feb 2022 15:16:43 +0000
Received: by outflank-mailman (input) for mailman id 279280;
 Fri, 25 Feb 2022 15:16:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcIY-0007Bf-Da
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:14:22 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a7d7af3-964d-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 16:14:20 +0100 (CET)
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
X-Inumbo-ID: 9a7d7af3-964d-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ae6Vs1nYUDXcC+AeNHwQbE6sOaNWGywbrl+G+3LlLsM=;
  b=Bz4Kn8I01W6nIeSsoYj7gcqadaW4K6E6KjOiPPv69JMZ8YC93t+DFr8n
   Qz36MN5flOZELNEVbgiH3PskO91IEgw+ZsaXRCA5jEYa36QBuovYVFp//
   DO0tLAF5Eh7YQ8c8tbnvpGUmuDxCa4qP+SENdoSoukjw2/fqGEozQT8Hu
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65000340
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:iYn56ahvJU19gsPbU+X4iVjRX161eBAKZh0ujC45NGQN5FlHY01je
 htvCGjUP6nYYGH3fdAiPNy28UwB7ZTXmNZiSwI6/CFgF3wb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWVnQ4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YSgFH7bAivo6aj9nL3h4PaBH/5aaJnfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bknhm0THeC+dgWZ3ZSr/GzdRZwC0xloZFGvO2i
 88xN2c3NEybP0Un1lE/DM5nsLaLhFfDTxpIsmq5vIgJoGTo9VkkuFTqGIWMIYHbLSlPpW6Ho
 krW8mK/BQsVXPSEwD+Y/3bqmu/OlyrmXJ46Gbujs/p7h1vVwXYcYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiHyLpBkHQPJLDvY3rgqKz8LpDx2xXzZeCGQbMZp/6ZFwFWdCO
 kK1c83BKhBOq7GHV1Wk0Iio9DWyNCkSBDIFanpRJeca2OXLrIY2hxPJa99sFq+pk9H4cQ3NL
 yC2QDsW3OtK05NSv0mv1RWe2m/3+MCVJuIgzliPBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/pn1tp5p0xWG2DaD+qXNERz3qhZPmqgKvVlDyL9BaJpsRNMQS
 Ba7VfltzJFSJmC2SqR8fpi8Dc8npYC5S4i4CayNMocWOsApHONiwM2ITRTBt4wKuBJx+ZzTx
 L/BKZr8ZZrkIf4PIMWKqxc1juZwm3FWKZL7TpHn1RW3uYdyl1bOIYrpxGCmN7hjhIvd+V292
 48Ga6OilkUOOMWjM3K/2dNCcjg3wY0TWMmeRzp/LbXYfGKL2QgJVpfs/F/WU9c9zvQNy7yRp
 SnVt40x4AOXuEAr4D6iMhhLAI4Dl74lxZ7nFUTA5WqV5kU=
IronPort-HdrOrdr: A9a23:W+MrOqDZ/CU3RrvlHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo8f
 xG/c5rrSMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 5dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="65000340"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Wei Liu <wl@xen.org>, Samuel Thibault
	<samuel.thibault@ens-lyon.org>
Subject: [XEN PATCH v2 25/29] tools/libs: create Makefile.common to be used by stubdom build system
Date: Fri, 25 Feb 2022 15:13:17 +0000
Message-ID: <20220225151321.44126-26-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This new "Makefile.common" is intended to be used by both tools/ and
stubdom/ build system without stubdom needed to use tools/ build
system.

It should contain the necessary list of objects and CFLAGS needed to
build a static library.

Change stubdom/ to check Makefile.common, for the linkfarm.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---

Notes:
    v2:
    - reviewed

 stubdom/Makefile                         |  2 +-
 tools/libs/call/Makefile                 |  7 +-
 tools/libs/ctrl/Makefile                 | 45 +-----------
 tools/libs/devicemodel/Makefile          |  7 +-
 tools/libs/evtchn/Makefile               |  7 +-
 tools/libs/foreignmemory/Makefile        |  7 +-
 tools/libs/gnttab/Makefile               |  9 +--
 tools/libs/guest/Makefile                | 90 +-----------------------
 tools/libs/toolcore/Makefile             |  2 +-
 tools/libs/toollog/Makefile              |  3 +-
 tools/libs/call/Makefile.common          |  6 ++
 tools/libs/ctrl/Makefile.common          | 44 ++++++++++++
 tools/libs/devicemodel/Makefile.common   |  6 ++
 tools/libs/evtchn/Makefile.common        |  6 ++
 tools/libs/foreignmemory/Makefile.common |  6 ++
 tools/libs/gnttab/Makefile.common        |  8 +++
 tools/libs/guest/Makefile.common         | 84 ++++++++++++++++++++++
 tools/libs/toolcore/Makefile.common      |  1 +
 tools/libs/toollog/Makefile.common       |  2 +
 19 files changed, 174 insertions(+), 168 deletions(-)
 create mode 100644 tools/libs/call/Makefile.common
 create mode 100644 tools/libs/ctrl/Makefile.common
 create mode 100644 tools/libs/devicemodel/Makefile.common
 create mode 100644 tools/libs/evtchn/Makefile.common
 create mode 100644 tools/libs/foreignmemory/Makefile.common
 create mode 100644 tools/libs/gnttab/Makefile.common
 create mode 100644 tools/libs/guest/Makefile.common
 create mode 100644 tools/libs/toolcore/Makefile.common
 create mode 100644 tools/libs/toollog/Makefile.common

diff --git a/stubdom/Makefile b/stubdom/Makefile
index fba4c977ef..fbc63a5063 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -365,7 +365,7 @@ define BUILD_lib
 	    $$(MAKE) -C libs-$$(XEN_TARGET_ARCH)/$(1) clean; \
 	fi
 
- libs-$$(XEN_TARGET_ARCH)/$(1)/stamp: $$(XEN_ROOT)/tools/libs/$(1)/Makefile
+ libs-$$(XEN_TARGET_ARCH)/$(1)/stamp: $$(XEN_ROOT)/tools/libs/$(1)/Makefile.common
 	$$(do_links)
 endef
 
diff --git a/tools/libs/call/Makefile b/tools/libs/call/Makefile
index e5cb7c937c..103f5ad360 100644
--- a/tools/libs/call/Makefile
+++ b/tools/libs/call/Makefile
@@ -4,11 +4,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 MAJOR    = 1
 MINOR    = 3
 
-OBJS-y                 += core.o buffer.o
-OBJS-$(CONFIG_Linux)   += linux.o
-OBJS-$(CONFIG_FreeBSD) += freebsd.o
-OBJS-$(CONFIG_SunOS)   += solaris.o
-OBJS-$(CONFIG_NetBSD)  += netbsd.o
-OBJS-$(CONFIG_MiniOS)  += minios.o
+include Makefile.common
 
 include $(XEN_ROOT)/tools/libs/libs.mk
diff --git a/tools/libs/ctrl/Makefile b/tools/libs/ctrl/Makefile
index 5fd06949f1..93442ab389 100644
--- a/tools/libs/ctrl/Makefile
+++ b/tools/libs/ctrl/Makefile
@@ -1,50 +1,7 @@
 XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-OBJS-y       += xc_altp2m.o
-OBJS-y       += xc_cpupool.o
-OBJS-y       += xc_domain.o
-OBJS-y       += xc_evtchn.o
-OBJS-y       += xc_gnttab.o
-OBJS-y       += xc_misc.o
-OBJS-y       += xc_flask.o
-OBJS-y       += xc_physdev.o
-OBJS-y       += xc_private.o
-OBJS-y       += xc_csched.o
-OBJS-y       += xc_csched2.o
-OBJS-y       += xc_arinc653.o
-OBJS-y       += xc_rt.o
-OBJS-y       += xc_tbuf.o
-OBJS-y       += xc_pm.o
-OBJS-y       += xc_cpu_hotplug.o
-OBJS-y       += xc_vm_event.o
-OBJS-y       += xc_vmtrace.o
-OBJS-y       += xc_monitor.o
-OBJS-y       += xc_mem_paging.o
-OBJS-y       += xc_mem_access.o
-OBJS-y       += xc_memshr.o
-OBJS-y       += xc_hcall_buf.o
-OBJS-y       += xc_foreign_memory.o
-OBJS-y       += xc_kexec.o
-OBJS-y       += xc_resource.o
-OBJS-$(CONFIG_X86) += xc_psr.o
-OBJS-$(CONFIG_X86) += xc_pagetab.o
-OBJS-$(CONFIG_Linux) += xc_linux.o
-OBJS-$(CONFIG_FreeBSD) += xc_freebsd.o
-OBJS-$(CONFIG_SunOS) += xc_solaris.o
-OBJS-$(CONFIG_NetBSD) += xc_netbsd.o
-OBJS-$(CONFIG_NetBSDRump) += xc_netbsd.o
-OBJS-$(CONFIG_MiniOS) += xc_minios.o
-OBJS-y       += xc_evtchn_compat.o
-OBJS-y       += xc_gnttab_compat.o
-OBJS-y       += xc_devicemodel_compat.o
-
-CFLAGS   += -D__XEN_TOOLS__
-CFLAGS	+= $(PTHREAD_CFLAGS)
-CFLAGS += -include $(XEN_ROOT)/tools/config.h
-
-# Needed for posix_fadvise64() in xc_linux.c
-CFLAGS-$(CONFIG_Linux) += -D_GNU_SOURCE
+include Makefile.common
 
 LIBHEADER := xenctrl.h xenctrl_compat.h
 PKG_CONFIG := xencontrol.pc
diff --git a/tools/libs/devicemodel/Makefile b/tools/libs/devicemodel/Makefile
index a0a2d24f99..b70dd774e4 100644
--- a/tools/libs/devicemodel/Makefile
+++ b/tools/libs/devicemodel/Makefile
@@ -4,11 +4,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 MAJOR    = 1
 MINOR    = 4
 
-OBJS-y                 += core.o
-OBJS-$(CONFIG_Linux)   += common.o
-OBJS-$(CONFIG_FreeBSD) += common.o
-OBJS-$(CONFIG_SunOS)   += compat.o
-OBJS-$(CONFIG_NetBSD)  += compat.o
-OBJS-$(CONFIG_MiniOS)  += compat.o
+include Makefile.common
 
 include $(XEN_ROOT)/tools/libs/libs.mk
diff --git a/tools/libs/evtchn/Makefile b/tools/libs/evtchn/Makefile
index 8208ecf650..3dad3840c6 100644
--- a/tools/libs/evtchn/Makefile
+++ b/tools/libs/evtchn/Makefile
@@ -4,11 +4,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 MAJOR    = 1
 MINOR    = 2
 
-OBJS-y                 += core.o
-OBJS-$(CONFIG_Linux)   += linux.o
-OBJS-$(CONFIG_FreeBSD) += freebsd.o
-OBJS-$(CONFIG_SunOS)   += solaris.o
-OBJS-$(CONFIG_NetBSD)  += netbsd.o
-OBJS-$(CONFIG_MiniOS)  += minios.o
+include Makefile.common
 
 include $(XEN_ROOT)/tools/libs/libs.mk
diff --git a/tools/libs/foreignmemory/Makefile b/tools/libs/foreignmemory/Makefile
index 4427435932..b70dd774e4 100644
--- a/tools/libs/foreignmemory/Makefile
+++ b/tools/libs/foreignmemory/Makefile
@@ -4,11 +4,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 MAJOR    = 1
 MINOR    = 4
 
-OBJS-y                 += core.o
-OBJS-$(CONFIG_Linux)   += linux.o
-OBJS-$(CONFIG_FreeBSD) += freebsd.o
-OBJS-$(CONFIG_SunOS)   += compat.o solaris.o
-OBJS-$(CONFIG_NetBSD)  += netbsd.o
-OBJS-$(CONFIG_MiniOS)  += minios.o
+include Makefile.common
 
 include $(XEN_ROOT)/tools/libs/libs.mk
diff --git a/tools/libs/gnttab/Makefile b/tools/libs/gnttab/Makefile
index 7d7aeeadff..3dad3840c6 100644
--- a/tools/libs/gnttab/Makefile
+++ b/tools/libs/gnttab/Makefile
@@ -4,13 +4,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 MAJOR    = 1
 MINOR    = 2
 
-OBJS-GNTTAB            += gnttab_core.o
-OBJS-GNTSHR            += gntshr_core.o
-
-OBJS-$(CONFIG_Linux)   += $(OBJS-GNTTAB) $(OBJS-GNTSHR) linux.o
-OBJS-$(CONFIG_MiniOS)  += $(OBJS-GNTTAB) gntshr_unimp.o minios.o
-OBJS-$(CONFIG_FreeBSD) += $(OBJS-GNTTAB) $(OBJS-GNTSHR) freebsd.o
-OBJS-$(CONFIG_NetBSD)  += $(OBJS-GNTTAB) $(OBJS-GNTSHR) netbsd.o
-OBJS-$(CONFIG_SunOS)   += gnttab_unimp.o gntshr_unimp.o
+include Makefile.common
 
 include $(XEN_ROOT)/tools/libs/libs.mk
diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index 4f2373101f..19d3ff2fdb 100644
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -1,97 +1,11 @@
 XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-ifeq ($(CONFIG_LIBXC_MINIOS),y)
-# Save/restore of a domain is currently incompatible with a stubdom environment
-override CONFIG_MIGRATE := n
-endif
-
-OBJS-y += xg_private.o
-OBJS-y += xg_domain.o
-OBJS-y += xg_suspend.o
-OBJS-y += xg_resume.o
-ifeq ($(CONFIG_MIGRATE),y)
-OBJS-y += xg_sr_common.o
-OBJS-$(CONFIG_X86) += xg_sr_common_x86.o
-OBJS-$(CONFIG_X86) += xg_sr_common_x86_pv.o
-OBJS-$(CONFIG_X86) += xg_sr_restore_x86_pv.o
-OBJS-$(CONFIG_X86) += xg_sr_restore_x86_hvm.o
-OBJS-$(CONFIG_X86) += xg_sr_save_x86_pv.o
-OBJS-$(CONFIG_X86) += xg_sr_save_x86_hvm.o
-OBJS-y += xg_sr_restore.o
-OBJS-y += xg_sr_save.o
-OBJS-y += xg_offline_page.o
-else
-OBJS-y += xg_nomigrate.o
-endif
-OBJS-y       += xg_core.o
-OBJS-$(CONFIG_X86) += xg_core_x86.o
-OBJS-$(CONFIG_ARM) += xg_core_arm.o
-
-vpath %.c ../../../xen/common/libelf
-
-LIBELF_OBJS += libelf-tools.o libelf-loader.o
-LIBELF_OBJS += libelf-dominfo.o
-
-OBJS-y += $(LIBELF_OBJS)
-
-ifeq ($(CONFIG_X86),y) # Add libx86 to the build
-vpath %.c ../../../xen/lib/x86
-
-OBJS-y                 += cpuid.o msr.o policy.o
-endif
-
-# new domain builder
-OBJS-y                 += xg_dom_core.o
-OBJS-y                 += xg_dom_boot.o
-OBJS-y                 += xg_dom_elfloader.o
-OBJS-$(CONFIG_X86)     += xg_dom_bzimageloader.o
-OBJS-$(CONFIG_X86)     += xg_dom_decompress_lz4.o
-OBJS-$(CONFIG_X86)     += xg_dom_hvmloader.o
-OBJS-$(CONFIG_ARM)     += xg_dom_armzimageloader.o
-OBJS-y                 += xg_dom_binloader.o
-OBJS-y                 += xg_dom_compat_linux.o
-
-OBJS-$(CONFIG_X86)     += xg_dom_x86.o
-OBJS-$(CONFIG_X86)     += xg_cpuid_x86.o
-OBJS-$(CONFIG_ARM)     += xg_dom_arm.o
-
-ifeq ($(CONFIG_LIBXC_MINIOS),y)
-OBJS-y                 += xg_dom_decompress_unsafe.o
-OBJS-y                 += xg_dom_decompress_unsafe_bzip2.o
-OBJS-y                 += xg_dom_decompress_unsafe_lzma.o
-OBJS-y                 += xg_dom_decompress_unsafe_lzo1x.o
-OBJS-y                 += xg_dom_decompress_unsafe_xz.o
-OBJS-y                 += xg_dom_decompress_unsafe_zstd.o
-endif
-
-CFLAGS += -D__XEN_TOOLS__
-CFLAGS += -include $(XEN_ROOT)/tools/config.h
-CFLAGS += -iquote ../../../xen/common/libelf
-
-# To be able to include xc_private.h
-CFLAGS += -iquote $(XEN_libxenctrl)
-
-# Needed for posix_fadvise64() in xc_linux.c
-CFLAGS-$(CONFIG_Linux) += -D_GNU_SOURCE
-
-CFLAGS	+= $(PTHREAD_CFLAGS)
-CFLAGS	+= $(CFLAGS_libxentoollog)
-CFLAGS	+= $(CFLAGS_libxenevtchn)
-CFLAGS	+= $(CFLAGS_libxendevicemodel)
-
-# libxenguest includes xc_private.h, so needs this despite not using
-# this functionality directly.
-CFLAGS += $(CFLAGS_libxencall) $(CFLAGS_libxenforeignmemory)
-
-ifeq ($(CONFIG_MiniOS),y)
-ZLIB_CFLAGS :=
-ZLIB_LIBS :=
-endif
+include Makefile.common
 
 xg_dom_bzimageloader.o xg_dom_bzimageloader.opic: CFLAGS += $(ZLIB_CFLAGS)
 
-$(LIBELF_OBJS) $(LIBELF_OBJS:.o=.opic): CFLAGS += -Wno-pointer-sign
+$(LIBELF_OBJS:.o=.opic): CFLAGS += -Wno-pointer-sign
 
 LIBHEADER := xenguest.h
 
diff --git a/tools/libs/toolcore/Makefile b/tools/libs/toolcore/Makefile
index ce417ea648..0d92b68b3b 100644
--- a/tools/libs/toolcore/Makefile
+++ b/tools/libs/toolcore/Makefile
@@ -6,7 +6,7 @@ MINOR	= 0
 
 LIBHEADER := xentoolcore.h
 
-OBJS-y	+= handlereg.o
+include Makefile.common
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
diff --git a/tools/libs/toollog/Makefile b/tools/libs/toollog/Makefile
index c09aa02ba5..2361b8cbf1 100644
--- a/tools/libs/toollog/Makefile
+++ b/tools/libs/toollog/Makefile
@@ -4,7 +4,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 MAJOR	= 1
 MINOR	= 0
 
-OBJS-y	+= xtl_core.o
-OBJS-y	+= xtl_logger_stdio.o
+include Makefile.common
 
 include $(XEN_ROOT)/tools/libs/libs.mk
diff --git a/tools/libs/call/Makefile.common b/tools/libs/call/Makefile.common
new file mode 100644
index 0000000000..85e608f8ad
--- /dev/null
+++ b/tools/libs/call/Makefile.common
@@ -0,0 +1,6 @@
+OBJS-y                 += core.o buffer.o
+OBJS-$(CONFIG_Linux)   += linux.o
+OBJS-$(CONFIG_FreeBSD) += freebsd.o
+OBJS-$(CONFIG_SunOS)   += solaris.o
+OBJS-$(CONFIG_NetBSD)  += netbsd.o
+OBJS-$(CONFIG_MiniOS)  += minios.o
diff --git a/tools/libs/ctrl/Makefile.common b/tools/libs/ctrl/Makefile.common
new file mode 100644
index 0000000000..0a09c28fd3
--- /dev/null
+++ b/tools/libs/ctrl/Makefile.common
@@ -0,0 +1,44 @@
+OBJS-y       += xc_altp2m.o
+OBJS-y       += xc_cpupool.o
+OBJS-y       += xc_domain.o
+OBJS-y       += xc_evtchn.o
+OBJS-y       += xc_gnttab.o
+OBJS-y       += xc_misc.o
+OBJS-y       += xc_flask.o
+OBJS-y       += xc_physdev.o
+OBJS-y       += xc_private.o
+OBJS-y       += xc_csched.o
+OBJS-y       += xc_csched2.o
+OBJS-y       += xc_arinc653.o
+OBJS-y       += xc_rt.o
+OBJS-y       += xc_tbuf.o
+OBJS-y       += xc_pm.o
+OBJS-y       += xc_cpu_hotplug.o
+OBJS-y       += xc_vm_event.o
+OBJS-y       += xc_vmtrace.o
+OBJS-y       += xc_monitor.o
+OBJS-y       += xc_mem_paging.o
+OBJS-y       += xc_mem_access.o
+OBJS-y       += xc_memshr.o
+OBJS-y       += xc_hcall_buf.o
+OBJS-y       += xc_foreign_memory.o
+OBJS-y       += xc_kexec.o
+OBJS-y       += xc_resource.o
+OBJS-$(CONFIG_X86) += xc_psr.o
+OBJS-$(CONFIG_X86) += xc_pagetab.o
+OBJS-$(CONFIG_Linux) += xc_linux.o
+OBJS-$(CONFIG_FreeBSD) += xc_freebsd.o
+OBJS-$(CONFIG_SunOS) += xc_solaris.o
+OBJS-$(CONFIG_NetBSD) += xc_netbsd.o
+OBJS-$(CONFIG_NetBSDRump) += xc_netbsd.o
+OBJS-$(CONFIG_MiniOS) += xc_minios.o
+OBJS-y       += xc_evtchn_compat.o
+OBJS-y       += xc_gnttab_compat.o
+OBJS-y       += xc_devicemodel_compat.o
+
+CFLAGS   += -D__XEN_TOOLS__
+CFLAGS	+= $(PTHREAD_CFLAGS)
+CFLAGS += -include $(XEN_ROOT)/tools/config.h
+
+# Needed for posix_fadvise64() in xc_linux.c
+CFLAGS-$(CONFIG_Linux) += -D_GNU_SOURCE
diff --git a/tools/libs/devicemodel/Makefile.common b/tools/libs/devicemodel/Makefile.common
new file mode 100644
index 0000000000..a7bf7c35bb
--- /dev/null
+++ b/tools/libs/devicemodel/Makefile.common
@@ -0,0 +1,6 @@
+OBJS-y                 += core.o
+OBJS-$(CONFIG_Linux)   += common.o
+OBJS-$(CONFIG_FreeBSD) += common.o
+OBJS-$(CONFIG_SunOS)   += compat.o
+OBJS-$(CONFIG_NetBSD)  += compat.o
+OBJS-$(CONFIG_MiniOS)  += compat.o
diff --git a/tools/libs/evtchn/Makefile.common b/tools/libs/evtchn/Makefile.common
new file mode 100644
index 0000000000..20629f521a
--- /dev/null
+++ b/tools/libs/evtchn/Makefile.common
@@ -0,0 +1,6 @@
+OBJS-y                 += core.o
+OBJS-$(CONFIG_Linux)   += linux.o
+OBJS-$(CONFIG_FreeBSD) += freebsd.o
+OBJS-$(CONFIG_SunOS)   += solaris.o
+OBJS-$(CONFIG_NetBSD)  += netbsd.o
+OBJS-$(CONFIG_MiniOS)  += minios.o
diff --git a/tools/libs/foreignmemory/Makefile.common b/tools/libs/foreignmemory/Makefile.common
new file mode 100644
index 0000000000..ff3b1d4f3e
--- /dev/null
+++ b/tools/libs/foreignmemory/Makefile.common
@@ -0,0 +1,6 @@
+OBJS-y                 += core.o
+OBJS-$(CONFIG_Linux)   += linux.o
+OBJS-$(CONFIG_FreeBSD) += freebsd.o
+OBJS-$(CONFIG_SunOS)   += compat.o solaris.o
+OBJS-$(CONFIG_NetBSD)  += netbsd.o
+OBJS-$(CONFIG_MiniOS)  += minios.o
diff --git a/tools/libs/gnttab/Makefile.common b/tools/libs/gnttab/Makefile.common
new file mode 100644
index 0000000000..759e36e1cb
--- /dev/null
+++ b/tools/libs/gnttab/Makefile.common
@@ -0,0 +1,8 @@
+OBJS-GNTTAB            += gnttab_core.o
+OBJS-GNTSHR            += gntshr_core.o
+
+OBJS-$(CONFIG_Linux)   += $(OBJS-GNTTAB) $(OBJS-GNTSHR) linux.o
+OBJS-$(CONFIG_MiniOS)  += $(OBJS-GNTTAB) gntshr_unimp.o minios.o
+OBJS-$(CONFIG_FreeBSD) += $(OBJS-GNTTAB) $(OBJS-GNTSHR) freebsd.o
+OBJS-$(CONFIG_NetBSD)  += $(OBJS-GNTTAB) $(OBJS-GNTSHR) netbsd.o
+OBJS-$(CONFIG_SunOS)   += gnttab_unimp.o gntshr_unimp.o
diff --git a/tools/libs/guest/Makefile.common b/tools/libs/guest/Makefile.common
new file mode 100644
index 0000000000..a026a2f662
--- /dev/null
+++ b/tools/libs/guest/Makefile.common
@@ -0,0 +1,84 @@
+ifeq ($(CONFIG_LIBXC_MINIOS),y)
+# Save/restore of a domain is currently incompatible with a stubdom environment
+override CONFIG_MIGRATE := n
+endif
+
+OBJS-y += xg_private.o
+OBJS-y += xg_domain.o
+OBJS-y += xg_suspend.o
+OBJS-y += xg_resume.o
+ifeq ($(CONFIG_MIGRATE),y)
+OBJS-y += xg_sr_common.o
+OBJS-$(CONFIG_X86) += xg_sr_common_x86.o
+OBJS-$(CONFIG_X86) += xg_sr_common_x86_pv.o
+OBJS-$(CONFIG_X86) += xg_sr_restore_x86_pv.o
+OBJS-$(CONFIG_X86) += xg_sr_restore_x86_hvm.o
+OBJS-$(CONFIG_X86) += xg_sr_save_x86_pv.o
+OBJS-$(CONFIG_X86) += xg_sr_save_x86_hvm.o
+OBJS-y += xg_sr_restore.o
+OBJS-y += xg_sr_save.o
+OBJS-y += xg_offline_page.o
+else
+OBJS-y += xg_nomigrate.o
+endif
+OBJS-y       += xg_core.o
+OBJS-$(CONFIG_X86) += xg_core_x86.o
+OBJS-$(CONFIG_ARM) += xg_core_arm.o
+
+vpath %.c ../../../xen/common/libelf
+
+LIBELF_OBJS += libelf-tools.o libelf-loader.o
+LIBELF_OBJS += libelf-dominfo.o
+
+OBJS-y += $(LIBELF_OBJS)
+
+ifeq ($(CONFIG_X86),y) # Add libx86 to the build
+vpath %.c ../../../xen/lib/x86
+
+OBJS-y                 += cpuid.o msr.o policy.o
+endif
+
+# new domain builder
+OBJS-y                 += xg_dom_core.o
+OBJS-y                 += xg_dom_boot.o
+OBJS-y                 += xg_dom_elfloader.o
+OBJS-$(CONFIG_X86)     += xg_dom_bzimageloader.o
+OBJS-$(CONFIG_X86)     += xg_dom_decompress_lz4.o
+OBJS-$(CONFIG_X86)     += xg_dom_hvmloader.o
+OBJS-$(CONFIG_ARM)     += xg_dom_armzimageloader.o
+OBJS-y                 += xg_dom_binloader.o
+OBJS-y                 += xg_dom_compat_linux.o
+
+OBJS-$(CONFIG_X86)     += xg_dom_x86.o
+OBJS-$(CONFIG_X86)     += xg_cpuid_x86.o
+OBJS-$(CONFIG_ARM)     += xg_dom_arm.o
+
+ifeq ($(CONFIG_LIBXC_MINIOS),y)
+OBJS-y                 += xg_dom_decompress_unsafe.o
+OBJS-y                 += xg_dom_decompress_unsafe_bzip2.o
+OBJS-y                 += xg_dom_decompress_unsafe_lzma.o
+OBJS-y                 += xg_dom_decompress_unsafe_lzo1x.o
+OBJS-y                 += xg_dom_decompress_unsafe_xz.o
+OBJS-y                 += xg_dom_decompress_unsafe_zstd.o
+endif
+
+CFLAGS += -D__XEN_TOOLS__
+CFLAGS += -include $(XEN_ROOT)/tools/config.h
+CFLAGS += -iquote ../../../xen/common/libelf
+
+# To be able to include xc_private.h
+CFLAGS += -iquote $(XEN_libxenctrl)
+
+# Needed for posix_fadvise64() in xc_linux.c
+CFLAGS-$(CONFIG_Linux) += -D_GNU_SOURCE
+
+CFLAGS	+= $(PTHREAD_CFLAGS)
+CFLAGS	+= $(CFLAGS_libxentoollog)
+CFLAGS	+= $(CFLAGS_libxenevtchn)
+CFLAGS	+= $(CFLAGS_libxendevicemodel)
+
+# libxenguest includes xc_private.h, so needs this despite not using
+# this functionality directly.
+CFLAGS += $(CFLAGS_libxencall) $(CFLAGS_libxenforeignmemory)
+
+$(LIBELF_OBJS): CFLAGS += -Wno-pointer-sign
diff --git a/tools/libs/toolcore/Makefile.common b/tools/libs/toolcore/Makefile.common
new file mode 100644
index 0000000000..9ade6c12bf
--- /dev/null
+++ b/tools/libs/toolcore/Makefile.common
@@ -0,0 +1 @@
+OBJS-y	+= handlereg.o
diff --git a/tools/libs/toollog/Makefile.common b/tools/libs/toollog/Makefile.common
new file mode 100644
index 0000000000..c053ac6a73
--- /dev/null
+++ b/tools/libs/toollog/Makefile.common
@@ -0,0 +1,2 @@
+OBJS-y	+= xtl_core.o
+OBJS-y	+= xtl_logger_stdio.o
-- 
Anthony PERARD


