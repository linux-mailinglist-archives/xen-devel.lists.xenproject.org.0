Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA84962584
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 13:08:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784722.1194111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjGWo-0000Zg-I6; Wed, 28 Aug 2024 11:07:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784722.1194111; Wed, 28 Aug 2024 11:07:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjGWo-0000Xj-EL; Wed, 28 Aug 2024 11:07:54 +0000
Received: by outflank-mailman (input) for mailman id 784722;
 Wed, 28 Aug 2024 11:07:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=933A=P3=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sjGWn-0000Xd-Kc
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 11:07:53 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c43a1cc4-652d-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 13:07:51 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id CA0A43DE20;
 Wed, 28 Aug 2024 07:07:50 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id C198A3DE1F;
 Wed, 28 Aug 2024 07:07:50 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [46.211.119.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id D2C9C3DE1D;
 Wed, 28 Aug 2024 07:07:48 -0400 (EDT)
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
X-Inumbo-ID: c43a1cc4-652d-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=sYeNlXd320jgCemX/nEWnRjUu
	eRsq3RVfPj+4GsXNkw=; b=GcXpl1GP0Lk6uDIt92caFIryZ5FCjwSAmft4YfJeE
	4Lk0Og3vowFZ4qniRf7vM9BHusiFtTeA+k49EYYP1waJVD3L/l+NeK8zQGTk628O
	M1BUXwqA1CKvWzS0w2pV34aFtGnG7ElQ5yuzTk/slRQlvLNxrBT6Kr9SsXBF1kfi
	pY=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v7 2/2] x86/hvm: make AMD-V and Intel VT-x support configurable
Date: Wed, 28 Aug 2024 14:07:45 +0300
Message-Id: <eaa54180fbb8056ba6bcaa9ca3d985c899156354.1724842645.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1724842645.git.Sergiy_Kibrik@epam.com>
References: <cover.1724842645.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 C2DA7960-652D-11EF-897D-2BAEEB2EC81B-90055647!pb-smtp1.pobox.com
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
changes in v6:
 - "default y" instead of "default HVM"
changes in v5:
- change kconfig option name SVM/VMX -> AMD_SVM/INTEL_VMX
changes in v3:
 - only tags added
---
 xen/arch/x86/Kconfig | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 74e081c7bd..d0aaf359eb 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -123,11 +123,25 @@ config HVM
 	  If unsure, say Y.
=20
 config AMD_SVM
-	def_bool HVM
+	bool "AMD-V" if EXPERT
+	depends on HVM
+	default y
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
+	default y
 	select ARCH_VCPU_IOREQ_COMPLETION
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


