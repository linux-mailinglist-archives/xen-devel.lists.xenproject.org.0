Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C0C94BA90
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 12:13:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773868.1184305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc08w-00038Q-AG; Thu, 08 Aug 2024 10:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773868.1184305; Thu, 08 Aug 2024 10:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc08w-000360-7U; Thu, 08 Aug 2024 10:13:14 +0000
Received: by outflank-mailman (input) for mailman id 773868;
 Thu, 08 Aug 2024 10:13:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JkzM=PH=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sc08v-00035t-2v
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 10:13:13 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0d9b115-556e-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 12:13:12 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 9574B31D25;
 Thu,  8 Aug 2024 06:13:10 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 9008D31D24;
 Thu,  8 Aug 2024 06:13:10 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 6257D31D1F;
 Thu,  8 Aug 2024 06:13:06 -0400 (EDT)
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
X-Inumbo-ID: d0d9b115-556e-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=sYeNlXd320jgCemX/nEWnRjUu
	eRsq3RVfPj+4GsXNkw=; b=t3lazugoe7/x1qIZmwl8Npi/moFcbTxBNi/52MiGH
	r9nibkCsJnVLfUdmZJR8rr4zi6LDVLaDZuETm9o2q9uCd8sRdq9GgA5omZeaHmGa
	h1P4Q3HH9RLRxp/v2Cqq6czo8RRkrI6tU2QJgPn+lX1OkYoLfiIgcyTLrr4xgXTR
	fQ=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v6 3/3] x86/hvm: make AMD-V and Intel VT-x support configurable
Date: Thu,  8 Aug 2024 13:13:02 +0300
Message-Id: <f16a25ff16fe14461fad91716acee7a716e5c3fe.1723110344.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1723110344.git.Sergiy_Kibrik@epam.com>
References: <cover.1723110344.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 CE1762DA-556E-11EF-AE19-E92ED1CD468F-90055647!pb-smtp21.pobox.com
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


