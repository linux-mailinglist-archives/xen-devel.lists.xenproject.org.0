Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 754559A584B
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:50:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822932.1236915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gd7-0007CN-QY; Mon, 21 Oct 2024 00:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822932.1236915; Mon, 21 Oct 2024 00:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gd7-0007Aa-Ml; Mon, 21 Oct 2024 00:50:41 +0000
Received: by outflank-mailman (input) for mailman id 822932;
 Mon, 21 Oct 2024 00:50:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gd6-0006SZ-C7
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:50:40 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c837f0d-8f46-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 02:50:38 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471622046365.3421362328204;
 Sun, 20 Oct 2024 17:47:02 -0700 (PDT)
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
X-Inumbo-ID: 7c837f0d-8f46-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729471624; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FBnTCKciI1qXLSfvCylWHRkTkplR4ELrfIQI8nyH/1X7lmHPI/SbwYrFzyLX36A5yd3lS+JIeruVSDZEn5rteH+C3P3tyJscSdsRGxnd6HLNh4SCtypNmWqaTyuFWddxm1teOKlglF4cBK9OHkv08bVpfruVShtJS0183J/YHHs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471624; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=W9SYyOcjZouRlsw2CUmEqIi1nilT6Qy3TrY52aUXeMg=; 
	b=DLRUpmCqKFm+g+ScIYzX5BvoR3b7nyJ9li+oSezQqi+g0tsmxHScsB0hWsaiacP/yqG7xWVuywGJO2QXmuF6xjW7PYZ24XFt+gM8OH7HmjGv/MdDa/on9VVqQQ5KPPqLmEtzzS0uAInRacfwtZlUE011k6NAnXtTlf3cszxoVNo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471624;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=W9SYyOcjZouRlsw2CUmEqIi1nilT6Qy3TrY52aUXeMg=;
	b=oVYj5Zm+wV2+cD1qWNmVcSId/gJNWioLepmtZGnBaw0V6oLDVuJsYqeMP2GnQFr+
	Ej+asYIbKQ2Ziiz/+oCqkhLwkIX9ucD4hLb6e4pvywvATHsc2izb1Jf8WUuAqFLiLK2
	mH9SseOHWCA2ve8xNhkJXgTkc9qMumruEitPfV4w=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 33/38] x86/boot: introduce domid field to struct boot_domain
Date: Sun, 20 Oct 2024 20:46:08 -0400
Message-Id: <20241021004613.18793-34-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add a domid field to struct boot_domain to hold the assigned domain id for the
domain. During initialization, ensure all instances of struct boot_domain have
the invalid domid to ensure that the domid must be set either by convention or
configuration.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/include/asm/bootdomain.h |  2 ++
 xen/arch/x86/setup.c                  | 12 +++++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
index 4285223ac5ab..d6264d554dba 100644
--- a/xen/arch/x86/include/asm/bootdomain.h
+++ b/xen/arch/x86/include/asm/bootdomain.h
@@ -11,6 +11,8 @@
 struct boot_module;
 
 struct boot_domain {
+    domid_t domid;
+
     struct boot_module *kernel;
     struct boot_module *ramdisk;
 };
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 9b2a16863eae..e6756d0ad18d 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -334,6 +334,9 @@ static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
     bi->mods[i].type = BOOTMOD_XEN;
     bi->mods[i].consumed = true;
 
+    for ( i = 0; i < MAX_NR_BOOTDOMS; i++ )
+        bi->domains[i].domid = DOMID_INVALID;
+
     return bi;
 }
 
@@ -974,7 +977,6 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     };
     struct boot_domain *bd = &bi->domains[0];
     struct domain *d;
-    domid_t domid;
 
     if ( opt_dom0_pvh )
     {
@@ -990,15 +992,15 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
     /* Create initial domain.  Not d0 for pvshim. */
-    domid = get_initial_domain_id();
-    d = domain_create(domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
+    bd->domid = get_initial_domain_id();
+    d = domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
     if ( IS_ERR(d) )
-        panic("Error creating d%u: %ld\n", domid, PTR_ERR(d));
+        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
 
     init_dom0_cpuid_policy(d);
 
     if ( alloc_dom0_vcpu0(d) == NULL )
-        panic("Error creating d%uv0\n", domid);
+        panic("Error creating d%uv0\n", bd->domid);
 
     /* Grab the DOM0 command line. */
     if ( bd->kernel->cmdline || bi->kextra )
-- 
2.30.2


