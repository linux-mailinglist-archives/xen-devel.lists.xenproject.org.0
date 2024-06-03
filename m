Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 293788D80ED
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 13:20:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734837.1140940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5jl-0004rs-0T; Mon, 03 Jun 2024 11:20:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734837.1140940; Mon, 03 Jun 2024 11:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5jk-0004ow-Tb; Mon, 03 Jun 2024 11:20:24 +0000
Received: by outflank-mailman (input) for mailman id 734837;
 Mon, 03 Jun 2024 11:20:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G0SM=NF=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sE5jj-0004on-Lq
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 11:20:23 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43d6d3b1-219b-11ef-90a1-e314d9c70b13;
 Mon, 03 Jun 2024 13:20:22 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 3430E3179A;
 Mon,  3 Jun 2024 07:20:21 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 2CF4B31799;
 Mon,  3 Jun 2024 07:20:21 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 8A66531798;
 Mon,  3 Jun 2024 07:20:17 -0400 (EDT)
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
X-Inumbo-ID: 43d6d3b1-219b-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=n/Gri7cpn2cravDMKsNg30rBQ
	5Jg6W+aMAIEGe32Evo=; b=dCF9a04QKrLuNFjVNwZyYfAhQz0S4I/KbajsoeJh3
	dRsxghoqoirdKVKmb3iHcUMk/laThMhELQBToZFd3PAlcQCA5LDC49GDx++MbNXr
	5rxZmYK/OV+VCAlaRiPh61rwmid4GTfoLoPZ+5SQbtA8xjkCvvcC4NuXzQPQCDQM
	5c=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v3 07/16] x86/hvm: guard AMD-V and Intel VT-x hvm_function_table initializers
Date: Mon,  3 Jun 2024 14:20:14 +0300
Message-Id: <25d4ade03f22ae4eb260af3eae5f48528f2e3ca8.1717410850.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 4196CF28-219B-11EF-BE08-8F8B087618E4-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Xenia Ragiadakou <burzalodowa@gmail.com>

Since start_svm() is AMD-V specific while start_vmx() is Intel VT-x speci=
fic,
any of them can potentially be excluded from build completely with CONFIG=
_SVM
or CONFIG_VMX options respectively, hence we have to explicitly check if
they're available and use specific macros using_{svm,vmx} for that.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
changes in v3:
 - use using_{svm,vmx} macro instead of IS_ENABLED(CONFIG_{SVM,VMX})
 - updated description
---
 xen/arch/x86/hvm/hvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 8334ab1711..7b8679bcd8 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -155,9 +155,9 @@ static int __init cf_check hvm_enable(void)
 {
     const struct hvm_function_table *fns =3D NULL;
=20
-    if ( cpu_has_vmx )
+    if ( using_vmx )
         fns =3D start_vmx();
-    else if ( cpu_has_svm )
+    else if ( using_svm )
         fns =3D start_svm();
=20
     if ( fns =3D=3D NULL )
--=20
2.25.1


