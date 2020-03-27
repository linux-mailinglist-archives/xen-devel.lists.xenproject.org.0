Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F85B19577C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 13:48:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHoNi-0000Mt-25; Fri, 27 Mar 2020 12:46:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VSB4=5M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jHoNg-0000MV-LF
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 12:46:36 +0000
X-Inumbo-ID: fe39f8d6-7028-11ea-b34e-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe39f8d6-7028-11ea-b34e-bc764e2007e4;
 Fri, 27 Mar 2020 12:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585313197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PWdgpf2VNFim4DASMFtIg4/oBbPoSZCn7kKHoBitgBU=;
 b=E8lq3qrMvvFN4Dk8XitPdn8FePiJq/6qPD+rgkEIpu0amvmNNK9PhGll
 kYxJ/+9PpNZm8TLKr8XWQALk0Nj0YEI3H6+a65T/Wif+59owr68jDLAo0
 IsFGSQUuUk/dfbwzTZKZYGHA2ksm6QMIf5pPNR2Dnnf1wqoGJ6gs1gskK M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JPDzjwieW00I2bvR5PisSMv0oiskvvsco3cMoo4t8fC9YSGw4VfD9s9KV1yHnf0REjCnN0QMI3
 o4XGaMpMbGoudf1fvTUlM4QqnlmLE7jaHEzvxAqZhrUikoqljpLxUAkKt/QbnNIo6g4kZt6dez
 3U3oYcrRbNIqvRwFjZVKStdNCSVp5idLO683OV31zP7DNSbCUEwZNSNqxoscdoxxcz/fh9HlOg
 8Xqt2WOFlBZPVrRgm+JYzEmgBMTQEXpFGx8EuD4f8Q80YLcUAbC/6qYV/4vozuymHntu+DbGhr
 kBw=
X-SBRS: 2.7
X-MesageID: 14965711
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,312,1580792400"; d="scan'208";a="14965711"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 27 Mar 2020 13:45:59 +0100
Message-ID: <20200327124559.47992-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200327124559.47992-1-roger.pau@citrix.com>
References: <20200327124559.47992-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH v4 2/2] x86/nvmx: update exit bitmap when using
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
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
Changes since v2:
 - Only update the EOI exit bitmap if GUEST_INTR_STATUS is changed.

Changes since v1:
 - Reword commit message.
---
 xen/arch/x86/hvm/vmx/intr.c       | 21 +++++++++++++--------
 xen/arch/x86/hvm/vmx/vvmx.c       |  3 +++
 xen/include/asm-x86/hvm/vmx/vmx.h |  2 ++
 3 files changed, 18 insertions(+), 8 deletions(-)

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
index d63f417f9c..125cb87493 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1420,7 +1420,10 @@ static void nvmx_update_apicv(struct vcpu *v)
     }
 
     if ( status )
+    {
         __vmwrite(GUEST_INTR_STATUS, status);
+        vmx_sync_exit_bitmap(v);
+    }
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


