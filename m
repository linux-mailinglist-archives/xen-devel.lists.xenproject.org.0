Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3111554C46
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 16:11:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353934.580940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o414I-00084i-QI; Wed, 22 Jun 2022 14:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353934.580940; Wed, 22 Jun 2022 14:10:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o414I-000829-MK; Wed, 22 Jun 2022 14:10:54 +0000
Received: by outflank-mailman (input) for mailman id 353934;
 Wed, 22 Jun 2022 14:10:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kzGk=W5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o414G-000823-Am
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 14:10:52 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70079.outbound.protection.outlook.com [40.107.7.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ee40036-f235-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 16:10:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9359.eurprd04.prod.outlook.com (2603:10a6:20b:4db::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Wed, 22 Jun
 2022 14:10:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 14:10:47 +0000
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
X-Inumbo-ID: 1ee40036-f235-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQu0K3O4sdRP52ueM5kQ49vWMr9EQ9n2wExou8FLVlx0r+pCyvbVAQIng5B46pFPrg3bHmF3GsiUgZgeFsJaeskkr82HpEwgU8n261UH2LM8LP+CQHmx0xcK/g5rK8WwHd2DHrOmh1s10lzFZkpuHIeFI2w2/BvqSuoVBess37ivt/QOu/QllUh61XFtt+dXYzONticNBOP+3pCo/FwctKCyf/LuFuwZkRkVUDjhusBX1kOJPHIT8PSZ/ZoT/ErdlBf+8JJyh4tDtnik2EHQCZ7oN0meAnZFq98I0Tp4jhe0JdpJMvTMctTSVSEmKuAGxV7InU3LOUHuPSgYo4JfIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/x4+UAHeQPtNwfuoTJuZ4KGdODNKDMmXfrC0B7jizc=;
 b=W/40aoK+bBG52ABG2CHAWifhJi2GFWAYcglYK0/Sx6wkKmw6SNfxqiAPrEH3ASFod6yakCSyWCRc3AdAFl+eYizYWMxovDfemFf3I2gMVEbsVc4NZPOggbdbLRFoTIajedQH9DIP23PRP1VMq4bK2bAir1xYrUEt/GP4skbD+yxAJeOng4IvCkq+4z2lnss/iXa2k6wN4I9Fsp5gvd0sbYlaguaxAeokrqdfPSA+w53xDKDUerEpaujHVQT89JKitv4UL/YSYn6i2lhatV0eHBY6oWI7/v3gFK+H5IdLt+CBBnLGpX9HuDF1S5wbdMCWxORk5nUxgDaWuL1qoCMNwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/x4+UAHeQPtNwfuoTJuZ4KGdODNKDMmXfrC0B7jizc=;
 b=juXV5D0KsFuJQfY6UJ0UVpS8ZavHNY96AMMW+2SBkPAmVYQpZxIMEZwO8cEX9JI3k+Dikb23dDUIfITZc3QMa1Uu3lDX+tT41ROxrHsz2jtwTQ7FW1UorVvQdbVgTVY1LmjNQ2DgEFglZXgj7N4ViqIFi7PC1xDpJwA9ClzCLx7hAJe5Qi4EMXrBZlkgqcSMJrE4E0WxK020HNra6wIVMW0p6MQ973qKI5xwVLkEXGyYfByTyQh9h0QutVjxXp1zaFVPG+Ldt2xUnlBIfVnEci3rnbCLJZw8MSvIVhDPXR8A8LuD5QIAcqm8ImiPnRHMszZtZkRcNDx4p5SxFHIm7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <68d7fb35-e4c5-e5d2-13a8-9ee1369e8dbe@suse.com>
Date: Wed, 22 Jun 2022 16:10:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/9] MISRA C 2012 8.1 rule fixes
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Michal Orzel <Michal.Orzel@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220620070245.77979-1-michal.orzel@arm.com>
 <dd016e82-2480-0e1e-6286-18b2f677dd65@suse.com>
 <74ec2158-3d19-3b2c-1e8c-fb5b30267658@arm.com>
 <d91bb4ea-41be-225e-e2fe-1b03aa06c677@suse.com>
 <C45BA6EE-6294-4C6F-ADC4-3DE7C8DA866F@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <C45BA6EE-6294-4C6F-ADC4-3DE7C8DA866F@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0017.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::30) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7197d2f-7f8c-4ce1-ac7c-08da54590111
X-MS-TrafficTypeDiagnostic: AS1PR04MB9359:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AS1PR04MB93599E5DACB1E8BC9B5CC1F6B3B29@AS1PR04MB9359.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lbaOkYAlJXGc541PeL0qU/Y59iYk/cJet6Nr/lzxDvKDXStBbXEEhz3Uys5ZW2bx7E/Fg8giPkl/VqsVGFVWeIZQCab9ysUjvfZj09NQEyjGxe3onOmurncxMl6JWgD95HVuZDfZ3vtFP71ajqUzCVSDiD2BKWuMQ8bQWPkEVNHspWXegG/9P7wcfYbH76P4QufZdA92TicMsW3Q0OLwSUfsxJZJnKDrES4IYLRxKX4ufmBgaB1I1JCNd4K/WiblUxLbGPhVu7RuWYD59iSqdsRNLNqie+VADClaOtDqHbsVtCMCjE0zoJpaaOiCq8AZi44FQbnsxl7jqm2WhN4GndlhqSvMFu1pi+x9Ue/ecETw+2gU+6DlBxLc3caz3EjSAcWSlma6v5wmP/QmKi/b6aKhhqzYtVIq+LetY9DuoNX4aGhk74sD+2/kd3eoy10rQPKGQoorCv+wnJMg3SNnXyBIgENRHS9XjhMTDc+CmAavfaVKgPEhBqMml1A8mOyGd84k8gsQwQJnDsTxeQ4K2J+5aISonrIDx/LlycBde7ydl721O6spaNLwUa9UQhWCrbnT6Od08HzaoS1o1nR8b6jfAATnpG2XcMrUxQAGyRrsdYNDeCZtoTkNuhHsh/v9ICXHgCtKGTJqQvVXg6VqCQuTm5n1z7fe433BZyer/p/5EFM9UnHSQTJEonwtnweME90Oc2SNx0RLhmPMyNEnIQnxS28QnUtKuXIYJdx/Zdunszh2opJ0vFV1kxPgDrOtejAwH7Vbc/gCJwEyFOokeM4yIxmrFGMCBRIFITLols8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(396003)(346002)(39860400002)(376002)(2906002)(8676002)(4326008)(478600001)(66556008)(6506007)(6486002)(31686004)(7416002)(8936002)(66946007)(53546011)(6916009)(36756003)(6512007)(26005)(41300700001)(316002)(66476007)(83380400001)(54906003)(31696002)(2616005)(186003)(86362001)(38100700002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDBCZGY2a0ZvSnA5cm9JeU4yeGVJaHlueWtER095bHMwSFdaK1RIdnkzbEZZ?=
 =?utf-8?B?Zjl3Y1p3MXNMaGovLzYvKyttU1dEZ1psSDdJaDk2RVYxdXlpeXJSOGk3TXJk?=
 =?utf-8?B?SDZ4aHJRcStQa3hzaldqT05RWUZ0aVYvaEZzemEyRFJQYmE4VTQxQWNFY1h1?=
 =?utf-8?B?QlVXb2o3QldKQ284bEZ2dmpjdlF2UW0ybmNhVTZjc1RqbDZIYk9MSGJDNHBE?=
 =?utf-8?B?TFUrYjhWVjlMUmVtcXJBakwrV2ZvRDMwdHNXSXY5bkszY0tJbituaGwwNGhX?=
 =?utf-8?B?QXJtQWlUOEhuS0ZMWTVHWWtiZkRpRnV5R3BSVmhJdTkxR3BwV242RFRVQTkz?=
 =?utf-8?B?WkpVU0FoTEJGVndaanNYaTR3dUFzTHIwYkRHaHRkZWova1N2a0ZneDUrT1FP?=
 =?utf-8?B?VkxFdWJnTmhHYVBGZXVScklZSFpnS0FlTDZiVTZ6R2plQTNVWUhZajI4c3du?=
 =?utf-8?B?VmxObHhhbjNMMjdvRVg4V0w4cHVzLzNnMHRGSGVJVExxT3pQMXhaaDJXQmZk?=
 =?utf-8?B?KytvSEloSjBCU25Zb2t2VWlQMTZYRXRNQ0JCNmNuT3RoZ1dMQldPejJFQjR0?=
 =?utf-8?B?Z3B3VEZGSDI3Z1cydVY2a3g5M2ttRk5zTysxSXB3VGZQRE1yRUxKZnBuZ3lv?=
 =?utf-8?B?S203SG85am5ubjk0OFpRU2Y2R3V4ZnlBU2JiWUgrL1hGajVRdDhVbTcrU2Vm?=
 =?utf-8?B?Qk1vMWVLMHBtL01nLzVkL0VUaTh5TG85UGZ3b1c0YVBFMWkxYmNPc2NQeFQw?=
 =?utf-8?B?VzVXRkVhU1daNWRDR052RTVqTTdmaCtlSzdHKzVYUHBGQ2pFdlNUZXQ1ZVkr?=
 =?utf-8?B?OWtBakdSMS9ZMXB1Q2Y3UTV0MnQ1U2xQeWx5dFl0QnQ1QWkzc05KZE5TQ3A1?=
 =?utf-8?B?WGlRZHphTkkwTGRvOHZuUi90cTUxYmVPYlM2VTBXTkMwU3hiK256UTR2a1Z2?=
 =?utf-8?B?WmEvLzF6OHQxZDlVam1MUFFBaVZYWXJxNmluRWlvbEM3WG1nZ0FIWVJxR2Ez?=
 =?utf-8?B?UzhDSUJFRDVYeG90YkhoazhtUTNTR1pIaFg1Y2JUNVM4YXpqRWVtbzZMdHpB?=
 =?utf-8?B?NEYrYVFVdzVOaHN6TC95SThYTVZ2NzZkUEo4NmdCcjhLWU1XV3RYcmJKdnAw?=
 =?utf-8?B?bHdhd2tkQVZldnFVd3JhczV0TmlyK3NPVHhvcUtzcGZ5SUQzQkZqb2UrbXRF?=
 =?utf-8?B?WVlaZTMrQ3B3MlBheDhCbHQvQjFGeCtqMExMRnE1TEdqWTdJZUZRVUNOMWpQ?=
 =?utf-8?B?V1B6NTIyR2xPUnlOekV1b252dHN5MzdHUHdzMFUwTlVDQVVtMUFKMXd2QXM2?=
 =?utf-8?B?bzNYa0xnTTl3SE1xRkVURFY0M1orSDlRZ0tIbUdTSmVCWjlsNlloQlVwUmQ5?=
 =?utf-8?B?R01BbUtseEV3em1WNDZXek9mOWlvLzc5Z2VTKy8ydk5RckFLa0crYTMxK01m?=
 =?utf-8?B?SnFwOGVUL01vUmliNTFzTVR1SUd2KzJXQlFveUVrb2hQOG0xNnEwS2gzUnV3?=
 =?utf-8?B?ckVVRGRMbmlkQzRFR1FZKzJOL1FaZFY1TnZhckxyZStiWmw4aWxqK2Via2ZS?=
 =?utf-8?B?SFVBYzBCQWQ1V0R1M3NDQnBpYlBFWGR0Vk9CT1kyTFhUd3JUb055ZmdrWkFr?=
 =?utf-8?B?K1BLL054M08zTS8yS0UxbkdVUkx4cDdBam1GckljYndiZmxacjZLMTBJaHJR?=
 =?utf-8?B?dmkxcko0MEwrNVFhbVZBcGo3MVlOWUVPRVBiUnNqV0toSExaUGthQTRZYVll?=
 =?utf-8?B?aEhDb3ZCaExEU29icjNKS3lFQzBySFRNSVJuZzlNL0FhMWV2cDRCSDhtZjlC?=
 =?utf-8?B?RkR5ckNoc0pHU2V2U3BNeFQyakNMTzBDMDVwTEpTOG9BZ2o1L0FCOE5Kb00w?=
 =?utf-8?B?V080dEIrMHh5d1RwV0MrOG1GN3NxSmF4aTlSNS9pSm1adzdrdDBDaVB3OFpQ?=
 =?utf-8?B?Yk13TTJqbkFVRDdYR0gvWWRzNUFZK3pkay9VeENGdS9qbWhqb0dXNExXbzZx?=
 =?utf-8?B?Mm1zdE0rR2QyNkN1N2V3NUZCZDR3eEdQcDBkMFVUT2l3VTEwWU9zWlh0QXhh?=
 =?utf-8?B?c09NYXFjZmRDS1dOdHQwbU41UVRjUVc2OVBYbkt2azh6YnFmVFhxZCs4UHUr?=
 =?utf-8?B?Zi9aVFVNRUNMdFNOdytYMU9kUTl3VG1BS0VYQW1NWCtJakIydVNiZEVUYTZt?=
 =?utf-8?B?UklERlY5RzVraEZRUUpEWW9jTUhFT2dVRzd1aHVtS3NKYnJRaWt0cWM1dWhI?=
 =?utf-8?B?UG8vT3lsdkJUOGdldGN6MTh2dmFuVnBDZG8xMlFlOTBBcTBBckhZOWFsSnhQ?=
 =?utf-8?B?U2hQKzVEdEI1QzF5bXVhN0lXeHdHbk1SRkxpL2Vya1dHT25XTGMzQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7197d2f-7f8c-4ce1-ac7c-08da54590111
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 14:10:47.4979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +gDvbs60SFdLrqNXhyQ9hWiUtgAbJv6YqOBwzsx06hJPWrqzF/jPmJ3iWzKNQ+x3YKr32dYyqy2AnsKxezxk6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9359

On 22.06.2022 15:55, Bertrand Marquis wrote:
> Hi Jan,
> 
>> On 22 Jun 2022, at 14:01, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 22.06.2022 14:55, Michal Orzel wrote:
>>> On 22.06.2022 12:25, Jan Beulich wrote:
>>>> On 20.06.2022 09:02, Michal Orzel wrote:
>>>>> This series fixes all the findings for MISRA C 2012 8.1 rule, reported by
>>>>> cppcheck 2.7 with misra addon, for Arm (arm32/arm64 - target allyesconfig).
>>>>> Fixing this rule comes down to replacing implicit 'unsigned' with explicit
>>>>> 'unsigned int' type as there are no other violations being part of that rule
>>>>> in the Xen codebase.
>>>>
>>>> I'm puzzled, I have to admit. While I agree with all the examples in the
>>>> doc, I notice that there's no instance of "signed" or "unsigned" there.
>>>> Which matches my understanding that "unsigned" and "signed" on their own
>>>> (just like "long") are proper types, and hence the omission of "int"
>>>> there is not an "omission of an explicit type".
>>>>
>>> Cppcheck was choosed as a tool for MISRA checking and it is considering it as a violation.
>>
>> Which by no means indicates that the tool pointing out something as a
>> violation actually is one.
>>
>>> It treats unsigned as an implicit type. You can see this flag in cppcheck source code:
>>>
>>> "fIsImplicitInt          = (1U << 31),   // Is "int" token implicitly added?"
>>
>> Neither the name of the variable nor the comment clarify that this is about
>> the specific case of "unsigned". As said there's also the fact that they
>> don't appear to point out the lack of "int" when seeing plain "long" (or
>> "long long"). I fully agree that "extern x;" or "const y;" lack explicit
>> "int".
> 
> I am a bit puzzled here trying to understand what you actually want here.
> 
> Do you suggest the change is ok but you are not ok with the fact that is flagged
> as MISRA fix even though cppcheck is saying otherwise ?

First of all I'd like to understand whether what we're talking about here
are actually violations (and if so, why that is). Further actions / requests
depend on the answer.

Jan

