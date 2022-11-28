Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B12D63A845
	for <lists+xen-devel@lfdr.de>; Mon, 28 Nov 2022 13:27:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448904.705478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozdD8-0001L3-Tc; Mon, 28 Nov 2022 12:26:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448904.705478; Mon, 28 Nov 2022 12:26:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozdD8-0001IK-Qi; Mon, 28 Nov 2022 12:26:10 +0000
Received: by outflank-mailman (input) for mailman id 448904;
 Mon, 28 Nov 2022 12:26:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Emon=34=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ozdD7-0001IE-FI
 for xen-devel@lists.xenproject.org; Mon, 28 Nov 2022 12:26:09 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4cbabda-6f17-11ed-91b6-6bf2151ebd3b;
 Mon, 28 Nov 2022 13:26:06 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7652.eurprd04.prod.outlook.com (2603:10a6:20b:285::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Mon, 28 Nov
 2022 12:26:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 12:26:05 +0000
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
X-Inumbo-ID: d4cbabda-6f17-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IumXXaJuvLPJz7iC47EfVr8769kEj2bx1wEFiz85znb3hJnyKk/aIYjQEsRq9ql4txlcLZj0ndw2+n+zbuluGy0ZEuoOcQCmozdgMUjYDRXhFBg1iyKbD7cd8chWylLoWD+TBtHN8a1XskB5q+jS6jSCZ+a8GhgXkpz9O/6aQ2yxSX89wJg2bzLUI2i/Z7OTtHZFrtDQuZ4AmzTnIx5tEjLr88+6Cxu05bDe7JwekaEQxzZCAby7lTVsXQdD1weMb/GEDiUK3zx0FT9Jtz7/nXYvsLMH5zls/BQ/AdPG1enDctTpJ3DcbShh6HoxwNz+vMOGmAMbIbS9aKouTTkPVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlZuMzQLGditnpPksVUQOp27+Utz9sSvY1bMDqLL+dc=;
 b=kzuvL9wLcZXwhnVed3iYt2rciFdGmiEu0uOEWf9FgRNFV50HVaEhsudPz0kMjbORfEJr//3HbCbp1UQv5/a5qQ1nL0NxmSfP26AYUAIWl6zBpWW2EvD/4ZM1P2TfWTAVW1quggoFTHlg+vlw2L20Gl2AV0Jy4z35G+uGDVRBhZtQp70TgHwmvCENT1vOMLR2YHe7nNa/BV5O0A4HVjnqBs5H3lTX1N1vBQu5CAJqWG2ltmgk5Ny4Ix+MD7E0TEA7Y80fMa2F+mq9ImnYMYpK9F5D1fsUTtM2bUU98bIMLqhLSlvRU0wmVLqWArYpVAvyBUGrNw2XVMp2N4u7OZ8TJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlZuMzQLGditnpPksVUQOp27+Utz9sSvY1bMDqLL+dc=;
 b=0ZnJA9kH9ZnzouPrK2JZ6ZgCRwrPq/VAEb4jMSQfrkWeMEPtgUgWV0C0Z4a0B7Fm6UpErtHylWNumimElob+0ctIJJfEtyc5D+WrZ3UKqr+D27aPPxcI2DcPzLwj/QsF4LpJCIey6UsOUqc0X8j4ts4+KFuS89a3GGQ+ko7eZ0+gvtB5x9m9xzLqWJznVORDsgmBYdtsZJGZQB8JNo/nUxHls+075lHvwlxzkzWJ57kMvJdioOdvA0IljZrc4ZEIAz5N89CDdFAYN7Vn5yZiLjOw19eRUR0gSIwdeSoyaZz5IVF9TTI+NfRuRn3TG0xtVSfDne5mi/0SJGsbm8RKMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f3d00a16-3cf3-9cad-60c3-84eb455a3323@suse.com>
Date: Mon, 28 Nov 2022 13:26:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] ioreq_broadcast(): accept partial broadcast success
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Per Bilse <per.bilse@citrix.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <06ad4b3a67a15192fc986b35e3f2fcd35b2f4c2f.1669383767.git.per.bilse@citrix.com>
 <d7a42f21-6dd3-108e-9278-74d756d941e6@xen.org>
 <fdc2eb93-2b8a-f3c9-82b0-5d4e90ecda9c@suse.com>
 <Y4SWTceb13wfRimb@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y4SWTceb13wfRimb@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7652:EE_
X-MS-Office365-Filtering-Correlation-Id: be0de8ce-b5a9-4cfc-adf5-08dad13bb851
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EVjkVq9CgHbhPhAPauwO640SrjJ5LobXaBvkNZ3jbqapPo7A6Q3iP+SGtGgepipxfPg4g63HjwW4Omv+zINNRjBlGZQE9z6DT0Zl15H5tyxPoLFwEHNvpxzIL3CsiyPRiHcqSNyQ7MIKFpgrf2S1XFrmdP/otySBWSewxHgSq+eurnL6qf+vEDRAlV9MLnY2YLWonp4Huk4P2hZWhuAHpDS7qtflp6o/wLW/wSoSWTVtD037t574rjDjby6aLWnNIdiS4gc8oIOi2+BR8lVLx16T5OIpm3jzVLNh5gZr6/JD6P2Ghd7FWfpu269sN5SxMpNtYRkcF6rSoaYJ6V0RlO3ruL1QupTdDnFzPsen5iQPNMzEg4noV4ufFOKI8iGmwBzbO8tznU2aA0OEU4gloIYhfmy359da/YMGxNmvVshxWWtp1+peuM379aKc+AVJVCuqh3Ta94ZyAHkkKW2SrSCjLl9S1IvrqBxqjlC2Arv46B0lH86PqTmn6kl9UA6D92krM/8M0zGQdwWszaDDaGFi+lxhmOQAbtczvMGMs5cVHIGHWa9dQUTCdqRMHfhRwDb5Rf9BPoJnWt7yIqSTMMMCOJ8g0Dmms9ASazYC54ptkhp8xulrBlSA464+vbCARQMnRkqZPRLVjmnAN6rs0y2/xLoNFB0rdxlKqnftpBkPKlDKJqwo5YsbnJ+Q74srjeBGU4LkampKj7Ba7j0RoJMB2Ih3I7an4gdGLR/R1Os=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(39860400002)(376002)(366004)(346002)(451199015)(36756003)(2906002)(31696002)(86362001)(6486002)(478600001)(53546011)(6506007)(316002)(66946007)(41300700001)(5660300002)(26005)(54906003)(66556008)(8676002)(6916009)(4326008)(8936002)(66476007)(6512007)(38100700002)(83380400001)(186003)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUcrWm5QU2JCTW5HSGx6cFZIbnlyOEtPTGVrVzVEcm5iTUFUZXVycGpzVHhC?=
 =?utf-8?B?L3JKWEVKMTl1amY5cVFwaDY3SWJQa2dtdHhRMnFIOVMvTmUvNnpZUUMrcDBM?=
 =?utf-8?B?NVBNRllPV0NzYlJna0RTcEhXbmdHakNmOHh5L0JGU3A2OXY4VTZLY0xKdXZO?=
 =?utf-8?B?NG5UR3k0Q2Z0enFTMmQvSzhWRmwzUjk4UG9mQ29hQjVVbTVwbHFXdDE4b25x?=
 =?utf-8?B?Si9ZdGlSV2d5TjNQVkhIZ1R4MGh4T0RkNU1uNi84K0ZRYno3L0FMdks1U1ZK?=
 =?utf-8?B?cFc3SGNjQlYrSittMHVTaWREVXNDMDNCL2wzS3VKRUFIbFpKeTMrbUlRdy9t?=
 =?utf-8?B?aERuRDdBS3VncDFpS0lNSW41dkN4eXd5VXpacXhaZzhWRHJaNHBKcmxyalNC?=
 =?utf-8?B?aUFBR1kwSzhWNEYxTWM4Wi9BWEdUM1pKdGlHMFV5aE82ZnRlcTNOcDZzOEtE?=
 =?utf-8?B?azdSWU9BRWs4eWNxS2FmKzV5QW41OHk4UEV3cStWLzloMzFKZzAyN0NDMW9y?=
 =?utf-8?B?WW43MUhPU3NWNUVZK3hDVHFKOElHc2NKaVQ2cC8yOEF6MFFlMG1OQTRBN0U2?=
 =?utf-8?B?emFkOUpkZ0l3cFV5WlFZeUFXK3llQjVQTHhnUDhBa0kxbGQ3Z21DT3RxMlcr?=
 =?utf-8?B?dTJpcEM3YTNrcjN4ZHRWYzdMd1hRZHp4WjFSbHcrQ2dON2pqaFNoNEpsaXV3?=
 =?utf-8?B?aHd6TVlvZWt0bS9oZXdwdGFvM3NVRHRBN1U5WGdzNHpyV3pzMDV2aHJnb1Ir?=
 =?utf-8?B?YUNkSVNIYUpRdzFaVVduOTIrdVo3cXV1cThPTzg3Q3hJcWlaakh1UUlRajB2?=
 =?utf-8?B?ZllSek9nazZCQ2VmOS9qeDVTQm9pcHorZm94UjVGVDlDWGJUblNyTWx6VTlE?=
 =?utf-8?B?M1pKbjNZa3JpdXM3OTFUbzJtV3A5M0R3ZkN4T3VOODZnd0JJOTgxVWpNTnhZ?=
 =?utf-8?B?ZWR5dzVkVEJCcWJVRkZWNmNoekZheWprTlZ2SmVEYnBFcVJYSHhmeVlPOTUy?=
 =?utf-8?B?YnUvU3UyTVp5VExxM3QvMTY2MGtSY2Rya1hnQXJQbis2MGtlY3NPRHBwTzNa?=
 =?utf-8?B?RlB2WDRPSnh0bW5xQXVka2pzWmxBWGlwODJGT3k5T1ZNS25ETi9peEJCVUdO?=
 =?utf-8?B?L3pOZlltQ3UvVHBsSHZMNjJIS09OWVJoQ3hPcGpUK1lEenR4UmhOckVZdWJm?=
 =?utf-8?B?ajdkOHhaTm16NG1zRWkzUis5NHMzTGxBWm02RG1La3RxMElvRld6a1NzcUtn?=
 =?utf-8?B?SlpKL29ubUZTZkFCQ2VzdXU4NEt0a2xzZlhzcVBiOC93OC93UDNiSlN3ZDlr?=
 =?utf-8?B?clJ3NWVZNHBzaEx6WlhUclRzVHJXODNVSWFZNU1wQ1VoUXNCMXA3UU1tWkxZ?=
 =?utf-8?B?SDlYM0ZicWc0eHhaN05UL3U2d0tIZncyTW1KcHFkak5HSzlXaDNHaWdEOCtS?=
 =?utf-8?B?RnllZnZ5alZtekx4a3JqUS93d3N2R0xHaHFhUWlmYWhuUUFPRm1LUi9nakFC?=
 =?utf-8?B?UU9vaEk3RXJNMzQ0cklnMHVvd2FidFYyUVI5ekNGRUUxZnI1dnJuYTlORW1m?=
 =?utf-8?B?NjJrVHhJZldIVVJuZVp5VkpmZlNnbUdjYnRCSUh6ZGJhcEcyVGJuQnFGdjJr?=
 =?utf-8?B?U2tQTXpkL2J3bENHdnQ5bEg1M0F4a1lLMzdibTFvcHJBUnVvMTFTeTcvQzVL?=
 =?utf-8?B?YmJSSUF1b0NiZ2ZoNTd4UU9LQmhTdi8xb0RoNFJzQzNoUjhYcGxWNGNOYnI1?=
 =?utf-8?B?M0N3T0pzZllQaWloNmhTZlZXRVdoRGlEeXZKSndSeitoQmJlaTc0dVVUQVEv?=
 =?utf-8?B?RTdsUnpITExCQ2VDNnI0SmF1aFRIR1k2eVlKUnZ1djBEc1VadDNURkJhcGo4?=
 =?utf-8?B?SFpMbDRHR2F6L2daeUtBVGgzclBYenl0YjRTUSt5Z1pOVUZmbEJEeXY2SFN4?=
 =?utf-8?B?WXgwaU5pbGo4T0xpM1FmV2RqL3RRUG5kWWs3UEZaTDY4ZVMzZzNmbjViNW5w?=
 =?utf-8?B?ZGdxS1BZMTZkcG1mbVRsVXpnS2ZSQnptTWtHT3pVOWg1TllWV1dlVCthZmd2?=
 =?utf-8?B?dnFoZWhWODlrRkRtblE0WWc3UHQ1cXN4dERlNFBpSzNocURPUkdpYVhWRGVB?=
 =?utf-8?Q?NegRr3ZStbNhy057F2L/WSoHw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be0de8ce-b5a9-4cfc-adf5-08dad13bb851
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 12:26:05.3388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UjJkx6uAOWSwV3cFdNX9Ryu5pc3zo2AFYqxTzdKF9QGZoE7ww7AxplPEYqGO1ksmM/V7syKdO9b+TyTbL1XnKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7652

On 28.11.2022 12:06, Roger Pau Monné wrote:
> On Mon, Nov 28, 2022 at 09:21:47AM +0100, Jan Beulich wrote:
>> On 26.11.2022 23:19, Julien Grall wrote:
>>> On 25/11/2022 14:15, Per Bilse wrote:
>>>> This patch modifies ioreq_broadcast() to allow partial success.
>>>
>>> The commit message is quite vague, so it is hard to know what you are 
>>> trying to solve exactly. AFAIU, there are two reasons for 
>>> ioreq_broadcast to fails:
>>>   1) The IOREQ server didn't register the bufioreq
>>>   2) The IOREQ buffer page is full
>>>
>>> While I would agree that the error message is not necessary for 1) (the 
>>> IOREQ server doesn't care about the event), I would disagree for 2) 
>>> because it would indicate something went horribly wrong in the IOREQ 
>>> server and there is a chance your domain may misbehave afterwards.
>>
>> In addition I think ignoring failure (and, as said by Julien, only because
>> of no bufioreq being registered) is (kind of implicitly) valid only for
>> buffered requests. Hence I'm unconvinced of the need of a new boolean
>> function parameter. Instead I think we need a new IOREQ_STATUS_... value
>> representing the "not registered" case. And that could then be used by
>> ioreq_broadcast() to skip incrementing of "failed".
> 
> So introduce an IOREQ_STATUS_UNREGISTERED return code and don't
> increase failed if buffered == true and UNREGISTERED is returned,
> would that be acceptable?

Yes afaic, but Paul is the maintainer of this code. And of course the
new error indicator shouldn't surprise any existing callers.

Jan

