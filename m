Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC49416F99
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 11:52:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195144.347700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThsU-0004Bg-BN; Fri, 24 Sep 2021 09:52:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195144.347700; Fri, 24 Sep 2021 09:52:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThsU-00049M-7O; Fri, 24 Sep 2021 09:52:22 +0000
Received: by outflank-mailman (input) for mailman id 195144;
 Fri, 24 Sep 2021 09:52:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mThsT-00049B-1v
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 09:52:21 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b5fe4a0-1d1d-11ec-bab9-12813bfff9fa;
 Fri, 24 Sep 2021 09:52:20 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-rp95dWVnOrSOvTMBGECgbQ-1; Fri, 24 Sep 2021 11:52:17 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2446.eurprd04.prod.outlook.com (2603:10a6:800:4e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Fri, 24 Sep
 2021 09:52:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 09:52:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.8 via Frontend Transport; Fri, 24 Sep 2021 09:52:14 +0000
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
X-Inumbo-ID: 1b5fe4a0-1d1d-11ec-bab9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632477139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oST90GrSEuah3sHHpzoExF0h0tTGYRPH7JQTtrWQFzA=;
	b=lKMsaJc6tSnA6HMssLBmjxejkKnBAEYEzzHz6YsVTNFz3SadxtYL17JJaxzx3s43mcrNBq
	qFrwaba/yzdP1WSgeoAi9TaaJ7+z+k5vaxV1KiRjwel+tqY07irs1/O1BncMyDsRLiOA4Y
	IZ/AbQc/ZJ6zwYv1UcwT+3bqjZTtY88=
X-MC-Unique: rp95dWVnOrSOvTMBGECgbQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4GPuwzlsFl9x7jmEt9rZ3agxzqa+iKMQmOKPWhD6ygP7v4h8mqBw+QRMLAi7hkmlPCBpA1XFoSXhteuTWkBApCUBEKsSxJFYuREcvh6Wvx91XhGqeHzDZMMI3Fph+3ASCrgonTJM9fYqgUh6w0lhF2XSb0yWo1sbnocq+LR27k2FlP/RjGgKE1darIHzL7ON+MK4XZGpTAagmSbE7Dlj2HNu5xki4TaygFDcwlBNDB7oxKhBlaChiySJPcZj6fbqdRy0Dd3A8SEFyX39oxs9Wmn4pYiDnNGQ2UpbK1E/E74fDBsTDZBt2qCclKIIh4D077CFEI0Zif4ehAhqVOx2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oST90GrSEuah3sHHpzoExF0h0tTGYRPH7JQTtrWQFzA=;
 b=XDZ6Ivb/mzdCULOa/2mug9/D2bBLlgsjsqV5lhQKGxDKJVdN2QG6gLaW7HGhOCS6IBHbjmNrLeYa6a3ntWp30/LGMQCywl5gXykbqkjE5KdppEAgG6kxUSa8sDXRUiHUfxKOTe6VtAjKUT150FESQsaIxqNKpsXPdq9/wYJO2vff73cie2/9NPbJDFbtYKdYDmHRst/bMp6ukCme9Pk+64hrn40qCgHFkT1yIiNe8AQcs+yJ06/BfnRU83QT7JENQZV6TamX7YM8WwaAzhHpUlF1kcWxPTMsK5xypu3ex8z+LZlBDhlZAXKRmL6LO9YYo84E7J3JQvtGcjmVx4opog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 12/18] AMD/IOMMU: allow use of superpage mappings
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Message-ID: <cc93398d-982a-edbc-4ddd-b5459cef8f9a@suse.com>
Date: Fri, 24 Sep 2021 11:52:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a89f903f-cb29-40e6-b50f-08d97f40fd59
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2446:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB24468DF29910A86232D20DD5B3A49@VI1PR0401MB2446.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T1NSOBLFumlTC1xyJ8gqsFeoolks4xg3OAoXVOD5bGTIcrepoW+G4+4x1ZVv2wB04i73lbfphY3JZ58JlBhET/4wEZRUnLRcLCLrHepfH57frmIBX5bgcz7UcObaYB11ikgqHiWwVIMh/f1L95vVZLLgGCn0EXNIzbCh2qt/Dm7hym4lVznojHfG7rfpUEIiIvhZprJwUTvm4ZGZlLdSiiLgG6WuQ6lwZY8bruRwXnKmZOKcOUSuAu1l23/ONYhwv7GhywmCPN2xw+ksKIkZOCHgkFF0Qurm/DjR1HWUYkKEXL4wNqN0RNPx9lmO4RfhW6NLlhjo+VFs2PsFjx9tj/ThClMP+HRYPp//bqtcuEviuXnkOS1c+fyQIop4WvMC49KGABhkLzImxxPTnabjDDVkIiIYDmYsjz8KXBxY4FyhilwSLDH/BZ6XjtPolC5hhWU8Ra1Lh1YnPTZBqxpqogaPVJOhPxO/kHvtO7vgFGw+O+HYKMXOvrT7n/7nbzG/SJxrhibipodJpjzHSlKhgvF59GtjK+BjptU7S36Z7H+Qcz6zNs3/sbXAuspVbQ5z3bCdeukp110P0577atZkHD+nSRWhBccUOvXPemKHqUC5ZilkmoK/otV0fMeTgXtNWpM6AFoOId3SsqRDYnmZwUpB9IVusIzrnng4r5B/xbzCrdwnshN/j0Oj/IfZG2MKgEQK14x0R1PBdafOtViP0jfwLAN9mLe6SqScRacU/pQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(956004)(4326008)(5660300002)(16576012)(6486002)(66946007)(186003)(2616005)(54906003)(6916009)(86362001)(8676002)(38100700002)(66476007)(36756003)(66556008)(31696002)(83380400001)(2906002)(26005)(31686004)(316002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0dzUmJwekxyeWVTRnZDWE8rN3h6NEFDZ1poWXVoeDQ1ZkhNMitseTZxUjFw?=
 =?utf-8?B?UGhCZVNnc2RuMngxbEJzeGNRbDhrLzBRbGk0WkdZeUhsSlRXYkJJaEhIRVc4?=
 =?utf-8?B?RFo4TlBTN09VK0wvRFVJdWhWUFdRdUtnWEZaMUl4elRvYnFoRkZOaExZNXp6?=
 =?utf-8?B?WTRtRGVieElpWElIQkZzMWRQaGwvTGVTTFI4WVVwd2JvdXRIWmFEZ0JEQW9s?=
 =?utf-8?B?a1JDSHlGY3Yyd0NiRmRDcVA5ODJrUlBSTnlSUFBXb2dndXlWTXNBOUloVkgw?=
 =?utf-8?B?UThXMnZHd2NDUjc2SkR0Y1hmd3ZvdEgyZGRsNDl3YUZDRDRyWDF0anhCU3hF?=
 =?utf-8?B?UXQvc0I3ejBIYmJtSlZldml1WEhCbHFlQ0xQM3hjcEtNQzg3UlZ2bVRDczJY?=
 =?utf-8?B?UHkrODNNS2NScWV0YmFWUnI1K3YxL1NueHN1S01YMU1BTEhNTnRpWkNXYXFy?=
 =?utf-8?B?ZVVMQ0RmYzFyMnh3dWpSWnY2RTZOdk1BN3V5OXRDQjNWMlFRT1FkanZOYTZi?=
 =?utf-8?B?TkNucEhJdHk4Mzc5ZmlISW9HOURZWjVBc0tEN3M3dnkwdHkrOEhTWk9IblhX?=
 =?utf-8?B?WFVybmdzWnRVQVdFU2lMZktpRXZpc1pWR21EQmRjRi9hSXg5djhyeFZES3Iy?=
 =?utf-8?B?UDZ1TWpzcXNyTldTQUlOZU01RW5uQUVabko4Uit1eEZmbkRNUzM5WVdVck00?=
 =?utf-8?B?Y3c1NWpxVlZScE9hYWQzSlcvcUJaYk5TUStiNmxOMUFMcVRkL05weWk3NjJ2?=
 =?utf-8?B?a3QwaEZycWFRMGFRc1p1N2ZwK3V6cGNjdDBGeGE0WC8yVWhGZXBmUDZDK2Fs?=
 =?utf-8?B?elU4Y2s2WS9PbjMxNkJsc2RGaFFVVy8xS2RYVzZ0NnR6NzVTMklEYkduREZI?=
 =?utf-8?B?eTBPSEJOR1FKbEhEcURkcVNoaUkxT0JtcXRMaHdYTFhRYmxwVExxOGdwMG52?=
 =?utf-8?B?Uk9RaXRDbkhJVk5UTE5yMDZpeGdDZGZkVmZwdW5mOEI4NktQeXh4RWRscjA5?=
 =?utf-8?B?QXFMSkdLSjFnbTZ4eWNFcVRDWHRnMEFyUUtzaDUxbmorRVNnNG5vU2dubEox?=
 =?utf-8?B?NUUxTXFmdXl3VmREQVJiS3hjcG9CWUlMUzBEUEtkeThSa095YlhNR2NWOWVT?=
 =?utf-8?B?UGxPVGNiOWJGYm9lYzFOWHp6WVllYVlEc1Mvb3BhSUVFMFZLVWNoY2ZmeXlN?=
 =?utf-8?B?L1k0a0h0YzJxNjl5UzlXdHo0dWVFY3orOFFYc3k2ekhRWk5SSHIwUGYrRC96?=
 =?utf-8?B?VXVHcndnVFo5VThpS3VCSEVYN0lUaVFDWkQrcnlzY2ZCVmJTL3FTZnozdStE?=
 =?utf-8?B?c3UyUWZ3bzh6aVlORUNwTmh5ZXZlZHlSdmtNVmxsaHkxVHZ5ZUwxYkc4SEZO?=
 =?utf-8?B?K0ZpNzA0SVFQenEvNnVycEhaVm90UndzY3lPejdPOHdiUEQxNW1UbiszVjIw?=
 =?utf-8?B?Uk9nS1pHakRNbzJKSWlJUFdXUUZHWG10bDc5dzhKeEZ5cEFCYndwMit0YkFv?=
 =?utf-8?B?eTJ3S0pTdHp2ZjlyWFpLSjhXLzYrK3dJbHBJOVFoMmZTTE1FTDFvQ1cvZmJF?=
 =?utf-8?B?aUsvTmhLTktzNHVPTHpUaWJZcGdoZWN0V3dBMXlYR1VDOWZ4Z3l5amsrekc0?=
 =?utf-8?B?em5rdHRYQ052THFFS0hvRkRVOXFiVHNCdnEvNTJQS29QclhEMk9QUDRZa1Fj?=
 =?utf-8?B?TitZRDBvVFcxdXlMRUpjYXdsVzdEL1dwYzVXZExqaC9TSjZ0S2liZDBRdUVG?=
 =?utf-8?Q?n4fpGwHE8OX/z2+Ubdt8aNxlnd5xaxQpG1tYevo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a89f903f-cb29-40e6-b50f-08d97f40fd59
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:52:15.6354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vtqpuih0nbd3ev1MRJB+9xT4LCKFyc1v8tGozTtCRf7WKTtd/WmLESutc2OsOiPDieyJYGt6+YdIiLd82TwftA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2446

No separate feature flags exist which would control availability of
these; the only restriction is HATS (establishing the maximum number of
page table levels in general), and even that has a lower bound of 4.
Thus we can unconditionally announce 2M, 1G, and 512G mappings. (Via
non-default page sizes the implementation in principle permits arbitrary
size mappings, but these require multiple identical leaf PTEs to be
written, which isn't all that different from having to write multiple
consecutive PTEs with increasing frame numbers. IMO that's therefore
beneficial only on hardware where suitable TLBs exist; I'm unaware of
such hardware.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm not fully sure about allowing 512G mappings: The scheduling-for-
freeing of intermediate page tables can take quite a while when
replacing a tree of 4k mappings by a single 512G one. Plus (or otoh)
there's no present code path via which 512G chunks of memory could be
allocated (and hence mapped) anyway.

--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -32,12 +32,13 @@ static unsigned int pfn_to_pde_idx(unsig
 }
 
 static union amd_iommu_pte clear_iommu_pte_present(unsigned long l1_mfn,
-                                                   unsigned long dfn)
+                                                   unsigned long dfn,
+                                                   unsigned int level)
 {
     union amd_iommu_pte *table, *pte, old;
 
     table = map_domain_page(_mfn(l1_mfn));
-    pte = &table[pfn_to_pde_idx(dfn, 1)];
+    pte = &table[pfn_to_pde_idx(dfn, level)];
     old = *pte;
 
     write_atomic(&pte->raw, 0);
@@ -288,10 +289,31 @@ static int iommu_pde_from_dfn(struct dom
     return 0;
 }
 
+static void queue_free_pt(struct domain *d, mfn_t mfn, unsigned int next_level)
+{
+    if ( next_level > 1 )
+    {
+        union amd_iommu_pte *pt = map_domain_page(mfn);
+        unsigned int i;
+
+        for ( i = 0; i < PTE_PER_TABLE_SIZE; ++i )
+            if ( pt[i].pr && pt[i].next_level )
+            {
+                ASSERT(pt[i].next_level < next_level);
+                queue_free_pt(d, _mfn(pt[i].mfn), pt[i].next_level);
+            }
+
+        unmap_domain_page(pt);
+    }
+
+    iommu_queue_free_pgtable(d, mfn_to_page(mfn));
+}
+
 int amd_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
                        unsigned int flags, unsigned int *flush_flags)
 {
     struct domain_iommu *hd = dom_iommu(d);
+    unsigned int level = (IOMMUF_order(flags) / PTE_PER_TABLE_SHIFT) + 1;
     int rc;
     unsigned long pt_mfn = 0;
     union amd_iommu_pte old;
@@ -320,7 +342,7 @@ int amd_iommu_map_page(struct domain *d,
         return rc;
     }
 
-    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, flush_flags, true) ||
+    if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn, flush_flags, true) ||
          !pt_mfn )
     {
         spin_unlock(&hd->arch.mapping_lock);
@@ -330,8 +352,8 @@ int amd_iommu_map_page(struct domain *d,
         return -EFAULT;
     }
 
-    /* Install 4k mapping */
-    old = set_iommu_pte_present(pt_mfn, dfn_x(dfn), mfn_x(mfn), 1,
+    /* Install mapping */
+    old = set_iommu_pte_present(pt_mfn, dfn_x(dfn), mfn_x(mfn), level,
                                 (flags & IOMMUF_writable),
                                 (flags & IOMMUF_readable));
 
@@ -339,8 +361,13 @@ int amd_iommu_map_page(struct domain *d,
 
     *flush_flags |= IOMMU_FLUSHF_added;
     if ( old.pr )
+    {
         *flush_flags |= IOMMU_FLUSHF_modified;
 
+        if ( level > 1 && old.next_level )
+            queue_free_pt(d, _mfn(old.mfn), old.next_level);
+    }
+
     return 0;
 }
 
@@ -349,6 +376,7 @@ int amd_iommu_unmap_page(struct domain *
 {
     unsigned long pt_mfn = 0;
     struct domain_iommu *hd = dom_iommu(d);
+    unsigned int level = (order / PTE_PER_TABLE_SHIFT) + 1;
     union amd_iommu_pte old = {};
 
     spin_lock(&hd->arch.mapping_lock);
@@ -359,7 +387,7 @@ int amd_iommu_unmap_page(struct domain *
         return 0;
     }
 
-    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, flush_flags, false) )
+    if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn, flush_flags, false) )
     {
         spin_unlock(&hd->arch.mapping_lock);
         AMD_IOMMU_DEBUG("Invalid IO pagetable entry dfn = %"PRI_dfn"\n",
@@ -371,14 +399,19 @@ int amd_iommu_unmap_page(struct domain *
     if ( pt_mfn )
     {
         /* Mark PTE as 'page not present'. */
-        old = clear_iommu_pte_present(pt_mfn, dfn_x(dfn));
+        old = clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level);
     }
 
     spin_unlock(&hd->arch.mapping_lock);
 
     if ( old.pr )
+    {
         *flush_flags |= IOMMU_FLUSHF_modified;
 
+        if ( level > 1 && old.next_level )
+            queue_free_pt(d, _mfn(old.mfn), old.next_level);
+    }
+
     return 0;
 }
 
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -630,7 +630,7 @@ static void amd_dump_page_tables(struct
 }
 
 static const struct iommu_ops __initconstrel _iommu_ops = {
-    .page_sizes = PAGE_SIZE_4K,
+    .page_sizes = PAGE_SIZE_4K | PAGE_SIZE_2M | PAGE_SIZE_1G | PAGE_SIZE_512G,
     .init = amd_iommu_domain_init,
     .hwdom_init = amd_iommu_hwdom_init,
     .quarantine_init = amd_iommu_quarantine_init,
--- a/xen/include/xen/page-defs.h
+++ b/xen/include/xen/page-defs.h
@@ -21,4 +21,19 @@
 #define PAGE_MASK_64K               PAGE_MASK_GRAN(64K)
 #define PAGE_ALIGN_64K(addr)        PAGE_ALIGN_GRAN(64K, addr)
 
+#define PAGE_SHIFT_2M               21
+#define PAGE_SIZE_2M                PAGE_SIZE_GRAN(2M)
+#define PAGE_MASK_2M                PAGE_MASK_GRAN(2M)
+#define PAGE_ALIGN_2M(addr)         PAGE_ALIGN_GRAN(2M, addr)
+
+#define PAGE_SHIFT_1G               30
+#define PAGE_SIZE_1G                PAGE_SIZE_GRAN(1G)
+#define PAGE_MASK_1G                PAGE_MASK_GRAN(1G)
+#define PAGE_ALIGN_1G(addr)         PAGE_ALIGN_GRAN(1G, addr)
+
+#define PAGE_SHIFT_512G             39
+#define PAGE_SIZE_512G              PAGE_SIZE_GRAN(512G)
+#define PAGE_MASK_512G              PAGE_MASK_GRAN(512G)
+#define PAGE_ALIGN_512G(addr)       PAGE_ALIGN_GRAN(512G, addr)
+
 #endif /* __XEN_PAGE_DEFS_H__ */


