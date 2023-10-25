Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EFF7D6FEB
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 16:54:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622995.970417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvfGd-00010v-LP; Wed, 25 Oct 2023 14:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622995.970417; Wed, 25 Oct 2023 14:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvfGd-0000y6-H4; Wed, 25 Oct 2023 14:53:55 +0000
Received: by outflank-mailman (input) for mailman id 622995;
 Wed, 25 Oct 2023 14:53:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w7q9=GH=desiato.srs.infradead.org=BATV+fe87d11d956b9f6f1554+7367+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qvfEI-0000WU-Ec
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 14:51:30 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f877121b-7345-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 16:51:25 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qvfDZ-00GPLu-00; Wed, 25 Oct 2023 14:51:04 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qvfDX-002dE3-2b; Wed, 25 Oct 2023 15:50:43 +0100
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
X-Inumbo-ID: f877121b-7345-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=c1KnGQGfi3x53zdFBlcTqfnMwSbqzHUr3v6mm/A0vwE=; b=MTOqGgH08Ha9n5op96rLk0cUN1
	wrSDL9Zs8TWudFgFJacVmoXeWHuZuMM25p9iLuSAJRwni4Pp8vZVd2wVwJG/jYJ5YXI+hMPkbPV23
	btkqGYMy6rjvy8XJJq2oIK6of/Lli+tTc9jNmWYGDBGuMYkFGWN71sFXw9nPnDhlGT6EoEFjh3jbX
	fl3uNsNgDdRUXagpX6nvaN6UtMjLhKSuVWo/ScfKujBJlhWsB3MGDFgDNuL5vNukoz5A8blcT8EyH
	6fweryHNiDOKzm24bkI5E9w/ZJAWQ4sPR3DB95dMIlz1DwCOUJDMp1Z7GV/zznFcI5Nu4ztjVEpwQ
	WphupaaQ==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Jason Wang <jasowang@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Bernhard Beschow <shentey@gmail.com>,
	Joel Upham <jupham125@gmail.com>
Subject: [PATCH v3 02/28] i386/xen: fix per-vCPU upcall vector for Xen emulation
Date: Wed, 25 Oct 2023 15:50:16 +0100
Message-Id: <20231025145042.627381-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231025145042.627381-1-dwmw2@infradead.org>
References: <20231025145042.627381-1-dwmw2@infradead.org>
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
2.40.1


