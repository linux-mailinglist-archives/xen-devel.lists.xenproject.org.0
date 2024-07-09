Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A3692AFB7
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 08:03:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755785.1164261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR3wV-0005tH-DG; Tue, 09 Jul 2024 06:03:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755785.1164261; Tue, 09 Jul 2024 06:03:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR3wV-0005rn-Ac; Tue, 09 Jul 2024 06:03:11 +0000
Received: by outflank-mailman (input) for mailman id 755785;
 Tue, 09 Jul 2024 06:03:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SGp0=OJ=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sR3wT-0005rf-QZ
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 06:03:09 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e94b1161-3db8-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 08:03:07 +0200 (CEST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 5DD02382C9;
 Tue,  9 Jul 2024 02:03:06 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 569B1382C8;
 Tue,  9 Jul 2024 02:03:06 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id CBAA8382C7;
 Tue,  9 Jul 2024 02:03:02 -0400 (EDT)
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
X-Inumbo-ID: e94b1161-3db8-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=/ajn3Y23Ptep8PMnKlNl2X5Wf
	quTjK0FGfT5lFyKeSU=; b=cKDph/I4smSuMAgl6eivDKUxkZIpd0HJQoFd9wgyo
	YVklYn9fy2wtRlTcENA+yLICYrq1kRrcd/kCPHFRy2bo2Y/5PWzM7/TDpwRM1JC3
	NCLuAC5jleS9x6SjdrXPbiu8lcxbrvMWLUBQ+5zZygqbv2Z0zw/xZhfi5oLvu0bn
	Ko=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v4 09/14] x86/oprofile: guard svm specific symbols with CONFIG_SVM
Date: Tue,  9 Jul 2024 09:02:59 +0300
Message-Id: <3f78143694a9cb530743b438af1d7336820a7d9a.1720501197.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 E6E08580-3DB8-11EF-805F-C38742FD603B-90055647!pb-smtp20.pobox.com
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


