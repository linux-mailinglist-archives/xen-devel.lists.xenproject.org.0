Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53904603A2F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 08:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425516.673386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol2zF-0004dp-7s; Wed, 19 Oct 2022 06:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425516.673386; Wed, 19 Oct 2022 06:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol2zF-0004aP-4R; Wed, 19 Oct 2022 06:55:33 +0000
Received: by outflank-mailman (input) for mailman id 425516;
 Wed, 19 Oct 2022 06:55:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=illN=2U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ol2zD-0004aH-2n
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 06:55:31 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2065.outbound.protection.outlook.com [40.107.105.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04d256df-4f7b-11ed-8fd0-01056ac49cbb;
 Wed, 19 Oct 2022 08:55:30 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9094.eurprd04.prod.outlook.com (2603:10a6:20b:445::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Wed, 19 Oct
 2022 06:55:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 06:55:28 +0000
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
X-Inumbo-ID: 04d256df-4f7b-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IlxLUa/naAtdjqpzFY10N+MYEX/hTkqOhUYSDaiC1tYnxJ5l8qvkmwRWXknXpYKGKSyRSWG8xmD444EhXFtyGE43ywypyfR92h3cFRHHDJW9FMBdfzx7iHiP+8dFNvnh305lol4k3Vv4TCEXwtjqAWJR46i+iyqCMshxed6UCwXcYyWTq0VgAlOGmlR9KFWKYb+CSaIdtnka4A8Y+sLEs2KSaM4mxdPIZGax+9yrLPGE23ONRheYisv7hp41X5hf4zSMGGycQzqwyAlEYFnBJYeZ6lt3oHHF2NNRUi2bYyM+1un3wpzfDFsVCp4uivbAvWHMQC2T1XCKDjzlod4Zgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJgE8w/judukBxWXoRVGDNHZ5U7gAKDQRqwYYFOvqag=;
 b=WmnW4ogb49uPf6Lu3ZwUICrkKaOGNKT00dvyTmTWu6DQWmort3okonFaNWPiBym97mQw97GdHssWszuOxIJF8fh1PPdCQf+unZVZQl7PtKnH0AZBD/Q5FetjjLyEyCPnqml0ae4e6osfST1vM+zKqPsB54MmAgII2GKNnoy1PqefcR5Vqyv5m60iqcPJgAViOIZ06FhnLgHCzGpuslp3KATqDuDU5WUorQsEG5J/woqu5pMU44jWEjTq4lTOeCQZL0whxh+Pfrd+q3S54SQ9+n4eJSXMrkEjs+dWnF+wh/dfGP1etUJj5R9T3YHwJy6DF6NRzEDCLhz5N9d2Q/n4Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJgE8w/judukBxWXoRVGDNHZ5U7gAKDQRqwYYFOvqag=;
 b=Div9StNNwr43nmgENR9A+nvLe4v88yqgHKWF0zAsW7oWwMKNrE2B0uXG32GoIQPtNwIZZqp5C1ZHcV2R1/clElDd4hUfIAEXBTrNDFpcwuJBmn84tCSDeNs963TzMDpzk2lbmZ1hBKI0bEWliy3Dyn4sUxxffYDMNxk5nd2Tu2OedwwB4d9IhRX2Ri4clC05pahVb5jAuQJQUY2YgSXJj2UtkGSX5Lqn07hqC7KojQ6c+4NAWJIsKGl2fQAaqh796wS3EJSM6/VUbRofxudMXOQfCx7g1Wo+6CTc+KYCGD5I3NcRga2LaQK/borqICwDnrhl78L1iVjw9vIwBXokww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aa6ada50-8eb5-49b1-3e16-a3347ef55f2f@suse.com>
Date: Wed, 19 Oct 2022 08:55:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v6 2/6] xen/x86: move generically usable NUMA code from
 x86 to common
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Chen <Wei.Chen@arm.com>
References: <20221011111708.1272985-1-wei.chen@arm.com>
 <20221011111708.1272985-3-wei.chen@arm.com>
 <039ba141-766b-a7ea-2124-be396e8433f2@suse.com>
 <AS8PR08MB79911F3700C0619BA1DA34DE922B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB79911F3700C0619BA1DA34DE922B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::24) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9094:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cd22e7f-6fef-456f-e0bc-08dab19ee7d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uLHE+LUwIr/3Q3/RNQu5/9WYEuE4PRBPQLgQUWQutpDipdkt78MjqMLtK1g4Ii/Eu3dOgb8fch12C7yyU5sBcZWxTxW3SyU8A1JX3ebbhPiF2FBgHmZujy2JVq3X+uWy1G8dnD2XwVVSW7dOrStOB3wHZQJjgGZ1WftyiAd7flW80YZZwU1o/u8qwMLXJnjc22GzjLqhwNGyxwJorGFgWJhRZ2VkVNb+HTdq6a/nZZWX2xkZ/RQQPGHKI2bepPAPachfRMWV7HMxPfp+pSRgiUSvrhkp0EOxEebWGLhGWgD/NyGMakaGMkT+a6p7+sKmRwww/o/Ik1We1DdOfkE5Z4eP0dNhhX3PBEJZ/aLj5K8tBQnuByQhVRDF0vnB/MynenO6Ar/ujDhOHS4GlcpkVgTPVgU0ujVGG/f0/m5ilerMh/R3J0PmSOxYzkib6AXF9HHTMSjF8T9yKTKaLEMWl3kq2oYKvhIPVPqUyZaB8bMuc04BuH1E/0+uFYj7PONmSZjYfDZfKLVatI1z2AP8FqyzMCEXBXQh13ah3WtxlzT5O1IFrzHff7WZOhvKVGc1EKoSahNlXrGRA2znIRoi4deVpKJa5JtoT6ImGqz1cVzI43LHwEptoLaRXFWL2kB7tzC6USshZH7q7KdzH+yj17W49XYbRMdBWSvQSbZsbsix/gNJJSvyQ0JjYUgqSC/W+YhnnLGiv/jnGtzZJAJIreGgsaUc3ZihlEJTnRtlBpQZHvp/Omgyynl7aePk0kRd5FWGaP6MJPP8dYN+ezf+lsnMVONzoHVA2chzdT/XwV4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(136003)(39860400002)(366004)(376002)(451199015)(66476007)(8676002)(4326008)(31696002)(66556008)(66946007)(38100700002)(316002)(2906002)(5660300002)(41300700001)(6512007)(8936002)(26005)(2616005)(6916009)(6506007)(478600001)(54906003)(6486002)(86362001)(186003)(83380400001)(6666004)(53546011)(7416002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2FqWWtNTlYzQVJmU3Z3cDNOelgwYXAxSkgvaitZQUJOMmRYUWwwNzNYd0JF?=
 =?utf-8?B?Z2xEMW9MNHJpSS9EZHNoaC9PL0s3N1MrNVpOUUdUVWJhK0Y1TWVLaldOeWNS?=
 =?utf-8?B?YnhIVkgrbGpIOGdjbGUyQnRIcGRIYlVXaVI5R09qb3FMcmNnSmp2M0w4d1NH?=
 =?utf-8?B?UzFHRXpMZW9NeHdvRlRlNjlDeU5rbHd0MnhPRVlWMVl6SVZiSVNWTmFRSGt1?=
 =?utf-8?B?NDE3dndxSTJYTmhkT0YvclRwanhUSklnaGFFbVVWMWxtU3R0SGQrU1hHSURW?=
 =?utf-8?B?QnJoYjY5K3RyN09KaEw3TzJkUGpHMlJJSnkzTlgyazNjVVBTZDRuVmlPbUgw?=
 =?utf-8?B?RkxSMzJQVldnWUtadmZIb1VsV25QUkE4TCs0cVI1Vkx3OGN6cUdHSldoWEJn?=
 =?utf-8?B?RmNmK3QwWkYybU9zcnhOR3dhSjRxTTVzdjhsR1RpR3BlU05WWmhXM1dPaXor?=
 =?utf-8?B?bklRZStnTHBxM0tZMnRjdTcwTEU4M0RYNE0wNHFjUzFjOVVSQ1VUVk95UW9V?=
 =?utf-8?B?eGl6b3pKbk9uNFYwRkdNL1J0dHMrSlZOcW5pQUx2RndmZnNGU2V4N2szYXNW?=
 =?utf-8?B?a3VMWmd3SjV2WlVSVlU5S3M5K1B3cTE2ek1hTXJ6RVVlZy9jTzRaMEh4NW1z?=
 =?utf-8?B?T0ZuMU1tenpNcnR3d3dpalR5dTFEclp0VUFJRE1jbFJwSDNyRWQycEc1cWUr?=
 =?utf-8?B?V1k4WDRNNTRIaGdzaHIweHZwMmcyTmk3MHUzdXdtVUliK0JnWUVWd01CUmN3?=
 =?utf-8?B?alJsekpPSjdNd2FBaXg0OXBZK1pHaXNRcGE0bEwzWGlPWWN4RXJidkRSZlhH?=
 =?utf-8?B?UU5TaGExejlkYU0wdEFxVEdMbk9PUytyRWZsN21IKzVQbVpmTEMrcE1BeG1j?=
 =?utf-8?B?UkNuWEZNU3p0Ym1ndFZnQWJScFBDQms3VnprZ2Nkbmp3U0I3SkFvMzZNWlN3?=
 =?utf-8?B?dEpZK29ZL1pLNW9NNHhTMkJYdHc4aHFvNENRMjZGenFaMENleS8xYS9xUUZZ?=
 =?utf-8?B?Z1F1WjRvaDlmTFVqV1czc2x0SERma292M0hDL1JBVDgxS0VRdjRtaFNXWnBG?=
 =?utf-8?B?a25qMllzc0tBQ2tDTEE2Sko1Si9JWGptUUJsajlaamltTVU3OWFRQU40N0x3?=
 =?utf-8?B?TzdFRUljNElYRktqRHc1RXFZaWpZeHpMQmtmc2xKWWVNeExidzNaWkRaU25a?=
 =?utf-8?B?UHp3ZTZwVXBVUGZsUnZPRVRMeXUwY1Fkc1RraFJCWEw1UTlpdlc2ZDkvV25l?=
 =?utf-8?B?emVZUlAxbnNaWkNXWmxQM2lJUmNCMDNTUmZjWlJVczFENm9RT05JY3ZKdmNq?=
 =?utf-8?B?dGpKalJncHJpa0VOTVBjVVdpYUhSWkVkS0t2aXdoMkRXZXhXSExzQnFsUU42?=
 =?utf-8?B?bDlFR2NQTVY2SU8wcGk1ZEFMSkxUKzhHZ0Y3cTZhMThlY1lVSUEyUWVCUmRI?=
 =?utf-8?B?UEIyaVZiUXRidTh5ZjVQTitPRHRROHJBTERlTUtVZWpzQ0h4bEFMUFVDbG5G?=
 =?utf-8?B?aUZlck9jTWkydVI0bEt6MHF1VTkrY2cxbUpCNjF5T2lmdnNobVh6cVdqeUNO?=
 =?utf-8?B?VEdhaEJMQnlGU1JUcmxGREY1WkM0UC9jbFUybUI4SVpvYU0zNWRWdW9vRmtN?=
 =?utf-8?B?YmhoUEo5UmRhLzJYTlA2NkdXVkJjYTR0THFPVjFXNnJHbkEzQ0N3VWZZR1BN?=
 =?utf-8?B?d2V2a3FBNlFjTHJ1OHR3MGUycUhxSWJ6VDA2K0I0MXJRSFk5cGxOZlZvRlZw?=
 =?utf-8?B?SHRHdy9RbXY2eDNobVYwSWJ5R3NQSUh5T3ZlMDdJUHFDUWZndnNzbmd4NXJ6?=
 =?utf-8?B?RzhNbzZrMXZUMlpFaC9lTlhjYk55N2dWZmo3Z3Ezc1dRNlQ2VFBPa2dseVh2?=
 =?utf-8?B?amswT0dqekxyNUJDWnh0K0E2VnU2S1MzSTlCaElJa2lYQmU2VkROY0F5T3p2?=
 =?utf-8?B?VTNaY00xdzB1T1JHK2VQMDBNSzhVRmFtYXBhenV2eFNBNjBBZUNObDNkM2My?=
 =?utf-8?B?cXIwWVhmYjZyUnBQaFRGclBpdytZNDJJanhIZnRYV1BramZOVFM0QkJISVpu?=
 =?utf-8?B?MTBjbzcyZUNqV09wUmV2YXYyMlB6dnFKQmVUVk9BQW5xdjQ4OVdXc3NRZHg5?=
 =?utf-8?Q?UBeErvKI2ZSpe54crw+V0/9W4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd22e7f-6fef-456f-e0bc-08dab19ee7d0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 06:55:27.9771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iya28X7RjTF+xGf9rEP+6xRubfZYTZ7kc98z58N+/WlqtIhDNRiWG/U8DuM5lGMlYNguog9XxBCpdbC3f2dzhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9094

On 19.10.2022 08:50, Henry Wang wrote:
>> -----Original Message-----
>> Subject: Re: [PATCH v6 2/6] xen/x86: move generically usable NUMA code
>> from x86 to common
>>
>> On 11.10.2022 13:17, Wei Chen wrote:
>>> v5 -> v6:
>>>  1. Replace numa_scan_node to numa_process_nodes in commit log.
>>>  2. Limit the scope of page_num_node, vnuma and page of numa_setup
>>>     function.
>>>  3. Use memset to init page_num_node instead of for_each_online_node.
>>>  4. Use %u instead of %d for nodeid_t and j in numa_setup print
>>>     messages.
>>
>> The only instances of nodeid_t typed variable uses that I was able to
>> find are in dump_numa(). I guess you can leave them that way, but
>> strictly speaking %u isn't correct to use for nodeid_t (as it promotes
>> to int, not to unsigned int).
> 
> Sorry for suddenly jumping into the discussion. Firstly thanks Jan for
> the review :))
> 
> I am a little bit confused here, nodeid_t is defined as:
> typedef u8 nodeid_t;
> 
> so I think here %u should be probably fine (I may have missed
> something though)?

%u is indeed "probably fine" (hence me saying that they can be left that
way), but from a strict language perspective it isn't: unsigned types
more narrow than "int" promote to "int", not "unsigned int" (and type
promotion kicks in when passing arguments to functions where only
ellipsis is specified, i.e. parameter type information isn't available).

Jan

