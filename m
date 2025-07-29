Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF58B1554A
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 00:31:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063222.1429016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugsqq-0006jT-Ua; Tue, 29 Jul 2025 22:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063222.1429016; Tue, 29 Jul 2025 22:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugsqq-0006hE-RY; Tue, 29 Jul 2025 22:31:16 +0000
Received: by outflank-mailman (input) for mailman id 1063222;
 Tue, 29 Jul 2025 22:31:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/H3U=2K=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ugsqp-0006h7-N8
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 22:31:15 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc8dc400-6ccb-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 00:31:14 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45610582d07so39445865e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 15:31:14 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b790ec4dc8sm3563137f8f.53.2025.07.29.15.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 15:31:12 -0700 (PDT)
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
X-Inumbo-ID: bc8dc400-6ccb-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753828274; x=1754433074; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hPsDgXOsnaGAxK/+ukcdXMO+5SY6xILEaZ1Koay8uNA=;
        b=GB5Iuh9A2MUhDSOjhnWmQSLfC2+LEHIfGgSjUXOGjiR3ETo1Qy0aR/FgsKuXlWCYIm
         koCdPUrmNx1eiKHS89axB2rvTtSOv+9gjl4Uu79YelJr8M6yYfbSLU/QrV5vq58MsaCZ
         L7EzrHt/olX4s7CMUKHFkc+fdMLDhxbwB0u8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753828274; x=1754433074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hPsDgXOsnaGAxK/+ukcdXMO+5SY6xILEaZ1Koay8uNA=;
        b=SUHL6k7K7DbbRDf49GTmIQMIntj0T7fzRQTMr+qZtRddJKLpxxUq4aUO6lrdKIwIsT
         JH2/YKo9oId6yvpbgcrPEhba6Ttdq+4P0Lj4UVUenHqApePFEANJEJkYp4yiO9hfI3vI
         SrBDjE60WRCGgqSxsTARbnzJC/QX8a+6DK8qQ5vVIgo3As/3213Ti3PoBqcD4iKZ7ZSp
         tOuIQNancGu08tMnnfjpJruyFb/jHSBt/qiMwQsAlw7GSf7oN5CRJDwi4a2SHoA9Vbok
         QAkgWspcD1WQBVv0loHDDJRO9Scps8dI/Xm/BjFOdKimd/wOma7HjGqd7eDUvPFjG/6L
         xWxA==
X-Gm-Message-State: AOJu0Yz6dcwGYRv3dZb9idLhmcBcN1/XBhHzlO7lA5nkDTwKOjBLQzSv
	DGjH405tbFeKTOZRhQUQPl6baeB1evXuVnqwrEWeiPf6KXX0mpqAuZXvKon2mPEQ5sgqyfpOjtB
	5tausEcc=
X-Gm-Gg: ASbGncvFZyf4RVkf4Oekw11DOjAtQj7cbIm1QXfBCpBKjvRMh10AZNgtm0n4Wi+FrZW
	cEXOBhjdG/Jn6ConxhM1AcHY06HCoIl1xkVHPFr2rQHoNuZH8vwk88kVN89nbNALEV2klNJmvwq
	NS16Zwpl/6H/DkHy7shw2u5swTgAzLbTMGMx6STtFLsTK/So3C7Cu4+Zzb9jGtyLXvmdHz0j/KN
	vuRKYQXhgcW2QyLt0qLHXVViBuPvcyD4MB1ltAfbGPh10mWF0C/mxZp4tubpsCIjHL67DnaUVsi
	Rx01w+0C0G40XxEcCRxql7DuY0gw849yQS2FWK9Ae2tJLYxA2Vbvqra/r1XVg23Wzem5RDWzABS
	XT/x/3l50Roh2JXEXL6cmlray8PbkIJi/8FaQzFe+sAJU4EAPPXrTb658cMQ8plbP50UpAej0Tq
	sX
X-Google-Smtp-Source: AGHT+IGdiy8wfwXAYwvYYCmGynucqg32uH3y0eB91iKJ6t1P+KzFujv7V6z25sIwR9XiK5u9bNNOTg==
X-Received: by 2002:a05:600c:8714:b0:442:c993:6f94 with SMTP id 5b1f17b1804b1-45892b9e4ecmr13653065e9.12.1753828273787;
        Tue, 29 Jul 2025 15:31:13 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH] xen/irq: Delete the pirq_cleanup_check() macro
Date: Tue, 29 Jul 2025 23:31:10 +0100
Message-Id: <20250729223110.3404441-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

MISRA Rule 5.5 objects to a macro aliasing a function, which is what
pirq_cleanup_check() does.  The macro is an overly-complicated way of writing:

    if ( !pirq->evtchn )
        pirq_cleanup_check(pirq, d);

There are only a handful of users, so expand it inline to be plain regular C.

Doing this shows one path now needing braces, and one path in
evtchn_bind_pirq() where the expanded form simplies back to no delta, as it
follows an unconditional clear of info->evtchn.

No functional change; The compiled hypervisors are the same.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>

Clearly the compiler had already found the simplification in
evtchn_bind_pirq().

Yes, I know I could integrate the !info->evtchn into the outer if() condition,
but that's an even bigger mess.
---
 xen/arch/x86/irq.c                | 11 +++++++----
 xen/common/event_channel.c        |  5 ++++-
 xen/drivers/passthrough/x86/hvm.c |  9 ++++++---
 xen/include/xen/irq.h             |  3 ---
 4 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 556134f85aa0..1ed85c0c114e 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1325,7 +1325,8 @@ static void clear_domain_irq_pirq(struct domain *d, int irq, struct pirq *pirq)
 static void cleanup_domain_irq_pirq(struct domain *d, int irq,
                                     struct pirq *pirq)
 {
-    pirq_cleanup_check(pirq, d);
+    if ( !pirq->evtchn )
+        pirq_cleanup_check(pirq, d);
     radix_tree_delete(&d->arch.irq_pirq, irq);
 }
 
@@ -1383,7 +1384,7 @@ struct pirq *alloc_pirq_struct(struct domain *d)
     return pirq;
 }
 
-void (pirq_cleanup_check)(struct pirq *pirq, struct domain *d)
+void pirq_cleanup_check(struct pirq *pirq, struct domain *d)
 {
     /*
      * Check whether all fields have their default values, and delete
@@ -2823,7 +2824,8 @@ int map_domain_emuirq_pirq(struct domain *d, int pirq, int emuirq)
                 radix_tree_int_to_ptr(pirq));
             break;
         default:
-            pirq_cleanup_check(info, d);
+            if ( !info->evtchn )
+                pirq_cleanup_check(info, d);
             return err;
         }
     }
@@ -2858,7 +2860,8 @@ int unmap_domain_pirq_emuirq(struct domain *d, int pirq)
     if ( info )
     {
         info->arch.hvm.emuirq = IRQ_UNBOUND;
-        pirq_cleanup_check(info, d);
+        if ( !info->evtchn )
+            pirq_cleanup_check(info, d);
     }
     if ( emuirq != IRQ_PT )
         radix_tree_delete(&d->arch.hvm.emuirq_pirq, emuirq);
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index c8c1bfa615df..ed48fbb55d67 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -741,11 +741,14 @@ int evtchn_close(struct domain *d1, int port1, bool guest)
             if ( !is_hvm_domain(d1) ||
                  domain_pirq_to_irq(d1, pirq->pirq) <= 0 ||
                  unmap_domain_pirq_emuirq(d1, pirq->pirq) < 0 )
+            {
                 /*
                  * The successful path of unmap_domain_pirq_emuirq() will have
                  * called pirq_cleanup_check() already.
                  */
-                pirq_cleanup_check(pirq, d1);
+                if ( !pirq->evtchn )
+                    pirq_cleanup_check(pirq, d1);
+            }
         }
         unlink_pirq_port(chn1, d1->vcpu[chn1->notify_vcpu_id]);
         break;
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index a2ca7e0e570c..b73bb550554d 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -329,7 +329,8 @@ int pt_irq_create_bind(
                 pirq_dpci->gmsi.gvec = 0;
                 pirq_dpci->dom = NULL;
                 pirq_dpci->flags = 0;
-                pirq_cleanup_check(info, d);
+                if ( !info->evtchn )
+                    pirq_cleanup_check(info, d);
                 write_unlock(&d->event_lock);
                 return rc;
             }
@@ -536,7 +537,8 @@ int pt_irq_create_bind(
                     hvm_irq_dpci->link_cnt[link]--;
                 }
                 pirq_dpci->flags = 0;
-                pirq_cleanup_check(info, d);
+                if ( !info->evtchn )
+                    pirq_cleanup_check(info, d);
                 write_unlock(&d->event_lock);
                 xfree(girq);
                 xfree(digl);
@@ -693,7 +695,8 @@ int pt_irq_destroy_bind(
          */
         pt_pirq_softirq_reset(pirq_dpci);
 
-        pirq_cleanup_check(pirq, d);
+        if ( !pirq->evtchn )
+            pirq_cleanup_check(pirq, d);
     }
 
     write_unlock(&d->event_lock);
diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
index 95034c0d6bb5..6071b00f621e 100644
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -185,9 +185,6 @@ extern struct pirq *pirq_get_info(struct domain *d, int pirq);
 
 void pirq_cleanup_check(struct pirq *pirq, struct domain *d);
 
-#define pirq_cleanup_check(pirq, d) \
-    (!(pirq)->evtchn ? pirq_cleanup_check(pirq, d) : (void)0)
-
 extern void pirq_guest_eoi(struct pirq *pirq);
 extern void desc_guest_eoi(struct irq_desc *desc, struct pirq *pirq);
 extern int pirq_guest_unmask(struct domain *d);

base-commit: b5070a959667d60e627017d44fc5b5b1c5e98777
-- 
2.39.5


