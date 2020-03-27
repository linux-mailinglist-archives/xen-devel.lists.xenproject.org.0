Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE3C19577D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 13:49:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHoNf-0000Ll-P5; Fri, 27 Mar 2020 12:46:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VSB4=5M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jHoNe-0000LR-7a
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 12:46:34 +0000
X-Inumbo-ID: fb10c7b7-7028-11ea-896b-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb10c7b7-7028-11ea-896b-12813bfff9fa;
 Fri, 27 Mar 2020 12:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585313192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vuDzwVgr+LNfFk7axJFUEKJ0LDJ3Cp8KwBVbH5vk5Uw=;
 b=Irm3RGygx4SKITCAL5e8Yii29dbYaMsBF3RB1ghBz+FR3eOaU6XJA/Ol
 binxNdkgh3nAFJUSZLBOclGqwGxuwEdiuXLL0Dt1JOfFZDCsFaSoy5IKk
 lKrQ8q2tboxBz0n8BcbiLj9iQy1A+BjUj+Xt1ikPhrlmBSByznFzx4zfx 4=;
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
IronPort-SDR: O3r9oWbHWIiwQf5r5G6WWHi1vzAuFG8LeT33UtF6wB+yuHy2yGY5cOBf17nVEXLK6mv5bNQaib
 I3gEj6iB1HzdMa8q3j+BMiPhOAHYK977eXt7FXSPoWFuiuMWmXWro6k8+mRfMJCHUeaDbGmaR6
 QFEnIB60/0vcXM7ejTTPYUrObLu5jH0PnIlMQ/wq7AkmCDhPFatD9iA52/Vyx4VKaPiH9ovZIX
 lj5LFagSyauUKBjR2Eh4RCtlsGXSH88hnTyvLyeobR4uE9BAvEw4U3RYTia78aAw8f/fpj438U
 rPw=
X-SBRS: 2.7
X-MesageID: 14736035
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,312,1580792400"; d="scan'208";a="14736035"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 27 Mar 2020 13:45:58 +0100
Message-ID: <20200327124559.47992-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200327124559.47992-1-roger.pau@citrix.com>
References: <20200327124559.47992-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH v4 1/2] x86/nvmx: split updating RVI from SVI in
 nvmx_update_apicv
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

Updating SVI is required when an interrupt has been injected using the
Ack on exit VMEXIT feature, so that the in service interrupt in the
GUEST_INTR_STATUS matches the vector that is signaled in
VM_EXIT_INTR_INFO.

Updating RVI however is not tied to the Ack on exit feature, as it
signals the next vector to be injected, and hence should always be
updated to the next pending vector, regardless of whether Ack on exit
is enabled.

When not using the Ack on exit feature preserve the previous vector in
SVI, so that it's not lost when RVI is updated to contain the pending
vector to inject.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
Changes since v3:
 - Return early if interrupt source is not lapic.

Changes since v2:
 - Return early if the exit reason != EXTERNAL_INTERRUPT.
 - Reduce the number of vmwrites by accumulating the changes to a
   local variable which is flushed at the end of the function.
 - Attempt to preserve the exiting SVI if Ack on exit is not enabled.
---
 xen/arch/x86/hvm/vmx/vvmx.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 1753005c91..d63f417f9c 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1384,28 +1384,43 @@ static void nvmx_update_apicv(struct vcpu *v)
     struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
     unsigned long reason = get_vvmcs(v, VM_EXIT_REASON);
     unsigned long intr_info = get_vvmcs(v, VM_EXIT_INTR_INFO);
+    unsigned long status;
+    int rvi;
 
-    if ( reason == EXIT_REASON_EXTERNAL_INTERRUPT &&
-         nvmx->intr.source == hvm_intsrc_lapic &&
-         (intr_info & INTR_INFO_VALID_MASK) )
+    if ( reason != EXIT_REASON_EXTERNAL_INTERRUPT ||
+         nvmx->intr.source != hvm_intsrc_lapic )
+        return;
+
+    if ( intr_info & INTR_INFO_VALID_MASK )
     {
-        uint16_t status;
-        uint32_t rvi, ppr;
-        uint32_t vector = intr_info & 0xff;
+        uint32_t ppr;
+        unsigned int vector = intr_info & INTR_INFO_VECTOR_MASK;
         struct vlapic *vlapic = vcpu_vlapic(v);
 
+        /*
+         * Update SVI to record the current in service interrupt that's
+         * signaled in EXIT_INTR_INFO.
+         */
         vlapic_ack_pending_irq(v, vector, 1);
 
         ppr = vlapic_set_ppr(vlapic);
         WARN_ON((ppr & 0xf0) != (vector & 0xf0));
 
         status = vector << VMX_GUEST_INTR_STATUS_SVI_OFFSET;
-        rvi = vlapic_has_pending_irq(v);
-        if ( rvi != -1 )
-            status |= rvi & VMX_GUEST_INTR_STATUS_SUBFIELD_BITMASK;
+    }
+    else
+       /* Keep previous SVI if there's any. */
+       __vmread(GUEST_INTR_STATUS, &status);
 
-        __vmwrite(GUEST_INTR_STATUS, status);
+    rvi = vlapic_has_pending_irq(v);
+    if ( rvi != -1 )
+    {
+        status &= ~VMX_GUEST_INTR_STATUS_SUBFIELD_BITMASK;
+        status |= rvi & VMX_GUEST_INTR_STATUS_SUBFIELD_BITMASK;
     }
+
+    if ( status )
+        __vmwrite(GUEST_INTR_STATUS, status);
 }
 
 static void virtual_vmexit(struct cpu_user_regs *regs)
-- 
2.26.0


