Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E69C1C210A
	for <lists+xen-devel@lfdr.de>; Sat,  2 May 2020 00:59:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUecn-0007zf-EC; Fri, 01 May 2020 22:59:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T3Df=6P=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jUecm-0007z2-4R
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 22:59:16 +0000
X-Inumbo-ID: 5ce7dcf8-8bff-11ea-b9cf-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ce7dcf8-8bff-11ea-b9cf-bc764e2007e4;
 Fri, 01 May 2020 22:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588373948;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KmdiFWTUtoRQ6SF0OGgDhEv3ORD8KJHYv15kmE23ReQ=;
 b=HRQXCw/9UuQPkIuaP98GPgTkF0YBdIab2DH4VEdhwH9i4faNXdsIGgyF
 NkuISlKUyrxyGN9IzXFuPbnIc1bbYnMwE8ZdfdYkmJnQZiuPDfTBcOw0Z
 +QafbUqMWxnEjyYATrkQJc3PHsKTd16Qy/wX0vdgZSwkAvzdJKHjnci9k c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7WuTT0jWBm09Mc/nbOEE+auc69OKlH3GWOmbKE2uVAaOnAmqnkYT90HxHA3xmAPWNI+BMHFQ2r
 QHw2wS8jFcFSMJk6tCSvXzMJibya4VQtH2wTwGkhBdEFfWkDG6fKCGbYlu5ntbh7Dsr5JO9xLN
 Fer8dsWTpxRAq4tmk0Yp0XzXCokf/n7WlYO6HQGVD0hhksc5wAJxM2nddEnnSLjZW9vBsgpxs6
 zEEL36xfT+/7Vf5tWmR5HD6wPpCbAhCWLB/LFoVBCjAczqFaoycmS3subZlpqx8D2WiXLueYZb
 klg=
X-SBRS: 2.7
X-MesageID: 17293962
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,341,1583211600"; d="scan'208";a="17293962"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 01/16] x86/traps: Drop last_extable_addr
Date: Fri, 1 May 2020 23:58:23 +0100
Message-ID: <20200501225838.9866-2-andrew.cooper3@citrix.com>
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

The only user of this facility is dom_crash_sync_extable() by passing 0 into
asm_domain_crash_synchronous().  The common error cases are already covered
with show_page_walk(), leaving only %ss/%fs selector/segment errors in the
compat case.

Point at dom_crash_sync_extable in the error message, which is about as good
as the error hints from other users of asm_domain_crash_synchronous(), and
drop last_extable_addr.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/traps.c        | 11 +----------
 xen/arch/x86/x86_64/entry.S |  2 +-
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 33e5d21ece..fe9457cdb6 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -96,7 +96,6 @@ static char __read_mostly opt_nmi[10] = "fatal";
 string_param("nmi", opt_nmi);
 
 DEFINE_PER_CPU(uint64_t, efer);
-static DEFINE_PER_CPU(unsigned long, last_extable_addr);
 
 DEFINE_PER_CPU_READ_MOSTLY(seg_desc_t *, gdt);
 DEFINE_PER_CPU_READ_MOSTLY(l1_pgentry_t, gdt_l1e);
@@ -786,7 +785,6 @@ static void do_trap(struct cpu_user_regs *regs)
     {
         dprintk(XENLOG_ERR, "Trap %u: %p [%ps] -> %p\n",
                 trapnr, _p(regs->rip), _p(regs->rip), _p(fixup));
-        this_cpu(last_extable_addr) = regs->rip;
         regs->rip = fixup;
         return;
     }
@@ -1099,7 +1097,6 @@ void do_invalid_op(struct cpu_user_regs *regs)
  die:
     if ( (fixup = search_exception_table(regs)) != 0 )
     {
-        this_cpu(last_extable_addr) = regs->rip;
         regs->rip = fixup;
         return;
     }
@@ -1122,7 +1119,6 @@ void do_int3(struct cpu_user_regs *regs)
 
         if ( (fixup = search_exception_table(regs)) != 0 )
         {
-            this_cpu(last_extable_addr) = regs->rip;
             dprintk(XENLOG_DEBUG, "Trap %u: %p [%ps] -> %p\n",
                     TRAP_int3, _p(regs->rip), _p(regs->rip), _p(fixup));
             regs->rip = fixup;
@@ -1461,7 +1457,6 @@ void do_page_fault(struct cpu_user_regs *regs)
             perfc_incr(copy_user_faults);
             if ( unlikely(regs->error_code & PFEC_reserved_bit) )
                 reserved_bit_page_fault(addr, regs);
-            this_cpu(last_extable_addr) = regs->rip;
             regs->rip = fixup;
             return;
         }
@@ -1591,7 +1586,6 @@ void do_general_protection(struct cpu_user_regs *regs)
     {
         dprintk(XENLOG_INFO, "GPF (%04x): %p [%ps] -> %p\n",
                 regs->error_code, _p(regs->rip), _p(regs->rip), _p(fixup));
-        this_cpu(last_extable_addr) = regs->rip;
         regs->rip = fixup;
         return;
     }
@@ -2085,10 +2079,7 @@ void asm_domain_crash_synchronous(unsigned long addr)
      */
     clac();
 
-    if ( addr == 0 )
-        addr = this_cpu(last_extable_addr);
-
-    printk("domain_crash_sync called from entry.S: fault at %p %pS\n",
+    printk("domain_crash_sync called from entry.S: issue around %p %pS\n",
            _p(addr), _p(addr));
 
     __domain_crash(current->domain);
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index d55453f3f3..a3ce298529 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -527,7 +527,7 @@ ENTRY(dom_crash_sync_extable)
         sete  %al
         leal  (%rax,%rax,2),%eax
         orb   %al,UREGS_cs(%rsp)
-        xorl  %edi,%edi
+        lea   dom_crash_sync_extable(%rip), %rdi
         jmp   asm_domain_crash_synchronous /* Does not return */
         .popsection
 #endif /* CONFIG_PV */
-- 
2.11.0


