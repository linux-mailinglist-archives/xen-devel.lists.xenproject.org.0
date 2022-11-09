Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3666C622723
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 10:36:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440761.694924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oshVB-0002fD-LE; Wed, 09 Nov 2022 09:36:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440761.694924; Wed, 09 Nov 2022 09:36:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oshVB-0002cM-II; Wed, 09 Nov 2022 09:36:09 +0000
Received: by outflank-mailman (input) for mailman id 440761;
 Wed, 09 Nov 2022 09:36:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xaUo=3J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oshV9-0002cG-8n
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 09:36:07 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60068.outbound.protection.outlook.com [40.107.6.68])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eed2bba4-6011-11ed-91b5-6bf2151ebd3b;
 Wed, 09 Nov 2022 10:36:06 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8855.eurprd04.prod.outlook.com (2603:10a6:10:2e2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Wed, 9 Nov
 2022 09:36:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 09:36:03 +0000
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
X-Inumbo-ID: eed2bba4-6011-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIrPmG9l2vjh9DoT/zjg8KnruYAtawKZfYc6OjvGFFo9mfYaEIsUrsJJLA1BkooT5f4d5s+CxNQ/hHOPSGC0yKJ/Nlt4wbRkWtmoA/vnShsAdBmpDL7yaWtdwA5NMxwjcaU96r8qGdgt3S81r5GMjDDkebPrXPun89liq+/AKW52dNsTeNHaVCCOXvii45R+46s/jp+BC8IdX5ZJ4bS+ZcRHfIWuHSjfLCBHAGsuZuhmPF7VshWapOp9BaRv5JbTmiuGJ3YoC/WJjAx5JIfqDgJ40psZLaZ8KKoVEh5rEJhngqqQ8nUFTJM2FLzo3z0nnw7M30uiYQA/H2tRxdaKuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bnwUd/DEPED5YzUt5/L9h9bOYRYFgQe9FRik+hFhalk=;
 b=gWciLTnol/0+baAIG2kvRT+FqupFwfFZLuVNu5DOhzXfuKlnuJUE0UDGYGppsKHB8CCM1IllE1wJKQz1S5RIlhmwjGTQ16JvJqaLzSWW76qETs1s2m34D/xPdv+bU3N7Wlzn7N4NxCjMjeNx63RilcTv+DodZyiVaLqcT/GxaP9xjEACW7KGOm8uMEbudvzj68aFGRf8nEIkKiMoK/FhYTEI1eVxXguwwd0zAxB0XdJqlVR5PwnWKceCquZU8dqDF8/PwxP6dcSquVQmhOGDHmMTELhdC77ay/JKWMLBpghsLVCm8IYXR59mVRl6M6l8ZA1po1/GEgInQLZbTxXdPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnwUd/DEPED5YzUt5/L9h9bOYRYFgQe9FRik+hFhalk=;
 b=sBIu+VP62LQzyeaqSjSpzR3okT85kDVd/3TnHQbl9xdBWMRPMILxQOe0FyjL+Z6Pd8GHe2bZ1b2VR8YYdATJfu0rK0KOMfgoSyQj7m5UG/fd1kKbhs1N0M+gv3vsOrfvFEx1gGXgMdxHDZkY+KEGfMxbyPuebgAyVI5zTq3/iroxkJF2Zk4dosqk3tPMhvrbqBBWA1yhIQ1dlD2VPJcai+UKV+YCkEJrG/tX6wrWEv4E0z0sZEmw4ys+9Hl6ERB9qJGdGoBSWaljqYJ2YQtF66PmBKPBdoLrQjqMNh+PvdgkslMXk0EUZ88+CSTKUg3z4mqi2UhEwdm2qtL5BLh3KQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <09c03186-bdfc-d931-33bb-e589b074726e@suse.com>
Date: Wed, 9 Nov 2022 10:36:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17 v3 09/15] tools/ocaml/xenstored/store.ml: fix
 build error
Content-Language: en-US
To: Edwin Torok <edvin.torok@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1667920496.git.edvin.torok@citrix.com>
 <09afc07ba0ba65afc02028bd6b4950d8e51af69b.1667920496.git.edvin.torok@citrix.com>
 <AS8PR08MB79910C8281C7C356450152C4923E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <1e994604-7a3f-ef5f-63f4-d03e4abe4124@suse.com>
 <D9D3FE01-976F-4609-BBED-961BE59E09F8@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <D9D3FE01-976F-4609-BBED-961BE59E09F8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8855:EE_
X-MS-Office365-Filtering-Correlation-Id: fb43b384-ffa6-4ae1-03a9-08dac235d193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1QClMRhjKwYoxMFxFXgPMiKeKug5abx2cOCzyLgdMIw3YdoicXrlU0BdUjQ/CEGjnHtOPH0SoCH+nItopvIpQxtHPYJTmOpmE3yZJgKPqvwQ2XV2/B4nIzm0x0nX7jjeFgEESj/8t1LjzDTOK3kqSHOijOWG9aJUhWKTC9t32zKhj/gLC074dpKKaJtxnPxTg0wQ0rnTAAdizuq8tQsP3mnBCzah6iUwmYayoWp6xaFDo1O3QhM1MIefp5Cdqj3f5MZ3qYlKbeavmO9Hn8tHN7JPhc15qiR6ETICyv5E1kvHV4VD1PFG4Kd3hjVb0kuqL4velzvnszuBM/iAawBEzE0qvlI2BktPi0f16vrPebwMAiB+i8ni66ffRWJxbIRtqUmyxKsozb1rNvn2+evRYcUz637+1UxsR7xThttTxjSbehQVAtNsTBIEpD27sh1XZC5sv24KMK3oTBV/KmEgEi1GXgHEWKdzS6IH5rHBqL75cz58BcovfCyih/hjnu6QVlzUVRkL1ccCdH41dkR/Yh1Q7zMG8Hb0ET+gL2fJ69uyIY2+ac8miYgMqChTk+ocnGFRSIp5JJpCxSHkohEPlsq7H2w+Jb3Sl7bMYrd1urQIicp9AnU5vfpsMdKGZmUxoziQcVPrmnu7a7xnd+uWFXMoNUXgxGf2ylgtbmKX69z3r3CZLhXXp/8NqyJEQq9Lncjmy0E1h18uzFad31ZXfu90O/9j3sG4c6gCdeKGbS+D2NvvB+4GJJrlLkzxeDCBk1XgkP8tDMqcjGIQzHRi9ALzIqJ1ZFgVmbOcrnPJF6c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(376002)(366004)(39860400002)(396003)(451199015)(36756003)(31686004)(38100700002)(83380400001)(66574015)(86362001)(31696002)(6512007)(2616005)(53546011)(186003)(6486002)(478600001)(54906003)(316002)(66556008)(66476007)(6916009)(66946007)(8936002)(5660300002)(41300700001)(4326008)(26005)(6506007)(8676002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHE3QjlFaVNWZzhKMjI4c0xadEhXVXRaUVhlUzZSdVVqRFlWa2hOdEV0cjR1?=
 =?utf-8?B?UHZjcVdhSkZ4OTVlNnpZRzFPUW1NTGRzK0hRRDJ1bWlUV3hCSXpuZHIxU1Z1?=
 =?utf-8?B?NVlVTlllYm9Cbmt0anFxeFBqWTZDSUo1N1pSQVllZ0tHWDRXYytzMDAxMjcy?=
 =?utf-8?B?bm5ENjdUejNXVXhuVnhMNXZJSGtHQis4cDcvSnNZR2RzSStrVjdNd3E3N1ZH?=
 =?utf-8?B?R2NKT012bmU0WkNGbWcxL0NFMTgxY2E5QUwxVjEyVzhtWjRGY1g4S09SZDIy?=
 =?utf-8?B?VmhzNjFJSE9jMGpMTDRWak9tL3pTZzhiZVpaOFJISlJkYzFiUjhacGFNcTNI?=
 =?utf-8?B?MTZQR1lXTk5GSnhGbHc2RThmT2drU3BUMXJtUVEwME8wZHNnYitvT1lzVzJu?=
 =?utf-8?B?SEZNN0pnRXRYbUx1ZVNmakZJSnZ3bm1OTTVSditQTDhSc09RVGVTN2ZGSHBY?=
 =?utf-8?B?ai9uUDlwR0lZWlhOTzdCQ3BFMFFjOHVlT0crQ3B6bDlTbzRZSUVkZ0tETDNx?=
 =?utf-8?B?cDJrRVRZUk5lZW4xeTlDWHA4SnRqK2RBL2IxcHR2Z2NwRVU5WGVhUlE0QXN2?=
 =?utf-8?B?bkwxV0gwWlMvUkhSMkpjMjVoV1I0ZmwvdUVWdlhYK2h3R3FNb3NqaklJbEMw?=
 =?utf-8?B?Q3E4WEkyRmE2NUNoSXlLdVFIMHhhM0JOeDRiWFJucnB4Q1FmbEdSbUEzOHhQ?=
 =?utf-8?B?RDBHejVXRjdUb2JvSjVXb29Wc1pLUEFrN3lYMkxydHYwRUZueXJlVWpDb3Uv?=
 =?utf-8?B?enZUMmIrWkppY3JTL2JWUEkzWTRFZlNlOFB2dmsvV0EyZzhBdHpqam80Rm5K?=
 =?utf-8?B?aDRKSUdBckRrcysyYlBCOXJDckZRSE1wbG1aRVJkYTIrMlRvdiswbHMwenQx?=
 =?utf-8?B?aE5SVmFiWXdIUTY4MTg4WXg2RUNOd0d1RkZQVVpaYWJ2RThuWHpldU5PU2F5?=
 =?utf-8?B?M0VUajVhKzJRZ2JnSDczeFhIZWJrejNKWHZsNTBEcGU4V2Z2MWdzMGpNNGNJ?=
 =?utf-8?B?UURadXF0V1liUFNwb2x1YnJJd0drcWVjOURKN2RIVThYdVlTTkRGSndwUita?=
 =?utf-8?B?Q2x4WldvMkRrZUwxaEhTZWtURlBPSVVGNG5BV1gwb0daZUpXRmFhc0k0Wmpu?=
 =?utf-8?B?SzYzZ2NDVlpJQVF5bG1TTlEyWllIS05Qc0ZqRnhzcDJNNjhXMFFwbklsdDd2?=
 =?utf-8?B?N3FYRHVSYzNQdHBTZXAwcHhqZXY5LzQwQ2tmNFpzcEp1RFhsVlM3TEhnZ0pJ?=
 =?utf-8?B?NHRRckovYUZhSGE0UUxBZlZRSnllbEl2VEdzcGx3eWYwamZnL2dBb2FWenl5?=
 =?utf-8?B?U0F4R1RJRmxXcmZTRUROWWVRbEJFVThhWHpQelZQZFdQd0xlQzd5dmwraVVt?=
 =?utf-8?B?QnR1dmhnQmhjaUJpM2ZTeDJQenVVekErWjM0TTA0QTBpZW1QMWNEN2tmcXhm?=
 =?utf-8?B?aHlRemVFT2xSNEVHVGthMSswbVBybWFvN1FxTTlZS1NCYnZFdWFOU0czd29p?=
 =?utf-8?B?MzB1OS9uMUQwdC9KdklzdkVyczJiRFhwNGxWdFc2NS9KZUhsa2xEcnlVa1RI?=
 =?utf-8?B?TjdFTjVrWUdBZm8zditNNUkrakhXUU9IS2ZpTU1hSHQzOG1NNU4vMnZDcXJ6?=
 =?utf-8?B?Smo3Qm5NR2ZySlFFbkI1dUZrMmlNQktaWXdjRWJOZmVVdk1UOXd5akZHMnFN?=
 =?utf-8?B?a0hLV0twckZRZFFBSXdGd040TXFHM0V0VzVQOUJrckdsVi9NMUI2aEtUTGt6?=
 =?utf-8?B?dHBIYjBiSS9LRXdDQitkemtPdHRDdWo2bk93eXczS2FQcWNVWElySUtLL3d1?=
 =?utf-8?B?SCt4Q21CbG50OEdISEE0MVpOMlJGaHRqbDdBZU40dmYrMk1UTi9hNWJuVUR3?=
 =?utf-8?B?SzFqaGd4WlN2c2tCTVdwT2tEVm1zTjlzY2VRTmVoL0ZNb0xzV1hKY3VqVEhD?=
 =?utf-8?B?bzVyMWlqekZjVmc0NUx5SGNNN0ZEdEh4Lzd5Q0RlUGNmaG5uc09HaUoxanF5?=
 =?utf-8?B?K3pLdEtMZnhHNzc0SWhkZS9SR3ZyNzNOdm9KWVVRYzRrRVJkcE1SM0ZUajJO?=
 =?utf-8?B?a2xiaFlCZVhmcUgrcTdWbW8zSS8xNDZ4T282OU5USEZxU0xPb0tTL2pHRkRX?=
 =?utf-8?Q?swa8WNaQxwtAGk3wzqUvV5EfD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb43b384-ffa6-4ae1-03a9-08dac235d193
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 09:36:03.2724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCN0s+xjVUF5MnAqZyNYw6cci0iK5KYDckYU9PJkmT0SE+XCC2PPe5qlOEdeTdf/HhRDaxuNfLIi0JjXqW5mjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8855

On 09.11.2022 10:21, Edwin Torok wrote:
> 
> 
>> On 9 Nov 2022, at 07:10, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 09.11.2022 03:47, Henry Wang wrote:
>>>> -----Original Message-----
>>>> From: Edwin Török <edvin.torok@citrix.com>
>>>> Subject: [PATCH for-4.17 v3 09/15] tools/ocaml/xenstored/store.ml: fix build
>>>> error
>>>>
>>>> Building with Dune in release mode fails with:
>>>> ```
>>>> File "ocaml/xenstored/store.ml", line 464, characters 13-32:
>>>> Warning 18: this type-based record disambiguation is not principal.
>>>> File "ocaml/xenstored/store.ml", line 1:
>>>> Error: Some fatal warnings were triggered (1 occurrences)
>>>> ```
>>>>
>>>> This is a warning to help keep the code futureproof, quoting from its
>>>> documentation:
>>>>> Check information path during type-checking, to make sure that all types
>>>> are
>>>>> derived in a principal way. When using labelled arguments and/or
>>>> polymorphic
>>>>> methods, this flag is required to ensure future versions of the compiler will
>>>>> be able to infer types correctly, even if internal algorithms change. All
>>>>> programs accepted in -principal mode are also accepted in the default
>>>> mode with
>>>>> equivalent types, but different binary signatures, and this may slow down
>>>> type
>>>>> checking; yet it is a good idea to use it once before publishing source code.
>>>>
>>>> Fixes: db471408edd46 "tools/ocaml/xenstored: Fix quota bypass on domain
>>>> shutdown"
>>>
>>> Nit: The format of this "Fixes:" tag might need to be fixed?
>>>
>>>>
>>>> Signed-off-by: Edwin Török <edvin.torok@citrix.com>
>>>> ---
>>>> Reason for inclusion in 4.17:
>>>> - fixes a build error in a previous commit that is already in master
>>>
>>> Yes, given this is a simple enough patch:
>>>
>>> Release-acked-by: Henry Wang <Henry.Wang@arm.com>
>>
>> Afaics this patch was previously posted in isolation, and it was
>> already release-acked. What's lacking there is a 2nd maintainer's
>> ack or a proper R-b. When it now is patch 9 in a series, it isn't
>> really obvious whether this could also be committed in isolation
>> (it looks like it does, but a clear statement to this effect
>> would have been beneficial).
>>
> 
> 
> You're right it already has both acks, it just hasn't been commited yet: 

Oh, that's only because I overlooked Christian's ack. Will commit this now.

Jan

