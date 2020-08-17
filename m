Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C27E4246B92
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 17:58:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7hX1-0006wa-CE; Mon, 17 Aug 2020 15:58:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AGoP=B3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k7hX0-0006wT-00
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 15:58:42 +0000
X-Inumbo-ID: a974dbae-8d5b-4c51-9431-158ab1435b63
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a974dbae-8d5b-4c51-9431-158ab1435b63;
 Mon, 17 Aug 2020 15:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597679921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q74puLuT0vDNhKrTxd4JxP8KRkMXdKwVK0okEy3W1sI=;
 b=f4rG+COfA8FoZ/58C92hfv7xyZAdcqMZYmFS76Hp71dbWHS2DHzs0Sgy
 DXF3k0mPRqu6O4MBYH9079tbvGl2aJkFTRqJWL4FMf2CvyJalIKUElCTM
 JZl9daqjMKa0AkyCoTTFYEz/Ds0wymeQZnTmfAgaIiAeqc6L9l1WFdJ+1 c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: n0cCQP+s4fdOY5jDtDWlu45NH6L9O3fooTJpfJ5uGNpbTBsm1EkxTXr2wuV5LKXJjyBKrY9+9E
 bWn/jYGICclhD9hJ6r9X7vHg5UvKuJcVYZ5sCD4vT0TLvNEf0rsWwy9b1gv2XOpqEzoiBtGFn9
 yJ5Gs+x0uuYMZHbglYDZuaknpphFRiH7IbcCq2ugvb1rz3+ZR0xwCEvGYQaneEEN+bj7IE90FK
 wpbRc2FZi/H86meV6hCmqSxXVC0YCUQ1iaopS+MArhBliO47cKRmP7YZB1adPI8f1kfquOyGbP
 P54=
X-SBRS: 2.7
X-MesageID: 24707108
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,324,1592884800"; d="scan'208";a="24707108"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jun Nakajima
 <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
 <wl@xen.org>
Subject: [PATCH 1/8] x86/vmx: handle writes to MISC_ENABLE MSR
Date: Mon, 17 Aug 2020 17:57:50 +0200
Message-ID: <20200817155757.3372-2-roger.pau@citrix.com>
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

Such handling consist in checking that no bits have been changed from
the read value, if that's the case silently drop the write, otherwise
inject a fault.

At least Windows guests will expect to write to the MISC_ENABLE MSR
with the same value that's been read from it.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vmx/vmx.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index eb54aadfba..fbfb31af05 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3166,7 +3166,7 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
 
     switch ( msr )
     {
-        uint64_t rsvd;
+        uint64_t rsvd, tmp;
 
     case MSR_IA32_SYSENTER_CS:
         __vmwrite(GUEST_SYSENTER_CS, msr_content);
@@ -3304,6 +3304,13 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
         /* None of these MSRs are writeable. */
         goto gp_fault;
 
+    case MSR_IA32_MISC_ENABLE:
+        /* Silently drop writes that don't change the reported value. */
+        if ( vmx_msr_read_intercept(msr, &tmp) != X86EMUL_OKAY ||
+             tmp != msr_content )
+            goto gp_fault;
+        break;
+
     case MSR_P6_PERFCTR(0)...MSR_P6_PERFCTR(7):
     case MSR_P6_EVNTSEL(0)...MSR_P6_EVNTSEL(7):
     case MSR_CORE_PERF_FIXED_CTR0...MSR_CORE_PERF_FIXED_CTR2:
-- 
2.28.0


