Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A15411AE17D
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 17:51:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPTG9-0007XQ-9w; Fri, 17 Apr 2020 15:50:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z9Py=6B=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jPTG7-0007X6-07
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 15:50:27 +0000
X-Inumbo-ID: 1f61c946-80c3-11ea-8d2d-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f61c946-80c3-11ea-8d2d-12813bfff9fa;
 Fri, 17 Apr 2020 15:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587138613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I+Bzh3V08iUOv/zMH5/E2yogQfOh3a7ZmPE910Vqxec=;
 b=b6K8WYIT+yJsqi9Eb2Edl+tupQ8guogVzlVKRG4M/eAcnMCBmCVlo3kX
 vUlKY7W3ImYRftVfbgnHOnDwFmjEzm2CY0Ri/eeAGP8GQnpwgeI27+Aex
 gAK1p8aprKrYmAJsZPpZkETvmEXUegiXQpLusuRJt6enm/LJq72dFsvtM 4=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ZZHdT/SVFo4ioFH9zsgNLB31zP9EFSLqKfJ1WrK6nWJd9gTlf5lGp94n5yIVrvpF+MJ6J6Z5xA
 quFbwGvXi+DAJP2wViJRg163Sf9NhLgrl02pS8kqn1Z4s8ixFd1VQxipQ80JL3rZyhr9FnHgFx
 RG2iB+SiTSaulJ8iyyT/KL/KlHIdN3fW+iyEmmrwhoPMa2pM+DDubLbuZmuFN1i3FF/9YE0li5
 Mye8StftOunlmrc6BQr6EmnZKN53rV39LgrhQj3uIY/0aR+MeBj1NjRVTPyfHT17ZphWVikUnl
 NPw=
X-SBRS: 2.7
X-MesageID: 16168815
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,395,1580792400"; d="scan'208";a="16168815"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 3/3] x86/pv: Compile out compat_gdt in !CONFIG_PV builds
Date: Fri, 17 Apr 2020 16:50:04 +0100
Message-ID: <20200417155004.16806-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200417155004.16806-1-andrew.cooper3@citrix.com>
References: <20200417155004.16806-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

There is no need for the Compat GDT if there are no 32bit PV guests.  This
saves 4k per online CPU

Bloat-o-meter reports the following savings in Xen itself:

  add/remove: 0/3 grow/shrink: 1/4 up/down: 7/-4612 (-4605)
  Function                                     old     new   delta
  cpu_smpboot_free                            1249    1256      +7
  per_cpu__compat_gdt_l1e                        8       -      -8
  per_cpu__compat_gdt                            8       -      -8
  init_idt_traps                               442     420     -22
  load_system_tables                           414     364     -50
  trap_init                                    444     280    -164
  cpu_smpboot_callback                        1255     991    -264
  boot_compat_gdt                             4096       -   -4096
  Total: Before=3062726, After=3058121, chg -0.15%

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

The increase in cpu_smpboot_free() appears to be a consequence of a totally
different layout of basic blocks.
---
 xen/arch/x86/cpu/common.c |  5 +++--
 xen/arch/x86/desc.c       |  2 ++
 xen/arch/x86/smpboot.c    |  5 ++++-
 xen/arch/x86/traps.c      | 10 +++++++---
 4 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 1b33f1ed71..7b093cb421 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -752,8 +752,9 @@ void load_system_tables(void)
 
 	_set_tssldt_desc(gdt + TSS_ENTRY, (unsigned long)tss,
 			 sizeof(*tss) - 1, SYS_DESC_tss_avail);
-	_set_tssldt_desc(compat_gdt + TSS_ENTRY, (unsigned long)tss,
-			 sizeof(*tss) - 1, SYS_DESC_tss_busy);
+	if ( IS_ENABLED(CONFIG_PV32) )
+		_set_tssldt_desc(compat_gdt + TSS_ENTRY, (unsigned long)tss,
+				 sizeof(*tss) - 1, SYS_DESC_tss_busy);
 
 	per_cpu(full_gdt_loaded, cpu) = false;
 	lgdt(&gdtr);
diff --git a/xen/arch/x86/desc.c b/xen/arch/x86/desc.c
index dfeb1beaa8..39080ca672 100644
--- a/xen/arch/x86/desc.c
+++ b/xen/arch/x86/desc.c
@@ -55,6 +55,7 @@ seg_desc_t boot_gdt[PAGE_SIZE / sizeof(seg_desc_t)] =
     [SEL2GDT(PER_CPU_SELECTOR)] =     { 0x0000910000000000 },
 };
 
+#ifdef CONFIG_PV32
 __section(".data.page_aligned") __aligned(PAGE_SIZE)
 seg_desc_t boot_compat_gdt[PAGE_SIZE / sizeof(seg_desc_t)] =
 {
@@ -83,6 +84,7 @@ seg_desc_t boot_compat_gdt[PAGE_SIZE / sizeof(seg_desc_t)] =
     /* 0xe060 - per-CPU entry (limit == cpu) */
     [SEL2GDT(PER_CPU_SELECTOR)] =     { 0x0000910000000000 },
 };
+#endif
 
 /*
  * Used by each CPU as it starts up, to enter C with a suitable %cs.
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 09264b02d1..f9f63e496f 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -959,7 +959,8 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
             free_domheap_page(mfn_to_page(mfn));
     }
 
-    FREE_XENHEAP_PAGE(per_cpu(compat_gdt, cpu));
+    if ( IS_ENABLED(CONFIG_PV32) )
+        FREE_XENHEAP_PAGE(per_cpu(compat_gdt, cpu));
 
     if ( remove )
     {
@@ -1001,6 +1002,7 @@ static int cpu_smpboot_alloc(unsigned int cpu)
     BUILD_BUG_ON(NR_CPUS > 0x10000);
     gdt[PER_CPU_GDT_ENTRY - FIRST_RESERVED_GDT_ENTRY].a = cpu;
 
+#ifdef CONFIG_PV32
     per_cpu(compat_gdt, cpu) = gdt = alloc_xenheap_pages(0, memflags);
     if ( gdt == NULL )
         goto out;
@@ -1008,6 +1010,7 @@ static int cpu_smpboot_alloc(unsigned int cpu)
         l1e_from_pfn(virt_to_mfn(gdt), __PAGE_HYPERVISOR_RW);
     memcpy(gdt, boot_compat_gdt, NR_RESERVED_GDT_PAGES * PAGE_SIZE);
     gdt[PER_CPU_GDT_ENTRY - FIRST_RESERVED_GDT_ENTRY].a = cpu;
+#endif
 
     if ( idt_tables[cpu] == NULL )
         idt_tables[cpu] = alloc_xenheap_pages(0, memflags);
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index e838846c6b..0bcf554e93 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -100,8 +100,10 @@ static DEFINE_PER_CPU(unsigned long, last_extable_addr);
 
 DEFINE_PER_CPU_READ_MOSTLY(seg_desc_t *, gdt);
 DEFINE_PER_CPU_READ_MOSTLY(l1_pgentry_t, gdt_l1e);
+#ifdef CONFIG_PV32
 DEFINE_PER_CPU_READ_MOSTLY(seg_desc_t *, compat_gdt);
 DEFINE_PER_CPU_READ_MOSTLY(l1_pgentry_t, compat_gdt_l1e);
+#endif
 
 /* Master table, used by CPU0. */
 idt_entry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
@@ -1999,7 +2001,8 @@ void __init init_idt_traps(void)
     idt_tables[0] = idt_table;
 
     this_cpu(gdt) = boot_gdt;
-    this_cpu(compat_gdt) = boot_compat_gdt;
+    if ( IS_ENABLED(CONFIG_PV32) )
+        this_cpu(compat_gdt) = boot_compat_gdt;
 }
 
 extern void (*const autogen_entrypoints[X86_NR_VECTORS])(void);
@@ -2030,8 +2033,9 @@ void __init trap_init(void)
     /* Cache {,compat_}gdt_l1e now that physically relocation is done. */
     this_cpu(gdt_l1e) =
         l1e_from_pfn(virt_to_mfn(boot_gdt), __PAGE_HYPERVISOR_RW);
-    this_cpu(compat_gdt_l1e) =
-        l1e_from_pfn(virt_to_mfn(boot_compat_gdt), __PAGE_HYPERVISOR_RW);
+    if ( IS_ENABLED(CONFIG_PV32) )
+        this_cpu(compat_gdt_l1e) =
+            l1e_from_pfn(virt_to_mfn(boot_compat_gdt), __PAGE_HYPERVISOR_RW);
 
     percpu_traps_init();
 
-- 
2.11.0


