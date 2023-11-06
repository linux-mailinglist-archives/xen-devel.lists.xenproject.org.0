Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC3D7E1E89
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 11:40:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627876.978738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzx1g-00014P-G2; Mon, 06 Nov 2023 10:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627876.978738; Mon, 06 Nov 2023 10:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzx1g-00011C-Ay; Mon, 06 Nov 2023 10:40:12 +0000
Received: by outflank-mailman (input) for mailman id 627876;
 Mon, 06 Nov 2023 10:40:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OHvK=GT=casper.srs.infradead.org=BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qzx1e-00010s-CZ
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 10:40:10 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9d8e9b5-7c90-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 11:40:07 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qzx1P-005R1g-J6; Mon, 06 Nov 2023 10:39:56 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1qzx1P-000qFx-2a; Mon, 06 Nov 2023 10:39:55 +0000
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
X-Inumbo-ID: d9d8e9b5-7c90-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=wOMw/UywJs8oL1LQQcgtToi+dJjeH7aP4AFa7EtnSbM=; b=lUwHxNJ1U1La7N7HYHVdJ5UMsn
	L8ZcNKscZiT57bK7PQz2qfH1Pug1s7gtF1UB9Qji6aLEC9gfsjAsIdOJwPdRy/F/k3F+ce++T32+8
	eE8N+RrSBOuq4MsSShJMGOSb6Q3bcuJnlVvYQKyOrcA3rJs6NAUto8yac1SEV/F5Jt9e/NH8i0Nwq
	Bah8ewkbmFCtdlxyGBAdeceVBaU4xgbna65iOtV4uDZE61AVW3WnewCx3ytOYQhaM/pjG9CDl+Nue
	klanfVjqoByXh3jztUzwBeZGiNvXkPVtDz/JOFUWbgLTFQ49tyAiDj3KaV89rMjfyTMuFmzaIu19O
	nK5wZ4Zg==;
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
Subject: [PULL 1/7] i386/xen: Don't advertise XENFEAT_supervisor_mode_kernel
Date: Mon,  6 Nov 2023 10:39:49 +0000
Message-ID: <20231106103955.200867-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106103955.200867-1-dwmw2@infradead.org>
References: <20231106103955.200867-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

This confuses lscpu into thinking it's running in PVH mode.

Cc: qemu-stable@nongnu.org
Fixes: bedcc139248 ("i386/xen: implement HYPERVISOR_xen_version")
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/kvm/xen-emu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 76348f9d5d..0055441b2e 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -267,7 +267,6 @@ static bool kvm_xen_hcall_xen_version(struct kvm_xen_exit *exit, X86CPU *cpu,
             fi.submap |= 1 << XENFEAT_writable_page_tables |
                          1 << XENFEAT_writable_descriptor_tables |
                          1 << XENFEAT_auto_translated_physmap |
-                         1 << XENFEAT_supervisor_mode_kernel |
                          1 << XENFEAT_hvm_callback_vector |
                          1 << XENFEAT_hvm_safe_pvclock |
                          1 << XENFEAT_hvm_pirqs;
-- 
2.41.0


