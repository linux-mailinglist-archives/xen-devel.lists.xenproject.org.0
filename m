Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B2C828F44
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 22:53:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665031.1035234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNK2B-00020Q-45; Tue, 09 Jan 2024 21:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665031.1035234; Tue, 09 Jan 2024 21:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNK2B-0001xZ-0J; Tue, 09 Jan 2024 21:53:19 +0000
Received: by outflank-mailman (input) for mailman id 665031;
 Tue, 09 Jan 2024 21:53:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ONpl=IT=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rNK29-0008W6-6W
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 21:53:17 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2409::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e6b801e-af39-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 22:53:16 +0100 (CET)
Received: from BY5PR03CA0025.namprd03.prod.outlook.com (2603:10b6:a03:1e0::35)
 by SJ0PR12MB7081.namprd12.prod.outlook.com (2603:10b6:a03:4ae::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 21:53:12 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::8e) by BY5PR03CA0025.outlook.office365.com
 (2603:10b6:a03:1e0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.24 via Frontend
 Transport; Tue, 9 Jan 2024 21:53:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Tue, 9 Jan 2024 21:53:12 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 9 Jan
 2024 15:53:12 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 9 Jan
 2024 15:53:11 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 9 Jan 2024 15:53:09 -0600
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
X-Inumbo-ID: 7e6b801e-af39-11ee-98ef-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXTz2Mpvj/QfnORkTyz17SzRJMmmPl9jXvRlwdSdk+v81jVDIsPnV9G234ofXWU6BSM79izfS6//ImHglgJs8rFMSmxJI/uY7kwVV3KI9l5uCCCqWOtk3HmHod57NZvjOdMPskqg9ecA5xoOkGVYVkPmbiNcXYHPsnhFgyu0QeJhH4LjihfcjjPGScgdcyTHMWBxG5M/6Uv7JnOu3nuClhXht25xHKWHm7wJgb6iV2OL3EENMa18ew+cdPO5OTWbOpZT/yopedhj9lax5NpO3iBKIFLr3N1TDuKejMM+z3u+cYJ5u7wcVka795AxiFWMG2LRJEJ0H5H7fVR8/F+3LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIlYNCEQ+4nfk+sRGPCKjR3ey13meQvjdP5M2lt1W5E=;
 b=nCtMQHj6MfUf/M2KMlwQlA3qG8FH414UUpmqyV/fFQg+HakhC9qCjLEnDG/dfqVdRT9ZfWsKNzBhAxI9P9Io90TBTAPIvi3wZA3rWLvueFPI3SBWNmG8ZcTwZWHjUKOfA6LZI/uYRxEFZxUX8JOnJQT5YMEbn5CUiKxRtVeGS32OZcU0UIGS4MRIVscKpmj+If/ihdeJoPLnicIgnmgasN5qh/+aeQIX+iCNrG847is3Nh2JotUEJkDZCGQQIVEs/hcgd2qUNHixR2PGWSCp4UhxdCqBs1MHw5c8/UFb9CijpO/UIDw9QxlHhBGzC5Fux3enZGgXfqdSMMwbvp79NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIlYNCEQ+4nfk+sRGPCKjR3ey13meQvjdP5M2lt1W5E=;
 b=pgtpAF1ZosNJ3024LD7SEw7MXSUBKz5aeessqqpYdYVsdWKQn+zKBdIwhuUk/Qn/l5o0qYSq4Hqp7BKHSzVvYxXsj9YrVHQJMyVsJcRMRg+DezXL6/Aw4j4dPQhrh4nnXzl2GaLjslmYwiRL2+cihjI5QTOs9BGAJdpO2ZxLTPI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH v12 06/15] rangeset: add RANGESETF_no_print flag
Date: Tue, 9 Jan 2024 16:51:21 -0500
Message-ID: <20240109215145.430207-7-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109215145.430207-1-stewart.hildebrand@amd.com>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|SJ0PR12MB7081:EE_
X-MS-Office365-Filtering-Correlation-Id: 75a7f3bf-8b1a-4200-87c0-08dc115d6077
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rUqNpyN1LLfmUKSPQX70rqqcylRCdeJ6msqMj/6uZlUk+udyT4kHmlWMV14X3qvNSW21UkormSg4qIAEhxGSwe58PE2VPF5xCT+5yvzrRktVawQzQOCwbAhJKWmiGRhJyNAlm6xP29Bei5Dn/QFggWE6OPySXjSCi2wK/CUFCsObM0YcOsQovI2UeRD9EJDEp8xnPib/wg3QOE5UuJG1HPtFf/bzwMDzhgt2nvf/zG4Uz7uBejtO6Xwt5XIYIolWW+Fq8WswmTKc3O3JUTNxgZxrgCf1iVGat1IEqIbUWmigHBSigxDXTJlgdbH02+ywpxWcG+RP4qcH+xkkxR41HsBx3C1Fbuzmw0JB/HS3Xi9YKG9KjTr7WLN6kUpWasNm0wx8r3cCBWqvLdB5ktQyrTw6lrOCnX5GXVnPS6i75klS4sNPkIwBJ+wZFXuslsXcKT35mnSBm749aiDtwWTguf12PnIh5tBFlkgjaA7lVeKuxbPfAHMLkxyeUO2BZ5IKxsKWy9da7P9Fjx7JccS1L59CdRKG1/g0mqDWpfRwYu+62TM8k0OioU12hxHNj0yTvRW8NB+8qJ7o/NvRkGCPAADU1Mxsz88LiDB+H8zp/c9XWtWkbwGszwKM//DMA7c2MRGg1Zv6poXtjn412KaPCdy8qJAd61lRzh/ks8nIktbTnpZ/Q9gl6zX+Mmne/EQEp9avRO0mnjKVIyHgNXJvgY6piNgW57sCv8I5TST0wrFZ9Wr7E1p6Qbb5Z45WrqEuQLcP7lN1r25vPj4KctumwA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(136003)(346002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(40460700003)(40480700001)(356005)(41300700001)(36756003)(81166007)(86362001)(36860700001)(2906002)(82740400003)(47076005)(83380400001)(26005)(1076003)(426003)(2616005)(336012)(6666004)(478600001)(70206006)(6916009)(70586007)(316002)(54906003)(8936002)(4326008)(5660300002)(8676002)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 21:53:12.6593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a7f3bf-8b1a-4200-87c0-08dc115d6077
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7081

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

There are range sets which should not be printed, so introduce a flag
which allows marking those as such. Implement relevant logic to skip
such entries while printing.

While at it also simplify the definition of the flags by directly
defining those without helpers.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Since v5:
- comment indentation (Jan)
Since v1:
- update BUG_ON with new flag
- simplify the definition of the flags
---
 xen/common/rangeset.c      | 5 ++++-
 xen/include/xen/rangeset.h | 5 +++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
index 16a4c3b842e6..0ccd53caac52 100644
--- a/xen/common/rangeset.c
+++ b/xen/common/rangeset.c
@@ -433,7 +433,7 @@ struct rangeset *rangeset_new(
     INIT_LIST_HEAD(&r->range_list);
     r->nr_ranges = -1;
 
-    BUG_ON(flags & ~RANGESETF_prettyprint_hex);
+    BUG_ON(flags & ~(RANGESETF_prettyprint_hex | RANGESETF_no_print));
     r->flags = flags;
 
     safe_strcpy(r->name, name ?: "(no name)");
@@ -575,6 +575,9 @@ void rangeset_domain_printk(
 
     list_for_each_entry ( r, &d->rangesets, rangeset_list )
     {
+        if ( r->flags & RANGESETF_no_print )
+            continue;
+
         printk("    ");
         rangeset_printk(r);
         printk("\n");
diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
index 8be0722787ed..87bd956962b5 100644
--- a/xen/include/xen/rangeset.h
+++ b/xen/include/xen/rangeset.h
@@ -49,8 +49,9 @@ void rangeset_limit(
 
 /* Flags for passing to rangeset_new(). */
  /* Pretty-print range limits in hexadecimal. */
-#define _RANGESETF_prettyprint_hex 0
-#define RANGESETF_prettyprint_hex  (1U << _RANGESETF_prettyprint_hex)
+#define RANGESETF_prettyprint_hex   (1U << 0)
+ /* Do not print entries marked with this flag. */
+#define RANGESETF_no_print          (1U << 1)
 
 bool __must_check rangeset_is_empty(
     const struct rangeset *r);
-- 
2.43.0


