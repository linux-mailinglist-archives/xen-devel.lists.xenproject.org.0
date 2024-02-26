Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D96D8677EF
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 15:13:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685557.1066450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rebin-0005Uj-8H; Mon, 26 Feb 2024 14:12:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685557.1066450; Mon, 26 Feb 2024 14:12:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rebin-0005Su-4p; Mon, 26 Feb 2024 14:12:45 +0000
Received: by outflank-mailman (input) for mailman id 685557;
 Mon, 26 Feb 2024 14:12:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w0W4=KD=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1rebim-0005SV-7x
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 14:12:44 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b757002-d4b1-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 15:12:43 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a3e75e30d36so601344766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 06:12:43 -0800 (PST)
Received: from fhilly.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k17-20020a17090666d100b00a3d8fb05c0csm2458644ejp.86.2024.02.26.06.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 06:12:42 -0800 (PST)
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
X-Inumbo-ID: 1b757002-d4b1-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708956762; x=1709561562; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b8c4sqpQaxoDgLK2yQU0ZamZW0iKh8LR8huRc0FX160=;
        b=OL4fRUlpyYEIwPdFKnLnI61dxZtsoOMkpa7FejnhStv983tjos5/DSv1w10NcTIayt
         ia9lmNyXXLuy5474icXDpsZl7/Y4gQ/p9cOD84n5kKED77vBJ5D8AMufhmEGWR8DQgsO
         qvPYarMrVuqvQ9dfVLZapkhYu+kzVxhoE/caI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708956762; x=1709561562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b8c4sqpQaxoDgLK2yQU0ZamZW0iKh8LR8huRc0FX160=;
        b=A/cbqjWzNpQe4QjOwliaXtWBrOa4BroKDPi3b9skbUlrjjcbiXGsTP6cy9Hej38L0P
         QA8/rfYGk3QblvZJCn4/c2XkDsjuxKygx3qHhOOS1hmYQBCwOydT1MXuq6F22DImx2G8
         Z4+Vz/2KcLem6gyctTEeaKdUvlRSp24pKLA84EyUygkX/UjUWX2LDRxFQtHIU0tEugRb
         rX2/M1d1OLTV3BlKMHbzmKDK/5c21uFW4ZJxSBs1XeeZ/t8GRzOLPaow6gezfMlrINd9
         Y/DQ8WHaeGI9osDaMURgH275GDLtapDkGnDJ7J/z+0xDlsteVjRXy3SH2GWCJTN602LG
         lyVw==
X-Gm-Message-State: AOJu0YwR+E7SCbIJLnkDbPILwNpdYW5DJNs09SJ+SPVwY6dLyQSvw7d6
	LaFV5E1QG3g59tOby/IYGnfThNgVbKVVjCWoWOP8i2fn1S0JPVBQDk3zFEv2ZUDHgtER3gNanah
	8i8M=
X-Google-Smtp-Source: AGHT+IGXjCUcJfbNVmjJ/5WG9SVvIEYk1LGKAQL/Ld2vUcAzRwRKuy5tBbixYXjQPZ5UVYNjeDYCiQ==
X-Received: by 2002:a17:906:12d0:b0:a43:3066:ef13 with SMTP id l16-20020a17090612d000b00a433066ef13mr2834613ejb.37.1708956762411;
        Mon, 26 Feb 2024 06:12:42 -0800 (PST)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/xentop: Add VBD3 support to xentop
Date: Mon, 26 Feb 2024 14:12:11 +0000
Message-ID: <20240226141211.1416866-1-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pritha Srivastava <pritha.srivastava@citrix.com>

xl now knows how to drive tapdisk, so modified libxenstat to
understand vbd3 statistics.

Signed-off-by: Jorge Martin <jorge.martin@citrix.com>
Signed-off-by: Pritha Srivastava <pritha.srivastava@citrix.com>
Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
---
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Juergen Gross <jgross@suse.com>
---
 tools/libs/stat/xenstat_linux.c | 69 ++++++++++++++++++++++++++++++++-
 tools/libs/stat/xenstat_priv.h  | 16 ++++++++
 tools/xentop/xentop.c           |  1 +
 3 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/tools/libs/stat/xenstat_linux.c b/tools/libs/stat/xenstat_linux.c
index cbba54aa83ee..5a4a03634182 100644
--- a/tools/libs/stat/xenstat_linux.c
+++ b/tools/libs/stat/xenstat_linux.c
@@ -390,6 +390,39 @@ void xenstat_uninit_networks(xenstat_handle * handle)
 		fclose(priv->procnetdev);
 }
 
+static int read_attributes_vbd3(char *vbd3_path, xenstat_vbd *vbd)
+{
+	FILE *fp;
+	struct vbd3_stats vbd3_stats;
+
+	fp = fopen(vbd3_path, "rb");
+
+	if (fp == NULL)
+	{
+		return -1;
+	}
+
+	if (fread(&vbd3_stats, sizeof(struct vbd3_stats), 1, fp) != 1) {
+		fclose(fp);
+		return -1;
+	}
+
+	if (vbd3_stats.version != 1) {
+		fclose(fp);
+		return -1;
+	}
+
+	vbd->oo_reqs = vbd3_stats.oo_reqs;
+	vbd->rd_reqs = vbd3_stats.read_reqs_submitted;
+	vbd->rd_sects = vbd3_stats.read_sectors;
+	vbd->wr_reqs = vbd3_stats.write_reqs_submitted;
+	vbd->wr_sects = vbd3_stats.write_sectors;
+
+	fclose(fp);
+
+	return 0;
+}
+
 static int read_attributes_vbd(const char *vbd_directory, const char *what, char *ret, int cap)
 {
 	static char file_name[80];
@@ -438,7 +471,7 @@ int xenstat_collect_vbds(xenstat_node * node)
 		int ret;
 		char buf[256];
 
-		ret = sscanf(dp->d_name, "%3s-%u-%u", buf, &domid, &vbd.dev);
+		ret = sscanf(dp->d_name, "%255[^-]-%u-%u", buf, &domid, &vbd.dev);
 		if (ret != 3)
 			continue;
 		if (!(strstr(buf, "vbd")) && !(strstr(buf, "tap")))
@@ -448,6 +481,8 @@ int xenstat_collect_vbds(xenstat_node * node)
 			vbd.back_type = 1;
 		else if (strcmp(buf,"tap") == 0)
 			vbd.back_type = 2;
+		else if (strcmp(buf,"vbd3") == 0)
+			vbd.back_type = 3;
 		else
 			vbd.back_type = 0;
 
@@ -479,6 +514,38 @@ int xenstat_collect_vbds(xenstat_node * node)
 				vbd.error = 1;
 			}
 		}
+		else if (vbd.back_type == 3)
+		{
+
+			char *td3_pid;
+			char *path;
+
+			vbd.back_type = 3;
+			vbd.error = 0;
+
+			if (asprintf(&path, "/local/domain/0/backend/vbd3/%u/%u/kthread-pid", domid, vbd.dev) < 0)
+				continue;
+
+			td3_pid = xs_read(node->handle->xshandle, XBT_NULL, path, NULL);
+
+			if (td3_pid == NULL) {
+				free(path);
+				continue;
+			}
+
+			free(path);
+
+			if (asprintf(&path, "/dev/shm/td3-%s/vbd-%u-%u", td3_pid, domid, vbd.dev) < 0) {
+				free(td3_pid);
+				continue;
+			}
+
+			if (read_attributes_vbd3(path, &vbd) < 0)
+				vbd.error = 1;
+
+			free(td3_pid);
+			free(path);
+		}
 		else
 		{
 			vbd.error = 1;
diff --git a/tools/libs/stat/xenstat_priv.h b/tools/libs/stat/xenstat_priv.h
index 4eb44a8ebb84..c3a9635240e9 100644
--- a/tools/libs/stat/xenstat_priv.h
+++ b/tools/libs/stat/xenstat_priv.h
@@ -98,6 +98,22 @@ struct xenstat_vbd {
 	unsigned long long wr_sects;
 };
 
+struct vbd3_stats {
+	uint32_t version;
+	uint32_t __pad;
+	uint64_t oo_reqs;
+	uint64_t read_reqs_submitted;
+	uint64_t read_reqs_completed;
+	uint64_t read_sectors;
+	uint64_t read_total_ticks;
+	uint64_t write_reqs_submitted;
+	uint64_t write_reqs_completed;
+	uint64_t write_sectors;
+	uint64_t write_total_ticks;
+	uint64_t io_errors;
+	uint64_t flags;
+};
+
 extern int xenstat_collect_networks(xenstat_node * node);
 extern void xenstat_uninit_networks(xenstat_handle * handle);
 extern int xenstat_collect_vbds(xenstat_node * node);
diff --git a/tools/xentop/xentop.c b/tools/xentop/xentop.c
index 0a2fab7f15a3..f5a456fd4dfd 100644
--- a/tools/xentop/xentop.c
+++ b/tools/xentop/xentop.c
@@ -1124,6 +1124,7 @@ void do_vbd(xenstat_domain *domain)
 		"Unidentified",           /* number 0 */
 		"BlkBack",           /* number 1 */
 		"BlkTap",            /* number 2 */
+		"Tapdisk3"           /* number 3 */
 	};
 
 	num_vbds = xenstat_domain_num_vbds(domain);
-- 
2.42.0


