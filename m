Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55004783E02
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 12:35:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588404.919926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYOjA-0006Hs-6z; Tue, 22 Aug 2023 10:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588404.919926; Tue, 22 Aug 2023 10:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYOjA-0006FD-2y; Tue, 22 Aug 2023 10:35:12 +0000
Received: by outflank-mailman (input) for mailman id 588404;
 Tue, 22 Aug 2023 10:35:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MJFy=EH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYOj9-0006Er-9N
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 10:35:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91c47475-40d7-11ee-8782-cb3800f73035;
 Tue, 22 Aug 2023 12:35:10 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 10:35:09 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6678.031; Tue, 22 Aug 2023
 10:35:08 +0000
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
X-Inumbo-ID: 91c47475-40d7-11ee-8782-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/VceEl59zgkhMkYw8YJFHpI90EmRrQ3fp8mxNHW+7LOmvPvB4hamxam17y4uONKrvTDL3haOVX54lN730DupFsx5Xr3CbXSuho2CJFXbN/hYy2mD0275ftV8IGl/leqokZ9h5CJy2AgAWinzX3qgR4oN2yw1n66GfuXhBqp6gdCZdVxADzGedylAYforqUWJXrIfSIzwP69L5tLcbaJ8C4FMnPbgmNzGv0sRD9nR8CJDZTE9iXbfZpEC7dnrOMY3raZrYV7SBh7TLY7MV4QxjdzyvUP2LnjeT9HL60lyrGGR8QHR3GRvYkdQAqnCr+jkEGx5QxnB5tqxhJjoJ550g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGuOoiNX4r4Yu6Ha5lLQw9b0S5VPebQt9k795FeBvc4=;
 b=ZzHVxfkLDfsjSxH/ybYiFn+FsfIEVplWFITM1Ytncpcr0uVDruOnphBCiMGoUFbs8xQquNdangvwVYijftoZfET32KDOLpxVV+Gx9uNgu9ksy/T+O0O7+oZkvN1D1el8R+VG276Hvl07z1BdiMbyjoVZ5nOLjhoyhAyOzen6YrF+Ix95B1MIwkxtlyigCKFsnmwWHX7fGXDUzai0j2zGgwDdPeYxD+M3Mz4eVR81OPOgWuECIQiAzW7IO7sKFvWi+bHK/EalQFmrpxpqfxk5kKC/PT9PhZSPmWqEt+YZGfgPfk+oLIf75HBtjVetSQTUZo1TDODvoM+nC9icR1AW4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGuOoiNX4r4Yu6Ha5lLQw9b0S5VPebQt9k795FeBvc4=;
 b=mP3e8fh5RvR0EkAU5A9dgaD/ieMSWOBW8xQRQ40GluVAHyP2WguJMyn1UxEmjDrvFyx2Q2EptJC9lDNZHseYv3Ev/qKD/2IOQySnFyLjIVlrXQwXolCKLBLFnAc3hIaNRrjMMY49xX7qzDWDl7yxjA5qn1oZ6ed3mhYx/zgn7SSECxd6iH2FWw1kKRP64gas+J/94jT5dysxWUPo8j638TYr2swe4LQOK5RhwlK1OUQ9KIbxZMeXpvRNL9oa8GyImcVU/eS8ogGBbeTd/qdNgXJuD+BSR90jNcUK6H+qRDfJkoWWsgtSedfoqEVdBgTa5r7xsCThGa+2/AuqJ89sdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <659abb38-67ff-bb6e-bd62-b1ee90860304@suse.com>
Date: Tue, 22 Aug 2023 12:35:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] docs/misra: add exceptions to rules
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 george.dunlap@citrix.com, bertrand.marquis@arm.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20230822013014.2523202-1-sstabellini@kernel.org>
 <f3ea87fe-cc05-453a-87b0-e7f795e24459@xen.org>
 <ee6fe3b0-92ab-e215-ea0e-091658b87138@suse.com>
 <efd756ff-9fc1-49a7-b5d7-841915a9ee63@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <efd756ff-9fc1-49a7-b5d7-841915a9ee63@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::18) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PAXPR04MB8703:EE_
X-MS-Office365-Filtering-Correlation-Id: e271bb44-7247-4339-7f4f-08dba2fb750f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4wXKcVxIHbXj0C2Skmt0gwPq6B3M1XNWrquoBDDXR8hHEF+rZz/K7fYknDIp9MrBhqWfXscgsWutrLvlMc80BIHUM+KhMPMVpcIpV9N6FAeKjGaVN6nRJxJ5ajNRp1FQoABw0/ig71nemIKZ/Y4Hx1NyrhJhaEoEKwRdvvoKHdHjh9EA0B7aMemsnh35lKE6xfMfw4VESWLRUcBTR7lT8qVCCTqF+ewTb8tDA/uO83cHOrNazbqQHH6SRzHN5KfL0Tx6M5ft3Ev/Gtud/93ikDl7Nu1WYTpYbFUz1fKAltLizSVeStX8hkBGOajQG3naQoAGxEjk25KEErERGKJNDjrNq8f6XReEfgQAZpA2upHSZzNOZqMTvISnY7J4zyOfKUBBr8gF5Fm/O6l6FXCKF+Ie2G9igHzT83BqYcuwfd+R2J0+Kl7GDlIpj9EgnoU3pVjFk37c4JnVc2IxAKhGd28Y4X6iKHM5pW3FLjtkBbY4B9ikCMIP3WZKSt6OAsEEjmaPW3E4brk9yhIxFNvIi56MSnHXZ1G/fFxPvSt/y8YpsXhJnJ1aRkHJ8LPRTl/OitaUcXpRpjrdgr1nD/HMYGNADvoef1B1YBV3qxv1/qTUXTPQljBqSi9k3UIdGRsawFkD08Qu933NougTSjKXrQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(396003)(346002)(366004)(186009)(451199024)(1800799009)(2616005)(26005)(6512007)(31696002)(38100700002)(36756003)(86362001)(83380400001)(8936002)(316002)(8676002)(478600001)(41300700001)(6916009)(66556008)(66946007)(54906003)(2906002)(66476007)(4326008)(6506007)(6486002)(31686004)(53546011)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3lqNk5wSWRzTHp5Rk0wTUdhMktFcUhVN0VVbmgva3kwWTNVQ2dzNkdWQjYx?=
 =?utf-8?B?SVZKUUNQRzgxL2I2K2IyS3B6Mmtwdy9aYkw2YnRyMHgwQlBFRlc4QjRaem5O?=
 =?utf-8?B?Wm5XbUVHdkI0TTVHcnNrNkw1cFJNOWlmbzd0VkJDUEY1ZmQvdkZ0dlMvZXMr?=
 =?utf-8?B?dHI0SGRVcGJ6aWcxbUZHWnRkdFpIaGtwMXFBTXZwcGFPM2xlenJRTjAwWWUy?=
 =?utf-8?B?ZU8xSVpLS2sxeW1yMmtCZXQreVc4Mk12ZUM1aTU3elErQWswNjQ2VHZrYUI4?=
 =?utf-8?B?b1luUjQzc1I1bFljZWpmdEpoSnRVc21LM1IzaTZvYk5pcUVNdlh4SlVKZjUv?=
 =?utf-8?B?N3hZT09nS0ljRDZwUS9pby9iYmY0U3BmaFA4eDdxT2hTQ1J3MFBjMit0U3dS?=
 =?utf-8?B?ekFlZ2N5VHNHVW9RY0JLdWtZRU9ZbDVrdDBhVWMzczZFNnF1VnkzZmpGY0RN?=
 =?utf-8?B?OTN0bHNDdHZkV3hnSEllK29qQ0NhMTVucGlTVGJoT1h5M2hibm1qb0RiSDJn?=
 =?utf-8?B?TS9YQmpOeURIMjlRNjBCZlBoeUpnblgzZkhOdGIxTnFtMnczOUprTElhZWxI?=
 =?utf-8?B?ZWh0WDJxMkR4eFl5U0pKOFh1WW1yM2ROZVZKQ2k0a0RBaUtvdkFhMmk1dURS?=
 =?utf-8?B?Ky83WjNZSXVBZFh2bFpYajI3SlBCb2tiWmR6OVl0aGRqcmJPME1PSFQwNEMv?=
 =?utf-8?B?eDVxK1M1VDJ2UXAvclBSVjlBam1KSS9GaHdmMHF6TXRZcW81SjJMbGhNNFJF?=
 =?utf-8?B?UWlGRUs0NnBlWG8xMVJibWFHUkxPbTlhVlFvUElvSFE5ZkYrb295OHZHOUdq?=
 =?utf-8?B?OHN2OVljclhhd2FRY1IzNmcxZ1RlNUdqeTVsLzFsUDVyZXdRRmFGZ2wrTFU1?=
 =?utf-8?B?Q29NL1NuTW43dm4zMXF1Uk5VTnNPSkVsaHp3WXVlcTdINUt2dXJZa1o0dHc4?=
 =?utf-8?B?SE1uRkJPT2ZOa09qdGZPTS9kMXA3dHlqMi9aZWxhZjEvUDlmVXNjS1cxNERH?=
 =?utf-8?B?YkhYL20wLzkxWkNyYy9Yc3M4MEdlbk1kUEdiRGoxTC9wbHAydVRuQldic0ww?=
 =?utf-8?B?R1ozT0NoYmtWRE9oYVY3RWV6TEw3QVh5b2p1SVl2REIyRWNmeDhpQ2tLVVFM?=
 =?utf-8?B?S2haMm0xdnlpbnVHdmJESi8vb1ZLRGFaTHhBV2xkN2phV2p0SCtUbUNFZ0Rr?=
 =?utf-8?B?ZXFTWDNTWS9HSXY0STZKL21IWENybHVOeEUzNEQrRkxkeFBYU2pQQ0VRUDZ2?=
 =?utf-8?B?U0N4TUVHdHZuZFFCSTJGdW1aR0VhK1pnRTdnRUIzUTVReWwyVnNEbHp1Mncw?=
 =?utf-8?B?TnBUK2lxZTJZNXZmMmNrMUdYaDM2eWFuUnJyVnZUNFNSNUNtUERuQTcxc0dJ?=
 =?utf-8?B?UjhhVVlHdEVSZzY1YmlLWlpPZUtwRngyN3FWampibXJGKzM3VXNQeTdiRzhX?=
 =?utf-8?B?eEtnODkxaXlQUFZOV2Ziai92TmFReTUzb2JKOWdidkVGMWVreTZ5cGpNQkQr?=
 =?utf-8?B?MUROUVJNdmNOcVY5WGNSSzZIdFpsMThNY0FoS2p5Y1owNTRNRHhXNGJlRkhJ?=
 =?utf-8?B?SVk1RHZjQW1tSGZvUWNrY1F6NTBSeGVtRW1odjBDbE9oTGVhTkJnSkNLUlJm?=
 =?utf-8?B?bFhVS1FIZVA5TnNETmxibktRbnpRWkxsT0hhQXBGckVnSkY4MXl3SXowZkJp?=
 =?utf-8?B?MTlPbTlRb3lYUmIwMG0yQ2xYMkVUcEhQSkhoTVUwMFBLeEdPYytEQ3VyZ1Z3?=
 =?utf-8?B?OEZTVHNvdENvZllLOGwvWWdjWUFHQ1Z5dkpKbVhBT2pGM1pGSkpiZWJ6ZmRn?=
 =?utf-8?B?UGYxTUVFYlhqTVNvTW1HS2xUeTAwMDYyWWdDTU93b1VYS2VqQWxBbEgyZ2w0?=
 =?utf-8?B?ZDd1Q3YzVng2V09XeThNemtEdk9WRVp6MWJpOFBLTzRpWWU2aklGOFBIaWIx?=
 =?utf-8?B?b0YyUlorUGo5cHNqNnFHbHBJOSthUDZCU2d4cm11SDF0aHhpdVV1YUY0eDg1?=
 =?utf-8?B?VUlTemppTlNadi9jb1lEeHM0Sk91SllEd2NURk5Id3lMVVpVQ3ppM09FUkdP?=
 =?utf-8?B?bkRqaGpiNXhSRDRCZVo3QTNWYTQxMzFnbGFLSmdrSDEveE4rZVcrNS9INHBl?=
 =?utf-8?Q?0+2NNEb47a1Bvc/jLdvkDC+TL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e271bb44-7247-4339-7f4f-08dba2fb750f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 10:35:08.8479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTe6PrShic5mHFNyg4pALmWDtmf0gfHhQuvBj2GtrCRYKVOYUFYAfz5IHdrovOeJWsg0XVuM6R1vcKMkK99xcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8703

On 22.08.2023 12:33, Julien Grall wrote:
> Hi Jan,
> 
> On 22/08/2023 11:12, Jan Beulich wrote:
>> On 22.08.2023 09:56, Julien Grall wrote:
>>> On 22/08/2023 02:30, Stefano Stabellini wrote:
>>>> --- a/docs/misra/rules.rst
>>>> +++ b/docs/misra/rules.rst
>>>> @@ -59,7 +59,8 @@ maintainers if you want to suggest a change.
>>>>         - Required
>>>>         - Precautions shall be taken in order to prevent the contents of a
>>>>           header file being included more than once
>>>> -     -
>>>
>>> It is not clear to me why this line is removed. Was it added by mistake
>>> in a previous commit?
>>
>> The patch is replacing an empty comment ...
>>
>>>> +     - Files that are intended to be included more than once do not need to
>>>> +       conform to the directive
>>
>> ... with a non-empty one.
> 
> I understand that... My question is more related to why we originally 
> added one? If this was done on purpose, then why are we removing it?

I think the goal is for the file to be easily machine readable, and hence
the same number of sub-items want to appear for every main item.

Jan

