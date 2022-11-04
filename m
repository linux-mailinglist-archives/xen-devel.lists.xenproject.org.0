Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B53C619216
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 08:36:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437346.691667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqrFi-0005Lf-WE; Fri, 04 Nov 2022 07:36:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437346.691667; Fri, 04 Nov 2022 07:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqrFi-0005Iw-SJ; Fri, 04 Nov 2022 07:36:34 +0000
Received: by outflank-mailman (input) for mailman id 437346;
 Fri, 04 Nov 2022 07:36:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wJf7=3E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oqrFh-0005GR-55
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 07:36:33 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70040.outbound.protection.outlook.com [40.107.7.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66c92875-5c13-11ed-91b5-6bf2151ebd3b;
 Fri, 04 Nov 2022 08:36:32 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7275.eurprd04.prod.outlook.com (2603:10a6:102:8d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 07:36:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 07:36:29 +0000
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
X-Inumbo-ID: 66c92875-5c13-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHuzz8QiJ3++L3n1KHr+kiIszXGORMp4ZZHX8L3DkA/5Qrr6IYl1pv72uD0JcOG/kTGbkivXJpS1uv64s/Fg5i0zTaNYCPUIbBodq98SXrBKAhl+vt1qCXEURLzgfc3Ap2At7vr9+A+lH8I52sufsP1zDZD8Xlr7hQOxp8JOrgVPdwr6i6mFJxqCNSwyQS4usFbVKDkcjQ61ZXvWaPmDSDFMpwFX7fdiDrQmTtoOzjD8TLre1+z5hy5+Kr6CxERJpCKQ3Tp7T9oIqKe4vMDUSghEyex3u8EmuAJ2Pb7gTJ0aoNS7IDY0R3y0U4o+EvewNnd0mB0rYJas8o2KMO8HRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6o5I+unWrKBz23NDGdU2Nfnf2XkDseZ3RkXPVSz1gYk=;
 b=LuF3uyuBmCXFyUXZLAxHqnDTfy7RAFpAdDSrgJLTaDRS2MkbY6Lo55TThyXxAd60a6a0M7bcKYTqufAGuRMyuEXFkkLXFiI/U1E9j7CY2ULHsul+vfcj7CE0+TtKNModFCWWW2uwUI6X/pB509vRdIHJ5DY/g1VFImoeHsf5T6y8PBeL9yLfjMMQofrVlT/I/jAMqtxbYE3xAZyEka9FnrVbF5YqUXy3bfZyVzoHYEWVR4wLp+n/xbSf9Iwgqcrm5KkjAAfIjgFa6Oa1IuPNlQVHEiTpv68eWfS+Be8u2iR4n39Q0rl1sEUAspnfauFF3b4Gwk6lgJ3sJo7GZZ5GGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6o5I+unWrKBz23NDGdU2Nfnf2XkDseZ3RkXPVSz1gYk=;
 b=p7Wv5jbTPHK87yyY5g88bk6dITyP6GtJAf0MQqJU/V62ntjFFxqtXMPvbu1oynf9cC65lZ2kIktHy+EqIFPKxVheO5sV4ZhqPaVCA/RGMgDm0Lg22sibAIDrOVEe44YVkgWDybwA5Hfze4nAL4N5LflQfKQbSToFrJrF3S7wTJzCwFi23MDq3UvR0FKx8LObVMp62SqHSga99IlbPLysFrGGYmCm7n8Jo7zXYcUGo+VWQthNSgXZSYTLOjBA4QWIbFtxmFn/lne0P9fl+tjoDmCymGJrDXuhaeEuvM64IolZEATYZkaUKAuNUVGWtRPNWtThk6b9/e+G+1TOqY5D0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <57892137-b99a-53a6-b306-d697bec15d27@suse.com>
Date: Fri, 4 Nov 2022 08:36:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: Revert of the 4.17 hypercall handler changes Re: [PATCH-for-4.17]
 xen: fix generated code for calling hypercall handlers
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>, Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221103163631.13145-1-jgross@suse.com>
 <ca972491-4200-5d3c-18b4-122a9f4e61c7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ca972491-4200-5d3c-18b4-122a9f4e61c7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: 33ebc0be-e4da-43e5-bf0a-08dabe3749c1
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7iZ6uCG8Dv/07iae5WcPapqcII2NxDxZFzH9DzCwK2WzgVZf/wCATj1glFTV6RyhNZZ3Lo826bBJHJfIvL2Sl1pjQp1Cc/upr3Z+DnGn90/BCcHqNfDC0FXTqp0qYc8pkXImI6vwQ8QJYDvPdMCsZEUf6LBBRGphHXhH3KgQkse26XSYqfKtgoBMWeP2erjjnXVfOqQ/TPUkaXEICchpq1JGfeO2oApRTv3mUL7r4Jo4kEbH/nXLDSSfZ7mwPFZsLF9Bd0EQn78rnfC1dBdChCGpfXjgNIb8Jjxkuxl5kqTzalETCV8wT97IWrT+c99s4Ms1L5JwHKh7YM4LkUEQnzbHG9PLXcIhjrdHq2/JUQ/3R393RTICpWoOvS+GkXYdnzjH6PY91X//BJJGbZBsMrVUDcPBqYild/qOyhrnNr6oKBtZPrrQM6kH7aytCdvxC3htjroAG0DQzAsPnAPACaPPgFRFlVeM+KwaZfcKuCs+qhbweKVr3KDPplHaYFKKpPYkkt+L1SdmmBUMc4sNC+7Mbl8T26glsDcljicp7AzyGDOaypASIZwYtR5Jd7ShqdxdP/RlNeBlMsEGBRF46yb2Gewm1OtOdh5Mmn780qaNM4YoB+HwP1D612lfiOvcOjZfvxs1tTj5eyazFT+Z3k+kQIwUilHAf4s3jMz3pK41eDYMrAiDY0mdqiMkxX5tt+IRUeUcuRirnh3Rkhal//3zQrhe6QQFFPflP5lGDk8WpumMMZmb0IU7ln6YNrpzZJ0eMx/utVHdErcC7iGYxxtoYRArIlXi5JGQpJku6pksH2cN3lZe96iQg8q4i2zhvVGYSErXxerYmkocXtJIbA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(376002)(366004)(396003)(136003)(346002)(451199015)(86362001)(31696002)(316002)(6916009)(54906003)(36756003)(2906002)(5660300002)(186003)(38100700002)(2616005)(83380400001)(66574015)(8676002)(6512007)(26005)(66946007)(66556008)(41300700001)(4326008)(66476007)(53546011)(6506007)(8936002)(478600001)(31686004)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHdxK2xwQnJLKzFBZE9ONVEvNHJDMkxyMy9IMHNhSmVqSnhBU1o3b2JsUXR1?=
 =?utf-8?B?cXN4RmNRb0p4R211QXltYXdXVDFlTGxpRlRORElsdm93aE9UWWdXUFc4WFNM?=
 =?utf-8?B?S2VEc3A5N3ZGRDFqeVpGaFJEYUlGaERHUmtnRlBzUFV3ejVOOGZTNG5nQnI5?=
 =?utf-8?B?a3U4dERQaG1PZ0xyNGZYZytwNXhSZjcrWTY3YndhY0M4eGhiS3dnbFh5QnBk?=
 =?utf-8?B?Kzl0TDhheVZyemhmaFVia29hSmhyZk45QmovV0M5V1ZCT2xKQmVtSEh4aWk1?=
 =?utf-8?B?ZGp4cUV0VXl4Nm5oZDNIWFFFWmwyc3BSVFRPdjlQSkFZT0ROK3NxcGxzSk9j?=
 =?utf-8?B?bWFjL09ZN0dLT0NxeFUyNnhkUzN5eExMaTBuRnZET3hUNFNMeTdabmxydmts?=
 =?utf-8?B?dDBOcUtDelVQR2g1M3RyV1ZXcHQ2S21wL2thejc5cks5K2VIOEUvdkR0dzha?=
 =?utf-8?B?WkpwcVhyOE9WWTlXMVkvT09MdURlNzlyZXc2d3RUbWF0NU11Si9pOE9qR0g0?=
 =?utf-8?B?OHpPVGtydHpNY3Z0VERvMklicks0bDNod2t2TjlVQlRUWDU2NGFXTFdkWG5Q?=
 =?utf-8?B?S1VNcHZodWNuVFFBS1M5aUFxU0dqYTdvcC9PdFJuN2tjQVg0aUNCZi92Y2JL?=
 =?utf-8?B?YW9YVTdHcThoRHBrNUVFTlUwRnFTbnhyMnBLai9VRnN0TEJnN245NnhXYXBS?=
 =?utf-8?B?SHF1dDhNUE1aUCtvSXlMNGpoZDZsTnpiOVc1RDErbVhKOGJZQkQwTFNKVE9N?=
 =?utf-8?B?TW1vcTlPWStvYmFuWUsyVXVsVEVRMEo4RURrcUZJcHkveWQxSVpzWGRvejdy?=
 =?utf-8?B?eVdHRjFQS3lwVWNiS0JnbXl2TWIxYXJ1cTV3ejg4cStGSWlkM0ZmNlhvai8r?=
 =?utf-8?B?d01zRVNYUWVoeDk2QmhpSlFNUGdEYXpoR0JnZm9CTWhkVytLK3RZc1d4cGhh?=
 =?utf-8?B?WGxLNUxBTUl5YlhHNllFcjFNUDgzZ0xVN3RWWlkzdENaSzRKbk1KK240NWVM?=
 =?utf-8?B?SVB6bFZDNkpOWlB5THljdkxtMUlTK09KcXA0MWc5Vk85TFdoc0xtVnRtV1VO?=
 =?utf-8?B?RitmT1ZDNmNQS1JOR0dORjM1UGhPNlk5UERUeDhNUnkvUVFqZElTczFNMjhx?=
 =?utf-8?B?Z2hTUHNOU2JjWkhueXFucXJwNW1LMzVFTTU0Nmw3TU55dFZEYkVudmVaSk9t?=
 =?utf-8?B?QXMza0FKS1BZSmhVOEo4QzVmUXFHTzlLK0tmdTFLcmZRYXJ3ZUM4eHRBSkJD?=
 =?utf-8?B?TktLR2NVa3JFY0E3U05KL2ZRSFNQQlRtMWdKKzVXZ0EzWlh0U0dwdU0wcTZl?=
 =?utf-8?B?NmRCVFlTQ3NNc3RNZ1B6RGoxWU11MVFRWEE3RlBqNThsaVlzalgyTlZnWWw3?=
 =?utf-8?B?elFiazdNdVpvUmNkb0dLN3F1U3QwWDhFVVdmNytPUUw0NDQzeVlxTnJEc3FV?=
 =?utf-8?B?UFhOVnI1WW9GdUlkWUI5RzVncm1sUmdCMVJMZ05NbTV6UDdRNk4yYTFwNnk5?=
 =?utf-8?B?WjgyNTB3ZEpNdmZsTFpQVGZmQlpEaGU1bDJ4cFpNR2dwaTNsdk5BMm5KRFln?=
 =?utf-8?B?cHVWckR6VWQ5a1Z5Nk1ybU1Tdnp4UmhjWTZHWmprVks1YWlWdHJ2N0FoZEE5?=
 =?utf-8?B?YU8wSVI5Wmc2Tlp4UEpMamN3NURlUnA1VVhwcmVrZEtRaUVaai9NMnEvTFVI?=
 =?utf-8?B?REFqQnVkeElkZlk4eE5HRm9oUmVvR3Vva0liODRXcWtQNEdsTkZjLzlFWE0z?=
 =?utf-8?B?OUtaUDBpTDJObXNUSlRjU0JwUTJ6YVlRV2krQmI1akJuSENya0Jkb3ZUb1Nm?=
 =?utf-8?B?WVYyM2ZlR3hFU01QTU5sMEc4NXQ5SnRmQjBRaE1QQUIzQ3hlZExGK21FeEtW?=
 =?utf-8?B?V1F3ZmsrWkhJbDllYW0rWTNvUGxPdm8zVmFiSktuOEpRMGJ2UWI3RHdKelBi?=
 =?utf-8?B?NTNTZlhXSXJkQ3VyZHVacWRwOEJsc1diTnE0bm9XRzBoWnp3ZFJVMXZZVmFi?=
 =?utf-8?B?QlYzZE0xaTZwMDFNUVpEMzYxVE1hMVJxV0djUHVRQUZQaktjZElDeTQvOEp1?=
 =?utf-8?B?UUk4SkRjcVQ3NDZjamtKUkR3Y2tBR3MvMHZ6V1dmZUZqdnRNS3RvalByVW5x?=
 =?utf-8?Q?3kbrRCZ/x3q9+q2qjBfuyok9e?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ebc0be-e4da-43e5-bf0a-08dabe3749c1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 07:36:29.7977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lxu5/6rb3NZdpQPDLuRi4Bd7W6Uzyuexuq2E7dh/8pv2hn+HKrlCoZSSnmpFvfQIAQ6IXjAXfa3HkLy/3NyzZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7275

On 04.11.2022 06:01, Andrew Cooper wrote:
> On 03/11/2022 16:36, Juergen Gross wrote:
>> The code generated for the call_handlers_*() macros needs to avoid
>> undefined behavior when multiple handlers share the same priority.
>> The issue is the hypercall number being unverified fed into the macros
>> and then used to set a mask via "mask = 1ULL << <hypercall-number>".
>>
>> Avoid a shift amount of more than 63 by setting mask to zero in case
>> the hypercall number is too large.
>>
>> Fixes: eca1f00d0227 ("xen: generate hypercall interface related code")
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> This is not a suitable fix.  There being a security issue is just the
> tip of the iceberg. 

I'm going to commit that change nevertheless. _If_ we decide to revert,
reverting this change as well is going to be easy enough.

Apart of this I can only fully support Jürgen's earlier reply, adding
that iirc it was in part you supporting and/or motivating the change
originally. It is perfectly fine for you to have changed your mind,
but it doesn't help at all if you indicate you did but don't say why.
Even for the change done here you left everyone guessing where the
problem would be that you did hint at in, afaict, merely a private
discussion with George originally. I'm glad it was enough of a hint
for Jürgen to spot the issue. But then ...

> The changes broke the kexec_op() ABI and this is a blocking regression
> vs 4.16.

... you repeat the same pattern here.

> There was one redeeming property of the series, and yet there was no
> discussion anywhere about function pointer casts.  But given that the
> premise was disputed to begin with, and the performance testing that
> stood an outside chance of countering the dispute was ignored, and
> /then/ that my objections were disregarded and the series committed
> without calling a vote, I have to say that I'm very displeased with how
> this went.

For there to be a need to vote, there needs to be an active discussion,
laying out all the issues, such that everyone who would eventually have
to vote can actually form an opinion. We were quite far from that point.

In fact, seeing the repeating pattern of you voicing objections without
then following up, in the "Progressing of pending patch series" design
session in September in Cambridge I did suggest that not followed-up on
objections should expire after a reasonable amount of time. Just giving a
vague "no" (not always quite as brief, but we had extreme cases) should
not be sufficient to block a patch or series indefinitely. This is still
only a suggestion of mine, not the least because it's not really clear to
me how to progress this into something more formal, but there were no
objections to such a model there nor in reply to the notes that were sent
afterwards.

Jan

