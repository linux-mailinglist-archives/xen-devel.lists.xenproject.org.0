Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDF38C3FC3
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 13:22:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720864.1123895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Tl4-0005Zp-W7; Mon, 13 May 2024 11:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720864.1123895; Mon, 13 May 2024 11:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Tl4-0005Xm-TF; Mon, 13 May 2024 11:22:18 +0000
Received: by outflank-mailman (input) for mailman id 720864;
 Mon, 13 May 2024 11:22:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2Lj=MQ=amazon.co.uk=prvs=8568adbc3=eliasely@srs-se1.protection.inumbo.net>)
 id 1s6TbE-0003MC-BJ
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 11:12:08 +0000
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com
 [99.78.197.218]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1e76c72-1119-11ef-909d-e314d9c70b13;
 Mon, 13 May 2024 13:12:06 +0200 (CEST)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
 by smtp-border-fw-80007.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 11:11:45 +0000
Received: from EX19MTAUEC001.ant.amazon.com [10.0.0.204:26712]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.61.78:2525]
 with esmtp (Farcaster)
 id f0ad0804-eb5e-41e5-af36-c86e6fab8dc7; Mon, 13 May 2024 11:11:45 +0000 (UTC)
Received: from EX19D008UEA004.ant.amazon.com (10.252.134.191) by
 EX19MTAUEC001.ant.amazon.com (10.252.135.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 11:11:43 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEA004.ant.amazon.com (10.252.134.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 11:11:43 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Mon, 13 May 2024 11:11:42 +0000
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
X-Inumbo-ID: a1e76c72-1119-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715598726; x=1747134726;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tb2fNfqN0eF/OdROl8BG6kceQk3KA1cAs0YAyUr8QAc=;
  b=Rfk0Z7QxZggpW5NqHdMQHN2oBmN61CUtCK9tg4A+hd6v+dWfCF6w8XZT
   hpTDHwEPWccFzOgYZH/iixgcv4U+xK8suMDUHCN+UYOMKdPr2EOFi00qV
   MpQpB+5X2NER53oF1GWwJbzpSA1Fj32J1JFOQW9bRsnAA7FnLW2KN8fV/
   A=;
X-IronPort-AV: E=Sophos;i="6.08,158,1712620800"; 
   d="scan'208";a="295769747"
X-Farcaster-Flow-ID: f0ad0804-eb5e-41e5-af36-c86e6fab8dc7
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, "Elias El
 Yandouzi" <eliasely@amazon.com>
Subject: [PATCH V3 08/19] xen/x86: Add build assertion for fixmap entries
Date: Mon, 13 May 2024 11:11:06 +0000
Message-ID: <20240513111117.68828-9-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240513111117.68828-1-eliasely@amazon.com>
References: <20240513111117.68828-1-eliasely@amazon.com>
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


