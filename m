Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2A724C16B
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 17:09:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8mC2-0003m1-DM; Thu, 20 Aug 2020 15:09:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00F7=B6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k8mC1-0003lg-1U
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 15:09:29 +0000
X-Inumbo-ID: 8a0b62eb-465a-4dcc-ab2c-2de7cd38152b
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a0b62eb-465a-4dcc-ab2c-2de7cd38152b;
 Thu, 20 Aug 2020 15:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597936166;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zT5MN7nvkqMoYuX6+gGl+F2zxCCkKoFt0fQb/G0S9wE=;
 b=eevHJFNDR6U+Sd/3KsBE8t22tpMtfVtlPrX0zK+FSFqQ5incDLt62qw3
 n1vczbTtUBcf1C+CazPUH22iqYQz9x1rKI4xH8utmRFQoBRysXZUROEbZ
 /s1Ox1fi35z03RrjHDsCKhTAAHgyne7PCb0MF77A4ru5i94Imm0PH0GZK Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ts6GtElitM50VW9zQe5AqEG/mVPPu6nCutMkL+Ib3WxHgO7NIjQHtGsNhoY/RiBgNqvKz7ak3W
 wh0Hm/QPTSDAIA8HF071o1YYq181CHERzbFPe+Uqrh8jGO8zSmaEAJexR9SyVcxjtRdJufM4GG
 uha1thSb6aPSZrED0Hgt0lz3O0c+at/lY932hH3lCy0EluvyX6vFdhb61ubEZQ7nU/4k7JsMKe
 zYIpU+gTkWIWBJ3JLhzPzZNisHb4LhP8T0nx8/oySh5R0IjoViJU5NHtchHVDuOMSHgpVA+wcV
 mEU=
X-SBRS: 2.7
X-MesageID: 24942327
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,333,1592884800"; d="scan'208";a="24942327"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jun Nakajima
 <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
 <wl@xen.org>
Subject: [PATCH v2 1/8] x86/vmx: handle writes to MISC_ENABLE MSR
Date: Thu, 20 Aug 2020 17:08:28 +0200
Message-ID: <20200820150835.27440-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200820150835.27440-1-roger.pau@citrix.com>
References: <20200820150835.27440-1-roger.pau@citrix.com>
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
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 xen/arch/x86/hvm/vmx/vmx.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index a0d58ffbe2..4717e50d4a 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3163,7 +3163,7 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
 
     switch ( msr )
     {
-        uint64_t rsvd;
+        uint64_t rsvd, tmp;
 
     case MSR_IA32_SYSENTER_CS:
         __vmwrite(GUEST_SYSENTER_CS, msr_content);
@@ -3301,6 +3301,13 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
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


