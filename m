Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2734037565F
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 17:17:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123635.233236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lefk6-000700-5s; Thu, 06 May 2021 15:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123635.233236; Thu, 06 May 2021 15:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lefk6-0006xp-2V; Thu, 06 May 2021 15:16:46 +0000
Received: by outflank-mailman (input) for mailman id 123635;
 Thu, 06 May 2021 15:16:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PObI=KB=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lefk3-0006xi-UD
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 15:16:44 +0000
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:400:200::4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba675642-be28-4a39-b110-4539c4f17dc5;
 Thu, 06 May 2021 15:16:42 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.25.6 AUTH)
 with ESMTPSA id V0bf6dx46FGa0Kh
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 6 May 2021 17:16:36 +0200 (CEST)
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
X-Inumbo-ID: ba675642-be28-4a39-b110-4539c4f17dc5
ARC-Seal: i=1; a=rsa-sha256; t=1620314197; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=cwKZhQe81ABzXHDSo3WT0bBFW2XsHz5yXsXeP8QDj9cRsmjmZ5RhhXyOgFVZaJkcM9
    DeU7B6NiAA9TbqzHJ1P6KzM2EVywGVJ7LvFsG/VK75JoDsfMilWlHEZCFMCLrdY/72Rg
    ORTqUeCEEQksFLoMoztPMCB2ZLpLOCGyvNAuw8XFCZXn+1Xwr9C1qHe6jQwLlS3F0qkI
    LS8sj4/GUx0TCaiO74MZ3Foe3lVGC88Bsv9qfAtc5tBU9A+MN+7j0whB90Whof1v33dZ
    R1x47CThm/y9GXwN+tagAlCygvL6Qkse801ulx35c5y4tRE0KtClRvyVdOl9W2meI36Y
    W2UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620314196;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=OjUaEOhqsOGb5iSgnvuCDfwpquZXnkPZgrA9fzjy+zA=;
    b=KXGau3NmXbB5ZhF7SzyXIlnnYN7JbusUeI2X6LJ/Pw+ZjamxnXtNRMXdNiW1UKIG1r
    IhBMuajtlRPLhRvt+col75jNlWCFsP+kicJSD/4wzY68oaZKprqdfFgzonXdPhZU/SiZ
    zjvXdQtqj0CoXChj9EjqN6bk7qrQoPRltLTUIyAupjW5a4yUcohQP4t6BsUOo75hTvK4
    7Z70vhUi1W0pE2q3hwpOVxvmYuW0wSMBBLVEmJpYLieMw1gKUDLQSSWNAFafOhqxzbt0
    F3UH3jK9E42/r2GBBlAscKOf5dXyFh/QJzAgRNUEGoeaQ4YigVkbZrlWU7zK2wMo6Xw+
    0OaQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620314196;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=OjUaEOhqsOGb5iSgnvuCDfwpquZXnkPZgrA9fzjy+zA=;
    b=S1pl+8AvzVp5eOPNWzl5Yl6hYN6WoWJG2nItKM/NW9RU0gfDt22Sv6idI8cHAbEDkp
    r4VeBWVLnQtPKsIXfGY4uuUZ/A7+cfqBUW3DWxUTqejik6PWQxTKA8FAz02kxiNWnR7U
    6n5fNhUqzH2692BtyYvLyG1igD7F62mWMqAJaNse638zLQYwo4/ZA6zlvSe3CrC6wd2T
    5NLZ+j291SbG8Nrk54qjBmdr3PRQ2QfOFoGxLpgRCih0XviLoG4532pl/QWrUt+IiCJB
    vXlsBYqpdooUzgnNFsV+zyx9yR27ZQAM7eMjwnxUuAIRz7Ff+M1tvcioV6CGN5GowsjG
    boLg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgtl+1b1FMstFZvCqIQN5N7TvWFg4vzhFVdoKAuQ"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] tools: remove unused sysconfig variable XENSTORED_ROOTDIR
Date: Thu,  6 May 2021 17:16:31 +0200
Message-Id: <20210506151631.1227-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sysconfig variable XENSTORED_ROOTDIR is not used anymore.
It used to point to a directory with tdb files, which is now a tmpfs.

In case the database is not in tmpfs, like on sysv and BSD systems,
xenstored will truncate existing database files during start.

Fixes commit 2ef6ace428dec4795b8b0a67fff6949e817013de

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/hotplug/FreeBSD/rc.d/xencommons.in           | 5 -----
 tools/hotplug/Linux/init.d/sysconfig.xencommons.in | 7 -------
 tools/hotplug/Linux/launch-xenstore.in             | 1 -
 tools/hotplug/NetBSD/rc.d/xencommons.in            | 5 -----
 4 files changed, 18 deletions(-)

diff --git a/tools/hotplug/FreeBSD/rc.d/xencommons.in b/tools/hotplug/FreeBSD/rc.d/xencommons.in
index 4c61d8c94e..fddcce314c 100644
--- a/tools/hotplug/FreeBSD/rc.d/xencommons.in
+++ b/tools/hotplug/FreeBSD/rc.d/xencommons.in
@@ -42,11 +42,6 @@ xen_startcmd()
 
 	xenstored_pid=$(check_pidfile ${XENSTORED_PIDFILE} ${XENSTORED})
 	if test -z "$xenstored_pid"; then
-		printf "Cleaning xenstore database.\n"
-		if [ -z "${XENSTORED_ROOTDIR}" ]; then
-			XENSTORED_ROOTDIR="@XEN_LIB_STORED@"
-		fi
-		rm -f ${XENSTORED_ROOTDIR}/tdb* >/dev/null 2>&1
 		printf "Starting xenservices: xenstored, xenconsoled."
 		XENSTORED_ARGS=" --pid-file ${XENSTORED_PIDFILE}"
 		if [ -n "${XENSTORED_TRACE}" ]; then
diff --git a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
index b059a2910d..00cf7f91d4 100644
--- a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
+++ b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
@@ -48,13 +48,6 @@ XENSTORED_ARGS=
 # Only evaluated if XENSTORETYPE is "daemon".
 #XENSTORED_TRACE=[yes|on|1]
 
-## Type: string
-## Default: "@XEN_LIB_STORED@"
-#
-# Running xenstored on XENSTORED_ROOTDIR
-# Only evaluated if XENSTORETYPE is "daemon".
-#XENSTORED_ROOTDIR=@XEN_LIB_STORED@
-
 ## Type: string
 ## Default: @LIBEXEC@/boot/xenstore-stubdom.gz
 #
diff --git a/tools/hotplug/Linux/launch-xenstore.in b/tools/hotplug/Linux/launch-xenstore.in
index fa4ea4af49..d40c66482a 100644
--- a/tools/hotplug/Linux/launch-xenstore.in
+++ b/tools/hotplug/Linux/launch-xenstore.in
@@ -66,7 +66,6 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF
 [ "$XENSTORETYPE" = "" ] && XENSTORETYPE=daemon
 
 [ "$XENSTORETYPE" = "daemon" ] && {
-	[ -z "$XENSTORED_ROOTDIR" ] && XENSTORED_ROOTDIR="@XEN_LIB_STORED@"
 	[ -z "$XENSTORED_TRACE" ] || XENSTORED_ARGS="$XENSTORED_ARGS -T @XEN_LOG_DIR@/xenstored-trace.log"
 	[ -z "$XENSTORED" ] && XENSTORED=@XENSTORED@
 	[ -x "$XENSTORED" ] || {
diff --git a/tools/hotplug/NetBSD/rc.d/xencommons.in b/tools/hotplug/NetBSD/rc.d/xencommons.in
index 80e518f5de..cf2af06596 100644
--- a/tools/hotplug/NetBSD/rc.d/xencommons.in
+++ b/tools/hotplug/NetBSD/rc.d/xencommons.in
@@ -38,11 +38,6 @@ xen_startcmd()
 
 	xenstored_pid=$(check_pidfile ${XENSTORED_PIDFILE} ${sbindir}/xenstored)
 	if test -z "$xenstored_pid"; then
-		printf "Cleaning xenstore database.\n"
-		if [ -z "${XENSTORED_ROOTDIR}" ]; then
-			XENSTORED_ROOTDIR="@XEN_LIB_STORED@"
-		fi
-		rm -f ${XENSTORED_ROOTDIR}/tdb* >/dev/null 2>&1
 		printf "Starting xenservices: xenstored, xenconsoled."
 		XENSTORED_ARGS=" --pid-file ${XENSTORED_PIDFILE}"
 		if [ -n "${XENSTORED_TRACE}" ]; then

