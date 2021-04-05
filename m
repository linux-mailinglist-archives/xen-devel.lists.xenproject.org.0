Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1523543DC
	for <lists+xen-devel@lfdr.de>; Mon,  5 Apr 2021 17:57:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105399.201799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRbU-0002Kk-Sx; Mon, 05 Apr 2021 15:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105399.201799; Mon, 05 Apr 2021 15:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRbU-0002Jg-Hw; Mon, 05 Apr 2021 15:57:28 +0000
Received: by outflank-mailman (input) for mailman id 105399;
 Mon, 05 Apr 2021 15:57:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTRbS-0002FR-Em
 for xen-devel@lists.xenproject.org; Mon, 05 Apr 2021 15:57:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRbR-0002oD-LU; Mon, 05 Apr 2021 15:57:25 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRbR-00053b-BX; Mon, 05 Apr 2021 15:57:25 +0000
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
	 bh=KksYVhRFyICjFP1ckAs027N7azKI8dI/+aHOnCC8ZNM=; b=MD7lFwzB7Qwcvo0bxHk/cU5DD
	RDZ8pugfP5wNpM9iE+LoFxmAAi2+x82jDVBUktTbN6r6/v2vcj9yuZjWSYgpW2W0xRNfbj9t7DzP0
	nQzHyJ7I6AWMzbE+8yGh9lZhyWHM+s2kJjj+joi1uiclMGvy7Yvo8TBfIv8mrZULTD6KY=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 06/14] tools/libs: stat: Use const whenever we point to literal strings
Date: Mon,  5 Apr 2021 16:57:05 +0100
Message-Id: <20210405155713.29754-7-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210405155713.29754-1-julien@xen.org>
References: <20210405155713.29754-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

literal strings are not meant to be modified. So we should use const
char * rather than char * when we want to store a pointer to them.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/libs/stat/xenstat_linux.c |  4 ++--
 tools/libs/stat/xenstat_qmp.c   | 12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tools/libs/stat/xenstat_linux.c b/tools/libs/stat/xenstat_linux.c
index c00b26d4d898..875a0617ade8 100644
--- a/tools/libs/stat/xenstat_linux.c
+++ b/tools/libs/stat/xenstat_linux.c
@@ -66,7 +66,7 @@ static const char PROCNETDEV_HEADER[] =
 
 /* We need to get the name of the bridge interface for use with bonding interfaces */
 /* Use excludeName parameter to avoid adding bridges we don't care about, eg. virbr0 */
-static void getBridge(char *excludeName, char *result, size_t resultLen)
+static void getBridge(const char *excludeName, char *result, size_t resultLen)
 {
 	struct dirent *de;
 	DIR *d;
@@ -113,7 +113,7 @@ static int parseNetDevLine(char *line, char *iface, unsigned long long *rxBytes,
 	int num = 19;
 
 	/* Regular exception to parse all the information from /proc/net/dev line */
-	char *regex = "([^:]*):([^ ]*)[ ]*([^ ]*)[ ]*([^ ]*)[ ]*([^ ]*)[ ]*([^ ]*)[ ]*([^ ]*)"
+	const char *regex = "([^:]*):([^ ]*)[ ]*([^ ]*)[ ]*([^ ]*)[ ]*([^ ]*)[ ]*([^ ]*)[ ]*([^ ]*)"
 			"[ ]*([^ ]*)[ ]*([^ ]*)[ ]*([^ ]*)[ ]*([^ ]*)[ ]*([^ ]*)[ ]*([^ ]*)[ ]*"
 			"([^ ]*)[ ]*([^ ]*)[ ]*([^ ]*)[ ]*([^ ]*)[ ]*([^ ]*)";
 
diff --git a/tools/libs/stat/xenstat_qmp.c b/tools/libs/stat/xenstat_qmp.c
index 0c5748ba68b3..2205a041313b 100644
--- a/tools/libs/stat/xenstat_qmp.c
+++ b/tools/libs/stat/xenstat_qmp.c
@@ -38,7 +38,7 @@
 
 #include <yajl/yajl_tree.h>
 
-static unsigned char *qmp_query(int, char *);
+static unsigned char *qmp_query(int, const char *);
 
 enum query_blockstats {
     QMP_STATS_RETURN  = 0,
@@ -80,7 +80,7 @@ enum query_block {
 static char *qmp_get_block_image(xenstat_node *node, char *qmp_devname, int qfd)
 {
 	char *tmp, *file = NULL;
-	char *query_block_cmd = "{ \"execute\": \"query-block\" }";
+	const char *query_block_cmd = "{ \"execute\": \"query-block\" }";
 	static const char *const qblock[] = {
 		[ QMP_BLOCK_RETURN  ] = "return",
 		[ QMP_BLOCK_DEVICE  ] = "device",
@@ -264,7 +264,7 @@ done:
 }
 
 /* Write a command via the QMP. Returns number of bytes written */
-static size_t qmp_write(int qfd, char *cmd, size_t cmd_len)
+static size_t qmp_write(int qfd, const char *cmd, size_t cmd_len)
 {
 	size_t pos = 0;
 	ssize_t res;
@@ -317,7 +317,7 @@ static int qmp_read(int qfd, unsigned char **qstats)
 }
 
 /* With the given cmd, query QMP for requested data. Returns allocated buffer containing data or NULL */
-static unsigned char *qmp_query(int qfd, char *cmd)
+static unsigned char *qmp_query(int qfd, const char *cmd)
 {
 	unsigned char *qstats = NULL;
 	int n;
@@ -385,8 +385,8 @@ static int qmp_connect(char *path)
 */
 static void read_attributes_qdisk_dom(xenstat_node *node, domid_t domain)
 {
-	char *cmd_mode = "{ \"execute\": \"qmp_capabilities\" }";
-	char *query_blockstats_cmd = "{ \"execute\": \"query-blockstats\" }";
+	const char *cmd_mode = "{ \"execute\": \"qmp_capabilities\" }";
+	const char *query_blockstats_cmd = "{ \"execute\": \"query-blockstats\" }";
 	unsigned char *qmp_stats, *val;
 	char path[80];
 	int qfd;
-- 
2.17.1


