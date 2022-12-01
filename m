Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA3363F4BA
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 17:05:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450922.708454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0m3l-00020C-SS; Thu, 01 Dec 2022 16:05:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450922.708454; Thu, 01 Dec 2022 16:05:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0m3l-0001xD-Om; Thu, 01 Dec 2022 16:05:13 +0000
Received: by outflank-mailman (input) for mailman id 450922;
 Thu, 01 Dec 2022 16:05:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lVjU=37=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p0m3j-0001G4-Sd
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 16:05:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7d00::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee97dacb-7191-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 17:05:11 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7428.eurprd04.prod.outlook.com (2603:10a6:20b:1d5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Thu, 1 Dec
 2022 16:05:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 16:05:09 +0000
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
X-Inumbo-ID: ee97dacb-7191-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKlaBy5WOvaeYLIqVFLyefKPpcQefFuqqHXrZImsI40enuxdwuoSQslyMG+xL3BgBiISs4QuIQNX0czv/YZ2jExmlWPI1ygEsUaSHNAo7ePM5Xkg9RDLWq0LB/sQHVLAsymDGJP3kwneVZt0C1BuAqN0QObj6V09r8pfw8RhmZ2PjcYlCDPBhvoI+dpXiZAZvHREjHsFRcsPK3D1CEkt7nmAwkGR8zOC9HfXLo/wbzlUv8FYI+zrwIAw+oz3Gl22byJGM9w+IhlHTNDFqZjW1ntCUOEM1KtHPKHWTIPQvhdhJvDJYFkbtooiSPfhbfJqhkSrW4ifMOIq6O0d42jm9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3NeixQF/EzehRq87VviXjYRM4B9SsJjwh7AvmqLUfpU=;
 b=UA55VyuET1625kpB3f9DXncUdULCZF6lnfhBy0ggUIGbPVh3S4k80LvVZIW2RjL3iRq6TlAabIn5cknkHsTpSV7X+NnuP4XEl8NDB6qoOEW8U/wwCeI3tmIlExhuNDkv+8cGnS+64Ry+hcHhN9XsZWzk2/bN/XLCt/OS0rqIvLF6elIwzXz0cwnbXFWsaJToYuH+nwpgBbE8vJWlmauVNv1RhaizG4xR+px5LuJ6genYu+I8m4dW8ev2dRydO2J0a/AMJ7srocvxuiqqxQcupuQeJFFVbTCIE+pR/h826qak93tdrYsgQZWlaG1mq3i3P6S6p6AUPWmlB7dM0TKqyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NeixQF/EzehRq87VviXjYRM4B9SsJjwh7AvmqLUfpU=;
 b=tpWfjQ6gyi8/zHOV2bSAE7xrR/JiHOplhTEhcwXXeH1dFpL3+DB//40xAY0xWiSuZpiQ0gi2/iy90Wo1oIOs3sdYQZVE42zA69Ud6kVaQPe6VV2I2C4xKdrByo30YO7pj17gGjS3NN8nWP2Sv+PTVPIXUn4EQZ/RzBWsEtGI3UxU4yJFC04cyAjYC5X7V7+WMyZKZOL2mxzdT4k8Jt1zQfsJ2ObJQT/NY6C5yZyE2q8UBvkZR7hchTl0LRPuTos8WTm5Mc8YLM1rpv3AQInf45k+LVkwCdxVGL8JzFgqDTkkza+2DBCiKi8ko/55/QsQOkOpmyIpybewT7fT0X9/ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8b93be0a-cca6-f1f2-2902-afcf1f8915f6@suse.com>
Date: Thu, 1 Dec 2022 17:05:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: [4.17?] Re: [PATCH] x86/HVM+shim: fix build when !CONFIG_GRANT_TABLE
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Henry Wang <Henry.Wang@arm.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2ea8c3de-4967-802c-9a32-79203cd41384@suse.com>
 <261da93e-9464-8e9f-6ae2-a8f8ec466def@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <261da93e-9464-8e9f-6ae2-a8f8ec466def@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0201.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7428:EE_
X-MS-Office365-Filtering-Correlation-Id: b04713e3-3b1b-458e-990a-08dad3b5d1d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8meAK/k9uz/8+XxXZxC5nUxd6Ke7zWMwW6w5odIPL/n2EmDe7Rbnzuq18zxhcWGNebzvCeVyIwe6v2vj4WtnOWBx5zAqtReF/ilgSdofyar1SCfNoTRSAG7STk4AN3StsqODW5zLJ1MsxAq26mBcf8U+hnUS3XI3lV0p5xQJVqXJhcvZmfBb9vd48dV8+TmHKy4wr57Rj8pZ4aOsKb6NAEHO1kyuyc9Piii6t6NfWEGOiWevBdnsFmRNTYpVG2KozqnZrOu+c8m2GKXosLGFUibucVQgFsHqJL+Jd/DJiT/7y90/tmiUaouDpTDc3UGkRLMxJovJxH6zy6XENX+Um929+FLs41tBJpdDzl+FQxngBzxz9/d1DkRhtKgagZAHUU3VbajJrNFPSM/aQScMIUEMIyqhgUyRczD55J2LmCvcGtLXwF/LenD4zHDQisZEIKUFz78Xv9Rqv5xmFnuMXL9flEXKqgSLS6daEgq44GE3i9mJdvrFC0SHok3Hrk+m09NSxiQMIhI5gA9SeYJXFdmbfmhvFod8UAmcd27TCpqOB7ehZ9SQGFDyehtVk2f5s17HDQ5jcFQPO9jt75GH3IzLwmC4IOfSyvPhGNeopYZQadIc05Ag8wQFfl38MnuLh9pBHGZDljcl2KzMYw0/UEz5OFk+Z37CxmZKZECyHXO1oV4LEgi49oRLqGwfeq2v8avVFSs4SvUElWtOWQN1rAz7h4w0XuUtcc55BNoZA2A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(396003)(366004)(39860400002)(136003)(451199015)(5660300002)(4744005)(110136005)(2616005)(8936002)(316002)(8676002)(66946007)(66556008)(4326008)(36756003)(26005)(38100700002)(66476007)(6512007)(186003)(2906002)(86362001)(54906003)(31696002)(6486002)(31686004)(6506007)(41300700001)(53546011)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXY3b0IwZzVjRWZtMTVNMTBiVXA2Zm9wREEycUl2MnZRY2JHMzRBMVZtWXI0?=
 =?utf-8?B?WW1BS2Z0K1RHU3lDeWNoU21TbnZjRkppNlJvaDJoY28xbVQxL0NJNDVMSEU5?=
 =?utf-8?B?L0gzLzhjbmpnaEwySE5DRElOOThxSUVMMVVXR2U2ZmJPMzJJOHBoUUN1VjBn?=
 =?utf-8?B?b2czU0l0ZjA5UElNb2RUNHFlSkp1SUloeTA2VDZRS0FEK2dYU2w4SVdNeXpl?=
 =?utf-8?B?ZnBuMm9QK0pmQzlCSG13R2xzY3ZacS9jeWIwNUJWckttaWUrQysyZkxidzlR?=
 =?utf-8?B?L3RrTCtEcEtYWUxMWXJxUFhGL1djT0F0RU5uLzlPOVM4Ums0d3F1WHhGR0lG?=
 =?utf-8?B?bGZBNjV5NWpSekpqM0I2TGNDamFGS3JINE90RStUcGZRK3FZNHEyL2w2b0xY?=
 =?utf-8?B?K2I1ZllZbnFZblBpSmVxRUZoblNxaUMvRTVrdkwySllneGVKM05sU1ErVmNR?=
 =?utf-8?B?U1VSVENWL2d1WWc0bGdGbXF2OC9McGR4VWk2T2hFbi9HNWo3dGlLY3hKaldO?=
 =?utf-8?B?OWdlTjFoMDdFc3hiM2dTQ0ZLajZ4VUNYdXN1Z1BzM2JJdlRVU3FBZ2MxVkE5?=
 =?utf-8?B?d3lvZklYZ1NnWG93VVpyK0JyOVVWYktqUXo4MW0vbjQ4ZkZLZml2dXgyb21F?=
 =?utf-8?B?VTQzeGxsajFKaXRkWnppbHFjMGN0YlE3QnFSd2NlaUpGTFJKbDBHaGVpUDJR?=
 =?utf-8?B?aE85dmpWcFZnUUlXNVhrMmMzVitSMlFRV3FaWDhyNkcvbGNGcDJZMEtsQkRs?=
 =?utf-8?B?a1B6WkpRaXZDNEk5R1Jmdk8xbXYveExiMGJVRFl3clMzTUJyeGhlYU15bUtj?=
 =?utf-8?B?Sm5uMzR2VDhZREZINHZoZnh4bkpERU5zSXVjb2RSbXlLbkdpZjRJQU9tUyt6?=
 =?utf-8?B?LzhzRFlLY0dYRzRhbk9zRllhOEhlTVRwOFdDb01zR1dzK1RpWWNJSjhyREk0?=
 =?utf-8?B?b2RlR0k1bG5WdnBWTTFWTnY5aVoxYlJmNTRZR1pxeW5XMjhCRDVHRTFyT2NG?=
 =?utf-8?B?ZEJtS2x1YitONDkzaDZpZHpuS2tEM0xQcTRuWFpjdXo1SGFmeWtSQ1htRjZY?=
 =?utf-8?B?QWVXSlZMck1sZlNjdVd5RHk3OGsvR0hLRjRmOTFsV3k1YW9JeEdnU0VhY3hh?=
 =?utf-8?B?ZEViR2dyR2p4enBPanl4eG5NUWl1b3U2ZkNVU2RNZzNWNTZCUjVtcjl2NU10?=
 =?utf-8?B?bkxEeGVxakNqeVdjTEVKNzRSQUx5MUhDL2x4aEVac3NDRmJMemxCL2N5Q1dl?=
 =?utf-8?B?SU8yM1Q1QUFpYlF0OU9WbnVoek1tVTl4OEp5UXVWa0Mva3o4emZET1lkM3hv?=
 =?utf-8?B?QlFydytDbmM4bUU1T0RWTXo4OEs0bVVFRjE5cGJ2Q0lobnVJemJDQXBqR3c3?=
 =?utf-8?B?ZnROajltclorUXFXNUUwbFh3RU9JWkVkMWhvbnVnZXQxNVIwM0NQSksrWS9x?=
 =?utf-8?B?NjNpcC9vZDU1ank2K28wM2FGTE5JQ2h1c2cwYXcwZEgwaXAwM3JNVEg3anhk?=
 =?utf-8?B?Qloyc1pPR1k1ZXdkRnNEK1FrYWpmMzNJbi9uN1hOTkVpaTNiTy8zMjdTOXg3?=
 =?utf-8?B?K3FYNHlNY2lKcWZIUUlZSkpCTVNYSjlTV0czOVJMdVl2d2puZDFPS2VrUXRs?=
 =?utf-8?B?Y0xOWlRhUThJTnVRZU9RZCtvMlRUdW1BUXpYTS9kTmp3RjNoS25nYk5XM2pT?=
 =?utf-8?B?QXU3TFdybHdQeVVpZnNoL01NQmdMby9TdXRPNjFWSXhRYWx6VVRyNGtHMHhG?=
 =?utf-8?B?OW90TXRUdFJuRXBOUnVNcXpvQklRUFNzZitYdWROV3BJVzVjaElDeHpRaUgz?=
 =?utf-8?B?ZWcyQjJkWXdKMkdDdFplemp1ZnU3RE5wamFpdGRuak1JUzc3RmZURERhZ3F5?=
 =?utf-8?B?aUY5RzBpMTFsVGpUVWtlb29kZE1CRjZUMnBJQ0Fncm5jajJsMXV6Vm43a0Ev?=
 =?utf-8?B?Y0NkQ05LZk9VUjNNQmZTdFEzdTNWejFUbGRDWHNhQ2twR25CQ3g4VmozcVZE?=
 =?utf-8?B?WlhyR3pISVB4MFB1aDU2elk5YzBwN1NyZ1REMGJLZUdzaWkzdythNXhnUU1Y?=
 =?utf-8?B?SVQ5c21qeGdPcVZZdDhBcUtFeUdSM1JnalFnQ2gzSnJqRjgzbzJJNWN2di9z?=
 =?utf-8?Q?5DA6cnd9/5uKqu/R4V7SoJitJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b04713e3-3b1b-458e-990a-08dad3b5d1d7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 16:05:09.1174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5HcJ25IVlHaYRWIIvdTSFK+WghHmrfpIiV6M8xPgzKPljm5cAuQDetbq0z6aTv5vfzsfRRM4MRiw+FbXY5IH4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7428

On 01.12.2022 17:01, Andrew Cooper wrote:
> On 01/12/2022 15:57, Jan Beulich wrote:
>> The HVM flavor of the hypercall handlers exists only when GRANT_TABLE is
>> enabled, while surrogate shim variants exist only for the purpose of PV.
>> (Also scratch out the Arm variant in that case; what exactly is used in
>> that cell of the new table row doesn't really matter.)
>>
>> Fixes: 8523851dbc49 ("xen/x86: call hypercall handlers via generated macro")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Thanks for investigating.
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

> Thoughts about inclusion into 4.17?  This is a build time regression vs
> 4.16.

I thought this was odd enough a configuration, but since you ask, let me
forward the question to Henry.

Jan

