Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD47AAB940E
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 04:29:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986190.1371850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFkp5-0006hK-Br; Fri, 16 May 2025 02:29:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986190.1371850; Fri, 16 May 2025 02:29:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFkp5-0006e3-8E; Fri, 16 May 2025 02:29:19 +0000
Received: by outflank-mailman (input) for mailman id 986190;
 Fri, 16 May 2025 02:29:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=07xk=YA=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uFkp3-0006Ps-Jc
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 02:29:17 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8fe4790b-31fd-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 04:29:16 +0200 (CEST)
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
X-Inumbo-ID: 8fe4790b-31fd-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747362555; x=1747621755;
	bh=h5EcJl/sF6rW1//mlhgDFyvsZGHFJmMNHZYVn0i9SSc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=IsOeSgljnitiwxzLY+Mm65+VdfNqwUHMczWk757b9RfbWTEr6IF68CBhrAvgTP3vM
	 N+S02HJDj/ZoQMtDqc3iJIeG6xxm5+X+WXPMMQA+3cllxeWe1fUJhNAandKv55lerg
	 GkvRzzeg+G0YUtD/ht5PGlGOnjxW6WoGYgadR140v6fQkYaHFbLLJ+1psAgCWvnm/A
	 l4vG6J1BMLVRsE0z4E+c7K7LBO0KxZzIGsq3JSI6uIAJEySdB39ChWEQGTYn2hJmE7
	 n0+PJho4uMFlKRS9GcH7zVNsjNkzJj4LvSngIIzfSwGJFAAq9dLIaFVb3ZucpckJS5
	 I2mCHPxFKW6Kw==
Date: Fri, 16 May 2025 02:29:09 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 1/2] xen/domain: introduce non-x86 hardware emulation flags
Message-ID: <20250516022855.1146121-2-dmukhin@ford.com>
In-Reply-To: <20250516022855.1146121-1-dmukhin@ford.com>
References: <20250516022855.1146121-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 30a6354a2881bec5fbb4828e4ff7ea5ce265ac01
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Define per-architecture emulation_flags for configuring domain emulation
features.

Print d->arch.emulation_flags from 'q' keyhandler for better traceability
while debugging.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- dropped comments
---
 xen/arch/arm/include/asm/domain.h   | 1 +
 xen/arch/ppc/include/asm/domain.h   | 1 +
 xen/arch/riscv/include/asm/domain.h | 1 +
 xen/common/keyhandler.c             | 1 +
 4 files changed, 4 insertions(+)

diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/d=
omain.h
index a3487ca713..70e6e7d49b 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -121,6 +121,7 @@ struct arch_domain
     void *tee;
 #endif
=20
+    uint32_t emulation_flags;
 }  __cacheline_aligned;
=20
 struct arch_vcpu
diff --git a/xen/arch/ppc/include/asm/domain.h b/xen/arch/ppc/include/asm/d=
omain.h
index 3a447272c6..001116a0ab 100644
--- a/xen/arch/ppc/include/asm/domain.h
+++ b/xen/arch/ppc/include/asm/domain.h
@@ -21,6 +21,7 @@ struct arch_vcpu {
=20
 struct arch_domain {
     struct hvm_domain hvm;
+    uint32_t emulation_flags;
 };
=20
 #include <xen/sched.h>
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/a=
sm/domain.h
index c3d965a559..7bc242da55 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -18,6 +18,7 @@ struct arch_vcpu {
=20
 struct arch_domain {
     struct hvm_domain hvm;
+    uint32_t emulation_flags;
 };
=20
 #include <xen/sched.h>
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



