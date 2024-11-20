Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDD79D3996
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2024 12:36:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841044.1256578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDj0A-0001bN-N2; Wed, 20 Nov 2024 11:36:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841044.1256578; Wed, 20 Nov 2024 11:36:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDj0A-0001Yo-JW; Wed, 20 Nov 2024 11:36:06 +0000
Received: by outflank-mailman (input) for mailman id 841044;
 Wed, 20 Nov 2024 11:36:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E1p6=SP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tDj0A-00015s-2q
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2024 11:36:06 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e80d060-a733-11ef-a0cb-8be0dac302b0;
 Wed, 20 Nov 2024 12:36:01 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aa4b439c5e8so562294566b.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Nov 2024 03:36:01 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df2649esm755526366b.39.2024.11.20.03.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2024 03:36:00 -0800 (PST)
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
X-Inumbo-ID: 9e80d060-a733-11ef-a0cb-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MjkiLCJoZWxvIjoibWFpbC1lajEteDYyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjllODBkMDYwLWE3MzMtMTFlZi1hMGNiLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMTAyNTYxLjc3NzUzMSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732102561; x=1732707361; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQSY1kHyaToiV6Map5orTQSUjEPRAZ9huo43+UBo760=;
        b=dY5e27T7SfsMrhD7Nzcmx+9VLT88sAw7FU4V3A2f+6fPE9shIYisIH/1Et2CoroHf2
         t+5a8jV+8nz7VPZdp8j+N/7CFs8QSkPW9k5FrzduEzbMyAUZyDS7c6ujgLpyGTyUaWgt
         xUgEHAsgD5vnnz0CymjeRdg+hsMA8bBaFyW6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732102561; x=1732707361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQSY1kHyaToiV6Map5orTQSUjEPRAZ9huo43+UBo760=;
        b=QfoFjtfmwjfAND+BGOGiyIs67VFNPFoI/HvSsQL1qatp4MhqFRRkOUJK8aCvOA0Snq
         9lzx17t6diWLFWBKssfIr51/SzOK39Fxqv0bBt4FJmmlxVkPiqZug8wZXaEgd29G17AD
         Us/ciLaqo+x5Os9/Dt6vXnozswlqwZLKIwj8EV1LjFe0KKKudPNR700fD1azSB45ePLp
         LcJ32ZbFwGFdYao5s3TmYi+rHxfD3s5KnwNgjGLxGqbIFbQiga6FA7nSInnbHHqy/jIq
         j/4eohf06Ie+0PIKS25bHaEh6/tED6um2oN3Nfk/fSfZnE3IIfvFlHu1/IsJV2nCUTvi
         UIaQ==
X-Gm-Message-State: AOJu0YzWyDTFGfBBA0HingArRDHwnNnfSBag5+Z1YdOuKTpg5EToM2Hu
	EKYi05ZBOZYmRFZ7zvC587VEhgbDqQb0Q9QplVLgdCpPU1qMUCmwSChGhFbRW25U1qit8pP7I/B
	7
X-Google-Smtp-Source: AGHT+IGpZBq/GRWTh1h/9HD7eEUOqw/KxHkCjxJBMTWI/j6IunYPvvZdkZpWu6/W1mvxx1/CyuPH5A==
X-Received: by 2002:a17:906:fe0d:b0:aa4:777d:73b5 with SMTP id a640c23a62f3a-aa4dd551bd2mr213101866b.21.1732102560951;
        Wed, 20 Nov 2024 03:36:00 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 2/2] x86/pvh: also print hardware domain pIRQ limit for PVH
Date: Wed, 20 Nov 2024 12:35:55 +0100
Message-ID: <20241120113555.38146-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241120113555.38146-1-roger.pau@citrix.com>
References: <20241120113555.38146-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Do not return early in the PVH/HVM case, so that the number of pIRQs is also
printed.

Fixes: 17f6d398f765 ('cmdline: document and enforce "extra_guest_irqs" upper bounds')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/io_apic.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index bd5ad61c85e4..d9db2efc4f58 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2754,11 +2754,13 @@ unsigned int __hwdom_init arch_hwdom_irqs(const struct domain *d)
 
     /* PVH (generally: HVM) can't use PHYSDEVOP_pirq_eoi_gmfn_v{1,2}. */
     if ( is_hvm_domain(d) )
-        return nr_irqs;
-
-    if ( !d->domain_id )
-        n = min(n, dom0_max_vcpus());
-    n = min(nr_irqs_gsi + n * NR_DYNAMIC_VECTORS, max_irqs);
+        n = nr_irqs;
+    else
+    {
+        if ( !d->domain_id )
+            n = min(n, dom0_max_vcpus());
+        n = min(nr_irqs_gsi + n * NR_DYNAMIC_VECTORS, max_irqs);
+    }
 
     printk("%pd has maximum %u PIRQs\n", d, n);
 
-- 
2.46.0


