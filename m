Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD7992AF9A
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 07:55:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755751.1164211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR3oJ-0001U9-N7; Tue, 09 Jul 2024 05:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755751.1164211; Tue, 09 Jul 2024 05:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR3oJ-0001Sx-Js; Tue, 09 Jul 2024 05:54:43 +0000
Received: by outflank-mailman (input) for mailman id 755751;
 Tue, 09 Jul 2024 05:54:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SGp0=OJ=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sR3oI-0001So-JW
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 05:54:42 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id babed62a-3db7-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 07:54:40 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id E72AB26FC2;
 Tue,  9 Jul 2024 01:54:38 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id CE49926FC1;
 Tue,  9 Jul 2024 01:54:38 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 440D226FC0;
 Tue,  9 Jul 2024 01:54:37 -0400 (EDT)
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
X-Inumbo-ID: babed62a-3db7-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=DDNDkiZVLdutMBS7Fc+YynLKX
	qz7hyMKSP5XW4Bwk6o=; b=vK63Z7oPVwGdF/tt9S48HYUwtZIToqrBQ/gTC6LCp
	cD3E6pWlaJPcU0y15uIVj/wwocIBvd9hyY7U16TW21sv1c67x7OLJSQHS4U1x/Gz
	itOHJ+P+EMuY6kBLPRgQDkf8raTlzAuYzxTay//o1gelp4QBwR9bvHMJRfByRv2a
	3g=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: [XEN PATCH v4 05/14] x86: introduce using_{svm,vmx}() helpers
Date: Tue,  9 Jul 2024 08:54:34 +0300
Message-Id: <d730b06b851d5c502850509d4cf868ed618d10d8.1720501197.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 B98AD47E-3DB7-11EF-8880-965B910A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

As we now have SVM/VMX config options for enabling/disabling these featur=
es
completely in the build, we need some build-time checks to ensure that vm=
x/svm
code can be used and things compile. Macros cpu_has_{svm,vmx} used to be =
doing
such checks at runtime, however they do not check if SVM/VMX support is
enabled in the build.

Also cpu_has_{svm,vmx} can potentially be called from non-{VMX,SVM} build
yet running on {VMX,SVM}-enabled CPU, so would correctly indicate that VM=
X/SVM
is indeed supported by CPU, but code to drive it can't be used.

New routines using_{vmx,svm}() indicate that both CPU _and_ build provide
corresponding technology support, while cpu_has_{vmx,svm} still remains f=
or
informational runtime purpose, just as their naming suggests.

These new helpers are used right away in several sites, namely guard call=
s to
start_nested_{svm,vmx} and start_{svm,vmx} to fix a build when VMX=3Dn or=
 SVM=3Dn.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Jan Beulich <jbeulich@suse.com>
---
changes in v4:
 - make using_{vmx,svm} static inline functions instead of macros
 - squash patch with 2 other patches where using_{vmx,svm} are being used
 - changed patch description
changes in v3:
 - introduce separate macros instead of modifying behaviour of cpu_has_{v=
mx,svm}
---
 xen/arch/x86/hvm/hvm.c             |  4 ++--
 xen/arch/x86/hvm/nestedhvm.c       |  4 ++--
 xen/arch/x86/include/asm/hvm/hvm.h | 10 ++++++++++
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 7f4b627b1f..057c61b4c3 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -155,9 +155,9 @@ static int __init cf_check hvm_enable(void)
 {
     const struct hvm_function_table *fns =3D NULL;
=20
-    if ( cpu_has_vmx )
+    if ( using_vmx() )
         fns =3D start_vmx();
-    else if ( cpu_has_svm )
+    else if ( using_svm() )
         fns =3D start_svm();
=20
     if ( fns =3D=3D NULL )
diff --git a/xen/arch/x86/hvm/nestedhvm.c b/xen/arch/x86/hvm/nestedhvm.c
index 451c4da6d4..5009167372 100644
--- a/xen/arch/x86/hvm/nestedhvm.c
+++ b/xen/arch/x86/hvm/nestedhvm.c
@@ -155,9 +155,9 @@ static int __init cf_check nestedhvm_setup(void)
      * done, so that if (for example) HAP is disabled, nested virt is
      * disabled as well.
      */
-    if ( cpu_has_vmx )
+    if ( using_vmx() )
         start_nested_vmx(&hvm_funcs);
-    else if ( cpu_has_svm )
+    else if ( using_svm() )
         start_nested_svm(&hvm_funcs);
=20
     return 0;
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/as=
m/hvm/hvm.h
index 34824af6df..2927a2ad6c 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -363,6 +363,16 @@ int hvm_copy_context_and_params(struct domain *dst, =
struct domain *src);
=20
 int hvm_get_param(struct domain *d, uint32_t index, uint64_t *value);
=20
+static inline bool using_vmx(void)
+{
+    return IS_ENABLED(CONFIG_VMX) && cpu_has_vmx;
+}
+
+static inline bool using_svm(void)
+{
+    return IS_ENABLED(CONFIG_SVM) && cpu_has_svm;
+}
+
 #ifdef CONFIG_HVM
=20
 #define hvm_get_guest_tsc(v) hvm_get_guest_tsc_fixed(v, 0)
--=20
2.25.1


