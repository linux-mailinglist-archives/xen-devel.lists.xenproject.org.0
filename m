Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FBE27E6DB
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 12:41:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547.1847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNZYA-0000tn-Uz; Wed, 30 Sep 2020 10:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547.1847; Wed, 30 Sep 2020 10:41:30 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNZYA-0000t1-Ov; Wed, 30 Sep 2020 10:41:30 +0000
Received: by outflank-mailman (input) for mailman id 547;
 Wed, 30 Sep 2020 10:41:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kNZY8-0000iF-TG
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:41:28 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dbbed260-1448-4b06-b450-2b5629291895;
 Wed, 30 Sep 2020 10:41:19 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kNZY8-0000iF-TG
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:41:28 +0000
X-Inumbo-ID: dbbed260-1448-4b06-b450-2b5629291895
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id dbbed260-1448-4b06-b450-2b5629291895;
	Wed, 30 Sep 2020 10:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601462480;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t4Ain2p4zO9shJgscacO/9+ZH91qar8dV9QuwgmNWw8=;
  b=gXw/gbhK83t3NkpIbNwKrJe3TJ8S8Oo0EVe03bjPmUthjg8VhGCtbko1
   p8Gguvo/supIeu5iu8XZRsgNfzXGlDVj3lBeucb6nKsIsN9JB1ssjbfQK
   9vfbvaIc2Ul/mpRg9WvEjL5yfiQm+wxsONllUxCQRS1g0KSUE7OoORpbs
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: fM09o8c1S2wi1XSuvrsH2GctekxJNZ9to+YjAiBoMHRxIOou/u4gk/pRe6n/Pv2AKlZZvK3oMQ
 iFrNk8jFrbbfB83As+40/EzYrmpOfbJINMWwRmDick+9JerA0GvPzVdZNNVbZD0uaI4IauKulw
 x5NUAFNBZ6r6dnmO32x4Z0rowT3XT/2X67l5HjkGYlWohLLEfIEsl+qRYZdc2mPJ7BEtmlHDZC
 4SpV6wD/rVpz7qlRkTgxSGtTN5Akkj+qzWm4IA2fPEhCQxYvswBkJa4z0dbnAo0IObuLViW1bX
 hYk=
X-SBRS: None
X-MesageID: 27954186
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,322,1596513600"; 
   d="scan'208";a="27954186"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: [PATCH v2 02/11] x86/hvm: drop domain parameter from vioapic/vpic EOI callbacks
Date: Wed, 30 Sep 2020 12:40:59 +0200
Message-ID: <20200930104108.35969-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930104108.35969-1-roger.pau@citrix.com>
References: <20200930104108.35969-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

EOIs are always executed in guest vCPU context, so there's no reason to
pass a domain parameter around as can be fetched from current->domain.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/hvm/vioapic.c   | 2 +-
 xen/arch/x86/hvm/vpic.c      | 3 +--
 xen/drivers/passthrough/io.c | 4 ++--
 xen/include/asm-x86/hvm/io.h | 3 +--
 4 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 0fb9147d99..752fc410db 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -522,7 +522,7 @@ void vioapic_update_EOI(unsigned int vector)
             if ( is_iommu_enabled(d) )
             {
                 spin_unlock(&d->arch.hvm.irq_lock);
-                hvm_dpci_eoi(d, vioapic->base_gsi + pin, ent);
+                hvm_dpci_eoi(vioapic->base_gsi + pin, ent);
                 spin_lock(&d->arch.hvm.irq_lock);
             }
 
diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index 3cf12581e9..26f74f4471 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -262,8 +262,7 @@ static void vpic_ioport_write(
                 /* Release lock and EOI the physical interrupt (if any). */
                 vpic_update_int_output(vpic);
                 vpic_unlock(vpic);
-                hvm_dpci_eoi(current->domain,
-                             hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin),
+                hvm_dpci_eoi(hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin),
                              NULL);
                 return; /* bail immediately */
             case 6: /* Set Priority                */
diff --git a/xen/drivers/passthrough/io.c b/xen/drivers/passthrough/io.c
index 54f3e7b540..536e91ad76 100644
--- a/xen/drivers/passthrough/io.c
+++ b/xen/drivers/passthrough/io.c
@@ -1003,9 +1003,9 @@ static void hvm_gsi_eoi(struct domain *d, unsigned int gsi,
     hvm_pirq_eoi(pirq, ent);
 }
 
-void hvm_dpci_eoi(struct domain *d, unsigned int guest_gsi,
-                  const union vioapic_redir_entry *ent)
+void hvm_dpci_eoi(unsigned int guest_gsi, const union vioapic_redir_entry *ent)
 {
+    struct domain *d = current->domain;
     const struct hvm_irq_dpci *hvm_irq_dpci;
     const struct hvm_girq_dpci_mapping *girq;
 
diff --git a/xen/include/asm-x86/hvm/io.h b/xen/include/asm-x86/hvm/io.h
index adec0f566a..b05f619435 100644
--- a/xen/include/asm-x86/hvm/io.h
+++ b/xen/include/asm-x86/hvm/io.h
@@ -118,8 +118,7 @@ bool handle_mmio_with_translation(unsigned long gla, unsigned long gpfn,
                                   struct npfec);
 bool handle_pio(uint16_t port, unsigned int size, int dir);
 void hvm_interrupt_post(struct vcpu *v, int vector, int type);
-void hvm_dpci_eoi(struct domain *d, unsigned int guest_irq,
-                  const union vioapic_redir_entry *ent);
+void hvm_dpci_eoi(unsigned int guest_irq, const union vioapic_redir_entry *ent);
 void msix_write_completion(struct vcpu *);
 
 #ifdef CONFIG_HVM
-- 
2.28.0


