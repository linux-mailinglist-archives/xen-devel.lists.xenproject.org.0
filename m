Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 742451E6598
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 17:13:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeKDv-0001Yi-Qv; Thu, 28 May 2020 15:13:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jtjf=7K=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jeKDu-0001Yb-G8
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 15:13:34 +0000
X-Inumbo-ID: cc230362-a0f5-11ea-9947-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc230362-a0f5-11ea-9947-bc764e2007e4;
 Thu, 28 May 2020 15:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RWE7FsZRvo9h78tHiAsaTBasLYIAlxCJdGiu/keK7GI=; b=Kak50CIAlbQvjWF1B+0ze6GAkv
 ZK3o02xEA9tAEpBbeXcOstLtKvHpgGHSIBmPxh3/5GG9Cuaaexr3nGjlWO+tlTMas1C0uqwajDg4J
 dFEBHGecWwxoHf8qiFfRNm+NZS2Aci/80dDCDmGadvzg2KeaY2BwJmKxFW1P171yfwEg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jeKDt-0006VB-I4; Thu, 28 May 2020 15:13:33 +0000
Received: from [54.239.6.187] (helo=CBG-R90WXYV0.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jeKDt-0004v3-8D; Thu, 28 May 2020 15:13:33 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2] libxl: stop libxl_domain_info() consuming massive amounts
 of stack
Date: Thu, 28 May 2020 16:13:30 +0100
Message-Id: <20200528151330.20964-1-paul@xen.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

Currently an array of 1024 xc_domaininfo_t is declared on stack. That alone
consumes ~112k. Since libxl_domain_info() creates a new gc this patch simply
uses it to allocate the array instead.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>

This is small and IMO it would be nice to have this in 4.14 but I'd like an
opinion from a maintainer too.

v2:
 - Use GCNEW_ARRAY
---
 tools/libxl/libxl_domain.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/libxl/libxl_domain.c b/tools/libxl/libxl_domain.c
index fef2cd4e13..bb21087eb8 100644
--- a/tools/libxl/libxl_domain.c
+++ b/tools/libxl/libxl_domain.c
@@ -314,11 +314,13 @@ libxl_dominfo * libxl_list_domain(libxl_ctx *ctx, int *nb_domain_out)
 {
     libxl_dominfo *ptr = NULL;
     int i, ret;
-    xc_domaininfo_t info[1024];
+    xc_domaininfo_t *info;
     int size = 0;
     uint32_t domid = 0;
     GC_INIT(ctx);
 
+    GCNEW_ARRAY(info, 1024);
+
     while ((ret = xc_domain_getinfolist(ctx->xch, domid, 1024, info)) > 0) {
         ptr = libxl__realloc(NOGC, ptr, (size + ret) * sizeof(libxl_dominfo));
         for (i = 0; i < ret; i++) {
-- 
2.17.1


