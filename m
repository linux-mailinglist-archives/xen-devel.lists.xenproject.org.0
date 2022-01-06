Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0403E48671D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 16:55:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254129.435682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5V69-0006YJ-Qk; Thu, 06 Jan 2022 15:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254129.435682; Thu, 06 Jan 2022 15:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5V69-0006Vl-ND; Thu, 06 Jan 2022 15:54:41 +0000
Received: by outflank-mailman (input) for mailman id 254129;
 Thu, 06 Jan 2022 15:54:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZpKN=RW=gmail.com=d.vrabel.98@srs-se1.protection.inumbo.net>)
 id 1n5V68-0006Vf-8c
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 15:54:40 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3f5650e-6f08-11ec-9ce5-af14b9085ebd;
 Thu, 06 Jan 2022 16:54:38 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id a5so1685335wrh.5
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jan 2022 07:54:38 -0800 (PST)
Received: from banana.davidvrabel.org.uk (banana.davidvrabel.org.uk.
 [82.70.146.42])
 by smtp.googlemail.com with ESMTPSA id m10sm2083608wms.25.2022.01.06.07.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 07:54:37 -0800 (PST)
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
X-Inumbo-ID: f3f5650e-6f08-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AffgayRFGxfGG5c5Zpyu4eMtV7zqoLa5C0p4l3Kktzw=;
        b=TFulrUcHuiwlbTJGamVzss6Z7Q+Fo8f1FyEi0WEA/fA4T/dQZIzbYi4rMRhzkE2HnL
         WojIcaQUTKhpVxtfV9CZPUPeB4fTRfJ7wUN7VWHYvW1NnJjNZt7bvoTOiK6MQnpdTyH2
         MzajXkdCMsZI8IQh8J3JXXKBxSAxqPZPyjVuO2bx+JH1zKT+nYtJQHvaz4ErY/Iohw2z
         EUihaBPweHGtv6XJjGrsOja2zCZ6rIOQXqP0UsCpxWPb9xpWs2Jz0ayoJ5O4cEogkMfK
         3b5vLHknrSO9rYbhJRNEbUn4npnVxgz2hBCAhcggKmfXTJdLuqA4EkZtLTybViNok0CR
         vBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=AffgayRFGxfGG5c5Zpyu4eMtV7zqoLa5C0p4l3Kktzw=;
        b=mFlE//UAUoCKe5OJbXsukOiiN9aTltsUC5HMv6CY7pktzNVpYBMBaFTAsAAloneH1f
         CRWBf0/Ainakvv8wSB7VxCW74TDA0yBRqx0LsoMzIn1DnIVGkVNaVBOeTS/QS3uuIqNb
         z1N/HdD/g9CI0o0own3Rz0iyrhoC3a6U46MZSHixglbmrPpmONk2CnFChbk4Et0/L/C7
         aMU6K632/dtfTyt3Wca9uCvzMg2Z4yroNUJePPoTcOC1rf41TyHskY5gO67ef92HDNtx
         NC6RVZVgNJaxSKMWa/MVxtVK8YKuuYSCEHluUk4XSJI4UNAevQqBlZH/ezAzH/2hlLp0
         ztVw==
X-Gm-Message-State: AOAM532rn5bBtXj+nZnkqlXbj2w54mGplmQZw9oui5qOfDsizYYwRmjv
	5bnScOYHjd5AZxRwEgMmrGhctYd7IE7HGQ==
X-Google-Smtp-Source: ABdhPJywC4KH/+j/gJvn2kUt5bOO8i1b8n1oTe2CUGBT6RCry/lQQ/CLz/M0rgWGaMyu7vwEaE0Udg==
X-Received: by 2002:a5d:64aa:: with SMTP id m10mr52981257wrp.500.1641484478315;
        Thu, 06 Jan 2022 07:54:38 -0800 (PST)
Sender: David Vrabel <d.vrabel.98@gmail.com>
From: David Vrabel <dvrabel@cantab.net>
X-Google-Original-From: David Vrabel <dvrabel@amazon.co.uk>
To: xen-devel@lists.xenproject.org
Cc: David Vrabel <dvrabel@amazon.co.uk>
Subject: [PATCH] x86/hvm: add more callback/upcall info to 'I' debug key
Date: Thu,  6 Jan 2022 15:46:47 +0000
Message-Id: <20220106154647.159625-1-dvrabel@amazon.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Include the type of the callback via and the per-VCPU upcall vector.

Signed-off-by: David Vrabel <dvrabel@amazon.co.uk>
---
 xen/arch/x86/hvm/irq.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 52aae4565f..6a1edb99f2 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -598,7 +598,9 @@ int hvm_local_events_need_delivery(struct vcpu *v)
 static void irq_dump(struct domain *d)
 {
     struct hvm_irq *hvm_irq = hvm_domain_irq(d);
-    int i; 
+    int i;
+    struct vcpu *v;
+
     printk("Domain %d:\n", d->domain_id);
     printk("PCI 0x%16.16"PRIx64"%16.16"PRIx64
            " ISA 0x%8.8"PRIx32" ROUTE %u %u %u %u\n",
@@ -630,9 +632,30 @@ static void irq_dump(struct domain *d)
            hvm_irq->pci_link_assert_count[1],
            hvm_irq->pci_link_assert_count[2],
            hvm_irq->pci_link_assert_count[3]);
-    printk("Callback via %i:%#"PRIx32",%s asserted\n",
-           hvm_irq->callback_via_type, hvm_irq->callback_via.gsi, 
-           hvm_irq->callback_via_asserted ? "" : " not");
+    for_each_vcpu( d, v )
+    {
+        if ( v->arch.hvm.evtchn_upcall_vector )
+            printk("%pv: upcall vector: %u\n",
+                   v, v->arch.hvm.evtchn_upcall_vector);
+    }
+    switch( hvm_irq->callback_via_type )
+    {
+    case HVMIRQ_callback_none:
+        printk("Callback via none\n");
+        break;
+    case HVMIRQ_callback_gsi:
+        printk("Callback via GSI %u\n", hvm_irq->callback_via.gsi);
+        break;
+    case HVMIRQ_callback_pci_intx:
+        printk("Callback via PCI dev %u INTx %u\n",
+               hvm_irq->callback_via.pci.dev,
+               hvm_irq->callback_via.pci.intx);
+        break;
+    case HVMIRQ_callback_vector:
+        printk("Callback via vector %u\n", hvm_irq->callback_via.vector);
+        break;
+    }
+    printk("  %s asserted\n", hvm_irq->callback_via_asserted ? "" : " not");
 }
 
 static void dump_irq_info(unsigned char key)
-- 
2.30.2


