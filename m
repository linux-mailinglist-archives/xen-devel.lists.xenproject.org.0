Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 528106FCABE
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 18:07:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532309.828454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwPs2-0000yR-FK; Tue, 09 May 2023 16:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532309.828454; Tue, 09 May 2023 16:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwPs2-0000ve-Bw; Tue, 09 May 2023 16:07:22 +0000
Received: by outflank-mailman (input) for mailman id 532309;
 Tue, 09 May 2023 16:07:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kELI=A6=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1pwPs0-0000D0-4s
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 16:07:20 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 930cb8cd-ee83-11ed-b229-6b7b168915f2;
 Tue, 09 May 2023 18:07:19 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3079d2afedbso1453816f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 May 2023 09:07:19 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 z8-20020adfec88000000b003062675d4c9sm14721479wrn.39.2023.05.09.09.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 09:07:17 -0700 (PDT)
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
X-Inumbo-ID: 930cb8cd-ee83-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1683648438; x=1686240438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8CTgH7ikeYK7Qw0f3MvFSgbUxreSSzk+kEZoLhVA/0=;
        b=YWKb3TvdvmBUuHMF8qViOwDV5Q82/U3E2031GP9ctVTf9vzSwxwWo7FhUrRvgQBbKt
         1230pUK3FY99+eanU9+cUJIK2hlJaXnwTq1F3oCtHCCx1N+sALsSsancXrDq4EoLxfdg
         7jLDQNpLtHdTt0LaLUvowtcy27TrYb/qb+e9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683648438; x=1686240438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8CTgH7ikeYK7Qw0f3MvFSgbUxreSSzk+kEZoLhVA/0=;
        b=Ys55Ojvv9eUX1bcuTwJB8K80YXTmJ1fuSSnxFwEITdzG/LHnAamvAuegdCsFBpX8Y4
         jftFhvj/MahsPS90S1NHhXhIPcgiYjjqzmhNNUYrGkQ9B/YPgGb7Ie6l1uNDteXFzRi2
         IAQ6de3QaAvjQZlNF1sZpXBVchseFzw0O0w0L4pKzbaEGop9jQCUbov0FqtQH9WrdosD
         QwfvfWF406rYI5rVWkr/6L5QVikCk5RxLcdmThgpyNxW5unE3nFw2LgFfFzqlXif+yyd
         TGH/fKqDzyWYbaDbeQgytU01NMNqY0ff8W8m0sn9PSzDMT9r7Ul4uC6JHSXl51Mf1Yq+
         imMg==
X-Gm-Message-State: AC+VfDwkALi50+/lfxvajQgfZFXMEzc2oEZ7aJuXGcPqPM8Oit45rxPG
	jaFbeJJETBUZuPtjjytFofsO1jmcZ0p2TzhFj0w=
X-Google-Smtp-Source: ACHHUZ4vV84Q38n434zY8oRxhpiCROidaPnpGJBdsfSWBMNR2E8d7BwZIzd4dtGNMuVYWRch7vHH1Q==
X-Received: by 2002:adf:df0c:0:b0:307:5912:789 with SMTP id y12-20020adfdf0c000000b0030759120789mr9728753wrl.66.1683648438284;
        Tue, 09 May 2023 09:07:18 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Christian Lindig <christian.lindig@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>
Subject: [PATCH v4 1/3] tools: Modify single-domid callers of xc_domain_getinfolist()
Date: Tue,  9 May 2023 17:07:10 +0100
Message-Id: <20230509160712.11685-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230509160712.11685-1-alejandro.vallejo@cloud.com>
References: <20230509160712.11685-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xc_domain_getinfolist() internally relies on a sysctl that performs
a linear search for the domids. Many callers of xc_domain_getinfolist()
who require information about a precise domid are much better off calling
xc_domain_getinfo_single() instead, that will use the getdomaininfo domctl
instead and ensure the returned domid matches the requested one. The domtctl
will find the domid faster too, because that uses hashed lists.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Christian Lindig <christian.lindig@cloud.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Christian Lindig <christian.lindig@citrix.com>

v4:
  libxl:
    * Preserve distinction between "domain-not-found" and other errors
    * Renamed new rc variable to r, as the coding style
---
 tools/libs/light/libxl_dom.c         | 17 ++++++-----------
 tools/libs/light/libxl_dom_suspend.c |  7 +------
 tools/libs/light/libxl_domain.c      | 18 ++++++++----------
 tools/libs/light/libxl_mem.c         |  4 ++--
 tools/libs/light/libxl_sched.c       | 14 +++++---------
 tools/ocaml/libs/xc/xenctrl_stubs.c  |  6 ++----
 tools/xenpaging/xenpaging.c          | 10 +++++-----
 7 files changed, 29 insertions(+), 47 deletions(-)

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
index 7f0986c185..5ee1544d9c 100644
--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
@@ -349,15 +349,11 @@ int libxl_domain_info(libxl_ctx *ctx, libxl_dominfo *info_r,
     int ret;
     GC_INIT(ctx);
 
-    ret = xc_domain_getinfolist(ctx->xch, domid, 1, &xcinfo);
-    if (ret<0) {
-        LOGED(ERROR, domid, "Getting domain info list");
-        GC_FREE;
-        return ERROR_FAIL;
-    }
-    if (ret==0 || xcinfo.domain != domid) {
+    ret = xc_domain_getinfo_single(ctx->xch, domid, &xcinfo);
+    if (ret < 0) {
+        LOGED(ERROR, domid, "Getting domain info");
         GC_FREE;
-        return ERROR_DOMAIN_NOTFOUND;
+        return errno == ESRCH ? ERROR_DOMAIN_NOTFOUND : ERROR_FAIL;
     }
 
     if (info_r)
@@ -1657,14 +1653,16 @@ int libxl__resolve_domid(libxl__gc *gc, const char *name, uint32_t *domid)
 libxl_vcpuinfo *libxl_list_vcpu(libxl_ctx *ctx, uint32_t domid,
                                        int *nr_vcpus_out, int *nr_cpus_out)
 {
+    int r;
     GC_INIT(ctx);
     libxl_vcpuinfo *ptr, *ret;
     xc_domaininfo_t domaininfo;
     xc_vcpuinfo_t vcpuinfo;
     unsigned int nr_vcpus;
 
-    if (xc_domain_getinfolist(ctx->xch, domid, 1, &domaininfo) != 1) {
-        LOGED(ERROR, domid, "Getting infolist");
+    r = xc_domain_getinfo_single(ctx->xch, domid, &domaininfo);
+    if (r < 0) {
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
index 7c53dc60e6..841c05b0ef 100644
--- a/tools/libs/light/libxl_sched.c
+++ b/tools/libs/light/libxl_sched.c
@@ -219,13 +219,11 @@ static int sched_credit_domain_set(libxl__gc *gc, uint32_t domid,
     xc_domaininfo_t domaininfo;
     int rc;
 
-    rc = xc_domain_getinfolist(CTX->xch, domid, 1, &domaininfo);
+    rc = xc_domain_getinfo_single(CTX->xch, domid, &domaininfo);
     if (rc < 0) {
-        LOGED(ERROR, domid, "Getting domain info list");
-        return ERROR_FAIL;
+        LOGED(ERROR, domid, "Getting domain info");
+        return errno == ESRCH ? ERROR_INVAL : ERROR_FAIL;
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
-        return ERROR_FAIL;
+        return errno == ESRCH ? ERROR_INVAL : ERROR_FAIL;
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


