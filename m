Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 757ED5737C4
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 15:44:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366602.597537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBceo-0004KP-7k; Wed, 13 Jul 2022 13:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366602.597537; Wed, 13 Jul 2022 13:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBceo-0004H1-4L; Wed, 13 Jul 2022 13:44:02 +0000
Received: by outflank-mailman (input) for mailman id 366602;
 Wed, 13 Jul 2022 13:44:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XN81=XS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBcen-0004Gv-91
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 13:44:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2048.outbound.protection.outlook.com [40.107.21.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d95ac7a6-02b1-11ed-bd2d-47488cf2e6aa;
 Wed, 13 Jul 2022 15:44:00 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5332.eurprd04.prod.outlook.com (2603:10a6:208:61::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Wed, 13 Jul
 2022 13:43:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Wed, 13 Jul 2022
 13:43:57 +0000
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
X-Inumbo-ID: d95ac7a6-02b1-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HvNwdMZu+hEHKWDwCY+of8IJtECOoUf7e+kOL9mYwjn63PoY1n1csqC/FiX1kbOJiPnfFHE/W/kqKFsTYNSKm3NEsI3RJgHVXgSSMMK0Pa2y4NHzcCb7PKjdYyXfVpT+vPJq7NBX0RYajn5FAka2ed1yNDZ/8Iv0WMIC9IMIDLU9c2i2DYDYvcdjV3EqGvYwMTYn+X0d8vVVGi+GXciStFLm4qo0tyX0yFgO6K70VQASk6YrF1fSyUGNJkQzBgL81TajY2srqBzoSGM/Ktc7KLt8HWlBgvQVUC/eZNuK+bEvjzaJhR1xeCuRXKXx7FAY+vLnMfAjkoL//3w7M/PGww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apLZ7A4dBGVtT0G2VX81kmlDBasKgsOC2GGKrwnukqQ=;
 b=OkkZh5Nad95xqb0A+HOZgvLbXJtjplnxYe61C1eHxvALLZxUxWtShou6pnqghyz/8fwQjmkdtadWD84q3OTO8Gvx3wBR9PXBOhJOGqu2FXdljg3tKyRiqQkPBbkEFcgEmjl6stZVQwt3v/mRivSUnRjtk/FUwoHW7IjI+iPBtbAUFLRidFQTT4vn6KmFIiP9WFXPZREW6OUOV64Z3mtLBEJ/DCDMffcFOdDIREp885/vdj4z0EpDno5i3J/OJ67Xd3mV4rIB4KrofHAtabGpm2/WOUd68+bbRm5otQqOTdIw741QTSqLfURFlPWPyWT72++HTALOPGAx7e7k61Du6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apLZ7A4dBGVtT0G2VX81kmlDBasKgsOC2GGKrwnukqQ=;
 b=VtS1TRg3dHebjGWTmQ/+/zaIb+XUSuicPG+gkjMWdW5Wu3ZQ2ObxsK+gU5YI6oIIv9hCOANGUGc7bymzOqJb+u9z2Xt9dLyYkGERnm982jUNHEsezCMTpG4JBWg9Bo/L8QGOxVMTVsr3wvoFKQCbfEf/0wg8Vsf57ZD5E4s9AbY2XKQPS5D4b7W5Zdl2z0DLMCQHorAB1dePPekE3EAmN5jFpAAWIxLZMLIF+xNHNgatv516s/DFx/MKPdqexzas/VaHfGMRZT8FYE/K4PA6COJvbFMifkb+zfhNLSvpHa/7s0IRsDXuShalhfB2Fu4Y4dYHa2QWDUt+VWSh3nyGIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6df15012-bee9-46b1-8583-be193c7330ea@suse.com>
Date: Wed, 13 Jul 2022 15:43:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 5/9] xen/x86: use arch_get_memory_map to get
 information from E820 map
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-6-wei.chen@arm.com>
 <b42ac0ce-4f5a-9113-57b0-d85d37bdc65d@suse.com>
 <PAXPR08MB7420A2F6592E9D869789FCF49E899@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB7420A2F6592E9D869789FCF49E899@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM7PR02CA0024.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::34) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a953256-43b6-4b85-bf4b-08da64d5bc26
X-MS-TrafficTypeDiagnostic: AM0PR04MB5332:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p0AEwKZ1nWWCD0w8qxUxxmk2hYYQJ8Q1NiRAHtpWXsItNgwKJxzbP24sZIuQtlL7wnSdFci73yOtuXr6pQ3pn4QDKfSs/QgUvkYH+HcqEci1yttTDOfg/VabVjw/OgsCffvygBOnPRK9N7Wjudgr3LAcTDsOlTi89hmRmaNt7p2BY8xqQvRiwTib0jNVRBtW9XFdGtJjyfUcWWfI4yRWnXJKX2wsSjykqSSg9gqX4P9JC04Gt4PLGYnZUnhfHTAiYcdB4B5WEkZDMMh1HqqQodTob3dSPDnq7cRd34zcbpQtrK6CaaMjUFIl47hZJ/54kLv+tY3pDlCBswIArDGAvtYAXmFKdSENFy8+dtKeQOfQ5brJB56bjJGeLmP6ssy/tpyo+yAEOL1o3wXoz0EVl8W91FEnJDeuEt5jcZhGHAj5jPzJVqYB+cd1dpfXeCEqPFSlzo71POsRTq4awfMI47bjC+F/yYnIXw2i967xIVqmROhgWPeaSsET9Dav28CRhUjXxENa8jxfnHArk/fZZ7cx6qI8ksweBPEpkt9xkdf0Xuzt1MHH32LGPjKUinLdqu8/FKXNrzX6/+4tqYh4EASwV3ZiEwjlcnTJqjjxf6CoFjQvOo7hTSI/GXPSwXUnbrvx1ezVx5tWGa23ynYAJKXoISQPxo4cmVUqaWwMFULGawc5cNBNaRPJ3DKnhElQF9EO6LyqqSxWTYSL8wKPiXRCocLnk0XA4WAToc7mC0CWmhON44rsWEgSRY34m3qu1WVK2jLPliiuY+IJouRGuTpeymBUYrh6SVBzVdyNig+G2OzbTzWERicfHbggGEg2SGrb/sUf1Hj89Ti/zIAskDtR6ZybBqp2IMobcvMiCFY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(376002)(346002)(366004)(396003)(6506007)(26005)(54906003)(4744005)(6512007)(86362001)(6862004)(41300700001)(2906002)(38100700002)(8936002)(5660300002)(36756003)(8676002)(31686004)(186003)(66556008)(66946007)(478600001)(4326008)(66476007)(316002)(53546011)(6486002)(2616005)(6666004)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzBuM3NDSUttdjM1S2NqNkI2eUsvU05aTjFPQnlTMDgvdEF2VWFrOHBsV3dB?=
 =?utf-8?B?VGZ1WUdXU0h1aG5rZ3YxSVZQSkYxcXhqUE53Y211Wlh5TURNdjhHeEJPVTZ3?=
 =?utf-8?B?dC9aTU1GamxPWWI3cDhqckw5R3I5TGdLMG8rSVlZN3ZZb2wxVHlMUlFIUmdv?=
 =?utf-8?B?MS9lM3ZmNHZ6Q0hpTDNObUdYbkVaREpKSEpYbXJYbU5Eek91czkvRG5razBq?=
 =?utf-8?B?TmJ2QXhSeEppVlpwbDg3MFEwb1NjaE9Tc0VvTXV3c0xydEJWaWpoc0dXWXFw?=
 =?utf-8?B?cG54bFRMQ1JXU0xxMWJZR29KRnFKTVBROTB3WTQvZ2lKcTd3ODZKRWpBTncx?=
 =?utf-8?B?SUtnTzRKTDYyem9vWGdlVXRnY2g3bFNiWTBCZGY3RzFSUEpacFh2SjlwMDFl?=
 =?utf-8?B?MVJKb2ZSTHluK0hrbG9sTzVhRS9kdUVSSEtBbC9JZFZ3NjFSWjZCOUdNSVVh?=
 =?utf-8?B?cUErc2ZVMXpHend2N0oxb0xXMjVxcDlBRStrWXh0MUpkZTBjWEFEbGY1MVJV?=
 =?utf-8?B?RXNtMmk5akU5RXhabCt2WWdEcmlUOXVqVU9mSFdLUlZCUGsyZURrWDBMcjhU?=
 =?utf-8?B?ZE5IN1F4RWszNThtRlBvNGdrOHR6RmlUVkNuUDFWOTN5MGRkUTlQelVMZ1Nh?=
 =?utf-8?B?NytiQ2ZnWFpOQkpEWEFBenJueU81UHJjQ20vbGJKcFAva0JHRUY0OTlCYlBN?=
 =?utf-8?B?dGpLeFNyckJoN1d4RXVqS2kvUlpyME9iUWhFZk93K1FwdUFVWkIxSXNxdGtP?=
 =?utf-8?B?THlydmdMMUhodStXM21iVVZQOU5lYUlrWUZZN1picGZ0MmE4QkhpL1VIbnpF?=
 =?utf-8?B?U1RwSnFKSHk1cHl6WUhJYVRjQWFGdGZtUU9ZVVhwdlBkS1Q3Q2FUVElkNE1K?=
 =?utf-8?B?ZHdTQ2NFUVZ1VWpET2NSUVBSVjlOSDhWR2ZUN2UrTXFLYXJPb1VQY3FtNk1V?=
 =?utf-8?B?eGM5NnRmVExHMFY5alNZTVNXNFdaY1NDOE1QLzN6T3Q0SjJlTjBsdXR1bURj?=
 =?utf-8?B?U0JieldBdmxVRTc1T1IvWmRzSU9wZ1E5TmhmVy81OXZPVDErckUxejdwTlhN?=
 =?utf-8?B?aGhkOFZJWGF4TUNoaUJORWwvZTlPbi95bWIza0hpR2I5cXBoN2hYeW9YUkxt?=
 =?utf-8?B?R0lJdzl1RGN2QjFucURjclZOZXptdzhnQVZDeHlaTXpBS2xON0ZpcTRoT1BQ?=
 =?utf-8?B?SW9tNG5JV1BHNE5hSnNEaDF1aThtZHphVlh0UmV5UnBpRTBXUnZESGZHZ3lx?=
 =?utf-8?B?ZGY2ZTJKL2hha2tqSGp4ZEgvM2l3ajR4ejhzeDFjaVNhcnV2amZJZitmdWha?=
 =?utf-8?B?WndTMEx1YytnaGhha2ZmQ2pOeGowd2xSU3ZBbWdyVUFHWkFjUHp5RjFKeDhw?=
 =?utf-8?B?RFRKL2NhcnBDL3NYaGhmSWpXa1ZWdzljNnAzblhQeXBueEw1ZzV1ZkZxR0Fz?=
 =?utf-8?B?Z2lyNmFnQXVMRG1EazI4ZXprYVU4djNNNkNUYnQ4cjczR05HVTExTndkeFpS?=
 =?utf-8?B?TGVCQWJiUWZJNTRNYWRVQXFQQjVxZHpDWGw0cVlsVVh5MmxwYnhXcVBJMHRm?=
 =?utf-8?B?Z1l3SitvQmY5cWVOZzY0Wkw3U0p4enltWlVhY09ZUWRFVSt6UGhLUHArOXp1?=
 =?utf-8?B?S3JJZlIxL0pRRnNHNmk1WStiM2xlMWtyQ2Y5SnFpUGpVeGdOTWJwU0puM3lG?=
 =?utf-8?B?N2ljRDRRKzBZd2dxY1kyMm9sQXVoMDcydkNxVStnNFpqK0Z6Q3ppL1NvK3ZJ?=
 =?utf-8?B?Z21ycWg4YlN0VkxpSkJqeitrMy9OQlU1alNNV1VIS1l4NmVlTVg2RmM0TkFs?=
 =?utf-8?B?eU1KNjc5aTRqZ2xDR1kvUWlCYVB6MXNNTHB3U1RqcVJMM0NzZ1N4ZS91QnRr?=
 =?utf-8?B?NlZ5Qkp2UFFQbUhkTzExb2tZTFIrRXpEMTFCSktoZmJVQmlYSXBObG52N2lJ?=
 =?utf-8?B?OCtzRGJHYjVQV1ZPMXlwY3BheG5kd0pLd1UwR2dHRHhOaTlieGU2aGxMZXBw?=
 =?utf-8?B?dlkvNjNrc0hhNm9NOC9NNWFyRlVmQldOV2VkUEsyK200TkoyWHFOODhOa0p1?=
 =?utf-8?B?eWY3d3ZBS01vdjVBREQrbDB0TTRydG1GeE56R3piSkJ4dlE2NW9UYm1WYmVG?=
 =?utf-8?Q?SrywOCmsgWTkJ7ny9Fj13RMhE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a953256-43b6-4b85-bf4b-08da64d5bc26
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 13:43:57.5532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bPOQ6/UaorEa6oW6jr4qtykKh2HeK2t3lNySY3gO2vGNP3Er6mX6KgEDflp+k5QwTyvUJXFKio0xUl5z4iVpxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5332

On 13.07.2022 12:37, Wei Chen wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022年7月12日 21:40
>>
>> On 08.07.2022 16:54, Wei Chen wrote:
>>> @@ -82,3 +83,25 @@ unsigned int __init arch_get_dma_bitsize(void)
>>>                   flsl(node_start_pfn(node) + node_spanned_pages(node) /
>> 4 - 1)
>>>                   + PAGE_SHIFT, 32);
>>>  }
>>> +
>>> +/*
>>> + * This function provides the ability for caller to get one RAM entry
>>> + * from architectural memory map by index.
>>> + *
>>> + * This function will return zero if it can return a proper RAM entry.
>>> + * otherwise it will return -ENODEV for out of scope index, or return
>>> + * -EINVAL for non-RAM type memory entry.
>>> + */
>>
>> I think the comment also wants to spell out that the range is
>> exclusive at the end (assuming that's suitable for Arm; else now
>> would perhaps be the time to change it).
>>
> 
> Did you mean we have to mention the range is [star, end)?
> If yes, I will add related comment.

Yes (worded one way or another).

Jan

