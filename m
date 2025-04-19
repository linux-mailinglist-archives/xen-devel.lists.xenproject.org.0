Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFF9A945C9
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:21:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960290.1352417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GZD-0008Cy-3N; Sat, 19 Apr 2025 22:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960290.1352417; Sat, 19 Apr 2025 22:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GZC-00086g-UC; Sat, 19 Apr 2025 22:21:42 +0000
Received: by outflank-mailman (input) for mailman id 960290;
 Sat, 19 Apr 2025 22:21:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GRw-0004yY-4m
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:14:12 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e101f54-1d6b-11f0-9eb0-5ba50f476ded;
 Sun, 20 Apr 2025 00:14:11 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100569215364.3088256029555;
 Sat, 19 Apr 2025 15:09:29 -0700 (PDT)
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
X-Inumbo-ID: 9e101f54-1d6b-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1745100572; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Zz7GQ4nuwfTGIzQ+RdM5u//Ii6FutWOmtiILYk1CdY41TMjriCzgHEUG8CeJI8pG/qrSOjq/3apYJkBLVAxMVWYSIfl2dIoaI9CqW3JBEr2/yKH+y51LSlrAwpEA7COyQ8rL5k+EjafJtHufEXqIDJ7WrUI56uLAm8YuGOas6qY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100572; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DZR98Y3OL3o2Z1GWDDRpwBAwXwd/c7ubteAm0GRcRwE=; 
	b=LbZm6+J64+yKmDeg9lPO4ATWTnNu0MhnmRp0Bv4RfGLuv0W/v5P3g16ZVIx/Fg7ZJPigqLPsZq81k/uBSRzmUo0rj1Q7lLrTwwO2XqTSA7/yi8YQ4pQXLKYlyMj/aMPEBIm+SB/owTuUZhtWN5mzGVQCIwrU+LKbbdHtj3p3QZ8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100572;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=DZR98Y3OL3o2Z1GWDDRpwBAwXwd/c7ubteAm0GRcRwE=;
	b=m9b0JVzaIF6mNYu1XxmpR0LcOen+l39JxViAXvrAybkEFrjB2D2MMDdDqBbGI9wI
	0V7fXPm2XL4lhyyehpBuYQ5NTFWfIrBhOXEA3ZG4wgQLIfyyOWhK/XuXRxKULbur3bU
	p/goblu0G/VEp0yMDJ3AUjYgctVzCXRVl4DNeslg=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 37/38] x86/hyperlaunch: generalize domid assignment
Date: Sat, 19 Apr 2025 18:08:19 -0400
Message-Id: <20250419220820.4234-38-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/domain-builder/fdt.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
index 9c6c0ae09a24..543a0c92adb4 100644
--- a/xen/arch/x86/domain-builder/fdt.c
+++ b/xen/arch/x86/domain-builder/fdt.c
@@ -15,6 +15,21 @@
 
 #include "fdt.h"
 
+#define MAX_DOMID  DOMID_FIRST_RESERVED
+static __initdata DECLARE_BITMAP(domid_alloc, MAX_DOMID);
+
+static domid_t find_next_domid(void)
+{
+    unsigned long n = find_next_zero_bit(domid_alloc, MAX_DOMID, 1);
+
+    if ( n == MAX_DOMID )
+        return DOMID_INVALID;
+
+    set_bit(n, domid_alloc);
+
+    return (domid_t) n;
+}
+
 /*
  * Unpacks a "reg" property into its address and size constituents.
  *
@@ -186,11 +201,21 @@ static int __init process_domain_node(
                 printk("  failed processing domain id for domain %s\n", name);
                 return -EINVAL;
             }
+
             if ( val >= DOMID_FIRST_RESERVED )
             {
-                printk("  invalid domain id for domain %s\n", name);
-                return -EINVAL;
+                if ( (val = find_next_domid()) == DOMID_INVALID )
+                {
+                    printk("  unable to allocate domid for domain %s\n", name);
+                    return -EFAULT;
+                }
             }
+            else if ( test_and_set_bit(val, domid_alloc) )
+            {
+                printk(XENLOG_ERR "ERR: domid (%d) already assigned\n", val);
+                return -EFAULT;
+            }
+
             bd->domid = (domid_t)val;
             printk("  domid: %d\n", bd->domid);
         }
-- 
2.30.2


