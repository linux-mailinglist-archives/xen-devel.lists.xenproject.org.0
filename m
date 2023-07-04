Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EA27475C4
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 17:57:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558530.872717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGiOq-0008J2-G0; Tue, 04 Jul 2023 15:57:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558530.872717; Tue, 04 Jul 2023 15:57:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGiOq-0008G6-D5; Tue, 04 Jul 2023 15:57:08 +0000
Received: by outflank-mailman (input) for mailman id 558530;
 Tue, 04 Jul 2023 15:57:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/z2=CW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qGiOp-0007kO-Gd
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 15:57:07 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20620.outbound.protection.outlook.com
 [2a01:111:f400:7d00::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cd0da2f-1a83-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 17:57:07 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7703.eurprd04.prod.outlook.com (2603:10a6:20b:23c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 15:57:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 15:57:04 +0000
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
X-Inumbo-ID: 6cd0da2f-1a83-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTpCdJkrYUC5ib2k3qR8mg28jY4QG/Hjm1npOEDkaK4O746fPNo5cKOferVlxLy3YRWft0wrXN3it/hh4rg/oyQi08rtNR3QnRR4E33ngaT1tm80EE235DM2tZ0HFzI/7gAUqRLAdcixn/h8S5bmFBezqPw0lQ6eayOhRAVkzrpi4ENJ6dfE7RNsQspQI8Y8PPk3nBp9pIyXlGKG2V/dAxxWwxFbnxx4HdUqhag0kLph+jcMvhqm2vEs3xojdBPxo+req2zA97Xj7cKiyAYgd+LjhKBYnYb+lM6iuqGATaiZ4j01uTnfPaEdAZsXNVGgmwugRHAd97GB/77Pi/sZoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7hflahPB2lhfBygcWkm3wsGcKXuow/J2FPnNPcunjI=;
 b=bxw7FRA737GN1b/w6B1SqrvWngreHGPwosONpyTLy6fqZ2TPimr/8VAdnCgKEoYko4km80qW+cpGH/r6WGQEoy+7fmtki8auNAxbJ9BWTtGnW7d5z1LLwm6kUUIkSizSuN5PEJA9fHenCf1V7gNe9we6sXX/G10dz2YPmxEQyVl8qDYhyjaJ1jxSBpndiGDe0f0suqus9fxAboDX3+LamCi9ckI2qoTliWIcXsmC/5XjdMpz5WAbGuXhYsKJHetctTYDzWnZ8xPpsL8Rwr+lK5GFqxkQqceTE7Teh6iDhe1c3XNxc7p7ZAB7n1U3a4P7PLU2BUbGWagZXcNf4J+uKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7hflahPB2lhfBygcWkm3wsGcKXuow/J2FPnNPcunjI=;
 b=b8/XwT+/13IpZYLI1khc3oirgPWmS2KlUk/KHMCVapS1kKtEnhvFGr36jp2mDIRX25UkTSGzI56DNTuTnWOK0TaoIISXRTpuSu2qKqhW6Q7Ue/jiJ2I4U3a3QB3w9wBvaTCcVk7iYTFFOBKieeFR6rtCwFVdci7/qy3tUEElv+mOAiD+sWUw//hDPBNx6xvxLdsHQLxuESFUNieF1hmRFcPtZhSzKi/ZwSi+td6XCY9CTKhO+j5hKT4CKBRUyl6VR9xxOq3ptAAC7oJxTVFkfmWLfIAnyFbMRpT9AqpozRH+2H/loeOAeAKW/d/4Zs4SRJmv99CTunIumoOCKMCc/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ff1a6435-d7ef-eb10-afe2-0fee33788924@suse.com>
Date: Tue, 4 Jul 2023 17:57:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v3 3/3] xen: fix violations of MISRA C:2012 Rule 3.1
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
 "ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, "julien@xen.org"
 <julien@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, Luca Fancellu <Luca.Fancellu@arm.com>
References: <cover.1688032865.git.nicola.vetrini@bugseng.com>
 <c9ff72160539cda49e726ac6ee1486be0d645180.1688032865.git.nicola.vetrini@bugseng.com>
 <771A1A80-0FC6-4D20-84FE-DA0A2DCFF14B@arm.com>
 <alpine.DEB.2.22.394.2306291218350.3936094@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2306291218350.3936094@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7703:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ba64dd3-6949-48e5-1a2f-08db7ca74f9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BjuM/f7WNJlOOezweRWRRRXDlglMW26arqpCSkog+JxoamK/4D4VoGbsLY7VjtfexpQngT8PgP0FYKDobu0kHi4dtO0DoiCZ1z1Yo1033bxHzoUoGCwRftrRceTKDhvbfCnJAkZl3jxQ/Rmda4WaXNQySrs0kzx6O6Hh5Bv4Zs1g+I3z5AyAcJxvvIk/03dYD8EryupiGcsa4f7S/e+QZXSoL82ugzBdS9lGRxAiJJvhKvhMIYgsnvch+0UX+0dGk4D/yngKBbj4o81LLWQYNWcZ/RWfOhzgnsNxzbHK2gssNpGzTjEcoLCU1JIpArwUnvzRnnChUB3j8It36XPsAtyEKKXCsADme1A97j5RoplQApkv2R8Bg0kP9a7iITZWidZcTMel2NXTk422u4j7tu8YiwvIjcy93BWbGeF577NubNn3AUk0hut9FRLrPlvbqTZPjB/3Nfnp866Mq+yAedIX5r98uAIdSPQhDYjhc7kDKXvbtLEQd626EyyLMOK2A0YCv9rgKYy+ACAPItG8PZgSdnMJH1CYl8qqaPh/AZcL66LjsqK43N6SzeJ1KQDBtw6eZ1i7MSMtdmFdWMjexJy+T9L1KMFR4v1gU5PC+iUefWd+lWCTO7YC8rdnzIu5ozOuGIzCDeSTybYfbqMfhQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(39860400002)(396003)(346002)(136003)(451199021)(478600001)(6666004)(6512007)(86362001)(31696002)(6486002)(66946007)(6506007)(316002)(38100700002)(26005)(186003)(53546011)(31686004)(66556008)(4326008)(66476007)(54906003)(6916009)(2616005)(5660300002)(7416002)(8676002)(8936002)(2906002)(41300700001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2k1V1FUTzQ2ejMvV1FhVkY5M2tCcXI0RFY0NCtVQjg5Tkx6N29jVzY0SVZS?=
 =?utf-8?B?VnEvOGtRd2NWYXk2bWxEckcwY1E5WmxPeFlMNm5nTGFrR1RYbUdScHMxNncr?=
 =?utf-8?B?UHl3ZFRKS21WS1VJWjNYZnYrTUJwSFVpTUhPTW1GUE53R1duVm5adVMrcTZW?=
 =?utf-8?B?cWQ3YS83Z1BlRzBtcVo2Vk5RL1A2c28ySldVb3F1b2IwNWRzVHllNm9zbmR2?=
 =?utf-8?B?QnIxTGxaN1YyZkhsa2YvN3lMZWM3QzVsSGtrdHlzVFJmd1diUmpIYVBweXFk?=
 =?utf-8?B?S09NMEg2ZCtrR0orMk54ODJKMWdTR1FrME9haGdXakhzL0FTQmdPTVd4a1JI?=
 =?utf-8?B?Y25wOTJpZ3RtalVRT2M2L214VnlmbmlSRWV2TWhqYStVanRVVjNHL2lyLzYr?=
 =?utf-8?B?K3R5UUFaR2RxUTRVOUh1dnBDNFdTUGN1Z3V5MGN4WnZGRzVWZVRDQlo1eEw0?=
 =?utf-8?B?WGFmVUE1YjZqS3VlRVFGcXhlOHZJN2JpT0gwRWJQdXdiWW9hSDN2aG5ydWxI?=
 =?utf-8?B?a2x2ajFPUDlnL1FEa0F2ZTNNaHRwVWNoUmttZmhBWmlsY0lWVklDYzk3UDM1?=
 =?utf-8?B?dXlMQ0FkWWRxbUgraVNGdStBZXh6Ky9XMlBzN09hcHVOQS8rR2YvR2lja0Iw?=
 =?utf-8?B?QVloM0RJN0pPQVZoTU5kRkVYdjBYQlBtaFFaUE50STFCVVYvcXVaKzRRL0FI?=
 =?utf-8?B?Zk44NXVDMHhSSkpBVWFWaVZhRDJ0VTcraW4wMjl6WmhTcC9McndXdGNZd1pY?=
 =?utf-8?B?WHl3S3Exc1E2WjZCc2dSb2FiK3d0azNnQ1ZMUWIweTJZK3RaWU9BWXZUQ2Uw?=
 =?utf-8?B?V05pVmlDS2E3dHNDUWt2UFFyVXlCMTBTVUtXdFdPT1djS1RndVA0MzBLcFdU?=
 =?utf-8?B?ak1xQTVYNk9HTUM3ajhqMklHRlRMTklHWU5uVWVRMGNraWh3YVF1eGNkZUdn?=
 =?utf-8?B?dkpkeWRRbndnMzBpajNwbklJU1B1cmJWc0RlWE5RVWhzYmZCVENaMVQyWjBt?=
 =?utf-8?B?Y05HNStVRXRmTnE3U3NSQm1IRVVIRmpKbjd3YTR1TnhvSGRyVGFUZ1E3Q3Yz?=
 =?utf-8?B?VTQzTWo3K1VKS01nbU5jVlRMSitmc0FUMWxtL01OUmtCb0tpY2xpZ3YzcTFm?=
 =?utf-8?B?NjJmTE85QjlxM1VjTXp2TE45Ky9ySStUb282cGd2ZWVTenAraEdUeFM3b1hm?=
 =?utf-8?B?aTRZUktVayt4bStHNkF5R2xZUGtZVEFBQklIbGxqTnc1TTErTUlHck1mckJr?=
 =?utf-8?B?UWdiZ2o0RmdjUm5ndEdOTGhIRnltVEhSVWN3aTg3WkY0a29DOTF2UnBybi9E?=
 =?utf-8?B?eWVHczlrdVM1LzI4ZlN2WFNYZHp0NlNXR3FVV3lTWE1yNFo1dXFsMmt6dWhT?=
 =?utf-8?B?VlVUL2xkb3NaR3oxMC9ZOVZ5a0tKWkUxVTZ0V0xyaFJVaFFFWDRNM3RlekdS?=
 =?utf-8?B?N21sQ2sya20wWU9USldmd3FPcll6V1E3akhVcWgxM3VWdzgzMWM4V1BJaFd3?=
 =?utf-8?B?RFZSSVpwVVp2SGFMSjl1b2tFRjNEL1NzcGZyaXJqdGFPVjRpRk8wUkpoOXVQ?=
 =?utf-8?B?aDBQUWwwTFZqMGZpNFdjZEQzZXV6UnVFUkVyRk9ub0lqekdkUUNoZDF0Tjgy?=
 =?utf-8?B?Rlg0OWNBeVNSZUQ1QUhyRkpqVlNISDY2bGhsTzFIS2ljNDkwdjlUVy96eWo5?=
 =?utf-8?B?a2JuaEZ3SGZIMFgwUWFSVEZRbUtMVjlTeXAvdG5hd2RRZEJieEgzcTRydUkw?=
 =?utf-8?B?d05jVEZnakZLa2VYMmFoTDFndklSaTlLUmphZzNWWUpjYXZDM0FWQnkxVEdY?=
 =?utf-8?B?K3pUTU1uTEtPbUNoQkNHRklSQkN2aHV1Q3dQY1Z3NkV0MURyT2txL1ZBNkdm?=
 =?utf-8?B?U25vUjREaTFFWXdMajFyaFcxeW5FUmxacWlMYU9WSjV1cml2ZS9yR0l6aDMv?=
 =?utf-8?B?NENUeXoweEoway9qMlErYk9qUUlZZmFDVzM4M21zSEZ4R2crTks3ZlZOZDYv?=
 =?utf-8?B?cGZVZGpKYmRlNUdycmcwYWtvS1FoaGhnRHBuMmFibG9kMVYwVkxKU09tSDdk?=
 =?utf-8?B?WWlBR3EyaXQwSUFoZW93ZDgvZ3BpT09ZMDZ5eVljZXpRaGZ1b1FqclBuRzRL?=
 =?utf-8?Q?XxTW3yGxqVke0R55ew/82vhRV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba64dd3-6949-48e5-1a2f-08db7ca74f9d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 15:57:04.0999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMt2gA21IZtmOwQF3vN/bL4iEls3Dx62OFt0UQldiw2tsT2PsHUuNa+MqqCNUJ9kxNiGwoUQh1JDui3r+UjmyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7703

On 29.06.2023 21:20, Stefano Stabellini wrote:
> On Thu, 29 Jun 2023, Luca Fancellu wrote:
>>> On 29 Jun 2023, at 11:06, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
>>> --- a/xen/common/xmalloc_tlsf.c
>>> +++ b/xen/common/xmalloc_tlsf.c
>>> @@ -140,9 +140,7 @@ static inline void MAPPING_SEARCH(unsigned long *r, int *fl, int *sl)
>>>         *fl = flsl(*r) - 1;
>>>         *sl = (*r >> (*fl - MAX_LOG2_SLI)) - MAX_SLI;
>>>         *fl -= FLI_OFFSET;
>>> -        /*if ((*fl -= FLI_OFFSET) < 0) // FL will be always >0!
>>> -         *fl = *sl = 0;
>>> -         */
>>> +        ASSERT( *fl >= 0 );
>>
>> I’ve checked the codebase for usage of ASSERT, but I’ve not seen use of it with spaces
>> before and after the condition (like our if conditions) so I think they can be dropped.
> 
> Yes, that's right. I am OK with this patch but I think we should wait
> for Jan's ack to be sure.
> 
> An alternative that I feel more comfortable in Acking myself because it
> doesn't change the semantics of this code would be to change the 3 lines
> of code above with this:
> 
> /*
>  * ; FL will be always >0!
>  * if ((*fl -= FLI_OFFSET) < 0)
>  *     fl = *sl = 0;
>  */

While I'd be okay with this form, as Luca says it'll get us a different
violation, which we ought to avoid. While I was the one to suggest the
conversion to ASSERT(), having thought about it yet once more I'm now
of the opinion that _any_ transformation of this commented out piece of
code needs first understanding what was originally meant. Or
alternatively, while converting to #if form, to add a comment making
crystal clear that it's simply uncertain what was meant.

Jan

