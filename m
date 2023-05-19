Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5802709C67
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 18:25:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537190.836095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q02us-0003Fm-G5; Fri, 19 May 2023 16:25:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537190.836095; Fri, 19 May 2023 16:25:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q02us-0003E8-Cc; Fri, 19 May 2023 16:25:18 +0000
Received: by outflank-mailman (input) for mailman id 537190;
 Fri, 19 May 2023 16:25:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h1HX=BI=citrix.com=prvs=496750f7c=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q02uq-0003E2-Ra
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 16:25:17 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id baea8ef7-f661-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 18:25:14 +0200 (CEST)
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
X-Inumbo-ID: baea8ef7-f661-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684513513;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UGnIcAY/vT3B5YwQu/7AIgPtJq69zjmZ9Y0IHpiz6Q0=;
  b=iTNVo5JJMhAx8xlbDrAu01kjJmUpVa+vghz51U/yiXVZRP9R4fAndv6i
   mqJ0MxQ4uV6WYNoF+pyfdTSsVhjgMt+LgaGEOUhIdSceuvXE3ba73AVhz
   RBtjT50MgaXOCQ3nu52JY5+HCdN+WKdq+0IYLK+iX7+VZg5Tbc9AZljEE
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 108441553
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:iO5lP6ibJg9rL69yVpsBdkcXX161ahAKZh0ujC45NGQN5FlHY01je
 htvCmzVOancNjSjeYx2YYSw/U4HvcKDndVhTFZvpSgyFHsb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4QaPzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQdEC1WcxSAmNmmyZafF9BPgstyNs7CadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XejtEqFWTtOwv7nLa1gBZ27nxKtvFPNeNQK25m27B/
 jKaoz2kX0py2Nq3wGK5906nm/b0sgTWG4Q1PbOR/fpSqQjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O9U39AyXjIrT8guCLmEeS3hKb9lOnNAybSwn0
 BmOhdyBONB0mOTLEzTHrO7S9G7sf3FPdgfueBPoUyMA28S4vYUwkSnfR/JHTZeWitKkAzbZl
 mXiQDcFu50fissC1qOe9F/Bgi6xqpWhcjPZ9jk7TUr+sFonOdfNi5iArAGCsK0edNrxokyp5
 iBspiSI0AwZ4XhhfgSpSf5FIrym7u3t3Nb00Q82RMlJG9hAFheekWFsDNNWfh8B3iUsI2WBj
 KrvVeR5uvdu0IOCN/MfXm5II51CIVLcPdrkTOvISdFFf4J8cgSKlAk3Ox7MgzuxwBR3z/9uU
 Xt+TSpLJS9AYZmLMRLsH7tNuVPV7ntWKZzvqWDTkE38jOv2iI+9QrYZKlqeBt0EAFe/iFyNq
 b53bpLaoyizpcWiOkE7B6ZPdwFVRZX6bLiqw/FqmhmrflM+QDh8VaGLqV7jEqQ895loei7z1
 inVcidlJJDX2RUr9S3ihqhfVY7S
IronPort-HdrOrdr: A9a23:SdsjSKFTqcu+MJhMpLqE18eALOsnbusQ8zAXPo5KOGVom62j5r
 iTdZEgvyMc5wxhPU3I9erwWpVoBEmslqKdgrNxAV7BZniDhILAFugLhrcKgQeBJ8SUzJ876U
 4PSdkZNDQyNzRHZATBjTVQ3+xO/DBPys6Vuds=
X-Talos-CUID: 9a23:jp/tx2xt+f3ef7RCfb17BgURIt1+b3ne00zAKmucVF9KTLLEU1i5rfY=
X-Talos-MUID: 9a23:1kfPmAvny5Nw9Tb6L82njWleMftj/r2VJ2cg0pMhksetPihIEmLI
X-IronPort-AV: E=Sophos;i="6.00,177,1681185600"; 
   d="scan'208";a="108441553"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Peter Hoyes
	<Peter.Hoyes@arm.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH] tools/xendomains: Don't auto save/restore/migrate on Arm*
Date: Fri, 19 May 2023 17:24:54 +0100
Message-ID: <20230519162454.50337-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <d52c31c7-57b1-41c1-af35-a9b847683c0a@perard>
References: <d52c31c7-57b1-41c1-af35-a9b847683c0a@perard>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Saving, restoring and migrating domains are not currently supported on
arm and arm64 platforms, so xendomains prints the warning:

  An error occurred while saving domain:
  command not implemented

when attempting to run `xendomains stop`. It otherwise continues to shut
down the domains cleanly, with the unsupported steps skipped.

Also in sysconfig.xendomains, change "Default" to "Example" as the
real default is an empty value.

Reported-by: Peter Hoyes <Peter.Hoyes@arm.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Peter, what do you think of this approach?

For reference, there's also a way to findout if a macro exist, with
AC_CHECK_DECL(), but the libxl.h header depends on other headers that
needs to be generated.
---
 tools/configure                                    | 11 +++++++++++
 tools/configure.ac                                 | 13 +++++++++++++
 tools/hotplug/Linux/init.d/sysconfig.xendomains.in |  4 ++--
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/tools/configure b/tools/configure
index 52b4717d01..a722f72c08 100755
--- a/tools/configure
+++ b/tools/configure
@@ -624,6 +624,7 @@ ac_includes_default="\
 
 ac_subst_vars='LTLIBOBJS
 LIBOBJS
+XENDOMAINS_SAVE_DIR
 pvshim
 ninepfs
 SYSTEMD_LIBS
@@ -10155,6 +10156,16 @@ if test "$ax_found" = "0"; then :
 fi
 
 
+case "$host_cpu" in
+    arm*|aarch64)
+        XENDOMAINS_SAVE_DIR=
+        ;;
+    *)
+        XENDOMAINS_SAVE_DIR="$XEN_LIB_DIR/save"
+        ;;
+esac
+
+
 cat >confcache <<\_ACEOF
 # This file is a shell script that caches the results of configure
 # tests run on this system so they can be shared between configure
diff --git a/tools/configure.ac b/tools/configure.ac
index 3cccf41960..0f0983f6b7 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -517,4 +517,17 @@ AS_IF([test "x$pvshim" = "xy"], [
 
 AX_FIND_HEADER([INCLUDE_ENDIAN_H], [endian.h sys/endian.h])
 
+dnl Disable autosave of domain in xendomains on shutdown
+dnl due to missing support. This should be in sync with
+dnl LIBXL_HAVE_NO_SUSPEND_RESUME in libxl.h
+case "$host_cpu" in
+    arm*|aarch64)
+        XENDOMAINS_SAVE_DIR=
+        ;;
+    *)
+        XENDOMAINS_SAVE_DIR="$XEN_LIB_DIR/save"
+        ;;
+esac
+AC_SUBST(XENDOMAINS_SAVE_DIR)
+
 AC_OUTPUT()
diff --git a/tools/hotplug/Linux/init.d/sysconfig.xendomains.in b/tools/hotplug/Linux/init.d/sysconfig.xendomains.in
index f61ef9c4d1..3c49f18bb0 100644
--- a/tools/hotplug/Linux/init.d/sysconfig.xendomains.in
+++ b/tools/hotplug/Linux/init.d/sysconfig.xendomains.in
@@ -45,7 +45,7 @@ XENDOMAINS_CREATE_USLEEP=5000000
 XENDOMAINS_MIGRATE=""
 
 ## Type: string
-## Default: @XEN_LIB_DIR@/save
+## Example: @XEN_LIB_DIR@/save
 #
 # Directory to save running domains to when the system (dom0) is
 # shut down. Will also be used to restore domains from if # XENDOMAINS_RESTORE
@@ -53,7 +53,7 @@ XENDOMAINS_MIGRATE=""
 # (e.g. because you rather shut domains down).
 # If domain saving does succeed, SHUTDOWN will not be executed.
 #
-XENDOMAINS_SAVE=@XEN_LIB_DIR@/save
+XENDOMAINS_SAVE=@XENDOMAINS_SAVE_DIR@
 
 ## Type: string
 ## Default: "--wait"
-- 
Anthony PERARD


