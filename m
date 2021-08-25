Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C01B3F7785
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 16:37:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172435.314671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIu0w-0007Gq-By; Wed, 25 Aug 2021 14:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172435.314671; Wed, 25 Aug 2021 14:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIu0w-0007Ee-8A; Wed, 25 Aug 2021 14:36:26 +0000
Received: by outflank-mailman (input) for mailman id 172435;
 Wed, 25 Aug 2021 14:36:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5IQt=NQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIu0u-0007EY-CW
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 14:36:24 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1a834c0-05b1-11ec-a964-12813bfff9fa;
 Wed, 25 Aug 2021 14:36:23 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2053.outbound.protection.outlook.com [104.47.6.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-ES2F5UyGMyCifhv4nblWWg-1; Wed, 25 Aug 2021 16:36:21 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4350.eurprd04.prod.outlook.com (2603:10a6:803:3e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 25 Aug
 2021 14:36:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 14:36:19 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FRYP281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.6 via Frontend Transport; Wed, 25 Aug 2021 14:36:19 +0000
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
X-Inumbo-ID: d1a834c0-05b1-11ec-a964-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629902182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9TAIN4ceIngvBJyRdnHi95jZAfQsbtQLZl9d8QFurFM=;
	b=mNAuni3AFn9uZ8rjFz6CRgAoeqpRprhjNHEARdU+TGarbDsXZji8E+UPQnBiCHOGiLFKVw
	VjwGS4VQBcdSWubwgjmdxEB+8DVg49/hoUgoVgi02+hkhEdpuv6Ba7Q1TW8a73m/iZyjdG
	WBQgng7erJEIOeNK4MowraTYazccW4M=
X-MC-Unique: ES2F5UyGMyCifhv4nblWWg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DyKoNLqoX805SLjmoaXBzy7uKz4ofzXev1UQLECKCes/ZzNhISMx8xf6sEOm7yCvl5Y1uJLS9ZwWUuJSCVDkhEV+azZVoWRtsvMUrv9FvskV2cCtb85a8I1K9akchNpHLOiJQmrBUO/8xsj1CksGzwm02EQLznPU4biNeiIvrn6B1I5CjeFYoDEb81MpSgFnQnpmMkws90RolovohPyrPeYya6QhI8bgkRBb7QLBhXhySiEE82ASgmfIYRtaCVSC0K1EGFH3DP3hhFu18lkxC1Q9B+80qG324N6BxndtGnzBkaWj6kTqbsrYwRDi6VGvZEo14KA9UiOFw9oyRQVgvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9TAIN4ceIngvBJyRdnHi95jZAfQsbtQLZl9d8QFurFM=;
 b=CmnCw2Gcov7Bd+0mg8KK67bJ8+C9OE+T13xegerRqIQyi7z+iR5iz8s7SekfHEkR1X0J7iBhxeBMMJ8n68vwyZI5YC8J0s0ypvudnkK1NzVP0OUADD0vijO3Va9Un8cI7JtGy4BljpHpIyADQXGLq2HOXB3nas//ItyyJh06AOIqEIcDGqeBElCP575hxjdDuYvpStjdXGfCqOujcM/ITJisbK2FDEOqL/yzx3QaQ1kA+qu2bSc4oPrT3fP17bIgkCAvYSA1QLzTeGLbrMLX66Z4GtY4QS2FX9fqQLHfKeULLxeX8vTqgP+SYcfMGBT2DVKj2OPBbs8FiS8tlbo5+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/spec-ctrl: Skip RSB overwriting when safe to do so
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210819162641.22772-1-andrew.cooper3@citrix.com>
 <75e80f6e-f7e8-60d6-93fe-1a48e40593b5@suse.com>
 <e2efa715-b523-9c78-79c3-04ad6ee32746@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ffb04572-eb40-64b8-2156-beac6324a5fe@suse.com>
Date: Wed, 25 Aug 2021 16:36:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <e2efa715-b523-9c78-79c3-04ad6ee32746@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::11)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89ed5695-29cf-4008-f8f7-08d967d5b418
X-MS-TrafficTypeDiagnostic: VI1PR04MB4350:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43509F1B90207474DD4E6C4CB3C69@VI1PR04MB4350.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MO7tPZyOPMHmEEVPuWawWusPtfQiJULEVF9rq6vr/N/l1irAHx8BglZcuw9Kn0fHW1NQw2KkS+kSs9W+nUk1NZTYSVxX/DA62XKCCDx1F21X/nmtliD9hGhPtLvm6qzdwwUu7WQZtjw35kJ2x+CHIBHjxBPOMW8WxAMdqPaDcyfNw2GGz5g1r+aAMKFumHCNr0+a5YmKecCwOffuq2VAjv/0rimK+d7WKxF5fuyCsdUH982izWfmclrHWmor30ipNvOLFAt9DhuQna4jRZwt1Qmkag7JUOEk2sS4lWJHfT4NLxbCqXycUIVl5ILzM6zZkJhMZGzP7a76BxTEcEISDrOz4iLCV3J+vvqXFn9+eCNqWRCD8112ozI08Bc3nMV+xyT18xpPC1Tp5d4khO4DkfLbl2F6s3lhHlSiKikZrs/0YrwABsCcR9K1QkS0hLe/HZQbSZeeXEiNSY1VY3vPZtGmPddSpciG4ZObVdvoMEx4ZP/YfU25qAbQZctp9SX/ffguWJe+feRDXcRe7QA5dnc6UhmDsEL2HoIqRTlKxKpq4CEg8SbbveaPkUL65BiUP43IOm4cWbewgGFurLRWY/MxFN8f5y1BH5UIfMf40DYCpOGnLwG4pNJpGO775vWCnsvUOuzt2ErRTmC3Ko3qeozA71ZIUJCUk6GztGHK5oalzu5zMbJczjZaDPLkZAwSdvU5Vj973FnfWfq6f5Aicp8/qZGjhGTXV7s0oiO+gw8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(2906002)(53546011)(26005)(6916009)(4744005)(8936002)(5660300002)(54906003)(16576012)(956004)(66946007)(316002)(31696002)(66556008)(66476007)(4326008)(6486002)(8676002)(508600001)(2616005)(31686004)(38100700002)(36756003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3B6TGkyVUErR3pQclZYMGRveFpDVmZEcDZIUWxOWlBDbzJON0ZsRmZFOUpI?=
 =?utf-8?B?ekFIc1RpMnUrTHdrT0x5ZjkrL2NjOWJmdVZibE1BeS81bEhoSmFoNlBISFZv?=
 =?utf-8?B?TGhuWm52RksvS3RVSndhQ3MyU2ZDR3RyK1RubTNXeE0vR3NQeEc3TnZVUzBw?=
 =?utf-8?B?bWMrRk5GQlBjUjFNdlU0TE1YWmpsL09lU2VIMGZrUXQ1NHNWNDZhQjVRZ3VV?=
 =?utf-8?B?M0ErYnBlOVhQTGU1NW1pcis1Qk9qSHZjUkJOeUF1ZHl0OW9kY3I0VTF6NGxm?=
 =?utf-8?B?T2NyQlhGMGExSEFsMXhCcUZtNDJLczUwRTFjeWkyWFhzdzNESUQrdWV4RUtB?=
 =?utf-8?B?ZGJxQURWZ3k1UE85L1EvWCs5MXpXTDRxcW5hVnpIMTVkeWNCTFp0MFlCSkY3?=
 =?utf-8?B?Mm5Ickc3WmtrdkE5WDBYcFFhdzZMZDYybEQ2MWxoaTlxUDNucFZ0akJPVDkx?=
 =?utf-8?B?MHpLQlE0dEtmNTg0R3hnc3EyanU0ZnB6aG1zbnlwRTBhWE51REIzMUFHdzZO?=
 =?utf-8?B?OWJXbm9FemxoQ3gyQkRVQ0ExN21LTThmQytjNWRndTM0dkk4VHVWNTB4Zk9p?=
 =?utf-8?B?cUhoayttaVJmVnhLMFk2cmVPS1BXME1pb2ozQ3lrM2RQR21jenVRYkQvUlRl?=
 =?utf-8?B?dDdpejZqNDdQQXFmYzF5RDJRcmNTaUFsQUUrRHViSGhUN3BWSkNiWloySkty?=
 =?utf-8?B?Wkduc1hiOFZuTUU5d2tYakU2cDM5YWNXS0ZhU0ZKRlE3UmhSN0xlM0wvb1gx?=
 =?utf-8?B?cWRNRkNOa1JwcGVwUld0ZE8wL1BrNWI1YVhqU20rU1VBVy9veVVwVjJ4dDN3?=
 =?utf-8?B?dk16ZnRXTUo2bnN0M2taU0RFNVVFVDNMbzZ2UUdFSnIxNUZBUXVlcVdDSlZE?=
 =?utf-8?B?c3dQNE1hc0szZ0hZT1c3OHBqK1dwWUN2aGd2elFSN3ZwM2hPTVRiZzRGQWww?=
 =?utf-8?B?M3lSemh1TTZZRkJRSGlMcnNLWEVNdlByS3VEVE94eVhkNTdGVlBNV1NBNXk0?=
 =?utf-8?B?TWZwZUlkdmovTEM3K3VEaVFZNzc2aHo3YTZuaWlvVU9sdVlBbURqbml2STBL?=
 =?utf-8?B?Nk1mUGY5eklPYXhYOE9kejZzVHZhZDFSYVZGaENwS3V2OW9BbXZWRXc3a2ZO?=
 =?utf-8?B?anZFWGpDZTB5NmdrSXYvbE1XTWhvMWlNdDA3c2lzQ3laQnJnODJlcU0xNXZy?=
 =?utf-8?B?eFB1TDdmeWZBSmZscC9xcE8vVit2N2wzTVZPZmRQdVcyY3ovMUxuamxJMFpl?=
 =?utf-8?B?NnZkaFdhNEJDNDNyeDhENmtGQlFuVm01ck9ibUw4OVY5eWl0czl6Z0pVbGR4?=
 =?utf-8?B?c3FpZll1OHNHOWN1YXJuVXIydnc4cGZrQ2ZNbkU1TXFzMTVUQVQ1bm5TRUJh?=
 =?utf-8?B?Ylc2azRoSUtQK0NQZ0dqVUdMYUVUcjZXVXZVTlpVRkFMYkJYSGpMdXd6K0Nt?=
 =?utf-8?B?Rkx5VHc2dUVHYVl3a29GYVVQQkhsRjRQOWNzV2RYUTBtcTM4aDhhY3h6QTlL?=
 =?utf-8?B?UFg2a0hobzQ0R3pZWjEzM0pXR3RwWU1Gc0h0MnZXaUsyRDU3Zkk2WWNuRmxp?=
 =?utf-8?B?cFVYbEdjZG12OEY5QmY5L2JpMlZGcFdNTHY0QlgvNkZwbWxoQ2Y1eWd2ZEl4?=
 =?utf-8?B?TjM4RXh3Z2pMeWhLdFg2ZVdpeno5bUE1eGpnczVPUzU2TVh3WE5tS20xN01i?=
 =?utf-8?B?cE84aVJaVWNWZTZyejArVHQ2WUZ2ZXUxakFOSU9UNlB3Q3dqcDViNDl4OVFz?=
 =?utf-8?Q?Z93kp+UeRG697+vHbPGIFp1bqkH/7ByY73Hva4T?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ed5695-29cf-4008-f8f7-08d967d5b418
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 14:36:19.8375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BIIvV2e6NUSvqmc3LpyBt6ggcRERZFrADwNLaMGQ5IJuhmhoG0UTZKxlX5XjPEzTFH+Q0K/5ld6FU6uVuUmDCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4350

On 25.08.2021 14:12, Andrew Cooper wrote:
> On 24/08/2021 14:04, Jan Beulich wrote:
>> On 19.08.2021 18:26, Andrew Cooper wrote:
>>> In some configurations, it is safe to not overwrite the RSB on entry to Xen.
>>> Both Intel and AMD have guidelines in this area, because of the performance
>>> difference it makes for native kernels.
>> I don't think I've come across AMD's guidelines - would you happen to
>> have a pointer?
> 
> APM Vol2 3.2.9 "Speculation Control MSRs"
> 
> The information about SMEP is in the final paragraph before describing
> MSR_SPEC_CTRL.STIBP.

Ah yes, thanks. Still need to get used to this now being in the PM rather
than in one or more separate docs. I now recall reading through this.

Jan


