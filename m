Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14194968406
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 12:04:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787721.1197189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl3un-0007Le-HS; Mon, 02 Sep 2024 10:04:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787721.1197189; Mon, 02 Sep 2024 10:04:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl3un-0007J5-DN; Mon, 02 Sep 2024 10:04:05 +0000
Received: by outflank-mailman (input) for mailman id 787721;
 Mon, 02 Sep 2024 10:04:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qspk=QA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sl3ul-0006bt-H2
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 10:04:03 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae76cbeb-6912-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 12:04:03 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c241feb80dso3540396a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 03:04:03 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89940980a1sm480884466b.47.2024.09.02.03.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 03:04:00 -0700 (PDT)
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
X-Inumbo-ID: ae76cbeb-6912-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725271442; x=1725876242; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=be5mJ1nbKj+ibkKfFOazPRQRDTrZSslb0u+nNDT9HhA=;
        b=KCnRlupt3jsJcYIAhmugn42WmOVO+P8bxwIQPzG1sYiVU8CpUy1mCUba2XpIj0eA7/
         Vg10eOUzKfjhDQo2QSyNvjzltu07X2ZgW2FEfLMg6OhSENYLEQu11SkihPoL1HoeuMCx
         SOlf/cxQ/mqV9MdtYI6eU/YSTksYT2TOYBdHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725271442; x=1725876242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=be5mJ1nbKj+ibkKfFOazPRQRDTrZSslb0u+nNDT9HhA=;
        b=Y6WqG2VkdgVovwcaHoNwZ4lmDeRxNOZ0wUv2Ky781r1I7EM3VlJUi9Ly3Fdnr6JJsY
         BloDytj6t5zv+c07+AOvSozRsEIYr9QqetGtRfIGFw2QgfvYx1ngMpGUjdZWgCBYl3Fi
         p2uWOqVrra6NCvytEaq+3ojKqOUCzcy3+8OG5Kfx+8VgpDJF2N7sBO8ugBQtRunglQ/c
         knptJun7ppncQ8jHkzKkJRgMmuw294zMgOHYCALmtvgcqtI2oIobrSkhdKPOrdp2OlaP
         5vrJHnhhVmSyeFKjDYdicw63emQPKC6eydG0yzDoWxS0sJso6BynvaWp5b5UzQK/GdmR
         5oqg==
X-Gm-Message-State: AOJu0Ywe1gJuFxlpjBbYhouzYKEGD2kHPmVlsMn4A8CIfiIPYc/sT2Lp
	fN5wWljCddN8p23VGucoinA4tu2azn2Ra/Q6KSerHJ/9a4NpaWIeA+5AsYtrovf5tHP4sCU/7lX
	H
X-Google-Smtp-Source: AGHT+IGm/nq3qmj43TAeFbXxC65tz61Z79Olgo0b+sqe+A9MHv2w9RaNo5rVkLNp1IeYaFayizWsIQ==
X-Received: by 2002:a17:907:d589:b0:a7a:c7f3:580d with SMTP id a640c23a62f3a-a89a2924ab3mr950260466b.25.1725271441411;
        Mon, 02 Sep 2024 03:04:01 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 3/4] ARM/vgic: Use for_each_set_bit() in gic_find_unused_lr()
Date: Mon,  2 Sep 2024 11:03:54 +0100
Message-Id: <20240902100355.3032079-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240902100355.3032079-1-andrew.cooper3@citrix.com>
References: <20240902100355.3032079-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no bits set in lr_mask beyond nr_lrs, so when substituting
bitmap_for_each() for for_each_set_bit(), we don't need to worry about the
upper bound.

However, the type of lr_mask does matter, so switch it to be uint64_t * and
move unsigned long * override until the find_next_zero_bit() call.

Move lr_val into a narrower scope and drop used_lr as it's declared by
for_each_set_bit() itself.

Drop the nr_lrs variable and use gic_get_nr_lrs() in the one location its now
used.  It hides a triple pointer defererence, and while it may not be needed
in the PRISTINE case, it certainly doesn't need to be live across the rest of
the function.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>

ARM64:

  $ ../scripts/bloat-o-meter xen-syms-arm64-{before,after}
  add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-28 (-28)
  Function                                     old     new   delta
  gic_find_unused_lr.constprop                 228     200     -28

inc -2 find_next_bit()

ARM32:

  $ ../scripts/bloat-o-meter xen-syms-arm32-{before,after}
  add/remove: 0/0 grow/shrink: 1/0 up/down: 48/0 (48)
  Function                                     old     new   delta
  gic_find_unused_lr                           260     308     +48

because uint64_t, but -2 _find_{first,next}_bit_le()
---
 xen/arch/arm/gic-vgic.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
index 3f14aab2efc7..ea48c5375a91 100644
--- a/xen/arch/arm/gic-vgic.c
+++ b/xen/arch/arm/gic-vgic.c
@@ -102,25 +102,23 @@ static unsigned int gic_find_unused_lr(struct vcpu *v,
                                        struct pending_irq *p,
                                        unsigned int lr)
 {
-    unsigned int nr_lrs = gic_get_nr_lrs();
-    unsigned long *lr_mask = (unsigned long *) &this_cpu(lr_mask);
-    struct gic_lr lr_val;
+    uint64_t *lr_mask = &this_cpu(lr_mask);
 
     ASSERT(spin_is_locked(&v->arch.vgic.lock));
 
     if ( unlikely(test_bit(GIC_IRQ_GUEST_PRISTINE_LPI, &p->status)) )
     {
-        unsigned int used_lr;
-
-        bitmap_for_each ( used_lr, lr_mask, nr_lrs )
+        for_each_set_bit ( used_lr, *lr_mask )
         {
+            struct gic_lr lr_val;
+
             gic_hw_ops->read_lr(used_lr, &lr_val);
             if ( lr_val.virq == p->irq )
                 return used_lr;
         }
     }
 
-    lr = find_next_zero_bit(lr_mask, nr_lrs, lr);
+    lr = find_next_zero_bit((unsigned long *)lr_mask, gic_get_nr_lrs(), lr);
 
     return lr;
 }
-- 
2.39.2


