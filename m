Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E366882F547
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 20:26:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668083.1040013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp52-0004Of-W1; Tue, 16 Jan 2024 19:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668083.1040013; Tue, 16 Jan 2024 19:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp52-0004Jp-PK; Tue, 16 Jan 2024 19:26:36 +0000
Received: by outflank-mailman (input) for mailman id 668083;
 Tue, 16 Jan 2024 19:26:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPp51-0003Xv-5F
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 19:26:35 +0000
Received: from smtp-fw-33001.amazon.com (smtp-fw-33001.amazon.com
 [207.171.190.10]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27fc177c-b4a5-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 20:26:34 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2b-m6i4x-cadc3fbd.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-33001.sea14.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 19:26:26 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (pdx2-ws-svc-p26-lb5-vlan2.pdx.amazon.com [10.39.38.66])
 by email-inbound-relay-pdx-2b-m6i4x-cadc3fbd.us-west-2.amazon.com (Postfix)
 with ESMTPS id 653E0A0786; Tue, 16 Jan 2024 19:26:24 +0000 (UTC)
Received: from EX19MTAUEA002.ant.amazon.com [10.0.29.78:3848]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.41.129:2525]
 with esmtp (Farcaster)
 id f2469a8a-a9e5-458c-a299-f2be24413d76; Tue, 16 Jan 2024 19:26:24 +0000 (UTC)
Received: from EX19D008UEC004.ant.amazon.com (10.252.135.170) by
 EX19MTAUEA002.ant.amazon.com (10.252.134.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:23 +0000
Received: from EX19MTAUEB001.ant.amazon.com (10.252.135.35) by
 EX19D008UEC004.ant.amazon.com (10.252.135.170) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:23 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.252.135.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 19:26:22 +0000
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
X-Inumbo-ID: 27fc177c-b4a5-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705433194; x=1736969194;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0fmTmB+LBqRWLY5/DwT7016ODIBBvVRLjSKMws6FDOA=;
  b=POp82GfUbDdUSIH5x3gb2EEWALVUXCAbRcRJ21UT8KwWbs66r/fBF79L
   Er7/o2IFFOtE5fd8AI2ariNHKcMZqXAFuJOLJmkk/8Q8+ukwbX+wpk9Ge
   qcGqCyEaC1pza9GXQK29j7Xrx/ew6dzeotO6kIIYvbp0Nm5abX4OrVkzU
   0=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="321879755"
X-Farcaster-Flow-ID: f2469a8a-a9e5-458c-a299-f2be24413d76
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
	<jgrall@amazon.com>, Elias El Yandouzi <eliasely@amazon.com>
Subject: [PATCH v2 (resend) 06/27] x86/srat: vmap the pages for acpi_slit
Date: Tue, 16 Jan 2024 19:25:50 +0000
Message-ID: <20240116192611.41112-7-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116192611.41112-1-eliasely@amazon.com>
References: <20240116192611.41112-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

From: Hongyan Xia <hongyxia@amazon.com>

This avoids the assumption that boot pages are in the direct map.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

----

    There was a discussion with Jan regarding early failure vs
    disable NUMA. I am strongly in favor of the latter because
    it is more obvious that something went wrong.

    From my understanding, Jan seems to be in favor of turning off NUMA
    and then continue to boot. But then implied that a panic() would be
    fine.

    So I went with the panic() version. I am happy to rework it to another
    approach if there is a consensus.

    Changes in v2:
        * vmap_contig_pages() was renamed to vmap_contig()
        * Use a panic() rather than BUG_ON()

    Changes since Hongyan's version:
        * vmap_boot_pages() was renamed to vmap_contig_pages()

diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 3f70338e6e..688f410287 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -135,7 +135,9 @@ void __init acpi_numa_slit_init(struct acpi_table_slit *slit)
 		return;
 	}
 	mfn = alloc_boot_pages(PFN_UP(slit->header.length), 1);
-	acpi_slit = mfn_to_virt(mfn_x(mfn));
+	acpi_slit = vmap_contig(mfn, PFN_UP(slit->header.length));
+	if ( !acpi_slit )
+		panic("Unable to map the ACPI SLIT. Retry with numa=off");
 	memcpy(acpi_slit, slit, slit->header.length);
 }
 
-- 
2.40.1


