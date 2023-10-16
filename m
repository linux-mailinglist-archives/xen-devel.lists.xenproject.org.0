Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8B27CAD3D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 17:20:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617753.960725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPNc-0002iq-1H; Mon, 16 Oct 2023 15:19:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617753.960725; Mon, 16 Oct 2023 15:19:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPNb-0002WO-KB; Mon, 16 Oct 2023 15:19:39 +0000
Received: by outflank-mailman (input) for mailman id 617753;
 Mon, 16 Oct 2023 15:19:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XUCO=F6=desiato.srs.infradead.org=BATV+1bdf71eab2d76d13073e+7358+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qsPNZ-0001wi-SH
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 15:19:37 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a2920c6-6c37-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 17:19:36 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qsPNB-0067AG-2H; Mon, 16 Oct 2023 15:19:15 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qsPNB-0005nB-2D; Mon, 16 Oct 2023 16:19:13 +0100
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
X-Inumbo-ID: 6a2920c6-6c37-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=sLSQjDyHM6H6vyCwrNd1oC0DrClv2UPw9aKIA6AhbP0=; b=FqeMYA/JfTC8p0DG5XK/5ZIu7B
	EUetaVF1ix6DTUyqYJPmR6BEKr8LA+088i3w5FooNB+tJ2CGq5fIwEk6CHqTMqRWi4A4JkeZDj4PO
	FFVaxZlOnTksjcWikg7PxddJcMky3TKcRovSYEeLHXsu9U/2HJZfBr2d77FPfZMF9Lw1bhqNl7arM
	I7LF7ZN8+aIXN0kV7FUmX70qmrghYiYcTbPPqJb6BE4mD4zOv1LHUL/J+w/UCAeu+v78F92hv3ea5
	KYP7zA2OShwtZ30hVrz5y3VZ46/VNhecSXsjdugWtI+wFOhgX2X++SXZeSAtEBesjmULCUOv8BaMW
	+MTswpPQ==;
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
	David Woodhouse <dwmw2@infradead.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org
Subject: [PATCH 02/12] hw/xen: select kernel mode for per-vCPU event channel upcall vector
Date: Mon, 16 Oct 2023 16:18:59 +0100
Message-Id: <20231016151909.22133-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231016151909.22133-1-dwmw2@infradead.org>
References: <20231016151909.22133-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

A guest which has configured the per-vCPU upcall vector may set the
HVM_PARAM_CALLBACK_IRQ param to fairly much anything other than zero.

For example, Linux v6.0+ after commit b1c3497e604 ("x86/xen: Add support
for HVMOP_set_evtchn_upcall_vector") will just do this after setting the
vector:

       /* Trick toolstack to think we are enlightened. */
       if (!cpu)
               rc = xen_set_callback_via(1);

That's explicitly setting the delivery to GSI#, but it's supposed to be
overridden by the per-vCPU vector setting. This mostly works in QEMU
*except* for the logic to enable the in-kernel handling of event channels,
which falsely determines that the kernel cannot accelerate GSI delivery
in this case.

Add a kvm_xen_has_vcpu_callback_vector() to report whether vCPU#0 has
the vector set, and use that in xen_evtchn_set_callback_param() to
enable the kernel acceleration features even when the param *appears*
to be set to target a GSI.

Preserve the Xen behaviour that when HVM_PARAM_CALLBACK_IRQ is set to
*zero* the event channel delivery is disabled completely. (Which is
what that bizarre guest behaviour is working round in the first place.)

Fixes: 91cce756179 ("hw/xen: Add xen_evtchn device for event channel emulation")
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_evtchn.c  | 6 ++++++
 include/sysemu/kvm_xen.h  | 1 +
 target/i386/kvm/xen-emu.c | 7 +++++++
 3 files changed, 14 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 4df973022c..d72dca6591 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -490,6 +490,12 @@ int xen_evtchn_set_callback_param(uint64_t param)
         break;
     }
 
+    /* If the guest has set a per-vCPU callback vector, prefer that. */
+    if (gsi && kvm_xen_has_vcpu_callback_vector()) {
+        in_kernel = kvm_xen_has_cap(EVTCHN_SEND);
+        gsi = 0;
+    }
+
     if (!ret) {
         /* If vector delivery was turned *off* then tell the kernel */
         if ((s->callback_param >> CALLBACK_VIA_TYPE_SHIFT) ==
diff --git a/include/sysemu/kvm_xen.h b/include/sysemu/kvm_xen.h
index 595abfbe40..961c702c4e 100644
--- a/include/sysemu/kvm_xen.h
+++ b/include/sysemu/kvm_xen.h
@@ -22,6 +22,7 @@
 int kvm_xen_soft_reset(void);
 uint32_t kvm_xen_get_caps(void);
 void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id);
+bool kvm_xen_has_vcpu_callback_vector(void);
 void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id, int type);
 void kvm_xen_set_callback_asserted(void);
 int kvm_xen_set_vcpu_virq(uint32_t vcpu_id, uint16_t virq, uint16_t port);
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index b49a840438..477e93cd92 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -424,6 +424,13 @@ void kvm_xen_set_callback_asserted(void)
     }
 }
 
+bool kvm_xen_has_vcpu_callback_vector(void)
+{
+    CPUState *cs = qemu_get_cpu(0);
+
+    return cs && !!X86_CPU(cs)->env.xen_vcpu_callback_vector;
+}
+
 void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id, int type)
 {
     CPUState *cs = qemu_get_cpu(vcpu_id);
-- 
2.40.1


