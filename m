Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8A3447D69
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 11:13:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223173.385748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk1dY-0000gq-C0; Mon, 08 Nov 2021 10:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223173.385748; Mon, 08 Nov 2021 10:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk1dY-0000dQ-8S; Mon, 08 Nov 2021 10:12:24 +0000
Received: by outflank-mailman (input) for mailman id 223173;
 Mon, 08 Nov 2021 10:12:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uasK=P3=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1mk1dN-0000dK-8d
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 10:12:23 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55cb7bd2-407c-11ec-9787-a32c541c8605;
 Mon, 08 Nov 2021 11:12:10 +0100 (CET)
Received: from zn.tnic (p200300ec2f33110088892b77bd117736.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f33:1100:8889:2b77:bd11:7736])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id BABC81EC04E0;
 Mon,  8 Nov 2021 11:12:09 +0100 (CET)
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
X-Inumbo-ID: 55cb7bd2-407c-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1636366329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=grdSLe+txR+qPcky5ijEGsjPCSkRE9m2uQKOXesimzE=;
	b=OveTWrDzAdrOoSEwa1Av97jBWR5pZb8d7IM/QcE2Bm0tLy+LKZctYgVNu/8HPp+khPKy8S
	fBJxFCpTfhDSa0lqOVDygpDhEY+AGd64/coDHahUOeAP4LgJ5PPdM1pvgt1eBYUTFfAiTM
	J8ofTFwzerbk/CRlwmeCnSLXSqeLzqY=
From: Borislav Petkov <bp@alien8.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: xen-devel@lists.xenproject.org
Subject: [PATCH v0 02/42] xen/x86: Check notifier registration return value
Date: Mon,  8 Nov 2021 11:11:17 +0100
Message-Id: <20211108101157.15189-3-bp@alien8.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211108101157.15189-1-bp@alien8.de>
References: <20211108101157.15189-1-bp@alien8.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Borislav Petkov <bp@suse.de>

Avoid homegrown notifier registration checks.

No functional changes.

Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: xen-devel@lists.xenproject.org
---
 arch/x86/xen/enlighten.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/xen/enlighten.c b/arch/x86/xen/enlighten.c
index 95d970359e17..2264dd6e157f 100644
--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -354,7 +354,9 @@ static struct notifier_block xen_panic_block = {
 
 int xen_panic_handler_init(void)
 {
-	atomic_notifier_chain_register(&panic_notifier_list, &xen_panic_block);
+	if (atomic_notifier_chain_register(&panic_notifier_list, &xen_panic_block))
+		pr_warn("Xen panic notifier already registered\n");
+
 	return 0;
 }
 
-- 
2.29.2


