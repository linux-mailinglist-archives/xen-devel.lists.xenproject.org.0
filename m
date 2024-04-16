Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 479408A63B5
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 08:23:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706594.1103835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwcDl-0008S5-7B; Tue, 16 Apr 2024 06:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706594.1103835; Tue, 16 Apr 2024 06:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwcDl-0008PH-3w; Tue, 16 Apr 2024 06:23:09 +0000
Received: by outflank-mailman (input) for mailman id 706594;
 Tue, 16 Apr 2024 06:23:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uDI1=LV=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1rwcDj-0008OO-Pa
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 06:23:07 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8af5c23-fbb9-11ee-94a3-07e782e9044d;
 Tue, 16 Apr 2024 08:23:05 +0200 (CEST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 3D499364D0;
 Tue, 16 Apr 2024 02:23:04 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 16B97364CF;
 Tue, 16 Apr 2024 02:23:04 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 246A6364CD;
 Tue, 16 Apr 2024 02:23:00 -0400 (EDT)
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
X-Inumbo-ID: c8af5c23-fbb9-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=nVGF93SwVxjmd/Ty6DZ8L8PrhTbVuUWdW/P91kcIR4Y=; b=Dhoe
	hpAsN9S9fZki+jlw7w7X7i9TxdD9gVrOXbzlqTCM2vOy0Wgz1J+Dsc/ZEaLjkdlr
	BNOzj1Shg0ZyuOL50hS4DntD7//ocr5rI6y7nhHZBg/CP/iH11GFeV1WPkyMgA6w
	eNmikVRcJR3inQ9X/rJijvPswG0NysRfY4OeOdA=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v1 02/15] x86/hvm: guard AMD-V and Intel VT-x hvm_function_table initializers
Date: Tue, 16 Apr 2024 09:22:58 +0300
Message-Id: <20240416062258.3468774-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 C66D5B70-FBB9-11EE-9473-F515D2CDFF5E-90055647!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Xenia Ragiadakou <burzalodowa@gmail.com>

Since start_svm() is AMD-V specific while start_vmx() is Intel VT-x speci=
fic,
one can be excluded from build completely with CONFIG_SVM and CONFIG_VMX,
respectively.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/hvm/hvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 0ce45b177c..3edbe03caf 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -156,9 +156,9 @@ static int __init cf_check hvm_enable(void)
 {
     const struct hvm_function_table *fns =3D NULL;
=20
-    if ( cpu_has_vmx )
+    if ( IS_ENABLED(CONFIG_VMX) && cpu_has_vmx )
         fns =3D start_vmx();
-    else if ( cpu_has_svm )
+    else if ( IS_ENABLED(CONFIG_SVM) && cpu_has_svm )
         fns =3D start_svm();
=20
     if ( fns =3D=3D NULL )
--=20
2.25.1


