Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C68A82F5A8
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 20:42:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668179.1040214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPpJp-0001Du-KB; Tue, 16 Jan 2024 19:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668179.1040214; Tue, 16 Jan 2024 19:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPpJp-0001CD-HS; Tue, 16 Jan 2024 19:41:53 +0000
Received: by outflank-mailman (input) for mailman id 668179;
 Tue, 16 Jan 2024 19:41:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPp57-0003Xv-Qz
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 19:26:41 +0000
Received: from smtp-fw-52004.amazon.com (smtp-fw-52004.amazon.com
 [52.119.213.154]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bb49f52-b4a5-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 20:26:40 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2c-m6i4x-8c5b1df3.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-52004.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 19:26:39 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (pdx2-ws-svc-p26-lb5-vlan3.pdx.amazon.com [10.39.38.70])
 by email-inbound-relay-pdx-2c-m6i4x-8c5b1df3.us-west-2.amazon.com (Postfix)
 with ESMTPS id 348DA40DAA; Tue, 16 Jan 2024 19:26:37 +0000 (UTC)
Received: from EX19MTAUEC001.ant.amazon.com [10.0.0.204:53301]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.15.248:2525]
 with esmtp (Farcaster)
 id 5e670533-2f6c-4336-8d86-c15826d81933; Tue, 16 Jan 2024 19:26:36 +0000 (UTC)
Received: from EX19D008UEC004.ant.amazon.com (10.252.135.170) by
 EX19MTAUEC001.ant.amazon.com (10.252.135.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:35 +0000
Received: from EX19MTAUEB001.ant.amazon.com (10.252.135.35) by
 EX19D008UEC004.ant.amazon.com (10.252.135.170) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:35 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.252.135.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 19:26:34 +0000
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
X-Inumbo-ID: 2bb49f52-b4a5-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705433201; x=1736969201;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tb2fNfqN0eF/OdROl8BG6kceQk3KA1cAs0YAyUr8QAc=;
  b=N0qDNj7xJPr7zenQX6jYFU+05C3mdhtFfH8uasW1C5Q4MtCBvsJHUIAT
   ZLdTOwuR4XHI9tazy27fNwfT/nwePOV6pc75r8dZ+1TFzuo5qMoCnBK7h
   NLYT2GrFUZgLalHTVq5j/PfTikk63Qs2Dx9ee1nQRbGAMLArZycCtsNYs
   8=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="178399480"
X-Farcaster-Flow-ID: 5e670533-2f6c-4336-8d86-c15826d81933
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, "Elias El
 Yandouzi" <eliasely@amazon.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 (resend) 16/27] xen/x86: Add build assertion for fixmap entries
Date: Tue, 16 Jan 2024 19:26:00 +0000
Message-ID: <20240116192611.41112-17-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116192611.41112-1-eliasely@amazon.com>
References: <20240116192611.41112-1-eliasely@amazon.com>
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


