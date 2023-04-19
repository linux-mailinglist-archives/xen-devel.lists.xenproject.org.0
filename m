Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5466B6E779F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 12:44:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523319.813261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp5Ij-00054C-QZ; Wed, 19 Apr 2023 10:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523319.813261; Wed, 19 Apr 2023 10:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp5Ij-00051i-Nl; Wed, 19 Apr 2023 10:44:37 +0000
Received: by outflank-mailman (input) for mailman id 523319;
 Wed, 19 Apr 2023 10:44:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pp5Ii-0003M4-Bn
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 10:44:36 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c56b75d-de9f-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 12:44:34 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7671.eurprd04.prod.outlook.com (2603:10a6:20b:299::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 10:44:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 10:44:33 +0000
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
X-Inumbo-ID: 2c56b75d-de9f-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SF3nigEobWvO4lZQvPg+fseXc0vqkXnOzT7Y66cbs3o4KzggUqnRa4N3ul0pGawJ/WYCByJSMDe1o8iVXV2yLUYJ29hFAQjE089vYsVQyHZ3VO8ZNQfdcd+Q/F+CjzHVPIZsvjnd5Y+U1Hf7/A1rFOcYiuRdv/L8o3ULnG/r9VnwJVntYWC9t740XAT+oMZFWT9gEMxNUiO2W1yUys1xvgIHpo8ahF38cbInlrCtlLGCdcpIKPGT9NplwxzwOrKcglxGoZpH8Ow+LDGpK4YKeY0IUlNvr9qRP3QuVV/N33mdmcXPjfvr82F3O3aPqhmnWXFTDsjR0Py22k2+yAolNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XejQV07T8V2gYiQel4lhjkXlJAuuZk41L4stliIWs7I=;
 b=Hk/G0cOXWuIFoXbBkcN+W/iNWM3OXPMjIpOxtcV3WtkN+wxQkOnV7hXsPcdUEIAAZSrnekgEWYuy9CGkAj8GKgYS+xAAs/2ye8SQaQ5tuwNwuhDEydlRHP+jdD0C/BBdP0QVxOizuEV7VKcGo+nbrndyD1GLOqkJEEdx2HvN0CpowfGfsbSk69hnrovWWDhaHnvDzROFS1Q0IU7QhtaYNyXiKldRbgdaoRgvx5gUIl7N0NO5gQhvdggUUIC+Akfm2McqzxF0yrh2RfrC/AYewtjzY2n1aRsTmHeq1MXkZhGBuZ/8MurSonYsLU+8jOYXoGjVwtKgizXi88HjEyvX2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XejQV07T8V2gYiQel4lhjkXlJAuuZk41L4stliIWs7I=;
 b=51Nud44WJbSocPCFTtFgaf3+mGifwESn3rwb4M+PSahBQ6txqCeMNrTilwhzZZR+Y8kan9v4vnvCHtyN0uhls2eg1+24J6m6BENVb3peVb+UwKibZ48Y4IXa95239xM6jO7bLGIMC28zFgEpz6xCFy9BixftRhWIeXZ5X7gHnRwmbuarp5SKmM8iet+vA8P9hy7xUtpzuloNjMBhktPmHD7kdAv9Jio8DmcfJzAglwksW848ZKziizLQM2P0mPCSjCZtlV1r6C17/dDh+TFTiKvAVvS3Gopo8N2UHwBf8U41qwW/icfjf1xcn2IjxvZI5kFM3pMmsaCbUr8SXf3qBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ee33ad20-ef6e-504d-6987-59ccb166f8e4@suse.com>
Date: Wed, 19 Apr 2023 12:44:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH 1/5] x86: support cache-writeback in flush_area_local() et al
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4b42e920-f007-186c-d838-a0294bfa86b5@suse.com>
In-Reply-To: <4b42e920-f007-186c-d838-a0294bfa86b5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::24) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7671:EE_
X-MS-Office365-Filtering-Correlation-Id: ba16c0b1-374f-4801-4c25-08db40c30fc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ciu6ZyWfasZVyJmuWnkVBQJiPDT5DjlRSVPs+SQaHrhoSd05ScrROU7/77mCiHF1HyyTKjdkMChRQS63R2EAJBT7Wm71JUdC/iQnqyR7hutfBOUfdxKQbn31DKVSQgicdSUwsUOR3aQr5zdRsAOiIPfOQBn5Bjfoqpxch3WVveJXZEj8XXIgbDIto87TUaVfFPZhjBsGdzns86gsbCx6vLubFxSG0nhwAJBTcp8gNwmwTRPfyh4d4tRBD9ZWLu7scknYpb+YibJRzDzMl/BwcvS64zYbyIWs19Tg/wXAouNjibssiKDoFIM7pYVbtcKb+/ZZK350PUAB5y1BbYN0ZvwflEhUMlyaJyK6cpnJPwQ0nZ3V4NWOL2Qf4CrxJ6KWu+uC/bnzmn8z7cxN/LpbvXaoegKOZbHSk5qip7lak11cTpL6kt7dP+yh0Peqiwax8FaT6rh1V5RdeHtAFelLFsqjnngQ8Q4CLrPUGgWu4V5/nC9cUjxgJgkPzVVOZXpOnEPcMsuJtZTBXX7kPUqLT706+g6iAztFBoDod4Epvk+KYo79ckD6dsaEqm6YA+vW8Di2sNywGw+EirojtsCuat2bb1zj2HQkz12OXB9vbT32IUxIjS8zgFNQg9/lO7fv1USM2IRbKtgp2DnMY1XOIg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(39860400002)(376002)(366004)(451199021)(5660300002)(86362001)(2616005)(83380400001)(31696002)(6512007)(186003)(6506007)(26005)(38100700002)(8676002)(8936002)(54906003)(478600001)(6486002)(316002)(41300700001)(36756003)(4326008)(6916009)(66946007)(66556008)(31686004)(66476007)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnJseGdFZHhsSlRRM051WTJZb0YrYU91MlNnQmhKUTdtb0dMRE51Wmpkc3hm?=
 =?utf-8?B?R2gwS1AyNllLQVd5azNiZDIvdlZnVms5ZllTWTFvQmRaSjF6RzZJWmM5eHZ2?=
 =?utf-8?B?d3ArdTdxMHZ4L2RxZkhuSjNtYlVEbFMyRWkwRGhLc3ora3gzM0d2Q21veGNV?=
 =?utf-8?B?Z00raTNrVm50TEt3QmdiMjBidnJ3MWhPd1R3MlhDU3ppVlhITnZpeHEyNHU2?=
 =?utf-8?B?enZDbVQ0L0xLUTFyQlh6TFBWbDg3MU8vb3BmczMzWGNOMUVmclRacGltOU5M?=
 =?utf-8?B?M0RxbFhwZEdJMXdub1F5RFZ2NFRZb2Uwc1pMSUwwT3JaUXk3NmV5TS9nM3g1?=
 =?utf-8?B?NVZNZWNEVTNkVFl1a09VWVk0T3V4cDVjeXNsZDZyTGVuRVg5d0E3R1FpelNP?=
 =?utf-8?B?Tzd3Y3l0ek03aWYzR09KeTVxUnBuQkl4VGErZDArYVloN1YrTDF1aTk3RkF2?=
 =?utf-8?B?cXllZW9Ja2NkVGlWaElvL1pyZmZTWmdWZ28vYjFZVUdTOThXbXJXdWJhR0hs?=
 =?utf-8?B?VHg4WERMcmtLQ0FIc0MwTWFSdDFJWkNCTFdFY2xMeGdTcDN6eEVkVzFESm1M?=
 =?utf-8?B?ODgwUi9zK0NDNXYrU1p0eGcvNVMzQkJ3dmFBWDNIcEx1bkJwRU5ZSTZGZUFE?=
 =?utf-8?B?UzZEOENNQTkyOUgzQTd4MHErS3JuNHR3MW53dktBajBIN0J6RHJnZjVHSHov?=
 =?utf-8?B?bUcvQkJqSllGY3dzNkg2RUNwaEczdGhnUkw0SnVldjNjbzcyK3h1citMYWN2?=
 =?utf-8?B?WENMTkpwM0dBcDVDaVVPNitoeGdVOTRjVVpYdVFRL3FXWWFySmhKeWNibFpV?=
 =?utf-8?B?dHRaa3hyZWhjc3hyRGVBRVRwZXNpZDVHcmtZZVdZa2FvYWJKVG4rTE1kUTd2?=
 =?utf-8?B?c0t2VDN2VFhTVzhwSStOaU1jeFRUckczNnBHZSt2YjNaVkZQL2cvUi92b1Fx?=
 =?utf-8?B?RzhHc296elgvblE5dGtnclRsMEFIQWVyVTRINW1kbkVhT1gxMHdEd05UY2p5?=
 =?utf-8?B?T25wcmFhUUhKWExYSUhtam1FbmNtRStOUnpqajlwRGsvdjViWmJBTGliWThl?=
 =?utf-8?B?dEZNMWNCNGRueSt1UzRYcXJzaHhsQjlXbmZFeWdSRzNYRU9FNTQ3SjM1Q1lL?=
 =?utf-8?B?VndEM1dGdXRZMkp6N2tYSkV0bGpqeDRmS2NVT1lyL3dEaURmYVFBNTBHN0Nq?=
 =?utf-8?B?cERxUXQvMHREeERLUlRlVlpVekQ0NGdzc281MkFBcUNrQW5UREdxdmI5L1hz?=
 =?utf-8?B?bGRFTzVtaCtZUDJDdzhZNjJya0JVV2RJYm5YM3JNSWtFM2tITk5mNFl6Yk9O?=
 =?utf-8?B?MEF2am83YmpnTDgvK2dtMW51MDVhK0YyOXphTFNkNTI0NGluYzdja0FabERD?=
 =?utf-8?B?ZUw0Zk12WXY2ZjRtbTA5UXdEOVV6NUJXVnBrREQwZldRQ0F6ZzNJR1ZRai9q?=
 =?utf-8?B?NjVPVHJCZXpRZlJ2NlhtRkt1ekxaeGZGMDVYc0JuSndRamVkQWtIVjAzSkMx?=
 =?utf-8?B?YjFwNFFqdVhodU90WFdlVjkzejRaYkpRUVZTS0ZrTGlRSDdGOXc0RVBoVHgz?=
 =?utf-8?B?ZEo4VFp1UkV4ZkwvUGg4bG1HOG1BY2p0VHlFdHQxZGphQzZvQVpTZjJ5SDQ2?=
 =?utf-8?B?TzMvdHlPNkREUVh1clFHS1ZFSGN6cjBhQjBuMGNCM2JGMW4zWnJKZHhqaUFE?=
 =?utf-8?B?YkVlZUxYbUl3ZitKbEl2WGdHSEt3UHl3NUdCTFpTRWkvS1dYcS9KS3Y0SUxi?=
 =?utf-8?B?b1dyalBQWDZSVlBHU09FV3Y2cHl6c29kNXMwbk9DMEV3bmh5WFZrMElPRTha?=
 =?utf-8?B?RXlaT05YRy8xMnZjdXUyM0RCSFdjRmZOelJCc3h4bzJ4YWtqbklqYUVUY0F3?=
 =?utf-8?B?M1BwcU11VGNrSEZ1RElFdUgzb1N6QTF5djFlL0NjRDcvZlQzV1cwSmJiRlcv?=
 =?utf-8?B?cHgzMUZ2Yk5MV0o2RnBUak1FeFZ4NnNSYXdsYmFpOGlldTZ6SmxYcDNuT3Fs?=
 =?utf-8?B?SDZxSXNPNCtsaEtKVHRUWnhVbzhFUTBmNXoxMHpUU01HUTJIbGIzOFVaeCtx?=
 =?utf-8?B?dGtsV2hQN216b2lJK3Bpc3oyMmU4ZlVjbjBqdjNQZXFhLzZXcGdJZnU5dWNz?=
 =?utf-8?Q?B2abphhd2rkYn4IF2iyWWqzxn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba16c0b1-374f-4801-4c25-08db40c30fc4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 10:44:33.1687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IRRue+sUY+I8P8BDp0byCHD8lvAkP0uzAogYwwyxJk/V677Intc9VjfQo5iG+AOburzZslRtz7ERuHj3a1j56g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7671

The majority of the present callers really aren't after invalidating
cache contents, but only after writeback. Make this available by simply
extending the FLUSH_CACHE handling accordingly. No feature checks are
required here: cache_writeback() falls back to cache_flush() as
necessary, while WBNOINVD degenerates to WBINVD on older hardware.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -232,7 +232,7 @@ unsigned int flush_area_local(const void
     if ( flags & FLUSH_HVM_ASID_CORE )
         hvm_flush_guest_tlbs();
 
-    if ( flags & FLUSH_CACHE )
+    if ( flags & (FLUSH_CACHE | FLUSH_WRITEBACK) )
     {
         const struct cpuinfo_x86 *c = &current_cpu_data;
         unsigned long sz = 0;
@@ -245,13 +245,16 @@ unsigned int flush_area_local(const void
              c->x86_clflush_size && c->x86_cache_size && sz &&
              ((sz >> 10) < c->x86_cache_size) )
         {
-            cache_flush(va, sz);
-            flags &= ~FLUSH_CACHE;
+            if ( flags & FLUSH_CACHE )
+                cache_flush(va, sz);
+            else
+                cache_writeback(va, sz);
+            flags &= ~(FLUSH_CACHE | FLUSH_WRITEBACK);
         }
-        else
-        {
+        else if ( flags & FLUSH_CACHE )
             wbinvd();
-        }
+        else
+            wbnoinvd();
     }
 
     if ( flags & FLUSH_ROOT_PGTBL )
--- a/xen/arch/x86/include/asm/flushtlb.h
+++ b/xen/arch/x86/include/asm/flushtlb.h
@@ -135,6 +135,8 @@ void switch_cr3_cr4(unsigned long cr3, u
 #else
 # define FLUSH_NO_ASSIST 0
 #endif
+ /* Write back data cache contents */
+#define FLUSH_WRITEBACK  0x10000
 
 /* Flush local TLBs/caches. */
 unsigned int flush_area_local(const void *va, unsigned int flags);
@@ -194,7 +196,11 @@ static inline int clean_and_invalidate_d
 }
 static inline int clean_dcache_va_range(const void *p, unsigned long size)
 {
-    return clean_and_invalidate_dcache_va_range(p, size);
+    unsigned int order = get_order_from_bytes(size);
+
+    /* sub-page granularity support needs to be added if necessary */
+    flush_area_local(p, FLUSH_WRITEBACK | FLUSH_ORDER(order));
+    return 0;
 }
 
 unsigned int guest_flush_tlb_flags(const struct domain *d);


