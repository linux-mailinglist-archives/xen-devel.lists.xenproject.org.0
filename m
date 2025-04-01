Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C66F3A7721F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 02:52:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933296.1335287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzPrz-0001Cs-U0; Tue, 01 Apr 2025 00:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933296.1335287; Tue, 01 Apr 2025 00:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzPrz-00015V-Pu; Tue, 01 Apr 2025 00:52:47 +0000
Received: by outflank-mailman (input) for mailman id 933296;
 Tue, 01 Apr 2025 00:52:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dnoa=WT=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tzPry-00012a-4g
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 00:52:46 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f4d30db-0e93-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 02:52:44 +0200 (CEST)
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
X-Inumbo-ID: 9f4d30db-0e93-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743468763; x=1743727963;
	bh=VbGdRQcIdJuxOnTDcd1yoix3INOLV2Z0Txcr2KwDyRY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=BrRU3CUwzP0YzrmSowanjdjabarJvCg4qgtATyyKwb/5lPSYRatEF4D+XolhR2xlj
	 tRu2seO2BrG0Jo2rmzBcDtl7xo/cwHrFZdRLUweGq7p3FDtVbuohaQ0Lr4RKsEwHjY
	 WG+nS/byz1ps5lDL3mbD4VUsSrJtpCz7QXq6I2oOMWMiknWNyeYpU21gfJyO5c9GhJ
	 ADTrkUdPbSa2rdE7QaRmS+AVOSGf8TzR045NVY11WPlkG+Bwh/GRWUj4cJx3KezORg
	 6rjE1hivbAw8LWNHwO7d3Mxb0THqXvMskcZHKI+fZZGTPcXy2M/v4hbu0Q99mTWKpd
	 QKD6bOvzWYXjg==
Date: Tue, 01 Apr 2025 00:52:38 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 1/3] xen/domain: introduce non-x86 hardware emulation flags
Message-ID: <20250401005224.461325-2-dmukhin@ford.com>
In-Reply-To: <20250401005224.461325-1-dmukhin@ford.com>
References: <20250401005224.461325-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 18d18a5caa72342da17d3b5f5ef42323c57fea6b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Define per-architecture emulation_flags for configuring in-hypervisor
emulators.

Print d->arch.emulation_flags from 'q' keyhandler for better traceability
while debugging in-hypervisor hardware emulators.

Simplify the x86's emulation_flags description and make it consistent
with newly introduced non-x86 descriptions.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/include/asm/domain.h   | 2 ++
 xen/arch/ppc/include/asm/domain.h   | 2 ++
 xen/arch/riscv/include/asm/domain.h | 2 ++
 xen/arch/x86/include/asm/domain.h   | 2 +-
 xen/common/keyhandler.c             | 1 +
 5 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/d=
omain.h
index 50b6a4b009..279ff64fe0 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -119,6 +119,8 @@ struct arch_domain
     void *tee;
 #endif
=20
+    /* Hardware emulation flags. */
+    uint32_t emulation_flags;
 }  __cacheline_aligned;
=20
 struct arch_vcpu
diff --git a/xen/arch/ppc/include/asm/domain.h b/xen/arch/ppc/include/asm/d=
omain.h
index 3a447272c6..8aa7b4a6ac 100644
--- a/xen/arch/ppc/include/asm/domain.h
+++ b/xen/arch/ppc/include/asm/domain.h
@@ -21,6 +21,8 @@ struct arch_vcpu {
=20
 struct arch_domain {
     struct hvm_domain hvm;
+    /* Hardware emulation flags. */
+    uint32_t emulation_flags;
 };
=20
 #include <xen/sched.h>
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/a=
sm/domain.h
index c3d965a559..b561e6f4f8 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -18,6 +18,8 @@ struct arch_vcpu {
=20
 struct arch_domain {
     struct hvm_domain hvm;
+    /* Hardware emulation flags. */
+    uint32_t emulation_flags;
 };
=20
 #include <xen/sched.h>
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/d=
omain.h
index 5fc1d1e5d0..6b877e33a1 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -456,7 +456,7 @@ struct arch_domain
     /* Don't unconditionally inject #GP for unhandled MSRs. */
     bool msr_relaxed;
=20
-    /* Emulated devices enabled bitmap. */
+    /* Hardware emulation flags. */
     uint32_t emulation_flags;
 } __cacheline_aligned;
=20
diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index 0bb842ec00..73f5134b68 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -306,6 +306,7 @@ static void cf_check dump_domains(unsigned char key)
             if ( test_bit(i, &d->watchdog_inuse_map) )
                 printk("    watchdog %d expires in %d seconds\n",
                        i, (u32)((d->watchdog_timer[i].expires - NOW()) >> =
30));
+        printk("    emulation_flags %#x\n", d->arch.emulation_flags);
=20
         arch_dump_domain_info(d);
=20
--=20
2.34.1



