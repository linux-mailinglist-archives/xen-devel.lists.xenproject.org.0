Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C038C3F7B
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 13:12:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720805.1123735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Tao-0003Po-R6; Mon, 13 May 2024 11:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720805.1123735; Mon, 13 May 2024 11:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Tao-0003Mq-O5; Mon, 13 May 2024 11:11:42 +0000
Received: by outflank-mailman (input) for mailman id 720805;
 Mon, 13 May 2024 11:11:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2Lj=MQ=amazon.co.uk=prvs=8568adbc3=eliasely@srs-se1.protection.inumbo.net>)
 id 1s6Tan-0003MC-MB
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 11:11:41 +0000
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91fc7d4b-1119-11ef-909d-e314d9c70b13;
 Mon, 13 May 2024 13:11:40 +0200 (CEST)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.6])
 by smtp-border-fw-6002.iad6.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 11:11:38 +0000
Received: from EX19MTAUEB001.ant.amazon.com [10.0.44.209:11740]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.83.223:2525]
 with esmtp (Farcaster)
 id 420086cb-3f7c-44b0-a1f7-b23bc039bef8; Mon, 13 May 2024 11:11:37 +0000 (UTC)
Received: from EX19D008UEA001.ant.amazon.com (10.252.134.62) by
 EX19MTAUEB001.ant.amazon.com (10.252.135.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 11:11:33 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEA001.ant.amazon.com (10.252.134.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 11:11:33 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Mon, 13 May 2024 11:11:31 +0000
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
X-Inumbo-ID: 91fc7d4b-1119-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715598701; x=1747134701;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X8yfiUTton8c3NyUnbJj3YCfUh5a4EGoBhji2snIQBs=;
  b=rXKyaAgV1lvh63QuvEmKSNGg4+BmWl+/lllqKr0xgmXxbz3CAhP9LftO
   yGblmu4J4nZ6iTYP9ji5iug3plCzXcaL4c25mPFHzQKL7eVfDoI1w6zat
   wy2cUlo0VpdSv9QeVg84I+20RtAZDqJtgAGyU14KBaZ4G/orarAjm0+/2
   I=;
X-IronPort-AV: E=Sophos;i="6.08,158,1712620800"; 
   d="scan'208";a="406374361"
X-Farcaster-Flow-ID: 420086cb-3f7c-44b0-a1f7-b23bc039bef8
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Wei Liu
	<wei.liu2@citrix.com>, Wei Wang <wawei@amazon.de>, Julien Grall
	<jgrall@amazon.com>, Elias El Yandouzi <eliasely@amazon.com>
Subject: [PATCH V3 02/19] x86/pv: Domheap pages should be mapped while relocating initrd
Date: Mon, 13 May 2024 11:11:00 +0000
Message-ID: <20240513111117.68828-3-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240513111117.68828-1-eliasely@amazon.com>
References: <20240513111117.68828-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Wei Liu <wei.liu2@citrix.com>

Xen shouldn't use domheap page as if they were xenheap pages. Map and
unmap pages accordingly.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Wei Wang <wawei@amazon.de>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

----
    Changes in V3:
        * Rename commit title
        * Rework the for loop copying the pages

    Changes in V2:
        * Get rid of mfn_to_virt
        * Don't open code copy_domain_page()

    Changes since Hongyan's version:
        * Add missing newline after the variable declaration

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index d8043fa58a..807296c280 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -618,18 +618,24 @@ int __init dom0_construct_pv(struct domain *d,
         if ( d->arch.physaddr_bitsize &&
              ((mfn + count - 1) >> (d->arch.physaddr_bitsize - PAGE_SHIFT)) )
         {
+            unsigned int nr_pages = 1UL << order;
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


