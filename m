Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 212A22D9F2D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 19:36:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52380.91580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshF-0001po-O7; Mon, 14 Dec 2020 18:35:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52380.91580; Mon, 14 Dec 2020 18:35:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshF-0001ox-Ao; Mon, 14 Dec 2020 18:35:45 +0000
Received: by outflank-mailman (input) for mailman id 52380;
 Mon, 14 Dec 2020 16:36:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nuho=FS=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1koqqA-0006vN-IE
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 16:36:50 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b64aa07-f16c-437c-8ee1-cbd63850eb72;
 Mon, 14 Dec 2020 16:36:34 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0BEGaW2U004851;
 Mon, 14 Dec 2020 17:36:32 +0100 (CET)
Received: from borneo.soc.lip6.fr (borneo [132.227.103.47])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 0BEGaWEe015623;
 Mon, 14 Dec 2020 17:36:32 +0100 (MET)
Received: by borneo.soc.lip6.fr (Postfix, from userid 373)
 id AA212AAC65; Mon, 14 Dec 2020 17:36:32 +0100 (MET)
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
X-Inumbo-ID: 0b64aa07-f16c-437c-8ee1-cbd63850eb72
From: Manuel Bouyer <bouyer@netbsd.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>
Subject: [PATCH 01/24] Fix lock directory path for NetBSD
Date: Mon, 14 Dec 2020 17:36:00 +0100
Message-Id: <20201214163623.2127-2-bouyer@netbsd.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201214163623.2127-1-bouyer@netbsd.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 14 Dec 2020 17:36:32 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

---
 m4/paths.m4 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.28.0


