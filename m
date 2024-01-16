Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B87E182F4A8
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 19:52:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667959.1039739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPoXh-00059U-OU; Tue, 16 Jan 2024 18:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667959.1039739; Tue, 16 Jan 2024 18:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPoXh-00054t-JA; Tue, 16 Jan 2024 18:52:09 +0000
Received: by outflank-mailman (input) for mailman id 667959;
 Tue, 16 Jan 2024 18:52:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPoXg-0003xp-8o
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 18:52:08 +0000
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 576802b9-b4a0-11ee-9b0f-b553b5be7939;
 Tue, 16 Jan 2024 19:52:06 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1e-m6i4x-6e7a78d7.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-6001.iad6.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 18:52:04 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (iad7-ws-svc-p70-lb3-vlan2.iad.amazon.com [10.32.235.34])
 by email-inbound-relay-iad-1e-m6i4x-6e7a78d7.us-east-1.amazon.com (Postfix)
 with ESMTPS id 69D548032A; Tue, 16 Jan 2024 18:52:01 +0000 (UTC)
Received: from EX19MTAUEC002.ant.amazon.com [10.0.29.78:64506]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.41.129:2525]
 with esmtp (Farcaster)
 id 0523bf02-f540-4504-a5f3-c1a71d2bc9a0; Tue, 16 Jan 2024 18:52:01 +0000 (UTC)
Received: from EX19D008UEA001.ant.amazon.com (10.252.134.62) by
 EX19MTAUEC002.ant.amazon.com (10.252.135.253) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 18:51:48 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEA001.ant.amazon.com (10.252.134.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 18:51:47 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 18:51:45 +0000
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
X-Inumbo-ID: 576802b9-b4a0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705431127; x=1736967127;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HW3epajLPcDlyqLezVIUXLccUhl0qCm2Of6jKKbyr0s=;
  b=uXWP1fmKZakX5PidKv4MZXq53fhzXeMwZk8JYTKVvkzfDgQjC4o+YHel
   nASO1jwSZLjRBZ2l3rGhCFrzs/XNZ1HRE7sIQ0HJMQcy71bo6U2wW26hw
   bzm94HPVnfHwRElarRZTus3AnARrBr8MilJzS8kDSrFXtwhJhS5jgJ6Qp
   0=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="382569709"
X-Farcaster-Flow-ID: 0523bf02-f540-4504-a5f3-c1a71d2bc9a0
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Wei Liu
	<wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Wei Wang <wawei@amazon.de>,
	Julien Grall <jgrall@amazon.com>, Elias El Yandouzi <eliasely@amazon.com>
Subject: [PATCH v2] x86/pv: Domheap pages should be mapped while relocating initrd
Date: Tue, 16 Jan 2024 18:50:37 +0000
Message-ID: <20240116185056.15000-9-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116185056.15000-1-eliasely@amazon.com>
References: <20240116185056.15000-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

From: Wei Liu <wei.liu2@citrix.com>

Xen shouldn't use domheap page as if they were xenheap pages. Map and
unmap pages accordingly.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Wei Wang <wawei@amazon.de>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

----

    Changes in V2:
        * Get rid of mfn_to_virt
        * Don't open code copy_domain_page()

    Changes since Hongyan's version:
        * Add missing newline after the variable declaration

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 5bbed3a36a..5659814e0c 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -615,18 +615,25 @@ int __init dom0_construct_pv(struct domain *d,
         if ( d->arch.physaddr_bitsize &&
              ((mfn + count - 1) >> (d->arch.physaddr_bitsize - PAGE_SHIFT)) )
         {
+            unsigned long nr_pages;
+
             order = get_order_from_pages(count);
             page = alloc_domheap_pages(d, order, MEMF_no_scrub);
             if ( !page )
                 panic("Not enough RAM for domain 0 initrd\n");
+
+            nr_pages = 1UL << order;
             for ( count = -count; order--; )
                 if ( count & (1UL << order) )
                 {
                     free_domheap_pages(page, order);
                     page += 1UL << order;
+                    nr_pages -= 1UL << order;
                 }
-            memcpy(page_to_virt(page), mfn_to_virt(initrd->mod_start),
-                   initrd_len);
+
+            for ( i = 0; i < nr_pages; i++ )
+                copy_domain_page(page_to_mfn(page + i), _mfn(initrd_mfn + i));
+
             mpt_alloc = (paddr_t)initrd->mod_start << PAGE_SHIFT;
             init_domheap_pages(mpt_alloc,
                                mpt_alloc + PAGE_ALIGN(initrd_len));
-- 
2.40.1


