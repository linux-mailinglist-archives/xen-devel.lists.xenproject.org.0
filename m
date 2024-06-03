Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 890768D8165
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 13:39:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734896.1141030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE61z-0003fV-Cp; Mon, 03 Jun 2024 11:39:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734896.1141030; Mon, 03 Jun 2024 11:39:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE61z-0003bU-9d; Mon, 03 Jun 2024 11:39:15 +0000
Received: by outflank-mailman (input) for mailman id 734896;
 Mon, 03 Jun 2024 11:39:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G0SM=NF=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sE61y-0003bO-40
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 11:39:14 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4ecf6b3-219d-11ef-b4bb-af5377834399;
 Mon, 03 Jun 2024 13:39:11 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 126C7318B8;
 Mon,  3 Jun 2024 07:39:10 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 0ACD3318B7;
 Mon,  3 Jun 2024 07:39:10 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 25949318B6;
 Mon,  3 Jun 2024 07:39:06 -0400 (EDT)
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
X-Inumbo-ID: e4ecf6b3-219d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=JHgRlQ2mOAVaV36q/DwoXTgbm
	MjsvlXARfcG6GpvdPs=; b=rNgvOyf/nEl3Sg/AqUYANDNaMjpNMCYxrg86dVmWz
	7D5eeIVOvdRNPxFY3L6gQhaqKXZW6JMp/5r8ytL1HtL1TVEtm9PFFxeie8itz5j4
	CrJmrD43xLGM4A4BilgybCoJHzDFlrJeGZesI5Cad86aI/Dz3M2Qpz6nf7D/flHq
	m8=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v3 16/16] x86/hvm: make AMD-V and Intel VT-x support configurable
Date: Mon,  3 Jun 2024 14:39:03 +0300
Message-Id: <794fc2bf6cedddb9ea2ee0265e750e198d34eee9.1717410850.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 E2E04B50-219D-11EF-AEB4-8F8B087618E4-90055647!pb-smtp21.pobox.com
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


