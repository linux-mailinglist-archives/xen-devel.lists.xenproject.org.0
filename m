Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1B39547D3
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 13:17:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778578.1188624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seuxF-0001GQ-9X; Fri, 16 Aug 2024 11:17:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778578.1188624; Fri, 16 Aug 2024 11:17:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seuxF-0001EL-6x; Fri, 16 Aug 2024 11:17:13 +0000
Received: by outflank-mailman (input) for mailman id 778578;
 Fri, 16 Aug 2024 11:17:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0eKx=PP=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1seuxD-0000sM-Rl
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 11:17:11 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12eb44ea-5bc1-11ef-a505-bb4a2ccca743;
 Fri, 16 Aug 2024 13:17:10 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 47DFF27A4F;
 Fri, 16 Aug 2024 07:17:07 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 2F8E927A4E;
 Fri, 16 Aug 2024 07:17:07 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 4F14E27A4D;
 Fri, 16 Aug 2024 07:17:06 -0400 (EDT)
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
X-Inumbo-ID: 12eb44ea-5bc1-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=0sUZEfq34Jce26Uo7t070vVwu
	CBDfAUvgjTre/OP4Yc=; b=IVOGs9bG+DjAJ2zbS6AfIdx+jBRUgAfr9RkT6v8dJ
	6s9qqB8rE/GWW5x0V7M/k/tuQjc1rzM8vxEqeS95MHPRWs4/tNWrRNMN2dW8JvM/
	V58MiOOqUzDkianP/8rqDT/9A4BBYzZfHSyrIzmn6vCKmmeEEtyeyITXVOh3+I0i
	Rg=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v2 4/5] x86/intel: optional build of intel.c
Date: Fri, 16 Aug 2024 14:17:03 +0300
Message-Id: <ce06eff2060c94ebf659d11f7390c577a3c6a24e.1723806405.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1723806405.git.Sergiy_Kibrik@epam.com>
References: <cover.1723806405.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 122BD1E2-5BC1-11EF-B11F-2BAEEB2EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

With specific config option INTEL in place and most of the code that depe=
nds
on intel.c now can be optionally enabled/disabled it's now possible to pu=
t
the whole intel.c under INTEL option as well. This will allow for a Xen b=
uild
without Intel CPU support.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
CC: Jan Beulich <jbeulich@suse.com>
---
changes in v2:
  - drop set_in_mcu_opt_ctrl() stub
---
 xen/arch/x86/cpu/Makefile            | 4 ++--
 xen/arch/x86/cpu/common.c            | 2 ++
 xen/arch/x86/include/asm/processor.h | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu/Makefile b/xen/arch/x86/cpu/Makefile
index 80739d0256..eeb9ebe562 100644
--- a/xen/arch/x86/cpu/Makefile
+++ b/xen/arch/x86/cpu/Makefile
@@ -6,8 +6,8 @@ obj-y +=3D amd.o
 obj-$(CONFIG_CENTAUR) +=3D centaur.o
 obj-y +=3D common.o
 obj-$(CONFIG_HYGON) +=3D hygon.o
-obj-y +=3D intel.o
-obj-y +=3D intel_cacheinfo.o
+obj-$(CONFIG_INTEL) +=3D intel.o
+obj-$(CONFIG_INTEL) +=3D intel_cacheinfo.o
 obj-y +=3D mwait-idle.o
 obj-$(CONFIG_SHANGHAI) +=3D shanghai.o
 obj-y +=3D vpmu.o
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index dcc2753212..580b01d6d5 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -336,8 +336,10 @@ void __init early_cpu_init(bool verbose)
=20
 	c->x86_vendor =3D x86_cpuid_lookup_vendor(ebx, ecx, edx);
 	switch (c->x86_vendor) {
+#ifdef CONFIG_INTEL
 	case X86_VENDOR_INTEL:    intel_unlock_cpuid_leaves(c);
 				  actual_cpu =3D intel_cpu_dev;    break;
+#endif
 	case X86_VENDOR_AMD:      actual_cpu =3D amd_cpu_dev;      break;
 #ifdef CONFIG_CENTAUR
 	case X86_VENDOR_CENTAUR:  actual_cpu =3D centaur_cpu_dev;  break;
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/=
asm/processor.h
index 66463f6a6d..a52f8b0a83 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -507,13 +507,14 @@ static inline uint8_t get_cpu_family(uint32_t raw, =
uint8_t *model,
 extern int8_t opt_tsx;
 extern bool rtm_disabled;
 void tsx_init(void);
+void update_mcu_opt_ctrl(void);
 #else
 #define opt_tsx      0     /* explicitly indicate TSX is off */
 #define rtm_disabled false /* RTM was not force-disabled */
 static inline void tsx_init(void) {}
+static inline void update_mcu_opt_ctrl(void) {}
 #endif
=20
-void update_mcu_opt_ctrl(void);
 void set_in_mcu_opt_ctrl(uint32_t mask, uint32_t val);
=20
 enum ap_boot_method {
--=20
2.25.1


