Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D527C304335
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 16:59:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75235.135418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Qke-0000ko-CO; Tue, 26 Jan 2021 15:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75235.135418; Tue, 26 Jan 2021 15:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Qke-0000kP-83; Tue, 26 Jan 2021 15:59:32 +0000
Received: by outflank-mailman (input) for mailman id 75235;
 Tue, 26 Jan 2021 15:59:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PjTf=G5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l4Qkc-0000kH-RU
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 15:59:30 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73f9fb3a-2fac-4688-b239-65950977c64d;
 Tue, 26 Jan 2021 15:59:29 +0000 (UTC)
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
X-Inumbo-ID: 73f9fb3a-2fac-4688-b239-65950977c64d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611676769;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3v4P56VGsjk5llTZQ06IRo5g0oxWTnmG2CfIVp/89po=;
  b=F7A52DJpGvKvnxPqWcYnQVgs1jsWhK1x2n/GHIFXvDGLEyUk2RLG6tsV
   WgQhsbl1F+Durn9NpED0aITiJpBmclgqYWYpbED+n0Nb1GRyZtxB/4NTC
   wcfbblQ/ZYCbup23wN9jF8BpAdX8T14fSrjrs4uDG5RYcaxnf91W0evPw
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 12rZF4LauM5OSYANVN1y5TC4Apfc4do7xEGOYDUpfVUeupcNKQa5QUt3V9qYbO4gAmoj+b5+av
 fLhdjsPeFeeZTsVmfgC5c7nCDXMCW1ai3ZRQHC4tLLzSaEVy7WtUPjEJ+t6We/DwvysoIYWXwv
 Hz/O3sMYpUXN48r/XqAsFG1tkGvsmq9yfIMK6cbJIs9LLFWNMyoSDe/N2z26xAOgMRaeB8CD32
 QlYiXVR0j3LFXR8zBq4XK11FjJ5tRqLDsdL4sHp0yAbc8W7bFvGCHOpim/w8q3j8hwIEq1CEO9
 CB4=
X-SBRS: 5.2
X-MesageID: 35877878
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,375,1602561600"; 
   d="scan'208";a="35877878"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bm1T1BAcGoy3cQEQ4pVUIVKgK8Y15RRks1rYI32iMSlpZH1H1y5L04FWpYhyYJdVRVcT/wlAZ19TGbp3PpZh69riOqiepFCgEJlKGkRaC2FRMhVkkrCTMLmeYrXT81e+pSN5Kdj5/BzueiyeOkMhmKqbYSU9MY0PLfoGS0iUi3MTyZb7N1USo5EWL9p+Q7uhkErDlYXn3xyg48yW5IyOK/jivtLX7JlQDYHC+2J21D169PXEtVt2z6sfPuaHtSQlCzJj5HXZfYzPlu21AHjjcmpe7aflsh/gk4AIaKfdZA0eqVSjARVBkeJyAaHJNcjSju31iMg77kbaIpY41leRyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXOdaqWZdeqwMtUeXHo8G5WPnlQnye3g0CeCjmib6GA=;
 b=iofErfPcL6h/I3l9CL/D28DsRoDNuuaWIAbQTi+JgcfNqzAvRS7YLaZM5hyTO9rlk69/5W4KaAya2ghiF7xJsVTadZIHP46hb7wzq5H1aRmbKWjC4dEaVDy06AvZT0LFisnbFz5qHgmKDBWKIi7cZLJh4VKtzD+tvSXV4FWY2v/dtRJFwYbjnCtCPb/JT2ZlrplIGR/cbbb6vNhveBfIUofoZwvIBMdDom62m+qmjKOsoGAObKQVwYyvKrVEeA8+riqwxgoi4aDhxHwcVl7VihOPepf1PPXYJqjgDonIeKQE6oFho3g79cje9/+buzCn/8FxFkar4GnLGDmSc8jiYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXOdaqWZdeqwMtUeXHo8G5WPnlQnye3g0CeCjmib6GA=;
 b=bRFJn0afjHnAL7TECohzMBNu9YaEW9Uj+2pNJMNQObMtsrcqmqhA5Jy5cFXarUlB06w9axG9jJuvDpNtgRkx95h1u3EmYkwSx4p9Zb06fY+wf8Wu1XW91ztehHoRLqk7gii8thDPZQ3jx9b0pwzn1QXkHNFzFE7+2YY52G/cyxY=
Subject: Re: [PATCH v7 08/10] tools/misc: Add xen-vmtrace tool
To: Ian Jackson <iwj@xenproject.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>, "Wei
 Liu" <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
 <20210121212718.2441-9-andrew.cooper3@citrix.com>
 <24586.61484.451595.44272@mariner.uk.xensource.com>
 <f8b43de9-03e8-a1ec-b60f-6bbc1691e928@citrix.com>
 <24592.1081.38318.522643@mariner.uk.xensource.com>
 <445bd883-3900-6a28-10e9-84251af43123@citrix.com>
 <24592.6651.498517.334163@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3bbd53a7-ae17-1188-5a44-b5e489480b71@citrix.com>
Date: Tue, 26 Jan 2021 15:59:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <24592.6651.498517.334163@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0419.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::10) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 488d88bb-7323-4760-1f50-08d8c2135ae1
X-MS-TrafficTypeDiagnostic: BYAPR03MB4342:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4342A1A7560AAF0F4ACA1237BABC9@BYAPR03MB4342.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LJRG7lfs2RFtRxlKR9Txr1eOJM4FOAgQ9Een96SuuEL5/JiGZ1mWUlvx8RXeJBS5u+GvO8zu7nWIMDVFlmBxvD73QTTmcnAjTK6U5lkWss7Wx+GW7vXaG/UvkiH3zjdh0LpyDyYZtqRvU7C5AMfXsLHH74MCdqqgfktj+8hjKT6hJ8xVBylm+dQX+FPxO4i/MUfdtJVOz0j3rGQXhP9R8xi6l5+hD56kB4bZGyzbAZdMHb/uAscpj0jsQ52qmiIe1tLPERKXDoVSiKKqAAq9Xa7U4Mqkrur02zTSlFsNiLS0wVsv67GvPLOSW+AJYlesIKZIKUbXM29xBZTHLLB2fiL7X0yxV53CMZ3VLTq4iu63+kjRnXzkT3SmZpXj3FxKzYjxvN0001zo6JWbIltjWP0Dq0W6cQLq10vqDjtwGA7omvypwVs1N2gA803DXbC4qX7WeoF0oajDhGTc1gBOVON/R5CJXuLxwEFrp8QOR2M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(186003)(53546011)(16526019)(2616005)(8676002)(36756003)(26005)(956004)(66476007)(6486002)(2906002)(66556008)(54906003)(4326008)(66946007)(31696002)(478600001)(5660300002)(16576012)(86362001)(316002)(31686004)(83380400001)(6666004)(8936002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SW5GMzJoNGNneS9hck5Wb1JreE9sSkZBS05FRTZPSmlnd1lwdFQrblV6SDZT?=
 =?utf-8?B?MnNaZkN2UWpha2U2NUh0U3JLRTJ5Mi9lTmpuWmRzVzBaeUFoN085TTBqSzdD?=
 =?utf-8?B?TnJCUEQ4NCtBTGx2NzVXcDRscjZWa1BaZHM5V2UxazB1VzNydjh5QjBHVFFv?=
 =?utf-8?B?ZTJReXJ6dytJMHdiL0srM0s5RW5yRE1KNnBOa1ozMk9zTGtIQ3BQczN2QzRC?=
 =?utf-8?B?bEdNZmQwMzZROGVZYU5WdWptVEpobUcvcS9BcGlaTHdCRWZCOE1XZ2ROakJM?=
 =?utf-8?B?SGc3WTFscFczSFA2VllydnVaZ1JYNk9jL2MrVE1nd0xVNEdXSThQa1NmUFJ3?=
 =?utf-8?B?cmtVMTF5RStFemthbWdIUWIxZ0VDRjFUZGUwcGg2RFBQNWRTcTV2RmtVb21j?=
 =?utf-8?B?SzBRVVZsQUdIcmpnK1FSeGh3ZmtHN2k5aTdTUTIxeWxaMEMwaDBITDJsSk44?=
 =?utf-8?B?bWh2aGswbms2OThBNElhMklVVUNuMVdicU82bkZ0RXZrSkNGRlZ2MEZLcXk2?=
 =?utf-8?B?TEZBU1R6dnhQdUNhclVBVyt4NTZ5VkxZUk8yNHcrc0xsZ3k1N3RLSWROWG12?=
 =?utf-8?B?bzM0cGNuTDBWYlhiUEd0RkJ3clhmaVRnMU5zdkdKaVlEbnQvWWcxeGZjUHpC?=
 =?utf-8?B?WkFrQ0toK2pHUEI1MmhTY29BMkdQN21TRXB6Nmx0NWw3NWUrazAvVElnMk03?=
 =?utf-8?B?MkdUUHhIMUhhTTJFc2RmcTRqUEJzYktwU3JUSkUydmdxOWN0VVcwS2hBWDVp?=
 =?utf-8?B?UE9MRWJsaFo3UHBHMHh6cFFlaFhJR244UXpiY1hoaDJ6SWNnRjJzNENFK0VP?=
 =?utf-8?B?Tlo2OEdQVXVJK1Q4L0FKQlNjVmZGY0dzU2tYOEl1azRwaCtWMGNxQnBvZDZB?=
 =?utf-8?B?Q0xMaTV0RmVxUFdwazcrRjM1eG9uRm1Qam10MEJNMHhhQWFwbU5mbngzR0Nj?=
 =?utf-8?B?WmZyVlZWdmI5QjB5cTdWRGxuZTdkRU1zL1c5cjVpbUhTWDZUcVJBZktJbTVH?=
 =?utf-8?B?UEhKWjJYSllTcXo2aFF1UHByam9FU3dvaDhhSGtnTm5TNnVLWkZ6QXVqa0gw?=
 =?utf-8?B?ZFByZEhQZGc0cmVRM09haXJ6UzczYWJLZURLUC9LZ3I4VnNPNTM1YWZUa0pI?=
 =?utf-8?B?NC9Ma0ZZVEIzZHZXTyt6czNJY0JOeUZoNjFDMG81UElPNGJIeFl2bUdjTCtx?=
 =?utf-8?B?b1loZzZDMlI3a0ZhY3RqR0Y5eVphZlNFN096cXY3cmh0SS9hdU9rWnQ3OTR2?=
 =?utf-8?B?Vk1VTURrWThyNVpFTEdTYmlJWWVLMUVNTTVnemkxRHZBaEtlMzVEd1p2dTcr?=
 =?utf-8?B?ZEZzL1J4VEF2R2djaVNYWlAyZVFqNmhqTm1nZHB0TTdaWVVCbzhTQURycFN0?=
 =?utf-8?B?dFFmdk54Q0g2TmZ3SnlrQUU5UXdZd21mTkZkdjRUUjRKays0ZzYxd0ozTGtL?=
 =?utf-8?Q?0S1DjMFx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 488d88bb-7323-4760-1f50-08d8c2135ae1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 15:59:25.9224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8hQx3NPrOsFkU8NKudb1pPlF4ObJUSZ0yO4qaRbrVwRHyrvPb7ISVnxavP3OiN30oVjZTesRPOKYd4vtAmHjmt+g+OxKWlb/yIhgz8+rOTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4342
X-OriginatorOrg: citrix.com

On 26/01/2021 13:32, Ian Jackson wrote:
> Andrew Cooper writes ("Re: [PATCH v7 08/10] tools/misc: Add xen-vmtrace tool"):
>> On 26/01/2021 11:59, Ian Jackson wrote:
>>> [Andrew:]
>>>> This is example code, not a production utility.
>>> Perhaps the utility could print some kind of health warning about it
>>> possibly leaving this perf-impacting feature enabled, and how to clean
>>> up ?
>> Why?  The theoretical fallout here is not conceptually different to
>> libxl or qemu segfaulting, or any of the myriad other random utilities
>> we have.
>>
>> Printing "Warning - this program, just like everything else in the Xen
>> tree, might in exceptional circumstances segfault and leave the domain
>> in a weird state" is obvious, and doesn't need stating.
>>
>> The domain is stuffed. `xl destroy` may or may not make the problem go away.
> Firstly, I don't agree with this pessimistic analysis of our current
> tooling.  Secondly, I would consider many such behaviours bugs;
> certainly we have bugs but we shouldn't introduce more of them.
>
> You are justifying the poor robustness of this tool on the grounds
> that it's "example code, not a production utility".
>
> But we are shipping it to bin/ and there is nothing telling anyone
> that trying to use it (perhaps wrapped in something of their own
> devising) is a bad idea.
>
> Either this is code users might be expected to run in production in
> which we need to make it at least have a minimal level of engineering
> robustness (which is perhaps too difficult at this stage), or we need
> to communicate to our users that it's a programming example, not a
> useful utility.
>
> Note that *even if it is a programming example*, we should highlight
> its most important deficiencies.  Otherwise it is a hazardously
> misleading example.
>
> I hope that makes sense.

First of all - I'm not the author of this code.  I'm merely the person
who did the latest round of cleanup, and sent the series.

This code is a damn sight more robust than the other utilities, because
in the case that something does go wrong, the domain will still function
correctly.  Almost everything else, qemu included, will leave the VM
totally broken, as it becomes paused waiting on a request which has
escaped into the ether.


I also don't feel that now is an appropriate time to be insisting that
the goalpost's move when it comes to submissions into tools/,
particularly as you were happy (well - didn't comment on) with this
pattern back in v3.

What exact colour do you want this bikeshed?  Anything non-trivial is
going to miss 4.15.

~Andrew

