Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F388B246B9E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 17:59:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7hXT-0007BA-PO; Mon, 17 Aug 2020 15:59:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AGoP=B3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k7hXS-00073P-3E
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 15:59:10 +0000
X-Inumbo-ID: e1577a73-ae74-48a7-a05f-d3f78b78f32b
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1577a73-ae74-48a7-a05f-d3f78b78f32b;
 Mon, 17 Aug 2020 15:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597679941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sbwFCsE82OUswnTxoAvsofX0HYNKQlQfPtMyufjDfMw=;
 b=EiBM2gPT6KqWktbIVJgMS4sq5kIUMblTJ31oamfln44n/sFEiJjinE3+
 D0+tSDEEfJ4GJxIYCCZ8DbISGCB0AG2BcSZ2nm5D4olCjuKEgC0/lkBp6
 m6dXrHsup1CKspN33GDD5LIuxXGTfcQpz3ooCHUiyxKWOcp7Q1Q+BQiiU 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: psHUZNUJszeD/YOQ4RAWn8l6IncFDipvG6HgL9CoWlpKyjX9kvhPX8S0vD9KDw9vmZaFLQQvwo
 FGYbJBdCxEznULhhTYbxYkgIgxQD2jBkxgFDbn0cX3GcMygeeRd4I8HyzDR5iAUpHOSMvOWYn8
 WVx9Xd4bKXOjUsTUQhOuxNdioay/fbjCk9caK9YlyopaIBiP/cLwrHDLGekvb/vflGLEJ5NFEX
 cQJwoqgZ9Vyil3SivC35Mvk37SgVuDHtC3/TNYLykpo0W0EwOq3WMgOTDY0vcypH5JWKEni+5g
 R/c=
X-SBRS: 2.7
X-MesageID: 24673337
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,324,1592884800"; d="scan'208";a="24673337"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 6/8] x86/pv: allow reading FEATURE_CONTROL MSR
Date: Mon, 17 Aug 2020 17:57:55 +0200
Message-ID: <20200817155757.3372-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817155757.3372-1-roger.pau@citrix.com>
References: <20200817155757.3372-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

Linux PV guests will attempt to read the FEATURE_CONTROL MSR, report
no features enabled or available, and that the MSR is already locked.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/pv/emul-priv-op.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 554a95ae8d..76c878b677 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -879,6 +879,10 @@ static int read_msr(unsigned int reg, uint64_t *val,
             *val |= APIC_BASE_BSP;
         return X86EMUL_OKAY;
 
+    case MSR_IA32_FEATURE_CONTROL:
+        *val = IA32_FEATURE_CONTROL_LOCK;
+        return X86EMUL_OKAY;
+
     case MSR_FS_BASE:
         if ( is_pv_32bit_domain(currd) )
             break;
-- 
2.28.0


