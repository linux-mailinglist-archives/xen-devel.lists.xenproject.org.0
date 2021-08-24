Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 740CA3F603E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 16:24:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171486.312933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXLh-0002Le-SC; Tue, 24 Aug 2021 14:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171486.312933; Tue, 24 Aug 2021 14:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXLh-0002JB-P6; Tue, 24 Aug 2021 14:24:21 +0000
Received: by outflank-mailman (input) for mailman id 171486;
 Tue, 24 Aug 2021 14:24:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIXLg-0002GU-AG
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 14:24:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f76ed428-04e6-11ec-a8dd-12813bfff9fa;
 Tue, 24 Aug 2021 14:24:18 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2056.outbound.protection.outlook.com [104.47.1.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-ly5AUsXZOeOtpZ0n4Ay5Ew-1; Tue, 24 Aug 2021 16:24:16 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB5682.eurprd04.prod.outlook.com (2603:10a6:208:131::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.24; Tue, 24 Aug
 2021 14:24:15 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 14:24:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0902CA0013.eurprd09.prod.outlook.com (2603:10a6:200:9b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Tue, 24 Aug 2021 14:24:14 +0000
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
X-Inumbo-ID: f76ed428-04e6-11ec-a8dd-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629815058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QnyJfGA//OwEpfHeLio8RibL7MiCX+yG5T2utpneOsU=;
	b=ek6aSuGlH4GyBpocccklfOskI6S6i321K/k1mdTwXHTXddcNuT60rOevxUwxHhWqkRfvk/
	n9/6RUW/NdcR3U7kfWBmzZYinBu0P+9VBe9wXx/Apqf5lCuBrvTeZh0WIQLucqMMbnZoIh
	g27liBFGwo62Ohr4pACqfUv/u/ZOstU=
X-MC-Unique: ly5AUsXZOeOtpZ0n4Ay5Ew-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbyJYrkvYGpKk/ZEaAN1S9axnvcbIW5KQ0vRmO5mff7hHNYRwOfyjV3TasuFuyhvrdIFQzto448wRYcAC0f6IW7PL6i/+dTxHIrRUnie56Tv7UXTfhkq6PYtbNBGR5yL0HDlN3Tj9Awqzo+sZjZGRxswWquqArAsPawM7cNIyJKwou+D3YmAhG00EEf7a2788mFCuGhUC0JoHtrkiOFa3zIKw2QgzXlTH7gbxPm+wayd8GRC2pFS2KgZfNVdbZQhU6qsLnucllFnVUcb3NZzfvJnfushbkkYdNBgg9XV0FsllLCdjtus2jlK81YdbCBDjbd5lvjt7OSxbjZp8QcYAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnyJfGA//OwEpfHeLio8RibL7MiCX+yG5T2utpneOsU=;
 b=DICQHpT7jnXR2fOHZiApwf3lb0V+N2C5TEfegZpQImR2elNxI45iGFCr3+5DcQ6WCX2dIDKS83NvYcOTaH1Svu3OLlM6oprN59z1lgZORYC31YwrzAyocS8kFdWf7Ck8Yid4rkQBUietHaOoFFIrnmXi4nupTar4HBO4opoQPvpPHJP3dv5/A64umzgdoNI55NbSXrBZ0wChtoa37bEslbCi/s4P8JMkz2vs4NPfkxrUafaSFui2hK3YT1oV7pSzr5BW7jd3E0osfrcZ0f8uOCCfX4eL5GDHb7mfcCTYcWPuK27hczO76/PNoS5KdT65sk32Qc/QFfBiMjToN1AV4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 12/17] AMD/IOMMU: return old PTE from
 {set,clear}_iommu_pte_present()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Message-ID: <91f353cd-09ae-247f-d14e-7796cfe8d3e9@suse.com>
Date: Tue, 24 Aug 2021 16:24:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0902CA0013.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::23) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58776727-fd6c-45de-708a-08d9670ad9a3
X-MS-TrafficTypeDiagnostic: AM0PR04MB5682:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5682FFB86330092B5F95B11BB3C59@AM0PR04MB5682.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fQhh78GSS5YrN+LNRQ9c4R2Vxe+1ZqyBIMG8zUktD1pqQW2/8ImHmtqCuCuQ9Zmp4SOGU2XbAPfDtsTt/0Ru4IcD69aVn7ryiZdLofmRoqtn+c0dV6zcyadOSqloimKuPQsNUaJb7SYrWJA0pLOUGERpBoZwMbypQWFDnr4hu+H39mhnZAw4JpOh2W4unsxPu3GUL6O5N1+cMGLZsOKERWszHzP3r44cynB1VUkpEqKBjPlh7ju3d8IUsz5kXwmntT2r/dXzgcm3PNFc2q43J8a+9k0wcIWREs6ibhWq6n0ck1sfTbNuNQpZbZ+5LcMvthdvWwH7GtZb1VqY53Oz20Ex+SvD/Comu/Gvr73HwLRd+AJ9slJH91O/9id6AkDVI7u/uBxDlh2XdB2rzzOOM7Up0yreKoMKa0E7/BWMeUPP9vxduqGHjezVRPN7Wxk3DFO4WbWwx3fPDFYYkeRBz9XmBYFAqQeDoYPlzhzzuyUM3zxpN3RenLfW3COH34pbABUn27HjJThQ7oNo4VmYRDrv1EwlD3i/qhN/Vt3dLRqlGXZfwnhclgmAQqj2Ix9BLet6Dkd2aj3m6IZ4ry7m29jQadgUNLiFOEuGHLlzvZEIj/l69VRqe3uLeUzN9HrNLtffJe8822vqhN+eMqS/Qj6GfO70evffOXCDAKhm0DW+Dx/gZDwl5ib/YdbuUtsI1vc0QE3HMhdo3AEMyh7TvGRTSdlyBxzmyvaEJR+B0Og=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(6916009)(86362001)(4326008)(8936002)(66556008)(31696002)(36756003)(186003)(316002)(54906003)(956004)(26005)(5660300002)(2906002)(66946007)(31686004)(508600001)(38100700002)(6486002)(83380400001)(2616005)(66476007)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZE9xLzE4YnFYVG9Cc3dGdUQyMzdtNDFwUk1WQTI5WUdMUXhGN3lBTGZDU1JC?=
 =?utf-8?B?TEQ4NDM0Z2lOaVBZK2ZJVGhOcVVqdU13WlZ6NXU3ckZTLzBEQW84cUV1YUVz?=
 =?utf-8?B?dFVTNk0rbERheFVrV1c0T1dBazkwUU9IUU1ZN2IyS09yeXZ4UENYZFNUQ25p?=
 =?utf-8?B?T3FKZERDUWE3WnNpZmxQWjI5SlhiUXVUdWhyMjRnQnhxbkw0K05DdXN2UzFL?=
 =?utf-8?B?b3FBa1RDYk5DblVLRCtTRzBJZlFsU3Qxc0lEWTBRVnd3TUVGVUp4aEI0ZXM1?=
 =?utf-8?B?ZmZGNkQraDd0dE1BSC83NU94elRxcGFHZHRXV09EeTJvZG9LVjJiMmd0V0pp?=
 =?utf-8?B?b3duczFpQ3g0VTFYVWJ5UW5UcVVIa0d2Q2UwaW5Ja2tkQmNVOWxIbzNYRnNv?=
 =?utf-8?B?MWVQU0M4THVZdjZUWmp2Qks3VVpieWRQWGdEbElWekJpdlNQL203MVprRkhh?=
 =?utf-8?B?TG5qQ3plVFFXdnJBSzBsY25EVDhCR2tIWjRzUGtmQnF3RFF5NXFLcUh1aEp5?=
 =?utf-8?B?aHp2MUZEQnNGU2NqcVErb25LSXFlQVREdHJIVm9DR24vMzdhV05ldllIYUFU?=
 =?utf-8?B?VlhUeENlVE42eEZYYTFHWmx5VS9iZzRZcHpHVU4xMjBRVTRnOGQ5Zjh4Yzdl?=
 =?utf-8?B?Z2dmbitJQXhrTEF3YkdqUENRVWtDdklkcXJFMy9Vd1gyRTBTRVZZSG1hNEhy?=
 =?utf-8?B?K2FyTGtLZjlvRzBoM1Z5ZDZ5WVRSazFiQ0ZYVkxTUktrQWpBQk1ZL1FrSUVI?=
 =?utf-8?B?UDhYb3ZWRll0d3U5VFMwUEV5TmhTMnVZbUFKOGJDUzY4ZkQ0eGcxbVZ4L0F4?=
 =?utf-8?B?VmxvYUpBR1lkUmVFcEZWbHRhVzFqNGlzNWNnM1NCZllVNGtYMUkwRitHcm5a?=
 =?utf-8?B?NG5HVDl2NUgzQXRCbXFDMXhhdlY2VnNoSWdBWm1qZSttVDgxYW1tc2N0UUx4?=
 =?utf-8?B?TjFTNHZDY3ZBWUsycGtNOWZqZzJwQ0VKcHd5akZzN2xCZlhzWnhJVXFNY1FQ?=
 =?utf-8?B?WWpmT2ZFMGVRN0lBM0lLbDVGWVNOR1d4ZzA5QjF4MzIvcUFlVFZSWkhpdVRZ?=
 =?utf-8?B?L292TEVPTG8wRGNPaC9TK1FxZjhpQmRHc3VORmp0T1l4azRFSjQvSGZTV1N4?=
 =?utf-8?B?cFNIb0RIa3liV3lkdnoyeHJxR1gzQmZlSTVKdXNoQXBXZm9zWkxtSHc2alFL?=
 =?utf-8?B?bzNHRGJTWHZVM0VPVDRVdnU4bG1lUU0zZ29Ealh3bUkwRGRoWldsc3JYY2JX?=
 =?utf-8?B?akJkb1p5cVRLVUFQTXE4SFREZEpIaUtTaDdIYy9QbTh6dmhLU01Ed1J2N3Ji?=
 =?utf-8?B?ZUw2ZHNNM2lPL0ZmbXBMSkxTUEtlODAzVmQyT28zUXlTMk40UGtjYXRmV3dj?=
 =?utf-8?B?eTRlejBaaWU2ZjRRQkFNdXo0L2VSZE1ZVDJhTWhOdisrTG9TVzR4RW1zUzhZ?=
 =?utf-8?B?Z2NOTFpRM1Q1MVJzOUUrZ1EyMmpubnk2NTJCajl5ZkZXUUN4UDAyMUlqUnd4?=
 =?utf-8?B?YjB6OThNM3NxVjhzZXQrNnVTWFpXODJGaFcwS2pJUCs0Uy82L3VMYlRBdzRw?=
 =?utf-8?B?K21NdzVlMTRCenk2YkZYSEdxYnNhUExsV29SdDFhUlBUWm9Ic0dqanMxbVll?=
 =?utf-8?B?MzhMZm9yZzVNcGhFMk5lSFl1RS9jVDc5a2o4NGZMTEZkOUxyN3lRZCswdFkr?=
 =?utf-8?B?ZWxFV3VCRmtMZWd4TkdyOWpSWU1TMFlRWDJEL25JQjR1UEhMMkxlaktNSS9o?=
 =?utf-8?Q?NOlKvbgRJKUxmC8KQlxisQhrdGHvmfqwA0q/XJQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58776727-fd6c-45de-708a-08d9670ad9a3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 14:24:14.9266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GlkpX7/ZxdDoQZzY/sGPw0kCkxXIZk7CgOG75ekfpM2/rDTYNs7IXJgDOML7lJtfsPcHls7304W1Jeq49BPecw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5682

In order to free intermediate page tables when replacing smaller
mappings by a single larger one callers will need to know the full PTE.
Flush indicators can be derived from this in the callers (and outside
the locked regions). First split set_iommu_pte_present() from
set_iommu_ptes_present(): Only the former needs to return the old PTE,
while the latter (like also set_iommu_pde_present()) doesn't even need
to return flush indicators. Then change return types/values and callers
accordingly.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -31,30 +31,28 @@ static unsigned int pfn_to_pde_idx(unsig
     return idx;
 }
 
-static unsigned int clear_iommu_pte_present(unsigned long l1_mfn,
-                                            unsigned long dfn)
+static union amd_iommu_pte clear_iommu_pte_present(unsigned long l1_mfn,
+                                                   unsigned long dfn)
 {
-    union amd_iommu_pte *table, *pte;
-    unsigned int flush_flags;
+    union amd_iommu_pte *table, *pte, old;
 
     table = map_domain_page(_mfn(l1_mfn));
     pte = &table[pfn_to_pde_idx(dfn, 1)];
+    old = *pte;
 
-    flush_flags = pte->pr ? IOMMU_FLUSHF_modified : 0;
     write_atomic(&pte->raw, 0);
 
     unmap_domain_page(table);
 
-    return flush_flags;
+    return old;
 }
 
-static unsigned int set_iommu_pde_present(union amd_iommu_pte *pte,
-                                          unsigned long next_mfn,
-                                          unsigned int next_level, bool iw,
-                                          bool ir)
+static void set_iommu_pde_present(union amd_iommu_pte *pte,
+                                  unsigned long next_mfn,
+                                  unsigned int next_level,
+                                  bool iw, bool ir)
 {
-    union amd_iommu_pte new = {}, old;
-    unsigned int flush_flags = IOMMU_FLUSHF_added;
+    union amd_iommu_pte new = {};
 
     /*
      * FC bit should be enabled in PTE, this helps to solve potential
@@ -68,28 +66,42 @@ static unsigned int set_iommu_pde_presen
     new.next_level = next_level;
     new.pr = true;
 
-    old.raw = read_atomic(&pte->raw);
-    old.ign0 = 0;
-    old.ign1 = 0;
-    old.ign2 = 0;
+    write_atomic(&pte->raw, new.raw);
+}
 
-    if ( old.pr && old.raw != new.raw )
-        flush_flags |= IOMMU_FLUSHF_modified;
+static union amd_iommu_pte set_iommu_pte_present(unsigned long pt_mfn,
+                                                 unsigned long dfn,
+                                                 unsigned long next_mfn,
+                                                 unsigned int level,
+                                                 bool iw, bool ir)
+{
+    union amd_iommu_pte *table, *pde, old;
 
-    write_atomic(&pte->raw, new.raw);
+    table = map_domain_page(_mfn(pt_mfn));
+    pde = &table[pfn_to_pde_idx(dfn, level)];
+
+    old = *pde;
+    if ( !old.pr || old.next_level ||
+         old.mfn != next_mfn ||
+         old.iw != iw || old.ir != ir )
+        set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
+    else
+        old.pr = false; /* signal "no change" to the caller */
 
-    return flush_flags;
+    unmap_domain_page(table);
+
+    return old;
 }
 
-static unsigned int set_iommu_ptes_present(unsigned long pt_mfn,
-                                           unsigned long dfn,
-                                           unsigned long next_mfn,
-                                           unsigned int nr_ptes,
-                                           unsigned int pde_level,
-                                           bool iw, bool ir)
+static void set_iommu_ptes_present(unsigned long pt_mfn,
+                                   unsigned long dfn,
+                                   unsigned long next_mfn,
+                                   unsigned int nr_ptes,
+                                   unsigned int pde_level,
+                                   bool iw, bool ir)
 {
     union amd_iommu_pte *table, *pde;
-    unsigned int page_sz, flush_flags = 0;
+    unsigned int page_sz;
 
     table = map_domain_page(_mfn(pt_mfn));
     pde = &table[pfn_to_pde_idx(dfn, pde_level)];
@@ -98,20 +110,18 @@ static unsigned int set_iommu_ptes_prese
     if ( (void *)(pde + nr_ptes) > (void *)table + PAGE_SIZE )
     {
         ASSERT_UNREACHABLE();
-        return 0;
+        return;
     }
 
     while ( nr_ptes-- )
     {
-        flush_flags |= set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
+        set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
 
         ++pde;
         next_mfn += page_sz;
     }
 
     unmap_domain_page(table);
-
-    return flush_flags;
 }
 
 void amd_iommu_set_root_page_table(struct amd_iommu_dte *dte,
@@ -284,6 +294,7 @@ int amd_iommu_map_page(struct domain *d,
     struct domain_iommu *hd = dom_iommu(d);
     int rc;
     unsigned long pt_mfn = 0;
+    union amd_iommu_pte old;
 
     spin_lock(&hd->arch.mapping_lock);
 
@@ -320,12 +331,16 @@ int amd_iommu_map_page(struct domain *d,
     }
 
     /* Install 4k mapping */
-    *flush_flags |= set_iommu_ptes_present(pt_mfn, dfn_x(dfn), mfn_x(mfn),
-                                           1, 1, (flags & IOMMUF_writable),
-                                           (flags & IOMMUF_readable));
+    old = set_iommu_pte_present(pt_mfn, dfn_x(dfn), mfn_x(mfn), 1,
+                                (flags & IOMMUF_writable),
+                                (flags & IOMMUF_readable));
 
     spin_unlock(&hd->arch.mapping_lock);
 
+    *flush_flags |= IOMMU_FLUSHF_added;
+    if ( old.pr )
+        *flush_flags |= IOMMU_FLUSHF_modified;
+
     return 0;
 }
 
@@ -334,6 +349,7 @@ int amd_iommu_unmap_page(struct domain *
 {
     unsigned long pt_mfn = 0;
     struct domain_iommu *hd = dom_iommu(d);
+    union amd_iommu_pte old = {};
 
     spin_lock(&hd->arch.mapping_lock);
 
@@ -355,11 +371,14 @@ int amd_iommu_unmap_page(struct domain *
     if ( pt_mfn )
     {
         /* Mark PTE as 'page not present'. */
-        *flush_flags |= clear_iommu_pte_present(pt_mfn, dfn_x(dfn));
+        old = clear_iommu_pte_present(pt_mfn, dfn_x(dfn));
     }
 
     spin_unlock(&hd->arch.mapping_lock);
 
+    if ( old.pr )
+        *flush_flags |= IOMMU_FLUSHF_modified;
+
     return 0;
 }
 


