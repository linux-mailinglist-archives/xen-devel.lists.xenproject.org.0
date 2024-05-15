Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D9F8C6342
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 11:00:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722017.1125798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7AUR-0006Wy-Vg; Wed, 15 May 2024 08:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722017.1125798; Wed, 15 May 2024 08:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7AUR-0006V0-TB; Wed, 15 May 2024 08:59:59 +0000
Received: by outflank-mailman (input) for mailman id 722017;
 Wed, 15 May 2024 08:59:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJut=MS=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1s7AUQ-0006Uu-QN
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 08:59:58 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80707de0-1299-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 10:59:57 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 20A1E1AE64;
 Wed, 15 May 2024 04:59:56 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 189EB1AE63;
 Wed, 15 May 2024 04:59:56 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id A7BEE1AE62;
 Wed, 15 May 2024 04:59:54 -0400 (EDT)
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
X-Inumbo-ID: 80707de0-1299-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=O/4uva/ALHfMHswcx9quBNHY7
	OZITBZUuNjaXjzXO0M=; b=aXt/fvr59eEmqkiT/cC1Rrc82iZ7ZlIEtG6aYNXH9
	vO49tnnHkQbM8QNyAAE0E9q8r4yXzT334oonenzJ6+aIMhP6N2X/NXZZN7HL0AjB
	EL1d6GdF2eWj6LEKAi3HF1ZYzlGwjWJGzJxVEgudtHM4mYffK1+1D2ErC5zgGf+u
	Fc=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v2 01/15] x86: introduce AMD-V and Intel VT-x Kconfig options
Date: Wed, 15 May 2024 11:59:52 +0300
Message-Id: <3f2168a337a192336e9a7fb797185c39978db11b.1715761386.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 7F500188-1299-11EF-B3E3-78DCEB2EC81B-90055647!pb-smtp1.pobox.com
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
CC: Jan Beulich <jbeulich@suse.com>
---
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


