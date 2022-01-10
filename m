Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F15489DA7
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 17:35:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255476.437794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xdQ-0004R9-FK; Mon, 10 Jan 2022 16:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255476.437794; Mon, 10 Jan 2022 16:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xdQ-0004PG-Ap; Mon, 10 Jan 2022 16:35:04 +0000
Received: by outflank-mailman (input) for mailman id 255476;
 Mon, 10 Jan 2022 16:35:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6xdO-0004P6-Qo
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 16:35:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41c4b10f-7233-11ec-81c1-a30af7de8005;
 Mon, 10 Jan 2022 17:35:01 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-G_RGMA0_PiKPtrtePztdFg-1; Mon, 10 Jan 2022 17:35:00 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6477.eurprd04.prod.outlook.com (2603:10a6:803:11e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 16:34:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 16:34:52 +0000
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
X-Inumbo-ID: 41c4b10f-7233-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641832501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YBCzwC2eZDK7d/zI6qt9LH0Bqw+U19RhaUIYaoWX8qk=;
	b=jxJFinby71aoj1f5pdHDtRC4Dre8WNwFno1pJ8BNA0VqOfLd/xoPAck6HI7FISltZmHJtD
	wZe17kunZtbYe6HwC0ozF6Xcxv5mPunQKD7eCW8Eu5U/b/Fba57oFFdKpMY6xLwkCCLlXV
	VJJDKtPp0NiGVzQmC3GdRfv3gNyJy/E=
X-MC-Unique: G_RGMA0_PiKPtrtePztdFg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i8ycSrsWKX3BlW8E+kD13GxI0mjfQM6h1NHwk8v3U66/CfGUn9+jWKdpBaQRz2gYvzDIw0xc3jSaIVXkRAoFMBVN/qtA/AFbHvo3ufri9AXqlvOMFIZVTa9qf2zXqkPWwW7viDhi4lcdc+YG9zUZy5TItXAE1rlxwJ0aXmgm3P4t3c3Y0y/UcucCE6TLlzum1jMkLG+oCuxbUyZtQRm+He7izqbksfDY7foXsIkDI0LNnNW1bnUbheIqm+/zhUXBmHKCmwntM3SZ2r7UjGONHXq1K0wNvl6Z5SIikU7qNCFID5KuJjMEAWwdLxSXml3eDH5N/cRGwFmskKsXk5XYTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBCzwC2eZDK7d/zI6qt9LH0Bqw+U19RhaUIYaoWX8qk=;
 b=BMaLjOsEYu0/lCGPZaOQLGCGQTsCW22RuONWK8S9OqsNBcqQuMkM4HP+XOQimN3/y66kILqCgY5yqdIgBGGQMvXPmNqTQRU6qWw/089g0+hw6Ds6baanOHk1Ag4q0DnjAljJahL8zriCQh8hDSSHrbS0keKnmAlzGnINmEj9xxqPPqQnK24JUWzKIS68N6EKR8SzV7qSjDax7FsCle5DLdROCcoVPCbY0Rsx53AvHmWd+ChQ5Dz1u9Jj7nz0QuOn6QoDvxzhnLf5QJauXsLq5lC6mCeTiawUBZYg59iZRF4sFrs4eUHYf/TbgjPkZSjmuwgNKYlO6kYkXVzCq84Twg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b985d619-05ea-73c1-1919-b0343e5a9b8e@suse.com>
Date: Mon, 10 Jan 2022 17:34:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v3 17/23] IOMMU/x86: prefill newly allocate page tables
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
X-ClientProxiedBy: AM6PR08CA0024.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9259f210-4d08-462a-435a-08d9d4572057
X-MS-TrafficTypeDiagnostic: VE1PR04MB6477:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB64774BE660AB58F4695A39A2B3509@VE1PR04MB6477.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TVt8a1zlweRMZhjj0VmNsC8Ua5aRXA8iQbmLOtyQSDVY80u83VcaUiVnGmWYFxhlaLzFocKTGNEv/QWnIwGm6gKWRj8gT1QF4edKYKhPyT4wHGX+vGXbqZ8KP1BjZIYCgrYZMD8Hk/yisnnHcTdyPpFZ/yaqqYEnKlCJD0+vtwiq3YaClcaNrIe8dCpFjaK5x93gch/pgixJgYmq9JQNkEq+z5Nj/hv0pvZ2WVPCAJvjP7R4KUgi7vQ85/KAxcvDbK2ZQqv2ci02WF8iflHYcpPLR0TEpj4SINfC37yBbUlZGTUTN5Bn6EPlAxQYGEE/4FzMMkE6Kb5ma+OWMgL+SCCd1pF50m+a3+fm3WDWxmlXs9SjI0iQNBtQkQRsA4kRp2vS1gH+HCSCjB8sYhLml7ohfbkyG8eu+jAbb6G/+uJrEY9ziYRv3ToS5LOtwXwijyleryK27VoNEdKK75xHXCoM8N1vcmDvJAum11wrsRl5xTz7pv9j7zDFdodrJtBr+4+Iyat8saMnwXvXzRKpvzSkwlOOE/Ma1S6PC8P5GlW3dKJR4AXUbrvpOFRlKEkLn14mZaKuELIDFX+d9SmNPdLhceKmN9o9C7N/TFqwNZkfXyXXFEe9JoMGY1QgLoogmqyWVwcOdVvTNFwQLJhS1VgzFJiD4MpaDY31JryJQRSj35ofFgMTk1OFN1oF5JNcyOecd5eIiRGwhv4Y/gZZi0F92I79fPqKb19R9NBcrieSrkF5S1T3nzGY7TBSeUHo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(6916009)(86362001)(36756003)(8676002)(508600001)(6486002)(31686004)(186003)(26005)(2616005)(6512007)(66556008)(6506007)(66476007)(2906002)(66946007)(4326008)(31696002)(83380400001)(38100700002)(54906003)(5660300002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFkrcUJ1YUZTeE1UVGwrdXd5Yk1pY0NPWm9KdEJtWHZpVXRtQmZiazVqbzVG?=
 =?utf-8?B?VmFCcFhJaE5jK1JiTG5sQmNxOFFZWkJKMGlBbWZmMDRIRkpTOTlWMVJxcnQr?=
 =?utf-8?B?ZUdWRlpoU2JTVExhQXNHWHFSSUVTWDZzek0wa1NRT3hJRjVBOWZVU1F1OEZX?=
 =?utf-8?B?elMzSnBlb3BLY2lrRG5nd013WWFSZGlIZWZIaFk3WGkzeWdOcE53ZC9CY3F1?=
 =?utf-8?B?bmtlTDQyNnN0V05xbi9QMDJFWlBNY1NoV0ZTeWQxUUNPeHhKcUg3Mkt3S3Zp?=
 =?utf-8?B?MlNzN0lVczYwRG8vcUZ0VFdaY2ROK0twMmVhTFlOK3RmUFhYMXg1MWhxTVYy?=
 =?utf-8?B?bWVReVBoUXYrSEYvN2tvWnVlZVVuWXBzMlFzT3VwQm9qWnFQNkdyZmdUeU13?=
 =?utf-8?B?UG90SVJKUjhqa05qTDNhTmVDbiszRzRoZytYUVRlQlptZHNJcW1OdndNV1N4?=
 =?utf-8?B?VnJvU2wxbzlRdHpUbFJVOVk2RVJlVmNwTmI1cWpNYkNCZGRQaHl3TU9aS2pi?=
 =?utf-8?B?WDk2MUdpbSthZlFRK1RmZEJRQ2NWSG5WWFRCdXEzYTRBSXBzUzcwN2FWaC9P?=
 =?utf-8?B?QzljczYxZjlZTTZXUUF2Ym5qcG5kVHJHQ2ttV0FHaC9uVWIrdmZNaHJyaHNi?=
 =?utf-8?B?TFd2ZXpFWEJqeVJMMTBGenJlQ0x0Vkd3MEFmZWpUQnBFNHkrVTVBV1phVlFC?=
 =?utf-8?B?dGZ2M0VMY3pMZlMyMmErb0V3M0VITkM3N1NpY25IbXBKemwvRmRMRGhTZGl0?=
 =?utf-8?B?K2R4R0ZQN3JRWktsY2tFVElPN0d1MmRaMUhvUWhKUXNWdFluL0FGdFBtemxC?=
 =?utf-8?B?UGVSZnA3UU1wS25CeU9xandmVVNudnBrQWJjTnhRWkVteGZoNzE4d3RRNTl6?=
 =?utf-8?B?VGE3L2p0L0NiWHN4aVNJU0FvR01mc2Z0S3l4MUxETGpIeW8zZDJyL0pKYndY?=
 =?utf-8?B?M2RjRUxPVWlqVnlQenR4Vjh2eU9LaDlDb2dyVnhBTURLVEdjTFVWQVRrQzRP?=
 =?utf-8?B?WUtoVTNnTHZYcHUwSjVIeUdKZ0FPZHVkNmorVlZMamVUeDUyQmMvTmhnQXk0?=
 =?utf-8?B?ZVYxejNvbjVGQWJXK0JDUzFlMVZoUTVYOFBIUzFWR20vdnl0ZVd2bFFFUXpM?=
 =?utf-8?B?KzdOdWh2MDhLak1SQVN4dXdPdU1BWGs5eitFdnNpc2V1T2hrR1RDMGh0MzVs?=
 =?utf-8?B?VE1QOUMxd1B4MHRJVXhpQ28xclVXaDc1ODIyRTlBdDdlaGRLUzMwM3ptaFJn?=
 =?utf-8?B?NWZQak9nb295QkhnalFwOHVOY09kMm41VkdlMDZRYlFSbTdFSVl2dWJUYXYx?=
 =?utf-8?B?bFppVUJUTlh3eU5hOGRRYzY2cnlrbkZweHlPMGlCTEJ5aXpHNnZqSWc4TVhO?=
 =?utf-8?B?b2pPSXVsWWdkMllGbXRNREtCbWkrNXAyM1BKOE5BV3NPaTZ5dXZxL0RPMS9h?=
 =?utf-8?B?QUs3d0ZMSnJheEdCNlBCUE8vNE5uQ3phTTd2SEg4bkQ1NzljSmVkQzUvcVdP?=
 =?utf-8?B?VmRpcWlHSkpnUWpKbU5oU21CM1BUaU00QmZGOXRCTXdCdDFkV1FVZ0NyNzlk?=
 =?utf-8?B?ajF2ZnZrTDdYVU9BSkZmd3NhUTJ0UE1KZTBFTDk5WXRNMWp1aWF2RjQ4dE1N?=
 =?utf-8?B?MjFDTTY5WWcyUWZrVEZJbzhvcTdvMW44K1BjN2orbWdTeVNwcStIdXpHaGk4?=
 =?utf-8?B?aHpHOXFZaHY5d3RCU1ZaNVNTMHNJUHA4NTdQL2xqdEpiSGNudS9qVXY5UWh3?=
 =?utf-8?B?b05zWVZJa1Rna2JySmNSUUVxNE0zWDRvb1Ixek1sM3owdTY3OE10eERYUVp4?=
 =?utf-8?B?SXBWTU42bmJEYzZYbDhYYzNVVUJVZDQxbmptQXBNZk1mbndKcTliWVZxdkli?=
 =?utf-8?B?d1Y1dWdIN1N1QmtCTWVVTnJSTXRSTk9TZjYxVzE1WUdCRk55OG92Sk5LS283?=
 =?utf-8?B?U0ttLzFPR2V2NUVwZWpTa2JFVXVweWVuWHdzQnZPcDJHcjlMRnJJemQxZFZv?=
 =?utf-8?B?VGtOOTJsZTB0SUt0Z1U4OStxZThJRHdZQ0phUFgyQklKYWVQTkFUQVErUzNV?=
 =?utf-8?B?dVVzY2pxNy9FcGw4SUt2KzB1QW5Qb3JzRWVJNEIwVHF3YkN6R0NaUVJmSEw3?=
 =?utf-8?B?enFXMGgyeUxEa3VDdW9qMStKK1lmcHJZVXdueEt1NTErS3pmT0plYmM0aWEy?=
 =?utf-8?Q?YNAqWicFtGF+sJXE/yQqt8A=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9259f210-4d08-462a-435a-08d9d4572057
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 16:34:52.0298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Z6I0VuEagU+MDx25fxEXc5NZvGFTwN0YLqCzdzNmP6HMsaDOv/M3Qoa04vmDrP0iqldtU1quPoysuL1EpsWJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6477

Page tables are used for two purposes after allocation: They either
start out all empty, or they get filled to replace a superpage.
Subsequently, to replace all empty or fully contiguous page tables,
contiguous sub-regions will be recorded within individual page tables.
Install the initial set of markers immediately after allocation. Make
sure to retain these markers when further populating a page table in
preparation for it to replace a superpage.

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

While in VT-d's comment ahead of struct dma_pte I'm adjusting the
description of the high bits, I'd like to note that the description of
some of the lower bits isn't correct either. Yet I don't think adjusting
that belongs here.
---
v3: Add comments. Re-base.
v2: New.

--- a/xen/drivers/passthrough/amd/iommu-defs.h
+++ b/xen/drivers/passthrough/amd/iommu-defs.h
@@ -445,11 +445,13 @@ union amd_iommu_x2apic_control {
 #define IOMMU_PAGE_TABLE_U32_PER_ENTRY	(IOMMU_PAGE_TABLE_ENTRY_SIZE / 4)
 #define IOMMU_PAGE_TABLE_ALIGNMENT	4096
 
+#define IOMMU_PTE_CONTIG_MASK           0x1e /* The ign0 field below. */
+
 union amd_iommu_pte {
     uint64_t raw;
     struct {
         bool pr:1;
-        unsigned int ign0:4;
+        unsigned int ign0:4; /* Covered by IOMMU_PTE_CONTIG_MASK. */
         bool a:1;
         bool d:1;
         unsigned int ign1:2;
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
@@ -235,7 +247,7 @@ static int iommu_pde_from_dfn(struct dom
             mfn = next_table_mfn;
 
             /* allocate lower level page table */
-            table = iommu_alloc_pgtable(d);
+            table = iommu_alloc_pgtable(d, IOMMU_PTE_CONTIG_MASK);
             if ( table == NULL )
             {
                 AMD_IOMMU_ERROR("cannot allocate I/O page table\n");
@@ -265,7 +277,7 @@ static int iommu_pde_from_dfn(struct dom
 
             if ( next_table_mfn == 0 )
             {
-                table = iommu_alloc_pgtable(d);
+                table = iommu_alloc_pgtable(d, IOMMU_PTE_CONTIG_MASK);
                 if ( table == NULL )
                 {
                     AMD_IOMMU_ERROR("cannot allocate I/O page table\n");
@@ -651,7 +663,7 @@ int __init amd_iommu_quarantine_init(str
 
     spin_lock(&hd->arch.mapping_lock);
 
-    hd->arch.amd.root_table = iommu_alloc_pgtable(d);
+    hd->arch.amd.root_table = iommu_alloc_pgtable(d, 0);
     if ( !hd->arch.amd.root_table )
         goto out;
 
@@ -666,7 +678,7 @@ int __init amd_iommu_quarantine_init(str
          * page table pages, and the resulting allocations are always
          * zeroed.
          */
-        pg = iommu_alloc_pgtable(d);
+        pg = iommu_alloc_pgtable(d, 0);
         if ( !pg )
             break;
 
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -242,7 +242,7 @@ int amd_iommu_alloc_root(struct domain *
 
     if ( unlikely(!hd->arch.amd.root_table) )
     {
-        hd->arch.amd.root_table = iommu_alloc_pgtable(d);
+        hd->arch.amd.root_table = iommu_alloc_pgtable(d, 0);
         if ( !hd->arch.amd.root_table )
             return -ENOMEM;
     }
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -381,7 +381,7 @@ static uint64_t addr_to_dma_page_maddr(s
             goto out;
 
         pte_maddr = level;
-        if ( !(pg = iommu_alloc_pgtable(domain)) )
+        if ( !(pg = iommu_alloc_pgtable(domain, 0)) )
             goto out;
 
         hd->arch.vtd.pgd_maddr = page_to_maddr(pg);
@@ -423,7 +423,7 @@ static uint64_t addr_to_dma_page_maddr(s
             }
 
             pte_maddr = level - 1;
-            pg = iommu_alloc_pgtable(domain);
+            pg = iommu_alloc_pgtable(domain, DMA_PTE_CONTIG_MASK);
             if ( !pg )
                 break;
 
@@ -435,12 +435,13 @@ static uint64_t addr_to_dma_page_maddr(s
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
@@ -2028,7 +2029,7 @@ static int __must_check intel_iommu_map_
     if ( iommu_snoop )
         dma_set_pte_snp(new);
 
-    if ( old.val == new.val )
+    if ( !((old.val ^ new.val) & ~DMA_PTE_CONTIG_MASK) )
     {
         spin_unlock(&hd->arch.mapping_lock);
         unmap_vtd_domain_page(page);
@@ -2885,7 +2886,7 @@ static int __init intel_iommu_quarantine
         goto out;
     }
 
-    pg = iommu_alloc_pgtable(d);
+    pg = iommu_alloc_pgtable(d, 0);
 
     rc = -ENOMEM;
     if ( !pg )
@@ -2904,7 +2905,7 @@ static int __init intel_iommu_quarantine
          * page table pages, and the resulting allocations are always
          * zeroed.
          */
-        pg = iommu_alloc_pgtable(d);
+        pg = iommu_alloc_pgtable(d, 0);
 
         if ( !pg )
             goto out;
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -250,7 +250,10 @@ struct context_entry {
  * 2-6: reserved
  * 7: super page
  * 8-11: available
- * 12-63: Host physcial address
+ * 12-51: Host physcial address
+ * 52-61: available (52-55 used for DMA_PTE_CONTIG_MASK)
+ * 62: reserved
+ * 63: available
  */
 struct dma_pte {
     u64 val;
@@ -260,6 +263,7 @@ struct dma_pte {
 #define DMA_PTE_PROT (DMA_PTE_READ | DMA_PTE_WRITE)
 #define DMA_PTE_SP   (1 << 7)
 #define DMA_PTE_SNP  (1 << 11)
+#define DMA_PTE_CONTIG_MASK  (0xfull << PADDR_BITS)
 #define dma_clear_pte(p)    do {(p).val = 0;} while(0)
 #define dma_set_pte_readable(p) do {(p).val |= DMA_PTE_READ;} while(0)
 #define dma_set_pte_writable(p) do {(p).val |= DMA_PTE_WRITE;} while(0)
@@ -273,7 +277,7 @@ struct dma_pte {
 #define dma_pte_write(p) (dma_pte_prot(p) & DMA_PTE_WRITE)
 #define dma_pte_addr(p) ((p).val & PADDR_MASK & PAGE_MASK_4K)
 #define dma_set_pte_addr(p, addr) do {\
-            (p).val |= ((addr) & PAGE_MASK_4K); } while (0)
+            (p).val |= ((addr) & PADDR_MASK & PAGE_MASK_4K); } while (0)
 #define dma_pte_present(p) (((p).val & DMA_PTE_PROT) != 0)
 #define dma_pte_superpage(p) (((p).val & DMA_PTE_SP) != 0)
 
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -461,12 +461,12 @@ int iommu_free_pgtables(struct domain *d
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
@@ -478,7 +478,28 @@ struct page_info *iommu_alloc_pgtable(st
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
--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -142,7 +142,8 @@ int pi_update_irte(const struct pi_desc
 })
 
 int __must_check iommu_free_pgtables(struct domain *d);
-struct page_info *__must_check iommu_alloc_pgtable(struct domain *d);
+struct page_info *__must_check iommu_alloc_pgtable(struct domain *d,
+                                                   uint64_t contig_mask);
 void iommu_queue_free_pgtable(struct domain *d, struct page_info *pg);
 
 #endif /* !__ARCH_X86_IOMMU_H__ */


