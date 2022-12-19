Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B69650C23
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 13:49:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466024.724846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7FZ4-0004Dt-FV; Mon, 19 Dec 2022 12:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466024.724846; Mon, 19 Dec 2022 12:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7FZ4-0004Aw-Ck; Mon, 19 Dec 2022 12:48:18 +0000
Received: by outflank-mailman (input) for mailman id 466024;
 Mon, 19 Dec 2022 12:48:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGu8=4R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7FZ2-0004Aq-DJ
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 12:48:16 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2043.outbound.protection.outlook.com [40.107.15.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 675c371a-7f9b-11ed-91b6-6bf2151ebd3b;
 Mon, 19 Dec 2022 13:48:15 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7110.eurprd04.prod.outlook.com (2603:10a6:20b:119::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 12:48:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 12:48:13 +0000
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
X-Inumbo-ID: 675c371a-7f9b-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZSH/Q3S0ivjhdTVbt3BnOawlVHb8E3rE+GWQ1o7K6crRdSzOCPRL8QxDJB8R7iQ+nablpVq70KJZm9VjwsVnovRfK3kAouARkKlxZYOrNKWWLNV4+f8CU9y265jhNXQkVPtRmdwww8qsIJZGmhzfo6oM0h+ZvFLZy/20+IKVthPc4dUm8qfvF5DvM/bu8LJZgDXB9E2C+Yf9cg+2A6D0Tp4aYookaQNolUSmlFUpRd04zy11Gdb0olMY7zVNUlQcd9OwLVKdGQzhudI2zTYZmUqic/e0nzgdt+PW/N3N/sXa899BqBMReXlhX/z7tV+kP/YhbQcPlGn3VVbmwONyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVvw8tem6ttK7HHahSm03i3iR0XCHIK18dw0CrcTK24=;
 b=j5S8gwUHLm4PdkgWTB3NOVAtQqVtbt99CXb7EUXuljQZ/L5mmrzmoXGS7biW3/UZr/OzozYgpchZIiiqK76XKFTa46mdWgwn/K8XaXyyrYeVRWgRhSfTqT+YJs74eEwYEqjujq5uEnXp9311PgCrhaB/0/G9fOXgjhat8GcPE+Cs539NdWfTjfO+9wcWfwVfO78WIy41gXCnSFYvSisbEyH9jjiENhrpi6FiCTnS7ueq/iAkLP6Qga3D04X0rmm5n0fNGRFGMHQyfzkXcghtwur0zuBW4qASXr/Npqm9PJVpzqxdOsG+vgkFI70NWmDSJGmg/ILXjvEnHUGE4/xJ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVvw8tem6ttK7HHahSm03i3iR0XCHIK18dw0CrcTK24=;
 b=NDCtjGiat+0INUrW46LLsWCRg6MqIRBMLmchIgIDU8LGg/4iapYxqCVHiAQOf8gBMJpmUmEtTCARw+GLIAKuE8VL//XEGcCGL+lTk291j9a3FH76Db0EFKS6l/iqXh90FfTH21MOXwwHt+HuHjjty7u12RtbRkBnYAzEQx3ucQXrRwKiyhDjofZhZ9cYqFhUZ7+txnFtaWTTJtnTlmOz4/uVsIdti2RMsB4SZJgh3gwC4iUycBH8unXLOEclPCjYgo4b9mIMvgwznp/xDnnNQJ7LCgYnl0+F8wY8gI4nMl8B4LIG0FCbssD9ne8tx4J5601xzDf0dGE1t+I1Rwpk1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <417c72f4-e9a0-e3cc-1c36-544967d73e34@suse.com>
Date: Mon, 19 Dec 2022 13:48:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH RFC 04/10] domain: update GADDR based runstate guest area
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <22422a1c-1cfa-95d0-c1fa-99150a8f2a32@suse.com>
 <33a84c2a-0c94-a62d-3754-4a61aa951c83@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <33a84c2a-0c94-a62d-3754-4a61aa951c83@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: 53fa61c8-2fcf-41af-15c4-08dae1bf4a6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/4NX3XS7p6Rojx46B++orZQswmTlvm7gQyrwkmqwKSgRmuPX9LcdN9Pc6U22yh4THlJkhwGUaT0yhEmqpAF1B6AFvFLw5UTC2lNGMLCVFPxtGanYrkkyXol2ZODYdSh0GBcY/3A/VCrg4rcb+JRYMtAjCYrj5PDi8IwdmZ/IQwIF6xxgalYKO/YGYXDqJE+DfH/a7Hgqd0+lLaQ4quFl/ypmFz7cnwWjiAV+s5BuyFDF3BZC2qK1McXPehfri+BP6dOZXx2lvb/jhqpmsE5TbTfTWB3Rq3SlQO73IRZXDcEBD1zMtp62R5Z3R/Uz/I4pei72LBISmEyYc3rbMT1aF04xXbRuJO/JBGlJhzH4cyKUZmuJpxmqIwLtMwAt9c7aqadI00+iKgmJf+VKT5e8xtab7kIUByG75qe7+3f/AabAdujaKQfsGCD4IFsM9uWdMNKkKxiVIxhGVnB3AsrU7NB/V1vrSXfdv9ClFvPsM4LBsw58eYdrwB5pnjNMuGpapR51qP74D/5WF9UhfSCs5TYVLyyaFT0PTlRKJKDTfLLBa3lBvvxDF2cfIop8HufuDHSdQVmotGCdJ60qecgoS+aPVpB0j8Nou3WPjXbgW1H6Tatt8PsPVfvn9NttOwqRAGqScvNF80a3HPOzYkMdc1T+bj89xgeHWRJ2/y2VJE2kZWZa8CFUbEUbFXYhxmMT4RLtR40TKjdHxMxCmoYDLc/4sB9xJCmwH3N8Dk7QjQk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(136003)(346002)(39850400004)(366004)(451199015)(38100700002)(66946007)(66556008)(36756003)(8676002)(41300700001)(8936002)(54906003)(66476007)(4326008)(5660300002)(6916009)(316002)(2906002)(6506007)(31686004)(31696002)(53546011)(86362001)(26005)(186003)(6512007)(2616005)(6486002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0VBSnBnZTBWYlpsSWtFNVkyeWZWT2tZYW5HTnBhS0N0MXlFempmR2ZvS3Z6?=
 =?utf-8?B?NHo0TkRJL1FyWVVNRnNYTjVZNndlNWRhM1g1cDZKVnJRV1lWTTY5dTVSS040?=
 =?utf-8?B?WHZGOGVyTVQ5SHB0bCtteFlEdTk5RHphak55TFo0VjZQdUQzcFFoZmZQamE3?=
 =?utf-8?B?Y2FRR21VeXhIVmJSVGxoYktha0hvQWZEUzhVUGlnOW90YU9nK0N4MmJPQTdR?=
 =?utf-8?B?bFprTGpUQWNNeE5ZclNZVDJiVElVc1FGUVo3WjlCUElaZ1RoWmU4dE1yNEZO?=
 =?utf-8?B?WXhaQWdPZWM2U2pYdUN0Qkh3SGhGU08rTjdKRWFrT1FPQ2ZrRmtZM09kNGtn?=
 =?utf-8?B?cDdLb0ZsRVRRUFNBdDFCUUFucEJlM3BTS3hHZklRNmZXZ2NleEFSU0tnWVJT?=
 =?utf-8?B?Wm9zMm9tSG5HUVBoeUZCVjdlU2tIMXJ0dUhtZnJPSWp2WVNnNDM2VmpIRlNp?=
 =?utf-8?B?T3dQeUFPUVJuZ3NrcXl1UVZRNDRZUGI5dVdFb085ZXlYbUh0aXY2TnJYQlRG?=
 =?utf-8?B?YVg3MERsTWhWUGFPSU1UUjVtK0llL3RMMThiVFFyampZRXBvbEE2ZlBpbnhE?=
 =?utf-8?B?b3c3UE5xMHk2V1dYSUgzcVh6Vk5GbDRmbHU3WnRna0lRODltd2VrSTZWZ2t6?=
 =?utf-8?B?a1IvcVk4Z1BadWZEejcrTGlhVG9yZTk4OG1RNDI4V1JmQjZqd3MzWnV0TDB1?=
 =?utf-8?B?bmhETHRaMUo0WXJKSzVGK214Nm11YWR0RXRIS0ZSMWNDWEE4QkNzK0JyMFl4?=
 =?utf-8?B?Yjd3WTIxRFlmMnlDR3pwaXJEbVhxVEhJWmxLZEd6S1lRaWN3aElVWERIa01l?=
 =?utf-8?B?VXYzeThTOGYzMDcxTEtwZ2VjMmpuTjNYV3podmFvVUdWR3BGQ3NpMUd4M1Ji?=
 =?utf-8?B?VXhnSk05QXdZcWtvblJWd3RoZnI2RzdsVmpzL2NhZnJLMGNpMG9SbHBTK1Y0?=
 =?utf-8?B?VlArY3JpVkswOVhnd1lreE9YSTA2ZDVHVGQ1TUJveDRWNlJhUUtjS3BIWEtN?=
 =?utf-8?B?dlRDNlhZYVNnK0VsNVZpUTdXWGRhUzcyQzMvREVzV05oSW9SaUhRZ2tNRVRS?=
 =?utf-8?B?TCttNGUrVXBqZFlEbWlPaWZEeEdrYmZLN0NTYXNvcTNwdlh1VThta01xVUds?=
 =?utf-8?B?Wnd2bWdqalNpMzZRUnhLREE3cDhaenlEUmx1cVhQck1nNDRmNEw1ZzJpUmJS?=
 =?utf-8?B?QTNHME10R2F6Z2J5aEtuMnV0bm55QkQ1WmxCZms5NkpkTGhLVUpVeHNQeHd6?=
 =?utf-8?B?UjB5NGpSdnVXNHMrdzBSOHd4L0hORGRqaWxNRHIxRzhkU0tmcXprcU1vaVE4?=
 =?utf-8?B?ajZKazg1Q1c2SlBPWmlZT3pTMmhYVEJwNFpDK2VIUnNhNjEwVW10U01NRHJH?=
 =?utf-8?B?N25BN3ZzN1dKSzhwV3hrTlZVbXpYNmVjOHkyNkRMYW1EeVNYNkg0S3QrRklk?=
 =?utf-8?B?TEcyVW1qRXNwcW1KamFBUnd6elg1RDNsQTlGNGREZWtBMUkvK1RIb2ZpY2dT?=
 =?utf-8?B?blFQVjdzMTNBUk14MDBHazdxaHNUall6RXBiREsvSjhObis4NlFsM1E3N0JX?=
 =?utf-8?B?bkY2RC93NVRyY0dNTDZDaUthMThNZUxiOUdhRFZEZ0ZIYU15OXdPWG56UUd5?=
 =?utf-8?B?b09TZ2tLMlVqL0huY1dSSXQ0ZldNUWcxMlhWc295TjZXYVQyTGVpenFsb1pC?=
 =?utf-8?B?T2NpMHJqR0YzbS9Gd1hVeE1oNDhuNURWWHUvSFY0UFJRbHFmVHJLb1hPNUov?=
 =?utf-8?B?KzRnS0k4akJsbDAwSmRzS0Fnd0RtdGQ4anBqbGkwYy9wZzdNalRiSmxLWEtW?=
 =?utf-8?B?VmhiWFQzaC9Kck45TTljWDBCakRHeE5rSG9ka1pTSHJFdzA0K1piVUtGOExM?=
 =?utf-8?B?M0VxOVc4VVNsYWhmK0hPWlVwblhkTXBrczkxTXloWEZpbkdCbyswZ2lmU3BN?=
 =?utf-8?B?NDdTSHhJT2NGb1ZFNGwwc0FWTjFZa3hTaTQ5clV0QmdEc1FrRWxNL091VTJl?=
 =?utf-8?B?MloxajVOZHd2eFJqcHdseS96UkNBbHJFOUltYkcvQXpBdTMrckliejVZN2Fr?=
 =?utf-8?B?a2NjUmxXZ0NubTJtSDN5T1dXTTQ0bzZIcUpwTEhWUEhtaGZsbWN2L3lSVlVm?=
 =?utf-8?Q?4Sw5veWBUggNC59JyNgGa00ls?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53fa61c8-2fcf-41af-15c4-08dae1bf4a6a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 12:48:13.1065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 267uzbg4WVuq0QI8hzgnjmo6gZeB9kSxsKfl7YI1G6Q0P9V8SzAXSohcJu/TMlMMFlpw6XT1G6/DVNBxWfODLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7110

On 16.12.2022 13:26, Julien Grall wrote:
> On 19/10/2022 08:41, Jan Beulich wrote:
>> Before adding a new vCPU operation to register the runstate area by
>> guest-physical address, add code to actually keep such areas up-to-date.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> RFC: Pages aren't marked dirty when written to (matching the handling of
>>       space mapped by map_vcpu_info() afaict), on the basis that the
>>       registrations are lost anyway across migration. 
> 
> So I agree for the existing migration. But I wonder whether we would 
> need to dirty those pages if we live-migrated a guest without its help 
> (IOW the registrations would still be present).

Even then I'd expect the area to be re-populated at the target, so the
page contents would need moving over (perhaps multiple times) only if
any other parts of such a page were written to.

> Anyway, nothing to worry about yet as this is not supported upstream.

I assume you've taken note of this for the transparent migration work.
One question after all is how you'd make handling of the area at the
new target transparent, i.e. without any anomalies in the values the
guest gets to see. It may very well be that every such area needs
special treatment in the course of migrating, such that the most up-
to-date values are reported as part of the migration stream, but
separate from all the pages' contents.

>> Plus the contents
>>       of the areas in question have to be deemed volatile in the first
>>       place (so saving a "most recent" value is pretty meaningless even
>>       for e.g. snapshotting).
>>
>> RFC: Can we perhaps avoid the VM-assist conditionals, assuming the more
>>       modern behavior to apply uniformly for gaddr-based registrations?
> 
> It is not clear why someone would want to use the old behavior with the 
> new gaddr-based registrations. So I would say yes.

Okay, will do.

>> RFC: HVM guests (on x86) can change bitness and hence layout (and size!
>>       and alignment) of the runstate area. I don't think it is an option
>>       to require 32-bit code to pass a range such that even the 64-bit
>>       layout wouldn't cross a page boundary (and be suitably aligned). I
>>       also don't see any other good solution, so for now a crude approach
>>       with an extra boolean is used (using has_32bit_shinfo() isn't race
>>       free and could hence lead to overrunning the mapped space).
> 
> I think the extra check for 32-bit code to pass the check for 64-bit 
> layout would be better.

I'm afraid I can't derive from your reply what it is you actually want.

Jan

