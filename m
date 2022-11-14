Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 112DD627777
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 09:23:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443173.697669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouUkJ-0004nC-Vl; Mon, 14 Nov 2022 08:23:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443173.697669; Mon, 14 Nov 2022 08:23:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouUkJ-0004kf-SN; Mon, 14 Nov 2022 08:23:11 +0000
Received: by outflank-mailman (input) for mailman id 443173;
 Mon, 14 Nov 2022 08:23:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4jG=3O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ouUkH-0004kZ-RQ
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 08:23:09 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150041.outbound.protection.outlook.com [40.107.15.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91d983d5-63f5-11ed-91b6-6bf2151ebd3b;
 Mon, 14 Nov 2022 09:23:08 +0100 (CET)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AS8PR04MB8626.eurprd04.prod.outlook.com (2603:10a6:20b:429::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Mon, 14 Nov
 2022 08:23:07 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::48df:9a8c:c706:36b5]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::48df:9a8c:c706:36b5%3]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 08:23:07 +0000
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
X-Inumbo-ID: 91d983d5-63f5-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RlQ6PcCIqNGSBe3Bbm7nAsc61ak3qf9D0HnLAxHuw3pgivmfiLcrhDSbzuiNRI4J45dzdthOF+uuVLXjd4ojkE6fzKNsJvU/KKWuwpsOT1yvN9tEtRI1PSUz1LYqMdMoTXoSUT3BSJGeO+1pNIUbYNYSGKDd5LOb9lHP1wZYn+xih6/gtSxv8WduL1K2zpI52D1TvlFJN+fDIkuFka+jTZR4oa8g39TGFvDvLZKnO4ozxCYlNk2bAoFhE5AMt1Z4IXLm/n8KAgjcTW8QdRfae90vYbgK83+TsIA/amLcRAE63wJKEroCPX5pJVf8QuDcMWP5zTuvxZvL++1PmQtHXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xnVIDzEtFZM0rZ/XO1S7BuTcV7lwr43sCcylfCTjE0=;
 b=iQFVXgoJG9sWq+LnEeCkLMVZ9ZrHcHCQjliynfwgsTLbxUGedMktkcGlxM1osYb2SdLc29rnps3SFcGjdcXhk58gBEhw1YL5BhQPyDRT7N2ULBWiTPwTo4gPtwE28D04c1KD9pndN7AFMcu5aL9bF0jqutMMSOBjVFhNSylDKeVzV1JWdprr6wYk2ub/T4OEnBAcKObfFO6fNkjJnFH+Vz13rE4LpmeRkC1ZtmJpOr2zMjOrq4f6EjZPFOWVxyVUYnJjZi+K66y5/MpVHdgZQstYgVh18PP1feRlCMVALr6r4vdtCWXMwxqibzTuzg3kYxaRxGqJYHpUHzQ3Yy3S+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xnVIDzEtFZM0rZ/XO1S7BuTcV7lwr43sCcylfCTjE0=;
 b=sMXCpdMtvftVUSGAgbaClPJ2OWjoxoL8hKBoHE+qWoPQvZ1qrUt600YGJK7/Hk/qXVs+E+tIUAjjQJVhNsiFuknUXVt2cqw+IfEYigvGHeuBmPAChvOyPoTsbD6ODnCNnpVlLiQTrlyQbv4llAi4Alj6Q24QsCEgp5G4m92xYDZBGkmm72brZ6ml2LuJBY1Cr5YBv2GIPIGhMO1F+Egs8L4MbAtpVhu+S55RNm5ncgKvLANDulYKsTAe+1SjMjP4/ywBjiyXp+YknKszvhfwcThj6uR3Pk1jpmZlavAJAfz9o9fgUAImCemOG5+AB+GGNX0gp2cg4MeRHUVt3nsRUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2beb3d17-99f6-77fe-a5d6-d60e665f01d5@suse.com>
Date: Mon, 14 Nov 2022 09:23:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v8 0/6] Device tree based NUMA support for Arm - Part#2
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221114063451.473711-1-wei.chen@arm.com>
 <3aa067b2-fa49-326a-c5a0-6735bc95951e@suse.com>
 <PAXPR08MB74209231BFD7E8C3004C55A49E059@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB74209231BFD7E8C3004C55A49E059@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::15) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AS8PR04MB8626:EE_
X-MS-Office365-Filtering-Correlation-Id: e715f0b2-cfb2-49b5-5734-08dac619755b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8RuPVS41RO1g+k9zFEQnA22gVmSNhAbp+yHZeZCcgkus+F475fvg8/Fs133DWTvZllb3hXLvH+legpOv9vSXYxFqqFiFSzg2Jmsrf2AJuXiJ1ngLK+BNBzw3q5dl+mTQ7JAeDCMelHtrqNwQaG4IPdr58RtRYEubkhCywGE8wPk2hltqnUrNeM35aQD6IciAb2RLGjVbBjJ1xqdC73elRQa6MLyDVKyRkEN1xZ+QaAuktQB4cCtXgMISyYKMoblYFqGslGzVr2A2HwXU6i2NvsTdJYTAjOf3gyjg7GlhcsboHH/kIoRwL+teDraerWZxp6WMdFrCditNt76ravpE+YWc2kk9MEmXCO7EbIXUZilKBpgQA8nOeVe0lB4bkUxQGqwPAcWc23yLkvXH521Te+xWNQTD330I7J50SKyD20vXzYHqxphA7rI9Dz8ewpiGcCjzwE4J+la4p7IustKGfORIXc/rBT5s8ph0hDEMmc1+ayAvxcV6oeYr2pWtC4TBxRLAo0qVWYNe/suuOqAFX44XAl12avNR8kFQzaqiDgFHuAc5NZaKBprJObXTi1/DKf84jTK/5rpGVkAG+ZDJh2EXA06ScIlcacSVD0mSCTwnE6xrTQyPStJyJ5XV+77w9w9FtsP2Qho84A8o80lKlKgaTWc+tnK5AUHw/D8GF0FWPVwxsrfZH7hqdyqpo0h2Mj7xtb1yrwklk7voCa9qvGfiGllJEqxYEIDdD8pJD8Ygv3I21xVrtnkgZ7a7tEW3kT1EXKy5OpGVBwAPoGAyIKneJxe8/Ki9wLB5pXmo/sfwqF+VuJYhKOS7YhJW/jEO+7e0x/qTWbT8D4wIl9Le6tBpGBgCpqd/UtPQzioqflI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199015)(2906002)(36756003)(8676002)(4326008)(66556008)(86362001)(66946007)(6916009)(316002)(54906003)(83380400001)(478600001)(6486002)(966005)(8936002)(5660300002)(41300700001)(38100700002)(6512007)(53546011)(186003)(2616005)(31686004)(6506007)(26005)(66476007)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1JHanRTOU9WSGVRbDJnOS92MTlmd2VpSytYMlBReXZtRTI1NjZRVGNrbXlK?=
 =?utf-8?B?aU94VXZLbGo5U09hZkJtdm9KOTNNYm1Lem4wWmJ3WmRMTFlicFBteW9waWRB?=
 =?utf-8?B?YlpuMzZONXRKUmxtbGVyS25lcUQwMkRja0ozVHI5NEFPN3pjdnRxMGlHaVBu?=
 =?utf-8?B?aGk0UHRrazNjT0pzaFBOci9iNDBwTGM1MjY0aWJmMDArbXg5QWxaWHlxdkx4?=
 =?utf-8?B?NTh2S2hIOC9QdGlFbFUxQU5tMzgwcUxITmR4dU1iWE9hRmZjSlhyWFJkUGly?=
 =?utf-8?B?cFQ2MEhpb24xV0ExVlpZT3c4cm9SRmhMYWcyWnFQazJWcmN4VCtreFZEaVlU?=
 =?utf-8?B?ejdhaWJtc05udjJBQTdTT2VxSHdIRFRJcHBkTlBhd1c0b0x3U2pBTkRvQnRW?=
 =?utf-8?B?RjZtZDZKb0VkcXhjVjdMSTFEUllLVk1MbkZQM3lBOEM1TEJZanRHQzEyWkpv?=
 =?utf-8?B?VGk3d20yNjhKeFdmM3ZwRlYwU3VIZVkxdmViZ0hDU0FxQXpoTyt6bCs1SXB3?=
 =?utf-8?B?UEFPeUpqdXk0NEpyelBUUFFQUjZ3aE1JSmk3T2l0a2hZNWlpREY3bmRpWWV0?=
 =?utf-8?B?SHY5MHhMdzYvbDBCbDdSYzYrcVlwQVprQmpYenRKSG1TMkgzRU8rVWM4dVlK?=
 =?utf-8?B?bTZXNjZwT3dGNTZLbXFhZE1WaW14ZkJLZms0SFk4Y0RzTzZTZjhCNi9GbThz?=
 =?utf-8?B?bThsZ1BrOUZyT1FxcGltTitjOGhCV01zNGlSMUJnN2tuaDVnQnJrTUhYWitm?=
 =?utf-8?B?d0hYbnRRcE1iUHl2ZnViMithbWRBaEVkUFE5S2V4aU1SV1BWZmx5OHpsdUZw?=
 =?utf-8?B?am8rYkVCbnVCT0hVWm9qRHVZcGpZbVh6V2JVeGZTSzdndlBnV0wzeldxaTVB?=
 =?utf-8?B?YnJxd0d6MWkwSmhHY2pKU0RHWkJFdmFyQ1Z1a0txNlZMSFlzZVdSR2RwdFZV?=
 =?utf-8?B?bm9ZYUdVQVhObm03UVZEeVVhVFUycHBvSW9FbTZpMVFQcVB4cmJ2TjJzd0li?=
 =?utf-8?B?Ti9OK25lRUlZVFN3WkY1V09ZK0gvTEp1NkdYT0RXVnpQa1FQMmxuVncrNlZ2?=
 =?utf-8?B?SEdadCtMMTYwRi9LeUVTRnNzR3dGN0pQaVZzNi8vUXpxTS8wdThrek9xTEZB?=
 =?utf-8?B?RHIyYkVVRlRBN0VBb29Ibmo1QndpSTEvYnpqd0FKUU5OR2pIdkNhWC9sTEdh?=
 =?utf-8?B?bCtVeEx4ZzgrWnlaT1dwdTRMNW5yZko0RVZSQ0RVL0RoZzk5bUdHR2NiTEdH?=
 =?utf-8?B?aTZhbG9mNXZreWFRVXVnbUswalR3NGJuWDByZEJQWCtiaVNpbDZKV3RzZDU1?=
 =?utf-8?B?OHZXNERnL3RwenZjQndtQk5UaE10dklTcU1VaVplak9MTG4zTG5jeTRpbW9E?=
 =?utf-8?B?bGRyWTFaZkVKdCt3OXJXdllaUzJtOWExTkJuZzlYTDc4RERoSUh5ci9yNldT?=
 =?utf-8?B?UzM1WGphWGE2ak1RV0FMUWhjV2RRMGZkSWdYdk14WHNwZFFEd0JUdUJVZitP?=
 =?utf-8?B?VUsxYzJIZXRwbEl0dDFldE85MDk5UGxsSVRwZGdEMW4rZ01PQjJoMzIwUGd5?=
 =?utf-8?B?L1VmYmM5SEFOUTNLNzhGc3JtbTR2aUdFQnpBQVMwSnI5aFNyelF0cTkrbUZj?=
 =?utf-8?B?d1p0NWdpMDBtUForeWVsbCtiZjIySUk1ZFEwTEJhUTBzNVB4WWovc0RBdzZL?=
 =?utf-8?B?cC9sNnp6RCtmZnY0OUpMNHFvamlzOGlDSGlzTnRTQ21vSmFRUFI2Zk5HK2cw?=
 =?utf-8?B?TDlBV2ZjUW5jYWF4Y1VBT1ZsK0ZkS0xmTjh5N2t6cGdxRUllZHpqUG0vMU1T?=
 =?utf-8?B?L24ybCtvYTVEVGprZ0tVV2xaR1NXTHlocXR1QkFNNmQyWVRZSEx2cGozRXRW?=
 =?utf-8?B?V0RSNFQzc2dRNlZ1ZG44WVlQRUxlbFE3MkhtZXpvMW1pY3kwdmR2b3R4OWZ0?=
 =?utf-8?B?djYzcXpjT1dJN2s3c3F1Z2ltM3dZTU5OZEpMc01FSEYvbDVxYkVQNGRmZnVs?=
 =?utf-8?B?dXcyckVoUEl2Uy9kUDVNQ2NNQ3ZvZ0kyRzRLdjB1cGVYc3JtSnZGUUEyZFM2?=
 =?utf-8?B?bzJOTGdyMUhDaWkyaWhMV3NHUzBmT0N4U1U1ZEg2NDJWaEFOZG5zK0xWU1hX?=
 =?utf-8?Q?/QbFGz6tt+QrpqDHNICtv/1o8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e715f0b2-cfb2-49b5-5734-08dac619755b
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 08:23:07.2998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vxu5wEl6Sw5J2pJyfsmE95zl3T9+ECxbMY2dE1/tV0EMgnPtB8neFcL4YCtonh6zox/DFIJQxADMy1eQqQ9g8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8626

On 14.11.2022 09:14, Wei Chen wrote:
> Hi Jan,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022年11月14日 16:05
>> To: Wei Chen <Wei.Chen@arm.com>
>> Cc: nd <nd@arm.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Roger Pau
>> Monné <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; George Dunlap
>> <george.dunlap@citrix.com>; Julien Grall <julien@xen.org>; Stefano
>> Stabellini <sstabellini@kernel.org>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v8 0/6] Device tree based NUMA support for Arm -
>> Part#2
>>> So in this patch series, we implement a set of NUMA API to use
>>> device tree to describe the NUMA layout. We reuse most of the
>>> code of x86 NUMA to create and maintain the mapping between
>>> memory and CPU, create the matrix between any two NUMA nodes.
>>> Except ACPI and some x86 specified code, we have moved other
>>> code to common. In next stage, when we implement ACPI based
>>> NUMA for Arm64, we may move the ACPI NUMA code to common too,
>>> but in current stage, we keep it as x86 only.
>>>
>>> This patch serires has been tested and booted well on one
>>> Arm64 NUMA machine and one HPE x86 NUMA machine.
>>>
>>> [1] https://lists.xenproject.org/archives/html/xen-devel/2022-
>> 06/msg00499.html
>>> [2] https://lists.xenproject.org/archives/html/xen-devel/2021-
>> 09/msg01903.html
>>>
>>> ---
>>> v7 -> v8:
>>>  1. Rebase code to resolve merge conflict.
>>
>> You mention this here but not in any of the patches. Which leaves
>> reviewers guessing where the re-base actually was: Re-bases, at
>> least sometimes, also need (re-)reviewing.
>>
> 
> I just applied the v7 to the latest staging branch, this work has not
> Generated any new change for this series. I should have described it
> clear or not mentioned this in cover letter. Sorry for confusing you!

But you talk about a merge conflict. And that's what I refer to when
saying "may need (re-)reviewing". The same happened during earlier
versions of the series, except there I was aware of what you needed
to re-base over because it was changes I had done (addressing
observations made while reviewing your changes). This time round I'm
simply not aware of what change(s) you needed to re-base over (which
is why I pointed out that it is generally helpful to indicate on a
per-patch basis when non-trivial re-basing was involved).

Jan

