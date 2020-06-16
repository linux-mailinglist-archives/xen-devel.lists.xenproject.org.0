Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B891FB614
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 17:25:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlDSF-0001K8-EQ; Tue, 16 Jun 2020 15:24:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xJom=75=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jlDSE-0001K0-1N
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 15:24:50 +0000
X-Inumbo-ID: 842c0636-afe5-11ea-b7bb-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 842c0636-afe5-11ea-b7bb-bc764e2007e4;
 Tue, 16 Jun 2020 15:24:49 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 8CF4AA2DE1;
 Tue, 16 Jun 2020 17:24:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 831C7A26F4;
 Tue, 16 Jun 2020 17:24:47 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id NOX4nYjrIjRB; Tue, 16 Jun 2020 17:24:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 19F97A2DE1;
 Tue, 16 Jun 2020 17:24:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id VBXLA65P1sUY; Tue, 16 Jun 2020 17:24:46 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id E4797A26F4;
 Tue, 16 Jun 2020 17:24:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id D4F2C214C8;
 Tue, 16 Jun 2020 17:24:16 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id BU1h424fcYsI; Tue, 16 Jun 2020 17:24:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 75AC0215F4;
 Tue, 16 Jun 2020 17:24:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id HFXNXOMpVXKA; Tue, 16 Jun 2020 17:24:11 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 594CB214C8;
 Tue, 16 Jun 2020 17:24:11 +0200 (CEST)
Date: Tue, 16 Jun 2020 17:24:11 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <317430261.8766476.1592321051337.JavaMail.zimbra@cert.pl>
In-Reply-To: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
Subject: [PATCH v1 7/7] x86/vmx: switch IPT MSRs on vmentry/vmexit
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: switch IPT MSRs on vmentry/vmexit
Thread-Index: KAn5ItxMsuAqHW3ZzkheyNf1oni9hiacNb1l
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Enable IPT when entering the VM and disable it on vmexit.
Register state is persisted using vCPU ipt_state structure.

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 xen/arch/x86/hvm/vmx/vmx.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 97104c319e..01d9a7b584 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3698,6 +3698,15 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
     __vmread(GUEST_RSP,    &regs->rsp);
     __vmread(GUEST_RFLAGS, &regs->rflags);
 
+    if ( unlikely(v->arch.hvm.vmx.ipt_state) )
+    {
+        wrmsrl(MSR_IA32_RTIT_CTL, 0);
+        smp_rmb();
+
+        rdmsrl(MSR_IA32_RTIT_STATUS, v->arch.hvm.vmx.ipt_state->status);
+        rdmsrl(MSR_IA32_RTIT_OUTPUT_MASK, v->arch.hvm.vmx.ipt_state->output_mask);
+    }
+
     hvm_invalidate_regs_fields(regs);
 
     if ( paging_mode_hap(v->domain) )
@@ -4497,6 +4506,23 @@ bool vmx_vmenter_helper(const struct cpu_user_regs *regs)
     }
 
  out:
+    if ( unlikely(curr->arch.hvm.vmx.ipt_state) )
+    {
+        wrmsrl(MSR_IA32_RTIT_CTL, 0);
+
+        if (curr->arch.hvm.vmx.ipt_state->ctl)
+        {
+            wrmsrl(MSR_IA32_RTIT_OUTPUT_BASE, curr->arch.hvm.vmx.ipt_state->output_base);
+            wrmsrl(MSR_IA32_RTIT_OUTPUT_MASK, curr->arch.hvm.vmx.ipt_state->output_mask);
+            wrmsrl(MSR_IA32_RTIT_STATUS, curr->arch.hvm.vmx.ipt_state->status);
+
+            // MSR_IA32_RTIT_CTL is context-switched manually instead of being
+            // stored inside VMCS, as of Q2'20 only the most recent processors
+            // support such field in VMCS
+            wrmsrl(MSR_IA32_RTIT_CTL, curr->arch.hvm.vmx.ipt_state->ctl);
+        }
+    }
+
     if ( unlikely(curr->arch.hvm.vmx.lbr_flags & LBR_FIXUP_MASK) )
         lbr_fixup();
 
-- 
2.20.1


