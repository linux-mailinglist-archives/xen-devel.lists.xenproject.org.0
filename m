Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 514AC8A6456
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 08:50:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706675.1103988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwce2-0005sG-Rj; Tue, 16 Apr 2024 06:50:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706675.1103988; Tue, 16 Apr 2024 06:50:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwce2-0005qa-O8; Tue, 16 Apr 2024 06:50:18 +0000
Received: by outflank-mailman (input) for mailman id 706675;
 Tue, 16 Apr 2024 06:50:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uDI1=LV=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1rwce0-0003tr-M7
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 06:50:16 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94915449-fbbd-11ee-b909-491648fe20b8;
 Tue, 16 Apr 2024 08:50:16 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 4A5071D0AA6;
 Tue, 16 Apr 2024 02:50:15 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 427231D0AA4;
 Tue, 16 Apr 2024 02:50:15 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 8E3A61D0AA3;
 Tue, 16 Apr 2024 02:50:14 -0400 (EDT)
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
X-Inumbo-ID: 94915449-fbbd-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=73oB9cz+rgWGRmiSEPuj3snqYNDtbVDV4nr/Z0x8dhI=; b=rcyS
	Wvj70ZB752KV8xYG/QpWo3ROyuoxrE0D+TlIsXNauNbGy+1n9dT+phE2w1F+005H
	hFQV6EoSLnw8DRmdvY4inLaMLwUOKoyE21x0oyw/gid7go+HdMClyYTqMLHsmEtB
	+D6HP+XuYXA5DcWEm3/uKTsybRMUEJtLvEwpukk=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v1 15/15] x86/hvm: make AMD-V and Intel VT-x support configurable
Date: Tue, 16 Apr 2024 09:50:12 +0300
Message-Id: <20240416065012.3470263-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 9407D292-FBBD-11EE-B8B3-78DCEB2EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Xenia Ragiadakou <burzalodowa@gmail.com>

Provide the user with configuration control over the cpu virtualization s=
upport
in Xen by making SVM and VMX options user selectable.

To preserve the current default behavior, both options depend on HVM and
default to Y.

To prevent users from unknowingly disabling virtualization support, make =
the
controls user selectable only if EXPERT is enabled.
Also make INTEL_IOMMU/AMD_IOMMU options dependant on VMX/SVM options.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/Kconfig            | 18 ++++++++++++++++--
 xen/drivers/passthrough/Kconfig |  4 ++--
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 6f06d3baa5..98a6f8d877 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -121,10 +121,24 @@ config HVM
 	  If unsure, say Y.
=20
 config SVM
-	def_bool y if HVM
+	bool "AMD-V" if EXPERT
+	depends on HVM
+	default y
+	help
+	  Enables virtual machine extensions on platforms that implement the
+	  AMD Virtualization Technology (AMD-V).
+	  If your system includes a processor with AMD-V support, say Y.
+	  If in doubt, say Y.
=20
 config VMX
-	def_bool y if HVM
+	bool "Intel VT-x" if EXPERT
+	depends on HVM
+	default y
+	help
+	  Enables virtual machine extensions on platforms that implement the
+	  Intel Virtualization Technology (Intel VT-x).
+	  If your system includes a processor with Intel VT-x support, say Y.
+	  If in doubt, say Y.
=20
 config XEN_SHSTK
 	bool "Supervisor Shadow Stacks"
diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kc=
onfig
index 864fcf3b0c..5f53639c2d 100644
--- a/xen/drivers/passthrough/Kconfig
+++ b/xen/drivers/passthrough/Kconfig
@@ -39,7 +39,7 @@ endif
=20
 config AMD_IOMMU
 	bool "AMD IOMMU" if EXPERT
-	depends on X86
+	depends on X86 && SVM
 	default y
 	help
 	  Enables I/O virtualization on platforms that implement the
@@ -51,7 +51,7 @@ config AMD_IOMMU
=20
 config INTEL_IOMMU
 	bool "Intel VT-d" if EXPERT
-	depends on X86
+	depends on X86 && VMX
 	default y
 	help
 	  Enables I/O virtualization on platforms that implement the
--=20
2.25.1


