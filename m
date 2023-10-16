Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFB37CAD42
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 17:20:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617755.960752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPNe-0003cB-6w; Mon, 16 Oct 2023 15:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617755.960752; Mon, 16 Oct 2023 15:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPNe-0003L9-0V; Mon, 16 Oct 2023 15:19:42 +0000
Received: by outflank-mailman (input) for mailman id 617755;
 Mon, 16 Oct 2023 15:19:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XUCO=F6=desiato.srs.infradead.org=BATV+1bdf71eab2d76d13073e+7358+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qsPNb-0001wj-3Y
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 15:19:39 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a187ae1-6c37-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 17:19:35 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qsPNB-0067AH-2I; Mon, 16 Oct 2023 15:19:15 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qsPNB-0005nK-2S; Mon, 16 Oct 2023 16:19:13 +0100
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
X-Inumbo-ID: 6a187ae1-6c37-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=iXDULQVzCobMyEZ4WUylbwZd7CUi+M/tuPLUTKt/3jw=; b=l1d5jbcw6JNVUwXd23LtcOWIrz
	awoQAWR2TcM4l7zFuNYfHDL5IW5doK4mER0sDrz9GFfi7g/6TGn1GKF7Nh4SXaBj7lExkZqV/6OBu
	BFw1UTrhAyKXsOt9PwCTU2pMxqKJdP2htFgualbxn+lvN/uSw/zpRypzgvobUd3b+niKIDlRnOUN0
	y25iFrORunLd1zKmTJ4gAmMrkYqYU3tM4LCEhYMpEqbeBcCd11W2GY5HtBdadVn3PG+6tuK2XfGfg
	nLsgelc99k1Us9mOk0LZPdAD9438EocKtKfbD+cMKYAq2PLkAUu3jedsBUI2LXJKDiK3BJ8DZHlBK
	82Uotnsw==;
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
Subject: [PATCH 04/12] i386/xen: advertise XEN_HVM_CPUID_UPCALL_VECTOR in CPUID
Date: Mon, 16 Oct 2023 16:19:01 +0100
Message-Id: <20231016151909.22133-5-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231016151909.22133-1-dwmw2@infradead.org>
References: <20231016151909.22133-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

This will allow Linux guests (since v6.0) to use the per-vCPU upcall
vector delivered as MSI through the local APIC.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 target/i386/kvm/kvm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index f6c7f7e268..8bdbdcdffe 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1887,6 +1887,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
                 c->eax |= XEN_HVM_CPUID_VCPU_ID_PRESENT;
                 c->ebx = cs->cpu_index;
             }
+
+            if (cs->kvm_state->xen_version >= XEN_VERSION(4, 17)) {
+                c->eax |= XEN_HVM_CPUID_UPCALL_VECTOR;
+            }
         }
 
         r = kvm_xen_init_vcpu(cs);
-- 
2.40.1


