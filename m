Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8CB6F15E5
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 12:41:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527255.819699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psLXt-0003Z6-Gs; Fri, 28 Apr 2023 10:41:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527255.819699; Fri, 28 Apr 2023 10:41:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psLXt-0003V1-Cr; Fri, 28 Apr 2023 10:41:45 +0000
Received: by outflank-mailman (input) for mailman id 527255;
 Fri, 28 Apr 2023 10:41:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=19My=AT=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1psLXr-0002Ac-GN
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 10:41:43 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43bd335a-e5b1-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 12:41:42 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3010889c6ebso5961855f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 28 Apr 2023 03:41:42 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k6-20020a5d5246000000b002e71156b0fcsm20930378wrc.6.2023.04.28.03.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 03:41:40 -0700 (PDT)
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
X-Inumbo-ID: 43bd335a-e5b1-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1682678501; x=1685270501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+HVWSE744l3OULZh4xSGmf/1IsRnzQuhvgEnpES8XSA=;
        b=VvNQ0dal8cGrhAqkRjUQvIbeMt5it4j2BZcrWYsk7wVhfIELfqIdSPro+LY4OnhPgx
         PQ+4akxOW9Ks7zKvxEJx/YGdnvyX58FVNARVvurBA88DRgdwOybD3kMnnzQ8raD0tE1/
         3gvcwRyHPhuBd5KP7GSoy5vPDTB75jFg+PqfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682678501; x=1685270501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HVWSE744l3OULZh4xSGmf/1IsRnzQuhvgEnpES8XSA=;
        b=SvePO8iJCnRD4eovakbs2F566pSp3Pcn0oMz4XpCeTUX8oJ4cEtuTzRuFxPBQCTNrM
         pavEeSZc27o1e+Ipd85cxefIrwwk5nd/LzVGBOONoU8Q4u28GFly36kT6bgEVBex0Y2F
         FE5OIRmoaiC+E4TRdF2PqG8zMRRAUMTN7E3qXXIsEqTII+rudcmCeOwQKrPmzai5eq3+
         OAx8HW6wzZEWpeTdETxU59E+HH3kuOn7bDsvdbyDtaQuWJLckCLYdWsHcj40H51yV6DV
         rCKQ+Eqgi1hhoCjz0q0VO4Lp2qSxVTwlM6nqmZfaBrQJRf7vDybz77VOzu83OXi76cF7
         +0ng==
X-Gm-Message-State: AC+VfDweMLetR2W/qScM86FFr2TY+cXHq35rfo5zXjiAt4XZkG4qR6f9
	aOUvmpWj5qOx4tXHJHMoYCmS/xFRIrfWHOapu0s=
X-Google-Smtp-Source: ACHHUZ79L7YIHLjdQZubJbqtXhl3bN8DMD7+its5fbVq8tcieC29FXvNjK5bWE+tsktvZUY2dZeLmA==
X-Received: by 2002:adf:f583:0:b0:2ce:a30d:f764 with SMTP id f3-20020adff583000000b002cea30df764mr3347215wro.21.1682678501700;
        Fri, 28 Apr 2023 03:41:41 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 5/7] tools: Modify single-domid callers of xc_domain_getinfolist()
Date: Fri, 28 Apr 2023 11:41:22 +0100
Message-Id: <20230428104124.1044-6-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230428104124.1044-1-alejandro.vallejo@cloud.com>
References: <20230428104124.1044-1-alejandro.vallejo@cloud.com>
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
 tools/libs/light/libxl_domain.c      | 13 +++++--------
 tools/libs/light/libxl_mem.c         |  4 ++--
 tools/libs/light/libxl_sched.c       | 12 ++++--------
 tools/xenpaging/xenpaging.c          | 10 +++++-----
 6 files changed, 22 insertions(+), 39 deletions(-)

diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index 25fb716084..bd5d823581 100644
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
+        LOGED(ERROR, domid, "get domaininfo failed: %d", ret);
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
index 7f0986c185..9fa4091859 100644
--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
@@ -349,16 +349,12 @@ int libxl_domain_info(libxl_ctx *ctx, libxl_dominfo *info_r,
     int ret;
     GC_INIT(ctx);
 
-    ret = xc_domain_getinfolist(ctx->xch, domid, 1, &xcinfo);
+    ret = xc_domain_getinfo_single(ctx->xch, domid, &xcinfo);
     if (ret<0) {
-        LOGED(ERROR, domid, "Getting domain info list");
+        LOGED(ERROR, domid, "Getting domain info: %d", ret);
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
+        LOGED(ERROR, domid, "Getting dominfo: %d", rc);
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
index 7c53dc60e6..b8d0b9ccd7 100644
--- a/tools/libs/light/libxl_sched.c
+++ b/tools/libs/light/libxl_sched.c
@@ -219,13 +219,11 @@ static int sched_credit_domain_set(libxl__gc *gc, uint32_t domid,
     xc_domaininfo_t domaininfo;
     int rc;
 
-    rc = xc_domain_getinfolist(CTX->xch, domid, 1, &domaininfo);
+    rc = xc_domain_getinfo_single(CTX->xch, domid, &domaininfo);
     if (rc < 0) {
-        LOGED(ERROR, domid, "Getting domain info list");
+        LOGED(ERROR, domid, "Getting domain info: %d", rc);
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
+        LOGED(ERROR, domid, "Getting domain info: %d", rc);
         return ERROR_FAIL;
     }
-    if (rc != 1 || info.domain != domid)
-        return ERROR_INVAL;
 
     rc = xc_sched_credit2_domain_get(CTX->xch, domid, &sdom);
     if (rc != 0) {
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


