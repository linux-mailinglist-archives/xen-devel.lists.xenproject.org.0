Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1817782F4B0
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 19:52:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667966.1039784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPoXs-00079B-46; Tue, 16 Jan 2024 18:52:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667966.1039784; Tue, 16 Jan 2024 18:52:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPoXs-00076N-08; Tue, 16 Jan 2024 18:52:20 +0000
Received: by outflank-mailman (input) for mailman id 667966;
 Tue, 16 Jan 2024 18:52:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPoXq-0003xp-NR
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 18:52:18 +0000
Received: from smtp-fw-9105.amazon.com (smtp-fw-9105.amazon.com
 [207.171.188.204]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d845d05-b4a0-11ee-9b0f-b553b5be7939;
 Tue, 16 Jan 2024 19:52:16 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2b-m6i4x-a893d89c.us-west-2.amazon.com)
 ([10.25.36.210]) by smtp-border-fw-9105.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 18:52:11 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (pdx2-ws-svc-p26-lb5-vlan2.pdx.amazon.com [10.39.38.66])
 by email-inbound-relay-pdx-2b-m6i4x-a893d89c.us-west-2.amazon.com (Postfix)
 with ESMTPS id 38D4840D76; Tue, 16 Jan 2024 18:52:10 +0000 (UTC)
Received: from EX19MTAUEB002.ant.amazon.com [10.0.44.209:59869]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.57.22:2525]
 with esmtp (Farcaster)
 id b69868bd-f6ba-477d-852c-47807dd1cb29; Tue, 16 Jan 2024 18:52:09 +0000 (UTC)
Received: from EX19D008UEC004.ant.amazon.com (10.252.135.170) by
 EX19MTAUEB002.ant.amazon.com (10.252.135.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 18:52:05 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEC004.ant.amazon.com (10.252.135.170) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 18:52:05 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 18:52:03 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 5d845d05-b4a0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705431137; x=1736967137;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tb2fNfqN0eF/OdROl8BG6kceQk3KA1cAs0YAyUr8QAc=;
  b=BsKioGJPSe+yEEJ+2aHUPFVqFkZNhK8VOI7pByqG7X3+2bT1l+N9nz0Y
   MYie2gMtFVOL0lzJjnMIS8r72kKI30b4GEiqV6bOPUGosVLicKsjWtKCN
   ZOAc6zdJ+epvokQujYn0v4QszMKU/ZINzO8o4/DQrFWpM4nJpSL1R7ern
   A=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="698182050"
X-Farcaster-Flow-ID: b69868bd-f6ba-477d-852c-47807dd1cb29
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, "Elias El
 Yandouzi" <eliasely@amazon.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2] xen/x86: Add build assertion for fixmap entries
Date: Tue, 16 Jan 2024 18:50:45 +0000
Message-ID: <20240116185056.15000-17-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116185056.15000-1-eliasely@amazon.com>
References: <20240116185056.15000-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

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


