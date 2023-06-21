Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2099F73890C
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 17:28:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552818.863100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBzkH-0006Ap-0u; Wed, 21 Jun 2023 15:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552818.863100; Wed, 21 Jun 2023 15:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBzkG-00067t-U7; Wed, 21 Jun 2023 15:27:44 +0000
Received: by outflank-mailman (input) for mailman id 552818;
 Wed, 21 Jun 2023 15:27:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RZUy=CJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBzkF-00067n-JP
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 15:27:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2823a1e1-1048-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 17:27:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7900.eurprd04.prod.outlook.com (2603:10a6:10:1e8::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 15:27:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 15:27:37 +0000
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
X-Inumbo-ID: 2823a1e1-1048-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQN9Vr0zFvd7aJYtrZPLLK3wwa9cUgqpnxcKXSYKhuJ7Mlb7xN2jEq98YhQXDRv3xYqefs0UdN7rxge/TBhvHUFYrqPhbXsZimh35gKTzR4LxbAe7LAWWXCFfEDDLXkcrQRJNInlpgPYHUt//m54k/zwPYSXIlGgutYmposZsjcywE0J+4GQy5jJwq4aD6gl2gBpD6ZJgzsZA5/3XFltow0gL51JG85lh1n2wzAjLra9m/dCH7rdQlMkiCmJ1aroJJhK1p68RGJWdDewLmj92iQz2ggOHjN0iJ4eH/G5Kbo8zSNk6ePkVjNRxuaVqEwA0xR3nECUV16LySnf/5qXXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cY5YGSielma6L4kluSLfNYfLGtEZqe6VTMMwv8D4USY=;
 b=MBNt6EfU0QPoehkgYQ5lMr6J9V+fm9t9rhxfESplXtDgtvBBVPhIMj3CGyB2LTeGkNei6xE/21ajtR4SApvsUncc9MsN4e1r5qM4C5Z9yARsWDQ0VOySn9OOO9IHxVCXqEBpk2gdYK4/l8Axpko+wsoQg5+T9wTYVX51YVRyJ0FFKPTRucR/hxxHLy47Ly3dbD1bcISYQBvqqvCFM9UECySJsJNmNl2hMQpWGmvJJn9XL9o3jokmnkvsbvGLKyB7pdC2X6qykUJXD4mh1j4a61MOmDhXG3O1UCcUawb3W4aJydnbs7tBr/9IvPqKbK3TSA4XQE9Fjz+nkaOelnlkyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cY5YGSielma6L4kluSLfNYfLGtEZqe6VTMMwv8D4USY=;
 b=nLw9aB62kV5QRqpqsXx+qxB72VQv5mpUCnhi0HWM/D3STxALz7LxZn2RfqTR+W0l7VsGhGx+rQ8iIfMzaJF4WUOTJP29Tefk2FvDH0QyQO1a+gN5gFTTuiY1kg8EUlKSoq5UQVl/6KAyR4kgWORwipoiCFCRaRNeacdYqHi+8fwDh78JSd3ntatUfHEX2qwaO7Dgv4zDniEIZOVJQGzlva8m2NsoeH3efx+YlRnCSQK6lHinFHaYmo1SXB6lHeVtBysy9mrqmFrqvZiXJ2y+vfSXDhjD7JPcxa6qGkR9jnDeyx13vN8ljyNc/yLyBsl4588Ug+yAUuz+Y1Lr+wlpxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2de3a187-5fb4-d06d-a411-a1ee69b73dfc@suse.com>
Date: Wed, 21 Jun 2023 17:27:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 12/15] xen: Add SET_CPUFREQ_HWP xen_sysctl_pm_op
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
References: <20230614180253.89958-1-jandryuk@gmail.com>
 <20230614180253.89958-13-jandryuk@gmail.com>
 <0b53687e-e781-7c01-34e9-e41cd14967c7@suse.com>
 <CAKf6xputOYsrr5u+8rKZtbBuzL2GhaW_5c77VCmZ5fne_hZVyw@mail.gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xputOYsrr5u+8rKZtbBuzL2GhaW_5c77VCmZ5fne_hZVyw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7900:EE_
X-MS-Office365-Filtering-Correlation-Id: 35330318-3058-4b10-6e90-08db726c0af4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+WE8yZW6EbDa5z3sK1LWCOGjS2l0be2wMrdu2bW/BAubtPW8lAkRpQpXTmWcNAgn9FNQNZ3olJa8gnOfknvQ5260auGbfCFRapBMEjq9tDgXPVVErrBSh9BQsyXAwWIGUdkC1PzZ8t2nqCBZzGZIDR0AUHotGuy6lVM4SBRaHFOTiloVTTuM9EvoKSySAirfNr03U/F20uPhoY2mTJj6TIgbqDtqXl8brEURday7h+T3bhaAJ/BzyfsoEOSFK4bPYSfHOGIcPc+L8PAOElPramxbLEY2q5mbnCUd/IQtxjc0upigQjbz95KDnl2FZaCBU2j6/1WToiOpTGyBN/M2B70YFUAicnqAv18SaPBCg/mAHCaobUBlr+zIQPzahaafv1OXsAjYE3pyn0wsWLc+lixGP390nQ6mTmHW5NDPAAAovr4KpfXoPisff9fsd69PtTMRpQv9mxG1s+twre8/iNCa23mqKUDZpGs8RsilobWCz54ekN9oNmSv4UqzLJtBAmr7JWi+/BgPFBF5rljbHOcvp465arpBBbmm8i/yxPiVMzyin/BEDhGqILsF7CopsBhJY4OwY+/0sOAZbY+PjZ1gHmWg1cts4vfymx1B3Tfz50irpXmoQC2aApDgQ20zUffCNSBVqb4lbLbDZ0h1gw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(366004)(136003)(346002)(39860400002)(451199021)(6666004)(6486002)(478600001)(6512007)(186003)(83380400001)(26005)(2616005)(53546011)(38100700002)(36756003)(86362001)(31696002)(6506007)(2906002)(8936002)(8676002)(5660300002)(31686004)(316002)(4326008)(66476007)(66556008)(6916009)(41300700001)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUZtdVZNL3plbnRiRUQ1YjlpTWJGdHlKOHJyVytTQVNqRVk2dTJoWTFMVjJy?=
 =?utf-8?B?bkJIS1hJUk5yZW1QZkJ2d1cwR0pmeDVmS2F6ekUvc3JPQllRMmpPTDk4SU9p?=
 =?utf-8?B?YlFoNWc5Sm45VkEwam1PczNrdlBtalgxV0ZqbW5sclFXc2hXcFV0ZndpSEMv?=
 =?utf-8?B?dFE3YUh5Q0JYOE9uWnNFRWptUC83TjNkaEg5azU2b1c5NHp1S3ZqS2daMUlE?=
 =?utf-8?B?Ymc4RldjTkd1REE2T0FraFc1aWMzc28zR2s2UFFkZ2RnNzgrVUFHcGJmNi9C?=
 =?utf-8?B?SWZSdjRJRTd4alViM2llVTRkUG5HOTFPOWxFNHU0d2huZkpaa0FvbXNET1B0?=
 =?utf-8?B?MzNPNXZXTjNRUnROWSt3RG9FbHgxQWNmNmVOMlQ0Mm1LcUsyeGhxSklGM0pl?=
 =?utf-8?B?bVQxYjZ6c0F2dlNaeUorR3k3ZloxMEZMTmZZV25ROUx5RGR1VkxPQ09FZTVD?=
 =?utf-8?B?RFlhbk5iUU50VVlwejh6MlRZSHR3NjRIQWV2TDg3TE5YZFFSanBwampoNGM4?=
 =?utf-8?B?Z1o3TUduZ0hlYUpvWi9nU1pNM3NhcGZlQ1RtQVdraXQzcFY1QytKYkx5TXcy?=
 =?utf-8?B?dmNFVjRWL2dZS0c3RTNLMWFGQm1ZRytkUklhVklScWxtbjdpZmNmeDdyR0lU?=
 =?utf-8?B?ZUpUajh2dEZia0RsTVRWVWlBQ3A0Q1dJTzk4UmI1YTZobUtmbElMcGkwb1Ay?=
 =?utf-8?B?Wjc4b0lUcGtZOFpYTFBoMk15SzZ2WlZ3ZTRXRC9qa1oyVlZ1YjhuM1cvNHM5?=
 =?utf-8?B?cktoR3o1eWtkOVl0UFgzeXFjUjRpVk1ZYTNmSVl5MVdzZTE1QldDTUZtOVRu?=
 =?utf-8?B?b2IrdW01MXF6djFsM3ZLeDI3ckFaNFl6WjhUWkJVWlpWanRYdG4xZUJLMlFO?=
 =?utf-8?B?c0JaVVVFUVIvbldhK21ORllwenkwTTFPL0lYdjdIQ3hsMHlWUm9ENTJwSUV6?=
 =?utf-8?B?Y0dlZWVwdWtNcDEycXpoN3hKUFNrQjFSZVM5K24vV0FjZWppTEVhenRncFd4?=
 =?utf-8?B?RDQ2YzdBd1pFd2thbjhRc1BNMUNFV3VtcThidUFUaDV5aDhQZzNYZjJGWTMv?=
 =?utf-8?B?UVVKYTlkNjloRFUvc2tjdWdwQnh2WFp3RktrMFNJZExDSjhMVlFCV2FjSC84?=
 =?utf-8?B?V0pvMWFoWWliUnhRMDJScVhHMjdsVzJmTElGc28zZVlSRUtMZGFqZmRURzBt?=
 =?utf-8?B?NE9BTTYyY1FjMFFzdVFhdU5zWGd3aUo5RFcxMElRSllrYTNiS2dicUhxeWtL?=
 =?utf-8?B?TXJjRkZyV1pMK0l0cHNMZjBIUDVyS0dOZGE4cklwK2NTQTlkRHZmcDlnTEg2?=
 =?utf-8?B?ODg2VmtLNkFxZlhNYVN3Y0hGM2ZveUhvMTJiSFJjZE9uRnhxNzA2OXBDMnRY?=
 =?utf-8?B?T3h0aGU5dnZNQy80SytuT3RyeExIeldDeDBBaWgyQ0YzWW4wWThQSEFPWlRB?=
 =?utf-8?B?eVhlNC9jVENDZHJ5Uko5QW5hWHFFc3E5Ly8rZVUvcmZUNzVCdkRpRGxZU0Ni?=
 =?utf-8?B?OFFWRVQ1ZHNmSW1xN3RFdm83eUZVQjlFOXhvL0tlRHdSbWxNVVNyZEl2WUM3?=
 =?utf-8?B?a0h1bjlJUy9obmNJZlI4YzMwdVZ6eDNieEVmSXRDaTNzQXRocDdwWlFRdlpG?=
 =?utf-8?B?VlFWMHF2T1pzcktvYkF3SmthU3lzNE9FS0s4YlF0dWRvb3VZZEhZRmZXZFJH?=
 =?utf-8?B?N3dYKzhCYUpIODJ2L21la1ZwV21xNHNkRG1IUFJDZkdoQXNTMHVOazdPNmZs?=
 =?utf-8?B?TVdpUU11NUN6RHJCUXp3TzAzcGEwaUxnejk5UkJDbHllY0JBZ2x0VUNjVU8x?=
 =?utf-8?B?OVFpK2RUWm9xN29mb0J5SE00SmtMbXFLbHVVQzFwblNmRlY2R0hjWlBlZEtx?=
 =?utf-8?B?WW1haTliejNZQXozNEdEckpnajJGMkR0aVByU3Qzb0RXYVdUREtEZnNNU0NS?=
 =?utf-8?B?WmttK3p0MHREVm9sazh1djJncDVxZzd3QUZ5WFZYWWp4encwK0JpSm9QRFRY?=
 =?utf-8?B?UmJ5UysyWEdjRnBEeElIV0FuK2NmY1BTelN4S1NyRjZrQjlLNFVVbXpTU0RE?=
 =?utf-8?B?TE5oKy8rSWFacmwydlNxOHpkOHBpSUcyMWVCRENwMlh0NFp2WHVOdVRiK3BS?=
 =?utf-8?Q?1y5lB/kllZzVNTcdPNkFTWGY/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35330318-3058-4b10-6e90-08db726c0af4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 15:27:37.0088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gqyrg98WWFaFoQaMFRcLUHDoo8O8JHM44WhjGEEUcgoBr6UFZVLOhdvROSG7rh0+IlNob/BBrimiOu/ylUCXMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7900

(re-adding xen-devel@)

On 21.06.2023 16:16, Jason Andryuk wrote:
> On Mon, Jun 19, 2023 at 10:47 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 14.06.2023 20:02, Jason Andryuk wrote:
>>> +    if ( !(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW) &&
>>> +         set_cppc->activity_window )
>>> +        return -EINVAL;
> 
> There were a few aspects intended to be checked, but I have failed to
> implement them all properly and consistently.  The 32bit fields of the
> CPPC interface are larger than the 8 bit HWP fields (10 bits for
> activity window).  So the first aspect was supposed to ensure all
> those out-of-range bits are 0.
> 
> The second aspect, which wasn't implemented properly, was that fields
> would be 0 unless the corresponding bit was set in set_params.
> 
> The third aspect was to fail if a field was specified but hardware
> support isn't available.  That is now only activity window.
> 
> Do aspects #1 and #2 sound appropriate?  We can discuss #3 below.

Personally I'd prefer if inapplicable fields weren't checked, unless we
expect re-use of those fields with a different way of indicating that
the field holds an applicable value. But my primary desire is for
checking to be as consistent as possible.

>> Feels like I have wondered before what good this check does. I'm
>> inclined to suggest to ...
> 
> This check was supposed to enforce #2.
> 
>>> +    if ( set_cppc->activity_window & ~XEN_SYSCTL_CPPC_ACT_WINDOW_MASK )
>>> +        return -EINVAL;
>>
>> ... fold the two relevant checks, omitting the middle one:
>>
>>     if ( (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW) &&
>>          (!feature_hwp_activity_window ||
>>           (set_cppc->activity_window & ~XEN_SYSCTL_CPPC_ACT_WINDOW_MASK))
>>         return -EINVAL;
>>
>> Yet I'm also a little worried about the feature check, requiring the
>> caller to first figure out whether that feature is available. Would
>> it be an alternative to make such "best effort", preferably with
>> some indication that this aspect of the request was not carried out?
> 
> Yes, it would be nice to try and apply on a "best effort" basis as
> it's only activity window which may not be supported.
> 
> The SDM says, "Processors may support a subset of IA32_HWP_REQUEST
> fields as indicated by CPUID. Reads of non-supported fields will
> return 0. Writes to non-supported fields are ignored."
> 
> I'll have to test this, but potentially we just let the writes go
> through?  If the user checks xenpm, they will see that the activity
> window isn't supported?  Hmmm, I don't have a machine without activity
> window support, so I can't test it.  Skylake introduced HWP, but my
> skylake test system supports activity window.
> 
> Or do you want to make xen_set_cppc_para have an in/out and return the
> applied features?

Yes, that was what I meant with "indication of some sort". You could
e.g. simply clear the respective control bit in the request (and then
arrange for it to be copied back).

Jan

