Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D33F538901
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 00:41:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338853.563697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvo48-0007E7-Ty; Mon, 30 May 2022 22:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338853.563697; Mon, 30 May 2022 22:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvo48-0007CF-Pt; Mon, 30 May 2022 22:40:48 +0000
Received: by outflank-mailman (input) for mailman id 338853;
 Mon, 30 May 2022 22:40:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=epuh=WG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nvo47-0006Rh-LW
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 22:40:47 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b16ea55-e069-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 00:40:46 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 165395041961343.19770802633229;
 Mon, 30 May 2022 15:40:19 -0700 (PDT)
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
X-Inumbo-ID: 8b16ea55-e069-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1653950422; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HaPbuXhvTV3X6Se6zXMBzcGDRhj3MDypTXFfiWd7HBCmoEeXAbCF3BKOieyMma85KzeEcOP37uWPyTlJCT/qPU07m39QVWQ07itW3vYl+C++tHB7/x8H0evkHx1ghinfy8NOeJM88zWtdaB6etHJoqUO25CsGD2H8qADhtYtgT4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1653950422; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=C2+K4LrGQhQgI5/c0uDyjquPaNz/qaLDWh7HXB1QsBw=; 
	b=DAvVEOemHHwllNmMfxOKFgYw0cvol/HZDanJ7SB8cEeaVo1VbAvfg8UwaKyEkA8g9Hw8skFXPpuwe6PZff2AGUtc2gz7c8B+iFfqS2pcmJWHE15kg29HEq2kftZkWZk+2FYmBqnwxDzWJMqedA4l1Vi10M8tT9e8rIRnqwz3Z94=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1653950422;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=C2+K4LrGQhQgI5/c0uDyjquPaNz/qaLDWh7HXB1QsBw=;
	b=p+2ffkQ8+v9rkLWLkoI7WG7m6Y92l8Ixb2GEM+Hswve7eXqHY58klOSe1MvU6fiC
	kl3kUPOb3oRPIqKNKW3XxQ5i/VkyAXpzfOuU/jbO7FYtLx3r+e+BCITxXc1z2OGBNGy
	d4FBls6G0+n49Se8ADvVzui1096HezJsVc/kSg60=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io,
	christopher.clark@starlab.io,
	jandryuk@gmail.com,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [v2 1/3] xsm: optimize policy loading
Date: Mon, 30 May 2022 22:39:42 -0400
Message-Id: <20220531023945.22196-3-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220531023945.22196-1-dpsmith@apertussolutions.com>
References: <20220531023945.22196-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

It is possible to select a few different build configurations that results in
the unnecessary walking of the boot module list looking for a policy module.
This specifically occurs when the flask policy is enabled but either the dummy
or the SILO policy is selected as the enforcing policy. This is not ideal for
configurations like hyperlaunch and dom0less when there could be a number of
modules to be walked or unnecessary device tree lookups

This patch introduces the policy_file_required flag for tracking when an XSM
policy module requires a policy file. Only when the policy_file_required flag
is set to true will XSM search the boot modules for a policy file.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/xsm/xsm_core.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index 2286a502e3..4a29ee9558 100644
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
+    if ( policy_file_required && XSM_MAGIC )
     {
         ret = xsm_multiboot_policy_init(module_map, mbi, &policy_buffer,
                                         &policy_size);
@@ -176,7 +188,7 @@ int __init xsm_dt_init(void)
 
     printk("XSM Framework v" XSM_FRAMEWORK_VERSION " initialized\n");
 
-    if ( XSM_MAGIC )
+    if ( policy_file_required && XSM_MAGIC )
     {
         ret = xsm_dt_policy_init(&policy_buffer, &policy_size);
         if ( ret )
-- 
2.20.1


