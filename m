Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F34759C3F65
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 14:12:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833735.1248980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUDG-0000Ws-4U; Mon, 11 Nov 2024 13:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833735.1248980; Mon, 11 Nov 2024 13:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUDF-0000Oh-Rk; Mon, 11 Nov 2024 13:12:13 +0000
Received: by outflank-mailman (input) for mailman id 833735;
 Mon, 11 Nov 2024 13:12:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=//j0=SG=amazon.co.uk=prvs=038d26d0c=eliasely@srs-se1.protection.inumbo.net>)
 id 1tAUDE-0007pD-96
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 13:12:12 +0000
Received: from smtp-fw-33001.amazon.com (smtp-fw-33001.amazon.com
 [207.171.190.10]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d1fe1ea-a02e-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 14:12:08 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
 by smtp-border-fw-33001.sea14.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 13:12:00 +0000
Received: from EX19MTAUEA001.ant.amazon.com [10.0.44.209:4702]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.85.229:2525]
 with esmtp (Farcaster)
 id a64a81fb-2563-46ac-9016-d1f545eb7031; Mon, 11 Nov 2024 13:11:59 +0000 (UTC)
Received: from EX19D008UEA004.ant.amazon.com (10.252.134.191) by
 EX19MTAUEA001.ant.amazon.com (10.252.134.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 11 Nov 2024 13:11:59 +0000
Received: from EX19MTAUEC002.ant.amazon.com (10.252.135.146) by
 EX19D008UEA004.ant.amazon.com (10.252.134.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 11 Nov 2024 13:11:59 +0000
Received: from email-imr-corp-prod-pdx-all-2b-5ec155c2.us-west-2.amazon.com
 (10.124.125.6) by mail-relay.amazon.com (10.252.135.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Mon, 11 Nov 2024 13:11:59 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com [10.253.91.118])
 by email-imr-corp-prod-pdx-all-2b-5ec155c2.us-west-2.amazon.com (Postfix) with
 ESMTPS id 665A142116; Mon, 11 Nov 2024 13:11:57 +0000 (UTC)
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
X-Inumbo-ID: 8d1fe1ea-a02e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIwNy4xNzEuMTkwLjEwIiwiaGVsbyI6InNtdHAtZnctMzMwMDEuYW1hem9uLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjhkMWZlMWVhLWEwMmUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzMwNzI4LjY5MTMxNSwic2VuZGVyIjoicHJ2cz0wMzhkMjZkMGM9ZWxpYXNlbHlAYW1hem9uLmNvLnVrIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1731330728; x=1762866728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9JuGWs6fDafa679IQLfBxMLC3PVcKWY9gwc068/7Y64=;
  b=I6D66n9ZaQPTQa1Le6dsW1DlKKnYkIkCvLf9rDHsMpfulgZ0G283DbU7
   Lor3mJjlpZGgwOVm0WCuVmJUklHIJHltgzDaNEVfqZdaQpttN/tDxOLLE
   7e/SE6Tf+TC+tEwAvy4Fm1sLc4wTtCVsfP0zdfD1FWzlc/RtT5Sp0zeZk
   A=;
X-IronPort-AV: E=Sophos;i="6.12,145,1728950400"; 
   d="scan'208";a="384186337"
X-Farcaster-Flow-ID: a64a81fb-2563-46ac-9016-d1f545eb7031
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Wei Liu
	<wei.liu2@citrix.com>, Wei Wang <wawei@amazon.de>, Julien Grall
	<jgrall@amazon.com>, Elias El Yandouzi <eliasely@amazon.com>
Subject: [PATCH V4 02/15] x86/pv: Use copy_domain_page() to manage domheap pages during initrd relocation
Date: Mon, 11 Nov 2024 13:11:35 +0000
Message-ID: <20241111131148.52568-3-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241111131148.52568-1-eliasely@amazon.com>
References: <20241111131148.52568-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Wei Liu <wei.liu2@citrix.com>

Replace the manual copying logic with a call to `copy_domain_page()`
while relocating intird which map and unmap pages accordingly.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Wei Wang <wawei@amazon.de>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

----
    Changes in V4:
        * Use the count of pages instead of calculating from order for nr_pages initialization

    Changes in V3:
        * Rename commit title
        * Rework the for loop copying the pages

    Changes in V2:
        * Get rid of mfn_to_virt
        * Don't open code copy_domain_page()

    Changes since Hongyan's version:
        * Add missing newline after the variable declaration

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index cc882bee61c3..18b7a3e4e025 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -618,18 +618,24 @@ static int __init dom0_construct(struct domain *d,
         if ( d->arch.physaddr_bitsize &&
              ((mfn + count - 1) >> (d->arch.physaddr_bitsize - PAGE_SHIFT)) )
         {
+            unsigned int nr_pages = count;
+
             order = get_order_from_pages(count);
             page = alloc_domheap_pages(d, order, MEMF_no_scrub);
             if ( !page )
                 panic("Not enough RAM for domain 0 initrd\n");
+
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
+            for ( ; nr_pages-- ; page++, mfn++ )
+                copy_domain_page(page_to_mfn(page), _mfn(mfn));
+
             mpt_alloc = (paddr_t)initrd->mod_start << PAGE_SHIFT;
             init_domheap_pages(mpt_alloc,
                                mpt_alloc + PAGE_ALIGN(initrd_len));
-- 
2.40.1


