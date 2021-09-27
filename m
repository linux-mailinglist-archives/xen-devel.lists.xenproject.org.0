Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 381604190D2
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 10:28:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196505.349375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUlyy-00076u-Ok; Mon, 27 Sep 2021 08:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196505.349375; Mon, 27 Sep 2021 08:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUlyy-00074w-LV; Mon, 27 Sep 2021 08:27:28 +0000
Received: by outflank-mailman (input) for mailman id 196505;
 Mon, 27 Sep 2021 08:27:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xtCR=OR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mUlyx-00074p-D9
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 08:27:27 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74d04a7c-e948-41f4-9c56-333b2ded4b1e;
 Mon, 27 Sep 2021 08:27:26 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-nPJbHdmjO0mSUSUAbpds_g-1; Mon, 27 Sep 2021 10:27:23 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6862.eurprd04.prod.outlook.com (2603:10a6:803:130::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 08:27:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 08:27:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0006.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.14 via Frontend Transport; Mon, 27 Sep 2021 08:27:20 +0000
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
X-Inumbo-ID: 74d04a7c-e948-41f4-9c56-333b2ded4b1e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632731245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4FJpTFZ8F6mjIpt0KUVzZy0+zeEyXsMPTLCOwRbaFdI=;
	b=jly6itxpvYR3KBU5FBMo8JaYCRkDg/NjzC2GGbZEsWJj7AfmUdXYahIVlOcQvw11JL/gfk
	anYospf/E2WpguI3r5oe3flNZXM5Ty9f4jwpldBTnSEDIjR0HMNp/4ldB4bLAAZC5obHEZ
	3wCvxN0M8ODo0eJvJAwQQY9kxIXTPQk=
X-MC-Unique: nPJbHdmjO0mSUSUAbpds_g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHkFGTM8Im4iS8soP9Nl6sdLVWdlkg/sVZFK2lWeMU836iB8UaIlblw0mnETTjvK4+ISZgQYDUvKk61VtzyfTnNKeLw2DptfQBxB5q8bILQSNBTsV65CGmpS5onALF2EFWAobslNpQmaLldftFABqCQnBwPfB/RkkX6i7rK14bwEh5DvVFbchvl1qRWoJJeq0g6ghXV8KhcBaFrZWigPdvCLGed1HIWIQ8FhalEVOykcLPjh1stY8GwsAPLlvHgSzEthqm83el7NCXTbYNh1Zg1iADE9RgoNFfKuvnAfTjeY3SdU7NPgngY6p1QGq6B07mM17Vn5jANzhmqcD76UVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=4FJpTFZ8F6mjIpt0KUVzZy0+zeEyXsMPTLCOwRbaFdI=;
 b=XDAapQAPdS3vkQxeL4mjm2/Z3ZQ54VHV1wzVwN2Pc/B1JstU+N06UTaE9bsxVpqQSloPvts10lLMkEQxgmsTeEu9JuF/O4xlfKNegE4KqhqIeKUX0xV7W4JWza5sdSsNd9F0mXPizH61gjrxs5krE2qz44V3UCuB/nPBXIv4M+nDFc7dPeHEBlb4Jg8ZlODNMrXRudWXit2ms/YHszjTqkmsvV690TcqoKeiVjqbY6hL4BopfLAJahOZuldDYiSXNnotM2PrINwI8KeNgJX5WWGMKE2Z6ziieGwtQ7odJOOoi59k5PNeBu0TQhmt+JadIGZF6EOUlzscWNCOjM40Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 1/2] include/public: add possible status values to usbif.h
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
References: <20210924150424.10047-1-jgross@suse.com>
 <20210924150424.10047-2-jgross@suse.com>
 <8d9f549c-108f-17a8-e8f3-fb9b52442d5f@suse.com>
 <28a9b815-0903-a06c-1b17-4aeceb3604f5@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <795058eb-7489-8303-fd24-14b94762f74d@suse.com>
Date: Mon, 27 Sep 2021 10:27:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <28a9b815-0903-a06c-1b17-4aeceb3604f5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0006.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::18)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a32e566-043c-4c02-b1fc-08d98190a016
X-MS-TrafficTypeDiagnostic: VI1PR04MB6862:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6862E48A7EC2858C0D47AF24B3A79@VI1PR04MB6862.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZDyHYokUfFFqiYK/30B+deYZ5xopETKeQGabzHpFBvICrM2uUcJqaHm/PcgDaMz3fip5FE2RRYhJ11KewxTgGwr4YHDh13HM+SJx+Yi6r/17DZqUSwCNk+g+pCRzJl4bewBSZrJzalIr4Ql3LNYZgMc9lTYlKAnqxCTa8kbDDFrA0X4qlhEhQ2/L6qf7+Mw3BTP7dMmFGGIWJF0oDlJRAbTFSrsIgF7ghVzUOv6gpBGrqd1MM8gXZBVHv6n/hewmf1PraZ695qOovgKmR2R0qYxb7rzjxuVal2OJ6hbsvP9AtpiBwv1aRbyqnhQxIVz11w3PfzpcQ0QpDWRjqE0uYlGVfBypHzOwDY/WwD1V+mnkhl66I9ttgfS9PsgbIyGKlfnSIW3/PHp4zMgvO20jrtWLdAjACVVHMEPBjzcnkkmFaOoANaMxikp/4dyhSB5oE0knp9kXjE9uL2s2gnkzvEvtgvX9L8G4wuZCQmG/BNDJYXv7rhRad0oYyEbjThZ4FQNA6MoRPMD93kJi5P9NL9ergaKCeuMJrZSRx2ycz+5+tB3syUM5pmUKacIZNKbdOadAxdW3Vk0FvPdiQ8HT4kT/uVYuwxt9/f6qvDKO7UZY31AalexM166pUTv4393YKdoUehUntNHn417SBVF3SNXXm/E0lvWb1PZdcvMhCEpmcY7/vDTHrtW79iAMWtyAC/2csdlScMqd0WTVaHB0COrbCDsE5g9VtFPJ+/rZ5qM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(38100700002)(66556008)(53546011)(6486002)(31696002)(316002)(66946007)(26005)(8936002)(86362001)(31686004)(66476007)(16576012)(6862004)(37006003)(2616005)(956004)(2906002)(508600001)(4326008)(6636002)(8676002)(36756003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEVrQmRGc2UwYzg3MDRMdGlUdlg5SE5ySTM0ejh6YzhoWXd5RXhZUDUvUHFS?=
 =?utf-8?B?ODZWSFpwdFpHTGpkeTB0K0xnR0llTllWcWRGMUErbU9EWU5EVFIwUkI1eTky?=
 =?utf-8?B?OW1ZR044RVhCWlBuUzFHUUhNVEZyeWVFeDJTVFFkbFZ4dHByMUlHS3NnZTBt?=
 =?utf-8?B?Y1pydHlvYUMraVFKU3dGSzRpeVBhTkt1Nkgxc04vWDVlSXR5K0ZKSERaSlla?=
 =?utf-8?B?Z1V6TjVJT2JXOHJzdGJEM0NMNW5nTFBhd2l3RjlZN2wvbkdZVElmTHVBQkd3?=
 =?utf-8?B?dU4wcmtDc1hBcmN3enJ1Q2JtL283U0Z4dk9zaDJWallQQU9MOXRyTzlpVGF6?=
 =?utf-8?B?TEZOTUF3ZUV3UTNXVVRxbzkzNHlyTkRYMmlQWEU2cFM5V2lYTWRwanR4QVlY?=
 =?utf-8?B?bEpGclJrZ0JwQndaNnFBTk9nZ3d0THluQjQxd3hZSWYxMDA3ZGZzbzhSeXBy?=
 =?utf-8?B?a0ZjeUkydEZ3YWxYd254K3RlUkdwaEkwNHlwSnIyR2FWRk90N1FLLzlMd0pl?=
 =?utf-8?B?ZjhvNHA3d3J1UU1GaDRNd05hUFFPTEZmeXJSS3JFNnpLS0tZNnczbktHaDho?=
 =?utf-8?B?K0RtL3JReUxJblpFc3RuOXFsSXBWYThBVEU4V0hsUm12cDl5aEVTbC9PVktI?=
 =?utf-8?B?NTl0cGliNmhPS1ZoaWxwT0Mvdm13Z24rb3lqamcwdlJ5enJFOFhFMzVobEVT?=
 =?utf-8?B?K0ZrUXF0MS9sQ2dVOFYwUVB6VkxSTURsQ0ZmS0JmL0ZzWVZLS285UG16Zmc3?=
 =?utf-8?B?UmdNZjNtWHZNRlVrUjJUSjdreHZWU3JRMWo5S2NXZFZqbDJrdjZ1dFB1N3RZ?=
 =?utf-8?B?cjNWMmY1TmlLNDhuMnhlMXRoNjM0ZlB6RU15R0xYdURkdVEyZXRZNXYybUtU?=
 =?utf-8?B?eCtVWFkwYXpWc1Q5eUtWcnFVYmpjWWU5bDFWZHo1QW0rV05Wa3RianczVDZQ?=
 =?utf-8?B?L2NVWmRyaFR4eTdsMWhyem51aXZ6cU1UamM2SEtxRFdVNE8wMllzemZobFRn?=
 =?utf-8?B?NWNXSTRKZ1ZxWmxralNUajNRYWcySDFmT0w3K2Y0QnJpengwN1pBU0IwQktK?=
 =?utf-8?B?OUNGOFJpMTVwNEF3N1BFWlVSbmFNTnRJbWl4cm1hVnRrWjhLM3ZoUFZ4ZG1u?=
 =?utf-8?B?WjVJOEI5VlhBUWNqWEhqeFhFWFRtKzYxa3pHNG9VZHhaeGNyK3dGUzE4ZnlU?=
 =?utf-8?B?dmt0WjFOUXB1SW5ZdmwzdXZuazA5OVRGTndCeGxYS3pXQTMrVHhwOEs1V0dK?=
 =?utf-8?B?THptQXViT05LS2hieUFjSytZdW1sYXdrUVFRVzZYYmVuUGtKbkJSa2t5Vlll?=
 =?utf-8?B?NS9pUENBdmJ5OEpzTlMxMkVyRmFZN21ucW5vSkpUYWF2ZEs0bFJJcFp1T1pt?=
 =?utf-8?B?aEVKcEMrdUFGQ2R5eGkzdzU1TjFMbjc4WFJDcW56cjU1bDEzajR6NjdEQVdQ?=
 =?utf-8?B?aHlpbzB3OFVrL2l4TC9zSTZGTTF4a3lmd0wzVUZNOW12UG0rYmNtNElOS1NF?=
 =?utf-8?B?Y05EMzVSd0ZrdGVFK05GZnFaZGUwZFBrbDN2SzhKVUg1Z0ZYNW8wWkE4MlFM?=
 =?utf-8?B?b3JZYWFZYVMwbFhLQzVnUXNnajk3NUR5YWRCbFI4eFpkT3h1T1NaSlBiSHF2?=
 =?utf-8?B?cHlIQ1ZuSWdicE5Rb2RlRG5VbHp5bG9YYm55THFhVDVGOEI3c2x0OFQydXEv?=
 =?utf-8?B?cGNxYjhlejhncHNWRDVRbmlXMURvRGtLQlZRV1pYYzJpSWZhVElxNXlxNGhD?=
 =?utf-8?Q?ymoF/q67uu79UPtElNlIPYJ2jMLtifoesN6kch7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a32e566-043c-4c02-b1fc-08d98190a016
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 08:27:21.1800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jiWs9Q9YD+wmmJzCbCTiNyKTew0PTaStkec1W1bF3bCtEHsxq0zm1MjEQo/YSAL5WoYOxdpwanbic9X4IiwYpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6862

On 27.09.2021 10:20, Juergen Gross wrote:
> On 27.09.21 10:13, Jan Beulich wrote:
>> On 24.09.2021 17:04, Juergen Gross wrote:
>>> The interface definition of PV USB devices is lacking the specification
>>> of possible values of the status filed in a response. Those are
>>> negative errno values as used in Linux, so they might differ in other
>>> OS's. Specify them via appropriate defines.
>>
>> What if new errno values got used by the driver? Would we alter the
>> public header every time? Or is the likelihood of further values ever
>> getting used vanishingly small? In how far would it be possible to tie
>> these to Xen's public/errno.h instead?
> 
> Those are the current values returned by the backend. Other ones used
> internally in the backend should IMO tried to be mapped to the values
> defined in the interface specification.

In which case I'd like to reword my question: Is the set of values added
sufficiently rich? There's e.g. no ENOMEM equivalent.

One other observation: Why is this header using tab indentation? This is
by far the largest (albeit sadly not the only) of the style violators in
xen/include/public/io/.

Jan


