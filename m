Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14427416F33
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 11:41:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195075.347567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThhr-00045s-4L; Fri, 24 Sep 2021 09:41:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195075.347567; Fri, 24 Sep 2021 09:41:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThhr-00042Z-0o; Fri, 24 Sep 2021 09:41:23 +0000
Received: by outflank-mailman (input) for mailman id 195075;
 Fri, 24 Sep 2021 09:41:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mThhp-00042O-8a
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 09:41:21 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c803563d-5602-4e49-962c-0fa09b52f13a;
 Fri, 24 Sep 2021 09:41:20 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-9-CHzz_hOYPzqzag2p5z2rRQ-1; Fri, 24 Sep 2021 11:41:18 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 24 Sep
 2021 09:41:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 09:41:16 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P192CA0013.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 09:41:15 +0000
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
X-Inumbo-ID: c803563d-5602-4e49-962c-0fa09b52f13a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632476479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j5i+Xnl5ocLbmeDxy8GlyB1nTmg2e1vt95em7FKfvfs=;
	b=R6JxTTjjQXJLzTFMFbpM9m7TIJ0oi/w+xnYZmRbHvoyKGYpfeBZbcrAyyhluj5I7DOkTzF
	nVEoGD4TNSnL6C4dpeox0CabXJ0a3gaiSlX1IEFfO4g7FZVb19nO8LAGzqCWix6tVerHAc
	4yTYjG+x8g99MOKXliTFaerZk3u41h8=
X-MC-Unique: CHzz_hOYPzqzag2p5z2rRQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfmE2NI6yWZPw4gn7WuXfXNyIJc/OrADxL2ggFPVYzrZdGyyS6REf6jaUM94VfEE+id6jl10QrBppg9ZJL+voGdBLHd789motWYqjKSOERu2jw70Fj3lzWvDapsx0rTGH+ENC5fT2XnlnpkDdEjiQLtImlTV3rZhO8eLUV5dfP6cxlt+Xl8pD7XZx4KOagDfkfXNASUB+WsSSx7jjkE1WSnNuHdLNzDN/W7mKXALn6SQ/khG9R5UzrZZyns5gaeXDt8eEcCBKHqS4Ly38AvSr7e4gmXV6znZbF/uUXyIuZ/GkxRM/ziVHeIQef0fnz1OMC5tDBv2Fb0Qeak/Y3YzFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=j5i+Xnl5ocLbmeDxy8GlyB1nTmg2e1vt95em7FKfvfs=;
 b=C7is/+7mb5nIeHUkqOtnIxlBqns7FefGH2HzpEUkB5ZN+9JkCdkjMstXwrU55Jfe/b7xXhBFNrFrdGJ0zbxU787YSxE9+0LRG/8V94cr9ib7aFaXoEsd5tCf41GgPRQaQ6ilcvFhgJ0fmeyAbBuTGb6E12GVgohGgPVI/uW0gZvoPXunKgrTrT+2nSGzs+xipHEt7dXKxaGjxhowQwsLxh4CAeXP4w+SPki+d6X1uLUIBobzp0a6CLsElCPD0FIEJU9EjqgNYa9/bR3elHaGDyjJgO/2dw2Ozx/U3k5NP55Hbd3KNzcaISrKfKQBZVDlk3p28ZWVkC9sS8zF4gwrzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 01/18] AMD/IOMMU: have callers specify the target level for
 page table walks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Message-ID: <57abd488-1fa1-8eae-66b9-196f32f7f4be@suse.com>
Date: Fri, 24 Sep 2021 11:41:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P192CA0013.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41438e88-62c3-4c5c-ccd3-08d97f3f7462
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2335CD96E25FC771F080EC56B3A49@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	robe0bU+hsEqZ/FUcX7R7k6vN7TMlO7Wvb0Qx48qQ3ISg+a9ctXgzC16VTFBkWr2KjCA8TsslEDEkY5In/v8K3naVxu2U+6a85mh4DTKJbPhTcjM99xNBT8mgoH63+RLLrsNf3HvPj6MhZIyyDPuSQr7bvN4CFxO+SNkXhGoPDvueyBp/FV+3qvXWHrsu/Rihc/AB1lPQFqmlAsrxWWYGnEqvpAW09Gw/bo82WuuAdxvHKJrIETq5nTJ5glWZ1fRNEGcZRr0e4QSZUePvKXarBOEusE5cw8hpJbWcug955ooWoVhDbpaFnm0lwxzpPmlTHr6x6YgkUd9BLFAFf/JGfKJybYpnowbWErH1ZHkgPfxeKDWIAxVZ7+FqDgLkR0fEYacWYfdodMOLdosj1IDRblWUZS5Ju5XmwD+XwrRxI32xqrkUB5VIr4B7Q4O4/yUkhDY+7pqUvVi3Ot8+OUGx1nSRPsFdGhDMaf0gsXL6b2kyYXYamqEyjCOiy0Y1zavyOzQ69QcOAc6bbMAHjrbilQvevyaPoLeqW9ic5OxiG2wj8RYXyPYlTeN6kAmiYge/G8afHqMN1IswIcl/Y+8LJ5NE2nkwtEMm5MaLCI3sn8pvm6SIAmuCWwPEt2Bo7VL918HA8pn4pvhhfmwf0Z6FXGiKkmlUQRBNTG8AX0KMLkGjtEj7GWXWqhjBOs5HMiZkXsNdJ93qxg5thgRQWwfEgs6L0TgumGahSW434JR1UuSSxhnublBJVVXHbigGgdn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(16576012)(54906003)(66946007)(66556008)(2906002)(66476007)(36756003)(186003)(83380400001)(316002)(5660300002)(8676002)(26005)(38100700002)(86362001)(2616005)(6916009)(956004)(31696002)(31686004)(4326008)(8936002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elByVUdZR0hjZ1RGb3ZBQmlMSThGQ2hzaGdNYzhNdDF2bUtqNVNIandlSk5m?=
 =?utf-8?B?WTJjSFlhRTJGWUgzN0V6MzdsMzFka21MSTlrYXkvY3BhM2RYZ2llSHcyME1z?=
 =?utf-8?B?cDlNdS85V20za3Q4bXE2YXVKVm9DaUUzejB4bEx3UmZMSFpKU2FCa0VCSUhj?=
 =?utf-8?B?SWpuSmk5UFhwYmtBRDBkQ1hBSEhFVnNZZHZhOVlySGJqZTFMeExWSkU2NWFx?=
 =?utf-8?B?YUxWQzhMUnZYN2NmSUFrQlNodm4ycWRnWmN3eXV6ZEZtY0loQkhKTnQwUnpP?=
 =?utf-8?B?WDZrZnViMDJzWUlBTFVsdzBVeDNQRjZDc05ocEdwY0dsZFFlUEE3M0hza2ll?=
 =?utf-8?B?U3VUbWpoM3RKSkdxZStIRkl4R3pXRE14b25nOHBScGQzclVtM3I4UXlYbEVV?=
 =?utf-8?B?dmhxWGlaaEtIQlhTeVJZUHVuamJJNzRRM0hJVlRZYmpHRUpBVXR4TVBVVzZQ?=
 =?utf-8?B?aVZKRzJSRDZrc2xmV2piY041Z1NwcG5sOTVzV3lSUTY1VWtBRmVESnJ6YXVE?=
 =?utf-8?B?ek1WZ2VvZ0ttL3d2ekdPRW1KZDZITU5wd2VHbHNGWktiaWo1cXBZVWR0Tkln?=
 =?utf-8?B?eDNpTEVzc3o4UkUwZ2c5SXdMNXJFenBFdm40Nk1tbkVEUU1YM1VyMmNlZ2Jn?=
 =?utf-8?B?NzhVWUd6OStKOFppbHBkUjkxdTNSd0ZWMStzd1RvdDBzUm9Pa29qdE5uZW91?=
 =?utf-8?B?RWRuVXJVYUJoKzBXMHdOT2VsZGU2YVhGZnZ6ZWNNL0RVL1lrRTZFdGVubFZq?=
 =?utf-8?B?ODJRWEZEVlZxZExzS2R2WFJ5MWFDaXpmUXNrS3lWRHpTVzZMUS83R3d5YXE2?=
 =?utf-8?B?UG9JT1RpcEllVW9KaDVRbXVPUG80U0ZzM21qZ05UTkRmaXBjM0p0V3ZuSGh4?=
 =?utf-8?B?cWxCYlRMMDhteHNJMHlrRzVUMG50NFIrSC84UkY4aWphemJuUCsrRERUMU8v?=
 =?utf-8?B?OXpLMnFyTWxjc0pFY2lqVSszcU5wdW9wbkxjQis4R1FOK0R1enlqb0R2R1A2?=
 =?utf-8?B?WllEYmkxdGpkM01IQVVzU1lyMnlUazVnTEhkdmpmUkFoU0ZHVlhSTGlrcDZy?=
 =?utf-8?B?b3ZVRUZLbVgxV3BpVlk3QldHMGFnaE9nditmZ3NnMWsvblN1dnhLODRlVnRl?=
 =?utf-8?B?R21lL090R3JPSXlMN1E2Q1RZVFhrTnllUUY4SGJqZk1QWGF4eFlkRmxXeGZs?=
 =?utf-8?B?UFgxNWJFRHIzUFFhcldNNEFKQjRZTXdvT2xzRkt3NGExSjA0TmkzNHpuQnpJ?=
 =?utf-8?B?dFJOaC9iWHNIdzBYckV6ay84VWt5SDhNVzRsc2RBV1pjcWdwY21EU1RaZDAy?=
 =?utf-8?B?R0NGUmxCUzBsbEpMa2RkV0NFN21Yd01QR3hucWowVnhSVnMwTitXT05LYmlv?=
 =?utf-8?B?M3k3NjhvRUhtTXpRQk5xTi85YWl1R294Nkh5M1dzS2ppUWd6MnlvY1cwU3F4?=
 =?utf-8?B?MTNwNWNVWDdzSnFzaEZQb2Q0WHlFUjVOSXZLVC82OTh0RVpBWnQ4cFN3dUNM?=
 =?utf-8?B?Y1hZbU1ZcTNwbHlaSGFJM1V1c0NST2tMeVE4QThiVnpIZlFEeDJNNFZyempy?=
 =?utf-8?B?b29GWnJ1VFZTUC9lOUpPNHkrZEQzTFNFNzZhN2w1QlNsaGN5M0RFdk40TXB1?=
 =?utf-8?B?L2szaVJXem1ZdDBNbXZuVTNhcWdaSTJ4a3VIUUtnUldzaFYwOHhqTmlxMHpo?=
 =?utf-8?B?U2NFY2pGNTRaSXpVNFl2dlRtZmtoa0lJeEJvNU02UzJwRFFWYkd0MEVZdGRV?=
 =?utf-8?Q?PtVfsuzxuWJMcKs4l4AaTlDSbuCwwPdCrppRPJr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41438e88-62c3-4c5c-ccd3-08d97f3f7462
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:41:16.3074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qtq42MmFRRpN/+37XxX8+jZ/zvdGnNyleRQg3uglA8dPecz6GPbZCd162iIXLAO6uuGvNfjUnOvqW1eulixIxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

In order to be able to insert/remove super-pages we need to allow
callers of the walking function to specify at which point to stop the
walk. (For now at least gcc will instantiate just a variant of the
function with the parameter eliminated, so effectively no change to
generated code as far as the parameter addition goes.)

Instead of merely adjusting a BUG_ON() condition, convert it into an
error return - there's no reason to crash the entire host in that case.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -178,7 +178,8 @@ void __init iommu_dte_add_device_entry(s
  * page tables.
  */
 static int iommu_pde_from_dfn(struct domain *d, unsigned long dfn,
-                              unsigned long *pt_mfn, bool map)
+                              unsigned int target, unsigned long *pt_mfn,
+                              bool map)
 {
     union amd_iommu_pte *pde, *next_table_vaddr;
     unsigned long  next_table_mfn;
@@ -189,7 +190,8 @@ static int iommu_pde_from_dfn(struct dom
     table = hd->arch.amd.root_table;
     level = hd->arch.amd.paging_mode;
 
-    BUG_ON( table == NULL || level < 1 || level > 6 );
+    if ( !table || target < 1 || level < target || level > 6 )
+        return 1;
 
     /*
      * A frame number past what the current page tables can represent can't
@@ -200,7 +202,7 @@ static int iommu_pde_from_dfn(struct dom
 
     next_table_mfn = mfn_x(page_to_mfn(table));
 
-    while ( level > 1 )
+    while ( level > target )
     {
         unsigned int next_level = level - 1;
 
@@ -307,7 +309,7 @@ int amd_iommu_map_page(struct domain *d,
         return rc;
     }
 
-    if ( iommu_pde_from_dfn(d, dfn_x(dfn), &pt_mfn, true) || !pt_mfn )
+    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, true) || !pt_mfn )
     {
         spin_unlock(&hd->arch.mapping_lock);
         AMD_IOMMU_DEBUG("Invalid IO pagetable entry dfn = %"PRI_dfn"\n",
@@ -340,7 +342,7 @@ int amd_iommu_unmap_page(struct domain *
         return 0;
     }
 
-    if ( iommu_pde_from_dfn(d, dfn_x(dfn), &pt_mfn, false) )
+    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, false) )
     {
         spin_unlock(&hd->arch.mapping_lock);
         AMD_IOMMU_DEBUG("Invalid IO pagetable entry dfn = %"PRI_dfn"\n",


