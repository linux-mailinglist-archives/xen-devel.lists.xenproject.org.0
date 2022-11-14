Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0A6627CAA
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 12:45:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443323.697865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouXtC-0006ox-Ii; Mon, 14 Nov 2022 11:44:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443323.697865; Mon, 14 Nov 2022 11:44:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouXtC-0006m9-Ff; Mon, 14 Nov 2022 11:44:34 +0000
Received: by outflank-mailman (input) for mailman id 443323;
 Mon, 14 Nov 2022 11:44:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AJxV=3O=kernel.org=jirislaby@srs-se1.protection.inumbo.net>)
 id 1ouXtB-0006m3-15
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 11:44:33 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b40ad893-6411-11ed-8fd2-01056ac49cbb;
 Mon, 14 Nov 2022 12:44:31 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E97ACB80E78;
 Mon, 14 Nov 2022 11:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB5DEC43145;
 Mon, 14 Nov 2022 11:44:28 +0000 (UTC)
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
X-Inumbo-ID: b40ad893-6411-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668426270;
	bh=wui7Joclil/1Zhbm3X8SG6joq+UGvmdb9Y11/m4UBYk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oDcoRSsaEpF5qFmILR9P2mJ5a8lkQVqMz+gUsBuNicjhyBffTPM5tdA/mPGhAiGic
	 b5Wgy7NrKtO74lPiJPFz39XuitjuukIBpJcWmqcaBGCVEmSV9ucqUPWl6gUdl9BQXX
	 a+Ju58arWUNE9xg75AuU4gCyovLx/ItgDUgsr1wBwfbwhZkJPO/4/TJI+qMf2UmfoR
	 QlFdhFWt8ofWnNOWLzvO8u0t1IFU0YF853oowuhb98g1SDgmNnnzJ48rj2v1CL7+R8
	 AWDAd2XOz2ooKCMSPSbZwiKQ8kngNUK18qlmx+FMIcPKRaS9JrURlWmTDeKaFml2Z4
	 5lHZGRLILvEUA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andi Kleen <ak@linux.intel.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	Martin Liska <mliska@suse.cz>,
	Jiri Slaby <jslaby@suse.cz>
Subject: [PATCH 15/46] x86/xen, lto: Mark xen_vcpu_stolen() as __visible
Date: Mon, 14 Nov 2022 12:43:13 +0100
Message-Id: <20221114114344.18650-16-jirislaby@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221114114344.18650-1-jirislaby@kernel.org>
References: <20221114114344.18650-1-jirislaby@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andi Kleen <ak@linux.intel.com>

Symbols referenced from assembler (either directly or e.f. from
DEFINE_STATIC_KEY()) need to be global and visible in gcc LTO because
they could end up in a different object file than the assembler. This
can lead to linker errors without this patch.

So mark xen_vcpu_stolen() as __visible.

Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: <xen-devel@lists.xenproject.org>
Signed-off-by: Andi Kleen <ak@linux.intel.com>
Signed-off-by: Martin Liska <mliska@suse.cz>
Signed-off-by: Jiri Slaby <jslaby@suse.cz>
---
 drivers/xen/time.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/time.c b/drivers/xen/time.c
index 152dd33bb223..006a04592c8f 100644
--- a/drivers/xen/time.c
+++ b/drivers/xen/time.c
@@ -145,7 +145,7 @@ void xen_get_runstate_snapshot(struct vcpu_runstate_info *res)
 }
 
 /* return true when a vcpu could run but has no real cpu to run on */
-bool xen_vcpu_stolen(int vcpu)
+__visible bool xen_vcpu_stolen(int vcpu)
 {
 	return per_cpu(xen_runstate, vcpu).state == RUNSTATE_runnable;
 }
-- 
2.38.1


