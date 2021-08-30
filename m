Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AE93FB6EC
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 15:25:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175082.319052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKhHP-0005Vq-Io; Mon, 30 Aug 2021 13:24:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175082.319052; Mon, 30 Aug 2021 13:24:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKhHP-0005Sm-Ez; Mon, 30 Aug 2021 13:24:51 +0000
Received: by outflank-mailman (input) for mailman id 175082;
 Mon, 30 Aug 2021 13:24:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhGR=NV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mKhHN-0005Sg-Vr
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 13:24:50 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0fbc0a31-09bc-42f3-802b-27e59267f077;
 Mon, 30 Aug 2021 13:24:49 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2058.outbound.protection.outlook.com [104.47.8.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-RwIivbvtPFCQ5dM3KIor6Q-1; Mon, 30 Aug 2021 15:24:47 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6669.eurprd04.prod.outlook.com (2603:10a6:803:125::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Mon, 30 Aug
 2021 13:24:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 13:24:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0020.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 13:24:45 +0000
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
X-Inumbo-ID: 0fbc0a31-09bc-42f3-802b-27e59267f077
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630329888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=61q6EZ98kQLJpqHj82iKq33gBS5mOJlqXj8nSupFsdQ=;
	b=MqJi100PAxdncuWD+qKy5LCiLCBbl5237+TPKeYK7bXsdwEsUrdrfTLsctjSOmn3dTkdMU
	kzwxFEWsonwZzv6nSVzwGUxQMLWTmTl1aArc+KRDc3PVbPG15F240GSi2hyhtfErBnoxZ6
	Sdf0CRAr1QaZ2gshKZmD4x5upem0nuQ=
X-MC-Unique: RwIivbvtPFCQ5dM3KIor6Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGjA0GqcJX9a32fyvEr8AKUVZjfjetlWodw6/PycSrwAPcQ+GiNOV3Vp+It0LVIM2HcTB1ZTUJMuIm2Wl3+m7QsiELQy9haOs6WhJ60Ra1r4Te/4emq9O9qYFz0Acu4TP04Nt1JlpGvjcn3QFvbHRRCIZexPBClsKGEg4dpbywFZuwG393XOTT+szfTl9B7IY61QK4mjM3V8qUPoXaV12LeRm963daQVd7bY/r1qS1IOSMPDt4K2la5Ocq72U1Y5t4U/N/s25yIIDc1x781c4wxinjmvOXyGk/KeZpuVPTg2OyvFZtlVPMGg4mxmmyi6auhJjlNkwlsmxIato/eS4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61q6EZ98kQLJpqHj82iKq33gBS5mOJlqXj8nSupFsdQ=;
 b=natiMdvh+DzhnNLZgvZaiusqA3X/KMyau9IQoRwgnsI+oqcxuyRKyoGBgpwdPxbR3mC58UJYujpat+0ge1HLiUW6doW5m6rcKoI8mNxCqKzTKDOLWB2N93/9R0UyOyHBSeCNJ9FfLdcxF40zw2Thu3H2dP7chx7kFeUCoXsEVhjIwxqAlqH6f5VitWJSD9PBj8dmx5/j1dwqk1JyHF34LC635/2yd58HltnIYfgoCXOGz72oRgWYH4rE8iGU6AXIXkiwJZvy0VUY/iKbhCgwt4s/rxIpOTzGbsuQRAXsjvlZiCSlD+TIP/UCOSseYG7lvVF9fbrPR5EJJ5bMcRcPGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 5/7] xsm: decouple xsm header inclusion selection
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20210805140644.357-1-dpsmith@apertussolutions.com>
 <20210805140644.357-6-dpsmith@apertussolutions.com>
 <2e4471d4-7d0a-757f-1291-de6e93d1d6f6@suse.com>
 <ba39f827-3fea-faed-9fde-105d03d3b417@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c40d6fd3-ac7d-c824-32d9-678c7fd09068@suse.com>
Date: Mon, 30 Aug 2021 15:24:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <ba39f827-3fea-faed-9fde-105d03d3b417@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0020.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a740cac-e04a-4e57-d1d5-08d96bb9888b
X-MS-TrafficTypeDiagnostic: VE1PR04MB6669:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6669A1FA73676C908EFAC109B3CB9@VE1PR04MB6669.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+HxxsmYQiDjPRzAyriGYX0ibmagYnLZYyyplhEOQI+bD7vE2FkveweOZWKVmi/rsAbFk3HP8hQfDIn0s/eB0h32eiJ3KtXKRHOodzB/cYSKQDzm7wLe1w5/mT0BVqe0gbdD99ZsaF9hI8P2qVttX0oA/7+U8aWz5PPFarXSIEqTib2Huju/asWwnHa+YL81lXO3ObugzWuZxZV6xlwFtmDvgtGqVW4BekKuAT0meQXSyfYKtv8K/T6UN2WdVWWeFH4EaYyOOKjuW9xjdEWj2lEGLOFTkU3vSwhA0QN5WIc/46YUbMg+ofxHzd6bl/lGuZtackVrF+XQJbPlrWmu83tFkEls2qAWRTfGqpAfvu8FSQxeyqgnsDxngPCZSIoOlddrvNW1wPG70dmVScOrMQRxI+Tgn83YWdbtm33WqpYQEgqwLr5F48GSK7NBygH+2MuHtEoP20y0TV8B4qIQAbY2c8LlCbTPdcKBBTpj89gEUXBcMEtbF4CydUnf4nH7RgHKfuWcNyIDXUlzgpKsvRHjrxLWB6gwRUrIghd4SOOfRhImC+mn7Xbbb0WoK7NnyOw61daeEYxXvX5EkIhNVo6lGI2Wa8dUgv8nb5P1xTFfRwA3A5hs6fAstTUCuDWsCtGHRtNy43lCOOrVXpgAS4iEJ7/E4e/2571ZoXj9GBJzf6X4Id7ZQi+7LW0L4FmpoZSpWq1a1xJe0mwftmrR5weUbfpcDEhQrYPejlovZFnS3JJqvAuMPnfUQHvCRZ4Ps
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(39860400002)(136003)(346002)(366004)(2906002)(316002)(31686004)(66556008)(66946007)(2616005)(956004)(86362001)(4326008)(83380400001)(5660300002)(36756003)(16576012)(6486002)(53546011)(38100700002)(8936002)(478600001)(8676002)(26005)(186003)(31696002)(6916009)(66476007)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXdMV0JNeXhQRlB0dmI4MURqZDZpRllub2I3NmFGWGZCUUQxMjN3YWlWNUY5?=
 =?utf-8?B?YmtLRVJTbmtWVHF5THBXbzViOXNSQWQ0Q1NmQW1pdHozTWJtUXBiQ0FXckhy?=
 =?utf-8?B?UnZhZEtZT3F5WHpJTmNPSThNbmRMaUJPdmJBN1JmUW1KWGcwVEtVQk5JUGFa?=
 =?utf-8?B?Z2tjQm53YWlNQlMwNElSM2JZeHRYeXJCVUpraFJKMjZPc2J4ejIzUk9OMC8y?=
 =?utf-8?B?a2Q2Z2h0ZFVRL1h5amJYRjg0T1lXMk9ZbDh0VHJ5ampQdUZsQmdSS0RQcjY3?=
 =?utf-8?B?MXczNW5sQ2ZEMnNONWZCWWZkaXhWUW9ydmVnVjRkNi9Gb0JybmhSSmp0OFVz?=
 =?utf-8?B?Ri9rVzdsdk1HTWcxR2ZsNGw1a2NxTWhPSTVIR0wwY05oM0k5TUEwM1prVEZj?=
 =?utf-8?B?VnlMYlYzOVBxY3ZBYXl0enFvZnZTTTZsZFg3VWEvZ0wwY2UrNTJ4RVdpdjNs?=
 =?utf-8?B?eW5ERy9oaVJpTUN5bmpPbDI1OUNTMStrOEoySmlwTzdFbnlueUYyUWxTL09P?=
 =?utf-8?B?UkI0TVFSOHJ6bTlpNmZWTGp4Ym5QWVM5Mjg5N24rSCtybU1valpxQ1NuQWtu?=
 =?utf-8?B?aUQ2TXdlZzl0VW1XNUpmRUtnQTNjeVBLM3ZvcEZFcytudURyRzNSQXQ2dEtZ?=
 =?utf-8?B?UnFZNzduVUFaR2IzeTgvcVNhelpaNkhrbk5xOWF0dW44WThNTE5LZUZjZ215?=
 =?utf-8?B?S2U2ZkRZZjBOWldtSXljUUNlTkhiNmNjYlRXbk11ZERqZjZJOVZBcURnVDZU?=
 =?utf-8?B?N1FaTlVrcVdqeTRHVk5EQXdWWHJqZVVLSWdaWURVMkNWQmk1MHkzUjlkcUhk?=
 =?utf-8?B?SGF1SDUyZmt1aXhjM3ArVlVsZFd2bTlVdGZjRHhJNzlqbmtZQ1NSaDV3bkRQ?=
 =?utf-8?B?UkdpN2ZEVlE0dW9JbTVlb0dXMGE0UVFPZklZUVgwWHk2c1FOYTY0bkRFRVha?=
 =?utf-8?B?MXRoZlpmby9ySGVLUTc3cmRsM0piV01jSkJKTktLZE4zdHpDZ2k2cHdxcGhq?=
 =?utf-8?B?SFNWQURXbzIzVWREUWVabWF2KzZSRlZWMThEY1JFUW5TUkpXMWJxM3lUYUZX?=
 =?utf-8?B?c3hEWjFTTFdTZUFCeTEyMmtiRy9wT1ZUa0FRQW1HejU2SklWOEtDcDVBeXNa?=
 =?utf-8?B?ck12WjJHajV2N3Z0V0ozSFdzMWNxSU8wTU9tK3pmRFNiVmFjbnF5dFpKZjlP?=
 =?utf-8?B?UHFUVUNTVDBsbzlCNHZzamVQZ0VTaEJNYzk0OTI2RXNoN3FuWXRaaVRJakxw?=
 =?utf-8?B?Zy8xUGxremtld0lxYW1pYVE0dWJ6VWhBODVjK0pYWTNrclF4c2hmbnNnQytE?=
 =?utf-8?B?UmFDK0tuVjBkVkZpR0Y0cTRKOUxXSXdHaUcyTTJ0bVBVdmhvdWhuOWRkZkla?=
 =?utf-8?B?YXF0Z2JGdmVYUUhYNDNsZW5xenF5WmtwTUJmTWl3eXI1bGYzb3ZyZVlmckk3?=
 =?utf-8?B?eExDMUdZTWhHNW5kS003ZGlWcURsd0JUVWwzQW5xWDZRM1RHWUl1U21lVTBS?=
 =?utf-8?B?QWg1UHhnRUFlMTloUDRCckhENTJNYnowZnNab2RTMEVxZG54N0JZZk9qRFRu?=
 =?utf-8?B?SERjVzVRM2xqL2FYcG8ySHpNL29LSFJ0bWdWK2pTVEM4RDJ0UGh6TjRVZG1J?=
 =?utf-8?B?MitjRUZHMkczNU02b0k5ZEJZRjRDVnVTOXdxYWoyaGdvd3ZXaTc2Qk9BOGpI?=
 =?utf-8?B?ZlZkVSs0Y09EMEJIcFN1YkFDNVRSYUVtcEFEeFNrcnpPUi9Ob0hCSWlCb0hJ?=
 =?utf-8?Q?/9ukUxcD/Cep4gGGz4OIh1COZI2uYhZEyVK+kTu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a740cac-e04a-4e57-d1d5-08d96bb9888b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 13:24:45.4901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rtvTpN7GaWdeF8nIM+rtogj/FK37i2AXtjmhEGUNgL4N5BbcEglh2fn5+PFy0rGtQbxRj+kWSiWP25W/eMFOzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6669

On 27.08.2021 16:06, Daniel P. Smith wrote:
> On 8/26/21 4:13 AM, Jan Beulich wrote:
>> On 05.08.2021 16:06, Daniel P. Smith wrote:
>>> --- /dev/null
>>> +++ b/xen/include/xsm/xsm-core.h
>>> @@ -0,0 +1,273 @@
>>> +/*
>>> + *  This file contains the XSM hook definitions for Xen.
>>> + *
>>> + *  This work is based on the LSM implementation in Linux 2.6.13.4.
>>> + *
>>> + *  Author:  George Coker, <gscoker@alpha.ncsc.mil>
>>> + *
>>> + *  Contributors: Michael LeMay, <mdlemay@epoch.ncsc.mil>
>>> + *
>>> + *  This program is free software; you can redistribute it and/or modify
>>> + *  it under the terms of the GNU General Public License version 2,
>>> + *  as published by the Free Software Foundation.
>>> + */
>>> +
>>> +#ifndef __XSM_CORE_H__
>>> +#define __XSM_CORE_H__
>>> +
>>> +#include <xen/sched.h>
>>> +#include <xen/multiboot.h>
>>
>> I was going to ask to invert the order (as we try to arrange #include-s
>> alphabetically), but it looks like multiboot.h isn't fit for this.
> 
> So my understanding is to leave this as is.

Yes, unfortunately.

>>> +typedef void xsm_op_t;
>>> +DEFINE_XEN_GUEST_HANDLE(xsm_op_t);
>>
>> Just FTR - I consider this dubious. If void is meant, I don't see why
>> a void handle can't be used.
> 
> Unless I am misunderstanding what you are calling for, I am afraid this
> will trickle further that what intended to be addressed in this patch
> set. If disagree and would like to provide me a suggest that stays
> bounded, I would gladly incorporate.

All I'm asking is to remove this pointless typedef and handle definition,
seeing that you're doing a major rework anyway. I'm afraid I don't see
how this would collide with the purpose of the overall series (albeit I
may also have misunderstood your reply, as the 2nd half of the first
sentence makes me struggle some with trying to parse it).

Jan


