Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD6C3B4454
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 15:22:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147213.271213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwlmU-0004Iq-Il; Fri, 25 Jun 2021 13:22:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147213.271213; Fri, 25 Jun 2021 13:22:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwlmU-0004Gr-Dx; Fri, 25 Jun 2021 13:22:02 +0000
Received: by outflank-mailman (input) for mailman id 147213;
 Fri, 25 Jun 2021 13:22:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBOo=LT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lwlmT-0004Gh-6o
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 13:22:01 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84cdf138-2e4b-46d1-a03f-d1c54c9931a4;
 Fri, 25 Jun 2021 13:21:59 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-sO_3WyecO7G_D3lXkY5Abw-1; Fri, 25 Jun 2021 15:21:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3390.eurprd04.prod.outlook.com (2603:10a6:803:9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Fri, 25 Jun
 2021 13:21:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.020; Fri, 25 Jun 2021
 13:21:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0033.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 13:21:52 +0000
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
X-Inumbo-ID: 84cdf138-2e4b-46d1-a03f-d1c54c9931a4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624627318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PbQU7L3blROF4Klwca7Ybd+xUlO1Dcp9UzFdRq08MR0=;
	b=FOGgr17uLUjtBjs2F1/wa4MPF0imzwETTWH+zFDwi2Tdv/dJMxxQ6lkJ6buSqx/YbP/zib
	sT+2WkKVeDJXemFqkSAFixzT/ZtUKpziGc1x7VCYe9Elaq6wc0BEP6evzdSnT6M6upEobZ
	a4KSlQoklEWGOgQj6HDHUZb/rPr+2xM=
X-MC-Unique: sO_3WyecO7G_D3lXkY5Abw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lsp6pvv3guHOqAtB/HnwkkKJhiFHZ9nC8kgH5RRUCTZ/H09RNWk2/VlNhlkbUhj4AHnMcCTS5BaoMtjOzsqrMHe65BNk+30cx1ZD8cpe2hajYyxd3jfKNZRmNkfFBUUCaS/VP2tFb5kABlVaHv/Tuk4tMlwW+IqYqa8hl5sN1FS1/7ZwKuWIWHdNcmw2FMSe7ZDUXQVZ+lr1tJMbfShD7x4R6nqVuwF67DbGDJRy1OIfmJUXOLtAbI4vSX+sPGyI2D9lVkcbUGVwDvTsBhKkaw5sehMZFihgwAOmaR5yYG9ABx1m3pFfCicx2jBVQcz6ufAKWhlPRhf+1sh60RAGTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbQU7L3blROF4Klwca7Ybd+xUlO1Dcp9UzFdRq08MR0=;
 b=KOux2M4bh0KVcZNpd8aEnLDVwnicoJvv6Rxyxav2/FnGMDdiyDr9nT4TQt8YbvLbpnFhUT3OmS4frnOCjwxlFc7L0Y0J0KtD+UwLL8HXa2K5kKAWUMyW/2QhvpdiIoFNZdlAQBUlwoGzrdYryWsC9OUuWRNiM+WOZxoJaXnB7wBapa1M/S2iczM2ad8dEGYCTeVkNCVTmTv5bEuIAe9wZ7cnNhe/10pLitzUbUfdp/xhY67NnC2o3CWQ87pu6YSaLb4DW6USIG5qfhCNTmksVVOEgZRrI8t0xgmvRQrDHefI1G0BgGL5/UwotyOmiiTZJazikQ3/L5g5CUQdOApAlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 09/12] x86/paging: supply more useful log-dirty page count
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
Message-ID: <7871d13b-2ad3-2eb4-8148-dbf6a88fdcdd@suse.com>
Date: Fri, 25 Jun 2021 15:21:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P189CA0033.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a0655b0-48ed-4d07-bdd8-08d937dc32c4
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3390:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3390174A8D0A48E86BE35855B3069@VI1PR0402MB3390.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7yZyeSDTHTO/a+dgTlW7Lcua7qXCmfqPgcRncxMGQM/mag2RWzjI+ZI5Ar8OPvPFr8P6kj8HK1DDWzb/4+6Sms2FWSnxufkN+NuGi8LnaRATc7ag5RBvpJ7+tFzGEzXKd8hl4dXwNpidAGcACeGHUFOamHXZoI+6Y8B0gYb54/Ki2n/hSomIvbKdq5z5T14WyB47m5SXbH7sH0qLIr+PupiKiZDbeT7Ukdy698c7TOXVeLzfV5girQxB+NPWYYHIUAa6eQJsKUeMQPQXtWdhOB+XOkQ1Cj6dOiPM59SBPLLQ4xF3DmVJGmdC9T8uFw4u4XXQ4RS8/fDC7sgaE5GF1iewFZxmxKe/0tJKJ7rAy9Z2Bn4sSvXCeNWUHlCEX4FhtfdMlIYE8oD0mIicQihQdSy3lFkYSreH9ZmTZKDQJewFVMWGxdu5wHmlIlE6N/p/akfTA3AOYdnQ2i5QBu0NIz8TnPWtuLc1nlYJLDI1e8NHUHLW4A2VZsCOEMBaI+Zeln3wnkGNS9tGxnG0HMmFKMKuxqsU1Y9pHQ37Rl4IVW/VfnoqSVDa3ead5BqwrRzpFDbNSUt+NIw1GE2Gs7g05nLPonLz+rQ0HFgrH+x41pnf0Se9YJTvL21O4xOi0ALHgzn0BR61GPjpSxfo5Z1PENxpNraETnO0dX+JTdNJbOWGa5ySvBYs9OZ96sVNQK9Qmp4xkEzPB6M7T5Sd8oB9PQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(39860400002)(346002)(366004)(396003)(16526019)(36756003)(83380400001)(30864003)(26005)(4326008)(186003)(31686004)(8936002)(478600001)(54906003)(86362001)(2906002)(66946007)(38100700002)(16576012)(956004)(6486002)(8676002)(5660300002)(6916009)(66556008)(66476007)(31696002)(316002)(2616005)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUQ3RWVJTkxtTGpQZjAwWkt4SW5JSGNBNS9abUI5Rm9HSWdCa2NyK0tRTGJq?=
 =?utf-8?B?VXBNTE9kRDZnUEJjZEJMZDY3Q2VBcko0bE1BTWFTSXFhbDVFTnFNUXA0Mmo3?=
 =?utf-8?B?clNmRDQxWXRKa1l1OE1mcng0QXRyOHlpV1h0YXhYcmlVOWp6L0E0ekxrZ3cw?=
 =?utf-8?B?SXRUNG9yVEhVb200Z0NqSjlmeDVPZlVNbGxqMHNwaHRkd1c5U0tkRTVhVGxB?=
 =?utf-8?B?MjgzcEMycXFoNlJ4RFVxRzE3L1NLcEl3NTRjTTNZMzdtNzdHeVc1UE1md3pQ?=
 =?utf-8?B?cUZkUXNCZXNyWFd0SHczWlJXQ3M4UUJodGo0aGNPRTJ4enVCa2pVWk1WQ2Jl?=
 =?utf-8?B?SUkydGRBc3M3Q3dpVjJLbTg3NG9QQzJLNHVyOXRRWVdKU1M1K3RkZ0txNi9i?=
 =?utf-8?B?SXMxNkJrQisxbkR3STQyc25Bb0RaVThTU1VPN0g2TzJwYW9IeFp2Rk45WjFF?=
 =?utf-8?B?cEpncko1a1k4TGFtUGFqVnp2UjQwTGVqZUZVUzhaR2thNmN6TGhValdSWVJV?=
 =?utf-8?B?RHp3am56TzBVbVBNMkhCeitJQVdHQU9tUG93VHJnWnpmZ3dnQVhUR0FQYVVz?=
 =?utf-8?B?Um9PWjZRZTU3OXNFMnBuVGxDK01TZmJFMUt1M0ZISllEbXEzcUxsVW1NaWZZ?=
 =?utf-8?B?REpmSE50ZGJOcTRQc1ZYT2R1WDJEa3MyK2dsRmVmcVIxUVMyNWVDdzRIV29S?=
 =?utf-8?B?SGdielJBSUtmNkR0aVIvNis1QTdzVmR1M3NKd0JCbzh3N0M3ajBXaVhpcGpt?=
 =?utf-8?B?NmJ5blM5Ui96VTc2T2h0MlI2bG1qbGc2ckl3Q3N2YUZJVURIYm9sdVBVYUhN?=
 =?utf-8?B?bVo2M2MyV2RHZExuci9NME9WVUVjNmRvZ051OXNCbGIvUUZKU2RBS29pWTl6?=
 =?utf-8?B?M09hSjhJakRDS3dlcVo2S1lRYXhOSW5sQ2RhK09ZY2RMeWVxU2gzbFRmclQ1?=
 =?utf-8?B?ZjZpRXhQMFpFdkUwdGJaUnFpSHdNcFNpc3ZKQy84OGowV2pxQnJTckYrVm9X?=
 =?utf-8?B?dkY2dFNZck1QTEhXUFM4eWhiOGp0M0ZDYzJvOXFVUzNoMUgwK1hCNDlFZHlU?=
 =?utf-8?B?UzdhU01ValBRSUdFTVVLa1lweGR3cXpwazd1MU9pZFY0VHRYMGtzZTlLS2Nx?=
 =?utf-8?B?VERJbHlYSzZzMmlhcE5VaHJYQU8xUE9abWpzK3VGMXF4cHd4bFRVYXp4V25z?=
 =?utf-8?B?amhXS2g5THFOcW9ld1FkYzYxaWdWclJGOGRBYVZIaTRsMGVhNkRXMFVyaGhM?=
 =?utf-8?B?V2xuT2FZejRxcGROeDhnd1psYTJ3clNaOVA4enJId1B4b3pkRTZUSU9HdUpV?=
 =?utf-8?B?Qm5DMlp0WlBjOGIwak4zanhmRXB2L05wNllaQ2pTSzZML0JleVZJZ2U4YjhS?=
 =?utf-8?B?dEZXamdVb0tMWWUyMXdXYmJjL0tNMGNEa2hVWG1kT1V5bGZNaUxuWU8wQVVT?=
 =?utf-8?B?ZXBqb0lzUlMvS3RLZ3QyWW1jMk84WWQ3RGpCSXNuUnZQRHptZ25oZzlxbnFn?=
 =?utf-8?B?SVU2UmVBNVJmZkptMWY2VjhrcTZqd0xCVWxCcEFZQnQ2OE1MNkdQNTA5ZXE0?=
 =?utf-8?B?dEpGZ2lUaFUrYklKOFRTWDh5U3dTZjJpV1hTRFF2S0dFTnJpaGdaajhZa2gw?=
 =?utf-8?B?NjE0L1k4b2NCdXYyeC9zTGZQZDZScTJiNi9QZWhEMFNtR2s5ZHlxSmVCTnBl?=
 =?utf-8?B?ZWJkT2VoTTNydWE2bWhZS3U1bkRFZlF2OElPeGFvWDFQcnpaQmpPZlkrdnpV?=
 =?utf-8?Q?PR16sI4/17PJajBganMCx8VbwM0ipTxXH1cGfhi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a0655b0-48ed-4d07-bdd8-08d937dc32c4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 13:21:53.5362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /DpKGtYNaFR7pKBjk1Pb0gsK3Auf4aYktG3F+qhF48v3DonqogNFHOo/8qvqAgiPOQrE8z8gG7olEj4uHy5bpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3390

In paging_log_dirty_op(), always update the count of pages field:
- if more pages were specified than the guest has ever accessed (HVM) or
  marked part of the p2m (PV), there's no point for the caller to
  inspect bits beyond the one for that last page,
- if the guest's p2m size has grown in the meantime, the caller would
  have no indication that it may not have caught all dirty bits.

Also exit the loop once having passed the last valid GFN. To balance
overhead and savings, do this before inspecting a new L2 table.

Adjust libxenguest accordingly, albeit these changes are necessary only
for guests which actually alter their P2M size while under migration.
They do, however, additionally open up the option of the hypervisor
eventually zapping large ranges of trailing zeros from the bitmap when
providing it back to the tools.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course this still is far from ideal: At the very least a perhaps
large tail of zeros could very well also result in a reduced page
count.

--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -237,7 +237,16 @@ struct xc_sr_context
             /* Further debugging information in the stream. */
             bool debug;
 
+            /*
+             * Counts of bits (each representing a guest page), expressing
+             * respectively
+             * - obtained P2M size,
+             * - allocated bitmap size,
+             * - range actually filled with valid data.
+             */
             unsigned long p2m_size;
+            unsigned long p2m_alloc_size;
+            unsigned long p2m_used_size;
 
             struct precopy_stats stats;
 
@@ -245,6 +254,7 @@ struct xc_sr_context
             unsigned int nr_batch_pfns;
             unsigned long *deferred_pages;
             unsigned long nr_deferred_pages;
+            unsigned long used_deferred_pages;
             xc_hypercall_buffer_t dirty_bitmap_hbuf;
         } save;
 
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -450,7 +450,8 @@ static int send_checkpoint_dirty_pfn_lis
     xc_interface *xch = ctx->xch;
     int rc = -1;
     unsigned int count, written;
-    unsigned long i;
+    unsigned long i, p2m_size;
+    long long ret;
     uint64_t *pfns = NULL;
     struct iovec *iov = NULL;
     struct xc_sr_record rec = {
@@ -459,22 +460,29 @@ static int send_checkpoint_dirty_pfn_lis
     DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                     &ctx->restore.dirty_bitmap_hbuf);
 
-    if ( xc_logdirty_control(
-             xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_CLEAN,
-             HYPERCALL_BUFFER(dirty_bitmap), ctx->restore.p2m_size,
-             0, NULL) != ctx->restore.p2m_size )
+    ret = xc_logdirty_control(
+              xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_CLEAN,
+              HYPERCALL_BUFFER(dirty_bitmap), ctx->restore.p2m_size,
+              0, NULL);
+    if ( ret < 0 )
     {
         PERROR("Failed to retrieve logdirty bitmap");
         goto err;
     }
+    if ( ret > ctx->restore.p2m_size )
+    {
+        ERROR("Guest has grown its p2m too much");
+        goto err;
+    }
+    p2m_size = ret;
 
-    for ( i = 0, count = 0; i < ctx->restore.p2m_size; i++ )
+    for ( i = 0, count = 0; i < p2m_size; i++ )
     {
         if ( test_bit(i, dirty_bitmap) && !++count )
             break;
     }
 
-    if ( i < ctx->restore.p2m_size )
+    if ( i < p2m_size )
     {
         ERROR("Too many dirty pfns");
         goto err;
@@ -495,7 +503,7 @@ static int send_checkpoint_dirty_pfn_lis
         goto err;
     }
 
-    for ( i = 0, written = 0; i < ctx->restore.p2m_size; ++i )
+    for ( i = 0, written = 0; i < p2m_size; ++i )
     {
         if ( !test_bit(i, dirty_bitmap) )
             continue;
@@ -739,8 +747,10 @@ static int setup(struct xc_sr_context *c
 
     if ( ctx->stream_type == XC_STREAM_COLO )
     {
+        unsigned long pages = NRPAGES(bitmap_size(ctx->restore.p2m_size));
+
         dirty_bitmap = xc_hypercall_buffer_alloc_pages(
-            xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->restore.p2m_size)));
+            xch, dirty_bitmap, pages);
 
         if ( !dirty_bitmap )
         {
@@ -748,6 +758,8 @@ static int setup(struct xc_sr_context *c
             rc = -1;
             goto err;
         }
+
+        ctx->restore.p2m_size = pages << (PAGE_SHIFT + 3);
     }
 
     rc = ctx->restore.ops.setup(ctx);
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -74,6 +74,16 @@ static int write_checkpoint_record(struc
     return write_record(ctx, &checkpoint);
 }
 
+static void update_deferred_pages(struct xc_sr_context *ctx, xen_pfn_t pfn)
+{
+    if ( !ctx->save.deferred_pages )
+        return;
+    set_bit(pfn, ctx->save.deferred_pages);
+    ++ctx->save.nr_deferred_pages;
+    if ( pfn >= ctx->save.used_deferred_pages )
+        ctx->save.used_deferred_pages = pfn + 1;
+}
+
 /*
  * Writes a batch of memory as a PAGE_DATA record into the stream.  The batch
  * is constructed in ctx->save.batch_pfns.
@@ -130,11 +140,8 @@ static int write_batch(struct xc_sr_cont
                                                       ctx->save.batch_pfns[i]);
 
         /* Likely a ballooned page. */
-        if ( mfns[i] == INVALID_MFN && ctx->save.deferred_pages )
-        {
-            set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_pages);
-            ++ctx->save.nr_deferred_pages;
-        }
+        if ( mfns[i] == INVALID_MFN )
+            update_deferred_pages(ctx, ctx->save.batch_pfns[i]);
     }
 
     rc = xc_get_pfn_type_batch(xch, ctx->domid, nr_pfns, types);
@@ -196,12 +203,7 @@ static int write_batch(struct xc_sr_cont
             {
                 if ( rc == -1 && errno == EAGAIN )
                 {
-                    if ( ctx->save.deferred_pages )
-                    {
-                        set_bit(ctx->save.batch_pfns[i],
-                                ctx->save.deferred_pages);
-                        ++ctx->save.nr_deferred_pages;
-                    }
+                    update_deferred_pages(ctx, ctx->save.batch_pfns[i]);
                     types[i] = XEN_DOMCTL_PFINFO_XTAB;
                     --nr_pages;
                 }
@@ -369,7 +371,7 @@ static int suspend_domain(struct xc_sr_c
  * Send a subset of pages in the guests p2m, according to the dirty bitmap.
  * Used for each subsequent iteration of the live migration loop.
  *
- * Bitmap is bounded by p2m_size.
+ * Bitmap is bounded by p2m_alloc_size, but populated only up to p2m_used_size.
  */
 static int send_dirty_pages(struct xc_sr_context *ctx,
                             unsigned long entries, bool all_dirty)
@@ -381,7 +383,10 @@ static int send_dirty_pages(struct xc_sr
     DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                     &ctx->save.dirty_bitmap_hbuf);
 
-    for ( p = 0, written = 0; p < ctx->save.p2m_size; ++p )
+    if ( all_dirty )
+        ctx->save.p2m_used_size = ctx->save.p2m_size;
+
+    for ( p = 0, written = 0; p < ctx->save.p2m_used_size; ++p )
     {
         if ( !all_dirty && !test_bit(p, dirty_bitmap) )
             continue;
@@ -526,6 +531,8 @@ static int send_memory_live(struct xc_sr
 
     for ( ; ; )
     {
+        long long ret;
+
         policy_decision = precopy_policy(*policy_stats, data);
         x++;
 
@@ -552,15 +559,23 @@ static int send_memory_live(struct xc_sr
         if ( policy_decision != XGS_POLICY_CONTINUE_PRECOPY )
             break;
 
-        if ( xc_logdirty_control(
-                 xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_CLEAN,
-                 &ctx->save.dirty_bitmap_hbuf, ctx->save.p2m_size,
-                 0, &stats) != ctx->save.p2m_size )
+        ret = xc_logdirty_control(
+                  xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_CLEAN,
+                  &ctx->save.dirty_bitmap_hbuf, ctx->save.p2m_alloc_size,
+                  0, &stats);
+        if ( ret < 0 )
         {
             PERROR("Failed to retrieve logdirty bitmap");
             rc = -1;
             goto out;
         }
+        if ( ret > ctx->save.p2m_alloc_size )
+        {
+            ERROR("Guest has grown its p2m too much");
+            rc = -1;
+            goto out;
+        }
+        ctx->save.p2m_used_size = ret;
 
         policy_stats->dirty_count = stats.dirty_count;
 
@@ -614,7 +629,7 @@ static int colo_merge_secondary_dirty_bi
     for ( i = 0; i < count; i++ )
     {
         pfn = pfns[i];
-        if ( pfn >= ctx->save.p2m_size )
+        if ( pfn >= ctx->save.p2m_alloc_size )
         {
             PERROR("Invalid pfn 0x%" PRIx64, pfn);
             rc = -1;
@@ -642,6 +657,7 @@ static int suspend_and_send_dirty(struct
     xc_shadow_op_stats_t stats;
     char *progress_str = NULL;
     int rc;
+    long long ret;
     DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                     &ctx->save.dirty_bitmap_hbuf);
 
@@ -649,16 +665,22 @@ static int suspend_and_send_dirty(struct
     if ( rc )
         goto out;
 
-    if ( xc_logdirty_control(
-             xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_CLEAN,
-             HYPERCALL_BUFFER(dirty_bitmap), ctx->save.p2m_size,
-             XEN_DOMCTL_SHADOW_LOGDIRTY_FINAL, &stats) !=
-         ctx->save.p2m_size )
+    ret = xc_logdirty_control(
+              xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_CLEAN,
+              HYPERCALL_BUFFER(dirty_bitmap), ctx->save.p2m_alloc_size,
+              XEN_DOMCTL_SHADOW_LOGDIRTY_FINAL, &stats);
+    if ( ret < 0 )
     {
         PERROR("Failed to retrieve logdirty bitmap");
         rc = -1;
         goto out;
     }
+    if ( ret > ctx->save.p2m_alloc_size )
+    {
+        ERROR("Guest has grown its p2m too much");
+        rc = -1;
+        goto out;
+    }
 
     if ( ctx->save.live )
     {
@@ -670,7 +692,8 @@ static int suspend_and_send_dirty(struct
         xc_set_progress_prefix(xch, "Checkpointed save");
 
     if ( ctx->save.deferred_pages )
-        bitmap_or(dirty_bitmap, ctx->save.deferred_pages, ctx->save.p2m_size);
+        bitmap_or(dirty_bitmap, ctx->save.deferred_pages, ctx->save.p2m_alloc_size);
+    ctx->save.p2m_used_size = MAX(ret, ctx->save.used_deferred_pages);
 
     if ( !ctx->save.live && ctx->stream_type == XC_STREAM_COLO )
     {
@@ -688,8 +711,9 @@ static int suspend_and_send_dirty(struct
         goto out;
 
     if ( ctx->save.deferred_pages )
-        bitmap_clear(ctx->save.deferred_pages, ctx->save.p2m_size);
+        bitmap_clear(ctx->save.deferred_pages, ctx->save.p2m_alloc_size);
     ctx->save.nr_deferred_pages = 0;
+    ctx->save.used_deferred_pages = 0;
 
  out:
     xc_set_progress_prefix(xch, NULL);
@@ -702,6 +726,7 @@ static int verify_frames(struct xc_sr_co
     xc_interface *xch = ctx->xch;
     xc_shadow_op_stats_t stats;
     int rc;
+    long long ret;
     struct xc_sr_record rec = { .type = REC_TYPE_VERIFY };
 
     DPRINTF("Enabling verify mode");
@@ -715,15 +740,18 @@ static int verify_frames(struct xc_sr_co
     if ( rc )
         goto out;
 
-    if ( xc_logdirty_control(
-             xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_PEEK,
-             &ctx->save.dirty_bitmap_hbuf, ctx->save.p2m_size,
-             0, &stats) != ctx->save.p2m_size )
+    ret = xc_logdirty_control(
+              xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_PEEK,
+              &ctx->save.dirty_bitmap_hbuf, ctx->save.p2m_alloc_size,
+              0, &stats);
+    if ( ret < 0 )
     {
         PERROR("Failed to retrieve logdirty bitmap");
         rc = -1;
         goto out;
     }
+    if ( ret > ctx->save.p2m_alloc_size )
+        IPRINTF("Guest has grown its p2m too much");
 
     DPRINTF("  Further stats: faults %u, dirty %u",
             stats.fault_count, stats.dirty_count);
@@ -804,13 +832,14 @@ static int setup(struct xc_sr_context *c
 
     if ( ctx->save.live || ctx->stream_type != XC_STREAM_PLAIN )
     {
+        unsigned long pages = NRPAGES(bitmap_size(ctx->save.p2m_size));
         DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                         &ctx->save.dirty_bitmap_hbuf);
 
         dirty_bitmap =
-            xc_hypercall_buffer_alloc_pages(
-                xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size)));
-        ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
+            xc_hypercall_buffer_alloc_pages(xch, dirty_bitmap, pages);
+        ctx->save.p2m_alloc_size = pages << (PAGE_SHIFT + 3);
+        ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_alloc_size);
 
         if ( !dirty_bitmap || !ctx->save.deferred_pages )
             goto enomem;
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -397,6 +397,19 @@ int paging_mfn_is_dirty(struct domain *d
     return rv;
 }
 
+/*
+ * This is used to provide a rough (upper) estimate to the caller of how many
+ * more pages we might have data for.
+ */
+static unsigned int last_valid_entry(const mfn_t *tbl, unsigned int idx) {
+    unsigned int last = LOGDIRTY_NODE_ENTRIES;
+
+    for ( ; idx < LOGDIRTY_NODE_ENTRIES; ++idx )
+        if ( mfn_valid(tbl[idx]) )
+            last = idx;
+
+    return last;
+}
 
 /* Read a domain's log-dirty bitmap and stats.  If the operation is a CLEAN,
  * clear the bitmap and stats as well. */
@@ -405,10 +418,10 @@ static int paging_log_dirty_op(struct do
                                bool_t resuming)
 {
     int rv = 0, clean = 0, peek = 1;
-    unsigned long pages = 0;
+    unsigned long pages = 0, extra = 0;
     mfn_t *l4 = NULL, *l3 = NULL, *l2 = NULL;
     unsigned long *l1 = NULL;
-    int i4, i3, i2;
+    unsigned int i4, i3, i2;
 
     if ( !resuming )
     {
@@ -479,6 +492,15 @@ static int paging_log_dirty_op(struct do
         l3 = (l4 && mfn_valid(l4[i4])) ? map_domain_page(l4[i4]) : NULL;
         for ( ; (pages < sc->pages) && (i3 < LOGDIRTY_NODE_ENTRIES); i3++ )
         {
+            unsigned long max_gfn = domain_get_maximum_gpfn(d);
+
+            if ( (i4 * LOGDIRTY_NODE_ENTRIES + i3) *
+                 LOGDIRTY_NODE_ENTRIES * PAGE_SIZE * 8 > max_gfn )
+            {
+                i4 = LOGDIRTY_NODE_ENTRIES;
+                break;
+            }
+
             l2 = ((l3 && mfn_valid(l3[i3])) ?
                   map_domain_page(l3[i3]) : NULL);
             for ( i2 = 0;
@@ -502,18 +524,36 @@ static int paging_log_dirty_op(struct do
                         goto out;
                     }
                 }
+
                 pages += bytes << 3;
+
                 if ( l1 )
                 {
+                    if ( unlikely(pages >= sc->pages) )
+                        extra = (PAGE_SIZE - bytes) << 3;
+
                     if ( clean )
                         clear_page(l1);
                     unmap_domain_page(l1);
                 }
             }
+
             if ( l2 )
+            {
+                if ( unlikely(pages >= sc->pages) )
+                {
+                    i2 = last_valid_entry(l2, i2);
+                    if ( i2 < LOGDIRTY_NODE_ENTRIES )
+                        extra = ((i4 * LOGDIRTY_NODE_ENTRIES + i3) *
+                                 LOGDIRTY_NODE_ENTRIES + i2 + 1) *
+                                PAGE_SIZE * 8;
+                }
+
                 unmap_domain_page(l2);
+            }
 
-            if ( i3 < LOGDIRTY_NODE_ENTRIES - 1 && hypercall_preempt_check() )
+            if ( pages < sc->pages && i3 < LOGDIRTY_NODE_ENTRIES - 1 &&
+                 hypercall_preempt_check() )
             {
                 d->arch.paging.preempt.log_dirty.i4 = i4;
                 d->arch.paging.preempt.log_dirty.i3 = i3 + 1;
@@ -521,10 +561,21 @@ static int paging_log_dirty_op(struct do
                 break;
             }
         }
+
         if ( l3 )
+        {
+            if ( !rv && unlikely(pages >= sc->pages) )
+            {
+                i3 = last_valid_entry(l3, i3);
+                if ( i3 < LOGDIRTY_NODE_ENTRIES )
+                    extra = (i4 * LOGDIRTY_NODE_ENTRIES + i3 + 1) *
+                            LOGDIRTY_NODE_ENTRIES * PAGE_SIZE * 8;
+            }
+
             unmap_domain_page(l3);
+        }
 
-        if ( !rv && i4 < LOGDIRTY_NODE_ENTRIES - 1 &&
+        if ( !rv && pages < sc->pages && i4 < LOGDIRTY_NODE_ENTRIES - 1 &&
              hypercall_preempt_check() )
         {
             d->arch.paging.preempt.log_dirty.i4 = i4 + 1;
@@ -534,8 +585,19 @@ static int paging_log_dirty_op(struct do
         if ( rv )
             break;
     }
+
     if ( l4 )
+    {
+        if ( !rv && unlikely(pages >= sc->pages) )
+        {
+            i4 = last_valid_entry(l4, i4);
+            if ( i4 < LOGDIRTY_NODE_ENTRIES )
+                extra = (i4 + 1) * LOGDIRTY_NODE_ENTRIES *
+                        LOGDIRTY_NODE_ENTRIES * PAGE_SIZE * 8;
+        }
+
         unmap_domain_page(l4);
+    }
 
     if ( !rv )
     {
@@ -562,8 +624,8 @@ static int paging_log_dirty_op(struct do
         return rv;
     }
 
-    if ( pages < sc->pages )
-        sc->pages = pages;
+    sc->pages = min(pages + extra, domain_get_maximum_gpfn(d) + 1);
+
     if ( clean )
     {
         /* We need to further call clean_dirty_bitmap() functions of specific
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -261,7 +261,8 @@ struct xen_domctl_shadow_op {
 
     /* OP_PEEK / OP_CLEAN */
     XEN_GUEST_HANDLE_64(uint8) dirty_bitmap;
-    uint64_aligned_t pages; /* Size of buffer. Updated with actual size. */
+    uint64_aligned_t pages; /* Size of buffer. Updated with actual (or
+                               potentially needed) size. */
     struct xen_domctl_shadow_op_stats stats;
 };
 


