Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2B23977B7
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:13:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135019.251199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo70v-0000MN-M1; Tue, 01 Jun 2021 16:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135019.251199; Tue, 01 Jun 2021 16:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo70v-0000Je-I6; Tue, 01 Jun 2021 16:13:09 +0000
Received: by outflank-mailman (input) for mailman id 135019;
 Tue, 01 Jun 2021 16:13:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo70R-0005X1-1E
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:12:39 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.173])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c58b872c-705e-46c7-a4aa-94a90b0c6dcb;
 Tue, 01 Jun 2021 16:11:47 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBg1Bi
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:42 +0200 (CEST)
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
X-Inumbo-ID: c58b872c-705e-46c7-a4aa-94a90b0c6dcb
ARC-Seal: i=1; a=rsa-sha256; t=1622563902; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=K7MnlPHaXmu4fU5RlfPrsnOzwcPTcmOAWCvSh+ooAre1bwTpwi4eMMGz/5Jv1Ig1ZW
    JloAzpPSnJnclTW4wr7Ytk8bLdATSBiQRhf3LpoxulBCdjGwn8fEikIu6++kaZ7sPHfq
    m9GFIxxfgtPMPPVdJKFpa2B/70/RZ3tKv/8obUaj1nj6W5e7me+PNZCLyOUaoqBecAnP
    C+C45/54baeVovaLeEH1v31apfihBaozH7X9mlU0glNcddolHxmNutWRvmEqNjiEttZy
    Fojaz3PuVQbehB5xyP8qO3zAvTPyTuNNoFDakouqC8rrm+uP5B2S4r6HMpOWkvv7a9a9
    Fklw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563902;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=fttDAmpegUqwpOBB61SFRLpHBJB9wPmVo+V4iKyUqQw=;
    b=ZKo6xL4wFzjwUtYQMxZLthEnX/2j4XXU+ET8fslQ8JqjAiO9jlMLLDaX7tNV/rIito
    YSjbAKL+Lgd9rhcCBSKycTE/JI+vMKvhm2LCur4Zyxg0TZeUGyGVDBoeri5jHWzi+v8m
    5uGj4AhoMJH1/UpyRd+ABqMeblXCauuk+Qnxu4g4en0FXc8YE536ZPSMNgxEPJ7EA5vB
    NtOn+kHn36uvexNqpQEWuZkcJfaru5vXOE5Xoup/d/KePoFZOqJoZFV2HxvZehI7SvEX
    W6W8XvN3C4y2+CfoOWniMWikvjXytRwbvQo80fTUHzxDYBzxgh5qWXM/941Fm3bd1Yeq
    EMfg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563902;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=fttDAmpegUqwpOBB61SFRLpHBJB9wPmVo+V4iKyUqQw=;
    b=ShTWQZKcQxZ1sfebsNAw3YaYcPQB1WYhFoM850GJhLl8wmQwEfctVTPf+8YlicvXTj
    VlDW3wj8vaW/oiD6NQm1ua1hkBTsrESScVeGdK9/qnZ6IAKgoLi2QrU71IgL5R7JKqFu
    SOZBrr9BV/XYgYN2PZBWv8VWy+NnFnwL8tTBdr2BjS8LjSr9CCPjYjQlWHTpZY/Qwz4s
    uJ6yIZ97QLzsAjNs79CzpqBfvtk8o1P3YfO2jfbA8fkwYPLd4ggLTjuAP2/hUahRWXzu
    6mIhBdYVJTtX9k2p+5OPkdMh21UKzH2P1Dk4KdBAkWGepZutG7i3uFqQ9drAKLmYKjln
    lsCw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210601 38/38] hotplug/Linux: fix starting of xenstored with restarting systemd
Date: Tue,  1 Jun 2021 18:11:18 +0200
Message-Id: <20210601161118.18986-39-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
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

--
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

