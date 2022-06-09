Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E48465448A9
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 12:21:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344927.570560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFHn-0005zR-O2; Thu, 09 Jun 2022 10:21:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344927.570560; Thu, 09 Jun 2022 10:21:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFHn-0005w9-L1; Thu, 09 Jun 2022 10:21:07 +0000
Received: by outflank-mailman (input) for mailman id 344927;
 Thu, 09 Jun 2022 10:21:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jWvP=WQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzFHl-0003pZ-SD
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 10:21:05 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe06::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de436bff-e7dd-11ec-b605-df0040e90b76;
 Thu, 09 Jun 2022 12:21:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 10:21:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 10:21:03 +0000
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
X-Inumbo-ID: de436bff-e7dd-11ec-b605-df0040e90b76
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVZltJrc9tJhV0TJXGKBJiv/jE/uZjLNuGyZ5b/s98sAkRMerr2SokaV857aSrFPexBqn4XufxBrK6NjItyvYkUpKKeMxX0/G7sGe3Xi2RV7Tcc4+kR/Vgd1jo5WMHAzcYYYlp37qdVnTFQgQKEGIEib+0MKldYovzSygBhTI7qYNwuxuT47Csh7IzogDCfxhYdMIDCGATUWOwQGZW+E/0yjLRUPSPnRB0AHKt5gpYWS0vqOkxPb0L5+OJ2iCe23Iiwd9t+89kCrJKtx/ZXL4IlO1ygresvekFSZBY8zF4ulHqvTOWn3jURkUXhMDaUt104RmUccnpm7JlsS4ti53Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DfKw4w4lT3delgxvxQXi2BzPNtcGD1oKtqm/W3kaSWA=;
 b=Af97b+RCDElkLr8SANvxVYT552+x3K/XZdoeBTjV1zaPMH7xVSkllS32207WYmDnFn2T1D2Cneh4OminKErMQB0BkaGeP8u5Yk7WkZnEBXJJFBcoxhNY00ZMlO8rRLhvcEkw0Xg+suFn5HB/eJzouIWp93BnIxJhddd/GHnPOjbKyoMip2L2uBlcWsBY9uuz+P5YOsca/Dm+grcjKKwwf3Wb5BsmCqyVOfOZroJMCl8bIuyWCsTpZN+mI++DM1DNCP7US15Ls3DcWCLF10P9yWTKF9ArCHwOCqRTaeG9VHoP8HUiND0YsqnNRAekRQbAeyyp8goyu8w9aq3BA9XtYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DfKw4w4lT3delgxvxQXi2BzPNtcGD1oKtqm/W3kaSWA=;
 b=tptJBasTf5Dw6WYVu/scgPvrPQISklOLfF2Oh0wDBm0vuDFUNdJvZnIWwGR2WE3RGFPRSLg6z6o+oz3K4Q54cwGNy/ODUTP5JQwIcaqPPe3+MyHyICs9gdZDUMA0SHrDmuNBya9yp5N2CBsEEHetFd37/NRSf9WYxsoOGM7/XKdaPjIULjlSh50ldfZ2f96e5mDQM+Rl/lqaIoDrVtE6xFAl4iC14PXMcCxXh+PvGc74f7Ijagq1IpcuW3Nme95EYL6ew03g+jLmyQgROj0cCVRbuNYiDJniyvKobgZZWl9ByYE3ANO/omhcCo+hDtC/AhDq8dLibTa1gBysK+eGrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0013f62e-395e-464c-30dc-e8e800b1a976@suse.com>
Date: Thu, 9 Jun 2022 12:21:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH v6 10/12] VT-d: replace all-contiguous page tables by
 superpage mappings
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e873e30c-7a04-a8a3-2fe5-0dda30e654fe@suse.com>
In-Reply-To: <e873e30c-7a04-a8a3-2fe5-0dda30e654fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dd9b4b4-8c06-4b0d-8847-08da4a01c18d
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB87904A2FF9EEAC139F077E2EB3A79@DU2PR04MB8790.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K1SpXDsla+jeYa1FpP3Ie45MYaTA2fKc+ldvPOorZdsR2pj0bQKg4tbQYKqpBnuv4pJ+vj2qOWoIBEYZUPcdzw4HpF1BxDt48iwFnC4/Tez3Lo5Og1sMCH3TUFo6B6ci2ZBRyCzzwV0XJ4wufKsHe40giL7dS9e3IERfSXRXzqMne5ONVnfZ4US9h+YfccUn31gjjnc9RR9SK3grQ1Zli6dYdLrAGN1kmQaNIp5HoEomDGMDNnon1QswxuxQ5NIxzcNlhY7rSqNVB1YeZXy4tjvbBBSDb0mhd60U6QiKYfKjRLS7D+oeeLBmkMwQPSnWfB+loaf/ZRyCkwsn4IBPXpxxBLxmyOd4aMDhR3xp4NgBPn67yNDcJ2x7Qgs4LO8MSWIWP/tmtRlv0pzHwHdGjEPjYkQ6sFbqrHsPOe57ACs3fE3PR+jRJ39wfBn5qiEaphPrEJyMVxuLMkUaN5gkOUkJO/Qo1oWGvauzlnNUx4PbsO6vsRup6IxDN1wJS96r2d00+30hbNAmJZNdZt8WcEi/WnCd3sRECr7eWEo33qcNPmobiE6JIuRNzjq5RRoeiwMDShdI6iDiQV1AtgH/cregqHFpgoutvX1oCC43l1yflO7OsCIQgOFCO9PC3IiKrhgx7dbBOgGY3qj21UnIIEOu7jT4XBmNp9m8lOSaxbefUxtBvSDG0eQs/nd6qTgILQK12ESyoCfGJxrOWhglGDe/UQXyrBPTPcGLJDKf4bbzYIHcNEESAE55SxN7d9eC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(6512007)(31696002)(6486002)(6506007)(5660300002)(186003)(66946007)(83380400001)(2906002)(86362001)(508600001)(8936002)(36756003)(2616005)(38100700002)(66476007)(66556008)(8676002)(4326008)(6916009)(316002)(54906003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDVWbzJ3L1V1VlFBT2xuTm5pdVpBY0FsUWFPdHp6S2xSNkswdERtK1Z5S0dE?=
 =?utf-8?B?ZVViZTBrK01mekErcEljZFFCU3Q2YkZxakxJaEJqV1NGRnhPcWgxcXA1bk1z?=
 =?utf-8?B?VVJ3aFRYWVliOVFjRnlYYU1ueUNFcy84eTNHc1Nyd3hkV2o5QW1oQXdhYVU1?=
 =?utf-8?B?UDMyaDE4ZHdnbXdPSktvYkpSbDdaSi8wTFNKUUNENlNNY29TSFk1K0tZdE9u?=
 =?utf-8?B?Wjdmdk1ESWJoeTJ2QkU4UHhaVFdqdXhPNUxpUmd0eEJCak9oaU9tZnBtL1hX?=
 =?utf-8?B?QytVRjVhM3pjNjBRdG9wNEptZ1liSjE0Q2ZBNy9acXRpMTIzU3hRYU1GMzdE?=
 =?utf-8?B?TVI0a2VSUDFVZm5DRHRVb1pNOWZMQVdXRTl2M0dXVWN0U3lqYmRza3lvV2s2?=
 =?utf-8?B?VXJnb3NtTGdUbFg0RWFUSkRlNGZzZ0xOcGhDdWpKck0vc0FpWk5OUjQxVVB1?=
 =?utf-8?B?OE5ISWp3bllPZ3RvcXVjSzFSS01VNHFoMEJpdzN5RHovK2E3WU5XUENhRmlP?=
 =?utf-8?B?WitudStwUEFqNktKRGdNb1U4d0FpQkRHVlpzQUJLR0FIbHNFcTJTRFRRakQ2?=
 =?utf-8?B?VExEQnVkWnAyUmV5L0ZxMndwTkNlbHQzQms0VSthTWxLV2w4QW9HNnZtRkpm?=
 =?utf-8?B?b0UydGU0UE1NZzMxemdlMStFMVhSbk5QNjBPUjFQZGNVMUg2ampuYTYySFZN?=
 =?utf-8?B?dEZIRExCMmN6UnJ0WnVLUXRxTGU5TG5zdzN0cllXeWs1ZjQ2ZG1hM1IwTGMr?=
 =?utf-8?B?MEhFazBuaDd3M1gvK09GZFNJNFRaRzF1ZXpjRnY4VlZ6QzJLRUJZTlNaSU9k?=
 =?utf-8?B?SkFwSERvSVNFNTFseStScWZnMFZBbTBJeWVXQUkzZzgrZXZyWjBqUzdjcmxJ?=
 =?utf-8?B?V294N0ZuZ0Z0Y2NnYWxIOTdTSHpnYnhWcDhobFBBS3BVd1JNeXQ2UTU0bFRK?=
 =?utf-8?B?ZnYzYmhLK1B5d1AzMldSY1JrSGhweFpXaGtpV3RVMmx2M3ZxNWJ2dmJKcTRJ?=
 =?utf-8?B?Q2lhOHZtOWlpcWZ5TTVkZDU1ZDllRVhIRFh5Mk5mL3A4dU4zT1FqYnV3N29a?=
 =?utf-8?B?bC9KN2hKallYRjhhMlVXNXQyWUQzRy9wOS8wWFp6NG0yUFpYOUovYS93V3c2?=
 =?utf-8?B?SW1zNlFRVmRSemUyUXlMMUxEbkdTbkhONFkrUjFmNzNOVXArZXdLdVl4OTFL?=
 =?utf-8?B?RkJVV2hTSHJmMFNyOWdEcllFQ1dlVWduMU1qNTBUQ2VEajJ5V2R4b2Q0SzZp?=
 =?utf-8?B?NittTDBheVdUSW92YTVLeG5NcVF4YXhTMUpBV0x4WTRWb29HQVhQNFBsUVZE?=
 =?utf-8?B?VU1MMVByVUZueXpRUnV5VS9rQWV2MUxVOUdNL20veTlFSERrUDZDYzgyQTBv?=
 =?utf-8?B?RE5OR2lYenAzWWwyQytZZ2dCcnJ5TDlpRmlXNDlOeU5sa1JPeWJXaFp4N1ZW?=
 =?utf-8?B?ZHZRRFNSRHhjQm8rRElpaTJhWE9SM20wMldBSm54aWlMLzExR0NBZ2htaUtP?=
 =?utf-8?B?MnJ3Y09VZDRCUmhBc2ZqVFhHTHZyK1BOb0tvS2hPemZZNUNPTCtvcGw2SGRE?=
 =?utf-8?B?MzZyeHY5Rkxlbmw0b2xTczBWd0pWZHpFNFZHdnV6YW5mSzZ4K252QmJ0WUJv?=
 =?utf-8?B?UURNSm5vZEdhR0Rnd1NCVXVIUEhFMS94V2tiTFBDbElSby9selNieTZpYnIw?=
 =?utf-8?B?eGR4WlRqL3A4YjNJbEJTcTlDT1hBckZ2MmlKL3N3Z0RjV3lhODZLbGhrK0JR?=
 =?utf-8?B?Y0h2Vk45QlhCb0xiNUYwNHFkN1Z5WVhtZHZZNDVveHJqNmQvUmduT092eEZG?=
 =?utf-8?B?RUVzblZ2Q1BjVHBvMlpPT2xKMFNzYnVMVjJsMG11a1pVeVgzSm5Reng5T0Np?=
 =?utf-8?B?eFl0akNxWkRSVGI3VlFWcytqVXpGclh4Sk5FZmR6RkFjZGRkOFNINTg2aE1K?=
 =?utf-8?B?RGtKVDQrK28xakcyRk1pZEFadkx0TmdKaEY3ZEhMVkVHaFdONFlBdExSNUk2?=
 =?utf-8?B?TzFoUHNBcHNBYmRsWFZhMHZHYU5vQ3ZQcGFtblVuSytaejlwR01UNktacDRq?=
 =?utf-8?B?eEdhVW9DN0J5M1N6S3o1a2REbGxKbm56cjBici90eUYwRkJuVUJra1BOR0tJ?=
 =?utf-8?B?MkpCaGhuQ0VHZTV3dldvcUFSenM1dHVPOU5jZHBFVEtkVU04YVBKaFpGWk1a?=
 =?utf-8?B?aWpHeTNYNmtpaFhHMms5amNRU2YrWUc3Vkp0cTc0a1FnV25SYXNGdjZ4UWNP?=
 =?utf-8?B?aDk1SVEwSHJJMzZLQTA4Z1ZxYUlDRXk1VmRYNmVSQWdKUUNXNTlFeGJNdTF4?=
 =?utf-8?B?bnk0U05SVFlUdG9vSTlnMk5OdWRxd3VYZFBLaFdsUEswdGExV0lXdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd9b4b4-8c06-4b0d-8847-08da4a01c18d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 10:21:03.0766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PtGJt879e4RoS3madOEV4blfsfIosL/0oxgMzSHlMzqxBN2vo2dmkLnAiPyIygNfxRDK0ZHJF/6yYI9s4m0vvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8790

When a page table ends up with all contiguous entries (including all
identical attributes), it can be replaced by a superpage entry at the
next higher level. The page table itself can then be scheduled for
freeing.

The adjustment to LEVEL_MASK is merely to avoid leaving a latent trap
for whenever we (and obviously hardware) start supporting 512G mappings.

Note that cache sync-ing is likely more strict than necessary. This is
both to be on the safe side as well as to maintain the pattern of all
updates of (potentially) live tables being accompanied by a flush (if so
needed).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
Unlike the freeing of all-empty page tables, this causes quite a bit of
back and forth for PV domains, due to their mapping/unmapping of pages
when they get converted to/from being page tables. It may therefore be
worth considering to delay re-coalescing a little, to avoid doing so
when the superpage would otherwise get split again pretty soon. But I
think this would better be the subject of a separate change anyway.

Of course this could also be helped by more "aware" kernel side
behavior: They could avoid immediately mapping freed page tables
writable again, in anticipation of re-using that same page for another
page table elsewhere.
---
v4: Re-base over changes earlier in the series.
v3: New.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2211,14 +2211,35 @@ static int __must_check cf_check intel_i
      * While the (ab)use of PTE_kind_table here allows to save some work in
      * the function, the main motivation for it is that it avoids a so far
      * unexplained hang during boot (while preparing Dom0) on a Westmere
-     * based laptop.
+     * based laptop.  This also has the intended effect of terminating the
+     * loop when super pages aren't supported anymore at the next level.
      */
-    pt_update_contig_markers(&page->val,
-                             address_level_offset(dfn_to_daddr(dfn), level),
-                             level,
-                             (hd->platform_ops->page_sizes &
-                              (1UL << level_to_offset_bits(level + 1))
-                              ? PTE_kind_leaf : PTE_kind_table));
+    while ( pt_update_contig_markers(&page->val,
+                                     address_level_offset(dfn_to_daddr(dfn), level),
+                                     level,
+                                     (hd->platform_ops->page_sizes &
+                                      (1UL << level_to_offset_bits(level + 1))
+                                       ? PTE_kind_leaf : PTE_kind_table)) )
+    {
+        struct page_info *pg = maddr_to_page(pg_maddr);
+
+        unmap_vtd_domain_page(page);
+
+        new.val &= ~(LEVEL_MASK << level_to_offset_bits(level));
+        dma_set_pte_superpage(new);
+
+        pg_maddr = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), ++level,
+                                          flush_flags, false);
+        BUG_ON(pg_maddr < PAGE_SIZE);
+
+        page = map_vtd_domain_page(pg_maddr);
+        pte = &page[address_level_offset(dfn_to_daddr(dfn), level)];
+        *pte = new;
+        iommu_sync_cache(pte, sizeof(*pte));
+
+        *flush_flags |= IOMMU_FLUSHF_modified | IOMMU_FLUSHF_all;
+        iommu_queue_free_pgtable(hd, pg);
+    }
 
     spin_unlock(&hd->arch.mapping_lock);
     unmap_vtd_domain_page(page);
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -232,7 +232,7 @@ struct context_entry {
 
 /* page table handling */
 #define LEVEL_STRIDE       (9)
-#define LEVEL_MASK         ((1 << LEVEL_STRIDE) - 1)
+#define LEVEL_MASK         (PTE_NUM - 1UL)
 #define PTE_NUM            (1 << LEVEL_STRIDE)
 #define level_to_agaw(val) ((val) - 2)
 #define agaw_to_level(val) ((val) + 2)


