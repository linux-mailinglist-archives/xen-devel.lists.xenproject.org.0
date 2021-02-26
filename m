Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 083263261A2
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 12:00:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90229.170766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFaqY-0003vt-CN; Fri, 26 Feb 2021 10:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90229.170766; Fri, 26 Feb 2021 10:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFaqY-0003vT-98; Fri, 26 Feb 2021 10:59:46 +0000
Received: by outflank-mailman (input) for mailman id 90229;
 Fri, 26 Feb 2021 10:59:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uova=H4=cert.pl=hubert.jasudowicz@srs-us1.protection.inumbo.net>)
 id 1lFaqW-0003rd-SC
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 10:59:44 +0000
Received: from mx.nask.net.pl (unknown [195.187.55.89])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa822b0b-cb6d-4cd6-bd58-8919d5d719ee;
 Fri, 26 Feb 2021 10:59:40 +0000 (UTC)
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
X-Inumbo-ID: fa822b0b-cb6d-4cd6-bd58-8919d5d719ee
From: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: [PATCH] tools: Improve signal handling in xen-vmtrace
Date: Fri, 26 Feb 2021 11:59:26 +0100
Message-Id: <26720bf5c8258e1b7b4600af3648039b5b9ee18d.1614336820.git.hubert.jasudowicz@cert.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure xen-vmtrace exits cleanly in case SIGPIPE is sent. This can
happen when piping the output to some other program.

Additionaly, add volatile qualifier to interrupted flag to avoid
it being optimized away by the compiler.

Signed-off-by: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
---
 tools/misc/xen-vmtrace.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/misc/xen-vmtrace.c b/tools/misc/xen-vmtrace.c
index 7572e880c5..e2da043058 100644
--- a/tools/misc/xen-vmtrace.c
+++ b/tools/misc/xen-vmtrace.c
@@ -43,7 +43,7 @@ static uint32_t domid, vcpu;
 static size_t size;
 static char *buf;
 
-static sig_atomic_t interrupted;
+static volatile sig_atomic_t interrupted;
 static void int_handler(int signum)
 {
     interrupted = 1;
@@ -81,6 +81,9 @@ int main(int argc, char **argv)
     if ( signal(SIGINT, int_handler) == SIG_ERR )
         err(1, "Failed to register signal handler\n");
 
+    if ( signal(SIGPIPE, int_handler) == SIG_ERR )
+        err(1, "Failed to register signal handler\n");
+
     if ( argc != 3 )
     {
         fprintf(stderr, "Usage: %s <domid> <vcpu_id>\n", argv[0]);
-- 
2.30.0


