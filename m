Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C140082F548
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 20:26:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668082.1040001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp51-00042L-Lj; Tue, 16 Jan 2024 19:26:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668082.1040001; Tue, 16 Jan 2024 19:26:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp51-0003vB-Fv; Tue, 16 Jan 2024 19:26:35 +0000
Received: by outflank-mailman (input) for mailman id 668082;
 Tue, 16 Jan 2024 19:26:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPp50-0003Xv-B2
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 19:26:34 +0000
Received: from smtp-fw-52005.amazon.com (smtp-fw-52005.amazon.com
 [52.119.213.156]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27f17ebe-b4a5-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 20:26:33 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1a-m6i4x-edda28d4.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-52005.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 19:26:32 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (iad7-ws-svc-p70-lb3-vlan3.iad.amazon.com [10.32.235.38])
 by email-inbound-relay-iad-1a-m6i4x-edda28d4.us-east-1.amazon.com (Postfix)
 with ESMTPS id E945E8054B; Tue, 16 Jan 2024 19:26:30 +0000 (UTC)
Received: from EX19MTAUEC002.ant.amazon.com [10.0.0.204:41793]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.95.118:2525]
 with esmtp (Farcaster)
 id 0048df5a-a8a5-4bf0-b47e-14349dd2b900; Tue, 16 Jan 2024 19:26:30 +0000 (UTC)
Received: from EX19D008UEA004.ant.amazon.com (10.252.134.191) by
 EX19MTAUEC002.ant.amazon.com (10.252.135.253) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:28 +0000
Received: from EX19MTAUEB001.ant.amazon.com (10.252.135.35) by
 EX19D008UEA004.ant.amazon.com (10.252.134.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:28 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.252.135.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 19:26:27 +0000
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
X-Inumbo-ID: 27f17ebe-b4a5-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705433193; x=1736969193;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fLyAFvpkS62mZ58f/yx9ju+/jVeXxTTvsO8RqlfEYZw=;
  b=O3Ir0SQYYqAaDqPjAZqr0BkVPlOZ7kl8wt79mIBfXuxBwmnYALJO7DFt
   JUz4AkNkoCpYcnDNDXPxh0FtSPIkVn9B2gc3LzfjLYo5Y6Haj1fxQhph6
   xadChpELoWUpo1JVJFwGZHmpzu+6hwdv0BOJCGAASWdGhI7dUrKRuY850
   E=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="627983561"
X-Farcaster-Flow-ID: 0048df5a-a8a5-4bf0-b47e-14349dd2b900
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Elias El Yandouzi
	<eliasely@amazon.com>
Subject: [PATCH v2 (resend) 10/27] x86/pv: Map L4 page table for shim domain
Date: Tue, 16 Jan 2024 19:25:54 +0000
Message-ID: <20240116192611.41112-11-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116192611.41112-1-eliasely@amazon.com>
References: <20240116192611.41112-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

From: Hongyan Xia <hongyxia@amazon.com>

The root page table is allocated from the domheap and isn't
mapped by default. Map it on demand to build pv shim domain.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

----

    Changes in v2:
        * New patch

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index dc5e9fe117..fc51c7d362 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -991,8 +991,12 @@ do {                                                    \
      * !CONFIG_VIDEO case so the logic here can be simplified.
      */
     if ( pv_shim )
+    {
+        l4start = map_domain_page(l4start_mfn);
         pv_shim_setup_dom(d, l4start, v_start, vxenstore_start, vconsole_start,
                           vphysmap_start, si);
+        UNMAP_DOMAIN_PAGE(l4start);
+    }
 
 #ifdef CONFIG_COMPAT
     if ( compat )
-- 
2.40.1


