Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE0B6F425F
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 13:13:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528511.821778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptnx8-0003d1-87; Tue, 02 May 2023 11:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528511.821778; Tue, 02 May 2023 11:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptnx8-0003bG-4b; Tue, 02 May 2023 11:13:50 +0000
Received: by outflank-mailman (input) for mailman id 528511;
 Tue, 02 May 2023 11:13:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=87GZ=AX=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1ptnx6-0003LR-EJ
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 11:13:48 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 681b89b1-e8da-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 13:13:46 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-306342d7668so790669f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 May 2023 04:13:46 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e5-20020a5d5005000000b0030469635629sm25685459wrt.62.2023.05.02.04.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 04:13:44 -0700 (PDT)
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
X-Inumbo-ID: 681b89b1-e8da-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1683026025; x=1685618025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJB458iJtLEmTYey1jxDUVCpJXePcaStPPsd47NEdBU=;
        b=Q0aQ2HbKVXh5yJ7uUaV235VFVGz5+dWaAOea//8omPCY0h+znmuO0LgbauEITZX4H8
         J2gTW9FAy9o6wI2bHlCz5Mav1cC/GcLcF9vDuGqCfvh+HwP2vMGUIfMYD7Nb+pc33TNa
         OeIRTGNh38yLJADH0wb8vvWi6+eePVWkByR9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683026025; x=1685618025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJB458iJtLEmTYey1jxDUVCpJXePcaStPPsd47NEdBU=;
        b=ClD6hS61XeuzP1Hg+GBzEhpj3YKUlTLLQfIvUmYFV7oBHb7uRib6Yd+9lmXs3+VZvs
         DFWzUS/n9ZFoWQI1adIRCQKqt2XAix3xexgFnTik9FV8QrCzmAGhW5ynnWydY6YXEzRj
         ceNCTJFTrs59RvsRK2SKroTA+ZDZCU4vkfKp8LYiIpN1vQuLgJCQPlQ9war49+g5gJ6U
         iNm1OPpgxGeZl0ZGV8pSeNXCBxTaJepNUQj0LWYCmghsUtrRRfSGa7byvIEDFOTzZUo3
         N9dUrZZIpWUF4LR9tsHuTBaL+hyg4HLVkIxJLvlZGLYZHrL+rloAdjt5fa4B3rlQAhRQ
         O19Q==
X-Gm-Message-State: AC+VfDw8hQ9T06xb8KkW2rRp3fTXiCySUtPwXU6uBXWiJdb+xYXxzhEx
	ggqoS8v0kplF1R9A719wd+39RMjc9/j7s8JyCy4=
X-Google-Smtp-Source: ACHHUZ60duR1pheaga52MURiXLFcnhkK4Bv1d6HQdAP8fJOZPhDkYfo+dpoMpdaXlaBpau0mcGksNw==
X-Received: by 2002:adf:e944:0:b0:306:284c:8f4c with SMTP id m4-20020adfe944000000b00306284c8f4cmr6164633wrn.64.1683026025509;
        Tue, 02 May 2023 04:13:45 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>
Subject: [PATCH v3 1/3] tools: Modify single-domid callers of xc_domain_getinfolist()
Date: Tue,  2 May 2023 12:13:36 +0100
Message-Id: <20230502111338.16757-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502111338.16757-1-alejandro.vallejo@cloud.com>
References: <20230502111338.16757-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xc_domain_getinfolist() internally relies on a sysctl that performs
a linear search for the domids. Many callers of xc_domain_getinfolist()
who require information about a precise domid are much better off calling
xc_domain_getinfo_single() instead, that will use the getdomaininfo domctl
instead and ensure the returned domid matches the requested one. The domtctl
will find the domid faster too, because that uses hashed lists.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Christian Lindig <christian.lindig@citrix.com>

v3:
 * Replaced single-domid xc_domain_getinfolist() call in ocaml stub with
   xc_domain_getinfo_single()
---
 tools/libs/light/libxl_dom.c         | 17 ++++++-----------
 tools/libs/light/libxl_dom_suspend.c |  7 +------
 tools/libs/light/libxl_domain.c      | 13 +++++--------
 tools/libs/light/libxl_mem.c         |  4 ++--
 tools/libs/light/libxl_sched.c       | 10 +++-------
 tools/ocaml/libs/xc/xenctrl_stubs.c  |  6 ++----
 tools/xenpaging/xenpaging.c          | 10 +++++-----
 7 files changed, 24 insertions(+), 43 deletions(-)

diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index 25fb716084..94fef37401 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -32,9 +32,9 @@ libxl_domain_type libxl__domain_type(libxl__gc *gc, uint32_t domid)
     xc_domaininfo_t info;
     int ret;
 
-    ret = xc_domain_getinfolist(ctx->xch, domid, 1, &info);
-    if (ret != 1 || info.domain != domid) {
-        LOG(ERROR, "unable to get domain type for domid=%"PRIu32, domid);
+    ret = xc_domain_getinfo_single(ctx->xch, domid, &info);
+    if (ret < 0) {
+        LOGED(ERROR, domid, "unable to get dominfo");
         return LIBXL_DOMAIN_TYPE_INVALID;
     }
     if (info.flags & XEN_DOMINF_hvm_guest) {
@@ -70,15 +70,10 @@ int libxl__domain_cpupool(libxl__gc *gc, uint32_t domid)
     xc_domaininfo_t info;
     int ret;
 
-    ret = xc_domain_getinfolist(CTX->xch, domid, 1, &info);
-    if (ret != 1)
+    ret = xc_domain_getinfo_single(CTX->xch, domid, &info);
+    if (ret < 0)
     {
-        LOGE(ERROR, "getinfolist failed %d", ret);
-        return ERROR_FAIL;
-    }
-    if (info.domain != domid)
-    {
-        LOGE(ERROR, "got info for dom%d, wanted dom%d\n", info.domain, domid);
+        LOGED(ERROR, domid, "get domaininfo failed");
         return ERROR_FAIL;
     }
     return info.cpupool;
diff --git a/tools/libs/light/libxl_dom_suspend.c b/tools/libs/light/libxl_dom_suspend.c
index 4fa22bb739..6091a5f3f6 100644
--- a/tools/libs/light/libxl_dom_suspend.c
+++ b/tools/libs/light/libxl_dom_suspend.c
@@ -332,13 +332,8 @@ static void suspend_common_wait_guest_check(libxl__egc *egc,
     /* Convenience aliases */
     const uint32_t domid = dsps->domid;
 
-    ret = xc_domain_getinfolist(CTX->xch, domid, 1, &info);
+    ret = xc_domain_getinfo_single(CTX->xch, domid, &info);
     if (ret < 0) {
-        LOGED(ERROR, domid, "unable to check for status of guest");
-        goto err;
-    }
-
-    if (!(ret == 1 && info.domain == domid)) {
         LOGED(ERROR, domid, "guest we were suspending has been destroyed");
         goto err;
     }
diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
index 7f0986c185..5709b3e62f 100644
--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
@@ -349,16 +349,12 @@ int libxl_domain_info(libxl_ctx *ctx, libxl_dominfo *info_r,
     int ret;
     GC_INIT(ctx);
 
-    ret = xc_domain_getinfolist(ctx->xch, domid, 1, &xcinfo);
+    ret = xc_domain_getinfo_single(ctx->xch, domid, &xcinfo);
     if (ret<0) {
-        LOGED(ERROR, domid, "Getting domain info list");
+        LOGED(ERROR, domid, "Getting domain info");
         GC_FREE;
         return ERROR_FAIL;
     }
-    if (ret==0 || xcinfo.domain != domid) {
-        GC_FREE;
-        return ERROR_DOMAIN_NOTFOUND;
-    }
 
     if (info_r)
         libxl__xcinfo2xlinfo(ctx, &xcinfo, info_r);
@@ -1657,14 +1653,15 @@ int libxl__resolve_domid(libxl__gc *gc, const char *name, uint32_t *domid)
 libxl_vcpuinfo *libxl_list_vcpu(libxl_ctx *ctx, uint32_t domid,
                                        int *nr_vcpus_out, int *nr_cpus_out)
 {
+    int rc;
     GC_INIT(ctx);
     libxl_vcpuinfo *ptr, *ret;
     xc_domaininfo_t domaininfo;
     xc_vcpuinfo_t vcpuinfo;
     unsigned int nr_vcpus;
 
-    if (xc_domain_getinfolist(ctx->xch, domid, 1, &domaininfo) != 1) {
-        LOGED(ERROR, domid, "Getting infolist");
+    if ((rc = xc_domain_getinfo_single(ctx->xch, domid, &domaininfo)) < 0) {
+        LOGED(ERROR, domid, "Getting dominfo");
         GC_FREE;
         return NULL;
     }
diff --git a/tools/libs/light/libxl_mem.c b/tools/libs/light/libxl_mem.c
index 92ec09f4cf..44e554adba 100644
--- a/tools/libs/light/libxl_mem.c
+++ b/tools/libs/light/libxl_mem.c
@@ -323,8 +323,8 @@ retry_transaction:
     libxl__xs_printf(gc, t, GCSPRINTF("%s/memory/target", dompath),
                      "%"PRIu64, new_target_memkb);
 
-    r = xc_domain_getinfolist(ctx->xch, domid, 1, &info);
-    if (r != 1 || info.domain != domid) {
+    r = xc_domain_getinfo_single(ctx->xch, domid, &info);
+    if (r < 0) {
         abort_transaction = 1;
         rc = ERROR_FAIL;
         goto out;
diff --git a/tools/libs/light/libxl_sched.c b/tools/libs/light/libxl_sched.c
index 7c53dc60e6..21a65442c0 100644
--- a/tools/libs/light/libxl_sched.c
+++ b/tools/libs/light/libxl_sched.c
@@ -219,13 +219,11 @@ static int sched_credit_domain_set(libxl__gc *gc, uint32_t domid,
     xc_domaininfo_t domaininfo;
     int rc;
 
-    rc = xc_domain_getinfolist(CTX->xch, domid, 1, &domaininfo);
+    rc = xc_domain_getinfo_single(CTX->xch, domid, &domaininfo);
     if (rc < 0) {
-        LOGED(ERROR, domid, "Getting domain info list");
+        LOGED(ERROR, domid, "Getting domain info");
         return ERROR_FAIL;
     }
-    if (rc != 1 || domaininfo.domain != domid)
-        return ERROR_INVAL;
 
     rc = xc_sched_credit_domain_get(CTX->xch, domid, &sdom);
     if (rc != 0) {
@@ -426,13 +424,11 @@ static int sched_credit2_domain_set(libxl__gc *gc, uint32_t domid,
     xc_domaininfo_t info;
     int rc;
 
-    rc = xc_domain_getinfolist(CTX->xch, domid, 1, &info);
+    rc = xc_domain_getinfo_single(CTX->xch, domid, &info);
     if (rc < 0) {
         LOGED(ERROR, domid, "Getting domain info");
         return ERROR_FAIL;
     }
-    if (rc != 1 || info.domain != domid)
-        return ERROR_INVAL;
 
     rc = xc_sched_credit2_domain_get(CTX->xch, domid, &sdom);
     if (rc != 0) {
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 6ec9ed6d1e..f686db3124 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -497,10 +497,8 @@ CAMLprim value stub_xc_domain_getinfo(value xch_val, value domid)
 	xc_domaininfo_t info;
 	int ret;
 
-	ret = xc_domain_getinfolist(xch, Int_val(domid), 1, &info);
-	if (ret != 1)
-		failwith_xc(xch);
-	if (info.domain != Int_val(domid))
+	ret = xc_domain_getinfo_single(xch, Int_val(domid), &info);
+	if (ret < 0)
 		failwith_xc(xch);
 
 	result = alloc_domaininfo(&info);
diff --git a/tools/xenpaging/xenpaging.c b/tools/xenpaging/xenpaging.c
index 6e5490315d..c7a9a82477 100644
--- a/tools/xenpaging/xenpaging.c
+++ b/tools/xenpaging/xenpaging.c
@@ -169,8 +169,8 @@ static int xenpaging_get_tot_pages(struct xenpaging *paging)
     xc_domaininfo_t domain_info;
     int rc;
 
-    rc = xc_domain_getinfolist(xch, paging->vm_event.domain_id, 1, &domain_info);
-    if ( rc != 1 )
+    rc = xc_domain_getinfo_single(xch, paging->vm_event.domain_id, &domain_info);
+    if ( rc < 0 )
     {
         PERROR("Error getting domain info");
         return -1;
@@ -424,9 +424,9 @@ static struct xenpaging *xenpaging_init(int argc, char *argv[])
     /* Get max_pages from guest if not provided via cmdline */
     if ( !paging->max_pages )
     {
-        rc = xc_domain_getinfolist(xch, paging->vm_event.domain_id, 1,
-                                   &domain_info);
-        if ( rc != 1 )
+        rc = xc_domain_getinfo_single(xch, paging->vm_event.domain_id,
+                                      &domain_info);
+        if ( rc < 0 )
         {
             PERROR("Error getting domain info");
             goto err;
-- 
2.34.1


