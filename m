Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D128019E474
	for <lists+xen-devel@lfdr.de>; Sat,  4 Apr 2020 12:27:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKg13-00007m-OV; Sat, 04 Apr 2020 10:27:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7qE9=5U=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jKg12-00007c-35
 for xen-devel@lists.xenproject.org; Sat, 04 Apr 2020 10:27:04 +0000
X-Inumbo-ID: d34b573c-765e-11ea-83d8-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d34b573c-765e-11ea-83d8-bc764e2007e4;
 Sat, 04 Apr 2020 10:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tfFVWRUSZu9j4nuBTdDQtZgNGvWVZ0KeLmsF37oncn4=; b=lYSb1LSDsK4LQLRmC/221C9uaQ
 cpIoJrN20CpRgoVrxhB1I0hcGplKKYi862PDbJ03iBd8wBb0oxv7+5V4dXKhW3bwQeJbN+1FdQfPQ
 15qKvMlcn/wYP834CWsFI5XkyoJdzW0gKv71V5xzdiHUxQVXGBilRtAbemEoDtSosrgQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKg10-0005AO-2Z; Sat, 04 Apr 2020 10:27:02 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKg0z-0005h7-Os; Sat, 04 Apr 2020 10:27:02 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 2/3] xen/x86: ioapic: Rename init_ioapic_mappings() to
 ioapic_init()
Date: Sat,  4 Apr 2020 11:26:55 +0100
Message-Id: <20200404102656.29730-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404102656.29730-1-julien@xen.org>
References: <20200404102656.29730-1-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

So rename the function to ioapic_init().

Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>

---
    Changes in v2:
        - Rename to ioapic_init() rather than init_ioapic().
        - Add Roger's reviewed-by
        - Add Jan's acked-by
---
 xen/arch/x86/apic.c           | 2 +-
 xen/arch/x86/io_apic.c        | 2 +-
 xen/include/asm-x86/io_apic.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index cde67cd87e..71f4efb2fe 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -978,7 +978,7 @@ __next:
         boot_cpu_physical_apicid = get_apic_id();
     x86_cpu_to_apicid[0] = get_apic_id();
 
-    init_ioapic_mappings();
+    ioapic_init();
 }
 
 /*****************************************************************************
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 9868933287..8233eb44e1 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2537,7 +2537,7 @@ static __init bool bad_ioapic_register(unsigned int idx)
     return false;
 }
 
-void __init init_ioapic_mappings(void)
+void __init ioapic_init(void)
 {
     unsigned long ioapic_phys;
     unsigned int i, idx = FIX_IO_APIC_BASE_0;
diff --git a/xen/include/asm-x86/io_apic.h b/xen/include/asm-x86/io_apic.h
index 998905186b..e006b2b8dd 100644
--- a/xen/include/asm-x86/io_apic.h
+++ b/xen/include/asm-x86/io_apic.h
@@ -180,7 +180,7 @@ extern int io_apic_get_version (int ioapic);
 extern int io_apic_get_redir_entries (int ioapic);
 extern int io_apic_set_pci_routing (int ioapic, int pin, int irq, int edge_level, int active_high_low);
 
-extern void init_ioapic_mappings(void);
+extern void ioapic_init(void);
 
 extern void ioapic_suspend(void);
 extern void ioapic_resume(void);
-- 
2.17.1


