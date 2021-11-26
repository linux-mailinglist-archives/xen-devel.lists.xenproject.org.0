Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B8545EE85
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:05:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232758.403703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqauV-0006Dm-L3; Fri, 26 Nov 2021 13:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232758.403703; Fri, 26 Nov 2021 13:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqauV-00067X-64; Fri, 26 Nov 2021 13:05:03 +0000
Received: by outflank-mailman (input) for mailman id 232758;
 Fri, 26 Nov 2021 13:04:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqauR-0003W9-Ix
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:04:59 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7473ae67-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:04:58 +0100 (CET)
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
X-Inumbo-ID: 7473ae67-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931898;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Hp7PZvlLpwuVUaikk4pFAoTgRxWIqAcdM9EjJyWnZJg=;
  b=dZzm/MGH1Jqk1akeIXrgrGFYozVW/g0fzFW9p7d/ILmzGGAVn2/BuNmL
   7+R6fim1M0PI/IjlmKi+Jv4JRuc+b1C3r2hXLRdaEdDKbTD/bpc3GNf1K
   VbefWtBvk3cNGlvMAnaY0wjLC27Zvrac9W+J9joP/BUkmtU6csatpQORj
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 754iWkJep8g+aBPCoWQR/vX+YgDFkxXAhDT/yLpwpAyIC6+JFXFmqjFuwwEeoAIPigJcjyBvaU
 uOdUKbi8xZ0qWPZ7r8QkLz3Y4ghp3APc7SLN/Kp0VSCkYrO+H6gAkKwmbFUz9G/FI2HaftZfpb
 nl47wDu27YTjLSmxsgQWFMyKrmpulgDURSOcyl8elsW4WHNZfdfLjrrs7aRgABcNdcgH8iUyur
 +TbczlghJvY+UhrEbcm95F2nLLLxwBAnvRdoQXDyV5WWlfJgm204PsaxfL+0O2mhCwvLrIjPtz
 0dJdejd92KNut03CEFkqUYm2
X-SBRS: 5.1
X-MesageID: 59063951
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:N0Whf6jGAEHyjN7/GcMxLQtCX161rRcKZh0ujC45NGQN5FlHY01je
 htvXGHSO6yJYWugKIhwPoq3/EIEu5aBm9UxHQo4qCxmQSob9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cy34Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /18jJqITw4jb5H+neAQbBBpQyNAeql/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNauPP
 5RCOGc2BPjGSwNhF1YlUc4cpsuThXinbCR2gWqroZNitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRIDsXKdiewjqt6W+3i6nEmiaTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4ItQ80AeEwPvo0QOdC1cNf25DVpsijZpjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnFdE1ZcizX3iMRq10+UEI4/eEKgpoStQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtQezARVodt/xory9U
 J4swJP2AAcmV8zlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRkybZZaJGC4P
 BGP4mu9AaO/2lPxNsebhKrrVqwXIVXIT4y5Bpg4kPISCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGLq9NOdg5TciBgbX00wuQOHtO+zsNdMDlJI5fsLXkJIuSJRoxZybXF+
 G+TQEhdxAatjHHLM1zSOHtidKnuTdB0qndiZX4gOlOh2n4CZ4ez7fhAK8trLOd/rOEzn+RpS
 /QletmbBqgdQDrw5DlAP4L2q5ZvdUr3iFvWbTalejU2Y7VpWxfNpo3/ZgLq+SRXVni3uMIyr
 qeOzATeRZZfFQ1uANyPMKCkzk+rvGhbk+V3BhOaLt5WcUTq0Y5rNy2u0aNnf5BScU3On2LI2
 RyXDBEUofj2j7U0qNSZ17qZq4qJEvdlGhYIFWfs8rvrZzLR+XCuwNEcXb/QLyzdTm795I6re
 f5Rk6PnKPQCkVtH79h8HrJswf5s7tfjveYHnAFtHXGNZFW3ELJwZHKB2JAX5KFKw7ZYvyqwW
 16OpYYGaenYZpu9HQ5DPhchY8SCyeoQy2vb4vkCKUnn4DN6oeicWkJIMhjQ0CFQIdOZ6m/+L
 TvNbCLO1zGCtw==
IronPort-HdrOrdr: A9a23:RbVoy6ElWyrGWX9upLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5r
 mTdZUgpHnJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YZT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="59063951"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 50/65] x86/dpci: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:31 +0000
Message-ID: <20211126123446.32324-51-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hvm/hvm.c                | 4 ++--
 xen/drivers/passthrough/vtd/x86/hvm.c | 4 ++--
 xen/drivers/passthrough/x86/hvm.c     | 8 ++++----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index d5ca7a1ce636..1fba0efc54d1 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -513,8 +513,8 @@ void hvm_migrate_pirq(struct hvm_pirq_dpci *pirq_dpci, const struct vcpu *v)
     }
 }
 
-static int migrate_pirq(struct domain *d, struct hvm_pirq_dpci *pirq_dpci,
-                        void *arg)
+static int cf_check migrate_pirq(
+    struct domain *d, struct hvm_pirq_dpci *pirq_dpci, void *arg)
 {
     hvm_migrate_pirq(pirq_dpci, arg);
 
diff --git a/xen/drivers/passthrough/vtd/x86/hvm.c b/xen/drivers/passthrough/vtd/x86/hvm.c
index b531fe907a94..132d252d1cca 100644
--- a/xen/drivers/passthrough/vtd/x86/hvm.c
+++ b/xen/drivers/passthrough/vtd/x86/hvm.c
@@ -21,8 +21,8 @@
 #include <xen/irq.h>
 #include <xen/sched.h>
 
-static int _hvm_dpci_isairq_eoi(struct domain *d,
-                                struct hvm_pirq_dpci *pirq_dpci, void *arg)
+static int cf_check _hvm_dpci_isairq_eoi(
+    struct domain *d, struct hvm_pirq_dpci *pirq_dpci, void *arg)
 {
     struct hvm_irq *hvm_irq = hvm_domain_irq(d);
     unsigned int isairq = (long)arg;
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index 7a6d9ac3d40d..085d47beb44d 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -773,8 +773,8 @@ static void __msi_pirq_eoi(struct hvm_pirq_dpci *pirq_dpci)
     }
 }
 
-static int _hvm_dpci_msi_eoi(struct domain *d,
-                             struct hvm_pirq_dpci *pirq_dpci, void *arg)
+static int cf_check _hvm_dpci_msi_eoi(
+    struct domain *d, struct hvm_pirq_dpci *pirq_dpci, void *arg)
 {
     int vector = (long)arg;
 
@@ -943,8 +943,8 @@ void hvm_dpci_eoi(struct domain *d, unsigned int guest_gsi)
     spin_unlock(&d->event_lock);
 }
 
-static int pci_clean_dpci_irq(struct domain *d,
-                              struct hvm_pirq_dpci *pirq_dpci, void *arg)
+static int cf_check pci_clean_dpci_irq(
+    struct domain *d, struct hvm_pirq_dpci *pirq_dpci, void *arg)
 {
     struct dev_intx_gsi_link *digl, *tmp;
 
-- 
2.11.0


