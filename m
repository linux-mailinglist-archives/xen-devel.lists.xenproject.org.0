Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98145AFA076
	for <lists+xen-devel@lfdr.de>; Sat,  5 Jul 2025 16:28:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1034239.1407136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uY3rT-0005Sc-L0; Sat, 05 Jul 2025 14:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1034239.1407136; Sat, 05 Jul 2025 14:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uY3rT-0005MH-GT; Sat, 05 Jul 2025 14:27:27 +0000
Received: by outflank-mailman (input) for mailman id 1034239;
 Sat, 05 Jul 2025 14:27:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oLNU=ZS=valinux.co.jp=den@srs-se1.protection.inumbo.net>)
 id 1uY3rS-00055Q-2P
 for xen-devel@lists.xenproject.org; Sat, 05 Jul 2025 14:27:26 +0000
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [2a01:111:f403:c405::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b5a7199-59ac-11f0-a315-13f23c93f187;
 Sat, 05 Jul 2025 16:27:24 +0200 (CEST)
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:10d::7)
 by TYWP286MB1974.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:165::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Sat, 5 Jul
 2025 14:27:19 +0000
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a]) by OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a%5]) with mapi id 15.20.8901.023; Sat, 5 Jul 2025
 14:27:19 +0000
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
X-Inumbo-ID: 2b5a7199-59ac-11f0-a315-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D1Ci8QXkeNpueR4sH/BC7nPkxhB41muMULi+jIlRf+DJxw2cZebvScqgqTQ/5NM8t6k+8+uj9Sc0EwO8UdtGwUD0XknKnNXShdLLIVL4ow0fUXqkY6Qbnacg/n75F7MeN/Wutg/SD0InhblgDPMv85Bk9Ax+mkUgmg37tJsMVO1uksLPPq4b1yGqIBT2jYtZ/Fe7igk4bQXqtJGrMe0EeB6jEkeyJMmWA8khA4Ajb8J8rhYDoZ+/P9z5ZrOURYgms1OZaOtwlDv5a3IN6Sg/PT62Ok3xP8J//+4LkB2tCWvKcY0U+ArfWiBt6eRZ122RAzO77Z/1LcQfa3p5MkPipQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfc+H3nJRyfmmBSNsiPB3+yojQAp4BzUKW664k7xZCk=;
 b=C4u3RGM/14feG1Ir0XBLjcE7ZM4aT7v3wQPt8qgafnjQLAenkZuVasgVnElBHfmKnhfIWIRcVnqRqjUe+ON0teGamhk6zecIwK19gsd6R0Y0chr/GTTXuBm9PJZcb24gWL9u2N8MbCnIco46fDD2LBWCMmtr578XQzFd/4pyLbLglZ+rFxMtXRnDQaHr7fLQPRzOOuwieApmHvGmdQYKeSQHmNOIl66p6ZVZmnEcxe4xrILHQK3t1MMewdknMRUbTl7LJCKpi02EOgcso+ExR24TFuoGcwdFEpxEzqpBJkbiLJak91N5+xnh35oh5HsUjuClLgTbDW4QNpPnHDZVJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfc+H3nJRyfmmBSNsiPB3+yojQAp4BzUKW664k7xZCk=;
 b=SIVZGumsBu9pL2vhTA8u+X7TJeBF+RM49uEnBHczM3K4g37/KXokDnWjTtpad76PjbGXmCPPnqs2wuV405TRuAqUP8Zon8/zkav0w0FA2TTUSLWGmT/OfmmTkcGUjmZoRnUD2RD60e1QxYljYHKqHmyZLYq83bYr4QhPEm+P7as=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Koichiro Den <den@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Koichiro Den <den@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 3/5] xen/arm: Move make_resv_memory_node()
Date: Sat,  5 Jul 2025 23:27:01 +0900
Message-ID: <20250705142703.2769819-4-den@valinux.co.jp>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250705142703.2769819-1-den@valinux.co.jp>
References: <20250705142703.2769819-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0179.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::7) To OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:10d::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3P286MB0979:EE_|TYWP286MB1974:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a3efd81-fac1-4952-e66c-08ddbbd00c9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?grYn9Ld02gsSoZJ8wjEzNz2B7ApHyOWBKJGFzdQwtjL/ugGyxmfK9q4RHqx0?=
 =?us-ascii?Q?fJF1dkmgCighyUT8cjGILJlOOu5i5dXGdiVnIOp4995mGIGqo1qcbYuy6X6W?=
 =?us-ascii?Q?VzzqwyswUSi0riC8KgBBUQE2zt6FTNwhXaB98pGofTnPDR+s1LuxODI6clqi?=
 =?us-ascii?Q?laH6MejHoOA/OQU4wQ/YHUfDonyE1+vlYFrKo/kh8X/E5SnjaDzIhAGibVKA?=
 =?us-ascii?Q?QKWdz26NzoZASkghkXmoYpOSbF4uJHZ/vTNizSs1JXa8GXT71i2XMbZu8qvu?=
 =?us-ascii?Q?hophRUstPrIo4DFeT09xWrYI7ytD64WZA0CLCcuDUEVZTpnGuQbgp9PiqJn6?=
 =?us-ascii?Q?UyBwg4HI3y2HJlE5e/S8EcJmAa+Sx1kyHU0MFy+nivfuxX1h/I9wnEakpZAi?=
 =?us-ascii?Q?LOBtKV/ZZgFuTuw03IB9oe8GIvZMo3j0MvoP6bLQ64Y+2uaQXS9tUCooDqVt?=
 =?us-ascii?Q?K6YfHjn5lfHdj4Tp8CWpmxeN1gy0ZTA4Q1IQ3zvO5dAqv16Z9KGcBhkAoNkC?=
 =?us-ascii?Q?eGYCuYw/ICs4DAEtVsJ+ytmv31tfvs+knZMv0pN3RH2qB7VxMr8NOgl2dFgN?=
 =?us-ascii?Q?TRTNworB6UinkTUV+3vOFUPE5T3fBssOJn8WbaUr7xxjZ2Mse5h8Xa0bEbm8?=
 =?us-ascii?Q?59+jdPDP4pYi8ITjFrN9aeesU3fnPcrsYJfx0wys0WB26KhmVxze1XrVv9/G?=
 =?us-ascii?Q?jOXwE/VXZth6YWeCanLFFOXmxufZxuBLzwtG3b2jqeHQjp1zdQ0BH1tcGaUL?=
 =?us-ascii?Q?wKJJbUULyWSCXIMzEbc49+MI/Sgkxhh6Wc/9B3frI723Jch9ZOUWD+E0leqv?=
 =?us-ascii?Q?eD1yvzhovb6H1KU7KPzBr4zg/ETntBiD9M0n9IMwm1RpWWp6/6RVzzhgAg0e?=
 =?us-ascii?Q?2n79V18NlDNCWPBUGb/hzps3lb1LHSvCpp+EP71D7rjplmnC+305QydKtkuA?=
 =?us-ascii?Q?spq7tr9kz2lampPU2nTapJ3PGBR17L3PPyDVHZfkMizYR2Q9AG3vE4boIji4?=
 =?us-ascii?Q?h576zvqFL8B74OGcHPG3+ir30xdjrbWrXUFgMdp3BCdfjyA1jf/n3/jxU393?=
 =?us-ascii?Q?IdY59n0fDVJ0kQihaKtLHo+vuecIKX2wQvZLGItS9HYVYwqikRO2f3udwsgY?=
 =?us-ascii?Q?owF9WHSzW80sDUpNIh9NbMRF1aBQ6yDGJ8gnCH+I4cNSr5/jrQqUL1IwYrUC?=
 =?us-ascii?Q?3eZKJW5P+CPq3kOcsB+6dGK+bcnN8a92Dh+qnjp7D2Kli5W/iKi88V8bdpve?=
 =?us-ascii?Q?t01DEqsjb9N2PaAZiDKblQHtqq629yADU3REay21KHahKf2NjEkNrLD/1cvP?=
 =?us-ascii?Q?qGS7d/XAdQLlX3cpbwFxZXgMNHwJCMK142kXjJ0FKd/gFT1rDdIXUibn+753?=
 =?us-ascii?Q?yKQMVl92F+bnKpIki+EC2vJy8Nk6S09zMkBk5JBk8o6EAy0MIMUH/CMmzxFR?=
 =?us-ascii?Q?qv8H1NtK1/I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wYED+OhKlre3tnBMO0vQrEZQRQ6s61OsDXDQT8za6eVye3Acicws0IBhW5uy?=
 =?us-ascii?Q?3uNCSXbGaBKVy9DkDqwvyK0T+lIk+S84SHOAP25adcGDK3nXZE/aTJCZtTYJ?=
 =?us-ascii?Q?CgZjTgL14XoKOqfUv9oOKRZq/Fh+XDztfXPyR+q30F28O12b9i2BaS6hdyuj?=
 =?us-ascii?Q?XHz66yXO9Wn89DF0PK81hVSY1Jku+FkrT9wVfiHDeQJa+5l2l5ikmrjaNmlS?=
 =?us-ascii?Q?XrsV8Zfyb0n/bXUU57Y1icKJcW9qs15hOe/sbtREaHC0wBB1cgeGGjahhsPt?=
 =?us-ascii?Q?wPiw86nSc8I8gmsxuQfP6I8DKhwJwTSgY82yliVN1O4VwdWnQny7mxTg/4St?=
 =?us-ascii?Q?pspOpKDr1rWqaHlYYC3OouQ4Wk0M4lFbyGlRncCiZ4GC32MtrHMjf5EDk3fZ?=
 =?us-ascii?Q?DD1uARuM5jfyHdL4Dt0Eik03my9MRg5G3ZaGu1zTUx9TnsrVdcQqqzZG56qf?=
 =?us-ascii?Q?va9fsrIYxkIGxdgTxOpdJJ3ihjuQmuwj1lA5eG6+E3EGO8v9EjBQ3UTrxG1R?=
 =?us-ascii?Q?ElVjAnNcRej1eXPWttZ30Rr2UGLbhsYoCNusdPxyPFeDbtfjmwCQZ2Kn36hF?=
 =?us-ascii?Q?1baH/a9QFJivpX1RPV8JmkK/call/e/RtGUXxGr30k86AFaPtA3bO02RPPyH?=
 =?us-ascii?Q?5BD1XZrb1BZAMBJ08MBSTmr0pC1oCsNpMnck8iqHYDp0szExRkB3zT1KWWrH?=
 =?us-ascii?Q?NUTEgyBgODAItZZBJd9KbPZnhlmFpvNyjng1cTZ8HeONH1o/HNjXVnUtmWCS?=
 =?us-ascii?Q?qQTLelf9mTqFfSV4HgqIbUzFG/uVooGjGOe+Yug3JPZ40zFEe9Pv4O6GaG4s?=
 =?us-ascii?Q?1Q+VWI0K8NP8azXN+sVyx3P1KBJOF0/jLayXeb8pWfR9zBgOdzmXaFZJy1CV?=
 =?us-ascii?Q?kDoPDgJ8JlI/HocLVqO+h2RE0R0iuafgQeG+GVqfQLlTwKgZAqcntAO6LYZ9?=
 =?us-ascii?Q?9bOp/jzhiZUbhWNwCmaW0ngy+CdVePXxYo0xDje5qBIv3zwe6ciXs/MHl47j?=
 =?us-ascii?Q?ICZqhN84O8IgC5ziUuKBDsb/VSGYOMGYgAUqaFYD7U1JwQiRpo1zvcECmauz?=
 =?us-ascii?Q?CV4xsh1qtjYlp/xwljwXFMDd4Wc6rvf5mBDOhDPzKyAej0lFKMBJs/8N0COY?=
 =?us-ascii?Q?xRoK5yMtnNDSi5QMn66YqRkPWRplaxWDioCo8mhoDWFMu9MY/SxNXQEHkKYm?=
 =?us-ascii?Q?VAjp2cD3eNZzL9uCY/d86IO6vJWQx48hf7VxgClQXlnkGmF2wbFyeMC7XVhc?=
 =?us-ascii?Q?22pTty8qZjIQ5NuX76uBlDu5a1dDTC74e0UDrad52ZtPN6nO9lAgKaBWhrYA?=
 =?us-ascii?Q?KLz0eXZEpSsWvT+oRCTbIzkWVFFr0kdjp16D0YkhcJ4OqRsgFLDQw1n0Nnlr?=
 =?us-ascii?Q?aRn29M9W1b/2frkS7N+deaacCb+grOD+UCPhmZIfRK/I+zjDjfiXIMz2pb1+?=
 =?us-ascii?Q?KnoQOWAzupRehUH0Gh2XUhj6/km2a4hJrjhP0vZ+kX5FdfkvOOyWDyRdf/8m?=
 =?us-ascii?Q?iKZl7U/HfWnS56jVQfNTIwrme37y895eVuIKu+oqFuO4keXMuIFYWBkOmW8O?=
 =?us-ascii?Q?2vecu3aHo4WeuyG0xtJ8lzXQ5a90bcDrqDq2BXu6EkeYIqD4mrrGuc2KKXC+?=
 =?us-ascii?Q?iosYXqZRu7VcgJHAS3dRCsE=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a3efd81-fac1-4952-e66c-08ddbbd00c9f
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2025 14:27:19.6587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eL3s+l0xF5aEJUSXYKJdIVgjD/amfN5epgaKZN2PEMvN55xM++ua0GvfQQlYBcHCe4uP8Ms+aG0oHmKdFdy0Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB1974

The /reserved-memory node is inherently not specific to static-shmem.
Move it to a more generic domain build context. While at it, add an
empty kernel_info_get_shm_mem_const() for the CONFIG_STATIC_SHM=n case,
as it can now be invoked in such case.

No functional change.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/domain_build.c           | 40 +++++++++++++++++++++++++++
 xen/common/device-tree/static-shmem.c | 40 ---------------------------
 xen/include/xen/fdt-domain-build.h    |  2 ++
 xen/include/xen/static-shmem.h        | 15 ++++------
 4 files changed, 48 insertions(+), 49 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 5fbc26f70988..e063d0d4076e 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1564,6 +1564,46 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
     return res;
 }
 
+int __init make_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
+                                 int sizecells)
+{
+    const struct membanks *mem = kernel_info_get_shm_mem_const(kinfo);
+    void *fdt = kinfo->fdt;
+    int res = 0;
+    /* Placeholder for reserved-memory\0 */
+    const char resvbuf[16] = "reserved-memory";
+
+    if ( !mem || mem->nr_banks == 0 )
+        /* No shared memory provided. */
+        return 0;
+
+    dt_dprintk("Create reserved-memory node\n");
+
+    res = fdt_begin_node(fdt, resvbuf);
+    if ( res )
+        return res;
+
+    res = fdt_property(fdt, "ranges", NULL, 0);
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "#address-cells", addrcells);
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "#size-cells", sizecells);
+    if ( res )
+        return res;
+
+    res = make_shm_resv_memory_node(kinfo, addrcells, sizecells);
+    if ( res )
+        return res;
+
+    res = fdt_end_node(fdt);
+
+    return res;
+}
+
 static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
                               struct dt_device_node *node,
                               p2m_type_t p2mt)
diff --git a/xen/common/device-tree/static-shmem.c b/xen/common/device-tree/static-shmem.c
index 8023c0a484c1..7eede97fa25d 100644
--- a/xen/common/device-tree/static-shmem.c
+++ b/xen/common/device-tree/static-shmem.c
@@ -730,46 +730,6 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
     return 0;
 }
 
-int __init make_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
-                                 int sizecells)
-{
-    const struct membanks *mem = kernel_info_get_shm_mem_const(kinfo);
-    void *fdt = kinfo->fdt;
-    int res = 0;
-    /* Placeholder for reserved-memory\0 */
-    const char resvbuf[16] = "reserved-memory";
-
-    if ( mem->nr_banks == 0 )
-        /* No shared memory provided. */
-        return 0;
-
-    dt_dprintk("Create reserved-memory node\n");
-
-    res = fdt_begin_node(fdt, resvbuf);
-    if ( res )
-        return res;
-
-    res = fdt_property(fdt, "ranges", NULL, 0);
-    if ( res )
-        return res;
-
-    res = fdt_property_cell(fdt, "#address-cells", addrcells);
-    if ( res )
-        return res;
-
-    res = fdt_property_cell(fdt, "#size-cells", sizecells);
-    if ( res )
-        return res;
-
-    res = make_shm_resv_memory_node(kinfo, addrcells, sizecells);
-    if ( res )
-        return res;
-
-    res = fdt_end_node(fdt);
-
-    return res;
-}
-
 void __init early_print_info_shmem(void)
 {
     const struct membanks *shmem = bootinfo_get_shmem();
diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
index 45981dbec0b8..e9418857e386 100644
--- a/xen/include/xen/fdt-domain-build.h
+++ b/xen/include/xen/fdt-domain-build.h
@@ -25,6 +25,8 @@ int construct_domain(struct domain *d, struct kernel_info *kinfo);
 int construct_hwdom(struct kernel_info *kinfo,
                     const struct dt_device_node *node);
 int make_chosen_node(const struct kernel_info *kinfo);
+int make_resv_memory_node(const struct kernel_info *kinfo,
+                          int addrcells, int sizecells);
 int make_cpus_node(const struct domain *d, void *fdt);
 int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
                          int addrcells, int sizecells);
diff --git a/xen/include/xen/static-shmem.h b/xen/include/xen/static-shmem.h
index 76a49869126c..9e7500ed2721 100644
--- a/xen/include/xen/static-shmem.h
+++ b/xen/include/xen/static-shmem.h
@@ -11,9 +11,6 @@
 /* Worst case /memory node reg element: (addrcells + sizecells) */
 #define DT_MEM_NODE_REG_RANGE_SIZE ((NR_MEM_BANKS + NR_SHMEM_BANKS) * 4)
 
-int make_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
-                          int sizecells);
-
 int process_shm(struct domain *d, struct kernel_info *kinfo,
                 const struct dt_device_node *node);
 
@@ -50,12 +47,6 @@ kernel_info_get_shm_mem_const(const struct kernel_info *kinfo)
 /* Worst case /memory node reg element: (addrcells + sizecells) */
 #define DT_MEM_NODE_REG_RANGE_SIZE (NR_MEM_BANKS * 4)
 
-static inline int make_resv_memory_node(const struct kernel_info *kinfo,
-                                        int addrcells, int sizecells)
-{
-    return 0;
-}
-
 static inline int process_shm(struct domain *d, struct kernel_info *kinfo,
                               const struct dt_device_node *node)
 {
@@ -80,6 +71,12 @@ static inline void shm_mem_node_fill_reg_range(const struct kernel_info *kinfo,
                                                __be32 *reg, int *nr_cells,
                                                int addrcells, int sizecells) {};
 
+static inline const struct membanks *
+kernel_info_get_shm_mem_const(const struct kernel_info *kinfo)
+{
+    return NULL;
+}
+
 #endif /* CONFIG_STATIC_SHM */
 
 #endif /* XEN_STATIC_SHMEM_H */
-- 
2.48.1


