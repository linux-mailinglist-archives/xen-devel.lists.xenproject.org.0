Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D143B814043
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 03:52:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654839.1022292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDyJj-00047S-Nb; Fri, 15 Dec 2023 02:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654839.1022292; Fri, 15 Dec 2023 02:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDyJj-00040J-Hv; Fri, 15 Dec 2023 02:52:47 +0000
Received: by outflank-mailman (input) for mailman id 654839;
 Fri, 15 Dec 2023 02:52:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=onWf=H2=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rDyJi-0003SX-8s
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 02:52:46 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 055090b1-9af5-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 03:52:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id DC6CA82867CC;
 Thu, 14 Dec 2023 20:52:43 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id hr1Mi86VvOGp; Thu, 14 Dec 2023 20:52:42 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4A5DC8286790;
 Thu, 14 Dec 2023 20:52:42 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id kFWfp9NhR9_k; Thu, 14 Dec 2023 20:52:42 -0600 (CST)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id EBAC282867CE;
 Thu, 14 Dec 2023 20:52:41 -0600 (CST)
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
X-Inumbo-ID: 055090b1-9af5-11ee-9b0f-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 4A5DC8286790
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1702608762; bh=Abuhdt8ZljNVI1itjtnL52V9CIwnwao7c1+uXWvjbAk=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=CU4MRvuqVnzdeeXxGSnwZpyYynd8karBdYPlpkyNpnMM25lItLZv/ehjmWjsVN8QU
	 7EUoBnvtsL/2lBvUi3Z7OmgceOjH8JKCBPD5xi8XeeRrMPHnjPkSQCYM2dKlkdH4ip
	 k1wYpTcWTehLvNZxtSzUdDbTQxK8jk1sYeMRWVvs=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2 4/7] xen/device-tree: Fix bootfdt.c to tolerate 0 reserved regions
Date: Thu, 14 Dec 2023 20:43:59 -0600
Message-Id: <1c6f0f94f4ea2b773f960d88bd02e2168ac28abb.1702607884.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1702607884.git.sanastasio@raptorengineering.com>
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

The early_print_info routine in bootfdt.c incorrectly stores the result
of a call to fdt_num_mem_rsv() in an unsigned int, which results in the
negative error code being interpreted incorrectly in a subsequent loop
in the case where the device tree does not contain any memory reserve
map entries.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/common/device-tree/bootfdt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index ae9fa1e3d6..796ac01c18 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -466,7 +466,8 @@ static void __init early_print_info(void)
     struct meminfo *mem_resv = &bootinfo.reserved_mem;
     struct bootmodules *mods = &bootinfo.modules;
     struct bootcmdlines *cmds = &bootinfo.cmdlines;
-    unsigned int i, j, nr_rsvd;
+    unsigned int i, j;
+    int nr_rsvd;
 
     for ( i = 0; i < mi->nr_banks; i++ )
         printk("RAM: %"PRIpaddr" - %"PRIpaddr"\n",
@@ -481,7 +482,7 @@ static void __init early_print_info(void)
                 boot_module_kind_as_string(mods->module[i].kind));
 
     nr_rsvd = fdt_num_mem_rsv(device_tree_flattened);
-    for ( i = 0; i < nr_rsvd; i++ )
+    for ( i = 0; nr_rsvd > 0 && i < nr_rsvd; i++ )
     {
         paddr_t s, e;
 
-- 
2.30.2


