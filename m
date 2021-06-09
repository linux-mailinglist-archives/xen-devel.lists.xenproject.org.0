Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 502B33A0FAE
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 11:30:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139107.257327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lquWq-0002cP-5z; Wed, 09 Jun 2021 09:29:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139107.257327; Wed, 09 Jun 2021 09:29:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lquWq-0002ZJ-21; Wed, 09 Jun 2021 09:29:40 +0000
Received: by outflank-mailman (input) for mailman id 139107;
 Wed, 09 Jun 2021 09:29:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jMcQ=LD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lquWo-0002Yx-Mr
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 09:29:38 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce1b3c19-d1d6-494b-aeaf-6ab966fac692;
 Wed, 09 Jun 2021 09:29:37 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-0dbrQj_KMUOVT9SqWq-sVA-1; Wed, 09 Jun 2021 11:29:34 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4845.eurprd04.prod.outlook.com (2603:10a6:803:51::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 09:29:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Wed, 9 Jun 2021
 09:29:33 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR04CA0127.eurprd04.prod.outlook.com (2603:10a6:208:55::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Wed, 9 Jun 2021 09:29:32 +0000
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
X-Inumbo-ID: ce1b3c19-d1d6-494b-aeaf-6ab966fac692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623230976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wObYJPemsOXsGyhjl3tI23Gvv+HFSVMfSoBU/wvfj5Q=;
	b=NmjY5+Mi/HprhL86a57fMVyMSBXnoTatfheC2AN4AaockXJqgz/ZvI/OYQWTbPtRbPXRwx
	Ob5zZ7nhkmuXYEWxxOmYSqhZdz1cAkz5mNJPVrWpfMf0pxMQcu/3B9Q7C9ZDkMr96/12ea
	2qlXf619Yk03urH1lFANtdYyA7USDsI=
X-MC-Unique: 0dbrQj_KMUOVT9SqWq-sVA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=njzdSJMVjinNRJyNlUVNY1h70Q6WeBsLdM2lkds/qZzL79k9Xqun1HfoR1mgOeXsekczJ3yfjAnKSIaa6P8z/0bHpZPmSTNZsSv3t/KRbWGqaOZzqrRwI6MFMeGkhZmp4uwdJcWGRBPsEKbLySFVc6SCmVHKQHatmIPRCh4H3ueaGR/u9i4oWhJt+fE70WcTwB/4gvdK7VVwVE1AJZM9Ej9TDpXOix+PX9386WhZKFrg4vXnJ/qrYUNeUX8JYGuWGOjDRCtyWOPNdL2pal5KivYPxe7AxU15wA+A/FWtpkFLfvDWfBCykRVmL5RLLL46W6liki23bnWgHkdGU2cVbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wObYJPemsOXsGyhjl3tI23Gvv+HFSVMfSoBU/wvfj5Q=;
 b=OwXjyYj+scBn2M8zzk4qjF3vjYTkHVuw2tJHAzLC5Hp4AM8TaNlmdsFFj562xCIlYNKZDIxo2mUasM667ZEImIeR4CKvTIqPg0SLXA2J6BJNsWDDkMeHVF5Mjusn60sYe5GA9gVIxDDKRBMoTutbZZn8TTdNQ3ahl4Oc+TDe/9wT97972dPRDulxMheKrESG4X1skvIBgzugERboEj47d47Vo08zjeQFS38f6LgPQ5nfD7kLJJ/YgOxurF6Q5655R0cvP+dxu+Qf398yo74I5i/W5obcVMTWVwOXR1YJAmIPGDgOG/H9CmsASlFY6xO9O5iWzQG5Vof87mTyhh5YaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 7/9] VT-d: centralize mapping of QI entries
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
Message-ID: <b1aba243-e05e-1f50-d85d-00f60703b62b@suse.com>
Date: Wed, 9 Jun 2021 11:29:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR04CA0127.eurprd04.prod.outlook.com
 (2603:10a6:208:55::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1703c37-502e-41c0-c692-08d92b291716
X-MS-TrafficTypeDiagnostic: VI1PR04MB4845:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4845A75DDD702A81EE01BCEAB3369@VI1PR04MB4845.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A9M6WYwwa3RjkJ6QXGYO3ZB64+q66+C43ASPxf4GA57JsRZuR4EuR+yKUMHHfYyQJiYtf3wOwcHtBcYXMdXqCjKGSMOeplPhTcq9zplmOqnGFgqrv1u5nH8hnCewxnl+Lj/Gkh4tKuPh/aezl5FgnCYGJK1ijWGOE2bDupzz+L8Uum7ccK+3l7Lv4o1D/fM8g7F65rR2NDD8n4IDYHnNM61sWtpxFPNN3CTLcgWmAB+IPM6kf569elzafC3Sdldt6JekKi/Zz94v9Le2TXgTuIvb03IftzEm3dElswaafGyvXBRikGnGx7YP1iXDmxEb+0kFwZUq/LoBjkUNV8nb8Ws0aOEE0+vrjpPMwrH1gRUv4Rdkcqfz0o/BrYgpEjaD5KbH7wKZY+EolND8uEuKbIwFvUSIEQOPqNnlQ/cvlJl7DCYne0NLz0JAyTiEsYl04wK0tZ68LTs/njJqRCQT3AQ8cumLvPkfmh6MNLsVrps/eqrw0alHeTsJzQvWL7DSX4y922QeiHIlt/s9dnFkpuG0g5pA9gvTHz9uVu+zUYWWyzIfGPPxp8N5CmXnZIzg7R9q7u1edMRReE3/JwZumfRvT8f2ta7IMIezyS+9GaOECIDd4e0WRH3tJebHq0DdAQtN494NqNgNNm0f6dDnGjLcFz6R5Nc1YqrkM9uS3iQ6VVYUfG+iLd6ns0GVtL+6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(396003)(39860400002)(376002)(346002)(316002)(478600001)(86362001)(8676002)(38100700002)(83380400001)(16526019)(26005)(186003)(36756003)(956004)(4326008)(2616005)(8936002)(5660300002)(6486002)(31696002)(6916009)(2906002)(66946007)(54906003)(31686004)(16576012)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?RUlxM1lJaXNuc240cHBSNmhiOXowRDlhOHVRWXRkekFnV2V3NGdheG42T2xS?=
 =?utf-8?B?WUJZRVY1YlczN21GM2R1dXYyNTNBNlhCNTBSUTJEUys0dzUySkowM0VjVVJW?=
 =?utf-8?B?a3FaY2ZOVlJGaktwOGh0d1hjM1JkR28wTU16aW84R1YvK3N6TncxSVpNWUlM?=
 =?utf-8?B?MGhTWFg3Q3VFeUpBN2FPcDArUGxEVkdHa21LUzdzTzRUa3JUR0hjRkxhYi9Q?=
 =?utf-8?B?R2cweFBVbU85NUJQUTlTWjFCeVovL2EyN1ZzaUxJYVU4eDdVVjZsTjV4Uzg3?=
 =?utf-8?B?VUV4dURGL1JzOERycXFDMTE0aHMyc3pCSnFSTjZkWkgxVVlWNFFDVDVuVkcw?=
 =?utf-8?B?dHhQK0JMUEJxZ0xJd3R2OW1ZNzNzUFZaWDRsbVlSZXlaRExKR2plN2REVWNv?=
 =?utf-8?B?bWVYTmlXWlMrOFFDU21MRTFFMGwzWjJ1NHJZL2xLSlJUaGdLR0txZmxrL0V0?=
 =?utf-8?B?ellHMXl5MWRjT08zZFpZdXQ1Rnp3MGNrb3BEdnpNamgxU0NienhrTjg0WDBp?=
 =?utf-8?B?bkZnZHFud0ZQU1Zwc1dncXdNT0JPY3U4MUhYMm1RYkZtUUpXbk0zdjlxZXJL?=
 =?utf-8?B?Vm5EU1AxeUpHcmwreElWdDhObWsyRkxSRTdFRzdNdHVvTXhOeFdQdWx6ZkJp?=
 =?utf-8?B?MWd4U3ZlU3g0cjhDV1YxbVBjUURVazFCTTUwS2tMeEdMT25INEpiZ3ZLaC9X?=
 =?utf-8?B?UEVGVG03NEhiTnJrbXh2dkJoUTlvU2pTdzFKaDRKaVdnOU1wbDUxQk1saVJ3?=
 =?utf-8?B?cWYxVzBtS2FBMUlqQ0RVb0MxZlhSSTZVV0liS3ZtaEEreHhwZ1N4dnl3UjBr?=
 =?utf-8?B?a1BmckdFV0NZT2o3YTNIaG9qOG1OaDgrdWdnN0ZMVEpudjg1TUtYR2dlUno4?=
 =?utf-8?B?SEttY3JwNzFlaG1yVS9WenNuUzRjMXZiVkRaY1AxalFoaGljM0RDZkFzOERO?=
 =?utf-8?B?cGpZRnZmZG1OZXl4ZG5HMWhkL1diUmg5azJVQWMvWUVob3BDMjVUMXQ3ZFVC?=
 =?utf-8?B?QXZyVGdOTk9LUGJ1QVJ1OHJyRlplTU9lYUFkcUtHY2k2YWV1ZllrNWIwUHE2?=
 =?utf-8?B?WnpCRTFBVjV2amQrc0xqYmlSRnBUR2l0ZGorMGUvZVpieVp2aTJLSFVud0J6?=
 =?utf-8?B?MlV2dFFZdVJpVXZibmFSQXVGTUJ0QkRWSStvNHh3S1l1a2VOdE1rbnduQ1Nv?=
 =?utf-8?B?ZmR4T2ovaDJPa2pDUGFRbnNUcXdjWUUxeVNGeENlNDhsNENrR0w4MUZqcHZR?=
 =?utf-8?B?RlMwUXVsVXIxWjZyN1lybHBGU0ppSEF0TEJVSGt0Sjc3LzdMRHpCbVo1Q2Vv?=
 =?utf-8?B?dUcvc3N3UlAvSFlkWTViVDBLZGlOenh6N0M1bnIvS3NmaVMvSDdYV2JwQVM0?=
 =?utf-8?B?aW5IYzlnL0pWcS8rWmVXRmFWWVhSVlFndkxHakFnQkN0b1cxM0lwQUNnNzlF?=
 =?utf-8?B?SkxmTG85MmxpUzNJSHF0ZlpDOFc2QU5tZkp5NU43ejEyUlduaGxnd25ZalZh?=
 =?utf-8?B?NHJqeGhXVlplZnlydzdmYnI3dDhLTFlHT2tjY2wyeDFJK3dmSVRreC93MTVC?=
 =?utf-8?B?KzVLRHdxNjhvVEtWcitNVGtuSHlyamM3OFVFbnJkOTZiMkZTbkcvR3JIb1Vv?=
 =?utf-8?B?cVV3eEJTSWxtcUJrQllQR3ZMWVlKdFkxdWljRlpTcU04YVlRbXhFM0VrTk1P?=
 =?utf-8?B?a0Z6Wml2SGlNUzdoNStXQnRsbTZZbC9PSkpvb3EyTForOVVMY1JwdHQ5NFFz?=
 =?utf-8?Q?oOtqhXy9RCCqB6fKRInFIDThWGRslYcBKP5iRII?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1703c37-502e-41c0-c692-08d92b291716
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 09:29:33.1857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QfsfkuskLWjicyoOeSKnfJFC1PZV9bIfWOvHSUFizrVf7Kg22JbsUVfhQ7JF2QvhrcaT1Wxpd131k3Nuqb5Wvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4845

Introduce a helper function to reduce redundancy. Take the opportunity
to express the logic without using the somewhat odd QINVAL_ENTRY_ORDER.
Also take the opportunity to uniformly unmap after updating queue tail
and dropping the lock (like was done so far only by
queue_invalidate_context_sync()).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I wonder though whether we wouldn't be better off permanently mapping
the queue(s).

--- a/xen/drivers/passthrough/vtd/qinval.c
+++ b/xen/drivers/passthrough/vtd/qinval.c
@@ -69,6 +69,16 @@ static void qinval_update_qtail(struct v
     dmar_writel(iommu->reg, DMAR_IQT_REG, val << QINVAL_INDEX_SHIFT);
 }
 
+static struct qinval_entry *qi_map_entry(const struct vtd_iommu *iommu,
+                                         unsigned int index)
+{
+    paddr_t base = iommu->qinval_maddr +
+                   ((index * sizeof(struct qinval_entry)) & PAGE_MASK);
+    struct qinval_entry *entries = map_vtd_domain_page(base);
+
+    return &entries[index % (PAGE_SIZE / sizeof(*entries))];
+}
+
 static int __must_check queue_invalidate_context_sync(struct vtd_iommu *iommu,
                                                       u16 did, u16 source_id,
                                                       u8 function_mask,
@@ -76,15 +86,11 @@ static int __must_check queue_invalidate
 {
     unsigned long flags;
     unsigned int index;
-    u64 entry_base;
-    struct qinval_entry *qinval_entry, *qinval_entries;
+    struct qinval_entry *qinval_entry;
 
     spin_lock_irqsave(&iommu->register_lock, flags);
     index = qinval_next_index(iommu);
-    entry_base = iommu->qinval_maddr +
-                 ((index >> QINVAL_ENTRY_ORDER) << PAGE_SHIFT);
-    qinval_entries = map_vtd_domain_page(entry_base);
-    qinval_entry = &qinval_entries[index % (1 << QINVAL_ENTRY_ORDER)];
+    qinval_entry = qi_map_entry(iommu, index);
 
     qinval_entry->q.cc_inv_dsc.lo.type = TYPE_INVAL_CONTEXT;
     qinval_entry->q.cc_inv_dsc.lo.granu = granu;
@@ -98,7 +104,7 @@ static int __must_check queue_invalidate
     qinval_update_qtail(iommu, index);
     spin_unlock_irqrestore(&iommu->register_lock, flags);
 
-    unmap_vtd_domain_page(qinval_entries);
+    unmap_vtd_domain_page(qinval_entry);
 
     return invalidate_sync(iommu);
 }
@@ -110,15 +116,11 @@ static int __must_check queue_invalidate
 {
     unsigned long flags;
     unsigned int index;
-    u64 entry_base;
-    struct qinval_entry *qinval_entry, *qinval_entries;
+    struct qinval_entry *qinval_entry;
 
     spin_lock_irqsave(&iommu->register_lock, flags);
     index = qinval_next_index(iommu);
-    entry_base = iommu->qinval_maddr +
-                 ((index >> QINVAL_ENTRY_ORDER) << PAGE_SHIFT);
-    qinval_entries = map_vtd_domain_page(entry_base);
-    qinval_entry = &qinval_entries[index % (1 << QINVAL_ENTRY_ORDER)];
+    qinval_entry = qi_map_entry(iommu, index);
 
     qinval_entry->q.iotlb_inv_dsc.lo.type = TYPE_INVAL_IOTLB;
     qinval_entry->q.iotlb_inv_dsc.lo.granu = granu;
@@ -133,10 +135,11 @@ static int __must_check queue_invalidate
     qinval_entry->q.iotlb_inv_dsc.hi.res_1 = 0;
     qinval_entry->q.iotlb_inv_dsc.hi.addr = addr >> PAGE_SHIFT_4K;
 
-    unmap_vtd_domain_page(qinval_entries);
     qinval_update_qtail(iommu, index);
     spin_unlock_irqrestore(&iommu->register_lock, flags);
 
+    unmap_vtd_domain_page(qinval_entry);
+
     return invalidate_sync(iommu);
 }
 
@@ -147,17 +150,13 @@ static int __must_check queue_invalidate
     static DEFINE_PER_CPU(uint32_t, poll_slot);
     unsigned int index;
     unsigned long flags;
-    u64 entry_base;
-    struct qinval_entry *qinval_entry, *qinval_entries;
+    struct qinval_entry *qinval_entry;
     uint32_t *this_poll_slot = &this_cpu(poll_slot);
 
     spin_lock_irqsave(&iommu->register_lock, flags);
     ACCESS_ONCE(*this_poll_slot) = QINVAL_STAT_INIT;
     index = qinval_next_index(iommu);
-    entry_base = iommu->qinval_maddr +
-                 ((index >> QINVAL_ENTRY_ORDER) << PAGE_SHIFT);
-    qinval_entries = map_vtd_domain_page(entry_base);
-    qinval_entry = &qinval_entries[index % (1 << QINVAL_ENTRY_ORDER)];
+    qinval_entry = qi_map_entry(iommu, index);
 
     qinval_entry->q.inv_wait_dsc.lo.type = TYPE_INVAL_WAIT;
     qinval_entry->q.inv_wait_dsc.lo.iflag = iflag;
@@ -167,10 +166,11 @@ static int __must_check queue_invalidate
     qinval_entry->q.inv_wait_dsc.lo.sdata = QINVAL_STAT_DONE;
     qinval_entry->q.inv_wait_dsc.hi.saddr = virt_to_maddr(this_poll_slot);
 
-    unmap_vtd_domain_page(qinval_entries);
     qinval_update_qtail(iommu, index);
     spin_unlock_irqrestore(&iommu->register_lock, flags);
 
+    unmap_vtd_domain_page(qinval_entry);
+
     /* Now we don't support interrupt method */
     if ( sw )
     {
@@ -246,16 +246,12 @@ int qinval_device_iotlb_sync(struct vtd_
 {
     unsigned long flags;
     unsigned int index;
-    u64 entry_base;
-    struct qinval_entry *qinval_entry, *qinval_entries;
+    struct qinval_entry *qinval_entry;
 
     ASSERT(pdev);
     spin_lock_irqsave(&iommu->register_lock, flags);
     index = qinval_next_index(iommu);
-    entry_base = iommu->qinval_maddr +
-                 ((index >> QINVAL_ENTRY_ORDER) << PAGE_SHIFT);
-    qinval_entries = map_vtd_domain_page(entry_base);
-    qinval_entry = &qinval_entries[index % (1 << QINVAL_ENTRY_ORDER)];
+    qinval_entry = qi_map_entry(iommu, index);
 
     qinval_entry->q.dev_iotlb_inv_dsc.lo.type = TYPE_INVAL_DEVICE_IOTLB;
     qinval_entry->q.dev_iotlb_inv_dsc.lo.res_1 = 0;
@@ -268,10 +264,11 @@ int qinval_device_iotlb_sync(struct vtd_
     qinval_entry->q.dev_iotlb_inv_dsc.hi.res_1 = 0;
     qinval_entry->q.dev_iotlb_inv_dsc.hi.addr = addr >> PAGE_SHIFT_4K;
 
-    unmap_vtd_domain_page(qinval_entries);
     qinval_update_qtail(iommu, index);
     spin_unlock_irqrestore(&iommu->register_lock, flags);
 
+    unmap_vtd_domain_page(qinval_entry);
+
     return dev_invalidate_sync(iommu, pdev, did);
 }
 
@@ -280,16 +277,12 @@ static int __must_check queue_invalidate
 {
     unsigned long flags;
     unsigned int index;
-    u64 entry_base;
-    struct qinval_entry *qinval_entry, *qinval_entries;
+    struct qinval_entry *qinval_entry;
     int ret;
 
     spin_lock_irqsave(&iommu->register_lock, flags);
     index = qinval_next_index(iommu);
-    entry_base = iommu->qinval_maddr +
-                 ((index >> QINVAL_ENTRY_ORDER) << PAGE_SHIFT);
-    qinval_entries = map_vtd_domain_page(entry_base);
-    qinval_entry = &qinval_entries[index % (1 << QINVAL_ENTRY_ORDER)];
+    qinval_entry = qi_map_entry(iommu, index);
 
     qinval_entry->q.iec_inv_dsc.lo.type = TYPE_INVAL_IEC;
     qinval_entry->q.iec_inv_dsc.lo.granu = granu;
@@ -299,10 +292,11 @@ static int __must_check queue_invalidate
     qinval_entry->q.iec_inv_dsc.lo.res_2 = 0;
     qinval_entry->q.iec_inv_dsc.hi.res = 0;
 
-    unmap_vtd_domain_page(qinval_entries);
     qinval_update_qtail(iommu, index);
     spin_unlock_irqrestore(&iommu->register_lock, flags);
 
+    unmap_vtd_domain_page(qinval_entry);
+
     ret = invalidate_sync(iommu);
 
     /*


