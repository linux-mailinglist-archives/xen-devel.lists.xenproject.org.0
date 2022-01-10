Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A732C489D6D
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 17:23:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255398.437628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xRn-0002oU-4a; Mon, 10 Jan 2022 16:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255398.437628; Mon, 10 Jan 2022 16:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xRn-0002jp-07; Mon, 10 Jan 2022 16:23:03 +0000
Received: by outflank-mailman (input) for mailman id 255398;
 Mon, 10 Jan 2022 16:23:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6xRl-0002jc-Gr
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 16:23:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93da5b12-7231-11ec-81c1-a30af7de8005;
 Mon, 10 Jan 2022 17:23:00 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2051.outbound.protection.outlook.com [104.47.5.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-oevbNLcfNSClFExGJMpDug-1; Mon, 10 Jan 2022 17:22:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2446.eurprd04.prod.outlook.com (2603:10a6:800:4e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 16:22:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 16:22:53 +0000
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
X-Inumbo-ID: 93da5b12-7231-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641831780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JfXG07vrt481Wpu05jJkO/De1cKPglNTB2enOwwMPZg=;
	b=cpC2Uf4BzPpH5jDon7JPC7753LrLLuAv0PvBo4XvsgvFQ1Yh04tHkkoi+DEdihNqXFJRvA
	TDtJYQ0jf9utrj056dlL9l8C6o0oFsuPiUUoctf/glSVRO9kPOcfBzH5NTri7uSTLa5STQ
	Cmq0s+d6TaaG9MCD9ufEYtskFulsd1s=
X-MC-Unique: oevbNLcfNSClFExGJMpDug-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUeLs/T18jsWZIr7lp/1FLB2eVg2ZktDCCHatpM0oSbCu+d+uDkbzRjks6IM8xVgbN3NV91sriLrJbxXIMeoe/Wubo+mSGk0NvLaQgLGnTyt9lCu+ylbZRN7JlWmtxA5JN9+UVIOUbBht1EHbKdwhaCKue7gNM7inNI6FGzdiO926TImQzqHI7qiaZ7KabuqE0YJt5+VRKgYdb6zD9tzJ3tKS02q0I7ZS2Kprf6F+N7+rs1DvlFB1K549sSfhDmDYfcvy5i684YU1ewBHMsN8NIquibSqSjftKb1FPrqWVq5JvI8JURK8ReXKeAdUYEtIbH5UXjxlzCvrR8SZHnTKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfXG07vrt481Wpu05jJkO/De1cKPglNTB2enOwwMPZg=;
 b=XYOvXFRLSr4sCABI85JX2SUUQqA3Kbba83/jKmVq1cj74VK8l/NGdlJqrUvH9pHTImyOrVqgofDD1BoWgAILQ+LfQGnaG0jtlR7frhKvMByEdb8o5DPHewsJuucMCmQtAAVjgsZ4rKBZfSf30sxS/E1GV4f0Viys1JHNmiIbflHieEQYhc5yP4jO1Rb22PtQdnKhr3qbZSX3LmmutkWPXvWNkdtoHVnNTB3KSe+scSLQUgo45rYcUrJcfHEv+a+HFoLvGo2hy1zPOGQ80OwYXhIZ3d45vyZG9u9S9z8UpQLQ2jOCD9KDFyQ1x4VM4n2OW4ZLhAwKMn0kh8VBXzz7mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5bfc3618-12ff-f673-e880-6ea13bcf8fa3@suse.com>
Date: Mon, 10 Jan 2022 17:22:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v3 02/23] VT-d: have callers specify the target level for page
 table walks
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
In-Reply-To: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0034.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a1c8f0e-354d-403e-5a79-08d9d455740a
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2446:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB244627C930DCB3E5F8567D53B3509@VI1PR0401MB2446.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5Cz2cNjnif+1WS93d8MP1vODFqWE2mHAl+j+uBfd/GdkUQVYkGg8NgoFUulqYzlgFARYDwqZtAR0UyMujQwnLZU88SHo8cW0YKD9MbqZsw5goz0TURpLvg/N71MBKCDAXqE3QzQA/IjO2BzAGgbFz8PQJxCFCp30lslLzitIfRvS468bgkR+m3LT5f7A71c/Fm39s5sIwDhbQXMD2kSPf4AxkQEurU2QAhA6WVhkVsqlje8xzm7GatGqnwhM34441kzkbIloEDEQcg4GyKYs0fZd+kWkiYIsIjj4gZHnimss1G9rfSAXHKWm6SIe2swJYZxwEYVilbu+o1LV5OM5QfgW7Kq3hB1AcS7BbjFAFcjnKT4I9PWddA51o8oy1vTl0VeAGpycJ6B2kUtandukNHj9nqJ+rHbwnjW8lZ0SoB6Tbon+5JW6ZaDMDnHf0PaDliKqw1823tkabtRIKdCRdtxWCeiLW70X2JLknmFywlxp80BXfJdsRfm4CuyHBbRRWq7UgLjEVP4yiLxZWyMYxECizY2I38+e/47vOgkpRoPVFTNA5s/HTBMwYvAKmzm+iUTf37v8WyyRi95IVWc6plV/H62gG/+8IA5XQiY+LgsunJrLb8y1nrird1xJ8UZOitYt8fD6fZZk35vi6CszACsmHbNw+nZrdvq4NgKBFhL0F4TxZj/BSwDEygewDHn4LIb8SJzCWbVNhE4WHg5UbcLaqJa8HR+bcKwN/ohf8EhEpU8XqqbufqBxm11/RtQZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(54906003)(508600001)(26005)(31696002)(6512007)(8676002)(5660300002)(36756003)(83380400001)(4326008)(2616005)(86362001)(66946007)(316002)(66476007)(2906002)(6486002)(6916009)(66556008)(38100700002)(6506007)(8936002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWZFOGdNN2RYNXFNNk5pNXBsLzhwQVVzcDRjK1VsaEczSWRTNGZOenczcG5C?=
 =?utf-8?B?MnFMNDZvUnMxQ3owS3llTDZkenQ2M0dZMHlFRDVKM2dqYi9vaG95V3JIQWFV?=
 =?utf-8?B?ZXBjZjVZQnh4anVjOERXb0MzRWVTaWlKMXQwSm1qSnVvdWZnc2s3aDFLeUht?=
 =?utf-8?B?REVsQ0N3ZmNoOGRLSTB1M1ZESGtFK3hSakVqMDAvVThSWVZDNDBzSjFTR21C?=
 =?utf-8?B?QlhJNTZ3U2lOTGtPR3k3YkdsTzh0Z0VwajhKNnFabWZqd1dYYk8xRFFqaC8y?=
 =?utf-8?B?NFVZYzZkSzdPQ3BMdVVlcmtOVExNQk5WaEFjd0dqRWhodWZ4MnVoSnJmOFFr?=
 =?utf-8?B?ZEh3aHlicW9LcGQzSnVlcjZSSGtJOVRtVjJWb2tMNEM2a054YzNUNEYyU3BM?=
 =?utf-8?B?ZWRpVFJrcEFwUGpucU55T2FjVlh4aStDRm5QdEpQKzZBUWpUQXF4NjJPVGx4?=
 =?utf-8?B?djJzZ0ZoeUI3bEcrZEhmaXZxcEEzZmNPRGZpOE5nbEUrQjkzSTlWVVdqemFq?=
 =?utf-8?B?Zlh2OVYvNTJxV3hzZUJ6RTVSMHZaa3lWR2xtNXVJTEhWbm84UkFCdlpIaDVD?=
 =?utf-8?B?ZStGc21tT0duQ3RKZUw1MU9UWmQ3bnhHNXQ2ZWZkNVFpVnRycmR3bzZQL2Uy?=
 =?utf-8?B?WjRjSTlEVExubm50MFVvaEd4cWd0cTBIa1lMbDhQUm5ZT1UyeGdMdFFJZXBi?=
 =?utf-8?B?Rk9pdmdrZjluZ2hONVRBOWVib3hxNEpSenREQ0c4T0YvK0Z3YVdmSUJnRnFv?=
 =?utf-8?B?VWdmeW1Idkp1RmYrMFh5VUxiYWN5bC81dTRHVVkwRXpvVkxXYitFL3FBcFl2?=
 =?utf-8?B?MlJFNzlnU1VsY0MyVGFIN0Q5ZXpCVXRHZWpGTjV5dlpOZUc0b0RDZnFaOTA1?=
 =?utf-8?B?d3lITUZBUGRPN2VGQUtHTGJ3Z3BGeEVObkFtOFR2RjFpVDhqMWU3S2lSRytj?=
 =?utf-8?B?YVRyenB0czB1bDNjdFJEMDFVQmFTd3QySTlSYzVYSmhaZzM0cVd5eWtaZ1dQ?=
 =?utf-8?B?N3hGL2VtVjZtcTEvUklkcmRnQkFpZGZCTUp5WVYzaW0wM1NKU1ZwTXUyZnVl?=
 =?utf-8?B?SlJoTWhsUFAwYWE0U1F2NUxzNjNQWXlTNExZQUNDZWd2aE01T1lpcXNQZHVK?=
 =?utf-8?B?alVWamlYRnVNcWg4N3UvME9NTHQyNDFVM3VabjMvM28wekFIMHhISi92RDFq?=
 =?utf-8?B?NTdLc2NZRmJYMjRpenltdzZmSFlBYk5sN3hOWEEydUN1azhiNk1td1ZPVkVI?=
 =?utf-8?B?VEtxL1JiNkZhYlhKbjhBaHBzQ0o0N24zTFhvZkRiaEZtQStOS3ZpZVpzWW1T?=
 =?utf-8?B?VDRyWm5hWTIyREpldS9oTDUrMnpqV0lWV1VOM1htQjZFUisrTDF5SThFK1Jp?=
 =?utf-8?B?ZVN2eTlmZng2cmFnb1Z5ZXFOQjlWNFUrb0RkS3gwV2cxNGlEOTJCOWJocTBZ?=
 =?utf-8?B?VTNIODBkbC9FVmI5amZNa3B5ZmhXc1loSDVxeVBGVUxrVFFwdGJEK2Via2Zk?=
 =?utf-8?B?V2x0TG5pY2lycUovNE9tb3pWNWFkTzA0MmxIekxXREtKRWNWYTBLbGxIcWFW?=
 =?utf-8?B?bXNUZnJrT3VHR0ZqVzVnZVpacWNKc2FpSnlWVTM5cDloTGVwT0YwdHdjT2FF?=
 =?utf-8?B?WHo0cG1NN1AwNjBkcC8rL04wRkJSd0QraDlRMFNpUk5HcjBVZGpNNFpJMzZU?=
 =?utf-8?B?UjlIaWVONGJxcG13YVVuYmxyYnp5aG9iMStHNG81NkdmdVdXWFNPYVUxWXVX?=
 =?utf-8?B?UzdFSFVydlRZRFdGNEo0MjlhbGRTV3dkNHVrSVp6UFczNkdabkpzQ1NMUFNu?=
 =?utf-8?B?WkJQeTVqUTFaanZVZ1pwL3JmZEthZWljTG43RStqMVFBbGNhQ21oSzJaU2to?=
 =?utf-8?B?dnJQYmtiMTJOM012dXZmYWFUZ0lvVG5rc21FVHFUWGZqWXYvMEcwaE9uUDBy?=
 =?utf-8?B?MVlLdUxiR1Z1N1lPMWZZc2RXOEhnYjgxd3YxdURlRGZDM0d1OHhjeEtTbGZi?=
 =?utf-8?B?Yzl2TEwwUHgrUjhTUXdhNVlVVVJML1Bmb0grK2pnVU8ydW02MUNUNTN6c3hj?=
 =?utf-8?B?dThlQU5OYlVtWUhKMGY3Z3dXSWdJbEpoMmJjVE44T2s3NVg4WWVzVEtreGRt?=
 =?utf-8?B?UHZiSzBYSlNJRXVzTjdVSkR5VzlNam5aL042TXlMV2xsM0xzOENCdDNLZi9Y?=
 =?utf-8?Q?WdzY3CYzEqKrLj36mqXc3SM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a1c8f0e-354d-403e-5a79-08d9d455740a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 16:22:53.4769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2LrsU0bzYd/IRH/NtgHy5VCtUTfWP5E9B+RGg3ARiyAbRUyIrXjqCr55nbScVvdoDw+GprccZGCW2J2mSEqW5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2446

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
I was actually wondering whether it wouldn't make sense to integrate
dma_pte_clear_one() into its only caller intel_iommu_unmap_page(), for
better symmetry with intel_iommu_map_page().
---
v2: Fix build.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -347,63 +347,116 @@ static u64 bus_to_context_maddr(struct v
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
+ * - for target > 0 the physical address of the page table holding the leaf
+ *   PTE for the requested address,
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
@@ -430,7 +483,7 @@ static uint64_t domain_pgd_maddr(struct
         if ( !hd->arch.vtd.pgd_maddr )
         {
             /* Ensure we have pagetables allocated down to leaf PTE. */
-            addr_to_dma_page_maddr(d, 0, 1);
+            addr_to_dma_page_maddr(d, 0, 1, NULL, true);
 
             if ( !hd->arch.vtd.pgd_maddr )
                 return 0;
@@ -770,8 +823,9 @@ static int __must_check iommu_flush_iotl
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
@@ -779,11 +833,11 @@ static void dma_pte_clear_one(struct dom
 
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
@@ -793,7 +847,7 @@ static void dma_pte_clear_one(struct dom
     {
         spin_unlock(&hd->arch.mapping_lock);
         unmap_vtd_domain_page(page);
-        return;
+        return 0;
     }
 
     dma_clear_pte(*pte);
@@ -803,6 +857,8 @@ static void dma_pte_clear_one(struct dom
     iommu_sync_cache(pte, sizeof(struct dma_pte));
 
     unmap_vtd_domain_page(page);
+
+    return 0;
 }
 
 static int iommu_set_root_entry(struct vtd_iommu *iommu)
@@ -1914,8 +1970,9 @@ static int __must_check intel_iommu_map_
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
@@ -1965,17 +2022,14 @@ static int __must_check intel_iommu_unma
     if ( iommu_hwdom_passthrough && is_hardware_domain(d) )
         return 0;
 
-    dma_pte_clear_one(d, dfn_to_daddr(dfn), flush_flags);
-
-    return 0;
+    return dma_pte_clear_one(d, dfn_to_daddr(dfn), 0, flush_flags);
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
@@ -1987,25 +2041,16 @@ static int intel_iommu_lookup_page(struc
 
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


