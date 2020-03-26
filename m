Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E94194337
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 16:29:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHUQ7-0006xv-3N; Thu, 26 Mar 2020 15:27:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=a2Fc=5L=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jHUQ6-0006xi-2G
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 15:27:46 +0000
X-Inumbo-ID: 55fb24b8-6f76-11ea-880d-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 55fb24b8-6f76-11ea-880d-12813bfff9fa;
 Thu, 26 Mar 2020 15:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585236463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6fjiTrIRuEMMbz6K31zXO+vBOLjObAGvvwGKsTQeTO4=;
 b=OFqE2/9dkOenYoffFJAITfoOlqBRIUoerjSKkK5vQv/5dnoaEA0vh9Bk
 0vd/IPiH4nv7SABlEnm7vPDZqVwf0FPHdmfn2WdFyJWWzl8VRCg3knRb4
 nYxTXXCEv4PlP6DZsWEjYgyZezy8x3Z54mIDtS4u4Q6o4vbDFIEfRupqm Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: UuvNZFzF9fMuF6eELqNAgiBpizqVKXaADCrnLlUegwHi0tpC4VqnJ3DvxHC1v0d9rgxAVcvStG
 IyRejFQ48XBRCZTOp5xo0EYKO1P3T/HCZFGNYFyn2bCGGDWspJRwWuaNukd90m1vdlc/q3K/M2
 IwUpdTa3CBlO2ivCy32SenC675Wj3i/3wfs4/N5ZvsnDMQmse+ZR1jXvJRJVNiNsw2EOEZ6xES
 mEA4f9OBDxXAfoLeCiPPSNseP+KJLgjDl6sJ6eiWSb5cHeBW5eGyw/pkFuFplEhycmYw+Y/taj
 pMk=
X-SBRS: 2.7
X-MesageID: 14702088
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,308,1580792400"; d="scan'208";a="14702088"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Mar 2020 16:27:17 +0100
Message-ID: <20200326152720.36970-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200326152720.36970-1-roger.pau@citrix.com>
References: <20200326152720.36970-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH v3 1/4] Revert "x86/vvmx: fix virtual interrupt
 injection when Ack on exit control is used"
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

This reverts commit f96e1469ad06b61796c60193daaeb9f8a96d7458.

The commit is wrong, as the whole point of nvmx_update_apicv is to
update the guest interrupt status field when the Ack on exit VMEXIT
control feature is enabled.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
 xen/arch/x86/hvm/vmx/vvmx.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index f049920196..1b8461ba30 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1456,12 +1456,7 @@ static void virtual_vmexit(struct cpu_user_regs *regs)
     /* updating host cr0 to sync TS bit */
     __vmwrite(HOST_CR0, v->arch.hvm.vmx.host_cr0);
 
-    if ( cpu_has_vmx_virtual_intr_delivery &&
-         /*
-          * Only inject the vector if the Ack on exit bit is not set, else the
-          * interrupt will be signaled in the vmcs VM_EXIT_INTR_INFO field.
-          */
-         !(get_vvmcs(v, VM_EXIT_CONTROLS) & VM_EXIT_ACK_INTR_ON_EXIT) )
+    if ( cpu_has_vmx_virtual_intr_delivery )
         nvmx_update_apicv(v);
 
     nvcpu->nv_vmswitch_in_progress = 0;
-- 
2.26.0


