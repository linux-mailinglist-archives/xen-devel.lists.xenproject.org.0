Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 031C57D7039
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 16:58:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623063.970537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvfLL-0001A1-Cq; Wed, 25 Oct 2023 14:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623063.970537; Wed, 25 Oct 2023 14:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvfLL-00018K-93; Wed, 25 Oct 2023 14:58:47 +0000
Received: by outflank-mailman (input) for mailman id 623063;
 Wed, 25 Oct 2023 14:58:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w7q9=GH=desiato.srs.infradead.org=BATV+fe87d11d956b9f6f1554+7367+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qvfEJ-0000WU-Ei
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 14:51:31 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f96a9349-7345-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 16:51:27 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qvfDZ-00GPLz-00; Wed, 25 Oct 2023 14:50:52 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qvfDY-002dEe-1i; Wed, 25 Oct 2023 15:50:44 +0100
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
X-Inumbo-ID: f96a9349-7345-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=3ol/nIDXbsJDFoVLEuQ1afcMOMk6Tbtz3hrJIXJZBzY=; b=NFNK6k1K2fwKP7Ocg+F7iiwScE
	G0hoCGS6u4vyAMHIPvezrI8DEw/b9DGG3KWI2GSeG63nYSvAU5oVobvdrxD+wwKz+9P6PaJC/SaQ5
	mYNdvDv+InJs82hkPJ+9clbUM9Ko2hDQb35OCg6149Mw9Ioar6ATzO6+CTanCbjudKYK+HHlwEkWv
	xfHpwHiIA9XDtWJ0deiMHNEUuu/CrzXdy1mN2k9BPitoNbt7OKPcvRhTo8Z0nj1vmvJKOa3nrKRfl
	r1CwhZVWJW77Cim7VL7UBUjXPm5P+XQVhgUAAWxEA3HOsImeW52PfGmuNr8sqrD9dtlAOcnf5zNjR
	S2yC23jw==;
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
Subject: [PATCH v3 11/28] i386/xen: advertise XEN_HVM_CPUID_UPCALL_VECTOR in CPUID
Date: Wed, 25 Oct 2023 15:50:25 +0100
Message-Id: <20231025145042.627381-12-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231025145042.627381-1-dwmw2@infradead.org>
References: <20231025145042.627381-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

This will allow Linux guests (since v6.0) to use the per-vCPU upcall
vector delivered as MSI through the local APIC.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/kvm/kvm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index e7c054cc16..8f93a0b5fc 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1889,6 +1889,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
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


