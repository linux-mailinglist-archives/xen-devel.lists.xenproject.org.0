Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ACB3696CE
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 18:22:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116540.222432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZyZA-0001Y8-Kp; Fri, 23 Apr 2021 16:22:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116540.222432; Fri, 23 Apr 2021 16:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZyZA-0001Xj-HV; Fri, 23 Apr 2021 16:22:04 +0000
Received: by outflank-mailman (input) for mailman id 116540;
 Fri, 23 Apr 2021 16:22:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o87G=JU=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lZyZ8-0001Xa-MG
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 16:22:03 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb3849d8-351b-4216-9449-dd2d07feb849;
 Fri, 23 Apr 2021 16:22:01 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.24.4 DYNA|AUTH)
 with ESMTPSA id e071aex3NGLr0iW
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 23 Apr 2021 18:21:53 +0200 (CEST)
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
X-Inumbo-ID: fb3849d8-351b-4216-9449-dd2d07feb849
ARC-Seal: i=1; a=rsa-sha256; t=1619194913; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=L83C2vPSZ3kknw7mtyBo69IhnWUctWIw2SOSh8pmu6MRfl/xkV2NmSWY0tB4JZgKB+
    cAJQUlS6Uk40tVkbYNblJgOHit+PvKWi18uCFthfu3sMMffbB1xycc5VyCKJk98xsEX0
    yk/LaaVoXS/b/uyu0BA2ZGN3QKKBMOHVIssnUKH13KAvIGSAY5uIvZiJTni5CSoTlYSi
    GQ0O2p1+1wIJVy4Be0o32zi5g0OQ64XCLB/sMVBg7lbgjT2B2DJQV+Oojl971kZbPGS2
    qZP2MvBuVwE9/N8H6uHmAyBwuzp9j410GZ58Bhs8HG4ppyMWYEQR/x3VYfWU7/jscvTP
    VBfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1619194913;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=NLtbmPUVZOxoFRYRLyOAV6LxYEBpPXUNGQbrk248OYc=;
    b=XUKWGSWZz9vLthUndicw1m9Lsj4HorAeotBZ/88h7b69fUR6RuzJ21yloDPRb/kM0t
    BADqDXWA8xrnZxhoKZVOX5CeXBHK4kOn5HNSENq82WsxREdYKsb1MiYm1gbG+LCxVVYs
    hnuFlqhVF1wvcgaY9NcKev5GUuz8qJbAE/pRZLvYMQ6NW0SvxsIV/jTUtVUEW+pplRDh
    idlLOHEWurVeYqHR4ZFDZrXKR1plxuYpSJb+sajFJsJLnI/kGOPRXYLKT8yhQl8Ob2/+
    HMuom6b6xgdfrgOqubF+Sz9LrsFvmlDhhJij1MsMZ22Rda6ciP7caKnJYBed/qMdbp+H
    F97Q==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1619194913;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=NLtbmPUVZOxoFRYRLyOAV6LxYEBpPXUNGQbrk248OYc=;
    b=gxKMCzCXQX2Z69kfm8HYkfGycBbym8njCLzAevKnylVVRN+bMokkXexlTnumceOL94
    6MLaEombQLnUg/uMGnkgNRTOLFdIhEU97BBEEU6Pwh2yJIwa75GXdrMCbmylyrWM9Tkw
    6sY4Pkue25ExOyD6Uaih54Tat6xdJVbp57mzjeh2sHZqGrED9TS6xI24xjAD9wOJdU6V
    0q+AWXsT9KOSC1eJWDFj3GYkZLfC7GmCX7UUU6f4Ffwjqma7/B8DyjV8fgsnxwyKF6mi
    X/ClzK758uYw5djTLNXsLxxiQbpjC/nzl4SGy68qOmHN0n5/0CV1x3z1BA1qNLXMSJjh
    bIRg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuz7MdiQehTvc3RdcLGMdqQ=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3] hotplug/Linux: fix starting of xenstored with restarting systemd
Date: Fri, 23 Apr 2021 18:21:48 +0200
Message-Id: <20210423162148.15735-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
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
v03:
- remove run_xenstored function, follow style of shell built-in test function
v02:
- preserve Type=notify
---
 tools/hotplug/Linux/init.d/xencommons.in      |  2 +-
 tools/hotplug/Linux/launch-xenstore.in        | 39 +++++++++++++------
 .../Linux/systemd/xenstored.service.in        |  2 +-
 3 files changed, 30 insertions(+), 13 deletions(-)

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
index 991dec8d25..3c30010e3c 100644
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
@@ -44,14 +55,15 @@ timeout_xenstore () {
 	return 0
 }
 
-test_xenstore && exit 0
+if test "$initd" = 'sysv' ; then
+	mkdir -p @XEN_RUN_DIR@
+	test_xenstore && exit 0
+fi
 
 test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons
 
 [ "$XENSTORETYPE" = "" ] && XENSTORETYPE=daemon
 
-/bin/mkdir -p @XEN_RUN_DIR@
-
 [ "$XENSTORETYPE" = "daemon" ] && {
 	[ -z "$XENSTORED_ROOTDIR" ] && XENSTORED_ROOTDIR="@XEN_LIB_STORED@"
 	[ -z "$XENSTORED_TRACE" ] || XENSTORED_ARGS="$XENSTORED_ARGS -T @XEN_LOG_DIR@/xenstored-trace.log"
@@ -60,13 +72,15 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF
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
@@ -76,9 +90,12 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF
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

