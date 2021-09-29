Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFE841C07F
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 10:19:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198817.352507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVUnu-0008CK-F4; Wed, 29 Sep 2021 08:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198817.352507; Wed, 29 Sep 2021 08:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVUnu-0008AH-BW; Wed, 29 Sep 2021 08:19:02 +0000
Received: by outflank-mailman (input) for mailman id 198817;
 Wed, 29 Sep 2021 08:19:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVUns-0008A9-C7
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 08:19:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 281f411f-6543-4785-ab68-5b9638b250c2;
 Wed, 29 Sep 2021 08:18:59 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2056.outbound.protection.outlook.com [104.47.5.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-jmkjQlbkNxiDy7szrwI5CQ-1; Wed, 29 Sep 2021 10:18:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4445.eurprd04.prod.outlook.com (2603:10a6:803:6e::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.21; Wed, 29 Sep
 2021 08:18:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 08:18:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0058.eurprd06.prod.outlook.com (2603:10a6:20b:463::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Wed, 29 Sep 2021 08:18:52 +0000
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
X-Inumbo-ID: 281f411f-6543-4785-ab68-5b9638b250c2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632903538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vTFJCWFjxefy2x10SalVUMklw74woPCuOh9Rm2fxbV8=;
	b=Pw8AZl04THMKR43JKQbxSYBrUg/P2VigrqCB75uvLtpu7YCkwa/+PPf73lET2+Fv8+0mrd
	avk1q52EjPc2ito0RMFT19IDm7ZIldnDTZjB9gxCWkqtaTZ41sawxcXdpwqj5KvzP6J5l5
	wLExnE80Ovidyq3DFihhlpBmQ0tG3V8=
X-MC-Unique: jmkjQlbkNxiDy7szrwI5CQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MS+XvJ2kTErcE1DlvqjG/m3DxXBiMdkjQ4/kPGRJNrvxN2w5PWn8rPoSOVBsWCAxGZnYzL+Zi+DPwsHlc/+s/n/k4cHP2S9KUwUT7f8SOv43TIdkpdQndUzr0o+VgZDH36CvHeebDG25PS4Smz8+pRkBa8vj4S5j+//I37xWrSLPvWL1zexdYgYBtcTUvB/QPZhOLVs0AFgzSwMySwKHwadZ5eFx/hBMexK80/Ll1yreH55nxAx4W+BxG+/g7ieC844PsCzppP/RXv7/8kEVtDNFil/jfblcHERh/17epUjkoA27Ptn46Tb0jgxf0aPgrvPYfbaDa3StTpBUeHt/vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=vTFJCWFjxefy2x10SalVUMklw74woPCuOh9Rm2fxbV8=;
 b=Pey5OQ6LxCuXfevoEkRjyDDAtKGMADIKn4TKKq5xPrRBsr1BFVw1eoqkxifRAWXWvR1Mc4fpedPrTy8WuLe20VcsWNUraz20KHClICkvOXbVdixF+fb8GMWDpLBBqsEbTEIqoMcphvsj4so5BVS9q7HaqXjr8MAIiu/TZckPwTPpfh3sX/26t2sWWJZBFqFvUBCG7XvtQl2x2B1Rw5z4gqOxSp+SjhPKxCEnANW/s45944r3moKWUTKMhItctna3MszMf5uJ21+dZmUS2O+KLlF+DIydMaZhOOEet0Fp/zh2ixvfO16MVM9A0+oWB94PbFduVf9Ucv6+Uu/23kZruA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: apertussolutions.com; dkim=none (message not signed)
 header.d=none;apertussolutions.com; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [adhoc test] 165241: all pass
To: Stefano Stabellini <sstabellini@kernel.org>, iwj@xenbits.xen.org
Cc: xen-devel@lists.xenproject.org, julien.grall.oss@gmail.com,
 iwj@xenproject.org, dpsmith@apertussolutions.com
References: <E1mVGlH-0006re-DA@osstest.test-lab.xenproject.org>
 <alpine.DEB.2.21.2109282301540.5022@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9dd9b794-881b-e157-45d9-80affa19f443@suse.com>
Date: Wed, 29 Sep 2021 10:18:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2109282301540.5022@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0058.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da0a94a5-6661-43a0-417b-08d98321c618
X-MS-TrafficTypeDiagnostic: VI1PR04MB4445:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4445613701A94A005DAF2BBBB3A99@VI1PR04MB4445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M+nf/iIkG/bTa1DjxP5wowTDmBiY2kJLGVsZa7Q3JdZp4A2OXAkfkJyVJnvHT3KqrPFyaOSixOnh5leyGkMfGbI0bFqkE8tsFIKke/BHkYLLp6cgGYwkHSYPpCyRfRfrtK6a7Zi+5Ixtr20eayJ7YZHZL5C9IK1Wumh8u9kQCmY5PXB0hEl5IlJLVvucm9lH0DzhrVrcO/kAeI55QSkPOUjBprNErM8T6/vejH1ZhHiuu6maRrkN0x1Ano3yJXaCTjKeNu0DGOAf+/xRnr6vCH0RHvxZUpb30K9yropK3uya3vXDK37dTesaCgO8jy9Nag02UwqV3yjfp9Fa3wi+QFDTkRJwZqhuMJgwf6nfmLZZ31uNNxT5WiTz3lxIbD4p5YqHPl7VyzQ17SGLpl31FGxiG82BtdHSi/sd4E9lymTfYgkVX3p7Uo1tlntiRWk7trfp1aIe9aX7dt6D8YnYXt6EALDnVb5wueg3YLpwWZcBOBaqunU95Md0IBhayvVyinOw/91Qa4zO66oIsgC6E8mi0/gaAjDylbxAMrX2QaspiLd5HB6cjMqvQj0FFTj5Gk4Uf7EjLC8QrlwsKE2PbqcJUbWOvvSLznhAXc3KMWRTrJ+XwwkqIigg74KsZfcPj8Fp/KEa+sawr1+iddKfErPteNBOe6XSJfixgAX6S7zHbuLZezVkgJkH6UPkCdaxVigwABqTGv5B+Kv0G3UE+ixbVfD3HSLQYUKc5OODqNw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(956004)(508600001)(558084003)(8936002)(6486002)(8676002)(86362001)(38100700002)(26005)(66946007)(186003)(36756003)(31686004)(31696002)(2906002)(316002)(5660300002)(53546011)(16576012)(66476007)(66556008)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnA5bTVDb0RudmNCaUFqMml4eXFBL0hVTlovV0M2RmFGVVdVUGNna2F0UUw5?=
 =?utf-8?B?WkRCTXVTNzBPQ3QyQS82dTBtRXpCcVYrdUErdzUxTHY0OGFUY055OTJ1UGxG?=
 =?utf-8?B?SVZoMXIwWmhCWWhQd0x0WVRhZzF1VDJEeUVGNnNobzhIWUp6S3MrYmc0aTVW?=
 =?utf-8?B?ZU1HMkNvYUVwV2NjT3piYzFrcHRVdnUxS1JCR05iOE9EdFBFVnlqNFNFQktN?=
 =?utf-8?B?VDRCbnlKdEJoem1tbDArNENQYkFQdkNjNnJkZVpvWTlnVkJlOE1FcUlxL2dP?=
 =?utf-8?B?b0xWUFVCelhsd012YWxONldUVUNmdlM4NVZNS1hGNTIxU2cvSTQzQURlZ0pE?=
 =?utf-8?B?Rys5UGhsYU9TZFEwNEZYMXFEb2JKRWQzQUIvUDZqWGtraGZqdE9rWlRRMmpL?=
 =?utf-8?B?Q0JBdUlvdXpmNUcwTTBpdGYrM0FBcm8rYVg4UHpzWWFScDBwcExTQkdBMm9C?=
 =?utf-8?B?TndxeVJKS3ptR0U2K0RuN3VOSG41S2R3dU1rN256S0tqSEhtZURkUmJLUTNx?=
 =?utf-8?B?d2VFMlRIbVcwbjlsbVVkZE9GWitIc3JZVU95dFdwckp3WjZzZC9zT2tidEJX?=
 =?utf-8?B?VVR2WVloSzN3QkV0QW8ybk1yN1RFTzBRVzdYSXBlVVZwZE8xOTFsWWJnWmx6?=
 =?utf-8?B?d1NVa1BaOGZpdGYrUGVyNGtxMjdXZUpKRGNYenR0Z1llYldZd2NNZlE0WVQ3?=
 =?utf-8?B?VmdUZkloRGY4WlVtRHJNdWc4OEkvMmo5S1ZGMHoyUXJCN2drbTE5dTl3RWsv?=
 =?utf-8?B?YVZiVWpGOVc3L25vWm5HaUdnUDNJa256ZGdxenQrNFc5Slo2YnhXZThacTlu?=
 =?utf-8?B?U01FdHQxek9icWc5OFpGMkk3cDYzdjdaa3U0d3VFM3NvclYvRVFNRVFwam5X?=
 =?utf-8?B?VHBpODhaUVZ3MkxySm5rMVpPU01aRVlhQ1VHOEZNMnBJNnpLM001Qy9adE45?=
 =?utf-8?B?L3pvSWJkUWZ3c2xVQ2FhaDJYTGFFaWl5VzlKTFhpdkRTSUhzdHlvdEkrdTBU?=
 =?utf-8?B?SDhPcUh5YVVjOXhEL2dPYmJHem5DMEVXT0Q5TlFyc2t6dysrZ2ZVcHpBMmNq?=
 =?utf-8?B?OHExbUNYYXhXcE5rUEl4d1dsc3pLNHc1cGhTdTZ5SHdkaW9JR1FmNnRZU1ZV?=
 =?utf-8?B?U0piSlVUSStTeE9XdE9QUVFxRkhuM3JaTVhXN0pTajl4QlllL2sxSnBhZmVv?=
 =?utf-8?B?MlZsSGQ1bW5FY2ZESzNYZFZMMVVCK0V0dm9WVU9jdUw4RHNkUDNybWVKcTFt?=
 =?utf-8?B?Q1ZHcHpwYTZSdHJrdnRqbENvVFp2N29FVmNrSCtpUUFjUVNPTXB5N0NJbmE5?=
 =?utf-8?B?YzBjQWRZUHVXYzR6cmhpZXpZS21xUDdlZ25Vc2h5WWEvTGRoRlhSdlVuQml3?=
 =?utf-8?B?SzYxaTVtaHJ4MXR0c3BIYWV0dWYxOWkwTXNqV3VvMWM4ak9SVmYySTNPNHVS?=
 =?utf-8?B?bjhjZjZIbDdWRUM5em5ZVnFlV1lianRySWR4MUhaQjdRYitrd0dzSkpqSEN1?=
 =?utf-8?B?L00wUFlPdG5ZaDdDYUphQUdQM2pQUVYvVG5HSy9YRi9RYkYxUlZSU040dVFw?=
 =?utf-8?B?eUl2eUtnR0F0Y3pxYXRUYVJBdG9POXU4My9hRmlQWHJsVlNLaWxGU2Y1enAw?=
 =?utf-8?B?TXhzMzRvajliVmlQckxnbU9KaXpMaENyelIya0dSdVREVCtDeGhyVkNSelZ1?=
 =?utf-8?B?U0Vzb0tJU29Vd3lDcnk0OExOaXlHbTEwNGtRVS9CVWpzM1N6aUl0SjlaY3gz?=
 =?utf-8?Q?e4B+in7orEieWvIzczJw+qUQr4LV9gFbi+XtP1r?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da0a94a5-6661-43a0-417b-08d98321c618
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 08:18:53.1333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BxdzEpAjphWYiWWJOyUfKJckeVzdyLDN1NPDCkUF5q7OsAYjjUACpSN+ISX+3xsSchMCXL+9HO8hRCuWEKUO5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4445

On 29.09.2021 08:03, Stefano Stabellini wrote:
> That's great, Ian.
> 
> Should I go ahead and add the patch to linux-arm-xen? Or do you want to
> do it?

This was only the build flight afaict; we still want to wait for the actual
test to hopefully indicate success.

Jan


