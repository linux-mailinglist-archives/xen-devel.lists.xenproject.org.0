Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F301BA9278
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 14:08:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132744.1471037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Cfn-0000Ey-0Y; Mon, 29 Sep 2025 12:08:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132744.1471037; Mon, 29 Sep 2025 12:08:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Cfm-0000Bm-Ow; Mon, 29 Sep 2025 12:08:06 +0000
Received: by outflank-mailman (input) for mailman id 1132744;
 Mon, 29 Sep 2025 12:08:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1v3Cfk-0008MS-Uh
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 12:08:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1v3Cfk-00GXBl-20;
 Mon, 29 Sep 2025 12:08:04 +0000
Received: from [2a01:cb15:80df:da00:e2a9:ff82:7bde:38cd] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1v3Cfk-004JHo-27;
 Mon, 29 Sep 2025 12:08:04 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=fd7IuQgDa95R64KYB4tblr0/98vW3XrqIHcr4eD97H4=; b=X203g5Yaxw9Ll+3MS5VUb9EOPi
	w5Q0flPWQK2T15TGrMdaV33NAB4xY5urY6whyNrUQ2EvLO0pzsNQ18lYaAs2LlVUMiiewvGOZ0vpf
	iFpihfU64n9aPKFtXy2ADhSU4ioWSLgaVSOytyYFxtZRQHhehyp2gvzm0+MaHXwJZEvk=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH v2 6/8] tools/libxenstat: Use json-c when available
Date: Mon, 29 Sep 2025 14:07:54 +0200
Message-ID: <20250929120756.46075-7-anthony@xenproject.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250929120756.46075-1-anthony@xenproject.org>
References: <20250929120756.46075-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

This is mainly a copy of the existing code in yajl and use json-c
instead.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---

Notes:
    v2:
    - use new $(XEN_JSON_LIBS)

 tools/libs/stat/Makefile      |   2 +-
 tools/libs/stat/xenstat_qmp.c | 126 ++++++++++++++++++++++++++++++++--
 2 files changed, 120 insertions(+), 8 deletions(-)

diff --git a/tools/libs/stat/Makefile b/tools/libs/stat/Makefile
index a968eaff48..3151ee9f12 100644
--- a/tools/libs/stat/Makefile
+++ b/tools/libs/stat/Makefile
@@ -24,7 +24,7 @@ OBJS-$(CONFIG_SunOS) += xenstat_solaris.o
 OBJS-$(CONFIG_NetBSD) += xenstat_netbsd.o
 OBJS-$(CONFIG_FreeBSD) += xenstat_freebsd.o
 
-LDLIBS-y += -lyajl
+LDLIBS-y += $(XEN_JSON_LIBS)
 LDLIBS-$(CONFIG_SunOS) += -lkstat
 LDLIBS += $(LDLIBS-y)
 
diff --git a/tools/libs/stat/xenstat_qmp.c b/tools/libs/stat/xenstat_qmp.c
index 9909b9727e..21e321fffa 100644
--- a/tools/libs/stat/xenstat_qmp.c
+++ b/tools/libs/stat/xenstat_qmp.c
@@ -24,6 +24,10 @@
 
 #include "xenstat_priv.h"
 
+#ifdef HAVE_LIBJSONC
+#include <json-c/json.h>
+
+#elif defined(HAVE_LIBYAJL)
 #ifdef HAVE_YAJL_YAJL_VERSION_H
 #  include <yajl/yajl_version.h>
 #endif
@@ -32,11 +36,13 @@
 #if defined(YAJL_MAJOR) && (YAJL_MAJOR > 1)
 #  define HAVE_YAJL_V2 1
 #endif
+#endif
 
 #ifdef HAVE_YAJL_V2
-
 #include <yajl/yajl_tree.h>
+#endif
 
+#if defined(HAVE_LIBJSONC) || defined(HAVE_YAJL_V2)
 static unsigned char *qmp_query(int, const char *);
 
 enum query_blockstats {
@@ -76,9 +82,10 @@ enum query_block {
             "type": 'str'
           }]}
 */
-static char *qmp_get_block_image(xenstat_node *node, char *qmp_devname, int qfd)
+static char *qmp_get_block_image(xenstat_node *node, const char *qmp_devname, int qfd)
 {
-	char *tmp, *file = NULL;
+	const char *tmp;
+	char *file = NULL;
 	const char *query_block_cmd = "{ \"execute\": \"query-block\" }";
 	static const char *const qblock[] = {
 		[ QMP_BLOCK_RETURN  ] = "return",
@@ -88,13 +95,56 @@ static char *qmp_get_block_image(xenstat_node *node, char *qmp_devname, int qfd)
 	};
 	const char *ptr[] = {0, 0};
 	unsigned char *qmp_stats;
-	yajl_val info, ret_obj, dev_obj, n;
 	int i;
 
 	if ((qmp_stats = qmp_query(qfd, query_block_cmd)) == NULL)
 		return NULL;
 
+#ifdef HAVE_LIBJSONC
+	json_object *jso;
+	enum json_tokener_error error;
+	jso = json_tokener_parse_verbose((const char *)qmp_stats, &error);
+	free(qmp_stats);
+	if (jso == NULL)
+		return NULL;
+
+	ptr[0] = qblock[QMP_BLOCK_RETURN]; /* "return" */
+	json_object *ret_jso = json_object_object_get(jso, ptr[0]);
+	if (ret_jso == NULL)
+		goto done;
+
+	for (i=0; i<json_object_array_length(ret_jso); i++) {
+		json_object *n = json_object_array_get_idx(ret_jso, i);
+
+		ptr[0] = qblock[QMP_BLOCK_DEVICE]; /* "device" */
+		json_object *dev_jso = json_object_object_get(n, ptr[0]);
+		if (dev_jso) {
+			tmp = json_object_get_string(dev_jso);
+			if (!tmp || strcmp(qmp_devname, tmp))
+				continue;
+		} else {
+			continue;
+		}
+
+		ptr[0] = qblock[QMP_INSERTED]; /* "inserted" */
+		n = json_object_object_get(n, ptr[0]);
+		if (n) {
+			ptr[0] = qblock[QMP_FILE]; /* "file" */
+			n = json_object_object_get(n, ptr[0]);
+			if (n && json_object_is_type(n, json_type_string)) {
+				tmp = json_object_get_string(n);
+				file = malloc(strlen(tmp)+1);
+				if (file != NULL)
+					strcpy(file, tmp);
+				goto done;
+			}
+		}
+	}
+done:
+	json_object_put(jso);
+#elif defined(HAVE_LIBYAJL)
 	/* Use libyajl version 2.0.3 or newer for the tree parser feature with bug fixes */
+	yajl_val info, ret_obj, dev_obj, n;
 	info = yajl_tree_parse((char *)qmp_stats, NULL, 0);
 	free(qmp_stats);
 	if (info == NULL)
@@ -132,12 +182,13 @@ static char *qmp_get_block_image(xenstat_node *node, char *qmp_devname, int qfd)
 	}
 done:
 	yajl_tree_free(info);
+#endif
 	return file;
 }
 
 
 /* Given a QMP device name, lookup the associated xenstore qdisk device id */
-static void lookup_xenstore_devid(xenstat_node * node, unsigned int domid, char *qmp_devname,
+static void lookup_xenstore_devid(xenstat_node * node, unsigned int domid, const char *qmp_devname,
 	int qfd, unsigned int *dev, unsigned int *sector_size)
 {
 	char **dev_ids, *tmp, *ptr, *image, path[80];
@@ -191,7 +242,7 @@ static void lookup_xenstore_devid(xenstat_node * node, unsigned int domid, char
 /* Parse the stats buffer which contains I/O data for all the disks belonging to domid */
 static void qmp_parse_stats(xenstat_node *node, unsigned int domid, unsigned char *stats_buf, int qfd)
 {
-	char *qmp_devname;
+	const char *qmp_devname;
 	static const char *const qstats[] = {
 		[ QMP_STATS_RETURN  ] = "return",
 		[ QMP_STATS_DEVICE  ] = "device",
@@ -202,12 +253,72 @@ static void qmp_parse_stats(xenstat_node *node, unsigned int domid, unsigned cha
 		[ QMP_WR_OPERATIONS ] = "wr_operations",
 	};
 	const char *ptr[] = {0, 0};
-	yajl_val info, ret_obj, stats_obj, n;
 	xenstat_vbd vbd;
 	xenstat_domain *domain;
 	unsigned int sector_size = 512;
 	int i, j;
 
+#ifdef HAVE_LIBJSONC
+	json_object *jso, *ret_jso, *stats_obj, *n;
+	enum json_tokener_error error;
+
+	jso = json_tokener_parse_verbose((const char *)stats_buf, &error);
+	if (jso == NULL)
+		return;
+
+	ptr[0] = qstats[QMP_STATS_RETURN]; /* "return" */
+	ret_jso = json_object_object_get(jso, ptr[0]);
+	if (ret_jso == NULL)
+		goto done;
+
+	/* Array of devices */
+	for (i=0; i<json_object_array_length(ret_jso); i++) {
+		memset(&vbd, 0, sizeof(xenstat_vbd));
+		qmp_devname = NULL;
+		stats_obj = json_object_array_get_idx(ret_jso, i);
+
+		ptr[0] = qstats[QMP_STATS_DEVICE]; /* "device" */
+		n = json_object_object_get(stats_obj, ptr[0]);
+		if (n)
+			qmp_devname = json_object_get_string(n);
+
+		ptr[0] = qstats[QMP_STATS]; /* "stats" */
+		stats_obj = json_object_object_get(stats_obj, ptr[0]);
+		if (stats_obj && json_object_is_type(stats_obj, json_type_object)) {
+			for (j=3; j<7; j++) {
+				ptr[0] = qstats[j];
+				n = json_object_object_get(stats_obj, ptr[0]);
+				if (n && json_object_is_type(n, json_type_int)) {
+					switch(j) {
+					case QMP_RD_BYTES: /* "rd_bytes" */
+						vbd.rd_sects = json_object_get_int64(n) / sector_size;
+						break;
+					case QMP_WR_BYTES: /* "wr_bytes" */
+						vbd.wr_sects = json_object_get_int64(n) / sector_size;
+						break;
+					case QMP_RD_OPERATIONS: /* "rd_operations" */
+						vbd.rd_reqs = json_object_get_int64(n);
+						break;
+					case QMP_WR_OPERATIONS: /* "wr_operations" */
+						vbd.wr_reqs = json_object_get_int64(n);
+						break;
+					}
+				}
+			}
+			/* With the QMP device name, lookup the xenstore qdisk device ID and set vdb.dev */
+			if (qmp_devname)
+				lookup_xenstore_devid(node, domid, qmp_devname, qfd, &vbd.dev, &sector_size);
+			if ((domain = xenstat_node_domain(node, domid)) == NULL)
+				continue;
+			if ((xenstat_save_vbd(domain, &vbd)) == NULL)
+				goto done;
+		}
+	}
+done:
+	json_object_put(jso);
+#elif defined(HAVE_LIBYAJL)
+	yajl_val info, ret_obj, stats_obj, n;
+
 	/* Use libyajl version 2.0.3 or newer for the tree parser feature */
 	if ((info = yajl_tree_parse((char *)stats_buf, NULL, 0)) == NULL)
 		return;
@@ -260,6 +371,7 @@ static void qmp_parse_stats(xenstat_node *node, unsigned int domid, unsigned cha
 	}
 done:
 	yajl_tree_free(info);
+#endif
 }
 
 /* Write a command via the QMP. Returns number of bytes written */
-- 
Anthony PERARD


