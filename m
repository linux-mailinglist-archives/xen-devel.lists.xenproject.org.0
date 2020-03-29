Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CEF196B8A
	for <lists+xen-devel@lfdr.de>; Sun, 29 Mar 2020 08:40:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIRa2-0002qC-BF; Sun, 29 Mar 2020 06:37:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NY0J=5O=gmail.com=singhalsimran0@srs-us1.protection.inumbo.net>)
 id 1jIRa0-0002q7-Cx
 for xen-devel@lists.xenproject.org; Sun, 29 Mar 2020 06:37:56 +0000
X-Inumbo-ID: d24d6694-7187-11ea-a6c1-bc764e2007e4
Received: from mail-pj1-x1044.google.com (unknown [2607:f8b0:4864:20::1044])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d24d6694-7187-11ea-a6c1-bc764e2007e4;
 Sun, 29 Mar 2020 06:37:55 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id nu11so5819175pjb.1
 for <xen-devel@lists.xenproject.org>; Sat, 28 Mar 2020 23:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=WBEeVm4RLpsx9e4F/bolW2KkhvN0Zlwk+f3dMUDwJ5E=;
 b=RMt/sAWZCF3NkU32rXs4Miy2Ui1crVxd808Qr6U0cEbjngo+ntr4oz5BA9/JS5P+mE
 lnfIl5OuBNt13GjPyrtc/sEIvB+Kax49S2V0arz9QBEQay+DYK2vhM06dIEDRlwB9Po3
 MQ+6kyn2BnSMg8mNI/qJM6mNlL3SpwtBcZ6exf6Do7K613QGkqHrCVtxw2zbe+gslyS5
 J/x1nWUnE8wJUwsRo5vifM8rEi4kT+qH+gQUh99k8OORhu5ynpEY+9IdB3ampFBktpCS
 3H9AmGKIbtqXFvaqp+abExsltTgQBeKko9w+MngkK/YoM+lQo36Zjx+GjL79otufq7nr
 jwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=WBEeVm4RLpsx9e4F/bolW2KkhvN0Zlwk+f3dMUDwJ5E=;
 b=m4c4c3szX39b0w+na1CpTmwNs8zzEDTUmVRkWOkyERFLU0a0qtBAO4e78mEO3KJBl5
 9ur5a5eWQX3OUKknoO4j5PrBXQJHAMqyH3j3N/QSVsdU/u+r5e2wTabb7RygRBks9PMJ
 y8KpNseKcz6i0y1Jlh2CKnE69IH4Nw7Ed0h5FHgGQ2S08zwpV38gBK49mHHkhi5HODoq
 hKnNl8JzeI6SAzGEUS8UN3l1ePo54zxD4PxNkGU7tXJuEVbRQgJTGpiHPDByhaD5xE0f
 yY2Ov9kKqBhppPoTnSBVLGE+3f+FV2xzuuheMY4tvc5YmOs5qQ7WSsvWG3zhvSIzuyy0
 OmTw==
X-Gm-Message-State: ANhLgQ230o9dDG2Vj4/RsNpS9JGSyEn5NqPcilNv+efMiQbMFLDYRHMv
 HrzIoq5qkZ+nK8xFeflm4jI=
X-Google-Smtp-Source: ADFU+vtBdlTwBDSl/CGtW56YxORHlfiQk2XhPFOw2n5uebbkfXCBuU+14+wP61fMiLMZWYQGoyF/GQ==
X-Received: by 2002:a17:90a:24c5:: with SMTP id
 i63mr8804181pje.177.1585463874517; 
 Sat, 28 Mar 2020 23:37:54 -0700 (PDT)
Received: from simran-Inspiron-5558 ([2409:4052:2ea9:879:e86a:3263:71b5:b71b])
 by smtp.gmail.com with ESMTPSA id
 a26sm7187384pgn.14.2020.03.28.23.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Mar 2020 23:37:53 -0700 (PDT)
Date: Sun, 29 Mar 2020 12:07:47 +0530
From: Simran Singhal <singhalsimran0@gmail.com>
To: xen-devel@lists.xenproject.org
Message-ID: <20200329063747.GA13063@simran-Inspiron-5558>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: [Xen-devel] [PATCH] xen/x86: Remove parentheses from return
 arguments
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This patch remove unnecessary parentheses from return arguments.

Signed-off-by: Simran Singhal <singhalsimran0@gmail.com>
---
 xen/arch/x86/cpu/mcheck/mctelem.c | 2 +-
 xen/arch/x86/hvm/irq.c            | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mctelem.c b/xen/arch/x86/cpu/mcheck/mctelem.c
index 012a9b95e5..329ac20faf 100644
--- a/xen/arch/x86/cpu/mcheck/mctelem.c
+++ b/xen/arch/x86/cpu/mcheck/mctelem.c
@@ -382,7 +382,7 @@ mctelem_cookie_t mctelem_reserve(mctelem_class_t which)
 
 		if (bit >= MC_NENT) {
 			mctelem_drop_count++;
-			return (NULL);
+			return NULL;
 		}
 
 		/* try to allocate, atomically clear free bit */
diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index b3ee0d9130..9c8adbc495 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -693,7 +693,7 @@ static int irq_save_isa(struct vcpu *v, hvm_domain_context_t *h)
     struct hvm_irq *hvm_irq = hvm_domain_irq(d);
 
     /* Save ISA IRQ lines */
-    return ( hvm_save_entry(ISA_IRQ, 0, h, &hvm_irq->isa_irq) );
+    return hvm_save_entry(ISA_IRQ, 0, h, &hvm_irq->isa_irq);
 }
 
 static int irq_save_link(struct vcpu *v, hvm_domain_context_t *h)
@@ -702,7 +702,7 @@ static int irq_save_link(struct vcpu *v, hvm_domain_context_t *h)
     struct hvm_irq *hvm_irq = hvm_domain_irq(d);
 
     /* Save PCI-ISA link state */
-    return ( hvm_save_entry(PCI_LINK, 0, h, &hvm_irq->pci_link) );
+    return hvm_save_entry(PCI_LINK, 0, h, &hvm_irq->pci_link);
 }
 
 static int irq_load_pci(struct domain *d, hvm_domain_context_t *h)
-- 
2.17.1


