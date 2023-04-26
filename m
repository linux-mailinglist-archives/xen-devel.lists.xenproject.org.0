Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9220B6EF6FC
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 16:59:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526751.818717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prgcY-0001sV-0v; Wed, 26 Apr 2023 14:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526751.818717; Wed, 26 Apr 2023 14:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prgcX-0001kH-T6; Wed, 26 Apr 2023 14:59:49 +0000
Received: by outflank-mailman (input) for mailman id 526751;
 Wed, 26 Apr 2023 14:59:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vxt2=AR=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1prgcW-0000cE-0S
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 14:59:48 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc6d5dcd-e442-11ed-b224-6b7b168915f2;
 Wed, 26 Apr 2023 16:59:47 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2f4214b430aso4537615f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Apr 2023 07:59:47 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v17-20020a5d43d1000000b003047ea78b42sm6654116wrr.43.2023.04.26.07.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 07:59:45 -0700 (PDT)
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
X-Inumbo-ID: fc6d5dcd-e442-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1682521186; x=1685113186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFE69b1k1YkDEEzbAUbLCBpAHxB5+1bvQjqKSxJf1mg=;
        b=A6dfKjRU2kBlkF3k6zFQ5CGUQFNd8y5QcBbh4E1VQLKqfFHCtaP8ChsWRfwc00a3T7
         RnIrdBc1q78cIMLoMz1XNyvSpwriRrAPcEdHIzEqYBoJtfYC/sAkNP8dKgn+epyUPc/X
         1ezy/xnu+4O+S5R9mGElTM3WZ9moeyIBzRJVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682521186; x=1685113186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFE69b1k1YkDEEzbAUbLCBpAHxB5+1bvQjqKSxJf1mg=;
        b=UE3GT9tHdIyuyCo7n+p0Jl5co81X3HFIrrY5SKQSb+FxzPuw0Gp4KhZzaGW+nbUCt3
         9IkQOHc4RZdGka6nmF4CXdMEg+OVbZYhMVfkqpcAINv4fQeC/5svf7A62BdrSFkjcICI
         Pvg8gUnWPid8IiUSZeiZaxGHZJ7/ZO+0RlPFXgiDsypbMVdxt6ydOzMxk102so/UmRHg
         029/rLaHJ8OCzbf0IrsdDCJIQQcZkWPzZ6iDElcdOu5m++5Jb20lCJHqHZ782BaX3AOm
         GMUZBLlBlpB01s3pefTDv3tyKFgo6vov2qO9/ACqYnRQORCg1hOIwNSKvWczKODbqxdD
         UnGw==
X-Gm-Message-State: AAQBX9dMwZGSEoQLn/Mn9IJTtjYzXQkV8q2GiWsCWKPe7yukd/5SXce7
	mwB95lnZoVK76AvU9Ry+1lF61ZmSfBYg3So7lMs=
X-Google-Smtp-Source: AKy350b0GzCrgIs6zTHtQ1zyTrOSU4/QlvDF42ZbSeTg4K3j2ayVq3Lyc4fsir19OKXPyfvR0KyeYg==
X-Received: by 2002:a5d:4f81:0:b0:2fe:c0ea:18b4 with SMTP id d1-20020a5d4f81000000b002fec0ea18b4mr14994538wru.24.1682521186330;
        Wed, 26 Apr 2023 07:59:46 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 5/7] tools: Modify single-domid callers of xc_domain_getinfolist
Date: Wed, 26 Apr 2023 15:59:30 +0100
Message-Id: <20230426145932.3340-6-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230426145932.3340-1-alejandro.vallejo@cloud.com>
References: <20230426145932.3340-1-alejandro.vallejo@cloud.com>
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
---
 tools/libs/light/libxl_dom.c         | 15 +++++----------
 tools/libs/light/libxl_dom_suspend.c |  7 +------
 tools/libs/light/libxl_domain.c      | 12 ++++--------
 tools/libs/light/libxl_mem.c         |  4 ++--
 tools/libs/light/libxl_sched.c       | 12 ++++--------
 tools/xenpaging/xenpaging.c          | 14 +++++++-------
 6 files changed, 23 insertions(+), 41 deletions(-)

diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index 25fb716084..482e04b38c 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -32,8 +32,8 @@ libxl_domain_type libxl__domain_type(libxl__gc *gc, uint32_t domid)
     xc_domaininfo_t info;
     int ret;
 
-    ret = xc_domain_getinfolist(ctx->xch, domid, 1, &info);
-    if (ret != 1 || info.domain != domid) {
+    ret = xc_domain_getinfo_single(ctx->xch, domid, &info);
+    if (ret < 0) {
         LOG(ERROR, "unable to get domain type for domid=%"PRIu32, domid);
         return LIBXL_DOMAIN_TYPE_INVALID;
     }
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
+        LOGE(ERROR, "getinfo_single failed %d", ret);
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
index 7f0986c185..33ac8e9ce8 100644
--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
@@ -349,16 +349,12 @@ int libxl_domain_info(libxl_ctx *ctx, libxl_dominfo *info_r,
     int ret;
     GC_INIT(ctx);
 
-    ret = xc_domain_getinfolist(ctx->xch, domid, 1, &xcinfo);
+    ret = xc_domain_getinfo_single(ctx->xch, domid, &xcinfo);
     if (ret<0) {
-        LOGED(ERROR, domid, "Getting domain info list");
+        LOGED(ERROR, domid, "Getting domain info single");
         GC_FREE;
         return ERROR_FAIL;
     }
-    if (ret==0 || xcinfo.domain != domid) {
-        GC_FREE;
-        return ERROR_DOMAIN_NOTFOUND;
-    }
 
     if (info_r)
         libxl__xcinfo2xlinfo(ctx, &xcinfo, info_r);
@@ -1663,8 +1659,8 @@ libxl_vcpuinfo *libxl_list_vcpu(libxl_ctx *ctx, uint32_t domid,
     xc_vcpuinfo_t vcpuinfo;
     unsigned int nr_vcpus;
 
-    if (xc_domain_getinfolist(ctx->xch, domid, 1, &domaininfo) != 1) {
-        LOGED(ERROR, domid, "Getting infolist");
+    if (xc_domain_getinfo_single(ctx->xch, domid, &domaininfo) < 0) {
+        LOGED(ERROR, domid, "Getting info single");
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
index 7c53dc60e6..19da7c49ea 100644
--- a/tools/libs/light/libxl_sched.c
+++ b/tools/libs/light/libxl_sched.c
@@ -219,13 +219,11 @@ static int sched_credit_domain_set(libxl__gc *gc, uint32_t domid,
     xc_domaininfo_t domaininfo;
     int rc;
 
-    rc = xc_domain_getinfolist(CTX->xch, domid, 1, &domaininfo);
+    rc = xc_domain_getinfo_single(CTX->xch, domid, &domaininfo);
     if (rc < 0) {
-        LOGED(ERROR, domid, "Getting domain info list");
+        LOGED(ERROR, domid, "Getting domain info single");
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
-        LOGED(ERROR, domid, "Getting domain info");
+        LOGED(ERROR, domid, "Getting domain info single");
         return ERROR_FAIL;
     }
-    if (rc != 1 || info.domain != domid)
-        return ERROR_INVAL;
 
     rc = xc_sched_credit2_domain_get(CTX->xch, domid, &sdom);
     if (rc != 0) {
diff --git a/tools/xenpaging/xenpaging.c b/tools/xenpaging/xenpaging.c
index 6e5490315d..023f2bf295 100644
--- a/tools/xenpaging/xenpaging.c
+++ b/tools/xenpaging/xenpaging.c
@@ -169,10 +169,10 @@ static int xenpaging_get_tot_pages(struct xenpaging *paging)
     xc_domaininfo_t domain_info;
     int rc;
 
-    rc = xc_domain_getinfolist(xch, paging->vm_event.domain_id, 1, &domain_info);
-    if ( rc != 1 )
+    rc = xc_domain_getinfo_single(xch, paging->vm_event.domain_id, &domain_info);
+    if ( rc < 0 )
     {
-        PERROR("Error getting domain info");
+        PERROR("Error getting domain info single");
         return -1;
     }
     return domain_info.tot_pages;
@@ -424,11 +424,11 @@ static struct xenpaging *xenpaging_init(int argc, char *argv[])
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
-            PERROR("Error getting domain info");
+            PERROR("Error getting domain info single");
             goto err;
         }
 
-- 
2.34.1


