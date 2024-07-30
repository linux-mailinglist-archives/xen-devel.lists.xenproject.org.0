Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 406AF940EC4
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 12:16:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767454.1178104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYju6-0000pG-5m; Tue, 30 Jul 2024 10:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767454.1178104; Tue, 30 Jul 2024 10:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYju6-0000n1-2r; Tue, 30 Jul 2024 10:16:26 +0000
Received: by outflank-mailman (input) for mailman id 767454;
 Tue, 30 Jul 2024 10:16:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f2k0=O6=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sYju4-0000j2-8k
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 10:16:24 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3ec1bc8-4e5c-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 12:16:21 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id A63103ED1B;
 Tue, 30 Jul 2024 06:16:19 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 9E6FB3ED1A;
 Tue, 30 Jul 2024 06:16:19 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 692143ED17;
 Tue, 30 Jul 2024 06:16:15 -0400 (EDT)
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
X-Inumbo-ID: c3ec1bc8-4e5c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=L6AETPgQkcYiX+QHAexZ2iwZP
	QZAtjMQ/7c+q/KthCY=; b=ZnAMwby1nAwHKozP7D5swP3F1R2OD9umUiN3T9NQG
	QBUQIVqr7Yw+9BFFT/k2oiA3np5pIjw8wbGbXqOJa3cB62bpSK7ff1Ey1+HTNT/J
	8flAUhreNsB8DI/7p2dQTz6I6qQ2m0ZAf1iMoR6HKyt/IKhWEqba2Yksh12MpyG0
	XU=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v5 01/13] x86: introduce AMD-V and Intel VT-x Kconfig options
Date: Tue, 30 Jul 2024 13:16:11 +0300
Message-Id: <eff6569e9499f49f0bbaf3dbd4589e47b65950e5.1722333634.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1722333634.git.Sergiy_Kibrik@epam.com>
References: <cover.1722333634.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 C10B3904-4E5C-11EF-9A5D-9625FCCAB05B-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Xenia Ragiadakou <burzalodowa@gmail.com>

Introduce two new Kconfig options, AMD_SVM and INTEL_VMX, to allow code
specific to each virtualization technology to be separated and, when not
required, stripped.
CONFIG_AMD_SVM will be used to enable virtual machine extensions on platf=
orms
that implement the AMD Virtualization Technology (AMD-V).
CONFIG_INTEL_VMX will be used to enable virtual machine extensions on pla=
tforms
that implement the Intel Virtualization Technology (Intel VT-x).

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
changes in v5:
 - change kconfig option name SVM/VMX -> AMD_SVM/INTEL_VMX
changes in v3:
 - tag added
changes in v2:
 - simplify kconfig expression to def_bool HVM
 - keep file list in Makefile in alphabetical order
---
 xen/arch/x86/Kconfig         | 6 ++++++
 xen/arch/x86/hvm/Makefile    | 4 ++--
 xen/arch/x86/mm/Makefile     | 3 ++-
 xen/arch/x86/mm/hap/Makefile | 2 +-
 4 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 7e03e4bc55..fa5405e0d3 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -122,6 +122,12 @@ config HVM
=20
 	  If unsure, say Y.
=20
+config AMD_SVM
+	def_bool HVM
+
+config INTEL_VMX
+	def_bool HVM
+
 config XEN_SHSTK
 	bool "Supervisor Shadow Stacks"
 	depends on HAS_AS_CET_SS
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index 3464191544..4c1fa5c6c2 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -1,5 +1,5 @@
-obj-y +=3D svm/
-obj-y +=3D vmx/
+obj-$(CONFIG_AMD_SVM) +=3D svm/
+obj-$(CONFIG_INTEL_VMX) +=3D vmx/
 obj-y +=3D viridian/
=20
 obj-y +=3D asid.o
diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
index 0803ac9297..52c5abdfee 100644
--- a/xen/arch/x86/mm/Makefile
+++ b/xen/arch/x86/mm/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_MEM_SHARING) +=3D mem_sharing.o
 obj-$(CONFIG_HVM) +=3D nested.o
 obj-$(CONFIG_HVM) +=3D p2m.o
 obj-y +=3D p2m-basic.o
-obj-$(CONFIG_HVM) +=3D p2m-ept.o p2m-pod.o p2m-pt.o
+obj-$(CONFIG_INTEL_VMX) +=3D p2m-ept.o
+obj-$(CONFIG_HVM) +=3D p2m-pod.o p2m-pt.o
 obj-y +=3D paging.o
 obj-y +=3D physmap.o
diff --git a/xen/arch/x86/mm/hap/Makefile b/xen/arch/x86/mm/hap/Makefile
index 8ef54b1faa..67c29b2162 100644
--- a/xen/arch/x86/mm/hap/Makefile
+++ b/xen/arch/x86/mm/hap/Makefile
@@ -3,4 +3,4 @@ obj-y +=3D guest_walk_2.o
 obj-y +=3D guest_walk_3.o
 obj-y +=3D guest_walk_4.o
 obj-y +=3D nested_hap.o
-obj-y +=3D nested_ept.o
+obj-$(CONFIG_INTEL_VMX) +=3D nested_ept.o
--=20
2.25.1


