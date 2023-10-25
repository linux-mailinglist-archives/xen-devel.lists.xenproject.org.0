Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 743017D703B
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 16:59:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623071.970557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvfLi-0002EK-So; Wed, 25 Oct 2023 14:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623071.970557; Wed, 25 Oct 2023 14:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvfLi-0002Bg-PC; Wed, 25 Oct 2023 14:59:10 +0000
Received: by outflank-mailman (input) for mailman id 623071;
 Wed, 25 Oct 2023 14:59:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w7q9=GH=desiato.srs.infradead.org=BATV+fe87d11d956b9f6f1554+7367+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qvfEC-0000WU-Dv
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 14:51:24 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f52622c6-7345-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 16:51:20 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qvfDZ-00GPLv-00; Wed, 25 Oct 2023 14:51:03 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qvfDX-002dE7-2w; Wed, 25 Oct 2023 15:50:43 +0100
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
X-Inumbo-ID: f52622c6-7345-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=gpval2gkdnYSDfubhYXUo8Wmpo6ErNXXryv5FV8GJTI=; b=rSWy9LoA4wJ29Sdd8/z2hODjqk
	sU4jyfn/ca7c900gi56KR/yIHtgCkDipOf7DVpsfAhVoJhNpxot9LipzStyKPCVyqwKMKTxysIaEv
	0YuAXNyE5AgxkxRSeJYKqBpfppT7/6ao2CisXyqhqzmDL2K6l4kQ5tHHleiN4DqL55cnqp7z5l9xR
	4Z5wjBvcBtTYCR6i7K1gjbo4ajmj2LEStD5lXp3kLeHBxTzriCK9AQHne857Of2+1MRrkusbVQc15
	lq7LnDg8Bb95Xbt+0qbQHD7Wbc+gBgQCeF9EzMWlLPQhPDYWQbDEOxDlcNayuAnjgD06/VptlWhXZ
	2U2EZvtA==;
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
Subject: [PATCH v3 03/28] hw/xen: select kernel mode for per-vCPU event channel upcall vector
Date: Wed, 25 Oct 2023 15:50:17 +0100
Message-Id: <20231025145042.627381-4-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231025145042.627381-1-dwmw2@infradead.org>
References: <20231025145042.627381-1-dwmw2@infradead.org>
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

That's explicitly setting the delivery to GSI#1, but it's supposed to be
overridden by the per-vCPU vector setting. This mostly works in Qemu
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
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_evtchn.c  | 6 ++++++
 include/sysemu/kvm_xen.h  | 1 +
 target/i386/kvm/xen-emu.c | 7 +++++++
 3 files changed, 14 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index a731738411..3d6f4b4a0a 100644
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
index 7c504d9fa4..75b2c557b9 100644
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


