Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0AE31530F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 16:46:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83310.154705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9VD4-0001Tt-KH; Tue, 09 Feb 2021 15:45:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83310.154705; Tue, 09 Feb 2021 15:45:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9VD4-0001T9-GS; Tue, 09 Feb 2021 15:45:50 +0000
Received: by outflank-mailman (input) for mailman id 83310;
 Tue, 09 Feb 2021 15:45:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhOK=HL=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1l9VD2-0001R5-ND
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 15:45:48 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 310bbf59-db49-48f3-94bd-4b1681ac95d7;
 Tue, 09 Feb 2021 15:45:46 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.17.1 DYNA|AUTH)
 with ESMTPSA id 604447x19Fjf1k7
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 9 Feb 2021 16:45:41 +0100 (CET)
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
X-Inumbo-ID: 310bbf59-db49-48f3-94bd-4b1681ac95d7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1612885545;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
	From:Subject:Sender;
	bh=aII1TmKzcTAfe8t2sM/kmBYVk4jnNgWkXZv7CILKryQ=;
	b=GQvajl0CbHysFq2/9fJJdSsHk/hjyB3+YU30wqKdqzcC5KcQ6K1GJNvVSDTRvbUFjl
	ABn77RT+pWvpZ10/abSM/TyGiPMVXLBPtPTscubgq/Asrw9nTAQkzKJrhCmVUkNNVEQg
	+Wp8IESU45RtyiPknAQvwyyHKvYTEBEYjXVIWFuDF+K50mAwNEVn/JzH6DpJQ9J1GslE
	AvomINg+KfDIb6NtHHZJZ71ZLdjp+dFkCjUSZkMMC47nGlQge95zUjhLZVPkVJZoVXT4
	R2j51kIokX/M7GdqHf+sKAgcFa2bjqq8WDGGVBA2ui6N8LK0rwpejHtUxPavoIOF3ojq
	TZxw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3GxPjw=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210209 1/4] tools: move CONFIG_DIR and XEN_CONFIG_DIR in paths.m4
Date: Tue,  9 Feb 2021 16:45:33 +0100
Message-Id: <20210209154536.10851-2-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210209154536.10851-1-olaf@aepfle.de>
References: <20210209154536.10851-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upcoming changes need to reuse XEN_CONFIG_DIR.

In its current location the assignment happens too late. Move it up
in the file, along with CONFIG_DIR. Their only dependency is
sysconfdir, which may also be adjusted in this file.

No functional change intended.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 m4/paths.m4 | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/m4/paths.m4 b/m4/paths.m4
index 1c107b1a61..a736f57d8d 100644
--- a/m4/paths.m4
+++ b/m4/paths.m4
@@ -34,6 +34,12 @@ if test "x$sysconfdir" = 'x${prefix}/etc' ; then
     esac
 fi
 
+CONFIG_DIR=$sysconfdir
+AC_SUBST(CONFIG_DIR)
+
+XEN_CONFIG_DIR=$CONFIG_DIR/xen
+AC_SUBST(XEN_CONFIG_DIR)
+
 AC_ARG_WITH([initddir],
     AS_HELP_STRING([--with-initddir=DIR],
     [Path to directory with sysv runlevel scripts. [SYSCONFDIR/init.d]]),
@@ -128,15 +134,9 @@ AC_SUBST(XEN_LIB_DIR)
 SHAREDIR=$prefix/share
 AC_SUBST(SHAREDIR)
 
-CONFIG_DIR=$sysconfdir
-AC_SUBST(CONFIG_DIR)
-
 INITD_DIR=$initddir_path
 AC_SUBST(INITD_DIR)
 
-XEN_CONFIG_DIR=$CONFIG_DIR/xen
-AC_SUBST(XEN_CONFIG_DIR)
-
 XEN_SCRIPT_DIR=$XEN_CONFIG_DIR/scripts
 AC_SUBST(XEN_SCRIPT_DIR)
 

