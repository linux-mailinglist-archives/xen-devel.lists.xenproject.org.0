Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35668194338
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 16:29:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHUQC-0006zy-Od; Thu, 26 Mar 2020 15:27:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=a2Fc=5L=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jHUQB-0006zc-2c
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 15:27:51 +0000
X-Inumbo-ID: 575add26-6f76-11ea-880d-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 575add26-6f76-11ea-880d-12813bfff9fa;
 Thu, 26 Mar 2020 15:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585236465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NIPREif/onHf9hsOVxJhtJ9WqGIOV8KAuJcMQCcRLFA=;
 b=NO1D8L3KbbdfMmzKiP9Q0w3b/4nSeXF1ymfoVaxzyv4I3ZaXb27DoIVv
 8FO78H/IbsNs8B/+GJfinEzhUY/TO+Zx2C6DVkTDlczCwm1xsC7w+80QT
 Dhm8ixXblpm90bMzZClK+9yF1KQg1ykaDZLF8HuyEvYlyayzTEdjdCjlr A=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pXYi/w6ziR3WGRK2NmaMAnPmJPzFPmYnpeLBzsoRdnEiHJ7lr4MYgpJmuMi0yPUoJuHElT2SeB
 h2HBYi8yJaSMsl7N0hHRDlc4i3ct8OTAZMGsTz5Gsco46DH2/Wc0tHPn8WYQCY1Zc/J9cmMXHh
 p2sPaSNflGnEnNMtrFBRJcDJBD2aKC4JSUIC6a8nGRs6DjHiIiDa7qMj70joBj0vxMLxLfx7sz
 w4L/8wDRpOKiQZVmAWNLyfmil3+5pGlZW1nYMJBroFUS5lola12aR/JYZ+K4TUVNElKZ6FoFRJ
 Ckg=
X-SBRS: 2.7
X-MesageID: 15024600
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,308,1580792400"; d="scan'208";a="15024600"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Mar 2020 16:27:18 +0100
Message-ID: <20200326152720.36970-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200326152720.36970-1-roger.pau@citrix.com>
References: <20200326152720.36970-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH v3 2/4] x86/nvmx: only update SVI when using Ack
 on exit
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

Check whether there's a valid interrupt in VM_EXIT_INTR_INFO in order
to decide whether to update SVI in nvmx_update_apicv. If Ack on exit
is not being used VM_EXIT_INTR_INFO won't have a valid interrupt and
hence SVI shouldn't be updated to signal the interrupt is currently in
service because it won't be Acked.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
 xen/arch/x86/hvm/vmx/vvmx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 1b8461ba30..1753005c91 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1383,7 +1383,7 @@ static void nvmx_update_apicv(struct vcpu *v)
 {
     struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
     unsigned long reason = get_vvmcs(v, VM_EXIT_REASON);
-    uint32_t intr_info = nvmx->intr.intr_info;
+    unsigned long intr_info = get_vvmcs(v, VM_EXIT_INTR_INFO);
 
     if ( reason == EXIT_REASON_EXTERNAL_INTERRUPT &&
          nvmx->intr.source == hvm_intsrc_lapic &&
-- 
2.26.0


