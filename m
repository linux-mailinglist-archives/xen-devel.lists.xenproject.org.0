Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B55690CCF5
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 15:01:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743057.1149939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJYSG-0005n5-HP; Tue, 18 Jun 2024 13:00:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743057.1149939; Tue, 18 Jun 2024 13:00:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJYSG-0005kl-Eg; Tue, 18 Jun 2024 13:00:56 +0000
Received: by outflank-mailman (input) for mailman id 743057;
 Tue, 18 Jun 2024 13:00:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=An5i=NU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sJYSE-0005kf-PT
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 13:00:54 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb00a2fd-2d72-11ef-b4bb-af5377834399;
 Tue, 18 Jun 2024 15:00:52 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-57cc1c00b97so4308117a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 06:00:52 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72e9dd7sm7676040a12.57.2024.06.18.06.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 06:00:51 -0700 (PDT)
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
X-Inumbo-ID: cb00a2fd-2d72-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718715652; x=1719320452; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LygUhwAafTLJDGyqQwpjFQew1zv8q0DsIF8+8q2BsUI=;
        b=gVYdeyipkZeCt2nAK25FMnnSttKNRVzLkF1cqLP6016I9K+8K/HTcivVwR/o7p+ZAo
         v9WfsG8ck1FpuyQik0H5+kTUix6NfTj1CVgaUeZvgsgEkqwttCd5xryyz5olzhydnOZY
         OH68reV1rBYI7Mz9PPKFpZTACj53kE7+bH8Dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718715652; x=1719320452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LygUhwAafTLJDGyqQwpjFQew1zv8q0DsIF8+8q2BsUI=;
        b=J/Ky4spyz9SoOvhCqG1EWV1lg7Gw3UFHhhtPzAGWPStzMGm9YlmhJHlGBBU+4h5RHU
         Qcd7T3scR5O2pSvkm8cG9151M2p3hhrB1Daa5i0CA/jfv+xuZAQZ//nK3MpveVlvWHVj
         NLpaXJKhW6EfiaiiTaF21nnPlvHCmLZcVSBl7qs0S/TqgqK+P3jkMKcS0sgaIbTjZmkL
         v+KM7Z4fQx8CFC/DhvAWWp8a+WHoXzADwDijDqEKJ3TD15M2NoVZROwATt1BkF8GMrVr
         616jU1tn9ag6tRG1meD589MPqNV7qpNnGFMFc6nb6NVtwV3cOClfHoSmHA8+SNmbUJ6Z
         inmw==
X-Gm-Message-State: AOJu0Ywf8PTkW+b1+e9gNx5SfzNdp+rX7WxZVr2Sf703JOA/ZOM2mqKi
	mAcZcYydJAHGRjHJF9gXw1xbLB4lwJjI7S2xysjfaaP4aFvsft11Wdt6nOH09VMYkyEdy0Lf51Z
	DjJ4=
X-Google-Smtp-Source: AGHT+IGEvmiTw/b4hOdDD0Xg67JH9GVOpj2zIuAqSChp4G0k/ytPJ1q5jrFjsIOpvoeCXfTM6Bw/+g==
X-Received: by 2002:a50:c350:0:b0:57d:4b7:a8d8 with SMTP id 4fb4d7f45d1cf-57d04b7b554mr253597a12.25.1718715651641;
        Tue, 18 Jun 2024 06:00:51 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>
Subject: [PATCH for-4.19] xen/irq: Address MISRA Rule 8.3 violation
Date: Tue, 18 Jun 2024 14:00:48 +0100
Message-Id: <20240618130048.1768639-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When centralising irq_ack_none(), different architectures had different names
for the parameter of irq_ack_none().  As it's type is struct irq_desc *, it
should be named desc.  Make this consistent.

No functional change.

Fixes: 8aeda4a241ab ("arch/irq: Make irq_ack_none() mandatory")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: consulting@bugseng.com <consulting@bugseng.com>

Request for 4.19.  This was an accidental regression in a recent cleanup
patch, and the fix is just a rename - its no functional change.
---
 xen/arch/arm/irq.c    | 4 ++--
 xen/include/xen/irq.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index c60502444ccf..6b89f64fd194 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -31,9 +31,9 @@ struct irq_guest
     unsigned int virq;
 };
 
-void irq_ack_none(struct irq_desc *irq)
+void irq_ack_none(struct irq_desc *desc)
 {
-    printk("unexpected IRQ trap at irq %02x\n", irq->irq);
+    printk("unexpected IRQ trap at irq %02x\n", desc->irq);
 }
 
 void irq_end_none(struct irq_desc *irq)
diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
index adf33547d25f..580ae37e7428 100644
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -134,7 +134,7 @@ void cf_check irq_actor_none(struct irq_desc *desc);
  * irq_ack_none() must be provided by the architecture.
  * irq_end_none() is optional, and opted into using a define.
  */
-void cf_check irq_ack_none(struct irq_desc *irq);
+void cf_check irq_ack_none(struct irq_desc *desc);
 
 /*
  * Per-cpu interrupted context register state - the inner-most interrupt frame

base-commit: 8b4243a9b560c89bb259db5a27832c253d4bebc7
-- 
2.39.2


