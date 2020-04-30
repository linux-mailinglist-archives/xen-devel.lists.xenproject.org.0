Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FC51C0877
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 22:45:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUG38-0002pu-Lu; Thu, 30 Apr 2020 20:44:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fL57=6O=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jUG36-0002pi-Ro
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 20:44:48 +0000
X-Inumbo-ID: 6b9ad03e-8b23-11ea-9aaf-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b9ad03e-8b23-11ea-9aaf-12813bfff9fa;
 Thu, 30 Apr 2020 20:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lV7eCfKft8Va6m4uNBBmoRi9XzqEneVzvGHlaIMLHds=; b=uYUxtIHD8MR/+KYumRVW16F+UA
 YB51HnVj3v7KqMEsddmEI8nPi+vxoKYfqM+BP5L7PANMjASGaMa6pcOdFqqRuSwTQzI0binfimCJo
 /e3ehVqSE2MyPpxxG9Xb3oYsvTQxLj8r80tfxjgnhMVQWR8TIH54CDxjtes744lpQQtQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jUG31-0004LH-7y; Thu, 30 Apr 2020 20:44:43 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jUG30-0005wj-US; Thu, 30 Apr 2020 20:44:43 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 04/16] x86/srat: vmap the pages for acpi_slit
Date: Thu, 30 Apr 2020 21:44:13 +0100
Message-Id: <f4226fafcd333c0274fcee24601c280bf6494417.1588278317.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588278317.git.hongyxia@amazon.com>
References: <cover.1588278317.git.hongyxia@amazon.com>
In-Reply-To: <cover.1588278317.git.hongyxia@amazon.com>
References: <cover.1588278317.git.hongyxia@amazon.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Hongyan Xia <hongyxia@amazon.com>

This avoids the assumption that boot pages are in the direct map.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
---
 xen/arch/x86/srat.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 506a56d66b..9a84c6c8a8 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -196,7 +196,8 @@ void __init acpi_numa_slit_init(struct acpi_table_slit *slit)
 		return;
 	}
 	mfn = alloc_boot_pages(PFN_UP(slit->header.length), 1);
-	acpi_slit = mfn_to_virt(mfn_x(mfn));
+	acpi_slit = vmap_boot_pages(mfn, PFN_UP(slit->header.length));
+	BUG_ON(!acpi_slit);
 	memcpy(acpi_slit, slit, slit->header.length);
 }
 
-- 
2.24.1.AMZN


