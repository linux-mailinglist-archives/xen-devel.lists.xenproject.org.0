Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D9C757EF8
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 16:05:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565293.883328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLlJZ-00088u-22; Tue, 18 Jul 2023 14:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565293.883328; Tue, 18 Jul 2023 14:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLlJY-00086P-UV; Tue, 18 Jul 2023 14:04:32 +0000
Received: by outflank-mailman (input) for mailman id 565293;
 Tue, 18 Jul 2023 14:04:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g6ux=DE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLlJX-00086J-4d
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 14:04:31 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02b08f3c-2574-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 16:04:29 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8111.eurprd04.prod.outlook.com (2603:10a6:102:1c7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 14:04:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 14:04:26 +0000
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
X-Inumbo-ID: 02b08f3c-2574-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hK27GhChaj5iEhVvr10kuQ7KrK2Lnpn3xn2DGa5xttbB61OzDmVSMUGVESk5rA588g1tpsYcGzOdw46ddN5sINtSqfL+vzrUYIGWVwVRXStyP6Mg8e4gCKtikq2ABqQii/30gaafRtnIbfQXp/obT1sI3vRzWrOSiZVaUsD7QxQtbqNhoOo/f+Bvd9SCp1shGOgXHV1OANMEhBkTw0Foty6VevOqKIO7s+yixknrr3A3lhSyc9K4tyEw9ioWGZp8/rl8+7/1vjLHbiSY/VjAJyDIsfoAvrVgjk4urE13qW4i/KeGHrhub57+gCEJJnth1H7ATp5RpTaZRPNS6AOsow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+25IvNh56WZG8jpnz8opXrTMLKi925FBHoqVUdLjewc=;
 b=QdZXU9kD2dTtkXKK4D6wcEszG9r4EogY5VCFF2xSHwm9886QD/w1mLZoF/MonFqBkCxR52yjYgaMTQ2PxmEidmkQef6PGpL0mNtelen5SIN0OUPro/5h19KQ9e0DpKBC4tBhpub5qSus9nW50u01xxULr35WKSiFc+B9AWpQIBOKV59h7w32k774jPQJ85F2EJ9lCcYT/fpoAVkt80nNYXvDtSNol9cvTmf+Ww9SsfzujFnk+rlZyJVzWQ3UQ1UZEu8pktOpwyEVDwVv1cfd2G0kvoWkFIfd8nkb70P+d7WLyUZxlYMP33bmv9fNl9c3kA2qgJA16X75YtskjIXM9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+25IvNh56WZG8jpnz8opXrTMLKi925FBHoqVUdLjewc=;
 b=y9z4kj5c/8NkQEpjXBdJ+32/rUm8SjOssYomcYryLKNhnKHEVb9h1J+Fi0uQIDoEkgfr0ZyJb39VXDb1UR7YvDBHXhNrWle9ou3NF2bQ2jnzgXtmWF8Cdep2JaVD5WujwkB1EDAL3hFDYJrQXTWhyDVd9cIVoh7NCjFlFBwBhRSQn7v+eX4XY1sMKK2Bt0W1eU+AxPmZqA5bz67y5e4P8VFnctKNoXgqGVh2E17xBF0/MI3NoyKpHGKnJ2CiNEBSGiexq5fJ/99tnd6zbMa1yvY54eR3S2m5C3Nep0jPahFPIWCV3xCZOk+T0KCuzYUXFeatOoC4F3rU+U0iX1B+iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b6365b9d-47a1-8ab4-37eb-0b821257dbd2@suse.com>
Date: Tue, 18 Jul 2023 16:04:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/4] x86/idle: Get PC{8..10} counters for Tiger and Alder
 Lake
Content-Language: en-US
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20230718132334.2087-1-simon@invisiblethingslab.com>
 <aa23a090-1883-008b-e395-2a3bca709258@suse.com>
 <2be631d2-95f3-0d7f-ad84-eb9e16d1a39a@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2be631d2-95f3-0d7f-ad84-eb9e16d1a39a@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: cd878663-64d4-40cc-ec9a-08db8797e547
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MPoj8Y9h5/ugCVkH5zjiXgym88vQYNa9pDSwB+Q8ARIP5K7kJS8+usxn6QmngnYPgv2YLS4QCuiMhiYim2M4Z0QF0YpHb1Jsn+BGMI9lAauWvl184IFzomrwSDkRS9LIQLRyahGf9FrxG3atYHuRkVDEQulSU1Rn+H1/YOe8vUaaSAujpuzjFQEDYF2FSMEb8lh6fBkdE6qPJmETuU3FzT6rCXVTOrbhPldyQgc6uophlVppOUyA282zAPV/yUy8eko4Di+MbLrUIFIo6RfbqPl7zCpNYr1UhUASlgtCq2qlnrNtRsBFTnI4S8rbdcutG2b6CwjqCc1UZFSZRVHbh2jUoWFVwlsL16u2QdETNgBBN87x7deM1izDdau+t7Vt+f+U6OVk91UrsNeJmLb3SYd+vKs3uklkqzLcBWkhOZXWeTl43ldoq6lmWAQNaCp58EoU+U5htBcebnvhopAXpTcP69mxb0PuCpAuycDZmFJ9i1Jpl/4FdO/wonlKHxUAf+jEZYmpjc4l7obtdd9UfkT5Pc32djZYfGJDbbcs1sqQ124V3kM/BX6SPNkxUsy6BZwgpne7tKYsrF2YhvR+5gEKOHGXFJxOgnJINl3R8kd7E6UK21s4u0XdhJLmzWOx6vgxuOFC2W/ZIZO6ndVDk0URIBoYuE53x+xGR+IX2nwCbzwXEuG7MAqSS2gs1PDr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(39860400002)(396003)(366004)(346002)(451199021)(6486002)(53546011)(26005)(6506007)(38100700002)(36756003)(86362001)(2616005)(83380400001)(31696002)(186003)(6512007)(54906003)(8676002)(8936002)(2906002)(41300700001)(478600001)(4326008)(316002)(6916009)(66476007)(5660300002)(66946007)(66556008)(31686004)(101420200003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFpGb1pyM2pTMXpmU1lTbVd5VU1UQm9UUXVzb0Y2ZDZDQXRoVUVTZkxRQ3Vz?=
 =?utf-8?B?c1NBcVVRcG9lNldsUHdWbE9mY3VDaFJiNXpuY0Fqa3IyTkdrNHpkanRXMERm?=
 =?utf-8?B?WGtHRjBiYmdNV1RlWkdrWWdXcUpPbTkzdmRMVk5JVTdCNk5TMzBZM2lYYUNL?=
 =?utf-8?B?Vjh5RVIzSU03K3llamNVOENWNENpQWYyUnNkVzB6aU9UaENMV21IczJnVW52?=
 =?utf-8?B?ZmJXTzQ3dnhCNE5GN3FsNDZ2SEYzQTdNWDdJenVZdklPUlBIMHFzMkd6TnlJ?=
 =?utf-8?B?RWV1V1NPVW9ja2pCYnYzcUkrSWFCT3M4NFROZ0hKUmt6Vi9yNjFJMnBOWWlH?=
 =?utf-8?B?MWVkVE9VRk9vYWhZYkFzR0l3TUFzTjY0eWE0Wkw5bkRLYTdXSS9NYUhQV0NS?=
 =?utf-8?B?N0Y5R092UW92MTBLczBXV0NSWGV4Z3VQTzJRd2d1dHF4MDZ3ZHZCNmlwQTJv?=
 =?utf-8?B?aU9kUkdEcTArK1h0R2VlU01DQkdjTDc5ZE8wMWhjcXNNUUtyV05YaC9laWhV?=
 =?utf-8?B?TVJxQXFTcTBBTWgzbFdCMUpXK2VRT09Cc1pheW13cU8rYmdnTGlxcmN5WTg3?=
 =?utf-8?B?LzZEaVdyMEN0QkhYZFBiVGJHU1lSRFIxcm9tRFI0b3JUOE9hNHpWZFdCT24v?=
 =?utf-8?B?OXVScUkvaFJHRzRMSjRoWXd1RDVGU1didjYwNENwd3BxZ3MzcFhTQVNFSmRR?=
 =?utf-8?B?NG1CaG5HVmNRa2tTTmNPZmNSNzBLdlJIaDM1ejZQbGgybHVkcFRlVzE4VUEv?=
 =?utf-8?B?WUk0MzJ1cUNUQi9BZStvanljZ3BYUCsrMjNlVTBqbXhYYUxsM1hXOEFmVU1R?=
 =?utf-8?B?YnF2Yi9iREhIZ3l4UWRTZGg0bGltYXVFSldWNUxVRDY5MFF3UEtNUWhsMFJw?=
 =?utf-8?B?SDAzU0ZDekd2ZGtiTU42Z2cwUFZOWWcrV0M3VGRiRDBSK2dkYmthenVySVNV?=
 =?utf-8?B?enVHNWdCZnl4NUVrcnR5djJBS0syZTduMFYxUWhlYVlubDlZZzN4MlVZQXQv?=
 =?utf-8?B?LzQrMksvWEpic0k2bXZMMWhBZ2tjNGlqS1RWVG9lekdaakNVS09FM3l5dlZx?=
 =?utf-8?B?SXBDYXJISHVhZG8wMmlieFZmQnU0WVBQYm1Ec1BwWVN0RlZ0ekJBaVp1Wk9o?=
 =?utf-8?B?MGtCdkF5b2xxV2Z6T1F2Y3dmT29DUXlOeTNvZjlwVzdNWkZUam5kd3hlOG5Q?=
 =?utf-8?B?V3RqZURCZWVQOEVvbEZ0cHZ1Tm84aDgybHJScjJlOGxaNVYzWHFpN2ZzaTB5?=
 =?utf-8?B?OXNjRE45cy9hZzI2RzFwYWFudmFPcVFRaEpEY3JuOUdacG0wb1JJZkQvUm5o?=
 =?utf-8?B?SXRrYXlaNTAvcjYyc041eFMzNzR0M1lrdzh4WWo4dng2QnNqZ3cvSmdDZnFa?=
 =?utf-8?B?MmlIWUFNeG8xT0NGWnhKakhLeGptekkwOHU4MUhueXRiYVIxZWZ3UXVSWXJF?=
 =?utf-8?B?RG5Rc3dZblBKZUF6M2dwRDFkeGJlYmc5Q1htK0JEN1l1dC9wSHlOekpDZlY2?=
 =?utf-8?B?UHgxT1haYkNsdTJtRWRORUc4M0FKWWdxTGxSL2tsVUtnNUE3VytNeEovb2pC?=
 =?utf-8?B?Z1BuMDFXOU5MT0dVZlJMMWFxSmphTlNmd0NjeVpXK1VJKzBtL1pKN2NINXVC?=
 =?utf-8?B?MG4zT2VZMlJ0SGhFRnhmcXg2c1gxS3NQZ0tobXBZZDNOakw2ZDJTMWNRdkVx?=
 =?utf-8?B?K2JRM1JEb05VaEx2ZlU1NlA5MG93WlVpbHgrQlNEMVhQVHh1ZlYyVjdvLzhh?=
 =?utf-8?B?dzNnajIrd01yWjFqVlFMSDFtZURwbExVV2E1OVVqeUFGUlBLbVlzeHhHaE1Z?=
 =?utf-8?B?VDBtUGZodzhrWnBvMTdsQVB4eWVDUVMrOXpRL2lBa0hYMW05N09zRlVPL1Y2?=
 =?utf-8?B?dWh1RG9LTjg1dk4zbUtBVEtseXRnNHoySS9Ua1c1empWQUYwMG9ZazBhOWdj?=
 =?utf-8?B?NEJNWk4rNTV4eTNvdWUwbFZBZXdGUDZNRXVMOUxIOEFLS3JTNy92VnpQc0N6?=
 =?utf-8?B?NHRRd2tIYUdmZmV6dDZ6U3dNVVdPUFExK3R6b3pkMEdJYUtrSGovRThrQnN0?=
 =?utf-8?B?M1ZRZjg2V0dvNHlMZFc4MTI4bnhZaElXYzhyenoxblZ4dkFHaEhrVVU1dXBy?=
 =?utf-8?Q?eSTCB/CBlseKEHKV0cIRgqdwZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd878663-64d4-40cc-ec9a-08db8797e547
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 14:04:26.0874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUYdgWQ3QizC7/E3NYQcPmc/MchpukZA/HxSOmFHdf0MPFsTyYCbCXtYWFuxyaXih4UnFsDN9uj+BzOLcc2OhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8111

On 18.07.2023 15:46, Simon Gaiser wrote:
> Jan Beulich:
>> On 18.07.2023 15:23, Simon Gaiser wrote:
>>> ---
>>>  xen/arch/x86/acpi/cpu_idle.c | 9 ++++++---
>>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> This lacks both S-o-b and a proper description. The latter in
>> particular because you ...
> 
> Yeah, I also noticed in the meantime, sorry. Will be fixed in v2.
> 
>>> --- a/xen/arch/x86/acpi/cpu_idle.c
>>> +++ b/xen/arch/x86/acpi/cpu_idle.c
>>> @@ -155,6 +155,12 @@ static void cf_check do_get_hw_residencies(void *arg)
>>>  
>>>      switch ( c->x86_model )
>>>      {
>>> +    /* Tiger Lake */
>>> +    case 0x8C:
>>> +    case 0x8D:
>>> +    /* Alder Lake */
>>> +    case 0x97:
>>> +    case 0x9A:
>>>      /* 4th generation Intel Core (Haswell) */
>>>      case 0x45:
>>>          GET_PC8_RES(hw_res->pc8);
>>> @@ -185,9 +191,6 @@ static void cf_check do_get_hw_residencies(void *arg)
>>>      case 0x6C:
>>>      case 0x7D:
>>>      case 0x7E:
>>> -    /* Tiger Lake */
>>> -    case 0x8C:
>>> -    case 0x8D:
>>>      /* Kaby Lake */
>>>      case 0x8E:
>>>      case 0x9E:
>>
>> ... don't just add new case labels, but you actually move two. It
>> wants explaining whether this was outright wrong, or what else
>> causes the movement.
> 
> Yes, as the commit message says it get those PC{8..10} counters for
> Tiger and Alder Lake.

But that's the problem - there was no commit message.

> The former already had a label, therefore the
> move. I assume that when Tiger Lake was added it was an oversight to not
> also read those package C-state counters.

Or the SDM wasn't clear, and we needed to err on the safe side.

Jan

