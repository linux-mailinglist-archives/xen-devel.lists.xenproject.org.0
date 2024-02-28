Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB7A86ADB3
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 12:40:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686490.1068618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfIIV-00069x-G9; Wed, 28 Feb 2024 11:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686490.1068618; Wed, 28 Feb 2024 11:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfIIV-00067V-DD; Wed, 28 Feb 2024 11:40:27 +0000
Received: by outflank-mailman (input) for mailman id 686490;
 Wed, 28 Feb 2024 11:40:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=29qp=KF=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1rfIIU-00067M-07
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 11:40:26 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 276c0b9b-d62e-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 12:40:21 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56648955ac5so1762943a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 03:40:21 -0800 (PST)
Received: from fhilly.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f8-20020a170906c08800b00a434b5fcab6sm1763161ejz.221.2024.02.28.03.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 03:40:19 -0800 (PST)
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
X-Inumbo-ID: 276c0b9b-d62e-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709120420; x=1709725220; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nNLtdVIFvfiAKfPmHNGfLLU4fprtE7gWwzTpMhmZat4=;
        b=UMJjXx73Tqso9CvH4hqbo+Ks+oHlgTT5ZlqjVOSxcq101nYlHjodsZ1Ty1CxwxLgOR
         NsQp8sdYY8dYV/Unrx90ofkfk55FsXBkPSojALDqTvVUadETBAVvpHiQzQotVkxLQOy2
         HvFnHltXETuaryEfhyrqfnSdkw58CPgr5ZfGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709120420; x=1709725220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nNLtdVIFvfiAKfPmHNGfLLU4fprtE7gWwzTpMhmZat4=;
        b=Mrx/bW/A8WRlt2VEDN7VEfPKrFeF7SAQCXNVtFcuvpFOhr36agfuxOKRWpueJQmeo3
         q9nRkFyigwMD8rczIdcyDKQdrDY6S4cTpISed5wk0Rltei65csVKv8y+ab23M429ehhi
         Go5EIvhNX0L90rzowYfcaCUWGJYqKvNsDvoVg3PwJ4P3bdxaKYX9642L9uEwY8CVddf4
         CJ4oQ0J7WTDG2YVZID4vcRWb7VQ0+nZDcLwLfdEIFXia9FiWqYxQLJsM8WefJP9SD8wr
         5gRQ3NICIKkSMCJs0VTg7SD4+sruMCPg84vtBDzTRQN0rUO7R6+vY5kOwy5syZ/kTnIH
         P0hA==
X-Gm-Message-State: AOJu0YyZGNj9iQvQIa6dnXsX/8Fs1OTzhVUCcwfWNzZ6vNQrzlXKwiXv
	W6If9t9oc/qh8ntJJoh1+tn3A1QYvg5gtTzYykfkdTzo22mguuniThDOTtl7LFInHd4KZdqS/Q2
	IzD0=
X-Google-Smtp-Source: AGHT+IHN0TNxsygBBurhKaAfUrRwLbCYzfsps2JeFiXVrS9eF2ZkY6PYRUlAdCJZpyDtcQqsk4DTww==
X-Received: by 2002:a17:906:e52:b0:a43:d853:98f1 with SMTP id q18-20020a1709060e5200b00a43d85398f1mr2214401eji.17.1709120420171;
        Wed, 28 Feb 2024 03:40:20 -0800 (PST)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3] tools/xentop: Add VBD3 support to xentop
Date: Wed, 28 Feb 2024 11:39:47 +0000
Message-ID: <20240228113947.57053-1-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pritha Srivastava <pritha.srivastava@citrix.com>

xl now knows how to drive tapdisk, so modify libxenstat to
understand vbd3 statistics.

Signed-off-by: Pritha Srivastava <pritha.srivastava@citrix.com>
Signed-off-by: Jorge Martin <jorge.martin@citrix.com>
Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
---
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Juergen Gross <jgross@suse.com>

v2:
- Fix order of SoB
- Fix Syntax
- Re-order free(path)

v3:
- Add const to char *vbd3_path
- Replace VBD3 type magic number with define
- Remove setting vbd.back_type
- Add comment with link to external interface
---
 tools/libs/stat/xenstat_linux.c | 65 ++++++++++++++++++++++++++++++++-
 tools/libs/stat/xenstat_priv.h  | 17 +++++++++
 tools/xentop/xentop.c           |  1 +
 3 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/tools/libs/stat/xenstat_linux.c b/tools/libs/stat/xenstat_linux.c
index cbba54aa83ee..b60e3fdcab3e 100644
--- a/tools/libs/stat/xenstat_linux.c
+++ b/tools/libs/stat/xenstat_linux.c
@@ -35,6 +35,7 @@
 #include "xenstat_priv.h"
 
 #define SYSFS_VBD_PATH "/sys/bus/xen-backend/devices"
+#define XENSTAT_VBD_TYPE_VBD3 3
 
 struct priv_data {
 	FILE *procnetdev;
@@ -390,6 +391,38 @@ void xenstat_uninit_networks(xenstat_handle * handle)
 		fclose(priv->procnetdev);
 }
 
+static int read_attributes_vbd3(const char *vbd3_path, xenstat_vbd *vbd)
+{
+	FILE *fp;
+	struct vbd3_stats vbd3_stats;
+
+	fp = fopen(vbd3_path, "rb");
+
+	if (fp == NULL) {
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
+			vbd.back_type = XENSTAT_VBD_TYPE_VBD3;
 		else
 			vbd.back_type = 0;
 
@@ -479,6 +514,34 @@ int xenstat_collect_vbds(xenstat_node * node)
 				vbd.error = 1;
 			}
 		}
+		else if (vbd.back_type == XENSTAT_VBD_TYPE_VBD3)
+		{
+			char *td3_pid;
+			char *path;
+
+			vbd.error = 0;
+
+			if (asprintf(&path, "/local/domain/0/backend/vbd3/%u/%u/kthread-pid", domid, vbd.dev) < 0)
+				continue;
+
+			td3_pid = xs_read(node->handle->xshandle, XBT_NULL, path, NULL);
+
+			free(path);
+
+			if (td3_pid == NULL)
+				continue;
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
index 4eb44a8ebb84..51ff6862cf49 100644
--- a/tools/libs/stat/xenstat_priv.h
+++ b/tools/libs/stat/xenstat_priv.h
@@ -98,6 +98,23 @@ struct xenstat_vbd {
 	unsigned long long wr_sects;
 };
 
+/* Interface provided by https://github.com/xapi-project/blktap */
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


