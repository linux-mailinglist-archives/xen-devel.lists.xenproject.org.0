Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE7F4D1BD8
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 16:37:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287107.486931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRbtU-0003UX-1c; Tue, 08 Mar 2022 15:37:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287107.486931; Tue, 08 Mar 2022 15:37:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRbtT-0003ST-Tx; Tue, 08 Mar 2022 15:36:59 +0000
Received: by outflank-mailman (input) for mailman id 287107;
 Tue, 08 Mar 2022 15:36:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JMfM=TT=amazon.de=prvs=0590b4220=doebel@srs-se1.protection.inumbo.net>)
 id 1nRbtS-0003PK-2r
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 15:36:58 +0000
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com
 [207.171.184.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 955b8293-9ef5-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 16:36:56 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2b-28a78e3f.us-west-2.amazon.com) ([10.25.36.214])
 by smtp-border-fw-9102.sea19.amazon.com with ESMTP; 08 Mar 2022 15:36:40 +0000
Received: from EX13D03EUC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2b-28a78e3f.us-west-2.amazon.com (Postfix) with
 ESMTPS id F2B04A099C; Tue,  8 Mar 2022 15:36:39 +0000 (UTC)
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D03EUC002.ant.amazon.com (10.43.164.60) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Tue, 8 Mar 2022 15:36:38 +0000
Received: from dev-dsk-doebel-1c-c6d5f274.eu-west-1.amazon.com (10.13.240.106)
 by mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server
 id
 15.0.1497.28 via Frontend Transport; Tue, 8 Mar 2022 15:36:36 +0000
Received: by dev-dsk-doebel-1c-c6d5f274.eu-west-1.amazon.com (Postfix,
 from userid 3160037)
 id 40F714EA9; Tue,  8 Mar 2022 15:36:36 +0000 (UTC)
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
X-Inumbo-ID: 955b8293-9ef5-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1646753817; x=1678289817;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=e3B/QchphUR9r3U95HGdbpFpeOj5wxOfzK3Uqh6+kQE=;
  b=lr0z+XBvRUe9xfbXsyXe28WL4jhKUMReKJaj+W7WXd3F0N3UaSrLeW/2
   q30yZz9/58VPeFIn3v/6IBYyOF3SrOJdpt654Iskv7rrKs/g7vismuukl
   ulMqTlmw5BJ50FJTxTfpbfeacMR6DQ6ya/UjXqaEq37nJOxwJlyZrtay5
   E=;
X-IronPort-AV: E=Sophos;i="5.90,165,1643673600"; 
   d="scan'208";a="200441366"
From: Bjoern Doebel <doebel@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>, Roger
 Pau Monne <roger.pau@citrix.com>, Bjoern Doebel <doebel@amazon.de>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>
Subject: [RFC PATCH v1] arch/x86: Livepatch: fix overflow check when computing ELF relocations
Date: Tue, 8 Mar 2022 15:36:34 +0000
Message-ID: <b74a68b038c31df4bb94a5b5e87453f5a249cfe2.1646753657.git.doebel@amazon.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Precedence: Bulk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Comparing a signed 64bit integer to a signed 32 bit integer may lead to
unexpected overflows. Adjust the cast to use the same type.

Signed-off-by: Bjoern Doebel <doebel@amazon.de>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
---
I need some input here. When testing the CET-BIT livepatch updates I
noticed that my generated livepatch would not load due to

(XEN) livepatch: vmx: Overflow in relocation 1 in .rela.altinstructions for .altinstructions

A deeper look revealed that the ELF relocation adjustment seems to be
going wrong and that in fact the lower 32bit of the compared values in
my case were identical, but that the cast to int64_t for the value
pulled in extra 32 bits, which turned out to be different.

Applying this patch fixed the issue for my example and I got a fully
working livepatch. However, I do not understand what is actually going
on here, so I'm sending this RFC to get extra eyes on the code.
---
 xen/arch/x86/livepatch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
index 59620b8a4f..5380e18bd9 100644
--- a/xen/arch/x86/livepatch.c
+++ b/xen/arch/x86/livepatch.c
@@ -339,7 +339,7 @@ int arch_livepatch_perform_rela(struct livepatch_elf *elf,
 
             val -= (uint64_t)dest;
             *(int32_t *)dest = val;
-            if ( (int64_t)val != *(int32_t *)dest )
+            if ( (int32_t)val != *(int32_t *)dest )
             {
                 printk(XENLOG_ERR LIVEPATCH "%s: Overflow in relocation %u in %s for %s\n",
                        elf->name, i, rela->name, base->name);
-- 
2.32.0




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




