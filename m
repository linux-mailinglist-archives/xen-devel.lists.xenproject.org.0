Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA42402831
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 14:05:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180913.327792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZqt-00055a-MI; Tue, 07 Sep 2021 12:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180913.327792; Tue, 07 Sep 2021 12:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZqt-00053I-Iq; Tue, 07 Sep 2021 12:05:23 +0000
Received: by outflank-mailman (input) for mailman id 180913;
 Tue, 07 Sep 2021 12:05:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNZqr-00052s-Lz
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 12:05:21 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f79e998-0a83-4c1e-9023-9908260c0db0;
 Tue, 07 Sep 2021 12:05:20 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-YepnUYaDOWWKxsgoltrgHw-2; Tue, 07 Sep 2021 14:05:18 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2607.eurprd04.prod.outlook.com (2603:10a6:800:58::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Tue, 7 Sep
 2021 12:05:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 12:05:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0902CA0012.eurprd09.prod.outlook.com (2603:10a6:200:9b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Tue, 7 Sep 2021 12:05:13 +0000
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
X-Inumbo-ID: 1f79e998-0a83-4c1e-9023-9908260c0db0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631016319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Um9DC69BNNgCMREa9h68z95lfy848yTwNtWb0Y+Y3VA=;
	b=BLW+c6Ug5Z+zwhNlk/YpH1Q5i3ASw5QY84r1mcs4V6bYiJNU3laJcKVtZIcl9oHP82ScLK
	D6QboYd6vhvPJmcv3SUaHQRdGWS9Re/r+c1fbB2PtjmXLTcpUhBY0Ybj5wAy3vYlms8A4s
	/nzD33dXTk8000D6soOGjq/zKYoyX1Q=
X-MC-Unique: YepnUYaDOWWKxsgoltrgHw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmPC5szowPAPAcKQtrFxAUEPkIW1vldLPfpE1mITFMGlnxYUxjnG45p7jkouAGh+wah6/yS2nWVTiLx1AcU8Y8RiO7EOptLW3e7FAl4HxRQCc8W3qOn2P5VHL6z+yMvC3Fjh96JzeY2r7pTi3UrAM1Imi4IfPI/BhP48+N2rQ+XGf/aof+O4JoGzWaUL6Wr/50ZmSHR51GyxH4Z8NXmiJPdKnRlctIOc51w2stDm1Hbzpin6FtL9YpAIEllPB9hrUTpkaxxwbCD4vpMW2MNTpXh133deEewqx3wCAmNVt6nQwfeHweNYOrDhppT65RN3EoA+7L/l98bkFdAJAr0tlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Um9DC69BNNgCMREa9h68z95lfy848yTwNtWb0Y+Y3VA=;
 b=B8vpRUnG/Yg1Rfe5G/aeQCNwpoFRYh3m/0Ei3R4L/33fYRBEtoZHj6vQGFmiZnmwCUHPXWkgZXNNKYNuRX07zeIdO+kVlaTLa1LwOfcPIseu4wsmPl1LNI1PFxBCCYstSXlUPQwQoRM9MkjwouML6cO4BB2khl1FyyycQyA6aZMXjC5dCd/HsuXfIxEsxcsPd7HrsPBJ1RuPNdE3HumwE7GXzqAVKqK/KNrqlEw5wFu/NowcBdBOCVH0hQZogcaeQsO6v+yQUioD0e92VgI5piJMLqMDdomrIzBXpi50ZMyUrIRP/ylR6STk2P9AE70SofFB5UaoL6bbxISXih0hUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: [PATCH 03/12] swiotlb-xen: maintain slab count properly
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
Message-ID: <dc054cb0-bec4-4db0-fc06-c9fc957b6e66@suse.com>
Date: Tue, 7 Sep 2021 14:05:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0902CA0012.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79499601-472e-4206-729e-08d971f7c017
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2607:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2607B10DCB9FFCB2AE85281DB3D39@VI1PR0401MB2607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vHNpV0PXcxqG0FHlMMXWRRspYP4aGcfX0qZtXuA4lZfbuknabNCkJ5tPA1iWVKHTuBhzCg1elOcIHInoUVlhvCh8TDG3yER7hDUDYLfh5B3Bu1B2ARpsO0ZDp5fDZwxQU+4bhDslrr2LVX/rvFvDQ8SXNb4HKjUgF0cvP/IQXq/olNTlFv+Hv4KAHlo03RRwTjx9w+ANl2ZhBZceAZWvqSW2p6IhXqW2o2pTFNERMUboGucFuljw0sMuf8oGrYC7QCsXEJ+i1Aa9lK+iUk6remTJ5x8XqxdyiBC2KF/8WaM1msnuAeYrcozBSFlGNcyxYgDsXHTN3lSGJp+KFGeXQ4wN1+xb7NdTpKaeqXP5kgTTnXnoU75Vw6HQz5ttFj5krhauYFnxmxvmscakJOXCX78IadnivoLvlHxZtqw7vNp3SXrx0swFVxKDOAdFHfJNBRDsd2+dTX+zXoZgKNWmioOCa9U5ySGPpAjkNZNRLijTvPPrSEAHc/0THG1lPeYSZzPKYW7aR79A0v66g/F7yXew239RTf3ev4/hDcdu5o3GCPLIWZOCKBhYj0EbhpoC62ycUUpUsyzcNMHSMopE/2x+jLgpD1CULyLbtlkrrkioe6SwU8S7Qqz75rZNmZkYtLZGkd05mzNYpfuipP6js0a+GQtmDgKnyBuTvcdkbv0wZg/z4un2Q3NTc+QPcYlBQsnHsp8xVWB+SA3gEBbNUdRRv5o2X/+jSRl5WXuIJCA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(346002)(136003)(376002)(396003)(186003)(83380400001)(66476007)(6486002)(31686004)(66946007)(66556008)(26005)(110136005)(54906003)(316002)(16576012)(36756003)(478600001)(2906002)(8936002)(4326008)(86362001)(2616005)(38100700002)(31696002)(956004)(5660300002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2V5UkdMRkZKNGxzWTNTMUtQazlybXdicE9DaHMxbHlVL0RYbnEzSmMrTnY1?=
 =?utf-8?B?ZTlpZWNzVmtiRWl0bSs5UlNndmhiVmp6b2czTkJ2alhtbDdPMVRudVFuTGdG?=
 =?utf-8?B?eHZ0bTJMVkhvTjE1VkFpQ2l4RXErRVJvbDZFUExKb3k5OVBsS0ZpVzYrenZ2?=
 =?utf-8?B?TkNlWXBWVUtKUjlZdVl6aHZMbldoR1hranYrWUFZNFMzWHFVNTdHY2JTMjln?=
 =?utf-8?B?RFE0cjlXTTEzZW45R204NWtsU24yaWh5ZGNVRjlIVkwxVms4Z0tCb3J0aCtY?=
 =?utf-8?B?d3Bad1F3Zk9JMjdRanczUjE5K1RiMTFIdHR1MldDRlBUV0hwZTRaNFVjSk5u?=
 =?utf-8?B?MjNJaWdGVVp4OFlLRkpmb2ptRm9CQ1VaMjdwaXhsV2lYWjJ1OHFjTXVMZytm?=
 =?utf-8?B?c1ZTc3lCaWVuSmFFYkUwWklvYldIeXYrSzlzWlQ2TTFSVlFFWGlURHVIQmNs?=
 =?utf-8?B?NzBCZU1RUVpXL0RLRjBmVSsxdk9zZE1BSUdITW5Fczl6Zkdac1NLZFlnbExB?=
 =?utf-8?B?WHVib1UxMnZWdnByOFl3SnVFUDlpMTdKS1BrdkIxNkVvaHExaXBtS2s4Qnlv?=
 =?utf-8?B?K0NpYVlJWGVGUlpNZldnY2c1SDF6VFdVSFcyVU02SWtIbU9MY2VZSnY0VVBt?=
 =?utf-8?B?VWJJdFcydHgvWXBlY3JDckc3Z0tEUldRQmZYTXZpdTlZSzZsTkowV3NKNmty?=
 =?utf-8?B?bEhiMjV6VW1XVSs1MW5LNmZKaFpjZ0xhK2RBdElRZXp0NFd0d05Ocm5QQVdk?=
 =?utf-8?B?UFVSOFZaalJyb3p2ZUhrWXRDbWhkMlR6bm1xcGF5dDZvT2FLYUNDV1Fidm5R?=
 =?utf-8?B?Z1JPUzdYVldDQ0wyTmt3NVArNDBCeFh6YWtKdklhK3VIU3dyamZ2UXVPdm13?=
 =?utf-8?B?NUQyNFdTbnZHUGZ6aE5QVHRxUTFoZ0ZrSmRhTlJ1R0pzN1FUM2NpYmNvZisw?=
 =?utf-8?B?T2w1YkNibXVKTkQ4RFRzbmw4eUFCNlltUm9BVFdiSHk0anlkc1JMS0g4aW5w?=
 =?utf-8?B?T3BBNlJrWUIzKzRyd1lwL1FyMU1pQ3ozU2RaSnpLMlltLzkzaFd1eUl2cWxU?=
 =?utf-8?B?OHY2T1J2SWkzTGErVXpnZ3NzSjlqMmhMZU02ak4vVCs1M0VySjNIUG9oV1pi?=
 =?utf-8?B?RERhUkZPNVB5R0ZJeis3b0krWlZ2NHpKc2h4c1J4M3NycHFuNWUyQU1QdjRV?=
 =?utf-8?B?SjQxN0RrSzdGWGlGRFZLRnZ4SlE4MHI1Qk1lb1JQb0l4bjF1UGRUQ1ZRcGFz?=
 =?utf-8?B?V2hEdnYxejFqallTUjdLTlQraHIybk5CMkg0U1pBUE5NSlorRlBuZTh6WnZS?=
 =?utf-8?B?OTNaS0g3WFFDYmJrRTNjYzgyS2xQbUlQcnU2QXIwcHZzUENzRVlKMjFac0FP?=
 =?utf-8?B?aWlKVHMzREZadXpka2doUFNOelN0Sm9PTEkxNHo1dUpOSEQzVXg3Uld2NDNY?=
 =?utf-8?B?MXJsUDN5dkJjVTBQSUlNZGZqeWtFUTZmUlo4THhKbk1pQnAwSGZGRWZXdTdH?=
 =?utf-8?B?WjFxRHUyKytvQnR3TzR6UzkyQytwSnFheFNmVWZVTldCcjk0YjVDYTQ1RmFI?=
 =?utf-8?B?bnlXWWZCM1FtTmNzdkx2RWswcjUzeElLalRZby92cStRSDRxMDl2RUxaVzVH?=
 =?utf-8?B?MGxDRUs0NXd0SGRnQ2UxbDltUi8ycHBCaFdrNG5DcUt6b0JxSkRkSEo0Z2Nr?=
 =?utf-8?B?Y2lINlRhdkdmb3BKUk1jcm5UL2UwT3UrVTBGVmRialhnbndkRFdWRFNyNDB1?=
 =?utf-8?Q?+Hjagl0OfzuLIvLEK6P338Gsiqgyig5RUhpYJUT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79499601-472e-4206-729e-08d971f7c017
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 12:05:14.5097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gc8lOrYo7lU2SoL0ccxfi4KFlLO0RxF1duDS9OWQ17m+Aeln5lzfSr5X8ZswULPYs9TvK/ffQPO5cctfDvWSmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2607

Generic swiotlb code makes sure to keep the slab count a multiple of the
number of slabs per segment. Yet even without checking whether any such
assumption is made elsewhere, it is easy to see that xen_swiotlb_fixup()
might alter unrelated memory when calling xen_create_contiguous_region()
for the last segment, when that's not a full one - the function acts on
full order-N regions, not individual pages.

Align the slab count suitably when halving it for a retry. Add a build
time check and a runtime one. Replace the no longer useful local
variable "slabs" by an "order" one calculated just once, outside of the
loop. Re-use "order" for calculating "dma_bits", and change the type of
the latter as well as the one of "i" while touching this anyway.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -106,27 +106,26 @@ static int is_xen_swiotlb_buffer(struct
 
 static int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
 {
-	int i, rc;
-	int dma_bits;
+	int rc;
+	unsigned int order = get_order(IO_TLB_SEGSIZE << IO_TLB_SHIFT);
+	unsigned int i, dma_bits = order + PAGE_SHIFT;
 	dma_addr_t dma_handle;
 	phys_addr_t p = virt_to_phys(buf);
 
-	dma_bits = get_order(IO_TLB_SEGSIZE << IO_TLB_SHIFT) + PAGE_SHIFT;
+	BUILD_BUG_ON(IO_TLB_SEGSIZE & (IO_TLB_SEGSIZE - 1));
+	BUG_ON(nslabs % IO_TLB_SEGSIZE);
 
 	i = 0;
 	do {
-		int slabs = min(nslabs - i, (unsigned long)IO_TLB_SEGSIZE);
-
 		do {
 			rc = xen_create_contiguous_region(
-				p + (i << IO_TLB_SHIFT),
-				get_order(slabs << IO_TLB_SHIFT),
+				p + (i << IO_TLB_SHIFT), order,
 				dma_bits, &dma_handle);
 		} while (rc && dma_bits++ < MAX_DMA_BITS);
 		if (rc)
 			return rc;
 
-		i += slabs;
+		i += IO_TLB_SEGSIZE;
 	} while (i < nslabs);
 	return 0;
 }
@@ -210,7 +209,7 @@ retry:
 error:
 	if (repeat--) {
 		/* Min is 2MB */
-		nslabs = max(1024UL, (nslabs >> 1));
+		nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
 		bytes = nslabs << IO_TLB_SHIFT;
 		pr_info("Lowering to %luMB\n", bytes >> 20);
 		goto retry;
@@ -245,7 +244,7 @@ retry:
 		memblock_free(__pa(start), PAGE_ALIGN(bytes));
 		if (repeat--) {
 			/* Min is 2MB */
-			nslabs = max(1024UL, (nslabs >> 1));
+			nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
 			bytes = nslabs << IO_TLB_SHIFT;
 			pr_info("Lowering to %luMB\n", bytes >> 20);
 			goto retry;


