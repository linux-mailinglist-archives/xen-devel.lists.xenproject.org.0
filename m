Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FF3940FAB
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 12:41:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767550.1178224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYkIW-0003rq-H4; Tue, 30 Jul 2024 10:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767550.1178224; Tue, 30 Jul 2024 10:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYkIW-0003pa-EA; Tue, 30 Jul 2024 10:41:40 +0000
Received: by outflank-mailman (input) for mailman id 767550;
 Tue, 30 Jul 2024 10:41:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f2k0=O6=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sYkIU-0003oy-Sh
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 10:41:38 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b5db4de-4e60-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 12:41:37 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 658593F018;
 Tue, 30 Jul 2024 06:41:35 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 5F04C3F017;
 Tue, 30 Jul 2024 06:41:35 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 0700E3F016;
 Tue, 30 Jul 2024 06:41:31 -0400 (EDT)
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
X-Inumbo-ID: 4b5db4de-4e60-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=PLWtHtTVfhKJOmXqlZPRu0lCA
	GY1YvlMSG00r7Ubp84=; b=XVYLtJbJQYRYqEmkmnVIlq1bf4jiTsiMMtj6IZys6
	WTImyCfFEwdqsDrRIAMQq1YBx7FQxBzvq/Z3kyvUGyxYTJdXcz8dY8JaFh7ie3O9
	LJEWmPAL0rI3hDV75HaraKMiQfA5sndGf2rGMgZWsAMi5R6DsFDjyGkFDISQppg6
	q8=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v5 13/13] x86/hvm: make AMD-V and Intel VT-x support configurable
Date: Tue, 30 Jul 2024 13:41:29 +0300
Message-Id: <827008e4af26814e4cd4bf6abbb92c77fc136aa8.1722333634.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1722333634.git.Sergiy_Kibrik@epam.com>
References: <cover.1722333634.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 4901D3BA-4E60-11EF-9654-9625FCCAB05B-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Xenia Ragiadakou <burzalodowa@gmail.com>

Provide the user with configuration control over the cpu virtualization s=
upport
in Xen by making AMD_SVM and INTEL_VMX options user selectable.

To preserve the current default behavior, both options depend on HVM and
default to value of HVM.

To prevent users from unknowingly disabling virtualization support, make =
the
controls user selectable only if EXPERT is enabled.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
changes in v5:
- change kconfig option name SVM/VMX -> AMD_SVM/INTEL_VMX
changes in v3:
 - only tags added
changes in v2:
 - remove dependency of build options IOMMU/AMD_IOMMU on VMX/SVM options
---
 xen/arch/x86/Kconfig | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index eff9eedc19..f6a90d71fb 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -123,11 +123,25 @@ config HVM
 	  If unsure, say Y.
=20
 config AMD_SVM
-	def_bool HVM
+	bool "AMD-V" if EXPERT
+	depends on HVM
+	default HVM
+	help
+	  Enables virtual machine extensions on platforms that implement the
+	  AMD Virtualization Technology (AMD-V).
+	  If your system includes a processor with AMD-V support, say Y.
+	  If in doubt, say Y.
=20
 config INTEL_VMX
-	def_bool HVM
+	bool "Intel VT-x" if EXPERT
+	depends on HVM
+	default HVM
 	select ARCH_IOREQ_COMPLETION
+	help
+	  Enables virtual machine extensions on platforms that implement the
+	  Intel Virtualization Technology (Intel VT-x).
+	  If your system includes a processor with Intel VT-x support, say Y.
+	  If in doubt, say Y.
=20
 config XEN_SHSTK
 	bool "Supervisor Shadow Stacks"
--=20
2.25.1


