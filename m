Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FC5AB9DF2
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 15:50:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987211.1372642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFvSI-0004WV-AQ; Fri, 16 May 2025 13:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987211.1372642; Fri, 16 May 2025 13:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFvSI-0004U0-6s; Fri, 16 May 2025 13:50:30 +0000
Received: by outflank-mailman (input) for mailman id 987211;
 Fri, 16 May 2025 13:50:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H0hO=YA=bounce.vates.tech=bounce-md_30504962.682742a1.v1-34bc3b81b0104c4881c63d7a997c5f59@srs-se1.protection.inumbo.net>)
 id 1uFvSG-00038z-E2
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 13:50:28 +0000
Received: from mail187-4.suw11.mandrillapp.com
 (mail187-4.suw11.mandrillapp.com [198.2.187.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b84f5bb7-325c-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 15:50:26 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-4.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4ZzT411FvrzlfcPK
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 13:50:25 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 34bc3b81b0104c4881c63d7a997c5f59; Fri, 16 May 2025 13:50:25 +0000
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
X-Inumbo-ID: b84f5bb7-325c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1747403425; x=1747673425;
	bh=Pb2Nd/Hl+Fu+r4N2HLILmZb2CYCIP0DxQZNBb842Blg=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=sQbVtfkdJPS/wZNJGnvj39DQP0TjnFsJlZh5l+zhjNRoY6zVkTd9vJvCYUtZ3Shag
	 qYGG2fT8+s001qA+ibglYMQqR57MxXlGP1S7u0owGn+f6QEWje1QrLXxlFoioRkAWr
	 m/GgWu+LKjvSJSsjuWEx/z3AbDHIaruMCZ2G1ng+9fJUUrG00Lf1vuYGDuUTBofPCf
	 0U5vOHp6aRYsnAZzdH47/zn5tiJXnA3REfWGSanVLLw1EgjakxeuokIySS31Uo3dMR
	 f8YaQAbGchhmdvfvQUZgNnG1oUeFlO+gopqc6w4NyhnuuRK0I7EWbS1nfVtgtz3xZS
	 fqFV0Qzwp/1FQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1747403425; x=1747663925; i=teddy.astie@vates.tech;
	bh=Pb2Nd/Hl+Fu+r4N2HLILmZb2CYCIP0DxQZNBb842Blg=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=F+VbRV+fHqM4e8/X5pOt5MzqiyqyVqSTVwiVTFROhsiIHmxLb2jT7/rFm7yZs3OTR
	 wo/j1/nwSr+WxraFpmwzmOJaVSR/l2Y2c65HXwDFEq1k0cL5Xb6rx5sBt00AkCf/2n
	 /aipzOTyuN5J2L0XEq7ayYROeKpzgtjGO2MNk8x+cYCRGcCiE4xrkno2zeRwC3ZTqg
	 KpMbuyZLKjmDgsCCcZw+VB9+1/kCnAns5NuVfsXmjdqoos7XKgNmkIgg712dKOiogN
	 AKmt6D1kQ9MD+/Z3O9btVVikizKq3X5QNwyHpYG9zBLsN2HLcEU/WabMZZLSLjCPjT
	 i7NgKbMdp6ipw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH]=20xen:=20Introduce=20extra=20IRQ=20count=20domain=20creation=20parameter?=
X-Mailer: git-send-email 2.49.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1747403424440
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>
Message-Id: <9a746a8b2e9ee68a398795ecb5dcb53697aeece4.1747403245.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.34bc3b81b0104c4881c63d7a997c5f59?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250516:md
Date: Fri, 16 May 2025 13:50:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

When doing PCI Passthrough with high-IRQ devices (e.g NVMe drives),
the default limit may be unefficient as not all domains requires
more IRQs.

Introduce a new parameter to allow the toolstack to tune the IRQ
count if more is required.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
0 extra_irqs is meaningful, though I am not sure how to expose this
special case.

This of course wants libxl support next.
---
 xen/common/domain.c         | 8 +++++---
 xen/include/public/domctl.h | 3 +++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index abf1969e60..5c628962fc 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -912,10 +912,12 @@ struct domain *domain_create(domid_t domid,
 
 #ifdef CONFIG_HAS_PIRQ
     if ( !is_hardware_domain(d) )
-        d->nr_pirqs = nr_static_irqs + extra_domU_irqs;
+        d->nr_pirqs = nr_static_irqs + config->extra_irqs ?: extra_domU_irqs;
     else
-        d->nr_pirqs = extra_hwdom_irqs ? nr_static_irqs + extra_hwdom_irqs
-                                       : arch_hwdom_irqs(d);
+    {
+        unsigned int extra_irqs = config->extra_irqs ?: extra_hwdom_irqs;
+        d->nr_pirqs = extra_irqs ? nr_static_irqs + extra_irqs : arch_hwdom_irqs(d);
+    }
     d->nr_pirqs = min(d->nr_pirqs, nr_irqs);
 
     radix_tree_init(&d->pirq_tree);
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 5b2063eed9..e4bb366c78 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -121,6 +121,9 @@ struct xen_domctl_createdomain {
     /* CPU pool to use; specify 0 or a specific existing pool */
     uint32_t cpupool_id;
 
+    /* Additional IRQ for this guest. 0 to use Xen default value. */
+    uint32_t extra_irqs;
+
     struct xen_arch_domainconfig arch;
 };
 
-- 
2.49.0



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


