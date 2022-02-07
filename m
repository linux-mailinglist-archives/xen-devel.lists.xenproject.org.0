Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB074AC33E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 16:29:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267142.460860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH5wh-00089Q-SW; Mon, 07 Feb 2022 15:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267142.460860; Mon, 07 Feb 2022 15:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH5wh-00086i-PL; Mon, 07 Feb 2022 15:28:51 +0000
Received: by outflank-mailman (input) for mailman id 267142;
 Mon, 07 Feb 2022 15:28:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nH5wg-00086Y-U4
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 15:28:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a607ae19-882a-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 16:28:49 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-vWVLXGNcOSi6pMf49fNF9Q-1; Mon, 07 Feb 2022 16:28:48 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB3PR0402MB3692.eurprd04.prod.outlook.com (2603:10a6:8:2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 15:28:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 15:28:45 +0000
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
X-Inumbo-ID: a607ae19-882a-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644247729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IoblLvFqcIPo+HHTIm8PgWsqgdJMWvE442czxCiHNts=;
	b=BMi5POK5UdnGpl0o/3kZrQhLQdeQ/djydGAigB7FKpjcbdbJhiQGs0YHa5Lyy6baavNuqS
	keUgqXXRwkaNc7WBMU0RSZErhpelPAPeZ+R1/lKYKogKKg6cvs7T8uxvpIkcjk4Wg7X3h/
	fwjKMUv5mUnBo4XwEVeyV7N7s+7nBXo=
X-MC-Unique: vWVLXGNcOSi6pMf49fNF9Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUm4JQYfgAHjyQG6U6FcPPc04/O0Tg/Bc4mHqJFy12rZSBI0bIb4HtpKybdxRHxeUq7qQIiFl+dPaK6VuqtW1GIot90dEvTp+9UtslFaHPAiQcyZZcX/4gJv6s+Q9VzI+Mt31TkTbReoMFLOTHhVm5Amh4dRpuqhThXaLYAtq0hd6Se5C6WD4pbmWabdDsB1UDnuLL56Px4agKLfLnulI0im9TmtaKd9417p5No68KSWXDihDcD3QsERaGx5apRFeb8P7x3+HiEVcZnbVSI59skHGfU72Rack2fe2nhZegxtQ8tNuipmbn+acFbULl8tChu/V7X7vljo5DzJvNeshA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IoblLvFqcIPo+HHTIm8PgWsqgdJMWvE442czxCiHNts=;
 b=nbKyMPoYB8dyByNJYtKobz+LRfABEu2nBcQNpNd0a1zqFzq/0jHrIxxdSsdRtfLIu9Fj5WHQs0AKK30DDXGTKaQuj068wqSqd0nZuPWwXyCwi8V69ohFqxmUFcvtNl/bqiPqfnIUpSqukF3+HtnJ7dhLWvOs1Fc0H/N/PrRLHr45NkjqvqXNwChRuAQltIAKraNuIHKwJE7zilw6luT0ipRzJ3XEEwLXplDhmOrwh9I8hzMEpcFNWVP+D/t8VM7CQfMyA8s3qsNHJDGiRKUVgA/Ux2EPOeG/D5odGkX9G//QUnSKdtnb3Yy+wMIl+BhSSPFlmYAkstNLOmjEW9zZhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <06408e4c-3b9b-256c-9fe3-73d9a5383907@suse.com>
Date: Mon, 7 Feb 2022 16:28:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 10/13] vpci/header: reset the command register when
 adding devices
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-11-andr2000@gmail.com>
 <96381d7e-dafc-acee-3abf-f9815deb207c@suse.com>
 <ef76faac-f9d3-1cb8-06b5-189ccd299542@epam.com>
 <6f0a015b-c48f-76ed-9a51-39c045ff5927@suse.com>
 <2ad372d4-a181-9307-ef50-a5adb61dae66@epam.com>
 <49380584-0577-96f2-ef1c-a96eabf0d227@suse.com>
 <fbd410d1-84ad-2309-ca05-b9ac7f95f1f9@epam.com>
 <dbef1c95-818c-427c-1963-75d584843cff@suse.com>
 <f34cc940-7f5f-aebd-60d9-d1a3d85d1283@epam.com>
 <8f35e7c5-3193-4b10-ae25-df838e2262c7@suse.com>
 <6b4ea90d-cc9c-edf7-e579-a84d72431d7a@epam.com>
 <f6f16729-8404-6703-11c6-dd7a4ebc658c@suse.com>
 <c5eee75b-bcf3-7e31-e25b-0bf0b217267a@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c5eee75b-bcf3-7e31-e25b-0bf0b217267a@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0096.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04d30859-30c7-4a7a-c01b-08d9ea4e878f
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3692:EE_
X-Microsoft-Antispam-PRVS:
	<DB3PR0402MB369289C5E1489488CCAA5D90B32C9@DB3PR0402MB3692.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RpNisiF9omLKFSEyNvI2pF8bTCJHnXRCYflhNPqkR541lDDA2ee+c06nXgIDuBI/TPsBc5Wd77fOrdBo4jPaFgNRehYZR/GWG89QPGx63lRp6/+RczrIWomoW95Zi1KdW2cbkA9hws76P6KW3qFGBRZuMWLtOIor/93kFdjE7XFIwthzOn67aQYd2g498vaAab9VwwaOHl6eFBGOiDrPbnaeBwxfUw+MhGPr9G6eORKbOL5PKnHAgwjWqbRqlzwJ/hxJ66lUq+rD2+MFEn4BQYTdREIQgmqZG3racxzsc1hasuN9DzjsTHiSitI1m3nEqEXKImbBTHOHe2UN31s5fyjzoUUtkT4+vYbVmbt1qgj0fit1JqHIII7BkyXjKtkKcP3IBkDR5dcO4GdK8o4icml5JKk+YGY/jMnNtoFpZkON0G3mFu2XX4J6d2xg+Qn+nrota4OIztevHdqm36y3BB+IsqAtZ4g6gae9nN/31dKUBx2z5O6yeeWQg2TIqInmEWvrbO3ZE7D3xtLKaSRO+ITCRBfS6ThsEZlRffNMmjJfffBCWQFS7SPzC3HaT0Ff58IdVlQ5QFCTGWAHWY4nGTOJ/mfLwXnNxsYoCDJRcX6c0Kvt303TDq+DFfb1VWnOn2nF2lNDiaqQQyeMo06RS3rD4CP4fKlQTP26Mh41sHx54lji8giH2q4/gvuD6NnaFTkd8saobg7qi1/Bldj24pTEpXwlvE+bXXplMHYvPMo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(2616005)(6486002)(31686004)(26005)(186003)(7416002)(38100700002)(31696002)(86362001)(508600001)(5660300002)(6512007)(66556008)(316002)(6916009)(54906003)(66476007)(4326008)(66946007)(8676002)(8936002)(53546011)(36756003)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3RRMlBmaCtBeTFqeDgwVjIxWXZBTXpPR1RYWDdrVWtRV05XSGxpZUQvcENR?=
 =?utf-8?B?VGpaN3Y2SGxRQ3JxTVpBYWg1SHR5RWM0cjg5NGsvdmlobXBWcEpKSnBsREph?=
 =?utf-8?B?bjl5LzN1R3RqS1ZWS2VVZDloVXRIUlp6Z0FJQjJ6cVB0SUdsL3lDakdldzha?=
 =?utf-8?B?Um5XZjZoMGFvUHVtMVRmUk1ub0loK1NLbkEvUTU5MXJvczBxOXYySnhJRHk3?=
 =?utf-8?B?Q1E5Y3lwUEVwQWE5eitWdlI5VDJ3UFMveWdJVXkvWHhQT2d1YTZMWC9JKzBV?=
 =?utf-8?B?UmlOQ2o2THF3blNGNE9UNkYzcHVZclZ6RTVtbVFtTHlBSFB0NkRlMUNnTGZw?=
 =?utf-8?B?SGpzbkJHSEV5RzBvSzJmUzB2dU9YNmdhYndvS3dkbVA1KzZ1MElLU2poZUdq?=
 =?utf-8?B?S2hGeVFLQlIrcUd5aGhSVGJGb0Q1eElWSGZCdzdaY0hxcUlTSGVzTEJaU1Rq?=
 =?utf-8?B?bVM3bE9GRFFxRFQwV2VHbnRKbFVjKzZtb1ZKWG5DZWFhTFdxeWJha0Z5ajhv?=
 =?utf-8?B?TDhDYjlkOVQ0bDc5T3U4MDNXS1BjNTJDeU81WlJWRFdIelhSWG43Q1k3THJh?=
 =?utf-8?B?NDUrYkpSYzZaamVCQW9uUVdFVk5ZN29kekxvUy9oaWd6TGhYbGYwWDVzQlQ3?=
 =?utf-8?B?cGhTQ2htbjZ4QXdMM1I3eHo5L0cvWExpbGNFVW1aVGhLZlZSeXcweFV3ZXBl?=
 =?utf-8?B?ak1KUEF1emk1TFlUUnZPcHJuQVRYRC94OW9rdmJ2aWtRbTNRTnlBVUtsdTVK?=
 =?utf-8?B?STlXZ2l6RkdkYW1Wc2tkL1J0SlpIeU9XVnFxTjM5eXZrUXMrODJUcVJjanpR?=
 =?utf-8?B?N1B5SmEyOEtLcitMdjhML3d0TURKOTJDL2xCWG53RjF6cWpoSGxJUnUzajFx?=
 =?utf-8?B?bUl0a3BJcnBpNDFFY0pDS2hoVmJmQ3lHQTRNWkU4eWswZGY5dy9WV3NnTDM1?=
 =?utf-8?B?YTRwWm5BeDR5c0FUWVNtYVhER2puU1VSQ01vN0Y1T1lnaUllVWZVZkVmbG5a?=
 =?utf-8?B?K2dYR2FUeFNVaGpJUlFqRENBSmFmQnNBQk9DL2YybWhzSjE0a3QzT1VsZXlZ?=
 =?utf-8?B?WDdTRGlKTjFET2dkUUpuaER2M2N0RVpQL3pXQXRKTGtHeTVyY3NqNzNYWHY1?=
 =?utf-8?B?VnRoZHRZVUlGNXpzYVB4VzlJOGxlcG9qbHIzS2RXS0VqU3NZeXNkRW11eVFX?=
 =?utf-8?B?ZWxoQng3dS91UTAyNXNxb2twazROMkN0TmtlcVdpQVlDMWg2VzF6c2RPOGor?=
 =?utf-8?B?QlBQOFdXaDhYZzZhOFhaUzE3U2piWjJuWk03LzlWVzFLVmFQYWR6N2xUYm1j?=
 =?utf-8?B?Rzl1NzZJdzU3Wm1JKytXblN2ZnpYcHV2d2xObWs4bjJNSXZvM0ZUbVVrM212?=
 =?utf-8?B?anhRZUZGREVUbXhHejROY3FZenI4ZE1paE90YjB6M3FqaVY2Z1k3eUF3Z0JY?=
 =?utf-8?B?Mzc2UEMvY2duNXVZSkcxTHdYSmdBT2hnYXBzZTFFRkwwRHJXZU5zU3E0Y3NU?=
 =?utf-8?B?K25QOTgxUExoRkxScm9ERitORkVPZmE3TFowL2hoZDJBTXZFUnVaT1YxRG83?=
 =?utf-8?B?SDlQVXR0ck5Vd2R6VU9pU0YyS1REQy9hTzNDelNNUFlPWCtnU2NKb3BBZnE0?=
 =?utf-8?B?Y3VsY2IvcHNZOTdKYUNJdnZyVDhLNmdZN3grZ0tpMWQvTkY4MVdWZ01uYWpD?=
 =?utf-8?B?cENlSS80NnRTdlJibk1SSC94UkZYTmhTcUFZUmU0dk5TQWUzVDQxZXVMK29E?=
 =?utf-8?B?V3lOblR6a29sRXoxV0VCZS8wRDVLMzl5SEM0TlJTTWd0cHdjRkFzWUNxR0Qy?=
 =?utf-8?B?b0lTdG5FWVc1SXBnRWxDQWxBdXNDb1FtVVo1bVEyLzFTTkNRMEJXMTMvL2F0?=
 =?utf-8?B?aHBjM1ZXUGhZeE0vWmxmUlE5VXVhaDlFSlJZZXdsRnJIMm9VTTJDMWxyeDRt?=
 =?utf-8?B?bXAxdU9YNjVBZ1Z3VUY2WEVSYVl3VkRCbjZIU2VML2hLODJEYVRUNjNMY3hI?=
 =?utf-8?B?S3RITFZXS3Z6ZDM1d09JRXAwb05PWWorMnNUa3JSM2M2cUZQZm5Zem1qaWVX?=
 =?utf-8?B?bmViVWZLWW95RTJKL0syQjhoYVpUTWZwcjRlR0U4SlZEd28vQ283bm5hRWZP?=
 =?utf-8?B?M3dEeWtEamV3ajhBZmVRaHFndVE3T3JScVNBOGNNNmdoQmtGc3R3Z01QRGx1?=
 =?utf-8?Q?ahRqQL9VdWBUkDOwMODHegc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d30859-30c7-4a7a-c01b-08d9ea4e878f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 15:28:45.3579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AwOWrgHfVwDoKE5MCOFoXeldIBtA+lrqzlLMaBibolGBekCDna7Bh3UW5K2KxAYztPZemFiZxXnuhzFuvZq+dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3692

On 07.02.2022 16:14, Oleksandr Andrushchenko wrote:
> On 07.02.22 17:05, Jan Beulich wrote:
>> On 07.02.2022 15:46, Oleksandr Andrushchenko wrote:
>>> On 07.02.22 16:31, Jan Beulich wrote:
>>>> But: What's still missing here then is the separation of guest and host
>>>> views. When we set INTx behind the guest's back, it shouldn't observe the
>>>> bit set. Or is this meant to be another (big) TODO?
>>> But, patch [PATCH v6 09/13] vpci/header: emulate PCI_COMMAND register for guests
>>> already takes care of it, I mean that it will set/reset INTx for the guest
>>> according to MSI/MSI-X. So, if we squash these two patches the whole
>>> picture will be seen at once.
>> Does it? I did get the impression that the guest would be able to observe
>> the bit set even after writing zero to it (while a reason exists that Xen
>> wants the bit set).
> Yes, you are correct: guest might not see what it wanted to set.
> I meant that Xen won't allow resetting INTx if it is not possible
> due to MSI/MSI-X
> 
> Anyways, I think squashing will be a good idea to have the relevant
> functionality in a single change set. Will this work for you?

It might work, but I'd prefer things which can sensibly be separate to
remain separate.

Jan


