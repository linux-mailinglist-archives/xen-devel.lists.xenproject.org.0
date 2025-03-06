Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9515DA54E6C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 15:58:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903670.1311650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqCfa-0003gi-6M; Thu, 06 Mar 2025 14:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903670.1311650; Thu, 06 Mar 2025 14:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqCfa-0003ba-19; Thu, 06 Mar 2025 14:57:54 +0000
Received: by outflank-mailman (input) for mailman id 903670;
 Thu, 06 Mar 2025 14:57:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bSAR=VZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tqCfY-0003Ye-Tn
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 14:57:52 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60063f9f-fa9b-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 15:57:51 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ac202264f9cso142640466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 06:57:51 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac2397366b0sm108721266b.95.2025.03.06.06.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 06:57:49 -0800 (PST)
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
X-Inumbo-ID: 60063f9f-fa9b-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741273070; x=1741877870; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNP8vm8lWdnrLbuaqz+aHqlLq12YGejtAmi/o97vgI4=;
        b=TJdmp6Zu2lFXbVJPlBCUJK3UujvTS4qKcLTax0etcuECMKZcTocI2ytum4Lcz+lefG
         hSrk2PlVB05Uvq7kzDGgr0M7OxamurAdQCDRGCWFkw+xUWbI5ym3+mdif2bTHt9eFath
         hzGqjBzYfZvE/abCID7GfBiy0avKXlhiPSd+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741273070; x=1741877870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vNP8vm8lWdnrLbuaqz+aHqlLq12YGejtAmi/o97vgI4=;
        b=jdSISu1sUrXdTAmk5CDL7X4S8naIi8rUY1RFa/BDWN57u3yM7JwAZxXZreXMXvH6bm
         9RoV58fpuQKJaW5YFy58smqLnoWQkicGUScpvXGHxQlUy5n8O17DzpULSg9hI+lRa3S5
         m/2WDTAMOsi4+L4tADiCZg5fAgXHrDhsymkLjTHAeLN/2YIH4nEmKkwqYcL4i6Hzn2l9
         QppPfsCuOIxPAq1lVC2Z3Xxg0KEzuRE8eDiT0uIRGsD+BrYucBHRWzuTXRd7mie5s8sO
         jWj6bRvN4S+5CXMDYTHjZ8wkIF16b2Ahv+Kzs0zMcS88mZqbq7t3W5uL1OEacZ3QgGH3
         4VXA==
X-Gm-Message-State: AOJu0YwYSEdoHh3/8nNbWCQVTyewLMkXSBFghJjH4t08cLvX4Vsl6y8J
	fozrjJY0hU/f6fXLBJaVNxpHZ5xcAjjGFxGX2MYuM0NFFG8n8aUoxTUFZdCo7NEbNfqLanVKFvH
	1
X-Gm-Gg: ASbGncuuN+lN0kKKONbC/V5GzkJBLuptNuuKm4Y62XzMMNeaMdurhLKfZQ7fbK4cgv5
	RH7MR0hLnDSNUDoqGnkqnXANTfVVPplyDK8p2Ck2052yERtCXWcszva44mq2RyliIzzqLctUkNw
	SCkI5/jLqzPOMY06qisUYg3QL7bSaBfhIqWj/dPu9etLMpRYnj7qel9Mpn03IdBoRULr4AxgZUI
	khF9w0WKDPXRksRlJ1JozwgHqKJV3VT2M/SOty5wAbVGdAbOj0+gMMwZ3J9hkFMjAiGp2xIsL6M
	njHMDvTRGNZmMgg1ceGeii5qsC+e/MuT/I/JKloHrelYS7u2qw==
X-Google-Smtp-Source: AGHT+IG0pm1OZ77YuKmjL3LH/3H8U9L5m9NV2t1kaq5tZs3yxKMeA8gmbqAImUfjwe6gxUaizZysVw==
X-Received: by 2002:a17:907:7ea6:b0:ac1:e00c:a561 with SMTP id a640c23a62f3a-ac20dac2c06mr781304266b.18.1741273070145;
        Thu, 06 Mar 2025 06:57:50 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 2/3] x86/msi: don't use cached address and data fields in msi_desc for dump_msi()
Date: Thu,  6 Mar 2025 15:57:32 +0100
Message-ID: <20250306145733.99927-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306145733.99927-1-roger.pau@citrix.com>
References: <20250306145733.99927-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Instead compose a dummy MSI message just for the purpose of getting the
delivery attributes, which are the same for all messages.  Note that the
previous usage of the cached MSI message wasn't fetching the hardware MSI
fields either.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/msi.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 6c11d76015fb..8efe41b1526c 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -1454,6 +1454,16 @@ void __init early_msi_init(void)
 static void cf_check dump_msi(unsigned char key)
 {
     unsigned int irq;
+    struct msi_msg msg = {};
+    uint32_t addr, data;
+
+    /*
+     * Compose a dummy msg message for the purpose of getting the delivery
+     * attributes.
+     */
+    msi_compose_msg(FIRST_DYNAMIC_VECTOR, NULL, &msg);
+    addr = msg.address_lo;
+    data = msg.data;
 
     printk("MSI information:\n");
 
@@ -1461,7 +1471,7 @@ static void cf_check dump_msi(unsigned char key)
     {
         struct irq_desc *desc = irq_to_desc(irq);
         const struct msi_desc *entry;
-        u32 addr, data, dest32;
+        uint32_t dest32;
         signed char mask;
         struct msi_attrib attr;
         unsigned long flags;
@@ -1495,8 +1505,6 @@ static void cf_check dump_msi(unsigned char key)
             break;
         }
 
-        data = entry->msg.data;
-        addr = entry->msg.address_lo;
         dest32 = entry->msg.dest32;
         attr = entry->msi_attrib;
         if ( entry->msi_attrib.type )
@@ -1512,8 +1520,7 @@ static void cf_check dump_msi(unsigned char key)
             mask = '?';
         printk(" %-6s%4u vec=%02x%7s%6s%3sassert%5s%7s"
                " dest=%08x mask=%d/%c%c/%c\n",
-               type, irq,
-               (data & MSI_DATA_VECTOR_MASK) >> MSI_DATA_VECTOR_SHIFT,
+               type, irq, desc->arch.vector,
                data & MSI_DATA_DELIVERY_LOWPRI ? "lowest" : "fixed",
                data & MSI_DATA_TRIGGER_LEVEL ? "level" : "edge",
                data & MSI_DATA_LEVEL_ASSERT ? "" : "de",
-- 
2.48.1


