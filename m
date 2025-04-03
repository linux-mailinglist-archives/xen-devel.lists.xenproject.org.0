Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D09AFA7A311
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 14:45:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936782.1337943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Jw4-0003IM-Gh; Thu, 03 Apr 2025 12:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936782.1337943; Thu, 03 Apr 2025 12:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Jw4-0003G5-Da; Thu, 03 Apr 2025 12:44:44 +0000
Received: by outflank-mailman (input) for mailman id 936782;
 Thu, 03 Apr 2025 12:44:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K4Uf=WV=bounce.vates.tech=bounce-md_30504962.67ee82b4.v1-ef2deb9bb0604966a35dd64b54b3996a@srs-se1.protection.inumbo.net>)
 id 1u0Jw3-0003Fv-4v
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 12:44:43 +0000
Received: from mail186-2.suw21.mandrillapp.com
 (mail186-2.suw21.mandrillapp.com [198.2.186.2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66a76c71-1089-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 14:44:37 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-2.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4ZT1dw2K9fzS62T5h
 for <xen-devel@lists.xenproject.org>; Thu,  3 Apr 2025 12:44:36 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ef2deb9bb0604966a35dd64b54b3996a; Thu, 03 Apr 2025 12:44:36 +0000
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
X-Inumbo-ID: 66a76c71-1089-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1743684276; x=1743954276;
	bh=x3Lf/29479RVu7L2xkSakMwsgOtskg4f3A7BD13Z4KM=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=w8N28Lq92U3OwTReyaXPxGw/bdOvk3kwLUnFKDA6pTMooDUSMBJBzLrIaObtndvwa
	 F4hY8+yozwzk7PgohieIvJmWkflRYrAb7Z7bziclRoLpSeovRZFLJ/YAair4yQ2ZhX
	 O6z214kMVofN+9pB/HwRuUXDZoOe1k4cEVoVuIMvAL1cq589direVXM7yVndhQUckF
	 UdBFDtUdm053l6BmjSHKcvjxhzax4bdBDg5Aux8MaPZogoFLGrzXxfnyzx+cvELECC
	 lLaB8dpsZP5nWtwjIQf+lj8tcEUr499kBmfCRUBl++e0HVKRsXcBhCuwhcDKyuJs5q
	 db15XbC8ew4kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1743684276; x=1743944776; i=teddy.astie@vates.tech;
	bh=x3Lf/29479RVu7L2xkSakMwsgOtskg4f3A7BD13Z4KM=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=yKEjCQdx0SgeHMTDk9ttmbzS5qlY3zWYUdvK3/KApcG87YIh21qh8KV2aFi2rLtCJ
	 Y03ZHQIzOXdHVeHhEAvtHhTx1BEaUAWVi1Y9GwaU4j/9pHkAM+qR2v9Q2CeQJ4FqF5
	 YJpvWFf2PT+rU9XkV0NSChJSDXP9uFm6mnQqVq7hYQTBxybl9VbgQBjSC3QyzWQfC5
	 TYicGEzdSYy+rI59wcVvRD8kR6T3Rg+TAqv1X1v+GX6rx0jSR6EoSMbMNOFZee2xan
	 DhPvo/r3/YBdbhZOFPd2argFYWJeovY/+/TTHV6bMGD2Qa2AKtI1QkJM2JxHDZv0OP
	 N+uodlHl/uGDA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH]=20x86/amd:=20Add=20support=20for=20AMD=20TCE?=
X-Mailer: git-send-email 2.47.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1743684275373
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <6b751a400df49217defc89a19b3ac2ca33ab7690.1743683787.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ef2deb9bb0604966a35dd64b54b3996a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250403:md
Date: Thu, 03 Apr 2025 12:44:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

AMD Translation Cache Extension is a flag that can be enabled in the EFER MSR to optimize
some TLB flushes. Enable this flag if supported by hardware.

AMD Architecture Developer Manual describe this feature as follow
> Setting this bit to 1 changes how the INVLPG, INVLPGB, and INVPCID instructions operate
> on TLB entries. When this bit is 0, these instructions remove the target PTE from the
> TLB as well as all upper-level table entries that are cached in the TLB, whether or not
> they are associated with the target PTE. When this bit is set, these instructions will
> remove the target PTE and only those upper-level entries that lead to the target PTE in
> the page table hierarchy, leaving unrelated upper-level entries intact. This may provide
> a performance benefit.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
RFC:
 - is this change actually safe ?
 - should we add a tce/no-tce option to opt-in/out this feature ?
 - is this flag enabled at the right moment during boot ?
---
 xen/arch/x86/include/asm/cpufeature.h       | 1 +
 xen/arch/x86/include/asm/msr-index.h        | 1 +
 xen/arch/x86/setup.c                        | 7 +++++++
 xen/arch/x86/smpboot.c                      | 3 +++
 xen/include/public/arch-x86/cpufeatureset.h | 1 +
 5 files changed, 13 insertions(+)

diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 05399fb9c9..ab6d07b767 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -114,6 +114,7 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_xop             boot_cpu_has(X86_FEATURE_XOP)
 #define cpu_has_skinit          boot_cpu_has(X86_FEATURE_SKINIT)
 #define cpu_has_fma4            boot_cpu_has(X86_FEATURE_FMA4)
+#define cpu_has_tce             boot_cpu_has(X86_FEATURE_TCE)
 #define cpu_has_tbm             boot_cpu_has(X86_FEATURE_TBM)
 
 /* CPUID level 0x0000000D:1.eax */
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 22d9e76e55..d7b3a4bc40 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -200,6 +200,7 @@
 #define  EFER_NXE                           (_AC(1, ULL) << 11) /* No Execute Enable */
 #define  EFER_SVME                          (_AC(1, ULL) << 12) /* Secure Virtual Machine Enable */
 #define  EFER_FFXSE                         (_AC(1, ULL) << 14) /* Fast FXSAVE/FXRSTOR */
+#define  EFER_TCE                           (_AC(1, ULL) << 15) /* Translation Cache Extensions */
 #define  EFER_AIBRSE                        (_AC(1, ULL) << 21) /* Automatic IBRS Enable */
 
 #define EFER_KNOWN_MASK \
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index d70abb7e0c..96f200f853 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2008,6 +2008,13 @@ void asmlinkage __init noreturn __start_xen(void)
     if ( cpu_has_pku )
         set_in_cr4(X86_CR4_PKE);
 
+    if ( boot_cpu_has(X86_FEATURE_TCE) )
+    {
+        printk("Enabling AMD TCE\n");
+
+        write_efer(read_efer() | EFER_TCE);
+    }
+
     if ( opt_invpcid && cpu_has_invpcid )
         use_invpcid = true;
 
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 54207e6d88..fbd1710720 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -372,6 +372,9 @@ void asmlinkage start_secondary(void *unused)
 
     microcode_update_one();
 
+    if ( boot_cpu_has(X86_FEATURE_TCE) )
+        write_efer(read_efer() | EFER_TCE);
+
     /*
      * If any speculative control MSRs are available, apply Xen's default
      * settings.  Note: These MSRs may only become available after loading
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index cc6e984a88..a0c8d561fb 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -170,6 +170,7 @@ XEN_CPUFEATURE(SKINIT,        3*32+12) /*   SKINIT/STGI instructions */
 XEN_CPUFEATURE(WDT,           3*32+13) /*   Watchdog timer */
 XEN_CPUFEATURE(LWP,           3*32+15) /*   Light Weight Profiling */
 XEN_CPUFEATURE(FMA4,          3*32+16) /*A  4 operands MAC instructions */
+XEN_CPUFEATURE(TCE,           3*32+17) /*   Translation Cache Extension support */
 XEN_CPUFEATURE(NODEID_MSR,    3*32+19) /*   NodeId MSR */
 XEN_CPUFEATURE(TBM,           3*32+21) /*A  trailing bit manipulations */
 XEN_CPUFEATURE(TOPOEXT,       3*32+22) /*   topology extensions CPUID leafs */
-- 
2.47.2



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

