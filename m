Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A44615448A1
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 12:19:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344904.570528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFGS-0003Wv-Lh; Thu, 09 Jun 2022 10:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344904.570528; Thu, 09 Jun 2022 10:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFGS-0003UK-Il; Thu, 09 Jun 2022 10:19:44 +0000
Received: by outflank-mailman (input) for mailman id 344904;
 Thu, 09 Jun 2022 10:19:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jWvP=WQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzFGR-0003U3-MK
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 10:19:43 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe09::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad4bb61e-e7dd-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 12:19:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8559.eurprd04.prod.outlook.com (2603:10a6:102:216::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 10:19:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 10:19:41 +0000
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
X-Inumbo-ID: ad4bb61e-e7dd-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OSG56MYUeDTBjUZtKwynHQfPfGEbVYGWxTbP6fxJb2xBFGwpc8RPGlHipIOoRbTs2z+84O98tlYeDS2415adZqc9yrH9Q7JATFDiNQJTn+cgu67jCEQ6z8B2YbkGwi/sjFkXJOyhZmx518gTx5qOw7hdOHB2yEjHsW8If/Qdh4TaN0QToQNwIiWM5QY5qR/skCVaR19bxGYnbfGyvzEM/7Kn3I8rh0ptF0ZpNw9OLAWlY7HRVK/aMFD4agRFBbO8toP3iuG0x1nr/c5+kzM4ZPjxw4sEdnqapD6eTZdMq8kqkLTqqCfypLul0OXwEG4f/fpKR+StgEmfRHU7YESrfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1SRbMZ5vtUn4A75NysmPVCeWEjl1KBkL8Pu3NNkQeY=;
 b=QUtiBQexOROx22dYmxZBzyjk2js3wpx89FbfdPCf8rMCZtTY50PYyAyB+ifoyFLuhYDYXnkckF5gQkED1WsaZOJYRsL6abetr1Zy/GOkmCcFQA0dNXgctURr3uHKXRmWUuRRgXPYzr0g4uah9tMo3zuJdQZ7nfONHnORaffzeQ/qKm5BMJhnTsfSOmxKBXiJehseRrf5/abjQ5HdChlhGK7H+dFxJDoDbtV+jex4dg0Y2iqQ9w1pkKP92KgWRT7S25qBZqmhnmwHocEKw7dhF4XOqKAzjTTJYanip2LunAoT7xLQSGZpaYo07BFoA0HUztibU4pce5LTa23nycInhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1SRbMZ5vtUn4A75NysmPVCeWEjl1KBkL8Pu3NNkQeY=;
 b=4RD3TPjgOKvP/ILG99eZi6mlFo40A8sfUPofFnLfdgg/N5df/3FsMxA+6EzC80EDGAotxahVFTMwceuAUmGik0JsTQ59oTTbqMdQuf+7i1bdIZt3rv9nEnrMDDXAnjf4nrIX/gITLkwnrKBU/mO2UNlwbhulFc7FfgTQqe4Ky/Ns3PZGkaLRX0InBOvJFhbdzb6/vnD/tXDteyzM16UBGuIcElAHTjfAgHEw42sDbX50YR4EfIWk7KIa8+OgdEIgGTYyrjsD7gDBzE7xr9gpxYyzYddi7OR5hI49kBx8N5uwhaUbd090v2i2FP6zPn+DqIUFh22AahTa+1k+je9Z3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <730648db-7a2b-ce0c-675d-cddca116474f@suse.com>
Date: Thu, 9 Jun 2022 12:19:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH v6 07/12] AMD/IOMMU: free all-empty page tables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e873e30c-7a04-a8a3-2fe5-0dda30e654fe@suse.com>
In-Reply-To: <e873e30c-7a04-a8a3-2fe5-0dda30e654fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM7PR03CA0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::38) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0449f426-36e3-4ae6-e953-08da4a0190d1
X-MS-TrafficTypeDiagnostic: PAXPR04MB8559:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB85595A340B7754680CCD7A7EB3A79@PAXPR04MB8559.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RVsT2Ku1jdNEZbZ0N+GhSIS70NTG05KKVgjDtwjuB34wV2kaSpVewDZmpdz8jOyTXae42iLJB7/oNVZlQRissuEHdWF2JimEAsyf3Q7NhMvl6tAa5ERLjvovoFnjRbWcksIvIhGPStuqelZlQhtmgmPSQouZ6vC7dPqEdGvKr30FR3KF5SiUBKXDacTehgZ+y92wDCDf8HdKODs+2Fj28QC8gehcwFgAXM1nWBK739/MrVfX1rNdUA2miU9tPaoSRa6xyx59k0t7n58CpHu+GQm6VQGqag8duZfUmrjY+Aw/5sZJpTJfdr0A++NGVSLs4rgz+9Aqqk5PuJ452xVVcmDOTj0o4o8WbQ6LBTEOYLh7vO00pFueCv3aHmFfvCC1OB5oUyilArrQEzIx51y4vP2kJvN6qgIo8HnBUW0gUqkt2uqcg9lm5ZsGUAvyD0MVi/ivwiEeJB/kVI30qUDhs1MWbhV6Sqe2sSscrCcvZlNpyNae88SKgPEkOcXC5HaNFa7OTFtslJDvmUrgqx1zV7gnVpwP3IEzY2i12PPpSQIlsBH4oREhdiHY2g3MiK7Ifc7LSwXxbeo4mrL6fhay9ZlaN2Oj5EfBWggkodtIwHyc06w8jPHtRdz6CNjJGS1zldcGCujLiz84cMC6wRIibu8cwJt8vO21Ix7tJKgwzolm0ZiYtbhT6DiRaXf+RDTxrsam9fbAckj2ZTWka5KAAYi3pK3DtU0ouutCHus0mcA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(36756003)(66476007)(66556008)(66946007)(54906003)(6916009)(8676002)(4326008)(83380400001)(31686004)(6486002)(86362001)(5660300002)(6506007)(2906002)(508600001)(186003)(2616005)(38100700002)(8936002)(6512007)(26005)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vm03bERUYk5JNTFTaGc2SFpPL3NtSWZxRFJaS3dpS25rbmZRS1NkUDJaVXNG?=
 =?utf-8?B?UU5ld1RDMUhCYXRDUGdEcmJPWUVpbndrVWVmS1ZLOVRzOXpyYmd2ajBMVmRI?=
 =?utf-8?B?ZlAvTExmV0VsaExEMEdLTXdBaTJqeEkrYW9pNmEwbkwrY3VpUXNONVNEdTJP?=
 =?utf-8?B?YmVkZWMybGl4NEY1cHVnNVNMQ2Z0UnNTN21tVTNDcjIyc1o5U1c2OHlLL1V3?=
 =?utf-8?B?TWtVT25iMlQ0U2pFcm1xYjhjWTc1NTVXTFpvb1ZQdVJKUXlVZUNJcTVITmd3?=
 =?utf-8?B?SjBrVmlsV0FaQUh4b3FsR3M4bmJnQ2VDcE01TXNMYkFVZlFnaEZqUzJRV0lx?=
 =?utf-8?B?a2JYK0Nxc3pUUVdVelRPUW9Oa045VVJnZjErYU1kSCtLaVJNMlJWN0xYZjJx?=
 =?utf-8?B?S29vTDl3bjJKSmw1WFBVU3hsaEZxUEduSWhlU1RySThaeVk0YXhNL09mQ3pa?=
 =?utf-8?B?eDN3ZWkrK3lxTmdyRVVObkNvait5VjNxZnIvRG52S0gxdG1ZY1JVci8rRXFj?=
 =?utf-8?B?U04rYmVLZFd3bG9hbFFNSGY2Z3RkRWtuaWJWK1g0QmVSUXFLalFHMGNsY1BF?=
 =?utf-8?B?V1VnQ0N3U2t4NjRyWkZ3NEJVNUE1TjJUQU9XU2VkYXJZZkJSZERyVG9kVHdj?=
 =?utf-8?B?aDBoZDJvRnhDWG4wZ1JIVWpPL0ZUU2IrdWRKUEJzS0xXREx5R2VyNktydi9m?=
 =?utf-8?B?N081SDNJMkNBYmRrdmkvTGlKVlNzd0FMOGRZUUt3UGxyZzE0RHFMeDNhSWtE?=
 =?utf-8?B?UW1OTi9nSDMrRmErWU1peThGUmtHN2xqKy9KVG9IOGFFK2QyNDJMOUpVdVVX?=
 =?utf-8?B?ZEs3bFJieXlPNzA1ODhlNlNWUnA4Zlp3T0FCWE5IZnVvZFBsSFg1VE44N2wx?=
 =?utf-8?B?OVdTOUhPVlpScTR3ZVBtSWVsbE80Uk5yeFRTUkFpKzlTdDFnVTAydk95eks0?=
 =?utf-8?B?bXNSNDBNMkNBSHV6U28vVm05SHBCcktud0FuM0d0b2YxMFpBdUE4YThYbWJK?=
 =?utf-8?B?L01ZcVFFZDQxVmtIczB0OVRSWmNPN01yS0N4a2lRYjVKekhxdEMveE82enpm?=
 =?utf-8?B?ZG5qQXBXMVRUZHRmT0F1YlVaWGZGK0dsdjJETUMwTHlMeGtjQTcxdVJCb3F3?=
 =?utf-8?B?UkwxQzcvaWVFRUFsaGdxcVFNTExkSWcwWmJpa3laQTZFdnZKN1ArRGdBVk53?=
 =?utf-8?B?WnppSFlxeVFxbDEvL3RzdGtwdjl1Unc5ZXljL3gvRUc3VnBUQzROeUwwdjVU?=
 =?utf-8?B?S2JYSkd4RVkzNFdnTlZGQTJTVkNLYWpTQ0RxRDZadm5HcnQxdEVRNVBrd09a?=
 =?utf-8?B?UkorV05BYnVRWEg0dFlWK3Y0c0FZbG9CVFpaY1o0YTdjOTdPbFJtTGxzcTRp?=
 =?utf-8?B?aWkrV0NERXZNODExRXlSeEdaeEJSQ2tRM3JwVVFjM1M1a1RLZTVpK3BNbUVY?=
 =?utf-8?B?eFl6V29CN250cFFHRFBrbnpET1RhWS9ZWnJ4RHo1eVM3c1Vtcis0ODdTb0dY?=
 =?utf-8?B?bUFXKzl6YzZTQjllVjc1S3Nsek9OL3RpNWVOT25Zd0hTZzVIVHdIaG5mQW5y?=
 =?utf-8?B?c1hmSDM2OGgya2VkSW15ZDJ2azBLZnU5RFNGMmNSeEEvSFZMYlJwUjVRc0Mz?=
 =?utf-8?B?L0s5RWpDRi9Bd0lyNFZIczlQbGJmcFh6Q29xNkQxclpCZDVmR3V5NkEyaE9M?=
 =?utf-8?B?K1h0UEVIQXBVSWxzM25SaTh2eDJ2RDZKVjZsVXF6b1gwV0FwWEN3S2Z1U0l2?=
 =?utf-8?B?WEsvNnIrNnhoRzZyZG1Fa2dYYy9zZXJURHFBWlp5Um5VaW13Y2tBajJVRDUw?=
 =?utf-8?B?ckozYVZySUJIZzBUaFhWSTg5MGFSVVJhTFJZMndTREk0WU5BYjZKTTEzVnRw?=
 =?utf-8?B?Q0FKNlplY1gwaHN0M2JHM1NYeWZXd3NOai9GQVBpOTV5RG12ZlpqelNXcW55?=
 =?utf-8?B?Lzk2YWFOL3podFJzbzVSeFVEUlYrc3NwSVU2NGNMY1ZienY3Um1VbGduY1R2?=
 =?utf-8?B?RE0zYVMzc1EyN3IrUXc4RDJ6bk1rN2poWVdmbUJodS9JbW5sQmFBY1ZXbUJh?=
 =?utf-8?B?VE0zS1pDUXNObFZCSEJvRUJiYi9PSStwaDIwRDNkT0huNWJsWXVBQjg5YTQ1?=
 =?utf-8?B?UGYraWlpQ2J6Vno1eW93RzFOd2FXSGpka1BReTN0U1RrUHRuNDZYWXpwV2lZ?=
 =?utf-8?B?U1NwVHFVS2pWb0l0TUFJRXBLejNRcDBKK0RFa3VMb1VST0JFNDZKTUk3cTAw?=
 =?utf-8?B?QjFPaDlmNzNldGxYRXl4UUk3L0JNdWNMQ01oLzhIeW9zdkxQTWdnVktNSXU2?=
 =?utf-8?B?WjRUQy9qTHZscW5uaFFBVTRWTElOaktnbW02aWNFbVFzYVAzWHVjUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0449f426-36e3-4ae6-e953-08da4a0190d1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 10:19:41.2851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X59Sn3qNiA4CQ9aWhDZL50U5FAq0MK/9X1RIsdI9z5SMoTXLTUE5kh4u+29rMXaG7rr+SrZCHimj5UB44Eijsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8559

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


