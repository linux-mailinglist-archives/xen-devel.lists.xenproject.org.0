Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5823D3C983C
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 07:19:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156298.288452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3tm2-0001H8-Tb; Thu, 15 Jul 2021 05:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156298.288452; Thu, 15 Jul 2021 05:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3tm2-0001DT-O5; Thu, 15 Jul 2021 05:19:02 +0000
Received: by outflank-mailman (input) for mailman id 156298;
 Thu, 15 Jul 2021 05:19:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6KMV=MH=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m3tm1-00009P-8x
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 05:19:01 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.80]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fca2b67a-f9a0-41ef-8658-1a18fe74c998;
 Thu, 15 Jul 2021 05:18:51 +0000 (UTC)
Received: from AM6P193CA0071.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::48)
 by AM6PR08MB5077.eurprd08.prod.outlook.com (2603:10a6:20b:e6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Thu, 15 Jul
 2021 05:18:49 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::80) by AM6P193CA0071.outlook.office365.com
 (2603:10a6:209:8e::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 05:18:48 +0000
Received: ("Tessian outbound 809237f40a36:v99");
 Thu, 15 Jul 2021 05:18:48 +0000
Received: from d6a36b010456.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4FC92E74-5853-4BB0-8FA9-D4E6438EDF4C.1; 
 Thu, 15 Jul 2021 05:18:42 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d6a36b010456.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 15 Jul 2021 05:18:42 +0000
Received: from DB6PR0301CA0057.eurprd03.prod.outlook.com (2603:10a6:4:54::25)
 by VI1PR08MB4591.eurprd08.prod.outlook.com (2603:10a6:803:b5::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Thu, 15 Jul
 2021 05:18:40 +0000
Received: from DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::52) by DB6PR0301CA0057.outlook.office365.com
 (2603:10a6:4:54::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:39 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT053.mail.protection.outlook.com (10.152.21.119) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 05:18:39 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 15 Jul
 2021 05:18:38 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:36 +0000
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
X-Inumbo-ID: fca2b67a-f9a0-41ef-8658-1a18fe74c998
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6RuQQnLM+Fgaeuh0yD31SI005nmfjCuq9/hVXZqKUE8=;
 b=iGzqmAhc5l3+s1k0ba+/ltjDXvO+/YxBBzKiGApOyN3y5+Fexi+cwPWMNUw9sSfwz0zdltG686d05ljcXLg+z9Eqn7fHEyx7DkCScVUx7dDz0Obn+N40zRu3ahKFY1i6UDGhmAzz0YQpn/wlWOhdxV7uNyVAII0IbK+oK5OSZN8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: eacd1cd9d0cb26ab
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evSz65sMci3VGbUy2l06x5tz9tlnwjTYvoihud7uV4IpIIxUPA1026QWCoswY9UmjB2fIvlomCuSEf52SEeOtnzzMSdlAoeSuAHCiMqrVdrjSQNAR9+XfENSSM+EDwOcMp7C35AJ1ZbwOsr+HFqoObD1rWAFAhRq6/sXGjQPCaY+y+uuY4nJfxwJ92rSNP9rMRVDT+sgOocg+O+Sce41kN3cVp4o0rik7i7mRV5zApWRmt/o7NhheStCVJzmoittoMFdqdMwWkS3iqaF5Cc1Eu1hQfbnPlOYMN4YspS+zdttKrEFl7rbAbFKXMYj2ZTOLn94Rz0TJR1iqnGog8a4HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6RuQQnLM+Fgaeuh0yD31SI005nmfjCuq9/hVXZqKUE8=;
 b=jfUga6eJFZxanhUZ7hvmcwJlmm2oySkZG3zwGvmerrYod7zl6umeYBl/ScaZ0hQiLFg1Dt6tm2CGyFOWjg2FiJ43ANCmC29Q2blcWSgsgKnBTaSDM5A+k32SRLwkPlGT+6UdlYbMOWjZe/RHw4FZG8DxOtDxauJz71AaYHn4a3jlmIwmyuyV9b97vFGHzgOayYj2SSR6BRCTWJAcZ2D/ps3/pt9Hn9eLBsRY0KbY8Ot5YeANx9iSwvIvHJs0qRlVR32EU4hxcIwHY1MLtD2l/90jZlMbWE1ERe1u/YD9BdlabutGhiC4qIhwwxbBTya1vvbh6B9IkQzsmmEzJ23sjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6RuQQnLM+Fgaeuh0yD31SI005nmfjCuq9/hVXZqKUE8=;
 b=iGzqmAhc5l3+s1k0ba+/ltjDXvO+/YxBBzKiGApOyN3y5+Fexi+cwPWMNUw9sSfwz0zdltG686d05ljcXLg+z9Eqn7fHEyx7DkCScVUx7dDz0Obn+N40zRu3ahKFY1i6UDGhmAzz0YQpn/wlWOhdxV7uNyVAII0IbK+oK5OSZN8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Penny.Zheng@arm.com>, <Wei.Chen@arm.com>,
	<jbeulich@suse.com>, <nd@arm.com>
Subject: [PATCH V3 05/10] xen/arm: static memory initialization
Date: Thu, 15 Jul 2021 05:18:14 +0000
Message-ID: <20210715051819.3073628-6-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210715051819.3073628-1-penny.zheng@arm.com>
References: <20210715051819.3073628-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c920649-f0bd-40a7-a526-08d9475006f3
X-MS-TrafficTypeDiagnostic: VI1PR08MB4591:|AM6PR08MB5077:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB507729C2E24F044342537B9CF7129@AM6PR08MB5077.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:323;OLM:323;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 UdhAvQBBD3kwuTTjyIiSSHnV/r48SNrk1R/AggH67MGo1PoU+XnbBMvETvZzTBCd7wJFKcu1H2jZuu5USqDH2EmC24P4K3dkgln/jo4CIK3+2oA1tPb2Zxl+nRclF3nfkrxwS5FSLUmkCT76hERJ3t5Xct+5suVOWLhxb4bw28y52hMzyc3F0ieAJbVtWX6pv33OoIEs4b3eyrts23ocUd4ve7wnDLuDiNnafY0gJ2zg0Uye40Rf4+pFsxXq5mxvb7q79nJWPRMuwjWEN+m1zjOP+IkvikmWXqnlXK08P//0lgtkvMjLlJYD+Fdk8DUYDHqpdXCyoAGWcd6iPTdlzY119N4+2JxqXKrNX5clssK3rUCWIVTQCi4PetHwpTnphmwAVhGxIuDtujXLuIR7dhut0/7ULAEcXe7J+oOAo+duGJ+f2KrWRcCFLKMSu0D19LESYNPsTlYut15I4nEQ5dcNwtAfUWd2slorZr3hwmw5YSvFn46+jowQ2p19jYf2EwmsFOQIZ4hz3b2GG1P+8PDXLkkLTY1OpATP4SnnT20up+sCYpQ/XDt3J/1MKwOkh+s9Amhq4FgVM3I7qX8JzisCi2gJSylvRFdZLZRM16HWnLhpKm/U7Gpb+X9j+CIQTFGi8p4y9gmFcqNFRBu3Hl2v9Q3dGZ55lc+ADe9gzbEeMCuZY6To1Qq3FCl4AFY+FQrIdTyR6jMFfjkdLbXoUfNOnSkaJYP9mybqdNjq4rA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(396003)(136003)(36840700001)(46966006)(5660300002)(70206006)(1076003)(2906002)(7696005)(70586007)(186003)(36860700001)(316002)(86362001)(81166007)(8676002)(44832011)(110136005)(82740400003)(36756003)(54906003)(83380400001)(336012)(478600001)(47076005)(82310400003)(6666004)(2616005)(356005)(26005)(426003)(4326008)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4591
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3fbcd178-91a9-41c0-5bc6-08d947500163
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s2fr5kTgwtuxutEfGRHIh4x31j4Eb5KvHFZSyC0vXpTz9Ya/UoLOpN3dYevZRmwwia16iefgknhp1gaFmiyUGGdzwAwuVFEzMkfd3o2f89K0mxR9qvIW8nruhwI3CPe689w+Kn30rNzoFSR2LMWaN9/3maEajmtHF00BmCmJ4bQbeQlkb99iiB4l9g174eteAt+U3RAi8ubnFsRP7d1NLPQA8GBsWMOi6J52FK542uVEkUM2HrhlMbwip5NGuA5USPkyXHyR22FbKJHE3Gl5C8zPu+91eZaCS5tW2l1Q/xC00heW8X/J/qWFQ+pXQBdyL/3jC3ijEv77YVfyKvEMZmvSj3I1DtK2JaCh65pYVRKN0O1L/hDknJMbe4BXjrsgS9wLRxuef1pJqtqpFn3dlZt9KmxScM/5AsgV+CPkYOtEnM5dqoREax3AQS/SofotN2T7Q6sz8cLSP6Kgyiuviv1+HU5iU7hDrn+5j1BPhM4l/sCc6LcecLKU5kVqbBhxMQBqJMWoWBzPXjC7zITvx6WcoUeWZGasroOWGHQZwLW+Y6FVSe8BX/xII1Rnh+qY7Bm3a62n6kD+IP6G3oGr9CjXurRpks8ji/kPxlypCAvdkNi0cLRh5zFxX58yOZDa2aVdA9pxgXt027RfngTwRi59+99e8PiFoRu8woCqGCF0L7HERfWgVsBQflvwgYY+a0ELl7UhC4nKXRLO3sYgYQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(376002)(136003)(46966006)(36840700001)(44832011)(81166007)(82310400003)(1076003)(86362001)(6666004)(316002)(186003)(8676002)(82740400003)(8936002)(7696005)(36860700001)(336012)(5660300002)(26005)(426003)(2906002)(110136005)(36756003)(4326008)(54906003)(2616005)(478600001)(70586007)(70206006)(83380400001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 05:18:48.8063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c920649-f0bd-40a7-a526-08d9475006f3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5077

This patch introduces static memory initialization, during system boot up.

The new function init_staticmem_pages is responsible for static memory
initialization.

Helper free_staticmem_pages is the equivalent of free_heap_pages, to free
nr_mfns pages of static memory.

This commit also introduces new CONFIG_STATIC_MEMORY to avoid bringing dead
codes in other archs.

Put asynchronous scrubbing for pages of static memory in TODO list.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v3 change:
- include addition of CONFIG_STATIC_ALLOCATION in this commit, where it
is firstly used and also change the name to CONFIG_STATIC_MEMORY
- Fix TAB typo in Kconfig
- put init_staticmem_pages in setup_mm
---
 xen/arch/arm/Kconfig    |  3 +++
 xen/arch/arm/setup.c    | 26 ++++++++++++++++++++++++++
 xen/common/page_alloc.c | 20 ++++++++++++++++++++
 xen/include/xen/mm.h    |  6 ++++++
 4 files changed, 55 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ecfa6822e4..b91e2efc4f 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -106,6 +106,9 @@ config TEE
 
 source "arch/arm/tee/Kconfig"
 
+config STATIC_MEMORY
+        def_bool y
+
 endmenu
 
 menu "ARM errata workaround via the alternative framework"
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index f569134317..aec8bc8494 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -622,6 +622,28 @@ static void __init init_pdx(void)
     }
 }
 
+/* Static memory initialization */
+static void __init init_staticmem_pages(void)
+{
+    unsigned int bank;
+
+    /* TODO: Considering NUMA-support scenario. */
+    for ( bank = 0 ; bank < bootinfo.static_mem.nr_banks; bank++ )
+    {
+        paddr_t bank_start = bootinfo.static_mem.bank[bank].start;
+        paddr_t bank_size = bootinfo.static_mem.bank[bank].size;
+        paddr_t bank_end = bank_start + bank_size;
+
+        bank_start = round_pgup(bank_start);
+        bank_end = round_pgdown(bank_end);
+        if ( bank_end <= bank_start )
+            return;
+
+        free_staticmem_pages(maddr_to_page(bank_start),
+                            (bank_end - bank_start) >> PAGE_SHIFT, false);
+    }
+}
+
 #ifdef CONFIG_ARM_32
 static void __init setup_mm(void)
 {
@@ -749,6 +771,8 @@ static void __init setup_mm(void)
     /* Add xenheap memory that was not already added to the boot allocator. */
     init_xenheap_pages(mfn_to_maddr(xenheap_mfn_start),
                        mfn_to_maddr(xenheap_mfn_end));
+
+    init_staticmem_pages();
 }
 #else /* CONFIG_ARM_64 */
 static void __init setup_mm(void)
@@ -802,6 +826,8 @@ static void __init setup_mm(void)
 
     setup_frametable_mappings(ram_start, ram_end);
     max_page = PFN_DOWN(ram_end);
+
+    init_staticmem_pages();
 }
 #endif
 
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 95d9be169d..f394d6627a 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1519,6 +1519,26 @@ static void free_heap_pages(
     spin_unlock(&heap_lock);
 }
 
+#ifdef CONFIG_STATIC_MEMORY
+/* Equivalent of free_heap_pages to free nr_mfns pages of static memory. */
+void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
+                                 bool need_scrub)
+{
+    mfn_t mfn = page_to_mfn(pg);
+    unsigned long i;
+
+    for ( i = 0; i < nr_mfns; i++ )
+    {
+        mark_page_free(&pg[i], mfn_add(mfn, i));
+
+        if ( need_scrub )
+        {
+            /* TODO: asynchronous scrubbing for pages of static memory. */
+            scrub_one_page(pg);
+        }
+    }
+}
+#endif
 
 /*
  * Following rules applied for page offline:
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 667f9dac83..8e8fb5a615 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -85,6 +85,12 @@ bool scrub_free_pages(void);
 } while ( false )
 #define FREE_XENHEAP_PAGE(p) FREE_XENHEAP_PAGES(p, 0)
 
+#ifdef CONFIG_STATIC_MEMORY
+/* These functions are for static memory */
+void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
+                          bool need_scrub);
+#endif
+
 /* Map machine page range in Xen virtual address space. */
 int map_pages_to_xen(
     unsigned long virt,
-- 
2.25.1


