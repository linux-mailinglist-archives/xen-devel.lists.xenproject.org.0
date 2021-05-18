Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D06C1387A99
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 16:01:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129237.242630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj0I3-0007rE-LT; Tue, 18 May 2021 14:01:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129237.242630; Tue, 18 May 2021 14:01:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj0I3-0007nk-Gy; Tue, 18 May 2021 14:01:43 +0000
Received: by outflank-mailman (input) for mailman id 129237;
 Tue, 18 May 2021 14:01:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lj0I2-0007KH-29
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 14:01:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lj0I1-00048D-3F; Tue, 18 May 2021 14:01:41 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lj0I0-0001pY-R3; Tue, 18 May 2021 14:01:41 +0000
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
	 bh=ZHxYmRfDdLu4FrS7B9sF2TjHiGx4cl5soDoTcAWKfvw=; b=6zfceufaUl++gBaP0pT8q99oL
	HKNEExzOPGfYbj91CgLPMOapbAn4F6kieIKThFiya5uepImEnP0x90GyNZDYcUCTJgU5nsWJT67Ad
	iMja/URFk7cbgb18rQOUSYTB4kuCHtbmgwwsZDVfW7aHAGVHdO5FH8PzQx6PezUYdJBoo=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/2] tools/console: Use const whenever we point to literal strings
Date: Tue, 18 May 2021 15:01:34 +0100
Message-Id: <20210518140134.31541-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210518140134.31541-1-julien@xen.org>
References: <20210518140134.31541-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

Literal strings are not meant to be modified. So we should use const
char * rather than char * when we want to store a pointer to them.

Take the opportunity to remove the cast (char *) in console_init(). It
is unnecessary and will remove the const.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Acked-by: Wei Liu <wl@xen.org>

---
    Changes in v2:
        - Remove the cast (char *) in console_init()
        - Add Wei's acked-by
---
 tools/console/client/main.c |  4 ++--
 tools/console/daemon/io.c   | 15 ++++++++-------
 2 files changed, 10 insertions(+), 9 deletions(-)

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
index 4af27ffc5d02..200b575d76f8 100644
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
@@ -813,7 +813,8 @@ static int console_init(struct console *con, struct domain *dom, void **data)
 	int err = -1;
 	struct timespec ts;
 	struct console_type **con_type = (struct console_type **)data;
-	char *xsname, *xspath;
+	const char *xsname;
+	char *xspath;
 
 	if (clock_gettime(CLOCK_MONOTONIC, &ts) < 0) {
 		dolog(LOG_ERR, "Cannot get time of day %s:%s:L%d",
@@ -835,7 +836,7 @@ static int console_init(struct console *con, struct domain *dom, void **data)
 	con->log_suffix = (*con_type)->log_suffix;
 	con->optional = (*con_type)->optional;
 	con->use_gnttab = (*con_type)->use_gnttab;
-	xsname = (char *)(*con_type)->xsname;
+	xsname = (*con_type)->xsname;
 	xspath = xs_get_domain_path(xs, dom->domid);
 	s = realloc(xspath, strlen(xspath) +
 		    strlen(xsname) + 1);
-- 
2.17.1


