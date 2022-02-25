Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 468C94C4880
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:16:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279253.476945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcKV-0007bH-Kp; Fri, 25 Feb 2022 15:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279253.476945; Fri, 25 Feb 2022 15:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcKV-0007YM-CF; Fri, 25 Feb 2022 15:16:23 +0000
Received: by outflank-mailman (input) for mailman id 279253;
 Fri, 25 Feb 2022 15:16:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcIJ-0007Bf-Uj
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:14:08 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91582a91-964d-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 16:14:05 +0100 (CET)
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
X-Inumbo-ID: 91582a91-964d-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802044;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ADC2Vsrbqitg8mHjAC2JFay6LpiS741rs0NhF3hf1d8=;
  b=WG+exY38dYAFDxNd8b4Ae3sKHjWtilQCpiCYkbcHHcBom7GJL5Ei211x
   fLcn63/imCNHUZ3p36csZRggP8lB14Xw5y+pxL29A3SY+29xtOfRdP1ed
   jyuVjlq+J8ypRr9LvX6iwr1fSJA1R1V+BMYpmuQiYlitVuvgI46L4WBQi
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65407577
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/KTYKKDrqHYTFxVW/1Pjw5YqxClBgxIJ4kV8jS/XYbTApDlz1mAAm
 2MYW2DQP/uIazT3L48kbYSxo0pSvJDXx4dgQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Rj39Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhWl
 NlHtaHoFjsIAabdhs4+aCJ/Oh1HaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp4TQa6BO
 pVGAdZpRC+DUxtOA3MRMpwZzP+C3UDwMDtDoV3A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru/WvjBQoBHMeC0jfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKaljlAV9BQLrVl1CCywbvKySWiPU8tcgcUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/4+SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFRON/Ni2+AswGzARN8wGCxFAjpU
 J8swZX20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4MvW4ifRs0ap5cIVcFh
 XM/XysLtfe/21PwMMdKj3+ZUZx2ncAM6/y/PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1ulAv7GMGgpzz6gOX2WZJgYepcWLd4Rrtit/3sTcS82
 4s3CvZmPD0ECLyuOnSMqNVLRb3IRFBiba3LRwVsXrbrCmJb9KsJUpc9HZtJl1RZoplo
IronPort-HdrOrdr: A9a23:HPOWV6y9TrUYmc/ULQneKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7ZImPH7P+U4ssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkGNDSaNzlHZKjBjzVQa+xQouW6zA==
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="65407577"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 17/29] libs: Rename $(SRCS-y) to $(OBJS-y)
Date: Fri, 25 Feb 2022 15:13:09 +0000
Message-ID: <20220225151321.44126-18-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The only thing done thing done with $(SRCS-y) is to replace ".c" by
".o". It is more useful to collect which object we want to build as
make will figure out how to build it and from which source file.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---

Notes:
    v2:
    - reviewed

 tools/libs/call/Makefile          |  12 +--
 tools/libs/ctrl/Makefile          |  74 +++++++-------
 tools/libs/devicemodel/Makefile   |  12 +--
 tools/libs/evtchn/Makefile        |  12 +--
 tools/libs/foreignmemory/Makefile |  12 +--
 tools/libs/gnttab/Makefile        |  14 +--
 tools/libs/guest/Makefile         |  86 ++++++++--------
 tools/libs/hypfs/Makefile         |   2 +-
 tools/libs/light/Makefile         | 162 +++++++++++++++---------------
 tools/libs/stat/Makefile          |  12 +--
 tools/libs/store/Makefile         |   4 +-
 tools/libs/toolcore/Makefile      |   2 +-
 tools/libs/toollog/Makefile       |   4 +-
 tools/libs/util/Makefile          |  16 +--
 tools/libs/vchan/Makefile         |   4 +-
 tools/libs/libs.mk                |   7 +-
 16 files changed, 217 insertions(+), 218 deletions(-)

diff --git a/tools/libs/call/Makefile b/tools/libs/call/Makefile
index 93d404b79e..e5cb7c937c 100644
--- a/tools/libs/call/Makefile
+++ b/tools/libs/call/Makefile
@@ -4,11 +4,11 @@ include $(XEN_ROOT)/tools/Rules.mk
 MAJOR    = 1
 MINOR    = 3
 
-SRCS-y                 += core.c buffer.c
-SRCS-$(CONFIG_Linux)   += linux.c
-SRCS-$(CONFIG_FreeBSD) += freebsd.c
-SRCS-$(CONFIG_SunOS)   += solaris.c
-SRCS-$(CONFIG_NetBSD)  += netbsd.c
-SRCS-$(CONFIG_MiniOS)  += minios.c
+OBJS-y                 += core.o buffer.o
+OBJS-$(CONFIG_Linux)   += linux.o
+OBJS-$(CONFIG_FreeBSD) += freebsd.o
+OBJS-$(CONFIG_SunOS)   += solaris.o
+OBJS-$(CONFIG_NetBSD)  += netbsd.o
+OBJS-$(CONFIG_MiniOS)  += minios.o
 
 include $(XEN_ROOT)/tools/libs/libs.mk
diff --git a/tools/libs/ctrl/Makefile b/tools/libs/ctrl/Makefile
index f58c4ef1aa..5fd06949f1 100644
--- a/tools/libs/ctrl/Makefile
+++ b/tools/libs/ctrl/Makefile
@@ -1,43 +1,43 @@
 XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-SRCS-y       += xc_altp2m.c
-SRCS-y       += xc_cpupool.c
-SRCS-y       += xc_domain.c
-SRCS-y       += xc_evtchn.c
-SRCS-y       += xc_gnttab.c
-SRCS-y       += xc_misc.c
-SRCS-y       += xc_flask.c
-SRCS-y       += xc_physdev.c
-SRCS-y       += xc_private.c
-SRCS-y       += xc_csched.c
-SRCS-y       += xc_csched2.c
-SRCS-y       += xc_arinc653.c
-SRCS-y       += xc_rt.c
-SRCS-y       += xc_tbuf.c
-SRCS-y       += xc_pm.c
-SRCS-y       += xc_cpu_hotplug.c
-SRCS-y       += xc_vm_event.c
-SRCS-y       += xc_vmtrace.c
-SRCS-y       += xc_monitor.c
-SRCS-y       += xc_mem_paging.c
-SRCS-y       += xc_mem_access.c
-SRCS-y       += xc_memshr.c
-SRCS-y       += xc_hcall_buf.c
-SRCS-y       += xc_foreign_memory.c
-SRCS-y       += xc_kexec.c
-SRCS-y       += xc_resource.c
-SRCS-$(CONFIG_X86) += xc_psr.c
-SRCS-$(CONFIG_X86) += xc_pagetab.c
-SRCS-$(CONFIG_Linux) += xc_linux.c
-SRCS-$(CONFIG_FreeBSD) += xc_freebsd.c
-SRCS-$(CONFIG_SunOS) += xc_solaris.c
-SRCS-$(CONFIG_NetBSD) += xc_netbsd.c
-SRCS-$(CONFIG_NetBSDRump) += xc_netbsd.c
-SRCS-$(CONFIG_MiniOS) += xc_minios.c
-SRCS-y       += xc_evtchn_compat.c
-SRCS-y       += xc_gnttab_compat.c
-SRCS-y       += xc_devicemodel_compat.c
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
 
 CFLAGS   += -D__XEN_TOOLS__
 CFLAGS	+= $(PTHREAD_CFLAGS)
diff --git a/tools/libs/devicemodel/Makefile b/tools/libs/devicemodel/Makefile
index 3e50ff6d90..a0a2d24f99 100644
--- a/tools/libs/devicemodel/Makefile
+++ b/tools/libs/devicemodel/Makefile
@@ -4,11 +4,11 @@ include $(XEN_ROOT)/tools/Rules.mk
 MAJOR    = 1
 MINOR    = 4
 
-SRCS-y                 += core.c
-SRCS-$(CONFIG_Linux)   += common.c
-SRCS-$(CONFIG_FreeBSD) += common.c
-SRCS-$(CONFIG_SunOS)   += compat.c
-SRCS-$(CONFIG_NetBSD)  += compat.c
-SRCS-$(CONFIG_MiniOS)  += compat.c
+OBJS-y                 += core.o
+OBJS-$(CONFIG_Linux)   += common.o
+OBJS-$(CONFIG_FreeBSD) += common.o
+OBJS-$(CONFIG_SunOS)   += compat.o
+OBJS-$(CONFIG_NetBSD)  += compat.o
+OBJS-$(CONFIG_MiniOS)  += compat.o
 
 include $(XEN_ROOT)/tools/libs/libs.mk
diff --git a/tools/libs/evtchn/Makefile b/tools/libs/evtchn/Makefile
index b8c37b5b97..8208ecf650 100644
--- a/tools/libs/evtchn/Makefile
+++ b/tools/libs/evtchn/Makefile
@@ -4,11 +4,11 @@ include $(XEN_ROOT)/tools/Rules.mk
 MAJOR    = 1
 MINOR    = 2
 
-SRCS-y                 += core.c
-SRCS-$(CONFIG_Linux)   += linux.c
-SRCS-$(CONFIG_FreeBSD) += freebsd.c
-SRCS-$(CONFIG_SunOS)   += solaris.c
-SRCS-$(CONFIG_NetBSD)  += netbsd.c
-SRCS-$(CONFIG_MiniOS)  += minios.c
+OBJS-y                 += core.o
+OBJS-$(CONFIG_Linux)   += linux.o
+OBJS-$(CONFIG_FreeBSD) += freebsd.o
+OBJS-$(CONFIG_SunOS)   += solaris.o
+OBJS-$(CONFIG_NetBSD)  += netbsd.o
+OBJS-$(CONFIG_MiniOS)  += minios.o
 
 include $(XEN_ROOT)/tools/libs/libs.mk
diff --git a/tools/libs/foreignmemory/Makefile b/tools/libs/foreignmemory/Makefile
index 0eb9a3a712..4427435932 100644
--- a/tools/libs/foreignmemory/Makefile
+++ b/tools/libs/foreignmemory/Makefile
@@ -4,11 +4,11 @@ include $(XEN_ROOT)/tools/Rules.mk
 MAJOR    = 1
 MINOR    = 4
 
-SRCS-y                 += core.c
-SRCS-$(CONFIG_Linux)   += linux.c
-SRCS-$(CONFIG_FreeBSD) += freebsd.c
-SRCS-$(CONFIG_SunOS)   += compat.c solaris.c
-SRCS-$(CONFIG_NetBSD)  += netbsd.c
-SRCS-$(CONFIG_MiniOS)  += minios.c
+OBJS-y                 += core.o
+OBJS-$(CONFIG_Linux)   += linux.o
+OBJS-$(CONFIG_FreeBSD) += freebsd.o
+OBJS-$(CONFIG_SunOS)   += compat.o solaris.o
+OBJS-$(CONFIG_NetBSD)  += netbsd.o
+OBJS-$(CONFIG_MiniOS)  += minios.o
 
 include $(XEN_ROOT)/tools/libs/libs.mk
diff --git a/tools/libs/gnttab/Makefile b/tools/libs/gnttab/Makefile
index ae390ce60f..7d7aeeadff 100644
--- a/tools/libs/gnttab/Makefile
+++ b/tools/libs/gnttab/Makefile
@@ -4,13 +4,13 @@ include $(XEN_ROOT)/tools/Rules.mk
 MAJOR    = 1
 MINOR    = 2
 
-SRCS-GNTTAB            += gnttab_core.c
-SRCS-GNTSHR            += gntshr_core.c
+OBJS-GNTTAB            += gnttab_core.o
+OBJS-GNTSHR            += gntshr_core.o
 
-SRCS-$(CONFIG_Linux)   += $(SRCS-GNTTAB) $(SRCS-GNTSHR) linux.c
-SRCS-$(CONFIG_MiniOS)  += $(SRCS-GNTTAB) gntshr_unimp.c minios.c
-SRCS-$(CONFIG_FreeBSD) += $(SRCS-GNTTAB) $(SRCS-GNTSHR) freebsd.c
-SRCS-$(CONFIG_NetBSD)  += $(SRCS-GNTTAB) $(SRCS-GNTSHR) netbsd.c
-SRCS-$(CONFIG_SunOS)   += gnttab_unimp.c gntshr_unimp.c
+OBJS-$(CONFIG_Linux)   += $(OBJS-GNTTAB) $(OBJS-GNTSHR) linux.o
+OBJS-$(CONFIG_MiniOS)  += $(OBJS-GNTTAB) gntshr_unimp.o minios.o
+OBJS-$(CONFIG_FreeBSD) += $(OBJS-GNTTAB) $(OBJS-GNTSHR) freebsd.o
+OBJS-$(CONFIG_NetBSD)  += $(OBJS-GNTTAB) $(OBJS-GNTSHR) netbsd.o
+OBJS-$(CONFIG_SunOS)   += gnttab_unimp.o gntshr_unimp.o
 
 include $(XEN_ROOT)/tools/libs/libs.mk
diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index 56483c545f..17eb0ebf4b 100644
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -6,69 +6,69 @@ ifeq ($(CONFIG_LIBXC_MINIOS),y)
 override CONFIG_MIGRATE := n
 endif
 
-SRCS-y += xg_private.c
-SRCS-y += xg_domain.c
-SRCS-y += xg_suspend.c
-SRCS-y += xg_resume.c
+OBJS-y += xg_private.o
+OBJS-y += xg_domain.o
+OBJS-y += xg_suspend.o
+OBJS-y += xg_resume.o
 ifeq ($(CONFIG_MIGRATE),y)
-SRCS-y += xg_sr_common.c
-SRCS-$(CONFIG_X86) += xg_sr_common_x86.c
-SRCS-$(CONFIG_X86) += xg_sr_common_x86_pv.c
-SRCS-$(CONFIG_X86) += xg_sr_restore_x86_pv.c
-SRCS-$(CONFIG_X86) += xg_sr_restore_x86_hvm.c
-SRCS-$(CONFIG_X86) += xg_sr_save_x86_pv.c
-SRCS-$(CONFIG_X86) += xg_sr_save_x86_hvm.c
-SRCS-y += xg_sr_restore.c
-SRCS-y += xg_sr_save.c
-SRCS-y += xg_offline_page.c
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
 else
-SRCS-y += xg_nomigrate.c
+OBJS-y += xg_nomigrate.o
 endif
-SRCS-y       += xg_core.c
-SRCS-$(CONFIG_X86) += xg_core_x86.c
-SRCS-$(CONFIG_ARM) += xg_core_arm.c
+OBJS-y       += xg_core.o
+OBJS-$(CONFIG_X86) += xg_core_x86.o
+OBJS-$(CONFIG_ARM) += xg_core_arm.o
 
 CFLAGS += -I$(XEN_libxenctrl)
 
 vpath %.c ../../../xen/common/libelf
 CFLAGS += -I../../../xen/common/libelf
 
-ELF_SRCS-y += libelf-tools.c libelf-loader.c
-ELF_SRCS-y += libelf-dominfo.c
+ELF_OBJS-y += libelf-tools.o libelf-loader.o
+ELF_OBJS-y += libelf-dominfo.o
 
-SRCS-y += $(ELF_SRCS-y)
+OBJS-y += $(ELF_OBJS-y)
 
-$(patsubst %.c,%.o,$(ELF_SRCS-y)): CFLAGS += -Wno-pointer-sign
-$(patsubst %.c,%.opic,$(ELF_SRCS-y)): CFLAGS += -Wno-pointer-sign
+$(ELF_OBJS-y): CFLAGS += -Wno-pointer-sign
+$(ELF_OBJS-y:.o=.opic): CFLAGS += -Wno-pointer-sign
 
 ifeq ($(CONFIG_X86),y) # Add libx86 to the build
 vpath %.c ../../../xen/lib/x86
 
-SRCS-y                 += cpuid.c msr.c policy.c
+OBJS-y                 += cpuid.o msr.o policy.o
 endif
 
 # new domain builder
-SRCS-y                 += xg_dom_core.c
-SRCS-y                 += xg_dom_boot.c
-SRCS-y                 += xg_dom_elfloader.c
-SRCS-$(CONFIG_X86)     += xg_dom_bzimageloader.c
-SRCS-$(CONFIG_X86)     += xg_dom_decompress_lz4.c
-SRCS-$(CONFIG_X86)     += xg_dom_hvmloader.c
-SRCS-$(CONFIG_ARM)     += xg_dom_armzimageloader.c
-SRCS-y                 += xg_dom_binloader.c
-SRCS-y                 += xg_dom_compat_linux.c
-
-SRCS-$(CONFIG_X86)     += xg_dom_x86.c
-SRCS-$(CONFIG_X86)     += xg_cpuid_x86.c
-SRCS-$(CONFIG_ARM)     += xg_dom_arm.c
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
 
 ifeq ($(CONFIG_LIBXC_MINIOS),y)
-SRCS-y                 += xg_dom_decompress_unsafe.c
-SRCS-y                 += xg_dom_decompress_unsafe_bzip2.c
-SRCS-y                 += xg_dom_decompress_unsafe_lzma.c
-SRCS-y                 += xg_dom_decompress_unsafe_lzo1x.c
-SRCS-y                 += xg_dom_decompress_unsafe_xz.c
-SRCS-y                 += xg_dom_decompress_unsafe_zstd.c
+OBJS-y                 += xg_dom_decompress_unsafe.o
+OBJS-y                 += xg_dom_decompress_unsafe_bzip2.o
+OBJS-y                 += xg_dom_decompress_unsafe_lzma.o
+OBJS-y                 += xg_dom_decompress_unsafe_lzo1x.o
+OBJS-y                 += xg_dom_decompress_unsafe_xz.o
+OBJS-y                 += xg_dom_decompress_unsafe_zstd.o
 endif
 
 CFLAGS   += -Werror -Wmissing-prototypes
diff --git a/tools/libs/hypfs/Makefile b/tools/libs/hypfs/Makefile
index efa955bd50..630e1e6f3e 100644
--- a/tools/libs/hypfs/Makefile
+++ b/tools/libs/hypfs/Makefile
@@ -6,6 +6,6 @@ MINOR    = 0
 
 LDLIBS += -lz
 
-SRCS-y                 += core.c
+OBJS-y += core.o
 
 include ../libs.mk
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 0c04a5b5cb..13545654c2 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -1,31 +1,31 @@
 XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-SRCS-y += osdeps.c
-SRCS-y += libxl_paths.c
-SRCS-y += libxl_bootloader.c
-SRCS-y += flexarray.c
+OBJS-y += osdeps.o
+OBJS-y += libxl_paths.o
+OBJS-y += libxl_bootloader.o
+OBJS-y += flexarray.o
 ifeq ($(CONFIG_LIBNL),y)
-SRCS-y += libxl_netbuffer.c
+OBJS-y += libxl_netbuffer.o
 else
-SRCS-y += libxl_nonetbuffer.c
+OBJS-y += libxl_nonetbuffer.o
 endif
 ifeq ($(CONFIG_X86),y)
-SRCS-y += libxl_convert_callout.c
+OBJS-y += libxl_convert_callout.o
 else
-SRCS-y += libxl_no_convert_callout.c
+OBJS-y += libxl_no_convert_callout.o
 endif
-SRCS-y += libxl_remus.c
-SRCS-y += libxl_checkpoint_device.c
-SRCS-y += libxl_remus_disk_drbd.c
+OBJS-y += libxl_remus.o
+OBJS-y += libxl_checkpoint_device.o
+OBJS-y += libxl_remus_disk_drbd.o
 ifeq ($(CONFIG_LIBNL),y)
-SRCS-y += libxl_colo_restore.c
-SRCS-y += libxl_colo_save.c
-SRCS-y += libxl_colo_qdisk.c
-SRCS-y += libxl_colo_proxy.c
-SRCS-y += libxl_colo_nic.c
+OBJS-y += libxl_colo_restore.o
+OBJS-y += libxl_colo_save.o
+OBJS-y += libxl_colo_qdisk.o
+OBJS-y += libxl_colo_proxy.o
+OBJS-y += libxl_colo_nic.o
 else
-SRCS-y += libxl_no_colo.c
+OBJS-y += libxl_no_colo.o
 endif
 
 ACPI_PATH  = $(XEN_ROOT)/tools/libacpi
@@ -40,82 +40,82 @@ vpath static_tables.c $(ACPI_PATH)/
 acpi:
 	$(MAKE) -C $(ACPI_PATH) ACPI_BUILD_DIR=$(CURDIR) DSDT_FILES="$(DSDT_FILES-y)"
 
-SRCS-$(CONFIG_X86) += $(ACPI_OBJS:.o=.c)
+OBJS-$(CONFIG_X86) += $(ACPI_OBJS)
 
 CFLAGS += -Wno-format-zero-length -Wmissing-declarations \
 	-Wno-declaration-after-statement -Wformat-nonliteral
 
 CFLAGS-$(CONFIG_X86) += -DCONFIG_PCI_SUPP_LEGACY_IRQ
 
-SRCS-$(CONFIG_X86) += libxl_cpuid.c
-SRCS-$(CONFIG_X86) += libxl_x86.c
-SRCS-$(CONFIG_X86) += libxl_psr.c
-SRCS-$(CONFIG_X86) += libxl_x86_acpi.c
-SRCS-$(CONFIG_ARM) += libxl_nocpuid.c
-SRCS-$(CONFIG_ARM) += libxl_arm.c
-SRCS-$(CONFIG_ARM) += libxl_libfdt_compat.c
+OBJS-$(CONFIG_X86) += libxl_cpuid.o
+OBJS-$(CONFIG_X86) += libxl_x86.o
+OBJS-$(CONFIG_X86) += libxl_psr.o
+OBJS-$(CONFIG_X86) += libxl_x86_acpi.o
+OBJS-$(CONFIG_ARM) += libxl_nocpuid.o
+OBJS-$(CONFIG_ARM) += libxl_arm.o
+OBJS-$(CONFIG_ARM) += libxl_libfdt_compat.o
 ifeq ($(CONFIG_ARM_64),y)
 DSDT_FILES-y = dsdt_anycpu_arm.c
-SRCS-y += libxl_arm_acpi.c
-SRCS-y += $(DSDT_FILES-y)
+OBJS-y += libxl_arm_acpi.o
+OBJS-y += $(DSDT_FILES-y:.c=.o)
 dsdt_anycpu_arm.c:
 	$(MAKE) -C $(ACPI_PATH) ACPI_BUILD_DIR=$(CURDIR) DSDT_FILES="$(DSDT_FILES-y)"
 else
-SRCS-$(CONFIG_ARM) += libxl_arm_no_acpi.c
+OBJS-$(CONFIG_ARM) += libxl_arm_no_acpi.o
 endif
 
-SRCS-OS-$(CONFIG_NetBSD) = libxl_netbsd.c
-SRCS-OS-$(CONFIG_Linux) = libxl_linux.c libxl_setresuid.c
-SRCS-OS-$(CONFIG_FreeBSD) = libxl_freebsd.c libxl_setresuid.c
-ifeq ($(SRCS-OS-y),)
+OBJS-OS-$(CONFIG_NetBSD) = libxl_netbsd.o
+OBJS-OS-$(CONFIG_Linux) = libxl_linux.o libxl_setresuid.o
+OBJS-OS-$(CONFIG_FreeBSD) = libxl_freebsd.o libxl_setresuid.o
+ifeq ($(OBJS-OS-y),)
 $(error Your Operating System is not supported by libxenlight, \
 please check libxl_linux.c and libxl_netbsd.c to see how to get it ported)
 endif
-SRCS-y += $(SRCS-OS-y)
-
-SRCS-y += libxl.c
-SRCS-y += libxl_create.c
-SRCS-y += libxl_dm.c
-SRCS-y += libxl_pci.c
-SRCS-y += libxl_dom.c
-SRCS-y += libxl_exec.c
-SRCS-y += libxl_xshelp.c
-SRCS-y += libxl_device.c
-SRCS-y += libxl_internal.c
-SRCS-y += libxl_utils.c
-SRCS-y += libxl_uuid.c
-SRCS-y += libxl_json.c
-SRCS-y += libxl_aoutils.c
-SRCS-y += libxl_numa.c
-SRCS-y += libxl_vnuma.c
-SRCS-y += libxl_stream_read.c
-SRCS-y += libxl_stream_write.c
-SRCS-y += libxl_save_callout.c
-SRCS-y += _libxl_save_msgs_callout.c
-SRCS-y += libxl_qmp.c
-SRCS-y += libxl_event.c
-SRCS-y += libxl_fork.c
-SRCS-y += libxl_dom_suspend.c
-SRCS-y += libxl_dom_save.c
-SRCS-y += libxl_usb.c
-SRCS-y += libxl_vtpm.c
-SRCS-y += libxl_nic.c
-SRCS-y += libxl_disk.c
-SRCS-y += libxl_console.c
-SRCS-y += libxl_cpupool.c
-SRCS-y += libxl_mem.c
-SRCS-y += libxl_sched.c
-SRCS-y += libxl_tmem.c
-SRCS-y += libxl_9pfs.c
-SRCS-y += libxl_domain.c
-SRCS-y += libxl_vdispl.c
-SRCS-y += libxl_pvcalls.c
-SRCS-y += libxl_vsnd.c
-SRCS-y += libxl_vkb.c
-SRCS-y += libxl_genid.c
-SRCS-y += _libxl_types.c
-SRCS-y += libxl_flask.c
-SRCS-y += _libxl_types_internal.c
+OBJS-y += $(OBJS-OS-y)
+
+OBJS-y += libxl.o
+OBJS-y += libxl_create.o
+OBJS-y += libxl_dm.o
+OBJS-y += libxl_pci.o
+OBJS-y += libxl_dom.o
+OBJS-y += libxl_exec.o
+OBJS-y += libxl_xshelp.o
+OBJS-y += libxl_device.o
+OBJS-y += libxl_internal.o
+OBJS-y += libxl_utils.o
+OBJS-y += libxl_uuid.o
+OBJS-y += libxl_json.o
+OBJS-y += libxl_aoutils.o
+OBJS-y += libxl_numa.o
+OBJS-y += libxl_vnuma.o
+OBJS-y += libxl_stream_read.o
+OBJS-y += libxl_stream_write.o
+OBJS-y += libxl_save_callout.o
+OBJS-y += _libxl_save_msgs_callout.o
+OBJS-y += libxl_qmp.o
+OBJS-y += libxl_event.o
+OBJS-y += libxl_fork.o
+OBJS-y += libxl_dom_suspend.o
+OBJS-y += libxl_dom_save.o
+OBJS-y += libxl_usb.o
+OBJS-y += libxl_vtpm.o
+OBJS-y += libxl_nic.o
+OBJS-y += libxl_disk.o
+OBJS-y += libxl_console.o
+OBJS-y += libxl_cpupool.o
+OBJS-y += libxl_mem.o
+OBJS-y += libxl_sched.o
+OBJS-y += libxl_tmem.o
+OBJS-y += libxl_9pfs.o
+OBJS-y += libxl_domain.o
+OBJS-y += libxl_vdispl.o
+OBJS-y += libxl_pvcalls.o
+OBJS-y += libxl_vsnd.o
+OBJS-y += libxl_vkb.o
+OBJS-y += libxl_genid.o
+OBJS-y += _libxl_types.o
+OBJS-y += libxl_flask.o
+OBJS-y += _libxl_types_internal.o
 
 ifeq ($(CONFIG_LIBNL),y)
 CFLAGS_LIBXL += $(LIBNL3_CFLAGS)
@@ -175,7 +175,7 @@ LDLIBS-y += $(PTHREAD_LIBS)
 LDLIBS-y += -lyajl
 LDLIBS += $(LDLIBS-y)
 
-$(LIB_OBJS) $(PIC_OBJS) $(LIBXL_TEST_OBJS): CFLAGS += $(CFLAGS_LIBXL) -include $(XEN_ROOT)/tools/config.h
+$(OBJS-y) $(PIC_OBJS) $(LIBXL_TEST_OBJS): CFLAGS += $(CFLAGS_LIBXL) -include $(XEN_ROOT)/tools/config.h
 $(ACPI_OBJS) $(ACPI_PIC_OBJS): CFLAGS += -I. -DLIBACPI_STDUTILS=\"$(CURDIR)/libxl_x86_acpi.h\"
 $(TEST_PROG_OBJS) _libxl.api-for-check: CFLAGS += $(CFLAGS_libxentoollog) $(CFLAGS_libxentoolcore)
 libxl_dom.o libxl_dom.opic: CFLAGS += -I$(XEN_ROOT)/tools  # include libacpi/x86.h
@@ -189,7 +189,7 @@ testidl.c: libxl_types.idl gentest.py $(XEN_INCLUDE)/libxl.h $(AUTOINCS)
 
 all: $(CLIENTS) $(TEST_PROGS) $(AUTOSRCS) $(AUTOINCS)
 
-$(LIB_OBJS) $(PIC_OBJS) $(SAVE_HELPER_OBJS) $(LIBXL_TEST_OBJS) $(TEST_PROG_OBJS): $(AUTOINCS) libxl.api-ok
+$(OBJS-y) $(PIC_OBJS) $(SAVE_HELPER_OBJS) $(LIBXL_TEST_OBJS) $(TEST_PROG_OBJS): $(AUTOINCS) libxl.api-ok
 
 libxl.api-ok: check-libxl-api-rules _libxl.api-for-check
 	$(PERL) $^
@@ -212,8 +212,8 @@ $(XEN_INCLUDE)/libxl_json.h: $(XEN_INCLUDE)/_libxl_types_json.h
 libxl_internal.h: _libxl_types_internal.h _libxl_types_private.h _libxl_types_internal_private.h
 libxl_internal_json.h: _libxl_types_internal_json.h
 
-$(LIB_OBJS) $(PIC_OBJS) $(LIBXL_TEST_OBJS) $(TEST_PROG_OBJS) $(SAVE_HELPER_OBJS): $(XEN_INCLUDE)/libxl.h
-$(LIB_OBJS) $(PIC_OBJS) $(LIBXL_TEST_OBJS): libxl_internal.h
+$(OBJS-y) $(PIC_OBJS) $(LIBXL_TEST_OBJS) $(TEST_PROG_OBJS) $(SAVE_HELPER_OBJS): $(XEN_INCLUDE)/libxl.h
+$(OBJS-y) $(PIC_OBJS) $(LIBXL_TEST_OBJS): libxl_internal.h
 
 _libxl_type%.h _libxl_type%_json.h _libxl_type%_private.h _libxl_type%.c: libxl_type%.idl gentypes.py idl.py
 	$(eval stem = $(notdir $*))
diff --git a/tools/libs/stat/Makefile b/tools/libs/stat/Makefile
index 39a671d7ed..998435d494 100644
--- a/tools/libs/stat/Makefile
+++ b/tools/libs/stat/Makefile
@@ -17,12 +17,12 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
 
-SRCS-y += xenstat.c
-SRCS-y += xenstat_qmp.c
-SRCS-$(CONFIG_Linux) += xenstat_linux.c
-SRCS-$(CONFIG_SunOS) += xenstat_solaris.c
-SRCS-$(CONFIG_NetBSD) += xenstat_netbsd.c
-SRCS-$(CONFIG_FreeBSD) += xenstat_freebsd.c
+OBJS-y += xenstat.o
+OBJS-y += xenstat_qmp.o
+OBJS-$(CONFIG_Linux) += xenstat_linux.o
+OBJS-$(CONFIG_SunOS) += xenstat_solaris.o
+OBJS-$(CONFIG_NetBSD) += xenstat_netbsd.o
+OBJS-$(CONFIG_FreeBSD) += xenstat_freebsd.o
 
 LDLIBS-y += -lyajl
 LDLIBS-$(CONFIG_SunOS) += -lkstat
diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
index b94060be8d..778da51f95 100644
--- a/tools/libs/store/Makefile
+++ b/tools/libs/store/Makefile
@@ -8,8 +8,8 @@ ifeq ($(CONFIG_Linux),y)
 LDLIBS += -ldl
 endif
 
-SRCS-y   += xs_lib.c
-SRCS-y   += xs.c
+OBJS-y   += xs_lib.o
+OBJS-y   += xs.o
 
 LIBHEADER = xenstore.h xenstore_lib.h
 
diff --git a/tools/libs/toolcore/Makefile b/tools/libs/toolcore/Makefile
index 9c013b2879..ce417ea648 100644
--- a/tools/libs/toolcore/Makefile
+++ b/tools/libs/toolcore/Makefile
@@ -6,7 +6,7 @@ MINOR	= 0
 
 LIBHEADER := xentoolcore.h
 
-SRCS-y	+= handlereg.c
+OBJS-y	+= handlereg.o
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
diff --git a/tools/libs/toollog/Makefile b/tools/libs/toollog/Makefile
index dce1b2de85..c09aa02ba5 100644
--- a/tools/libs/toollog/Makefile
+++ b/tools/libs/toollog/Makefile
@@ -4,7 +4,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 MAJOR	= 1
 MINOR	= 0
 
-SRCS-y	+= xtl_core.c
-SRCS-y	+= xtl_logger_stdio.c
+OBJS-y	+= xtl_core.o
+OBJS-y	+= xtl_logger_stdio.o
 
 include $(XEN_ROOT)/tools/libs/libs.mk
diff --git a/tools/libs/util/Makefile b/tools/libs/util/Makefile
index 7a658e9446..ffe507b379 100644
--- a/tools/libs/util/Makefile
+++ b/tools/libs/util/Makefile
@@ -1,13 +1,13 @@
 XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-SRCS-y += libxlu_cfg_y.c
-SRCS-y += libxlu_cfg_l.c
-SRCS-y += libxlu_cfg.c
-SRCS-y += libxlu_disk_l.c
-SRCS-y += libxlu_disk.c
-SRCS-y += libxlu_vif.c
-SRCS-y += libxlu_pci.c
+OBJS-y += libxlu_cfg_y.o
+OBJS-y += libxlu_cfg_l.o
+OBJS-y += libxlu_cfg.o
+OBJS-y += libxlu_disk_l.o
+OBJS-y += libxlu_disk.o
+OBJS-y += libxlu_vif.o
+OBJS-y += libxlu_pci.o
 
 CFLAGS += -Wno-format-zero-length -Wmissing-declarations \
 	-Wno-declaration-after-statement -Wformat-nonliteral
@@ -39,7 +39,7 @@ NO_HEADERS_CHK := y
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
-$(LIB_OBJS) $(PIC_OBJS): $(AUTOINCS)
+$(OBJS-y) $(PIC_OBJS): $(AUTOINCS)
 
 %.c %.h:: %.y
 	@rm -f $*.[ch]
diff --git a/tools/libs/vchan/Makefile b/tools/libs/vchan/Makefile
index 4ccb4dd1f6..ac2bff66f5 100644
--- a/tools/libs/vchan/Makefile
+++ b/tools/libs/vchan/Makefile
@@ -5,8 +5,8 @@ CFLAGS += $(CFLAGS_libxenctrl)
 
 LIBHEADER := libxenvchan.h
 
-SRCS-y += init.c
-SRCS-y += io.c
+OBJS-y += init.o
+OBJS-y += io.o
 
 NO_HEADERS_CHK := y
 
diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index c2eaefc928..58d8166b09 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -20,8 +20,7 @@ CFLAGS   += $(foreach lib, $(USELIBS_$(LIBNAME)), $(CFLAGS_libxen$(lib)))
 
 LDLIBS += $(foreach lib, $(USELIBS_$(LIBNAME)), $(LDLIBS_libxen$(lib)))
 
-LIB_OBJS := $(SRCS-y:.c=.o)
-PIC_OBJS := $(SRCS-y:.c=.opic)
+PIC_OBJS := $(OBJS-y:.o=.opic)
 
 LIB_FILE_NAME = $(FILENAME_$(LIBNAME))
 LIB := lib$(LIB_FILE_NAME).a
@@ -79,7 +78,7 @@ headers.lst: FORCE
 libxen$(LIBNAME).map:
 	echo 'VERS_$(MAJOR).$(MINOR) { global: *; };' >$@
 
-lib$(LIB_FILE_NAME).a: $(LIB_OBJS)
+lib$(LIB_FILE_NAME).a: $(OBJS-y)
 	$(AR) rc $@ $^
 
 lib$(LIB_FILE_NAME).so: lib$(LIB_FILE_NAME).so.$(MAJOR)
@@ -125,7 +124,7 @@ TAGS:
 
 .PHONY: clean
 clean::
-	rm -rf $(LIB) *~ $(DEPS_RM) $(LIB_OBJS) $(PIC_OBJS)
+	rm -rf $(LIB) *~ $(DEPS_RM) $(OBJS-y) $(PIC_OBJS)
 	rm -f lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) lib$(LIB_FILE_NAME).so.$(MAJOR)
 	rm -f headers.chk headers.lst
 	rm -f $(PKG_CONFIG)
-- 
Anthony PERARD


