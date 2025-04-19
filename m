Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A964A945CB
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:22:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960330.1352446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GZS-0002Y6-2F; Sat, 19 Apr 2025 22:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960330.1352446; Sat, 19 Apr 2025 22:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GZR-0002Sk-Rs; Sat, 19 Apr 2025 22:21:57 +0000
Received: by outflank-mailman (input) for mailman id 960330;
 Sat, 19 Apr 2025 22:21:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GPQ-0007X1-Fi
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:11:36 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40babaa4-1d6b-11f0-9ffb-bf95429c2676;
 Sun, 20 Apr 2025 00:11:34 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 174510053179615.787663375016223;
 Sat, 19 Apr 2025 15:08:51 -0700 (PDT)
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
X-Inumbo-ID: 40babaa4-1d6b-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1745100552; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GrUmxwIQbCQBJMf/yiaan/zO7WBRye4DEKlFfIdQjMq7a0ptUOFlJqs5pRCkKHPJ3syhE93a19sQZU1iwGHaxBLP1eM3NltNwWwJtsV6vDWGe0bUT0TkGUfNxZdG1x+JeH1Cor5nCkLpHp/8cqxK3XSpDJ4Atq8XjJTk5Ypv5S8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100552; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ygLJ+ZFCfoz7loFx0eKO6lgsPYvnY/xYVSqzyygRmuE=; 
	b=bPT5yBqlCkGdnxZKUMwlLfs3fWKCOlQAL7oEkcjn3KdgeBVlQhFBlxoh3j8ho+5SB7eyRIRqlQ8ly4VWhM4vGwTuPEjGTXO0SDJ0ekOstfu/+08ow3TDU/ki/Hcuo1t1P/zPjEVFoTnI8m6N7czETZTazUDj1IdBQurOETh4Ua8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100552;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=ygLJ+ZFCfoz7loFx0eKO6lgsPYvnY/xYVSqzyygRmuE=;
	b=D/csDoOiJcHTeytXMVvP+aTGC1cBWBVDr5I31ACab/vDV/I0P/2mnmutKMvkA+mE
	tVRqSDW6QUuLcoK0i9uCJpveMPlEfs7coSUGxK5AKc1PfvtOBVoGPRa6Lq/H1GUCR1h
	HZzDIB3Nax33VsovnEN3Sr5lBR1KoA7fxNU6nCMQ=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 15/38] x86/hyperlaunch: move iommu init to domain builder
Date: Sat, 19 Apr 2025 18:07:57 -0400
Message-Id: <20250419220820.4234-16-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Move invocation of iommu_hwdom_init() to dom_construct_pvh() and guard it
with a hardware domain check.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/hvm/dom0_build.c | 2 --
 xen/arch/x86/hvm/dom_build.c  | 4 ++++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 4a371dfd66d7..a68474b7856a 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -1305,8 +1305,6 @@ int __init dom0_construct_pvh(struct boot_domain *bd)
     struct domain *d = bd->d;
     int rc;
 
-    iommu_hwdom_init(d);
-
     rc = pvh_populate_p2m(d);
     if ( rc )
     {
diff --git a/xen/arch/x86/hvm/dom_build.c b/xen/arch/x86/hvm/dom_build.c
index 05064ae9ba96..7fa007a6926d 100644
--- a/xen/arch/x86/hvm/dom_build.c
+++ b/xen/arch/x86/hvm/dom_build.c
@@ -9,6 +9,7 @@
  */
 
 #include <xen/acpi.h>
+#include <xen/iommu.h>
 #include <xen/init.h>
 #include <xen/softirq.h>
 #include <xen/types.h>
@@ -92,6 +93,9 @@ int __init dom_construct_pvh(struct boot_domain *bd)
      */
     pvh_init_p2m(bd);
 
+    if ( is_hardware_domain(bd->d) )
+        iommu_hwdom_init(bd->d);
+
     return dom0_construct_pvh(bd);
 }
 
-- 
2.30.2


