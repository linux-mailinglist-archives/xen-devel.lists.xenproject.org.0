Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F866940F5D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 12:31:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767510.1178175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYk8L-0007Os-Nl; Tue, 30 Jul 2024 10:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767510.1178175; Tue, 30 Jul 2024 10:31:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYk8L-0007MQ-KL; Tue, 30 Jul 2024 10:31:09 +0000
Received: by outflank-mailman (input) for mailman id 767510;
 Tue, 30 Jul 2024 10:31:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f2k0=O6=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sYk8K-0007MK-QC
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 10:31:08 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2e688df-4e5e-11ef-bc01-fd08da9f4363;
 Tue, 30 Jul 2024 12:31:05 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 060C13EF70;
 Tue, 30 Jul 2024 06:31:04 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id DD68B3EF6F;
 Tue, 30 Jul 2024 06:31:03 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id EE0CC3EF65;
 Tue, 30 Jul 2024 06:30:59 -0400 (EDT)
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
X-Inumbo-ID: d2e688df-4e5e-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=a3JUqFJ0pv4wjciXe5achXNd8
	po6sg6Fn2xTByUFn8o=; b=JKclh5kv4MX8CJCxgzGaMgSCurXif/XzzhSWGwvBG
	7Y5NIoyN5/nFK1+B16niIigUylBnUmcfPWfiEhZkztUgBfXFAaTXXrSpQI3PUMy/
	axEzYaUkRlWkPun5TQh69M7U4peWbjh6jDikdbTkCIJxFoLRUapoU3INZp4LehYP
	FA=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v5 08/13] x86/oprofile: guard svm specific symbols with CONFIG_AMD_SVM
Date: Tue, 30 Jul 2024 13:30:57 +0300
Message-Id: <2a4f65ddae78d19d266224b0a16011e5a953bdf9.1722333634.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1722333634.git.Sergiy_Kibrik@epam.com>
References: <cover.1722333634.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 D0459FDE-4E5E-11EF-97F8-9625FCCAB05B-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Xenia Ragiadakou <burzalodowa@gmail.com>

The symbol svm_stgi_label is AMD-V specific so guard its usage in common =
code
with CONFIG_AMD_SVM.

Since SVM depends on HVM, it can be used alone.
Also, use #ifdef instead of #if.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
changes in v5:
 - change kconfig option name SVM -> AMD_SVM
---
 xen/arch/x86/oprofile/op_model_athlon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/oprofile/op_model_athlon.c b/xen/arch/x86/oprof=
ile/op_model_athlon.c
index 69fd3fcc86..782fa606ee 100644
--- a/xen/arch/x86/oprofile/op_model_athlon.c
+++ b/xen/arch/x86/oprofile/op_model_athlon.c
@@ -320,7 +320,7 @@ static int cf_check athlon_check_ctrs(
 	struct vcpu *v =3D current;
 	unsigned int const nr_ctrs =3D model->num_counters;
=20
-#if CONFIG_HVM
+#ifdef CONFIG_AMD_SVM
 	struct cpu_user_regs *guest_regs =3D guest_cpu_user_regs();
=20
 	if (!guest_mode(regs) &&
--=20
2.25.1


