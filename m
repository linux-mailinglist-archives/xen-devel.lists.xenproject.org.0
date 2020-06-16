Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 746081FB5FD
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 17:22:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlDPW-0000vc-4D; Tue, 16 Jun 2020 15:22:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xJom=75=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jlDPU-0000vQ-9X
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 15:22:00 +0000
X-Inumbo-ID: 1e18a612-afe5-11ea-b8fa-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e18a612-afe5-11ea-b8fa-12813bfff9fa;
 Tue, 16 Jun 2020 15:21:59 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 18686A2F7F;
 Tue, 16 Jun 2020 17:21:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 0C8D0A2F1B;
 Tue, 16 Jun 2020 17:21:57 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id UBh7yD0Q_2US; Tue, 16 Jun 2020 17:21:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id A2C70A2F7F;
 Tue, 16 Jun 2020 17:21:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id y0ro_Gds4p5k; Tue, 16 Jun 2020 17:21:56 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 844D7A2F1B;
 Tue, 16 Jun 2020 17:21:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 756FD21CD9;
 Tue, 16 Jun 2020 17:21:26 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 1eyUKdjSSdwE; Tue, 16 Jun 2020 17:21:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 1F635215F4;
 Tue, 16 Jun 2020 17:21:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id eWkXsYekw6L8; Tue, 16 Jun 2020 17:21:21 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 0277F214C8;
 Tue, 16 Jun 2020 17:21:21 +0200 (CEST)
Date: Tue, 16 Jun 2020 17:21:20 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <350253733.8765869.1592320880975.JavaMail.zimbra@cert.pl>
In-Reply-To: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
Subject: [PATCH v1 3/7] x86/vmx: add ipt_state as part of vCPU state
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: add ipt_state as part of vCPU state
Thread-Index: KAn5ItxMsuAqHW3ZzkheyNf1oni9htw5L6rA
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

Guest IPT state will be preserved across vmentry/vmexit using
this structure.

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 xen/arch/x86/hvm/vmx/vmx.c         |  2 ++
 xen/include/asm-x86/hvm/vmx/vmcs.h | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index a91bbdb798..97104c319e 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -471,6 +471,8 @@ static int vmx_vcpu_initialise(struct vcpu *v)
 
     vmx_install_vlapic_mapping(v);
 
+    v->arch.hvm.vmx.ipt_state = NULL;
+
     return 0;
 }
 
diff --git a/xen/include/asm-x86/hvm/vmx/vmcs.h b/xen/include/asm-x86/hvm/vmx/vmcs.h
index 4c81093aba..273ade975e 100644
--- a/xen/include/asm-x86/hvm/vmx/vmcs.h
+++ b/xen/include/asm-x86/hvm/vmx/vmcs.h
@@ -104,6 +104,13 @@ struct pi_blocking_vcpu {
     spinlock_t           *lock;
 };
 
+struct ipt_state {
+    uint64_t ctl;
+    uint64_t status;
+    uint64_t output_base;
+    uint64_t output_mask;
+};
+
 struct vmx_vcpu {
     /* Physical address of VMCS. */
     paddr_t              vmcs_pa;
@@ -186,6 +193,9 @@ struct vmx_vcpu {
      * pCPU and wakeup the related vCPU.
      */
     struct pi_blocking_vcpu pi_blocking;
+
+    /* State of Intel Processor Trace feature */
+    struct ipt_state     *ipt_state;
 };
 
 int vmx_create_vmcs(struct vcpu *v);
-- 
2.20.1


