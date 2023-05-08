Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 704BB6FB5C4
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 19:15:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531682.827457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw4Rp-0003fK-2W; Mon, 08 May 2023 17:14:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531682.827457; Mon, 08 May 2023 17:14:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw4Ro-0003de-VW; Mon, 08 May 2023 17:14:52 +0000
Received: by outflank-mailman (input) for mailman id 531682;
 Mon, 08 May 2023 17:14:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fEaP=A5=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1pw4Rn-0003cn-K1
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 17:14:51 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.53]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d70ff816-edc3-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 19:14:50 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz48HEj1iE
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 8 May 2023 19:14:45 +0200 (CEST)
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
X-Inumbo-ID: d70ff816-edc3-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1683566085; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=tE6YHuHy5lVgdjuDoGDmTwSBgXKtuS1zDa+h/S810xaL3xbUpjKNwYeQHYaBy2RvFl
    XpZuEd8VLlxKqHAEIc6ga5n58BAziTQas967IHhukhcGU0EDv2VsvjZ7VEaqrihJ2Y9/
    i0Vh4ngEwa0bPncFQPvXLsOHMVorH7YoZ/dzlDlOWjPIgm8mif3tAGTWiCrnKCCsRpx5
    3p479Zye8lgUFoWvbLH1feNVbJbESCTKFSG1ntDBw8jU7975kRDXEu7X0WX7prpco4nY
    8IA6BOJYLF39Ln+EoVt4zk6X+h1daiCLOmcQ3KbsYczTIh/wB+29XuPf70rWREdCAzxP
    zuOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683566085;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=y0EEjOUz8ZL2cVZEIRcJ/bDf+Ceoz247L+uHTHcTrAo=;
    b=b05BlS4jHDUWuizJL3NhuJotZtOLwERDH4ZMFsEmvbs1CocwbRm41A3tZEBaDUksS1
    bObD3J8ePYHUk56GTqUyNvuIIyr0TpW5RGBlTbFg2B+8kZ1iKGYar6S9pIcE4v2EoUEQ
    Aiif6AdOVQ2p43r4o49yQt8SkH3UCdRzJGUEJWmir2/yaSTfISyhavMHQmrOrdzTssTL
    Uy+8oDr+ixK9Q8+QuM/NvGZlMiF9/OM7ERoOIn7MdwiqlqeRQq061xtFbRdponjbMUyj
    par6x6S8IudAulCdUcHgTeeAc3I/J5elU9eXBxQl5yTrnaQwhbczQ43Nu5CdN53R0mnr
    5qZg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683566085;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=y0EEjOUz8ZL2cVZEIRcJ/bDf+Ceoz247L+uHTHcTrAo=;
    b=WfTnRdjagb5Qlqlvp773aVY/NuQaV7jGY/PlS4dKa71IgRcOYO6ew27kbArysI/G4B
    NBRDn20uoaNrc2WE+6ct3b07XSY+Eoa/8cKTCYhlLLZhNWGaTLBR2TL8/TFPfD+ATE/0
    bwCc52HlIp3OxyY0qeId8K1ML943XhRviSODWacIDH44dHDBWemI/90VI1gNvxd5moF3
    T8Xq2hYL9hi0hZGiVXsvkdRGXIB+RIRQqYV71l+1Aa8nN9VqmR4okXlvqENWBrs8AphC
    SfYsqLG4ToE8gaC/ITXOTvYJCXu3m+WyZLHmMWfgBelPihBJsltJyS2mJYNi+wQ2M48c
    HlOQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683566085;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=y0EEjOUz8ZL2cVZEIRcJ/bDf+Ceoz247L+uHTHcTrAo=;
    b=mCQQC+FJHISBFELfPTHBHvCVe1SjmVm6K6kDqRAgGoenlST0+wBHtE71uQq1U4//KB
    rFjD9jOEkEWyFKMDY4Bg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4xr137Gpot26qU4O0oDB37weYobhAHKAaiA4NsOg=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2] Fix install.sh for systemd
Date: Mon,  8 May 2023 17:14:37 +0000
Message-Id: <20230508171437.27424-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

On a fedora system, if you run `sudo sh install.sh` you break your
system.  The installation clobbers /var/run, a symlink to /run.  A
subsequent boot fails when /var/run and /run are different since
accesses through /var/run can't find items that now only exist in /run
and vice-versa.

Skip populating /var/run/xen during make install.
The directory is already created by some scripts. Adjust all remaining
scripts to create XEN_RUN_DIR at runtime.

XEN_RUN_STORED is covered by XEN_RUN_DIR because xenstored is usually
started afterwards.

Reported-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/Makefile                                     | 2 --
 tools/hotplug/FreeBSD/rc.d/xencommons.in           | 1 +
 tools/hotplug/FreeBSD/rc.d/xendriverdomain.in      | 1 +
 tools/hotplug/Linux/init.d/xendriverdomain.in      | 1 +
 tools/hotplug/Linux/systemd/xenconsoled.service.in | 2 +-
 tools/hotplug/NetBSD/rc.d/xendriverdomain.in       | 2 +-
 6 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/Makefile b/tools/Makefile
index 4906fdbc23..1ff90ddfa0 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -58,9 +58,7 @@ build all: subdirs-all
 install:
 	$(INSTALL_DIR) -m 700 $(DESTDIR)$(XEN_DUMP_DIR)
 	$(INSTALL_DIR) $(DESTDIR)$(XEN_LOG_DIR)
-	$(INSTALL_DIR) $(DESTDIR)$(XEN_RUN_DIR)
 	$(INSTALL_DIR) $(DESTDIR)$(XEN_LIB_DIR)
-	$(INSTALL_DIR) $(DESTDIR)$(XEN_RUN_STORED)
 	$(INSTALL_DIR) $(DESTDIR)$(PKG_INSTALLDIR)
 	$(MAKE) subdirs-install
 
diff --git a/tools/hotplug/FreeBSD/rc.d/xencommons.in b/tools/hotplug/FreeBSD/rc.d/xencommons.in
index 7f7cda289f..1cf217d418 100644
--- a/tools/hotplug/FreeBSD/rc.d/xencommons.in
+++ b/tools/hotplug/FreeBSD/rc.d/xencommons.in
@@ -34,6 +34,7 @@ xen_startcmd()
 	local time=0
 	local timeout=30
 
+	mkdir -p "@XEN_RUN_DIR@"
 	xenstored_pid=$(check_pidfile ${XENSTORED_PIDFILE} ${XENSTORED})
 	if test -z "$xenstored_pid"; then
 		printf "Starting xenservices: xenstored, xenconsoled."
diff --git a/tools/hotplug/FreeBSD/rc.d/xendriverdomain.in b/tools/hotplug/FreeBSD/rc.d/xendriverdomain.in
index a032822e33..030d104024 100644
--- a/tools/hotplug/FreeBSD/rc.d/xendriverdomain.in
+++ b/tools/hotplug/FreeBSD/rc.d/xendriverdomain.in
@@ -27,6 +27,7 @@ xendriverdomain_start()
 {
 	printf "Starting xenservices: xl devd."
 
+	mkdir -p "@XEN_RUN_DIR@"
 	PATH="${bindir}:${sbindir}:$PATH" ${sbindir}/xl devd --pidfile ${XLDEVD_PIDFILE} ${XLDEVD_ARGS}
 
 	printf "\n"
diff --git a/tools/hotplug/Linux/init.d/xendriverdomain.in b/tools/hotplug/Linux/init.d/xendriverdomain.in
index c63060f62a..1055d0b942 100644
--- a/tools/hotplug/Linux/init.d/xendriverdomain.in
+++ b/tools/hotplug/Linux/init.d/xendriverdomain.in
@@ -49,6 +49,7 @@ fi
 
 do_start () {
 	echo Starting xl devd...
+	mkdir -m700 -p @XEN_RUN_DIR@
 	${sbindir}/xl devd --pidfile=$XLDEVD_PIDFILE $XLDEVD_ARGS
 }
 do_stop () {
diff --git a/tools/hotplug/Linux/systemd/xenconsoled.service.in b/tools/hotplug/Linux/systemd/xenconsoled.service.in
index 1f03de9041..d84c09aa9c 100644
--- a/tools/hotplug/Linux/systemd/xenconsoled.service.in
+++ b/tools/hotplug/Linux/systemd/xenconsoled.service.in
@@ -11,7 +11,7 @@ Environment=XENCONSOLED_TRACE=none
 Environment=XENCONSOLED_LOG_DIR=@XEN_LOG_DIR@/console
 EnvironmentFile=-@CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons
 ExecStartPre=/bin/grep -q control_d /proc/xen/capabilities
-ExecStartPre=/bin/mkdir -p ${XENCONSOLED_LOG_DIR}
+ExecStartPre=/bin/mkdir -p ${XENCONSOLED_LOG_DIR} @XEN_RUN_DIR@
 ExecStart=@sbindir@/xenconsoled -i --log=${XENCONSOLED_TRACE} --log-dir=${XENCONSOLED_LOG_DIR} $XENCONSOLED_ARGS
 
 [Install]
diff --git a/tools/hotplug/NetBSD/rc.d/xendriverdomain.in b/tools/hotplug/NetBSD/rc.d/xendriverdomain.in
index f47b0b189c..23a5352502 100644
--- a/tools/hotplug/NetBSD/rc.d/xendriverdomain.in
+++ b/tools/hotplug/NetBSD/rc.d/xendriverdomain.in
@@ -23,7 +23,7 @@ XLDEVD_PIDFILE="@XEN_RUN_DIR@/xldevd.pid"
 
 xendriverdomain_precmd()
 {
-	:
+	mkdir -p "@XEN_RUN_DIR@"
 }
 
 xendriverdomain_startcmd()

