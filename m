Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB1BAE97C7
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 10:13:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026009.1401270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUhjs-0001JX-Uv; Thu, 26 Jun 2025 08:13:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026009.1401270; Thu, 26 Jun 2025 08:13:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUhjs-0001Gt-S2; Thu, 26 Jun 2025 08:13:44 +0000
Received: by outflank-mailman (input) for mailman id 1026009;
 Thu, 26 Jun 2025 08:13:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7AC/=ZJ=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uUhjr-00015u-Em
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 08:13:43 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7942863a-5265-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 10:13:42 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-32b910593edso6083551fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 01:13:42 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553e414c2aasm2474283e87.55.2025.06.26.01.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 01:13:41 -0700 (PDT)
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
X-Inumbo-ID: 7942863a-5265-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750925622; x=1751530422; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M9gQgFlI8smtr41SXezhqALTk3eHL+YQaCdxEISeBOk=;
        b=BHZxmpNjU5mol0PCY9lYuSRZ9pbNSrC62m9p3XZqHp5ktrYCjNJkR2T37KtG9X7ahk
         KbIv+HTmPcOjCmqXQk5NPPNVZ8q/Iyj0Dv1P2JBHaSzieeAMGJCkvVM+NRwirbkAeNR7
         8aSTY7K8hd8cWyfKemZ1YFJzCQLuqB07oDIg/U8HW8OSEnWQfCJJCtNmTM8DK6D+MQ8w
         iKpCH4tHaPMhNJl4sjNuwulNVZD4Rd8sB3Eyjg74WzQi4HZJXKwQEp0kMG8DxbFla9Pf
         zDpDvpCETjqlFmR9xRVjDPAvvgkQhzpS4arBvRY8L+nowJJAoRAgIiXDOuncxVg7LV9u
         G63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750925622; x=1751530422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M9gQgFlI8smtr41SXezhqALTk3eHL+YQaCdxEISeBOk=;
        b=Wc6qUTuT9HGvRwSwO1y/alG6OOBNJFTNhGmmeF0IqFTCjLjKb3UgGClo21q0y0wiax
         cpvTCfwicdycU6dl/dTBTZ+RIqacvgDfacyeCuu9ENVDW35IBUsPGe38LXodSTSrl9AQ
         Dys4MtyeK4Xh2HdY76I2oGOnl5qvvZsvS62/RAoXn1XGJcEGSSZf5U5aic54HzcMQ4Ar
         EKf8rVPwvUw8d1Ujol6MSzp0bmYjVYTtTY5YVOk3TIJ6S9GV7LfqEAeR7RKtoFntvpoX
         fCtwqFJlIaxeo07SuYCMjmFiYvILWoaWsUpo4mAbLdZsV7tjihWoxMWoN8izxCK0aWOG
         +mJQ==
X-Gm-Message-State: AOJu0YzhVcZgIJWR89otkOpqd4tG5dj54s1ywMmID0R4fYYVkq2QvRsp
	Lb/oL4DTwou+tgZX8NYmRSTje4CnOQ4QTZAj9JIfBy/iHfnAQvCluZnx+qbMKCcW
X-Gm-Gg: ASbGncumrlq3nlA6rI3g/G8a+iEa4hQPIR+uE1bfxb2H9UXEeOl6lMnJ4GziflJyM7w
	xyfBPC0dxSu/aQh1q7T5z/aURkvYR1Pj7JaB6BPIeRyx83WRE+Tgh44R3NSPmJt3+0lIEOn/5Jm
	tFd4mz7JP+MjhSHReksaCnKHTM51ukd/OilNLohp/n0qTUXs1Bm+156wJ2+BZQf3WLzNEI2mfOR
	ZEJQka3qKe9AKcV1c0KbPnnDYLjByZPFWQvrZBdH02pyGBO5TpCcSZSfdi85V4jnokhgmpgACmd
	ihI4Qdop0r14dZJp7g2Qjb1BaUq4ViX3+/p8lbYxR8nYmilITk10+ekr0aS/0HKpuzbxeQ4i7Va
	YBkh6TxBSMy0gQ4F9K0ewumH2Bg==
X-Google-Smtp-Source: AGHT+IFZ4LE5QGB7kp29fS4SAvNa6WI+Y6fL0MATHiOu//mK7Kd/3Ls4ZEj5ryhfe9uPhpoPVpIKgg==
X-Received: by 2002:a05:6512:3b0b:b0:553:25e9:7f3c with SMTP id 2adb3069b0e04-554fde595bcmr2099733e87.37.1750925621606;
        Thu, 26 Jun 2025 01:13:41 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH] systemd: Add hooks to stop/start xen-watchdog on suspend/resume
Date: Thu, 26 Jun 2025 11:12:46 +0300
Message-ID: <20250626081246.1923956-1-xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch adds a systemd sleep hook script to stop the xen-watchdog
service before system suspend and start it again after resume.

Stopping the watchdog before a system suspend operation may look unsafe.
Let’s imagine the following situation: 'systemctl suspend' does not
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
 tools/hotplug/Linux/systemd/Makefile          | 12 ++++-
 .../Linux/systemd/xen-watchdog-sleep.sh       | 45 +++++++++++++++++++
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 tools/hotplug/Linux/systemd/xen-watchdog-sleep.sh

diff --git a/tools/hotplug/Linux/systemd/Makefile b/tools/hotplug/Linux/systemd/Makefile
index e29889156d..98d325cc5d 100644
--- a/tools/hotplug/Linux/systemd/Makefile
+++ b/tools/hotplug/Linux/systemd/Makefile
@@ -5,6 +5,9 @@ XEN_SYSTEMD_MODULES := xen.conf
 
 XEN_SYSTEMD_MOUNT := proc-xen.mount
 
+XEN_SYSTEMD_SLEEP_SCRIPTS := xen-watchdog-sleep.sh
+XEN_SYSTEMD_SLEEP_DIR := $(XEN_SYSTEMD_DIR)/../system-sleep
+
 XEN_SYSTEMD_SERVICE := xenstored.service
 XEN_SYSTEMD_SERVICE += xenconsoled.service
 XEN_SYSTEMD_SERVICE += xen-qemu-dom0-disk-backend.service
@@ -15,7 +18,8 @@ XEN_SYSTEMD_SERVICE += xendriverdomain.service
 
 ALL_XEN_SYSTEMD :=	$(XEN_SYSTEMD_MODULES)  \
 			$(XEN_SYSTEMD_MOUNT)	\
-			$(XEN_SYSTEMD_SERVICE)
+			$(XEN_SYSTEMD_SERVICE)	\
+			$(XEN_SYSTEMD_SLEEP_SCRIPTS)
 
 .PHONY: all
 all:	$(ALL_XEN_SYSTEMD)
@@ -31,15 +35,21 @@ distclean: clean
 install: $(ALL_XEN_SYSTEMD)
 	$(INSTALL_DIR) $(DESTDIR)$(XEN_SYSTEMD_DIR)
 	$(INSTALL_DIR) $(DESTDIR)$(XEN_SYSTEMD_MODULES_LOAD)
+	$(INSTALL_DIR) $(DESTDIR)$(XEN_SYSTEMD_SLEEP_DIR)
 	$(INSTALL_DATA) *.service $(DESTDIR)$(XEN_SYSTEMD_DIR)
 	$(INSTALL_DATA) *.mount $(DESTDIR)$(XEN_SYSTEMD_DIR)
 	$(INSTALL_DATA) *.conf $(DESTDIR)$(XEN_SYSTEMD_MODULES_LOAD)
+	set -e; for i in $(XEN_SYSTEMD_SLEEP_SCRIPTS); \
+	    do \
+	    $(INSTALL_PROG) $$i $(DESTDIR)$(XEN_SYSTEMD_SLEEP_DIR); \
+	done
 
 .PHONY: uninstall
 uninstall:
 	rm -f $(DESTDIR)$(XEN_SYSTEMD_MODULES_LOAD)/*.conf
 	rm -f $(DESTDIR)$(XEN_SYSTEMD_DIR)/*.mount
 	rm -f $(DESTDIR)$(XEN_SYSTEMD_DIR)/*.service
+	rm -f $(addprefix $(DESTDIR)$(XEN_SYSTEMD_SLEEP_DIR)/, $(XEN_SYSTEMD_SLEEP_SCRIPTS))
 
 $(XEN_SYSTEMD_MODULES):
 	rm -f $@.tmp
diff --git a/tools/hotplug/Linux/systemd/xen-watchdog-sleep.sh b/tools/hotplug/Linux/systemd/xen-watchdog-sleep.sh
new file mode 100644
index 0000000000..2b2f0e16d8
--- /dev/null
+++ b/tools/hotplug/Linux/systemd/xen-watchdog-sleep.sh
@@ -0,0 +1,45 @@
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
+STATE_FILE="/run/xen-watchdog-sleep-marker"
+XEN_WATCHDOG_SLEEP_LOG="${XEN_LOG_DIR}/xen-watchdog-sleep.log"
+
+log_watchdog() {
+    echo "$1"
+    echo "$(date): $1" >> "${XEN_WATCHDOG_SLEEP_LOG}"
+}
+
+# Exit silently if Xen watchdog service is not present
+if ! systemctl show "${SERVICE_NAME}" > /dev/null 2>&1; then
+    exit 0
+fi
+
+case "$1" in
+pre)
+    if systemctl is-active --quiet "${SERVICE_NAME}"; then
+        touch "${STATE_FILE}"
+        log_watchdog "Stopping ${SERVICE_NAME} before $2."
+        systemctl stop "${SERVICE_NAME}"
+    fi
+    ;;
+post)
+    if [ -f "${STATE_FILE}" ]; then
+        log_watchdog "Starting ${SERVICE_NAME} after $2."
+        systemctl start "${SERVICE_NAME}"
+        rm "${STATE_FILE}"
+    fi
+    ;;
+*)
+    log_watchdog "Script called with unknown action '$1'. Arguments: '$@'"
+    exit 1
+    ;;
+esac
+
+exit 0
-- 
2.48.1


