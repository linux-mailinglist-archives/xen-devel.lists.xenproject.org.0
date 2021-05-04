Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A37AD372A56
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 14:49:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122284.230626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lduUT-0005y6-UQ; Tue, 04 May 2021 12:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122284.230626; Tue, 04 May 2021 12:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lduUT-0005xN-Px; Tue, 04 May 2021 12:49:29 +0000
Received: by outflank-mailman (input) for mailman id 122284;
 Tue, 04 May 2021 12:49:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMRT=J7=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lduUR-0005hX-RX
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 12:49:27 +0000
Received: from mail-qk1-x72d.google.com (unknown [2607:f8b0:4864:20::72d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9cf9e786-2da6-4426-a16e-07b399763b73;
 Tue, 04 May 2021 12:49:15 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id u20so8296617qku.10
 for <xen-devel@lists.xenproject.org>; Tue, 04 May 2021 05:49:15 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:92e5:6d58:b544:4daa])
 by smtp.gmail.com with ESMTPSA id
 i11sm2355001qtv.8.2021.05.04.05.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 05:49:14 -0700 (PDT)
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
X-Inumbo-ID: 9cf9e786-2da6-4426-a16e-07b399763b73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NzGJMXzPpKRh7oGL0zGJA40Q9xjMNDkXow9gtE6yA3E=;
        b=Sup3MNbEW57h/VsmIS0kBok+uAZWBc3oAU6hzp6wCLu+3wA1dhIdbFwvmvBkh7bMy+
         Ovfp2rakfnwrj7sLKqbJGlfPPJR/9Phko11nJexPcbALlZb1QMxK56MGL8BC1VKhj+3w
         YQQEKqCbPXeMvHyIxFrj4tzMz/e6SHvlOrGO7cx4h/8o5s1ABtGQOfwdjTIJGfJzitxv
         V5dFPk7/BhOmaHa+JoKJM4PvamLMRayKXIKBF/KJw9Go8uSSAS1k+aEY+2KKBTMMCRTe
         /HQBD9+QDF0cnMkhFwqxk5I00Zrek0e0hk2nrRXLSXjSojI0JFe6AuQ4UNKEvT8z7eWY
         z8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NzGJMXzPpKRh7oGL0zGJA40Q9xjMNDkXow9gtE6yA3E=;
        b=bIY0V9Pdjdkid8La2QOLaHlRaIHIhh408+7TxtCHU1mUd54EZ7rA9MoDLxQYr22bhe
         GCbU62uMncCd7McxKL9YPypxj7IV9bNdEO1NHyZ4WG2BPoVyf8xBI5SqsK7dwiLbG+JY
         1uvTh8HZvybhE1yg9hqEh/EVIK1Lu2cRZsKum2JeA8N7S7VrmTh1VgPaD9pnZ5poWTeZ
         4NbAVCTYkcWwmBSzzJ0lhbY+aHxqypEH9+/HsRctbWRkKXXcf/KG3+l7O1O21NbW5R7Q
         7pEZz9r0cCu1aahdWsDmMtzcMbMJiRcG7fLqjsutWPjgu1WNFpimohqfaljDJob0HBIw
         Aciw==
X-Gm-Message-State: AOAM533JO9Y9I2548LdeNSHGwphOAMKIWkAIofjwz4BsYb23IuhWaxt7
	q6HtCSSvvfKWSWcjTsNpuky2KtO49jk=
X-Google-Smtp-Source: ABdhPJw4AohCj+xilj3RZmADBGUvFfvRHx+tfERd2JyoFkgLdp0H0S6qbdcoyBto7IJ6ROqHQ4eYYQ==
X-Received: by 2002:a37:745:: with SMTP id 66mr20175763qkh.5.1620132554549;
        Tue, 04 May 2021 05:49:14 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH 4/9] vtpmmgr: Allow specifying srk_handle for TPM2
Date: Tue,  4 May 2021 08:48:37 -0400
Message-Id: <20210504124842.220445-5-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210504124842.220445-1-jandryuk@gmail.com>
References: <20210504124842.220445-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bypass taking ownership of the TPM2 if an srk_handle is specified.

This srk_handle must be usable with Null auth for the time being.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 docs/man/xen-vtpmmgr.7.pod |  7 +++++++
 stubdom/vtpmmgr/init.c     | 11 ++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/docs/man/xen-vtpmmgr.7.pod b/docs/man/xen-vtpmmgr.7.pod
index 875dcce508..3286954568 100644
--- a/docs/man/xen-vtpmmgr.7.pod
+++ b/docs/man/xen-vtpmmgr.7.pod
@@ -92,6 +92,13 @@ Valid arguments:
 
 =over 4
 
+=item srk_handle=<HANDLE>
+
+Specify a srk_handle for TPM 2.0.  TPM 2.0 uses a key hierarchy, and
+this allow specifying the parent handle for vtpmmgr to create its own
+key under.  Using this option bypasses vtpmmgr trying to take ownership
+of the TPM.
+
 =item owner_auth=<AUTHSPEC>
 
 =item srk_auth=<AUTHSPEC>
diff --git a/stubdom/vtpmmgr/init.c b/stubdom/vtpmmgr/init.c
index 1506735051..c01d03e9f4 100644
--- a/stubdom/vtpmmgr/init.c
+++ b/stubdom/vtpmmgr/init.c
@@ -302,6 +302,11 @@ int parse_cmdline_opts(int argc, char** argv, struct Opts* opts)
             goto err_invalid;
          }
       }
+      else if(!strncmp(argv[i], "srk_handle:", 11)) {
+         if(sscanf(argv[i] + 11, "%x", &vtpm_globals.srk_handle) != 1) {
+            goto err_invalid;
+         }
+      }
       else if(!strncmp(argv[i], "tpmdriver=", 10)) {
          if(!strcmp(argv[i] + 10, "tpm_tis")) {
             opts->tpmdriver = TPMDRV_TPM_TIS;
@@ -586,7 +591,11 @@ TPM_RESULT vtpmmgr2_create(void)
 {
     TPM_RESULT status = TPM_SUCCESS;
 
-    TPMTRYRETURN(tpm2_take_ownership());
+    if ( vtpm_globals.srk_handle == 0 ) {
+        TPMTRYRETURN(tpm2_take_ownership());
+    } else {
+        tpm2_AuthArea_ctor(NULL, 0, &vtpm_globals.srk_auth_area);
+    }
 
    /* create SK */
     TPM2_Create_Params_out out;
-- 
2.30.2


