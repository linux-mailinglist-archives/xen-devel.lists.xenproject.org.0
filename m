Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7235E566EA5
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 14:49:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361188.590578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hzZ-0008I1-Ml; Tue, 05 Jul 2022 12:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361188.590578; Tue, 05 Jul 2022 12:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hzZ-0008Ef-Ij; Tue, 05 Jul 2022 12:49:25 +0000
Received: by outflank-mailman (input) for mailman id 361188;
 Tue, 05 Jul 2022 12:49:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8hzY-0008Ch-4s
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 12:49:24 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2083.outbound.protection.outlook.com [40.107.22.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4de258d-fc60-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 14:49:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5252.eurprd04.prod.outlook.com (2603:10a6:208:cf::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 12:49:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 12:49:22 +0000
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
X-Inumbo-ID: e4de258d-fc60-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHTxO8oiTIlf3EUsEu+MSDZtWIZt7liqp3B3rF44SbRPfIFtRbLU70b6YNCBTmjAb0nDBgUvv7NUZx6i8x2gNLuIu2a67IEA8HN82+jF8inZKKweLBTOuKwlIevbGhE54NoKWX+SuPqONNFDQMzBR3A07Wk03JFtJ+eamFBMxTe13WZqaAX6j4NPnY/1brGLiV5y4/Iq1EOKCl/dqAyomwFxnVAR9pyQu8zXbNlNWCLh3f1mFCuGJcln40Vdi4VB/WZI/Uzfh0qmRMAFf6ZIGK3/43ZT9v40i7IFdjCwRL8ZXvcziEB/64aiOVSW+wBrWhN1ZyUCkVOHKZ+f5dwcPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNSivqMUGJNXw6YV9IuRH2YBw0MQFLGrycARpWhZOTo=;
 b=LGFzy6lUnK0WjANKIyVvI6isM45ojcwuUEqvClC/F4+LgUss59P54pwbfNL0/F1vQ5FEXYoZYuDllW992OUZ5cKfs73x7MmkPr63ji1ggOwr4QCj+5sWwHvrl4PgIyW/kzgHrC3pCzPP7Kon3aOFkSw7gdMyL422X4T6e/y0fYaLxJkPuKMHZQOW2TIfV1eyhjTAusJtR+6oGC3PfX6wZWUUL6PkDnHd2ZsyA+EKM7MG0vfbinfCOapMiuU7hJGWtRlMT6JuxKsVEdSWLfkzDE9jbgGkB6MzBXPrlQ9poyna5YCIHKqw3tUyJyU4kzJkT1sHXCVdJx/eEttKevjIUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNSivqMUGJNXw6YV9IuRH2YBw0MQFLGrycARpWhZOTo=;
 b=s6ipQUoUOHaut3n5ecjaui4pE5MhrkaZ5vomBt/vnuZ46bWfUzBQj8r0xxZkdoZBjKXdYo0IJbTCqKynnE/eZlF0xRe8ZMGSiEnnA5fiytvuzTIuLat8hggResZNa+bFG64aiRryDHpstlG1iBhoiZ/O71d0HovHpBczJhJ9KG11Bse6YJkNJb/y6U3aIPbW5uStbujXNLc0FoaCDd2aD850iBeQQKdMg2vO32FfYsbwF+hL83yVIE0yg0P6N0ngdP2A/S0jnzkOep3SxnjbuKMsKNEE8xw2+yXlohcJTpAT22JeajEXT0jzLPVwIlN9oP949F4AnhE7JZdeow3ilg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1dab40d4-75f1-566c-f982-610013db72f5@suse.com>
Date: Tue, 5 Jul 2022 14:49:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH v7 13/14] IOMMU/x86: add perf counters for page table
 splitting / coalescing
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
In-Reply-To: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0056.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10b99f2f-b887-4222-3cca-08da5e84c88e
X-MS-TrafficTypeDiagnostic: AM0PR04MB5252:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EYz5e7wS4dm/y06BLPEKKyf7a1huWjZ+0ZN7JqWcwsMXz+0h0WIzn3ETYgnSirXCiztPHW0pkCWhtn8fvkg76IsBq1MptrKTY1G2oFFqxOA/A0XdgOl7cW36VY1bJfx/u27L0RXhltR6088Hmzvu67wnwdtbJxvoHoAmoOW72+Ee6eZ95LIUjRrhZIvqjBX6U+O4uYXwENEMPhrPDYGMG56m4oU2/qjtCQH5iq0JTS7rA8gB3wku3Dk7dbCGYrare0/DU7k8GBN0Q6g5IvDRvTFTDGc+oHDTUaWVqeLxqXMCYYRYmtcIoSEMH3z/EmXnnqIRhw96dYaXfIDwnQFgpkldx3NBMKs1joZHHpcuIj0XlQ3Q8FfQyxhCDb15IVmTu64lcPQe9EZccKQfJSeSr6SwA06rRIIMrlvWfoOoeg3A0SrkRnCFZ05ZZZyzlpNQ6L6FMkQGRPO4EYey9alOcNUyDzJQKxgnIY73Ufh35W95RkYB8mg3e5ER+/Rj8X6/Bw+Aq1xlQ+5EZ+Nkib8rDwaQslljw0gzGWh+rYJtVB8UnNwwUakt8zumd03M65Ha8q2D9j63pTLR3ijDrEoRR6noqavHBtnG7DNg0hy9SZLpwwZGbNUVoKQsmywdAMC7hhcmJaYLsgPSXnUohvLq3JTa1hyUO5CTKRLgPGMm+QJSjwFurhOP9HH3VRjxQpX8IYyuSiOUP9mJ5jfkyQii6dybkqdCzKo7eIs/BG/1zxsx+vQVLFZUWsY4qyiWq5Qk+Sq1vMFF3tnvUeEeW9p6LbOYFL6frIe2qVac7+cUsE09ikxEgebZqUxsXXYbng1xOOAjpcl48yLnCLJMksNZdxh5oCoDeoG3HWfR6wh4KGc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(376002)(396003)(366004)(39860400002)(478600001)(5660300002)(8936002)(6916009)(54906003)(316002)(86362001)(31696002)(6486002)(66946007)(4326008)(66476007)(8676002)(66556008)(31686004)(2906002)(83380400001)(2616005)(186003)(6512007)(26005)(38100700002)(41300700001)(6506007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjZHMzh1TjVsOTBMTXNUcTlCUWNxWmVIK20vNW5PeDhsaWdtQjdaUzJaWnBl?=
 =?utf-8?B?VVJRdXpNVG1wSlFnb242K0FqeGdNZ0piVmxlZ0haTlVLQ2FaZEFMNk5Oc0Zi?=
 =?utf-8?B?NHlHTWp4REJaSzNUZE56SGYxT3Nod1ZFNWUxaER2V2lyVitGQzBYektXZmFF?=
 =?utf-8?B?ZlRoZXBXeGNxNFovTzVHZEljbnpiWUxKMEZ1REV2Q0orZVJBWHRoWTFnK0Zy?=
 =?utf-8?B?eXA2SVJwSVZnK1FLS2xPUUx1WGR1VFQ1RUtaeWMvTkRtODgrMTM0Um1VVlBq?=
 =?utf-8?B?dkthdG9iMkxLcGJndFdyVUtvYllIMEgzaU5Vbm9wS3dTN1d6cXpRWVlnRmpz?=
 =?utf-8?B?RS9Ucm4yWnVGT0FKOHl2eXdWYlhhM1drU0VLc3J6NkN5RHJqMC9IaEtpdHpG?=
 =?utf-8?B?RlJibWdmeGcrQXd3R1Exd2IxY1lGdEdXeW9LcFpIRjdHUEVCa3NmeW5Fa29Z?=
 =?utf-8?B?UXhMYjVkbnJuVkZMbkJuV29KMFNpUHV0K0dvNDJqbVAzYktHMkJzdGNMb2J4?=
 =?utf-8?B?dVJlOStybUdGZTliWjUzSXZXVlRlUG9pdGU0T0lrd1FNN09JZnd5S25wWlhP?=
 =?utf-8?B?NGtIUHdMbTYzQzdwdXpDbk1nKzQ2a2FBUkhCMENXbHhjU1h0NGVyTWlQSzNG?=
 =?utf-8?B?WUJZOUhEamxYNGdxN0xnZlpORjlPRkNjamVBb1daRlM4Znh2SDh2c3ZJME5Y?=
 =?utf-8?B?aFQ4Qzd2V2RWbDVFaXoxTEo3bEFGdG83NjlhZXUzSXpEeXdaVDRCdnR4QjJU?=
 =?utf-8?B?TUI2Q294V05EMGQzakdLdFpObVRsbUI0Y01SclNHdDF5YUZVaVM1aU9yUUYx?=
 =?utf-8?B?Yzl2ektoM2xaVFcrblFHbGpYK3VhQ2h5OC9JWS96ZTB2Y1NUOTR1OEw5SUhj?=
 =?utf-8?B?TEZ6WXoxUXNMZG1TN2dnVEJUQThKTjdrZTRKcnhtTWw5RVVYakc3bC8xSzlJ?=
 =?utf-8?B?K0NxaWxINTZHR1dNRVBYVWRFdXRMR1ROT2lvcXRuVlFLY0YwVkZ2c2tEUXY4?=
 =?utf-8?B?VU1ZV09NSVM2eXlLMGs4WmNqaU9LUzZsTmJnblFUR0xtcHdDcXZsTDZmN3Y5?=
 =?utf-8?B?VDMweE9Rek5rMUhlSUpLMU1yaGhVTTl6SmxGYVZrZnpscmZnSFhqdm5KRW1l?=
 =?utf-8?B?Sys5ekRVeFd3Mlowb2dOLzJjaXFJNGFmcG9SQTNtRmdVejhyK056VkZLbWlX?=
 =?utf-8?B?Tko2T0R3NTJqSDJRN1FuUDZCRXlONmlLL3ZzNTZ0UnZyWXFySVhrTDFPKzI4?=
 =?utf-8?B?TkdpTE9xWEt5NGxNYktHWFg0TTJyMnd2bkxYOGZMb1d0WVBta1pWNmQ1RHhv?=
 =?utf-8?B?SGt6MFBEVjBkaWZ5VG81VGFldnkwZm5rbUlqYmNKVWZUZWxqd0UzRGVwemoz?=
 =?utf-8?B?V0w4QjFpSkJ2ZTE2Z2N2dkFaTlJFM09PcTk5VTNUY2pDSk9QU2JWbVp0UTdT?=
 =?utf-8?B?OGZDZlA4VmQraGttSytlMHVIVVRHRVZXSzllSEhRSEZWQnVuN01jOVhsT3Nr?=
 =?utf-8?B?UmxBUzlVbmxMc29GVEpBbWI1TXNYMENTKzd3ZE5uS2praG91eXlrVXFyajli?=
 =?utf-8?B?M1VYbHl0Tk9jWHg4WEdMQndocnQ4ZkNNWTl5UnVhdXFId1IySXA1SjBwMXk5?=
 =?utf-8?B?VGQ4M203Q1Nhc29JalFKN0ZXWFp0MEVvNzVNN0RWUWtDNEJCK1FXZ0dkZ3Y3?=
 =?utf-8?B?dXlNb1pKT3hOZ3loRTJoYk8wTGxqOHJ2MVZmcDJwMUFZVXhiY1J2bHJRV0lG?=
 =?utf-8?B?Mmw1STM2Rm1YcFpKenhUZ1hhajdWVVZqeGwxckpwVll6Nm9BNFNEZjE2WXZR?=
 =?utf-8?B?eEgwcm9kdGUrUHJHZWFmQ0JVaUZIcVFMMWU0Z1ZHZFJsS2F1VDYyS2NMYWpx?=
 =?utf-8?B?emZ1ODhYQ3dOTzROUWxzdU1DeW5KTWlMVHpBOUhEMTMxOWZaMExaYmZBN0V0?=
 =?utf-8?B?RmJlVmI2K1orSDlRcEpkTW96UkRhQm1KRVRMc3VpT0NVVUdGMkwvZmUzMlBJ?=
 =?utf-8?B?K3VrMG92a2JOVC9JM0E0V1pIa1dkV2FxcW5DNTRCck1sd2xmZWhqRy81eWRs?=
 =?utf-8?B?bmQzdlI1UU9rVmxnRnJJcTE3SjM5UWllKytncjRscmFKcGtEVEFncHZxampF?=
 =?utf-8?Q?vZiZuX+BsnNtQVhLndJSxip/7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b99f2f-b887-4222-3cca-08da5e84c88e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 12:49:22.1211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Z7w6Bo4bNWlyWAU6VKAKWwdcrckDfNA2bgfq7pYiclwDdkKDqmaJQPGMPwAvftYspGa2c6Q7HYx6CIrusDEdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5252

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin tian <kevin.tian@intel.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v3: New.

--- a/xen/arch/x86/include/asm/perfc_defn.h
+++ b/xen/arch/x86/include/asm/perfc_defn.h
@@ -125,4 +125,7 @@ PERFCOUNTER(realmode_exits,      "vmexit
 
 PERFCOUNTER(pauseloop_exits, "vmexits from Pause-Loop Detection")
 
+PERFCOUNTER(iommu_pt_shatters,    "IOMMU page table shatters")
+PERFCOUNTER(iommu_pt_coalesces,   "IOMMU page table coalesces")
+
 /*#endif*/ /* __XEN_PERFC_DEFN_H__ */
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -345,6 +345,8 @@ static int iommu_pde_from_dfn(struct dom
                                      level, PTE_kind_table);
 
             *flush_flags |= IOMMU_FLUSHF_modified;
+
+            perfc_incr(iommu_pt_shatters);
         }
 
         /* Install lower level page table for non-present entries */
@@ -477,6 +479,7 @@ int cf_check amd_iommu_map_page(
                               flags & IOMMUF_readable, &contig);
         *flush_flags |= IOMMU_FLUSHF_modified | IOMMU_FLUSHF_all;
         iommu_queue_free_pgtable(hd, pg);
+        perfc_incr(iommu_pt_coalesces);
     }
 
     spin_unlock(&hd->arch.mapping_lock);
@@ -543,6 +546,7 @@ int cf_check amd_iommu_unmap_page(
             clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level, &free);
             *flush_flags |= IOMMU_FLUSHF_all;
             iommu_queue_free_pgtable(hd, pg);
+            perfc_incr(iommu_pt_coalesces);
         }
     }
 
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -404,6 +404,8 @@ static uint64_t addr_to_dma_page_maddr(s
 
                 if ( flush_flags )
                     *flush_flags |= IOMMU_FLUSHF_modified;
+
+                perfc_incr(iommu_pt_shatters);
             }
 
             write_atomic(&pte->val, new_pte.val);
@@ -857,6 +859,7 @@ static int dma_pte_clear_one(struct doma
 
         *flush_flags |= IOMMU_FLUSHF_all;
         iommu_queue_free_pgtable(hd, pg);
+        perfc_incr(iommu_pt_coalesces);
     }
 
     spin_unlock(&hd->arch.mapping_lock);
@@ -2239,6 +2242,7 @@ static int __must_check cf_check intel_i
 
         *flush_flags |= IOMMU_FLUSHF_modified | IOMMU_FLUSHF_all;
         iommu_queue_free_pgtable(hd, pg);
+        perfc_incr(iommu_pt_coalesces);
     }
 
     spin_unlock(&hd->arch.mapping_lock);


