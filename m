Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8C83CD2F8
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jul 2021 13:06:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158343.291546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5R51-0002t1-Pq; Mon, 19 Jul 2021 11:04:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158343.291546; Mon, 19 Jul 2021 11:04:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5R51-0002qU-Mp; Mon, 19 Jul 2021 11:04:59 +0000
Received: by outflank-mailman (input) for mailman id 158343;
 Mon, 19 Jul 2021 11:04:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTRW=ML=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m5R50-0002qO-Af
 for xen-devel@lists.xenproject.org; Mon, 19 Jul 2021 11:04:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2627061e-e881-11eb-8afc-12813bfff9fa;
 Mon, 19 Jul 2021 11:04:56 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-_NOFgIg4MZCxKH_EZkU8IQ-1; Mon, 19 Jul 2021 13:04:54 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7375.eurprd04.prod.outlook.com (2603:10a6:800:1a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Mon, 19 Jul
 2021 11:04:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 11:04:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0087.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.8 via Frontend Transport; Mon, 19 Jul 2021 11:04:51 +0000
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
X-Inumbo-ID: 2627061e-e881-11eb-8afc-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626692695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X3QRHyTLIPbbl9/ex5tYKBenjeuZAkm67gjqeX8SRCc=;
	b=M5JGwyET/Ta8pODq3WdSANTyVot/Jo0ZyYJ34unW/l/zyuOvCBiGp3YkoX5Wq3aHfkcIER
	wK7fpUBS21TnZQc0DoHZ9QaqUkw+zD980Vfakt+EokYdXGacgOYf8PeBcDA1C4tmLhb3/0
	ivdK5/fKZ1OtTScUD9ED0xxxzk2F438=
X-MC-Unique: _NOFgIg4MZCxKH_EZkU8IQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3WvNTio2+w8f5Vi8vhxDVnICuEwTqU+Ij/ut/Y9S8+Yxzz/1df5paRU0btbq+npfILSTKRRaksn32fE1/orXxoR13vegbGfmj9JR7pl1pAstCHcHaYpz8TJVxaZQvARxwV5EFuC76KQ4TTPzhOQ+LnEIwaZvE5efp8WtAHa6mVryqpJ8Szw13iemUt67r28jckv5Omw75ZqOF029BlKvtGbdoAvJ88hKyvFvFQL6QN46EXGHE1KTNAlKU+cVS3jkjemBjPfBld04illn4JxnTxDrMwjVPErCuUBr4N+4RSKeAZDoIRy+kQr2j6r1FaunxoMt4ue2bTymLwgC1wmjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3QRHyTLIPbbl9/ex5tYKBenjeuZAkm67gjqeX8SRCc=;
 b=RysW2yUd4PZ/zKp8NvCdtt4noQiPim5wFkN6hag2r8bVeT14aW7XCXDhCTAvE/R5BSldKABsRwnTN3v8A0+wnzGMdZ4tNBD93h+BfGdU/ty9F2zaiFFTA1EbLMAFLzaBK0LxKAZMACYnJulj01vtCR7l2OZIxkTlmUZhQCIalQnZsFr7naa4AY+HMK0esR/Ms7Bau3eJCkqRjBE7J7FC81cdq/axw/JUY2PZS1KOmS/qBxZ4bSRHdwHxhjvgdoGQP46moIQe+EX024AlNITjAQA8gjnLjgQ8YtJAYsM2KKWXvQSI4g2jkAu+qLbLTtAZFin71EJCXIsLAcZcUDHkJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v2] xen: allow XSM_FLASK_POLICY only if checkpolicy
 binary is available
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210714161734.256246-1-anthony.perard@citrix.com>
 <20210716123812.494081-1-anthony.perard@citrix.com>
 <aada0028-ff60-9f59-5d87-a023ecd35d11@suse.com> <YPVYJqKBEmlAwnME@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <97e99661-2b03-22fb-018b-a40c48b86a0c@suse.com>
Date: Mon, 19 Jul 2021 13:04:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <YPVYJqKBEmlAwnME@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68dd58e8-2d37-4960-8e1d-08d94aa5089c
X-MS-TrafficTypeDiagnostic: VE1PR04MB7375:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB73750BFA5CEEFF1BBCF925D4B3E19@VE1PR04MB7375.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ltLuuA1os9xxYg3Zqz02wfiwor8a2hOgdcoOXEiF8bK6GW95ZFmJILBZT7I2ic68It8r+YANZiqFH/gv7RMbrrBybnUoG4DfMk3pLq0SrEkmwFoo/aR1YV2s1HF25z651PYypG0I+EhDrjE1MrdrlJynB1OoSWZgbS5BAmZ1rbQZ05H0BfNvtIGbcnkEKGGGgAAYg198H6pmND+d7hs5BksSLFK7tVHvnx5QNzZ3J52tiqz2kEMxd7KjeqW/UGwgMTrKT9p9j5QNGTEEjmnBvjtBP46h+BvbDnkXVXzdsjSo4s+IQknwy6lugABwHkSVibzXk4osptb1vuHMM38IqMAz9R50gaJAdRUG88PXq4qEInhuzhyq0jhzSyfSXAD7VsvQ6KPnlynWs+96GY6LLsFpYfKecyi/gRkk6NT1ZSD0Y+A+0l8tznFWIcWAgTbn515+ezbRvo0H7uv1ZZCXapLLishPKzEF8zOjkj3EPI2nA+hLYYjHNwODEiABNqBbCbgu6vCn1Dww4Vi6x01ejBfqtxBs4Fa1Doih1oEJaMR5S3Lao2kZ/ET/qYBBS+R2clN8nGT1ndrUvjf8A8GqTqF1eHB5jWze+8sMTQL8klMSN7IJ6qZ6Ldt9xcs0Se07i9rW6vvulXClffRC8aWJ7S4t7r49yhqhEEBCPb5FXk8calj4IQMCjLIxwDfkCsJNM3zurcRcBMMHF+U1JF3GMriGWj24Xip2Q4efPGZIkTo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(366004)(376002)(136003)(39850400004)(8936002)(6486002)(5660300002)(4326008)(478600001)(86362001)(26005)(36756003)(38100700002)(54906003)(31686004)(8676002)(83380400001)(2906002)(53546011)(316002)(956004)(66476007)(66556008)(2616005)(186003)(6916009)(66946007)(16576012)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWpmaXVSTkhONDRwRG8xN1puWTdXQ1lUd08zWTEvYk9uQW1ZZzhJcXFXRFhU?=
 =?utf-8?B?b3VuSlZBSkdYODFBL0F0WkRLTUtwZmJDelhpQjJsM3VVK1lvQzVPSHBGdGVm?=
 =?utf-8?B?QzVDZzNmYkp4V1VseXJPMmIyN1c1NE5QUlIvSkQzV2djSTBVWW40K1d5RHlO?=
 =?utf-8?B?VUdFY3BiL1hFWjhucEpMdm4xWmNDTTNFQnJZZDIvaXFReUFtdlZSNXFlZ21Z?=
 =?utf-8?B?QTZtSU9jYzNLanpuMFllWVhEOTI1QXJUNWlZdThTSUhobW1IRG5FUldwSnAv?=
 =?utf-8?B?amN5ZVVxRHlnQmE5bWhGbXRYNWVtTkU2Y0N2WmRIT1NBaEN4dUZxaEhIOWhB?=
 =?utf-8?B?M1dPbjBuWk11YlNpWXdVYzFXRis3elhCbFdZVEE5cVFpT2xEZTVCNGRpRk80?=
 =?utf-8?B?aEJqdm82NDBSZUJLMllRY1lYMTNhYXdoMTBuWTJDL2MrdVRxRGpPT1lxYkFs?=
 =?utf-8?B?VFd0aXV5ZWxlUFVERkJPWG5JM2ROYzlZc2E4WFhmTW1CNU9ESkU0andCaUxG?=
 =?utf-8?B?Q1IvR2taa0t3UFJFWDJJOFBFVEFDbExaenNGK0RicmZDTjIvbEtNczFaa29h?=
 =?utf-8?B?U1NDNkVBK2tMS1hpNjgrbHp0ZDd4VjdJK0hrZXNxQnIxbWJlUkIvemRMejds?=
 =?utf-8?B?UXYwS3dDMThMUmtFWFIwdU5ZSDhpQm1BU25JM1FVYXovZVVyT0MrY24vUXE0?=
 =?utf-8?B?QUlCdGNhUERVVFZrZUZuUk8vaU9sYmR4VjdIdDR6NU1qbG1OZHQzZEtOTUxJ?=
 =?utf-8?B?MG8xYm8vUlRzMjFadGJUeHVpSklQVVV1K0krWjdReEtzRjdmcllOQW14SWV6?=
 =?utf-8?B?a3g0T0F3Y1ltd25TaTNFWVNycXc5NWhXOXpsQ2x5ZDFTcFpOSXZRWCtOMHJy?=
 =?utf-8?B?WkQ5ZmorbW51Y1JoNkZOK3hjbVp0dG5nRGxBR3NLWGlMSlBFb1ZvRi9wY2Nw?=
 =?utf-8?B?TEVZZ2l6N2U4eWFiUytiUzk4aFF2cmwyTWJZUGw2dVowaHczZ3l0cWJub2hT?=
 =?utf-8?B?ckxOSFQ4czQxZnl6U0w1WUx0YnpqYVE0MjgxaDVGeGRuZE5mNHo5NWNIYVhK?=
 =?utf-8?B?UDFHME4vS2VoRU80VjExRnI2RzgrZ1NWaitLaVNJd1U1V0I1aFJ5ZmhZaHhP?=
 =?utf-8?B?bE9OSWFWQ05LSWVTaVkzR2phVitYNGpFQmxHbTJQQ3RFYzhoVDRSaFZkbWxm?=
 =?utf-8?B?bG5NVnhYaGE3dG5rcThEeWZCZm5pTFhLSmkyd0YraU5hZFgya3IrRHNvOFIr?=
 =?utf-8?B?RW9oVXQycjlDL0FoRWJUWjBrdk1PNG9ML2M2aWw2U3kwUE9XNlAwUkR6a0Rj?=
 =?utf-8?B?M29tWUxSSEhSQnIwQWIvOTkwODJKNjFyckk1V09Ic0xXSE5NYnJaMjdrcE5B?=
 =?utf-8?B?Z3REQ2YrZlNvQ0pXL0JIVGhaSFBUNkhIVWxLSTF1U3o4TFEraHhPWk11b2pj?=
 =?utf-8?B?QS9lRGc3NkUySmlLT2YxR0JxbzB3M2FEdTNrdy9NTDA1eXhPMlRUSURNU0Fw?=
 =?utf-8?B?SllnTVZOUE9IbjUzZEtlSTNYaWQ2MnhINU9OWTV5b2htZVdGeExlRThjdmpm?=
 =?utf-8?B?dGtFRGd2TXpKSmlBc2g5M0Iwdnpib21mY3hVZVRUNUlaOVovc0ZkS2pyVW9Q?=
 =?utf-8?B?bWc1NFowQlVucXFnQVZQQlpSeWZOR1dqV21ZZ0xVVi81MXdmRW9IemNadlFO?=
 =?utf-8?B?cTlGNUlPQzJoNW0vdmFiZFIwNStMTnhLamNhU0s3ZWdvR0tsUkZWcENaM1Zw?=
 =?utf-8?Q?ohuIiCMKy1kJqy+x48GZR4uktiXQ4lI5HaoLb+s?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68dd58e8-2d37-4960-8e1d-08d94aa5089c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 11:04:52.5412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rvTlg2/s8HOI11PJZc8/lGWGFTJwGULfSiyqSR6H2c1Jkw91fU5jYHBUnXzTMR8uYWCXUnde8x+yNd98nGSOtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7375

On 19.07.2021 12:47, Anthony PERARD wrote:
> On Mon, Jul 19, 2021 at 09:37:06AM +0200, Jan Beulich wrote:
>> On 16.07.2021 14:38, Anthony PERARD wrote:
>>> +export HAS_CHECKPOLICY := $(call success,$(CHECKPOLICY) -h 2>&1 | grep -q xen)
>>
>> While the setting indeed gets obtained in a Makefile now, ...
>>
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -235,8 +235,8 @@ config XSM_FLASK_AVC_STATS
>>>  
>>>  config XSM_FLASK_POLICY
>>>  	bool "Compile Xen with a built-in FLASK security policy"
>>> -	default y if "$(XEN_HAS_CHECKPOLICY)" = "y"
>>> -	depends on XSM_FLASK
>>> +	default y
>>> +	depends on XSM_FLASK && "$(HAS_CHECKPOLICY)"
>>
>> ... it's still used as a Kconfig dependency. This in particular
>> does not address George's concern about a setting silently getting
>> turned off behind the back of the person having enabled it (and
> 
> This patch v2 wasn't meant to address George's concern which didn't
> exist at the time this v2 was sent... I was trying to address yours.
> 
> But it seems that "George's concern" is part of your issues with
> Kconfig too, which I missed when trying to right this v2.
> 
> Anyway, those two patches are the only way I'm going to try to fix the
> random build failure in the GitLab CI, I'm not going to try to fix
> issues with the use of Kconfig for now. In the mean time either v1 or v2
> is committed, or will just keep getting random build failure in the
> GitLab CI.

Fair enough. I actually think that randconfig shouldn't act quite as
randomly as it does. But what's sensible as behavior there really
depends heavily on the future intentions with .config. If we follow
Linux'es model (which Andrew advocates for), its randomness would be
limited by options which could get randomly set getting further
altered by environmental conditions. Hence that would limit what can
actually be tested, but it would avoid failures resulting from the
environment not matching the chose settings.

Otoh with our current model (largely, leaving aside the few
environment checks we've already got) what is being asked for is
what is going to get built. But failure from environmental
constraints shouldn't be treated the same as failure from bad
interaction of options; it's (aiui) the latter which randconfig is
supposed to point out.

Jan


