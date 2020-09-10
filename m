Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B7F26509C
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 22:22:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGT5q-0004Rv-Fq; Thu, 10 Sep 2020 20:22:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQLO=CT=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kGT5o-0004JK-Su
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 20:22:52 +0000
X-Inumbo-ID: 1696cf62-9a76-4809-bd20-4d87dfc09198
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1696cf62-9a76-4809-bd20-4d87dfc09198;
 Thu, 10 Sep 2020 20:22:33 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id m5so4299563lfp.7
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2020 13:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=F6QWDalSsEZqTRlINIogmaX7+ZyzDHTCG9cMtOtEtMc=;
 b=YujSj4+aoQA5vQF48bLihwn9LM7NiDastVOAJGS7Nnl9WtylvKGwSzQM/Jp+Fj4K/P
 bSWH2HyGu9S4sYiDCuHXiqBPlebuqCyPmGF9GfHhrli7N90yqr2xTGAKVjCc4CTwWPqU
 leRIgL5WrHgA4B8kI71U442v5crb39G0Rc0069GidZXjymxqIdZYi6yfZGh3si55WVUY
 cUOPiMqxbfD7MJajWmyZCfN1gHDGbt+MOmD8h68/4Ki4Qp7JZW1dFTiBoh8h1o9SLUsJ
 2cUnIPR4CphoJvIvpAomP5IZUD+mZOzwa0nqcddFbljN9hUIeyvlGbJR+t8uSdqfERDL
 9X7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=F6QWDalSsEZqTRlINIogmaX7+ZyzDHTCG9cMtOtEtMc=;
 b=BL0mfiZHJSSlXMqpDqazIQ4TAv5+R3Y3Z5gViwM+HgLZa+4rgvT+l24WcFmIn2VUoH
 ZATiq9ZcYB0Tj3xeGv9hwBPP+iCGRunwgPV0Ereq02eF2wQswBqeRss4KJ+G4/Yxd/DU
 uoR1Gj1ityy6QXmjTzYGrbudTBeuOkOCW6gKeEkYRNl0pzi2a365UeKN6uFc0HQ23NTS
 df5hjTzb+ZVLpSzDEv+AiQG9RNKWQ3Vy/S+QyVOzOw/B+PWlN8uPqkBW02VWT66rJSP3
 eZkyQzedo7u9h8PcyDoNjxKVNljLWIWEzACwEa+SomVtBXyvMP8fJtLLhFjocm4+1E+8
 nc+Q==
X-Gm-Message-State: AOAM530pzW2JBLWapkVVdlEDy5XvGav766gr8GE/xJa+jr6I/DhSLWhl
 rGVX/Ge34NRQ+/S9TCUzFe04OLnhH22dBQ==
X-Google-Smtp-Source: ABdhPJyTbkNlNibKINAgzwYl6JWQ5C6zWZAEhtUThXYGMnPTg0ezEJm/8XmSQKKAjiDeVcglSbCeBQ==
X-Received: by 2002:a05:6512:512:: with SMTP id
 o18mr4994141lfb.98.1599769352032; 
 Thu, 10 Sep 2020 13:22:32 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u5sm1584375lfq.17.2020.09.10.13.22.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Sep 2020 13:22:31 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
Subject: [PATCH V1 05/16] xen/ioreq: Make x86's hvm_mmio_first(last)_byte()
 common
Date: Thu, 10 Sep 2020 23:21:59 +0300
Message-Id: <1599769330-17656-6-git-send-email-olekstysh@gmail.com>
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

The IOREQ is a common feature now and these helpers will be used
on Arm as is. Move them to include/xen/ioreq.h

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - new patch
---
---
 xen/arch/x86/hvm/intercept.c |  1 +
 xen/include/asm-x86/hvm/io.h | 16 ----------------
 xen/include/xen/ioreq.h      | 16 ++++++++++++++++
 3 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/hvm/intercept.c b/xen/arch/x86/hvm/intercept.c
index cd4c4c1..891e497 100644
--- a/xen/arch/x86/hvm/intercept.c
+++ b/xen/arch/x86/hvm/intercept.c
@@ -17,6 +17,7 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/ioreq.h>
 #include <xen/types.h>
 #include <xen/sched.h>
 #include <asm/regs.h>
diff --git a/xen/include/asm-x86/hvm/io.h b/xen/include/asm-x86/hvm/io.h
index 558426b..fb64294 100644
--- a/xen/include/asm-x86/hvm/io.h
+++ b/xen/include/asm-x86/hvm/io.h
@@ -40,22 +40,6 @@ struct hvm_mmio_ops {
     hvm_mmio_write_t write;
 };
 
-static inline paddr_t hvm_mmio_first_byte(const ioreq_t *p)
-{
-    return unlikely(p->df) ?
-           p->addr - (p->count - 1ul) * p->size :
-           p->addr;
-}
-
-static inline paddr_t hvm_mmio_last_byte(const ioreq_t *p)
-{
-    unsigned long size = p->size;
-
-    return unlikely(p->df) ?
-           p->addr + size - 1:
-           p->addr + (p->count * size) - 1;
-}
-
 typedef int (*portio_action_t)(
     int dir, unsigned int port, unsigned int bytes, uint32_t *val);
 
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index 2240a73..9521170 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -35,6 +35,22 @@ static inline struct hvm_ioreq_server *get_ioreq_server(const struct domain *d,
     return GET_IOREQ_SERVER(d, id);
 }
 
+static inline paddr_t hvm_mmio_first_byte(const ioreq_t *p)
+{
+    return unlikely(p->df) ?
+           p->addr - (p->count - 1ul) * p->size :
+           p->addr;
+}
+
+static inline paddr_t hvm_mmio_last_byte(const ioreq_t *p)
+{
+    unsigned long size = p->size;
+
+    return unlikely(p->df) ?
+           p->addr + size - 1:
+           p->addr + (p->count * size) - 1;
+}
+
 static inline bool hvm_ioreq_needs_completion(const ioreq_t *ioreq)
 {
     return ioreq->state == STATE_IOREQ_READY &&
-- 
2.7.4


