Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA6B39B352
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 08:56:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136755.253415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lp3ka-0003kL-KF; Fri, 04 Jun 2021 06:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136755.253415; Fri, 04 Jun 2021 06:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lp3ka-0003hc-H2; Fri, 04 Jun 2021 06:56:12 +0000
Received: by outflank-mailman (input) for mailman id 136755;
 Fri, 04 Jun 2021 06:56:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e0/s=K6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lp3kY-0003hW-MN
 for xen-devel@lists.xen.org; Fri, 04 Jun 2021 06:56:10 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 762ea18e-ad9d-4dc5-95a3-4da4f45f1027;
 Fri, 04 Jun 2021 06:56:08 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29--lNYfQM3MoyKLYZm7iOsuA-1; Fri, 04 Jun 2021 08:56:06 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2445.eurprd04.prod.outlook.com (2603:10a6:800:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.29; Fri, 4 Jun
 2021 06:56:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 06:56:04 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.12 via Frontend Transport; Fri, 4 Jun 2021 06:56:04 +0000
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
X-Inumbo-ID: 762ea18e-ad9d-4dc5-95a3-4da4f45f1027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1622789767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KJiwepwRqxdph7NGCMGqmw1+pSn8NxwUwhAHY0K4Kvk=;
	b=K+9tbIJGmS+ezIiY7t0Bj1YYOsxRhXPemPRwO+Rxl2KZGwYXwpHxd3Hmx6vc7QVEmwV373
	Y5VAT1HACFcnEVTk7mxHFcLVhiPNOJAcqmkJ7M8e6HcMJpz+LxR27nmikPlw4x6rUWMYR7
	luF3obhymrEEOT6PSZx5igSIE8II7nQ=
X-MC-Unique: -lNYfQM3MoyKLYZm7iOsuA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ch+v61ow9aXkSKq+I3I1WClp6lEMjVFWZdGFI3X5LMeuYazGp5Npw9Lpca5sqKpJLG0gbyDkGQYluZd0GMUQkb/kEY4WAIe/h7V4b51IkWxeaC7hfYVkFOKEkY5DH264cXF6Ww9UExnanpvGvnXVU5NeOV1tL4vKoO8FIfxBX/ekrzuiddN4CZiM4io+SFtNoBcGZmdrA0VWGq3y/C54YiyKRTTNwubqP5NjOM/gFbcbD2fATvzrtHHYKe4AKnnmllKAH6S2SMoogO1n2SDl68AK/q5kktKM0lp5+y77sLuizgAm1kLTa9oYhZMT8TH/vFS/4OAmrifhcvD/jsSBEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJiwepwRqxdph7NGCMGqmw1+pSn8NxwUwhAHY0K4Kvk=;
 b=SCepiTqjsgc2orihODpne3ccv/km54XTdETH6nmOJziUltwFGxjJC1xKSDMpKmA0EsPHkkCfEMgK7t+aj+Q1VOdaDGhdqrbCPN2/yQNvIQsryA8ZEO9ZlpCLd3G+jrdPaudS0cPT3U03Cvnj8x9FzVvywaYFweSuMnf94Kjo3tqPFYQxSNMsHyFLpWPAT89gejb9dw/dOgE9e2dc6I2J8ldHgz6Ug62jIn0pLiyieqqmbeneuTdIdqEr2yzmPV+1ZFwdVCAuVd57MlN3Yi8zFqif0m8TmwA/OHK1nmBV51OaQHX+ovmQ7TyesJK7tjYjyoCfx0fEir0If3Y5hVdLcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xen.org; dkim=none (message not signed)
 header.d=none;lists.xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: pci passthrough issue introduced between 4.14.1 and 4.15.0
To: AL13N <alien@rmail.be>
References: <6ccb04f2d93be6089b049df1f94a91dd@mail.rmail.be>
 <e9a3f7a8-7bf2-4f0a-cc25-d8ce015df1f2@suse.com>
 <a7c0e9b0cdd8f9e709abc329c7f6239c@mail.rmail.be>
 <b5ff15fc-ec3b-6b48-3d15-7de29fa5b2aa@suse.com>
 <175befe0e853565761e51f07b79c49cf@mail.rmail.be>
 <552b4348-1c52-ce6b-9001-a144c7147a7c@suse.com>
 <0100caba62175123c63f0df4749a8c88@mail.rmail.be>
Cc: Xen-devel <xen-devel@lists.xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8a572357-e743-80a6-fed6-3c4999b986ec@suse.com>
Date: Fri, 4 Jun 2021 08:56:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <0100caba62175123c63f0df4749a8c88@mail.rmail.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR3P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c011b62-37e7-4d2b-2a72-08d92725d266
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2445BEA4CAF83FB75651F74DB33B9@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Si1B1BZ5DgJZVKtwwuIlpq1cd8Rntww2Nbef7ydHkmpMrtUAZT/NfqsTDDDqjxy1MaM0TgKSOPZZR/MBUayfuJHu+72YH7aLd8MbwkUrgkwuQhyG3yXNwIRBAgcHch4bXur0VvKsGo6Ujt0Kglspo8Yv0Gj49OG2TFAF0XRCs4JefiRKbdHYlskH0wTTsqxsTzB4J/GiySlvBQqr9mAawfyAgTI5kfsbEpE0eeStq2nom8ySDZH796mQT4iFHq86NeLlQxrrMoJajTnfq6oboEp2xOijtPGGuW/NUb7gWXwvEYz1SfMM6HAT2t5tdtpkrZFBd/rkswfiMMY+AcUyXxMc+m/fNWV3tkSvEKs2+OY3dFDzJkjjx0lGy1nzG4p/P/2ysJzqBotQim7SV6S1ieGOaOTQb7b4mnK5+2voWHuFwLfyYxMM5aXQbKZbacxNLvWiJrUFpBfvI1AqK9khqDmPABItCTZOGTJQu9S1Wtn4JdproEIGBZrTyC/4Q10O6gem7ok/9lR7PhuJRvnNHWQCsWd6djlzFA2Tiai9QUBhKFavYUsx4bAy5Vk3tAX3Wb4SDbPbDLb2+qj+eeE9ZoNXAGZi7+2o3ERWrkgiTUXVH1+zQabWidUK2hUw+Cuqg7Pw10FtAOIi3KGi9SUDW1KR2vN2BBSJnTZPuo0fuhEnBsmE2A7icInAjH5fDf5x
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(366004)(39850400004)(136003)(376002)(66476007)(66946007)(66556008)(2616005)(2906002)(4326008)(8676002)(5660300002)(956004)(31696002)(186003)(16526019)(26005)(6486002)(6916009)(86362001)(316002)(478600001)(16576012)(38100700002)(36756003)(8936002)(53546011)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?czBPSUw4c1BCYnFra3ViWHFERFRpOHdKVWFuYW1jeGtqL1NCZmc2NHJ4MFdZ?=
 =?utf-8?B?WVl5NUUvaWlwT2xPelg4UGV0bldoZDdiNnNZcnBLYlZHY0NpRVd1ZytFdmNG?=
 =?utf-8?B?NGlNZWw2S3lib2ZnZDd5K2h0T0hIV3gyMVJuZmZqOXFsRjJ2QlMzYlZVV1pK?=
 =?utf-8?B?NHk2bWdqZjJaL2VBandaUHBqSDdEK0UycDdjdVpSdUo2Z0FCY3l6QVN0YWY3?=
 =?utf-8?B?Q2Y4ZjgwU1hBbFdaS2JQbTliQ3lTbStwMmNROGYvQUdUWGxLQnhjYnBzN2wv?=
 =?utf-8?B?R1FwNWRXdG5LanUyQ1ZaNUhkNkltQ05yMXErRTJwNEZmZFMzK3VGdHB6R1Y0?=
 =?utf-8?B?cmF6RXB6TldYQURlU3dMTGJHeHRJTGlDdDNWRnp3SGJYcUJqM21VeXFxL0hS?=
 =?utf-8?B?QnlHWDlkaHVoTHZvbkNmaXNWMzU1M0hzSWY1Wlk3d2ordDlJOG85UWR3by90?=
 =?utf-8?B?TmNscnZpTjJ1cVRoaWZDTkNwZzFiTW01MGZ0RXljcnVJckhyRmQ2SDB0UFF6?=
 =?utf-8?B?WXV4dHBNdGxvclVMcUU0QlJYMEFUVnkyYUVhMUszbW9yNGNKRzN1RnFla3Fs?=
 =?utf-8?B?VkNiOUExaHVxdmhIeU9wNXB0ck9PZnIzWW5pcWFOdXN3TVNaRER3eXVmTS84?=
 =?utf-8?B?YzZ3VnI3K3RHNWVTNWtLVG9WdjZROEZidXBtSGg0VnBXVmdtai9UeVoxTEtO?=
 =?utf-8?B?RE12MndYU25CRG95dnVUaTh4bTlJcklFRlFXdnUzMzlsQlhtNzVGSDFMQ1B4?=
 =?utf-8?B?NGtNTksvNDNKSUJaZEJYMVlJWU50Z2dNMVVGQ1BPMmdJSGszbWsxdjNQa2pw?=
 =?utf-8?B?V0xBYnJXaWo3N1hOekduWDJZZ0tTL2ZBNW0rbEFpSjNxb3JQQ253eUdhcGRw?=
 =?utf-8?B?WU5XOUNLdHFDYUhTSFBMZ3lCak5lTDNQN1k2NWdJMTRQTVB1MFEvdk9PTDgv?=
 =?utf-8?B?SGtyaE1tTXAxZ0hyRlJzdGNUcGU5c2QrdmZpbTh0eGI2bFFLT0JGTXlZeTJS?=
 =?utf-8?B?alNydkRiU05Hd2RnK05Vdnd1Mno3T1BkMVU5aEJQa1hEZmthOGhiMVFoTklL?=
 =?utf-8?B?aWh5K0tqUktYKzR3cWU0ZnRkanZIaEMvT1dPRUZybnF2aERERWhZUytyVUI3?=
 =?utf-8?B?N3dsVXJranBlS01pL2hScVhKQktrUFV3am0rOVZldkhhU0hhUWRwZkpDc2E5?=
 =?utf-8?B?ajczY3pJYlU4KzB0dEF6ZG5sc2paWnVqVDVsN2FiU0o3ZE9SUEhCRC93c1lR?=
 =?utf-8?B?YVJqWXpKdkdkRUcyVnZCWHNNVnhnYit4Nk81bVh3V3l6dWRldVBNZnFuaElP?=
 =?utf-8?B?cUVoYmk2YldtNzhrQnVDRWQxY1RBRmlTRXJwTktLTkhVUXNJQ1ZyQXRqWnFa?=
 =?utf-8?B?Ni9PT0hjcWUxQmN0cDhzT3ljOVJnNVcrak5RQTYwbWZvMWdVNGw4VGFpdVUr?=
 =?utf-8?B?WVpCNDZ1SUtIQlZ5eUNlZXNlVkZxVUQ2UGY4RFh4WUEyZVBOS2FDdUhTTDQ1?=
 =?utf-8?B?UmVVTG5xR1VvZ081ZGRrK1BnK0UwTnJVQXhqSlNKeTQvRS8yV2lCU1RRSTVD?=
 =?utf-8?B?eE1Sb0VtRnZ6R1ZxSUNjNk9ZbzhhS283TTM1cGh6SWtKVWlZOUpNS1lCTHBZ?=
 =?utf-8?B?Si9abVNhZ3oyeUdER0dLR1RGZGVnWHF3bG5zOXRJbE9LUEZuWHdseVJYSUY4?=
 =?utf-8?B?Y29icjBHUlJTK3NOK3F4Yms2SCtncWdBUWFWSFdlS1NMazlUZlNmQXpQaWlt?=
 =?utf-8?Q?SFB5IlLVmcBSYLDE6ziwflcynXRSQh5krMVnwzX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c011b62-37e7-4d2b-2a72-08d92725d266
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 06:56:04.8069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rRcjSBf05EgHoQ5SkTtkBH/2NOY5pqDPkM+lTrMk88Mjig8m6AsLe1tBWMAFkcECZLhVlMLAGEQwW5/8sWjFoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445

On 03.06.2021 18:01, AL13N wrote:
> Jan Beulich schreef op 2021-06-01 16:53:
>> On 01.06.2021 16:44, AL13N wrote:
>>> This mailing list is the correct place for the toolstack too? right?
>>
>> Yes.
> 
> So, what's the plan to fix this? is the plan to fix the toolstack? or 
> put your patch in kernel to kinda workaround it?

The patch has already been put in the kernel, as said. It would be good
to know whether it actually has helped your case as well.

> Is there a way to make a regression test or unit test or something?

Would be nice, but may be a little difficult to arrange for in, say,
osstest.

> Does anyone have an idea on what patch would cause the regression?

Not me, but I'm also not a tool stack maintainer (nor expert in any
way).

Jan

> that 
> patch that I pointed out, could it be that one, or should i look at a 
> specific file/line? I can't really just test all of the patches and/or 
> combinations. I'm not really at home with the xen code; and my single 
> xen server is production, so i can really only test in weekends...
> 
> AL13N
> 


