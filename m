Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BA964EADA
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 12:49:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464430.722869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69D9-0004sG-Gg; Fri, 16 Dec 2022 11:49:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464430.722869; Fri, 16 Dec 2022 11:49:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69D9-0004nY-A2; Fri, 16 Dec 2022 11:49:07 +0000
Received: by outflank-mailman (input) for mailman id 464430;
 Fri, 16 Dec 2022 11:49:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p69D7-0004Mt-6w
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 11:49:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69D7-0002E2-0I; Fri, 16 Dec 2022 11:49:05 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69D6-0004sN-P3; Fri, 16 Dec 2022 11:49:04 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=5oXMYhVrHa49EzlJyprSVvBAT8KPYfOFRwrMrA+Sn68=; b=cozlDAIvwTjD7N7KnGv9QUb1tK
	RwpSbCKYNRGaLSAwm1RH81K6v1OQRWDNz50vS5jiFMSZ7gaBC4IJSX72+xq8eQSN74nGX7o4FXLis
	vgi2fp7BbNeQO032Dw7wgX1vazlY4k215QZO1/kmKWTxmVfNhSW5Q2afmlqeB49atO/8=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Hongyan Xia <hongyxia@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH 05/22] x86/srat: vmap the pages for acpi_slit
Date: Fri, 16 Dec 2022 11:48:36 +0000
Message-Id: <20221216114853.8227-6-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216114853.8227-1-julien@xen.org>
References: <20221216114853.8227-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongyan Xia <hongyxia@amazon.com>

This avoids the assumption that boot pages are in the direct map.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

----

    Changes since Hongyan's version:
        * vmap_boot_pages() was renamed to vmap_contig_pages()
---
 xen/arch/x86/srat.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 56749ddca526..1fd178e89d28 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -139,7 +139,8 @@ void __init acpi_numa_slit_init(struct acpi_table_slit *slit)
 		return;
 	}
 	mfn = alloc_boot_pages(PFN_UP(slit->header.length), 1);
-	acpi_slit = mfn_to_virt(mfn_x(mfn));
+	acpi_slit = vmap_contig_pages(mfn, PFN_UP(slit->header.length));
+	BUG_ON(!acpi_slit);
 	memcpy(acpi_slit, slit, slit->header.length);
 }
 
-- 
2.38.1


