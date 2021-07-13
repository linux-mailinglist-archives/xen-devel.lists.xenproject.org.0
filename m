Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4371E3C761A
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 20:06:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155539.287138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3MnY-0003PI-3Q; Tue, 13 Jul 2021 18:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155539.287138; Tue, 13 Jul 2021 18:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3MnX-0003MB-VV; Tue, 13 Jul 2021 18:06:23 +0000
Received: by outflank-mailman (input) for mailman id 155539;
 Tue, 13 Jul 2021 18:06:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9Py=MF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3MnW-0002kr-T2
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 18:06:22 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.167])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04ccd15e-e405-11eb-8793-12813bfff9fa;
 Tue, 13 Jul 2021 18:06:17 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6DI6BtAj
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 13 Jul 2021 20:06:11 +0200 (CEST)
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
X-Inumbo-ID: 04ccd15e-e405-11eb-8793-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626199572;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=G9MXmcB02gC5L6Rf3KqCQCmQRU/JibmaTKTy7tmcVlI=;
    b=pQ5/nQNGQg0JTqc78E/qLUshNNM7s61SiAI126cpuRIVtR+uUzFWR5MvQNfV2RaYZF
    dwFUiVK3cSBvF8Gme1wOEyS3sfwPkY+13sZ6QTreEt8L4IrPnjkdBa5f/Fw9P3rMhgwX
    kHV3mZp2Yc5uMON8VXYpFG48xKUbjtY4slTIDA+NYS1fFTyOTbztevO7MDjBvbkB1n+A
    O+gfYWLuHrG01HwpaneYYrwgXbvok+PQ92UZbWdThNu5zM5hdesO6bP4B6bQ/0PxCZRA
    Q/5Q9TuE3TCTxFshFxXuPNjpeKLrD3ZUJDJ//M7TcFop+79jZqpq7qBqjho2v7qOLvXE
    rn/g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgthqlagRsstpH9XYEN5v9xf7dypFU9ge5p0Oi0V"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210713 02/31] hotplug/Linux: fix starting of xenstored with restarting systemd
Date: Tue, 13 Jul 2021 20:05:36 +0200
Message-Id: <20210713180605.12096-3-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210713180605.12096-1-olaf@aepfle.de>
References: <20210713180605.12096-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A hard to trigger race with another unrelated systemd service and
xenstored.service unveiled a bug in the way how xenstored is launched
with systemd.

launch-xenstore may start either a daemon or a domain. In case a domain
is used, systemd-notify was called. If another service triggered a
restart of systemd while xenstored.service was executed, systemd may
temporary lose track of services with Type=notify. As a result,
xenstored.service would be marked as failed and units that depend on it
will not be started. This breaks the enire Xen toolstack.

The chain of events is basically: xenstored.service sends the
notification to systemd, this is a one-way event. Then systemd may be
restarted by the other unit. During this time, xenstored.service is done
and exits. Once systemd is done with its restart, it collects the pending
notifications and childs. If it does not find the unit which sent the
notification it will declare it as failed.

A workaround for this scenario is to leave the child processes running
for a short time after sending the "READY=1" notification. If systemd
happens to restart it will still find the unit it launched.

Adjust the callers of launch-xenstore to specifiy the init system:
Do not fork xenstored with systemd, preserve pid. This wil also avoid
the need for a sleep because the process which sent the "READY=1" (the
previously forked child) is still alive.

Remove the --pid-file in the systemd case because the pid of the child
is known, and the file had probably little effect anyway due to lack of
PidFile= and Type=forking in the unit file.

Be verbose about xenstored startup only with sysv to avoid interleaved
output in systemd journal. Do the same also for domain case, even if is
not strictly needed because init-xenstore-domain has no output.

The fix for upstream systemd which is supposed to fix it:
575b300b795b6 ("pid1: rework how we dispatch SIGCHLD and other signals")

Signed-off-by: Olaf Hering <olaf@aepfle.de>

---
v04:
- do mkdir unconditionally because init-xenstore-domain writes the domid to
  xenstored.pid
v03:
- remove run_xenstored function, follow style of shell built-in test function
v02:
- preserve Type=notify
---
 tools/hotplug/Linux/init.d/xencommons.in      |  2 +-
 tools/hotplug/Linux/launch-xenstore.in        | 40 ++++++++++++++-----
 .../Linux/systemd/xenstored.service.in        |  2 +-
 3 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/tools/hotplug/Linux/init.d/xencommons.in b/tools/hotplug/Linux/init.d/xencommons.in
index 7fd6903b98..dcb0ce4b73 100644
--- a/tools/hotplug/Linux/init.d/xencommons.in
+++ b/tools/hotplug/Linux/init.d/xencommons.in
@@ -60,7 +60,7 @@ do_start () {
 	mkdir -m700 -p ${XEN_LOCK_DIR}
 	mkdir -p ${XEN_LOG_DIR}
 
-	@XEN_SCRIPT_DIR@/launch-xenstore || exit 1
+	@XEN_SCRIPT_DIR@/launch-xenstore 'sysv' || exit 1
 
 	echo Setting domain 0 name, domid and JSON config...
 	${LIBEXEC_BIN}/xen-init-dom0 ${XEN_DOM0_UUID}
diff --git a/tools/hotplug/Linux/launch-xenstore.in b/tools/hotplug/Linux/launch-xenstore.in
index 019f9d6f4d..d40c66482a 100644
--- a/tools/hotplug/Linux/launch-xenstore.in
+++ b/tools/hotplug/Linux/launch-xenstore.in
@@ -15,6 +15,17 @@
 # License along with this library; If not, see <http://www.gnu.org/licenses/>.
 #
 
+initd=$1
+
+case "$initd" in
+	sysv) nonl='-n' ;;
+	systemd) nonl= ;;
+	*)
+	echo "first argument must be 'sysv' or 'systemd'"
+	exit 1
+	;;
+esac
+
 XENSTORED=@XENSTORED@
 
 . @XEN_SCRIPT_DIR@/hotplugpath.sh
@@ -44,14 +55,16 @@ timeout_xenstore () {
 	return 0
 }
 
-test_xenstore && exit 0
+mkdir -p @XEN_RUN_DIR@
+
+if test "$initd" = 'sysv' ; then
+	test_xenstore && exit 0
+fi
 
 test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons
 
 [ "$XENSTORETYPE" = "" ] && XENSTORETYPE=daemon
 
-/bin/mkdir -p @XEN_RUN_DIR@
-
 [ "$XENSTORETYPE" = "daemon" ] && {
 	[ -z "$XENSTORED_TRACE" ] || XENSTORED_ARGS="$XENSTORED_ARGS -T @XEN_LOG_DIR@/xenstored-trace.log"
 	[ -z "$XENSTORED" ] && XENSTORED=@XENSTORED@
@@ -59,13 +72,15 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF
 		echo "No xenstored found"
 		exit 1
 	}
+	[ "$initd" = 'sysv' ] && {
+		echo $nonl Starting $XENSTORED...
+		$XENSTORED --pid-file @XEN_RUN_DIR@/xenstored.pid $XENSTORED_ARGS
+		timeout_xenstore $XENSTORED || exit 1
+		exit 0
+	}
 
-	echo -n Starting $XENSTORED...
-	$XENSTORED --pid-file @XEN_RUN_DIR@/xenstored.pid $XENSTORED_ARGS
-
-	systemd-notify --booted 2>/dev/null || timeout_xenstore $XENSTORED || exit 1
-
-	exit 0
+	exec $XENSTORED -N $XENSTORED_ARGS
+	exit 1
 }
 
 [ "$XENSTORETYPE" = "domain" ] && {
@@ -75,9 +90,12 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF
 	XENSTORE_DOMAIN_ARGS="$XENSTORE_DOMAIN_ARGS --memory $XENSTORE_DOMAIN_SIZE"
 	[ -z "$XENSTORE_MAX_DOMAIN_SIZE" ] || XENSTORE_DOMAIN_ARGS="$XENSTORE_DOMAIN_ARGS --maxmem $XENSTORE_MAX_DOMAIN_SIZE"
 
-	echo -n Starting $XENSTORE_DOMAIN_KERNEL...
+	echo $nonl Starting $XENSTORE_DOMAIN_KERNEL...
 	${LIBEXEC_BIN}/init-xenstore-domain $XENSTORE_DOMAIN_ARGS || exit 1
-	systemd-notify --ready 2>/dev/null
+	[ "$initd" = 'systemd' ] && {
+		systemd-notify --ready
+		sleep 9
+	}
 
 	exit 0
 }
diff --git a/tools/hotplug/Linux/systemd/xenstored.service.in b/tools/hotplug/Linux/systemd/xenstored.service.in
index 80c1d408a5..c226eb3635 100644
--- a/tools/hotplug/Linux/systemd/xenstored.service.in
+++ b/tools/hotplug/Linux/systemd/xenstored.service.in
@@ -11,7 +11,7 @@ Type=notify
 NotifyAccess=all
 RemainAfterExit=true
 ExecStartPre=/bin/grep -q control_d /proc/xen/capabilities
-ExecStart=@XEN_SCRIPT_DIR@/launch-xenstore
+ExecStart=@XEN_SCRIPT_DIR@/launch-xenstore 'systemd'
 
 [Install]
 WantedBy=multi-user.target

