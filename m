Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D20904F7B9E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 11:28:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300568.512754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncOQq-0007ot-B5; Thu, 07 Apr 2022 09:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300568.512754; Thu, 07 Apr 2022 09:28:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncOQq-0007mD-7d; Thu, 07 Apr 2022 09:28:00 +0000
Received: by outflank-mailman (input) for mailman id 300568;
 Thu, 07 Apr 2022 09:27:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ncOQo-0007m7-NM
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 09:27:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02976ab3-b655-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 11:27:57 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2059.outbound.protection.outlook.com [104.47.6.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-9otTH9cQNGysJqkhjb3Xyg-1; Thu, 07 Apr 2022 11:27:56 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB5507.eurprd04.prod.outlook.com (2603:10a6:208:110::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21; Thu, 7 Apr
 2022 09:27:55 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 09:27:55 +0000
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
X-Inumbo-ID: 02976ab3-b655-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649323677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0IrZylJTpCAzfeSRjCQ3TVLzNp2tEk2Z4BxiHpu3jec=;
	b=hg6KESjQmQE3iAhs0tDQRJHQNamemz2TRxP+zdYa4ji0rnE+WYULivPXpaDIVFIyHjfXSQ
	B+LIjm/Wln+5WTvVpQVe4aB+wn4CuOvfa23LFL/wyw/fxAeV+G1HtpH9XGMlcoeOzNhSgV
	AdnoldSHwgPEJDOV/mb2iq9VHXJ0+/Y=
X-MC-Unique: 9otTH9cQNGysJqkhjb3Xyg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cKk6qagDZQFV3w5j38n2fD5jpJ1jicuw/eIZoPniNXGyTlIHc9RaTXRmpGmJ8rV6d8uJ5xhKEyzpXxyYG3qhZAFHchJ/41KW9uVIMiVu+sGUixXTcDYIJB70gmkY6Mrwbb0+mStvhQFfu5a/aEvKRCvzV4OvmrztVLXkqBqN02jByZi6kb8Ph7WWfM1N77fGl08zd/DX62+86IFg325Dao0zBVTFdkaCczWZTZuCxRlbScSN9gzllNCSkS/lZl7uIv5TiK8Oxh5/XlNjclJwcV+Uhx+dZ+EpdKV5mQGXjaOgh3g+48UP6XZS5iPMyCGdi4nKxi2pJ+KDTFIVYMlFGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IrZylJTpCAzfeSRjCQ3TVLzNp2tEk2Z4BxiHpu3jec=;
 b=bBg+IaoNUordQHDzpuCZ9riviFxnSczYx4wJPC4devL+OXB/v2jBoyYGJyeOHbDdA1Dn/l8gnrpVPMoACkqYXtqMbNzjbBx/NxdVN8x2ZqmT893MeAhJlENMEWQ/64UPENJhNRIQaIR0EW908kBXxjPaSim36xcoC0LZXTxzSx1iY1Rif2Z7LTyzduHYlV3skBryfJ6kXU/Jt+QZmbTN9ISXdmn6cJVhr0OqCVI4y9eZitz3i7xzzuuSbaSByAGm4eYa6YO/evteocIhDjB78VBm+6lfLW60kfC2ThSAg0ABHwxy3PoGDUlLlnFBQhizbzI3qy3WhUOaIn9Oh0tEVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7671478f-e7c0-c43e-6395-1adc70333e04@suse.com>
Date: Thu, 7 Apr 2022 11:27:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: [PATCH v2 0.9/2] VT-d: don't needlessly look up DID
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <6e1c7faf-d1ea-1a61-5452-9dec5b8fd221@suse.com>
In-Reply-To: <6e1c7faf-d1ea-1a61-5452-9dec5b8fd221@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5P194CA0010.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::20) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5cdd8ea7-612f-4902-7572-08da1878e562
X-MS-TrafficTypeDiagnostic: AM0PR04MB5507:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB55072F842206F56998709BB1B3E69@AM0PR04MB5507.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xezOVYSmxcYXWldNOhPvZNbFmg30dC/hKzq7hDgQt2ZOqjKm57qgXKFZPUX2Z5/pKk7Cr+Xm8+lWUsGD7JRuD0+p4ec3vHsP9++RA8367yjfI7t1biBUxEI3HyGFUFGWY4OTa+zMLj4Ua4WxeSp8KCfeHMafslJ3YsArZPNp6K6DyDQWiBZpfe++fP98Bn2ps0orUZm5kH71n6oBt1cmLggZJaQzocEsXe5r1NAPNerWtOVX3pWTpYsTHDzZqm/cZiYDjk54+FTUqEhaNOJ45aAR7w61lMKpLxoNHBdC8YlybqOmEM8dF6Bx6eA18z5yx2sREB0kWWwztBqtQylfcyz/Qdzya2+2zEnU1ZGYatUVDsezClD/ZxIlZvGCoR3zaCBB4vSzKr4IppFHhhjE3rkq3DahdqbEnBGOGGoy0FJ4YGYo/Izm7rZBz7de7rAbm+pytvyLjFgq9kjmY1/3UMdTbFatNSK04JWev6F23iCXFYbwTOryuGD3tnMFvLJ20oHHvB/PULyrsYKd/8uVC3fISBJYWg6ox5wL2+XeX+U4NMLzT2JiWCVgzm/wxVhzGAx10EkVZ1t3B8a3M+YxuiUjF99ZKFsRyyQlZYXmHSoNOG8xaa9kV0+v3cVmVh/chk4B6/XPolSJX6arffzYcg+JUKXSf7/KcXHcAt5S2vIvGAbEUDJ5PVH05DzOWDAZ1OnkL/55MyLQS0h/9gnvg0jwNhU3/y08Wo7cvMoq3Qc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(6486002)(6916009)(6506007)(6512007)(26005)(54906003)(316002)(2906002)(83380400001)(2616005)(186003)(38100700002)(8676002)(66476007)(4326008)(8936002)(66556008)(66946007)(31686004)(5660300002)(86362001)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?by95UFJYTytkanFxNmJoUXIveWRUTXFuRmU3ZkljZkN5OXVSelVBWkhuRHcy?=
 =?utf-8?B?cWRPbzVSZG1wek9XbjBicnZrejR3U2drOHZLdkxVVnBBZnNrb2RkcUE2K0NY?=
 =?utf-8?B?WUJTSDZxMmw3M3ZDQkJ5d1lUbi9CVk1XY1dwK1dITzJhOHJWaWtDVmJPWEZQ?=
 =?utf-8?B?cDJjMGg5QzJJSmV0cnpPYWZqWEM5UU1sZkptTisrTmVQNEYyenhXNXVTMmc2?=
 =?utf-8?B?S002WWpyc2hUTnlIUHZxWUU5QlI1RUYyNGZBMnpSL1NZQng4Y2o1eld2aFli?=
 =?utf-8?B?NjdGMUp1bW4vMEdsUW1UQXIycWhFNlU5M0pSbXN4N1UxeEwyMzJDNmZGS0ta?=
 =?utf-8?B?cnBMbkZVak0wYWRNanI3Mm5Ta3Z4VmJLdmtyT1p3dHRYMDdhekhmSUhRdkVt?=
 =?utf-8?B?Z0JZYWJmY2M4Q1lUcFlsbHhwNWtnK0RmRUw2ZXUwRm05OGsrTWFicGhvNmxF?=
 =?utf-8?B?YjVLSGw5VVpUY3BUamZKWUlrbENNQ1lwOGRZc2JBSENYaVVFQW93eFZQcW0v?=
 =?utf-8?B?QVRFSUtPVWsrNUlvbXlyWUpwNnRNN1lTUnp1cnZEaTVJNjlBMHF3eDZ6MTM4?=
 =?utf-8?B?NUJFdXo0aU9OOHF6ck1Ga05CZzFQdWIrdnN3eDZNZzMrSHNlV21oUUEzWWhE?=
 =?utf-8?B?ODdqTXlvOURaL1ZEVG42a3g0dFBNTXVmeW1wQzFJa0c3ZzdRS2tFS1NjSjNI?=
 =?utf-8?B?ZVZNemxYRHpUQlpGRFlOS2dKQitBeG9aYTh5NjlDQmZvWWlUL25UeVFQV0Vm?=
 =?utf-8?B?YWpRTkdIUVp3b3UrOElXMmVUTDJYbWgrWnJRaTRXK2todndncGFVSHljY2Fq?=
 =?utf-8?B?cHVOWUdHeDBqeGNySUlUcjdFY2t4RU92OEVHeDBPcjlBZ0E1OXZ0ckZTRmwy?=
 =?utf-8?B?UTFuWFhQVUM0ZFdrR0JtZ2t1VjUwMmhIQnBaV3VXQVdxQ3pHYjdycUowSU82?=
 =?utf-8?B?WDN4dGpQSFp1eWRCQUJEcHFCWFZydnBUbU96R1hDcm1zcldjRVlFaW5FTmdF?=
 =?utf-8?B?VVFqSGJpeWNOeG5pZTgzU1F4dkNwakJ6Y1hKSmpoWkhZUERkRldtOFFXcmg5?=
 =?utf-8?B?cWUvTU9XY0hYWFBURTJ2bWN0UTJ6cTlsMXRDSkU1bGI0a0NEZXJMaGFvMGtF?=
 =?utf-8?B?YVdyNUhOQVB4UDJyanZZaGpMMlR0Yk53dVhyNGlrcnNibUtqQ1VVeEpZRTh2?=
 =?utf-8?B?Wm5DSFo4eUxlMktNemhXRWJCZU5pUzlYZ1VrM2hrZkFscEM2aGNBbjVFeXRF?=
 =?utf-8?B?S2hOYVd4ZWsyTGNZVHZyT2ZWM1l1ajdTbFYvY05xcHk5MG0wTlFMMWtyV2oy?=
 =?utf-8?B?ckY2MEc0d2JtbjVaV04ycG11cWJ6TVhsb0FnYXBXTjF6TWlkckR1cHlJcHh5?=
 =?utf-8?B?b29yZFl5M0E4RldWM0g2ZDhBcVRFZHYwOSsrSHN2Wk1SRER4TFphQ2poY1lS?=
 =?utf-8?B?enBKY0xGT2dGWkJMbFV3TUIxM2pRV0dIemZZZnppTFVSMEhOb0NpeVY4b0kz?=
 =?utf-8?B?cjhLbFg0MndSeXRyNmZCV0doY1lQSFgrUXRqbzZvK3o0b0VFbHJTeFZLR3Yz?=
 =?utf-8?B?STEvUU5kUU95ZFpyYkhJZUJFY3F4dDg3MGtGZFNKNDFlamY5U25vODlJOTFF?=
 =?utf-8?B?VFA1Z0RuYklzTGQxL2s3Y25sdkJwdVFUVC8xUFV1aEZIekI1SkNONFA4Y2ND?=
 =?utf-8?B?QWxsSU5GaDA5d1NqeUhTUFlYay9WNy9wd3hJTVVPWFZSN3lkcVZMMUp4bHNB?=
 =?utf-8?B?dXB2S0Mwb1dSQmtTSXFKUUs3bTVicjluWTl1Z0JQb25qeS9EaEhJaitXRklD?=
 =?utf-8?B?dHRaL2gydXhxMW4wM0luOVRDejNrbEVLb0NMMis3ZTBFaEtDN3FJRzVpSU0w?=
 =?utf-8?B?anJlQitvYU9YU2JmS1UydjZscUd0dkxKZGExZHprMnNJMFF0QUdFK1dnbDFI?=
 =?utf-8?B?TkFCOTBoMFNhQzJSYjNIM2RveElJeWJKR0lQNjd5bENYbVMzdGxxTTNKbFBG?=
 =?utf-8?B?M0JIMGFjZzN0cGFrdTRYYmxydlFiaFE3VVlJUURaQlFiU2J6eGNhME81b0t2?=
 =?utf-8?B?QzdCdVpUZUlrb3FVSzlKRTVLWjRscktzUFNjbHVrL1h4MEFITjMxeDUxM3VS?=
 =?utf-8?B?UXlKVHduNXpqUFBRVWhkZUJhUlFsbk9hcnM3aThFQU56LzZYdXZTUnFEMUVI?=
 =?utf-8?B?ZVFrcFVHYkxJWXdRZmQ5TFdBdS9NZ1krWnpvVXovNVgrTmFFempHQnNyYjJO?=
 =?utf-8?B?Zkt0eG9od2V5RnFBUi9hRmRVK3h4dWRFRWhYRWpUVWpsUlRoZ3pZdlhqZEll?=
 =?utf-8?B?bUxXSXJGbWZZMWRNa2hMT0hsd09Ccitpc0hHM3FxbGErVERoOUpvUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cdd8ea7-612f-4902-7572-08da1878e562
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 09:27:55.1329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yC97r7LOGS9qa2PDJ+uKnoBR3IoxliSCv+XsbTy+tsAPRkpUJciCFYfDJ9DT0f2/I48HyEotwwEPCc81HBXKpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5507

If get_iommu_domid() in domain_context_unmap_one() fails, we better
wouldn't clear the context entry in the first place, as we're then unable
to issue the corresponding flush. However, we have no need to look up the
DID in the first place: What needs flushing is very specifically the DID
that was in the context entry before our clearing of it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This (an intended follow-up to XSA-399) is actually a prereq to what was
called patch 1 so far in this series.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1830,18 +1830,12 @@ int domain_context_unmap_one(
         return 0;
     }
 
+    iommu_domid = context_domain_id(*context);
+
     context_clear_present(*context);
     context_clear_entry(*context);
     iommu_sync_cache(context, sizeof(struct context_entry));
 
-    iommu_domid = get_iommu_did(domid, iommu, !domain->is_dying);
-    if ( iommu_domid == -1 )
-    {
-        spin_unlock(&iommu->lock);
-        unmap_vtd_domain_page(context_entries);
-        return -EINVAL;
-    }
-
     rc = iommu_flush_context_device(iommu, iommu_domid,
                                     PCI_BDF2(bus, devfn),
                                     DMA_CCMD_MASK_NOBIT, 0);


