Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 503F0489DB6
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 17:37:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255496.437838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xfy-000731-SL; Mon, 10 Jan 2022 16:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255496.437838; Mon, 10 Jan 2022 16:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xfy-0006zm-Ol; Mon, 10 Jan 2022 16:37:42 +0000
Received: by outflank-mailman (input) for mailman id 255496;
 Mon, 10 Jan 2022 16:37:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6xfw-0006zU-Mx
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 16:37:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ff9cc41-7233-11ec-9ce5-af14b9085ebd;
 Mon, 10 Jan 2022 17:37:39 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2052.outbound.protection.outlook.com [104.47.1.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-3ZpniPXYOzujl-9Hbyo1zg-1; Mon, 10 Jan 2022 17:37:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6477.eurprd04.prod.outlook.com (2603:10a6:803:11e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 16:37:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 16:37:37 +0000
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
X-Inumbo-ID: 9ff9cc41-7233-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641832659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q21k2QRVQ9OpX2KFqNv7CXJl+zA4mrlUPekTbpVEMuw=;
	b=Bln4Rt7afxpe6WydBNFa6QgY9Ablc0xsRQxrxjSYtnFw9fxikqfaDOvqR+JYRtb6/EEpvE
	G8OLS+MRFpu3ekse8wH7jYCDdkHXmiXL48liGOawQetKsAH97rMkfsGYLgahdc/jHncqvA
	6WK8m3a8fA7SGC4gLLmH5yLwpF2N8mA=
X-MC-Unique: 3ZpniPXYOzujl-9Hbyo1zg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNTYsTqPl0MOLUG5oL5WKuSnPzPUsOcULY9y25cUKFqwkL2uDZudg8NkI4NDcR6d0nlcsAlOjCN26KCkfkb5HF5X330Ix0hERhq6WZGNjK/uvTmibh85+0v6XWKQ8hIOpg9fljo4bKqMKXqssnqsjq+FqVNoMWypOw5O20x45zn15bRSiPPJhxR8ZsYkl0utAtrCvlWTflhIe01Rrer9gK5K+VH5iHbwHHJaKcg9bvdlI7JfZM9NZevImLlb0Vx/anBJSkZ/VoSjewkNrelZr2SmEKL+yHPhmtSlHthO+4yv50BJ0zTgfS6Q9IfOqncd3SBTBDgUTeeYGP2BK7WfMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q21k2QRVQ9OpX2KFqNv7CXJl+zA4mrlUPekTbpVEMuw=;
 b=SJ1M0RER6D2D7JwcvFnzeexCvnh7pb7sWf1QxShwk5tuBjW/MSaHPrHnd2rkQSdWd48oJc+q29+5fNMGq84JqLhqtc1sO1wUllzBBggdB4iILEoa5sd8eXoMmPb2n2lzISy01QcFvsEo+ss/hlNM43g+O4Z9bwJLJZUJIhorvJCy7E2AkDPe7EyeV+uw1KkY1eJXvusl0SyPv/k3Su9g4byuVV4gvOXdNGiU9CStV8WWF57TW3Fjwz85BXEjxLYb+CUXk4ybdpoxNczrBgJfwAckJYnLW02bsvptkh8P12rViF+M5xMpXC3dWQGJxsRL6BWXLejbE3+k42wmHqem7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ceb001c8-9696-29fb-955d-c6244e3586a2@suse.com>
Date: Mon, 10 Jan 2022 17:37:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v3 21/23] AMD/IOMMU: replace all-contiguous page tables by
 superpage mappings
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
In-Reply-To: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0089.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c0b61b5-8b6b-4158-a9ab-08d9d45782cb
X-MS-TrafficTypeDiagnostic: VE1PR04MB6477:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB64779B4F8174DCE55AA2785EB3509@VE1PR04MB6477.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ULK2tQT0F42XYCQytHt2FTR0K+s4OkIT5ChYnCZAP7wUtKLOBNu/tugbMi7FXlFvkzgp7Hj5NFBSv/p+21BpYjUiXHiNU25UNvwiMZ5LCLZxVSAgc46mZ1SgsiEN1PGl0LxiIXtzWLNTlziZ+Cyvx1eMGLFm19yLZDQXpJ0CipTEMk580nnEp+BIVnEo1fhMT4FLm6LpLCwpn/kBI8WmB1WI4FaP9t0XVZnfwEZyCalP7hqLSvUxg7JW1vL+SRtcFcA1U62Jo8e9pteQ7AgX3lVXgCu3yemO+xLcMJ3nmxcQ276GCw9yEDNmF7p+YSgRkkhBDdyBTOdZIvC+oJKQHOZudRDWX8zBZLdpG4uBP9DoUB6W4TKpCOGV7/bvodeYwjPVdWOfX/m5UseRRgHelr5nTcRRBEA5987s8HnjP3NAh5BFk7cVTO/ILbO62vtgFy6kyzBTMb1hrFabBL9lJwW6JAl+rT9VYPtJWJGaU3HimWDwh7gZFlh62LbbZTUn5lAZefLMrMYdcxrL9ZwSU/gt05JVustqqC9ov2ZRtLU8kxI7f1vSSnde7IfYNWeqpZ+vpH+sk9toxPU2GrUcrrO8vxVLjVfLYOwAG5tsEX6yoZnfXMTCUJmbP8AArjkp1BOXHKtXfGBW0Ern0+XrBI0JoKxBCqC/vu4TYMXIOiBPRBWl7fboJDjL4eHueDsIgsKQ7BlM/vJtYV5Qzq4x2tNGOMSYxc5LwjPeRBIPfF14NlbUKQdcNd9VBjdJ31Oy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(66556008)(66476007)(2906002)(66946007)(4326008)(38100700002)(54906003)(5660300002)(316002)(83380400001)(31696002)(508600001)(6486002)(6916009)(8936002)(86362001)(36756003)(8676002)(6512007)(31686004)(186003)(2616005)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnRFSldvZjVnZkNtclFGL2dKU1ZHYytwWjlXV2M5T0FaalRuUytUamJDNnBi?=
 =?utf-8?B?TmpTRUdoTWhqdnNDdkhkUFllSExvdGQ1Tzd0OTFhNng3NmI3NXpSbC9CQ3Nh?=
 =?utf-8?B?ck1HTmpySklxREdldXo3RlpQaFVsTnVMdXhJWnhBd3RNTkppRXdsa3VVcWFy?=
 =?utf-8?B?SVNBQ2toejNNNXJXdDU1TUZvUmhYTTU5eXJkRldyTmVkS0xTd2ZTSjdqWDMr?=
 =?utf-8?B?LzhwV1UzTGFwOFE1eU1ZeUlKbXZGcUdpWFNsM243amhHeEtKeVR3ZzhnanV6?=
 =?utf-8?B?M3FmYlRTdUlWNnlpTENOU2dFeER0cjRKTnlCZ3BSdmNGNHNGRkxtdkxQUlRL?=
 =?utf-8?B?OUtZN1FmL2ZRYTVTQXZpOFYwQVZFMllNTVRLKzZqdExRQ0JNdVMvTGRkZm5T?=
 =?utf-8?B?SU5ja2RlcFRQbWNyaWx0aVZUQTY1YUlIRzhKaFNFZWRGN1VHcW5iU3cvYVlG?=
 =?utf-8?B?NFlZK1BnZnVJdXFUL2VJV1oyTElXMUlHVEZKVTZCZFJGVXdEZ3lBbUdCd0NF?=
 =?utf-8?B?aTArVEdPSGxIU2FCc0RlcGJPWStQUklObjE4SFkrRVJ2bWI2UmhQZlV2MjBB?=
 =?utf-8?B?VzJ1SnRkZXMvNndHTTJnTU1iUHIrWE1YSk1TRVIzR1VzUmxveElxMGxRU2pH?=
 =?utf-8?B?cVFubWRiVVVFcGVRajJoY01TUDRoeTVpL3NrNG02UXpmb0hNdkppVTFQYlJp?=
 =?utf-8?B?QWQwSVBwNG5qR2FHaXY5K3JHbkl0anF5ekxCQjBvdVN0MjMwQ0hmSTRZaFRh?=
 =?utf-8?B?NC9VN1dRNmF2Z0NPMUlZTG91dUZreFFaSnM5ZDJ1aCs0ZUNHdENpOTBiWG43?=
 =?utf-8?B?UU9jTXhjL1JnYk1MRTFIaWtvRnRNaExMbHBnWUwwNkZ2MVVqcExqVGZCSjk2?=
 =?utf-8?B?Z0hkMU9kVGVGR0k4cVQrdS84cDFzVTFpMkI1OFZHOFFpS0pFNXlvTzc4M2xF?=
 =?utf-8?B?Sm02UHg1dFFRQUlkc2IvSWFxNlNXVk5iRFEwb3BlcXg2aVlvZWcveTZ4QmpD?=
 =?utf-8?B?c1dUU1NFMm9teUNhNFgyNlBidVgzKzBFaHpXT0NhdTJDMEtHOGp6bmFxdmVG?=
 =?utf-8?B?NzJNYmlSQ1QzTEk4cmR4ejcwRjZoTlpOOUxaMlErRmpGVWJaMVhxSkVnMlRa?=
 =?utf-8?B?WUZ4U3BnNVhrVDhTOTNvQncwR3VSdTc2dFd6YlRVNVliU0gwS0ZlRlpiNkNa?=
 =?utf-8?B?L0V5UTg4WHBYYmdMWE1DYUMxdUhma2p4eS9kRnR6ZXJNTVNOd0pGNklGTTVj?=
 =?utf-8?B?aEwveE5jdGRDSHhCZDcxQVZ4M1A4dXgycHJyZVFRK0dMcjFvd1N3enE3K1RQ?=
 =?utf-8?B?dnpDNEFidTBKc2F3Q3BvWHZMR3FBcHpjU21SeFgvU3dyREc0MHdURHBuNVJQ?=
 =?utf-8?B?YklFWFZ4b3gwUUo2QmVNNTNUalFoamVWcnBxNStZY0tvbWthZzdEMy9LU0xU?=
 =?utf-8?B?cnZkM0FlK3VBOEliMzFRSU83TWx6S1UyRmV0cW0wRnNpNEM3MjJsR2EzN1E5?=
 =?utf-8?B?L2dmakFYSXI3K2F1TkU5M25iR1l1WTVPSENnOFNIeVVMSXpaekFiQll4aEVz?=
 =?utf-8?B?UVRLZTNvTk1VWHVXVkZJL041R3UyUWxUY0U2cEVaMk1KbW1DNDJraVRQekZz?=
 =?utf-8?B?cUNzM3V4cUw5aC9tMi85MVJWTnVOckdMWmpIWHdjNFh1OU1uSDEzYzVhUi8r?=
 =?utf-8?B?MGp3YlpOMDRieElUZklMZGhKRUVuYWhmaTl5TG5MRHBacUhRalhkNW5GckF4?=
 =?utf-8?B?YjBWaVNkUUV1bzhDUDI3a3VPUUk0OXN4a21IUkpGNVZrcy9ML2JnTXpTQkNE?=
 =?utf-8?B?ZXczcUJnL2ZMaFp4R1hqUlVtZXQvUllYcENEMFZUSUJvek1QTWVWTjRKZDQ4?=
 =?utf-8?B?bG5KdzQvNkRPcElFL1V3WEZ5OTdOczZpZDNvU0xDOTVXeVFnMEliSGVoczlk?=
 =?utf-8?B?WENCV3UvUHU5cFY2Z04yZnhqNkZxbDZpZ1pucGI1OEdOUk55TyttbHl4L1Zm?=
 =?utf-8?B?Q1J6RFpWUTZnTzJIK0R2cG94L2xWMzJnTGlObW5Vek14bkhqWlorMmRHeW00?=
 =?utf-8?B?ZXRjQkoxWlU2a29nVFFibWVsalVTL2xKSlZlVVF2TE1ELzY2UU9YbTRKMm9k?=
 =?utf-8?B?WW14RmxGUG9WRENCTjBWaWphZmVkaXNtV1lzYkUzd09kVTl0QndCQm1EZFJG?=
 =?utf-8?Q?lFYNPzyKk4Ka7PEaT1tQAnI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c0b61b5-8b6b-4158-a9ab-08d9d45782cb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 16:37:37.2113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OBNud9C9YDTRhJgPf5FueomI4cVVDLwIt5KxVRgBCMFyBc5G6sFRR3T1exHsO/bRUpHExcNPHTLco7IaX1NJoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6477

When a page table ends up with all contiguous entries (including all
identical attributes), it can be replaced by a superpage entry at the
next higher level. The page table itself can then be scheduled for
freeing.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Unlike the freeing of all-empty page tables, this causes quite a bit of
back and forth for PV domains, due to their mapping/unmapping of pages
when they get converted to/from being page tables. It may therefore be
worth considering to delay re-coalescing a little, to avoid doing so
when the superpage would otherwise get split again pretty soon. But I
think this would better be the subject of a separate change anyway.

Of course this could also be helped by more "aware" kernel side
behavior: They could avoid immediately mapping freed page tables
writable again, in anticipation of re-using that same page for another
page table elsewhere.
---
v3: New.

--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -81,7 +81,8 @@ static union amd_iommu_pte set_iommu_pte
                                                  unsigned long dfn,
                                                  unsigned long next_mfn,
                                                  unsigned int level,
-                                                 bool iw, bool ir)
+                                                 bool iw, bool ir,
+                                                 bool *contig)
 {
     union amd_iommu_pte *table, *pde, old;
 
@@ -94,11 +95,15 @@ static union amd_iommu_pte set_iommu_pte
          old.iw != iw || old.ir != ir )
     {
         set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
-        pt_update_contig_markers(&table->raw, pfn_to_pde_idx(dfn, level),
-                                 level, PTE_kind_leaf);
+        *contig = pt_update_contig_markers(&table->raw,
+                                           pfn_to_pde_idx(dfn, level),
+                                           level, PTE_kind_leaf);
     }
     else
+    {
         old.pr = false; /* signal "no change" to the caller */
+        *contig = false;
+    }
 
     unmap_domain_page(table);
 
@@ -346,6 +351,7 @@ int amd_iommu_map_page(struct domain *d,
 {
     struct domain_iommu *hd = dom_iommu(d);
     unsigned int level = (IOMMUF_order(flags) / PTE_PER_TABLE_SHIFT) + 1;
+    bool contig;
     int rc;
     unsigned long pt_mfn = 0;
     union amd_iommu_pte old;
@@ -386,8 +392,26 @@ int amd_iommu_map_page(struct domain *d,
 
     /* Install mapping */
     old = set_iommu_pte_present(pt_mfn, dfn_x(dfn), mfn_x(mfn), level,
-                                (flags & IOMMUF_writable),
-                                (flags & IOMMUF_readable));
+                                flags & IOMMUF_writable,
+                                flags & IOMMUF_readable, &contig);
+
+    while ( unlikely(contig) && ++level < hd->arch.amd.paging_mode )
+    {
+        struct page_info *pg = mfn_to_page(_mfn(pt_mfn));
+        unsigned long next_mfn;
+
+        if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn, flush_flags,
+                                false) )
+            BUG();
+        BUG_ON(!pt_mfn);
+
+        next_mfn = mfn_x(mfn) & (~0UL << (PTE_PER_TABLE_SHIFT * (level - 1)));
+        set_iommu_pte_present(pt_mfn, dfn_x(dfn), next_mfn, level,
+                              flags & IOMMUF_writable,
+                              flags & IOMMUF_readable, &contig);
+        *flush_flags |= IOMMU_FLUSHF_modified | IOMMU_FLUSHF_all;
+        iommu_queue_free_pgtable(d, pg);
+    }
 
     spin_unlock(&hd->arch.mapping_lock);
 


