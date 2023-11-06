Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD0D7E1E8B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 11:40:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627880.978764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzx1h-0001ZT-Ub; Mon, 06 Nov 2023 10:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627880.978764; Mon, 06 Nov 2023 10:40:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzx1h-0001MC-MT; Mon, 06 Nov 2023 10:40:13 +0000
Received: by outflank-mailman (input) for mailman id 627880;
 Mon, 06 Nov 2023 10:40:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwd5=GT=desiato.srs.infradead.org=BATV+aa7b7dce24b49c47a83c+7379+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qzx1f-00010q-LY
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 10:40:12 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dace42e9-7c90-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 11:40:09 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qzx1R-00ARzu-0T; Mon, 06 Nov 2023 10:39:57 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1qzx1P-000qG1-2r; Mon, 06 Nov 2023 10:39:55 +0000
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
X-Inumbo-ID: dace42e9-7c90-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=bUIwWhSmxxhL6AS/9ZXbE9mq6OB7mrxWvKvI7fmMtUk=; b=PKghrx40QFAYvqzmoIilm9wA2v
	pxZ4oYhwBBymCgCvc2Usep0OkshnQ9Rwj2ML4rAPFff0nwvxNOOgCpLIhKFfZopoZz6V8n3pnLQ5d
	CMv725X/ZTTpYldzx15AzhXXWx2ND9Dt4ek5Uy9Vt1nPHDw6LewWuAuFU+bLiEYuYfK8bfOxlxsN2
	SFAeRgy0QbzGk+nFD7rctc7gjWEhxy/Z7fYhfXO/rBWJ/ZlNLlGf4sCrEboyJupti1CBCOlqROAdf
	M3mlUGHG2Yl8MCbvml+3PT7xKfd/AMvTSKDHLPPs2e8R537YDpdqMY5HwnN8efhApCB97O/WgTONw
	tmskLnaA==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org,
	qemu-stable@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	kvm@vger.kernel.org
Subject: [PULL 2/7] i386/xen: fix per-vCPU upcall vector for Xen emulation
Date: Mon,  6 Nov 2023 10:39:50 +0000
Message-ID: <20231106103955.200867-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106103955.200867-1-dwmw2@infradead.org>
References: <20231106103955.200867-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

The per-vCPU upcall vector support had three problems. Firstly it was
using the wrong hypercall argument and would always return -EFAULT when
the guest tried to set it up. Secondly it was using the wrong ioctl() to
pass the vector to the kernel and thus the *kernel* would always return
-EINVAL. Finally, even when delivering the event directly from userspace
with an MSI, it put the destination CPU ID into the wrong bits of the
MSI address.

Linux doesn't (yet) use this mode so it went without decent testing
for a while.

Cc: qemu-stable@nongnu.org
Fixes: 105b47fdf2d0 ("i386/xen: implement HVMOP_set_evtchn_upcall_vector")
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/kvm/xen-emu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 0055441b2e..7c504d9fa4 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -306,7 +306,7 @@ static int kvm_xen_set_vcpu_callback_vector(CPUState *cs)
 
     trace_kvm_xen_set_vcpu_callback(cs->cpu_index, vector);
 
-    return kvm_vcpu_ioctl(cs, KVM_XEN_HVM_SET_ATTR, &xva);
+    return kvm_vcpu_ioctl(cs, KVM_XEN_VCPU_SET_ATTR, &xva);
 }
 
 static void do_set_vcpu_callback_vector(CPUState *cs, run_on_cpu_data data)
@@ -440,7 +440,8 @@ void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id, int type)
          * deliver it as an MSI.
          */
         MSIMessage msg = {
-            .address = APIC_DEFAULT_ADDRESS | X86_CPU(cs)->apic_id,
+            .address = APIC_DEFAULT_ADDRESS |
+                       (X86_CPU(cs)->apic_id << MSI_ADDR_DEST_ID_SHIFT),
             .data = vector | (1UL << MSI_DATA_LEVEL_SHIFT),
         };
         kvm_irqchip_send_msi(kvm_state, msg);
@@ -849,8 +850,7 @@ static bool kvm_xen_hcall_hvm_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     int ret = -ENOSYS;
     switch (cmd) {
     case HVMOP_set_evtchn_upcall_vector:
-        ret = kvm_xen_hcall_evtchn_upcall_vector(exit, cpu,
-                                                 exit->u.hcall.params[0]);
+        ret = kvm_xen_hcall_evtchn_upcall_vector(exit, cpu, arg);
         break;
 
     case HVMOP_pagetable_dying:
-- 
2.41.0


