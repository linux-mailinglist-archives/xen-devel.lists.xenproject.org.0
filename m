Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A0B77DA8C
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 08:39:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584195.914669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWABQ-0003cm-BU; Wed, 16 Aug 2023 06:39:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584195.914669; Wed, 16 Aug 2023 06:39:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWABQ-0003aW-8a; Wed, 16 Aug 2023 06:39:08 +0000
Received: by outflank-mailman (input) for mailman id 584195;
 Wed, 16 Aug 2023 06:39:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8IcS=EB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWABO-0003aQ-CB
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 06:39:06 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe02::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 981c6af1-3bff-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 08:39:05 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8876.eurprd04.prod.outlook.com (2603:10a6:20b:40b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 06:39:03 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 06:39:03 +0000
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
X-Inumbo-ID: 981c6af1-3bff-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fL6wx3I1u4gjfhqI8q8yrMgppOI7THoUh6H/YANcW0xsrM+/bUZd9rskQ7HFVZo2GufTIde/v6KK/bACSEl5tg7gWHucbOxlq2bEJUuRZJs3gga7oezS8khrGuffZtdbSip43FDuZTwboyyZgPBlX7euZFG4cP/tWLRJFtjQwKkWoKKkMrsPNlv48tRerf2dtd2MTzjwwBxierTMOUpgFcKjX1ZH/VYwtgETzS3HBh/P3ClIpgQbdI0z6MDYREFaVtqdjNWU9QBvIEBulbzsJg5Zu43EpnEczHkmHSZTZGBgg97U0h2sc2PA+X5Kdtt49t4DdLh89fCJ4pXIdTzoRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+Q26JWcz0Rxo8UrbTj4RCkkhHuPqyO2hFS38KTVuKU=;
 b=RSpebgNcYyZPiidR4FB0h1bKvQVGnVpxFvSQeFnL9OrOZHQ0sX4rZQE1bi/23DvhFlRG2jDpVFklpksqfVWxcoA7oAhAcgQCzFU59gK+lpwDeiOiDnZWnt4W1YVw7afb4y3J2VJiCuEwBcJ9GURLLbb5Ce8mPSZN+fb28qqVrpzs+MdEi8pyLYafXsdAT/vOb/Xm56qzyuD5vgUs7AMGWoOyhvXGO5avCHY4DYC86XjQEPH8q0E1/lNKohjvlOPrtUZfZPd2TmzbGDUiolFS7mM+nGYRvPdQGsJFs/auNIMco2SIVnpjd+4Y8xXsWjDxCzimgKReWwdlNShOD8drtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+Q26JWcz0Rxo8UrbTj4RCkkhHuPqyO2hFS38KTVuKU=;
 b=l/rFEFI4FssM36JT6lbgEEX9JlsIAr7p1tOcZViNns41EulST/sFLnCoWImnLDpzWnHgJk3Gw6kFI+qhWkkWHzAD7JuZJvZrOPp938k4GHyZmwgwJeF8J+t87/+jFCJDcdfcQygIius2EmxTewtRIsBVMoEDk/R7Yv9OtjUDe4N5Rgbkg+RTv5DJ2cmc+u38l835t8A8qC9DA2r17ceu9cSNSjFZJxQMtI4MwGliw2qsfXTmlliGdRZr6FroztteNEbsizBM96S3H8VbwaDGp5CQLCe6qWMxC7DMUljwEY6RCFqZEWZODXq8c4ue+WOfypQ/f9AJzR3tXEUKNXATvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <41137c9b-d4b4-0891-19b8-0f7d0045506d@suse.com>
Date: Wed, 16 Aug 2023 08:39:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 02/10] xen/version: Introduce non-truncating
 deterministically-signed XENVER_* subops
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jandryuk@gmail.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Daniel Smith <dpsmith@apertussolutions.com>, Henry Wang
 <Henry.Wang@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20230815210650.2735671-1-andrew.cooper3@citrix.com>
 <20230815210650.2735671-3-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2308151708070.6458@ubuntu-linux-20-04-desktop>
 <5f75e037-1f73-f7be-740c-715902d5d9a0@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5f75e037-1f73-f7be-740c-715902d5d9a0@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8876:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b186556-127b-4afd-219e-08db9e237b3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	13FhZSjOpXdJbnCTCLlioJ20p1HTztSQ8JUP1MCo0uefF+3B9tD+KSgtvwG/TDqZpOgrMcYVRJo9sldwFdJhgH81mTl3TMUxLMzOiEl0OHhbZ0hJHg4ubWa0GqaEyZr8rZ+3vF5nIc/r52jzqs9e46WmyvqWfTVkfd1EhmAP8VJpTh7gnwa6yd9GfbIXEMSR07E1x5UJC5dSFGQkrrruo6hV+t8nGrSeGw5Sya9+gjxKLLRiws0cu2JQKOwqSdsT//ukdtEG97H7FhqnpCM0R8VSwaHoM7yumNXZtDCbfbGllzwIHqmdEVO0nIjFXvnGdzrcDXeQDgnKG1g7AQbdfVwnNmxu0CNG2c5hLMceQo6A2xRY+Q1FS5qQXB6FbzO9OY00hyoCYRMfAWiCm6AgPePtNngtW6eJ2RNRfmy6VgPz4RwJz50RX2pEHp3Ad+Qj8TsVo25dw7WpUwqaV5zMHLhCLc5od1Qyxz137kqtDpBBD4Gj2oHcDQZHECQ+JPC3415Y+wxX3cas4sxpTDB9aqrBLWTjUfgYzkVlQ40NFKooVwCLc665moNDdudApZfg8euxHo/sdWrwfb7rh5yTM9IAJd1bLympcc/02eoifJUX4QxaNT6D/2JmjFiLw9VYNkQKXMnBj2Pfvo2qPP+XOg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(396003)(346002)(136003)(1800799009)(451199024)(186009)(54906003)(31686004)(66476007)(66556008)(66946007)(6512007)(6486002)(6506007)(2906002)(478600001)(26005)(6916009)(7416002)(5660300002)(2616005)(83380400001)(41300700001)(316002)(53546011)(8936002)(4326008)(8676002)(38100700002)(36756003)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmlzUzRPejZHYmtOVmI0V1FlcnByN2FoOXRNTDNHaTNDSkhhK3c4cmcrNUkw?=
 =?utf-8?B?eWVQOWFYb3hPZVIzQ2RkU3FyTHRmdnpPSkNKeENEY3AwMEk1MWJUZC9HOFEr?=
 =?utf-8?B?M0tEQVFVbUVIcXhtU21wK2dzZTdqdEIxWDdEdWVOMmNZdXNtN082c1NWUWdX?=
 =?utf-8?B?ampPbEg3dEZ5QUtlSWJEeFZnWkFwalhpd1lBYVZWejA4S1plWVozWElJUFMw?=
 =?utf-8?B?Smp1cDJpRW4vYjlEUVI4ZXRtZGFvZXE1ZHJtNTVTN25UOGpHVXBqTCtOLzNC?=
 =?utf-8?B?c2pHN1pINnozQ0VKK0k0OU55cytWMjAwYmg3OSt3bFBnZGFvRzdDVWZsT1da?=
 =?utf-8?B?L2FiSzlqcXlVVGF0WkY2dFJGZmpTNi9Vc3E5SDd0aEJ2SUlndU9oTUplZVVS?=
 =?utf-8?B?bXdXSkUybnBXcFhCSTlGdStOUWJueCt5dG01dW5CeCtQMTFpamNtMDhaSENH?=
 =?utf-8?B?UGZ6NTRzVE1QY2JTSExyL3hKYUYyVFczNDd6MHdBUEdhdCs4b29TNEFLSCsw?=
 =?utf-8?B?dW56Y1R5K2FNZU1yQVZubGN4WUJkZ2VVcnV2V09rYXVrcnJrVG5WcTRlTkVj?=
 =?utf-8?B?TlkrYnp4Mlhjdmp0alh0cmM4NCs1RnJCZHFNdTRtaFNWWDlyRjBjWjZvc3VB?=
 =?utf-8?B?bklwRGNvaHg2eXBHczdHT3J1SVVCbE03NXYwWkNPODIwdGJpMDlvLzFrZEwr?=
 =?utf-8?B?S1hzQzAxWjVIcVdXc3A3bmpzQk9yQzZ5am1OYUE4YnRjQXFmSXBuS3pYYzBK?=
 =?utf-8?B?cDJTSlZLZFdBUndvSVVvT2JuKy93ang0VWtjZlFBYTZlbVhxUldjRUpoT29v?=
 =?utf-8?B?dnlCdjllaVJVeU1MOEx4cU5VczFSREd1UDJYN1orSS9jRlVTUTRFV1ZIVHRt?=
 =?utf-8?B?b3lvNElsbjNqZWN5NGZLYm43WkxFVzYxNm10NE44MDlIZlJibHQxRmJ2U1di?=
 =?utf-8?B?NEdmend1MTRoTzh5UHpFdWlJblN0TVU3eVNYRnFkU0xMR3N6VlJSYXd4Q2Qy?=
 =?utf-8?B?WGZQNGd4OGZtWGhnMWg1MXIvMFljaWRXZ3l3QVF1cmxsSisxT2V3dkp0WUcy?=
 =?utf-8?B?TXJ0WjBZa25sd2ViMFRUZDNpdlUvbUwxNXVuamRTS3IrTGRmYWdLYll0eFhh?=
 =?utf-8?B?QVdhTll2TG9mc0xnbHFxNjQxUE5nYkZ5cGZ4Y1pmaE1FMVFhY0tYZEsvMC96?=
 =?utf-8?B?bGdTNHBZY3pqaFZ1YkxaUHduR1M4VWRsMmhrcWlBbVkyUFQvYzRhRUhndm1l?=
 =?utf-8?B?VW90N3lvUHZpemQ2MWgyYXUxZjN6LzdSUXliN2htTytnU01hUE5oM0d0SUk0?=
 =?utf-8?B?WDVGMzE3bk9mUXlmaW5XMFYyOGNENWl1RTBUZ1dybVNMTzV3QUF4YkdOb0Ja?=
 =?utf-8?B?NHc5U0VMcGRXN3FzM3Q5QzFFUHdOQ3NTbkVGV3pTUjgxcElaWS91bjV0M3p5?=
 =?utf-8?B?YnluS3NCNjdPTHFXUjhnckpRZVZhcy9TU2wrMVVra3JYL1dQSm85ajNKTXFm?=
 =?utf-8?B?N2Z5eW54bEREejhqMUs4bEFFdlZnSXc1eW5nMDFCUFBQQzdZMmZNakFPU1Vp?=
 =?utf-8?B?RlZWcS8wckplTWwwaEhtelkyWkgvVGVFVUo1VVZFRmp5WXJIOFh6b2hJN2lM?=
 =?utf-8?B?YzZOcXNUZWVWdG5jVW5BTEJHSThKRlRrV3p1NUdhY3Q0RCtIZ2JnTjNFdkc1?=
 =?utf-8?B?dVZ0RDBkaFVaaVk3TnQ2WFhlK3BYOWc4bm44VUgwSThvamt0cU1xTUFZNGNj?=
 =?utf-8?B?NlFXSXVoQU9POHpxb08yUUUwN2luSmpaSjZkNzZvWlA4UmIrQlhOVEN0TWti?=
 =?utf-8?B?YU9Ja3lxZ09hbkxMNnE4amtENDBTM0ZaZ25rc25UaUgrS1hCdlU1WTltZDU2?=
 =?utf-8?B?b08xbzFkQzNwd2kvQytyOGpocTE3U3JhVGk4S0tZM3NBcXkrRnF5N0N5L3Iy?=
 =?utf-8?B?R2tXMTFJbzBnYjg0a2g3bWovTEFVWlMvTjNMWXQ2L1psRFdZU1VLMzlza3c0?=
 =?utf-8?B?Ty95ZGZNVlRQR3oyY3RlMVlVWGg2M1ZNN3VLTE12WjdqMDhVbFQwb3gxT3dw?=
 =?utf-8?B?TkVKSFRFak9EaDlJa2xUVkJBVVVxbnhWNHFxTThqVzdZRURqNDQ5SWo1M1BT?=
 =?utf-8?Q?30oSqG2tDjIoaKQxIDA5S8lpC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b186556-127b-4afd-219e-08db9e237b3a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 06:39:03.2926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D+q4LCqdJcdLzxrDcv4OucV7M3Gj0Q0oJqJCpyuJVB5uJhJgDW8y1rmHB0zSENrHIf2/3ZEi1mGEF/xd5a2bXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8876

On 16.08.2023 04:58, Andrew Cooper wrote:
> On 16/08/2023 1:19 am, Stefano Stabellini wrote:
>> On Tue, 15 Aug 2023, Andrew Cooper wrote:
>>> --- a/xen/include/public/version.h
>>> +++ b/xen/include/public/version.h
>>> @@ -19,12 +19,20 @@
>>>  /* arg == NULL; returns major:minor (16:16). */
>>>  #define XENVER_version      0
>>>  
>>> -/* arg == xen_extraversion_t. */
>>> +/*
>>> + * arg == xen_extraversion_t.
>>> + *
>>> + * This API/ABI is broken.  Use XENVER_extraversion2 where possible.
>> Like Jan and Julien I also don't like the word "broken" especially
>> without explanation of why it is broken next to it.
> 
> The word "broken" is an accurate and appropriate word in the English
> language to describe the situation.  I'm sorry you don't like it, but
> unless any of you can articulate why you think it is inappropriate
> phraseology, the complaint is unactionable.

That's simply not true. A wording change is very well possible, and
what you regard as "broken" may not be viewed as such by others. IOW
while "broken" may be "an accurate and appropriate word in the English
language to describe" your perspective of the situation, it may not be
for others. Take the extraversion case: It was clear from the
beginning that it means to limit what to use as XEN_EXTRAVERSION. No
bug, just a limitation. Similarly for the command line: Besides the
full command line (supposedly) being of use for informational purposes
only anyway (and the full one can be taken from the log), no-one could
ever predict at that time that we'd accumulate such a massive amount
of command line options. Again a limitation (and yes, I understand
that the information may disappear from the ring buffer, so "xl dmesg"
after the system was up for a while may not have that data anymore,
yet of course an agent in the system could make the boot messaged
persistent), but not really a bug.

> Specifically ...
> 
>> Instead, I would say:
>>
>> "XENVER_extraversion is deprecated. Please use XENVER_extraversion2."
> 
> ... depreciated is misleading.
> 
> It would be acceptable for a case where we'd introduced a foo2 to add a
> new feature to the interface, but we're being forced to make the new
> interface to fix two bugs and a mis-feature in existing interface.

See above. The existing interfaces are sufficient for the common case.
The extended versions therefore are an enhancement, allowing to call
the original ones deprecated, but not really anything more.

>> If you want to convey the message that the API has problems, then I would
>> say:
>>
>> "XENVER_extraversion might cause truncation. Please use XENVER_extraversion2."
>>
>> Or even:
>>
>> "XENVER_extraversion has problems. Please use XENVER_extraversion2."
> 
> If "broken" is too nondescript, then "might" is bad too and "has
> problems" is out of the question.
> 
> 
> There is a partial description of the ABI problems in the comment block
> beside the new ops.  I could be persuaded to extend it to be a full list
> of the ABI breakages.
> 
> These header files are a succinct technical reference for proficient
> programmers to interact with Xen.  They are not a tutorial on writing C,
> nor are they appropriate places to sentences of no useful value.
> 
> Through this series, I have done the hard work of updating the
> commonly-used interfaces such that downstreams can stop working around
> real problems caused by real errors in these APIs.

Or, as I view it, working around limitations of the original ABI. Hence
a new feature, not so much a bug fix.

I'm afraid the main reason why this series hasn't made it in yet is your
apparent unwillingness to accept that other people may look at things
differently than you do, resulting in you not being willing to make a
compromise on the chosen wording. While you may view this as others
blocking your work, I don't think it realistically can be called this
way.

Jan

