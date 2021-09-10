Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4A2405F44
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 00:13:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183589.331869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOSIF-0005GG-33; Thu, 09 Sep 2021 22:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183589.331869; Thu, 09 Sep 2021 22:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOSIE-0005DQ-VM; Thu, 09 Sep 2021 22:13:14 +0000
Received: by outflank-mailman (input) for mailman id 183589;
 Thu, 09 Sep 2021 22:13:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mNcr=N7=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mOSID-0004ti-HH
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 22:13:13 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ed835e6-11bb-11ec-b1fd-12813bfff9fa;
 Thu, 09 Sep 2021 22:13:12 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 16312255518171022.0019350432905;
 Thu, 9 Sep 2021 15:12:31 -0700 (PDT)
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
X-Inumbo-ID: 1ed835e6-11bb-11ec-b1fd-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1631225555; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gMQYlJZzopPp8jK7IKyN8Yf0Kemzm4l+W4gkn1I4gndKwOv+TuSpZ37pzJ+W/KHwqB9euhqST+Y38zvCjFmC1msBWj9x/XAwql2uvgDADsUmXiJFnyXnpK7jVtKsNFKiCTi/Xgc+TM9MBqdbKcMv8lCNU8/RbKjd3cbzZWv/gII=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1631225555; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=gyz+bf9QEJJHVoMwH4co/BQLSlmGwar3N5lL6fpMtbE=; 
	b=FyuQltnzuom3bSYXCvcEHnY19ve3kdfgLmx65Ngi5EfbDNbtd91fklafrekLyXtFYkACw4Qyr14SXtsEjV9NBvY7Q0/0TdqujPRVYIuci58hsx0uEaPjx3RdK1IU3QUzLHa6biZWzgPUuvZ1NwjeDsZGXLMHQYuQbkIeeQts5Sg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1631225555;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=gyz+bf9QEJJHVoMwH4co/BQLSlmGwar3N5lL6fpMtbE=;
	b=HAsMQ1/vYzkGoGEJKY1MXVdMsTpghTWjjSGcLJnnvC+nBJNQ+Ar0Eb+GwiP+GCZk
	lP6ndHxuNA6vHAr1Gs31D9mXntRM62a22sQGq8VFkhgzJSceIi62u92LNqRF9F3dhWL
	Ayi+m+Q7wq04nziwGkkHT3Ac2GXMID7ZUxcX+uVw=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	xen-devel@lists.xenproject.org
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH v5 03/10] xsm: remove remnants of xsm_memtype hook
Date: Thu,  9 Sep 2021 22:12:28 -0400
Message-Id: <20210910021236.15082-4-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210910021236.15082-1-dpsmith@apertussolutions.com>
References: <20210910021236.15082-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

In c/s fcb8baddf00e the xsm_memtype hook was removed but some remnants were
left behind. This commit cleans up those remnants.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/include/xsm/xsm.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index ad3cddbf7d..335ba1b022 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -161,7 +161,6 @@ struct xsm_operations {
     int (*shadow_control) (struct domain *d, uint32_t op);
     int (*mem_sharing_op) (struct domain *d, struct domain *cd, int op);
     int (*apic) (struct domain *d, int cmd);
-    int (*memtype) (uint32_t access);
     int (*machine_memory_map) (void);
     int (*domain_memory_map) (struct domain *d);
 #define XSM_MMU_UPDATE_READ      1
@@ -632,11 +631,6 @@ static inline int xsm_apic (xsm_default_t def, struct domain *d, int cmd)
     return xsm_ops->apic(d, cmd);
 }
 
-static inline int xsm_memtype (xsm_default_t def, uint32_t access)
-{
-    return xsm_ops->memtype(access);
-}
-
 static inline int xsm_machine_memory_map(xsm_default_t def)
 {
     return xsm_ops->machine_memory_map();
-- 
2.20.1


