Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BEAB1B7E6
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 18:04:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070703.1434324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujK8p-0005Mh-FL; Tue, 05 Aug 2025 16:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070703.1434324; Tue, 05 Aug 2025 16:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujK8p-0005Ka-Cb; Tue, 05 Aug 2025 16:03:55 +0000
Received: by outflank-mailman (input) for mailman id 1070703;
 Tue, 05 Aug 2025 16:03:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xkmx=2R=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ujK8o-0005KP-6F
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 16:03:54 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8a103b3-7215-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 18:03:53 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3b79bd3b1f7so3214536f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 09:03:53 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c3abed3sm19530690f8f.10.2025.08.05.09.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 09:03:52 -0700 (PDT)
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
X-Inumbo-ID: c8a103b3-7215-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754409833; x=1755014633; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JXfP12pZ4+VDH6A10Mwp3rgVonBLU43HxHJdyCaNY84=;
        b=QiYzVM1NAJqrXrmRc9+yYdRor2FbKnTB+opHOu6IhDMP/ErF7q6LlQeBSlS7J8rrhO
         4BcRLy3JcDxKE4lSetoU4PiaP26KTOxGCswcRXT8jUyWWFHox8mIGYCOW2inRPgvarVz
         VWK3yXFujtkNd9wiSnLYFkqLHILHCExkIoWCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754409833; x=1755014633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JXfP12pZ4+VDH6A10Mwp3rgVonBLU43HxHJdyCaNY84=;
        b=DI0ngLXZSBUmKkewlRqJZK8mFkdTeyfUP7GWLQsumLw9gYaxb7r+4aVM/JJAyTfja9
         j3/t721/eaXwjdskhahOWE6JqWG6qLghNQFvT5JfEMSIl3amXO5exA1nVVPQoFOQPWZ+
         1rnOUgnWcuoHk4UbaoXHEEZnDKp46y7VcyyVrsyiiT9m+HySj0//oSwf6rDxDL18fM57
         1KLb92kdkvwsNbJNnk+adndwMD5WNQ0sFU40604JO6uaOcDBFVKZZ2GXgRqHeZieEond
         T3ZeeqFR9vS3/PKDLflFq0ENEJhU1PsAZojcxzeEvtV9clq1otDWTvra0KrP8ekVD0OT
         KxOw==
X-Gm-Message-State: AOJu0Yw8FsgtX6VDKZwPeRpM7K4kMOENOzyFmV3k7rq0hQ4NyigSAJsj
	NOG4XJtd7SsqstrjOj1shpTRRG8DqqX/gEfi8lbKjjuvnsB9AGaGajBECzBX26q4r5KqQuZnd50
	DS4fM
X-Gm-Gg: ASbGncv4abxNrhToyw/aAHKm+B/p1/HXW5k9t2VfP+xq9Rboh48sny3boVfGwihYsM5
	YbDa8zDney9GDpsGNUX/qXRsDtjIFmMWKr6wFB8mnyCw39uBvcTJUDZakmit/vR7sCiPvJ3DNQv
	e2w9+RjUNJfrlNnLjXWwM8w1Yr/WWGiwHnIuCvZaiUqAXZLlCX74wmEHqvTXxcrhYcwtqAtqTfJ
	LQU/TEBjoEyI8sP0pjSxTCl8bUy1yHT1z+naDXUIk4ABBtA6ERz8HE9IJIdlG8/zfy8M7bccJM0
	CZGorBa5Gr+VGfNwefqJa1Q8C+Y3LZ022/lnbZhZfZkUbtGw+NR7NRzDeDd+A8caOiipDq1oC8F
	oWVuI/NhvqHQFH/HhfFcTedJqIQkigpzt9sdjrwr8G7pBoYEAbRuQgNAyq836dDdEyrlIKY6yF9
	oc
X-Google-Smtp-Source: AGHT+IEhD635R3krOC8v5Rmh/hPH6KAO3sEVvX2wlmdqOAORbraZ6ZGaOxMqY5m7NTs5kmtWp+5Uag==
X-Received: by 2002:a5d:64c4:0:b0:3b7:6804:9362 with SMTP id ffacd0b85a97d-3b8d94837b7mr11094043f8f.26.1754409832732;
        Tue, 05 Aug 2025 09:03:52 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/hpet: do local APIC EOI after interrupt processing
Date: Tue,  5 Aug 2025 18:03:26 +0200
Message-ID: <20250805160326.78837-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current logic in the HPET interrupt ->ack() hook will perform a local
APIC EOI ahead of enabling interrupts, possibly leading to recursion in the
interrupt handler.

Fix this by doing the local APIC EOI strictly after the window with
interrupt enabled, as that prevents the recursion, and would only allow for
interrupts with higher priority to be serviced.

Use the generic ack_nonmaskable_msi_irq() and end_nonmaskable_irq()
functions, removing the need for hpet_msi_ack().

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Fixes: 3ba523ff957c ('CPUIDLE: enable MSI capable HPET for timer broadcast')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hpet.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index 192de433cfd1..d05b5eb1361f 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -303,13 +303,6 @@ static unsigned int cf_check hpet_msi_startup(struct irq_desc *desc)
 
 #define hpet_msi_shutdown hpet_msi_mask
 
-static void cf_check hpet_msi_ack(struct irq_desc *desc)
-{
-    irq_complete_move(desc);
-    move_native_irq(desc);
-    ack_APIC_irq();
-}
-
 static void cf_check hpet_msi_set_affinity(
     struct irq_desc *desc, const cpumask_t *mask)
 {
@@ -337,7 +330,8 @@ static hw_irq_controller hpet_msi_type = {
     .shutdown   = hpet_msi_shutdown,
     .enable	    = hpet_msi_unmask,
     .disable    = hpet_msi_mask,
-    .ack        = hpet_msi_ack,
+    .ack        = ack_nonmaskable_msi_irq,
+    .end        = end_nonmaskable_irq,
     .set_affinity   = hpet_msi_set_affinity,
 };
 
-- 
2.49.0


