Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2459A8691C9
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 14:29:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686181.1067869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rexWG-0003TO-3R; Tue, 27 Feb 2024 13:29:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686181.1067869; Tue, 27 Feb 2024 13:29:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rexWG-0003QW-0c; Tue, 27 Feb 2024 13:29:16 +0000
Received: by outflank-mailman (input) for mailman id 686181;
 Tue, 27 Feb 2024 13:29:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rG8r=KE=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1rexWE-0003ON-6T
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 13:29:14 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31c49571-d574-11ee-a1ee-f123f15fe8a2;
 Tue, 27 Feb 2024 14:29:12 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-55a5e7fa471so5747459a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Feb 2024 05:29:12 -0800 (PST)
Received: from fhilly.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f8-20020a056402194800b005648d0eebdbsm739946edz.96.2024.02.27.05.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 05:29:10 -0800 (PST)
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
X-Inumbo-ID: 31c49571-d574-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709040551; x=1709645351; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O8OPP4zUnBp0qZtUz97nx+VGwT/g+6InQ+dRne4geAI=;
        b=cQA64swXFCmnMaXsAGqlVmEelAPV+1PFyN5xNK3QrSqrAURKVe/QoreIkfhzwVVT8k
         A9L3qcPDgqviDFnuQcAxsloBILbNVAWaTlqNsYshp4E5jjn5/v40EpgY6stSNIgBMjgf
         +MzLIwMTmZLY+U9/qFiyPiaOQzFSCLoVUG7bE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709040551; x=1709645351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O8OPP4zUnBp0qZtUz97nx+VGwT/g+6InQ+dRne4geAI=;
        b=o1g8mzIjAyA6F0cBDdOVnYWM9wy8Mh6KC4Q1Z/swaRBP8HTm0jFNRIFqt61xd+s5HM
         +mw7ZUVRsBNdn183EBFLHgmVP8BQn/wND+IRo3vZ4XVBH/EVnpFu5kfFZeTvPokOQDM1
         v8qsG8+xnwOkrTIdRvV6p29LpyiPBJ1hHltqK534ycpvGrHEqnas9HXyajQH+8ib7Alw
         hGpc7lfth3d4iCX41ybBDn9cOHcvk4PuDOqc7L/+jah+ggOxcVeGqicz1ULtaIesJMGi
         v1xxYjA52kLrq/UsyS9w2KFuSnfaTu9fFlplaNP40T3qeDOLk98PBJtIxAY6E1ZsRNca
         MUVw==
X-Gm-Message-State: AOJu0YyO6rVwuMboUJcSrUUOVPkRhBNcloVIlgrw3htZVqXJXyDefE/3
	7qvzYqP9iMbLpTjO8brY+49eEZPKwP4hYOJgBGaANMosjImnZK2pji36L8LoSkH/NxFmpFt4IOO
	OYi4=
X-Google-Smtp-Source: AGHT+IGMGnZx1EQaEb4du/db3axhqXjvwFvuH3yFWHOii2P0hvfLukl9yJ5Lq4s3jlKQ94tRWdea2w==
X-Received: by 2002:a05:6402:612:b0:566:1fbd:22bb with SMTP id n18-20020a056402061200b005661fbd22bbmr2249049edv.9.1709040551191;
        Tue, 27 Feb 2024 05:29:11 -0800 (PST)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2] tools/xentop: Add VBD3 support to xentop
Date: Tue, 27 Feb 2024 13:26:28 +0000
Message-ID: <20240227132628.2157031-1-fouad.hilly@cloud.com>
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
---
 tools/libs/stat/xenstat_linux.c | 65 ++++++++++++++++++++++++++++++++-
 tools/libs/stat/xenstat_priv.h  | 16 ++++++++
 tools/xentop/xentop.c           |  1 +
 3 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/tools/libs/stat/xenstat_linux.c b/tools/libs/stat/xenstat_linux.c
index cbba54aa83ee..6d82e204aad4 100644
--- a/tools/libs/stat/xenstat_linux.c
+++ b/tools/libs/stat/xenstat_linux.c
@@ -390,6 +390,38 @@ void xenstat_uninit_networks(xenstat_handle * handle)
 		fclose(priv->procnetdev);
 }
 
+static int read_attributes_vbd3(char *vbd3_path, xenstat_vbd *vbd)
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
@@ -438,7 +470,7 @@ int xenstat_collect_vbds(xenstat_node * node)
 		int ret;
 		char buf[256];
 
-		ret = sscanf(dp->d_name, "%3s-%u-%u", buf, &domid, &vbd.dev);
+		ret = sscanf(dp->d_name, "%255[^-]-%u-%u", buf, &domid, &vbd.dev);
 		if (ret != 3)
 			continue;
 		if (!(strstr(buf, "vbd")) && !(strstr(buf, "tap")))
@@ -448,6 +480,8 @@ int xenstat_collect_vbds(xenstat_node * node)
 			vbd.back_type = 1;
 		else if (strcmp(buf,"tap") == 0)
 			vbd.back_type = 2;
+		else if (strcmp(buf,"vbd3") == 0)
+			vbd.back_type = 3;
 		else
 			vbd.back_type = 0;
 
@@ -479,6 +513,35 @@ int xenstat_collect_vbds(xenstat_node * node)
 				vbd.error = 1;
 			}
 		}
+		else if (vbd.back_type == 3)
+		{
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


