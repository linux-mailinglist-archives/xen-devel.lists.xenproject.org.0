Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2EF94CE44
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 12:09:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774616.1185071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scMYm-0001PH-Kc; Fri, 09 Aug 2024 10:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774616.1185071; Fri, 09 Aug 2024 10:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scMYm-0001Nn-Hy; Fri, 09 Aug 2024 10:09:24 +0000
Received: by outflank-mailman (input) for mailman id 774616;
 Fri, 09 Aug 2024 10:09:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7QEF=PI=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1scMYl-0001NP-Av
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 10:09:23 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71e093e4-5637-11ef-bc04-fd08da9f4363;
 Fri, 09 Aug 2024 12:09:22 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 1CDC018663;
 Fri,  9 Aug 2024 06:09:20 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 155D018662;
 Fri,  9 Aug 2024 06:09:20 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 26B4418661;
 Fri,  9 Aug 2024 06:09:19 -0400 (EDT)
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
X-Inumbo-ID: 71e093e4-5637-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=FcgplM/ww4dhD8AId/NsW6zg4
	b4Mk/iLAAxsyvZiVYY=; b=TayMRCp8yrrOqu0YzcfEfILF52M95JlZcBbTb+JtL
	hk9gdbbDZFdKpWIF4OAAyt7LgC6YZeH9XH+v9rcbZDJ66Zj1qUZ4ftMzzf+gs4eU
	xhmamxoJMjT/aWn1xnZ+JIcaO4Na9+laHECzJdPxCqWS8KBn6hYgiPOZczIbnm+Y
	WM=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 1/2] x86/intel: optional build of intel.c
Date: Fri,  9 Aug 2024 13:09:17 +0300
Message-Id: <25e80b9271607da56abf9d4193e4d91b3d00bd9c.1723196909.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1723196909.git.Sergiy_Kibrik@epam.com>
References: <cover.1723196909.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 710E7172-5637-11EF-9160-2BAEEB2EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

With specific config option INTEL in place and most of the code that depe=
nds
on intel.c now can be optionally enabled/disabled it's now possible to pu=
t
the whole intel.c under INTEL option as well. This will allow for a Xen b=
uild
without Intel CPU support.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/cpu/Makefile            | 6 +++---
 xen/arch/x86/cpu/common.c            | 4 +++-
 xen/arch/x86/include/asm/processor.h | 7 ++++---
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/cpu/Makefile b/xen/arch/x86/cpu/Makefile
index eafce5f204..020c86bda3 100644
--- a/xen/arch/x86/cpu/Makefile
+++ b/xen/arch/x86/cpu/Makefile
@@ -6,10 +6,10 @@ obj-y +=3D amd.o
 obj-y +=3D centaur.o
 obj-y +=3D common.o
 obj-y +=3D hygon.o
-obj-y +=3D intel.o
-obj-y +=3D intel_cacheinfo.o
+obj-$(CONFIG_INTEL) +=3D intel.o
+obj-$(CONFIG_INTEL) +=3D intel_cacheinfo.o
 obj-y +=3D mwait-idle.o
-obj-y +=3D shanghai.o
+obj-$(CONFIG_INTEL) +=3D shanghai.o
 obj-y +=3D vpmu.o
 obj-$(CONFIG_AMD) +=3D vpmu_amd.o
 obj-$(CONFIG_INTEL) +=3D vpmu_intel.o
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index ff4cd22897..50ce13f81c 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -336,11 +336,13 @@ void __init early_cpu_init(bool verbose)
=20
 	c->x86_vendor =3D x86_cpuid_lookup_vendor(ebx, ecx, edx);
 	switch (c->x86_vendor) {
+#ifdef CONFIG_INTEL
 	case X86_VENDOR_INTEL:    intel_unlock_cpuid_leaves(c);
 				  actual_cpu =3D intel_cpu_dev;    break;
+	case X86_VENDOR_SHANGHAI: actual_cpu =3D shanghai_cpu_dev; break;
+#endif
 	case X86_VENDOR_AMD:      actual_cpu =3D amd_cpu_dev;      break;
 	case X86_VENDOR_CENTAUR:  actual_cpu =3D centaur_cpu_dev;  break;
-	case X86_VENDOR_SHANGHAI: actual_cpu =3D shanghai_cpu_dev; break;
 	case X86_VENDOR_HYGON:    actual_cpu =3D hygon_cpu_dev;    break;
 	default:
 		actual_cpu =3D default_cpu;
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/=
asm/processor.h
index 66463f6a6d..a88d45252b 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -507,15 +507,16 @@ static inline uint8_t get_cpu_family(uint32_t raw, =
uint8_t *model,
 extern int8_t opt_tsx;
 extern bool rtm_disabled;
 void tsx_init(void);
+void update_mcu_opt_ctrl(void);
+void set_in_mcu_opt_ctrl(uint32_t mask, uint32_t val);
 #else
 #define opt_tsx      0     /* explicitly indicate TSX is off */
 #define rtm_disabled false /* RTM was not force-disabled */
 static inline void tsx_init(void) {}
+static inline void update_mcu_opt_ctrl(void) {}
+static inline void set_in_mcu_opt_ctrl(uint32_t mask, uint32_t val) {}
 #endif
=20
-void update_mcu_opt_ctrl(void);
-void set_in_mcu_opt_ctrl(uint32_t mask, uint32_t val);
-
 enum ap_boot_method {
     AP_BOOT_NORMAL,
     AP_BOOT_SKINIT,
--=20
2.25.1


