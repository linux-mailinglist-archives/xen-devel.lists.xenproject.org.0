Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FCF46EC4C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 16:53:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243154.420544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvLjX-000142-0d; Thu, 09 Dec 2021 15:53:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243154.420544; Thu, 09 Dec 2021 15:53:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvLjW-00011w-T5; Thu, 09 Dec 2021 15:53:22 +0000
Received: by outflank-mailman (input) for mailman id 243154;
 Thu, 09 Dec 2021 15:53:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Con=Q2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvLjV-0000wM-Es
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 15:53:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21c37606-5908-11ec-a831-37629979565c;
 Thu, 09 Dec 2021 16:53:20 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2052.outbound.protection.outlook.com [104.47.10.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-IrzcLQ9iN062o6QvFlXcGQ-1; Thu, 09 Dec 2021 16:53:19 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 15:53:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 15:53:18 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR07CA0053.eurprd07.prod.outlook.com (2603:10a6:20b:459::20) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 15:53:17 +0000
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
X-Inumbo-ID: 21c37606-5908-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639065200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X1JkCI513jhv/rTO/fuBWeH3kMDCynbS33Cs/DQtrM8=;
	b=SymmC0ViDqsjig9dp2Pgoi5Z1CAfFUig8e8amPEIBBIdS9uuFfyaNffP2MueCcZhlytAlv
	PSSUwrfbr60+CnNorbLB+WJWdrpdEEkALTFMPhGAUUjzGQrmw6qAwN6NjxWbBapWe1TUeI
	KOOQKcO5sqtsmbpd8iZExJPmjHWro48=
X-MC-Unique: IrzcLQ9iN062o6QvFlXcGQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YWZzrmcNsalZKJXAQYMPwSCJZ5CiYj6OPnXG7BJNZrEnMQI6jDUlk8Qb2sGdMPEyNUagJ31HBORHFpwhmSA8jCl2AhApULIWUSkxTckkAnM08uqRIeK4GmKnNi8Eos0hC/IURNDBt8aAKsply2xqMCYqwesSMIZATNkl1S7ExaqyuHe/UvMJz8NNu+bZewOcSeHY0hsbzZps7vrCVTMcz7q9P5/K1p9wtANXxeUDjmI1ZW3Wz/vKzy3/nySQByCxURbms4lfiN7sppe3yh2yu5wCD6KaK0iSH2kT8QBD+98kqxY2I0jN7dhXg6EEwOtG3dpsvgyhgvHukrulxaX91g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1JkCI513jhv/rTO/fuBWeH3kMDCynbS33Cs/DQtrM8=;
 b=Ip81rRYkgEQNytOYoSTWbR9k+baOfpAT4TFahxt6OgUguOwmdWwfMMTs8ImRxl7iSlT5ddOPP4wctnC25WPuIEYoTbq3nctw5V64PGZ60lO35ErKZZ/cCLpnzs/0ztO9oFcGAHLIDaWYYw4oUtJvXNmXe7OcYKh/HD3kaJS7UnWX+YtZG8QX33Uh+hYakRyrMsJDiGaGfO+EAEfyJZyVnzVLzzp7xfKGfQt+FjSeXrZcI4dS/0SslAxNAN3oAJ2Tf6fB2m9+wAo7wD0OWHs2qcTNkf1dvD/e48NGwtxBr9Vw1a52ts4pq+HFoubcR2BeKHcXCmKa+F5P6mhwNH6B+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6d8407de-7941-00b7-7607-3b9bf8c5513f@suse.com>
Date: Thu, 9 Dec 2021 16:53:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 2/3] VT-d: use DMA_TLB_IVA_ADDR()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>
References: <5b1a5093-610d-f7d3-8d48-e843d86609da@suse.com>
In-Reply-To: <5b1a5093-610d-f7d3-8d48-e843d86609da@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0053.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85a771a7-f2ec-4f09-5a71-08d9bb2c04a4
X-MS-TrafficTypeDiagnostic: VI1PR04MB6861:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6861E89952C33FA443215859B3709@VI1PR04MB6861.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p1H9hjtdr4asnuaXnnAAowK4cp9J5YTyhyeOjjQlNTGDJY+VDlvtQy4Rb17o0rTjqJ+wGlOCWbrsrACoaCrc13U2wXWmBqy0Tm8IgURa2iHVYEtYIU5D8Nqd9/4fZTM/j7A6Gqzqn1Nujr6uIP8iBFAoJoRrpBMlnQXRJtbDRpg/38KnAaG3H5rv5cF3B1NNIjTKVvcXIlmRZPakS7D6jFvlyAbB7sDJ5QzQgSRaeW68bepwnAwl9bPCery7/PxSOq5AAanZ5iPV8y0gBXJ4VZA2qwvowFYs37bqJ7crmq2ueQxquuaJKSGFFy79bgM3K089LiQnqqwDsWrUyjFEXW7yMTLTsU9jVt1T1FXeNezeGop9DLiM4iISCFThLXUm0myFW5shzbZYaQdbgwUrKf2x8oz2ReA3ZcFsMIw0ApIFnpvP/x3GXWXrLlKi/VFcSdvVX+Q068GsNZWdKvpANCFFemC94kaTM6hUTLtszSFWEY9aRMNZD04SBUQ0hYuk5uV7IxWI01AOiOP0wuyDCzGnOQsKkai+KW7DBoneO3YoAwZff0Me5LoQrVyUt/PcWfQZxoSPJBjijutN6LhT8miUnqfLkDbiukF6dlFe367c4ABr6IhMLUDUhLS6xizAbiaF5lNkfYdIGYTlz2RORS+3KUYnNqgi32vAgLesTrQabZL0VOxeVhicyaIzX5Aj5D4kq6RTefgXiBmPI19Xi8Aw2F5R74FRjnyCaPf1eldRktndwiMOmOxPhsZ9y+mm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(66476007)(4326008)(66556008)(8676002)(186003)(31686004)(31696002)(5660300002)(2616005)(16576012)(316002)(8936002)(38100700002)(956004)(36756003)(86362001)(2906002)(83380400001)(26005)(508600001)(6916009)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkZLRlNhTXJLUCtEdlNZUThlZUlvQ0c5eGFPQkhreG1neDN4WlFLWE1XOXJh?=
 =?utf-8?B?TEVJWlMvSGsvalE3V2xDZ1BVcFhuem9PM0pvY2ZWZ0QzcXNUay9HZlpFdkFo?=
 =?utf-8?B?VUJSS0ovSTN2cCtjZkorTUNXajJBMUJLMmM1V2lmbncwKzdjSlBudFNnM0F1?=
 =?utf-8?B?WU9tTTBybG02NDRtMzE2NHcwR2ZlUjBtZFZrMHBKaFRQR1Q5MWRySHluWDEz?=
 =?utf-8?B?bU5CZEJxTmZITlpFbjc0MXVhRjRwUGh1MjF0RzBqMWs4NTlkZmFoQWxMQ2tB?=
 =?utf-8?B?NHNsWUxnMzEyY1ozbFoyL25YUXR2OWI5WnpILyszdGo5dTV6czlhSkNuRW5Y?=
 =?utf-8?B?akdZOEZtRzJLZ0V2Y1FFaUdhU0JtWFZNSEcrd1NjS3lrcnBJYnh1REk1NjNM?=
 =?utf-8?B?UTRIU3JNSWw2S0lkWm9Vc2FnaTJLdTQ1TzM5bkh0eGMrQXNnSWRuSGJoalBE?=
 =?utf-8?B?d1cwc0VxbVZjQmVTSS9NT0xpK3JaMldhUkppQ0ZReUt3U1Nib1hiY1ZMU1RS?=
 =?utf-8?B?dWdXZDNBWHVZb21VeHlUQ3k5bklvMVlMN0JIbG5LaVJ0TWw2K1dXLzlYd0pr?=
 =?utf-8?B?VzRBaVlMdU1EWnhrajZQSzlqWkVGYmN1OFFrZmwzOE9VZk1zQlJYSDFFTElp?=
 =?utf-8?B?SWc5UVRqOEt1TUtQbjM4bXhhUWgwOGdBbHExR0hqS0RENmRmak1Zdm85Ykww?=
 =?utf-8?B?T1FpcjdXNVVQMFpYVWtCaEZzUWxwKzQ5YW56Qmc1Y1kzRS9BbnV6ci9KeWcz?=
 =?utf-8?B?MmNqTkNzZWRkUFNRRFNhSUYyQUxvL042dThNUlQwdGg4cUEwM3RWaXlyWUlz?=
 =?utf-8?B?Q2lFN3ZLN2ZZVDRBWGJDTnNhV01QUDY4L0Q4UlN2OHI1eTdEYm5BT21PSDhY?=
 =?utf-8?B?aTREL0hQVkFCNDBpcUJWMHdScjMzOEN2UEgvbTUzalBmdXFyUGtRbXIvRk1Y?=
 =?utf-8?B?VXBPZnQ0WHRVN200aFAwQzdvc0hNNWUzKzUwUjAyRm80RHRMYURNZW5ycVN4?=
 =?utf-8?B?L0h0alNQdzBCWVg2T3Avci9Fb3lJR3R4bm9yQ1ZITGZDbG9EOEc0aEdxUEd1?=
 =?utf-8?B?S1EvQlJoMlMyWmVHa3dVK0tzYzVwb3Y4bTFXVXBlb3hnYkZqWTlwUUZtZ3RZ?=
 =?utf-8?B?OWgxclBmSFpVaE1BN1BCWWZqSkY2WCtKM3dXK3Jnci9ObmY4T2JMQVVHRDVk?=
 =?utf-8?B?MU5hTnRwUW8xWXlhanpFSlR6U3hROGdiNjJoQUpmOGZTbmdrR1RjUkkxSFJE?=
 =?utf-8?B?bGxoVm5GTHRZUDkxM1FRcnY2b0xqcXpJS1hDWkxqZGdlb0NINTFKdDhBSDVF?=
 =?utf-8?B?SE5xQjRHSWQ0ZFpUM1U2N0F3cHBqZStGeUlOZE91SzVDdjBVTnc4ZVY5NW9k?=
 =?utf-8?B?TDE5SldhdThzU0xpMFhxRmJtSHFTcGMwT3YybWhFMWExRHJvdTNTMkx4T0Vo?=
 =?utf-8?B?RWxqVGVMcGNvRDFaS1FadFNNclJaRmFxM1U2c1UrS1VYb2x6cFo4ZW1kK0x6?=
 =?utf-8?B?OTNFcFZZY0h0NDQwMGIyU1pWUGRoYldnOGg5bE9pUkhwaUdycmw2eUJSNGc5?=
 =?utf-8?B?L2x2dlBKY2dBRTdzNzFYTzV2cmxSSk85UHdGWmlPbGVhR2Nzdy8xL0pscGJB?=
 =?utf-8?B?Q01wLzc4dmhaSkdDdVJhZG1zOEhFak9PQ2QzN1lianVLeTM0Q0dkd3FJRUJk?=
 =?utf-8?B?VDV2Z0NjeFJjQWV3NjdjLzl5OXB4Tk5SMyt1NE5pTnZoajJpek5meTBWRklN?=
 =?utf-8?B?UW05RE9oWmdreVN3Yi9yajlwUjkzcEV5MEIyQ1B3VmpIdDdPK09Td1ZQZVhP?=
 =?utf-8?B?STJaQWI3S3FxTUM1WVg5R3pxS1R2Zk5SaXBadldtQ3lVTVVuRUI1RFg0SXVX?=
 =?utf-8?B?OVZEVkRHVjdhaUdoeTdlS1IrQXVQRkVOWWlnZnBtRlp6K1hUVWxaTVVNM0dq?=
 =?utf-8?B?N2kzZ2gzT1kzSzR3RFRCS00wR0NSaEY5WXpoN2pHbjFPOTJlSlQ5elNtK0to?=
 =?utf-8?B?UStWUkdUYW40QkZudkE0MlhBMkRwUklVU0N2MmFWUHV5aHo5NnFTWjdla2Qr?=
 =?utf-8?B?UU9UZW5zbWZKdjlRaFR6cEp4bzljWkNYQ1RzV1BWNG1iZ050ckJMMjRuamov?=
 =?utf-8?B?eWpIQnlxZGhpWGszbFpaVWpNTkRpYzBzd1FUTExlRU1ZQmZzeUE2Wlk2TmUw?=
 =?utf-8?Q?A25OKvgmVYHeXaY6OEIxHyE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a771a7-f2ec-4f09-5a71-08d9bb2c04a4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 15:53:18.1820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jrfsm0NeILWuhK7GUzSRX/uNws7Rf5d7WiowxNyhRA2yWODMThHxQP5cwG4eI6s/bJAnpmWqXFL8PxfEcVvyOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861

Let's use the macro in the one place it's supposed to be used, and in
favor of then unnecessary manipulations of the address in
iommu_flush_iotlb_psi(): All leaf functions then already deal correctly
with the supplied address.

There also has never been a need to require (i.e. assert for) the
passing in of 4k-aligned addresses - it'll always be the order-sized
range containing the address which gets flushed.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -546,7 +546,8 @@ int vtd_flush_iotlb_reg(struct vtd_iommu
     if ( type == DMA_TLB_PSI_FLUSH )
     {
         /* Note: always flush non-leaf currently. */
-        dmar_writeq(iommu->reg, tlb_offset, size_order | addr);
+        dmar_writeq(iommu->reg, tlb_offset,
+                    size_order | DMA_TLB_IVA_ADDR(addr));
     }
     dmar_writeq(iommu->reg, tlb_offset + 8, val);
 
@@ -606,8 +607,6 @@ static int __must_check iommu_flush_iotl
 {
     int status;
 
-    ASSERT(!(addr & (~PAGE_MASK_4K)));
-
     /* Fallback to domain selective flush if no PSI support */
     if ( !cap_pgsel_inv(iommu->cap) )
         return iommu_flush_iotlb_dsi(iommu, did, flush_non_present_entry,
@@ -618,9 +617,6 @@ static int __must_check iommu_flush_iotl
         return iommu_flush_iotlb_dsi(iommu, did, flush_non_present_entry,
                                      flush_dev_iotlb);
 
-    addr >>= PAGE_SHIFT_4K + order;
-    addr <<= PAGE_SHIFT_4K + order;
-
     /* apply platform specific errata workarounds */
     vtd_ops_preamble_quirk(iommu);
 


