Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4709B50DB35
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 10:30:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312479.529730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niu7E-0004X2-Bs; Mon, 25 Apr 2022 08:30:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312479.529730; Mon, 25 Apr 2022 08:30:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niu7E-0004TQ-7s; Mon, 25 Apr 2022 08:30:40 +0000
Received: by outflank-mailman (input) for mailman id 312479;
 Mon, 25 Apr 2022 08:30:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niu7C-0004TG-3k
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 08:30:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb625731-c471-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 10:30:37 +0200 (CEST)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2172.outbound.protection.outlook.com [104.47.51.172]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-N9J2nGXnOXyZKBl-HY7EaA-1; Mon, 25 Apr 2022 10:30:34 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR0402MB3355.eurprd04.prod.outlook.com (2603:10a6:7:81::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 08:30:32 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 08:30:32 +0000
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
X-Inumbo-ID: fb625731-c471-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650875436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=auT+iHb+14B5DSUBAnnO1f63YotPDBxUCIQdd1daVCQ=;
	b=BvnAvvdXorHlNXPqO0Gcc33yToHVkXVD9ADZ1+dAoErPIiy0kgh4qaF6Pvv4cKe1AkPxD5
	s0LteGnF6Rz9XMXdJEo8Wn35D0Z0Kt9jOLgzBHvAD046FMrq9Px6Cd5Qiyi2pkFc1qEs+A
	fX3QpQfg75zJaFjnZ/J1sjPtou8GSUQ=
X-MC-Unique: N9J2nGXnOXyZKBl-HY7EaA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W8ISYQKoqRhrdnvlD6ztHf03SR2TYQaYd+zN3O+7vR9MdyJem5BOf1Rs1E/TGlgk1lZP2GRjarvkPA6jkanIY0taYYaJ1/+Cscd74mHyFfmGagSa1RW0Ert//Sajd+RidRoshl326qo2gpBl4Fz+5+OjTfastat8aEniOCC/XcVbC7otQEl7KsFlKqyKuV45GpfT4d+BBeZgtpA//2pBAZu9RZXA3ZbslzamTdIrH0KSutMBjkbsyn0eqy4shhBW4Y0FLq24M/v26WGRcomsHzOCxenGvoH0MZQtYOL23MLYjhZL9RhsWB/mAJ5ueMCF9mkt8qP2XzYvJBsND1Me9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auT+iHb+14B5DSUBAnnO1f63YotPDBxUCIQdd1daVCQ=;
 b=KwUE1AYIyP3gjap9B32YKMnqeHp4fny8SovKioxF06tJnxP+yJpcwcM9BTJgDVOhPEqWkKz8wp/93BwT7a04GiJF5oyME0JZWwnyEVUa/uNnW2A5tFLWK86Ls52E5bRInJRLtYgHJoxGxMRzv1ed9u5721knwVbbkAEZISYti1LQ3PqS7zmU9v9bEwu1+Vn0Ek5o9hsRfB/ZS27t3L9KSeYnJHmJ6Lsf3h8nSVCR8NBtCAOi/ad9mOQHPUpy01MtWjmtNbxKO/vrDdUI58D5azA7/Y33zOfOYtVO3AS+f2OLXw9FNM4sH98YyWuOCSki6j3jyIP54XSXw7fXfeaoIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0dec8285-a348-53d4-f9fa-552c7c1c405f@suse.com>
Date: Mon, 25 Apr 2022 10:30:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v4 01/21] AMD/IOMMU: correct potentially-UB shifts
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
In-Reply-To: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0252.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::27) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd287a59-cfb3-406b-7fdf-08da2695dd0f
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3355:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB3355983C97EC3A127EF9A787B3F89@HE1PR0402MB3355.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aOZWqanjAFeSC14fiTf50/yViFalVpIbBgHXbPsvM7nQzrhMUX/ZMAOuU6ZHQ6IeCYO7sULvQrind2+zUZbbGVuUuEYp8VsxI2vI2qdfMA9x8RsRoljtchGhA2wPct5DfnALbruhBctpkmRBXkSVgrkN8lfc+8MRSwwz8fm5Mi5VxyBfrScSL3LvhBFSBAaPfYPvM7Seuc1JS6L6P0gu3UEF5wV3h9UIz2bNX6v9HO3P2WI0mc3knJylHDNePRKubuA4IRN65UW0HlDb8a+gv9WJboplD0BfF8Q7Su8LRcbAy9L0I0Fh6O9kpYNC5bTHu1FKylsaV5TmelCE0L5umW4HUQUfzfeG89Km9ZtiDGx2zUmsgAOFLDZHRJchpn7PeY1OKSJt5W5K3nV3xkXiPK1JXM1wSTUCtMh79lF2O9Eb2GemuK1HEJ2ftmpUCnnuAg35MVUec6mw04P/Xgary5D9PFts9aYadU6t5wa1cFNQCERTFL70/hXApU3P7RpT9xJVe5QyaPBceY1nShmi93w2h2var0j2bOYbNuZ/u8RcL9g9eKhpgR6iEzmSaLsYiJhrGDD/Stmx09Pxz634W16i+c4nKCXiLL3f7TfFtCMBbzc7FgOlO6YlxPVUQ9kUKC3HQOPxw/iFDacZalGs+3Ets9zJZoxB8QbmxFKwcQGzd3PQd4g2GdYtxyL0NzkzrkBJXr1hPXbrEh61uAbiXBYvW7Xepzwh0obJ+EOG0UXIc1PpI3GZbuo3u2sjjlx9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(86362001)(6512007)(6506007)(31686004)(26005)(2616005)(186003)(31696002)(8936002)(4326008)(66476007)(66556008)(8676002)(38100700002)(5660300002)(2906002)(66946007)(36756003)(6486002)(508600001)(316002)(6916009)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2dZaXpsQkRwOUhhVVVIUkwzTXh5bVd6RSsrVWZ5L2hDNUU5Yml6bm9SQzVF?=
 =?utf-8?B?VjZhWmdMUXRITE5HblRaVXRGcTNZVlpHN2dlNFZWVlBYZGVwRm5SUUxzNktl?=
 =?utf-8?B?Sng0bk9RV0J5dVhRM2I5OHJXTVhsU0YvVUp2aXNjanl3VVJYMm1tUEw2b0E1?=
 =?utf-8?B?VG45UkZ6ejV1ODloaERPb3J1Ukdsdlo4V3dWMnpTUUF4SkY2SFJqSmdaRC9l?=
 =?utf-8?B?bEtpMi9McHJTSkdkcldUT0pDeVYrRlh3Y09LNWlLeGRwVng1M1FiVXBZYUMy?=
 =?utf-8?B?bDZGR3Z1aVNlVnUxekJyamNwSzRGTnhYa3g1bFY1b25md3VwZmRBMXg2U211?=
 =?utf-8?B?alRrRDg3dFYrTlJFYXRER0lNcE9PL2hHY25JY1BUMnJ0dU9LNS95eFJKMjhK?=
 =?utf-8?B?WHZyYWpEZDBxWHdVeFdsNldwbUR2OExPNXArMnBCWC9CVWFzL0VFRFNxTXJE?=
 =?utf-8?B?VkVhN0dXbThQYkU3emhtaTNrSjhqMmk2d3JiYkp6RExZNEpISFZlUG56NWJV?=
 =?utf-8?B?NHRJUDU0Rkg2Rmdhb28xRUQ2WldMQzdwejJ1cVIwTSs1d3VzTGhxWkRycnpz?=
 =?utf-8?B?UVNxenFvRVVTZHdRb05ocTRkWUVhM2d0eWRGR0hBVzJqckp5UUhJQXZYSkZi?=
 =?utf-8?B?NjVNbnowcmtSTnFlU2FWMVVYV0FMWEptRlZOU25pQzQveTJTNGJxd0RzZTM4?=
 =?utf-8?B?d1VKRVRsR3pXcjYvK3ZjWFBIMzErTXJYLzhNem9ob2ZGR2N2V090SVFOU2lM?=
 =?utf-8?B?R1BJaFlGZXpHSVVZakRFYjNTdDNyOFpBZkZCRk1kS3M4TGY4ekNZbVhLZkdR?=
 =?utf-8?B?VzY3OFZlcUdZdG0reDRKemg4UDRTbk0zaSsxYmxGUkJpRVlvbXdYTUV5L24w?=
 =?utf-8?B?WU9scGYyd3ZGWTB3aUJ3RTZUQTNNL0hlQVE0MG5ZZmxkVkxxQzA5S3pEOWdr?=
 =?utf-8?B?cVkxenU5MXBnQ2FTcW9nSmEwK2tMa0txVEFMMkFUb0hMa3dnZkNlYnl3b1Ju?=
 =?utf-8?B?bUFZZlZpdGNWNFJ4VUx3SGRtUjVIQWt4bDAvczJyR3BuTytuc2tYeVkrT1My?=
 =?utf-8?B?Vk45b2t2eXU3ZmtZWTlmZUt0ME55R3phYmxnTlI2WmFNOExLdFJqSWJ0clNS?=
 =?utf-8?B?TDhSRFlVNmdqdWY0SXFQMVpCWTFLOWpLSlRhekRhVnVrOG1GU0ZHRjdxQlVH?=
 =?utf-8?B?ejErTG5yZnpyOXhRL3JNakpNSFluK0JyOTh1U21BY0E4SUN3MXI5VUhmUW9n?=
 =?utf-8?B?eVFHOGJ4R2c2aFdnbForN2p6eE9Nc3B1dWtlMWE0eUVXRlhvRS9kZ2dTSFVS?=
 =?utf-8?B?YysrWEFkRVFTdW51bEVHdHlLS21iOHpPaC9Yb0xGQUduQ1puZ0pSRm5ycFVu?=
 =?utf-8?B?MXZqbzJSdWxmNTVEbjBCcnVwamdHVHBZU2lkWkEzelUwdnFmMUhsMHdYR09j?=
 =?utf-8?B?VnRwR09FVFdwMk1OMW43YnZYUDJnRHVWTElWck42bGdsVXhkOHJEY3Z3S21t?=
 =?utf-8?B?QnNpeGFhWmQvYUxNcXpOeGlsNEN0VnIyVjNFTG9TOXdZZkJkajdIVkVHWUJE?=
 =?utf-8?B?VzFDRVE1ZEt4YjZQNEpkZlZ5UkF1Y05UK0tQRmdadG5MU0lwMkhJVWtYRkVD?=
 =?utf-8?B?NldUMXliRG80WXRJek5rZE82dENyMm9CdGhRRjdITG9aSlUwM3pyR1lFWFpj?=
 =?utf-8?B?eW0ydXMrTzRNR29rWnlmaDBDcFdkZ0dxSUJOcXVobGxpQitFWW40eE9sUUt0?=
 =?utf-8?B?aHJzOUdHSlV3WFQvc1JqSDRSaDlpUTBYR25rNzlDcTgrYlZzTFo5NzFKSUdI?=
 =?utf-8?B?VFZUL1k4enZkS1RoT3N6ZHRvKytURjFoQVd0QlFvdVErOWNYL1dTWXo4dVFS?=
 =?utf-8?B?OWpyWW4vdXpCWC9WdSs1aDhmZ09aM1h5Q1Q0L1FWLzBkWjl4TFRvYWpud0hy?=
 =?utf-8?B?eUZhK2lIWUU3Y2U3RVNmMVplYjhoK0wxSkxmTElBSGZ0VzhBT1hrTERybExy?=
 =?utf-8?B?bys1OWpYeXY4bktKeXc4R3lDTGlZNDMxNlBRMXYxMFdwRzJSTEozWlJhQ0tK?=
 =?utf-8?B?QmNDQ0hnU2pGQkxia281a3dyZ1JHc0hia3VsV2kwdWZBWHB1OFBTaFBzNmg0?=
 =?utf-8?B?ZUQzeS94TWV6QVA5cHNRaTZFZ1FNazYrSVhudXVMdk1MdEFvVCt3L2NBbS85?=
 =?utf-8?B?aEdJRkZRSzgvM1BpUU04NlNEWnFEaENiaXRheWE0bHJ4NWZmWlgxYThDdEIw?=
 =?utf-8?B?ejh6aDVWS2t2Q0Faa1ljVkZDSXJnSmpTS21FMTIrV0xjV1hzT1NHbnMwU3JU?=
 =?utf-8?B?ckdpeGxLZU1aOGNFbXNRWnhRNDBxckFFeE80dExrUnl1NDN6elcwUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd287a59-cfb3-406b-7fdf-08da2695dd0f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 08:30:32.8515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VIn1ipyJvC2Y/8mYpU9Fr/M1q1bw54pS1X6NgB2IkGWSeJRjW1BJpDvWCjFo95jkY2dLtPF2LH2sBzmHYKT4Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3355

Recent changes (likely 5fafa6cf529a ["AMD/IOMMU: have callers specify
the target level for page table walks"]) have made Coverity notice a
shift count in iommu_pde_from_dfn() which might in theory grow too
large. While this isn't a problem in practice, address the concern
nevertheless to not leave dangling breakage in case very large
superpages would be enabled at some point.

Coverity ID: 1504264

While there also address a similar issue in set_iommu_ptes_present().
It's not clear to me why Coverity hasn't spotted that one.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: New.

--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -89,11 +89,11 @@ static unsigned int set_iommu_ptes_prese
                                            bool iw, bool ir)
 {
     union amd_iommu_pte *table, *pde;
-    unsigned int page_sz, flush_flags = 0;
+    unsigned long page_sz = 1UL << (PTE_PER_TABLE_SHIFT * (pde_level - 1));
+    unsigned int flush_flags = 0;
 
     table = map_domain_page(_mfn(pt_mfn));
     pde = &table[pfn_to_pde_idx(dfn, pde_level)];
-    page_sz = 1U << (PTE_PER_TABLE_SHIFT * (pde_level - 1));
 
     if ( (void *)(pde + nr_ptes) > (void *)table + PAGE_SIZE )
     {
@@ -281,7 +281,7 @@ static int iommu_pde_from_dfn(struct dom
         {
             unsigned long mfn, pfn;
 
-            pfn =  dfn & ~((1 << (PTE_PER_TABLE_SHIFT * next_level)) - 1);
+            pfn = dfn & ~((1UL << (PTE_PER_TABLE_SHIFT * next_level)) - 1);
             mfn = next_table_mfn;
 
             /* allocate lower level page table */


