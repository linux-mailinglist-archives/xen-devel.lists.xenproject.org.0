Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EED19255D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 11:22:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH38R-0001CX-Fb; Wed, 25 Mar 2020 10:19:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lu4h=5K=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jH38Q-0001C4-76
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 10:19:42 +0000
X-Inumbo-ID: 2364727e-6e82-11ea-85c5-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2364727e-6e82-11ea-85c5-12813bfff9fa;
 Wed, 25 Mar 2020 10:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585131582;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iSLtQ1Z80LjlT3eP+GudnUv8D3/jZLE5hgvIgqVuyaY=;
 b=bqlUL8XgTAlhxQSwvUe/BEX9YXvb3P/subhj2us5Xg55GZfFEs/a+CpF
 k8LIlFayg1ZFbTwCEOq03WnywvOab3iKNVNWUGMk8wpZaF4dK2LJ7XLpg
 VNe8jrl/FGFrx+E0vji6qAjK0L9YqDVWhkX90fKeUZ0dS8T6BIh/1G4VV A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: IzG8s6y98iNs9VFz8rtU8OztE67uLr0yAbMAHf4bIaSRQ7GBaIiSZrbZrIFnA0hhnTtqDzvxDt
 +Nc/w2eXrt6LgW0ZaiiNPcPvpRkSpWfnFAl4Nxy4PXpcZBqQyF2hv2V9P43sLyqPI+dwXTwp0E
 CMlLWVqCFo5kAG9udrH4iXu2g1dqtjdO/KjXl8N0bnRzlo5Tgwj2DzR1BDNjpavJ9cI/iqJQbk
 c1gc7FFQD7kwuVXnSq++kx5iZ8gaSsBnfsL1QKFEwMqVqTjcHXSaC0DFfBsAMQuZMBM12r4zso
 NyM=
X-SBRS: 2.7
X-MesageID: 14580739
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,304,1580792400"; d="scan'208";a="14580739"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 25 Mar 2020 11:19:10 +0100
Message-ID: <20200325101910.29168-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200325101910.29168-1-roger.pau@citrix.com>
References: <20200325101910.29168-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH v2 4/4] x86/nvmx: update exit bitmap when using
 virtual interrupt delivery
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Force an update of the EOI exit bitmap in nvmx_update_apicv, because
the one performed in vmx_intr_assist might not be reached if the
interrupt is intercepted by nvmx_intr_intercept returning true.

Extract the code to update the exit bitmap from vmx_intr_assist into a
helper and use it in nvmx_update_apicv.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Reword commit message.
---
 xen/arch/x86/hvm/vmx/intr.c       | 21 +++++++++++++--------
 xen/arch/x86/hvm/vmx/vvmx.c       |  2 ++
 xen/include/asm-x86/hvm/vmx/vmx.h |  2 ++
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index 49a1295f09..000e14af49 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -224,6 +224,18 @@ static int nvmx_intr_intercept(struct vcpu *v, struct hvm_intack intack)
     return 0;
 }
 
+void vmx_sync_exit_bitmap(struct vcpu *v)
+{
+    const unsigned int n = ARRAY_SIZE(v->arch.hvm.vmx.eoi_exit_bitmap);
+    unsigned int i;
+
+    while ( (i = find_first_bit(&v->arch.hvm.vmx.eoi_exitmap_changed, n)) < n )
+    {
+        clear_bit(i, &v->arch.hvm.vmx.eoi_exitmap_changed);
+        __vmwrite(EOI_EXIT_BITMAP(i), v->arch.hvm.vmx.eoi_exit_bitmap[i]);
+    }
+}
+
 void vmx_intr_assist(void)
 {
     struct hvm_intack intack;
@@ -318,7 +330,6 @@ void vmx_intr_assist(void)
               intack.source != hvm_intsrc_vector )
     {
         unsigned long status;
-        unsigned int i, n;
 
        /*
         * intack.vector is the highest priority vector. So we set eoi_exit_bitmap
@@ -379,13 +390,7 @@ void vmx_intr_assist(void)
                     intack.vector;
         __vmwrite(GUEST_INTR_STATUS, status);
 
-        n = ARRAY_SIZE(v->arch.hvm.vmx.eoi_exit_bitmap);
-        while ( (i = find_first_bit(&v->arch.hvm.vmx.eoi_exitmap_changed,
-                                    n)) < n )
-        {
-            clear_bit(i, &v->arch.hvm.vmx.eoi_exitmap_changed);
-            __vmwrite(EOI_EXIT_BITMAP(i), v->arch.hvm.vmx.eoi_exit_bitmap[i]);
-        }
+        vmx_sync_exit_bitmap(v);
 
         pt_intr_post(v, intack);
     }
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 8431c912a1..845dd87f75 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1418,6 +1418,8 @@ static void nvmx_update_apicv(struct vcpu *v)
         status |= rvi & VMX_GUEST_INTR_STATUS_SUBFIELD_BITMASK;
         __vmwrite(GUEST_INTR_STATUS, status);
     }
+
+    vmx_sync_exit_bitmap(v);
 }
 
 static void virtual_vmexit(struct cpu_user_regs *regs)
diff --git a/xen/include/asm-x86/hvm/vmx/vmx.h b/xen/include/asm-x86/hvm/vmx/vmx.h
index b334e1ec94..111ccd7e61 100644
--- a/xen/include/asm-x86/hvm/vmx/vmx.h
+++ b/xen/include/asm-x86/hvm/vmx/vmx.h
@@ -610,6 +610,8 @@ void update_guest_eip(void);
 void vmx_pi_per_cpu_init(unsigned int cpu);
 void vmx_pi_desc_fixup(unsigned int cpu);
 
+void vmx_sync_exit_bitmap(struct vcpu *v);
+
 #ifdef CONFIG_HVM
 void vmx_pi_hooks_assign(struct domain *d);
 void vmx_pi_hooks_deassign(struct domain *d);
-- 
2.26.0


