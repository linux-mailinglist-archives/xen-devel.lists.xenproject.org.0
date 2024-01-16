Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD43B82F4C9
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 20:00:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667994.1039794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPofa-0002R2-W9; Tue, 16 Jan 2024 19:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667994.1039794; Tue, 16 Jan 2024 19:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPofa-0002P1-TV; Tue, 16 Jan 2024 19:00:18 +0000
Received: by outflank-mailman (input) for mailman id 667994;
 Tue, 16 Jan 2024 19:00:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPoXs-0003xp-Vl
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 18:52:20 +0000
Received: from smtp-fw-9105.amazon.com (smtp-fw-9105.amazon.com
 [207.171.188.204]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fa1380c-b4a0-11ee-9b0f-b553b5be7939;
 Tue, 16 Jan 2024 19:52:19 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1e-m6i4x-0aba4706.us-east-1.amazon.com)
 ([10.25.36.210]) by smtp-border-fw-9105.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 18:52:10 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (iad7-ws-svc-p70-lb3-vlan2.iad.amazon.com [10.32.235.34])
 by email-inbound-relay-iad-1e-m6i4x-0aba4706.us-east-1.amazon.com (Postfix)
 with ESMTPS id 2DEFEA0ED5; Tue, 16 Jan 2024 18:52:06 +0000 (UTC)
Received: from EX19MTAUEA001.ant.amazon.com [10.0.44.209:36830]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.15.248:2525]
 with esmtp (Farcaster)
 id a7f91975-ed87-4dde-a05c-1a70ef0afa42; Tue, 16 Jan 2024 18:52:05 +0000 (UTC)
Received: from EX19D008UEC004.ant.amazon.com (10.252.135.170) by
 EX19MTAUEA001.ant.amazon.com (10.252.134.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 18:51:52 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEC004.ant.amazon.com (10.252.135.170) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 18:51:51 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 18:51:50 +0000
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
X-Inumbo-ID: 5fa1380c-b4a0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705431140; x=1736967140;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fLyAFvpkS62mZ58f/yx9ju+/jVeXxTTvsO8RqlfEYZw=;
  b=QTpoe6W2OZiIoMiNje46trYp40E/V05Tewo7T9/+cPsmEz1S4PZNxbYd
   ddaJGJoXVI2091nkxhrLHl24U+jMgjpI61ZnEF8LLlOtkpbEOykJBavG3
   8sum3lHRfkmUywMx06JyUuZFwyE4a4Yw1NmOD/PluVQtpC87+s/+U0SWD
   0=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="698182045"
X-Farcaster-Flow-ID: a7f91975-ed87-4dde-a05c-1a70ef0afa42
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Elias El Yandouzi
	<eliasely@amazon.com>
Subject: [PATCH v2] x86/pv: Map L4 page table for shim domain
Date: Tue, 16 Jan 2024 18:50:39 +0000
Message-ID: <20240116185056.15000-11-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116185056.15000-1-eliasely@amazon.com>
References: <20240116185056.15000-1-eliasely@amazon.com>
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


