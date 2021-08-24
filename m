Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F52C3F6002
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 16:16:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171421.312821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXE2-0003T0-2y; Tue, 24 Aug 2021 14:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171421.312821; Tue, 24 Aug 2021 14:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXE1-0003R2-V1; Tue, 24 Aug 2021 14:16:25 +0000
Received: by outflank-mailman (input) for mailman id 171421;
 Tue, 24 Aug 2021 14:16:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIXE0-0003Qo-LX
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 14:16:24 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d222b30-54b0-4351-afcc-447939b4e4fe;
 Tue, 24 Aug 2021 14:16:23 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-HHpSoQOjP_SQCCWCZRXA7g-1; Tue, 24 Aug 2021 16:16:21 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB7188.eurprd04.prod.outlook.com (2603:10a6:208:192::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 14:16:20 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 14:16:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR03CA0057.eurprd03.prod.outlook.com (2603:10a6:207:5::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 14:16:19 +0000
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
X-Inumbo-ID: 2d222b30-54b0-4351-afcc-447939b4e4fe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629814582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jE6X4tBiI86szEDdGQbXZYpX3yiiduQVWr9v8ha7zxo=;
	b=QiU6uiOKVWG9JwUdCImFh/JtXQwKZSssSC+YkiPcngsTyRywV0JpCuQRTpYI025qAOu4EG
	WUNhfdw7GL9GBGri7fjeaaxg3CSOmySnGaWl3aehfyzPWqD9LTjC9MeG3+ihAZxhGS7EV+
	7hWfLP7PDQ9oIjbNcFXsk/lXSJaZ0Q4=
X-MC-Unique: HHpSoQOjP_SQCCWCZRXA7g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFcyOwVgAY5PQikJpg4h5ADkmnO6KcIZv3i7dfQHC9eXnTqV6rVmaz7X0akoouw+l+A/LYGzABKoUUE4uDjJtpDF2lRzPHeMqv3qzVCE1fK8T4gdnEJbPYL5FanTAHpvotzFH/xSVEYDkVp9wJpwWdhTEAbb8u2Sp34VriyvfpZNBuU5kp9A2g+HRLTzV4STll8UanLou87dnK6VKF5U0BKAMqn4mFFFnGozIxFJgOUq9DSAqUXSJKi7FMqQY854vWn1Yc2Hy7Nh6vOF+ZD6V8CRa99CU+evd9XLeUJqFJOHUYU9TbU/dGx+1s0ou69OQHiV44L4Y9n4oUIiNRhfmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jE6X4tBiI86szEDdGQbXZYpX3yiiduQVWr9v8ha7zxo=;
 b=ALlWWgHM37sR6XgkSXaI4xly+0+KFE7HaKfSI6rKXbYWS9mzX7RPEDTNmay6yRfQNkL4zVKqpd3s7XAqAD0vbcxpHQy3yadiVUVpEh1FtCL7tKL9WRuw8yIZ/+C2RMYvs1QGNrY3GCxz+rogQwc1QVnHpbEo9usLHW4meHua5QwpsgpoPp7qEErktVU9dmhyTdo/iuRc6rHTGN0VmIhOYGzXdEWggDCAEIS9AVSAyo7KJse6SKpMyAJxgkGdcmG7eUTninJS1nEyqmxkpimIA+jSRB6QsxYvUZZyyN6Q/KJddx5+tu+i9XKNahTJN/Lcgn/oqBxiHDcrPkYtHezR9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 03/17] VT-d: have callers specify the target level for page
 table walks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Message-ID: <eac4bdd5-e2e3-cf23-d4fd-644b8ba51daf@suse.com>
Date: Tue, 24 Aug 2021 16:16:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR03CA0057.eurprd03.prod.outlook.com
 (2603:10a6:207:5::15) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7469afe5-8d23-41da-9f87-08d96709beb5
X-MS-TrafficTypeDiagnostic: AM0PR04MB7188:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB71888CF784E76A5F6AF13385B3C59@AM0PR04MB7188.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k3hBUx/DohoesUUGqMZK5tzMf0BE0IKk21cogajMNNRBbejDmOdzsO7hPA8zHT5FNUGasVQqP9WqKn3RAYw6AW0/BOLkw8bTd2HYyNpoBO2OM85rVSi8Lcyc+ZshNe5o2o1MVdm458DelCLRSCuxhKK5j3iZy2V9hlgxFviwOhUwnrfE6xhbm2kXyu/VSACnZmEv/TuLRcAwtH+rYtSvvgWE4mYbIatEccn8/GxP2N9wM/zI5q48RQRVBHVvwv2SSMIsZAfP7IVmDvIwRR1FCZXma7sqpPRyk3lHqbg4tNuLenKTh+I3PtQaBeOy+NI+w09UMHkfxC9ZQ9VmSQ7v/gI+j+iOUacVP/hIbD8SJ5hYYXb0d3UnykQy67M7ENSHiIvSb69mPd9bjIObGsplOW8hJ7FTio7AYpfkHGaZBfwC/swzdmnhFfopphKoYYtibJC6UAZx/JKGjGzWflfm32lZyG45OpuGR8vphi2Kvy8naJ64jNt66v4VZYq/00nVLTS/DU3AtGqNYu3jHlha8wre1ViXhF06pWSyPcRU9Qqg8jik2IDv/cDXtfK9o9TUQEi+55maWIZhenxqv5dDIVe/BJuzUyel8bJburfFNBT/VHM7TEqcFk9HnA8Vlho1RdyhGlNTVAQjW2AAicPIKZVybcpOk0OWtEF206fa7OPZc9K2gotOvfVV5zRN1jOxCUW+Wd11gxsEJEpIhsYaFEf3Ck+dVn9GzxMet8tJ+Cw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(366004)(39860400002)(376002)(346002)(6486002)(956004)(316002)(2616005)(26005)(186003)(2906002)(66476007)(66556008)(66946007)(8676002)(54906003)(4326008)(16576012)(8936002)(86362001)(36756003)(38100700002)(478600001)(31696002)(83380400001)(6916009)(31686004)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkNaMDU3bjduWkN1U3hYWTNiaUxRQ1VXYkZHYTBmdVdhem10TkpibklzSjQv?=
 =?utf-8?B?OW90bWlpTmszZzZYZ2JpbFZtUzhscG9MWTVkK1BWZGFTZUJWMEJLbmxQcFk4?=
 =?utf-8?B?YXpCdWpoU1ZoS1JwdXB6enZjRHNoaC9sMVN2clhCOThMdmVqalVjUElwN1o2?=
 =?utf-8?B?VjMzbUtqeW1IUk5QbXhOMGtIUjZLeFA4eUs3OFEzZENrcFl1Q1VYWnhmamlE?=
 =?utf-8?B?V0k4dzlDOWE3SG9HSEJFZ056VGd6NWppVi9JZnZTMVRJdEoveGQ2bUxnVUxp?=
 =?utf-8?B?am5zY2IxajQrbHZIQWo5YzRRMkZKZFBhWmh6bWxHbTkreG9MOFBQQU9qNTVt?=
 =?utf-8?B?dlBhK2lDWWo4THdjN3BTanV0SkdQdWo2cmJFWUJiUGM5ZEFyS0NFL2Z0QUMy?=
 =?utf-8?B?TXZFbEJUT2p6Skk3THlYR3VzdXNrWFdoanJ1RjNTQndUeFdnU2RJUmV3b2k0?=
 =?utf-8?B?b21Xc29xUnlHYkp4bVhncHBrNU9TZ3NXSFFKYlJFak1uNzFJL3hac2RhVmRG?=
 =?utf-8?B?S2dsYlBlWVNmcjFZeUtlRktid1FjUGlGU3R4SytaTUJWTkdUN1g0UXJpeXVz?=
 =?utf-8?B?ZU80dGVCODJ1d3p0MERGbmM3b1ovMmxrZ08raEFzZ0ZWbkNYL0liQzlzOWZG?=
 =?utf-8?B?V2x6ZEFpUEV2VnhLWXF5SVlVU0pCVWdIcW50ckZUckZ5QndQaUJCcEE2Z2lC?=
 =?utf-8?B?TEdzQ29LczYweVNqZzUrZVoycWJzTTZvTXpIOTlBWDV3L3F4ZklwMElNS0JO?=
 =?utf-8?B?TVRpTXpET1Z3d0dlRG90K3hzREcxdmE1YjNMRUVDTTNXc2l0UWtUbHhkVytt?=
 =?utf-8?B?ZmZGY3RCUGtBNE9VWWkya2tqaDRMVG1QY1NrMTFNMExaWkJiakNBUUM0VHdt?=
 =?utf-8?B?aFk5TTc2a2VLV0VhVWRlNXd2M3M4eGIycFkxdzNpOGI0U0ZSSGpiRkZOVDhz?=
 =?utf-8?B?clZwVjhkN3BIU0JQOUV4SWxzU21OTjNhS2NHc29JbkpiVHg2WnVVb1k3WXpN?=
 =?utf-8?B?SFpHQ2dwaUJzcVB3bWZjd0lVU1RUOWJLdzlSaDRNYVEwSEFhTFpNclhNQitV?=
 =?utf-8?B?SVpvaGUzNFNrbGIxNWtPbkZ5dUFNZlB5ZjJQcmkzY1VxeXJiRUpBVGJSZ3RS?=
 =?utf-8?B?MmY5Y0FqNG90MFMxdVBRQkVZR280VDZvcExXVklrSmhRVHo0ZXJ0U0ZuaGJN?=
 =?utf-8?B?MWJDUmoxekVPeC9mSTJoTGU3NjJiUFBjRHNNUGJPd3ZoTUZFQkxCWU9la3JZ?=
 =?utf-8?B?UUxEOWdzSm1rTTd0VkU1TzhHOXpGYVN2WDVQNmRjRVk3eSs5N044QU0raFJT?=
 =?utf-8?B?bk9FaEFTQ0RqT2Y0ZUE3ZytwYm9KVFZVNTR0RHdEbmQ2akIrbDRPbFRRa3hr?=
 =?utf-8?B?SGZOR01mc3NkYXBYMnQwc2NOVW1Yc3QxVVpKNVI2cktzZVVuUW9WQldqb2pu?=
 =?utf-8?B?M3JFaFpFN09PTkhtdXplUDVWVHBFQWFINWVlbWJ3dVRVN2dBT2lJOThzVjdp?=
 =?utf-8?B?WTZCT0N5MSs3M29yR08yMUdMMWovTEVEWS96aVBWVDAvazRkOXVHeVQ5WkxG?=
 =?utf-8?B?U0VGRHArNzRGTDkrYXpLcDB6ckxucG9YYy95bEwvVDFjMHVQRTgxWHE1UTho?=
 =?utf-8?B?azRGZTRLcExVTDlVVlFnbUx6MWluL2IwMzR5VDZlV1J1NDdKbWY0d21GVm1I?=
 =?utf-8?B?UUNETlZ4a2RmK2FudGZKYkUyWlFRRWZlTFBOV3ppUHhmTkFtd3JRci90Wnpv?=
 =?utf-8?Q?R1TmiKQnoMhWepJW8Al5ZWtcxq0wqF5dEE0Z9UJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7469afe5-8d23-41da-9f87-08d96709beb5
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 14:16:20.2815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EjEXMSqmu+RyPLGZZhA+jd7u8snjBz/deKVHu2YYTwFGmu+khnBqFiLfiX8jqdku2liQpETcx7B+Mr+QE9lFfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7188

In order to be able to insert/remove super-pages we need to allow
callers of the walking function to specify at which point to stop the
walk.

For intel_iommu_lookup_page() integrate the last level access into
the main walking function.

dma_pte_clear_one() gets only partly adjusted for now: Error handling
and order parameter get put in place, but the order parameter remains
ignored (just like intel_iommu_map_page()'s order part of the flags).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I have to admit that I don't understand why domain_pgd_maddr() wants to
populate all page table levels for DFN 0.

I was actually wondering whether it wouldn't make sense to integrate
dma_pte_clear_one() into its only caller intel_iommu_unmap_page(), for
better symmetry with intel_iommu_map_page().

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -270,63 +270,116 @@ static u64 bus_to_context_maddr(struct v
     return maddr;
 }
 
-static u64 addr_to_dma_page_maddr(struct domain *domain, u64 addr, int alloc)
+/*
+ * This function walks (and if requested allocates) page tables to the
+ * designated target level. It returns
+ * - 0 when a non-present entry was encountered and no allocation was
+ *   requested,
+ * - a small positive value (the level, i.e. below PAGE_SIZE) upon allocation
+ *   failure,
+ * - for target > 0 the address of the page table holding the leaf PTE for
+ *   the requested address,
+ * - for target == 0 the full PTE.
+ */
+static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
+                                       unsigned int target,
+                                       unsigned int *flush_flags, bool alloc)
 {
     struct domain_iommu *hd = dom_iommu(domain);
     int addr_width = agaw_to_width(hd->arch.vtd.agaw);
     struct dma_pte *parent, *pte = NULL;
-    int level = agaw_to_level(hd->arch.vtd.agaw);
-    int offset;
+    unsigned int level = agaw_to_level(hd->arch.vtd.agaw), offset;
     u64 pte_maddr = 0;
 
     addr &= (((u64)1) << addr_width) - 1;
     ASSERT(spin_is_locked(&hd->arch.mapping_lock));
+    ASSERT(target || !alloc);
+
     if ( !hd->arch.vtd.pgd_maddr )
     {
         struct page_info *pg;
 
-        if ( !alloc || !(pg = iommu_alloc_pgtable(domain)) )
+        if ( !alloc )
+            goto out;
+
+        pte_maddr = level;
+        if ( !(pg = iommu_alloc_pgtable(domain)) )
             goto out;
 
         hd->arch.vtd.pgd_maddr = page_to_maddr(pg);
     }
 
-    parent = (struct dma_pte *)map_vtd_domain_page(hd->arch.vtd.pgd_maddr);
-    while ( level > 1 )
+    pte_maddr = hd->arch.vtd.pgd_maddr;
+    parent = map_vtd_domain_page(pte_maddr);
+    while ( level > target )
     {
         offset = address_level_offset(addr, level);
         pte = &parent[offset];
 
         pte_maddr = dma_pte_addr(*pte);
-        if ( !pte_maddr )
+        if ( !dma_pte_present(*pte) || (level > 1 && dma_pte_superpage(*pte)) )
         {
             struct page_info *pg;
+            /*
+             * Higher level tables always set r/w, last level page table
+             * controls read/write.
+             */
+            struct dma_pte new_pte = { DMA_PTE_PROT };
 
             if ( !alloc )
-                break;
+            {
+                pte_maddr = 0;
+                if ( !dma_pte_present(*pte) )
+                    break;
+
+                /*
+                 * When the leaf entry was requested, pass back the full PTE,
+                 * with the address adjusted to account for the residual of
+                 * the walk.
+                 */
+                pte_maddr = pte->val +
+                    (addr & ((1UL << level_to_offset_bits(level)) - 1) &
+                     PAGE_MASK);
+                if ( !target )
+                    break;
+            }
 
+            pte_maddr = level - 1;
             pg = iommu_alloc_pgtable(domain);
             if ( !pg )
                 break;
 
             pte_maddr = page_to_maddr(pg);
-            dma_set_pte_addr(*pte, pte_maddr);
+            dma_set_pte_addr(new_pte, pte_maddr);
 
-            /*
-             * high level table always sets r/w, last level
-             * page table control read/write
-             */
-            dma_set_pte_readable(*pte);
-            dma_set_pte_writable(*pte);
+            if ( dma_pte_present(*pte) )
+            {
+                struct dma_pte *split = map_vtd_domain_page(pte_maddr);
+                unsigned long inc = 1UL << level_to_offset_bits(level - 1);
+
+                split[0].val = pte->val;
+                if ( inc == PAGE_SIZE )
+                    split[0].val &= ~DMA_PTE_SP;
+
+                for ( offset = 1; offset < PTE_NUM; ++offset )
+                    split[offset].val = split[offset - 1].val + inc;
+
+                iommu_sync_cache(split, PAGE_SIZE);
+                unmap_vtd_domain_page(split);
+
+                if ( flush_flags )
+                    *flush_flags |= IOMMU_FLUSHF_modified;
+            }
+
+            write_atomic(&pte->val, new_pte.val);
             iommu_sync_cache(pte, sizeof(struct dma_pte));
         }
 
-        if ( level == 2 )
+        if ( --level == target )
             break;
 
         unmap_vtd_domain_page(parent);
         parent = map_vtd_domain_page(pte_maddr);
-        level--;
     }
 
     unmap_vtd_domain_page(parent);
@@ -352,7 +405,7 @@ static uint64_t domain_pgd_maddr(struct
     if ( !hd->arch.vtd.pgd_maddr )
     {
         /* Ensure we have pagetables allocated down to leaf PTE. */
-        addr_to_dma_page_maddr(d, 0, 1);
+        addr_to_dma_page_maddr(d, 0, 1, NULL, true);
 
         if ( !hd->arch.vtd.pgd_maddr )
             return 0;
@@ -704,8 +757,9 @@ static int __must_check iommu_flush_iotl
 }
 
 /* clear one page's page table */
-static void dma_pte_clear_one(struct domain *domain, uint64_t addr,
-                              unsigned int *flush_flags)
+static int dma_pte_clear_one(struct domain *domain, daddr_t addr,
+                             unsigned int order,
+                             unsigned int *flush_flags)
 {
     struct domain_iommu *hd = dom_iommu(domain);
     struct dma_pte *page = NULL, *pte = NULL;
@@ -713,11 +767,11 @@ static void dma_pte_clear_one(struct dom
 
     spin_lock(&hd->arch.mapping_lock);
     /* get last level pte */
-    pg_maddr = addr_to_dma_page_maddr(domain, addr, 0);
-    if ( pg_maddr == 0 )
+    pg_maddr = addr_to_dma_page_maddr(domain, addr, 1, flush_flags, false);
+    if ( pg_maddr < PAGE_SIZE )
     {
         spin_unlock(&hd->arch.mapping_lock);
-        return;
+        return pg_maddr ? -ENOMEM : 0;
     }
 
     page = (struct dma_pte *)map_vtd_domain_page(pg_maddr);
@@ -727,7 +781,7 @@ static void dma_pte_clear_one(struct dom
     {
         spin_unlock(&hd->arch.mapping_lock);
         unmap_vtd_domain_page(page);
-        return;
+        return 0;
     }
 
     dma_clear_pte(*pte);
@@ -737,6 +791,8 @@ static void dma_pte_clear_one(struct dom
     iommu_sync_cache(pte, sizeof(struct dma_pte));
 
     unmap_vtd_domain_page(page);
+
+    return 0;
 }
 
 static int iommu_set_root_entry(struct vtd_iommu *iommu)
@@ -1834,8 +1890,9 @@ static int __must_check intel_iommu_map_
         return 0;
     }
 
-    pg_maddr = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), 1);
-    if ( !pg_maddr )
+    pg_maddr = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), 1, flush_flags,
+                                      true);
+    if ( pg_maddr < PAGE_SIZE )
     {
         spin_unlock(&hd->arch.mapping_lock);
         return -ENOMEM;
@@ -1885,17 +1942,14 @@ static int __must_check intel_iommu_unma
     if ( iommu_hwdom_passthrough && is_hardware_domain(d) )
         return 0;
 
-    dma_pte_clear_one(d, dfn_to_daddr(dfn), flush_flags);
-
-    return 0;
+    return dma_pte_clear_one(d, dfn_to_daddr(dfn), order, flush_flags);
 }
 
 static int intel_iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn,
                                    unsigned int *flags)
 {
     struct domain_iommu *hd = dom_iommu(d);
-    struct dma_pte *page, val;
-    u64 pg_maddr;
+    uint64_t val;
 
     /*
      * If VT-d shares EPT page table or if the domain is the hardware
@@ -1907,25 +1961,16 @@ static int intel_iommu_lookup_page(struc
 
     spin_lock(&hd->arch.mapping_lock);
 
-    pg_maddr = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), 0);
-    if ( !pg_maddr )
-    {
-        spin_unlock(&hd->arch.mapping_lock);
-        return -ENOENT;
-    }
-
-    page = map_vtd_domain_page(pg_maddr);
-    val = page[dfn_x(dfn) & LEVEL_MASK];
+    val = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), 0, NULL, false);
 
-    unmap_vtd_domain_page(page);
     spin_unlock(&hd->arch.mapping_lock);
 
-    if ( !dma_pte_present(val) )
+    if ( val < PAGE_SIZE )
         return -ENOENT;
 
-    *mfn = maddr_to_mfn(dma_pte_addr(val));
-    *flags = dma_pte_read(val) ? IOMMUF_readable : 0;
-    *flags |= dma_pte_write(val) ? IOMMUF_writable : 0;
+    *mfn = maddr_to_mfn(val);
+    *flags = val & DMA_PTE_READ ? IOMMUF_readable : 0;
+    *flags |= val & DMA_PTE_WRITE ? IOMMUF_writable : 0;
 
     return 0;
 }


