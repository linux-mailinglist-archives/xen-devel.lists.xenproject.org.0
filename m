Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C19818D813A
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 13:29:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734862.1140979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5rq-0007Jl-D2; Mon, 03 Jun 2024 11:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734862.1140979; Mon, 03 Jun 2024 11:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5rq-0007Hn-A8; Mon, 03 Jun 2024 11:28:46 +0000
Received: by outflank-mailman (input) for mailman id 734862;
 Mon, 03 Jun 2024 11:28:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G0SM=NF=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sE5rp-0007Hh-F2
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 11:28:45 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f0f3d40-219c-11ef-90a1-e314d9c70b13;
 Mon, 03 Jun 2024 13:28:44 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 305C4317E8;
 Mon,  3 Jun 2024 07:28:43 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 29BF7317E7;
 Mon,  3 Jun 2024 07:28:43 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 0BB53317E6;
 Mon,  3 Jun 2024 07:28:39 -0400 (EDT)
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
X-Inumbo-ID: 6f0f3d40-219c-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=/ajn3Y23Ptep8PMnKlNl2X5Wf
	quTjK0FGfT5lFyKeSU=; b=hPCH2kf9dP1RWVFD/0rd/7nEKY6u6LPWdt1rwCXQL
	mnHW4Xy7S1YSlJXBpQENZBrkHb6btgLOBg5F4GNIirccVERA9UcSZUq0XjRUvdQA
	WbHb9IxW+rwIY95fN4I5rFAjlAUbmZH7zBnLGa1/gZqQCC+HoPHoZojpNHcrl5QX
	XE=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v3 11/16] x86/oprofile: guard svm specific symbols with CONFIG_SVM
Date: Mon,  3 Jun 2024 14:28:36 +0300
Message-Id: <cdd7b4fe1e738007e37f5bae99ab8fc39bf85ba7.1717410850.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 6D175BF8-219C-11EF-9E81-8F8B087618E4-90055647!pb-smtp21.pobox.com
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


