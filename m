Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 858BF416FA2
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 11:54:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195163.347732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThuA-0006CB-GK; Fri, 24 Sep 2021 09:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195163.347732; Fri, 24 Sep 2021 09:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThuA-0006AI-D0; Fri, 24 Sep 2021 09:54:06 +0000
Received: by outflank-mailman (input) for mailman id 195163;
 Fri, 24 Sep 2021 09:54:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mThu9-0006A4-Gt
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 09:54:05 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5960d94e-1d1d-11ec-bab9-12813bfff9fa;
 Fri, 24 Sep 2021 09:54:04 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-HQz8LnudOXeUL3TlzMVZVQ-1; Fri, 24 Sep 2021 11:54:01 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 09:54:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 09:54:00 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0060.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.6 via Frontend Transport; Fri, 24 Sep 2021 09:53:59 +0000
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
X-Inumbo-ID: 5960d94e-1d1d-11ec-bab9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632477243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XkEZg476K/l+ml14jRUFl4XZ13rCjdSGL7S/KURFmd8=;
	b=nY9BVqRH/JTXQ+m+PQKaQvTYRDJUMg7in0c10AXtcpdn2qml9l6IGT4nYJixmGcoqQZAzp
	IwinRZWEzvtpnf/yRv/ILZW71BvRl1P1pTC3frz9AbqO/VSPlMiF8X6nSYWGEHDjH8wf6Q
	ZKJaN672W0z3Fu7IohdacAEpsU+B4AU=
X-MC-Unique: HQz8LnudOXeUL3TlzMVZVQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3Szt+/nQYzoi/BIjPZ3nCcFbN+hcj55Dw806BEJ2tVe1kQmHB5Z7A/+9F7RAqS7LQQ8IFWffAeEv9wVAl7zSJ1DuqTNoYJd3unt55ayciIsVpyAazSq1siaR4ilosC9Tm8AcenCgk5RqoEWtJqxDu0WQsQnto8R+z4bNHtMjqyIKZedtMcQZKvEDAWWm20OzQrOCcPXCRH4mqqpH5L6ur2vYBiGBI5uvzhxELpRor2i/J+Fe3L+xzP5pdD/O2VWeAkYVU2oByBNv7s4UUB041ktcNwN2A/xSjKlM8RJgzChLVBC1efrRmy5x9q0KxVDq8n6m+oJaX84s6RyCOCjmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=XkEZg476K/l+ml14jRUFl4XZ13rCjdSGL7S/KURFmd8=;
 b=H8mB2x4XbKOFoA3HnecGkcELRNNN4x6LVA3OGieucG+Ub25Cb7RvuOcJcJti4ZkzndeKPbqYo5VbMHbSpx7mDzatSfMP/5A7PlKyJgG5O7FnUhVM4CU012a3nSUUView+F5U2Lcb0lg2CxuJEstp5fhnmzuWP8oVLcSMXFhxg6u493ineACvaH75IA2W3HKRp1D6fHE7eRJSVWOOHuk1veibWEGoBw9C3XzaIPfvWqHK7qRW/pOiiqEgtlmxqDsjjvJGHGsu5sEixEuJG5wE1xfxpqjfJSDRL9FUHI5TBPEVrYjQdwbXltPowzO44/0iS8jpje7zPvFtCSklohcOmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 14/18] IOMMU: fold flush-all hook into "flush one"
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <Rahul.Singh@arm.com>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Message-ID: <e40ee980-9151-101a-1484-b1710aaeafb0@suse.com>
Date: Fri, 24 Sep 2021 11:53:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6380498-4a4e-4697-3c47-08d97f413bb2
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71506C14C1ABB14A8BB17453B3A49@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	63TupDoMFKOxoa99SbE+BbE3cjZdgrbtHknmoeQkBztCaGZxipsoF002sCuLr6isl1fQD94blRpLrRpktPN3F0cv9UeVEbw3zmzFofs+QbrHdu4vETyjNtD2gX2jVIVFoj1iU7ZVB0bq7VMkzd3RMQe4LgSjHt/kSso+e7LjMYINhAzlrTc2SbtP0FSS4UCPtSdq/WTofhGjVIHy2RepuG2cJwBkvK0o1WMHkssP2iPwLJnQZa2+qlVjVrwYpnY70OKvycebvR5KDsJxSb6DtmlbOKduYcPPxCnty9TKfR1mkPBmd1WIX3stHKJMRN1UzlkHM4BcLdWLTFNFaXKAtccxClO9DSfc1xueQaAFxZQVBuRp12/T7FcwpgQ5j86W8FTUATRVSwROIR54K4w0NBIfY4rv2jhBP9k2wESjUGFhlHvQSPnbXBc30LeFcDeBzbCDsKtQ0D3/kuyJXrPYHFLtVR8hOXGADVwdTzkNU7nynebqZSlnphYSgeIe2GPX5kTw4aWE1NZKTyYey67tKhtR+hQ+VwJT58uT/0rS/NWKjFLSiUOWXUyifxLeoUJr7Xoaxe7i6c0hh11qeSn8gcl7Uyiq3iqxLmFsWR7+ZWF6GLTPelEEQPSfD9y3SfW06Vzb8hYLM3eIOD/s/90GAw34lszTk5l0hz8b7nCUpFaszmIjjQvF60YJBX+ycI33wnZDk5mntSfvi2YL+9emluYhBC83eRHYL8oyDFwPhVY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(8936002)(5660300002)(2616005)(508600001)(31686004)(956004)(38100700002)(66476007)(66946007)(26005)(8676002)(66556008)(6916009)(2906002)(36756003)(86362001)(6486002)(16576012)(31696002)(83380400001)(4326008)(316002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUttSFF1RW11NnA0M0dockJxVUkwMy9yYUk3YXg5dytqeGtGZnF1bG1nd1Nk?=
 =?utf-8?B?SmVwRW9lR0ZCV3hjOExCeWVLbFZnVkhRSytTV21UUlZtSGp1akhHRUh4MHpZ?=
 =?utf-8?B?OGZQTlVBSFZra3VpSFdlcERxUHIxNlV1SG45WWErU09FanhFeWwva3ExSURP?=
 =?utf-8?B?eE14aVZtZDlGekNTbklkdWIxMEZHSC8rNEpFelM2cUt2V1owcG9VU2FwQUtK?=
 =?utf-8?B?WjlBWHo5Y2hrYkd5azRaaVU4bnFWT0lSczNteWRRUXRkRE50THZ0eUx2M3ZQ?=
 =?utf-8?B?ZC9rLzdCWGVWQXIyTm5YTy9nVW91MU9QYWo3MzRzRmNIbHZiOE1LRGFvckJK?=
 =?utf-8?B?dVBOc25mQUVHb2pZTHlESzAxc0tsZC9FTG1FTWFHMmE1VURuUlRkTGU0aGF4?=
 =?utf-8?B?M3hJcDNpTlM0SWtLVmM1aXdoTlNpVUtCcSswQmswd1M2dGFRVkV4cktjOWFh?=
 =?utf-8?B?S1JYalVja1M1REZMZW1vUGZmL3BHOUszaUlhczRiSVBGdUxGL2s0UHlkYlhm?=
 =?utf-8?B?eCtrTEdFeU4yWWJuSFN4b1VOVlhGeUY5c0ZGVUwxWjhuRFlicjBtYmh1VUFu?=
 =?utf-8?B?K2hpckdob2dCRi9jWklCa0pXUVJtbFIxYlM1cFBLcVRQYnRVN2VmYTgzL3dr?=
 =?utf-8?B?QzZVN2dsMU5UU3ByZ3owV2FQaUpqQmJUc0NNTElLbERMRUlsRFBKekdCVXN6?=
 =?utf-8?B?RmZoMWJWM1o3UGZyaUcxYmtCSURXVXBjclh5cGl0VjV5NXdHb0JCSS9YZjk2?=
 =?utf-8?B?V3oyVzVhd29YcjBOUXRXdUMrVk92VE1zTHh2WjR5SkROU1RxK2V2YTNCMWp2?=
 =?utf-8?B?cTBpVDIrbmFzeFQ3RXA2M2Zxa2FsNHl6clJuUmt2V2U3bEFJQnNoN0JFanhz?=
 =?utf-8?B?RXBrNlR3ejlhaFFaMVhmTS9TeHdMbUowdjYwd1NVQUpMMDM0WlJmRTVWZDgr?=
 =?utf-8?B?N3pJV3pkZDkza1dSdmdNbUFZNWNpYlRxZ29OejM4TTF4dXp2N1BNU3R3WE5i?=
 =?utf-8?B?VDhOY25LcXh5aFArTE9ocnZ5cHRBblhWaVlKWkpvUmZJRjRTSk1TeFY4bERL?=
 =?utf-8?B?S3NzT0laYjBud2t1a0NvNFI0b2hjaGVGUjJyUm0zdXVMcGV4dTkrNE10Uysx?=
 =?utf-8?B?ZGtlUVdlOTdqVmtwTXhQQmpJdFpIS2cxS2doVHJpVHBYNXNoOTA2dG5ocDQy?=
 =?utf-8?B?ZjZJWHN5c0YwUU5VS0FsQnRFOW9NZFNzZzAvTEtxK1grRFZTMkJ4UG9QM29z?=
 =?utf-8?B?ajMvVmpLQjl3WWNvczUydkEwVGRRcGRCSUx4Y0ZsZDcydkFMSXA5ZEIxcWhw?=
 =?utf-8?B?T2FOYkY1SytPL0ZldkZNK01pQ0lxc0dod3hmYkZQWXJUMkhneVlsRmRBdG5D?=
 =?utf-8?B?a2JtcjRnZjB5NDB3U3JPWjg4eUMrWjFNMFBaYytwMlZvNjRUM25sNkRyOHo5?=
 =?utf-8?B?S0pRMUE3dTY5MC9wa0tXcDQxWWZuelAwMHhOZitwSzR1SzhPcitNRDc3NUVM?=
 =?utf-8?B?TGF3cGt6WXBFTlp5NTFCSW1EUGs5em1iKzlHSXlFcWc0L29lTzRHOWxKbFls?=
 =?utf-8?B?QVd0TkwvQk9hWkpEakdTUVYwdDM5cFR1cEt1elYzVGpOaUJMMC91N1pHbG1y?=
 =?utf-8?B?L0NjTlNDN0FIT1R5dTdaL29lS1VxZnF2SUpuQld2eTNSd2dGRi8rQWMveWdj?=
 =?utf-8?B?NDJ0dEx4aTRpbkJIbS9iK1UyVldUOFJMalZoK0tqWmZENDZhTFM4SkY3YnQ2?=
 =?utf-8?Q?0cVFeIyxlts1awDo+gua+2XpRk/q+Z0WIHSykQy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6380498-4a4e-4697-3c47-08d97f413bb2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:54:00.1853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUqsrO/XBh4/c+LL6ef8fNj7GrLGp5c4qSbVvdJx2QxTJeZwCnG3SvRx8bXdmIdwzRh+4URu76jz0Sq/2oj08w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

Having a separate flush-all hook has always been puzzling me some. We
will want to be able to force a full flush via accumulated flush flags
from the map/unmap functions. Introduce a respective new flag and fold
all flush handling to use the single remaining hook.

Note that because of the respective comments in SMMU and IPMMU-VMSA
code, I've folded the two prior hook functions into one. For SMMU-v3,
which lacks a comment towards incapable hardware, I've left both
functions in place on the assumption that selective and full flushes
will eventually want separating.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: What we really are going to need is for the map/unmap functions to
     specify that a wider region needs flushing than just the one
     covered by the present set of (un)maps. This may still be less than
     a full flush, but at least as a first step it seemed better to me
     to keep things simple and go the flush-all route.
---
v2: New.

--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -242,7 +242,6 @@ int amd_iommu_get_reserved_device_memory
 int __must_check amd_iommu_flush_iotlb_pages(struct domain *d, dfn_t dfn,
                                              unsigned long page_count,
                                              unsigned int flush_flags);
-int __must_check amd_iommu_flush_iotlb_all(struct domain *d);
 void amd_iommu_print_entries(const struct amd_iommu *iommu, unsigned int dev_id,
                              dfn_t dfn);
 
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -475,15 +475,18 @@ int amd_iommu_flush_iotlb_pages(struct d
 {
     unsigned long dfn_l = dfn_x(dfn);
 
-    ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
-    ASSERT(flush_flags);
+    if ( !(flush_flags & IOMMU_FLUSHF_all) )
+    {
+        ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
+        ASSERT(flush_flags);
+    }
 
     /* Unless a PTE was modified, no flush is required */
     if ( !(flush_flags & IOMMU_FLUSHF_modified) )
         return 0;
 
-    /* If the range wraps then just flush everything */
-    if ( dfn_l + page_count < dfn_l )
+    /* If so requested or if the range wraps then just flush everything. */
+    if ( (flush_flags & IOMMU_FLUSHF_all) || dfn_l + page_count < dfn_l )
     {
         amd_iommu_flush_all_pages(d);
         return 0;
@@ -508,13 +511,6 @@ int amd_iommu_flush_iotlb_pages(struct d
 
     return 0;
 }
-
-int amd_iommu_flush_iotlb_all(struct domain *d)
-{
-    amd_iommu_flush_all_pages(d);
-
-    return 0;
-}
 
 int amd_iommu_reserve_domain_unity_map(struct domain *d,
                                        const struct ivrs_unity_map *map,
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -642,7 +642,6 @@ static const struct iommu_ops __initcons
     .map_page = amd_iommu_map_page,
     .unmap_page = amd_iommu_unmap_page,
     .iotlb_flush = amd_iommu_flush_iotlb_pages,
-    .iotlb_flush_all = amd_iommu_flush_iotlb_all,
     .reassign_device = reassign_device,
     .get_device_group_id = amd_iommu_group_id,
     .enable_x2apic = iov_enable_xt,
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -930,13 +930,19 @@ out:
 }
 
 /* Xen IOMMU ops */
-static int __must_check ipmmu_iotlb_flush_all(struct domain *d)
+static int __must_check ipmmu_iotlb_flush(struct domain *d, dfn_t dfn,
+                                          unsigned long page_count,
+                                          unsigned int flush_flags)
 {
     struct ipmmu_vmsa_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
 
+    ASSERT(flush_flags);
+
     if ( !xen_domain || !xen_domain->root_domain )
         return 0;
 
+    /* The hardware doesn't support selective TLB flush. */
+
     spin_lock(&xen_domain->lock);
     ipmmu_tlb_invalidate(xen_domain->root_domain);
     spin_unlock(&xen_domain->lock);
@@ -944,16 +950,6 @@ static int __must_check ipmmu_iotlb_flus
     return 0;
 }
 
-static int __must_check ipmmu_iotlb_flush(struct domain *d, dfn_t dfn,
-                                          unsigned long page_count,
-                                          unsigned int flush_flags)
-{
-    ASSERT(flush_flags);
-
-    /* The hardware doesn't support selective TLB flush. */
-    return ipmmu_iotlb_flush_all(d);
-}
-
 static struct ipmmu_vmsa_domain *ipmmu_get_cache_domain(struct domain *d,
                                                         struct device *dev)
 {
@@ -1303,7 +1299,6 @@ static const struct iommu_ops ipmmu_iomm
     .hwdom_init      = ipmmu_iommu_hwdom_init,
     .teardown        = ipmmu_iommu_domain_teardown,
     .iotlb_flush     = ipmmu_iotlb_flush,
-    .iotlb_flush_all = ipmmu_iotlb_flush_all,
     .assign_device   = ipmmu_assign_device,
     .reassign_device = ipmmu_reassign_device,
     .map_page        = arm_iommu_map_page,
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -2649,11 +2649,17 @@ static int force_stage = 2;
  */
 static u32 platform_features = ARM_SMMU_FEAT_COHERENT_WALK;
 
-static int __must_check arm_smmu_iotlb_flush_all(struct domain *d)
+static int __must_check arm_smmu_iotlb_flush(struct domain *d, dfn_t dfn,
+					     unsigned long page_count,
+					     unsigned int flush_flags)
 {
 	struct arm_smmu_xen_domain *smmu_domain = dom_iommu(d)->arch.priv;
 	struct iommu_domain *cfg;
 
+	ASSERT(flush_flags);
+
+	/* ARM SMMU v1 doesn't have flush by VMA and VMID */
+
 	spin_lock(&smmu_domain->lock);
 	list_for_each_entry(cfg, &smmu_domain->contexts, list) {
 		/*
@@ -2670,16 +2676,6 @@ static int __must_check arm_smmu_iotlb_f
 	return 0;
 }
 
-static int __must_check arm_smmu_iotlb_flush(struct domain *d, dfn_t dfn,
-					     unsigned long page_count,
-					     unsigned int flush_flags)
-{
-	ASSERT(flush_flags);
-
-	/* ARM SMMU v1 doesn't have flush by VMA and VMID */
-	return arm_smmu_iotlb_flush_all(d);
-}
-
 static struct iommu_domain *arm_smmu_get_domain(struct domain *d,
 						struct device *dev)
 {
@@ -2879,7 +2875,6 @@ static const struct iommu_ops arm_smmu_i
     .add_device = arm_smmu_dt_add_device_generic,
     .teardown = arm_smmu_iommu_domain_teardown,
     .iotlb_flush = arm_smmu_iotlb_flush,
-    .iotlb_flush_all = arm_smmu_iotlb_flush_all,
     .assign_device = arm_smmu_assign_dev,
     .reassign_device = arm_smmu_reassign_dev,
     .map_page = arm_iommu_map_page,
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -3431,7 +3431,6 @@ static const struct iommu_ops arm_smmu_i
 	.hwdom_init		= arm_smmu_iommu_hwdom_init,
 	.teardown		= arm_smmu_iommu_xen_domain_teardown,
 	.iotlb_flush		= arm_smmu_iotlb_flush,
-	.iotlb_flush_all	= arm_smmu_iotlb_flush_all,
 	.assign_device		= arm_smmu_assign_dev,
 	.reassign_device	= arm_smmu_reassign_dev,
 	.map_page		= arm_iommu_map_page,
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -463,15 +463,12 @@ int iommu_iotlb_flush_all(struct domain
     const struct domain_iommu *hd = dom_iommu(d);
     int rc;
 
-    if ( !is_iommu_enabled(d) || !hd->platform_ops->iotlb_flush_all ||
+    if ( !is_iommu_enabled(d) || !hd->platform_ops->iotlb_flush ||
          !flush_flags )
         return 0;
 
-    /*
-     * The operation does a full flush so we don't need to pass the
-     * flush_flags in.
-     */
-    rc = iommu_call(hd->platform_ops, iotlb_flush_all, d);
+    rc = iommu_call(hd->platform_ops, iotlb_flush, d, INVALID_DFN, 0,
+                    flush_flags | IOMMU_FLUSHF_all);
     if ( unlikely(rc) )
     {
         if ( !d->is_shutting_down && printk_ratelimit() )
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -731,18 +731,21 @@ static int __must_check iommu_flush_iotl
                                                 unsigned long page_count,
                                                 unsigned int flush_flags)
 {
-    ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
-    ASSERT(flush_flags);
+    if ( flush_flags & IOMMU_FLUSHF_all )
+    {
+        dfn = INVALID_DFN;
+        page_count = 0;
+    }
+    else
+    {
+        ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
+        ASSERT(flush_flags);
+    }
 
     return iommu_flush_iotlb(d, dfn, flush_flags & IOMMU_FLUSHF_modified,
                              page_count);
 }
 
-static int __must_check iommu_flush_iotlb_all(struct domain *d)
-{
-    return iommu_flush_iotlb(d, INVALID_DFN, 0, 0);
-}
-
 static void queue_free_pt(struct domain *d, mfn_t mfn, unsigned int next_level)
 {
     if ( next_level > 1 )
@@ -2841,7 +2844,7 @@ static int __init intel_iommu_quarantine
     spin_unlock(&hd->arch.mapping_lock);
 
     if ( !rc )
-        rc = iommu_flush_iotlb_all(d);
+        rc = iommu_flush_iotlb(d, INVALID_DFN, 0, 0);
 
     /* Pages may be leaked in failure case */
     return rc;
@@ -2874,7 +2877,6 @@ static struct iommu_ops __initdata vtd_o
     .resume = vtd_resume,
     .crash_shutdown = vtd_crash_shutdown,
     .iotlb_flush = iommu_flush_iotlb_pages,
-    .iotlb_flush_all = iommu_flush_iotlb_all,
     .get_reserved_device_memory = intel_iommu_get_reserved_device_memory,
     .dump_page_tables = vtd_dump_page_tables,
 };
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -147,9 +147,11 @@ enum
 {
     _IOMMU_FLUSHF_added,
     _IOMMU_FLUSHF_modified,
+    _IOMMU_FLUSHF_all,
 };
 #define IOMMU_FLUSHF_added (1u << _IOMMU_FLUSHF_added)
 #define IOMMU_FLUSHF_modified (1u << _IOMMU_FLUSHF_modified)
+#define IOMMU_FLUSHF_all (1u << _IOMMU_FLUSHF_all)
 
 int __must_check iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
                            unsigned long page_count, unsigned int flags,
@@ -282,7 +284,6 @@ struct iommu_ops {
     int __must_check (*iotlb_flush)(struct domain *d, dfn_t dfn,
                                     unsigned long page_count,
                                     unsigned int flush_flags);
-    int __must_check (*iotlb_flush_all)(struct domain *d);
     int (*get_reserved_device_memory)(iommu_grdm_t *, void *);
     void (*dump_page_tables)(struct domain *d);
 


