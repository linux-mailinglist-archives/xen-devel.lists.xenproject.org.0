Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 582278C4221
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 15:41:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720929.1124024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6VvZ-0004o9-3N; Mon, 13 May 2024 13:41:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720929.1124024; Mon, 13 May 2024 13:41:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6VvY-0004l2-Us; Mon, 13 May 2024 13:41:16 +0000
Received: by outflank-mailman (input) for mailman id 720929;
 Mon, 13 May 2024 13:41:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2Lj=MQ=amazon.co.uk=prvs=8568adbc3=eliasely@srs-se1.protection.inumbo.net>)
 id 1s6VvW-0002lY-G8
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 13:41:14 +0000
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7607bc47-112e-11ef-b4bb-af5377834399;
 Mon, 13 May 2024 15:41:12 +0200 (CEST)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.6])
 by smtp-border-fw-6002.iad6.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 13:41:10 +0000
Received: from EX19MTAUEB001.ant.amazon.com [10.0.29.78:59609]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.4.17:2525] with
 esmtp (Farcaster)
 id b0625eca-4095-429b-ae8c-57fb22cad0fb; Mon, 13 May 2024 13:41:09 +0000 (UTC)
Received: from EX19D008UEA001.ant.amazon.com (10.252.134.62) by
 EX19MTAUEB001.ant.amazon.com (10.252.135.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 13:41:08 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEA001.ant.amazon.com (10.252.134.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 13:41:07 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Mon, 13 May 2024 13:41:06 +0000
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
X-Inumbo-ID: 7607bc47-112e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715607673; x=1747143673;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tb2fNfqN0eF/OdROl8BG6kceQk3KA1cAs0YAyUr8QAc=;
  b=IObegGfxLKD8fddKWloBtG6mYxTR4BATPPEiPpqc0T8EhiOQ76oP2GIX
   XrRA1Ayh4dt/lVQ9j5fTRYbv54h0Na6E/j8zfl0dyXSfO9M4/0n5n8VtU
   SYV+5ZYwYNYpiSD28b7T78CKmFjDhdT8X6g3oA0Zu6epVeA0GcGUoLzxB
   I=;
X-IronPort-AV: E=Sophos;i="6.08,158,1712620800"; 
   d="scan'208";a="406401335"
X-Farcaster-Flow-ID: b0625eca-4095-429b-ae8c-57fb22cad0fb
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, "Elias El
 Yandouzi" <eliasely@amazon.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH V3 (resend) 08/19] xen/x86: Add build assertion for fixmap entries
Date: Mon, 13 May 2024 13:40:35 +0000
Message-ID: <20240513134046.82605-9-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240513134046.82605-1-eliasely@amazon.com>
References: <20240513134046.82605-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The early fixed addresses must all fit into the static L1 table.
Introduce a build assertion to this end.

Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

----

     Changes in v2:
         * New patch

diff --git a/xen/arch/x86/include/asm/fixmap.h b/xen/arch/x86/include/asm/fixmap.h
index a7ac365fc6..904bee0480 100644
--- a/xen/arch/x86/include/asm/fixmap.h
+++ b/xen/arch/x86/include/asm/fixmap.h
@@ -77,6 +77,11 @@ enum fixed_addresses {
 #define FIXADDR_SIZE  (__end_of_fixed_addresses << PAGE_SHIFT)
 #define FIXADDR_START (FIXADDR_TOP - FIXADDR_SIZE)
 
+static inline void fixaddr_build_assertion(void)
+{
+    BUILD_BUG_ON(FIX_PMAP_END > L1_PAGETABLE_ENTRIES - 1);
+}
+
 extern void __set_fixmap(
     enum fixed_addresses idx, unsigned long mfn, unsigned long flags);
 
-- 
2.40.1


