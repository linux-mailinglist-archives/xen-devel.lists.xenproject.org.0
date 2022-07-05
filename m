Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B955B566E9C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 14:48:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361161.590522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hyH-00059P-Qs; Tue, 05 Jul 2022 12:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361161.590522; Tue, 05 Jul 2022 12:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hyH-00056c-JE; Tue, 05 Jul 2022 12:48:05 +0000
Received: by outflank-mailman (input) for mailman id 361161;
 Tue, 05 Jul 2022 12:48:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8hyF-0004qy-Fs
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 12:48:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2067.outbound.protection.outlook.com [40.107.22.67])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4afddd3-fc60-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 14:48:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5252.eurprd04.prod.outlook.com (2603:10a6:208:cf::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 12:48:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 12:48:00 +0000
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
X-Inumbo-ID: b4afddd3-fc60-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nm3IJ4XilEA5dQuHiLq0ypPMUDrcfS9yHJVrPCwgx/BxjECU73yZOWB0pkDlB4HmBcmklt1Lz6cT0f7a9adZCr07nYvRsrhVFDAhKst2mSclsuzq417yXvmnt4NHnbVC5PO6ZBQZa5UeGdP70CNTsyqDoRhn2CWLuBLkuWKXg14xKKBeQNBhtI25ReJZqJaK71yeGBTF3fXia6xlvN3CUKN/c5k2d23Qk0fjlcuV88T3grPQBKX2/nWxv8/pRGfP4atzrjnlS/WfqJ4EqgDoPhh88BeE70m6QtME5NLvRuGOjQpm//1Zdq0XAYiN+vzhsL0G3SVOH0Fi5XayEjL5Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1SRbMZ5vtUn4A75NysmPVCeWEjl1KBkL8Pu3NNkQeY=;
 b=cCRCT5sbnFJsYYp/dLCVIAyMhqlinWAfrijRae1CyliIsgVnvotXTiOl46e+vGa94jPqCoLoPofOjdue15L4lHDeC+o0Pxnxk0o08RNoiBvgXO2YkzreuCNzBBkyjvg0NUHWhqGmA9xM+injsqCHpk/pOaEzMoHQQnzdMgpG7OqW7XreG8xydMgZDTiaJ9wkcr5h3gFNOXA0R9s+Ln9josbXelelbaWRcgFWfEfcpXfvSFv9DPG6okiV6iuE59OFiLCQ1m2oqNodIjO1vPAWnfQMyKXr1NuTwObtw68N/8XO7/TnP916waTb9u9SxKW4jRt/rrgxfSOAKnXOHB6Omw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1SRbMZ5vtUn4A75NysmPVCeWEjl1KBkL8Pu3NNkQeY=;
 b=OWe7mQQ1XegK+LkJ7EX8uhxjrh6da1L0UQKlZmnJYy5aTHCEzU8AiqM6hOY3kB7NdBLtsQV7QZkTnHfDeOAcg8MjcCbAvzmJjRIPbpOlpVO+6hys6sBfaEgLkCxBaYPk9rYhmr1oaAq9PINmln2uJeemGWiHrGitEMAJX01AoDq81a5/fzxqIs3yBoA0bZhgjOQWffWxG51S3GGAJEkb5H3Ax2vwuk1NCr7R8KmN2VHml7UMBDe1o53ORAu3G3ijN00Tsj57fZZUu1VuzhaFu6Ti/+056VMa94XrXqvvAFniARRHvloZ9+SS2aicbMBU5J+TKKGV1ZiFpR86wrUQUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8b375834-5f36-c1d5-f13d-dc9bb7b53134@suse.com>
Date: Tue, 5 Jul 2022 14:47:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH v7 09/14] AMD/IOMMU: free all-empty page tables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
In-Reply-To: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfc798b1-66fb-4430-4631-08da5e84902d
X-MS-TrafficTypeDiagnostic: AM0PR04MB5252:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i8eYTngNIfSMExO9QXmyQkMhACZnADrE7jxudhD9cU6ElmI2uQZsPamZWb71zdKjHpZRAFM7xF+sYCbFyjsPqRyAqQjD7cIQDLq4hKJwDidchauKEZFUATwggkmswHXPYkgTQxnpVc3kW1B6vKwRifA2PpFEf/X7byRFjoVfXDcXGMCI5E7KemKVbLwR8+/SrgRW6okOgLPYZn9GnTH6Zxb2eVNjyaHSRQZDzZw+iLn+8PRFG46Z+cefEmTOy4neEAWynrtryRx3KTr/6IYWCLz+JN8g2200JzNRTZgM/v7EnuSUmVWYctW9QYGX2BICOYHNqjzN8rdztoBceeLKSVS70eRirsi35RiY3e5aRMPZf8de2FYu9C8VamK34Ruo1R0TpPFi4x0VZLEBIErsD6x0r034tLWJjF+w+RdcpxQj2uEcz8B4vc/g16nlONz7/DI6ZUkTSQBpb3LbNAGgKPg7vpU8pmMLKQtIAIOlmkc7b75enoo8ubrr+5tzxF9KVhqyfpdq0nIS5pTbQR59I2jSus+BzZBSa9CJnOc/pbnUaDJb1HIJTQd8LKQZpbIay/WlvrNT/Z5hr1gQRZPykt8BCEuOBMtV8IZrLquEnsW3dtHj6qMajyFRnBI7menEKqmEZNC7PUXgdcMHK6TvEMFDJU+Z9IT2lxpsXKHj/SuTvYR1IpIdvVUVB6YPBjRSog/lXsjlv1fHgjY9UOZmj3D1D0G3fmQuFE7+4PqmQKIgg/p+qI84NIym9i373gPL8WPuOgAHJ+EMOQ1A0MqEP5ozqqCJhC3mTzxvWCjCnxP5HGmMRcGbjfdFqxikCAtKssu8p3Nwu9TOGQW/c16wIg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(376002)(396003)(366004)(39860400002)(478600001)(5660300002)(8936002)(6916009)(54906003)(316002)(86362001)(31696002)(6486002)(66946007)(4326008)(66476007)(8676002)(66556008)(31686004)(2906002)(83380400001)(2616005)(186003)(6512007)(26005)(38100700002)(41300700001)(6506007)(6666004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aktlcHdjNnFQVkRiRFg0K0JwV3dEWnNKcTMyTzFTM1ZJVTg2cU5BRE11OVds?=
 =?utf-8?B?UEV5Zmx5UmdpbGNKRHltMnRoY3FOVkt3NndacGtEcGNMa0xmY2VvaXVDVzNP?=
 =?utf-8?B?aHROOTEzWGgvbGYxcDkvZVh0clU0NWNyWU9FRVdXNGtJNWJEelhSOFhYUWZw?=
 =?utf-8?B?R1pnUXAyNmdsTnQ2eGxFNHk1TFhQelJUNXZLVW9uSGJhdDhLUURlZTBXU09W?=
 =?utf-8?B?TG5GZjdRNHF5ZHErWGdyYzQ1c1g1WHNNSWVuTDhlM1dyVUllaWE1QU40NmRL?=
 =?utf-8?B?bWd1dm5zeENZZ0hJUCs5WDhPZWJHck1zT05uQVR5U281NC9FNk5xUVVjaXpa?=
 =?utf-8?B?MVhRemdueFZ5QlpFVEpKRVNyYVIwektNVnV1NFVzSFRDd21JcklnK25Wc0ZQ?=
 =?utf-8?B?dS9wM05kZnNaWFpLYzRwN2gzYzdNTng3Rmo5V004M1laSGJpa08yeXdVVFlP?=
 =?utf-8?B?bk5HNEhrQmxOMVVRT1VZQkg1b1E0TDF6a29pcDA4L0xBQVRtenR3SzMyczZU?=
 =?utf-8?B?S0djRlp4SkdBV3dIMmxtaWU4a3hxdElyVGpuKzU5d0JuaERxajJ5UkNJckdN?=
 =?utf-8?B?UENKb1N1YmgzNWVSU2hiQXJKNzI2NnhrR2tBRFZqNXl4WFR6UFRnQkhqcXpa?=
 =?utf-8?B?ZCtxanZVR2ZQUmMxajB5ajJhMGhpZ2tkMjY4OUo1VVI0aHZLMHgrZlpFbWZo?=
 =?utf-8?B?N2pNc0ZGSDNMVFBFUFRyT3BSaHMyNVJQM2VTSEVtU2p3M2s2Z3F2eHM0aVky?=
 =?utf-8?B?QXZDUlpXdnB4amlMSDdzVGpoK0ZvMnl2cTlETUxlM0pIc1dDNHc2NWluQVBU?=
 =?utf-8?B?MlJpeEVrTFNZL2thMnBsWDBpN1kxTFpNTGJsTjJjSEs5ODRnZ1dnYmpmY01a?=
 =?utf-8?B?ZWxjdVEyM3JzdFFIYlZtWThhcTg2VlZaWmlZTy9Sdm5EMGtzWEtMQ2QrVEZN?=
 =?utf-8?B?MWg3dm42REJvZ0RQNi9OdHc1ZEVXRE5qRnQyT2ZHRWR4cExrdGZ2akRkaGNF?=
 =?utf-8?B?UDVoc1dqMUo0dFJOMEltQWpsSHNjRmJBaWp3KzBNMUhldms1Y1ppTXpDNlVk?=
 =?utf-8?B?N3RabkV0b29ZUTV1V1R0aEVkeGphV3MwRTFZd3lCTlhPZ0Z2MXZKUGI3QVZD?=
 =?utf-8?B?VHpYeTVXRkplU0toUXlMd1IxMVFzTUJQT2RQbmRTVDFiMHBaNTRJT0QrYVRJ?=
 =?utf-8?B?QlorZDVuYTFaQ1lTczdvTHVSbzZHOVNmKzZHalZjSFV0em9RSncrOC9ycysy?=
 =?utf-8?B?MFN1cVFmVVF4Ky9JSUszcW9Lc3hxYW04Skl3L3BZcHVyVGdFMUJlUGxtQ0t1?=
 =?utf-8?B?OFRFWGtWY01ZL0dIUmFJUUlvUit1SUFwUVdnNUVKZWpsQTFSRkMyY2d2ZWlV?=
 =?utf-8?B?TkZva1d5ZWhPVk1lSTVUYXZOWXFJck1CeGQ4c3hiMFNDd0FWQ1V0RzNjRk9m?=
 =?utf-8?B?TUMzWWY3RDN6LzFZd3lFZ1NJdkpJdFJDYlM2R1BZV0t0cXdkaHl4SEUzbXBn?=
 =?utf-8?B?cVJFYXFBKzl5d2VkQ2hVc1J0N1VMWFlwY2dGRjdQWmlSOWxUREtheFV3cm1D?=
 =?utf-8?B?MkFwOE1NeUdNUlJUVVhiYWZWT3FZSDY4YnR2dFNrbnpqcVRsMTVJalRNWTV2?=
 =?utf-8?B?ZjhsUEFjTlBtaml0OCtGV0UvNlBiWDJoQ1ZxTy9vWlRGR0Z2TFF3dkJGUEov?=
 =?utf-8?B?Q3puYityYkJvT2lGQ2xsS0NHbkYvZnV0dXJ0ekp3bk11bEVxdnNkcmNuZ1ow?=
 =?utf-8?B?MjZrUVRjVWJQeEVGRFQ3YkJabEhjcDdyaS9Zdi9sRDRSbGRXdEJCamdFZlRN?=
 =?utf-8?B?bXYyMVhUcElIL3p4K3dHWjVtb1pkSjFsT21yMUNFd3Zja1pwQmpzUTV2aGg1?=
 =?utf-8?B?K0hYZjJURmdOaVZUdTF1ZUMyQ0RrOHNCTWIvWDMxY3B0SUtPeGVVK053bTV2?=
 =?utf-8?B?Rkk3d1VJbU45enZqRnJ3V0YxcTBtQ3RCcnBaSHJYWXRlQUJ2WHN3M0hQY1Nk?=
 =?utf-8?B?bGxQM0RKMG1CcXhObTVQWEsvV0lvZ0I4MmYwOVY1ekQ5OFkycDdvT0RZQ0Vi?=
 =?utf-8?B?TXErWlJvUEdNTnBoTkhjb1ZwT1B0U0dtOHJxMHBqdUNFTnVjckRTNlZCL3k1?=
 =?utf-8?Q?lQvyHCC0xHjfMn6s8VsclPvO1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc798b1-66fb-4430-4631-08da5e84902d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 12:47:47.5176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HhKj/Gwz7LR4mr+KHf6MrEZD2xZXCne6zeiyd/uhEbtlkwfQrzu3fB+UwA3tvgZrKBMJmrR7RyvL0vOmCFVmkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5252

When a page table ends up with no present entries left, it can be
replaced by a non-present entry at the next higher level. The page table
itself can then be scheduled for freeing.

Note that while its output isn't used there yet,
pt_update_contig_markers() right away needs to be called in all places
where entries get updated, not just the one where entries get cleared.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v5: Re-base over changes earlier in the series.
v4: Re-base over changes earlier in the series.
v3: Re-base over changes earlier in the series.
v2: New.

--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -21,6 +21,7 @@
 
 #include "iommu.h"
 
+#define CONTIG_MASK IOMMU_PTE_CONTIG_MASK
 #include <asm/pt-contig-markers.h>
 
 /* Given pfn and page table level, return pde index */
@@ -35,16 +36,20 @@ static unsigned int pfn_to_pde_idx(unsig
 
 static union amd_iommu_pte clear_iommu_pte_present(unsigned long l1_mfn,
                                                    unsigned long dfn,
-                                                   unsigned int level)
+                                                   unsigned int level,
+                                                   bool *free)
 {
     union amd_iommu_pte *table, *pte, old;
+    unsigned int idx = pfn_to_pde_idx(dfn, level);
 
     table = map_domain_page(_mfn(l1_mfn));
-    pte = &table[pfn_to_pde_idx(dfn, level)];
+    pte = &table[idx];
     old = *pte;
 
     write_atomic(&pte->raw, 0);
 
+    *free = pt_update_contig_markers(&table->raw, idx, level, PTE_kind_null);
+
     unmap_domain_page(table);
 
     return old;
@@ -87,7 +92,11 @@ static union amd_iommu_pte set_iommu_pte
     if ( !old.pr || old.next_level ||
          old.mfn != next_mfn ||
          old.iw != iw || old.ir != ir )
+    {
         set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
+        pt_update_contig_markers(&table->raw, pfn_to_pde_idx(dfn, level),
+                                 level, PTE_kind_leaf);
+    }
     else
         old.pr = false; /* signal "no change" to the caller */
 
@@ -326,6 +335,9 @@ static int iommu_pde_from_dfn(struct dom
             smp_wmb();
             set_iommu_pde_present(pde, next_table_mfn, next_level, true,
                                   true);
+            pt_update_contig_markers(&next_table_vaddr->raw,
+                                     pfn_to_pde_idx(dfn, level),
+                                     level, PTE_kind_table);
 
             *flush_flags |= IOMMU_FLUSHF_modified;
         }
@@ -351,6 +363,9 @@ static int iommu_pde_from_dfn(struct dom
                 next_table_mfn = mfn_x(page_to_mfn(table));
                 set_iommu_pde_present(pde, next_table_mfn, next_level, true,
                                       true);
+                pt_update_contig_markers(&next_table_vaddr->raw,
+                                         pfn_to_pde_idx(dfn, level),
+                                         level, PTE_kind_table);
             }
             else /* should never reach here */
             {
@@ -487,8 +502,24 @@ int cf_check amd_iommu_unmap_page(
 
     if ( pt_mfn )
     {
+        bool free;
+
         /* Mark PTE as 'page not present'. */
-        old = clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level);
+        old = clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level, &free);
+
+        while ( unlikely(free) && ++level < hd->arch.amd.paging_mode )
+        {
+            struct page_info *pg = mfn_to_page(_mfn(pt_mfn));
+
+            if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn,
+                                    flush_flags, false) )
+                BUG();
+            BUG_ON(!pt_mfn);
+
+            clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level, &free);
+            *flush_flags |= IOMMU_FLUSHF_all;
+            iommu_queue_free_pgtable(hd, pg);
+        }
     }
 
     spin_unlock(&hd->arch.mapping_lock);


