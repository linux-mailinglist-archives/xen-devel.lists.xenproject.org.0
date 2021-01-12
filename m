Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 666092F3800
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 19:13:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65825.116622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOAK-0003ZK-Eg; Tue, 12 Jan 2021 18:13:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65825.116622; Tue, 12 Jan 2021 18:13:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOAK-0003Yu-Au; Tue, 12 Jan 2021 18:13:12 +0000
Received: by outflank-mailman (input) for mailman id 65825;
 Tue, 12 Jan 2021 18:13:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gu5a=GP=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1kzOAI-0003Yo-TF
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 18:13:10 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0854b1e3-465d-42f9-9801-bdcd4c618ce2;
 Tue, 12 Jan 2021 18:13:08 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10CID7ae020520;
 Tue, 12 Jan 2021 19:13:07 +0100 (CET)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10CID6r3008635;
 Tue, 12 Jan 2021 19:13:06 +0100 (MET)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 9D0757218; Tue, 12 Jan 2021 19:13:06 +0100 (MET)
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
X-Inumbo-ID: 0854b1e3-465d-42f9-9801-bdcd4c618ce2
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>
Subject: [PATCH] NetBSD: Fix lock directory path
Date: Tue, 12 Jan 2021 19:12:22 +0100
Message-Id: <20210112181242.1570-2-bouyer@antioche.eu.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112181242.1570-1-bouyer@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 12 Jan 2021 19:13:07 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

From: Manuel Bouyer <bouyer@netbsd.org>

On NetBSD the lock directory is in /var/run/

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
---
 m4/paths.m4     | 2 +-
 tools/configure | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/m4/paths.m4 b/m4/paths.m4
index 89d3bb8312..1c107b1a61 100644
--- a/m4/paths.m4
+++ b/m4/paths.m4
@@ -142,7 +142,7 @@ AC_SUBST(XEN_SCRIPT_DIR)
 
 case "$host_os" in
 *freebsd*) XEN_LOCK_DIR=$localstatedir/lib ;;
-*netbsd*) XEN_LOCK_DIR=$localstatedir/lib ;;
+*netbsd*) XEN_LOCK_DIR=$rundir_path ;;
 *) XEN_LOCK_DIR=$localstatedir/lock ;;
 esac
 AC_SUBST(XEN_LOCK_DIR)
diff --git a/tools/configure b/tools/configure
index 8a708e9baa..131112c41e 100755
--- a/tools/configure
+++ b/tools/configure
@@ -4030,7 +4030,7 @@ XEN_SCRIPT_DIR=$XEN_CONFIG_DIR/scripts
 
 case "$host_os" in
 *freebsd*) XEN_LOCK_DIR=$localstatedir/lib ;;
-*netbsd*) XEN_LOCK_DIR=$localstatedir/lib ;;
+*netbsd*) XEN_LOCK_DIR=$localstatedir/run ;;
 *) XEN_LOCK_DIR=$localstatedir/lock ;;
 esac
 
-- 
2.29.2


