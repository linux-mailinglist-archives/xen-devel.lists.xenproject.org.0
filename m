Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D93A412F2B
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 09:17:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191394.341408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSa1M-0002hd-OU; Tue, 21 Sep 2021 07:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191394.341408; Tue, 21 Sep 2021 07:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSa1M-0002f6-Iv; Tue, 21 Sep 2021 07:16:52 +0000
Received: by outflank-mailman (input) for mailman id 191394;
 Tue, 21 Sep 2021 07:16:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSa1K-0002Od-D3
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 07:16:50 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e28fbe3e-1aab-11ec-b89f-12813bfff9fa;
 Tue, 21 Sep 2021 07:16:49 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2055.outbound.protection.outlook.com [104.47.5.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-phiF_01_OguB7cRVDHqGJA-1; Tue, 21 Sep 2021 09:16:47 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3389.eurprd04.prod.outlook.com (2603:10a6:803:b::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Tue, 21 Sep
 2021 07:16:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 07:16:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.5 via Frontend Transport; Tue, 21 Sep 2021 07:16:45 +0000
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
X-Inumbo-ID: e28fbe3e-1aab-11ec-b89f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632208608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Vo4Dkwt5tDPO7OINdISKIs97Cf1OIMtewg4ko0cXdk=;
	b=YLAmMJql+qviZW2w0sm47awS0gK6CbF53dEHYt5tZAwGVP3guQ4xiK8BN+nAtRKOrpyYxX
	07MT292TFUwmr3p+X9bzeBLSSZ1oJ25mcXJO1LOx+1Hc9f7hFMTm8cuvFpsOJZkvolRn+s
	oMnxRu+pmb+49nKmikMYK6yYogbRs4Y=
X-MC-Unique: phiF_01_OguB7cRVDHqGJA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQgFmurlxHLmi94LsZ8bEGJ7Ek0Pib+n055OwWt5ZFrNeep1aGnFLPcaqLl4u3EvOKoT6Q/+OO05Kte9sXPgziaqbu5dajxisVdILiUEoAGsTpRyGy1PkURQekqIdESU6THCf2Pz3mIopKyozCT23ruxLfG6otD9HAzmAZSGSVe8iSB9bo/TJfsgKcEp/QNfc6Lu8VvtV+5IEGMD8sTMI4ZlZj4r/4NzrAIGkzQaY3npNG8ub+9LvweRgfhiqjQmt0J2Lx4LU8XmTm7nTS8BSVkTBDQLzZZQ1wpw64lfCFzPdpVinXZeb2bqrqy8zBHbU2bjdl044DEFwbd8A5Chyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=4Vo4Dkwt5tDPO7OINdISKIs97Cf1OIMtewg4ko0cXdk=;
 b=c2yTQrNPMpRuTq6SdKe6cOk5q7FGljzNqbvgLWIpJ9t5eON8icAfUDpbrF2vt/qzc1Q890t9uGVj3awpgDaGl9SOkkw3DZDIAIxxoN7fBSC5fBREi3VFd1URZnes2cCT0JNaNbZNGWymymNC6cGm30PUdHBN1o3uiB0n5yMYRZqM9o08XFLlfSs32Gk3VFCUuhf+iJZiN5HwMj/ENvVD8xe9u7/Y2i7ZNpmhRMF+pXyKkhGfQYAsZ4oFaxEyAGs1NYjl7IPYTuN4SNU7jnAyeWqKWZeq0qbB2tVOPjgOD/GHLu3VTPi0SPAawwtdBk9+NRAOzj4+DscgWRr6ASeTrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v3 1/9] x86/PVH: improve Dom0 memory size calculation
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
Message-ID: <562a9ee5-102e-ee25-e4cd-721e44b7409a@suse.com>
Date: Tue, 21 Sep 2021 09:16:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4d41e5e-993e-4b71-1358-08d97ccfc503
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3389:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3389FE26E8DA678ADC6C1580B3A19@VI1PR0402MB3389.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yf6NHN4kfoXQ01MwY35MpmQYsPfONxiyB/+OG0nf3x5frssgcHSO8zvp48//ght2cHYywtALvtBZj+PPm/U8YIZbL4K/uFov2XKc6HvSQ+MpfcHq8+fEUUQPujC+tx7Tha7mD76nRpUcOcg2NShaDg0cKI8ssT6nG7XpDF0do54+1qldebmypfUCo7AsgbcUH7RLKKyY7m44yUEAOuLNFyiGYI1ZSHGBRiT83OiKBHq0vI0DNLbV+n/cS5YFtqomEhJYepv1GiBm1KUpOm8sHUubw418MQ50eS5n1mn0FK7OHX35v+IMQinNQJ7da4JMwR3kSLvEFHEomi1wZ8sqI6u1A+OdkT5TUpGLumc/ljPZiO1ec4Gpm4b1z5Z+77toW11Pya8XyF0iMVh6OodGzMoIc4f2cBp9WiADxU/cVQQib86ZIrq3961L/FupPPo6gJjnFSoPRrKT+ABN70ujus20hJSSTx1L3edMq+rC9lCbIIA97Nq9FSA2TUaCDb216XbcqfUCZZIuN2kil/zTYxV7cVfyn6EQFuHxNYqSEjHujmj75pyHLGmJiv9iYvwe7Nh/barK2pOV5l3s8gXHvY4d1zuP/xFZ4bwA1kghMt85C5/tRWJOjsSJKSakRr2gYq1EfDoMD8lnNurMNIWYPB0D6GdTBhzJgVcMaMuAh+IWyy9myWZKxrQcG779ezds2oWK870c2fzqhSE3dDwSworNrgPZbeQxPefOr+kOcPVvEwZwN/iKvyJ0kki9cLqpqqY7hPrfAXtarJuWzU0k8A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(6916009)(2616005)(4326008)(956004)(38100700002)(31686004)(508600001)(36756003)(86362001)(66556008)(6486002)(66946007)(66476007)(83380400001)(316002)(16576012)(5660300002)(8676002)(31696002)(2906002)(186003)(8936002)(26005)(25903002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFBpWi9PYmQycHV0VXhhVzBDZWh1Uzhlb3U4S2srMXRvNzBVbWRuS280V0dx?=
 =?utf-8?B?aXRxN2FWam0yaFRVc2IxR3BaWWtDQW4yWnVNdmwzeEtmZDQ3bzZSTHBLOTVw?=
 =?utf-8?B?V2syT0xXcEh5blh1enRwNFZXWlpGN0xMaWMxK3RTektMRmVOQTNnU2U1NHJT?=
 =?utf-8?B?M3VPUkY2Z3p0UnZNUTBQa1hNNHJIdm42UExveXRiSS9qQ3BTMTQ5VzdEVzFq?=
 =?utf-8?B?NlZ4QmxDWFVjZlJEOE1IQldwNFB5aE8wSERLcDM3S29Kb2VxUnkrWG5jNGRz?=
 =?utf-8?B?ejR3UGg5NFlma1pSeGxTdmlTaFR2cklSVFlmRWVGRy8xVjFhd0pCekdhNFBn?=
 =?utf-8?B?aFlUR0dhVmo2U2t6SklQakIwN2FldWN5WXJHSnNuTUplRjlxWmFraUp6N255?=
 =?utf-8?B?ZUR6UkNpTWFGaXdzeEpiUVQ0aEk5SVFxNnhCYWJKV1lmMXFtVGwwSHVCenB1?=
 =?utf-8?B?cnFCUEhOQXhNRG5TdGp1emt3MjlTbzN2OGVXQkdOL3QveUltREZLSGxrYnpM?=
 =?utf-8?B?WVd3THFWVS9hb3B0cFdpN0R5aVY5ZVNrNDlxaS9ueW5qdHBVK1FxcnR0MWt1?=
 =?utf-8?B?UzhKMlJxU3lFV2RJeTRiOFdTbFpvL1poK2c4di81MkRoUkhJZ2EzbnMxTDRv?=
 =?utf-8?B?YUc3OVNLZ08xMzZPdnFzQWh5L2hqNG1FZXpTRDdsSUNVbTlqMWQ0WWpnTWo4?=
 =?utf-8?B?dTUzeU9YdytyU1FHV1FmV2Qyd3FuQW5ScUo4OTF4ZWFIOXI5UWdJczRPbGp5?=
 =?utf-8?B?d1doQ1VTVkp3S1VYbFNJUkZLYkpDNDE5clhPQ3dkRWN1bndSYVMxcUI1bjJm?=
 =?utf-8?B?Q2JzZXBzSGZwSTM5RGxBcDhodER2ZDBkMVQvYUZ0bmk5aWFLaXdBNERDRkFJ?=
 =?utf-8?B?OENMbndRUFNqeGxlUDFwV1hFYjhZc3N1V2NZZHNqWC93a3dncFQyUG02VlJo?=
 =?utf-8?B?NE9rRW9BRjlseDNibGRnaThNamNSejRBMEQ5UXZJR21tamtjREpjelAvV0Jm?=
 =?utf-8?B?S1JwdWlmTk5Tb0xTQzJudGhhVlRxQlQ3NTE2YlQyaXFLclQzalVpL3JaSy8x?=
 =?utf-8?B?TGViRGlpR0FWYXhSV2hNbExDaGJlbVdiK0RZcVdxSVR3eWhFUzdFSE93SDN4?=
 =?utf-8?B?dG9lRXRPM0RqSHJsVlBSUzlHSjVoUWtpcUp0SThmNUtuT1BUYTNwTDh6ekU4?=
 =?utf-8?B?YWFVdjFXOHpCa0dtN0FZTWczTHJJcHhRY1JZaFp4STRnaUZpTGV2NXFsMFBU?=
 =?utf-8?B?bUdxTGlGbkxRZEczZTlFRTZLMUsxTGx3TUtoZWtHQjlLOEFiL2tpV0J6YUpE?=
 =?utf-8?B?ZXV0Z051TXpnRXhrM0hmdFoxdzNKcVcxK0gxR1NVYzJOZlpQalRQdTNJL29L?=
 =?utf-8?B?Sm03ZFY4aHMrMWFMUFRXYjhuMFpEYTZRZWhIOSs3VU5YQWdtMmszeDBva3Nl?=
 =?utf-8?B?M3BvNnlYWkN6d2tMTFMvWFo2czI3SGNuTS90ZldzQzdPZXNoOUZ0bmJRcEFQ?=
 =?utf-8?B?UFo1UUs0QmJWaHJ3QXpBY2lWUm5LV3hRdDR3R204aC9aVUJiK3dGM2s3QnVt?=
 =?utf-8?B?bFFtbHF5ZUFuU2grZFZQMXZaL3pkbUhmZmZIRTAxdGdDc1ZJbjFMbnZuNjZU?=
 =?utf-8?B?N0FhWkpRUjFRbzBLQnA1cTlxUWZ6bUFwUDJWRTNZb29rRUN2RDZ4ZHEvTFJB?=
 =?utf-8?B?eVUvbGNvUUExK0sxOHpTZ1A2UFBmL0RLKzFCd3pOMk1IcG9ZUFg4ZHBFZmFr?=
 =?utf-8?Q?PfBfyfbZ6jOLdnarADD3Ny3aKQNxx/bpBRFj6zQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d41e5e-993e-4b71-1358-08d97ccfc503
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 07:16:45.6312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YntyIQd1iNOYuPWSIaiqG8+4bSQuZKrR9zUKfLEBuSP1svBKhAIk+7aZYY0u7RhSTcacDa9fXkNHJXGpljr8bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3389

Assuming that the accounting for IOMMU page tables will also take care
of the P2M needs was wrong: dom0_paging_pages() can determine a far
higher value, high enough for the system to run out of memory while
setting up Dom0. Hence in the case of shared page tables the larger of
the two values needs to be used (without shared page tables the sum of
both continues to be applicable).

While there also account for two further aspects in the PV case: With
"iommu=dom0-passthrough" no IOMMU page tables would get allocated, so
none need accounting for. And if shadow mode is to be enabled, setting
aside a suitable amount for the P2M pool to get populated is also
necessary (i.e. similar to the non-shared-page-tables case of PVH).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -318,7 +318,7 @@ unsigned long __init dom0_compute_nr_pag
     struct domain *d, struct elf_dom_parms *parms, unsigned long initrd_len)
 {
     nodeid_t node;
-    unsigned long avail = 0, nr_pages, min_pages, max_pages;
+    unsigned long avail = 0, nr_pages, min_pages, max_pages, iommu_pages = 0;
     bool need_paging;
 
     /* The ordering of operands is to work around a clang5 issue. */
@@ -337,18 +337,23 @@ unsigned long __init dom0_compute_nr_pag
         avail -= d->max_vcpus - 1;
 
     /* Reserve memory for iommu_dom0_init() (rough estimate). */
-    if ( is_iommu_enabled(d) )
+    if ( is_iommu_enabled(d) && !iommu_hwdom_passthrough )
     {
         unsigned int s;
 
         for ( s = 9; s < BITS_PER_LONG; s += 9 )
-            avail -= max_pdx >> s;
+            iommu_pages += max_pdx >> s;
+
+        avail -= iommu_pages;
     }
 
-    need_paging = is_hvm_domain(d) &&
-        (!iommu_use_hap_pt(d) || !paging_mode_hap(d));
+    need_paging = is_hvm_domain(d)
+                  ? !iommu_use_hap_pt(d) || !paging_mode_hap(d)
+                  : opt_dom0_shadow;
     for ( ; ; need_paging = false )
     {
+        unsigned long paging_pages;
+
         nr_pages = get_memsize(&dom0_size, avail);
         min_pages = get_memsize(&dom0_min_size, avail);
         max_pages = get_memsize(&dom0_max_size, avail);
@@ -377,11 +382,20 @@ unsigned long __init dom0_compute_nr_pag
         nr_pages = min(nr_pages, max_pages);
         nr_pages = min(nr_pages, avail);
 
-        if ( !need_paging )
-            break;
+        paging_pages = paging_mode_enabled(d) || need_paging
+                       ? dom0_paging_pages(d, nr_pages) : 0;
 
         /* Reserve memory for shadow or HAP. */
-        avail -= dom0_paging_pages(d, nr_pages);
+        if ( !need_paging )
+        {
+            if ( paging_pages <= iommu_pages )
+                break;
+
+            avail -= paging_pages - iommu_pages;
+        }
+        else
+            avail -= paging_pages;
+        iommu_pages = paging_pages;
     }
 
     if ( is_pv_domain(d) &&


