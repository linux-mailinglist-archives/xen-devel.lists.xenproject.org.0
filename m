Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C418E7006F0
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 13:38:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533797.830742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxR5X-0001sV-M1; Fri, 12 May 2023 11:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533797.830742; Fri, 12 May 2023 11:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxR5X-0001pf-Iz; Fri, 12 May 2023 11:37:31 +0000
Received: by outflank-mailman (input) for mailman id 533797;
 Fri, 12 May 2023 11:37:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3Uaj=BB=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1pxR5W-0001pZ-7r
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 11:37:30 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.164]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 601b5111-f0b9-11ed-b229-6b7b168915f2;
 Fri, 12 May 2023 13:37:29 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz4CBbOJLT
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 12 May 2023 13:37:24 +0200 (CEST)
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
X-Inumbo-ID: 601b5111-f0b9-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1683891444; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=m0EwRS4obPPprrZpWB3J2CyEC7twPxJUOqHNGo926fbwiV/0FO/zHDBvfXkO6YphJY
    SjPCDZ9XIBr+h+BfV/uWH+2/vC41HgLlSwWebwM8j5eLwJb4jzorFd+QfXQlp+H6wN6T
    LNkufYO60H9ewBWNmpYlTQHeE29IuYw3wASu5WDYcXS9lnnMmRG6xEVJ7OfdGx/6u6ek
    URXFen2oNfxTXASIMLbZBpZVMOxRQQ19/rasSaFG96VgW6cMAnrMROFEBnBxDHDxQ6U5
    de7Iy2oHx/J2G+fgb+JcPmgadqQLIJ975hHsRAfISuwdcBaBfcBZ44YJxYVJd8PSvlHN
    xGsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683891444;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=3/HjLg8WC0z8XKR8q3J8WROiVeYOfFeQJrGqHDVdwzY=;
    b=H4/QOwAZ8Vn99qhxVwRtAd7bL9A68E0EX/lW7Z26LlLkUzta3Ygck9awAYZ8sPzkMk
    yOcK42E0bFsFVIAXcTBNi1wCVtUP6ATe/7veKKuoeKhqczAjzU3XE99mk/LG2sn3IKuH
    ecGcdZJXttlpiOay7bzM8oEj3faDdMVya5pfAwHs7iFlzoZavEAKfuWk2NTtgupidNqk
    n8aqJEaBofbHdZtYU3MAFG1Kb16ocCoGqtJqZHDri1mdb0lO5Y5TgGp6q9hMyol2Tb8x
    sqywq4X0J+nHkd6TlM+PNRwPriSUG0bMsMFhEH1cQ/Q4/2e3fxO3NUha7T41TxN/07Sq
    T0NA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683891444;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=3/HjLg8WC0z8XKR8q3J8WROiVeYOfFeQJrGqHDVdwzY=;
    b=JyTu814bNR382Bmdfdo8+wonA/oY50TPIBrdgqTgrPW2LtLZH9nkxqeIqqDQnRZNpw
    kKDXHrD5TMaOhQTgtptveNDzIPiWd9kLfrgxa51/QkxSByKED+JpqRxR31SwydaaflLf
    JdY/pFHbtal9C9Oz5wKJJh5apxxs8iKrpvutBT5smm6+lTYfbe/81MPkiH7NR+tS8v0F
    z+NiEod/RIppQ/L5ScZZVg8toNkb33UWJu1iNHpICHIxp5xq1MVpfhEyx8um2CneYDy4
    WOfZvasQr0OELrx293ZYMuV+qbbU73oqkK29PHOTAP9Qmg6SRo3hRG6C5kMPwJbSz9eb
    O01g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683891444;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=3/HjLg8WC0z8XKR8q3J8WROiVeYOfFeQJrGqHDVdwzY=;
    b=p5+k55pLv40PM75YSx6prQ7IPz9yYFBFFNstwjHdfyBsOjh4SDvrKz0hhbJBq1ukow
    9Tg6Ga8UTXI5j71Np0DA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4xr137Gpot26qU4O0oDB37weYobhAHKAaiA4NsOg=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3] Fix install.sh for systemd
Date: Fri, 12 May 2023 11:36:44 +0000
Message-Id: <20230512113643.3549-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

On a fedora system, if you run `sudo sh install.sh` you break your
system. The installation clobbers /var/run, a symlink to /run.
A subsequent boot fails when /var/run and /run are different since
accesses through /var/run can't find items that now only exist in /run
and vice-versa.

Skip populating /var/run/xen during make install.
The directory is already created by some scripts. Adjust all remaining
scripts to create XEN_RUN_DIR at runtime.

Use the shell variable XEN_RUN_DIR instead of hardcoded paths.

XEN_RUN_STORED is covered by XEN_RUN_DIR because xenstored is usually
started afterwards.

Reported-by: Jason Andryuk <jandryuk@gmail.com>
Tested-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
v3: use variables, and quote variables, drop -m0700 from one mkdir call

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
index 7f7cda289f..6f429e4b0c 100644
--- a/tools/hotplug/FreeBSD/rc.d/xencommons.in
+++ b/tools/hotplug/FreeBSD/rc.d/xencommons.in
@@ -34,6 +34,7 @@ xen_startcmd()
 	local time=0
 	local timeout=30
 
+	mkdir -p "${XEN_RUN_DIR}"
 	xenstored_pid=$(check_pidfile ${XENSTORED_PIDFILE} ${XENSTORED})
 	if test -z "$xenstored_pid"; then
 		printf "Starting xenservices: xenstored, xenconsoled."
diff --git a/tools/hotplug/FreeBSD/rc.d/xendriverdomain.in b/tools/hotplug/FreeBSD/rc.d/xendriverdomain.in
index a032822e33..f487c43468 100644
--- a/tools/hotplug/FreeBSD/rc.d/xendriverdomain.in
+++ b/tools/hotplug/FreeBSD/rc.d/xendriverdomain.in
@@ -27,6 +27,7 @@ xendriverdomain_start()
 {
 	printf "Starting xenservices: xl devd."
 
+	mkdir -p "${XEN_RUN_DIR}"
 	PATH="${bindir}:${sbindir}:$PATH" ${sbindir}/xl devd --pidfile ${XLDEVD_PIDFILE} ${XLDEVD_ARGS}
 
 	printf "\n"
diff --git a/tools/hotplug/Linux/init.d/xendriverdomain.in b/tools/hotplug/Linux/init.d/xendriverdomain.in
index c63060f62a..17b381c3dc 100644
--- a/tools/hotplug/Linux/init.d/xendriverdomain.in
+++ b/tools/hotplug/Linux/init.d/xendriverdomain.in
@@ -49,6 +49,7 @@ fi
 
 do_start () {
 	echo Starting xl devd...
+	mkdir -p "${XEN_RUN_DIR}"
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
index f47b0b189c..87afc061ac 100644
--- a/tools/hotplug/NetBSD/rc.d/xendriverdomain.in
+++ b/tools/hotplug/NetBSD/rc.d/xendriverdomain.in
@@ -23,7 +23,7 @@ XLDEVD_PIDFILE="@XEN_RUN_DIR@/xldevd.pid"
 
 xendriverdomain_precmd()
 {
-	:
+	mkdir -p "${XEN_RUN_DIR}"
 }
 
 xendriverdomain_startcmd()

