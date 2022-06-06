Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C42F53E0A0
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 07:08:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342375.567465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny4x8-0002uH-EZ; Mon, 06 Jun 2022 05:06:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342375.567465; Mon, 06 Jun 2022 05:06:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny4x8-0002qt-BE; Mon, 06 Jun 2022 05:06:58 +0000
Received: by outflank-mailman (input) for mailman id 342375;
 Mon, 06 Jun 2022 05:00:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+HWk=WN=kernel.org=masahiroy@srs-se1.protection.inumbo.net>)
 id 1ny4qx-0002fn-OO
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 05:00:36 +0000
Received: from conuserg-12.nifty.com (conuserg-12.nifty.com [210.131.2.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 948d2711-e555-11ec-b605-df0040e90b76;
 Mon, 06 Jun 2022 07:00:30 +0200 (CEST)
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp
 [133.32.177.133]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id 2564xNUT024943;
 Mon, 6 Jun 2022 13:59:23 +0900
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
X-Inumbo-ID: 948d2711-e555-11ec-b605-df0040e90b76
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 2564xNUT024943
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1654491564;
	bh=02SaZmEKBPMSF76nbpCPhuGFilCILCVnozQUdrfNE4A=;
	h=From:To:Cc:Subject:Date:From;
	b=RkkHLUjqmtVqOahyc+gud1UArOBglFYPpJZgVzg8bXRPULtWmrJ+kliGNUKHHtDny
	 JiWmrEm1pKeMQhx2JCtK9wQffux2NWWrU2BsRIZYg4fVi8QAJBz/YpNdoCzKKf7LoC
	 vlI95bU/MbYRII7rJ4vFT9VnOmGsvYvVjmfBi67GMgy6q/HMo/eJE1mr/Cp8Ciqoyv
	 0YxSF9sCrBzJ/Pj0oh9NLLnSXjg/VriRCI5ccSBEb2gDb7aiUlEeceQTnmO3Sunl3e
	 3lE9jXK7ywjcnYJylguEOjMYY88BLGf0e+gIJPOolZo3FUDfdRnG2wpAtAxSG0/lgj
	 ONhdPeLT6l+rg==
X-Nifty-SrcIP: [133.32.177.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        xen-devel@lists.xenproject.org (moderated for non-subscribers)
Cc: Masahiro Yamada <masahiroy@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Julien Grall <julien.grall@arm.com>,
        Shannon Zhao <shannon.zhao@linaro.org>, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org
Subject: [PATCH] xen: unexport __init-annotated xen_xlate_map_ballooned_pages()
Date: Mon,  6 Jun 2022 13:59:20 +0900
Message-Id: <20220606045920.4161881-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

EXPORT_SYMBOL and __init is a bad combination because the .init.text
section is freed up after the initialization. Hence, modules cannot
use symbols annotated __init. The access to a freed symbol may end up
with kernel panic.

modpost used to detect it, but it has been broken for a decade.

Recently, I fixed modpost so it started to warn it again, then this
showed up in linux-next builds.

There are two ways to fix it:

  - Remove __init
  - Remove EXPORT_SYMBOL

I chose the latter for this case because none of the in-tree call-sites
(arch/arm/xen/enlighten.c, arch/x86/xen/grant-table.c) is compiled as
modular.

Fixes: 243848fc018c ("xen/grant-table: Move xlated_setup_gnttab_pages to common place")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 drivers/xen/xlate_mmu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/xen/xlate_mmu.c b/drivers/xen/xlate_mmu.c
index 34742c6e189e..f17c4c03db30 100644
--- a/drivers/xen/xlate_mmu.c
+++ b/drivers/xen/xlate_mmu.c
@@ -261,7 +261,6 @@ int __init xen_xlate_map_ballooned_pages(xen_pfn_t **gfns, void **virt,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(xen_xlate_map_ballooned_pages);
 
 struct remap_pfn {
 	struct mm_struct *mm;
-- 
2.32.0


