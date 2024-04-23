Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A318AE077
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 11:01:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710467.1109710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzC19-0007cy-63; Tue, 23 Apr 2024 09:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710467.1109710; Tue, 23 Apr 2024 09:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzC19-0007b8-3N; Tue, 23 Apr 2024 09:00:47 +0000
Received: by outflank-mailman (input) for mailman id 710467;
 Tue, 23 Apr 2024 09:00:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKuO=L4=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1rzC16-0007b0-Ub
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 09:00:44 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f628cbc8-014f-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 11:00:42 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 445F11F087C;
 Tue, 23 Apr 2024 05:00:41 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 3B5F91F087B;
 Tue, 23 Apr 2024 05:00:41 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 3B7741F087A;
 Tue, 23 Apr 2024 05:00:40 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
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
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: f628cbc8-014f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=9+9XMXvzGyolHzNNE3bL+S4CK
	XGZAy5Za91IKnXnLa8=; b=ydVPJ0EmcaP/WyWi01IUt/358xO8U1M33CZGr1egP
	eMYUcoMJB00N6Rje8h2AbIZkkj+SisqEpXGO85qV1k/Qa9rXAIoy0zBksMy5Np7h
	SUrEBiNWM6WfIf+qiQmwqOMF/L5H9eiVcQQQCYa9tZd5ZdQUbCfD9bPQ8iqs0dCs
	5w=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 7/7] x86/MCE: optional build of AMD/Intel MCE code
Date: Tue, 23 Apr 2024 12:00:37 +0300
Message-Id: <82df6ef350a2b4f42ec7adf12a90ebeae1d133f6.1713860310.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1713860310.git.Sergiy_Kibrik@epam.com>
References: <cover.1713860310.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 F5617A42-014F-11EF-8DD6-25B3960A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

Separate Intel/AMD-specific MCE code using CONFIG_{INTEL,AMD} config opti=
ons.
Now we can avoid build of mcheck code if support for specific platform is
intentionally disabled by configuration.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/cpu/mcheck/Makefile    | 6 ++----
 xen/arch/x86/cpu/mcheck/non-fatal.c | 6 ++++++
 xen/arch/x86/cpu/mcheck/vmce.h      | 1 +
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/Makefile b/xen/arch/x86/cpu/mcheck/M=
akefile
index f927f10b4d..5b3f6d875c 100644
--- a/xen/arch/x86/cpu/mcheck/Makefile
+++ b/xen/arch/x86/cpu/mcheck/Makefile
@@ -1,12 +1,10 @@
-obj-y +=3D amd_nonfatal.o
-obj-y +=3D mce_amd.o
 obj-y +=3D mcaction.o
 obj-y +=3D barrier.o
-obj-y +=3D intel-nonfatal.o
 obj-y +=3D mctelem.o
 obj-y +=3D mce.o
 obj-y +=3D mce-apei.o
-obj-y +=3D mce_intel.o
+obj-$(CONFIG_AMD) +=3D mce_amd.o amd_nonfatal.o
+obj-$(CONFIG_INTEL) +=3D mce_intel.o intel-nonfatal.o
 obj-y +=3D non-fatal.o
 obj-y +=3D util.o
 obj-y +=3D vmce.o
diff --git a/xen/arch/x86/cpu/mcheck/non-fatal.c b/xen/arch/x86/cpu/mchec=
k/non-fatal.c
index 33cacd15c2..2d91a3b1e0 100644
--- a/xen/arch/x86/cpu/mcheck/non-fatal.c
+++ b/xen/arch/x86/cpu/mcheck/non-fatal.c
@@ -24,14 +24,20 @@ static int __init cf_check init_nonfatal_mce_checker(=
void)
 	 * Check for non-fatal errors every MCE_RATE s
 	 */
 	switch (c->x86_vendor) {
+#ifdef CONFIG_AMD
 	case X86_VENDOR_AMD:
 	case X86_VENDOR_HYGON:
 		/* Assume we are on K8 or newer AMD or Hygon CPU here */
 		amd_nonfatal_mcheck_init(c);
 		break;
+#endif
+#ifdef CONFIG_INTEL
 	case X86_VENDOR_INTEL:
 		intel_nonfatal_mcheck_init(c);
 		break;
+#endif
+	default:
+		return -ENODEV;
 	}
 	printk(KERN_INFO "mcheck_poll: Machine check polling timer started.\n")=
;
 	return 0;
--=20
2.25.1


