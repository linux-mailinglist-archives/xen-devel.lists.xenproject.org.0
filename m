Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF87B09598
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 22:17:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047445.1417948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucV2h-0004uc-8K; Thu, 17 Jul 2025 20:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047445.1417948; Thu, 17 Jul 2025 20:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucV2h-0004ss-5T; Thu, 17 Jul 2025 20:17:23 +0000
Received: by outflank-mailman (input) for mailman id 1047445;
 Thu, 17 Jul 2025 20:17:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vtfz=Z6=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ucV2g-0004Ls-06
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 20:17:22 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0acb77df-634b-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 22:17:20 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-558f7fda97eso1047891e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 13:17:20 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b611bfsm3148469e87.148.2025.07.17.13.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 13:17:18 -0700 (PDT)
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
X-Inumbo-ID: 0acb77df-634b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752783439; x=1753388239; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h9lKL8I4TsH8etyq06gY7k6ViMS9Gsm30CrYu4SefRk=;
        b=AGeoRumES8mK+e/lgcrH6YOyD6MYslY97scBwMjwYwVS3fDievfUdDD7/vV92Ew9AZ
         7Xku0Wg7wZ0ZSrM0mteu0JeXinHzyB0qhJPe4Bdtso6Ys+eSdm/FBdh6iAdjByIM+hIf
         mj+ikGfn4D/bB87dmBN4FdDHVrD/F6LZJjhqgRs6/rIBbQq5yPlzXkafOxIuzuEOPxsd
         WQI3i1Ofm6tuBEnfNzkUxOUmciYLPz8ZMlzKjiWo7Or1aLjgdPPn51MC/fHyOM9+LInU
         59MBwLzoc+cRuvzP/6mUafqMMQsdVjLpv5Tulzlba2rYpU3RdJ2EGcuH2WBZNaEiKuSh
         +C0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752783439; x=1753388239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h9lKL8I4TsH8etyq06gY7k6ViMS9Gsm30CrYu4SefRk=;
        b=bSxqfy8QXg5lpj1IuvXDOhBGzotVKoso3NzLFBpZ31QvHsFfxjjB9D3/unbwwcN3yD
         9QyPWfaMWSl5ZPTY9ZF30QaIfQV4SqHIHY3xPop6R7s1ogLAPTxr5ZY4+wmcn1N+JvDF
         YndUjsC3kKaAlN4JO+qNQr7z2kPwgVgj/PsLbAbhFWd8k1vNRsbNMlokcNrQqNpGX35r
         rpwdaGIWmd36tCfwGoKx+6z7v42TFkbvkyGYxPX/Q53Cz4JhQhAJTPxb/4REfMaZbURg
         N/opiEXYHplSkGqmqeJz5ZsIEj7LmsB4UeZCFPyTqtRLIqpBE5dVDZNzf1NVUofM4WMq
         j8/A==
X-Gm-Message-State: AOJu0YzcSEhfR/2PCi7atC+gEPO9i+GTpMYF81qhkU7PwIGIpWIdmd55
	/PQK1te4CB1+x9pAWh7ezHh65UphMOcKJqQOXjEhqdhmLXWiXLCTJ6+PnZZLKg==
X-Gm-Gg: ASbGncu/ILIYLxjK0KC/udMWMLi/TOD+/fP42lUhBXHeDQQfLyyah5oLFmomAaEthQ6
	TbhtTaGgjUjIrwITEGIKzu/llBEMnCDf3iK+TuT/N5J4A1BjkYyOiYeVLcoB9j6CjIL77989B+F
	ZCAt6j+16gz+eouUWosaFMcne+N/Oj5RxXArrLEJyutEgg0126V2Vavmhzq2pMLp9ERYt7kli90
	4Ypl+17D/67jG59BPiOmlxhYK/bCzRZAcZb4obm+y4IEpseHIWmElJ+SUlNaFK+JMhF1p/8z8zo
	sGTMUdADKUrBlca+o02+1ae0wnEcgj4EiaiYYzf9iqynQwCKdSU8YAdd7ogta4nHn3gvnrPKhKm
	SNv+Gu0EGllarEi9WqD2PgnWExX7rL/zg0Fs9Vwq1InYwHaZJNAgPQ6rKlcnydw==
X-Google-Smtp-Source: AGHT+IF5iNc34jRN2XTbODUNqLxXHsAiIDmMl/Di/OJDV6iAbWlEIg3k/SkRDg4bSkMM0Kw2M/YGTw==
X-Received: by 2002:a05:6512:1246:b0:553:330e:59da with SMTP id 2adb3069b0e04-55a23fb7580mr2346978e87.53.1752783439208;
        Thu, 17 Jul 2025 13:17:19 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2] systemd: Add hooks to stop/start xen-watchdog on suspend/resume
Date: Thu, 17 Jul 2025 23:16:58 +0300
Message-ID: <b44966513abc729f44795c0d5012e1c5fd106477.1752783296.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

This patch adds a systemd sleep hook script to stop the xen-watchdog
service before system suspend and start it again after resume.

Stopping the watchdog before a system suspend operation may look unsafe.
Let's imagine the following situation: 'systemctl suspend' does not
interact with the running service at all. In such a case, the Xen
watchdog daemon freezes just before suspend. If this happens, for
example, right before sending a ping, and Xen has not yet marked the
domain as suspended (is_shutting_down), the Xen watchdog timer may
trigger a false alert.

This is an almost impossible situation, because typically:
    ping time = watchdog timeout / 2

and the watchdog timeout is usually set to a relatively large value
(dozens of seconds).

Still, this is more likely with very short watchdog timeouts. It may
happen in the following scenarios:
    * Significant delays occur between freezing Linux tasks and
      triggering the ACPI or PSCI sleep request or handler.
    * Long delays happen inside Xen between the entrance to the sleep
      trigger and the actual forwarding of the sleep request further.

A similar situation may occur on resume with short timeouts. During the
resume operation, Xen restores timers and the domain context. The Xen
watchdog timer also resumes. If it schedules the domain right before the
watchdog timeout expires, and the daemon responsible for pinging is not
yet running, a timeout might occur.

Both scenarios are rare and typically require very small watchdog
timeouts combined with significant delays in Xen or the Linux kernel
during suspend/resume flows.

Conceptually, however, if activating and pinging the Xen watchdog is the
responsibility of the domain and its services, then the domain should
also manage the watchdog service/daemon lifecycle. This is similar to
what is already done by the Xen watchdog driver inside the Linux kernel.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V2:
- drop logging to separate files
- remove checks for xen-watchdog service existence at start of sleep script
- use XEN_RUN_DIR for saving watchdog service state before sleep
- remove loop when installing sleep script for xen-watchdog service
- introduce new configs XEN_SYSTEMD_SLEEP_DIR, SYSTEMD_SLEEP_DIR, and
  with-systemd-sleep
---
 config/Tools.mk.in                            |  1 +
 m4/systemd.m4                                 | 14 ++++++++
 tools/hotplug/Linux/systemd/Makefile          |  8 ++++-
 .../Linux/systemd/xen-watchdog-sleep.sh       | 34 +++++++++++++++++++
 4 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 tools/hotplug/Linux/systemd/xen-watchdog-sleep.sh

diff --git a/config/Tools.mk.in b/config/Tools.mk.in
index 463ab75965..e47ac23d11 100644
--- a/config/Tools.mk.in
+++ b/config/Tools.mk.in
@@ -53,6 +53,7 @@ CONFIG_LIBFSIMAGE   := @libfsimage@
 CONFIG_SYSTEMD      := @systemd@
 XEN_SYSTEMD_DIR     := @SYSTEMD_DIR@
 XEN_SYSTEMD_MODULES_LOAD := @SYSTEMD_MODULES_LOAD@
+XEN_SYSTEMD_SLEEP_DIR := @SYSTEMD_SLEEP_DIR@
 CONFIG_9PFS         := @ninepfs@
 
 LINUX_BACKEND_MODULES := @LINUX_BACKEND_MODULES@
diff --git a/m4/systemd.m4 b/m4/systemd.m4
index ab12ea313d..ee684d3391 100644
--- a/m4/systemd.m4
+++ b/m4/systemd.m4
@@ -28,6 +28,12 @@ AC_DEFUN([AX_SYSTEMD_OPTIONS], [
 		[set directory for systemd modules load files [PREFIX/lib/modules-load.d/]]),
 		[SYSTEMD_MODULES_LOAD="$withval"], [SYSTEMD_MODULES_LOAD=""])
 	AC_SUBST(SYSTEMD_MODULES_LOAD)
+
+	AC_ARG_WITH(systemd-sleep,
+		AS_HELP_STRING([--with-systemd-sleep=DIR],
+		[set directory for systemd sleep script files [PREFIX/lib/systemd/system-sleep/]]),
+		[SYSTEMD_SLEEP_DIR="$withval"], [SYSTEMD_SLEEP_DIR=""])
+	AC_SUBST(SYSTEMD_SLEEP_DIR)
 ])
 
 AC_DEFUN([AX_ENABLE_SYSTEMD_OPTS], [
@@ -69,6 +75,14 @@ AC_DEFUN([AX_CHECK_SYSTEMD_LIBS], [
 	AS_IF([test "x$SYSTEMD_MODULES_LOAD" = x], [
 	    AC_MSG_ERROR([SYSTEMD_MODULES_LOAD is unset])
 	], [])
+
+	AS_IF([test "x$SYSTEMD_SLEEP_DIR" = x], [
+	    SYSTEMD_SLEEP_DIR="\$(prefix)/lib/systemd/system-sleep/"
+	], [])
+
+	AS_IF([test "x$SYSTEMD_SLEEP_DIR" = x], [
+	    AC_MSG_ERROR([SYSTEMD_SLEEP_DIR is unset])
+	], [])
 ])
 
 AC_DEFUN([AX_CHECK_SYSTEMD], [
diff --git a/tools/hotplug/Linux/systemd/Makefile b/tools/hotplug/Linux/systemd/Makefile
index e29889156d..579ef9d87d 100644
--- a/tools/hotplug/Linux/systemd/Makefile
+++ b/tools/hotplug/Linux/systemd/Makefile
@@ -5,6 +5,8 @@ XEN_SYSTEMD_MODULES := xen.conf
 
 XEN_SYSTEMD_MOUNT := proc-xen.mount
 
+XEN_SYSTEMD_SLEEP_SCRIPT := xen-watchdog-sleep.sh
+
 XEN_SYSTEMD_SERVICE := xenstored.service
 XEN_SYSTEMD_SERVICE += xenconsoled.service
 XEN_SYSTEMD_SERVICE += xen-qemu-dom0-disk-backend.service
@@ -15,7 +17,8 @@ XEN_SYSTEMD_SERVICE += xendriverdomain.service
 
 ALL_XEN_SYSTEMD :=	$(XEN_SYSTEMD_MODULES)  \
 			$(XEN_SYSTEMD_MOUNT)	\
-			$(XEN_SYSTEMD_SERVICE)
+			$(XEN_SYSTEMD_SERVICE)	\
+			$(XEN_SYSTEMD_SLEEP_SCRIPT)
 
 .PHONY: all
 all:	$(ALL_XEN_SYSTEMD)
@@ -31,15 +34,18 @@ distclean: clean
 install: $(ALL_XEN_SYSTEMD)
 	$(INSTALL_DIR) $(DESTDIR)$(XEN_SYSTEMD_DIR)
 	$(INSTALL_DIR) $(DESTDIR)$(XEN_SYSTEMD_MODULES_LOAD)
+	$(INSTALL_DIR) $(DESTDIR)$(XEN_SYSTEMD_SLEEP_DIR)
 	$(INSTALL_DATA) *.service $(DESTDIR)$(XEN_SYSTEMD_DIR)
 	$(INSTALL_DATA) *.mount $(DESTDIR)$(XEN_SYSTEMD_DIR)
 	$(INSTALL_DATA) *.conf $(DESTDIR)$(XEN_SYSTEMD_MODULES_LOAD)
+	$(INSTALL_PROG) $(XEN_SYSTEMD_SLEEP_SCRIPT) $(DESTDIR)$(XEN_SYSTEMD_SLEEP_DIR)
 
 .PHONY: uninstall
 uninstall:
 	rm -f $(DESTDIR)$(XEN_SYSTEMD_MODULES_LOAD)/*.conf
 	rm -f $(DESTDIR)$(XEN_SYSTEMD_DIR)/*.mount
 	rm -f $(DESTDIR)$(XEN_SYSTEMD_DIR)/*.service
+	rm -f $(DESTDIR)$(XEN_SYSTEMD_SLEEP_DIR)/$(XEN_SYSTEMD_SLEEP_SCRIPT)
 
 $(XEN_SYSTEMD_MODULES):
 	rm -f $@.tmp
diff --git a/tools/hotplug/Linux/systemd/xen-watchdog-sleep.sh b/tools/hotplug/Linux/systemd/xen-watchdog-sleep.sh
new file mode 100644
index 0000000000..e9bdadc8fa
--- /dev/null
+++ b/tools/hotplug/Linux/systemd/xen-watchdog-sleep.sh
@@ -0,0 +1,34 @@
+#!/bin/sh
+
+# The first argument ($1) is:
+#     "pre" or "post"
+# The second argument ($2) is:
+#     "suspend", "hibernate", "hybrid-sleep", or "suspend-then-hibernate"
+
+. /etc/xen/scripts/hotplugpath.sh
+
+SERVICE_NAME="xen-watchdog.service"
+STATE_FILE="${XEN_RUN_DIR}/xen-watchdog-sleep-flag"
+
+case "$1" in
+pre)
+    if systemctl is-active --quiet "${SERVICE_NAME}"; then
+        touch "${STATE_FILE}"
+        echo "Stopping ${SERVICE_NAME} before $2."
+        systemctl stop "${SERVICE_NAME}"
+    fi
+    ;;
+post)
+    if [ -f "${STATE_FILE}" ]; then
+        echo "Starting ${SERVICE_NAME} after $2."
+        systemctl start "${SERVICE_NAME}"
+        rm "${STATE_FILE}"
+    fi
+    ;;
+*)
+    echo "Script called with unknown action '$1'. Arguments: '$@'"
+    exit 1
+    ;;
+esac
+
+exit 0
-- 
2.48.1


