Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB72573991
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 17:03:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366765.597722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBdth-0005Gh-1g; Wed, 13 Jul 2022 15:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366765.597722; Wed, 13 Jul 2022 15:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBdtg-0005EP-TH; Wed, 13 Jul 2022 15:03:28 +0000
Received: by outflank-mailman (input) for mailman id 366765;
 Wed, 13 Jul 2022 15:03:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y9RH=XS=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1oBdte-0004Gf-E1
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 15:03:27 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0b5fa7e-02bc-11ed-924f-1f966e50362f;
 Wed, 13 Jul 2022 17:03:23 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id d16so15881048wrv.10
 for <xen-devel@lists.xenproject.org>; Wed, 13 Jul 2022 08:03:23 -0700 (PDT)
Received: from localhost.localdomain ([91.219.254.75])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a05600c355000b003a2f88b2559sm2288417wmq.44.2022.07.13.08.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 08:03:20 -0700 (PDT)
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
X-Inumbo-ID: f0b5fa7e-02bc-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C1t/r7Z1a+hfnt9hQpupUQYuausKRlncsenXFzN5C8E=;
        b=hqvzHvobw2K0zvMnGHhYBZ2g8KIV+Rw1QicGiL2aEeMah+nQ3kmxw+ha2V6jvsnned
         2aiU0I37VA14yYZU4IdhtpTJggivdIHmVLKtgE7/D5HUyZE231nytH1KlCp+qIsjJeJw
         DFOsQ5TRj+ObQDz6aqMrfq9aLHxV8+pCdLGL7VgXUDUtZHP8k1eaAFxewtfmkyXtgvYX
         WYcL5MvCo92ZzZVzPIv7IoQpgyq2UYLesq5iuULoNnJZrQRtmSF7agitdgXUlndMvhiE
         b50sfob6MkgU3pdJyKAa5GSXyhqGdYwNW9qSf4oVviRwSg+VuvlcIHQuylN+gW4p/q6r
         aHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C1t/r7Z1a+hfnt9hQpupUQYuausKRlncsenXFzN5C8E=;
        b=cK2SeGpYRdqcFWa4vuUITuuuHdGFuHz3xKhifvddiP6ABzQDTqu3luLeRZ1/JXxuni
         vUrfFdbNusSvzD4Z0me/jKrtw32GoRYrKvIv9KCPPR9ZvuFHy9SA2hT2Z9f9WwXQNFfo
         FwgFaVmDmvW5WrPRwM3DdJ+lmRXzfdmZEpT0A/QyDNglDc3jLbqWC7yooWrEF5FxTykn
         OFGLGq0mMpgfD0UcACHqFYoDZvF1YC63GCSYwKH/ruLgMIKbuyFG8aRh1tBEnZXy4HIv
         GHofYTJ7esclCPcFb9cPpEmKTEg8CJP1ir5mhX5Amux1WcTULaHKrNjOK30lAdIdx7Kw
         6gVg==
X-Gm-Message-State: AJIora/g5jchvFfbH5QHbNb4PIUGYHUBvxLu0DcbIHLalWf3cZoTRrPX
	8hOelpW/0GPkIrbM8K418GdSklWcfN9yCg==
X-Google-Smtp-Source: AGRyM1sv5SLDpaxOoKbPuXKYKUZAf/+g96Id+rOp48WGbfbGUTCervFtLcw8Lejraja0h+3etHiyIw==
X-Received: by 2002:a5d:5222:0:b0:21d:92a5:2b5d with SMTP id i2-20020a5d5222000000b0021d92a52b5dmr3765518wra.377.1657724600772;
        Wed, 13 Jul 2022 08:03:20 -0700 (PDT)
From: dmitry.semenets@gmail.com
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Dmytro Semenets <dmytro_semenets@epam.com>,
	Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: [PATCH v2 4/4] tools/xl: Add pcid daemon to xl
Date: Wed, 13 Jul 2022 18:03:11 +0300
Message-Id: <20220713150311.4152528-4-dmitry.semenets@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220713150311.4152528-1-dmitry.semenets@gmail.com>
References: <20220713150311.4152528-1-dmitry.semenets@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add pcid daemon (based on vchan-node2) implements pcid protocol. Protocol is
OS independed and should work on ane supported OS.

Add essential functionality to handle pcid protocol:
- define required constants
- prepare for handling remote requests
- prepare and send an error packet

pcid server used if domain has passthrough PCI controller and we wants
assign some device to other domain.
pcid server should be launched in domain owns the PCI controller and process
request from other domains.

Message exchange imnplementation based on JSON via libvchan. Supported
messages:
- make_assignable
- revert_assignable
- is_device_assigned
- resource_list
- reset_device
- write_bdf

Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 docs/man/xl-pci-configuration.5.pod           |   14 +
 tools/configure                               |    8 +-
 tools/configure.ac                            |    1 +
 tools/hotplug/FreeBSD/rc.d/xlpcid.in          |   75 ++
 tools/hotplug/Linux/init.d/xlpcid.in          |   76 ++
 tools/hotplug/Linux/systemd/Makefile          |    1 +
 .../hotplug/Linux/systemd/xenpcid.service.in  |   10 +
 tools/hotplug/NetBSD/rc.d/xlpcid.in           |   75 ++
 tools/include/libxl.h                         |    2 +-
 tools/include/pcid.h                          |  228 ++++
 tools/libs/light/Makefile                     |    1 +
 tools/libs/light/libxl_pci.c                  |  701 +++++------
 tools/libs/light/libxl_pcid.c                 | 1095 +++++++++++++++++
 tools/libs/light/libxl_types.idl              |    2 +
 tools/libs/light/libxl_vchan.c                |   64 +-
 tools/libs/light/libxl_vchan.h                |    7 +-
 tools/libs/util/libxlu_pci.c                  |    6 +-
 tools/xl/Makefile                             |    4 +-
 tools/xl/xl.h                                 |    1 +
 tools/xl/xl_cmdtable.c                        |    7 +
 tools/xl/xl_parse.c                           |    1 +
 tools/xl/xl_pci.c                             |    4 +-
 tools/xl/xl_pcid.c                            |   81 ++
 23 files changed, 2070 insertions(+), 394 deletions(-)
 create mode 100644 tools/hotplug/FreeBSD/rc.d/xlpcid.in
 create mode 100644 tools/hotplug/Linux/init.d/xlpcid.in
 create mode 100644 tools/hotplug/Linux/systemd/xenpcid.service.in
 create mode 100644 tools/hotplug/NetBSD/rc.d/xlpcid.in
 create mode 100644 tools/include/pcid.h
 create mode 100644 tools/libs/light/libxl_pcid.c
 create mode 100644 tools/xl/xl_pcid.c

diff --git a/docs/man/xl-pci-configuration.5.pod b/docs/man/xl-pci-configuration.5.pod
index db3360307c..aacbd52c86 100644
--- a/docs/man/xl-pci-configuration.5.pod
+++ b/docs/man/xl-pci-configuration.5.pod
@@ -215,4 +215,18 @@ required to look up the B<BDF> in the list of assignable devices.
 
 =back
 
+=item B<domain>=I<STRING>
+
+=over 4
+
+=item Description
+
+This is domain name with pcid daemon running
+
+=item Default Value
+
+None. Domain name with pcid daemon selects automatically
+
+=back
+
 =back
diff --git a/tools/configure b/tools/configure
index 45db3a5d5c..6124b2ab47 100755
--- a/tools/configure
+++ b/tools/configure
@@ -2452,7 +2452,7 @@ ac_compiler_gnu=$ac_cv_c_compiler_gnu
 
 
 
-ac_config_files="$ac_config_files ../config/Tools.mk hotplug/FreeBSD/rc.d/xencommons hotplug/FreeBSD/rc.d/xendriverdomain hotplug/Linux/init.d/sysconfig.xencommons hotplug/Linux/init.d/sysconfig.xendomains hotplug/Linux/init.d/xen-watchdog hotplug/Linux/init.d/xencommons hotplug/Linux/init.d/xendomains hotplug/Linux/init.d/xendriverdomain hotplug/Linux/launch-xenstore hotplug/Linux/vif-setup hotplug/Linux/xen-hotplug-common.sh hotplug/Linux/xendomains hotplug/NetBSD/rc.d/xencommons hotplug/NetBSD/rc.d/xendriverdomain ocaml/xenstored/oxenstored.conf"
+ac_config_files="$ac_config_files ../config/Tools.mk hotplug/FreeBSD/rc.d/xencommons hotplug/FreeBSD/rc.d/xendriverdomain hotplug/FreeBSD/rc.d/xlpcid hotplug/Linux/init.d/sysconfig.xencommons hotplug/Linux/init.d/sysconfig.xendomains hotplug/Linux/init.d/xlpcid hotplug/Linux/init.d/xen-watchdog hotplug/Linux/init.d/xencommons hotplug/Linux/init.d/xendomains hotplug/Linux/init.d/xendriverdomain hotplug/Linux/launch-xenstore hotplug/Linux/vif-setup hotplug/Linux/xen-hotplug-common.sh hotplug/Linux/xendomains hotplug/NetBSD/rc.d/xencommons hotplug/NetBSD/rc.d/xendriverdomain hotplug/NetBSD/rc.d/xlpcid ocaml/xenstored/oxenstored.conf"
 
 ac_config_headers="$ac_config_headers config.h"
 
@@ -10053,7 +10053,7 @@ fi
 
 if test "x$systemd" = "xy"; then :
 
-    ac_config_files="$ac_config_files hotplug/Linux/systemd/proc-xen.mount hotplug/Linux/systemd/var-lib-xenstored.mount hotplug/Linux/systemd/xen-init-dom0.service hotplug/Linux/systemd/xen-qemu-dom0-disk-backend.service hotplug/Linux/systemd/xen-watchdog.service hotplug/Linux/systemd/xenconsoled.service hotplug/Linux/systemd/xendomains.service hotplug/Linux/systemd/xendriverdomain.service hotplug/Linux/systemd/xenstored.service"
+    ac_config_files="$ac_config_files hotplug/Linux/systemd/proc-xen.mount hotplug/Linux/systemd/var-lib-xenstored.mount hotplug/Linux/systemd/xen-init-dom0.service hotplug/Linux/systemd/xen-qemu-dom0-disk-backend.service hotplug/Linux/systemd/xen-watchdog.service hotplug/Linux/systemd/xenconsoled.service hotplug/Linux/systemd/xendomains.service hotplug/Linux/systemd/xendriverdomain.service hotplug/Linux/systemd/xenstored.service hotplug/Linux/systemd/xenpcid.service"
 
 
 fi
@@ -10917,8 +10917,10 @@ do
     "../config/Tools.mk") CONFIG_FILES="$CONFIG_FILES ../config/Tools.mk" ;;
     "hotplug/FreeBSD/rc.d/xencommons") CONFIG_FILES="$CONFIG_FILES hotplug/FreeBSD/rc.d/xencommons" ;;
     "hotplug/FreeBSD/rc.d/xendriverdomain") CONFIG_FILES="$CONFIG_FILES hotplug/FreeBSD/rc.d/xendriverdomain" ;;
+    "hotplug/FreeBSD/rc.d/xlpcid") CONFIG_FILES="$CONFIG_FILES hotplug/FreeBSD/rc.d/xlpcid" ;;
     "hotplug/Linux/init.d/sysconfig.xencommons") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/init.d/sysconfig.xencommons" ;;
     "hotplug/Linux/init.d/sysconfig.xendomains") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/init.d/sysconfig.xendomains" ;;
+    "hotplug/Linux/init.d/xlpcid") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/init.d/xlpcid" ;;
     "hotplug/Linux/init.d/xen-watchdog") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/init.d/xen-watchdog" ;;
     "hotplug/Linux/init.d/xencommons") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/init.d/xencommons" ;;
     "hotplug/Linux/init.d/xendomains") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/init.d/xendomains" ;;
@@ -10929,6 +10931,7 @@ do
     "hotplug/Linux/xendomains") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/xendomains" ;;
     "hotplug/NetBSD/rc.d/xencommons") CONFIG_FILES="$CONFIG_FILES hotplug/NetBSD/rc.d/xencommons" ;;
     "hotplug/NetBSD/rc.d/xendriverdomain") CONFIG_FILES="$CONFIG_FILES hotplug/NetBSD/rc.d/xendriverdomain" ;;
+    "hotplug/NetBSD/rc.d/xlpcid") CONFIG_FILES="$CONFIG_FILES hotplug/NetBSD/rc.d/xlpcid" ;;
     "ocaml/xenstored/oxenstored.conf") CONFIG_FILES="$CONFIG_FILES ocaml/xenstored/oxenstored.conf" ;;
     "config.h") CONFIG_HEADERS="$CONFIG_HEADERS config.h" ;;
     "hotplug/Linux/systemd/proc-xen.mount") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/systemd/proc-xen.mount" ;;
@@ -10940,6 +10943,7 @@ do
     "hotplug/Linux/systemd/xendomains.service") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/systemd/xendomains.service" ;;
     "hotplug/Linux/systemd/xendriverdomain.service") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/systemd/xendriverdomain.service" ;;
     "hotplug/Linux/systemd/xenstored.service") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/systemd/xenstored.service" ;;
+    "hotplug/Linux/systemd/xenpcid.service") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/systemd/xenpcid.service" ;;
 
   *) as_fn_error $? "invalid argument: \`$ac_config_target'" "$LINENO" 5;;
   esac
diff --git a/tools/configure.ac b/tools/configure.ac
index f29c319b42..a874e96608 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -477,6 +477,7 @@ AS_IF([test "x$systemd" = "xy"], [
     hotplug/Linux/systemd/xendomains.service
     hotplug/Linux/systemd/xendriverdomain.service
     hotplug/Linux/systemd/xenstored.service
+    hotplug/Linux/systemd/xenpcid.service
     ])
 ])
 
diff --git a/tools/hotplug/FreeBSD/rc.d/xlpcid.in b/tools/hotplug/FreeBSD/rc.d/xlpcid.in
new file mode 100644
index 0000000000..2817bfaeed
--- /dev/null
+++ b/tools/hotplug/FreeBSD/rc.d/xlpcid.in
@@ -0,0 +1,75 @@
+#! /bin/bash
+#
+# xlpcid
+#
+# description: Run xlpcid daemon
+### BEGIN INIT INFO
+# Provides:          xlpcid
+# Short-Description: Start/stop xlpcid
+# Description:       Run xlpcid daemon
+### END INIT INFO
+#
+
+. @XEN_SCRIPT_DIR@/hotplugpath.sh
+
+xencommons_config=@CONFIG_DIR@/@CONFIG_LEAF_DIR@
+
+test -f $xencommons_config/xencommons && . $xencommons_config/xencommons
+
+XLPCID_PIDFILE="@XEN_RUN_DIR@/xlpcid.pid"
+
+# Source function library.
+if [ -e  /etc/init.d/functions ] ; then
+    . /etc/init.d/functions
+elif [ -e /lib/lsb/init-functions ] ; then
+    . /lib/lsb/init-functions
+    success () {
+        log_success_msg $*
+    }
+    failure () {
+        log_failure_msg $*
+    }
+else
+    success () {
+        echo $*
+    }
+    failure () {
+        echo $*
+    }
+fi
+
+start() {
+  echo Starting xl pcid...
+  ${sbindir}/xl pcid --pidfile=$XLPCID_PIDFILE $XLPCID_ARGS
+}
+
+stop() {
+  echo Stopping xl pcid...
+  if read 2>/dev/null <$XLPCID_PIDFILE pid; then
+    kill $pid
+    while kill -9 $pid >/dev/null 2>&1; do sleep 1; done
+    rm -f $XLPCID_PIDFILE
+  fi
+}
+
+case "$1" in
+  start)
+    start
+	;;
+  stop)
+	stop
+	;;
+  restart)
+	stop
+	start
+	;;
+  status)
+	;;
+  condrestart)
+	stop
+	start
+	;;
+  *)
+	echo $"Usage: $0 {start|stop|status|restart|condrestart}"
+	exit 1
+esac
diff --git a/tools/hotplug/Linux/init.d/xlpcid.in b/tools/hotplug/Linux/init.d/xlpcid.in
new file mode 100644
index 0000000000..dce660098c
--- /dev/null
+++ b/tools/hotplug/Linux/init.d/xlpcid.in
@@ -0,0 +1,76 @@
+#! /bin/bash
+#
+# xlpcid
+#
+# description: Run xlpcid daemon
+### BEGIN INIT INFO
+# Provides:          xlpcid
+# Short-Description: Start/stop xlpcid
+# Description:       Run xlpcid daemon
+### END INIT INFO
+#
+
+. @XEN_SCRIPT_DIR@/hotplugpath.sh
+
+xencommons_config=@CONFIG_DIR@/@CONFIG_LEAF_DIR@
+
+test -f $xencommons_config/xencommons && . $xencommons_config/xencommons
+
+XLPCID_PIDFILE="@XEN_RUN_DIR@/xlpcid.pid"
+
+# Source function library.
+if [ -e  /etc/init.d/functions ] ; then
+    . /etc/init.d/functions
+elif [ -e /lib/lsb/init-functions ] ; then
+    . /lib/lsb/init-functions
+    success () {
+        log_success_msg $*
+    }
+    failure () {
+        log_failure_msg $*
+    }
+else
+    success () {
+        echo $*
+    }
+    failure () {
+        echo $*
+    }
+fi
+
+start() {
+  echo Starting xl pcid...
+  ${sbindir}/xl pcid --pidfile=$XLPCID_PIDFILE $XLPCID_ARGS
+}
+
+stop() {
+  echo Stopping xl pcid...
+  if read 2>/dev/null <$XLPCID_PIDFILE pid; then
+    kill $pid
+    while kill -9 $pid >/dev/null 2>&1; do sleep 1; done
+    rm -f $XLPCID_PIDFILE
+  fi
+}
+
+case "$1" in
+  start)
+    start
+	;;
+  stop)
+	stop
+	;;
+  restart)
+	stop
+	start
+	;;
+  status)
+	;;
+  condrestart)
+	stop
+	start
+	;;
+  *)
+	echo $"Usage: $0 {start|stop|status|restart|condrestart}"
+	exit 1
+esac
+
diff --git a/tools/hotplug/Linux/systemd/Makefile b/tools/hotplug/Linux/systemd/Makefile
index a5d41d86ef..a3820e5f0a 100644
--- a/tools/hotplug/Linux/systemd/Makefile
+++ b/tools/hotplug/Linux/systemd/Makefile
@@ -13,6 +13,7 @@ XEN_SYSTEMD_SERVICE += xendomains.service
 XEN_SYSTEMD_SERVICE += xen-watchdog.service
 XEN_SYSTEMD_SERVICE += xen-init-dom0.service
 XEN_SYSTEMD_SERVICE += xendriverdomain.service
+XEN_SYSTEMD_SERVICE += xenpcid.service
 
 ALL_XEN_SYSTEMD =	$(XEN_SYSTEMD_MODULES)  \
 			$(XEN_SYSTEMD_MOUNT)	\
diff --git a/tools/hotplug/Linux/systemd/xenpcid.service.in b/tools/hotplug/Linux/systemd/xenpcid.service.in
new file mode 100644
index 0000000000..49c57f635a
--- /dev/null
+++ b/tools/hotplug/Linux/systemd/xenpcid.service.in
@@ -0,0 +1,10 @@
+[Unit]
+Description=Xen PCI host daemon
+ConditionVirtualization=xen
+
+[Service]
+Type=forking
+ExecStart=@sbindir@/xl pcid
+
+[Install]
+WantedBy=multi-user.target
diff --git a/tools/hotplug/NetBSD/rc.d/xlpcid.in b/tools/hotplug/NetBSD/rc.d/xlpcid.in
new file mode 100644
index 0000000000..2817bfaeed
--- /dev/null
+++ b/tools/hotplug/NetBSD/rc.d/xlpcid.in
@@ -0,0 +1,75 @@
+#! /bin/bash
+#
+# xlpcid
+#
+# description: Run xlpcid daemon
+### BEGIN INIT INFO
+# Provides:          xlpcid
+# Short-Description: Start/stop xlpcid
+# Description:       Run xlpcid daemon
+### END INIT INFO
+#
+
+. @XEN_SCRIPT_DIR@/hotplugpath.sh
+
+xencommons_config=@CONFIG_DIR@/@CONFIG_LEAF_DIR@
+
+test -f $xencommons_config/xencommons && . $xencommons_config/xencommons
+
+XLPCID_PIDFILE="@XEN_RUN_DIR@/xlpcid.pid"
+
+# Source function library.
+if [ -e  /etc/init.d/functions ] ; then
+    . /etc/init.d/functions
+elif [ -e /lib/lsb/init-functions ] ; then
+    . /lib/lsb/init-functions
+    success () {
+        log_success_msg $*
+    }
+    failure () {
+        log_failure_msg $*
+    }
+else
+    success () {
+        echo $*
+    }
+    failure () {
+        echo $*
+    }
+fi
+
+start() {
+  echo Starting xl pcid...
+  ${sbindir}/xl pcid --pidfile=$XLPCID_PIDFILE $XLPCID_ARGS
+}
+
+stop() {
+  echo Stopping xl pcid...
+  if read 2>/dev/null <$XLPCID_PIDFILE pid; then
+    kill $pid
+    while kill -9 $pid >/dev/null 2>&1; do sleep 1; done
+    rm -f $XLPCID_PIDFILE
+  fi
+}
+
+case "$1" in
+  start)
+    start
+	;;
+  stop)
+	stop
+	;;
+  restart)
+	stop
+	start
+	;;
+  status)
+	;;
+  condrestart)
+	stop
+	start
+	;;
+  *)
+	echo $"Usage: $0 {start|stop|status|restart|condrestart}"
+	exit 1
+esac
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 310a3468a1..67ba46c78f 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -2465,7 +2465,7 @@ int libxl_device_events_handler(libxl_ctx *ctx,
  */
 int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_device_pci *pci, int rebind);
 int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_device_pci *pci, int rebind);
-libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num);
+libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num, libxl_domid backend_domid);
 void libxl_device_pci_assignable_list_free(libxl_device_pci *list, int num);
 
 /* CPUID handling */
diff --git a/tools/include/pcid.h b/tools/include/pcid.h
new file mode 100644
index 0000000000..2c1bd0727e
--- /dev/null
+++ b/tools/include/pcid.h
@@ -0,0 +1,228 @@
+/*
+    Common definitions for Xen PCI client-server protocol.
+    Copyright (C) 2021 EPAM Systems Inc.
+
+    This library is free software; you can redistribute it and/or
+    modify it under the terms of the GNU Lesser General Public
+    License as published by the Free Software Foundation; either
+    version 2.1 of the License, or (at your option) any later version.
+
+    This library is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+    Lesser General Public License for more details.
+
+    You should have received a copy of the GNU Lesser General Public
+    License along with this library; If not, see <http://www.gnu.org/licenses/>.
+*/
+
+#ifndef PCID_H
+#define PCID_H
+
+#define PCID_SRV_NAME           "pcid"
+#define PCID_XS_TOKEN           "pcid-token"
+
+#define PCI_RECEIVE_BUFFER_SIZE 4096
+#define PCI_MAX_SIZE_RX_BUF     MB(1)
+
+/*
+ *******************************************************************************
+ * Common request and response structures used be the pcid remote protocol are
+ * described below.
+ *******************************************************************************
+ * Request:
+ * +-------------+--------------+----------------------------------------------+
+ * | Field       | Type         | Comment                                      |
+ * +-------------+--------------+----------------------------------------------+
+ * | cmd         | string       | String identifying the command               |
+ * +-------------+--------------+----------------------------------------------+
+ *
+ * Response:
+ * +-------------+--------------+----------------------------------------------+
+ * | Field       | Type         | Comment                                      |
+ * +-------------+--------------+----------------------------------------------+
+ * | resp        | string       | Command string as in the request             |
+ * +-------------+--------------+----------------------------------------------+
+ * | error       | string       | "okay", "failed"                               |
+ * +-------------+--------------+----------------------------------------------+
+ * | error_desc  | string       | Optional error description string            |
+ * +-------------+--------------+----------------------------------------------+
+ *
+ * Notes.
+ * 1. Every request and response must contain the above mandatory structures.
+ * 2. In case if a bad packet or an unknown command received by the server side
+ * a valid reply with the corresponding error code must be sent to the client.
+ *
+ * Requests and responses, which require SBDF as part of their payload, must
+ * use the following convention for encoding SBDF value:
+ *
+ * pci_device object:
+ * +-------------+--------------+----------------------------------------------+
+ * | Field       | Type         | Comment                                      |
+ * +-------------+--------------+----------------------------------------------+
+ * | sbdf        | string       | SBDF string in form SSSS:BB:DD.F             |
+ * +-------------+--------------+----------------------------------------------+
+ */
+
+#define PCID_MSG_FIELD_CMD      "cmd"
+
+#define PCID_MSG_FIELD_RESP     "resp"
+#define PCID_MSG_FIELD_ERR      "error"
+#define PCID_MSG_FIELD_ERR_DESC "error_desc"
+
+/* pci_device object fields. */
+#define PCID_MSG_FIELD_SBDF     "sbdf"
+
+#define PCID_MSG_ERR_OK         "okay"
+#define PCID_MSG_ERR_FAILED     "failed"
+#define PCID_MSG_ERR_NA         "NA"
+
+#define PCID_SBDF_FMT           "%04x:%02x:%02x.%01x"
+
+/*
+ *******************************************************************************
+ * List assignable devices
+ *
+ * This command lists PCI devices that can be passed through to a guest domain.
+ *
+ * Request (see other mandatory fields above):
+ *  - "cmd" field of the request must be set to "list_assignable".
+ *
+ * Response (see other mandatory fields above):
+ *  - "resp" field of the response must be set to "list_assignable".
+ * Command specific response data:
+ * +-------------+--------------+----------------------------------------------+
+ * | devices     | list         | List of of pci_device objects                |
+ * +-------------+--------------+----------------------------------------------+
+ */
+#define PCID_CMD_LIST_ASSIGNABLE        "list_assignable"
+#define PCID_MSG_FIELD_DEVICES          "devices"
+
+/*
+ *******************************************************************************
+ * Make device assignable
+ *
+ * This command makes given device assignable by ensuring that OS
+ * will not try to access it.
+ *
+ * Request (see other mandatory fields above):
+ *  - "cmd" field of the request must be set to "make_assignable".
+ *  - "sbdf" SBDF of the device in format defined by PCID_SBDF_FMT.
+ *  - "rebind" = true if daemon needs to save original driver name,
+ *    so device later can be rebound back.
+ *
+ * Response (see other mandatory fields above):
+ *  - "resp" field of the response must be set to "make_assignable".
+ */
+#define PCID_CMD_MAKE_ASSIGNABLE        "make_assignable"
+#define PCID_MSG_FIELD_REBIND           "rebind"
+
+/*
+ *******************************************************************************
+ * Revert device from assignable state
+ *
+ * This command reverts effect of "make_assignable" command. Basically,
+ * now device can be used by OS again.
+ *
+ * Request (see other mandatory fields above):
+ *  - "cmd" field of the request must be set to "revert_assignable".
+ *  - "sbdf" SBDF of the device in format defined by PCID_SBDF_FMT.
+ *  - "rebind" = true if daemon needs to rebind device back to it's
+ *    original driver, which name was saved by "make_assignable" command
+ *
+ * Response (see other mandatory fields above):
+ *  - "resp" field of the response must be set to "revert_assignable".
+ */
+#define PCID_CMD_REVERT_ASSIGNABLE      "revert_assignable"
+
+/*
+ *******************************************************************************
+ * Check is device assigned
+ *
+ * This command checks device is assigned
+ *
+ * Request (see other mandatory fields above):
+ *  - "cmd" field of the request must be set to "is_device_assigned".
+ *  - "sbdf" SBDF of the device in format defined by PCID_SBDF_FMT.
+ *
+ * Response (see other mandatory fields above):
+ *  - "resp" field of the response must be set to "is_device_assigned".
+ * Command specific response data:
+ * +-------------+--------------+----------------------------------------------+
+ * | result      | bool         | true if device assigned                      |
+ * +-------------+--------------+----------------------------------------------+
+ */
+#define PCID_CMD_IS_ASSIGNED            "is_device_assigned"
+#define PCID_MSG_FIELD_RESULT           "result"
+
+/*
+ *******************************************************************************
+ * Get device resources
+ *
+ * This command returns resource list of device
+ *
+ * Request (see other mandatory fields above):
+ *  - "cmd" field of the request must be set to "resource_list".
+ *  - "sbdf" SBDF of the device in format defined by PCID_SBDF_FMT.
+ *
+ * Response (see other mandatory fields above):
+ *  - "resp" field of the response must be set to "resource_list".
+ * Command specific response data:
+ * +-------------+--------------+----------------------------------------------+
+ * | resources   | map          | key 'iomem' - list of memory regions         |
+ * |             |              | key 'irqs' - list of irqs                    |
+ * +-------------+--------------+----------------------------------------------+
+ */
+#define PCID_CMD_RESOURCE_LIST          "resource_list"
+/* Arguments */
+#define PCID_MSG_FIELD_DOMID            "domid"
+/* Result */
+#define PCID_MSG_FIELD_RESOURCES        "resources"
+#define PCID_RESULT_KEY_IOMEM           "iomem"
+#define PCID_RESULT_KEY_IRQS            "irqs"
+
+/*
+ *******************************************************************************
+ * Write BDF values to the pciback sysfs path
+ *
+ * This command resets PCI device
+ *
+ * Request (see other mandatory fields above):
+ *  - "cmd" field of the request must be set to "write_bdf".
+ *  - "sbdf" SBDF of the device in format defined by PCID_SBDF_FMT.
+ *  - "name" name of sysfs file of pciback driver
+ *
+ * Response (see other mandatory fields above):
+ *  - "resp" field of the response must be set to "write_bdf".
+ */
+#define PCID_CMD_WRITE_BDF               "write_bdf"
+#define PCID_MSG_FIELD_NAME              "name"
+
+/*
+ *******************************************************************************
+ * Reset PCI device
+ *
+ * This command resets PCI device
+ *
+ * Request (see other mandatory fields above):
+ *  - "cmd" field of the request must be set to "reset_device".
+ *  - "sbdf" SBDF of the device in format defined by PCID_SBDF_FMT.
+ *
+ * Response (see other mandatory fields above):
+ *  - "resp" field of the response must be set to "reset_device".
+ */
+#define PCID_CMD_RESET_DEVICE            "reset_device"
+
+int libxl_pcid_process(libxl_ctx *ctx);
+
+#endif /* PCID_H */
+
+/*
+ * Local variables:
+ *  mode: C
+ *  c-file-style: "linux"
+ *  indent-tabs-mode: t
+ *  c-basic-offset: 8
+ *  tab-width: 8
+ * End:
+ */
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index ea8994af6d..b64658e72f 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -77,6 +77,7 @@ SRCS-y += libxl.c
 SRCS-y += libxl_create.c
 SRCS-y += libxl_dm.c
 SRCS-y += libxl_pci.c
+SRCS-y += libxl_pcid.c
 SRCS-y += libxl_vchan.c
 SRCS-y += libxl_dom.c
 SRCS-y += libxl_exec.c
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 4bbbfe9f16..3a2c4d57f7 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -18,6 +18,10 @@
 
 #include "libxl_internal.h"
 
+#include <pcid.h>
+
+#include "libxl_vchan.h"
+
 #define PCI_BDF                "%04x:%02x:%02x.%01x"
 #define PCI_BDF_SHORT          "%02x:%02x.%01x"
 #define PCI_BDF_VDEVFN         "%04x:%02x:%02x.%01x@%02x"
@@ -25,6 +29,161 @@
 #define PCI_BDF_XSPATH         "%04x-%02x-%02x-%01x"
 #define PCI_PT_QDEV_ID         "pci-pt-%02x_%02x.%01x"
 
+static int process_list_assignable(libxl__gc *gc,
+                                   const libxl__json_object *response,
+                                   libxl__json_object **result)
+{
+    *result = (libxl__json_object *)libxl__json_map_get(PCID_MSG_FIELD_DEVICES,
+                                                        response, JSON_ARRAY);
+    if (!*result)
+        return ERROR_INVAL;
+
+    return 0;
+}
+
+static int pci_handle_response(libxl__gc *gc,
+                               const libxl__json_object *response,
+                               libxl__json_object **result)
+{
+    const libxl__json_object *command_obj;
+    const libxl__json_object *err_obj;
+    char *command_name;
+    int ret = 0;
+
+    *result = NULL;
+
+    command_obj = libxl__json_map_get(PCID_MSG_FIELD_RESP, response, JSON_STRING);
+    if (!command_obj) {
+        /* This is an unsupported or bad response. */
+        return 0;
+    }
+
+    err_obj = libxl__json_map_get(PCID_MSG_FIELD_ERR, response, JSON_STRING);
+    if (!err_obj) {
+        /* Bad packet without error code field. */
+        return 0;
+    }
+
+    if (strcmp(err_obj->u.string, PCID_MSG_ERR_OK) != 0) {
+        const libxl__json_object *err_desc_obj;
+
+        /* The response may contain an optional error string. */
+        err_desc_obj = libxl__json_map_get(PCID_MSG_FIELD_ERR_DESC,
+                                           response, JSON_STRING);
+        if (err_desc_obj)
+            LOG(ERROR, "%s", err_desc_obj->u.string);
+        else
+            LOG(ERROR, "%s", err_obj->u.string);
+        return ERROR_FAIL;
+    }
+
+    command_name = command_obj->u.string;
+    LOG(DEBUG, "command: %s", command_name);
+
+    if (strcmp(command_name, PCID_CMD_LIST_ASSIGNABLE) == 0)
+        ret = process_list_assignable(gc, response, result);
+    else if (strcmp(command_name, PCID_CMD_MAKE_ASSIGNABLE) == 0)
+        *result = libxl__json_object_alloc(gc, JSON_NULL);
+    else if (strcmp(command_name, PCID_CMD_REVERT_ASSIGNABLE) == 0)
+        *result = libxl__json_object_alloc(gc, JSON_NULL);
+    else if (strcmp(command_name, PCID_CMD_IS_ASSIGNED) == 0)
+        *result = (libxl__json_object *)libxl__json_map_get(PCID_MSG_FIELD_RESULT,
+                response, JSON_BOOL);
+    else if (strcmp(command_name, PCID_CMD_RESET_DEVICE) == 0)
+        *result = libxl__json_object_alloc(gc, JSON_NULL);
+    else if (strcmp(command_name, PCID_CMD_RESOURCE_LIST) == 0)
+        *result = (libxl__json_object *)libxl__json_map_get(PCID_MSG_FIELD_RESOURCES,
+                response, JSON_MAP);
+    else if (strcmp(command_name, PCID_CMD_WRITE_BDF) == 0)
+        *result = libxl__json_object_alloc(gc, JSON_NULL);
+    return ret;
+}
+
+#define CONVERT_YAJL_GEN_TO_STATUS(gen) \
+    ((gen) == yajl_gen_status_ok ? yajl_status_ok : yajl_status_error)
+
+static char *pci_prepare_request(libxl__gc *gc, yajl_gen gen, char *cmd,
+                             libxl__json_object *args)
+{
+    const unsigned char *buf;
+    libxl_yajl_length len;
+    yajl_gen_status sts;
+    yajl_status ret;
+    char *request = NULL;
+    int rc;
+
+    ret = CONVERT_YAJL_GEN_TO_STATUS(yajl_gen_map_open(gen));
+    if (ret != yajl_status_ok)
+        return NULL;
+
+    rc = libxl__vchan_field_add_string(gc, gen, PCID_MSG_FIELD_CMD, cmd);
+    if (rc)
+        return NULL;
+
+    if (args) {
+        int idx = 0;
+        libxl__json_map_node *node = NULL;
+
+        assert(args->type == JSON_MAP);
+        for (idx = 0; idx < args->u.map->count; idx++) {
+            if (flexarray_get(args->u.map, idx, (void**)&node) != 0)
+                break;
+
+            ret = CONVERT_YAJL_GEN_TO_STATUS(libxl__yajl_gen_asciiz(gen, node->map_key));
+            if (ret != yajl_status_ok)
+                return NULL;
+            ret = libxl__json_object_to_yajl_gen(gc, gen, node->obj);
+            if (ret != yajl_status_ok)
+                return NULL;
+        }
+    }
+    ret = CONVERT_YAJL_GEN_TO_STATUS(yajl_gen_map_close(gen));
+    if (ret != yajl_status_ok)
+        return NULL;
+
+    sts = yajl_gen_get_buf(gen, &buf, &len);
+    if (sts != yajl_gen_status_ok)
+        return NULL;
+
+    request = libxl__sprintf(gc, "%s", buf);
+
+    vchan_dump_gen(gc, gen);
+
+    return request;
+}
+
+static struct vchan_info *pci_vchan_get_client(libxl__gc *gc, libxl_domid backend_domid)
+{
+    static struct vchan_info *vchan = NULL;
+
+    if (vchan) {
+        if (vchan->initialized)
+            return vchan;
+    } else {
+        vchan = libxl__zalloc(gc, sizeof(*vchan));
+    }
+    vchan->state = vchan_new_client(gc, PCID_SRV_NAME, backend_domid);
+    if (!(vchan->state)) {
+        vchan = NULL;
+        goto out;
+    }
+
+    vchan->handle_response = pci_handle_response;
+    vchan->prepare_request = pci_prepare_request;
+    vchan->receive_buf_size = PCI_RECEIVE_BUFFER_SIZE;
+    vchan->max_buf_size = PCI_MAX_SIZE_RX_BUF;
+    vchan->initialized = true;
+
+out:
+    return vchan;
+}
+
+static void pci_vchan_free(libxl__gc *gc, struct vchan_info *vchan)
+{
+    vchan_fini_one(gc, vchan->state);
+    vchan->initialized = false;
+}
+
 static unsigned int pci_encode_bdf(libxl_device_pci *pci)
 {
     unsigned int value;
@@ -359,33 +518,6 @@ static bool is_pci_in_array(libxl_device_pci *pcis, int num,
     return i < num;
 }
 
-/* Write the standard BDF into the sysfs path given by sysfs_path. */
-static int sysfs_write_bdf(libxl__gc *gc, const char * sysfs_path,
-                           libxl_device_pci *pci)
-{
-    int rc, fd;
-    char *buf;
-
-    fd = open(sysfs_path, O_WRONLY);
-    if (fd < 0) {
-        LOGE(ERROR, "Couldn't open %s", sysfs_path);
-        return ERROR_FAIL;
-    }
-
-    buf = GCSPRINTF(PCI_BDF, pci->domain, pci->bus,
-                    pci->dev, pci->func);
-    rc = write(fd, buf, strlen(buf));
-    /* Annoying to have two if's, but we need the errno */
-    if (rc < 0)
-        LOGE(ERROR, "write to %s returned %d", sysfs_path, rc);
-    close(fd);
-
-    if (rc < 0)
-        return ERROR_FAIL;
-
-    return 0;
-}
-
 #define PCI_INFO_PATH "/libxl/pci"
 
 static char *pci_info_xs_path(libxl__gc *gc, libxl_device_pci *pci,
@@ -429,30 +561,33 @@ static void pci_info_xs_remove(libxl__gc *gc, libxl_device_pci *pci,
     xs_rm(ctx->xsh, XBT_NULL, path);
 }
 
-libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
+libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num, libxl_domid backend_domid)
 {
     GC_INIT(ctx);
     libxl_device_pci *pcis = NULL, *new;
-    struct dirent *de;
-    DIR *dir;
+    struct vchan_info *vchan;
+    libxl__json_object *result, *dev_obj;
+    int i;
 
     *num = 0;
 
-    dir = opendir(SYSFS_PCIBACK_DRIVER);
-    if (NULL == dir) {
-        if (errno == ENOENT) {
-            LOG(ERROR, "Looks like pciback driver not loaded");
-        } else {
-            LOGE(ERROR, "Couldn't open %s", SYSFS_PCIBACK_DRIVER);
-        }
+    vchan = pci_vchan_get_client(gc, backend_domid);
+    if (!vchan)
         goto out;
-    }
 
-    while((de = readdir(dir))) {
+    result = vchan_send_command(gc, vchan, PCID_CMD_LIST_ASSIGNABLE, NULL);
+    if (!result)
+        goto vchan_free;
+
+    for (i = 0; (dev_obj = libxl__json_array_get(result, i)); i++) {
+        const char *sbdf_str = libxl__json_object_get_string(dev_obj);
         unsigned int dom, bus, dev, func;
-        char *name;
+        const char *name;
 
-        if (sscanf(de->d_name, PCI_BDF, &dom, &bus, &dev, &func) != 4)
+        if (!sbdf_str)
+            continue;
+
+        if (sscanf(sbdf_str, PCID_SBDF_FMT, &dom, &bus, &dev, &func) != 4)
             continue;
 
         new = realloc(pcis, ((*num) + 1) * sizeof(*new));
@@ -474,7 +609,9 @@ libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
         (*num)++;
     }
 
-    closedir(dir);
+vchan_free:
+    pci_vchan_free(gc, vchan);
+
 out:
     GC_FREE;
     return pcis;
@@ -490,44 +627,6 @@ void libxl_device_pci_assignable_list_free(libxl_device_pci *list, int num)
     free(list);
 }
 
-/* Unbind device from its current driver, if any.  If driver_path is non-NULL,
- * store the path to the original driver in it. */
-static int sysfs_dev_unbind(libxl__gc *gc, libxl_device_pci *pci,
-                            char **driver_path)
-{
-    char * spath, *dp = NULL;
-    struct stat st;
-
-    spath = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/driver",
-                           pci->domain,
-                           pci->bus,
-                           pci->dev,
-                           pci->func);
-    if ( !lstat(spath, &st) ) {
-        /* Find the canonical path to the driver. */
-        dp = libxl__zalloc(gc, PATH_MAX);
-        dp = realpath(spath, dp);
-        if ( !dp ) {
-            LOGE(ERROR, "realpath() failed");
-            return -1;
-        }
-
-        LOG(DEBUG, "Driver re-plug path: %s", dp);
-
-        /* Unbind from the old driver */
-        spath = GCSPRINTF("%s/unbind", dp);
-        if ( sysfs_write_bdf(gc, spath, pci) < 0 ) {
-            LOGE(ERROR, "Couldn't unbind device");
-            return -1;
-        }
-    }
-
-    if ( driver_path )
-        *driver_path = dp;
-
-    return 0;
-}
-
 static uint16_t sysfs_dev_get_vendor(libxl__gc *gc, libxl_device_pci *pci)
 {
     char *pci_device_vendor_path =
@@ -639,116 +738,33 @@ bool libxl__is_igd_vga_passthru(libxl__gc *gc,
     return false;
 }
 
-/*
- * A brief comment about slots.  I don't know what slots are for; however,
- * I have by experimentation determined:
- * - Before a device can be bound to pciback, its BDF must first be listed
- *   in pciback/slots
- * - The way to get the BDF listed there is to write BDF to
- *   pciback/new_slot
- * - Writing the same BDF to pciback/new_slot is not idempotent; it results
- *   in two entries of the BDF in pciback/slots
- * It's not clear whether having two entries in pciback/slots is a problem
- * or not.  Just to be safe, this code does the conservative thing, and
- * first checks to see if there is a slot, adding one only if one does not
- * already exist.
- */
-
-/* Scan through /sys/.../pciback/slots looking for pci's BDF */
-static int pciback_dev_has_slot(libxl__gc *gc, libxl_device_pci *pci)
-{
-    FILE *f;
-    int rc = 0;
-    unsigned dom, bus, dev, func;
-
-    f = fopen(SYSFS_PCIBACK_DRIVER"/slots", "r");
-
-    if (f == NULL) {
-        LOGE(ERROR, "Couldn't open %s", SYSFS_PCIBACK_DRIVER"/slots");
-        return ERROR_FAIL;
-    }
-
-    while (fscanf(f, "%x:%x:%x.%d\n", &dom, &bus, &dev, &func) == 4) {
-        if (dom == pci->domain
-            && bus == pci->bus
-            && dev == pci->dev
-            && func == pci->func) {
-            rc = 1;
-            goto out;
-        }
-    }
-out:
-    fclose(f);
-    return rc;
-}
-
 static int pciback_dev_is_assigned(libxl__gc *gc, libxl_device_pci *pci)
 {
-    char * spath;
+    struct vchan_info *vchan;
     int rc;
-    struct stat st;
+    libxl__json_object *args, *result;
 
-    if ( access(SYSFS_PCIBACK_DRIVER, F_OK) < 0 ) {
-        if ( errno == ENOENT ) {
-            LOG(ERROR, "Looks like pciback driver is not loaded");
-        } else {
-            LOGE(ERROR, "Can't access "SYSFS_PCIBACK_DRIVER);
-        }
-        return -1;
+    vchan = pci_vchan_get_client(gc, pci->backend_domid);
+    if (!vchan) {
+        rc = ERROR_NOT_READY;
+        goto out;
     }
 
-    spath = GCSPRINTF(SYSFS_PCIBACK_DRIVER"/"PCI_BDF,
-                      pci->domain, pci->bus,
-                      pci->dev, pci->func);
-    rc = lstat(spath, &st);
+    args = libxl__vchan_start_args(gc);
 
-    if( rc == 0 )
-        return 1;
-    if ( rc < 0 && errno == ENOENT )
-        return 0;
-    LOGE(ERROR, "Accessing %s", spath);
-    return -1;
-}
-
-static int pciback_dev_assign(libxl__gc *gc, libxl_device_pci *pci)
-{
-    int rc;
+    libxl__vchan_arg_add_string(gc, args, PCID_MSG_FIELD_SBDF,
+                                GCSPRINTF(PCID_SBDF_FMT, pci->domain,
+                                          pci->bus, pci->dev, pci->func));
 
-    if ( (rc = pciback_dev_has_slot(gc, pci)) < 0 ) {
-        LOGE(ERROR, "Error checking for pciback slot");
-        return ERROR_FAIL;
-    } else if (rc == 0) {
-        if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/new_slot",
-                             pci) < 0 ) {
-            LOGE(ERROR, "Couldn't bind device to pciback!");
-            return ERROR_FAIL;
-        }
-    }
-
-    if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/bind", pci) < 0 ) {
-        LOGE(ERROR, "Couldn't bind device to pciback!");
-        return ERROR_FAIL;
-    }
-    return 0;
-}
-
-static int pciback_dev_unassign(libxl__gc *gc, libxl_device_pci *pci)
-{
-    /* Remove from pciback */
-    if ( sysfs_dev_unbind(gc, pci, NULL) < 0 ) {
-        LOG(ERROR, "Couldn't unbind device!");
-        return ERROR_FAIL;
+    result = vchan_send_command(gc, vchan, PCID_CMD_IS_ASSIGNED, args);
+    if (!result) {
+        rc = ERROR_FAIL;
     }
+    rc = result->u.b;
+    pci_vchan_free(gc, vchan);
 
-    /* Remove slot if necessary */
-    if ( pciback_dev_has_slot(gc, pci) > 0 ) {
-        if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/remove_slot",
-                             pci) < 0 ) {
-            LOGE(ERROR, "Couldn't remove pciback slot");
-            return ERROR_FAIL;
-        }
-    }
-    return 0;
+out:
+    return rc;
 }
 
 static int libxl__device_pci_assignable_add(libxl__gc *gc,
@@ -756,87 +772,29 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
                                             int rebind)
 {
     libxl_ctx *ctx = libxl__gc_owner(gc);
-    unsigned dom, bus, dev, func;
-    char *spath, *driver_path = NULL;
-    const char *name;
+    struct vchan_info *vchan;
     int rc;
-    struct stat st;
+    libxl__json_object *args, *result;
 
-    /* Local copy for convenience */
-    dom = pci->domain;
-    bus = pci->bus;
-    dev = pci->dev;
-    func = pci->func;
-    name = pci->name;
-
-    /* Sanitise any name that is set */
-    if (name) {
-        unsigned int i, n = strlen(name);
-
-        if (n > 64) { /* Reasonable upper bound on name length */
-            LOG(ERROR, "Name too long");
-            return ERROR_FAIL;
-        }
-
-        for (i = 0; i < n; i++) {
-            if (!isgraph(name[i])) {
-                LOG(ERROR, "Names may only include printable characters");
-                return ERROR_FAIL;
-            }
-        }
-    }
-
-    /* See if the device exists */
-    spath = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF, dom, bus, dev, func);
-    if ( lstat(spath, &st) ) {
-        LOGE(ERROR, "Couldn't lstat %s", spath);
-        return ERROR_FAIL;
-    }
-
-    /* Check to see if it's already assigned to pciback */
-    rc = pciback_dev_is_assigned(gc, pci);
-    if ( rc < 0 ) {
-        return ERROR_FAIL;
-    }
-    if ( rc ) {
-        LOG(WARN, PCI_BDF" already assigned to pciback", dom, bus, dev, func);
-        goto name;
+    vchan = pci_vchan_get_client(gc, pci->backend_domid);
+    if (!vchan) {
+        rc = ERROR_NOT_READY;
+        goto out;
     }
 
-    /* Check to see if there's already a driver that we need to unbind from */
-    if ( sysfs_dev_unbind(gc, pci, &driver_path ) ) {
-        LOG(ERROR, "Couldn't unbind "PCI_BDF" from driver",
-            dom, bus, dev, func);
-        return ERROR_FAIL;
-    }
+    args = libxl__vchan_start_args(gc);
 
-    /* Store driver_path for rebinding to dom0 */
-    if ( rebind ) {
-        if ( driver_path ) {
-            pci_info_xs_write(gc, pci, "driver_path", driver_path);
-        } else if ( (driver_path =
-                     pci_info_xs_read(gc, pci, "driver_path")) != NULL ) {
-            LOG(INFO, PCI_BDF" not bound to a driver, will be rebound to %s",
-                dom, bus, dev, func, driver_path);
-        } else {
-            LOG(WARN, PCI_BDF" not bound to a driver, will not be rebound.",
-                dom, bus, dev, func);
-        }
-    } else {
-        pci_info_xs_remove(gc, pci, "driver_path");
-    }
+    libxl__vchan_arg_add_string(gc, args, PCID_MSG_FIELD_SBDF,
+                                GCSPRINTF(PCID_SBDF_FMT, pci->domain,
+                                          pci->bus, pci->dev, pci->func));
+    libxl__vchan_arg_add_bool(gc, args, PCID_MSG_FIELD_REBIND, rebind);
 
-    if ( pciback_dev_assign(gc, pci) ) {
-        LOG(ERROR, "Couldn't bind device to pciback!");
-        return ERROR_FAIL;
+    result = vchan_send_command(gc, vchan, PCID_CMD_MAKE_ASSIGNABLE, args);
+    if (!result) {
+        rc = ERROR_FAIL;
+        goto vchan_free;
     }
 
-name:
-    if (name)
-        pci_info_xs_write(gc, pci, "name", name);
-    else
-        pci_info_xs_remove(gc, pci, "name");
-
     /*
      * DOMID_IO is just a sentinel domain, without any actual mappings,
      * so always pass XEN_DOMCTL_DEV_RDM_RELAXED to avoid assignment being
@@ -844,12 +802,15 @@ name:
      */
     rc = xc_assign_device(ctx->xch, DOMID_IO, pci_encode_bdf(pci),
                           XEN_DOMCTL_DEV_RDM_RELAXED);
-    if ( rc < 0 ) {
-        LOG(ERROR, "failed to quarantine "PCI_BDF, dom, bus, dev, func);
-        return ERROR_FAIL;
-    }
+    if ( rc < 0 )
+        LOG(ERROR, "failed to quarantine "PCI_BDF, pci->domain, pci->bus,
+            pci->dev, pci->func);
 
-    return 0;
+vchan_free:
+    pci_vchan_free(gc, vchan);
+
+out:
+    return rc;
 }
 
 static int name2bdf(libxl__gc *gc, libxl_device_pci *pci)
@@ -892,13 +853,8 @@ static int libxl__device_pci_assignable_remove(libxl__gc *gc,
 {
     libxl_ctx *ctx = libxl__gc_owner(gc);
     int rc;
-    char *driver_path;
-
-    /* If the device is named then we need to look up the BDF */
-    if (pci->name) {
-        rc = name2bdf(gc, pci);
-        if (rc) return rc;
-    }
+    struct vchan_info *vchan;
+    libxl__json_object *args, *temp_obj, *result;
 
     /* De-quarantine */
     rc = xc_deassign_device(ctx->xch, DOMID_IO, pci_encode_bdf(pci));
@@ -908,41 +864,43 @@ static int libxl__device_pci_assignable_remove(libxl__gc *gc,
         return ERROR_FAIL;
     }
 
-    /* Unbind from pciback */
-    if ( (rc = pciback_dev_is_assigned(gc, pci)) < 0 ) {
-        return ERROR_FAIL;
-    } else if ( rc ) {
-        pciback_dev_unassign(gc, pci);
-    } else {
-        LOG(WARN, "Not bound to pciback");
+    vchan = pci_vchan_get_client(gc, pci->backend_domid);
+    if (!vchan) {
+        rc = ERROR_NOT_READY;
+        goto out;
     }
 
-    /* Rebind if necessary */
-    driver_path = pci_info_xs_read(gc, pci, "driver_path");
+    args = libxl__json_object_alloc(gc, JSON_MAP);
+    temp_obj = libxl__json_object_alloc(gc, JSON_STRING);
+    if (!temp_obj) {
+        rc = ERROR_NOMEM;
+        goto vchan_free;
+    }
+    temp_obj->u.string = GCSPRINTF(PCID_SBDF_FMT, pci->domain, pci->bus,
+                                   pci->dev, pci->func);
+    flexarray_append_pair(args->u.map, PCID_MSG_FIELD_SBDF, temp_obj);
 
-    if ( driver_path ) {
-        if ( rebind ) {
-            LOG(INFO, "Rebinding to driver at %s", driver_path);
+    args = libxl__json_object_alloc(gc, JSON_MAP);
+    temp_obj = libxl__json_object_alloc(gc, JSON_BOOL);
+    if (!temp_obj) {
+        rc = ERROR_NOMEM;
+        goto vchan_free;
+    }
 
-            if ( sysfs_write_bdf(gc,
-                                 GCSPRINTF("%s/bind", driver_path),
-                                 pci) < 0 ) {
-                LOGE(ERROR, "Couldn't bind device to %s", driver_path);
-                return -1;
-            }
+    temp_obj->u.b = rebind;
+    flexarray_append_pair(args->u.map, PCID_MSG_FIELD_REBIND, temp_obj);
 
-            pci_info_xs_remove(gc, pci, "driver_path");
-        }
-    } else {
-        if ( rebind ) {
-            LOG(WARN,
-                "Couldn't find path for original driver; not rebinding");
-        }
+    result = vchan_send_command(gc, vchan, PCID_CMD_REVERT_ASSIGNABLE, args);
+    if (!result) {
+        rc = ERROR_FAIL;
+        goto vchan_free;
     }
 
-    pci_info_xs_remove(gc, pci, "name");
+vchan_free:
+    pci_vchan_free(gc, vchan);
 
-    return 0;
+out:
+    return rc;
 }
 
 int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_device_pci *pci,
@@ -1375,6 +1333,36 @@ static bool pci_supp_legacy_irq(void)
 #endif
 }
 
+static int pciback_write_bdf(libxl__gc *gc, char *name, libxl_device_pci *pci)
+{
+    struct vchan_info *vchan;
+    int rc;
+    libxl__json_object *args, *result;
+
+    vchan = pci_vchan_get_client(gc, pci->backend_domid);
+    if (!vchan) {
+        rc = ERROR_NOT_READY;
+        goto out;
+    }
+
+    args = libxl__vchan_start_args(gc);
+
+    libxl__vchan_arg_add_string(gc, args, PCID_MSG_FIELD_SBDF,
+            GCSPRINTF(PCID_SBDF_FMT, pci->domain,
+                pci->bus, pci->dev, pci->func));
+    libxl__vchan_arg_add_string(gc, args, PCID_MSG_FIELD_NAME, name);
+
+    result = vchan_send_command(gc, vchan, PCID_CMD_WRITE_BDF, args);
+    if (!result) {
+        rc = ERROR_FAIL;
+        goto vchan_free;
+    }
+vchan_free:
+    pci_vchan_free(gc, vchan);
+out:
+    return rc;
+}
+
 static void pci_add_dm_done(libxl__egc *egc,
                             pci_add_state *pas,
                             int rc)
@@ -1382,41 +1370,51 @@ static void pci_add_dm_done(libxl__egc *egc,
     STATE_AO_GC(pas->aodev->ao);
     libxl_ctx *ctx = libxl__gc_owner(gc);
     libxl_domid domid = pas->pci_domid;
-    char *sysfs_path;
-    FILE *f;
     unsigned long long start, end, flags, size;
     int irq, i;
     int r;
     uint32_t flag = XEN_DOMCTL_DEV_RDM_RELAXED;
     uint32_t domainid = domid;
     bool isstubdom = libxl_is_stubdom(ctx, domid, &domainid);
+    struct vchan_info *vchan;
+    libxl__json_object *result;
+    libxl__json_object *args;
+    const libxl__json_object *value;
+    libxl__json_object *res_obj;
+    libxl_device_pci *pci = &pas->pci;
+
+    vchan = pci_vchan_get_client(gc, pci->backend_domid);
+    if (!vchan)
+        goto out;
 
     /* Convenience aliases */
     bool starting = pas->starting;
-    libxl_device_pci *pci = &pas->pci;
     bool hvm = libxl__domain_type(gc, domid) == LIBXL_DOMAIN_TYPE_HVM;
 
     libxl__ev_qmp_dispose(gc, &pas->qmp);
 
-    if (rc) goto out;
+    args = libxl__vchan_start_args(gc);
+    libxl__vchan_arg_add_string(gc, args, PCID_MSG_FIELD_SBDF,
+                                GCSPRINTF(PCID_SBDF_FMT, pci->domain,
+                                          pci->bus, pci->dev, pci->func));
+    libxl__vchan_arg_add_integer(gc, args, PCID_MSG_FIELD_DOMID, domid);
+
+    result = vchan_send_command(gc, vchan, PCID_CMD_RESOURCE_LIST, args);
+    pci_vchan_free(gc, vchan);
+    if (!result)
+        goto out;
+    value = libxl__json_map_get(PCID_RESULT_KEY_IOMEM, result, JSON_ARRAY);
 
     /* stubdomain is always running by now, even at create time */
     if (isstubdom)
         starting = false;
-
-    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/resource", pci->domain,
-                           pci->bus, pci->dev, pci->func);
-    f = fopen(sysfs_path, "r");
     start = end = flags = size = 0;
     irq = 0;
-
-    if (f == NULL) {
-        LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
-        rc = ERROR_FAIL;
-        goto out;
-    }
     for (i = 0; i < PROC_PCI_NUM_RESOURCES; i++) {
-        if (fscanf(f, "0x%llx 0x%llx 0x%llx\n", &start, &end, &flags) != 3)
+        if ((res_obj = libxl__json_array_get(value, i)) == NULL)
+            continue;
+        const char *iomem_str = libxl__json_object_get_string(res_obj);
+        if (sscanf(iomem_str, "0x%llx 0x%llx 0x%llx\n", &start, &end, &flags) != 3)
             continue;
         size = end - start + 1;
         if (start) {
@@ -1426,7 +1424,6 @@ static void pci_add_dm_done(libxl__egc *egc,
                     LOGED(ERROR, domainid,
                           "xc_domain_ioport_permission 0x%llx/0x%llx (error %d)",
                           start, size, r);
-                    fclose(f);
                     rc = ERROR_FAIL;
                     goto out;
                 }
@@ -1437,29 +1434,21 @@ static void pci_add_dm_done(libxl__egc *egc,
                     LOGED(ERROR, domainid,
                           "xc_domain_iomem_permission 0x%llx/0x%llx (error %d)",
                           start, size, r);
-                    fclose(f);
                     rc = ERROR_FAIL;
                     goto out;
                 }
             }
         }
     }
-    fclose(f);
     if (!pci_supp_legacy_irq())
         goto out_no_irq;
-    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
-                                pci->bus, pci->dev, pci->func);
-    f = fopen(sysfs_path, "r");
-    if (f == NULL) {
-        LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
-        goto out_no_irq;
-    }
-    if ((fscanf(f, "%u", &irq) == 1) && irq) {
+    value = libxl__json_map_get(PCID_RESULT_KEY_IRQS, result, JSON_ARRAY);
+    if ((res_obj = libxl__json_array_get(value, i)) && 
+            (irq = libxl__json_object_get_integer(res_obj))) {
         r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
         if (r < 0) {
             LOGED(ERROR, domainid, "xc_physdev_map_pirq irq=%d (error=%d)",
                   irq, r);
-            fclose(f);
             rc = ERROR_FAIL;
             goto out;
         }
@@ -1467,17 +1456,14 @@ static void pci_add_dm_done(libxl__egc *egc,
         if (r < 0) {
             LOGED(ERROR, domainid,
                   "xc_domain_irq_permission irq=%d (error=%d)", irq, r);
-            fclose(f);
             rc = ERROR_FAIL;
             goto out;
         }
     }
-    fclose(f);
 
     /* Don't restrict writes to the PCI config space from this VM */
     if (pci->permissive) {
-        if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/permissive",
-                             pci) < 0 ) {
+        if (pciback_write_bdf(gc, "permissive", pci)) {
             LOGD(ERROR, domainid, "Setting permissive for device");
             rc = ERROR_FAIL;
             goto out;
@@ -1510,41 +1496,28 @@ out:
     pas->callback(egc, pas, rc);
 }
 
-static int libxl__device_pci_reset(libxl__gc *gc, unsigned int domain, unsigned int bus,
-                                   unsigned int dev, unsigned int func)
-{
-    char *reset;
-    int fd, rc;
-
-    reset = GCSPRINTF("%s/do_flr", SYSFS_PCIBACK_DRIVER);
-    fd = open(reset, O_WRONLY);
-    if (fd >= 0) {
-        char *buf = GCSPRINTF(PCI_BDF, domain, bus, dev, func);
-        rc = write(fd, buf, strlen(buf));
-        if (rc < 0)
-            LOGD(ERROR, domain, "write to %s returned %d", reset, rc);
-        close(fd);
-        return rc < 0 ? rc : 0;
-    }
-    if (errno != ENOENT)
-        LOGED(ERROR, domain, "Failed to access pciback path %s", reset);
-    reset = GCSPRINTF("%s/"PCI_BDF"/reset", SYSFS_PCI_DEV, domain, bus, dev, func);
-    fd = open(reset, O_WRONLY);
-    if (fd >= 0) {
-        rc = write(fd, "1", 1);
-        if (rc < 0)
-            LOGED(ERROR, domain, "write to %s returned %d", reset, rc);
-        close(fd);
-        return rc < 0 ? rc : 0;
-    }
-    if (errno == ENOENT) {
-        LOGD(ERROR, domain,
-             "The kernel doesn't support reset from sysfs for PCI device "PCI_BDF,
-             domain, bus, dev, func);
-    } else {
-        LOGED(ERROR, domain, "Failed to access reset path %s", reset);
+static int libxl__device_pci_reset(libxl__gc *gc, libxl_device_pci *pci)
+{
+    struct vchan_info *vchan;
+    int rc = 0;
+    libxl__json_object *args, *result;
+
+    vchan = pci_vchan_get_client(gc, pci->backend_domid);
+    if (!vchan) {
+        rc = ERROR_NOT_READY;
+        goto out;
     }
-    return -1;
+    args = libxl__vchan_start_args(gc);
+
+    libxl__vchan_arg_add_string(gc, args, PCID_MSG_FIELD_SBDF,
+            GCSPRINTF(PCID_SBDF_FMT, pci->domain, pci->bus, pci->dev, pci->func));
+    result = vchan_send_command(gc, vchan, PCID_CMD_RESET_DEVICE, args);
+    if (!result)
+        rc = ERROR_FAIL;
+    pci_vchan_free(gc, vchan);
+
+ out:
+    return rc;
 }
 
 int libxl__device_pci_setdefault(libxl__gc *gc, uint32_t domid,
@@ -1578,7 +1551,7 @@ static bool libxl_pci_assignable(libxl_ctx *ctx, libxl_device_pci *pci)
     int num;
     bool assignable;
 
-    pcis = libxl_device_pci_assignable_list(ctx, &num);
+    pcis = libxl_device_pci_assignable_list(ctx, &num, pci->backend_domid);
     assignable = is_pci_in_array(pcis, num, pci);
     libxl_device_pci_assignable_list_free(pcis, num);
 
@@ -1594,6 +1567,12 @@ static void device_pci_add_stubdom_done(libxl__egc *egc,
 static void device_pci_add_done(libxl__egc *egc,
     pci_add_state *, int rc);
 
+static void device_pci_get_backend_domd(libxl__gc *gc, libxl_device_pci *pci)
+{
+    if (pci->backend == NULL || libxl__resolve_domid(gc, pci->backend, &pci->backend_domid))
+        pci->backend_domid = DOMID_INVALID;
+}
+
 void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
                            libxl_device_pci *pci, bool starting,
                            libxl__ao_device *aodev)
@@ -1620,6 +1599,8 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
     pas->starting = starting;
     pas->callback = device_pci_add_stubdom_done;
 
+    device_pci_get_backend_domd(gc, pci);
+
     if (libxl__domain_type(gc, domid) == LIBXL_DOMAIN_TYPE_HVM) {
         rc = xc_test_assign_device(ctx->xch, domid, pci_encode_bdf(pci));
         if (rc) {
@@ -1651,7 +1632,7 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
     rc = pci_info_xs_write(gc, pci, "domid", GCSPRINTF("%u", domid));
     if (rc) goto out;
 
-    libxl__device_pci_reset(gc, pci->domain, pci->bus, pci->dev, pci->func);
+    libxl__device_pci_reset(gc, pci);
 
     stubdomid = libxl_get_stubdom_id(ctx, domid);
     if (stubdomid != 0) {
@@ -2216,7 +2197,7 @@ static void pci_remove_detached(libxl__egc *egc,
 
     /* don't do multiple resets while some functions are still passed through */
     if ((pci->vdevfn & 0x7) == 0) {
-        libxl__device_pci_reset(gc, pci->domain, pci->bus, pci->dev, pci->func);
+        libxl__device_pci_reset(gc, pci);
     }
 
     if (!isstubdom) {
diff --git a/tools/libs/light/libxl_pcid.c b/tools/libs/light/libxl_pcid.c
new file mode 100644
index 0000000000..d4a817dc6f
--- /dev/null
+++ b/tools/libs/light/libxl_pcid.c
@@ -0,0 +1,1095 @@
+/*
+    Utils for xl pcid daemon
+
+    Copyright (C) 2021 EPAM Systems Inc.
+
+    This library is free software; you can redistribute it and/or
+    modify it under the terms of the GNU Lesser General Public
+    License as published by the Free Software Foundation; either
+    version 2.1 of the License, or (at your option) any later version.
+
+    This library is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+    Lesser General Public License for more details.
+
+    You should have received a copy of the GNU Lesser General Public
+    License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#define _GNU_SOURCE  // required for strchrnul()
+
+#include "libxl_osdeps.h" /* must come before any other headers */
+
+#include "libxl_internal.h"
+#include "libxl_vchan.h"
+
+#include <libxl_utils.h>
+#include <libxlutil.h>
+
+#include <xenstore.h>
+
+#include <libxl.h>
+#include <libxl_json.h>
+#include <dirent.h>
+
+#include <pthread.h>
+#include <pcid.h>
+
+#define DOM0_ID 0
+
+#define PCI_BDF                "%04x:%02x:%02x.%01x"
+
+static int sysfs_write_bdf(libxl__gc *gc, const char * sysfs_path,
+        unsigned int domain, unsigned int bus,
+        unsigned int dev, unsigned int func);
+
+struct vchan_client {
+    XEN_LIST_ENTRY(struct vchan_client) list;
+
+    /* This is the watch entry fired for this client. */
+    char **watch_ret;
+    /* Length of the watch_ret[XS_WATCH_PATH]. */
+    size_t watch_len;
+
+    struct vchan_info info;
+
+    /*
+     * This context is used by the processing loop to create its own gc
+     * and use it while processing commands, so we do not get OOM.
+     */
+    libxl_ctx *ctx;
+    /* This gc holds all allocations made for the client needs itself. */
+    libxl__gc gc[1];
+    pthread_t run_thread;
+};
+
+static XEN_LIST_HEAD(clients_list, struct vchan_client) vchan_clients;
+
+static pthread_mutex_t vchan_client_mutex;
+
+static int make_error_reply(libxl__gc *gc, yajl_gen gen, char *desc,
+                            char *command_name)
+{
+    int rc;
+
+    rc = libxl__vchan_field_add_string(gc, gen, PCID_MSG_FIELD_RESP,
+                                       command_name);
+    if (rc)
+        return rc;
+
+    rc = libxl__vchan_field_add_string(gc, gen, PCID_MSG_FIELD_ERR,
+                                       PCID_MSG_ERR_FAILED);
+    if (rc)
+        return rc;
+
+    rc = libxl__vchan_field_add_string(gc, gen, PCID_MSG_FIELD_ERR_DESC, desc);
+    if (rc)
+        return rc;
+
+    return 0;
+}
+
+static int process_list_assignable(libxl__gc *gc, yajl_gen gen,
+                                   char *command_name,
+                                   const struct libxl__json_object *request,
+                                   struct libxl__json_object **response)
+{
+    struct dirent *de;
+    DIR *dir = NULL;
+
+    dir = opendir(SYSFS_PCI_DEV);
+    if (dir == NULL) {
+        make_error_reply(gc, gen, strerror(errno), command_name);
+        return ERROR_FAIL;
+    }
+
+    libxl__yajl_gen_asciiz(gen, PCID_MSG_FIELD_DEVICES);
+
+    *response = libxl__json_object_alloc(gc, JSON_ARRAY);
+
+    while ((de = readdir(dir))) {
+        unsigned int dom, bus, dev, func;
+
+        if (sscanf(de->d_name, PCID_SBDF_FMT, &dom, &bus, &dev, &func) != 4)
+            continue;
+
+        struct libxl__json_object *node =
+            libxl__json_object_alloc(gc, JSON_STRING);
+        node->u.string = de->d_name;
+        flexarray_append((*response)->u.array, node);
+    }
+
+    closedir(dir);
+
+    return 0;
+}
+
+static bool pci_supp_legacy_irq(void)
+{
+#ifdef CONFIG_PCI_SUPP_LEGACY_IRQ
+    return true;
+#else
+    return false;
+#endif
+}
+
+static int process_list_resources(libxl__gc *gc, yajl_gen gen,
+                                   char *command_name,
+                                   const struct libxl__json_object *request,
+                                   struct libxl__json_object **response)
+{
+    struct libxl__json_object *iomem =
+                 libxl__json_object_alloc(gc, JSON_ARRAY);
+    struct libxl__json_object *irqs =
+                 libxl__json_object_alloc(gc, JSON_ARRAY);
+    const struct libxl__json_object *json_sdbf;
+    const struct libxl__json_object *json_domid;
+    unsigned int dom, bus, dev, func;
+    libxl_domid domainid;
+    char *sysfs_path;
+    FILE *f;
+    unsigned long long start, end, flags;
+    int irq, i;
+    int rc = 0;
+    libxl__json_map_node *map_node = NULL;
+
+    json_sdbf = libxl__json_map_get(PCID_MSG_FIELD_SBDF, request, JSON_STRING);
+    if (!json_sdbf) {
+        make_error_reply(gc, gen, "No mandatory parameter 'sbdf'", command_name);
+        return ERROR_FAIL;
+    }
+    if (sscanf(libxl__json_object_get_string(json_sdbf), PCID_SBDF_FMT,
+               &dom, &bus, &dev, &func) != 4) {
+        make_error_reply(gc, gen, "Can't parse SBDF", command_name);
+        return ERROR_FAIL;
+    }
+
+    json_domid = libxl__json_map_get(PCID_MSG_FIELD_DOMID, request, JSON_INTEGER);
+    if (!json_domid) {
+        make_error_reply(gc, gen, "No mandatory parameter 'domid'", command_name);
+        return ERROR_FAIL;
+    }
+    domainid = libxl__json_object_get_integer(json_domid);
+
+    libxl__yajl_gen_asciiz(gen, PCID_MSG_FIELD_RESOURCES);
+    *response = libxl__json_object_alloc(gc, JSON_MAP);
+
+    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/resource", dom, bus, dev, func);
+    f = fopen(sysfs_path, "r");
+    start = 0;
+    irq = 0;
+
+    if (f == NULL) {
+        LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
+        rc = ERROR_FAIL;
+        goto out;
+    }
+    for (i = 0; i < PROC_PCI_NUM_RESOURCES; i++) {
+        if (fscanf(f, "0x%llx 0x%llx 0x%llx\n", &start, &end, &flags) != 3)
+            continue;
+        if (start) {
+            struct libxl__json_object *node =
+                libxl__json_object_alloc(gc, JSON_STRING);
+
+            node->u.string = GCSPRINTF("0x%llx 0x%llx 0x%llx", start, end, flags);
+            flexarray_append(iomem->u.array, node);
+        }
+    }
+    fclose(f);
+    if (!pci_supp_legacy_irq())
+        goto out_no_irq;
+    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", dom, bus, dev, func);
+    f = fopen(sysfs_path, "r");
+    if (f == NULL) {
+        LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
+        goto out_no_irq;
+    }
+    if ((fscanf(f, "%u", &irq) == 1) && irq) {
+            struct libxl__json_object *node =
+                libxl__json_object_alloc(gc, JSON_INTEGER);
+
+            node->u.i = irq;
+            flexarray_append(irqs->u.array, node);
+    }
+    fclose(f);
+
+    GCNEW(map_node);
+    map_node->map_key = libxl__strdup(gc, PCID_RESULT_KEY_IRQS);
+    map_node->obj = irqs;
+    flexarray_append((*response)->u.map, map_node);
+out_no_irq:
+    GCNEW(map_node);
+    map_node->map_key = libxl__strdup(gc, PCID_RESULT_KEY_IOMEM);
+    map_node->obj = iomem;
+    flexarray_append((*response)->u.map, map_node);
+    rc = 0;
+out:
+    return rc;
+}
+
+static int pciback_dev_is_assigned(libxl__gc *gc, unsigned int domain,
+				   unsigned int bus, unsigned int dev,
+				   unsigned int func)
+{
+    char * spath;
+    int rc;
+    struct stat st;
+
+    if (access(SYSFS_PCIBACK_DRIVER, F_OK) < 0) {
+        if (errno == ENOENT) {
+            LOG(ERROR, "Looks like pciback driver is not loaded");
+        } else {
+            LOGE(ERROR, "Can't access "SYSFS_PCIBACK_DRIVER);
+        }
+        return -1;
+    }
+
+    spath = GCSPRINTF(SYSFS_PCIBACK_DRIVER"/"PCI_BDF,
+		      domain, bus, dev, func);
+    rc = lstat(spath, &st);
+
+    if (rc == 0)
+        return 1;
+    if (rc < 0 && errno == ENOENT)
+        return 0;
+    LOGE(ERROR, "Accessing %s", spath);
+    return 0;
+}
+
+static int process_pciback_write_bdf(libxl__gc *gc, yajl_gen gen,
+                                   char *command_name,
+                                   const struct libxl__json_object *request,
+                                   struct libxl__json_object **response)
+{
+    const struct libxl__json_object *json_o;
+    unsigned int dom, bus, dev, func;
+    int rc = 0;
+    const char *name;
+    char *spath;
+
+    json_o = libxl__json_map_get(PCID_MSG_FIELD_SBDF, request, JSON_STRING);
+    if (!json_o) {
+        make_error_reply(gc, gen, "No mandatory parameter 'sbdf'", command_name);
+        return ERROR_FAIL;
+    }
+
+    if (sscanf(libxl__json_object_get_string(json_o), PCID_SBDF_FMT,
+           &dom, &bus, &dev, &func) != 4) {
+        make_error_reply(gc, gen, "Can't parse SBDF", command_name);
+        return ERROR_FAIL;
+    }
+
+    json_o = libxl__json_map_get(PCID_MSG_FIELD_NAME, request, JSON_STRING);
+    if (!json_o) {
+        make_error_reply(gc, gen, "No mandatory parameter 'rebind'", command_name);
+        return ERROR_FAIL;
+    }
+
+    name = libxl__json_object_get_string(json_o);
+    spath = GCSPRINTF("%s/%s", SYSFS_PCIBACK_DRIVER, name);
+    LOG(WARN, "sysf_write_bdf(%s, %d, %d, %d, %d)", spath, dom, bus, dev,func);
+    return rc;
+}
+
+#define PCID_INFO_PATH		"pcid"
+#define PCID_BDF_XSPATH         "%04x-%02x-%02x-%01x"
+
+static char *pcid_info_xs_path(libxl__gc *gc, unsigned int domain,
+			       unsigned int bus, unsigned int dev,
+			       unsigned int func, const char *node)
+{
+    return node ?
+        GCSPRINTF(PCID_INFO_PATH"/"PCID_BDF_XSPATH"/%s",
+                  domain, bus, dev, func, node) :
+        GCSPRINTF(PCID_INFO_PATH"/"PCID_BDF_XSPATH,
+                  domain, bus, dev, func);
+}
+
+
+static int pcid_info_xs_write(libxl__gc *gc, unsigned int domain,
+			       unsigned int bus, unsigned int dev,
+			       unsigned int func, const char *node,
+			      const char *val)
+{
+    char *path = pcid_info_xs_path(gc, domain, bus, dev, func, node);
+    int rc = libxl__xs_printf(gc, XBT_NULL, path, "%s", val);
+
+    if (rc) LOGE(WARN, "Write of %s to node %s failed.", val, path);
+
+    return rc;
+}
+
+static char *pcid_info_xs_read(libxl__gc *gc, unsigned int domain,
+			       unsigned int bus, unsigned int dev,
+			       unsigned int func, const char *node)
+{
+    char *path = pcid_info_xs_path(gc, domain, bus, dev, func, node);
+
+    return libxl__xs_read(gc, XBT_NULL, path);
+}
+
+static void pcid_info_xs_remove(libxl__gc *gc, unsigned int domain,
+			       unsigned int bus, unsigned int dev,
+			       unsigned int func, const char *node)
+{
+    char *path = pcid_info_xs_path(gc, domain, bus, dev, func, node);
+    libxl_ctx *ctx = libxl__gc_owner(gc);
+
+    /* Remove the xenstore entry */
+    xs_rm(ctx->xsh, XBT_NULL, path);
+}
+
+
+/* Write the standard BDF into the sysfs path given by sysfs_path. */
+static int sysfs_write_bdf(libxl__gc *gc, const char * sysfs_path,
+			   unsigned int domain, unsigned int bus,
+			   unsigned int dev, unsigned int func)
+{
+    int rc, fd;
+    char *buf;
+
+    fd = open(sysfs_path, O_WRONLY);
+    if (fd < 0) {
+        LOGE(ERROR, "Couldn't open %s", sysfs_path);
+        return ERROR_FAIL;
+    }
+
+    buf = GCSPRINTF(PCI_BDF, domain, bus, dev, func);
+    rc = write(fd, buf, strlen(buf));
+    /* Annoying to have two if's, but we need the errno */
+    if (rc < 0)
+        LOGE(ERROR, "write to %s returned %d", sysfs_path, rc);
+    close(fd);
+
+    if (rc < 0)
+        return ERROR_FAIL;
+
+    return 0;
+}
+
+
+/* Unbind device from its current driver, if any.  If driver_path is non-NULL,
+ * store the path to the original driver in it. */
+static int sysfs_dev_unbind(libxl__gc *gc, unsigned int domain,
+			    unsigned int bus, unsigned int dev,
+			    unsigned int func,
+                            char **driver_path)
+{
+    char * spath, *dp = NULL;
+    struct stat st;
+
+    spath = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/driver",
+                           domain, bus, dev, func);
+    if (!lstat(spath, &st)) {
+        /* Find the canonical path to the driver. */
+        dp = libxl__zalloc(gc, PATH_MAX);
+        dp = realpath(spath, dp);
+        if ( !dp ) {
+            LOGE(ERROR, "realpath() failed");
+            return -1;
+        }
+
+        LOG(DEBUG, "Driver re-plug path: %s", dp);
+
+        /* Unbind from the old driver */
+        spath = GCSPRINTF("%s/unbind", dp);
+        if (sysfs_write_bdf(gc, spath, domain, bus, dev, func) < 0) {
+            LOGE(ERROR, "Couldn't unbind device");
+            return -1;
+        }
+    }
+
+    if (driver_path)
+        *driver_path = dp;
+
+    return 0;
+}
+
+/*
+ * A brief comment about slots.  I don't know what slots are for; however,
+ * I have by experimentation determined:
+ * - Before a device can be bound to pciback, its BDF must first be listed
+ *   in pciback/slots
+ * - The way to get the BDF listed there is to write BDF to
+ *   pciback/new_slot
+ * - Writing the same BDF to pciback/new_slot is not idempotent; it results
+ *   in two entries of the BDF in pciback/slots
+ * It's not clear whether having two entries in pciback/slots is a problem
+ * or not.  Just to be safe, this code does the conservative thing, and
+ * first checks to see if there is a slot, adding one only if one does not
+ * already exist.
+ */
+
+/* Scan through /sys/.../pciback/slots looking for pci's BDF */
+static int pciback_dev_has_slot(libxl__gc *gc, unsigned int domain,
+			      unsigned int bus, unsigned int dev,
+			      unsigned int func)
+{
+    FILE *f;
+    int rc = 0;
+    unsigned s_domain, s_bus, s_dev, s_func;
+
+    f = fopen(SYSFS_PCIBACK_DRIVER"/slots", "r");
+
+    if (f == NULL) {
+        LOGE(ERROR, "Couldn't open %s", SYSFS_PCIBACK_DRIVER"/slots");
+        return ERROR_FAIL;
+    }
+
+    while (fscanf(f, "%x:%x:%x.%d\n",
+		  &s_domain, &s_bus, &s_dev, &s_func) == 4) {
+        if (s_domain == domain &&
+            s_bus == bus &&
+            s_dev == dev &&
+            s_func == func) {
+            rc = 1;
+            goto out;
+        }
+    }
+out:
+    fclose(f);
+    return rc;
+}
+
+static int pciback_dev_assign(libxl__gc *gc, unsigned int domain,
+			      unsigned int bus, unsigned int dev,
+			      unsigned int func)
+{
+    int rc;
+
+    if ( (rc = pciback_dev_has_slot(gc, domain, bus, dev, func)) < 0 ) {
+        LOGE(ERROR, "Error checking for pciback slot");
+        return ERROR_FAIL;
+    } else if (rc == 0) {
+        if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/new_slot",
+                             domain, bus, dev, func) < 0 ) {
+            LOGE(ERROR, "Couldn't bind device to pciback!");
+            return ERROR_FAIL;
+        }
+    }
+
+    if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/bind",
+			 domain, bus, dev, func) < 0 ) {
+        LOGE(ERROR, "Couldn't bind device to pciback!");
+        return ERROR_FAIL;
+    }
+    return 0;
+}
+
+static int process_pciback_dev_is_assigned(libxl__gc *gc, yajl_gen gen,
+                                   char *command_name,
+                                   const struct libxl__json_object *request,
+                                   struct libxl__json_object **response)
+{
+    const struct libxl__json_object *json_o;
+    unsigned int dom, bus, dev, func;
+    int rc;
+
+    libxl__yajl_gen_asciiz(gen, PCID_MSG_FIELD_RESULT);
+    *response = libxl__json_object_alloc(gc, JSON_BOOL);
+    json_o = libxl__json_map_get(PCID_MSG_FIELD_SBDF, request, JSON_STRING);
+    if (!json_o) {
+        make_error_reply(gc, gen, "No mandatory parameter 'sbdf'", command_name);
+        return ERROR_FAIL;
+    }
+
+    if (sscanf(libxl__json_object_get_string(json_o), PCID_SBDF_FMT,
+               &dom, &bus, &dev, &func) != 4) {
+        make_error_reply(gc, gen, "Can't parse SBDF", command_name);
+        return ERROR_FAIL;
+    }
+    rc = pciback_dev_is_assigned(gc, dom, bus, dev, func);
+    if (rc < 0)
+        return ERROR_FAIL;
+    (*response)->u.b = rc;
+    return 0;
+}
+
+static int device_pci_reset(libxl__gc *gc, unsigned int domain, unsigned int bus,
+                                   unsigned int dev, unsigned int func)
+{
+    char *reset;
+    int fd, rc;
+
+    reset = GCSPRINTF("%s/do_flr", SYSFS_PCIBACK_DRIVER);
+    fd = open(reset, O_WRONLY);
+    if (fd >= 0) {
+        char *buf = GCSPRINTF(PCI_BDF, domain, bus, dev, func);
+        rc = write(fd, buf, strlen(buf));
+        if (rc < 0)
+            LOGD(ERROR, domain, "write to %s returned %d", reset, rc);
+        close(fd);
+        return rc < 0 ? rc : 0;
+    }
+    if (errno != ENOENT)
+        LOGED(ERROR, domain, "Failed to access pciback path %s", reset);
+    reset = GCSPRINTF("%s/"PCI_BDF"/reset", SYSFS_PCI_DEV, domain, bus, dev, func);
+    fd = open(reset, O_WRONLY);
+    if (fd >= 0) {
+        rc = write(fd, "1", 1);
+        if (rc < 0)
+            LOGED(ERROR, domain, "write to %s returned %d", reset, rc);
+        close(fd);
+        return rc < 0 ? rc : 0;
+    }
+    if (errno == ENOENT) {
+        LOGD(ERROR, domain,
+             "The kernel doesn't support reset from sysfs for PCI device "PCI_BDF,
+             domain, bus, dev, func);
+    } else {
+        LOGED(ERROR, domain, "Failed to access reset path %s", reset);
+    }
+    return -1;
+}
+
+static int process_device_pci_reset(libxl__gc *gc, yajl_gen gen,
+                                   char *command_name,
+                                   const struct libxl__json_object *request,
+                                   struct libxl__json_object **response)
+{
+    const struct libxl__json_object *json_o;
+    unsigned int dom, bus, dev, func;
+    int rc;
+
+    json_o = libxl__json_map_get(PCID_MSG_FIELD_SBDF, request, JSON_STRING);
+    if (!json_o) {
+        make_error_reply(gc, gen, "No mandatory parameter 'sbdf'", command_name);
+        return ERROR_FAIL;
+    }
+
+    if (sscanf(libxl__json_object_get_string(json_o), PCID_SBDF_FMT,
+               &dom, &bus, &dev, &func) != 4) {
+        make_error_reply(gc, gen, "Can't parse SBDF", command_name);
+        return ERROR_FAIL;
+    }
+    rc = device_pci_reset(gc, dom, bus, dev, func);
+    if (rc < 0)
+        return ERROR_FAIL;
+    return rc;
+}
+
+static int process_make_assignable(libxl__gc *gc, yajl_gen gen,
+                                   char *command_name,
+                                   const struct libxl__json_object *request,
+                                   struct libxl__json_object **response)
+{
+    struct stat st;
+    const struct libxl__json_object *json_o;
+    unsigned int dom, bus, dev, func;
+    int rc;
+    bool rebind;
+    char *spath, *driver_path = NULL;
+
+    json_o = libxl__json_map_get(PCID_MSG_FIELD_SBDF, request, JSON_STRING);
+    if (!json_o) {
+        make_error_reply(gc, gen, "No mandatory parameter 'sbdf'", command_name);
+        return ERROR_FAIL;
+    }
+
+    if (sscanf(libxl__json_object_get_string(json_o), PCID_SBDF_FMT,
+	       &dom, &bus, &dev, &func) != 4) {
+        make_error_reply(gc, gen, "Can't parse SBDF", command_name);
+        return ERROR_FAIL;
+    }
+
+    json_o = libxl__json_map_get(PCID_MSG_FIELD_REBIND, request, JSON_BOOL);
+    if (!json_o) {
+        make_error_reply(gc, gen, "No mandatory parameter 'rebind'", command_name);
+        return ERROR_FAIL;
+    }
+
+    rebind = libxl__json_object_get_bool(json_o);
+
+    /* See if the device exists */
+    spath = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF, dom, bus, dev, func);
+    if ( lstat(spath, &st) ) {
+        make_error_reply(gc, gen, strerror(errno), command_name);
+        LOGE(ERROR, "Couldn't lstat %s", spath);
+        return ERROR_FAIL;
+    }
+
+    /* Check to see if it's already assigned to pciback */
+    rc = pciback_dev_is_assigned(gc, dom, bus, dev, func);
+    if (rc < 0) {
+        make_error_reply(gc, gen, "Can't check if device is assigned",
+			 command_name);
+        return ERROR_FAIL;
+    }
+    if (rc) {
+        LOG(WARN, PCI_BDF" already assigned to pciback", dom, bus, dev, func);
+        goto done;
+    }
+
+    /* Check to see if there's already a driver that we need to unbind from */
+    if (sysfs_dev_unbind(gc, dom, bus, dev, func, &driver_path)) {
+        LOG(ERROR, "Couldn't unbind "PCI_BDF" from driver",
+            dom, bus, dev, func);
+        return ERROR_FAIL;
+    }
+
+    /* Store driver_path for rebinding back */
+    if (rebind) {
+        if (driver_path) {
+            pcid_info_xs_write(gc, dom, bus, dev, func, "driver_path",
+			       driver_path);
+        } else if ( (driver_path =
+                     pcid_info_xs_read(gc, dom, bus, dev, func,
+				       "driver_path")) != NULL ) {
+            LOG(INFO, PCI_BDF" not bound to a driver, will be rebound to %s",
+                dom, bus, dev, func, driver_path);
+        } else {
+            LOG(WARN, PCI_BDF" not bound to a driver, will not be rebound.",
+                dom, bus, dev, func);
+        }
+    } else {
+        pcid_info_xs_remove(gc, dom, bus, dev, func, "driver_path");
+    }
+
+    if (pciback_dev_assign(gc, dom, bus, dev, func)) {
+        LOG(ERROR, "Couldn't bind device to pciback!");
+        return ERROR_FAIL;
+    }
+
+done:
+    return 0;
+}
+
+static int pciback_dev_unassign(libxl__gc *gc, unsigned int domain,
+			      unsigned int bus, unsigned int dev,
+			      unsigned int func)
+{
+    /* Remove from pciback */
+    if ( sysfs_dev_unbind(gc, domain, bus, dev, func, NULL) < 0 ) {
+        LOG(ERROR, "Couldn't unbind device!");
+        return ERROR_FAIL;
+    }
+
+    /* Remove slot if necessary */
+    if ( pciback_dev_has_slot(gc, domain, bus, dev, func) > 0 ) {
+        if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/remove_slot",
+                             domain, bus, dev, func) < 0 ) {
+            LOGE(ERROR, "Couldn't remove pciback slot");
+            return ERROR_FAIL;
+        }
+    }
+    return 0;
+}
+
+static int process_revert_assignable(libxl__gc *gc, yajl_gen gen,
+                                   char *command_name,
+                                   const struct libxl__json_object *request,
+                                   struct libxl__json_object **response)
+{
+    const struct libxl__json_object *json_o;
+    unsigned int dom, bus, dev, func;
+    int rc;
+    bool rebind;
+    char *driver_path = NULL;
+
+    json_o = libxl__json_map_get(PCID_MSG_FIELD_SBDF, request, JSON_STRING);
+    if (!json_o) {
+        make_error_reply(gc, gen, "No mandatory parameter 'sbdf'", command_name);
+        return ERROR_FAIL;
+    }
+
+    if (sscanf(libxl__json_object_get_string(json_o), PCID_SBDF_FMT,
+	       &dom, &bus, &dev, &func) != 4) {
+        make_error_reply(gc, gen, "Can't parse SBDF", command_name);
+        return ERROR_FAIL;
+    }
+
+    json_o = libxl__json_map_get(PCID_MSG_FIELD_REBIND, request, JSON_BOOL);
+    if (!json_o) {
+        make_error_reply(gc, gen, "No mandatory parameter 'rebind'", command_name);
+        return ERROR_FAIL;
+    }
+
+    rebind = libxl__json_object_get_bool(json_o);
+
+    /* Unbind from pciback */
+    if ( (rc = pciback_dev_is_assigned(gc, dom, bus, dev, func)) < 0 ) {
+        make_error_reply(gc, gen, "Can't unbind from pciback", command_name);
+        return ERROR_FAIL;
+    } else if ( rc ) {
+        pciback_dev_unassign(gc, dom, bus, dev, func);
+    } else {
+        LOG(WARN, "Not bound to pciback");
+    }
+
+    /* Rebind if necessary */
+    driver_path = pcid_info_xs_read(gc, dom, bus, dev, func, "driver_path");
+
+    if ( driver_path ) {
+        if ( rebind ) {
+            LOG(INFO, "Rebinding to driver at %s", driver_path);
+
+            if ( sysfs_write_bdf(gc,
+                                 GCSPRINTF("%s/bind", driver_path),
+                                 dom, bus, dev, func) < 0 ) {
+                LOGE(ERROR, "Couldn't bind device to %s", driver_path);
+                return -1;
+            }
+
+            pcid_info_xs_remove(gc, dom, bus, dev, func, "driver_path");
+        }
+    } else {
+        if ( rebind ) {
+            LOG(WARN,
+                "Couldn't find path for original driver; not rebinding");
+        }
+    }
+
+    return 0;
+}
+
+static int pcid_handle_request(libxl__gc *gc, yajl_gen gen,
+                               const libxl__json_object *request)
+{
+    const libxl__json_object *command_obj;
+    libxl__json_object *command_response = NULL;
+    char *command_name;
+    int ret = 0;
+
+    yajl_gen_map_open(gen);
+
+    command_obj = libxl__json_map_get(PCID_MSG_FIELD_CMD, request, JSON_STRING);
+    if (!command_obj) {
+        /* This is an unsupported or bad request. */
+        ret = make_error_reply(gc, gen, "Unsupported request or bad packet",
+                               PCID_MSG_ERR_NA);
+        goto out;
+    }
+
+    command_name = command_obj->u.string;
+
+    if (strcmp(command_name, PCID_CMD_LIST_ASSIGNABLE) == 0)
+       ret = process_list_assignable(gc, gen, command_name,
+                                     request, &command_response);
+    else if (strcmp(command_name, PCID_CMD_MAKE_ASSIGNABLE) == 0)
+       ret = process_make_assignable(gc, gen, command_name,
+                                     request, &command_response);
+    else if (strcmp(command_name, PCID_CMD_REVERT_ASSIGNABLE) == 0)
+       ret = process_revert_assignable(gc, gen, command_name,
+                                     request, &command_response);
+    else if (strcmp(command_name, PCID_CMD_IS_ASSIGNED) == 0)
+       ret = process_pciback_dev_is_assigned(gc, gen, command_name,
+                                     request, &command_response);
+    else if (strcmp(command_name, PCID_CMD_RESET_DEVICE) == 0)
+       ret = process_device_pci_reset(gc, gen, command_name,
+                                     request, &command_response);
+    else if (strcmp(command_name, PCID_CMD_RESOURCE_LIST) == 0)
+       ret = process_list_resources(gc, gen, command_name,
+                                     request, &command_response);
+    else if (strcmp(command_name, PCID_CMD_WRITE_BDF) == 0)
+       ret = process_pciback_write_bdf(gc, gen, command_name,
+                                     request, &command_response);
+    else {
+        /*
+         * This is an unsupported command: make a reply and proceed over
+         * the error path.
+         */
+        ret = make_error_reply(gc, gen, "Unsupported command",
+                               command_name);
+        if (!ret)
+            ret = ERROR_NOTFOUND;
+    }
+
+    if (ret) {
+        /*
+         * The command handler on error must provide a valid response,
+         * so we don't need to add any other field below.
+         */
+        ret = 0;
+        goto out;
+    }
+
+    if (command_response) {
+	ret = libxl__json_object_to_yajl_gen(gc, gen, command_response);
+	if (ret)
+	    goto out;
+    }
+
+    ret = libxl__vchan_field_add_string(gc, gen, PCID_MSG_FIELD_RESP,
+                                        command_name);
+    if (ret)
+        goto out;
+
+    ret = libxl__vchan_field_add_string(gc, gen, PCID_MSG_FIELD_ERR,
+                                        PCID_MSG_ERR_OK);
+out:
+    yajl_gen_map_close(gen);
+
+    vchan_dump_gen(gc, gen);
+
+    return ret;
+}
+
+static char *pcid_prepare_response(libxl__gc *gc, yajl_gen gen)
+{
+    const unsigned char *buf;
+    libxl_yajl_length len;
+    yajl_gen_status sts;
+    char *reply = NULL;
+
+    sts = yajl_gen_get_buf(gen, &buf, &len);
+    if (sts != yajl_gen_status_ok)
+        goto out;
+
+    reply = libxl__sprintf(gc, "%s", buf);
+
+    vchan_dump_gen(gc, gen);
+
+out:
+    return reply;
+}
+
+static void server_fini_one(libxl__gc *gc, struct vchan_client *client)
+{
+    pthread_mutex_lock(&vchan_client_mutex);
+    XEN_LIST_REMOVE(client, list);
+    pthread_mutex_unlock(&vchan_client_mutex);
+
+    GC_FREE;
+    free(client);
+}
+
+static void *client_thread(void *arg)
+{
+    struct vchan_client *client = arg;
+
+    while (true) {
+        int ret;
+        /*
+         * libvchan uses garbage collector for processing requests,
+         * so we create a new one each time we process a packet and
+         * dispose it right away to prevent OOM.
+         */
+        GC_INIT(client->ctx);
+        ret = vchan_process_command(gc, &client->info);
+        GC_FREE;
+
+        if ((ret == ERROR_NOTFOUND) || (ret == ERROR_INVAL))
+            continue;
+        if (ret < 0)
+            break;
+    }
+    vchan_fini_one(client->gc, client->info.state);
+    server_fini_one(client->gc, client);
+    return NULL;
+}
+
+#define DEFAULT_THREAD_STACKSIZE (24 * 1024)
+/* NetBSD doesn't have PTHREAD_STACK_MIN. */
+#ifndef PTHREAD_STACK_MIN
+#define PTHREAD_STACK_MIN 0
+#endif
+
+#define READ_THREAD_STACKSIZE                           \
+    ((DEFAULT_THREAD_STACKSIZE < PTHREAD_STACK_MIN) ?   \
+    PTHREAD_STACK_MIN : DEFAULT_THREAD_STACKSIZE)
+
+static bool init_client_thread(libxl__gc *gc, struct vchan_client *new_client)
+{
+
+    sigset_t set, old_set;
+    pthread_attr_t attr;
+    static size_t stack_size;
+#ifdef USE_DLSYM
+    size_t (*getsz)(pthread_attr_t *attr);
+#endif
+
+    if (pthread_attr_init(&attr) != 0)
+        return false;
+    if (!stack_size) {
+#ifdef USE_DLSYM
+        getsz = dlsym(RTLD_DEFAULT, "__pthread_get_minstack");
+        if (getsz)
+            stack_size = getsz(&attr);
+#endif
+        if (stack_size < READ_THREAD_STACKSIZE)
+            stack_size = READ_THREAD_STACKSIZE;
+    }
+    if (pthread_attr_setstacksize(&attr, stack_size) != 0) {
+        pthread_attr_destroy(&attr);
+        return false;
+    }
+
+    sigfillset(&set);
+    pthread_sigmask(SIG_SETMASK, &set, &old_set);
+
+    if (pthread_create(&new_client->run_thread, &attr, client_thread,
+                       new_client) != 0) {
+        pthread_sigmask(SIG_SETMASK, &old_set, NULL);
+        pthread_attr_destroy(&attr);
+        return false;
+    }
+    pthread_sigmask(SIG_SETMASK, &old_set, NULL);
+    pthread_attr_destroy(&attr);
+
+    return true;
+}
+
+static void init_new_client(libxl_ctx *ctx, libxl__gc *gc,
+                            struct clients_list *list, char **watch_ret)
+{
+    struct vchan_client *new_client;
+    char *xs_path = watch_ret[XS_WATCH_PATH];
+
+    LOG(DEBUG, "New client at \"%s\"", xs_path);
+
+    new_client = malloc(sizeof(*new_client));
+    if (!new_client) {
+        LOGE(ERROR, "Failed to allocate new client at \"%s\"", xs_path);
+        return;
+    }
+
+    memset(new_client, 0, sizeof(*new_client));
+
+    new_client->watch_ret = watch_ret;
+    new_client->watch_len = strlen(xs_path);
+    new_client->ctx = ctx;
+    /*
+     * Remember the GC of this client, so we can dispose its memory.
+     * Use it from now on.
+     */
+    LIBXL_INIT_GC(new_client->gc[0], ctx);
+
+    new_client->info.state = vchan_init_new_state(new_client->gc, DOM0_ID,
+                                                  xs_path, true);
+    if (!(new_client->info.state)) {
+        LOGE(ERROR, "Failed to add new client at \"%s\"", xs_path);
+        server_fini_one(new_client->gc, new_client);
+        return;
+    }
+
+    new_client->info.handle_request = pcid_handle_request;
+    new_client->info.prepare_response = pcid_prepare_response;
+    new_client->info.receive_buf_size = PCI_RECEIVE_BUFFER_SIZE;
+    new_client->info.max_buf_size = PCI_MAX_SIZE_RX_BUF;
+
+    if (!init_client_thread(new_client->gc, new_client)) {
+        LOGE(ERROR, "Failed to create client's thread for \"%s\"", xs_path);
+        server_fini_one(new_client->gc, new_client);
+        return;
+    }
+
+    pthread_mutex_lock(&vchan_client_mutex);
+    XEN_LIST_INSERT_HEAD(&vchan_clients, new_client, list);
+    pthread_mutex_unlock(&vchan_client_mutex);
+}
+
+static void terminate_clients(void)
+{
+    struct vchan_client *client;
+
+    pthread_mutex_lock(&vchan_client_mutex);
+    XEN_LIST_FOREACH(client, &vchan_clients, list) {
+        pthread_join(client->run_thread, NULL);
+    }
+    pthread_mutex_unlock(&vchan_client_mutex);
+}
+
+int libxl_pcid_process(libxl_ctx *ctx)
+{
+    GC_INIT(ctx);
+    char *xs_path, *str;
+    char **watch_ret;
+    unsigned int watch_num;
+    libxl_domid domid;
+    int ret;
+
+    pthread_mutex_init(&vchan_client_mutex, NULL);
+
+    str = xs_read(ctx->xsh, 0, "domid", NULL);
+    if (!str) {
+        LOGE(ERROR, "Can't read own domid\n");
+        ret = -ENOENT;
+        goto out;
+    }
+
+    ret = sscanf(str, "%d", &domid);
+    free(str);
+    if (ret != 1)
+    {
+        LOGE(ERROR, "Own domid is not an integer\n");
+        ret = -EINVAL;
+        goto out;
+    }
+
+    xs_path = vchan_get_server_xs_path(gc, domid, PCID_SRV_NAME);
+
+    /* Recreate the base folder: remove all leftovers. */
+    ret = libxl__xs_rm_checked(gc, XBT_NULL, xs_path);
+    if (ret)
+        goto out;
+
+    if (!xs_mkdir(CTX->xsh, XBT_NULL, xs_path))
+    {
+        LOGE(ERROR, "xenstore mkdir failed: `%s'", xs_path);
+        ret = ERROR_FAIL;
+        goto out;
+    }
+
+    /* Wait for vchan client to create a new UUID under the server's folder. */
+    if (!xs_watch(CTX->xsh, xs_path, PCID_XS_TOKEN)) {
+        LOGE(ERROR, "xs_watch (%s) failed", xs_path);
+        ret = ERROR_FAIL;
+        goto out;
+    }
+
+    while ((watch_ret = xs_read_watch(CTX->xsh, &watch_num))) {
+        struct vchan_client *client;
+        size_t len;
+        bool found;
+
+        /*
+         * Any change under the base directory will fire an event, so we need
+         * to filter if this is indeed a new client or it is because vchan
+         * server creates nodes under its UUID.
+         *
+         * Never try to instantiate a vchan server right under xs_path.
+         */
+        if (!strcmp(watch_ret[XS_WATCH_PATH], xs_path))
+            continue;
+
+        found = false;
+        len = strlen(watch_ret[XS_WATCH_PATH]);
+
+        pthread_mutex_lock(&vchan_client_mutex);
+        XEN_LIST_FOREACH(client, &vchan_clients, list) {
+            str = client->watch_ret[XS_WATCH_PATH];
+
+            if (strstr(watch_ret[XS_WATCH_PATH], str)) {
+                /*
+                 * Base path is a substring of the current path, so it can be:
+                 *  - a new node with different name, but starting with str
+                 *  - a subnode under str, so it will have '/' after str
+                 *  - same string
+                 */
+                if (len == client->watch_len) {
+                    found = true;
+                    break;
+                }
+                if (len > client->watch_len) {
+                    if (watch_ret[XS_WATCH_PATH][client->watch_len] == '/') {
+                        found = true;
+                        break;
+                    }
+                }
+            }
+        }
+        pthread_mutex_unlock(&vchan_client_mutex);
+
+        if (!found)
+            init_new_client(ctx, gc, &vchan_clients, watch_ret);
+    }
+
+    xs_unwatch(CTX->xsh, xs_path, PCID_XS_TOKEN);
+
+out:
+    terminate_clients();
+    GC_FREE;
+    pthread_mutex_destroy(&vchan_client_mutex);
+    return ret;
+}
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index f387d7b8b2..458acc0748 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -802,6 +802,8 @@ libxl_device_pci = Struct("device_pci", [
     ("seize", bool),
     ("rdm_policy", libxl_rdm_reserve_policy),
     ("name", string),
+    ("backend", string),
+    ("backend_domid", libxl_domid),
     ])
 
 libxl_device_rdm = Struct("device_rdm", [
diff --git a/tools/libs/light/libxl_vchan.c b/tools/libs/light/libxl_vchan.c
index c87024f00f..512b6b6641 100644
--- a/tools/libs/light/libxl_vchan.c
+++ b/tools/libs/light/libxl_vchan.c
@@ -99,6 +99,14 @@ void libxl__vchan_arg_add_bool(libxl__gc *gc, libxl__json_object *args,
     obj->u.b = val;
 }
 
+void libxl__vchan_arg_add_integer(libxl__gc *gc, libxl__json_object *args,
+                                 char *key,  int val)
+{
+    libxl__json_object *obj = libxl__vchan_arg_new(gc, JSON_INTEGER, args, key);
+
+    obj->u.i = val;
+}
+
 static void reset_yajl_generator(struct vchan_state *state)
 {
     yajl_gen_clear(state->gen);
@@ -297,34 +305,41 @@ int vchan_process_command(libxl__gc *gc, struct vchan_info *vchan)
     return vchan_write(gc, vchan->state, VCHAN_EOM);
 }
 
-static libxl_domid vchan_find_server(libxl__gc *gc, char *xs_dir, char *xs_file)
+static libxl_domid vchan_find_server(libxl__gc *gc, char *xs_dir, char *xs_file, libxl_domid backend_domid)
 {
-    char **domains;
-    unsigned int i, n;
-    libxl_domid domid = DOMID_INVALID;
+    const char *tmp;
 
-    domains = libxl__xs_directory(gc, XBT_NULL, xs_dir, &n);
-    if (!n)
-        goto out;
+    if (backend_domid == DOMID_INVALID) {
+        char **domains;
+        unsigned int i, n;
 
-    for (i = 0; i < n; i++) {
-        const char *tmp;
-        int d;
+        domains = libxl__xs_directory(gc, XBT_NULL, xs_dir, &n);
+        if (!n)
+            goto out;
 
-        if (sscanf(domains[i], "%d", &d) != 1)
-            continue;
+        for (i = 0; i < n; i++) {
+            int d;
 
-        tmp = libxl__xs_read(gc, XBT_NULL,
-                             GCSPRINTF("%s/%d/data/%s", xs_dir, d, xs_file));
-        /* Found the domain where the server lives. */
-        if (tmp) {
-            domid = d;
-            break;
+            if (sscanf(domains[i], "%d", &d) != 1)
+                continue;
+
+            tmp = libxl__xs_read(gc, XBT_NULL,
+                    GCSPRINTF("%s/%d/data/%s", xs_dir, d, xs_file));
+            /* Found the domain where the server lives. */
+            if (tmp) {
+                backend_domid = d;
+                break;
+            }
         }
+    } else {
+        tmp = libxl__xs_read(gc, XBT_NULL,
+                    GCSPRINTF("%s/%d/data/%s", xs_dir, backend_domid, xs_file));
+        if (!tmp)
+            backend_domid = DOMID_INVALID;
     }
 
 out:
-    return domid;
+    return backend_domid;
 }
 
 static int vchan_init_client(libxl__gc *gc, struct vchan_state *state,
@@ -440,20 +455,19 @@ static int vchan_wait_server_available(libxl__gc *gc, const char *xs_path)
     return ERROR_TIMEDOUT;
 }
 
-struct vchan_state *vchan_new_client(libxl__gc *gc, char *srv_name)
+struct vchan_state *vchan_new_client(libxl__gc *gc, char *srv_name, libxl_domid backend_domid)
 {
-    libxl_domid domid;
     char *xs_path, *vchan_xs_path;
     libxl_uuid uuid;
     libxl_ctx *ctx = libxl__gc_owner(gc);
 
-    domid = vchan_find_server(gc, VCHAN_SRV_DIR, srv_name);
-    if (domid == DOMID_INVALID) {
+    backend_domid = vchan_find_server(gc, VCHAN_SRV_DIR, srv_name, backend_domid);
+    if (backend_domid == DOMID_INVALID) {
         LOGE(ERROR, "Can't find vchan server");
         return NULL;
     }
 
-    xs_path = vchan_get_server_xs_path(gc, domid, srv_name);
+    xs_path = vchan_get_server_xs_path(gc, backend_domid, srv_name);
     LOG(DEBUG, "vchan server at %s\n", xs_path);
 
     /* Generate unique client id. */
@@ -473,7 +487,7 @@ struct vchan_state *vchan_new_client(libxl__gc *gc, char *srv_name)
         return NULL;
     }
 
-    return vchan_init_new_state(gc, domid, vchan_xs_path, false);
+    return vchan_init_new_state(gc, backend_domid, vchan_xs_path, false);
 }
 
 void vchan_fini_one(libxl__gc *gc, struct vchan_state *state)
diff --git a/tools/libs/light/libxl_vchan.h b/tools/libs/light/libxl_vchan.h
index 0968875298..e16db7a6ed 100644
--- a/tools/libs/light/libxl_vchan.h
+++ b/tools/libs/light/libxl_vchan.h
@@ -45,6 +45,7 @@ struct vchan_info {
     /* Buffer info. */
     size_t receive_buf_size;
     size_t max_buf_size;
+    bool initialized;
 };
 
 int libxl__vchan_field_add_string(libxl__gc *gc, yajl_gen hand,
@@ -58,7 +59,9 @@ static inline libxl__json_object *libxl__vchan_start_args(libxl__gc *gc)
 void libxl__vchan_arg_add_string(libxl__gc *gc, libxl__json_object *args,
                                  char *key, char *val);
 void libxl__vchan_arg_add_bool(libxl__gc *gc, libxl__json_object *args,
-                               char *key, bool val);
+                                 char *key, bool val);
+void libxl__vchan_arg_add_integer(libxl__gc *gc, libxl__json_object *args,
+                                 char *key,  int val);
 
 libxl__json_object *vchan_send_command(libxl__gc *gc, struct vchan_info *vchan,
                                        char *cmd, libxl__json_object *args);
@@ -72,7 +75,7 @@ char *vchan_get_server_xs_path(libxl__gc *gc, libxl_domid domid, char *srv_name)
 struct vchan_state *vchan_init_new_state(libxl__gc *gc, libxl_domid domid,
                                          char *vchan_xs_path, bool is_server);
 
-struct vchan_state *vchan_new_client(libxl__gc *gc, char *srv_name);
+struct vchan_state *vchan_new_client(libxl__gc *gc, char *srv_name, libxl_domid domid);
 
 void vchan_fini_one(libxl__gc *gc, struct vchan_state *state);
 
diff --git a/tools/libs/util/libxlu_pci.c b/tools/libs/util/libxlu_pci.c
index 551d8e3aed..7e2e8c6a6f 100644
--- a/tools/libs/util/libxlu_pci.c
+++ b/tools/libs/util/libxlu_pci.c
@@ -1,6 +1,8 @@
 #define _GNU_SOURCE
 
 #include <ctype.h>
+#include <stdint.h>
+#include <xen/xen.h>
 
 #include "libxlu_internal.h"
 #include "libxlu_disk_l.h"
@@ -195,8 +197,10 @@ int xlu_pci_parse_spec_string(XLU_Config *cfg, libxl_device_pci *pci,
             name_present = true;
             pci->name = strdup(val);
             if (!pci->name) ret = ERROR_NOMEM;
+        } else if (!strcmp(key, "backend")) {
+            pci->backend = strdup(val);
         } else {
-            XLU__PCI_ERR(cfg, "Unknown PCI_SPEC_STRING option: %s", key);
+            XLU__PCI_ERR(cfg, "Unknown PCI_SPEC_STRING option: '%s'\n", key);
             ret = ERROR_INVAL;
         }
 
diff --git a/tools/xl/Makefile b/tools/xl/Makefile
index 5dfff7fc6f..0dbbbde17f 100644
--- a/tools/xl/Makefile
+++ b/tools/xl/Makefile
@@ -22,7 +22,7 @@ XL_OBJS = xl.o xl_cmdtable.o xl_sxp.o xl_utils.o $(XL_OBJS-y)
 XL_OBJS += xl_parse.o xl_cpupool.o xl_flask.o
 XL_OBJS += xl_vtpm.o xl_block.o xl_nic.o xl_usb.o
 XL_OBJS += xl_sched.o xl_pci.o xl_vcpu.o xl_cdrom.o xl_mem.o
-XL_OBJS += xl_info.o xl_console.o xl_misc.o
+XL_OBJS += xl_info.o xl_console.o xl_misc.o xl_pcid.o
 XL_OBJS += xl_vmcontrol.o xl_saverestore.o xl_migrate.o
 XL_OBJS += xl_vdispl.o xl_vsnd.o xl_vkb.o
 
@@ -34,7 +34,7 @@ $(XL_OBJS): CFLAGS += -include $(XEN_ROOT)/tools/config.h # libxl_json.h needs i
 all: xl
 
 xl: $(XL_OBJS)
-	$(CC) $(LDFLAGS) -o $@ $(XL_OBJS) $(LDLIBS_libxenutil) $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxenvchan) -lyajl $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ $(XL_OBJS) $(LDLIBS_libxenstore) $(LDLIBS_libxenutil) $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxenvchan) -lyajl $(APPEND_LDFLAGS)
 
 .PHONY: install
 install: all
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index c5c4bedbdd..1419a8c1e4 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -202,6 +202,7 @@ int main_loadpolicy(int argc, char **argv);
 int main_remus(int argc, char **argv);
 #endif
 int main_devd(int argc, char **argv);
+int main_pcid(int argc, char **argv);
 #if defined(__i386__) || defined(__x86_64__)
 int main_psr_hwinfo(int argc, char **argv);
 int main_psr_cmt_attach(int argc, char **argv);
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 661323d488..5fbbe25a43 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -545,6 +545,13 @@ const struct cmd_spec cmd_table[] = {
       "-F                      Run in the foreground.\n"
       "-p, --pidfile [FILE]    Write PID to pidfile when daemonizing.",
     },
+    { "pcid",
+      &main_pcid, 0, 1,
+      "Daemon that acts as a server for the client in the libxl PCI",
+      "[options]",
+      "-f                      Run in the foreground.\n"
+      "-p, --pidfile [FILE]    Write PID to pidfile when daemonizing.",
+    },
 #if defined(__i386__) || defined(__x86_64__)
     { "psr-hwinfo",
       &main_psr_hwinfo, 0, 1,
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index c8d2b794e5..5052ad9fe4 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1491,6 +1491,7 @@ void parse_config_data(const char *config_source,
             pci->power_mgmt = pci_power_mgmt;
             pci->permissive = pci_permissive;
             pci->seize = pci_seize;
+            pci->backend = NULL;
             /*
              * Like other pci option, the per-device policy always follows
              * the global policy by default.
diff --git a/tools/xl/xl_pci.c b/tools/xl/xl_pci.c
index b1c3ae2a72..a1c0bc1e17 100644
--- a/tools/xl/xl_pci.c
+++ b/tools/xl/xl_pci.c
@@ -13,7 +13,9 @@
  */
 
 #include <stdlib.h>
+#include <stdint.h>
 
+#include <xen/xen.h>
 #include <libxl.h>
 #include <libxl_utils.h>
 #include <libxlutil.h>
@@ -156,7 +158,7 @@ static void pciassignable_list(bool show_names)
     libxl_device_pci *pcis;
     int num, i;
 
-    pcis = libxl_device_pci_assignable_list(ctx, &num);
+    pcis = libxl_device_pci_assignable_list(ctx, &num, DOMID_INVALID);
 
     if ( pcis == NULL )
         return;
diff --git a/tools/xl/xl_pcid.c b/tools/xl/xl_pcid.c
new file mode 100644
index 0000000000..a5d38e672f
--- /dev/null
+++ b/tools/xl/xl_pcid.c
@@ -0,0 +1,81 @@
+/*
+    Pcid daemon that acts as a server for the client in the libxl PCI
+
+    Copyright (C) 2021 EPAM Systems Inc.
+
+    This library is free software; you can redistribute it and/or
+    modify it under the terms of the GNU Lesser General Public
+    License as published by the Free Software Foundation; either
+    version 2.1 of the License, or (at your option) any later version.
+
+    This library is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+    Lesser General Public License for more details.
+
+    You should have received a copy of the GNU Lesser General Public
+    License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#define _GNU_SOURCE  // required for strchrnul()
+
+#include <libxl_utils.h>
+#include <libxlutil.h>
+
+#include "xl.h"
+#include "xl_utils.h"
+#include "xl_parse.h"
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <errno.h>
+
+#include <pcid.h>
+#include <xenstore.h>
+
+/*
+ * TODO: Running this code in multi-threaded environment
+ * Now the code is designed so that only one request to the server
+ * from the client is made in one domain. In the future, it is necessary
+ * to take into account cases when from different domains there can be
+ * several requests from a client at the same time. Therefore, it will be
+ * necessary to regulate the multithreading of processes for global variables.
+ */
+
+int main_pcid(int argc, char *argv[])
+{
+    int opt = 0, daemonize = 1, ret;
+    const char *pidfile = NULL;
+    static const struct option opts[] = {
+        {"pidfile", 1, 0, 'p'},
+        COMMON_LONG_OPTS,
+        {0, 0, 0, 0}
+    };
+
+    SWITCH_FOREACH_OPT(opt, "fp:", opts, "pcid", 0) {
+    case 'f':
+        daemonize = 0;
+        break;
+    case 'p':
+        pidfile = optarg;
+        break;
+    }
+
+    if (daemonize) {
+        ret = do_daemonize("xlpcid", pidfile);
+        if (ret) {
+            ret = (ret == 1) ? 0 : ret;
+            goto out_daemon;
+        }
+    }
+
+    libxl_pcid_process(ctx);
+
+    ret = 0;
+
+out_daemon:
+    exit(ret);
+}
-- 
2.25.1


