Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DB38D8091
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 13:08:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734803.1140879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5XY-0007KI-LG; Mon, 03 Jun 2024 11:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734803.1140879; Mon, 03 Jun 2024 11:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5XY-0007I8-Ig; Mon, 03 Jun 2024 11:07:48 +0000
Received: by outflank-mailman (input) for mailman id 734803;
 Mon, 03 Jun 2024 11:07:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G0SM=NF=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sE5XW-0007I2-UT
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 11:07:46 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fbc3c67-2199-11ef-b4bb-af5377834399;
 Mon, 03 Jun 2024 13:07:44 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 60D4131584;
 Mon,  3 Jun 2024 07:07:42 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 59D7B31583;
 Mon,  3 Jun 2024 07:07:42 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 13F4931582;
 Mon,  3 Jun 2024 07:07:39 -0400 (EDT)
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
X-Inumbo-ID: 7fbc3c67-2199-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=x+pyBWLmT+o8FD/HTumT5AioH
	ODe7ZP15Is2zs12tZU=; b=Qst45r6mx/Nd4gbGNoc2Igg+WPHgY8G64WZPpHSHi
	h7ELaEBkZJiD1Wia1jaLYWYH56tfpnYy+2d6XAce68R5CX5d8mFFuCoCYpsCJhY8
	m1rWr4IpzxWQk6/BiyhuiQJXncJhojp1kOItgDO+nlq0rwFgyczD5wMprbGtSuTK
	Hc=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v3 01/16] x86: introduce AMD-V and Intel VT-x Kconfig options
Date: Mon,  3 Jun 2024 14:07:35 +0300
Message-Id: <72439ab1749b4bdca3c74a7d2af0254d23626797.1717410850.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 7D7F25B4-2199-11EF-AD40-8F8B087618E4-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Xenia Ragiadakou <burzalodowa@gmail.com>

Introduce two new Kconfig options, SVM and VMX, to allow code
specific to each virtualization technology to be separated and, when not
required, stripped.
CONFIG_SVM will be used to enable virtual machine extensions on platforms=
 that
implement the AMD Virtualization Technology (AMD-V).
CONFIG_VMX will be used to enable virtual machine extensions on platforms=
 that
implement the Intel Virtualization Technology (Intel VT-x).

Both features depend on HVM support.

Since, at this point, disabling any of them would cause Xen to not compil=
e,
the options are enabled by default if HVM and are not selectable by the u=
ser.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
changes in v3:
 - tag added
changes in v2:
 - simplify kconfig expression to def_bool HVM
 - keep file list in Makefile in alphabetical order
changes in v1:
 - change kconfig option name AMD_SVM/INTEL_VMX -> SVM/VMX
---
 xen/arch/x86/Kconfig         | 6 ++++++
 xen/arch/x86/hvm/Makefile    | 4 ++--
 xen/arch/x86/mm/Makefile     | 3 ++-
 xen/arch/x86/mm/hap/Makefile | 2 +-
 4 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 7e03e4bc55..8c9f8431f0 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -122,6 +122,12 @@ config HVM
=20
 	  If unsure, say Y.
=20
+config SVM
+	def_bool HVM
+
+config VMX
+	def_bool HVM
+
 config XEN_SHSTK
 	bool "Supervisor Shadow Stacks"
 	depends on HAS_AS_CET_SS
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index 3464191544..8434badc64 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -1,5 +1,5 @@
-obj-y +=3D svm/
-obj-y +=3D vmx/
+obj-$(CONFIG_SVM) +=3D svm/
+obj-$(CONFIG_VMX) +=3D vmx/
 obj-y +=3D viridian/
=20
 obj-y +=3D asid.o
diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
index 0803ac9297..0128ca7ab6 100644
--- a/xen/arch/x86/mm/Makefile
+++ b/xen/arch/x86/mm/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_MEM_SHARING) +=3D mem_sharing.o
 obj-$(CONFIG_HVM) +=3D nested.o
 obj-$(CONFIG_HVM) +=3D p2m.o
 obj-y +=3D p2m-basic.o
-obj-$(CONFIG_HVM) +=3D p2m-ept.o p2m-pod.o p2m-pt.o
+obj-$(CONFIG_VMX) +=3D p2m-ept.o
+obj-$(CONFIG_HVM) +=3D p2m-pod.o p2m-pt.o
 obj-y +=3D paging.o
 obj-y +=3D physmap.o
diff --git a/xen/arch/x86/mm/hap/Makefile b/xen/arch/x86/mm/hap/Makefile
index 8ef54b1faa..98c8a87819 100644
--- a/xen/arch/x86/mm/hap/Makefile
+++ b/xen/arch/x86/mm/hap/Makefile
@@ -3,4 +3,4 @@ obj-y +=3D guest_walk_2.o
 obj-y +=3D guest_walk_3.o
 obj-y +=3D guest_walk_4.o
 obj-y +=3D nested_hap.o
-obj-y +=3D nested_ept.o
+obj-$(CONFIG_VMX) +=3D nested_ept.o
--=20
2.25.1


