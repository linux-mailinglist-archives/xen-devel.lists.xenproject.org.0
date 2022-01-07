Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0633B4877DC
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jan 2022 13:56:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254426.436240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5omY-0005Be-UB; Fri, 07 Jan 2022 12:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254426.436240; Fri, 07 Jan 2022 12:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5omY-00059T-R9; Fri, 07 Jan 2022 12:55:46 +0000
Received: by outflank-mailman (input) for mailman id 254426;
 Fri, 07 Jan 2022 12:55:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R3Uf=RX=gmail.com=d.vrabel.98@srs-se1.protection.inumbo.net>)
 id 1n5omX-00059N-11
 for xen-devel@lists.xenproject.org; Fri, 07 Jan 2022 12:55:45 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19a75b28-6fb9-11ec-9ce5-af14b9085ebd;
 Fri, 07 Jan 2022 13:55:33 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id w20so10884080wra.9
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jan 2022 04:55:33 -0800 (PST)
Received: from banana.davidvrabel.org.uk (banana.davidvrabel.org.uk.
 [82.70.146.42])
 by smtp.googlemail.com with ESMTPSA id y8sm5957696wma.19.2022.01.07.04.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 04:55:32 -0800 (PST)
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
X-Inumbo-ID: 19a75b28-6fb9-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AlKlD2YZURaiGcrFu6SNQ5g/dSZ4FFEr33mGfLaxRu8=;
        b=ioxM9UN615oauk5tn/RVN6f4mfDSdiJHFlF3LBNMHp32sWoEdU2QqwFlEG7hy+nuJk
         Fieo1OAdROf1tDKVEm0WbZ9Al9XM/VqjRVueakExGksPBJVBoSaJiNDu9ngGpJWAZBTi
         4MhMfQdDwyDZyRj1tdDXrLGL2e7gUcKGFGyW/oLVYOm0uEfeULqTefOQTrJ5ts1z4HZb
         QOG3GEYBTDnk7HDd5utor6nBOFDXmzEDlLhcgU/9zB1OmJxe/AXdgnIIXhgt0JJMJRa3
         jAQXsF9+klZmkkwaJ6F9nWlvlAUPmkxcNKq2cvZ8H8kdEzVmlox+4qJXEI67n1oZHjFM
         //7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=AlKlD2YZURaiGcrFu6SNQ5g/dSZ4FFEr33mGfLaxRu8=;
        b=h/BTnkyOG2FUxtMqCQlkPB1aemWBARpZ75YFR+1C6O8eCfaViXGGQs0UPTZjq16tvY
         ExktxNV9a+vIXcTd52ExbYNJw0VJnRkPUM+dGYdj4fpECMNdBBifFJ9S4hPZqB9fw4zJ
         DbH+YZyrjO3sOcV9XpNMEldRrSc4YNcKMNQ3WeITRhqHwk1npiadQ9W30kUTGk9QQZ/b
         qANLGk0Ac2eqfUO2pEsQxG3r1UTSLKTUZPDS4Z6+6mpy5sp5KfTPVtW5Nkb6KMhSkR2N
         esGlmyVgj0XBIkztdirXF7MiMtisk5gd7IbEBIvBXxDYrGt859PZ/wEnrQ9Kj7NZmW/y
         TcFA==
X-Gm-Message-State: AOAM532McMIEdmDkVJPUCJcaqaqKwOToda4Du+YM/Zmp0RHn7h9wFSDd
	0Q4ZefYBXjVenv3KzOBDXfb3B+5kaqYRBA==
X-Google-Smtp-Source: ABdhPJxrU1RHn4wohiCOfHS42vVbfNgpDWbv5GVB/j9SIWcjoygY5HaFE9s5+pTAIWM3QMOpamZfRw==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr54958569wrs.425.1641560132932;
        Fri, 07 Jan 2022 04:55:32 -0800 (PST)
Sender: David Vrabel <d.vrabel.98@gmail.com>
From: David Vrabel <dvrabel@cantab.net>
X-Google-Original-From: David Vrabel <dvrabel@amazon.co.uk>
To: xen-devel@lists.xenproject.org
Cc: David Vrabel <dvrabel@amazon.co.uk>
Subject: [PATCHv2] x86/hvm: add more callback/upcall info to 'I' debug key
Date: Fri,  7 Jan 2022 12:55:23 +0000
Message-Id: <20220107125523.212649-1-dvrabel@amazon.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Include the type of the callback via and the per-VCPU upcall vector.

Signed-off-by: David Vrabel <dvrabel@amazon.co.uk>
---
v2:
- fix style
- make upcall vector output distinguishable from logs prior to this patch
- use fewer lines for callback via.
---
 xen/arch/x86/hvm/irq.c | 49 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 45 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 52aae4565f..8b1bb79127 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -598,7 +598,11 @@ int hvm_local_events_need_delivery(struct vcpu *v)
 static void irq_dump(struct domain *d)
 {
     struct hvm_irq *hvm_irq = hvm_domain_irq(d);
-    int i; 
+    unsigned int i;
+    const struct vcpu *v;
+    bool have_upcall_vector = false;
+    const char *via_asserted;
+
     printk("Domain %d:\n", d->domain_id);
     printk("PCI 0x%16.16"PRIx64"%16.16"PRIx64
            " ISA 0x%8.8"PRIx32" ROUTE %u %u %u %u\n",
@@ -630,9 +634,46 @@ static void irq_dump(struct domain *d)
            hvm_irq->pci_link_assert_count[1],
            hvm_irq->pci_link_assert_count[2],
            hvm_irq->pci_link_assert_count[3]);
-    printk("Callback via %i:%#"PRIx32",%s asserted\n",
-           hvm_irq->callback_via_type, hvm_irq->callback_via.gsi, 
-           hvm_irq->callback_via_asserted ? "" : " not");
+
+    printk("Per-VCPU upcall vector:\n");
+    for_each_vcpu ( d, v )
+    {
+        if ( v->arch.hvm.evtchn_upcall_vector )
+        {
+            printk("  v%u: %u\n",
+                   v->vcpu_id, v->arch.hvm.evtchn_upcall_vector);
+            have_upcall_vector = true;
+        }
+    }
+    if ( !have_upcall_vector )
+        printk("  none\n");
+
+    via_asserted = hvm_irq->callback_via_asserted ? " (asserted)" : "";
+    switch( hvm_irq->callback_via_type )
+    {
+    case HVMIRQ_callback_none:
+        printk("Callback via none\n");
+        break;
+
+    case HVMIRQ_callback_gsi:
+        printk("Callback via GSI %u%s\n",
+               hvm_irq->callback_via.gsi,
+               via_asserted);
+        break;
+
+    case HVMIRQ_callback_pci_intx:
+        printk("Callback via PCI dev %u INTx %u%s\n",
+               hvm_irq->callback_via.pci.dev,
+               hvm_irq->callback_via.pci.intx,
+               via_asserted);
+        break;
+
+    case HVMIRQ_callback_vector:
+        printk("Callback via vector %u%s\n",
+               hvm_irq->callback_via.vector,
+               via_asserted);
+        break;
+    }
 }
 
 static void dump_irq_info(unsigned char key)
-- 
2.30.2


