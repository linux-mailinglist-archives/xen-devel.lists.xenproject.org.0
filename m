Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 413AB704AA9
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 12:33:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535080.832716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyryP-0001s5-Hm; Tue, 16 May 2023 10:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535080.832716; Tue, 16 May 2023 10:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyryP-0001pq-F0; Tue, 16 May 2023 10:32:05 +0000
Received: by outflank-mailman (input) for mailman id 535080;
 Tue, 16 May 2023 09:14:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Peq8=BF=geekplace.eu=flo@srs-se1.protection.inumbo.net>)
 id 1pyqkq-0000c5-Il
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 09:14:00 +0000
Received: from zulu.geekplace.eu (zulu.geekplace.eu [2a03:4000:6:3a8::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fda74b68-f3c9-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 11:13:59 +0200 (CEST)
Received: from neo-pc.sch (unknown [62.27.195.158])
 by zulu.geekplace.eu (Postfix) with ESMTPA id 161854A0B05;
 Tue, 16 May 2023 11:13:58 +0200 (CEST)
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
X-Inumbo-ID: fda74b68-f3c9-11ed-b229-6b7b168915f2
From: Florian Schmaus <flo@geekplace.eu>
To: xen-devel@lists.xenproject.org
Cc: Florian Schmaus <flo@geekplace.eu>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] m4/ptyfuncs.m4 tools/configure: add linux headers for pty functions
Date: Tue, 16 May 2023 11:13:55 +0200
Message-Id: <20230516091355.721398-1-flo@geekplace.eu>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To avoid implicit function declarations, which will cause an error on
modern compilers. See https://wiki.gentoo.org/wiki/Modern_C_porting

Downstream Gentoo bug: https://bugs.gentoo.org/904449

Signed-off-by: Florian Schmaus <flo@geekplace.eu>
---
 m4/ptyfuncs.m4  | 3 +++
 tools/configure | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/m4/ptyfuncs.m4 b/m4/ptyfuncs.m4
index 3e37b5a23c8b..d1a2208398e3 100644
--- a/m4/ptyfuncs.m4
+++ b/m4/ptyfuncs.m4
@@ -19,6 +19,9 @@ AC_DEFUN([AX_CHECK_PTYFUNCS], [
             AC_LINK_IFELSE([AC_LANG_SOURCE([
 #ifdef INCLUDE_LIBUTIL_H
 #include INCLUDE_LIBUTIL_H
+#else
+#include <pty.h>
+#include <utmp.h>
 #endif
 int main(void) {
   openpty(0,0,0,0,0);
diff --git a/tools/configure b/tools/configure
index 5df30df9b35c..01f57b20c318 100755
--- a/tools/configure
+++ b/tools/configure
@@ -9002,6 +9002,9 @@ See \`config.log' for more details" "$LINENO" 5; }
 
 #ifdef INCLUDE_LIBUTIL_H
 #include INCLUDE_LIBUTIL_H
+#else
+#include <pty.h>
+#include <utmp.h>
 #endif
 int main(void) {
   openpty(0,0,0,0,0);
-- 
2.39.3


