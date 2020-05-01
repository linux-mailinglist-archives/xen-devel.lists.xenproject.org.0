Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA331C2103
	for <lists+xen-devel@lfdr.de>; Sat,  2 May 2020 00:59:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUed2-000898-8h; Fri, 01 May 2020 22:59:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T3Df=6P=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jUed1-00088e-40
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 22:59:31 +0000
X-Inumbo-ID: 5dd33824-8bff-11ea-ae69-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5dd33824-8bff-11ea-ae69-bc764e2007e4;
 Fri, 01 May 2020 22:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588373949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zvkVxgzJkr/FcspZwSx7AStaUlQ9aD0VLFmFs6qVRg0=;
 b=fGi6lLAUwPdBOiAVnHjWKK41Hlx2go5w8R3p2YUdlH3M2qWCCLOm/+30
 CGTZ7u/y2QHMJB2jLnSBgDL3eDVMkfd8796S2IOUlQd7lXm65I+AS4zt8
 0mnc6XI6GExBY2f1SmPcH3skfdtYVPkE1xl82dnU3cNsqsYlsSFSn9U/h M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: uy/J8kG2T7UsumKNrlGpZrycXRrLKHkS8/gkbU9dYQkI//NE/4SNcE1Qgh87iP7E0nwcLnHD82
 NqrkcX/IuKsap+7nG9do8Pmvg5rRYn+kNoArkjTxcKfm4aNlugT2LrRAe+VZLgA4aJqbeuKBhb
 I8P1T/h6bQGm6aw4IR62GF8X9FdbwUMVXXMgmB/4tOlS+VC7KDeWKCZofJWfAqQdV+a+H/T0FD
 fCueCjlYLwN7bzkITbTT5OPtNTDae3q9QDVZwbo1ytYpxTw58XrwSYQg7RIFaF1Wc3+LfNd8Qs
 JZk=
X-SBRS: 2.7
X-MesageID: 16854948
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,341,1583211600"; d="scan'208";a="16854948"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 04/16] x86/smpboot: Write the top-of-stack block in
 cpu_smpboot_alloc()
Date: Fri, 1 May 2020 23:58:26 +0100
Message-ID: <20200501225838.9866-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200501225838.9866-1-andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This allows the AP boot assembly use per-cpu variables, and brings the
semantics closer to that of the BSP, which can use per-cpu variables from the
start of day.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/smpboot.c        | 7 ++++++-
 xen/include/asm-x86/current.h | 5 -----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 5a3786d399..f999323bc4 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -329,7 +329,6 @@ void start_secondary(void *unused)
 
     /* Critical region without IDT or TSS.  Any fault is deadly! */
 
-    set_processor_id(cpu);
     set_current(idle_vcpu[cpu]);
     this_cpu(curr_vcpu) = idle_vcpu[cpu];
     rdmsrl(MSR_EFER, this_cpu(efer));
@@ -986,6 +985,7 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
 
 static int cpu_smpboot_alloc(unsigned int cpu)
 {
+    struct cpu_info *info;
     unsigned int i, memflags = 0;
     nodeid_t node = cpu_to_node(cpu);
     seg_desc_t *gdt;
@@ -999,6 +999,11 @@ static int cpu_smpboot_alloc(unsigned int cpu)
         stack_base[cpu] = alloc_xenheap_pages(STACK_ORDER, memflags);
     if ( stack_base[cpu] == NULL )
         goto out;
+
+    info = get_cpu_info_from_stack((unsigned long)stack_base[cpu]);
+    info->processor_id = cpu;
+    info->per_cpu_offset = __per_cpu_offset[cpu];
+
     memguard_guard_stack(stack_base[cpu]);
 
     gdt = per_cpu(gdt, cpu) ?: alloc_xenheap_pages(0, memflags);
diff --git a/xen/include/asm-x86/current.h b/xen/include/asm-x86/current.h
index 0b47485337..5b8f4dbc79 100644
--- a/xen/include/asm-x86/current.h
+++ b/xen/include/asm-x86/current.h
@@ -100,11 +100,6 @@ static inline struct cpu_info *get_cpu_info(void)
 #define current               (get_current())
 
 #define get_processor_id()    (get_cpu_info()->processor_id)
-#define set_processor_id(id)  do {                                      \
-    struct cpu_info *ci__ = get_cpu_info();                             \
-    ci__->per_cpu_offset = __per_cpu_offset[ci__->processor_id = (id)]; \
-} while (0)
-
 #define guest_cpu_user_regs() (&get_cpu_info()->guest_cpu_user_regs)
 
 /*
-- 
2.11.0


