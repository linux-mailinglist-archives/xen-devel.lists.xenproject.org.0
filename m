Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D957F48EA
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 15:28:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638785.995717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5oCi-0001Ts-DO; Wed, 22 Nov 2023 14:27:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638785.995717; Wed, 22 Nov 2023 14:27:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5oCi-0001Qs-A1; Wed, 22 Nov 2023 14:27:48 +0000
Received: by outflank-mailman (input) for mailman id 638785;
 Wed, 22 Nov 2023 14:27:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dm5i=HD=citrix.com=prvs=683e23acf=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r5oCg-0000hs-DU
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 14:27:46 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d156d13-8943-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 15:27:44 +0100 (CET)
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
X-Inumbo-ID: 4d156d13-8943-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1700663264;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bRZw8HpOnQzzkA1q6rwNIIhXyAnBfhvT+l0gq9/kgVI=;
  b=IWcb0lVytB+Dd8YW7KdJtRI3F1dfhjs7sK32UmdZNlHt8ATmyBIKZg61
   X7TkNhthDJQI0UB1t6a0VQMaBxjTS5Ap/WJe6N8fIg32diQgBQ+tbAHxL
   m2EMQrRgrvzeQ/8ii90rZJbiGVvzMf3AePCviXDzrDQlBWakoLtCiIfmT
   g=;
X-CSE-ConnectionGUID: RU2enJTNQOWXW12FekJHvg==
X-CSE-MsgGUID: rtqloiI4T9mMZ5N9CyigFQ==
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 128141619
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:GwdU7KBIA6DjoBVW/2fjw5YqxClBgxIJ4kV8jS/XYbTApD90hmFUz
 mMXWTqEM/jZNjenfYpzYNyz9hgH6pTWztZjQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48D8kk/nOH+KgYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMt8pvlDs15K6p4WpC5ARkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwwNstDGdsy
 dohDw89UUnZqe+14pKlRbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdIL2U3BPjDS0Qn1lM/IZQyhuq3wFL4dCVVsgm9rqsr+WnDigd21dABNfKMIIzTGZwLxxfwS
 mTu5XjgBhYbFYCjmD+gwC+K18TenCzVYddHfFG/3qEz2wDCroAJMzUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiFyuswMYWtFQO/Yn8wzLwa3Riy6GAkAUQzgHb8Yp3PLaXhRzi
 AXPxYmwQ2Uy4fvKERpx64t4sxuIBHIYK00+QxYjcjs6uoPNrYIRrgzAG4ML/LGOsjHlJd3h6
 2nV9HBj1+9O0p5j6kmtwbzQb9uRSnn1ou0dvFy/spqNtF8RWWJcT9XABaLnxfhBNp2FaVKKo
 WIJncOThMhXUsnVyX3UHrhdRej1jxpgDNE6qQQ3d3XG3239k0NPgKgKuG0uTKuXGppslcDVj
 L/75loKuc470IqCZq5reYOhY/nGPoC5fekJosv8N4IUCrAoLV/vwc2bTRLIt4wbuBR2wP5X1
 FbyWZrEMEv2/ow9lmTsH7xGgeRDK+JX7Tq7eK0XBi+PidK2DEN5g59cWLdSRojVNJ+5nTg=
IronPort-HdrOrdr: A9a23:uao38KOTr9egFcBcTvmjsMiBIKoaSvp037Eqv3oedfUzSL3gqy
 nOpoV86faaslYssR0b9exofZPwJE80lqQFhrX5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtrZ
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-Talos-CUID: =?us-ascii?q?9a23=3Aycfi7mtAr8rnts+672Mqw/0g6IsfTyfQylXsBXa?=
 =?us-ascii?q?fNlZWEee7RFyy2L1rxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Abpd68AxjU5AU4QuG+X/FpzHCxcCaqL6yEUQKkLR?=
 =?us-ascii?q?ah5iBEB4tHWa2nTW4bLZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.04,219,1695700800"; 
   d="scan'208";a="128141619"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/3] x86/apic: Drop the APIC_MSR_BASE constant
Date: Wed, 22 Nov 2023 14:27:32 +0000
Message-ID: <20231122142733.1818331-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231122142733.1818331-1-andrew.cooper3@citrix.com>
References: <20231122142733.1818331-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Use MSR_X2APIC_FIRST from msr-index.h instead.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/apic.h    | 4 ++--
 xen/arch/x86/include/asm/apicdef.h | 3 ---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/apic.h b/xen/arch/x86/include/asm/apic.h
index 288b4933eb38..486d689478b2 100644
--- a/xen/arch/x86/include/asm/apic.h
+++ b/xen/arch/x86/include/asm/apic.h
@@ -69,7 +69,7 @@ static __inline void apic_wrmsr(unsigned long reg, uint64_t msr_content)
         reg == APIC_LVR)
         return;
 
-    wrmsrl(APIC_MSR_BASE + (reg >> 4), msr_content);
+    wrmsrl(MSR_X2APIC_FIRST + (reg >> 4), msr_content);
 }
 
 static __inline uint64_t apic_rdmsr(unsigned long reg)
@@ -79,7 +79,7 @@ static __inline uint64_t apic_rdmsr(unsigned long reg)
     if (reg == APIC_DFR)
         return -1u;
 
-    rdmsrl(APIC_MSR_BASE + (reg >> 4), msr_content);
+    rdmsrl(MSR_X2APIC_FIRST + (reg >> 4), msr_content);
     return msr_content;
 }
 
diff --git a/xen/arch/x86/include/asm/apicdef.h b/xen/arch/x86/include/asm/apicdef.h
index 8d1b0087d4ef..c4068ccc10f4 100644
--- a/xen/arch/x86/include/asm/apicdef.h
+++ b/xen/arch/x86/include/asm/apicdef.h
@@ -124,9 +124,6 @@
 
 #define APIC_BASE __fix_to_virt(FIX_APIC_BASE)
 
-/* It's only used in x2APIC mode of an x2APIC unit. */
-#define APIC_MSR_BASE 0x800
-
 #define MAX_IO_APICS 128
 
 extern bool x2apic_enabled;
-- 
2.30.2


