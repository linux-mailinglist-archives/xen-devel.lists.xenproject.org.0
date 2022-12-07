Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 843AD6455D5
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 09:55:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456050.713722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2qCy-00039L-KV; Wed, 07 Dec 2022 08:55:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456050.713722; Wed, 07 Dec 2022 08:55:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2qCy-00036V-HN; Wed, 07 Dec 2022 08:55:16 +0000
Received: by outflank-mailman (input) for mailman id 456050;
 Wed, 07 Dec 2022 08:55:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y8gL=4F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2qCx-00036F-Nx
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 08:55:15 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd06e2d0-760c-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 09:55:14 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9511.eurprd04.prod.outlook.com (2603:10a6:20b:44b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.15; Wed, 7 Dec
 2022 08:55:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 08:55:12 +0000
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
X-Inumbo-ID: dd06e2d0-760c-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hBd13YxHZ9b3iLgMQjle57aFbdGR0rrpEf2B0FqK5XGbjomqWp1/C0Jd8ZyOVyeVp3y/MRNfVnJ6u+fvtA4XGYkBfrryltOzI9hMoJjLU/01ijwUNQveemwvexAEamFgoPcp8gRcNORNNylOi+xcDtmWj5rKDcse5/rhHmJKRL8ogBYTKLyAOn/CkEWg/6ZX0ZC1E5rYg7oY8asBCv/E1BPOBeH4JeE4CdIkmDpcd+Ru7E9DWqhXdQrnyateFnK9m6BwjfrQsrnlceAMdDzWkURhLa4Lo5y5ozm7lQ08l1SvwgBXW9qBZnqfn0opPc71i+dcYYGIHmbLP633Xi/2iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0SiVVkenMwwdvRBzDzm2WkKit2FbadK9ucCjjABKJE=;
 b=enM98HQ2hYsxT/qPizXR1ERR2QSj4RhMyKZlRmCo736duc1uNKUTRaqlHw3qeRs8iPjht0c91JhgOCDZ69qZUrtnqFwalFTuiOGqY/yfxuIxQrWK1Hdnhe0qiux4OnFAZJ5wnGRzlOgIZhBWvYV4i6DrwMoWC9kRhgGrNrHj9IIgQiPKJ1kvY/rFB5TKxYiOpFwr73KF+GF6OoPJ5WIFacerpmspXE8DF2VFKW7piqRqFdjFgFLWJPKu749HFM2PJuAQJl3Pgd1yvbjmGmQcrep3Qxl2ElneZy/z0tr38gQG9bnfGIiA7GY6k1Zu987iex7UpWhMo/GZUdNdY5RQrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0SiVVkenMwwdvRBzDzm2WkKit2FbadK9ucCjjABKJE=;
 b=fO/gPzM1mAKSRo+QECaaNv5z1GHNPHgA1aUEIcPj7lZO14XyOrM5mCrvYerkQOUopZjDE7I/MX67WnExN+rRQYn1hJsvChRwRN251vJRWi+a8rYkeAoaP3a6pK3EsBxHA7sxqDG203HNJCVFrk5V5oCzP0JcCLG128eZwssJJwMp993hu5GM3HuoxGMI9zqPozQHiwtqRicexnmNZzPYpIqA4RWI5LZStKFoNPS1V3OPlSCXznOb3ENeBc81UD9/sX/drlzijkj0gg5Wq3hA6j08ew4ovuFaEp7OVs+bxtbciGlUTCoXqNfaV6guS+DwzRH9EUoO890QJe2cPuuLOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5bde8110-bdc8-e5f6-8677-8ae23f4990c4@suse.com>
Date: Wed, 7 Dec 2022 09:55:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/3] x86/pv-shim: don't even allow enabling GRANT_TABLE
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e5833b09-0ce3-b991-111e-07e64dfcc85a@suse.com>
 <5fd43248-225e-99c0-7bbb-65e7cf7f08d1@suse.com>
 <5c934e1d-c785-d330-f0e1-acaaef700265@citrix.com>
 <606aff14-8abe-1788-6bc7-f3b279db8106@suse.com>
In-Reply-To: <606aff14-8abe-1788-6bc7-f3b279db8106@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9511:EE_
X-MS-Office365-Filtering-Correlation-Id: 29e4c894-84b0-4edd-1fb7-08dad830c035
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0rJzsFhtuUJZvmRky0vqW9IswkKtivnO2541dMUk554mpoDA6vpvS52QtiuzSUKT0ulauwc3RL6XZJ/RLdKWEBZNL/iFYTg2yMZeSk/IWo0WwvC8frjA4DnZc0xM8mcRjcZ10giWcim0PKRKHPdm4wP9R2UOQgm0TvRWSilsDzqCOTuVQHGuu60eIa6Vhz1cgfGS55PbzsTIztxPZ6++L2An8yZrDu6A1cTS0sPf/61081cMw+cu0gUZb+KYAChP8KKEQCU0lku2mpEtgyQBoi2tAwg3SaIwJH2XypHaG4xQHq8rHTUEPAO7xsXpblWj71mKAhP9Bno0prkOarSWmwhddQ49FVE0zO9LAQtas/8hEiZqKxKJHZZaOcJRMwezgV3e5BemPnPED5k4HFA1DjnWCAYimnQ5eoWV8vBiVOFA4NKpp4T8rjIvewP3dGqlScNFxKIZUoE/feZKwc6qrpb8TqlA5YYCQHIlPuVnlNFcG9FSi8e6qQ3eITDVsZ1rpCfbKlpnfCYf24SHDDecZC7xfBuWbQr8Z8qRTILshK98hs8TjREZvm1DnkxA1Qmei0YFXhMt7qVv6cK9k6OTPtXb0Q24kqwmKTAc8LlGNnVATFLmXY4pGHqVCK5Gzu3shUoNzhuNhwb7Iir9Sb9qQ9P2C/4I6p6p2ZX+NlXA7EB6wGis0kK2xyjQbRxL0dWTg6IAS+OgdTENjaDkMAhmVDU7KxTZ48xhfuYXIdeLPMU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(376002)(39860400002)(396003)(136003)(451199015)(31696002)(4326008)(41300700001)(66899015)(6512007)(6506007)(66476007)(26005)(66946007)(66556008)(8676002)(53546011)(86362001)(6916009)(316002)(8936002)(31686004)(5660300002)(186003)(54906003)(478600001)(2906002)(6486002)(2616005)(38100700002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTNXQnN0eVQ2ZGlJNmtmNHFIaHR1YmhaMDJlcnhxSHRIT0JvaGxFVUZidmdL?=
 =?utf-8?B?L2Q4U2lQaGpna20rNGQrZFEvRU81c0dSS2J6MXM0WndiUDhhRlhYSGR1SGYw?=
 =?utf-8?B?WnFvOTk2cHA0UXBGY3ZXdnd3d2JSN2d2MEpDcmRtUVR2bndHM1A1cmFORE8v?=
 =?utf-8?B?Nyt5NVowQmY1S1NZeGFWQk9jd1pVcHd6RlFOanV2NFZOZTdWZzdHRFBSbXI4?=
 =?utf-8?B?VzQ3M0NjNXVwVWtidm1XMzd3bU5qNVFXRXdXVWhvT1ZYREs1ekg4NkJQTXB5?=
 =?utf-8?B?ZENXd3IrNURBcEVEdnVVb3NVTjNGRTcyaHhyeGxZRGpTb25tUk1uVUNEL2FK?=
 =?utf-8?B?Ni9hZmJQb3NpM1ZRWTNIdmRFR21sMkpwL1cyeHBsemZ0UGtRV1VUcGNuZWRv?=
 =?utf-8?B?MDA3Qmd3RUdnRXZZU2hScmhCYmFxdkI2ejlOZHFld1h6WHc5eEgveVYxQ3Z0?=
 =?utf-8?B?YkNqN3ZQNnRGRjZsK1ZzZVhqdVlFWTB1NVRDcWlyOUowcEF2WE5ubWFheDF2?=
 =?utf-8?B?UDJCRDRTUjY4S3VyK2VtQ0VxcFAzNC9jbmxSNmt0VXVYUUZYUUQxeG9KdUhx?=
 =?utf-8?B?WXJnT3BsTzdwTmlZNmcwQzVHZVlyVmZUcU5EcGRUMGlqY3ZpQ3hDejY2ekky?=
 =?utf-8?B?ZCtOMW51STNxOU9PWlF4VXhvT25hYlpnNm5CUzROSWN5TW5xK3NiZ2F3QTF1?=
 =?utf-8?B?QnFMNUJVVGZHcnp2ckU4bFVzWVpRMUlyWGh4OUlxV2R4ZWpQVTROaUNsU3J4?=
 =?utf-8?B?VS8rbktaMTU3NDZzaEVEMW50bzljMU04Y05ESEpWcHFxSDRBcXhWb2NKN2h5?=
 =?utf-8?B?VjZ1VVRQUjNWaXVlbzNXL1RncFluWnVwR3hjdGptWWptVVFkSEVOSGJ0ejFD?=
 =?utf-8?B?RmhhR1pMcDVLVlNKZXlsMjR2UjRNd0tuUU5xQVlhcEt1Y2hKdkVma09qNDFp?=
 =?utf-8?B?RnVVNnlNejdUbDRGb042OCtQQjNHZXhmdE5DMnFJU2hpcE9Jd3JYUGw0RHM0?=
 =?utf-8?B?QXNiYWp5anJacXE4VnBHNU43eFRsSENzell3bk0wdXd3aFJUQ2liT3NlTjNq?=
 =?utf-8?B?VWNTczNZZGpkU25SNzVCK2xGNUp1N0tEWnVzREhZRFFFSmMrNm1WY3ZNaG02?=
 =?utf-8?B?MWJWRVVCUjlPblE1TUxuUG5jbnZjY3NjWTBGRXlxa1lRejhSU0grNzJjeTJv?=
 =?utf-8?B?RExrSUVQNWhtRU5zQ0w5QWwxeUYzSlU0TFV4SWdKcVZxSmxxZWNJUU45WGFr?=
 =?utf-8?B?b2lLRnlyVFlzY3RnMDJOQ0NJQTNtOXZVR3ZTTGh4NUlWOFpDcWgrb1JBUmd3?=
 =?utf-8?B?K1A4TENJTEl3OCs5OFU1aUdaajNCWFpRdTdnZFc4emN4S0Nrb1ZCb0x1amxa?=
 =?utf-8?B?VnB6cWNtTU5KVUpXWC9MUlBxakhpM2JKZktKMmt4Y3M4N1lZSDVVaVJhMzlE?=
 =?utf-8?B?dmJ6OHd2RU1zOUp4TTRWNmJleVU5MDFNOUpqaG01dEZIc0ZkTkI0ZG1VMlFZ?=
 =?utf-8?B?cFJscTJWNm5UVU9jcFFKck0rUmlPd2xmRmgzMExDME5EQUVyZXZCOU01MFdn?=
 =?utf-8?B?SWloN0RPb3k4bDV3QnhGdlIxR0JXWjdiSUE0R0JtWUUramIvVFlkdWczSUwv?=
 =?utf-8?B?RU95OFNNbEwzbWFnQktZRzdqbDROUHJSd1hDU0RTMXU1WFZwNVJlYVczQ2Vn?=
 =?utf-8?B?QitpKzE0SWlKVWc1SWlob1BiL1FTYXVqYU5qM09oR1YremQrdktpcTN2Wmdi?=
 =?utf-8?B?M1RSR2o2ZzFaY0VpWktBNnVsaWVoVW05MEVlZXlKTjR0NVZBSkVxczMxMDdY?=
 =?utf-8?B?NXFEWG1kOHZ2aTRSUC9idnJuNXdoOVNUa3Z3NFppUmR4eHAxeFp0NUxzd1l5?=
 =?utf-8?B?SFRWeXc2ZzZRVlQvQUV0eVU5eSs0RGZNNUNzdCsrbDdZNHNneEJFZHk4Tml6?=
 =?utf-8?B?Nmw2Q2tDZExJQmx2ZWJBd3lYWVludmljeGZSNklrNkwyQm9SbWFlWGtNYXU0?=
 =?utf-8?B?Q0xiZUJ2ZzNwUURzdEV0K1lYQnFPK1Z4QUUxV1ZGS1ZHSUVSYmRXbG1UWmph?=
 =?utf-8?B?czFQbUNvQit1bXdNc3c5a0tKb29BcEFXNmNNV0lJdXB5TDVXSVFQYXVjeUFp?=
 =?utf-8?Q?2UAvyO4IJaPnQn5cXR7MKjmXs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e4c894-84b0-4edd-1fb7-08dad830c035
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 08:55:12.3583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+vuc4Ub83ermRzbuj6H2SVlRmw1WiS/qWIlgLEPFsGqUOm0C8Dh5qJHb4bWLqlTx/DRWlaVF+t2XKSX46a1cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9511

On 07.12.2022 08:21, Jan Beulich wrote:
> On 06.12.2022 21:26, Andrew Cooper wrote:
>> On 06/12/2022 14:30, Jan Beulich wrote:
>>> Grant table code is unused in shim mode, so there's no point in
>>> building it in the first place for shim-exclusive mode.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> nack.
>>
>> This is bogus, as is every other "depends on !PV_SHIM_EXCLUSIVE".
> 
> But why? Doing things like this in Kconfig is exactly ...
> 
>> The only reason I haven't reverting the others so `make allyesconfig`
>> doesn't disable CONFIG_HVM, is because I haven't had time.  This change
>> further breaks allyesconfig by disabling GRANT_TABLE too.
>>
>> PV_SHIM_EXCLUSIVE is a simple option for a bit of dead code
>> elimination.  It is not valid to be used like this.
> 
> ... for the purpose of dead code elimination. By nack-ing a change like
> this (and by having voiced opposition to earlier ones) you simply call
> for yet more entirely unhelpful #ifdef-ary. See the last paragraph of
> the description of patch 1, half of which this change rectifies. The
> solution on the evtchn side, unfortunately, looks to be #ifdef-ary,
> short of there being a suitable Kconfig option.
> 
> Furthermore Kconfig, in my view, is specifically intended to allow to
> prevent the user from selecting entirely bogus option combinations
> (and even more so suggest entirely bogus configurations by bogus
> default settings). If you disagree, then I'm afraid we have a 2nd
> Kconfig usage topic which we need to settle on in a project-wide
> manner. If only we ever made any progress on such ...
> 
> As to allyesconfig - I can see your point there, but then arrangements
> need to be invented to avoid this kind of unhelpful behavior.

Thinking more about it, if allyesconfig is meant to be useful, then
any "depends on !..." (other than for base architecture identifiers)
would be wrong (see e.g. COVERAGE depending on !LIVEPATCH or
ARM_SMMU_V3 depending on !ACPI). And this would extend to Linux as
well - how do they deal with that?

Jan

