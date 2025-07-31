Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AFEB17012
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 13:03:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065422.1430788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhR3W-0000PK-4J; Thu, 31 Jul 2025 11:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065422.1430788; Thu, 31 Jul 2025 11:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhR3V-0000IA-Up; Thu, 31 Jul 2025 11:02:37 +0000
Received: by outflank-mailman (input) for mailman id 1065422;
 Thu, 31 Jul 2025 11:02:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8WGx=2M=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uhR3V-0000Cq-1D
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 11:02:37 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddaa52b1-6dfd-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 13:02:36 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4563cfac2d2so7340665e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 04:02:36 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589edfd950sm22600885e9.14.2025.07.31.04.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 04:02:35 -0700 (PDT)
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
X-Inumbo-ID: ddaa52b1-6dfd-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753959755; x=1754564555; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbkg0oT6VZKCfUnxjnAkivnOV11XWca7ukch8SBNm2k=;
        b=nbuyhLNvutSN1kFAl4Fr7Kvw9iq95tJnuIfRLqpOTD7kIeQ5g46bkX1m00yM+OPj72
         3IoRtIdas9OImNRdbxHlp4RA/XuHWwBpijbweahOhRrBnp2HFCDkkv8zHelKuaTtlGQ4
         GpNVrOLYDOGIlhx2FDnS+KitSDIhDimeSc3PQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753959755; x=1754564555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bbkg0oT6VZKCfUnxjnAkivnOV11XWca7ukch8SBNm2k=;
        b=VDc+xbJceXse2kZ19t65/wjmKHr8ub+dIlCYEOImvqIJET7/ci2bGtV+bqLqvoMRdV
         3I+4QT3EHIMfRTDCTcF3EBCxfmaC8N6v15qXuXzwEx0q4urHEjmDMg0ExPZn/IspsCcO
         ma02uiI9cejkqvtnq90WW7iDcrpij+99TOciGwZzJoe+Hj3RnNjuSD6xcNsx6HPfTtLb
         ySoOiuM0BPwQafq3sAoKtoHeWo+pBm49uxC0sCVri8DixIJnspj2vSJ55LAz7ARse0dv
         ywjLSvveHkFKzfaENkTi/WX7hm83cpOD0aNgCp3b1pwVdor6jN4YjBdT9/DlM2JoDJ5K
         NEvw==
X-Gm-Message-State: AOJu0YxsFJw2oobm70+S0N89geiBDS7aiCQXOVLKlDqFdFCK0B51FX4e
	CM+yoO97mZvz2vgNt8YBE1SMQy7XSSNm48hAMZSGROj7ZlmiOHLQa5xCmp/4s/6H4KxBSkAClD8
	w9OxAb/o=
X-Gm-Gg: ASbGnctUraMnLh1EvYgFoU7TPWLha9RKq3qcSBJos/iU/lmvCEeKiUdXcBfgp2S9Aus
	zrOSv6kj+LN+qhhPUjP5NCKwzENCfVtFGgh32Ypl0uEmTK+kExIf4U+iuOmFmrRqe0wbHAod2sm
	UFoG9WkdgGLxfQGM338sQ2tGvFspIC4m5ULrySKnXRECaFZTFdCoaLXRtIsfNOKcI8vmBxf/Lf1
	nsC5SVwUgUJdv6yuEQtDq0jKbhD8bkk41rJEU/co8x+/UzYG+znTb+gfktanwCDd5p0hWmjWThK
	TSNPK6hpsEc6+ZC1L7r4W+vkQ2bbArho4iFozCsFUayFnreGfXKTQbYNj7AEPWd8x7IrWNX1VAD
	dMt0r3gXMGpu2YPO7Y7N60WSGAz7HyojDS6cdAMVYApX97JcsIO8wcCyBtnAmGyKxER1+tr+g9/
	WG
X-Google-Smtp-Source: AGHT+IHJPSMMzouvQp/kM19CZqt/sIV1CT7cldLX1NoivSfHf3nwbIan9gYHj87OH40bj2fBVuJYYg==
X-Received: by 2002:a05:600c:6099:b0:456:1bca:7faf with SMTP id 5b1f17b1804b1-45892bc58c8mr73741825e9.16.1753959755539;
        Thu, 31 Jul 2025 04:02:35 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 2/2] xen/version: Remove xen_build_id() and export the variable instead
Date: Thu, 31 Jul 2025 12:02:31 +0100
Message-Id: <20250731110231.3551636-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250731110231.3551636-1-andrew.cooper3@citrix.com>
References: <20250731110231.3551636-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The API is unergonomic to use, and leads to poor code generation because of
unnecessary forcing of data to the stack.

Rename build_id_p to xen_build_id, and build_id_len to xen_build_id_len, make
them __ro_after_init, and export the variables directly.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>

Both the code diffstat, and the binary on x86 speaks for themselves:

  add/remove: 1/2 grow/shrink: 0/6 up/down: 4/-348 (-344)
  Function                                     old     new   delta
  xen_build_id_len                               -       4      +4
  build_id_len                                   4       -      -4
  build_id_p                                     8       -      -8
  xen_build_id                                  42       8     -34
  livepatch_printall                           470     432     -38
  build_id_dep                                 152     113     -39
  livepatch_op                                7930    7866     -64
  do_xen_version                              2436    2363     -73
  livepatch_op.cold                           1420    1332     -88
---
 xen/common/kernel.c       | 14 ++++----------
 xen/common/livepatch.c    | 23 ++++++++++-------------
 xen/common/version.c      | 25 +++++++------------------
 xen/include/xen/version.h |  4 +++-
 4 files changed, 24 insertions(+), 42 deletions(-)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 5be668ba855a..e6979352e100 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -510,21 +510,15 @@ static long xenver_varbuf_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     struct xen_varbuf user_str;
     const char *str = NULL;
     size_t sz;
-    int rc;
 
     switch ( cmd )
     {
     case XENVER_build_id:
-    {
-        unsigned int local_sz;
-
-        rc = xen_build_id((const void **)&str, &local_sz);
-        if ( rc )
-            return rc;
-
-        sz = local_sz;
+        str = xen_build_id;
+        sz  = xen_build_id_len;
+        if ( !sz )
+            return -ENODATA;
         goto have_len;
-    }
 
     case XENVER_extraversion2:
         str = xen_extra_version();
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 9a0df5363b59..9285f88644f4 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -475,8 +475,8 @@ static int parse_buildid(const struct livepatch_elf_sec *sec,
 
 static int check_xen_buildid(const struct livepatch_elf *elf)
 {
-    const void *id;
-    unsigned int len;
+    const void *id = xen_build_id;
+    unsigned int len = xen_build_id_len;
     struct livepatch_build_id lp_id;
     const struct livepatch_elf_sec *sec =
         livepatch_elf_sec_by_name(elf, ELF_LIVEPATCH_XEN_DEPENDS);
@@ -498,13 +498,12 @@ static int check_xen_buildid(const struct livepatch_elf *elf)
         return -EINVAL;
     }
 
-    rc = xen_build_id(&id, &len);
-    if ( rc )
+    if ( !len )
     {
         printk(XENLOG_ERR LIVEPATCH
                "%s: unable to get running Xen build-id: %d\n",
                elf->name, rc);
-        return rc;
+        return -ENODATA;
     }
 
     if ( lp_id.len != len || memcmp(id, lp_id.p, len) )
@@ -1984,7 +1983,6 @@ static int build_id_dep(struct payload *payload, bool internal)
 {
     const void *id = NULL;
     unsigned int len = 0;
-    int rc;
     const char *name = "hypervisor";
 
     ASSERT(payload->dep.len && payload->dep.p);
@@ -1992,9 +1990,10 @@ static int build_id_dep(struct payload *payload, bool internal)
     /* First time user is against hypervisor. */
     if ( internal )
     {
-        rc = xen_build_id(&id, &len);
-        if ( rc )
-            return rc;
+        id = xen_build_id;
+        len = xen_build_id_len;
+        if ( !len )
+            return -ENODATA;
     }
     else
     {
@@ -2249,14 +2248,12 @@ static const char *state2str(unsigned int state)
 static void cf_check livepatch_printall(unsigned char key)
 {
     struct payload *data;
-    const void *binary_id = NULL;
-    unsigned int len = 0;
     unsigned int i;
 
     printk("'%c' pressed - Dumping all livepatch patches\n", key);
 
-    if ( !xen_build_id(&binary_id, &len) )
-        printk("build-id: %*phN\n", len, binary_id);
+    if ( xen_build_id_len )
+        printk("build-id: %*phN\n", xen_build_id_len, xen_build_id);
 
     if ( !spin_trylock(&payload_lock) )
     {
diff --git a/xen/common/version.c b/xen/common/version.c
index 84bd77e74653..553b97ba9b3c 100644
--- a/xen/common/version.c
+++ b/xen/common/version.c
@@ -94,8 +94,8 @@ const char *xen_build_info(void)
     return build_info;
 }
 
-static const void *build_id_p __read_mostly;
-static unsigned int build_id_len __read_mostly;
+const void *__ro_after_init xen_build_id;
+unsigned int __ro_after_init xen_build_id_len;
 
 void print_version(void)
 {
@@ -106,19 +106,8 @@ void print_version(void)
 
     printk("Latest ChangeSet: %s\n", xen_changeset());
 
-    if ( build_id_len )
-        printk("build-id: %*phN\n", build_id_len, build_id_p);
-}
-
-int xen_build_id(const void **p, unsigned int *len)
-{
-    if ( !build_id_len )
-        return -ENODATA;
-
-    *len = build_id_len;
-    *p = build_id_p;
-
-    return 0;
+    if ( xen_build_id_len )
+        printk("build-id: %*phN\n", xen_build_id_len, xen_build_id);
 }
 
 #ifdef BUILD_ID
@@ -193,7 +182,7 @@ void __init xen_build_init(void)
 
     sz = (uintptr_t)__note_gnu_build_id_end - (uintptr_t)n;
 
-    rc = xen_build_id_check(n, sz, &build_id_p, &build_id_len);
+    rc = xen_build_id_check(n, sz, &xen_build_id, &xen_build_id_len);
 
 #ifdef CONFIG_X86
     /*
@@ -219,8 +208,8 @@ void __init xen_build_init(void)
 
             if ( info->cv_signature == CVINFO_PDB70_CVSIGNATURE )
             {
-                build_id_p = info->signature;
-                build_id_len = sizeof(info->signature);
+                xen_build_id = info->signature;
+                xen_build_id_len = sizeof(info->signature);
                 rc = 0;
             }
         }
diff --git a/xen/include/xen/version.h b/xen/include/xen/version.h
index 4856ad1b446d..6f5d9c956054 100644
--- a/xen/include/xen/version.h
+++ b/xen/include/xen/version.h
@@ -17,10 +17,12 @@ const char *xen_changeset(void);
 const char *xen_banner(void);
 const char *xen_deny(void);
 const char *xen_build_info(void);
-int xen_build_id(const void **p, unsigned int *len);
 
 extern char xen_cap_info[128];
 
+extern const void *xen_build_id;
+extern unsigned int xen_build_id_len; /* 0 -> No build id. */
+
 #ifdef BUILD_ID
 void xen_build_init(void);
 int xen_build_id_check(const Elf_Note *n, unsigned int n_sz,
-- 
2.39.5


