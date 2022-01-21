Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5CD495DEF
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 11:49:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259307.447452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nArTo-0000A3-Ec; Fri, 21 Jan 2022 10:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259307.447452; Fri, 21 Jan 2022 10:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nArTo-00006k-B0; Fri, 21 Jan 2022 10:49:16 +0000
Received: by outflank-mailman (input) for mailman id 259307;
 Fri, 21 Jan 2022 10:49:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s92u=SF=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nArTm-00006e-6K
 for xen-devel@lists.xenproject.org; Fri, 21 Jan 2022 10:49:14 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4133c45-7aa7-11ec-8fa7-f31e035a9116;
 Fri, 21 Jan 2022 11:49:12 +0100 (CET)
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
X-Inumbo-ID: c4133c45-7aa7-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642762152;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tyEx1+hMmxu2vwHmYJF0V3pH2If9DSamCWpJ8tVHhhE=;
  b=Z1W4jRXqU6l7pE3h7vDasAUlvYg+VRBlivM87c7nP79V+c0qGekuBD8b
   tz3iJ3Xsv3AjA6ilkF4WXIk/ZJ2YU9Jv1SsFSddm/ANhco/vLNWbzwno1
   8nvB/J4fWe8XFprSN8ymYVbJTu93r+S2lN8TkMvMaZ5QLe4Q1OCs42Qc5
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: fpe0l7fvi+mwvpRhloYJQhbj4M2Upy0UiQdS4MnEJMfP7owGmBpytlK4rjnYu+/6OeDaPScic8
 27uftOYKF4UzTaf1rfpOWQHge3yR7a8QcD9faldib5eCi0BxYLfQNaooJCY9vbNqwRaTGnPgac
 I+X9YUn2wGp8nMmOuSH/Hfvwn3pr3sFseuM28CdS3DeUOb6B6P/7mF/kUQrWaGdaKqjMr0UqQd
 iehfKwap3hDIEDaB0k0DBXRkRb6hOG/veylZG1XjZ+kkYM25u4g7IRBFnHjoQuh3ztUqZJ7uOH
 VsL9AfDL//WJiJh5K10dQaKy
X-SBRS: 5.2
X-MesageID: 64635215
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:krRJo6uUl30SeLONfdrwXUvcKefnVIFZMUV32f8akzHdYApBsoF/q
 tZmKWnXbK6DNzf8fNl0Porn/EoPsZXUmoNqHlFppSgwRSsT+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYx24HhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npltb+RSAklG5L3ms8BVglxLCBsGr1m0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AO
 5RCNGA2MXwsZTVQAQ5GKdFmoNuhgyPZT2ZGgl2PtJUOtj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKjMwOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO+0ZyQCDxo/r2ASyGm0UZwFAevs2lOZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WsQWmoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQWDhRqjBNzAJrVkg
 JTis5LPhAzpJcvc/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43bpxbIWS4M
 RaP51s5CHpv0J2CNvcfj2WZUJxC8EQdPY69CqC8giRmP/CdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimkUjP+efANRa9FOdUWHPTP7tRxP7V/23oH
 yN3apHiJ+N3CrOuO0E6MOc7cDg3EJTMLcmm8pMMLr/afFMO9aNII6a5/I7NsrdNx8x9/tokN
 FnhMqOB4Fag13DBNyuQbXVvNOHmUZpl9CppNi0wJ1e4nXMkZN/3vqsYcpI2e5gh9fBikqEoH
 6VUJZ3YD6QdUCnD9hQccYL58N5oeiO0iF/cJCGiejU+IcJtHlSb5t/+cwLz3yASFS7r59Amq
 rit21qDE5oOTghvFujMb/erww/jtHQRgrsqDUDJPsNSaAPn940zc379ifo+IsctLxTfx2TFi
 1bKUElA/eSU+t076tjEg6yAvryFKeomExoIBXTf4Ja3KTLeojipz7hfXbvaZjvaTm71pvmvP
 L0H0/HmPfQbt19WqI4gQa1zxKcz6taz9b9XygNoQCfCY1ixU+4yJ3CH2Y9Et7FXx68fsgyzA
 xrd9t5fMLSPGcXkDF9Oe1Z1MrXdjakZymvI8PA4AETm/ysmrrOIXHJbMwSIlCEAfqB+N5kow
 Lt5tcMbg+BlZsHG7jpSYvhoylmx
IronPort-HdrOrdr: A9a23:EOnmRaw/9TwxNW+OqzPYKrPwIL1zdoMgy1knxilNoRw8SKKlfq
 eV7ZMmPH7P+VIssR4b+exoVJPtfZq+z+8R3WByB8bAYOCOggLBR+sO0WKL+UyHJ8SUzI9gPM
 lbHJSWcOeAb2RHsQ==
X-IronPort-AV: E=Sophos;i="5.88,304,1635220800"; 
   d="scan'208";a="64635215"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86: Fix build with the get/set_reg() infrastructure
Date: Fri, 21 Jan 2022 10:49:01 +0000
Message-ID: <20220121104901.22702-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

I clearly messed up concluding that the stubs were safe to drop.

The is_{pv,hvm}_domain() predicates are not symmetrical with both CONFIG_PV
and CONFIG_HVM.  As a result logic of the form `if ( pv/hvm ) ... else ...`
will always have one side which can't be DCE'd.

While technically only the hvm stubs are needed, due to the use of the
is_pv_domain() predicate in guest_{rd,wr}msr(), sort out the pv stubs too to
avoid leaving a bear trap for future users.

Fixes: 88d3ff7ab15d ("x86/guest: Introduce {get,set}_reg() infrastructure")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/hvm/hvm.h   |  9 +++++++++
 xen/arch/x86/include/asm/pv/domain.h | 17 +++++++++++++----
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 842f98763c4b..76170c129c35 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -854,6 +854,15 @@ static inline int hvm_vmtrace_get_option(
     return -EOPNOTSUPP;
 }
 
+static inline uint64_t hvm_get_reg(struct vcpu *v, unsigned int reg)
+{
+    ASSERT_UNREACHABLE();
+}
+static inline void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
+{
+    ASSERT_UNREACHABLE();
+}
+
 #define is_viridian_domain(d) ((void)(d), false)
 #define is_viridian_vcpu(v) ((void)(v), false)
 #define has_viridian_time_ref_count(d) ((void)(d), false)
diff --git a/xen/arch/x86/include/asm/pv/domain.h b/xen/arch/x86/include/asm/pv/domain.h
index 3a67816764c9..4ef4660a01ac 100644
--- a/xen/arch/x86/include/asm/pv/domain.h
+++ b/xen/arch/x86/include/asm/pv/domain.h
@@ -65,10 +65,6 @@ static inline unsigned long get_pcid_bits(const struct vcpu *v, bool is_xpti)
 #endif
 }
 
-/* See hvm_{get,set}_reg() for description. */
-uint64_t pv_get_reg(struct vcpu *v, unsigned int reg);
-void pv_set_reg(struct vcpu *v, unsigned int reg, uint64_t val);
-
 #ifdef CONFIG_PV
 
 void pv_vcpu_destroy(struct vcpu *v);
@@ -93,6 +89,10 @@ unsigned long pv_fixup_guest_cr4(const struct vcpu *v, unsigned long cr4);
 /* Create a cr4 value to load into hardware, based on vcpu settings. */
 unsigned long pv_make_cr4(const struct vcpu *v);
 
+/* See hvm_{get,set}_reg() for description. */
+uint64_t pv_get_reg(struct vcpu *v, unsigned int reg);
+void pv_set_reg(struct vcpu *v, unsigned int reg, uint64_t val);
+
 bool xpti_pcid_enabled(void);
 
 #else  /* !CONFIG_PV */
@@ -106,6 +106,15 @@ static inline int pv_domain_initialise(struct domain *d) { return -EOPNOTSUPP; }
 
 static inline unsigned long pv_make_cr4(const struct vcpu *v) { return ~0ul; }
 
+static inline uint64_t pv_get_reg(struct vcpu *v, unsigned int reg)
+{
+    ASSERT_UNREACHABLE();
+}
+static inline void pv_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
+{
+    ASSERT_UNREACHABLE();
+}
+
 #endif	/* CONFIG_PV */
 
 void paravirt_ctxt_switch_from(struct vcpu *v);
-- 
2.11.0


