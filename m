Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 280503A0FD5
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 11:53:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139091.257303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lquW1-0001LG-FI; Wed, 09 Jun 2021 09:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139091.257303; Wed, 09 Jun 2021 09:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lquW1-0001II-CD; Wed, 09 Jun 2021 09:28:49 +0000
Received: by outflank-mailman (input) for mailman id 139091;
 Wed, 09 Jun 2021 09:28:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jMcQ=LD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lquW0-0001Hq-4O
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 09:28:48 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b6efa68c-0834-4d93-98d6-0b6d94b75f3b;
 Wed, 09 Jun 2021 09:28:47 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2050.outbound.protection.outlook.com [104.47.8.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-bvIlS6VoPZi8lL9dURHfSA-1; Wed, 09 Jun 2021 11:28:45 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Wed, 9 Jun
 2021 09:28:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Wed, 9 Jun 2021
 09:28:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0004.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Wed, 9 Jun 2021 09:28:43 +0000
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
X-Inumbo-ID: b6efa68c-0834-4d93-98d6-0b6d94b75f3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623230926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=txVdk0hVPwWU6U7vm39WYjxerByLtrHY/Ueo8afMxSA=;
	b=gYH1iwYocVb6ckhUnMKF8HR0/TCqsX0aoYEOcE4WabtBTdwey4I8RAPjCL3dh+nAN2Hhqf
	5GJ7CqWLCl+/vAO+bAenKBdOLFvutEe9svevQ5ksvzR1jWaa5zlaUvkjShmM8Fdvru9+Si
	R+51xps3X1usXjtJvMjkJsX+9EXKzAE=
X-MC-Unique: bvIlS6VoPZi8lL9dURHfSA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BalcyRP884+twz+aBkZDTFM82Kvyjxi04FtYerzBBokUf/wzgZA6KQCL7f2FOe+zkebvQ2debhJiPA/kQgVM82O+QaNFMQUbHRJ/+uskSJ2M1W/Ig8J/RTTsLIncu75x3tW5YO/sxuhGClm2q+uKAcncPwwe6kIpxVw8+6hqL3doAeeDOwfGYvKcuO+/+vI9jVgi/pihgPjdWe6hb8uJ48crTGskNgyNNeRPekCkh/nsFkbFk9QJaLAC84T95QJgTMA3x7V5SH0c+Z7j9oSArEgC0t+ixabtHB81b2EnUmYbtAg4fwVEGEjHgkXR1cTKbfAIsIzt6e8uEfV+npk8dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txVdk0hVPwWU6U7vm39WYjxerByLtrHY/Ueo8afMxSA=;
 b=MkleqzeUjE2JJiIKTstSyHNy4+I0hczL9XH9MQ6j5jlyIUuGly5BJaaWOXtk30F7p6uiRbhoM5CfrS4a5nt8R50E4IkSNANdGOkFGP6Rbb3xyAPUQ8UyFwkPhAJtm4xmYEvadw5p6JX4tr8e3c6w2NJIjcH/5/P6ZvDd/SsknjGDtHc6eOlX42MDGCtV3tKq2+7rVmoRZiP1b+vW1pipIjBoGjy4AN/Z+HcNweGlj1J4iTuLQ5aBp3VNj+2p+izGclAS+HhRdQLwcaS/nOeGPMeTcfE0DptgtS/A9SCOFZ1pE8BwfmdaIO6M5GgNxwNpDT+NFgHYrHqEJiM/vubhvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 5/9] VT-d: clear_fault_bits() should clear all fault bits
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
Message-ID: <fbb7664b-d55c-f3ce-01b2-e4e379e3780b@suse.com>
Date: Wed, 9 Jun 2021 11:28:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P189CA0004.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62062e91-acae-4b28-1f80-08d92b28f9e5
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2335C8685908C22588889D5EB3369@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6rMtZJP2nkCTW6Dkar5gUUaKr4vGyp0pIPzA3CxA40dyVW+P0c017KwvOpavyZlC83KqZVKGCcEwW6ER/nGmte7pBXD7xbHVqZldyIJasZuKUjZjKnu/PLyNCoxqTVh6ryoXWQZuuPrKkB/2QbQxUggOHFhxA0H6iGtw4KJY1+MHyO2/kAXpVWUp+Dt/uJECkTCzXtU96c7zkmAHvCJM2E//mBkQTNOTIkjfSZ6FEUJG51vyzrVgqR+Ki+6EUlluAVOgJKbGu7TOGbxEwa8rwYHY+xkIjDuA3Tu9lahcm8AONTBtsh9ZRvJwgn+ewtUMVoINyb22Qokzhe8RW+PzaU9mWB7pIEmfT3+/F7sfg3HrrYo7UzqzQSEaoh/OAuBLa3gIXG5NC4wMc6CzMD1c4XFLZwMvtgIcwSczBCfcmd7begJcZTnvrV3X1izgZ7U1V7Pms9rQXdzJXgTqQ10W6XIS7QavjlGEOTtpiEg4uSSO8FvPpA5a4T3JJZmV2wAo0Kq3b3iWtQZ6LnVTXhc/NHJ5brYG6dL95RuWb3flan3vRs276v+UEIlA1/4Ux61QBgEU/poxopnPNBgfQ1SRxjQudVImW62v6IbHXRGiBEanx+4Y2p5cs6dzvXq2EvBXO4Kiw2tNJsQWLqrnmRhbF5+0oji0V131qgLNU6LnKkVOY0jrVjltUYXRM3aFldS5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(376002)(346002)(136003)(39860400002)(6486002)(6916009)(83380400001)(31686004)(478600001)(956004)(2616005)(36756003)(2906002)(8676002)(4326008)(66946007)(8936002)(66476007)(5660300002)(38100700002)(66556008)(86362001)(16576012)(26005)(316002)(16526019)(31696002)(186003)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?c3Qrb1BabEFDQmxuZnd3TXE5UGN2Q2h4azd3RTRIck5mbzhaUFpoUnhnQkpt?=
 =?utf-8?B?MWFYckVVUHRCbHJoL3RQbWZVa3N3NjNDSm56OFdDVEE5eDhqam9PdXdOb3Ev?=
 =?utf-8?B?QTRlY2M1eE1Fa2FwVTJLUDBhZmZmMTI1ZUxnV3A4MzJHSDkwbEoxbkV5bVZI?=
 =?utf-8?B?Y1pRRXhjb25YUEFEQTlLMDhqZjdiLy9xZ0FxSWJDVE5XZm1NWWlSSUxzYURn?=
 =?utf-8?B?a2FHSXp0N2RxYlhiSXUyVGYyZEl0WnFERnM5a1BIV2Z0QS83Z05JS25PMDlU?=
 =?utf-8?B?NnMzdVFNL1Nkblc4QWZoWWVuY0tNMU9EbllkYTZpUHk5c3o5YkVLUjZCNlh5?=
 =?utf-8?B?ZlFkUDJZd3N2M3lMZHFYTklYRXQ3SVBiZWFxRklBQXVjWU96ZktuNmNUT3Ur?=
 =?utf-8?B?TkFUcVVWSTVZakdmVnFmMVBUS0xjaXBRQ0l3d2lkL2krYjhTNWlFTjBRSGVz?=
 =?utf-8?B?eEg4ZVg5ektKV0ZtYlpLUndJS2g1ZmJPT0p4RkdpWlBnWDlLb1Y0QWpjallQ?=
 =?utf-8?B?Q2FJU0xML0hNRjAzT0VsUFg4cFFQQXlMaXU1RFNQbUp4TnBVcVorVEpNWEpF?=
 =?utf-8?B?aUVKRkNERktNQXZuQlZQYWZTVnNHd1BQS1RTcERQTkJCWE1jV3RKM3Y4WWZR?=
 =?utf-8?B?ZlFOSEU5NjVEdytoRWNBcGpReTB5Szl4OU5KZndMOTRKN215a1NsSTZqZGox?=
 =?utf-8?B?UjJZVEQrbUQ3RnZDbGlFdVdXbVQvRGIwQW5kZzBmci9ObExNd1Bod0Z4WDJW?=
 =?utf-8?B?TG5vZUk0U1NlbDROR2RCZ2FwME5TbTkyaGROUjlrWEJZem4rdjJXNytsMmti?=
 =?utf-8?B?MDNIZmtzcFRhVEViRHM5ZVhNWW4yWHdqVW56b0pJM0ZaRGdHbXRKVERnMnNJ?=
 =?utf-8?B?TUVVc3UrZElZbUR4NkJNWWlBY0dtWHB4QmRoWGsyQkhRZEFhdHhhVGRyWnpF?=
 =?utf-8?B?eG1ENERtWFNKSUJWRmJmTlpKSXNGd1RkRkViRDZXbFphcUpGRHhac2c1Um8r?=
 =?utf-8?B?WE5iM1JCVjMwM1ljT0VUdk5YaFF0T2xjVDRPMjluU0p3ZU9OdXoyYTlPTHg4?=
 =?utf-8?B?ZDJZMXVBU0Frdlh4WlMyQ0tVRWNFZGJNbkpBNklDQzkraXFQTnFOQ09XRit4?=
 =?utf-8?B?SFpBazVBeXRxd3B5VXQ5bUdCTjJMSTZKZWdGTW9IeDBWZDZuU201bW5TSjU5?=
 =?utf-8?B?cXB3M2tCTXhWbFBzWS8yd1pEVWN4SzBoSzZwY0F4R0QyWlpFdmlwYnFtMCtM?=
 =?utf-8?B?VC93UTRPaUZaMTlvTGlwaTRMSHJ6YktnZGkyMzcrODZJWGY2RkZDK2pVQUlS?=
 =?utf-8?B?eVg3Ull3b0lidFRtRUxnYkVrQ29SallIeitMVUhHY04rdzVZMHg2Q1N6M0Nu?=
 =?utf-8?B?MFZPdmtVNUxkWU1NSUNnTnpYU1E2SXFOd0V3ZmJoenFuLyszRjFuamRpcStt?=
 =?utf-8?B?RVR1eklFMW9rcmtVdzZiby8yRDhJU0tRYzAvUWxmclRBMzI5OHBmZ3c2SFdl?=
 =?utf-8?B?dndOS05SVFV4aE1CNFBiaWtDam50ZTQrcUxhdSttc3NweURZUHpqSjFZdDly?=
 =?utf-8?B?c0xybkRXSHBVSisyWXhqNytLRlA1STQvUE1pOHM0eGt3WEtqK0k3TytENk1J?=
 =?utf-8?B?TDhScmFQWVBSSnBjRnl1MW10L2FDN2Q4ZFRTWi9keU5pRFNRWklDbkRXRXMw?=
 =?utf-8?B?dWVRU1gvRHo2Q1hhV1l5MHZjaGRyR1dDWXhISC84UW5KSUVsbGpxZW0zd3cw?=
 =?utf-8?Q?ogzZYuE+X+1Ro/BuDQgQzdtguDOZ/jHPFWI3ojO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62062e91-acae-4b28-1f80-08d92b28f9e5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 09:28:44.2184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bhsu9ev4SkKUXklHtRkbO91+z63MR0SjE73zBq+wUtS55yaLjUnwapLKbffEGW63c3XOQEzzo9+Q78tNbdPT1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

If there is any way for one fault to be left set in the recording
registers, there's no reason there couldn't also be multiple ones. If
PPF set set (being the OR or all F fields), simply loop over the entire
range of fault recording registers, clearing F everywhere.

Since PPF is a r/o bit, also remove it from DMA_FSTS_FAULTS (arguably
the constant's name is ambiguous as well).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2094,13 +2094,23 @@ static int __hwdom_init setup_hwdom_devi
 
 void clear_fault_bits(struct vtd_iommu *iommu)
 {
-    u64 val;
     unsigned long flags;
 
     spin_lock_irqsave(&iommu->register_lock, flags);
-    val = dmar_readq(iommu->reg, cap_fault_reg_offset(iommu->cap) + 8);
-    dmar_writeq(iommu->reg, cap_fault_reg_offset(iommu->cap) + 8, val);
+
+    if ( dmar_readl(iommu->reg, DMAR_FSTS_REG) & DMA_FSTS_PPF )
+    {
+        unsigned int reg = cap_fault_reg_offset(iommu->cap);
+        unsigned int end = reg + cap_num_fault_regs(iommu->cap);
+
+        do {
+           dmar_writel(iommu->reg, reg + 12, DMA_FRCD_F);
+           reg += PRIMARY_FAULT_REG_LEN;
+        } while ( reg < end );
+    }
+
     dmar_writel(iommu->reg, DMAR_FSTS_REG, DMA_FSTS_FAULTS);
+
     spin_unlock_irqrestore(&iommu->register_lock, flags);
 }
 
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -174,9 +174,8 @@
 #define DMA_FSTS_IQE (1u << 4)
 #define DMA_FSTS_ICE (1u << 5)
 #define DMA_FSTS_ITE (1u << 6)
-#define DMA_FSTS_FAULTS (DMA_FSTS_PFO | DMA_FSTS_PPF | DMA_FSTS_AFO | \
-                         DMA_FSTS_APF | DMA_FSTS_IQE | DMA_FSTS_ICE | \
-                         DMA_FSTS_ITE)
+#define DMA_FSTS_FAULTS (DMA_FSTS_PFO | DMA_FSTS_AFO | DMA_FSTS_APF | \
+                         DMA_FSTS_IQE | DMA_FSTS_ICE | DMA_FSTS_ITE)
 #define dma_fsts_fault_record_index(s) (((s) >> 8) & 0xff)
 
 /* FRCD_REG, 32 bits access */


