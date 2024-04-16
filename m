Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7669E8A63A9
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 08:21:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706591.1103825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwcBj-0007tI-Qx; Tue, 16 Apr 2024 06:21:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706591.1103825; Tue, 16 Apr 2024 06:21:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwcBj-0007rY-OI; Tue, 16 Apr 2024 06:21:03 +0000
Received: by outflank-mailman (input) for mailman id 706591;
 Tue, 16 Apr 2024 06:21:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uDI1=LV=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1rwcBi-0007rO-4i
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 06:21:02 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d5d5d79-fbb9-11ee-94a3-07e782e9044d;
 Tue, 16 Apr 2024 08:20:59 +0200 (CEST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 4B6BB364C7;
 Tue, 16 Apr 2024 02:20:58 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 4343B364C6;
 Tue, 16 Apr 2024 02:20:58 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 2972E364C5;
 Tue, 16 Apr 2024 02:20:54 -0400 (EDT)
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
X-Inumbo-ID: 7d5d5d79-fbb9-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=Cv2yikNXg84Cn7K/ub1pBhxK6TBxHTPjKhRpG7iJVUw=; b=UJkT
	3qm91j7UuHB+mRYH6ZdZEuxPYSMx+rzlIOkh83h1ihoFXFteF7PGOa+Z50QNKgyI
	M+fiSzOOC0NJcgfNYa7YkbQqwmr4Vv2HMcGWfipcy3TkUVyuOB+X7AuMHyKgSi42
	+oa3wX1/b1C40nFKzBfxZ1AN4I9jsfYghk3UrNs=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v1 01/15] x86: introduce AMD-V and Intel VT-x Kconfig options
Date: Tue, 16 Apr 2024 09:20:52 +0300
Message-Id: <20240416062052.3467935-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 7B56E264-FBB9-11EE-B5FA-F515D2CDFF5E-90055647!pb-smtp20.pobox.com
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
---
 xen/arch/x86/Kconfig         | 6 ++++++
 xen/arch/x86/hvm/Makefile    | 4 ++--
 xen/arch/x86/mm/Makefile     | 3 ++-
 xen/arch/x86/mm/hap/Makefile | 2 +-
 4 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index d6f3128588..6f06d3baa5 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -120,6 +120,12 @@ config HVM
=20
 	  If unsure, say Y.
=20
+config SVM
+	def_bool y if HVM
+
+config VMX
+	def_bool y if HVM
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
index 0803ac9297..92168290a8 100644
--- a/xen/arch/x86/mm/Makefile
+++ b/xen/arch/x86/mm/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_MEM_SHARING) +=3D mem_sharing.o
 obj-$(CONFIG_HVM) +=3D nested.o
 obj-$(CONFIG_HVM) +=3D p2m.o
 obj-y +=3D p2m-basic.o
-obj-$(CONFIG_HVM) +=3D p2m-ept.o p2m-pod.o p2m-pt.o
+obj-$(CONFIG_HVM) +=3D p2m-pod.o p2m-pt.o
+obj-$(CONFIG_VMX) +=3D p2m-ept.o
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


