Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0E93C6B4F
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 09:37:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155053.286371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3CyX-0007bG-0d; Tue, 13 Jul 2021 07:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155053.286371; Tue, 13 Jul 2021 07:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3CyW-0007Yb-TD; Tue, 13 Jul 2021 07:37:04 +0000
Received: by outflank-mailman (input) for mailman id 155053;
 Tue, 13 Jul 2021 07:37:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3CyV-0007YT-L2
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 07:37:03 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 180320af-59b6-4747-9e57-2d20e705c40c;
 Tue, 13 Jul 2021 07:37:02 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-KMsezLDONPmhpftZH0rwug-1; Tue, 13 Jul 2021 09:37:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4847.eurprd04.prod.outlook.com (2603:10a6:803:54::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.27; Tue, 13 Jul
 2021 07:36:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 07:36:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0013.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 07:36:57 +0000
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
X-Inumbo-ID: 180320af-59b6-4747-9e57-2d20e705c40c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626161821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IPD3XeB9jTummquCVG4iXWuZyFEN+iUVjpUAtFM9rc8=;
	b=L1qNKIH222XYQXpkmXDeTi6qFNgbBhNPYkyBq4TwDjVNei6rCZ87m3ADKhbJnXq+OGSsHI
	KbwkwoQ36DesoqL0o2IoR6xxFNGbSL1oCkANBbBuedSZ3jKBvo6zQM7sOhS2X66u8f1mcK
	SIgeaYJRRXvtMtKIG4+S0n8RKKqtaFE=
X-MC-Unique: KMsezLDONPmhpftZH0rwug-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0YF8x3f7YU8e+mh3U0PnXv+9nOUe5EYnvxxtb7p5XvIZy/imaAOpdQAlEPUPxN92me/qjf/Ix56fcYPT9XfM1iDAzOa9QwQQ2uEYhUycCwCBOEHKamgZNxUNUtzv82H/kFfqDRajHks54o5FbUCCmu1SGqnXPV+5SA6b6uUxHZuvAlq2OGmiPq2gTWz1eH3enenkcFDvNdGefm+pJQfI5VxKdsd+uDIUvEol/htk+xvFuCnQib0pxMjytSiFXVFSUwZBU/YO88QJUF3V9xKoIPTBk4X+2GQxHktT6Gtuh2pwQUHaPLsmroO+O4HRaWarsiLPHlPykjLUkH1WqyUPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPD3XeB9jTummquCVG4iXWuZyFEN+iUVjpUAtFM9rc8=;
 b=N7vIHszfK91kzpu6n6Hi4DW9gTsMyJhbaiKeCmPRZtODHkkB49W8ssNeIvLBGoDWHiS+yZhPIz/BeC1DhGeM0+i96TMZJm2ko8GTqO+ln0mcrtvmU9IL+dZnndbYvy6fx2qnTvPGUR0hTMmpbpZNMNcVNdTzvnd3XPCta5hTVzr4pcQnOg1yJVu060fNsV3MzSlqIBFEhrUJcBBtEoZu4mFmva1NqZSdF43+nlN1dN5GM2pu3Yk9u+P5U12o7x9gHNe65oHcK90lHsMlIL70g2RO1eV607LHh2xheMx91kEl5DS1tD+EvvhBmIXIHDI0K2qywIR9wWmuViE0H95cGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v6 07/31] build,include: rework compat-build-source.py
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-8-anthony.perard@citrix.com>
 <3b7b6366-c138-3e92-3a9b-640fcf949b15@suse.com> <YOxTKHCQDSs2mHG8@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3ec5fa48-9079-3e8b-f5d7-41c2b1b923f1@suse.com>
Date: Tue, 13 Jul 2021 09:37:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YOxTKHCQDSs2mHG8@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0013.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a5b31b0-11b5-4060-f431-08d945d0fea9
X-MS-TrafficTypeDiagnostic: VI1PR04MB4847:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4847B21521DFB52A5CAF4AC4B3149@VI1PR04MB4847.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9CF0JwiifYeAo7wGZCCYW/cTw1ySVgUiWx0LKWbBS2Pv4+wqmJD2VJXSkWeG9PNaJ9F/T1EmFivAsobYqaNtgd2olXRYHd03ClWiFiln/OfEyX/E9oRJJ/vX17xCeTyIiHVA2wngwxky4lmq6uUcH9yWw5OWFbKL6E0c6DBJpOue6bZyYk8VQ6AKdr2/oYDQE5wBBOvc8Ud9rFEWqBg99noLCQ6Vh+0fw9RnvC15U9vqqqKW1FwVRdIJ6unGrW7QB0pUAao3oSQ2C70+ruDZE2ue5yIM9FRYl35O7nbbTdxbJcgTvd+RDvVy8inl1GpQJH3E6UWexpeCZYO5bPsQ6+4y10odtO6BluTzKBbXMW5edopHg1J1WkBy9BrS8rTna/UgBA8SEd+jWXs1xsolGlOuqfzsj9YeN4T/bX0xbLf+yRTSMEgveyM3ja0OKM1qxZK0lD+4YqZ4oao3EIRRwyDccqmQfrXDghRBpjk6ZuWDhn5fB2xPdrn9d1++e+6I2ag7jWWt01uIQaDxt+smXUmKCszZqHCtTevgddcKUK6iyd6xmVPjZ1JaBqENeJUP6mIJJAEYeMrnILRZPfLUn7nbZ9pr35VHX3eYzFaMfvGvSLE0LtV16peJ5YmcZW7kXc7mCB9B8aPchY3KXXIYaEVlQS27Ns/U+zHngHNkW8Qw5YxTkXbFbNOT3eR1gD8tscPR9HmzwnzNDCdRdoQiojcWIv2rAh9HBUVyzeYWjcQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39850400004)(136003)(366004)(376002)(396003)(2616005)(956004)(4326008)(186003)(2906002)(36756003)(5660300002)(26005)(53546011)(6486002)(478600001)(83380400001)(38100700002)(86362001)(31696002)(6666004)(316002)(66476007)(66946007)(66556008)(6916009)(54906003)(16576012)(8676002)(8936002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2t6UVQvbXlkM0FNRmxGK0hpMlFOQ3ppMWhZb0pnVC9uWXdnZnhFb1JiM2l4?=
 =?utf-8?B?YTdUY3I5ZUMvdzZ3dUFBQXZsQkw4blpiYm9JNFdCUUtJK3lqenZQTk9Jcy9T?=
 =?utf-8?B?MmhWc2ozd1A3Q25PcDc0OVFUZzZPL1hmMDlqZE8rcVJreW1Db1lpSVRCdU1x?=
 =?utf-8?B?R3dmVEJWV2NuOUxCVVk4VEZ5L3lrMUtUSXhwZVZxbmJFS3dVcldjUkdHODgz?=
 =?utf-8?B?SFlEbGd2NjUvMTMwa3NYVGhKWUZDeDYwZjFUblQxUWVIeUVXemlUSkFIZFJu?=
 =?utf-8?B?WTVzZ2RaOStPZElrUkNhTlc1cXhmdHdzdGNPRC9UOXZVUWNHMjBZNE1vZVVm?=
 =?utf-8?B?WnlIdEJWbFk1cDJQeFFvSVJVZEVqSDlNUTlXUld2TFl5eDFmaUh0WVFJb2JM?=
 =?utf-8?B?am9Kc3lQZlFIZ1Z1TWY4YWdmb0hsMXFiQk5OblJZNmkxUGR0Y3F2YTk4RG9j?=
 =?utf-8?B?a0MvMFZnTzZzaGRiMnhHSzN6K2N5a2NxVEI1TGRlczBWbUtzWWwrNEUyaWsy?=
 =?utf-8?B?b1lsUHdFYXhnaG1YczN1cXVNdktKZ01nRnIrVTQxZVVzSng1ZDBTd3hlNzV6?=
 =?utf-8?B?VHN0WEV3aW5nZjRNZDQya0lPSEI4QkpreXcxRUNNV2h5ZW8vWE1nbkRVQWpR?=
 =?utf-8?B?VnFpbkJPWW9OeENwS0FUcWVHV1Njd1gxZ05QU0h1b3VVeE9KeFJjeWZXYUMw?=
 =?utf-8?B?VllXSlFUM1BnNllpRURLQlpJVGdGN0Q5M0lZWTlWNkE1eTVxWUZkRnlURnps?=
 =?utf-8?B?TFZkbHd6QTBIMEFnWEdKZkZUWjFpNnVZQUNUK2JmZFk4ZTZLOGlkSVBDUFR5?=
 =?utf-8?B?OVNIaTlOMUZtVTNTNllyV2toQVlMNTh6dHpDSjJ4cmdyQUoxd25UUC9La1dL?=
 =?utf-8?B?T3B4ZUpEaW5QWUlmbFpYZEVmbnByK3BPd09IYU92MzRyNUZwekdjUTI5RjJ3?=
 =?utf-8?B?emlYLzhJOWIyWFF1RnluNkFpMEdWM2plZzNFQlJFN2xNN0pGUlhwdXhpTloz?=
 =?utf-8?B?WWxJS3U3dU5Va09GZUxSM2xVUUpHUEpybDlPWlFEcFVPVUUrV0ExVU13RVFS?=
 =?utf-8?B?S3hSL2c4TkNJc29LWllXK0hETTc1UUxtYzl2b0x5SVUvZ3hZK05qWktoTXlz?=
 =?utf-8?B?Q2VWQm5UMEd0QUhBQ3pGMVVGczNWMWxTeXg5L1JqR05UWWRpZE95WU5saG45?=
 =?utf-8?B?dVJCQks0bHVOL00wVy83SnFjTkZCTUFjekJEWTdOdGY1VlBhWnlwQTZkUFps?=
 =?utf-8?B?K01zRHpwODBnTTVWSmpxbW5wYmN5WUE4cUZqRWV6ZVk0Qm9PUGliVnhkcXF3?=
 =?utf-8?B?eVl3ZGZwa1phZDNYQXhqMWlrdElSeVhNOExsQVpjYTROZXV2eHB3cVRPUUZZ?=
 =?utf-8?B?VTFDeXpncXo4aUYycmd0V2dsQ0dqSGpCRGhSSnhobGxqZkgzbUVqR3RET0VK?=
 =?utf-8?B?dDhxTHN3bjlOQkxVN3NRQW9udHN5WE1UWUJ3bjNCZGtUZTlwUzlURWI2SlBS?=
 =?utf-8?B?V2lYNTMrZkhta2hiUlFQTC92VUZ1Zkp0TDZQV2l6ZmlxcEJkL2NYRThKQmR5?=
 =?utf-8?B?ektLUmduNW5sclVwVTJFWG5XeVJqdW5HdmRwd3FhL2JmVWtKMGlkUk1CeXRC?=
 =?utf-8?B?L0pRaStkb2JadGtna05nSlVHdkg5RXBMSU5leDNQYnFMdERDc0hCQ00rQnYy?=
 =?utf-8?B?V2dLcVp4NVRKSWVXVU9GeTc2ZTAyNU14ekRiNVZZMG9CY2RyNUUrSm5OVmJn?=
 =?utf-8?Q?QS8Cs2vIJyu+7E7PRihbGrlIi+Y5qCOY5yaXjHI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a5b31b0-11b5-4060-f431-08d945d0fea9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 07:36:57.8990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qkrF6a4J/G7fln3UzYm1phydD+5UrgXWIFU0HfinWRd+duUFK7mx6GUa9xWPTOp01oMI2J+or/0bmlVcXQ/QVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4847

On 12.07.2021 16:35, Anthony PERARD wrote:
> On Wed, Jul 07, 2021 at 04:58:29PM +0200, Jan Beulich wrote:
>> On 01.07.2021 16:09, Anthony PERARD wrote:
>>> Improvement are:
>>> - give the path to xlat.lst as argument
>>> - include `grep -v` in compat-build-source.py script, we don't need to
>>>   write this in several scripted language.
>>>
>>> Also remove dependency on Makefile as the file generation doesn't
>>> depend on it anymore.
>>
>> Did it before any more?
> 
> Kind of, yes, there is "grep -v" that makes the Makefile part of the
> script that generates the target.
> 
>> In the subsequent patch I can see more of
>> a reason to drop the dependency, but neither there nor here I'm
>> really convinced: In general I think every generate file would
>> better depend on the makefile containing the rule used for its
>> building, as a change to that rule means the target wants
>> rebuilding.
> 
> Does that mean that nearly every single targets should depends on a
> "Makefile" or on "Rules.mk" ? :-)

Well, yes, I indeed think so.

> As for the current target "compat/%.c", with this patch applied, the
> only few things that the content of the file depends on is the script,
> the first dependency, and "xlat.lst" (also a dependency). So the
> Makefile doesn't play a role into what get's into the target, the
> "mkdir" and the "mv" don't really matter. If the rule where to be
> changed in a way that changed the content of the target, that would be
> wrong in my opinion, the change should be done in the script.
> If someone wanted to rewrite the script in a different language and thus
> renaming the script, that would be fine too as make would notice that
> the new script is newer that the target (as the file for the script as
> just been created).

Right, but e.g. adding an option to the scrip invocation would then
not trigger a rebuild.

> But, I guess we could start to use the "if_changed" macro here to
> detected rule changes.
> 
> I really don't like when a target depends on a "Makefile" because that
> means the target gets rebuilt for unrelated reason so I'd like to avoid
> dependency on it when possible.

I can see the background of this viewpoint, but personally I think the
extra rebuilds are the price to pay to not have any rebuilds skipped
when they would be needed. Overall it is my understanding that to get
this more fine grained is what if_changed is for.

Jan


