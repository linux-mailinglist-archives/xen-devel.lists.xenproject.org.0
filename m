Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7D58D80E0
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 13:18:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734833.1140929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5hh-00036O-Ki; Mon, 03 Jun 2024 11:18:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734833.1140929; Mon, 03 Jun 2024 11:18:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5hh-00033l-Hm; Mon, 03 Jun 2024 11:18:17 +0000
Received: by outflank-mailman (input) for mailman id 734833;
 Mon, 03 Jun 2024 11:18:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G0SM=NF=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sE5hg-00033f-LU
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 11:18:16 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f846ebcf-219a-11ef-90a1-e314d9c70b13;
 Mon, 03 Jun 2024 13:18:15 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 4FDC8316C9;
 Mon,  3 Jun 2024 07:18:14 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 48B78316C8;
 Mon,  3 Jun 2024 07:18:14 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 648BD316C7;
 Mon,  3 Jun 2024 07:18:11 -0400 (EDT)
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
X-Inumbo-ID: f846ebcf-219a-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=EZVyjSsSWDLxpBQraUn0Nt2fs
	8KnFVfS9druGNOmUVE=; b=pbSAKgtpWtY8TrguN6fgy7NhvG92n8MDpX6mO1PPp
	rIXC07gSRsPhMVciOQJ0Ib6qxXVD7jS8SaHHpq5gKJkOWI5aAZM2iNNu6IKgTNom
	GiJ+DqpP/87ux7lXrKbFsforoA887fpCUpj9/ohY3IshwMzMzW1qE3mlJrQ3Ortu
	rc=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: [XEN PATCH v3 06/16] x86/nestedhvm: switch to using_{svm,vmx} check
Date: Mon,  3 Jun 2024 14:18:07 +0300
Message-Id: <63ba1d4e043315693957093688670d36ffa65d28.1717410850.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 F664D676-219A-11EF-A6B0-8F8B087618E4-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

Use using_{svm,vmx} instead of cpu_has_{svm,vmx} that not only checks if =
CPU
supports corresponding virtialization technology, but also if it is
supported by build configuration.

This fixes build when VMX=3Dn or SVM=3Dn, because then start_nested_{svm,=
vmx}
routine(s) not available.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/hvm/nestedhvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/nestedhvm.c b/xen/arch/x86/hvm/nestedhvm.c
index 451c4da6d4..008dddf801 100644
--- a/xen/arch/x86/hvm/nestedhvm.c
+++ b/xen/arch/x86/hvm/nestedhvm.c
@@ -155,9 +155,9 @@ static int __init cf_check nestedhvm_setup(void)
      * done, so that if (for example) HAP is disabled, nested virt is
      * disabled as well.
      */
-    if ( cpu_has_vmx )
+    if ( using_vmx )
         start_nested_vmx(&hvm_funcs);
-    else if ( cpu_has_svm )
+    else if ( using_svm )
         start_nested_svm(&hvm_funcs);
=20
     return 0;
--=20
2.25.1


