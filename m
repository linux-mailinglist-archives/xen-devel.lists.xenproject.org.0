Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A61F8A6431
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 08:42:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706651.1103938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwcW7-0000Ur-0s; Tue, 16 Apr 2024 06:42:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706651.1103938; Tue, 16 Apr 2024 06:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwcW6-0000TB-TG; Tue, 16 Apr 2024 06:42:06 +0000
Received: by outflank-mailman (input) for mailman id 706651;
 Tue, 16 Apr 2024 06:42:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uDI1=LV=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1rwcW5-0000T0-62
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 06:42:05 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f1314a8-fbbc-11ee-b909-491648fe20b8;
 Tue, 16 Apr 2024 08:42:04 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 92CCF1D09FA;
 Tue, 16 Apr 2024 02:42:02 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 8893B1D09F9;
 Tue, 16 Apr 2024 02:42:02 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 5F7661D09F7;
 Tue, 16 Apr 2024 02:42:01 -0400 (EDT)
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
X-Inumbo-ID: 6f1314a8-fbbc-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=/ajn3Y23Ptep8PMnKlNl2X5WfquTjK0FGfT5lFyKeSU=; b=H51W
	XchhICvzFeR/uw4+9dZNAuizDXUoZJYKW02/V5+qp8Gjg/TsCTncsBvhw51yX472
	Oyhh6M8zkezReYB1Cl2K8uiciuwxKO4mc5JugWBR+tictwacIpI65mmecm4h55Cs
	j59bwE8GKplbK5PBamJId2W20SxlbZrhWnNdxRA=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v1 11/15] x86/oprofile: guard svm specific symbols with CONFIG_SVM
Date: Tue, 16 Apr 2024 09:41:53 +0300
Message-Id: <20240416064153.3469836-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 6E156D0C-FBBC-11EE-A0B3-78DCEB2EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Xenia Ragiadakou <burzalodowa@gmail.com>

The symbol svm_stgi_label is AMD-V specific so guard its usage in common =
code
with CONFIG_SVM.

Since SVM depends on HVM, it can be used alone.
Also, use #ifdef instead of #if.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/oprofile/op_model_athlon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/oprofile/op_model_athlon.c b/xen/arch/x86/oprof=
ile/op_model_athlon.c
index 69fd3fcc86..a9c7b87d67 100644
--- a/xen/arch/x86/oprofile/op_model_athlon.c
+++ b/xen/arch/x86/oprofile/op_model_athlon.c
@@ -320,7 +320,7 @@ static int cf_check athlon_check_ctrs(
 	struct vcpu *v =3D current;
 	unsigned int const nr_ctrs =3D model->num_counters;
=20
-#if CONFIG_HVM
+#ifdef CONFIG_SVM
 	struct cpu_user_regs *guest_regs =3D guest_cpu_user_regs();
=20
 	if (!guest_mode(regs) &&
--=20
2.25.1


