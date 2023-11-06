Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEC57E26F3
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 15:35:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628049.979089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r00hQ-0000Xp-NC; Mon, 06 Nov 2023 14:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628049.979089; Mon, 06 Nov 2023 14:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r00hQ-0000VP-Go; Mon, 06 Nov 2023 14:35:32 +0000
Received: by outflank-mailman (input) for mailman id 628049;
 Mon, 06 Nov 2023 14:35:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wwoJ=GT=infradead.org=prvs=667a8cc2a=dwmw2@srs-se1.protection.inumbo.net>)
 id 1r00hP-0008Lv-9H
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 14:35:31 +0000
Received: from smtp-fw-80008.amazon.com (smtp-fw-80008.amazon.com
 [99.78.197.219]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc066d1a-7cb1-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 15:35:30 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2c-m6i4x-fa5fe5fb.us-west-2.amazon.com)
 ([10.25.36.214]) by smtp-border-fw-80008.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 14:35:29 +0000
Received: from smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev
 (pdx2-ws-svc-p26-lb5-vlan3.pdx.amazon.com [10.39.38.70])
 by email-inbound-relay-pdx-2c-m6i4x-fa5fe5fb.us-west-2.amazon.com (Postfix)
 with ESMTPS id 853C440D97; Mon,  6 Nov 2023 14:35:27 +0000 (UTC)
Received: from EX19MTAUWC001.ant.amazon.com [10.0.38.20:38824]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.34.186:2525]
 with esmtp (Farcaster)
 id a38c1c50-3e5f-41f4-90b2-de170ca49c03; Mon, 6 Nov 2023 14:35:26 +0000 (UTC)
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 6 Nov 2023 14:35:26 +0000
Received: from u3832b3a9db3152.ant.amazon.com (10.106.83.6) by
 mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP Server id
 15.2.1118.39 via Frontend Transport; Mon, 6 Nov 2023 14:35:23 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: bc066d1a-7cb1-11ee-98da-6d05b1d4d9a1
X-IronPort-AV: E=Sophos;i="6.03,281,1694736000"; 
   d="scan'208";a="41362385"
X-Farcaster-Flow-ID: a38c1c50-3e5f-41f4-90b2-de170ca49c03
From: David Woodhouse <dwmw2@infradead.org>
To: <qemu-devel@nongnu.org>
CC: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul
 Durrant <paul@xen.org>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=
	<marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
	<eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Jason Wang <jasowang@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, <qemu-block@nongnu.org>,
	<xen-devel@lists.xenproject.org>, <kvm@vger.kernel.org>
Subject: [PATCH v4 04/17] i386/xen: advertise XEN_HVM_CPUID_UPCALL_VECTOR in CPUID
Date: Mon, 6 Nov 2023 14:34:54 +0000
Message-ID: <20231106143507.1060610-5-dwmw2@infradead.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106143507.1060610-1-dwmw2@infradead.org>
References: <20231106143507.1060610-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

From: David Woodhouse <dwmw@amazon.co.uk>

This will allow Linux guests (since v6.0) to use the per-vCPU upcall
vector delivered as MSI through the local APIC.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/kvm/kvm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 770e81d56e..11b8177eff 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1837,6 +1837,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
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
2.34.1


