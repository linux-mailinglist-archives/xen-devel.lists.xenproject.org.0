Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 210F6B83F3F
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 12:02:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125986.1467715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzBSB-0003MG-R1; Thu, 18 Sep 2025 10:01:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125986.1467715; Thu, 18 Sep 2025 10:01:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzBSB-0003Kf-Kh; Thu, 18 Sep 2025 10:01:27 +0000
Received: by outflank-mailman (input) for mailman id 1125986;
 Thu, 18 Sep 2025 09:52:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hgEZ=35=citrix.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uzBJO-0002BG-NI
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 09:52:22 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28a9e8ae-9475-11f0-9809-7dc792cee155;
 Thu, 18 Sep 2025 11:52:17 +0200 (CEST)
Received: from CY4PR03MB3382.namprd03.prod.outlook.com (2603:10b6:910:53::36)
 by PH7PR03MB7047.namprd03.prod.outlook.com (2603:10b6:510:2b0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 09:52:13 +0000
Received: from CY4PR03MB3382.namprd03.prod.outlook.com
 ([fe80::2947:e6d0:817c:58e8]) by CY4PR03MB3382.namprd03.prod.outlook.com
 ([fe80::2947:e6d0:817c:58e8%4]) with mapi id 15.20.9137.010; Thu, 18 Sep 2025
 09:52:13 +0000
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
X-Inumbo-ID: 28a9e8ae-9475-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/TSds8bJKj2ewlyGJYBcU06Fn/zLwKMloIEwOze9b6YkN9WfduI3FH+fDGZ9IAl+EOrBhWpzIoh9ZS5osXjPPQAyw036ZmdxfleKhLsK8qEK0z2EALbJFCnFVoVNAZ08ZTpV5/5/bTm11GPFioqU66/SbKWmpSDk0pxBP5Od/b5EkE+IQgoRsFcW4NNNfGPwboNmMp4Wo0m+k20QRU+kZ4gJ++/nMeijJFj+OIyU5bIEDGiJZySJxQQ4CdcRrBFfWrrkGk5C8LR/MtBtMRbnPRlSRVC40/pUWxlGyVG8aKx3pIxbep0Pc+3Sp6QU5j6UMWQB+qaJPrazKvLqzeffA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktzx6CKOqAF7tJgOGNm+G3PydSf4daiAaHEhq+rcEzI=;
 b=V6mZSpDQjzRNsUn07H1IQyYI40PEyK/zGTcIIRjQj6FJphOejv78PsidwzGb+xkx7tgNxW2jowoY+ZBrOY7dKAaBsvZU/GHgycmtUKT+HOh+hQD/ZSOegfHQPiyTtSrO4L0Xn4ZJVsHTimBYuLPd/O2Ik7Rkz3fchyFjaX9Ll+IbgeVTUthmfPZPXL57HAK6B6gdzKhtGCy/RA0EzZjBl8Sr7OYNcUDGakLu/54tWksxLK/l5gGfdZlNh513VEHqAZNyJ+YImpNpZwlAK00fX+SZ/6YqDVovCEYB3Db5CzrNBMVhh2OeaoKAVeGSD+NWr9kNZV38nMNMxoGBXUOUmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktzx6CKOqAF7tJgOGNm+G3PydSf4daiAaHEhq+rcEzI=;
 b=yAgsC6hx/qBwlWJ10IYVbJFav8Bbe8aMSFxYMnlVDV2dTMYXR67c3202YzeBG3vNXKrDC5nFGDPzEmwCiWd0iiK+w8vn9QAivWsAI/TeQh+Yy5o42WLf7fA9ZpIBLJ9FsxrwLd6CYLx1Me2yM1wYahqdRsnG95brbjJVAq9P7wA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	"Ross Lagerwall" <ross.lagerwall@citrix.com>,
	"Konrad Rzeszutek Wilk" <konrad.wilk@oracle.com>,
	"Andrew Cooper" <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH livepatch-build-tools] Treat constant sections as string sections
Date: Thu, 18 Sep 2025 10:51:58 +0100
Message-ID: <20250918095203.19421-1-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0246.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::9) To CY4PR03MB3382.namprd03.prod.outlook.com
 (2603:10b6:910:53::36)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PR03MB3382:EE_|PH7PR03MB7047:EE_
X-MS-Office365-Filtering-Correlation-Id: 37109269-de42-48e7-9486-08ddf6990aab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lBn4TNAL9qZCN2LM3QRmS+U27g51OUT6r/n7Ha2XiONvFUNzA3ZE+/xJI6Ws?=
 =?us-ascii?Q?EzV7lsMwr0X3uo40ZZu2YWTisz6M/aVbQDbv986Vm4vm2h0x5/DB+OQ9zXi+?=
 =?us-ascii?Q?UnJbSfYWoQ+QMBs13lBkGVzrhbcEMydFMnELcwGyEkPhOHH5MI6WiMAaFDRR?=
 =?us-ascii?Q?GRELgg7igA8hKqGFHCvl/fSXevmtoNOvh6G4VzdbvV7Ciy2usNKbJ5RQqnmm?=
 =?us-ascii?Q?KjXugaG+yzAoheArE+0t4dzoaM3hr94f6NVLOA8gsJH3QzH+gUbLnGH7QWJa?=
 =?us-ascii?Q?QnanFCII+/8kudnkUstJNIvHX2S1qX83cLq2KAgA50QXtSHkN3/AB3Z26ajf?=
 =?us-ascii?Q?OyJa2pT9FrEydeoEAms85Zxvfv/EJpMw0Xx3t5Y6o5geVEsMEYV1hSrwIthf?=
 =?us-ascii?Q?RrzgSoy9RzSCvO/tbXAaI29tsz7yZ0YUMLmRzknR3ymjYBQOEULEBz5F4NKf?=
 =?us-ascii?Q?/DX+gEmLoqlcW5XakqnV6TzNX0xDK/dSAXo3RdXGq6Buh2kuhnu2G7ZUjvGa?=
 =?us-ascii?Q?A7qjBtNgrLgrxmY9zoJGZuIkcHOaCjWMgFZ4Ks1pY9XCLNQ9RDB4GKGsu8kH?=
 =?us-ascii?Q?8TQ2d8N9L6P9T01kM00DconYGhoTLe4hiw0YV2Sy5Fjp22EVFURFMu63DP/N?=
 =?us-ascii?Q?g4hq9ibz+0YrSaC0n89VCghdJE1PGABVijwKEFzI5FkpM50LylKZM+g4t5oS?=
 =?us-ascii?Q?XIecifCVjlFSIQDwchF1il1ENRDiRVnByo7B5brAQPQrNKY5NhZjWtJf2bgz?=
 =?us-ascii?Q?RrpskH2y+P6HH4Z328Tf+TVYSUXAsSHV4SX/ePPwI7FAHuPlbd1HXKeWjGLQ?=
 =?us-ascii?Q?nbRyQSWGoMljtHocm42/zaHZkD+3JFKcq5IIBJgpIOGA9eW9CynlFHCdqWwM?=
 =?us-ascii?Q?TYgAJnXxLBKzDtUPRmidLWNRZB2Q6ZPDiDcwMatdR16tj2wi7xto0YPQRpvG?=
 =?us-ascii?Q?9+Jn9FOQhKGnG/API5mtVfu0rw2YqYwT41AyEgPGWoCeMZrD/17mQUD/ot0p?=
 =?us-ascii?Q?dj5GjOs2bhTCC11V0sEQTaUi/Zrnb3QamWA73tXFMYnf3o/MF1QuO85c8DSk?=
 =?us-ascii?Q?L8RMzbOiJxy8Deud5zk3OjgeuXrIJxS3vWqCAVyl8KL88J1O/YAW8D5aTS95?=
 =?us-ascii?Q?Biz5+zF5Mwqoc5Be13qrv1FutE8MYw3eBpKZ4Y9kiA0t9BE2QQtmZkoRU9Hz?=
 =?us-ascii?Q?G/BOEBf1q4ZagFrmkNTQiZCGIe2bcDLO9jGyhQ3k5ftU2pKaBl6j0bxRxhS5?=
 =?us-ascii?Q?RWAnrm1LkBAAu64J2+j9z236h7Iy22YHFtvlgRimaoECMIPmXMjt6/7ZnVlo?=
 =?us-ascii?Q?QK3rwnCFkBI93iFILVXHvUWDvrus/3wS4xHhNhwwvgu7H05A1t3+d7s5Ct6D?=
 =?us-ascii?Q?Yy8Ui9XUKtJBebFU9nlx1e2WPJraAqecEbBjTH9h2lwfmzYsqdauwX3h1PT8?=
 =?us-ascii?Q?6GnccY6mRg4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR03MB3382.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UQphj1Xmh88vhmVeRqPQCS4rdiGNdQmYBAq2mNPo3tJW7BYKB2l5d3tK7HBx?=
 =?us-ascii?Q?0E7wMlve5MzFNSGepU9XLPvl5xWGQPlvsO/EXNL9xgfB501Kff8WD65Xj/GR?=
 =?us-ascii?Q?oKXaPMmtCdfqFAmGYFvxmvq58IQBk0zl3HOKGOnhvQhDYrftg5iu+L8kVbLG?=
 =?us-ascii?Q?gh+8vX79MkhuAnymIQKxZbxCm9gR0+crR5OIm3IRIt6slvJCstf58tNb4PN3?=
 =?us-ascii?Q?gnzx5fjheDszPW+qgGWa7sr83WNgOppZ0Prjg+qEijRsyrUnsq1TiGWnmYtJ?=
 =?us-ascii?Q?YoD2hdaCI324edNqezGEYVzyNfIlKlsWN7UVBpBjYF5AOU9OR9DIWWewbKpE?=
 =?us-ascii?Q?Jza7p09qa23yUfZze7E+1mz6o4sPV0hoFUZ323Sb6aVi6StI02hs03gVkyyt?=
 =?us-ascii?Q?QJDnAcWUUp9QeqN2owVrcg6+JcpSWtnT2asPIZoXCrGerlQr7UYvqD1ZEE6b?=
 =?us-ascii?Q?G3MiZUFCibWGEqCxqWIhb1e+b3Bna4iJbByqtOfKI9xaE8MHnDAqs2r/7MPd?=
 =?us-ascii?Q?2Ic3L7PUjIyRzVGQnOVlxlRfkkvau0JuZDrOqpf+5Xwvlu5l+S9fL1WrrHul?=
 =?us-ascii?Q?5aC7JoB0/DDmugLtAbXjzRKjZ0GJSA05eFLtdOl8hF3/9t3lBxprO6u/dyOu?=
 =?us-ascii?Q?0/JbqoIgAbdUT4jSI6/s1twXFy25eKmdPsKFwTdpTYmVuQmY/5IWeFdDRuDe?=
 =?us-ascii?Q?/i7rvyUUnmMzMonIQB9wd1A8mWxmZ3d4iFVG4WYJ+Ith3DFZiKxMH9mQU+3g?=
 =?us-ascii?Q?y6nhjl3QA9FxJzxnJ15gk1L+2O+NPklqXk1mMOcNCqINkHg/1RHk3aVjbNoq?=
 =?us-ascii?Q?SQZbIWNjbCEScsAYsn3wsw9p/dIaIv54n8WU+uj2rUaVg6NjpwiVleWNR63R?=
 =?us-ascii?Q?Qz4y1BKjev2wO5G7+N/t8LwfgbRJhGqTjzMKkvi76V+Yreoks9rY6yVZYeM6?=
 =?us-ascii?Q?Y1FrX4imvEZYBXyexmSI2akV9CnaZUw9ERQTKakjXtD/W6X/8Q+MoQymF48v?=
 =?us-ascii?Q?vHje9OHLKcdk7AheFD5rVnsE/KFAwvmFWrTm/lLH29B7XQRJYF17kz5Aq9I3?=
 =?us-ascii?Q?uoFQpYivWY/zWFp1jFJzZqd6V9/vtLCyhkblZOoi0Uk/9Caw7EnfGs2/q9Zi?=
 =?us-ascii?Q?5GEkvNtVGLSenpYjaeaV+v41C71/ozHnplqwerQ76GKS65Mzsaz/lI9mmRcO?=
 =?us-ascii?Q?mM9HNsqYooV/ES9b/fesrVsciHoNCF5RvLbJM7HHeS5QC012LiqxrbLP7L9j?=
 =?us-ascii?Q?NRC9kJYjN4cgdByPNuilDzIgpRJEKpt5Euo8hhxBNmPIRSqiHlOsZP/A1gHD?=
 =?us-ascii?Q?V10r0AEM9UVoi7WysSpKQHw9fjWwToMz2p+40F3clvhfh2fSm/rLkScBxpW/?=
 =?us-ascii?Q?JCabuePM6QjwyrrxLK9wT1QwiCZrfDM7a0LKd8F+8FvyAWTaydXNMsWwhZmx?=
 =?us-ascii?Q?sip5l9mbqPBYvp+Ea/U9VyCc8f7Hqwue4fldE106Fp3cQ6cJKdgahqSdu0sP?=
 =?us-ascii?Q?GT4upds8gu+B5I/bHMoFRcBDgxFJo63YsGB4Q7RCZyrbERNhnKND1z5BTccj?=
 =?us-ascii?Q?i+JqLIYNtTkn44GMQHR/Ce/JNS/TJ3+rYx5wENM4DhoXIeisnM+msGW/QihU?=
 =?us-ascii?Q?7g=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37109269-de42-48e7-9486-08ddf6990aab
X-MS-Exchange-CrossTenant-AuthSource: CY4PR03MB3382.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 09:52:12.8693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MFFntwDHClaazKv41AD/KxB6t/zQXIjuYSvMYJoZ0RQ+f9fiC40SCz8/kPK4KE5/ARR5FPi79bORhiLKHvnKAdz7P9SyF0wmtaNYtV8ypXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7047

Newer compiler can put some constant strings inside constant
sections (.rodata.cstXX) instead of string sections (.rodata.str1.XX).
This causes the produced live patch to not apply when such
strings are produced.
So treat the constant sections as string ones.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 create-diff-object.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/create-diff-object.c b/create-diff-object.c
index 7e6138b..7acaf88 100644
--- a/create-diff-object.c
+++ b/create-diff-object.c
@@ -1446,11 +1446,16 @@ static bool is_rodata_str_section(const char *name)
 {
 #define GCC_5_SECTION_NAME ".rodata.str1."
 #define GCC_6_SECTION_NAME ".str1."
+#define GCC_CSTR ".rodata.cst"
 	const char *s;
 
 	if (strncmp(name, ".rodata.", 8))
 		return false;
 
+	/* Check if name matches ".rodata.cst[0-9]+" */
+	if (!strncmp(name, GCC_CSTR, strlen(GCC_CSTR)))
+		return is_number(name + strlen(GCC_CSTR));
+
 	/* Check if name matches ".rodata.str1.[0-9]+" */
 	if (!strncmp(name, GCC_5_SECTION_NAME, strlen(GCC_5_SECTION_NAME)))
 		return is_number(name + strlen(GCC_5_SECTION_NAME));
@@ -1462,6 +1467,7 @@ static bool is_rodata_str_section(const char *name)
 	return is_number(s + strlen(GCC_6_SECTION_NAME));
 #undef GCC_5_SECTION_NAME
 #undef GCC_6_SECTION_NAME
+#undef GCC_CSTR
 }
 
 static void kpatch_include_standard_elements(struct kpatch_elf *kelf)
-- 
2.51.0


