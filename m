Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FC31E5EA9
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 13:48:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeH14-00085V-Ss; Thu, 28 May 2020 11:48:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jtjf=7K=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jeH13-00085P-Vx
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 11:48:06 +0000
X-Inumbo-ID: 177a73d1-a0d9-11ea-a7b3-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 177a73d1-a0d9-11ea-a7b3-12813bfff9fa;
 Thu, 28 May 2020 11:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jYFHpVCBp2KPyT07SJt1PsTQ64YTGLrO0WCrYprMmDI=; b=6JuK3sKqeektckDMmR+apcdh9L
 QmAQZ6+XfRSWIERqkfJwMPqbDVdaVAAx+eF7BvizAW3uslTcSD9zivivQuZj7NaH3zh/ngYfH4RLZ
 ASry70kAj6fGqxMfapm8bqIIb3gN+woKh1dAtg+7p2HNMSZTvyfjchl6D5uFBk7zLM8A=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jeH12-000298-Kk; Thu, 28 May 2020 11:48:04 +0000
Received: from [54.239.6.188] (helo=CBG-R90WXYV0.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jeH12-0007xu-Aa; Thu, 28 May 2020 11:48:04 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] libxl: stop libxl_domain_info() consuming massive amounts of
 stack
Date: Thu, 28 May 2020 12:48:01 +0100
Message-Id: <20200528114801.20241-1-paul@xen.org>
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
---
 tools/libxl/libxl_domain.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/libxl/libxl_domain.c b/tools/libxl/libxl_domain.c
index fef2cd4e13..c07ec8fd3a 100644
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
 
+    info = libxl__calloc(gc, 1024, sizeof(*info));
+
     while ((ret = xc_domain_getinfolist(ctx->xch, domid, 1024, info)) > 0) {
         ptr = libxl__realloc(NOGC, ptr, (size + ret) * sizeof(libxl_dominfo));
         for (i = 0; i < ret; i++) {
-- 
2.17.1


