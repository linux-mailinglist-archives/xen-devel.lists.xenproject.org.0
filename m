Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B49D4AE29BC
	for <lists+xen-devel@lfdr.de>; Sat, 21 Jun 2025 17:12:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021614.1397557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSztF-0002qG-RN; Sat, 21 Jun 2025 15:12:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021614.1397557; Sat, 21 Jun 2025 15:12:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSztF-0002mk-NQ; Sat, 21 Jun 2025 15:12:21 +0000
Received: by outflank-mailman (input) for mailman id 1021614;
 Sat, 21 Jun 2025 15:12:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x3VJ=ZE=valinux.co.jp=den@srs-se1.protection.inumbo.net>)
 id 1uSztE-0002Hn-PU
 for xen-devel@lists.xenproject.org; Sat, 21 Jun 2025 15:12:20 +0000
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c406::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1feb7d58-4eb2-11f0-a30e-13f23c93f187;
 Sat, 21 Jun 2025 17:12:19 +0200 (CEST)
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:10d::7)
 by TYWP286MB3033.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2fd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Sat, 21 Jun
 2025 15:12:11 +0000
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a]) by OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a%5]) with mapi id 15.20.8857.022; Sat, 21 Jun 2025
 15:12:11 +0000
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
X-Inumbo-ID: 1feb7d58-4eb2-11f0-a30e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1Ht5usY0rN1H9cP9zns7rKOh+sfwSGpPrAP0wRMW5srBwyRY9k4Xx5SWwfsXyjCdmO92pVP/rm1z6EBQgLSitsKLcBukVtIysafoqafQRlAZj0E8zTxy9VKI14f5srJm49ri/PiolWZFSz1mOhA0JSBrqcyeXGyCK8lhF3uToZHRT2tvCryxkW28SVbVOAHjg18gNneTRUSH5J/lkxWhX3Iri9bWHna0HoROkJDpMFNfYT2MUUKtY6fsgex87g/FkP5jyAXzKEeBEL+NvhbSrQ1Tcoo13z2Ln1rW/xe3qB7QAf6wrvh9DsYz6phCoqDKjoS2jM+yP0HWVje1sgB+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myCouYTkzXt1wRSFj6GnnII8PQIOCzOShhCCRH3V1mo=;
 b=YVqmDsdxka+V5/UT7JhFv8ki0Yi3TfqPlH87Bqp3r25WmFdxfyL4xA1aw0cXnQcrKtNYeRYF+9WJvybQ4Q2TaNNth+KlLgK2en+18xGAgwmz5l54AU53+ZiqBfKqXeZGAUKiSHUyM7//MVOaH8/wiToNfUy8YFjO/W+49mHXL8tIExITC/oAytmmrULFzY2wd0kZsmmFauMLaXZ8qvgAP0wGjtfeWYb5y1c7o+q33vPPkv6KZ5gromEbmmVgjpUUygpm++i4yfmrfDyrIwmS/xWw8Nex+XArmc7ePjUpj0pHYR6x9IAlJcn/XhnVs9BcxpF+mTgR0Wn4d/X+6X9p0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=myCouYTkzXt1wRSFj6GnnII8PQIOCzOShhCCRH3V1mo=;
 b=hGfvc59LO+eiofgyxLRGFGc4sXFncGuKyy6QeKznd5wX4Ih5KRjCszEpOLKTSUx8y5so1WJOYfiwxQRunBhrSYSBBbASPi7jy7QMwxmqO+YCeMzY9mgmPl8lXZ4SibYyBqY09QH9sSOEcjjrTnEbR9tdVdw43+BRcwb+LyxClKU=
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
Subject: [RFC PATCH 3/4] xen/arm: Move make_resv_memory_node()
Date: Sun, 22 Jun 2025 00:12:00 +0900
Message-ID: <20250621151201.896719-4-den@valinux.co.jp>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250621151201.896719-1-den@valinux.co.jp>
References: <20250621151201.896719-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0321.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::14) To OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:10d::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3P286MB0979:EE_|TYWP286MB3033:EE_
X-MS-Office365-Filtering-Correlation-Id: a57fd3f5-b97b-4109-512c-08ddb0d5ff62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gzmwhQrfVE8tavuIWQH4k5LvHMLFFOqLu4VH7tcX2Lxo/zC+NVSXTeeyYy+u?=
 =?us-ascii?Q?CzQcWxwxr+tPd+r7a3ct13mhcJNhzl2yrjJe76MR53SH98B+28LWGkWwu6/J?=
 =?us-ascii?Q?QcXaeAyAWA0XJZekcXz+Jm8WIOzDTOAjD+lbFKks3RKVf/1raM3EjsXdXI59?=
 =?us-ascii?Q?2kfALtkKwu+PyrIy+1Jglawdl9Hepo3sCnc63K2m1XEWSOq+MnSXTn3GUISt?=
 =?us-ascii?Q?1OEdT+nhNDmOKSwFl0SldWETkZl/qaeP6uCr5rnWDJqsD3zr24DCT+BsC4uC?=
 =?us-ascii?Q?PtRMTdlnbQGSu3re2YzkbPf+BUWi8f++v8Tu9dMd+CAeGhh2AxNM6EK4EOmn?=
 =?us-ascii?Q?IA92QU8pf+rPqetjuEsVkuidsc7DpBMqPbDE38be6PXaTThoqhfZLhY5mK9U?=
 =?us-ascii?Q?WLmNUjDtueND5yEb8aMN2vV1vSk8fBG42eDv3FIdOD//sJ52C4ctI34UgdsV?=
 =?us-ascii?Q?EvRYRF2yILh8fIbrF6rWlSKSILw2YiCiMRyXwEiX7DTlJeiMqYizpYCSFnLV?=
 =?us-ascii?Q?zddpveoHQdmAxZyyChXn4SFbWRRuEi1YiOlJxOl1jj4UNGdzpu8DMYPZfwr2?=
 =?us-ascii?Q?E55V+9AeebGVGbwSEomG/QT23pGeRC2fMxemPZ+4SwAk1mRBHk//8xkH9IHS?=
 =?us-ascii?Q?GJJQ2DLCxtiO1zpGvSvm0gxKYJUvnw2yfqeraoPux3KazPsEcP9SUVSgbBkQ?=
 =?us-ascii?Q?p/akzn9lShr15Y3ahTdJuGB7xOtg7kSnBqvUmyVt/tbF5MOEt6cUCf9g6jCW?=
 =?us-ascii?Q?oqgZHBGrnrZymMKt0zRPwlnG+rtBHUB1bSnvYJuH34LFdGTh6tOa4J5EbWLU?=
 =?us-ascii?Q?khpwSAEUe+snxlZ7YvXGuEpHRLSDOu+dvKw/hly++OxdIe5h5Qhlz01sw8zN?=
 =?us-ascii?Q?7rB7pAJDfBrMBesZp1Dkmu+3v7b2SizxUIu/kxZ5SWU1SCWwSrv4UNr69rbX?=
 =?us-ascii?Q?4efdbHqQGrWkYxdMXtiKwv/R9bG9gDb8uTa/CqpRIdZmeoCCE0+K86YRviXx?=
 =?us-ascii?Q?L01sBP589X/OXkCtrkHckdv+xwvPsfz09AuiLK3aDGF0lew9qYybhd/blnWk?=
 =?us-ascii?Q?huK1sDYPUqAsgke87OYtaWb8uCDXw7ZJ7c3Pl68vXfsoCS/3diqNO2qeWfQY?=
 =?us-ascii?Q?sncStlnNx8zLGyz0v/arG0mIUPAeZQjCv41VFiZBiWHiwIdupCIYf08sem9w?=
 =?us-ascii?Q?IlNYAOk7xw+lhp74XD6fvAiAdwT1hgOYT9+JB0TuWHltBm77IFgdrH5NJrcN?=
 =?us-ascii?Q?JPVDIunrEBdj/Zkkp4Sk9af1cE+1uJPdFb9A/jXX9Z0voAf4i6T9L3AA6jeh?=
 =?us-ascii?Q?JfoNY2uQVxmYHPqP8aqHoZUFBT/x6JaTbX3Zzfawtupf3T1z0iwEWijT1IMX?=
 =?us-ascii?Q?N9aISg1cSUFyIa7hcRaz/7FYW1rumcfvgYZT81UGwoVImA288eprLyPiBEgU?=
 =?us-ascii?Q?SB3LTVSi7Qg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ryOf2l6xJDJZG1AsjS6qGWGqvDFWZu1myoMpCalf45Co8VbR+rbJp6HC3HG+?=
 =?us-ascii?Q?BmhvbITJQ7/Y3ticGe+1FGj7unZPj1CW/8RjX2xoA0OsAZWzR+Gkf1yFM9Fq?=
 =?us-ascii?Q?BRCec+svICyk/sNNuoGpZq7Chq4paZt8Xz7hDrbmPQeTdznm1qCcBYWVlGzh?=
 =?us-ascii?Q?N4WuCidRSqXcqELSmg3Fqo23VJTa4OhRFYzn0JgzXjRZFg4BHEjf9n5ffh8K?=
 =?us-ascii?Q?iVUCRya/IqgEQc2jCxZWe6FmgO+runp3J+BIZdzDplmgm3mtUXiYccW407CS?=
 =?us-ascii?Q?Q59V7kR14HsSYUWb+IQbTdbH9R/wgYgVVFnk2+RfTe/IS+v9gAZpR3IDB6mC?=
 =?us-ascii?Q?uybbh3NuL8fxsMHb5zJ1Vw7AwWazy6Su5G/XozAQQl7PZVEuGbUT0TMe+CTa?=
 =?us-ascii?Q?DR+NBW/D0KcnnXaQyaC9ucu9DSXZUGvxuttqU59fgSii4PzSwFz8Re+FwAPB?=
 =?us-ascii?Q?A/aBVt27rb8EAcbR9VcZR4Vy3kz4b9WCNUGzfnqLirAwl0SBWGzHTkGlwP+t?=
 =?us-ascii?Q?eQeGKtsbx075Osr6LuHn4ggYSbNXjgZFTFvUYtxMJ+FNtqIL1idIXIIkjJb2?=
 =?us-ascii?Q?1TBjURjvQJSHW9nyeX/RIQe6NwEAiDRXa5HXd7M3SBMWwO5r5PYcCkKrMnep?=
 =?us-ascii?Q?Oz4/ikElNTj//EVuLzTDmidaAalnyA4Gd7TlkvtgY7G+4ax3G27x/1G1DC2Q?=
 =?us-ascii?Q?kIndqPjhlvUWZ46E8JYCn3O7Ka+Dufqr/zB7bYkcEiCsnQJOVFgjfEP3Hmom?=
 =?us-ascii?Q?RPC3OgJkPclE7FPxW4bRjbi1P6kIgk3Gf/S2hv9ipv6It6Vl3NtiKjICUsQb?=
 =?us-ascii?Q?9oQRsLxb98dotJhIbdQviIQc3d4ZCTC6BMwfgn9DjOuDkoAoscHF/mVtnIA5?=
 =?us-ascii?Q?b7C6goXdtwHbME+BXK/2Hf9xsq4f6K80m4xMkLCvS9ZCNIm/NaNaYq+wN7rd?=
 =?us-ascii?Q?A6R9rz2CHNiS3zRA0J/JNXXkO/xzbSGUoEInpVSD3aAI2wE8SyYEjrujY5xm?=
 =?us-ascii?Q?sWO1b0aIQ4CCxQV7Yk846hVKNM8M0vE5yAV6MsJbRWj8dhe1Ph2DAmu7GjAw?=
 =?us-ascii?Q?mC4CRgsqdaoQC3uA8K/i5B6T8VEq9grxN6ed/4MWVKgkvoB1fbZ2ueRrUA1I?=
 =?us-ascii?Q?YZEzyNaaYTbKky3JBAYTcZQJOO9BI7zQl51bEAeZOlB8xpxqTPmhq/pEm4cr?=
 =?us-ascii?Q?/iCYFo7xqFR2j0XAuGUzV537RsGOzX4Tl4vT+tDubFotR9u6CV91mDa4w9A0?=
 =?us-ascii?Q?nhhvASxcyHR6gJWQd2iW4T35McwipaZyR/g2SaqIRHKug//B597XLWXUBdeF?=
 =?us-ascii?Q?STVeVxdMzlwTd/Aqxii8JRMqlcPOfq+jMEV8llRlXCWOs8OpDSoBniIi18y/?=
 =?us-ascii?Q?j1l4LgyN/YbrAz4bcW9n5OScoAMdDfRA+nQ5EPDidChYIgD4/E9RLFuuCam4?=
 =?us-ascii?Q?Ae4ssYjCSClITSPrUq3qna+mLBPW2Mlv90/HrKrLhu+FF1m4+yVyZdQ71dth?=
 =?us-ascii?Q?mfRmiHnFO4NYKTDB8R7WHTwuUbz5RekEVCxSbO2vla0U7pL6LtMpHMjzS8mL?=
 =?us-ascii?Q?FxuOpmJoY/6jZU9t/PqDoKViIMMOwFEmcHi7z0dM4Hth2tsAs5oJPKV5TDf5?=
 =?us-ascii?Q?nxanPLdgyw2XBKBsvqbL5w8=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: a57fd3f5-b97b-4109-512c-08ddb0d5ff62
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2025 15:12:11.6450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4GgMlkH1B8Wn1JW35d0KBe5eD/uWUJrTBj8pGOY1ScufIlWaHNmkdJKvlLV+PYh2jIceaR4U6/1WQaQq0t18mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB3033

The /reserved-memory node is inherently not specific to static-shmem. In
the next commit, child nodes will be added under /reserved-memory for
the stolen time shared memory regions.

No functional changes intended.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/domain_build.c           | 40 +++++++++++++++++++++++++++
 xen/common/device-tree/static-shmem.c | 40 ---------------------------
 xen/include/xen/fdt-domain-build.h    |  2 ++
 xen/include/xen/static-shmem.h        |  9 ------
 4 files changed, 42 insertions(+), 49 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 967ca6f375ca..85b6909e2b0e 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1561,6 +1561,46 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
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
+    if ( mem->nr_banks == 0 )
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
index 76a49869126c..4afa9107de5d 100644
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
-- 
2.48.1


