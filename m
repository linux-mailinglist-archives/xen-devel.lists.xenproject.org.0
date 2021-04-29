Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0C436EA06
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 14:08:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119945.226779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc5SV-0002yy-F1; Thu, 29 Apr 2021 12:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119945.226779; Thu, 29 Apr 2021 12:07:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc5SV-0002yZ-Br; Thu, 29 Apr 2021 12:07:55 +0000
Received: by outflank-mailman (input) for mailman id 119945;
 Thu, 29 Apr 2021 12:07:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fSb/=J2=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lc5SU-0002yU-0J
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 12:07:54 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d7c76f4-377e-40d1-a8b1-bd71fa75d0e7;
 Thu, 29 Apr 2021 12:07:52 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.25.2 AUTH)
 with ESMTPSA id D0155dx3TC7kACq
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 29 Apr 2021 14:07:46 +0200 (CEST)
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
X-Inumbo-ID: 2d7c76f4-377e-40d1-a8b1-bd71fa75d0e7
ARC-Seal: i=1; a=rsa-sha256; t=1619698066; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Ifz75dVG1r/Je4u0EAxdM02I0lsk0gLi3GuyHmbqM0lL5f/rjNW8k6vp07tiw8g9UW
    UVB2nSnVB/SUGLInRI7w5zfdgDToOnzbEESjla59DQ1GHpQ5eGIIsGg4+3KGF3PTY4f+
    4J0CQSBNiGqCoYS+qzk01ll+xIDH+7jYufCICceKyw5Br6aVYdGFssSbJ98GnoX0v1uV
    pr2OZT3Mv6lcMtgSDyltUoOGJ4A1FXqV4+3cj7ULB1t3pPmI5+gLiMyvcUAqeo0LCiUN
    JBYcUO2NGkvPcCJXk1oBu4EsnOrrLLxJ85isOThLAJFAKSLvWcSbwM3sWDqU61fLZ6Gq
    aBfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1619698066;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=mxbQOROFPZL1+SoZVbdk5iB2hNC3eCQBFDcijtPOp4A=;
    b=ZMBFncACkyHPasJZ2fP2/+TRDzpXNYaElyTAqGDos7e4MikbZVmG3JjUYTuYuuFK1c
    rIaI/ENfhoyEnxlW86Qd9ShTmT22MRDuCKWuWtB5eVyk9MdG2PIuroZFwNVUop89l3yx
    LQSvkW87tv5kVPJaallICXsWxkUD/uMAaiD7Qyy68W+/CDMKp3TA/HtyvoiNWegq0Hac
    dn6Udim6EycKps4Wj4G+6jYGm0sCucl37ga7mU41X0RPK0081NeYNqOc5AHkPQHXKbJW
    TK3rmHCqMjEmkLZGa266L641G2nXAsexmbv/weET0zS6EdpUFxLMZzfBBTTzXN4cEddo
    yyNg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1619698066;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=mxbQOROFPZL1+SoZVbdk5iB2hNC3eCQBFDcijtPOp4A=;
    b=E6hkanNkjjSxgMzD4grUtfyCklKMI+4sjhD74ILSchxmo5KBfn4b8y7io7WNPQovBl
    A2hYOW3DxD7Y96pzrLGerGYXR9fcRjNwd8ouSpvLPDuGKH6OYlHEarztvfvZRPz2C34G
    hcE/O8TrGZQI2N8Cve4R5iTj3bV+c7V8UcP6HtW6SIQdpwM4U+VG0tP46LAE0oYQ80jL
    HvhPvkRhfshdS6fqhcSphIxIoxYG8ihMLfotbucJFasH/8MeCfNdGqlmZJUPtu+04j2t
    vPsIPIJOGVDjYWXhVy+eSBoKhrGD7Akb67kemRWcZwy6TqM4HiGJ1q/c/75ArVuqxkUc
    /lRw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgtl+1b1FMstFZvCqIQN5N7TvWFg4vzhFVdoKAuQ"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4] hotplug/Linux: fix starting of xenstored with restarting systemd
Date: Thu, 29 Apr 2021 14:07:45 +0200
Message-Id: <20210429120745.28644-1-olaf@aepfle.de>
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
index 991dec8d25..fa4ea4af49 100644
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
 	[ -z "$XENSTORED_ROOTDIR" ] && XENSTORED_ROOTDIR="@XEN_LIB_STORED@"
 	[ -z "$XENSTORED_TRACE" ] || XENSTORED_ARGS="$XENSTORED_ARGS -T @XEN_LOG_DIR@/xenstored-trace.log"
@@ -60,13 +73,15 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF
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
@@ -76,9 +91,12 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF
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

