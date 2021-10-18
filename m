Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5704316F6
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 13:10:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212064.369808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcQXB-0002v7-UB; Mon, 18 Oct 2021 11:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212064.369808; Mon, 18 Oct 2021 11:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcQXB-0002tG-OZ; Mon, 18 Oct 2021 11:10:25 +0000
Received: by outflank-mailman (input) for mailman id 212064;
 Mon, 18 Oct 2021 11:10:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcQX9-0002t7-UE
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 11:10:23 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc7a8f64-3003-11ec-82d2-12813bfff9fa;
 Mon, 18 Oct 2021 11:10:22 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-XZVxxYJQPICow_o86zk0Yg-1; Mon, 18 Oct 2021 13:10:20 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6175.eurprd04.prod.outlook.com (2603:10a6:803:fb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Mon, 18 Oct
 2021 11:10:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 11:10:18 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR0502CA0051.eurprd05.prod.outlook.com (2603:10a6:20b:56::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Mon, 18 Oct 2021 11:10:18 +0000
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
X-Inumbo-ID: fc7a8f64-3003-11ec-82d2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634555421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Mk/9E7f886e4J5u++DJqz9PL0afmdhKT2a+g4quzVI=;
	b=fWYIizHkhuim9b8SLf3NVrfo1Drvpfl77/hxoHRUCVBepBOjlgb8bwkErbDgMv8Oq02wwC
	v9laTvmBFJTPKkiQ1Sz2AGVVuKqKo9DgYGMaLWOf/ipbrzs8X+s+ufpfk7Q25iN+aXeSwu
	V1wBGIDH7cvKOO3r+BnrLqx4SlJ9Xjk=
X-MC-Unique: XZVxxYJQPICow_o86zk0Yg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MrRib/FwjjM3fqD7CP9CmJAyqKxCcsP6nbz0gUM9r8KGNrYMLGfT0Qk4P0dtNEk8pNXTnsnDB6U3yK8JmuB85UfBLw/2eWpl5okY6/5oHSohCrbttHG2DUFbubhIypfzru/NUnrrgBTty65jXO/wwJkvoHYadHgVRYoIfSe/40ruNO8QtobXjRGyttrpBcMA4bslt3VJy9B/i5BWrdqGTXsnpRvlw4uf9RmXZQkDcHig8F5dW2NeYhauBFRAWocDpOPBt/G+ozdtgJ9Zc2M6nmhDMxh5LXhohRxiHnsn37U5Z/A+m8OoQyezDik7Vo7vdNd0Go4BFj4bwS/QuOuECA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Mk/9E7f886e4J5u++DJqz9PL0afmdhKT2a+g4quzVI=;
 b=D+kRBH+kM32qDCKY5GXpfNI2wxt40+yegZhkMYmPD7QWTAs3ZCPveNoZbW8Oqwt+rjC2yQMaWKmEdLxA6GhzSN9wwvtB9sJZ+CKakaVp9oR5DZa+IlE8bYd2DtZ5d0OEPeQfORsLNX8/Vy59mAVa9NxFUlFM1/hHJFHrmpB2mYKOw8oHJcYpXdDuSRWYE4Xa5463p9PxAG5mOhV67Bq38sVXy2RkdWUqRmxGjSb0BB4ArG6OvFruHpzomF5ZX8vugTRp/9ItAGq990N2z+xwuZjtx/uMY21FIS8VgRkJ35JhVsbDGPVBQyRHhVppxIzS7PmzWQih2oY0Sl2B4LTlDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] x86/HVM: correct cleanup after failed
 viridian_vcpu_init()
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
References: <55570db5-3823-8996-f69b-c2b00bcd4227@suse.com>
 <24941.20394.574634.548545@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <16076406-9a32-5cdf-0ea6-72a8b21f420b@suse.com>
Date: Mon, 18 Oct 2021 13:10:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <24941.20394.574634.548545@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0502CA0051.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a4abc5c-287b-4b52-c764-08d99227debe
X-MS-TrafficTypeDiagnostic: VI1PR04MB6175:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB61753895B7E982D3A3260ED4B3BC9@VI1PR04MB6175.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kvwv+acW9kkd312zJzfyCU39eq19Ds+tikRx49pjLjVoOQ19K9cP4u1Mrq3sr/1cHFGcSyWTLcVLNCqrpKhXw/S/IdqXr7RrP4Ygok3yo9kOSA0Od3yq7ZyMgZKe/cWdMXImIlQrVHA6G3bc2XlXo60HOJVhFgzVlQ7C/6pbIi3/GLDELCcJaw+Z6WS7ltR2tp7zL/SqoNHaAPMz3z5uC6ui3UAqgXox0M9Wh3ShPeJWF7G50l8p+47UXWcYfKkalL2GNDaXMBunLtmNUXjBcPruEEwZsLX4f5OCi/HqJyEEK+hKsXMR/dXjtPiFMxIgK2aebp9MBRZgjjn/2qS8xCOEpGhYH0D7+qEHtyWNgW8uhiCa09apyMbBm/qOlacsfXu5qwClnGoquix5FGdTZV1y/BhyH1HC8AEdP5XFjDeoAqWvgFU3X8FakupKUB0w8wEaJN9mtWMPiiJdkvgVd0NYhcrCtBmfMgRB/jb3IAK2aq2UJ3060jgnWPMNCYMV6ZJzDl984EbH5gJFZUGDpwMwjTZXkKQqj1uPRzxdH7rEW45PjA/ewkhKB26y5aHt8FDyaIQ3pK0w7wSA9XjEAX33MguoZOMOytYJ0N5zAgBNOt4/Espoh2cSteQ18JmjIwfah9B5/XLYvR0yvFWt+ghliFD+gJ2jlIuwP/aRpGFR5l4ArPc4nU1bQvvOQ1FXdnnHWgWXCvhHBASbMkaPaf7r8CSZKomXpa5A1MQJpAkcZkzFL52vpb6sb3zY2b+7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(66476007)(4326008)(316002)(2616005)(956004)(53546011)(508600001)(16576012)(6486002)(86362001)(36756003)(38100700002)(2906002)(8936002)(31696002)(8676002)(26005)(66946007)(54906003)(31686004)(6916009)(186003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTF6N0Y0R1ZibnRadVZlVFF6OUNBMlNhQ2ROV3lJQy8yVW1idjR6RVBNMVRC?=
 =?utf-8?B?NVNOUFJSRWovb0xBUlhuSUgrWngzOFRZNURMMHBLcU5CZnErcDdDTXJTUWQv?=
 =?utf-8?B?ZDBqdEsxWkpLNENWUS9pZHFrOHZtVDNnWmZnWS9XWG5yMER1aFRqbHlqeTBj?=
 =?utf-8?B?c21nTEJISkcrT1N5VDd5ZnpIYmh3S09BK29rdHpzTHJUSDZxaW10RFI0eE9i?=
 =?utf-8?B?RzM5MEhwVXp3SXNuRHpxVTFCcGNpTDBLOHVoUXo1bVZ6cEFWSE0vN3laRWNt?=
 =?utf-8?B?ZGhMbC9SbkxTN2t3cVVIeG51ZnY0TDJnakNTQzlXdEJyamVGN29JaXhGVVlM?=
 =?utf-8?B?bTRzd3VqUzFsWC9XS2ZrM2ZMUlh3MTRTWmF1MGNWQU5HbU4yZnhwS2JMZVJk?=
 =?utf-8?B?M2NUNGdhMjkwYXBuZk5wNVAvVDczcEczMkxzenl5VFYyZjVLMjR5S0xDQWxO?=
 =?utf-8?B?VUYxVVdpWTJsQlRPL3RZTFlaVDl1dmRUdytpWDNlVDBLaDRnRCsxeUVNZkhX?=
 =?utf-8?B?K05JYWpFOE1lNkM4aWhxQnY5WEQ4K1BqYjJPVGJrRzNvTk1jYll6Q09PVUQ4?=
 =?utf-8?B?aCt0Nk5laStrOU93dDVYNGxGS3BwN0kzU3lLM2tKSXpVRGJSODNlYmNRS2NM?=
 =?utf-8?B?US9GNXVtZGFqNTQ0TkN2TG8zblA1cjFuckxXNml0V3RmTW85TEVKamRaS3Nu?=
 =?utf-8?B?aldNTXAxeTQxbVlNVjFCUUxIV09mb2xUQmE4czNlSmFVcWxETU9rL1Y5NlNu?=
 =?utf-8?B?QjFKZHpsbnZwUXNJNWJrYUIwaVQ1K2Y1NWYwMDhoOUIrOW0xdkI3cFRJN09R?=
 =?utf-8?B?cEN0ZTRmL2FBRXgvLzdjd3ZFME1SWXRiZ1RvTnVPaUNBWXp0VmhrbjFGbGFt?=
 =?utf-8?B?eTFEMmNVZ0hZak01RTkvSDZFRW82b0ZKUkdqMmQwYXhKc1lCeUduMHZvZFlu?=
 =?utf-8?B?Yk1OZXlLWDVCRExMYm1sdFhxYk5Gak0rUXpRdkRJeTBiM292T1ZrcmNhb3k5?=
 =?utf-8?B?dEVVeHQ4OEh6MHM2RTNDYXczVkZTMmlhNmdHRmhVeFkwVmZEOXJJdTVWREdY?=
 =?utf-8?B?alBjRG1GM29ZUkc4am1kZDM1cmhwL21UeS9OaHhBaERBckNwY242RkIyd3g0?=
 =?utf-8?B?K09PWkFwd3Y2YWgzUEdhU3pwRy9vdXlFMXJPZ25wc3g3QWNoRFB6RmQ4WGJa?=
 =?utf-8?B?N2FXSEh0bFN6aXhvT2FHS0MyMlZnSVBHUEZrU0lJL2NiaFkrT0Q1K0F3ME52?=
 =?utf-8?B?Y2crWVp0OHZRRHV3ejJnYXZ2L0psQnQ4b3JKbGZudkNEWEFGYmhUU3FwNy9u?=
 =?utf-8?B?NWhVTWxhZGRIUDMxT3BnbC9qZ0lSeC9wMTd6Zmxtak9VdDlOQno3MkNHeXN5?=
 =?utf-8?B?WUlPZE4vUHIrVTRTK3B2V1ZJN2xPSmlndE1tdDAyRFRjVThiZHVnUE1Od0th?=
 =?utf-8?B?aFZOUWxTQTBBSHFDUDN6d3ZPeXkrWlVRbGphbGNua29SZlBTYWhZUC9RQnVK?=
 =?utf-8?B?YXNkQjBxVUZUbU81ZUREbGZreU51R0wzRkVpTUFKa2lrMXh0cE9CSmdiM2Vo?=
 =?utf-8?B?dlI3S3BjVmtxVE9OVWg0WTc0dDNFMjRYSEs2cnB0Q3orREZRM0ZEaWVsTFVO?=
 =?utf-8?B?WTVHNHFjQ2dabVZpTG4wclZmdWpMeVNYMUFwT09MVFR0L01NUVIxTXovcENG?=
 =?utf-8?B?WEdqQTIrKzBRTjY3SE1TNlVYNFR0eG45L2dTRXpCL0JuV0pUVU9LQ0ZNSFJC?=
 =?utf-8?Q?peMfHgXc7m/W1qCSmCYe+QPy0uEs48Gl1xH0Ehm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4abc5c-287b-4b52-c764-08d99227debe
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 11:10:18.8880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Pznv8yF9Cpk3BO8X4A9bP5BBxQiDbQvY/y7D+mcTUuxtPhWHh2e66lRDahGwxTbolqy3ZZEDrM8JVpjse11ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6175

On 18.10.2021 12:42, Ian Jackson wrote:
> Jan Beulich writes ("[PATCH] x86/HVM: correct cleanup after failed viridian_vcpu_init()"):
>> This happens after nestedhvm_vcpu_initialise(), so its effects also need
>> to be undone.
>>
>> Fixes: 40a4a9d72d16 ("viridian: add init hooks")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -1583,7 +1583,7 @@ int hvm_vcpu_initialise(struct vcpu *v)
>>  
>>      rc = viridian_vcpu_init(v);
>>      if ( rc )
>> -        goto fail5;
>> +        goto fail6;
> 
> Not acomment about the patch; rather about the code in general.
> 
> I have not looked at the context.
> 
> But OMG, this is horrific.  How can anyone write code in such an idiom
> without writing endless bugs ?

Well, one of the reasons I dislike "goto".

Since you've been looking here - any chance of getting a release ack?
Perhaps also on "x86/shadow: make a local variable in sh_page_fault()
HVM-only" and "x86/PV: address odd UB in I/O emulation"? Aiui that's
going to be needed from today on ...

Jan


