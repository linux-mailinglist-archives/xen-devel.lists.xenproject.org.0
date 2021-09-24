Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D60C1416FA9
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 11:55:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195168.347744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThv8-0006ob-Sh; Fri, 24 Sep 2021 09:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195168.347744; Fri, 24 Sep 2021 09:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThv8-0006lc-O5; Fri, 24 Sep 2021 09:55:06 +0000
Received: by outflank-mailman (input) for mailman id 195168;
 Fri, 24 Sep 2021 09:55:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mThv7-0006lS-HA
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 09:55:05 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d369976-1d1d-11ec-bab9-12813bfff9fa;
 Fri, 24 Sep 2021 09:55:04 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-9FElwOWLNf6AuWWuEBVJcw-1; Fri, 24 Sep 2021 11:55:02 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 09:54:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 09:54:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0064.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.7 via Frontend Transport; Fri, 24 Sep 2021 09:54:58 +0000
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
X-Inumbo-ID: 7d369976-1d1d-11ec-bab9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632477303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Xjl2PorN1TigRAzYAHXhOxQtJC1FCMn+69GJeBFkFk=;
	b=gvmMyyq95yPoaWyYTsQy88rYU9RIbbU4ghEzdgZoTbPmxeK7SFiiDKSzoJWXlr520Ba7eJ
	V1d/I2fIW3pogPWuRBc8zddXmain4lNn0UZbv5ATVlaI9XjifRh6410MjpyjZTRd5BuXrn
	kMNPADMVpwQbjcpAoc4E9KCAE69u2ls=
X-MC-Unique: 9FElwOWLNf6AuWWuEBVJcw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ioK3fdrWVXG1xc4MwrXPL/jnz5GUkgYaB/0K6oeJuuak+76NQpjd+pWKcgrMdcBQV/qq4wJiWtYaXLy9or2tZKVSboaXBGFjVAXLEASPYnbkroq77Gy6VHVslwblZOxW0aHldlymuV20aBtzMb1N29EhRnih/c/Tt6Yei+qqLucJo017q8oSUGEU0f+bAJUYSjP4IZETHh2miyNduC4yM6Mptf5+71TZ/NSelD4lAJnjEMaQm9FVdc/4XwuhQkugOwJ49qofNMICXAABqQj9S+OS+WJ6Eex5xZ5F8D1Vr6eYZLbUEiXcYwCYnMuxshyAVQ1hPQmvsrF+5Kpvey1C/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=2Xjl2PorN1TigRAzYAHXhOxQtJC1FCMn+69GJeBFkFk=;
 b=B+HkSGiowL/ncV++IFp0XHTZq0v3DPKawl3OD9TJGuddA0sZXRlTPo3frS2Ivvvgw9rgxXdxIU2QbvauZNd8v2Sot9VPUD6sajcdeJtyUI+79+zrqAA6dUhLfmSSzDMjneZDRcJZo2aayhUQMP42fA2xZPdLG9HC+ywSBFH9YWOzpyoq5547S/QT1OsDJ2n5LsOQjptqB6VHb2BoMs0R9p3xu6Txb3PqFsxqfr6xurBr3bBs/H85tXPxKzwGDYzb/9zmllkZOafi6PU9BivsD2Aau1kjvpAgNvxbQzBGs4UbFYM/ut4k4HRbwGySXiwhXrJG/hz0PYJuiN5UaZtlyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 15/18] IOMMU/x86: prefill newly allocate page tables
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Message-ID: <2656844d-47cc-70c3-d7ce-7d83967d576e@suse.com>
Date: Fri, 24 Sep 2021 11:54:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd918ac0-7c5c-46a5-2530-08d97f415f0c
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71507FB3DDBAAF8B8FD05E82B3A49@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1+UFfH+THGlmBkk6yAKeH267tMxKAzscCarzLzcpubUqEX/758DicTtpHV0pqT0jwBdQ2FaxOJsqu9hMKVgJJe+X7+nJr7qNE5O4Gc/SR0K8cvKA1AauObl4at9eFVbcdbRh7Iw5FNOpx3+VAOulTJBhRi3c2UNENNZ8Cx0zSPTZjlCDScR0rc0b+nc4qQRAI/f5iKigkvQAnft6XN1/CGZxVhRpsRZN4HYkpV4LTxVyKWrc0NCw3IiW8h6rXL2utjcAKgqAGkxb0ngHxEJzOEgk5AtrpypZwOfwaSeUBpO4aRJp/hLUW9vZkmKsyOHEdKDCbpXb2gdOzuvrUGvOJhvUpxLfiQqx431tt/TVuP5JVQ97PHp4B2rSvzqXcmITQwydnt5hVXIIszu8QUSXnakRnYFBQg9sJiZkeHkBGdZSM3FMF33U+GTAdAe2TwrjPCvXhQL0OZu0VxkAWJjMgTgvxYRGm3GbBSHALlhjWlaIb1BDS4dyoBXcGDdyX9UYijuF7eTJ+cGuMQ6YNzRZwxW3f5/dfm59sX2Iir7Kq7mZUe5C0oBwTnsozSsni5MxDj+z+/mwxMElMCVUOBFsjYZwA7lautA3VVbWIiWReFeX0GMj/6f1jP2BNhZJi+58iZFuZHEtuV6LW9rJd03fVI8oIA+bCLqk0lEEM95VuSMFhWXgOef6ciENQojPwbkuMnN7BVXoUF7UWNkavm7qyL5a6agj5n92tGGI0Ob+1k4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(8936002)(5660300002)(2616005)(508600001)(31686004)(956004)(38100700002)(66476007)(66946007)(26005)(8676002)(66556008)(6916009)(2906002)(36756003)(86362001)(6486002)(16576012)(31696002)(83380400001)(4326008)(316002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUpuaDNtLyt3dkkwN2w1bElkeitiUmhtMHJEVkRucFB4SVdGbWdMRkVHNS9J?=
 =?utf-8?B?SnFzWmQrTWFqMnk2M1l4US9pTGczUnl5RlhKUVlRT0FLOE44QVltMjA0NFFQ?=
 =?utf-8?B?MjVEOCtJS3VSdXBIOVBCSjlPU1pwVUZ4dVZjSm9Wa2k5amxtT3lpcCtGV0Rm?=
 =?utf-8?B?Tk9PbjZsZ1RWVnhUOWJOLzY5R09NVkV2Wk95emhzakVhTGFpQWhFK1QxaWZi?=
 =?utf-8?B?OVpwbkJ1Wmh1eU0wa3VQLzl3UWkySlRxZXpTdGlkVU1GK2NQdEZoczQzMi9z?=
 =?utf-8?B?RUEzblcvRDc0YTJGL0ZXOGZ0ZGFDU2NLZDgwdXByelRrcEVBT1pvTVJDR0tC?=
 =?utf-8?B?QllDOHptcXdPOWJ2aDl5ZmpDaUtydEdCY0dQeUpOV0pzR3R1aUNBbVJwQitj?=
 =?utf-8?B?ZXdYTGhXY2w4UGNMVFBJZldPTWN3WjRCUTZRd2orTDMzdHBpa2h5WjFuREo1?=
 =?utf-8?B?eStpazlBYUNpWFZEcnVhZ3duRWVLQ1JYUUQ4TjZVYzBYRStBSEVSeDNWUk9k?=
 =?utf-8?B?Vi9DZ1ZMVXpnakdRaDdCK3YzN2pVR0xJN1Fkb1ZvbEIrOTRWckE3Q25EbU9o?=
 =?utf-8?B?MWtnMjA2SElBRUdQNVhzZSt3NlVxUWlwVmh2VUVVUmNnS1RlQWN2bGJxdStH?=
 =?utf-8?B?VkxRVmo4Z1FKMkNzb3FDeURueGRnVGpBeGRtU25oTEZvSFUxWTNnMkNFSzdG?=
 =?utf-8?B?OFEvS2RzMStCVDlUR1hZNjZpUnRwa1N2TVYyVlpJQ1pGSEVkSFcrSXJZY1F1?=
 =?utf-8?B?NGl1MGdpVFVnUlRHbzZnUXB3SmRVRlJOcHVDMldhUUVZMUhPakZLUFlnU01h?=
 =?utf-8?B?ZTFYenpzcCtUZHptR2UvVm5WbWtwUkhyZHhoZnJyQkplWjN3MTBuWmtTYVpL?=
 =?utf-8?B?SFBUOTZGSE9vcjFQbmJ2LytyOUc4bFd0a3diNHMwZHZ0TlhNZUhFMmRDeGdo?=
 =?utf-8?B?c2FUaE4yR3phSGs2cHA3YXl1MDAzYnhFcXVRSm1TNXRGa05DNlhDVzlUNVZJ?=
 =?utf-8?B?MjhITStTN2J4aXhObEpaMm05R0FvS3lPb0hyT0p5WGhvbkxkdytXaU9TWSto?=
 =?utf-8?B?REhQbTZTQUxhNTY2WkVURXlHS1UyNEdEMllKUmwxbTNPbzZpaVVzOWU3Slpt?=
 =?utf-8?B?TWZoSFpvTnh4elNPQkN1QSs1UWltb0ozRFp4VVc0WUhmQ3dqODNOcGpnKzE2?=
 =?utf-8?B?ZFRqVWRKT2FkUzhWbWt2VUZGMTJwOGZEMGc4bXkvajZXTVBOOURLYVgwME5L?=
 =?utf-8?B?c3pITi9ZUUJFZUlaLytLN1RpU1RPRWhqTEF0UTlzUS9Xc25zQklUMzJ3L096?=
 =?utf-8?B?UWp3SDNwUU4vR3I5YUNYTnd6M1JIZ3g2eFFLUG5QVCtVaUQxK3o4SzdKZG1z?=
 =?utf-8?B?V1VNZ2ZWampVZ2pVUWhtRFMxVG5IU0xsUWhDdWU5VnlDN2tUZWEyZnNZQUZY?=
 =?utf-8?B?Z2dQUDQ5MFBxM0Zsb21LUXB2ZHRDQ21XQTFrbmdnbGF2UkN2dUpiWngvTkQ5?=
 =?utf-8?B?R3VYeEdqclRqdkUxSjhvUzRCMG9JS0N2RklpNVUzVnNsTCtDZDRNTHduaDIx?=
 =?utf-8?B?bTJiU0ZSQUdOMG5ncElpM29WbFJoQ052cDBDdUQ2bXBsa3k0QjFKWk5zUWtJ?=
 =?utf-8?B?aU05aVlER3IvZ00rRGdYajlnOHVNcEl5T0xIM2JWelVZQnhSL1dGQTlxektD?=
 =?utf-8?B?THFhUXZCVHA3UXl3VUQrb1ZNL2lWL0hpVWNxT25XUU8wT29EaDNzUTFHZDhW?=
 =?utf-8?Q?i4jmI1wCOdv5toMJGTvD2ouV9oLUYCml68UqQ0u?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd918ac0-7c5c-46a5-2530-08d97f415f0c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:54:59.6557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z4DSXSFrGMxQ/1fhA/3UdQZmSII+bRvG+AyZ4ZH2oNswy+xyDAJb5KV3vYWTaP65P8VtLRknhFlNuOsQwuRvcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

Page table are used for two purposes after allocation: They either start
out all empty, or they get filled to replace a superpage. Subsequently,
to replace all empty or fully contiguous page tables, contiguous sub-
regions will be recorded within individual page tables. Install the
initial set of markers immediately after allocation. Make sure to retain
these markers when further populating a page table in preparation for it
to replace a superpage.

The markers are simply 4-bit fields holding the order value of
contiguous entries. To demonstrate this, if a page table had just 16
entries, this would be the initial (fully contiguous) set of markers:

index  0 1 2 3 4 5 6 7 8 9 A B C D E F
marker 4 0 1 0 2 0 1 0 3 0 1 0 2 0 1 0

"Contiguous" here means not only present entries with successively
increasing MFNs, each one suitably aligned for its slot, but also a
respective number of all non-present entries.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
An alternative to the ASSERT()s added to set_iommu_ptes_present() would
be to make the function less general-purpose; it's used in a single
place only after all (i.e. it might as well be folded into its only
caller).
---
v2: New.

--- a/xen/drivers/passthrough/amd/iommu-defs.h
+++ b/xen/drivers/passthrough/amd/iommu-defs.h
@@ -445,6 +445,8 @@ union amd_iommu_x2apic_control {
 #define IOMMU_PAGE_TABLE_U32_PER_ENTRY	(IOMMU_PAGE_TABLE_ENTRY_SIZE / 4)
 #define IOMMU_PAGE_TABLE_ALIGNMENT	4096
 
+#define IOMMU_PTE_CONTIG_MASK           0x1e /* The ign0 field below. */
+
 union amd_iommu_pte {
     uint64_t raw;
     struct {
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -116,7 +116,19 @@ static void set_iommu_ptes_present(unsig
 
     while ( nr_ptes-- )
     {
-        set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
+        ASSERT(!pde->next_level);
+        ASSERT(!pde->u);
+
+        if ( pde > table )
+            ASSERT(pde->ign0 == find_first_set_bit(pde - table));
+        else
+            ASSERT(pde->ign0 == PAGE_SHIFT - 3);
+
+        pde->iw = iw;
+        pde->ir = ir;
+        pde->fc = true; /* See set_iommu_pde_present(). */
+        pde->mfn = next_mfn;
+        pde->pr = true;
 
         ++pde;
         next_mfn += page_sz;
@@ -232,7 +244,7 @@ static int iommu_pde_from_dfn(struct dom
             mfn = next_table_mfn;
 
             /* allocate lower level page table */
-            table = iommu_alloc_pgtable(d);
+            table = iommu_alloc_pgtable(d, IOMMU_PTE_CONTIG_MASK);
             if ( table == NULL )
             {
                 AMD_IOMMU_DEBUG("Cannot allocate I/O page table\n");
@@ -262,7 +274,7 @@ static int iommu_pde_from_dfn(struct dom
 
             if ( next_table_mfn == 0 )
             {
-                table = iommu_alloc_pgtable(d);
+                table = iommu_alloc_pgtable(d, IOMMU_PTE_CONTIG_MASK);
                 if ( table == NULL )
                 {
                     AMD_IOMMU_DEBUG("Cannot allocate I/O page table\n");
@@ -648,7 +660,7 @@ int __init amd_iommu_quarantine_init(str
 
     spin_lock(&hd->arch.mapping_lock);
 
-    hd->arch.amd.root_table = iommu_alloc_pgtable(d);
+    hd->arch.amd.root_table = iommu_alloc_pgtable(d, 0);
     if ( !hd->arch.amd.root_table )
         goto out;
 
@@ -663,7 +675,7 @@ int __init amd_iommu_quarantine_init(str
          * page table pages, and the resulting allocations are always
          * zeroed.
          */
-        pg = iommu_alloc_pgtable(d);
+        pg = iommu_alloc_pgtable(d, 0);
         if ( !pg )
             break;
 
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -238,7 +238,7 @@ int amd_iommu_alloc_root(struct domain *
 
     if ( unlikely(!hd->arch.amd.root_table) )
     {
-        hd->arch.amd.root_table = iommu_alloc_pgtable(d);
+        hd->arch.amd.root_table = iommu_alloc_pgtable(d, 0);
         if ( !hd->arch.amd.root_table )
             return -ENOMEM;
     }
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -297,7 +297,7 @@ static uint64_t addr_to_dma_page_maddr(s
             goto out;
 
         pte_maddr = level;
-        if ( !(pg = iommu_alloc_pgtable(domain)) )
+        if ( !(pg = iommu_alloc_pgtable(domain, 0)) )
             goto out;
 
         hd->arch.vtd.pgd_maddr = page_to_maddr(pg);
@@ -339,7 +339,7 @@ static uint64_t addr_to_dma_page_maddr(s
             }
 
             pte_maddr = level - 1;
-            pg = iommu_alloc_pgtable(domain);
+            pg = iommu_alloc_pgtable(domain, DMA_PTE_CONTIG_MASK);
             if ( !pg )
                 break;
 
@@ -351,12 +351,13 @@ static uint64_t addr_to_dma_page_maddr(s
                 struct dma_pte *split = map_vtd_domain_page(pte_maddr);
                 unsigned long inc = 1UL << level_to_offset_bits(level - 1);
 
-                split[0].val = pte->val;
+                split[0].val |= pte->val & ~DMA_PTE_CONTIG_MASK;
                 if ( inc == PAGE_SIZE )
                     split[0].val &= ~DMA_PTE_SP;
 
                 for ( offset = 1; offset < PTE_NUM; ++offset )
-                    split[offset].val = split[offset - 1].val + inc;
+                    split[offset].val |=
+                        (split[offset - 1].val & ~DMA_PTE_CONTIG_MASK) + inc;
 
                 iommu_sync_cache(split, PAGE_SIZE);
                 unmap_vtd_domain_page(split);
@@ -1943,7 +1944,7 @@ static int __must_check intel_iommu_map_
     if ( iommu_snoop )
         dma_set_pte_snp(new);
 
-    if ( old.val == new.val )
+    if ( !((old.val ^ new.val) & ~DMA_PTE_CONTIG_MASK) )
     {
         spin_unlock(&hd->arch.mapping_lock);
         unmap_vtd_domain_page(page);
@@ -2798,7 +2799,7 @@ static int __init intel_iommu_quarantine
         goto out;
     }
 
-    pg = iommu_alloc_pgtable(d);
+    pg = iommu_alloc_pgtable(d, 0);
 
     rc = -ENOMEM;
     if ( !pg )
@@ -2817,7 +2818,7 @@ static int __init intel_iommu_quarantine
          * page table pages, and the resulting allocations are always
          * zeroed.
          */
-        pg = iommu_alloc_pgtable(d);
+        pg = iommu_alloc_pgtable(d, 0);
 
         if ( !pg )
             goto out;
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -265,6 +265,7 @@ struct dma_pte {
 #define DMA_PTE_PROT (DMA_PTE_READ | DMA_PTE_WRITE)
 #define DMA_PTE_SP   (1 << 7)
 #define DMA_PTE_SNP  (1 << 11)
+#define DMA_PTE_CONTIG_MASK  (0xfull << PADDR_BITS)
 #define dma_clear_pte(p)    do {(p).val = 0;} while(0)
 #define dma_set_pte_readable(p) do {(p).val |= DMA_PTE_READ;} while(0)
 #define dma_set_pte_writable(p) do {(p).val |= DMA_PTE_WRITE;} while(0)
@@ -278,7 +279,7 @@ struct dma_pte {
 #define dma_pte_write(p) (dma_pte_prot(p) & DMA_PTE_WRITE)
 #define dma_pte_addr(p) ((p).val & PADDR_MASK & PAGE_MASK_4K)
 #define dma_set_pte_addr(p, addr) do {\
-            (p).val |= ((addr) & PAGE_MASK_4K); } while (0)
+            (p).val |= ((addr) & PADDR_MASK & PAGE_MASK_4K); } while (0)
 #define dma_pte_present(p) (((p).val & DMA_PTE_PROT) != 0)
 #define dma_pte_superpage(p) (((p).val & DMA_PTE_SP) != 0)
 
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -433,12 +433,12 @@ int iommu_free_pgtables(struct domain *d
     return 0;
 }
 
-struct page_info *iommu_alloc_pgtable(struct domain *d)
+struct page_info *iommu_alloc_pgtable(struct domain *d, uint64_t contig_mask)
 {
     struct domain_iommu *hd = dom_iommu(d);
     unsigned int memflags = 0;
     struct page_info *pg;
-    void *p;
+    uint64_t *p;
 
 #ifdef CONFIG_NUMA
     if ( hd->node != NUMA_NO_NODE )
@@ -450,7 +450,28 @@ struct page_info *iommu_alloc_pgtable(st
         return NULL;
 
     p = __map_domain_page(pg);
-    clear_page(p);
+
+    if ( contig_mask )
+    {
+        unsigned int i, shift = find_first_set_bit(contig_mask);
+
+        ASSERT(((PAGE_SHIFT - 3) & (contig_mask >> shift)) == PAGE_SHIFT - 3);
+
+        p[0] = (PAGE_SHIFT - 3ull) << shift;
+        p[1] = 0;
+        p[2] = 1ull << shift;
+        p[3] = 0;
+
+        for ( i = 4; i < PAGE_SIZE / 8; i += 4 )
+        {
+            p[i + 0] = (find_first_set_bit(i) + 0ull) << shift;
+            p[i + 1] = 0;
+            p[i + 2] = 1ull << shift;
+            p[i + 3] = 0;
+        }
+    }
+    else
+        clear_page(p);
 
     if ( hd->platform_ops->sync_cache )
         iommu_vcall(hd->platform_ops, sync_cache, p, PAGE_SIZE);
--- a/xen/include/asm-x86/iommu.h
+++ b/xen/include/asm-x86/iommu.h
@@ -142,7 +142,8 @@ int pi_update_irte(const struct pi_desc
 })
 
 int __must_check iommu_free_pgtables(struct domain *d);
-struct page_info *__must_check iommu_alloc_pgtable(struct domain *d);
+struct page_info *__must_check iommu_alloc_pgtable(struct domain *d,
+                                                   uint64_t contig_mask);
 void iommu_queue_free_pgtable(struct domain *d, struct page_info *pg);
 
 #endif /* !__ARCH_X86_IOMMU_H__ */


