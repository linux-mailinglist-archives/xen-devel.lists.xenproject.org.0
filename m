Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D9F48DDDC
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 19:48:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257341.442173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n858z-0001gF-8m; Thu, 13 Jan 2022 18:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257341.442173; Thu, 13 Jan 2022 18:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n858z-0001dp-4l; Thu, 13 Jan 2022 18:48:17 +0000
Received: by outflank-mailman (input) for mailman id 257341;
 Thu, 13 Jan 2022 18:48:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4514=R5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1n858x-0001dj-8A
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 18:48:15 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b78cc33-74a1-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 19:48:13 +0100 (CET)
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
X-Inumbo-ID: 5b78cc33-74a1-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642099693;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Gk1R1KBs8dczG/7CrCNbCq9t4i0qahB2y9rb298DHFk=;
  b=JnHoRCdDevzUxdCbLl1YHT7r3soF/cyQYuJ09w7K133nTTcCVls07cE1
   G3pktFMOAiPBTXlC43Hs1SDRVrp6NCOjiqbmoxmhPNDT7c8zeKyHIF7mo
   ePEeYfkGBJ7aIgf9rBhWHGfi1s0yPzNmuPuBPQmINPMX05Xa5D86ufiZU
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: fP/dlcoMLXVLUaBa7C+AHwamvSYjZybBit8b0KRP73K9WKiCVBW74zKEROduYCBQULzz32UScY
 UDLeEIGzYrL62zBvsudDXSLpJRPKbgdlyKdztPdeS/J1gH/z+Qd9uGis+hOlTy/QhLDZgj0K1E
 gG1DbXZVAJ6euEd01fGwwObqB6ENlC7m7L+2Tl6+nJ1I05TrQxZKqZU/xKvWpE0XwlqMEiQQDe
 YR0wLeN4Sn8PxjCI2yN7uikRg3gPl//55kxKBDC7ohA4Hz1XLsjaii+Ll8vLT65gsD/Zf605+5
 Aysu5Tv5R2GV5zxNbhfIUTkE
X-SBRS: 5.2
X-MesageID: 61949781
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:eOMPqa3vSmrbG7nAaPbD5UJ2kn2cJEfYwER7XKvMYLTBsI5bp2BRn
 2BNCmmFOqqCM2D2f40nbIq1phgO68XTyNFiQAU6pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o6wrVh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhg/5Jw
 utAjt+LWSAIZZXBhOEFA0dGHHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9u35ESTKmOP
 qL1bxJpbyXLZBxmFW5IDZZk27froXyleQNx/Qf9Sa0fvDGIkV0ZPKLWGMbcf9WRbdlWmkueq
 XPL+yLyBRRyHN6Cz3yD+3GlhO7KlAv6Xp4fEPuz8fsCqF6e2G0VTgEXXF2ToP+lh0r4UNVaQ
 2QE9yxroaUs+UiDStjmQwb+sHOCpgQbWddbD6s98g7l4oj+7hudB2MEZiVcc9Fgv8gzLRQ10
 neZktWvAiZg2IB5UlrEqO3S92nrf3FIcylSPkfoUDfp/fH/jrk5sB/0De1zN4/uttDpHCmgn
 S6F+X1Wa6ooseYH0KCy/Fbiij2qp4TUQgNd2jg7Tl5J/SsiOtf7OtXABUzzqK8Zcd3HFgXpU
 G0sxpDGhN3iG61hg8BkrA8lOLiyr8iIPzTH6bKEN8lwrm/9k5JPkG053d2fGKuLGppVEdMKS
 BWK0e+02HO1FCH6BUOQS9jgY/nGNYC6SbzYugn8N7KimKRZeg6d5z1JbkWNxW3rm0VEufhhZ
 c3DKJ30UypKUv4PIN+KqwE1i+9DKscWnzK7eHwG507/jer2iIC9FN/pz2dinshmtfjZ8W05A
 v5UNteQygU3bQENSnK/zGLnFnhTdSJTLcmv86R/L7ffSiI7Rj1JI6KPkNsJJtw094wIx7yg1
 izsBSdlJK/X2CevxfOiMC4zMdsCnP9X8BoGAMDbFQ35hCh4P9f+tfd3mlleVeBPydGPBMVcF
 5EtE/hsyNwWItge0zhCP5T7sqJ4cxGn2VCHMya/OWBtdJ98XQ3ZvNTje1K3piUJCyO2s+o4o
 qGhiVyHEcZSGVw6AZaEcu+rwnOwoWMZxLB4UXzXL4QBY07r6oVrdXD816dlP8EWJBzf7TKGz
 ALKUwwArOzArtZtotnEjKyJtamzFO56EhYIFmXX9+/uZyLb4nCi0clLV+PRJWLRU2b9+aODY
 +RJzq6jbK1bzQgS64clSuRl16Mz4dfrtoR29AU8ESWZdUmvB5NhPmKCgZtFuJpSy+ILogCxQ
 E+OpIVXYO3bJMP/HVcNDwM5deDfh+oMkzzf4PlpckX34Ch7oOiOXUlIZkTejSVcKP1+MZ8/w
 Pdns8kTslTthh0vO9eAryZV62XTcSBQD/R57skXUN3xlw4m6lBeepiNWCb57aaGZ8hILkR3c
 CSfg7DPhugEy0fPG5bp+aMhAQaJaUwyhS13
IronPort-HdrOrdr: A9a23:IHQaNKvuMqX8Ir1hsNITF8z87skDeNV00zEX/kB9WHVpmszxra
 GTdZMgpHnJYVcqKRYdcL+7Scq9qB/nmqKdgrNhWYtKPjOW2ldARbsKheCJrlHd8kXFh5dgPM
 xbE5SWZuefMbEDt7ee3DWF
X-IronPort-AV: E=Sophos;i="5.88,286,1635220800"; 
   d="scan'208";a="61949781"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Tamas K Lengyel
	<tamas@tklengyel.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>
Subject: [PATCH] x86/hvm: Drop .is_singlestep_supported() callback
Date: Thu, 13 Jan 2022 18:48:00 +0000
Message-ID: <20220113184800.29456-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

There is absolutely no need for a function pointer call here.

Drop the hook, introduce a singlestep_supported boolean, and configure it in
start_vmx() like all other optional functionality.

No functional change, but rather more efficient logic.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Tamas K Lengyel <tamas@tklengyel.com>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>

Based on Jan's "altcall all hvm ops" patch, but not logically related.  This
had escaped my previous attempts to drop inappropriate function pointer use.

The hvm_funcs data fields are a mess.  All the booleans and 'hvm_capabilities'
want merging into a single bitfield, so we're not wasting 8 bytes of space to
hold 6 bits of information.
---
 xen/arch/x86/hvm/vmx/vmx.c         | 8 ++------
 xen/arch/x86/include/asm/hvm/hvm.h | 7 +++----
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index a7a0d662342a..1c46669762b0 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2120,11 +2120,6 @@ static void vmx_enable_msr_interception(struct domain *d, uint32_t msr)
         vmx_set_msr_intercept(v, msr, VMX_MSR_W);
 }
 
-static bool_t vmx_is_singlestep_supported(void)
-{
-    return !!cpu_has_monitor_trap_flag;
-}
-
 static void vmx_vcpu_update_eptp(struct vcpu *v)
 {
     struct domain *d = v->domain;
@@ -2454,7 +2449,6 @@ static struct hvm_function_table __initdata vmx_function_table = {
     .nhvm_domain_relinquish_resources = nvmx_domain_relinquish_resources,
     .nhvm_hap_walk_L1_p2m = nvmx_hap_walk_L1_p2m,
     .enable_msr_interception = vmx_enable_msr_interception,
-    .is_singlestep_supported = vmx_is_singlestep_supported,
     .altp2m_vcpu_update_p2m = vmx_vcpu_update_eptp,
     .altp2m_vcpu_update_vmfunc_ve = vmx_vcpu_update_vmfunc_ve,
     .altp2m_vcpu_emulate_ve = vmx_vcpu_emulate_ve,
@@ -2661,6 +2655,8 @@ const struct hvm_function_table * __init start_vmx(void)
         return NULL;
     }
 
+    vmx_function_table.singlestep_supported = cpu_has_monitor_trap_flag;
+
     if ( cpu_has_vmx_dt_exiting )
         vmx_function_table.set_descriptor_access_exiting =
             vmx_set_descriptor_access_exiting;
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index b26302d9e769..9338cf25a657 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -97,6 +97,7 @@ struct hvm_function_table {
 
     /* Necessary hardware support for alternate p2m's? */
     bool altp2m_supported;
+    bool singlestep_supported;
 
     /* Hardware virtual interrupt delivery enable? */
     bool virtual_intr_delivery_enabled;
@@ -208,7 +209,6 @@ struct hvm_function_table {
                                 uint8_t *p2m_acc, struct npfec npfec);
 
     void (*enable_msr_interception)(struct domain *d, uint32_t msr);
-    bool_t (*is_singlestep_supported)(void);
 
     /* Alternate p2m */
     void (*altp2m_vcpu_update_p2m)(struct vcpu *v);
@@ -644,10 +644,9 @@ static inline void hvm_enable_msr_interception(struct domain *d, uint32_t msr)
     alternative_vcall(hvm_funcs.enable_msr_interception, d, msr);
 }
 
-static inline bool_t hvm_is_singlestep_supported(void)
+static inline bool hvm_is_singlestep_supported(void)
 {
-    return (hvm_funcs.is_singlestep_supported &&
-            alternative_call(hvm_funcs.is_singlestep_supported));
+    return hvm_funcs.singlestep_supported;
 }
 
 static inline bool hvm_hap_supported(void)
-- 
2.11.0


