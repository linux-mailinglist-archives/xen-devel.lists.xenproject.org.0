Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A151D8CBD23
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 10:40:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727339.1131817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9hWA-0002oI-9h; Wed, 22 May 2024 08:40:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727339.1131817; Wed, 22 May 2024 08:40:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9hWA-0002mB-6a; Wed, 22 May 2024 08:40:14 +0000
Received: by outflank-mailman (input) for mailman id 727339;
 Wed, 22 May 2024 08:40:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V5RZ=MZ=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1s9hW8-0002m1-SO
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 08:40:12 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e684e0a9-1816-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 10:40:11 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 21F1F35779;
 Wed, 22 May 2024 04:40:10 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 1919535777;
 Wed, 22 May 2024 04:40:10 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 9684035776;
 Wed, 22 May 2024 04:40:08 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: e684e0a9-1816-11ef-90a0-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=/X53LE/dz4N5HVUlkrUINn3qO
	TL2CeuDunQfSqMtggo=; b=onfZYvPkj8IbEJkz9sPXJpYcpY8exJiNsIIYl8wde
	QMDG5tjDXTz8isSiP7tlytN2ZrHu/ik7pMG7FUZY7kwGPKClpL3RD0GG1J280xVZ
	yZwTXRZ1BoUyjpoXxpIi6uPiFHuQBSN8D/cfk3SvWD9ax1bqHeHEWRCOe8ddN1bx
	KA=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v4 1/3] x86/intel: move vmce_has_lmce() routine to header
Date: Wed, 22 May 2024 11:40:06 +0300
Message-Id: <db547833fa3887e2e36c8418d3f8a142bebb847d.1716366581.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1716366581.git.Sergiy_Kibrik@epam.com>
References: <cover.1716366581.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 E5427ACA-1816-11EF-B91C-78DCEB2EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

Moving this function out of mce_intel.c will make it possible to disable
build of Intel MCE code later on, because the function gets called from
common x86 code.

Also replace boilerplate code that checks for MCG_LMCE_P flag with
vmce_has_lmce(), which might contribute to readability a bit.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
CC: Jan Beulich <jbeulich@suse.com>
---
changes in v4:
 - changed description a bit
changes in v3:
 - do not check for CONFIG_INTEL
 - remove CONFIG_INTEL from patch description
changes in v2:
 - move vmce_has_lmce() to cpu/mcheck/mce.h
 - move IS_ENABLED(CONFIG_INTEL) check inside vmce_has_lmce()
 - changed description
---
 xen/arch/x86/cpu/mcheck/mce.h       | 5 +++++
 xen/arch/x86/cpu/mcheck/mce_intel.c | 4 ----
 xen/arch/x86/cpu/mcheck/vmce.c      | 5 ++---
 xen/arch/x86/include/asm/mce.h      | 1 -
 xen/arch/x86/msr.c                  | 2 ++
 5 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce.h b/xen/arch/x86/cpu/mcheck/mce.=
h
index 4806405f96..eba4b536c7 100644
--- a/xen/arch/x86/cpu/mcheck/mce.h
+++ b/xen/arch/x86/cpu/mcheck/mce.h
@@ -170,6 +170,11 @@ static inline int mce_bank_msr(const struct vcpu *v,=
 uint32_t msr)
     return 0;
 }
=20
+static inline bool vmce_has_lmce(const struct vcpu *v)
+{
+    return v->arch.vmce.mcg_cap & MCG_LMCE_P;
+}
+
 struct mce_callbacks {
     void (*handler)(const struct cpu_user_regs *regs);
     bool (*check_addr)(uint64_t status, uint64_t misc, int addr_type);
diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mchec=
k/mce_intel.c
index 3f5199b531..af43281cc6 100644
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -1050,7 +1050,3 @@ int vmce_intel_rdmsr(const struct vcpu *v, uint32_t=
 msr, uint64_t *val)
     return 1;
 }
=20
-bool vmce_has_lmce(const struct vcpu *v)
-{
-    return v->arch.vmce.mcg_cap & MCG_LMCE_P;
-}
diff --git a/xen/arch/x86/cpu/mcheck/vmce.c b/xen/arch/x86/cpu/mcheck/vmc=
e.c
index 4da6f4a3e4..5abdf4cb5f 100644
--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -203,7 +203,7 @@ int vmce_rdmsr(uint32_t msr, uint64_t *val)
          * bits are always set in guest MSR_IA32_FEATURE_CONTROL by Xen,=
 so it
          * does not need to check them here.
          */
-        if ( cur->arch.vmce.mcg_cap & MCG_LMCE_P )
+        if ( vmce_has_lmce(cur) )
         {
             *val =3D cur->arch.vmce.mcg_ext_ctl;
             mce_printk(MCE_VERBOSE, "MCE: %pv: rd MCG_EXT_CTL %#"PRIx64"=
\n",
@@ -332,8 +332,7 @@ int vmce_wrmsr(uint32_t msr, uint64_t val)
         break;
=20
     case MSR_IA32_MCG_EXT_CTL:
-        if ( (cur->arch.vmce.mcg_cap & MCG_LMCE_P) &&
-             !(val & ~MCG_EXT_CTL_LMCE_EN) )
+        if ( vmce_has_lmce(cur) && !(val & ~MCG_EXT_CTL_LMCE_EN) )
             cur->arch.vmce.mcg_ext_ctl =3D val;
         else
             ret =3D -1;
diff --git a/xen/arch/x86/include/asm/mce.h b/xen/arch/x86/include/asm/mc=
e.h
index 6ce56b5b85..2ec47a71ae 100644
--- a/xen/arch/x86/include/asm/mce.h
+++ b/xen/arch/x86/include/asm/mce.h
@@ -41,7 +41,6 @@ extern void vmce_init_vcpu(struct vcpu *v);
 extern int vmce_restore_vcpu(struct vcpu *v, const struct hvm_vmce_vcpu =
*ctxt);
 extern int vmce_wrmsr(uint32_t msr, uint64_t val);
 extern int vmce_rdmsr(uint32_t msr, uint64_t *val);
-extern bool vmce_has_lmce(const struct vcpu *v);
 extern int vmce_enable_mca_cap(struct domain *d, uint64_t cap);
=20
 DECLARE_PER_CPU(unsigned int, nr_mce_banks);
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 9babd441f9..b0ec96f021 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -24,6 +24,8 @@
=20
 #include <public/hvm/params.h>
=20
+#include "cpu/mcheck/mce.h"
+
 DEFINE_PER_CPU(uint32_t, tsc_aux);
=20
 int init_vcpu_msr_policy(struct vcpu *v)
--=20
2.25.1


