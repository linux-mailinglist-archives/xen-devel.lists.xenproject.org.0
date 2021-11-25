Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0379545E31A
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 23:49:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232068.402045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqNYV-0003ej-OV; Thu, 25 Nov 2021 22:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232068.402045; Thu, 25 Nov 2021 22:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqNYV-0003bx-Ks; Thu, 25 Nov 2021 22:49:27 +0000
Received: by outflank-mailman (input) for mailman id 232068;
 Thu, 25 Nov 2021 22:49:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lxap=QM=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mqNYU-0003br-Jy
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 22:49:26 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f003693d-4e41-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 23:49:25 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id v15so15200492ljc.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Nov 2021 14:49:25 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k23sm346690ljg.139.2021.11.25.14.49.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Nov 2021 14:49:24 -0800 (PST)
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
X-Inumbo-ID: f003693d-4e41-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=DRwQoeKQvusF1+zaFNkxJ2iAFkCYgCicCDc3e9VJNs0=;
        b=k5/23U+b44OQCkPi4144jD5b+huhGQJJFl5g/LfFBhMEfFlmRWu8wONAf05VjBCjvp
         D4zIYpIWHr3VtGCI/qmUP04ooFfehzk1MeYI+venpdMESHUhp90pLSSgRZkAOkGpWCOn
         zXTBcYE3athAFPD8X4JIoE8p8h0TpAIKh16AJcq2SitUkw9x5gHDMn1WyXhDzmHgCZYy
         A7Q2kWaGaD5/RF8moMJbHkC95kPjKImYtqDzm+erteNijQ8s5oVs4ob3ufEV74oBAwFP
         gsojlzq1k3DnW2xy4FsYGqY8psg0H44XNcZWTDSV0Q3Jxao2lRYtauADz9bvM7jGZogw
         BggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=DRwQoeKQvusF1+zaFNkxJ2iAFkCYgCicCDc3e9VJNs0=;
        b=dINs1b1upJyyF7YguNaf9UeqOHDaR5CCj/idgQWH8XDj+/LW4/yIKfCs300j21S4IA
         Is47Fc4qp9Bb39Vkf426U4xAqOYIsncSDknKeLOA+G9WdJ4XEG36Q8SdmwapPijtKOfa
         Dt2a2Sch7UtaSD2Vl4kwsOPgHuJCG/mcY08TenAPSsoAL/VFPIp3cP06UfpOUM/AK4/6
         Ktmi+LK5rMYm9he1GogwoFKLs3R0c0lAtr5FaqNB0TXC8zsZVLDkAwiZeutjz0KZ1kGS
         XRO/NcAB20j07VooFiD2tpnmcfUKx7OZt5klr3gTTNB1ZQo6t0Qfl3oeS/fuNpdTu+Br
         ySpA==
X-Gm-Message-State: AOAM531qcp/GWQh9Y6micmbN8AsXOT1viAjXnii2j5Qbf8SHceKRoW+p
	l63U24B+01aXEKfK0EkvOlNC9Fnp5Rc=
X-Google-Smtp-Source: ABdhPJyRefkfTaOJpVP1KreqEnjFtyF9mvyC/N7lbTGM/XE25mA3aKQ3vKkxOUu4l3XAV/qBVPUJbQ==
X-Received: by 2002:a05:651c:612:: with SMTP id k18mr27768572lje.383.1637880564922;
        Thu, 25 Nov 2021 14:49:24 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [RFC?] xen/arm: memaccess: Pass struct npfec by reference in p2m_mem_access_check
Date: Fri, 26 Nov 2021 00:49:19 +0200
Message-Id: <1637880559-28821-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Today I noticed a "note" when building Xen on Arm64 with
aarch64-poky-linux-gcc (GCC) 9.3.0. It turned out that Andrew Cooper
had alredy reported it before [1]:

mem_access.c: In function 'p2m_mem_access_check':
mem_access.c:227:6: note: parameter passing for argument of type
'const struct npfec' changed in GCC 9.1
  227 | bool p2m_mem_access_check(paddr_t gpa, vaddr_t gla,
                                  const struct npfec npfec)

From the explanation I understand that nothing bad actually is going
to happen in our case, it is harmless and shown to only draw our
attention that the ABI changed due to bug (with passing bit-fields
by value) fixed in GCC 9.1. This information doesn't mean much for us
as Xen is an embedded project with no external linkage. But, of course,
it would be better to eliminate the note. You can also find related
information about the bug at [2].

So make the note go away by passing bit-fields by reference.

[1] https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg87439.html
[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=88469

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Compile-tested only.
---
 xen/arch/arm/mem_access.c        | 28 ++++++++++++++--------------
 xen/arch/arm/traps.c             |  2 +-
 xen/include/asm-arm/mem_access.h |  2 +-
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/xen/arch/arm/mem_access.c b/xen/arch/arm/mem_access.c
index 3e36202..d21bba7 100644
--- a/xen/arch/arm/mem_access.c
+++ b/xen/arch/arm/mem_access.c
@@ -224,7 +224,7 @@ err:
     return page;
 }
 
-bool p2m_mem_access_check(paddr_t gpa, vaddr_t gla, const struct npfec npfec)
+bool p2m_mem_access_check(paddr_t gpa, vaddr_t gla, const struct npfec *npfec)
 {
     int rc;
     bool violation;
@@ -248,23 +248,23 @@ bool p2m_mem_access_check(paddr_t gpa, vaddr_t gla, const struct npfec npfec)
         violation = false;
         break;
     case XENMEM_access_rw:
-        violation = npfec.insn_fetch;
+        violation = npfec->insn_fetch;
         break;
     case XENMEM_access_wx:
-        violation = npfec.read_access;
+        violation = npfec->read_access;
         break;
     case XENMEM_access_rx:
     case XENMEM_access_rx2rw:
-        violation = npfec.write_access;
+        violation = npfec->write_access;
         break;
     case XENMEM_access_x:
-        violation = npfec.read_access || npfec.write_access;
+        violation = npfec->read_access || npfec->write_access;
         break;
     case XENMEM_access_w:
-        violation = npfec.read_access || npfec.insn_fetch;
+        violation = npfec->read_access || npfec->insn_fetch;
         break;
     case XENMEM_access_r:
-        violation = npfec.write_access || npfec.insn_fetch;
+        violation = npfec->write_access || npfec->insn_fetch;
         break;
     default:
     case XENMEM_access_n:
@@ -277,7 +277,7 @@ bool p2m_mem_access_check(paddr_t gpa, vaddr_t gla, const struct npfec npfec)
         return true;
 
     /* First, handle rx2rw and n2rwx conversion automatically. */
-    if ( npfec.write_access && xma == XENMEM_access_rx2rw )
+    if ( npfec->write_access && xma == XENMEM_access_rx2rw )
     {
         rc = p2m_set_mem_access(v->domain, gaddr_to_gfn(gpa), 1,
                                 0, ~0, XENMEM_access_rw, 0);
@@ -324,19 +324,19 @@ bool p2m_mem_access_check(paddr_t gpa, vaddr_t gla, const struct npfec npfec)
         /* Send request to mem access subscriber */
         req->u.mem_access.gfn = gpa >> PAGE_SHIFT;
         req->u.mem_access.offset =  gpa & ((1 << PAGE_SHIFT) - 1);
-        if ( npfec.gla_valid )
+        if ( npfec->gla_valid )
         {
             req->u.mem_access.flags |= MEM_ACCESS_GLA_VALID;
             req->u.mem_access.gla = gla;
 
-            if ( npfec.kind == npfec_kind_with_gla )
+            if ( npfec->kind == npfec_kind_with_gla )
                 req->u.mem_access.flags |= MEM_ACCESS_FAULT_WITH_GLA;
-            else if ( npfec.kind == npfec_kind_in_gpt )
+            else if ( npfec->kind == npfec_kind_in_gpt )
                 req->u.mem_access.flags |= MEM_ACCESS_FAULT_IN_GPT;
         }
-        req->u.mem_access.flags |= npfec.read_access    ? MEM_ACCESS_R : 0;
-        req->u.mem_access.flags |= npfec.write_access   ? MEM_ACCESS_W : 0;
-        req->u.mem_access.flags |= npfec.insn_fetch     ? MEM_ACCESS_X : 0;
+        req->u.mem_access.flags |= npfec->read_access    ? MEM_ACCESS_R : 0;
+        req->u.mem_access.flags |= npfec->write_access   ? MEM_ACCESS_W : 0;
+        req->u.mem_access.flags |= npfec->insn_fetch     ? MEM_ACCESS_X : 0;
 
         if ( monitor_traps(v, (xma != XENMEM_access_n2rwx), req) < 0 )
             domain_crash(v->domain);
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 219ab3c..4ad1618 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1957,7 +1957,7 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
             .kind = xabt.s1ptw ? npfec_kind_in_gpt : npfec_kind_with_gla
         };
 
-        p2m_mem_access_check(gpa, gva, npfec);
+        p2m_mem_access_check(gpa, gva, &npfec);
         /*
          * The only way to get here right now is because of mem_access,
          * thus reinjecting the exception to the guest is never required.
diff --git a/xen/include/asm-arm/mem_access.h b/xen/include/asm-arm/mem_access.h
index 35ed0ad..be43e18 100644
--- a/xen/include/asm-arm/mem_access.h
+++ b/xen/include/asm-arm/mem_access.h
@@ -35,7 +35,7 @@ static inline bool p2m_mem_access_sanity_check(struct domain *d)
  * Send mem event based on the access. Boolean return value indicates if trap
  * needs to be injected into guest.
  */
-bool p2m_mem_access_check(paddr_t gpa, vaddr_t gla, const struct npfec npfec);
+bool p2m_mem_access_check(paddr_t gpa, vaddr_t gla, const struct npfec *npfec);
 
 struct page_info*
 p2m_mem_access_check_and_get_page(vaddr_t gva, unsigned long flag,
-- 
2.7.4


