Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA88A58F80C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 09:03:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384208.619509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM2DC-0005Bb-QQ; Thu, 11 Aug 2022 07:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384208.619509; Thu, 11 Aug 2022 07:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM2DC-000590-N7; Thu, 11 Aug 2022 07:02:34 +0000
Received: by outflank-mailman (input) for mailman id 384208;
 Thu, 11 Aug 2022 07:02:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WeOc=YP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oM2DB-00058u-Ur
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 07:02:33 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50065.outbound.protection.outlook.com [40.107.5.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 920152d2-1943-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 09:02:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB5657.eurprd04.prod.outlook.com (2603:10a6:10:a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 11 Aug
 2022 07:02:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 11 Aug 2022
 07:02:29 +0000
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
X-Inumbo-ID: 920152d2-1943-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JeOvEsYj6T647nwigO04pE+PhtIlb9MFFSELgMDxCRNP1s0yyxFEI5BRuZrWpLbrw6r2EXqFhbDoHxFC3cj8ryKwwLsd/Z+kAE7bkydj160yLvTziruhCAI2hEAN2MGHTHftwEuvnTWQyrVuAMsjb6uyZDceiftqt8y7DM6dFMD0FNxz+djk5TWZ632MBNOT8pvK/FMelNMjafIr35Nf50ax9vttiDNe8QQY280Yw2rXieBB7c+7IRw1PcVFYnYOL+RrsAKd4cSd+tBSiSFk2ADSQPGhii8v1JV9UnGwvKaU9urrTup5nOPboKmPXOYseZFx3DF67IM6k+i2Sj4gQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UntFayVAp+lMaQMMIqc5Pf7A1gF6CGWwYw7mxljBI4=;
 b=Z9WeMphZaHQyf8LWRdR0NfFOwSpWYds4sGXoFpM3TNsVIorOKEExhEDfuICiOQQ+VvKvdHBhvf3t2AtlZb6SzRX08JWardx0Jq2TKe7lGyxwr3vR226QYxK6h5CAY3X7bSYqswl6LQFX4aDoFmBXCOCh/rufkspgXObQFbaFj60/6wRyKes5T8LsgFLE3sshy9C6mXNBrJqv78HzKFRxiz5y3c3Jex/vYqidwd0j64QvODMuqVGa89LCnqcPXt04nIF1jejyTUGFTBYIIAefIGKi8gISjMq0qkQpg3n8jcddIREGoFA46GUB7NlsM48D19xO1MfZgo6jrMYQZ9ra2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8UntFayVAp+lMaQMMIqc5Pf7A1gF6CGWwYw7mxljBI4=;
 b=hvqAAIcfsSr2oVioMTCdgrVsSv9t0MF7Dp+Ytey6Ue7MvBZWJeIuhWeGsVXODniY1PzRMEoZcxd+fonQwgS0z2qbPtGeoGmFPSdvklOOm3aWLVX2PnYTXtSUT3JjKcd8hszgzEFnIxNxZ4wS55ZrNpTGCC3UmAEak1XVY+0cAU6PzUdB+teFkXHfyQYNhJgLHR6aMnqAcQ0yfa3UDVzQ/Ew/pkgZ4j0JK3Z4h4NeqX81H2DBxKkIhZanGiPBjtlJFAPNdXHVUxQTmxyfbZOXadhkMkj0pIDcnGk84OZp4xx0Z7Hh5FvWOGzi/fvqN7tV/0PRSg+RwVfvUHbIXp1g1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6681e649-a0d6-1853-e47d-c2c9057c2cd0@suse.com>
Date: Thu, 11 Aug 2022 09:02:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] PCI: avoid bogus calls to get_pseg()
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Rahul Singh <Rahul.Singh@arm.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <80fb0709-5a0d-a3a5-b2ea-dca089714ac2@suse.com>
 <ab3f2c03-afa9-a109-7803-bdc23056b7bf@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ab3f2c03-afa9-a109-7803-bdc23056b7bf@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P191CA0074.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c9045d6-ada0-4b22-4beb-08da7b677448
X-MS-TrafficTypeDiagnostic: DB8PR04MB5657:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rkMAdHMXJ4cUzvT7g4MRCAuBhJ3QQxYewDg3jW+yM2+KbEoR52Wsr9glCHpnjptHGgI+ZAwVN+VuUEeuzDhsadtXuQVSBFnIY4y+05IuOyIFSJY1GHFF6NsIxx47GgDfujCHds4AwmyNHNVrNOWNWgj6ETv8jRy7T7sNJLQl97U/4lHyO5FW2KGQKeB/kPJ4aNMvQLLEoPTSypYu/bgCkp9c7nVA2V8vR0Kb/9zIWEO97K5soEJVwm5KtcH0qk7QqTCwfm0l3MuHk7LXe1wIAv6hZpZm6kavTIQ5dBZXgQmQsQHupDNl3aGegpL8DeljPGghKqe/I13qxbPgHewR8mJYrmyJRY39sjAlQ/2Q8Fzcbgf+6U/oAWN1snIJPGmWGF+a8IAQYkiO0wMjuEbjpGl0ITYFP0UMwMIF5mPe5yRaaaumQii7mtwCtWFc7aD5m0PKUNtai2QvNkZznLxQxGtUhHfo13DOf00wCzsnx+K31aWff1HJMcxOX07tLRweSGaFlm0z63CvzRwIgXKQ73QLwafv++WtfQ9W4coUTqZk4BBZyqWy5/7z5GnznqDkKFJL91c8RMuckC4R74OVcPAp7HIMm6B15bAVqKy2WU3d/cDxW1RQOLWzxeZfzUNHXRmH6AEG4cLloW7skAjnU71tzH08W3bHzF1En0ZYjN8j28oifD4GzijIOTDOlVzgC6XdYS4eFtNn2TZofracL6+eVEMu/EETQAGgxdjc5IhBWp8FH4kBRQIdFa5QXIJlQAb0Bjd1UTyWzmM7P6M7d0ZPdjlcweL1Q9x9q2NOiAYdu8Wkw+wC9PSh9XJp9U9rPtU9KhqCb9dVw6Ew4InpjA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(346002)(376002)(136003)(396003)(26005)(6512007)(38100700002)(31696002)(6486002)(5660300002)(8936002)(86362001)(478600001)(53546011)(6506007)(6666004)(41300700001)(2906002)(4326008)(8676002)(66556008)(66946007)(66476007)(36756003)(83380400001)(110136005)(54906003)(2616005)(186003)(31686004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEx4OEpxVk1HZGlYeU85YnJaT3NHS2VTMmxoNDRDZmxZWUFHUDN2L3FBVjFX?=
 =?utf-8?B?akJwRXBtNUJIQWZTdGR2Zm42VDZyTUxNbVkzbGF6aWJpdm9iZjl2Yno1bzZm?=
 =?utf-8?B?TmVMendJWDFqc1JmZDlsaFdBZWNJNkRTUjRucDhEK1EyZXVMR28xazdlaWl2?=
 =?utf-8?B?RXVMRkZDZndsTzNRNmtlOTNUdDFSZG1NeDA2UmhlMWpHaHRXVzBIZHdvR0J0?=
 =?utf-8?B?UUtiS05LbmtKb24vbVRRNnc1N3BYTThvMHk2aDJSMGxJRG1SVmF5eEhFVVlX?=
 =?utf-8?B?QkliR2pXU1ZDdHgzSlFmeFVrVnd2RDdSN0JzVVIvVWZZeURmbEFzaHUrUmll?=
 =?utf-8?B?VUN5WjFwTzYydDB3dFduYlhuaE83UHNYbUI3NjZ2UTMyeUdaV1h2T0JmQVgz?=
 =?utf-8?B?VVA0clBydTRrcjRiZGI0aFFvMFBKbVZtcUczbHI3bjFSc2hLYkpxbFl3a29Z?=
 =?utf-8?B?R2piVUZrWTJzWFJBNGJTTVJWQkNVbmE0bFBWOE5kNGRhc2JnMDlBZHlLMVhF?=
 =?utf-8?B?S29JNktwalpaeThKSTVhdUNvNGthVWlkbGZ5VWZQKzJ5U09Vd013L3RXcDJW?=
 =?utf-8?B?R1ltdnlGUlYxODhPUW8rME9STzY2ZDJ1MW85NmlzQnlPSXRkRzhyY1gxVk9m?=
 =?utf-8?B?Y2hyNDBZQ2x4RzRMT1JTdFhseFNoK2p4TWE0VXRyNDZaUW8wZ0xBUXAwTHZS?=
 =?utf-8?B?ckUwVHg4UlUvZzVqZzc3bjZVd3llRFVreUpSVGxwRDc3ME53VnZ4UWE0d3lQ?=
 =?utf-8?B?ZmRvS1JSelMrczlJcVc5dHhWSXV6SUx3ZTJsRU1oLzVib1cwVnF6d0grY2cy?=
 =?utf-8?B?dWJqRGJDd3pCdE5TMTMrb0VWSmxHcmk1dE02VFVnYU5JV1hwaXMrN0x4WE1t?=
 =?utf-8?B?NEdyZkdpTVdyM0xYRlBmcWpHb3NIbWZ5QkRzMnZqalIwQlNrN2JJZHA5dW5Y?=
 =?utf-8?B?bXRGVUQrOThONHJkNG1JcUViQ045REZmbHRJbjVTSEprN2t5VmYrTURGSzNa?=
 =?utf-8?B?eXl1TkQ3WmJhY2QySUZUdTdXY1JuM3F4aEF0OTErS2wxc055Z2hnZVg5Zmdm?=
 =?utf-8?B?bElDbjhCWURqeGRsR2VIdS92cjVvQTdXMFBEUkRmV3FpYzhqblVUQnV1QlNs?=
 =?utf-8?B?MVJLaUpHOTFESUV5VE83VnNJRzRmV1FBWnFsNkNBUzJESjFKNzNyUGh0Wllh?=
 =?utf-8?B?enRVaVArOWlZNUpWdmNSVWdUMHNIV2ppT0hGQW9qYUdmbGszRzZUQUJVK1dM?=
 =?utf-8?B?ZjFYMGQ5Rld4SmZhb0hCazVhNDF4bjlwSHNWSDhDUHhPdFNHaklGdGIvUE1L?=
 =?utf-8?B?RkdwMlNVRzBYR2dtNUdnSVlFaXNMYVl6NEZ5ZDJMVGVyUmsvRHBxQ2hsRDAy?=
 =?utf-8?B?YVRidjdsUjNrQjFXZldvV0Z0b01OK2FKcVhCd1RDa1NlVlpzYU1IUFdyWHF6?=
 =?utf-8?B?emZ1ditzM0tramw1cmhxa2dPRjlJcmsvNFFYTXM3VVdkZWRhN3VrdjJQNUI4?=
 =?utf-8?B?UytOOUZXZ2xLRmF1bnZlaDBIYTdTTEFzQXo5VmFpT0dtY2pzY2NGa3R6YWZ4?=
 =?utf-8?B?L3lSNjVrVEJ5THBZV0xLM25FMllwWjhkZ0NUNzNxa2ZUSzVUYzBON09qM3JR?=
 =?utf-8?B?WE9SK2hzUVNpaHpZVVo0MG5oSEF2WHhvZTJaazgrTkorMVQ1KzM4SXJtOGEy?=
 =?utf-8?B?Zy85dktNcFkzN0lXWTMrYUVreFhhU0dKajR3dDRISG9BUkJLOUNYNjBLRWky?=
 =?utf-8?B?dUNjbUlROHo4RUx5QUJ3cjNTYXl2bW14YUJLS1hTMlZJVG1aUG5VMHd6Nndm?=
 =?utf-8?B?cGFHWFhtRFJTRHZ1WlFXM1BkcC90SWlqSjI4Rk44ZGkrUFJ3RjdXYVNuQ2Nx?=
 =?utf-8?B?RVh6Z3YwclR3YVg4cS9hN081MEpOaDdmTHduWEdueUduUmxEYk9yTm5HSzl1?=
 =?utf-8?B?bTU1NW0wVmk0QVh0TDV6Ung4cjE4aDNRcEFOb3BMM213Ym4veVlpdVRmVklZ?=
 =?utf-8?B?bXBqaFplQjYzYmtCd2YwbW5vTGNNanJ2SG1nZlZwbjJTN09aLzhUQTNyZmcv?=
 =?utf-8?B?OGxxN3RaRHFmbG5QbzJiYW4weWd2SnpsSm5kNHE4TExlTERzUngwbUN0NG53?=
 =?utf-8?Q?wZsPPO57DfO892/511nW6DT/e?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c9045d6-ada0-4b22-4beb-08da7b677448
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 07:02:29.0339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +y+O9/Tsddrvl4fV+I+HYnU1g/0b9YyVSS2rvUu1Mss4mWIKWL78sc6NXiPOpKnCFDT6ByGbuTh1nEv8JQu/+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5657

On 10.08.2022 14:13, Andrew Cooper wrote:
> On 09/08/2022 16:50, Jan Beulich wrote:
>> When passed -1, the function (taking a u16) will look for segment
>> 0xffff, which might exist. If it exists, we may find (return) the wrong
>> device.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> An alternative would be to declare that both functions cannot be called
>> with "wildcards" anymore. The last such use went away with f591755823a7
>> ("IOMMU/PCI: don't let domain cleanup continue when device de-assignment
>> failed") afaict.
> 
> The way wildcards were used before were always bogus IMO.
> 
> I suggest we take this opportunity to remove the ability to re-introduce
> that anti-pattern.

Okay, will do that in v2. Rahul - this means there's no point anymore
sending a v2 of your fix, as the bug will disappear as a side effect.
I'll add you as the reporter of that bug.

>> Each time I look at this pair of functions I wonder why we have two
>> copies of almost the same code (with a curious difference of only one
>> having ASSERT(pcidevs_locked())). Any opinions on deleting either one,
>> subsuming its functionality into the other one by allowing the domain
>> pointer to be NULL to signify "any"?
> 
> I'm in two minds about this.  Because they are the same, they ought to
> be deduped.
> 
> Except they're both insane and both want changing to a less silly
> datastructure, at which point they will be different.
> 
> It is a total waste to do an O(n) loop over all PCI devices in the
> system checking for equality to single device (and in the domain case,
> assignment to the domain).  The domain variant should loop over the pci
> devices in that domain, because it is guaranteed to be a shorter list
> than all devices.

With the "wildcard" support gone, that's going to be sensible, yes,
and I'll switch to that. Except for hwdom, where I mean to stick to
the per-segment all-devices lists, as on multi-segment systems these
are very likely the shorter lists, while on single-segment systems
the sole all-devices list likely isn't much longer than the list of
hwdom's devices (the delta being all devices [intended to be] passed
through plus all hidden devices). At this point I'm not sure whether
it would be worth further special-casing the single-segment case,
even if that's (on x86) the applicable one on the vast majority of
systems.

> The global lookup probably wants to investigate a more efficient
> datastructure because I bet this is a hotpath.

I don't think it's a hot path, but it can certainly be improved. Yet
that's future work, nothing to be done right here. But I'm inferring
you agree in this regard by saying "investigate".

Jan

