Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1464179A3A5
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 08:44:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599048.934287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfaeO-0007QI-Qj; Mon, 11 Sep 2023 06:44:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599048.934287; Mon, 11 Sep 2023 06:44:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfaeO-0007Na-ND; Mon, 11 Sep 2023 06:44:00 +0000
Received: by outflank-mailman (input) for mailman id 599048;
 Mon, 11 Sep 2023 06:43:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xbw8=E3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qfaeN-0007NU-3v
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 06:43:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94a6b95d-506e-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 08:43:56 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by DB9PR04MB9963.eurprd04.prod.outlook.com (2603:10a6:10:4ec::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Mon, 11 Sep
 2023 06:43:54 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 06:43:54 +0000
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
X-Inumbo-ID: 94a6b95d-506e-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSBbobD8mE/XjEnOvY0wz902B2r4t0pWYzWDqWlP3IHmgEeiLLuq0qial78faoaY5YfH1HZwWpkP2963hhePK1RAMiGYXqQfr2e805dWBl7K3JiXkZWSKnUUhE7SXEBDHV70frdcTefbfiWNNiSK+rv25s9SPut7WxptBiq5JLs9ufDRxy0X6uS6DbyHc9uHPDUpnwc+/9hTmol2d5OsdEe3cwtb+wj8XvxrVCkWiikY/x5p6t0AGHm2YrFpsiSb6llh9dN6cB0hlRLCmJboLVfdt1f+1FTYQD34C6xzCsFa3A7MHJ3OS/f85bSBeBBwzQz04JqcpRBg412MiHlb3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eG7hUo5YGTwMY0DH1KhehTwmT+En0n3bTKDM1VfDERw=;
 b=iL6hJ213wNJ18D8AnZgTSHdxH879k+qoDJJMOmsO8TkDp/UcikZO7cPUfh1l1TULatFtk0cy7/CqFild0CAQYMozuOF2l/uJmYUKuCnrjqYr1hE+SEV96HAz50kdME0ZWjwQuyKsGF6ICErywag1UO6JHq6VUMj1qRjg8bDmV154k70UWDe28780eYYwFkJmLMRHytinmvpUaoU6a+PCHOmmpNG6X58w48mmk8QP2KQ8r5h4Sa1CorLitdFLWtuvKfqb/v94NgtFHvsgEilfWyWhSSakpkiZHW5lYujhP7U9BALLvteuL9xYHUoFOsGRbYEDKZlT4y+/AR1y7wzFfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eG7hUo5YGTwMY0DH1KhehTwmT+En0n3bTKDM1VfDERw=;
 b=ZoPQA+GbnpqW0OR7S6H5JBHRYlFbJPvxbvnYaUyjdx/BVo3bUDw0q5f68iatKqcyq9Fr7B/oPqGWxqdfjdH0fpZEY7ECMKs2QU3Wh7hMFfquh2eqSTWalIlrDd0kRN70p50exIIPuCZCZI0mriZaKAGJZbEnYJkqfu9eoSWh8OBPg/kZ18td1rf/ANLCyjb5IRshyPS57DiStXHDfktrSUFQiP6tgu3sFR91WyOrFNVuBIb35InBM/BEb+JsLtJl4Z0mWFNjexUCm3ETqwAfj+9aiiCimxBkM1p8D/puPVec44JhQXobn8hhL0ULT0ivx72tmsOs2WQwI+8puHZ5eA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <36543676-d926-89f8-eef4-27b97a3aab9c@suse.com>
Date: Mon, 11 Sep 2023 08:43:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH] xen/types: address Rule 10.1 for macro BITS_TO_LONGS
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
References: <b3aaaf5265c7e7ce6228ba2146f57aaae09f55e6.1693899008.git.nicola.vetrini@bugseng.com>
 <540ae128-a934-8c4c-6fec-e475dd072c3e@suse.com>
 <aa2084eb925ade9caa4e1dfbfb425537@bugseng.com>
 <9b673dec-f391-9948-3ce9-25ddff8c9d7b@suse.com>
 <948c3c6c0b9dff859df58eab419d01f6@bugseng.com>
 <7937ae31-e511-8e41-9cbb-98d8666e66b8@suse.com>
 <alpine.DEB.2.22.394.2309061828360.6458@ubuntu-linux-20-04-desktop>
 <6818e3ac47edca6ba107b8eeff95955a@bugseng.com>
 <a52733a0-ec5a-3b49-ccec-7a7e8e775c4c@suse.com>
 <7d07fc38-14e8-6cc7-2b0c-816bc68c7317@suse.com>
 <3d44b3b0b185418482ab60a693d930a9@bugseng.com>
 <98406cf53192652013d35ee8856df5c0@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <98406cf53192652013d35ee8856df5c0@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::16) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|DB9PR04MB9963:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aadd132-f41d-4be6-c2e1-08dbb292775a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L/KiKekXhNKa88RS8ahLrDadR2CrNvgX6MMYTsV9lZTE2Jr/WKYKMqdryE8heCSB74lThQ7g5bIH+0j9F9krCluggz/BG6s552ZgJDQIBlsG/iiKhDJ7izhrsYm756m0fkGyuEwGYFefEIES1ZDRFL6r6vlu+ALjJzRv5dsB1luJFP+n63VgHBlMd8Tm/Y1HOAPmus7DER9ErzrNK54P7it0+6W9uP34d33oQePHH/mEbjQUI5LfSh666Xvv8qm3aBWKpFxjT4jB/kCXcykjk8/9Iv3oE+TES6+hMFI0p6gsdJmi970EZoyGoTVT430UIYy+kyA6F/4yz4xpOdpkFKDo5JvQigpOqlEanFcsmE1JPy1NrQ/O+T3oYLDdOjFdMarUAhducFvLgAs8zrRVDlV43cw/HmcGKEmhAEsIlOQiUl0VBXfG9lmSXN9Ch5nAJzg95HiL8IGO4YtGfE3Ma2rXpPTQICYBAvD6Q49JYlkDdRyPWypEuMINVHGAcl+zwTWNqljioJm/NnQy6BMjkyvnow0aHtf/o0zUEDDOGZZgaVG4Yv1JNDp5MFwEVNXClMwkuN1bxhmv1UYfZwMezTOVwvLNuhpaHHMqA6jpykkTyb0derm1oJAjC1S36aoq75Z2871WEoAoEX+9bheWZg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(136003)(346002)(39850400004)(451199024)(1800799009)(186009)(41300700001)(31686004)(66899024)(53546011)(6506007)(6486002)(36756003)(86362001)(31696002)(38100700002)(26005)(2616005)(2906002)(6512007)(83380400001)(478600001)(316002)(8676002)(8936002)(5660300002)(4326008)(7416002)(6916009)(54906003)(66556008)(66476007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MU1ycUJwVlZKM1ZvRFNRNEJZZlZkNkdteVF3cnRyU0ZreFBxYVFyc0ZKU2Vp?=
 =?utf-8?B?aGtrQ1FsdHBFK0NsSE13SVcyaTBRYTduU3BqUWFVMUZkN0doc0JiQkJKa3lj?=
 =?utf-8?B?S00zYzRtOEpaZzNkb25sdDBFTmhZM21XNUNCMmVBazZyTERRUVlHT0E0TlJl?=
 =?utf-8?B?eEcwZDJtb1E2clBOY3VYaTBPTXFwVSt2c3ZqNmU3OEpiOEZwTHN5T2JwQ1By?=
 =?utf-8?B?TzdNV3F0blduNTFuTGZyZTNnS21CNFZaUktRT2NLWW1icTZ6eXhHZlFDV3JD?=
 =?utf-8?B?a0VoMXQwVVBjc1RlNVlxOGtRcTNqVlRlbXNGZWFkTTFnenpUSzRxRzRwcXZl?=
 =?utf-8?B?NE4wSERKcE5ONjFCSkVKRE1TSkpjR1FFWTNlQXlsOW5IMHJ5c2N3VFpwekFB?=
 =?utf-8?B?cGdaQmhidTNWd01EdllwcVRqeFV6eWs3MVUycHZPYk1KRlkwbFF3Myt6OUR3?=
 =?utf-8?B?VGNtaW5PczRDRU1Jd0dBMjJmSC9Mb0huWlAzYlBEZ0pDdi95b04zRHM1aGsx?=
 =?utf-8?B?YWlsWmRaU3BFZzU2MTFkZGF3WFhNOW9TaXdVaVJQVmwvTWUxdTZaTzlwMUVq?=
 =?utf-8?B?SVJ0SHJuSThZMTUxblJJRGhsNm5xNkhIaUpmYW5iMlhwNE5VYUh6eTc5cThv?=
 =?utf-8?B?azVnUXVKeVJYYjF3dVBLeTBaRzFIRW9WWThhZTlUMDhHbkZUY1Z3ZHFKL1pI?=
 =?utf-8?B?NDBTSDlSdHZxRVRaQTlMMDdUVmdPSDdEMjBsTXdyZy9PWis5ZlRia2FkRVlk?=
 =?utf-8?B?KzJGOVhvcWRPNXdnRnEzRzZJZE81ck11NFpGK2VpcnllNEZCWkM2UXB1cGw5?=
 =?utf-8?B?bjNUVkRwcFUwSFQ5eWkydk10cFc4VkZJWWhVUnpGVjFwNnRIRlF6bHNsdkxt?=
 =?utf-8?B?a0dZMnc0QXhqZ3I5U2JWVStpYmJvcFJPc01ma0tNOXdJengySHdmU1grWGJq?=
 =?utf-8?B?T0FzdWhiTEREU2t2Wmx4TVk0M1ZWbk9BZTlhczh0U09YWmh3K0NWdkljckxC?=
 =?utf-8?B?Ykk5UGRGYTZ1R2MxNVU0M04vNkhieGRNT0JqQmI5d2paV1Q4YnRQc0F0N09v?=
 =?utf-8?B?M3FBQ3pWZnl0Z01zMWhjcFhMTTR1Tk9CMmlDS1pFZ1R5aDZ4bkJ6YitIREYy?=
 =?utf-8?B?UkNNUWViZ3p4NmdRaERhdmNTSjdZMlN6dCs5Q2JLSmpHRllPek5tZ3RqV0hB?=
 =?utf-8?B?d0ZZa0NGSkdQcTdXRjBZMGJ4bEVIV2lIUEtNbVJEajRjUXB0R2hTTVdyM21k?=
 =?utf-8?B?KzVxSksyQUMvWUlqMHJKYTJyOUdaeXE1d0l0amNNV3NPSVRZdmtNY28xTFNr?=
 =?utf-8?B?U3VCRkZDcU5OeXU2TUtwNVg0SHIyckk0enllQ2NsY0NZNklFRTJPSmxFbGNt?=
 =?utf-8?B?NXBUSFd4ZWpiNmJNdDNOZGlxdjhQMEZkdmEyT0xDaHRPSmRkQnBkMW9RL2p5?=
 =?utf-8?B?VjI4NXZUb3lrK3dRWXN0a0NpQm4xalpwNUNqRVp3SDBqNHBVa0dIczVJZVRM?=
 =?utf-8?B?WFVKVUJEckFqTkc4MElTQ3FFa0gya29kU2taS1lZRDVMVmcwUUFkR2ZCbGxM?=
 =?utf-8?B?TkExcXNtUWhBZGIydm9pZlhYcUs1Rlc0cmw2OG51Nlk4Vnd3WlZrNHF4enVB?=
 =?utf-8?B?WFhDQ01wZkIzYkdXWUcwVzR6RTM3THRhYWcrS1k0Sy9TSThkLzZ5ekhrUVZy?=
 =?utf-8?B?UzN2R1VZTTdyS2dXNDVlUSt5L0xDMVR0R0NsdFNkaExkQnRUeTRQajJockIw?=
 =?utf-8?B?ckVEb0xuZk5IbWRkSTlIS3FmWVloblZMeVFFZ2pPYjhqZHJNZmhDSllrWTI4?=
 =?utf-8?B?c24zaERHYXVNOHozQ3VpR056Ym8rOGxpVGJWb0FpbmJ3a3FMTEc0eU55Q3Q5?=
 =?utf-8?B?ZnMxT1RoNFBvK1ZpNVdtcUFvMTQ0YjlRYVZTYW5rQjlhSlpEcnFOd2Z6MkxW?=
 =?utf-8?B?UThjaEMxUDRQTG8xQW8yR1pmZEJCZTR2YnoybTF6UHdLLzZWRG9EVHdldGp3?=
 =?utf-8?B?cVFBYytiMVp2QVZrcm53UXg0aTA4dzVlQ3l6Tm9GamxnNFVpTlJ3UEJCNUxx?=
 =?utf-8?B?L0ZjRHdsWHRhb2FuRzBwUEJtTHBYUzBJbHRyYWZaUzJMb0M5REZMMXppZlBi?=
 =?utf-8?Q?MRG8FYJ6mtxD7ASeawWd8JoyW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aadd132-f41d-4be6-c2e1-08dbb292775a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 06:43:54.1733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zLG+M3/OyhyipWTSyVJf557iRphWGVqd224Efkr4Q5eR+el6y1W1djjlSGJAb1gxlTe/9jREJqdVcHuGq1dVCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9963

On 08.09.2023 17:09, Nicola Vetrini wrote:
> On 08/09/2023 16:53, Nicola Vetrini wrote:
>> On 08/09/2023 13:59, Jan Beulich wrote:
>>> On 08.09.2023 13:57, Jan Beulich wrote:
>>>> On 08.09.2023 10:48, Nicola Vetrini wrote:
>>>>> There is a build error due to -Werror because of a pointer 
>>>>> comparison at
>>>>> line 469 of common/numa.c:
>>>>> i = min(PADDR_BITS, BITS_PER_LONG - 1);
>>>>> where
>>>>> #define PADDR_BITS              52
>>>>>
>>>>> I guess PADDR_BITS can become unsigned or gain a cast
>>>>
>>>> While generally converting constants to unsigned comes with a certain
>>>> risk, I think for this (and its siblings) this ought to be okay. As 
>>>> to
>>>> the alternative of a cast - before considering that, please consider
>>>> e.g. adding 0u (as we do elsewhere in the code base to deal with such
>>>> cases).
>>>
>>> And just after sending I realized that this would still be disliked by
>>> Misra's type system. (Much like then aiui the 1 above will need to
>>> become 1u. Which is all pretty horrible.)
>>
>> I have a proposal: in our tests we enabled an ECLAIR configuration
>> that allows to bypass the
>> constraint imposed by Rule 10.4 that warrants the 1U iff the value is
>> constant and both types
>> can represent it correctly (in this case BITS_PER_LONG -1). This would
>> allow using the proposed
>> solution and documenting why it's ok not to respect R10.4. What do you 
>> think?

I'd definitely prefer us using such a model, yes.

> And perhaps also use min_t instead of min, so that the typecheck can be 
> avoided.

Already the wording you use suggests a problem: min() is using a type check
for a reason (and that check is actually guaranteeing that some other of
the Misra rules isn't violated, aiui), so we would better not try to "avoid"
its use. There are certainly rare cases where using min() / max() would be
unwieldy, hence why we have min_t() / max_t(), but imo wherever reasonably
possible we ought to use the type-checking variants.

Jan

