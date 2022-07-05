Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0441566ED9
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 15:01:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361227.590624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8iAO-0004QQ-Ka; Tue, 05 Jul 2022 13:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361227.590624; Tue, 05 Jul 2022 13:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8iAO-0004NM-H9; Tue, 05 Jul 2022 13:00:36 +0000
Received: by outflank-mailman (input) for mailman id 361227;
 Tue, 05 Jul 2022 13:00:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8hyn-0004qy-Ur
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 12:48:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2063.outbound.protection.outlook.com [40.107.22.63])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c96e42c6-fc60-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 14:48:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5252.eurprd04.prod.outlook.com (2603:10a6:208:cf::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 12:48:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 12:48:35 +0000
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
X-Inumbo-ID: c96e42c6-fc60-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajwuKEErqwOf+V2F7YvoAcykl8DqtjgQifohKABtslu2USb/UFNflYPkcQQkRj74jiZU5XEIa4DdXRiLIpcYeNFOBZVZ35JUOy1MXshtJym74vRM6Ad70fupGr9ZECSyrWYNTsexW4iUmRa3rAM8sX543gJkCUhiH48E8fJygmFSXDrpSuSlQ/vYAAkKxHMmB+v9Xk+trO81WOMMRRt5fJ6TOBpmYX/sf1JpqeiOdF5ztLLvDuTCkf/Lma/t27G5nh5K78lhBcq8J3zh8Avp5j4Ng1Uu/+c/J+PM3t8WXUv9VtQPHHdK9ni5/NdwR9kFkaJP4jmaFFYWFBbWW052Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XpBKX8iKhA8N8952sSDbijOunJ7uuUUiGIDbjZy4Htk=;
 b=funM8mhIJ2zr5xlbGL9FNPtmj1BQ2C23JG9GiMQhiuSz486SAf3oaM7vfYC/OYO1HEnFvZU5ivNwM0ySdbN3IEGkCHdtJ68BckWgbUZfwftwXGPYM2Ew7CEVBZqEeL0eorp7tJ5Tc6w3uhfFtd5pFjXcLC5tVIbLmSce6/p3QoHy5Y83F8ZV0PlykP2IpzqTOWZPjzKNydvepQ1UHowqJrrvNEMLg9+g3U38UP1N0m6PtwR7Ni6/pbf/44R3S8Jg/p4FBBSZuUiyEmfWWDATqzz9MwTi+R4LLTNcmrjO7QHqHY4lr8pAvLGTM9b52AMPwSSyEAwSvMndY7fv9OwayA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpBKX8iKhA8N8952sSDbijOunJ7uuUUiGIDbjZy4Htk=;
 b=B49s2NSJ+fJWQjplxkhKpCQ79poQQU7FuVM7AFFA49ELi7diiJ/ZB4xx6001tRAgXb1KpRlJ7aeLf4ENFbu0pIN3MHV0ct/jdeswnQQiSbFEttue0OUYYiGlbjhSuGA3RdcOGtoz52Nhul2KMuK72C5Apmo9LIxmXW3wDPG835CukJ57tN60fB4c9woZ+iwUtroeA/lmBgauZ/d8BnakqicDNLYjTqMRn4PPQEq87v2tG0U1nnikG5iMG5BO/QfBDDNaeuNHd7Sftd4H4oC2Ii7MDdNH+9D2kQOQgrKZkaa8Y7FuNSh1lxEmcIAhbzoNwsk2RO8wUUKbjKhXBnZT0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <718906a5-8c18-530a-89f5-02e2a2efb211@suse.com>
Date: Tue, 5 Jul 2022 14:48:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH v7 11/14] AMD/IOMMU: replace all-contiguous page tables by
 superpage mappings
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
In-Reply-To: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0088.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::33) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f85225a-3cf5-43fe-6ab7-08da5e84acea
X-MS-TrafficTypeDiagnostic: AM0PR04MB5252:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uxDCH4822zfGqegMWWKTfmt9Df5EsE8dBIA0oU6ou9sJTEFON6vx83cwdpFMVv5QCW8H0PetM6mJZXNZa4IZuuQ3cG7ichVMN4AomUjFxvKbO8qr2p9ZwUaeUXx6kuss8NzWRQ0EOyze5RO/wJ5UWphZQPnZKnZbceHWmzZ2qQ/PpiO8guKtBAzT25zyg8Y4KH+UM0kBUX31s6YTwJl1Jfj1k2HJ2D0LqB2SApHC0W1HvinmWR/hnGY3GsBzxT1n5ZrRaLpBAM7L59REf7PMCfn0qFTIzBUjCvJiP0YIn/zu31CcJxSiW0qGx2zs0e5gfUhdpuoIEG+4swUa7i/94lcesp5kuEVo6kAwBYCt+PLgM07lhRKDOS+fRfV/Wf8J9I3RZiwhgnEj6870TUJ0qfZRtKkxmwQxPaQviUj5bOtln7joNN1vLmXMg7RdBJvisXllvzfVsA6Cgrq/PNj7myoJ1fBEdvS1SwmLCe2Vcz9n+EIhbX/nfVk9902huRGq0fQSO5R8Cht2aFX+mA4g/gFBRc9M1VY2sCwn0TS2RRHzH3Grxr0J1EU+/Cyd7bljYr51RYh/cd/flIqaIXmvmkJHVy1feTPufo9r/1TBJUbMNOkVUYj+wUieJ94GS6XxYzEG9xWyjdP3eiPEXI82aVPBeEIk31OeXgJxxT6lR2tQvzgH2np0+qja94m5A66BolG6SXkwqCBiI5GX8g6PDdO2+G8Epj1h/lBprf8tOppzQwkTd08PVqBvP7XXMvjJGUxcsQ77+iW1Ju4mWbEXKuMjNxvsvPG0afaWRw+yi4oXI5pF+KngAXyDIVKDS8AVcFUUyG3KV6YH/Ydyb592wkJ5ApyEJTGR4xh/yF7jfsc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(376002)(396003)(366004)(39860400002)(478600001)(5660300002)(8936002)(6916009)(54906003)(316002)(86362001)(31696002)(6486002)(66946007)(4326008)(66476007)(8676002)(66556008)(31686004)(2906002)(83380400001)(2616005)(186003)(6512007)(26005)(38100700002)(41300700001)(6506007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2t1SUFYUFg4TUNyQWY0MnVNWVJQTWhNNWpQejJCdkdzN0ZKWG93SWFOY1Fx?=
 =?utf-8?B?Szk3NDQzUThhNEZzQjZ4aWRqRDIrQjdQZHhwOEY3S3ZDa2wzYmtaNmRlSEJN?=
 =?utf-8?B?VHNPc0FrejdjSGtpS1lRU0ZldDhqbEhhZ2ZTc1lZMFhDbTdDZUQySFovTGkr?=
 =?utf-8?B?cjNROVlQVGRKT3pMQnNQQzRpaEhzUkl0a3FIL0s3amFGbXZXdEpZdnAwRFZJ?=
 =?utf-8?B?TnZ5Yk1aUlBlQ2Q5U3p2NHVhR1FVNGZqSmxCZ0NrWnV1aWlQa2NaU0I2aENi?=
 =?utf-8?B?T2M0SjVrMUhpL29RWmxmVXBaZVdJaGRhYk5CRzhSeCtwNzN6TXQzakJ3Q1cx?=
 =?utf-8?B?Wm1LdllJNzFiYU0ycU9iWkFpQnBLU3JzVjY2ZSs4WjVzZGkzZ0R0a3lYRExm?=
 =?utf-8?B?ZHRLKyt4c2h4cFk2MlFuSmZVUnRzWGcvUGFDa0pzOExtTGdraXF1YitOaHA4?=
 =?utf-8?B?NlVZOThyZ2ZVUjdCZ1VlcUw3ZE9yb3E2Y3Z1ejZaSzloMFo3V3lxN21tSWwr?=
 =?utf-8?B?NGovemNkYm1ZUHlQRDV4czBic1FUQ21rSnZlTU1BT1VIMTJOWmJOcFBvOUlU?=
 =?utf-8?B?dXdMNENBTjlOL05pU2tFYWExeGdXd2tWMzl6eHk4MDlQTU91T2c3aVdWZTZN?=
 =?utf-8?B?Tjh5WmVHTkc4RmhnelFGUUFLR0hMVCtYR1lHK3dyM1FQRUZZVUk0ajZFUFp6?=
 =?utf-8?B?Y0hJRG9LSFcrUzVJNzYwMEg4Q2hhK2xBd3FCa0tTY3EyVFNCRkNsSVhaU2R6?=
 =?utf-8?B?Qkorc1E2SXErajhHK1h3U1M4bjVoNHIwZGdRUVFKUlF4MHNIWjJmdml6OXY4?=
 =?utf-8?B?bmpxMEtkNTM2S3BNSmhFOWdRT1NCV29ybGNLZE5mVFJmVmswZ2l4THZhM2xr?=
 =?utf-8?B?ZDlZM0NwRmtkUHpnT1lRV0psalhTTEplSjlTcCtyaDZJRjZTeXFjdWgwZnZF?=
 =?utf-8?B?Qit3NTVHb3MzRkxPYnNtaHdUZjhQUFQxVys0T09uR2szaTg5MzB4eTZnbEdU?=
 =?utf-8?B?VHRZRmk5TTVObzQyL0pMdmZrdllrZk1NYnB0OVc5K3dXSzlKUnZ5M1Z4U2x0?=
 =?utf-8?B?aEhPSURjMWkrd1FMMFUrK1hYODE4RjFOdEJNYXM0UnkvS1dpazV1Z2RvTVVv?=
 =?utf-8?B?Tld3VlFxTW5scXpweFFkcDRMZFdQUUdidG04RXF0Rm10a0xLc1RWc0dBY1dT?=
 =?utf-8?B?V3gzOGhhVkIzUi9SR1pIMWxVWUxrYndRMWNkZ2ZOUENFZGE4WWI3M2FrOEcz?=
 =?utf-8?B?aUk0UjFRUGF4UEVtRGc1RW56TmJBb3hRTTBhdmJlUkhNQjF6Q3NZa2Zia2pw?=
 =?utf-8?B?dkRUV0hUR0E2ci9LOGhHS0NvS25kVXkrUjlkZGwxNnMxT3hWZk9wcitmZXNp?=
 =?utf-8?B?YjNFV0x2TGN2RE0xdVZsMWNUUDRZNnJEYzFJWnJtc0FtQXdSUDUrbFBFYmlB?=
 =?utf-8?B?aHJoT0NRSFd3eGRkTlBGUnpPS3dkV0c0eFBDb1NKZUxsMUJwc1JseGpwSWdk?=
 =?utf-8?B?YjhxZGVmS25xZFNNL2c3TzBvRCsyeHFENEVnNHZBNzRWd0NaaFlWRmQ4aTJx?=
 =?utf-8?B?RTZwNnd3OWh6QzliUDZyeXlzOElmVWdzQ1FtUGt3a2tuNGtEQXJoODRsSzlV?=
 =?utf-8?B?TXBXZDRpWDZlSUdrM1QzcDJjMkpFZ0srTXg5VzdFUFJ4d3hQK01JMjhFTE4v?=
 =?utf-8?B?OFp5Y1F2VUhHVEs0S2k1eEF2bkxLQVNveStKSGpnbyt3WTBFeGtTYjE3NXNi?=
 =?utf-8?B?V2NRRmU1OEQ5TU5iN3MwMUY0MEpIeURiWFBkemtUeE9XRk0rN2liVWV4MXZE?=
 =?utf-8?B?bnQxajVGeWkrQ1Flc2w2anNFMURBdVE0aXkvR20zamZPNjlMbzU2NEQrTFhs?=
 =?utf-8?B?cml1QWlwRlNTUGQrVEl3MUU5WjFrc0JKVmhSQkxxQ2xDeThVNGZ2alNtY2pk?=
 =?utf-8?B?b2UwMnBYczlKRnpjR1dJNnFzWmxUV1h5SjVVRmk3MzcybW05c1htL3gyUGdh?=
 =?utf-8?B?TXh4U1JxdS9nNm1MNk9TbmFaNEVkZXR6L0tUdWJGQWNFd3dwV05uSmd2Tlo5?=
 =?utf-8?B?QVlhUDYwcW5JOW9jZGRIaDBIeHBnbkdvNU0xOWUxTUJ4Ujl2QlY1WUx1ZWVo?=
 =?utf-8?Q?a2e8V2BMHpBaZoxPsCb8IqNH9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f85225a-3cf5-43fe-6ab7-08da5e84acea
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 12:48:35.7646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQeUTZTONFt65igDhM9wTsdtbm77WfCIlCF2SJ5qPlvHvKhq+pH9fDp7QlyKyh4+yjH/H6P4zO/CPrm5hf53+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5252

When a page table ends up with all contiguous entries (including all
identical attributes), it can be replaced by a superpage entry at the
next higher level. The page table itself can then be scheduled for
freeing.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
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
v4: Re-base over changes earlier in the series.
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
 
@@ -409,6 +414,7 @@ int cf_check amd_iommu_map_page(
 {
     struct domain_iommu *hd = dom_iommu(d);
     unsigned int level = (IOMMUF_order(flags) / PTE_PER_TABLE_SHIFT) + 1;
+    bool contig;
     int rc;
     unsigned long pt_mfn = 0;
     union amd_iommu_pte old;
@@ -452,8 +458,26 @@ int cf_check amd_iommu_map_page(
 
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
+        iommu_queue_free_pgtable(hd, pg);
+    }
 
     spin_unlock(&hd->arch.mapping_lock);
 


