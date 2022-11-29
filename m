Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5076E63C18E
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 14:58:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449380.706063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p017R-00042y-7J; Tue, 29 Nov 2022 13:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449380.706063; Tue, 29 Nov 2022 13:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p017R-000402-30; Tue, 29 Nov 2022 13:57:53 +0000
Received: by outflank-mailman (input) for mailman id 449380;
 Tue, 29 Nov 2022 13:57:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uAXM=35=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p017P-0003zv-Cp
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 13:57:51 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20615.outbound.protection.outlook.com
 [2a01:111:f400:7eab::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdeb65ec-6fed-11ed-8fd2-01056ac49cbb;
 Tue, 29 Nov 2022 14:57:48 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CH0PR12MB5185.namprd12.prod.outlook.com (2603:10b6:610:b8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 13:57:44 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::62cc:47ae:a750:8f57]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::62cc:47ae:a750:8f57%4]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 13:57:44 +0000
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
X-Inumbo-ID: cdeb65ec-6fed-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QnvSmyC8sDvgeikoa84SHXlXRbTgXvdYfXDAYW+YUa7NkAjluxGpftsfXKoceLrLqgIgnBmuylGGsbixmKLsdU4jTBQYH5BoOhhWazyBb8c3AKGzXRcyyhM2ugjnlI+VPq9TaIz+WXPIk0WgGzHSl98nqcqT5pHTAr6kxp62nviYCNtnkb4B7L1tzmIxaoZliyQch4UInOLaZ03LpFhIxEUpqNaREFByD8hCBnOySgCMeescknuhfExofms9e5P/UN4YIcb5QQPmulv5UnMEbRXXQhTCzBerkB5xM29B4NvsHozQLXWWSDL0CzT4SdGlLSeXlOJojZvWn0n4nw5oQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NAYn0sMBSm9zTuMkeKoKA4XncfcuRRaW7d+yEOLkMbQ=;
 b=Q7yskXpOx3JP3EvcW0RYSzkgpqqwfe0fhQJx+KfMSLRiHe4fmGpYgsk8gwksCfikXi8vI2GGZ3Vqk74lMJHy6bydMKpSR4+emK1z6ujpCAp6AuMIfir9M/zs3wXBevCmNmCxe6ASeU5gmWeFbYTP63B9L9Tkuukk7DEg6fA8zX4vG5pC0aa/SVSKeg3JVFLYtrS6fIg8DLltl/AWvthSGSvaUdzXtcX0NqLp8rtuYNuzyIhFJU2bStSaeHBtDrz3vdLWVYtKx4BT20xusRL/6m2A4BHqmEr19cjJhF5ptlKZ0MAGanwkY5REt1laQY87MdIbQghiFEBgWY96r5Porg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NAYn0sMBSm9zTuMkeKoKA4XncfcuRRaW7d+yEOLkMbQ=;
 b=davPU1lwv+2ywSrCcq1mhtskgN84MyWxyLTyWWpKa7S3RW7Glf/SPDE9MeU+oh04ZgFhwpyfdCUzdBreCCIqH6xFhAaevvAWvIWjYbe+nCfKvA7XMCOQvMxSR8vHKJheOktVJ6BfA/FweA7VYhhbMdsk3xQ4le8aZc4XqqDbsqE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <70651dbc-085d-706d-17d0-a419086a0700@amd.com>
Date: Tue, 29 Nov 2022 13:57:38 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
From: Ayan Kumar Halder <ayankuma@amd.com>
Subject: Arm: AArch32: Need suggestions to support 32 bit physical addresses
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, "Stabellini, Stefano"
 <stefano.stabellini@amd.com>, bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andre Przywara <andre.przywara@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0075.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::15) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CH0PR12MB5185:EE_
X-MS-Office365-Filtering-Correlation-Id: 8742bfab-5435-441d-a91b-08dad211b08d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HFA//3rR50JhpTzquFQxRuiEmgAHeIS1naEJJHoyKNWcpWMP4svQ104df6+1rCMoFr8d+ItEio0hi9AHMohP5fIWvp6Yqbb1V7q4Nkd5XhxxXoXYXk6fjJ4r3jBz3u80wTobXZuQ6JNFGnhp9ffJ5c5ZyjyzgTkrKfqIHqiohIZ9U8v7qgCb3Zq87PGPX4BcGJI60nhXz3ofql8k/DFswETIToq7Cs7NydXPsf2ayzMI71qazq7STssek5tBSmrg9bIVhJMwfUZF8mLBXCLEcxjYoGowcUkAsIedta9Yjp/biz8E58zXl8cMNHuqa7rzoOrLn+T+TBYJ5OXXL9Cgm79EVtZY9sMl61eVxqXq4T8omq0xMrozA6eB6C1aDQgUi9GGf0dSBbRzLOKr1UP5N929/tU6vBxAWHIe++5lUd7qHwSiNTGg+Vn7/5SsPP9chIYaVoAfPsiJOLM31/3sN+89KumWw7jzsOY2Dg/0+HNp/g+N5sY3T/bohQGFtVdQ25Pu12y8lIRZd3SBYbqCI4Yflh3znBidajmJ+l+RA9VB7KZ8+nzUlYSOJbW6/1vKqt2WhfyLsLGeV92OEQ+2DBG2zC06pH15xdZ/PgMHqpyt/B20KCso4Dyj0u+ilAapK+ZPr5Dl33EU7veOSzPeF/ed1m6FUeVt2BBavwDlUUoqLE4CyjR/DVYazAFomydIXsBgeuavYGue8nFWGpGIJU/ubBDl14sZDZE8mmWkxNXJF8RIdm/Ye/hrf7DiknUNU8cO/mx18ftkRLSKba+dRYVdUsDQzKihfCIbS017TNY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199015)(966005)(31696002)(6666004)(36756003)(54906003)(6486002)(6512007)(6506007)(26005)(30864003)(478600001)(6916009)(8936002)(5660300002)(41300700001)(316002)(2906002)(66556008)(66946007)(8676002)(4326008)(66476007)(186003)(2616005)(83380400001)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXVsdHVMSk1rM20vcS9vRWI1T0pmd2ZvM0t3Ykt3bndINWt6MnR5UEtqOW84?=
 =?utf-8?B?TXhITmtySG4rczZpc0xCejN6SkVnRmFybzN1QzdxQnp0dFh5eS9hOVhQd09F?=
 =?utf-8?B?dWh3MUJDYVlsZm9tUzJzZG5tT3o2QzJvbngvSjRLRi9razRjSyt5dE5DTngy?=
 =?utf-8?B?MTVLeWdMK2dsTVJIWms1dStWdVZKNCs1REkxOEswciswK1BJa1cwTGlHS3pL?=
 =?utf-8?B?UG94WkYxODFURDc1dXpuQXRZQ293K3BsZ0l4L2k0OUNoTHNid2VZTElMWmFk?=
 =?utf-8?B?RHBmYVIrblJneXovQmhmdDN3Q0o2RXRFK0pHR2x2eGNlMEVreUUrS3NGa0tP?=
 =?utf-8?B?RnBpSWYzM1I4VTF2b08wa3ZzTDhpSjhHUDliaWpvSW5EOUlkSHdxN3VIT2Zv?=
 =?utf-8?B?L3NRNDN4RVZtckYxejI5RDFzOFRaWEVhZnJWSmxwYTMrYUk5OU1UdXhLQVhj?=
 =?utf-8?B?b3BRREVlUzNWdTRCcnI1a3N0RlFRc2toSmRYeWtOTVZVNytGY3FDa0lLYXZQ?=
 =?utf-8?B?aFAza2tHWVc2TXNzblJ4OXJuZi9heUpGWU9CQUtnYm9Ha29SOERBYmNjWFlK?=
 =?utf-8?B?Ym84UzQ1ZUhXK3VieEdzWkZYdDUrM3RzcXhBVTA4SE9JOWJHQ0R1ZjdnYkFH?=
 =?utf-8?B?TThvbElQSEFndnZIQlBUY1VNTmN5Y05xSVQyU3U0R1dvVG9GSXRybjhWaHlh?=
 =?utf-8?B?MkFYaTRueVEzaWFma1pxQVRGYVhjM1kwZE5lZ2ZIelZEUWt5MU9CdWF4Q2dw?=
 =?utf-8?B?QzVjMmZrMDl1VnlxWmZ1TDV4ekFYUXZqRnVxZVlsZWpLb2RjWUw2emdram80?=
 =?utf-8?B?ZDVvci9YYUJnSlljZHZiZmY3ZjlrUW1nVnVsOXhwSm52YUtJMVhqU2VHRmtz?=
 =?utf-8?B?MGZHZWwyeU1sOXk2VjBnRWJJdVI0WEFONk93TllGOEtISm1lVWVxSjNmTHA5?=
 =?utf-8?B?cFk4ZWFDaGtiZ1Vuc0l5WkNPeWNOc1hnM09TT2R3ZWpVdVJtRVFRNnNtaG4r?=
 =?utf-8?B?am9pS3JMYTNRVG80VDluVDhtL213TEl1cEF0NXVvSitMd0pxeVFDNEFDcWhj?=
 =?utf-8?B?ZlVpUEVSRTNnUkJrNk9jNTBsWmNaS3A3OVlxU29XRTAvQkREVWVWNUVVQVQ1?=
 =?utf-8?B?VDBJdlJkZ1NOL3NqTkEyT1J6RkQveTVGbUlRSGUyRHZocTRtSmFJQXdzWStx?=
 =?utf-8?B?N1ZlaDZFemd4ZnJxK09tbWkyQXd1K2dpS3QzT3BGR2k0RXVadzd5M1BIUjdR?=
 =?utf-8?B?YVUzVXZwSEtmZjhKbHp4MmlVcnlKY1pDWTQ0MnZ5Q2dndnYxWmpDdTBoc0VJ?=
 =?utf-8?B?WE9hUG5KRUxzRHpBU0tabjdReitxSnFyamhuMnBqNXRrMGpOZ3dFQkdWR2Zw?=
 =?utf-8?B?MTlvWmZvSjR1MHZMVzBGM2d2bGpCbFV3bEVsRmlvQjNNTSs2RGd2N2dFY0Er?=
 =?utf-8?B?OEh6VjFlT0FUL1JYRFdxSlBKYTY2U3lBekx3Ymx1bE9iaHRYQjZ0K0pOei8x?=
 =?utf-8?B?aTRoM1NVR1R3UExFQnlRcFNoWjM0N3A0ZXhSeFYxNmpRRFp6WWhnN29ibkZZ?=
 =?utf-8?B?bWIvNmNlL0RiUk1Ec1RtTWZKUWZ1Y0o4Y0VFKzRtS2E3eFJCakcwYno1eUlr?=
 =?utf-8?B?Vy9uS0dOZlVWU3NHd1gzNmtxMm5LK1YxMmltWUQ5R0syTzhyYmdkVUZaRStk?=
 =?utf-8?B?Z3FaWmRyRmV2cVIxV05pUjk5aFZlNVY4S3huR3doVy9Jbk9FZmZuL0UvQVhh?=
 =?utf-8?B?aG9hMitXRGJ4NnZadkp6SlJuU2U5NCtvU05KNDcyRmxlalg0UytBV09yaDgv?=
 =?utf-8?B?V3RDdUdOVThlN2VDUDRMa2p4NkUzTFFiSWFtSG1temZFNFl4QTJlNTdGSTQ5?=
 =?utf-8?B?bnI4MGZ0MnlZTUdFVWtldmFIN2p2NllGb08xWFhTTEV6MGpFMnJoRTQ0UWNp?=
 =?utf-8?B?RGZsTnR0eHRCc21HaThFU0xLQXh1dlhVdUUwS2JnbEpLVm1tYk9XemdUdzVP?=
 =?utf-8?B?cDBJRGswdlRhSnFPZzhhaDAybnRrL3ozRGlqSGJGKzh4OFBLREpUOXM3QytM?=
 =?utf-8?B?TVJjYWVLWGFqNTQzRmcydVBoWVU2OW1mdUNBVWtOZ0FNNEZLMHZheWN5ZHc2?=
 =?utf-8?Q?vYDJX6HS0mra1S3DruLi7xP/C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8742bfab-5435-441d-a91b-08dad211b08d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 13:57:44.7509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ZpNojkuhcWPF1FBeiDWfr8S8ktlTuLOGne9qGpKtiPlkFMLAlpJgA4MzKOTtqzZuACYAlg47ZuEW0nAOanJZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5185

Hi All,

I am trying to gather opinions on how to support 32 bit physical 
addresses to enable Xen running on R52.

Refer Cortex R52 TRM, Section 2.2.12 "Memory Model"

"...This is because the physical address is always the same as the 
virtual address...The virtual and physical address can be treated as 
synonyms for Cortex-R52."

Thus, I understand that R52 supports 32 bit physical address only. This 
is a bit different from Armv7 systems which supports Large Physical 
Address Extension (LPAE) ie 40 bit physical addresses.

Please correct me if I misunderstand something.

So currently, Xen supports 64 bit physical address for Arm_32 (ie Armv7) 
based system. My aim is to enable support for 32 bit physical address.

To achieve this, I see two options :-

1. Make the changes in the specific functions for R52.

https://gitlab.com/ayankuma/xen-integration/-/commit/5498cf74c2c8feadc32934b948ce5f72bd0809ee

2. Introduce a special macro (CONFIG_ARM_32_BIT_PA) to support 32 bit 
physical address.

Thus, our change will look as follows :-

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 6014c0f852..4f8b5fc4be 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -56,10 +56,10 @@ static bool __init device_tree_node_compatible(const 
void *fdt, int node,
  }

  void __init device_tree_get_reg(const __be32 **cell, u32 address_cells,
-                                u32 size_cells, u64 *start, u64 *size)
+                                u32 size_cells, paddr_t *start, paddr_t 
*size)
  {
-    *start = dt_next_cell(address_cells, cell);
-    *size = dt_next_cell(size_cells, cell);
+    *start = (paddr_t) dt_next_cell(address_cells, cell);
+    *size = (paddr_t) dt_next_cell(size_cells, cell);
  }

  static int __init device_tree_get_meminfo(const void *fdt, int node,
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index bd30d3798c..3cbcf8f854 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1314,7 +1314,7 @@ static int __init make_memory_node(const struct 
domain *d,
      dt_dprintk("Create memory node\n");

      /* ePAPR 3.4 */
-    snprintf(buf, sizeof(buf), "memory@%"PRIx64, mem->bank[i].start);
+    snprintf(buf, sizeof(buf), "memory@%"PRIpaddr, mem->bank[i].start);
      res = fdt_begin_node(fdt, buf);
      if ( res )
          return res;
@@ -1665,7 +1665,7 @@ static int __init find_memory_holes(const struct 
kernel_info *kinfo,
      dt_for_each_device_node( dt_host, np )
      {
          unsigned int naddr;
-        u64 addr, size;
+        paddr_t addr, size;

          naddr = dt_number_of_address(np);

@@ -2444,7 +2444,7 @@ static int __init handle_device(struct domain *d, 
struct dt_device_node *dev,
      unsigned int naddr;
      unsigned int i;
      int res;
-    u64 addr, size;
+    paddr_t addr, size;
      bool own_device = !dt_device_for_passthrough(dev);
      /*
       * We want to avoid mapping the MMIO in dom0 for the following cases:
@@ -2718,7 +2718,7 @@ static int __init make_gicv2_domU_node(struct 
kernel_info *kinfo)
      /* Placeholder for interrupt-controller@ + a 64-bit number + \0 */
      char buf[38];

-    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
+    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIpaddr,
               vgic_dist_base(&d->arch.vgic));
      res = fdt_begin_node(fdt, buf);
      if ( res )
@@ -2774,7 +2774,7 @@ static int __init make_gicv3_domU_node(struct 
kernel_info *kinfo)
      char buf[38];
      unsigned int i, len = 0;

-    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
+    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIpaddr,
               vgic_dist_base(&d->arch.vgic));

      res = fdt_begin_node(fdt, buf);
@@ -2860,7 +2860,7 @@ static int __init make_vpl011_uart_node(struct 
kernel_info *kinfo)
      /* Placeholder for sbsa-uart@ + a 64-bit number + \0 */
      char buf[27];

-    snprintf(buf, sizeof(buf), "sbsa-uart@%"PRIx64, 
d->arch.vpl011.base_addr);
+    snprintf(buf, sizeof(buf), "sbsa-uart@%"PRIpaddr, 
d->arch.vpl011.base_addr);
      res = fdt_begin_node(fdt, buf);
      if ( res )
          return res;
@@ -2940,9 +2940,9 @@ static int __init handle_passthrough_prop(struct 
kernel_info *kinfo,
          if ( res )
          {
              printk(XENLOG_ERR "Unable to permit to dom%d access to"
-                   " 0x%"PRIx64" - 0x%"PRIx64"\n",
+                   " 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",
                     kinfo->d->domain_id,
-                   mstart & PAGE_MASK, PAGE_ALIGN(mstart + size) - 1);
+                   (paddr_t) (mstart & PAGE_MASK), (paddr_t) 
(PAGE_ALIGN(mstart + size) - 1));
              return res;
          }

diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index ae5bd8e95f..839623c32e 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -1058,7 +1058,7 @@ static void __init gicv2_dt_init(void)
      if ( csize < SZ_8K )
      {
          printk(XENLOG_WARNING "GICv2: WARNING: "
-               "The GICC size is too small: %#"PRIx64" expected %#x\n",
+               "The GICC size is too small: %#"PRIpaddr" expected %#x\n",
                 csize, SZ_8K);
          if ( platform_has_quirk(PLATFORM_QUIRK_GIC_64K_STRIDE) )
          {
@@ -1289,11 +1289,11 @@ static int __init gicv2_init(void)
          gicv2.map_cbase += aliased_offset;

          printk(XENLOG_WARNING
-               "GICv2: Adjusting CPU interface base to %#"PRIx64"\n",
+               "GICv2: Adjusting CPU interface base to %#"PRIpaddr"\n",
                 cbase + aliased_offset);
      } else if ( csize == SZ_128K )
          printk(XENLOG_WARNING
-               "GICv2: GICC size=%#"PRIx64" but not aliased\n",
+               "GICv2: GICC size=%#"PRIpaddr" but not aliased\n",
                 csize);

      gicv2.map_hbase = ioremap_nocache(hbase, PAGE_SIZE);
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 3c5b88148c..322ed15e6c 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1402,7 +1402,7 @@ static void __init gicv3_dt_init(void)

      for ( i = 0; i < gicv3.rdist_count; i++ )
      {
-        uint64_t rdist_base, rdist_size;
+        paddr_t rdist_base, rdist_size;

          res = dt_device_get_address(node, 1 + i, &rdist_base, 
&rdist_size);
          if ( res )
diff --git a/xen/arch/arm/include/asm/setup.h 
b/xen/arch/arm/include/asm/setup.h
index fdbf68aadc..ddffffe44c 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -158,7 +158,7 @@ extern uint32_t hyp_traps_vector[];
  void init_traps(void);

  void device_tree_get_reg(const __be32 **cell, u32 address_cells,
-                         u32 size_cells, u64 *start, u64 *size);
+                         u32 size_cells, paddr_t *start, paddr_t *size);

  u32 device_tree_get_u32(const void *fdt, int node,
                          const char *prop_name, u32 dflt);
diff --git a/xen/arch/arm/include/asm/types.h 
b/xen/arch/arm/include/asm/types.h
index 083acbd151..a7466d65c2 100644
--- a/xen/arch/arm/include/asm/types.h
+++ b/xen/arch/arm/include/asm/types.h
@@ -37,9 +37,15 @@ typedef signed long long s64;
  typedef unsigned long long u64;
  typedef u32 vaddr_t;
  #define PRIvaddr PRIx32
+#if defined(CONFIG_ARM_PA_32)
+typedef u32 paddr_t;
+#define PRIpaddr PRIx32
+#define INVALID_PADDR (~0UL)
+#else
  typedef u64 paddr_t;
  #define PRIpaddr 016llx
  #define INVALID_PADDR (~0ULL)
+#endif
  typedef u32 register_t;
  #define PRIregister "08x"
  #elif defined (CONFIG_ARM_64)
diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 6c9712ab7b..0c50b196b5 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -747,7 +747,7 @@ static const struct dt_bus *dt_match_bus(const 
struct dt_device_node *np)
  }

  static const __be32 *dt_get_address(const struct dt_device_node *dev,
-                                    unsigned int index, u64 *size,
+                                    unsigned int index, paddr_t *size,
                                      unsigned int *flags)
  {
      const __be32 *prop;
@@ -781,7 +781,7 @@ static const __be32 *dt_get_address(const struct 
dt_device_node *dev,
          if ( i == index )
          {
              if ( size )
-                *size = dt_read_number(prop + na, ns);
+                *size = (paddr_t) dt_read_number(prop + na, ns);
              if ( flags )
                  *flags = bus->get_flags(prop);
              return prop;
@@ -935,7 +935,7 @@ bail:

  /* dt_device_address - Translate device tree address and return it */
  int dt_device_get_address(const struct dt_device_node *dev, unsigned 
int index,
-                          u64 *addr, u64 *size)
+                          paddr_t *addr, paddr_t *size)
  {
      const __be32 *addrp;
      unsigned int flags;
@@ -947,7 +947,7 @@ int dt_device_get_address(const struct 
dt_device_node *dev, unsigned int index,
      if ( !addr )
          return -EINVAL;

-    *addr = __dt_translate_address(dev, addrp, "ranges");
+    *addr = (paddr_t) __dt_translate_address(dev, addrp, "ranges");

      if ( *addr == DT_BAD_ADDR )
          return -EINVAL;
diff --git a/xen/common/libfdt/fdt_ro.c b/xen/common/libfdt/fdt_ro.c
index 17584da257..a1e0e154c5 100644
--- a/xen/common/libfdt/fdt_ro.c
+++ b/xen/common/libfdt/fdt_ro.c
@@ -172,7 +172,7 @@ static const struct fdt_reserve_entry 
*fdt_mem_rsv(const void *fdt, int n)
     return fdt_mem_rsv_(fdt, n);
  }

-int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t 
*size)
+int fdt_get_mem_rsv(const void *fdt, int n, paddr_t *address, paddr_t 
*size)
  {
     const struct fdt_reserve_entry *re;

diff --git a/xen/drivers/char/pl011.c b/xen/drivers/char/pl011.c
index be67242bc0..1f86443136 100644
--- a/xen/drivers/char/pl011.c
+++ b/xen/drivers/char/pl011.c
@@ -258,7 +258,7 @@ static int __init pl011_dt_uart_init(struct 
dt_device_node *dev,
  {
      const char *config = data;
      int res;
-    u64 addr, size;
+    paddr_t addr, size;

      if ( strcmp(config, "") )
      {
diff --git a/xen/drivers/passthrough/arm/smmu.c 
b/xen/drivers/passthrough/arm/smmu.c
index 0a514821b3..59b9a24099 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -73,8 +73,8 @@
  /* Xen: Helpers to get device MMIO and IRQs */
  struct resource
  {
-   u64 addr;
-   u64 size;
+   paddr_t addr;
+   paddr_t size;
     unsigned int type;
  };

@@ -169,7 +169,7 @@ static void __iomem *devm_ioremap_resource(struct 
device *dev,
     ptr = ioremap_nocache(res->addr, res->size);
     if (!ptr) {
         dev_err(dev,
-           "ioremap failed (addr 0x%"PRIx64" size 0x%"PRIx64")\n",
+           "ioremap failed (addr 0x%"PRIpaddr" size 0x%"PRIpaddr")\n",
             res->addr, res->size);
         return ERR_PTR(-ENOMEM);
     }
@@ -1179,10 +1179,12 @@ static void arm_smmu_init_context_bank(struct 
arm_smmu_domain *smmu_domain)

     reg = (p2maddr & ((1ULL << 32) - 1));
     writel_relaxed(reg, cb_base + ARM_SMMU_CB_TTBR0_LO);
+#if !CONFIG_ARM_PA_32
     reg = (p2maddr >> 32);
     if (stage1)
         reg |= ARM_SMMU_CB_ASID(cfg) << TTBRn_HI_ASID_SHIFT;
     writel_relaxed(reg, cb_base + ARM_SMMU_CB_TTBR0_HI);
+#endif

     /*
      * TTBCR
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 1528ced509..20b4462fdd 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -466,8 +466,8 @@ typedef uint64_t xen_callback_t;
  /* Largest amount of actual RAM, not including holes */
  #define GUEST_RAM_MAX     (GUEST_RAM0_SIZE + GUEST_RAM1_SIZE)
  /* Suitable for e.g. const uint64_t ramfoo[] = GUEST_RAM_BANK_FOOS; */
+#if !CONFIG_ARM_PA_32
  #define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
  #define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }
+#else
+#define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE }
+#define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE }
+#endif

  /* Current supported guest VCPUs */
  #define GUEST_MAX_VCPUS 128
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index a28937d12a..7f86af54b6 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -572,7 +572,7 @@ const struct dt_device_node *dt_get_parent(const 
struct dt_device_node *node);
   * device-tree node. It returns 0 on success.
   */
  int dt_device_get_address(const struct dt_device_node *dev, unsigned 
int index,
-                          u64 *addr, u64 *size);
+                          paddr_t *addr, paddr_t *size);

  /**
   * dt_number_of_irq - Get the number of IRQ for a device
diff --git a/xen/include/xen/libfdt/libfdt.h 
b/xen/include/xen/libfdt/libfdt.h
index c71689e2be..fabde78edf 100644
--- a/xen/include/xen/libfdt/libfdt.h
+++ b/xen/include/xen/libfdt/libfdt.h
@@ -444,7 +444,7 @@ int fdt_num_mem_rsv(const void *fdt);
   *     -FDT_ERR_BADVERSION,
   *     -FDT_ERR_BADSTATE, standard meanings
   */
-int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t 
*size);
+int fdt_get_mem_rsv(const void *fdt, int n, paddr_t *address, paddr_t 
*size);

  /**
   * fdt_subnode_offset_namelen - find a subnode based on substring

3. I am happy with any other suggestion.

In linux source code 
(https://elixir.bootlin.com/linux/v6.1-rc1/source/include/linux/types.h#L152), 
CONFIG_PHYS_ADDR_T_64BIT 
<https://elixir.bootlin.com/linux/v6.1-rc1/K/ident/CONFIG_PHYS_ADDR_T_64BIT> 
is used for distinguish 64/32 bit physical address.

Kind regards,

Ayan


