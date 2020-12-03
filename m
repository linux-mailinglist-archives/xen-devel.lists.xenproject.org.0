Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E6C2CCF8C
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 07:35:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43119.77573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkiCW-00015Z-UI; Thu, 03 Dec 2020 06:34:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43119.77573; Thu, 03 Dec 2020 06:34:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkiCW-00015A-R6; Thu, 03 Dec 2020 06:34:48 +0000
Received: by outflank-mailman (input) for mailman id 43119;
 Thu, 03 Dec 2020 06:34:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lmMJ=FH=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kkiCV-000155-GT
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 06:34:47 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.21])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89fb8e21-f1b9-4377-a070-62adddff8373;
 Thu, 03 Dec 2020 06:34:46 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.3.4 DYNA|AUTH)
 with ESMTPSA id 60a649wB36YdYqy
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 3 Dec 2020 07:34:39 +0100 (CET)
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
X-Inumbo-ID: 89fb8e21-f1b9-4377-a070-62adddff8373
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1606977285;
	s=strato-dkim-0002; d=aepfle.de;
	h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
	Subject:Sender;
	bh=aOMOXSH1cw5HhPN/7/vRbzPCcihlD18Pa5LoVzmWzLM=;
	b=ZEqYBO48e8kD0eRUpvQOPEFHHydET8+fY90s+gt2UwYfl7ZyfwR3ljroTtAG4PXt7f
	tq23kVTcejx13b+LcWys5e5x4REPkNeoZr/uNAeL21b5Fd4JQqnkw69MYnnP8u+u/4zE
	LS3o4HkV4GHKfwzrUnnoprDsfsfcfQ8VoMAvdJ54vsrRJYCujM2PT/WBLuwMaYQuqao/
	4flR6ctwoZz3Pr9Nf/Gz9Wealg9w+ukSunlaCJH7j6bsZzvl7sLa9UPZFD9QVqSv5B/D
	dafpi2rYdj4pvhk4mXgZunc29THZb1C+hoTLt+DEV6AX9b30m9JJGE38sEuiMK4sYIYN
	GgVQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3Gwg"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] tools/hotplug: allow tuning of xenwatchdogd arguments
Date: Thu,  3 Dec 2020 07:34:36 +0100
Message-Id: <20201203063436.4503-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the arguments for xenwatchdogd are hardcoded with 15s
keep-alive interval and 30s timeout.

It is not possible to tweak these values via
/etc/systemd/system/xen-watchdog.service.d/*.conf because ExecStart
can not be replaced. The only option would be a private copy
/etc/systemd/system/xen-watchdog.service, which may get out of sync
with the Xen provided xen-watchdog.service.

Adjust the service file to recognize XENWATCHDOGD_ARGS= in a
private unit configuration file.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---

v2: fix "test -n" in init.d

 tools/hotplug/Linux/init.d/xen-watchdog.in          | 7 ++++++-
 tools/hotplug/Linux/systemd/xen-watchdog.service.in | 4 +++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/hotplug/Linux/init.d/xen-watchdog.in b/tools/hotplug/Linux/init.d/xen-watchdog.in
index c05f1f6b6a..b36a94bd8e 100644
--- a/tools/hotplug/Linux/init.d/xen-watchdog.in
+++ b/tools/hotplug/Linux/init.d/xen-watchdog.in
@@ -19,6 +19,11 @@
 
 . @XEN_SCRIPT_DIR@/hotplugpath.sh
 
+xencommons_config=@CONFIG_DIR@/@CONFIG_LEAF_DIR@
+
+test -f $xencommons_config/xencommons && . $xencommons_config/xencommons
+
+test -n "$XENWATCHDOGD_ARGS" || XENWATCHDOGD_ARGS='15 30'
 DAEMON=${sbindir}/xenwatchdogd
 base=$(basename $DAEMON)
 
@@ -46,7 +51,7 @@ start() {
 	local r
 	echo -n $"Starting domain watchdog daemon: "
 
-	$DAEMON 30 15
+	$DAEMON $XENWATCHDOGD_ARGS
 	r=$?
 	[ "$r" -eq 0 ] && success $"$base startup" || failure $"$base startup"
 	echo
diff --git a/tools/hotplug/Linux/systemd/xen-watchdog.service.in b/tools/hotplug/Linux/systemd/xen-watchdog.service.in
index 1eecd2a616..637ab7fd7f 100644
--- a/tools/hotplug/Linux/systemd/xen-watchdog.service.in
+++ b/tools/hotplug/Linux/systemd/xen-watchdog.service.in
@@ -6,7 +6,9 @@ ConditionPathExists=/proc/xen/capabilities
 
 [Service]
 Type=forking
-ExecStart=@sbindir@/xenwatchdogd 30 15
+Environment="XENWATCHDOGD_ARGS=30 15"
+EnvironmentFile=-@CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons
+ExecStart=@sbindir@/xenwatchdogd $XENWATCHDOGD_ARGS
 KillSignal=USR1
 
 [Install]

