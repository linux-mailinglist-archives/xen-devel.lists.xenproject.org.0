Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2C486E0ED
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 13:13:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687638.1071344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg1lH-0005tF-HX; Fri, 01 Mar 2024 12:13:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687638.1071344; Fri, 01 Mar 2024 12:13:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg1lH-0005rk-EH; Fri, 01 Mar 2024 12:13:11 +0000
Received: by outflank-mailman (input) for mailman id 687638;
 Fri, 01 Mar 2024 12:13:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=do9M=KH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rg1lG-0005rc-7z
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 12:13:10 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1136c420-d7c5-11ee-afd8-a90da7624cb6;
 Fri, 01 Mar 2024 13:13:09 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-566e869f631so251541a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 01 Mar 2024 04:13:09 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 s23-20020a170906a19700b00a44899a44ddsm576876ejy.11.2024.03.01.04.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 04:13:06 -0800 (PST)
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
X-Inumbo-ID: 1136c420-d7c5-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709295187; x=1709899987; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bCG8qbxo0n9jYqxMu9sKHaRmzAkZKyYUQZHqWoBMWN4=;
        b=tRMJ7u6g1d3YRUY2y20bfn5l4D8/AD+Fq1VTYfrAPbRyeX5OfDoFW/VWgR533SCIQ6
         tam4B6z5uijA8ZeqXur/GGb6jmkEEMgxZQ1p+jF7UOqVliBS4YoNUhAkM1gBiFxpdm0u
         M7CIHbxXqfSYUNnZg1ZcnIRPZ8qbFTOIhFPfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709295187; x=1709899987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bCG8qbxo0n9jYqxMu9sKHaRmzAkZKyYUQZHqWoBMWN4=;
        b=he5nvk0uVRjngyZS9tpYW3jd0TszS80z2SGwrCcmbqaeXe4xoC1Ggth/lBofiCM/GD
         jbt0p7OcvMzmBHcysbUZnTTbeYHvtY7/sIu8MhhrvETe6QiXL6r6a9UMBkgOR090JS01
         6E6HN7ty8hNZSWHod+khhDYAIEQlOS7TPFwW3NaZ3duFa9YebiGRHDVlPBWKKA/NZABq
         eOA2HAwtyUnqscQs6+eT357UsDGSkQ0CvXE8xO9Myjw2B2S8nCbEW9o7mTSFYTrIDz4b
         lMQG0bl1SgHStCNENYGHQV7SgkeCGrrSMvxkMMx85hb8/C38qvVaOlS//HK/Q5xrVpTh
         au5w==
X-Gm-Message-State: AOJu0YxhSDbAESjTkjlpACKbfLd1JvB18aYDYPVLWUELcY+2GPhAYW73
	Tn8huE6MhoHavaKaiDHWtKtPXBlI0G0DKnc3Nwel1WSWVFYlOqSbiBtu0zfz+c+ywwsO2Ol5Xxc
	L
X-Google-Smtp-Source: AGHT+IFd3YQWAm7qoo5X1tJlATEebI+ePrJbrqQHhZWfvEg/6/kEVDSXa+AcdX+MxZjW1Ba8X1OPyw==
X-Received: by 2002:a17:906:7d6:b0:a43:88c0:7729 with SMTP id m22-20020a17090607d600b00a4388c07729mr1193092ejc.56.1709295187311;
        Fri, 01 Mar 2024 04:13:07 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] tests/resource: Fix HVM guest in !SHADOW builds
Date: Fri,  1 Mar 2024 12:13:04 +0000
Message-Id: <20240301121304.2661077-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Right now, test-resource always creates HVM Shadow guests.  But if Xen has
SHADOW compiled out, running the test yields:

  $./test-resource
  XENMEM_acquire_resource tests
  Test x86 PV
    Created d1
    Test grant table
  Test x86 PVH
    Skip: 95 - Operation not supported

and doesn't really test HVM guests, but doesn't fail either.

There's nothing paging-mode-specific about this test, so default to HAP if
possible and provide a more specific message if neither HAP or Shadow are
available.

As we've got physinfo to hand, also provide more specific message about the
absence of PV or HVM support.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Also check XEN_SYSCTL_PHYSCAP_{hvm,pv}
---
 tools/tests/resource/test-resource.c | 39 ++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tools/tests/resource/test-resource.c b/tools/tests/resource/test-resource.c
index 7ae88ea34807..1b10be16a6b4 100644
--- a/tools/tests/resource/test-resource.c
+++ b/tools/tests/resource/test-resource.c
@@ -20,6 +20,8 @@ static xc_interface *xch;
 static xenforeignmemory_handle *fh;
 static xengnttab_handle *gh;
 
+static xc_physinfo_t physinfo;
+
 static void test_gnttab(uint32_t domid, unsigned int nr_frames,
                         unsigned long gfn)
 {
@@ -172,6 +174,37 @@ static void test_domain_configurations(void)
 
         printf("Test %s\n", t->name);
 
+#if defined(__x86_64__) || defined(__i386__)
+        if ( t->create.flags & XEN_DOMCTL_CDF_hvm )
+        {
+            if ( !(physinfo.capabilities & XEN_SYSCTL_PHYSCAP_hvm) )
+            {
+                printf("  Skip: HVM not available\n");
+                continue;
+            }
+
+            /*
+             * On x86, use HAP guests if possible, but skip if neither HAP nor
+             * SHADOW is available.
+             */
+            if ( physinfo.capabilities & XEN_SYSCTL_PHYSCAP_hap )
+                t->create.flags |= XEN_DOMCTL_CDF_hap;
+            else if ( !(physinfo.capabilities & XEN_SYSCTL_PHYSCAP_shadow) )
+            {
+                printf("  Skip: Neither HAP or SHADOW available\n");
+                continue;
+            }
+        }
+        else
+        {
+            if ( !(physinfo.capabilities & XEN_SYSCTL_PHYSCAP_pv) )
+            {
+                printf("  Skip: PV not available\n");
+                continue;
+            }
+        }
+#endif
+
         rc = xc_domain_create(xch, &domid, &t->create);
         if ( rc )
         {
@@ -214,6 +247,8 @@ static void test_domain_configurations(void)
 
 int main(int argc, char **argv)
 {
+    int rc;
+
     printf("XENMEM_acquire_resource tests\n");
 
     xch = xc_interface_open(NULL, NULL, 0);
@@ -227,6 +262,10 @@ int main(int argc, char **argv)
     if ( !gh )
         err(1, "xengnttab_open");
 
+    rc = xc_physinfo(xch, &physinfo);
+    if ( rc )
+        err(1, "Failed to obtain physinfo");
+
     test_domain_configurations();
 
     return !!nr_failures;
-- 
2.30.2


