Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BFB53962F
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 20:23:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339937.564868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw6Vd-0001UT-FB; Tue, 31 May 2022 18:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339937.564868; Tue, 31 May 2022 18:22:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw6Vd-0001Rg-AH; Tue, 31 May 2022 18:22:25 +0000
Received: by outflank-mailman (input) for mailman id 339937;
 Tue, 31 May 2022 18:22:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xfyb=WH=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nw6Vc-0001Bv-4G
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 18:22:24 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cc2d719-e10e-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 20:22:23 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1654021331693774.6960042471216;
 Tue, 31 May 2022 11:22:11 -0700 (PDT)
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
X-Inumbo-ID: 9cc2d719-e10e-11ec-837f-e5687231ffcc
ARC-Seal: i=1; a=rsa-sha256; t=1654021334; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Bvd6GbCqZn3R4EQJ81pbDxE7AZfJguAFwQqXKIsxLFjzS3vsuR4apnMRKK6GuSqQcrxtQDlasTKZb+tyVEqjUEGpN58QVWlA4wQoEgEm654DPeBE+uOjbeDrM0MAZcTWvn8B8jDCaZtYGaW1D1tNJo04AIyLK9lL5Ru+gi2nIdM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1654021334; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=KBY2xXMWGEMcMlJzy44xfoRM1aSupSi2T4p8kowrFvI=; 
	b=Oa7AGmnYeVrVnp7FXaiCqyplfhh31yIZRiV1u9h5Ark33I55CKSK8d+eHFddCjtSImVPmTQuwSKQW6RXMd82BkI9ki6qWPSb0Q1hv9ZKr8Ug/9oLpl+WiwiwJjYtdqGMfRKAIL6eFFqFGJbUiR7uNQjcsFugGBp1eM5rByz1sh8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1654021334;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=KBY2xXMWGEMcMlJzy44xfoRM1aSupSi2T4p8kowrFvI=;
	b=R5y+ohRsEVbOl5jnu31oTMSRf73GGsQx1Qt9wrzKKxonxWcddVh9MTtFSun/HXAg
	AiB15z+afNvl5443gtxKs3k4bgcFEj8dHo+OX3oGEtu94qAVzwWtKojewJjilGZiGtK
	XRpRUKNGGlbpXwnX/pQA9eIpKU7WfJuyon55nOAQ=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io,
	christopher.clark@starlab.io,
	jandryuk@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH v4 1/3] xsm: only search for a policy file when needed
Date: Tue, 31 May 2022 14:20:39 -0400
Message-Id: <20220531182041.10640-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220531182041.10640-1-dpsmith@apertussolutions.com>
References: <20220531182041.10640-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

It is possible to select a few different build configurations that results in
the unnecessary walking of the boot module list looking for a policy module.
This specifically occurs when the flask policy is enabled but either the dummy
or the SILO policy is selected as the enforcing policy. This is not ideal for
configurations like hyperlaunch and dom0less when there could be a number of
modules to be walked or doing an unnecessary device tree lookup.

This patch introduces the policy_file_required flag for tracking when an XSM
policy module requires a policy file. Only when the policy_file_required flag
is set to true, will XSM search the boot modules for a policy file.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/xsm/xsm_core.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index 2286a502e3..675e4f552c 100644
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -55,19 +55,31 @@ static enum xsm_bootparam __initdata xsm_bootparam =
     XSM_BOOTPARAM_DUMMY;
 #endif
 
+static bool __initdata policy_file_required =
+    IS_ENABLED(CONFIG_XSM_FLASK_DEFAULT);
+
 static int __init cf_check parse_xsm_param(const char *s)
 {
     int rc = 0;
 
     if ( !strcmp(s, "dummy") )
+    {
         xsm_bootparam = XSM_BOOTPARAM_DUMMY;
+        policy_file_required = false;
+    }
 #ifdef CONFIG_XSM_FLASK
     else if ( !strcmp(s, "flask") )
+    {
         xsm_bootparam = XSM_BOOTPARAM_FLASK;
+        policy_file_required = true;
+    }
 #endif
 #ifdef CONFIG_XSM_SILO
     else if ( !strcmp(s, "silo") )
+    {
         xsm_bootparam = XSM_BOOTPARAM_SILO;
+        policy_file_required = false;
+    }
 #endif
     else
         rc = -EINVAL;
@@ -148,7 +160,7 @@ int __init xsm_multiboot_init(
 
     printk("XSM Framework v" XSM_FRAMEWORK_VERSION " initialized\n");
 
-    if ( XSM_MAGIC )
+    if ( policy_file_required )
     {
         ret = xsm_multiboot_policy_init(module_map, mbi, &policy_buffer,
                                         &policy_size);
@@ -176,7 +188,7 @@ int __init xsm_dt_init(void)
 
     printk("XSM Framework v" XSM_FRAMEWORK_VERSION " initialized\n");
 
-    if ( XSM_MAGIC )
+    if ( policy_file_required )
     {
         ret = xsm_dt_policy_init(&policy_buffer, &policy_size);
         if ( ret )
-- 
2.20.1


