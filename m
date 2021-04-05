Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD5D3543E3
	for <lists+xen-devel@lfdr.de>; Mon,  5 Apr 2021 17:57:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105402.201835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRbY-0002VR-VC; Mon, 05 Apr 2021 15:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105402.201835; Mon, 05 Apr 2021 15:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRbY-0002T5-KY; Mon, 05 Apr 2021 15:57:32 +0000
Received: by outflank-mailman (input) for mailman id 105402;
 Mon, 05 Apr 2021 15:57:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTRbV-0002OA-Qm
 for xen-devel@lists.xenproject.org; Mon, 05 Apr 2021 15:57:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRbV-0002oY-3V; Mon, 05 Apr 2021 15:57:29 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRbU-00053b-RZ; Mon, 05 Apr 2021 15:57:29 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=UgMhryuGQDNF+IkibD7yNt0PjYxYcwu1lo/PGDlCLKY=; b=bK51hyrcTT4viBqIAN1cWJGfC
	wDeFEzPJc59SCRpH4goiKY8qLNzgak/3/yWAPp2fjlQ9lW7KuFNoY4jzspPaP1t6GwB6rUSdOvqpg
	Owg7mfSgH7KOQZAOK0O0XUR62ee/usQYpI9yOoglRBSfzkeKH1Y0WXik9zTTeH6PVtzaY=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 09/14] tools/console: Use const whenever we point to literal strings
Date: Mon,  5 Apr 2021 16:57:08 +0100
Message-Id: <20210405155713.29754-10-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210405155713.29754-1-julien@xen.org>
References: <20210405155713.29754-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

literal strings are not meant to be modified. So we should use const
char * rather than char * when we want to store a pointer to them.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/console/client/main.c |  4 ++--
 tools/console/daemon/io.c   | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/console/client/main.c b/tools/console/client/main.c
index 088be28dff02..80157be42144 100644
--- a/tools/console/client/main.c
+++ b/tools/console/client/main.c
@@ -325,7 +325,7 @@ int main(int argc, char **argv)
 {
 	struct termios attr;
 	int domid;
-	char *sopt = "hn:";
+	const char *sopt = "hn:";
 	int ch;
 	unsigned int num = 0;
 	int opt_ind=0;
@@ -345,7 +345,7 @@ int main(int argc, char **argv)
 	char *end;
 	console_type type = CONSOLE_INVAL;
 	bool interactive = 0;
-	char *console_names = "serial, pv, vuart";
+	const char *console_names = "serial, pv, vuart";
 
 	while((ch = getopt_long(argc, argv, sopt, lopt, &opt_ind)) != -1) {
 		switch(ch) {
diff --git a/tools/console/daemon/io.c b/tools/console/daemon/io.c
index 4af27ffc5d02..6a8a94e31b65 100644
--- a/tools/console/daemon/io.c
+++ b/tools/console/daemon/io.c
@@ -87,14 +87,14 @@ struct buffer {
 };
 
 struct console {
-	char *ttyname;
+	const char *ttyname;
 	int master_fd;
 	int master_pollfd_idx;
 	int slave_fd;
 	int log_fd;
 	struct buffer buffer;
 	char *xspath;
-	char *log_suffix;
+	const char *log_suffix;
 	int ring_ref;
 	xenevtchn_handle *xce_handle;
 	int xce_pollfd_idx;
@@ -109,9 +109,9 @@ struct console {
 };
 
 struct console_type {
-	char *xsname;
-	char *ttyname;
-	char *log_suffix;
+	const char *xsname;
+	const char *ttyname;
+	const char *log_suffix;
 	bool optional;
 	bool use_gnttab;
 };
-- 
2.17.1


