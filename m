Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0BE86D51D
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 21:55:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687411.1070834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfnPl-00087p-Pn; Thu, 29 Feb 2024 20:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687411.1070834; Thu, 29 Feb 2024 20:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfnPl-00086J-N3; Thu, 29 Feb 2024 20:54:01 +0000
Received: by outflank-mailman (input) for mailman id 687411;
 Thu, 29 Feb 2024 20:54:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPQN=KG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rfnPk-00086A-6X
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 20:54:00 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8fb1c35-d744-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 21:53:59 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so2328647a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 12:53:59 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 q12-20020a056402518c00b00563ec73bbafsm927632edd.46.2024.02.29.12.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 12:53:55 -0800 (PST)
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
X-Inumbo-ID: a8fb1c35-d744-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709240037; x=1709844837; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OzsVoEciUKquuzr3WMreLrvOgFe/hTg/KGXFrUh70oQ=;
        b=iCLbPLY17sDP0n4KHjca7MHq7CuEmrqXhqykpM2wTItePWVcumyy+qNVo3qRSguv76
         JnhtW5qgLv2cO3dJ8oYblBIX3inK5T6Rtn53A4mOd7CqUPvE5A5ZFF/fwLv/9rsgVt6F
         +TqWnp6PcWWWL8npPbSp+0asFqusu/1Rz7rm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709240037; x=1709844837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OzsVoEciUKquuzr3WMreLrvOgFe/hTg/KGXFrUh70oQ=;
        b=Z8ffKKuOuRfwAgI5wu1ukqSsgQYwWC0DWCapIT2Z5fjYfQBJw5PLaHJ0NS65LvjkFC
         lluhqWOKG406E/ROgokE18+diJ8tStYwcpBAe1Jz73C9GAAvtiI+Oy/rSCTuCPsbjav6
         fZJo9TRHq546Hql+5FrFiXg0AM947KfKLS3z3fRR/VRgEduMfgoGZ3TEbDiej7mIGsnH
         btjqYgw8iFVossA3vssatJahLSbQFUuavWjtGwF5fhxkyRMxl287iCHAli7wLJI8pXT4
         XaD/BzC26UeeQhIWAH1xh1/kVnzmBu6mFX4Y1Aezdrv2n/2A3rAdU/ZAR54U+ImgYqPm
         Mh8w==
X-Gm-Message-State: AOJu0YyXDn85xwA8wNU08sUaCjXzyyqyiZ/LElhjqoOcxfF4Kq2bWWh5
	70QF6Af+0+D+XuW9Tbrp6cSq2Xp/NZk7o++r9eq3OhGhJyE15fBk7AkKALkQV7msLNUgXxWogI4
	l
X-Google-Smtp-Source: AGHT+IHABz3esixvShfI7MGbBO4iHpkL6yqv/TqMTE8Lr3+pBY+8klK0r+fLUQhwBm1eg+5Jl1u9Zg==
X-Received: by 2002:a05:6402:5203:b0:566:a4ca:2a3b with SMTP id s3-20020a056402520300b00566a4ca2a3bmr76307edd.15.1709240037267;
        Thu, 29 Feb 2024 12:53:57 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] tests/resource: Fix HVM guest in !SHADOW builds
Date: Thu, 29 Feb 2024 20:53:54 +0000
Message-Id: <20240229205354.2574207-1-andrew.cooper3@citrix.com>
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

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/tests/resource/test-resource.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tools/tests/resource/test-resource.c b/tools/tests/resource/test-resource.c
index 7ae88ea34807..2796053588d3 100644
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
@@ -172,6 +174,23 @@ static void test_domain_configurations(void)
 
         printf("Test %s\n", t->name);
 
+#if defined(__x86_64__) || defined(__i386__)
+        /*
+         * On x86, use HAP guests if possible, but skip if neither HAP nor
+         * SHADOW is available.
+         */
+        if ( t->create.flags & XEN_DOMCTL_CDF_hvm )
+        {
+            if ( physinfo.capabilities & XEN_SYSCTL_PHYSCAP_hap )
+                t->create.flags |= XEN_DOMCTL_CDF_hap;
+            else if ( !(physinfo.capabilities & XEN_SYSCTL_PHYSCAP_shadow) )
+            {
+                printf("  Skip: Neither HAP or SHADOW available\n");
+                continue;
+            }
+        }
+#endif
+
         rc = xc_domain_create(xch, &domid, &t->create);
         if ( rc )
         {
@@ -214,6 +233,8 @@ static void test_domain_configurations(void)
 
 int main(int argc, char **argv)
 {
+    int rc;
+
     printf("XENMEM_acquire_resource tests\n");
 
     xch = xc_interface_open(NULL, NULL, 0);
@@ -227,6 +248,10 @@ int main(int argc, char **argv)
     if ( !gh )
         err(1, "xengnttab_open");
 
+    rc = xc_physinfo(xch, &physinfo);
+    if ( rc )
+        err(1, "Failed to obtain physinfo");
+
     test_domain_configurations();
 
     return !!nr_failures;

base-commit: 635dd1120a01961a39dce6ad3f09692681379378
prerequisite-patch-id: 1fddefae616fa9a57ddc85bbf770e3c5bdb47b1f
prerequisite-patch-id: 50c4a201d8fa10c1797a1b17f3f2729b5787da84
prerequisite-patch-id: 4b4799fae62b5f41b9b0d2078e8b081605341a0a
-- 
2.30.2


