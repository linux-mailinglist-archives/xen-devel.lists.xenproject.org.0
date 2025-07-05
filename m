Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C9AAFA075
	for <lists+xen-devel@lfdr.de>; Sat,  5 Jul 2025 16:28:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1034237.1407120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uY3rS-0005C4-Sa; Sat, 05 Jul 2025 14:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1034237.1407120; Sat, 05 Jul 2025 14:27:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uY3rS-00056A-NG; Sat, 05 Jul 2025 14:27:26 +0000
Received: by outflank-mailman (input) for mailman id 1034237;
 Sat, 05 Jul 2025 14:27:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oLNU=ZS=valinux.co.jp=den@srs-se1.protection.inumbo.net>)
 id 1uY3rR-00055Q-00
 for xen-devel@lists.xenproject.org; Sat, 05 Jul 2025 14:27:25 +0000
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [2a01:111:f403:c405::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a7e9b42-59ac-11f0-a315-13f23c93f187;
 Sat, 05 Jul 2025 16:27:23 +0200 (CEST)
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:10d::7)
 by TYWP286MB1974.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:165::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Sat, 5 Jul
 2025 14:27:16 +0000
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a]) by OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a%5]) with mapi id 15.20.8901.023; Sat, 5 Jul 2025
 14:27:16 +0000
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
X-Inumbo-ID: 2a7e9b42-59ac-11f0-a315-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ShJFu1gmZKFXRQt3r32vln26i09dWxNqd5H4wZEJfeRIqu9YEQhQ5DMgDPD5lAzNIIZ3ZUalur9oqVRkgkFpQV0SBGOfZV24rZveaOWFA1uSdj9gc4GpUqdjcT479gfFcE51X7vv0f6HL0nCg57SE/CD00r2xx3d4IsWObWMnHDKYMaJPrQJH5cf8Uhp4rBP+VBVseckTfgdBr8DMf/f8BuGeq9qaNkYoW8sy6OAvAVhKJxcQLNaMm1+TWoZZ4InehgKTbUGOk1SX28uVjOtKHMdjyN0EGTHkuYzaAtBAJZTCKfBJsQd5NK9Xh/ITi2qMQyGN2ZCKyujZ3OVsNgzsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1PiVzkg44nLFpp1ep5SdZL9TIGP7LHw7KR9TS/PFkA=;
 b=rSud1m9t/vFDSmg8aVBWILKUmD7oS19rJvFuqpoCyXPGjmRLaAIqXRomGCvxXXXtCw3bPWVNYfr0fqNfc/yqvkv3KXV0uFmvY6SRi7zTdcYrJk6Y1PyeYpQDZvcwCKcyvCEnzwlLakXqR4hhBGjqTukiWBuyFtTvcvNLzU1xAVCVTN4wpYt9PcDgst8tlbebSJWFdTfgeEVhx3Ild6K2ZcmISQGtwICqyllMAO7OIK9qgSihszUysA0uNV/7g46J9kvTZSHdEeh3FhoJaK78z9RdCFB7EYL1Y0h0NKRom7NPY/OWJttha+uAYNOGY66x1F/kvu8zsXMRAS2FYkzUyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1PiVzkg44nLFpp1ep5SdZL9TIGP7LHw7KR9TS/PFkA=;
 b=L8kyaEPrk54BgS0eLAdFCOUhWUjzT1td5mSqNoCaXfMLmDJdck54iih1pxbGuuS+Psz++lbRjiXMeFJVfg9MRkHJfVEsORZ9HabiCfcv5/YUSCz7InWU2TD1sZ3r63dySkfpJ2le8EWWGUuD5Y8b3fLLfLu9J1ZHnxBGh+dxuv4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Koichiro Den <den@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Koichiro Den <den@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/5] xen/arm: Generalize memory hole finding at the final stage
Date: Sat,  5 Jul 2025 23:26:59 +0900
Message-ID: <20250705142703.2769819-2-den@valinux.co.jp>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250705142703.2769819-1-den@valinux.co.jp>
References: <20250705142703.2769819-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0117.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::15) To OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:10d::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3P286MB0979:EE_|TYWP286MB1974:EE_
X-MS-Office365-Filtering-Correlation-Id: df704434-afdd-4bcb-c906-08ddbbd00a4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gufdlzoXulLrDBlNZRKKloWjn/oXu2EQQ0eqb0gQSrUwTHkQAvtEbrR7oMbu?=
 =?us-ascii?Q?qYkuaAa6PmlKSbc20pIaBuLL4E7dHUyaa3KWXk0Goby+gHbEysD8z7tQDWsC?=
 =?us-ascii?Q?96RWSb6iqs/AVklHyeSLSEFZIdhbrK+L5WXFkGDW3DPjcnrP5dsqG7/p0zay?=
 =?us-ascii?Q?ZTGqAtD3gAbwAzzvyit0KpbtHWXF/zi+Cdfb8L6kUOyMyjU6oJxBMAVpAEed?=
 =?us-ascii?Q?K421u1aKHYuSE3ApDCiwWVScLwOSuLfPRH1jpJDPW7p0tbsDWMf0EieMOpJE?=
 =?us-ascii?Q?smPUHpN1zeX4hy4RGz+wzUKj+RrCQeiLG2QrRJhG42MXqvoNpZtEeyrI3mAg?=
 =?us-ascii?Q?Q8zqsoenLQQ4LzCPpor0PlvIiwOM5Vjgsw8A7ft8JrdzZQ/CQa73KpRan0to?=
 =?us-ascii?Q?43J5b0Gz6hEv3KgR6yVQHKHoQPduOrVZ563suWS7dmy999SCu54sp8NO68mh?=
 =?us-ascii?Q?SqcE9ItdleVypfcDP9uSv0Ku8ADoJ0iH/6eKjCJ/3+Lo7l4KtEQpcbGv1Fzw?=
 =?us-ascii?Q?L7c4C/ZsgOoCUfZHHk49BAeKXl0XsdXNkBiD0KRiE3pdQLpqUZHnR0NntgRS?=
 =?us-ascii?Q?6PRUBTIjUbQp7NxloVjfntNJ99L9h4HQSc9YHuKLnQhOfwpV/keXK4wksPbx?=
 =?us-ascii?Q?mYsP9iinIQmN0NBzpDCpi+R4gnp3hJ62m5BAV1GwO4K8cdEYkxq/cJAnbsui?=
 =?us-ascii?Q?j/+Pyzo/Igo4gSoiZieSmN24Gj55KthCenubPUTakyKafa5KbrPJqM6eIAYE?=
 =?us-ascii?Q?ic9IiOI/rhAplIN9TmEaNjalkh3KzQt0No+oYnupjG3c1NUyGZ+qCgJsAAHB?=
 =?us-ascii?Q?Nb0rYgRiYJS1DqlHzb4RY0/+wpNffU1A1++pbz77QV+VeAuy04eePYO9tegW?=
 =?us-ascii?Q?kJT6vOHy0rWBKuldZfXIs6Dlj62ssnNlo2QYfx6+M73tzfeq9XhRo13Pnzzv?=
 =?us-ascii?Q?bcfEx65DKGBb5RdnJJbgg3lV+qd8h5sTGve/lCZP/Cdor/8HIAAVMg27yzG1?=
 =?us-ascii?Q?oWMCUTOMS1DHU+++fQydGC+u2re28UHO8AouziZIB/1BUdxWH/t08GJkFNV+?=
 =?us-ascii?Q?c1UTvbopQEoF5mwXRoj13P1FmqAxvmrT8dIjRVAqbIVlHnehw9CUMkGTlMs2?=
 =?us-ascii?Q?2bQ/jctnlzuMl3hOSVMVVPBhpY/TVc4l8vJWJoorZh1CFFrYZWeF+kFxFk2v?=
 =?us-ascii?Q?PJVQ9fBnm3K/XK5ojnIxwALeDAuG+Mtr3XbI6uKK9R4OnsvKrCtnRci/Vjyv?=
 =?us-ascii?Q?rD02O1mh1Y6ADFbtIByKWMNFbFLzEEBJt+GrB4HTQZdfU93roCK7N2RpfKHQ?=
 =?us-ascii?Q?hjMGtpa6geu4whiIllgEDkAckTG6ZxoMXUz48gU951tmzMr92xbxCBq+oTGf?=
 =?us-ascii?Q?mUWdetpIk/LO97ap5QOj/+oTd7FIlqX8I1V4vkASv21njDKNMR9QTOqQ3+nC?=
 =?us-ascii?Q?VFFCFO1aAzU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WcNyyV882kBMxY19JkSNrw3QmY/id9xyUOIyaXI305bFMc3fJqlxwJ64qK6W?=
 =?us-ascii?Q?7zgPHZXrEo9PIBcrWS+ta90ORbBdcKJxp+hp3EzyDNE1Ee2qCt1t1VIIIWb2?=
 =?us-ascii?Q?NaSqQU9DA2wL+CjW7lDnCxFeJfrEUsCc3c9PSuC2/sr+gYfgHbP3aR4SG6if?=
 =?us-ascii?Q?gbJVCfrhwtI4BZFEhk9ozn/yZTG95FM3G8fmAOqYpd05oqajS6mZHeHaow8I?=
 =?us-ascii?Q?ELFTkxrZpwY7Kz5bOEHFHaRcf/tOoHEdXqM33HirMlLORaQB7Ik4q9A1wgVg?=
 =?us-ascii?Q?dD9bpq1fa49DctCE6NZ0s7V/1kXF9glGeJRfh7Rti5HP735Oqvzm0ebaGchj?=
 =?us-ascii?Q?v8BmvljuPTxElsvXVqAJNzgvdeb2/JkAk0lYwoLDboJB+0per/x0go/KusT0?=
 =?us-ascii?Q?RueFEbmCxd3TAlGaX/glYbn0ZcXEtgtpJGcUE/hwWKKj1UcvKWppCJwQU+aL?=
 =?us-ascii?Q?R4OIpOCU1wzhaAfczhADyqsXpRdFMEZ5E+/DH2oAdP7BRv6oTwkWKhmtPE/n?=
 =?us-ascii?Q?ngyL0EMDLh0CwQP07IUiwjDcx7bGZFWSZQKgwW24wqy+9GcAY8RT77AgJ8ha?=
 =?us-ascii?Q?KQ+T01wg8n8E8EcN+gtY+VQzZPKbzQsIIweWelx0SihxDvukEGAU/ykX5zdq?=
 =?us-ascii?Q?cSuOHGuuWowNPPQZL4ZpyvCoyepGZWslBqEc6QtlimHcRoMn1t0iyexmEFRT?=
 =?us-ascii?Q?NZSxWdgT0fS+o+O4GpTocUdkm2E34eVoTFPK1gtmg2KRslWvyj0FngFeOBKK?=
 =?us-ascii?Q?CB8NJ9K31F3X8jw2m/MRtGoTz3MTRVrJKjV1BqYnwJiqxAsIOQ79xs2Axm5Q?=
 =?us-ascii?Q?AL6SmsGX88C0CAShCJ/KYxP/VNqzLlwPu7FDGXLA2FbvpogApgIVqju2VOda?=
 =?us-ascii?Q?DXEn2WJo8mhhGHuuir0pkFmxP+T/WKwambw8WW4jJUPZUnD9/18JORqqbGVH?=
 =?us-ascii?Q?/jD/wecHPU5v/ZXx2vmrLSdoWnkbUhP0+KJzBSRBpAi2vrM1kTFoUxpK/KEl?=
 =?us-ascii?Q?6SmPw4tKxVkJM95O5Yh6iuD47A0T95AQ/nRg4UgDqRwqLQWsps7m3575L+nL?=
 =?us-ascii?Q?cGUovQpRxssiIDDKJXWjTaSHQuzw7+vhK34pRqydLuXznGkNV8b08nZyO6rN?=
 =?us-ascii?Q?UtlOS9KmnQ36DZwIR0flCrRDIqu7Gk9z8IeyrKJUZorz9EpIVn3f+3Q1fWHH?=
 =?us-ascii?Q?lMcdBlYeAxxz2ZIYXbprpmtAgmDi3op8+LelnVdFHm0UshoXZRW19B/ePNL0?=
 =?us-ascii?Q?4lAFHJ8NWT8v1MIkCBTgbEnBFe147ZvfS8pCJyhJYP6pa7mD+DTVYx66aPAS?=
 =?us-ascii?Q?A4mIev0EzAmcfN2fowFMHNiI/rJspbyGlH71mMQSjDnf3q1ZUVx0p9Offj1o?=
 =?us-ascii?Q?GGlYOitmhXPPemLg2Ugtw/OPReurnfqHPCDum6zO1YnChp1IXU9N3/47ZaD/?=
 =?us-ascii?Q?7CgBKKHBZJ3eidmcpYHHaWSt2RYbnXIbcJxgCAQGlfP3mr0w23GKCJ7/9ePJ?=
 =?us-ascii?Q?fXGT9HP9Em6JNMll/49B69kSCejmzqUaIcHGONpIPZfZC88j/CBlyasrK+4p?=
 =?us-ascii?Q?LnnoYGICXkC8uh2n2eWs9YbLG6H2Ckx7PWcp99XaHGz6XoGxiaKRCoprm+1P?=
 =?us-ascii?Q?if2Q7FJFXffw3fMq1A6Qnuo=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: df704434-afdd-4bcb-c906-08ddbbd00a4d
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2025 14:27:16.4309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4G9UyBj/W+2V8iKgKylnMbio79pjlH0Xs7V9VkvbxM88bXxzfampAu3bDL6Paaw9hdwTCrP2gv/tozXVt0nhbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB1974

Make the three kinds of logic reusable beyond just extended regions by
introducing add_regions_cb parameter and factoring out the extended
region-specific names and logics outside of the three functions.
Specifically in find_domU_holes(), 64MB size checking for an extended
region is deferred to the existing add_ext_region(). Also, introduce a
wrapper function 'find_unused_regions', that can be used to find memory
holes at the final stage of domain creation.

No functional change.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/domain_build.c | 62 +++++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 26 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 4ff161887ec3..42210c702ab8 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -40,6 +40,9 @@
 #include <asm/grant_table.h>
 #include <xen/serial.h>
 
+typedef int (*add_regions_cb)(unsigned long s_gfn, unsigned long e_gfn,
+                              void *data);
+
 static unsigned int __initdata opt_dom0_max_vcpus;
 integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
 
@@ -805,7 +808,8 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
  * - xen,reg mappings
  */
 static int __init find_memory_holes(const struct kernel_info *kinfo,
-                                    struct membanks *ext_regions)
+                                    struct membanks *unused_regions,
+                                    add_regions_cb cb)
 {
     struct dt_device_node *np;
     struct rangeset *mem_holes;
@@ -813,7 +817,7 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
     unsigned int i;
     int res;
 
-    dt_dprintk("Find memory holes for extended regions\n");
+    dt_dprintk("Find memory holes\n");
 
     mem_holes = rangeset_new(NULL, NULL, 0);
     if ( !mem_holes )
@@ -894,10 +898,10 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
     start = 0;
     end = (1ULL << p2m_ipa_bits) - 1;
     res = rangeset_report_ranges(mem_holes, PFN_DOWN(start), PFN_DOWN(end),
-                                 add_ext_regions,  ext_regions);
+                                 cb, unused_regions);
     if ( res )
-        ext_regions->nr_banks = 0;
-    else if ( !ext_regions->nr_banks )
+        unused_regions->nr_banks = 0;
+    else if ( !unused_regions->nr_banks )
         res = -ENOENT;
 
 out:
@@ -907,7 +911,8 @@ out:
 }
 
 static int __init find_domU_holes(const struct kernel_info *kinfo,
-                                  struct membanks *ext_regions)
+                                  struct membanks *unused_regions,
+                                  add_regions_cb cb)
 {
     unsigned int i;
     const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
@@ -932,8 +937,7 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
         if ( bankend > start )
             size = bankend - start + 1;
 
-        /* 64MB is the minimum size of an extended region */
-        if ( size < MB(64) )
+        if ( size < SZ_4K )
             continue;
 
         res = rangeset_add_range(mem_holes, PFN_DOWN(start), PFN_DOWN(bankend));
@@ -959,10 +963,10 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
 
     res = rangeset_report_ranges(mem_holes, 0,
                                  PFN_DOWN((1ULL << p2m_ipa_bits) - 1),
-                                 add_ext_regions, ext_regions);
+                                 cb, unused_regions);
     if ( res )
-        ext_regions->nr_banks = 0;
-    else if ( !ext_regions->nr_banks )
+        unused_regions->nr_banks = 0;
+    else if ( !unused_regions->nr_banks )
         res = -ENOENT;
 
  out:
@@ -1007,8 +1011,9 @@ static int __init rangeset_to_membank(unsigned long s_gfn, unsigned long e_gfn,
     return 0;
 }
 
-static int __init find_host_extended_regions(const struct kernel_info *kinfo,
-                                             struct membanks *ext_regions)
+static int __init find_memory_holes_noiommu(const struct kernel_info *kinfo,
+                                            struct membanks *unused_regions,
+                                            add_regions_cb cb)
 {
     int res;
     struct membanks *gnttab = membanks_xzalloc(1, MEMORY);
@@ -1035,7 +1040,7 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
         xen_reg,
     };
 
-    dt_dprintk("Find unallocated memory for extended regions\n");
+    dt_dprintk("Find memory holes (noiommu)\n");
 
     if ( !gnttab )
     {
@@ -1061,7 +1066,7 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
     gnttab->bank[0].size = kinfo->gnttab_size;
 
     res = find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_banks),
-                                  ext_regions, add_ext_regions);
+                                  unused_regions, cb);
 
  out:
     xfree(xen_reg);
@@ -1070,6 +1075,21 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
     return res;
 }
 
+static int __init find_unused_regions(const struct kernel_info *kinfo,
+                                      struct membanks *unused_regions,
+                                      add_regions_cb cb)
+{
+    if ( domain_use_host_layout(kinfo->d) )
+    {
+        if ( !is_iommu_enabled(kinfo->d) )
+            return find_memory_holes_noiommu(kinfo, unused_regions, cb);
+        else
+            return find_memory_holes(kinfo, unused_regions, cb);
+    }
+    else
+        return find_domU_holes(kinfo, unused_regions, cb);
+}
+
 int __init make_hypervisor_node(struct domain *d,
                                 const struct kernel_info *kinfo,
                                 int addrcells, int sizecells)
@@ -1121,17 +1141,7 @@ int __init make_hypervisor_node(struct domain *d,
         if ( !ext_regions )
             return -ENOMEM;
 
-        if ( domain_use_host_layout(d) )
-        {
-            if ( !is_iommu_enabled(d) )
-                res = find_host_extended_regions(kinfo, ext_regions);
-            else
-                res = find_memory_holes(kinfo, ext_regions);
-        }
-        else
-        {
-            res = find_domU_holes(kinfo, ext_regions);
-        }
+        res = find_unused_regions(kinfo, ext_regions, add_ext_regions);
 
         if ( res )
             printk(XENLOG_WARNING "%pd: failed to allocate extended regions\n",
-- 
2.48.1


