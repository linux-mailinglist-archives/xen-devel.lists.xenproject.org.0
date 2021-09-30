Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D5D41D4CD
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 09:52:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199500.353616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqrs-0001mi-Vw; Thu, 30 Sep 2021 07:52:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199500.353616; Thu, 30 Sep 2021 07:52:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqrs-0001jk-Rf; Thu, 30 Sep 2021 07:52:36 +0000
Received: by outflank-mailman (input) for mailman id 199500;
 Thu, 30 Sep 2021 07:52:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVqrr-0001ht-CV
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 07:52:35 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ecbac88-21c3-11ec-bd3d-12813bfff9fa;
 Thu, 30 Sep 2021 07:52:34 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-0eng-7IzNMKM_WUJ0eN_CQ-1; Thu, 30 Sep 2021 09:52:31 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4941.eurprd04.prod.outlook.com (2603:10a6:803:5a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Thu, 30 Sep
 2021 07:52:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 07:52:29 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR04CA0017.eurprd04.prod.outlook.com (2603:10a6:206:1::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 07:52:28 +0000
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
X-Inumbo-ID: 5ecbac88-21c3-11ec-bd3d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632988353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZHc27peg13663JzGUs4ZDuwHlmiLMP8fAVjD66xZyOk=;
	b=FOjx8cVVKLzrGncZjhDlR9XgdjbeGrRjW7EXyKiDRnpY+eeEcjjBlxdDVCqJ3Cx5B8T0P8
	CyRF54v6xMjQ6QcIXTbHABzqYdw4Tr37KOSB/7YQiSLQpVUbGH7AbnyDJ1TuyHBg2WoFNC
	RRbU8DZ61xfTlwrH/QFoMuthnhJIIHc=
X-MC-Unique: 0eng-7IzNMKM_WUJ0eN_CQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DVssgNz5JCm3SYPmFQGZ1bIQLaKB6r9lPN226d4GsD885C1eJQwNzwHs07gbmFHIT+rown/qkgfd3NfiLvr32Mjo4qf3ywzFg1Lle0qpu01uNV/Q1asR4CkVBUB1pGbmfOi9L0mgRe/MMRMS4+b9gfLGf46bS+LayYrFhP0POP6CpSdn751gK8U6uSi+Yvjt0HJAoCaYqUdBfwVPohOjV5fgeVTWXVeSsGSwQoQzuk74ytbgOdSSFUXJL5b9Qu/MmqUTJ7I7S3dC4s0eVpkoIx1v+ZBgsY/jH1GZzsl4n2bzv5jFJ4KeWbBXiAR4jtUYYCtqiB1bJ/kRDO2Fd3CaeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ZHc27peg13663JzGUs4ZDuwHlmiLMP8fAVjD66xZyOk=;
 b=oXs3B/hmX1P1tQ9pYSG+nWf1Q6yC5P/OImeT2UZHlE+3h/7mlq9zGvkIPZ9RPjUes/vhzeDABYoKaLPxCAHTb3XHfVIh3CozguPjGTiD3ePeohI0JK03eN6zabLQNnIbIaByDrLdW6BhYR+yxwckC5wf8EvKBiOaKO7cJKR8vA7LJCZMv1qIKVXflsBkD82Joo+JihSvNEP0qR7n7bCZ2gS4MtbXAWWUsZPmaPZGshIncxia9Gcal30cR6EkbHJnT0a9rsrmDH4h76rcoXw9DWF/dSAntfJjRJyV6pgk5+a1WbxVWi7qi5OHn/swzRcSdoZp0GVCDJBXekJbOJhBqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 05/11] xen/arm: Mark device as PCI while creating one
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210930071326.857390-1-andr2000@gmail.com>
 <20210930071326.857390-6-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ecc8024f-d3f1-ed47-fdcf-dd5aca40be97@suse.com>
Date: Thu, 30 Sep 2021 09:52:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210930071326.857390-6-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR04CA0017.eurprd04.prod.outlook.com
 (2603:10a6:206:1::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4490a5a3-1f2d-4dd0-6f21-08d983e740c5
X-MS-TrafficTypeDiagnostic: VI1PR04MB4941:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB49411FEF26911C99B0FD0319B3AA9@VI1PR04MB4941.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rBWyFeW7itBS9WBqW0kxMSeACxpb20F1eWjs24wQdpqqJOrUbpx76q36shblbgeqHbQogdKWWyDjWpBE3EA9ZFB5WII/k22MB/Lh3Z4TSJkfRqH884AT+GtNN+HzKLO/+2YzebuIQ0dMsSkUqUGAfYXSu2PD9iO92LG0OvkrzEEA3VDq1zvi3eyba1G89TxrbSqZyl6c2iDRqJ/dQqsrsNJsQLucEeljfszMOI0bHGYft/EPRAMb8U/EFTCgcFCaQ3mGIyAQC2cmRqv7JkVjR/vwPSPq55l0sTUUs7kIi65M8KbSeqXjycaBIrVJ1Fj5IuYGEVXes+B4m6FGMIStOwkC6PJ7Ad36rjPizo8UtTMC/Uapk4bUGuE3nZtBQwjdjbOhC5s7WcIcnwnaIc6QNKLQopu3UyRxDJFjhx9B8iN7D5X+9hRZUI221tzUD1c0npK6kGzJ52A2xkrk2RDfzxTTHVts796O8DpSPTWYjaQtwdhXQeluSDKctUmZBRuIBotvkHRLemxAWLK924KvFRbeM3PnbrgzaRRoLGV11Ft2jKYdLuPYQ4OiO5BgQ/8i02qS5sSEDYVH9O4IeKe/yM3UQ9Qr3zAkxjH9rpcFCuMJt5avQpMJzSZs5BTQ+tvwOYl6QX5xzmwqw4L3Dlfn9VXz+dR5EqCPX83gDR29yzcwG0cRlaxbutl7QqBruz28qS8E5MqUpGpA70v1HtEHXN3yFU7NmfUStK7N216VLy2MdVoB1S50BDIOSMwyQ7rv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(6916009)(956004)(5660300002)(66946007)(186003)(6486002)(31686004)(16576012)(38100700002)(4744005)(2616005)(4326008)(31696002)(508600001)(8936002)(8676002)(53546011)(36756003)(66476007)(66556008)(7416002)(2906002)(86362001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zy9qbVBBaEZMVTU5UEswMFJ0aDVwMGxhZWpQeWx2R3RBU2ZOZHJBU05aeHd6?=
 =?utf-8?B?NjdQT21wTGZGQzgrY3g5NnI4bGZ2azZLWWJHQmFseXdvTXZnWXFNNm9xODNh?=
 =?utf-8?B?WHBxNDEvWlBSaHRhZEhJZ2VDQmhlY2pvNnB1MC9wZUIyTGcxUFc5dGJPTHZl?=
 =?utf-8?B?RzVzV01TeU1oWHJEUFBpT0FyN29GVnU1V1I2L01kMzBCSmlNSHRpY1Nldmkx?=
 =?utf-8?B?SGtIdHNHaUIyaE5VS0I1TnlvTW51bkVzaElpbS9sc0ZpNUpQNnppR2hTOWxV?=
 =?utf-8?B?dFVzbXZQMHBxUGs4T2JBbjRQT3VIeldRZEdnbDZsc0FJcTB3SWVmTThYdjJP?=
 =?utf-8?B?RE5saTkrQm1WaW9JVU90Zk1selBrbGpKOXIyRmZudmJ3SVA2K043VXNFbzJD?=
 =?utf-8?B?R3N1bGFwZjdENlM5a0dncTB6RVRlUllpRk5QT0dvaWg4c1VVa3BsSlduQnhU?=
 =?utf-8?B?cG5Sa1R6ZE9OZmtudnhlSHhqSXlQcnJLeWVwQ3dvcTlEVFFVNXNOYjNGdm9t?=
 =?utf-8?B?ZUpvVzRVQ2kwSnhIR0NFOXZubDRkZkJ3ZHdWSG9Mc3B1WkFVME5PdWFKVUZJ?=
 =?utf-8?B?SjVESDhNSDl0UlEvVG9iMi9MUFlKVy9nKzNiNHkxOUhSaW5pM2pjU0p1WnM1?=
 =?utf-8?B?TmF2QWwwS2JKWFNFWk1GUEVZQ3NPU2N2aDBwRWR6NFYxM0MxdXR3UjR6MHRK?=
 =?utf-8?B?eUxWMHFNYjNmYVlpeFM5NXVpSW53S3V6VU1SN1hJelFqRTZJSmY1aGJOZnBG?=
 =?utf-8?B?ZEJscWJ5bjFyVkh3TFgvSnJ6aE5YZm5WbTJ2TmdWVnMrdVBjU3pRZUl3ak5H?=
 =?utf-8?B?YmpLSE5YV1hIeXUyeWJ3WXNzR1o2RUtVVTYwSk5xbTlDc3JKa2hlaU1BK0Fy?=
 =?utf-8?B?aXhyQ2dPdE1sZUwrbHBFajBRUHV5Umo2M241MXVkT3V2eTE3UDNYb0JJaVpD?=
 =?utf-8?B?bXJZWE5pMnlGdGNicHJCTi9ZdUh2MmNpSCtqenRKS25ES2IzYW5tKzZnQ3V2?=
 =?utf-8?B?ek4wMlUzQm9RTVZzZElsVnNWZmF1Qk92UUZmYUpoeUs1RnFoVFhhVEZiMmhV?=
 =?utf-8?B?VnNkK0wxYjUrbFpEWkZzcW1Lbm16Mk0wUFhBK2liYTJWbEZ0dHltUmJ3QjZx?=
 =?utf-8?B?amphb2ZQR3JaaGZFRGZ5L3lIU1hQTEgwd2lkajk5R2xlandxUExKQWRUUzc5?=
 =?utf-8?B?eHpSdHFaUHZhT2JFUW9XRWNIbVVsd3loalFWN21RemtBWWRFTE1yY3FkVEMx?=
 =?utf-8?B?MklEUGVKdG82bytuRUV6VFVzVnBjM09jTnJwQ3Nla1RDbVRsWVNKQkdxM0Rs?=
 =?utf-8?B?TDd4cGVZYnUxTjBkY1RFTVprdnVjV1VxcDhweENzN0Fta2pYSm9BVGNrZjVt?=
 =?utf-8?B?OTBWaDBrdmpOZ1Q4UWhERmUyUE5LbncvdkQ1OHg0Mml2MjkrMlV3MVRqdFUv?=
 =?utf-8?B?ZG1WaHFWS3FQYzZYN092T1JjamJtNUk4MFFSbW50MmZpMkNKSHRWUTlVR2dO?=
 =?utf-8?B?TWl2dWhqbmpCZVBJVFQ2aVRTRlVDaG1qZDQ0V1ZhVlEzV0ZBbmJaWTd0N0NH?=
 =?utf-8?B?ZGNlNDlpVXhIUCtpQUhudnNUTW1rY09DL1dGR2JNMlNNVlk3YWl4WDNybHdG?=
 =?utf-8?B?VEFUQ2MrczgzNWNnYmNoRzhqVTNoa3hQbE9QNGxOZ2NiT1JxY051dzFZNWcx?=
 =?utf-8?B?NU9KZGhHWG5rSVlid3FzdmU2YWxJTXVXeEZBSDEvNjZDRG1yOFBQZ1ZYVEhs?=
 =?utf-8?Q?kp+aES19w1db27xRe1U9zp1DLJjjkjipQYvg4Mi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4490a5a3-1f2d-4dd0-6f21-08d983e740c5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 07:52:29.8160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6a/AsElm2Bm7GLv+KP0gcwEanJO6/dJyp1xRWU8sUQhWJ5ZnawHv0qXA7AtJKa6rHp86k8aVMNj1Yl2cfXsCdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4941

On 30.09.2021 09:13, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> While adding a PCI device mark it as such, so other frameworks
> can distinguish it from DT devices.
> For that introduce an architecture defined helper which may perform
> additional initialization of the newly created PCI device.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Applicable parts
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


