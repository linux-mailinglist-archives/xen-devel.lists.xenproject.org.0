Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE61A3F5FFF
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 16:15:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171414.312798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXDE-0002QG-FZ; Tue, 24 Aug 2021 14:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171414.312798; Tue, 24 Aug 2021 14:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXDE-0002OM-CU; Tue, 24 Aug 2021 14:15:36 +0000
Received: by outflank-mailman (input) for mailman id 171414;
 Tue, 24 Aug 2021 14:15:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIXDD-0002OG-KY
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 14:15:35 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2c7d108-843e-4b26-98f9-992cc186dfbf;
 Tue, 24 Aug 2021 14:15:34 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-4jXPHHiKNaWQrkEmo7GzoQ-1; Tue, 24 Aug 2021 16:15:32 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB7188.eurprd04.prod.outlook.com (2603:10a6:208:192::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 14:15:30 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 14:15:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR06CA0118.eurprd06.prod.outlook.com (2603:10a6:208:ab::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 14:15:30 +0000
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
X-Inumbo-ID: c2c7d108-843e-4b26-98f9-992cc186dfbf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629814533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9xWLrkNm6/WDFl8AO3HJxUPfOuuvUqwRgRuL5YEUGKU=;
	b=aUIw/lQV7cH/hVqibLTKWUmvwsctSf+InxN9xZ6vIRm738vS77m9wIV4xgqVf+pPxCEwYZ
	koruhg7GEGLQi22WXaDpmddJvVNMj6xzriiYM7EPlahclKv1rjvy1q2g+yBDdtuwwUbgwn
	HFC6uATBewAZHpfv1mUCsC9DhEtF0Dw=
X-MC-Unique: 4jXPHHiKNaWQrkEmo7GzoQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0gXP/KxjlFJX1pAJs70O5WKXWra2Sr5qCNXpxb1dIBNOTQdcbl3BkF0ZBkxfPjoWIYGXGrHkt31O4gAQUg8m38gcFsBqio0K+Emd6wScYu3+nzBu8pXm4Tjsmf+kvwZCDedmrcxjtdBTtM9aNYjedkOxpPb3/HPI1G2Dpbvb0wLwc1XwJGGl8QfcBQQ+0JuoYytDPNS7p4BuDTBdJ+G1iUcbLEC9aX2+7uW0de6gVK+UQHFsdD5L3+mLcPXA0kRIOHwgrPXj9SjzgcRWfCGdq42lMrhon1wjpRVc2SKYgdzDDvmKgeB5rDLdqB43dQNNdVfJ/xgJ7QlNJyg6Lmk+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xWLrkNm6/WDFl8AO3HJxUPfOuuvUqwRgRuL5YEUGKU=;
 b=CgQ6V/c3qAqhaV3oL+7IUCQ79edu7xvMa8D4PgbA78GCHtzwoqWyEdN5tA9m3TKVBVKaHcVEeMlIiE4GlLN080WrqnCq6lSjxShAlnAbjgYF9YvwwBeiipk63a8N0lnZAgxRvCiztsWaTSqMyP5VPvm1bDNJ9ykz9RIHZ2ls03Tx1zHSRUPqV4oFwtzsVjIexCrpLMaQCJpfRpe78DEGtGlvtpaFzzifjzTE/GGU51ZkGf3Z7G5DOqnYiLn+S++hrhJPCHmwv3GF9cZu8H2qbxQFBL0s7TBrYZznmd4okDJ9KGVHWeS7eOBPiSDbjjp9dbBUHgESerl+9k650L+glA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 01/17] AMD/IOMMU: avoid recording each level's MFN when
 walking page table
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Message-ID: <847bf96c-19fb-677c-cb0f-16e58a6abe55@suse.com>
Date: Tue, 24 Aug 2021 16:15:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR06CA0118.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::23) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c4e224c-d5d2-4b48-ed18-08d96709a10f
X-MS-TrafficTypeDiagnostic: AM0PR04MB7188:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB7188255C22B9ABF44E2C1C4FB3C59@AM0PR04MB7188.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+00/At1kWZRWMh+yqYQPQnO3xo7B7QpqNWvJxgn7T2N7Zo8mAH1Vs03jVvxpFZZ6oPERvE/UAfeK5nciaBRpN/Ty8DqRVUGwZ3AbcUNSzlt9KATDvd94x9lZQVA76SoOEGG7ACob2Lsg/Z8YiBsQXFv/H1c7iH42m2gMuOt4zq5KzwdIXzTpdS5SkTG3lxBSdICt7sSpow76Cb3IaeS2kCvmo19eEbhMOUY01cjDSZu+ICn9jTvWYph6hT+efpRm1LrVK4Qp37KhTo6on01ve8QL1AA74ZleHn2+XU0dZ6aYMDUx/oKcjONgd3gYHoRI7BsdTr5FM5O6VnRCtWrtDrEPiCOJJtIGKgiUEjKVtVHz1IFHUUfLKn7wqPgyfAtumwpOCL8J9a8sQ5Eit9cOXFbrCsC35cMKoSiJ4UyCD1qvhj3qCeRRj2wGBcbaIJeHO0ItPTWcZkiENetuQSl21aXR8StgGvWHSPupna7Nu5RT9+q7/tXWCS4E02uLSHcr8gyDM4Xzdl8oxpz/qyklSIwk+SsMNFGDBNMLV8ez/vOZwVDRttVy2JJY1FPweSSQAewdrMC0BC49fC2z/OrLZy8LFjy4LKf69DENYDnYWVEnq4URnTW+k5bVI+HtV10Xpx2zbhQeTc+4mA25fJjuv0YZ9ld5+huWrMtSpTaolZmSicj6bcybl0vwg8QuIa7WfQMwLbgfOkQRIifQGPMeYFGzLrdRwTbTnBhHRcDxpMU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(366004)(39860400002)(376002)(346002)(6486002)(956004)(316002)(2616005)(26005)(186003)(2906002)(66476007)(66556008)(66946007)(8676002)(54906003)(4326008)(16576012)(8936002)(86362001)(36756003)(38100700002)(478600001)(31696002)(83380400001)(6916009)(31686004)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUJPczgvcDczQ1FHVEVmSWdYdTFtVVF4WDU4WllpcmFNNkVuS0IxQnNCcmxu?=
 =?utf-8?B?TXpmV2JZTVlHV0FFMEZJV2NsMDFXTFhLZmRKczJGaW43QVZ5Qlg1QnlHbmRL?=
 =?utf-8?B?VVgrM2NnZVJiUmllV2x3KzdHemcxNTZTNVlPaDdiWVl0Vkt3WEF2ajMxTWQz?=
 =?utf-8?B?TkFXRGhBMVJ2dzZhelpiU1ZBTlpITWQzTEdHTGgzUkIxUDU0NmVYUW5SS0dO?=
 =?utf-8?B?K3UvUXd4RzBHdmZsYnVsVmFncEJFOTRORkQ2anJScndwcU1zSG0zeXhTTHgx?=
 =?utf-8?B?K3B3QWV5YTRMRjhUclM1cnZtYUE3WUttaUFSV2NrRDNIeXdlTkpUeHpwZjhz?=
 =?utf-8?B?SEl6Z09BUzVycjZHVFgwVVdMcXU1ZVR6LzV4LzlZcUNwVitVMTFOL0l1TUdi?=
 =?utf-8?B?ZXJ2cVc3VGZycy9pbjV1VzkrWFN6cmQwV29xRzNMbUpOL3Fhd3lyODk3S1c2?=
 =?utf-8?B?anAzTVlISkZrd0RVL0lIcDhReSttRnBCYzZONU93K1daeDB1Z1E4SDhMd2hS?=
 =?utf-8?B?U2ZDV09UTTh3elo0MWFLc3BUNVlYVW9IR29FNU83bVZEcngrQ1JQclhNQktW?=
 =?utf-8?B?amRyQTBwZkU3UzNHeXMxeDBnZG9DTUFURWwwTlJCWDh5WmxKd0JXNjdLT0Fl?=
 =?utf-8?B?ZU51UWVzNXd2ZUxrQ0E5Nm15aWFBMHJaQVlTdlRiMTgwYzZlYk9TRkNhM05w?=
 =?utf-8?B?VGR4SmJPQWxhMmVvREVLRmV6bForZVhhVGdJY1d6Y0hjY1JxYVoydmFjZGpZ?=
 =?utf-8?B?Zk40TlkyNG5GcWFhZTJkN0lxdjZWSmtLc3Q1Tml2dTczb25jK3FoLzI1NThv?=
 =?utf-8?B?NlczQWJhdnZFY2FJWWdmODVCOU1nbDEzdlBUNmZLa1NLbEhxUXRhcDBheWZD?=
 =?utf-8?B?RDR6MkNuQ0hFSTREcndTOXRuN1ZtQzFubmNBOU9aTjlIWlVMMGYyNFp4QVVq?=
 =?utf-8?B?SzUrZllEbVB2WFlqd1ovdkg0UkdxREhoN0kveWFseDdUcmZ0aHZUakhhUzgz?=
 =?utf-8?B?cWk3QjdLTUd6dnBxUjhHZ0lhQW9wVTJPMGlHNkNKTTZhVWxpaDdxajlkVXR3?=
 =?utf-8?B?bmx2YkswZFZZUXZRRThRVjlxZkppR1lpZGRGOHkyY3Axam1uVHZNUG1ubkxm?=
 =?utf-8?B?NEplQ3YrNVdiTlRpNDRjVEdXeXRrbUNrK25SejJSNFE4MzVRMm8vbDBPT1BT?=
 =?utf-8?B?WDB5TERYM0NUaVIzUThlSE4welB5NXhQdlBaWFREL1VHdk1acnFUejVZQ2t0?=
 =?utf-8?B?RnAvQ2VSRlBUc0RITzZZL0l3WWN2Q1AyaXM3WG9KWlFQNUo4V2lncVRUeWpX?=
 =?utf-8?B?RDkzbDdVZTJqMWl2SlNxMS90cUJIWlU4RGphUDRrcjBzbVZpc3JQY1ZFakhr?=
 =?utf-8?B?RTN3ZmNmVzBCRnI3SHFoZGc0ekV6YU5TT1JEUEQ0UVh1MFdrTW5TSUkyMXRt?=
 =?utf-8?B?Um0xV2ZjN1FWcy80ZW9wUXhjU2hldVhMVkl4QnQxU2JFdkh0RnNvS09EQ09s?=
 =?utf-8?B?TVdndS9ya0JETCs1YWtlS1JJZWwwa0d4VVYzWmtvWUtaSE5oR1B3YW9SYTZ3?=
 =?utf-8?B?TTRIbkxRSnBVQmd0OGg2My8yemhLWXFJSXkwcUNubGVuYzFDN0RiOVFZaitE?=
 =?utf-8?B?TUpCRHVXbzVaZEYrRDdPWTJjbUoxUWMralhMdFRtSzI1NWxOTEFPL2FaSFF1?=
 =?utf-8?B?ZENZTE15TzB5N2htZEIrbkN2TTMzYzAwZFUwR3RTd00weDNicnNXWWdnN3dw?=
 =?utf-8?Q?jZ0pBplwtC9sZlNTNivBzetmurqKhrPiDWkN2U0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4e224c-d5d2-4b48-ed18-08d96709a10f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 14:15:30.5007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rBHZo6Y04hbPPLn/j4Pk0nsYoEM6AEA2uMYOOKTpBkBblZSaeeQ7ZJNKfYevivuoK/KFv3DYv22N6qGfMJCsnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7188

Both callers only care about the target (level 1) MFN. I also cannot
see what we might need higher level MFNs for down the road. And even
modern gcc doesn't recognize the optimization potential.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -178,7 +178,7 @@ void __init iommu_dte_add_device_entry(s
  * page tables.
  */
 static int iommu_pde_from_dfn(struct domain *d, unsigned long dfn,
-                              unsigned long pt_mfn[], bool map)
+                              unsigned long *pt_mfn, bool map)
 {
     union amd_iommu_pte *pde, *next_table_vaddr;
     unsigned long  next_table_mfn;
@@ -203,7 +203,6 @@ static int iommu_pde_from_dfn(struct dom
     while ( level > 1 )
     {
         unsigned int next_level = level - 1;
-        pt_mfn[level] = next_table_mfn;
 
         next_table_vaddr = map_domain_page(_mfn(next_table_mfn));
         pde = &next_table_vaddr[pfn_to_pde_idx(dfn, level)];
@@ -273,7 +272,7 @@ static int iommu_pde_from_dfn(struct dom
     }
 
     /* mfn of level 1 page table */
-    pt_mfn[level] = next_table_mfn;
+    *pt_mfn = next_table_mfn;
     return 0;
 }
 
@@ -282,9 +281,7 @@ int amd_iommu_map_page(struct domain *d,
 {
     struct domain_iommu *hd = dom_iommu(d);
     int rc;
-    unsigned long pt_mfn[7];
-
-    memset(pt_mfn, 0, sizeof(pt_mfn));
+    unsigned long pt_mfn = 0;
 
     spin_lock(&hd->arch.mapping_lock);
 
@@ -310,7 +307,7 @@ int amd_iommu_map_page(struct domain *d,
         return rc;
     }
 
-    if ( iommu_pde_from_dfn(d, dfn_x(dfn), pt_mfn, true) || (pt_mfn[1] == 0) )
+    if ( iommu_pde_from_dfn(d, dfn_x(dfn), &pt_mfn, true) || !pt_mfn )
     {
         spin_unlock(&hd->arch.mapping_lock);
         AMD_IOMMU_DEBUG("Invalid IO pagetable entry dfn = %"PRI_dfn"\n",
@@ -320,7 +317,7 @@ int amd_iommu_map_page(struct domain *d,
     }
 
     /* Install 4k mapping */
-    *flush_flags |= set_iommu_ptes_present(pt_mfn[1], dfn_x(dfn), mfn_x(mfn),
+    *flush_flags |= set_iommu_ptes_present(pt_mfn, dfn_x(dfn), mfn_x(mfn),
                                            1, 1, (flags & IOMMUF_writable),
                                            (flags & IOMMUF_readable));
 
@@ -332,11 +329,9 @@ int amd_iommu_map_page(struct domain *d,
 int amd_iommu_unmap_page(struct domain *d, dfn_t dfn,
                          unsigned int *flush_flags)
 {
-    unsigned long pt_mfn[7];
+    unsigned long pt_mfn = 0;
     struct domain_iommu *hd = dom_iommu(d);
 
-    memset(pt_mfn, 0, sizeof(pt_mfn));
-
     spin_lock(&hd->arch.mapping_lock);
 
     if ( !hd->arch.amd.root_table )
@@ -345,7 +340,7 @@ int amd_iommu_unmap_page(struct domain *
         return 0;
     }
 
-    if ( iommu_pde_from_dfn(d, dfn_x(dfn), pt_mfn, false) )
+    if ( iommu_pde_from_dfn(d, dfn_x(dfn), &pt_mfn, false) )
     {
         spin_unlock(&hd->arch.mapping_lock);
         AMD_IOMMU_DEBUG("Invalid IO pagetable entry dfn = %"PRI_dfn"\n",
@@ -354,10 +349,10 @@ int amd_iommu_unmap_page(struct domain *
         return -EFAULT;
     }
 
-    if ( pt_mfn[1] )
+    if ( pt_mfn )
     {
         /* Mark PTE as 'page not present'. */
-        *flush_flags |= clear_iommu_pte_present(pt_mfn[1], dfn_x(dfn));
+        *flush_flags |= clear_iommu_pte_present(pt_mfn, dfn_x(dfn));
     }
 
     spin_unlock(&hd->arch.mapping_lock);


