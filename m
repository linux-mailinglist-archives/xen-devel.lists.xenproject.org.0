Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7FD77DD86
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 11:44:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584251.914753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWD4H-0002G6-8x; Wed, 16 Aug 2023 09:43:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584251.914753; Wed, 16 Aug 2023 09:43:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWD4H-0002EQ-67; Wed, 16 Aug 2023 09:43:57 +0000
Received: by outflank-mailman (input) for mailman id 584251;
 Wed, 16 Aug 2023 09:43:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8IcS=EB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWD4F-00022r-HV
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 09:43:55 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 691759f6-3c19-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 11:43:53 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9490.eurprd04.prod.outlook.com (2603:10a6:102:2c2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 09:43:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 09:43:50 +0000
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
X-Inumbo-ID: 691759f6-3c19-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZhKK8I1MTME1KEQhIYYsQOoYT3m69BtFOtZuBztWNqH79GaTvsAX2SdxPtQFH/iJGRj6uU9CtTPJ0ua+Pbl3hLgQq8nind0zTMV4BzM48I3QP6XXulCgpWtWcDlx1ChGySAgafiSK4TxiMveBR7v3orD1WUp0LJDqg8Fch/cLn5c+nPJv5niIFzrSpyYs9NRcWXuHXgjtdCt/rIXCdR6IbNok6SVN+NxAHBPhrNzvvQyf8AW1uOi0x96KUpF9mSRT3BFpXN3rWhFAoKWrRzjFrwbsgqNBq6eqrTo9OMJ//ODUUP/DlTl4C6KPGHbDdCDQy8tFg4rfNfLn3hMi194Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gz3o66yl8RDUKGn9Fa6/Tsve9mzBz8tlnUmY4mSO8P0=;
 b=cIqTT3zR4Awe+Y/X4QeV/eXXtVYIFmctBh9M3GmpaSmcYE8Xm9CpZuhde9HaS08ePTKav8AxZm08OZDwL486s0xas3N9yqxwKxeQBTtnMbPShxHQsOPLl62trZ6YqAOs3zWbfZvtf8RmMcxcDzJZ2wXx4QHhjr5vIo8uf5be7bsJ5hxhHZAy8ZGczGzVJCXqjDmJ1RY75NaaiNSair75eDk7NUsPZqePptSpVhPek/6sfooUVKZRLROo2Y8bJqd/yfcSv+2ORKHJXUbj6An9tjpTZHo1BA2frEAlnokt+21WtvZ531jVC0HHldHECwHLVAa0tfQQlhd6XcB7kmTLfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gz3o66yl8RDUKGn9Fa6/Tsve9mzBz8tlnUmY4mSO8P0=;
 b=WGmuVqSN3gSIDsEtcIuwDYjc3n31fQCrfyi4YWA5AnsCef8+lWO+rtpFWRi+KIJCM/zvngzGdamQ06zIuJm2Ccj4KklfATpNR/UhV0HthCH78hDcHk4iIoSfRKgwnKOMCQUL4QoQegnmVOdk5VXXG1PNZnq7XcOWcwmaQ2/78uKycDSq+qSF+zb8gJhYPM4xOA6PxkwpO5QkHWZdZ3QB7egO60bWVMJIhmLLmsKTkUcSOp+iyxD6ZQJt5e6GOsgasEJlUvVv/or6ZpvctLSgoIkwHJjnm8TENBs+LivEBHUcg1ar48S0cJ0V7IARiuA9b/m/b11KG7oP4KXOFrMeLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f8d43f0e-bceb-674d-c3d9-ddca4fd491df@suse.com>
Date: Wed, 16 Aug 2023 11:43:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 0/4] Make PDX compression optional
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230808130220.27891-1-alejandro.vallejo@cloud.com>
 <64dc988b.df0a0220.d6d82.abb3@mx.google.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <64dc988b.df0a0220.d6d82.abb3@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0188.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9490:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b0d166f-1ded-41c3-ef57-08db9e3d4b87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4Vjb00B2U1XVXstPZAPhjxVNRMfE4vR39przIMDzHrdb1N0s3inlSaDRMc+Ny7yDY/1/AWS8NDz1xh4H85g3HuppKGWmz8ubCllPjDdr8H7sr0z59SnOXT2v1fi6HZwIM8gts+EsJCfrMZ55+bQJAUUhun3oJIAIILUPztmenMSfaE0/9kzh/WmN3FcFMgSLNyK+wPIWHODJwlmHsqpYlrug7UbnW0ctTpHoFLqfMMRFEIeOSuN56Nc9We2icxkYsudZhXSremt/cYIgecC3PB0fH5+69Otxm+EK/3bNF2uDWNzF64RZdiN4PF70r8eSv66rUsrEwaSdOWbWMcvpxegmutMlKVwfeCy1ulCPCY1E2toLknYB2recpo+JbEiYkiGaJe1EICjr8QN8utCplbkvP3xFRrW/TllTOGNNYRu0zIsbLtq9ibqDuH8rUsmZyxkc23QNnNRVpaaS7FtNaOAbFLJpZrOreKnrws/yASnMAvUaMfQvWGApCjV2dfquIBTsvjbsvDcEIKtNS34e9PIHfYIxh8u6JQoumS5D7aQmTDRG5TOzJbLBjyXcsHR2/VBUrKQo9jSJiInFb7iFs/T609rlZit9Sdi6IY3Qj17xp8JJlUu7w1BJlzg5h0Zwlm2qGlAatkLlqUKBuKV09Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(136003)(376002)(39860400002)(1800799009)(451199024)(186009)(2906002)(83380400001)(7416002)(86362001)(478600001)(31696002)(36756003)(2616005)(6486002)(6506007)(6666004)(6512007)(53546011)(26005)(5660300002)(41300700001)(6916009)(316002)(54906003)(66946007)(66556008)(66476007)(4326008)(8676002)(8936002)(31686004)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnQwU0JOL05VTkpZc1dhamZSV2l6bUZxSkg2OHVaVmZzcHlYZjZFRENZN1NN?=
 =?utf-8?B?TWFrbzR4SXU4UXBVSmVmWTNGVm1aL2pGcFJmL1NmdEZRMUVhUXVwZVFLUzhv?=
 =?utf-8?B?UzV6WmpFVFFJMEZOMWhtaUNiRjV4RWUxWlJMRitsWjBFUDBlR0JuWHM4QTVl?=
 =?utf-8?B?T1hyYVN5MWdXY3RBM01NSlg5QWs1N1dPTjRXT2RzUFJ3UzZ6VGxQckZmS2pP?=
 =?utf-8?B?MTN3b01VT0JmZ2g4YWE3WWdmWDVZRXNDUnF5WjNFWThYYWNxWm1aaWpnZHFE?=
 =?utf-8?B?MFdnc05rMkNvYW5XcVcxVE5pZHEwS3Zvd1hsUnR0d1c0VXA4Z1dueUVLZkNj?=
 =?utf-8?B?TXpwanVRK0xxeFpucThnVlVtWTNJWHl3emlTczVJUHE3Nzl4ZXBnUURhQVg3?=
 =?utf-8?B?RXpzNnBBWUc0VlVxMGZxOWphWE1LU3RxbFByYVBMVmExQUhBTVdYVEtCMHJ4?=
 =?utf-8?B?ci9GL0hlTjRkRzFXSSt6Y2pEVnk0N1ZCeGdFcFcvSmN6d3k4dkxEQ2FNcEFI?=
 =?utf-8?B?QTVaRHlxbng1Y08xYkh2bXYrSTVvZnBYbmJHTGpHdHZEQnVTdm53QnFCcnZC?=
 =?utf-8?B?UDlYRGJ3TGtoNFl6WnJuelJVVi8vMlp6YzRROS9KZC9yeStiMkIrWXJUYzJF?=
 =?utf-8?B?S2RXYmRLcTljSU5aTURyWGJNelF1V1hVdkdrZVZTc281ZnBtZk5HVnVmd2Vk?=
 =?utf-8?B?c2pzNUphS0hNQmpibHdWSTBYSm8yTWVWT2tiSWU4YzJBMTB1NEg0WG5zTTJM?=
 =?utf-8?B?R2M1NWgrRzE2M1hCYWVrTk1jZnFhcE5VTUVaQVBMUlo4ZkszOGp3YU5uUDlu?=
 =?utf-8?B?UjBWN0wrRzE1c3FmVHlmc0lWSGtWa1QwZE9tZ1hKZjEweVZVOFBvckd1YnVt?=
 =?utf-8?B?cnNxZzhlNmoyTWZqZ1JWcEdlUUxGdVlPdkM1NzRDOXVqVjI3UEtqSFFMNjhH?=
 =?utf-8?B?WThKOVhEbTdSU1dwdXQ1SkdaUTl3MGJQVGdLVUY4bjlnTzR5R2RqUmpqSFR0?=
 =?utf-8?B?N200SlZaRWYwSzBLMkFtRk9rekZrdkJmRTlra09pQjJZUmZpOC9hOHpMSzlU?=
 =?utf-8?B?K0xYRlpta2ROaUVObEFZYWdSRWVzeGduR0VxWDF5ckJnbW0zUU1ETE13ME9N?=
 =?utf-8?B?TkdrWEdWcEsvVFkxUWJ5bnNacEhTQnd5RUYzNnl4Ri9rOHM2b252UUJUeHUx?=
 =?utf-8?B?Z1pkWWYwVHJNa29Lc0xiSWRMM3NvNGc0NzFJUk1WVWlDa2FGM2RqOXFBeSto?=
 =?utf-8?B?UFBiek9Fak81NlIvU1pHYXdyeGdRNWxJQVg0a21WYUhEbmJVQi9BbGlhaFlk?=
 =?utf-8?B?V1NnUWRPV1NOazRtSkd4Y1N1WGhYTkMyRnkxeW53UHpOQnNNcXRpTW5rOXp4?=
 =?utf-8?B?ZDRMVHExTC9qRmpmMngxUXljYVlVQmt4MHJtNjdzcHpBblMwZXBiRjQzYk5U?=
 =?utf-8?B?NnlRL051a0gxcDhPZFpxMUtjN2VGLzlpVk9nNjNyblVlbmliaTd2V0ZjVFlp?=
 =?utf-8?B?VTNnTlpjajVlRDN5WFdMV3JlU0FoWDF6ZW9wRWRvWS8rMVZEZHB1VnFwZkwz?=
 =?utf-8?B?eVRzZDR1bVRxbkRkV2dxc2NkUmlhcTZTbXY2MUNHcThacDBVWWUxby9YcEJt?=
 =?utf-8?B?S1ZnL0NHc3ZCd1FZYUE1TDhVVFJrT3R5cTRnL1l4dFhRM1h2UStOVHNPeHJa?=
 =?utf-8?B?TkZ5NUhrdm9tYnVUN1owWjNVdnI3SndpaHk1eGxQc2x0U2d5SExET2xXNXdQ?=
 =?utf-8?B?Y2tSZk1XcUZ0OGowMEpGTCtnbWcvN3ZhSmV0VFlkeER0VFNEWkFNZERnQ2tE?=
 =?utf-8?B?bTRLOWh2MGlOMXQ4VGY5ajl5UEhTRzFDanIyazNqVklHb2JMRWVwb1g1T0dt?=
 =?utf-8?B?WnQyWENXSUxtd1E2TW14U25rdEE2Nk9JTFdzbGhtKzRLY3dDRU8xanhLSWxP?=
 =?utf-8?B?cEpPRlp6bDZqbGI0b1dvOFFMd2tJTVlHcVIwZnpqTXIySmhpbE9pT0h6Wkhm?=
 =?utf-8?B?UktkT1ZNSWJMYnU0TlZmYzVaZDE2WTNnMTJCLzlXcFV0bmFmaEZzV3Ewai9m?=
 =?utf-8?B?d2pldWIyK3FmS3BNOUpRN0VMeTduUlMxa0lWSWZxWnVXSkduRFBiOG1VZklv?=
 =?utf-8?Q?Ea+zbMa7H5kHVwrujHfrOIyyW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b0d166f-1ded-41c3-ef57-08db9e3d4b87
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 09:43:50.1958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tRC1qlXGL2CJ76q2imMekXpewn4TaoxvSJJkpb2B9np2PQRNJlpIKEOau9XMRhRgJK+WJibelv+KvV+0wEJnng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9490

On 16.08.2023 11:36, Alejandro Vallejo wrote:
> On Tue, Aug 08, 2023 at 02:02:16PM +0100, Alejandro Vallejo wrote:
>> Currently there's a CONFIG_HAS_PDX Kconfig option, but it's impossible to
>> disable it because the whole codebase performs unconditional
>> compression/decompression operations on addresses. This has the
>> unfortunate side effect that systems without a need for compression still
>> have to pay the performance impact of juggling bits on every pfn<->pdx
>> conversion (this requires reading several global variables). This series
>> attempts to:
>>
>>   * Leave the state of pdx and pdx compression documented
>>   * Factor out compression so it _can_ be removed through Kconfig
>>   * Make it so compression is disabled on x86 and enabled on both Aarch32
>>     and Aarch64 by default.
>>
>> Series summary:
>>
>> Patch 1 Moves hard-coded compression-related logic to helper functions
>> Patch 2 Refactors all instances of regions being validated for pdx
>>         compression conformance so it's done through a helper
>> Patch 3 Non-functional reorder in order to simplify the patch 8 diff
>> Patch 4 Adds new Kconfig option to compile out PDX compression and removes
>>         the old CONFIG_HAS_PDX, as it was non removable
>>
>> Already committed:
>>
>> v1/patch 1 documents the current general understanding of the pdx concept and
>>            pdx compression in particular
>> v1/patch 3 Marks the pdx compression globals as ro_after_init
>> v2/patch 1 Documents the differences between arm32 and arm64 directmaps
>>
>> Alejandro Vallejo (4):
>>   mm: Factor out the pdx compression logic in ma/va converters
>>   mm/pdx: Standardize region validation wrt pdx compression
>>   pdx: Reorder pdx.[ch]
>>   pdx: Add CONFIG_PDX_COMPRESSION as a common Kconfig option
> 
> @Jan: Just making sure, are you generally ok with this series as-is?

Well, okay would be too strong; I still don't see why my runtime patching
series isn't re-considered. But I don't mind it going in the way it is now.
I won't ack any part of it, though (in case that wasn't obvious), so it'll
be up to Andrew or Roger to supply the necessary x86 acks.

Jan

