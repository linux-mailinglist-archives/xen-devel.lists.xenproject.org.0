Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7476792AFDA
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 08:13:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755818.1164310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR46Y-0002OP-74; Tue, 09 Jul 2024 06:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755818.1164310; Tue, 09 Jul 2024 06:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR46Y-0002Mq-3z; Tue, 09 Jul 2024 06:13:34 +0000
Received: by outflank-mailman (input) for mailman id 755818;
 Tue, 09 Jul 2024 06:13:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SGp0=OJ=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sR46W-0002Mj-D5
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 06:13:32 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c861079-3dba-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 08:13:31 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 3E96227243;
 Tue,  9 Jul 2024 02:13:29 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 3688E27242;
 Tue,  9 Jul 2024 02:13:29 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 6A53527241;
 Tue,  9 Jul 2024 02:13:28 -0400 (EDT)
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
X-Inumbo-ID: 5c861079-3dba-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=JHgRlQ2mOAVaV36q/DwoXTgbm
	MjsvlXARfcG6GpvdPs=; b=ABDKpP08RVJUTSKPO/M+QuO4dPVccBbAhNMmiHMaF
	ns8XXFCmHKIGgRQGMR4rQdNy0hon70BknNoRGa3zVv5cJb8SUdvyIuEMRE9v7fec
	SQ7PCehaoIsz5M9IOul22pGxTGWItD+jCPycg8g6Uj7eNpsIbq4m8fVSMPDytUI+
	Lg=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v4 14/14] x86/hvm: make AMD-V and Intel VT-x support configurable
Date: Tue,  9 Jul 2024 09:13:25 +0300
Message-Id: <77b83b71a9f759fcf925675b36fcd3f58e06fff1.1720501197.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 5BC43260-3DBA-11EF-8A32-965B910A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Xenia Ragiadakou <burzalodowa@gmail.com>

Provide the user with configuration control over the cpu virtualization s=
upport
in Xen by making SVM and VMX options user selectable.

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
changes in v3:
 - only tags added
changes in v2:
 - remove dependency of build options IOMMU/AMD_IOMMU on VMX/SVM options
---
 xen/arch/x86/Kconfig | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 4a35c43dc5..dbee7c2efb 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -123,10 +123,24 @@ config HVM
 	  If unsure, say Y.
=20
 config SVM
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
 config VMX
-	def_bool HVM
+	bool "Intel VT-x" if EXPERT
+	depends on HVM
+	default HVM
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


