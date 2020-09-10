Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53547265095
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 22:22:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGT5b-0004L6-Aq; Thu, 10 Sep 2020 20:22:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQLO=CT=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kGT5Z-0004JK-SQ
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 20:22:37 +0000
X-Inumbo-ID: 615a7b06-77e9-434c-adba-99eba638ef79
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 615a7b06-77e9-434c-adba-99eba638ef79;
 Thu, 10 Sep 2020 20:22:31 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id q8so4313259lfb.6
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2020 13:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DqUjBinZS4E0rsQSBH7fpI0azvlrep7MUViq+OD7Ja0=;
 b=p2J5PgA0VKYSaAWskJjrOiDMfu4GqtgJ5kr1KtqfJrQJW0dvmJT3hwLPZIkhRNCX57
 X82FVpO+oPxrZQAuYVoKC/2PYGULqTU7rsID+RLm87nanwVwc06QR/jN74xx6AcK4n9C
 /UTEyl/kE33Dp0W1B90KbBT0btX5eluV6JrhFxNRPgjZt+zrciMg/JlhGrJ6oh4Z2G8X
 1z07HxAa/DHtp2/e8EtKqgIcQvWPhutp+AensBFmAkvotUM8wknJw4G9qklJWE/QGwbf
 xmX+QbZCmIhzSQqb9bZn6nBDz/uXM2UfsXMX1mqj+ylNPiKJHyEzG7DkgFTSd2zEQSvw
 yHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DqUjBinZS4E0rsQSBH7fpI0azvlrep7MUViq+OD7Ja0=;
 b=mHkhianTOni2ep2cwkTCnftnRJUKLXh1s6MJPAPnhmrMaPZ1pDpa7iUJVY5o09XAn8
 sI3nNprso47o9FOV7sOmdihArfAOEL7O64m2RXRHrUzW6fy8UAnc4vhkRS83NyuumCTH
 5dDer/7uN3t6dUS/o6ytDdv16A/DCyJKFcJSyYUomjBc6Ucq9qLceymQrhXBoC4lCu+Q
 yuQtwEMVmM1dyELGgGdeyzs+pIkwwko35Wtvc3NE/6hSEslc5m3G9RVBvN4aBWfTBFOX
 ijVPdHSYG0YBk3pegR9FB+JoW+3FhPGi5gGgFTCG3WbnFjbIaTsuAmaLmccbllQQAu3p
 6B8w==
X-Gm-Message-State: AOAM530BfZa/6VHgvViZeFuruy06cL56xxqctBzHWEuJuzZMQixMhZpK
 YNp43fwGuyVBjo8aFxQpwD1qa69BI08DwQ==
X-Google-Smtp-Source: ABdhPJzuCtduuUSIUZ5blQGPVg91+wAqNwvPMKuyZZ+vbehi5FkdWY0yliC32mFAQFakCVZmyJ/nBw==
X-Received: by 2002:a05:6512:207:: with SMTP id
 a7mr5033608lfo.127.1599769349574; 
 Thu, 10 Sep 2020 13:22:29 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u5sm1584375lfq.17.2020.09.10.13.22.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Sep 2020 13:22:28 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
Subject: [PATCH V1 03/16] xen/ioreq: Make x86's hvm_ioreq_needs_completion()
 common
Date: Thu, 10 Sep 2020 23:21:57 +0300
Message-Id: <1599769330-17656-4-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The IOREQ is a common feature now and this helper will be used
on Arm as is. Move it to include/xen/ioreq.h

Although PIO handling on Arm is not introduced with the current series
(it will be implemented when we add support for vPCI), technically
the PIOs exist on Arm (however they are accessed the same way as MMIO)
and it would be better not to diverge now.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - new patch, was split from:
     "[RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common"
---
---
 xen/arch/x86/hvm/vmx/realmode.c | 1 +
 xen/include/asm-x86/hvm/vcpu.h  | 7 -------
 xen/include/xen/ioreq.h         | 7 +++++++
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/realmode.c b/xen/arch/x86/hvm/vmx/realmode.c
index bdbd9cb..292a7c3 100644
--- a/xen/arch/x86/hvm/vmx/realmode.c
+++ b/xen/arch/x86/hvm/vmx/realmode.c
@@ -10,6 +10,7 @@
  */
 
 #include <xen/init.h>
+#include <xen/ioreq.h>
 #include <xen/lib.h>
 #include <xen/sched.h>
 #include <xen/paging.h>
diff --git a/xen/include/asm-x86/hvm/vcpu.h b/xen/include/asm-x86/hvm/vcpu.h
index 5ccd075..6c1feda 100644
--- a/xen/include/asm-x86/hvm/vcpu.h
+++ b/xen/include/asm-x86/hvm/vcpu.h
@@ -91,13 +91,6 @@ struct hvm_vcpu_io {
     const struct g2m_ioport *g2m_ioport;
 };
 
-static inline bool hvm_ioreq_needs_completion(const ioreq_t *ioreq)
-{
-    return ioreq->state == STATE_IOREQ_READY &&
-           !ioreq->data_is_ptr &&
-           (ioreq->type != IOREQ_TYPE_PIO || ioreq->dir != IOREQ_WRITE);
-}
-
 struct nestedvcpu {
     bool_t nv_guestmode; /* vcpu in guestmode? */
     void *nv_vvmcx; /* l1 guest virtual VMCB/VMCS */
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index f846034..2240a73 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -35,6 +35,13 @@ static inline struct hvm_ioreq_server *get_ioreq_server(const struct domain *d,
     return GET_IOREQ_SERVER(d, id);
 }
 
+static inline bool hvm_ioreq_needs_completion(const ioreq_t *ioreq)
+{
+    return ioreq->state == STATE_IOREQ_READY &&
+           !ioreq->data_is_ptr &&
+           (ioreq->type != IOREQ_TYPE_PIO || ioreq->dir != IOREQ_WRITE);
+}
+
 bool hvm_io_pending(struct vcpu *v);
 bool handle_hvm_io_completion(struct vcpu *v);
 bool is_ioreq_server_page(struct domain *d, const struct page_info *page);
-- 
2.7.4


