Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C4946EC4B
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 16:53:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243151.420533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvLjC-0000ZG-NN; Thu, 09 Dec 2021 15:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243151.420533; Thu, 09 Dec 2021 15:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvLjC-0000XR-KH; Thu, 09 Dec 2021 15:53:02 +0000
Received: by outflank-mailman (input) for mailman id 243151;
 Thu, 09 Dec 2021 15:53:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Con=Q2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvLjB-0000XI-BT
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 15:53:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15c171bc-5908-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 16:53:00 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-sfbH4OMROmmXt1dQwJ7cWg-1; Thu, 09 Dec 2021 16:52:59 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 15:52:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 15:52:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR07CA0051.eurprd07.prod.outlook.com (2603:10a6:20b:459::10) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 15:52:56 +0000
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
X-Inumbo-ID: 15c171bc-5908-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639065180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HpW65Eem6U7uyZ5bj6yJ4q2HfmHc5tpxlYyWf42MAXw=;
	b=e2y0O1cdSGBAVpaOijT+O59rRrdJaeLe/SOCxMKX4rjC4qJW5uUaxjQleUsdN5HIUpxoHH
	xbV6py2NHC+4HesHPU61ES9UKVUck45/Crijg6+uiZIL6xYcplZW+SuGY3fxCUw7f7j/pH
	Fqb+B3G5X6cgI17HUfXtf/Ijh7xdZiA=
X-MC-Unique: sfbH4OMROmmXt1dQwJ7cWg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVNKDARm9WsiHr5WnXqUQPjLdoqyM8Q0xA7ExBSibVNbDsbgvqZ3H5uGivHLxahCTHvsLp3R3mw9jodkY0yOqGpTbAAFBxqGGOnVZkqeVcNaxmwLI5icb0pe8gEAM+lSxm9tJyh5X64xTuPE8C1WcoxmQpKHvEk53oeWc5uxdRCQdx0YIw5EUhkoYAr74YzkXWYNLP1ZK5CGH7CZeaTgeRd9sUGfbDjZKexQw5ueIo0nNJjlkBoQiJCjqmVhgThdlNNGfEsK1wxNmAr+vJIVdPLtjGAZ3sK48hMgzSN+aeX7F+bW/PwpsEWp1EoeP2qltP7GcGR7kNpO9cHCaAwyWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpW65Eem6U7uyZ5bj6yJ4q2HfmHc5tpxlYyWf42MAXw=;
 b=EKJx1hQSwM2MnawdLhqPrADtHXvRLoDo16BIPU6ZPckV6MeHh4BvpfSB6GHwLcQbDOylUrVnzb9pWvuDqjMZGZZF+XuMwS66cHHHgvrJjOhMvT5gW3ha4qHhl1lGUX2MM6pBCoHXDJ9maJi6jGpq3x3KDdPP+wXc5I0yZJyel744qUS7XEqN5knH5b1EFVXP4XJF2nuyUHC3BywDdaAxE3tl0GVArFe1vLoVn19zjY67xudCiVYBVtbhRuVX0QBaY//4XaA4c+SRsgqW2JKVXdx0NaZj+2Ckk8comSBTxsBhDmaSNp4KjO7W7iW5E6ysYf7mqoA2I0v2IdFtgFdKjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d0d4c383-d49e-1b04-5276-cf09f2169d5a@suse.com>
Date: Thu, 9 Dec 2021 16:52:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 1/3] VT-d: properly parenthesize a number of macros
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>
References: <5b1a5093-610d-f7d3-8d48-e843d86609da@suse.com>
In-Reply-To: <5b1a5093-610d-f7d3-8d48-e843d86609da@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0051.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 346dbaf7-98f5-4989-0cbd-08d9bb2bf7f6
X-MS-TrafficTypeDiagnostic: VI1PR04MB6861:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB68613CC955395DDD7668C99DB3709@VI1PR04MB6861.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:240;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5fnNRPinLH7nEPnGFAN8UBC0+P6B4qFwWA3m51GVowa+Pf1OUAU6EnPyXB03Vdzbvg1orGsUvZjLGlAO3eODlvxqEqTGdhZ5qspsziMtaRT8y+pHq46nln3UKGipjkVwUiHlfH01zJefWwqtn+ixedlcikqgC9uVLYnw+pQfeRjzivzq3neUPhe+jzpCYiW2n5aCYEbhb36d4ZhCdUPwkHLX9ucrC+JLRY8EySOKlOleFZZ998GQcunE23nsZWiC7c7dHXucyTfOIClE3EmQ7FnfooZsutxxajUILdbwRWFqZaTUJhmeaJQTAZn1NOKI8knOir5bgFp5rvTck9dPnZ+q5+mpF+zmAAK80nLX1uIy1NC/MOH/4enu8tfyqAWMkn4kquMmCTrnR1hVeSMQbNu1K/3FF16p12+74uHM11O34sF7umghey0kA7cw9m5v5eMxmQtGF5Cbgif4S4T7wLnmeC18HKWXp7ycXc4jBUN7k5lRnug0z4f0UHoJDbH5LpTKsshHgRy3yKXuIMiXZ5W4tj+BBuZ5h3vizr9qETtt3cH5B+T9xYnFHIjj7rUhX4zc/Ym4CMCwOhyPTH+sW9Bl577pTWPH1k7jlZsYyyT6ygc0ODX478C1mmhNCUmE/Mjl+Kagx8p5gsnBL7CeDhFvR0PZdn1yI4ukOQGfmI0YGnIce/grQxo8sd7BcU+R7n22eGCRjOrHnYKUR8nyehrDeA74lyz90iwSqNqA7LKaGWxIr3cyukajImVPghzM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(66476007)(4326008)(66556008)(8676002)(186003)(31686004)(31696002)(5660300002)(2616005)(16576012)(316002)(8936002)(38100700002)(956004)(36756003)(86362001)(2906002)(83380400001)(26005)(508600001)(6916009)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ektPMENMVXhicjJQYkZoS3dmb2MvcW85RGliNHVpYllwY3NmZGR3NUk1Nm1x?=
 =?utf-8?B?Y1pKUWlMZmVGejZ6OVVkUW5UZlRVcXczRWdMQmxvdnFtMi84Nzd1dWl1YTR1?=
 =?utf-8?B?aUVkbVlPbUFIU2pwUkNPc2VUV0ZLdjZGbkJzNC9rQ3ltY2hNNFl5MkF2V09Y?=
 =?utf-8?B?ZHowdlJmQ2ZWYUFSTjFjSjdwY2o0TzdOLzg5NjZuM0RQZFFFblBCV25wT0U5?=
 =?utf-8?B?RHV6SEFVWnV3dDJZQU1NN0drSmtidFE3UXR1NHZNOHlSNEFkbUp6YTgwRWZG?=
 =?utf-8?B?QnhsS1hPQnpuRVhnaER6NE95dWJkZG1lY3ZJZy84Sk5QUGxIbWI3U3JsRW1L?=
 =?utf-8?B?c3YvOTh4UmF4UFViSkR0N1JybGY2Smg0NEhNTjFlQVdxd3VVdGZNUnA0aE53?=
 =?utf-8?B?UWtsSS9BVGo2UXc4eTVETlpjWXg0bFVGM1g1K0JId1V3bG1VbHFwTWxYb2wz?=
 =?utf-8?B?RjVLV0lBa0V5QnMxcG9lczRRSEpweTJlUXlIYUg0VkVESVFEVit4V1hiRFQ5?=
 =?utf-8?B?azQ5ZVpjeUgwaTdpSE9zK3MwQUxvUERnM201U3JCUnUwYXhPK1RWZEN6d09B?=
 =?utf-8?B?bFZDbzlya0tGaU96aGNFbzNYRkVzWVFhK0U1QytIWE9mampXUGpCUXVTTkxa?=
 =?utf-8?B?bEFSSmpIc0psdTRFbFRraHlmSzdZM1AvTG5YZjhZVk16RTFaZFVna0NDUEh2?=
 =?utf-8?B?RTJoRVR1ZHVOc1RCZnI5OEUyN3ZNUmhhWHM0YklkOEJERUZlNC8rU2tuTW03?=
 =?utf-8?B?cDRVdDdCcFVLa2xXMkpHU2FoaWRtVkcydHB3TXBjY1FEZzE1RXFCVHB3Tkhy?=
 =?utf-8?B?WXdhSWxDb3BxSm5xWWs1SUt0ZlF3eGtXRXFHNGxpb3o1S0dZWHh0d3dpMzlK?=
 =?utf-8?B?WFYrY1RGTFNFZkdteGVhSVNLZkc3QXVWMlVLVlJoS1A0T3ZBRzczTlhKTEha?=
 =?utf-8?B?L3dwUnMvY3ZJa25KNTh1bnM1U0p3MS9kQUQ4N0FGeEx3dFNwT3VpZTZSdXY1?=
 =?utf-8?B?MGZxUDhUVU1JZG56QWZYSzAweFBCUjFqNkJjb0hobGVYdVYyUERsKzJOUS9B?=
 =?utf-8?B?dENoUWdzWDh6RDdhQUk4RDl5aVg5VDh5d1BpajdFNVBmc3czRFZsZUxVY3ZY?=
 =?utf-8?B?SFdqNGs1dzlldXJRYUdic25ia2Y3b1FVN2VXWHcwbnVWYzFkRkMzVmNobFBS?=
 =?utf-8?B?eXBPaWNUR3V4dTNMb0JLVm42TXBycFI0MVJvOXliZFBVSm12SUZSaVZzYkpT?=
 =?utf-8?B?VXNTcmNaQkQxbXNJSENEQytVbk5PYVZ4eW55R0hyVHNrend1OGVHVHVqYkt5?=
 =?utf-8?B?eEYxMkNLU3c2N3liOFpYYnp4M01TWjBmSXlFUjlpdTRsNUhkNjJFK3VxUUNp?=
 =?utf-8?B?NGJmK1QwVUdPeFVBN1pqMlRweGw3dnBHMlVieWZ6Sk1UQnhYb1JyYTNCV2Zs?=
 =?utf-8?B?aldMVUZKVldUR1BiRmhTQ3FuVWsrUWlQUTc3b3FodElIc2VuanBGSXErcmRX?=
 =?utf-8?B?L3I2YXNNTFlySnF0ZnN1dllydVpBaDA4aTAvRlBhTy8zTFNjNS85NDNnbU5L?=
 =?utf-8?B?cVM1RkhJMU1vbElFc29scUk5TEZhd2hGbVR3VUp5VXRmUktoeWxnRFZmSVdW?=
 =?utf-8?B?MHg3Q3BrRE1rMW5kVklWMGhQMlpjSnpGNUZwQ1AxWVhDWmxhK0dXQ085Z2Yr?=
 =?utf-8?B?aTFtalkvWE1zWlRjdUlNOTljZWgvc0dHL2RBMUtXNDhPdzNwak9valdBWTVT?=
 =?utf-8?B?UzF1emFKa3VSaEJUeGJnNWlocGY2UzVSRXJDWVVpUnl6U05ZZGNEUncxNElL?=
 =?utf-8?B?dnh0RDFwczVVcFlVSVZISmN5ZmlSb0I2TU04L29mdmo1SWo5V0FKb1BwUzBy?=
 =?utf-8?B?SVdlSDUrdmtsUmNNdmdob005YmhNZStCUmtZZE1ZWkxzWlhUV3luMVNWLytZ?=
 =?utf-8?B?MGFtUVY0alpYRndPWTBxWm9rSXd2cjBmeEFOOFVRMHdhdjl6OXVTRzkwbWNq?=
 =?utf-8?B?MG1Ca09zNU5JQ3NqaVpKa0RlcUUzVHlUb1VUVUpqRFRaREd1UmM4d1ZPWkc4?=
 =?utf-8?B?RkJsV1pPTjFlNHpzY2t6WlJxMUxrR25oUFluc1lzZThEUDg5ekpWS1IxQkJR?=
 =?utf-8?B?UjRYeFhMQWdlamczVkZJb1RXWEk5RktJMGRtU2J4c2J3TWZya3RVZ2prVDFT?=
 =?utf-8?Q?w+/nnOkpfxq36FeC0C9NMHw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 346dbaf7-98f5-4989-0cbd-08d9bb2bf7f6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 15:52:56.9280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V1L2T13kwNqR4n8KQPyKqcJvSBIKOBc8bmVHQBHoiutiHvV95ezlJs55iMCOVYwSDlaiKLUYrn/c+gqvHgaxUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861

Let's eliminate the risk of any of these macros getting used with more
complex expressions as arguments.

Where touching lines anyway, also
- switch from u64 to uint64_t,
- drop unnecessary parentheses,
- drop pointless 0x prefixes.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -90,14 +90,14 @@
 
 #define ecap_niotlb_iunits(e)    ((((e) >> 24) & 0xff) + 1)
 #define ecap_iotlb_offset(e)     ((((e) >> 8) & 0x3ff) * 16)
-#define ecap_coherent(e)         ((e >> 0) & 0x1)
-#define ecap_queued_inval(e)     ((e >> 1) & 0x1)
-#define ecap_dev_iotlb(e)        ((e >> 2) & 0x1)
-#define ecap_intr_remap(e)       ((e >> 3) & 0x1)
-#define ecap_eim(e)              ((e >> 4) & 0x1)
-#define ecap_cache_hints(e)      ((e >> 5) & 0x1)
-#define ecap_pass_thru(e)        ((e >> 6) & 0x1)
-#define ecap_snp_ctl(e)          ((e >> 7) & 0x1)
+#define ecap_coherent(e)         (((e) >> 0) & 1)
+#define ecap_queued_inval(e)     (((e) >> 1) & 1)
+#define ecap_dev_iotlb(e)        (((e) >> 2) & 1)
+#define ecap_intr_remap(e)       (((e) >> 3) & 1)
+#define ecap_eim(e)              (((e) >> 4) & 1)
+#define ecap_cache_hints(e)      (((e) >> 5) & 1)
+#define ecap_pass_thru(e)        (((e) >> 6) & 1)
+#define ecap_snp_ctl(e)          (((e) >> 7) & 1)
 
 /* IOTLB_REG */
 #define DMA_TLB_FLUSH_GRANU_OFFSET  60
@@ -106,14 +106,14 @@
 #define DMA_TLB_PSI_FLUSH (((u64)3) << 60)
 #define DMA_TLB_IIRG(x) (((x) >> 60) & 7) 
 #define DMA_TLB_IAIG(val) (((val) >> 57) & 7)
-#define DMA_TLB_DID(x) (((u64)(x & 0xffff)) << 32)
+#define DMA_TLB_DID(x) (((uint64_t)((x) & 0xffff)) << 32)
 
 #define DMA_TLB_READ_DRAIN (((u64)1) << 49)
 #define DMA_TLB_WRITE_DRAIN (((u64)1) << 48)
 #define DMA_TLB_IVT (((u64)1) << 63)
 
-#define DMA_TLB_IVA_ADDR(x) ((((u64)x) >> 12) << 12)
-#define DMA_TLB_IVA_HINT(x) ((((u64)x) & 1) << 6)
+#define DMA_TLB_IVA_ADDR(x) (((uint64_t)(x) >> 12) << 12)
+#define DMA_TLB_IVA_HINT(x) (((uint64_t)(x) & 1) << 6)
 
 /* GCMD_REG */
 #define DMA_GCMD_TE     (1u << 31)
@@ -144,11 +144,11 @@
 /* CCMD_REG */
 #define DMA_CCMD_INVL_GRANU_OFFSET  61
 #define DMA_CCMD_ICC   (((u64)1) << 63)
-#define DMA_CCMD_GLOBAL_INVL (((u64)1) << 61)
-#define DMA_CCMD_DOMAIN_INVL (((u64)2) << 61)
-#define DMA_CCMD_DEVICE_INVL (((u64)3) << 61)
+#define DMA_CCMD_GLOBAL_INVL ((uint64_t)1 << DMA_CCMD_INVL_GRANU_OFFSET)
+#define DMA_CCMD_DOMAIN_INVL ((uint64_t)2 << DMA_CCMD_INVL_GRANU_OFFSET)
+#define DMA_CCMD_DEVICE_INVL ((uint64_t)3 << DMA_CCMD_INVL_GRANU_OFFSET)
+#define DMA_CCMD_CIRG(x) (((uint64_t)3 << DMA_CCMD_INVL_GRANU_OFFSET) & (x))
 #define DMA_CCMD_FM(m) (((u64)((m) & 0x3)) << 32)
-#define DMA_CCMD_CIRG(x) ((((u64)3) << 61) & x)
 #define DMA_CCMD_MASK_NOBIT 0
 #define DMA_CCMD_MASK_1BIT 1
 #define DMA_CCMD_MASK_2BIT 2
@@ -156,7 +156,7 @@
 #define DMA_CCMD_SID(s) (((u64)((s) & 0xffff)) << 16)
 #define DMA_CCMD_DID(d) ((u64)((d) & 0xffff))
 
-#define DMA_CCMD_CAIG_MASK(x) (((u64)x) & ((u64) 0x3 << 59))
+#define DMA_CCMD_CAIG_MASK(x) ((uint64_t)(x) & ((uint64_t)3 << 59))
 
 /* FECTL_REG */
 #define DMA_FECTL_IM (1u << 31)
@@ -175,10 +175,10 @@
 
 /* FRCD_REG, 32 bits access */
 #define DMA_FRCD_F (1u << 31)
-#define dma_frcd_type(d) ((d >> 30) & 1)
-#define dma_frcd_fault_reason(c) (c & 0xff)
-#define dma_frcd_source_id(c) (c & 0xffff)
-#define dma_frcd_page_addr(d) (d & (((u64)-1) << 12)) /* low 64 bit */
+#define dma_frcd_type(d) (((d) >> 30) & 1)
+#define dma_frcd_fault_reason(c) ((c) & 0xff)
+#define dma_frcd_source_id(c) ((c) & 0xffff)
+#define dma_frcd_page_addr(d) ((d) & ((uint64_t)-1 << 12)) /* low 64 bit */
 
 /*
  * 0: Present
@@ -233,16 +233,16 @@ struct context_entry {
 #define PTE_NUM            (1 << LEVEL_STRIDE)
 #define level_to_agaw(val) ((val) - 2)
 #define agaw_to_level(val) ((val) + 2)
-#define agaw_to_width(val) (30 + val * LEVEL_STRIDE)
-#define width_to_agaw(w)   ((w - 30)/LEVEL_STRIDE)
-#define level_to_offset_bits(l) (12 + (l - 1) * LEVEL_STRIDE)
+#define agaw_to_width(val) (30 + (val) * LEVEL_STRIDE)
+#define width_to_agaw(w)   (((w) - 30)/LEVEL_STRIDE)
+#define level_to_offset_bits(l) (12 + ((l) - 1) * LEVEL_STRIDE)
 #define address_level_offset(addr, level) \
-            ((addr >> level_to_offset_bits(level)) & LEVEL_MASK)
+            (((addr) >> level_to_offset_bits(level)) & LEVEL_MASK)
 #define offset_level_address(offset, level) \
             ((u64)(offset) << level_to_offset_bits(level))
 #define level_mask(l) (((u64)(-1)) << level_to_offset_bits(l))
 #define level_size(l) (1 << level_to_offset_bits(l))
-#define align_to_level(addr, l) ((addr + level_size(l) - 1) & level_mask(l))
+#define align_to_level(addr, l) (((addr) + level_size(l) - 1) & level_mask(l))
 
 /*
  * 0: readable


