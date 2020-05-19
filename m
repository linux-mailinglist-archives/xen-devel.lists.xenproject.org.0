Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECEA1DA0AE
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 21:10:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb7dM-0007E3-0F; Tue, 19 May 2020 19:10:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+xc8=7B=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jb7dJ-0007By-Jy
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 19:10:33 +0000
X-Inumbo-ID: 4f048c04-9a04-11ea-9887-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f048c04-9a04-11ea-9887-bc764e2007e4;
 Tue, 19 May 2020 19:09:48 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jb7Vj-0001da-43; Tue, 19 May 2020 20:02:43 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 28/38] 20_linux_xen: Support Xen Security Modules
 (XSM/FLASK)
Date: Tue, 19 May 2020 20:02:20 +0100
Message-Id: <20200519190230.29519-29-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
References: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

XSM is enabled by adding "flask=enforcing" as a Xen command line
argument, and providing the policy file as a grub module.

We make entries for both with and without XSM.  If XSM is not compiled
into Xen, then there are no policy files, so no change to the boot
options.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 overlay-buster/etc/grub.d/20_linux_xen | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/overlay-buster/etc/grub.d/20_linux_xen b/overlay-buster/etc/grub.d/20_linux_xen
index 01dfcb57..4d3294a2 100755
--- a/overlay-buster/etc/grub.d/20_linux_xen
+++ b/overlay-buster/etc/grub.d/20_linux_xen
@@ -84,6 +84,11 @@ esac
 title_correction_code=
 
 linux_entry ()
+{
+  linux_entry_xsm "$@" false
+  linux_entry_xsm "$@" true
+}
+linux_entry_xsm ()
 {
   os="$1"
   version="$2"
@@ -91,6 +96,18 @@ linux_entry ()
   type="$4"
   args="$5"
   xen_args="$6"
+  xsm="$7"
+  # If user wants to enable XSM support, make sure there's
+  # corresponding policy file.
+  if ${xsm} ; then
+      xenpolicy="xenpolicy-$xen_version"
+      if test ! -e "${xen_dirname}/${xenpolicy}" ; then
+	  return
+      fi
+      xen_args="$xen_args flask=enforcing"
+      xen_version="$(gettext_printf "%s (XSM enabled)" "$xen_version")"
+      # xen_version is used for messages only; actual file is xen_basename
+  fi
   if [ -z "$boot_device_id" ]; then
       boot_device_id="$(grub_get_device_id "${GRUB_DEVICE}")"
   fi
@@ -140,6 +157,13 @@ EOF
     sed "s/^/$submenu_indentation/" << EOF
 	echo	'$(echo "$message" | grub_quote)'
 	${module_loader}	--nounzip   ${rel_dirname}/${initrd}
+EOF
+  fi
+  if test -n "${xenpolicy}" ; then
+    message="$(gettext_printf "Loading XSM policy ...")"
+    sed "s/^/$submenu_indentation/" << EOF
+	echo	'$(echo "$message" | grub_quote)'
+	${module_loader}     ${rel_dirname}/${xenpolicy}
 EOF
   fi
   sed "s/^/$submenu_indentation/" << EOF
-- 
2.20.1


