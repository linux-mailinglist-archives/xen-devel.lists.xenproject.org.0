Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 844F8195E4A
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 20:09:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHuIz-00011X-3v; Fri, 27 Mar 2020 19:06:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FIC2=5M=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jHuIx-000118-FW
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 19:06:07 +0000
X-Inumbo-ID: 009d02a0-705e-11ea-bec1-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 009d02a0-705e-11ea-bec1-bc764e2007e4;
 Fri, 27 Mar 2020 19:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jjF1bOOYAwCDwYk7dmh1xYKDxjJ8k2AnoUufOIgOUNw=; b=qh8qt/Z9PIDY3m2Zo3lrBjqB7x
 j0YUTy7D6uXZE/UJQ8mZDEGoOv+ScZo3Jrc6VnUB1LJA2D0xBg2eLb4SZHIgqbFAxhQt4HSqdQVX2
 Zd2yrHB/IW3+H0W8Ex+i0I+ClBZC6YoMjE169sZP5gBn/ylZmrQ2jIn93tsk2/97Hl9A=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jHuIs-0000Ht-FZ; Fri, 27 Mar 2020 19:06:02 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jHuIs-0008GW-6h; Fri, 27 Mar 2020 19:06:02 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Mar 2020 19:05:45 +0000
Message-Id: <20200327190546.21580-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327190546.21580-1-julien@xen.org>
References: <20200327190546.21580-1-julien@xen.org>
Subject: [Xen-devel] [PATCH 2/3] xen/x86: ioapic: Rename
 init_ioapic_mappings() to init_ioapic()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: julien@xen.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

The function init_ioapic_mappings() is doing more than initialization
mappings. It is also initialization the number of IRQs/GSIs supported.

So rename the function to init_ioapic(). This will allow us to re-use
the name in a follow-up patch.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/x86/apic.c           | 2 +-
 xen/arch/x86/io_apic.c        | 2 +-
 xen/include/asm-x86/io_apic.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index cde67cd87e..c7a54cafc3 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -978,7 +978,7 @@ __next:
         boot_cpu_physical_apicid = get_apic_id();
     x86_cpu_to_apicid[0] = get_apic_id();
 
-    init_ioapic_mappings();
+    init_ioapic();
 }
 
 /*****************************************************************************
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 9868933287..9a11ee8342 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2537,7 +2537,7 @@ static __init bool bad_ioapic_register(unsigned int idx)
     return false;
 }
 
-void __init init_ioapic_mappings(void)
+void __init init_ioapic(void)
 {
     unsigned long ioapic_phys;
     unsigned int i, idx = FIX_IO_APIC_BASE_0;
diff --git a/xen/include/asm-x86/io_apic.h b/xen/include/asm-x86/io_apic.h
index 998905186b..8c0af4bdd3 100644
--- a/xen/include/asm-x86/io_apic.h
+++ b/xen/include/asm-x86/io_apic.h
@@ -180,7 +180,7 @@ extern int io_apic_get_version (int ioapic);
 extern int io_apic_get_redir_entries (int ioapic);
 extern int io_apic_set_pci_routing (int ioapic, int pin, int irq, int edge_level, int active_high_low);
 
-extern void init_ioapic_mappings(void);
+extern void init_ioapic(void);
 
 extern void ioapic_suspend(void);
 extern void ioapic_resume(void);
-- 
2.17.1


