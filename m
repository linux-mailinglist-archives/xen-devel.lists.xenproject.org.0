Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB537CD956
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 12:35:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618478.962154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt3tD-0000g2-R7; Wed, 18 Oct 2023 10:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618478.962154; Wed, 18 Oct 2023 10:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt3tD-0000dF-OK; Wed, 18 Oct 2023 10:34:59 +0000
Received: by outflank-mailman (input) for mailman id 618478;
 Wed, 18 Oct 2023 10:34:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EezS=GA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qt3tC-0000d9-Jj
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 10:34:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7d00::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb0c2a3b-6da1-11ee-9b0e-b553b5be7939;
 Wed, 18 Oct 2023 12:34:56 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7721.eurprd04.prod.outlook.com (2603:10a6:10:1f6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 10:34:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 10:34:53 +0000
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
X-Inumbo-ID: fb0c2a3b-6da1-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aD9uc+9HKoOKwBHbI2huLwifqBtN3c77uoMzfYaX+YxxAvELW99BJqfSZXiKpoyRL+GAmZqEsaWZYCE0jVpVvihGomXp3LABAMzPRzLedIRjhu3DpD4HYAWv+CM+93iDq2qjOyDvjVH4Hl4HD0dAEmqFyqXWET0g4kU0jbWOmmPSOQ/0O/AyfV9MENNah+b5RFEjBdtH+245bkhzlgPYGYrkqE4Xu+fX+9cdxcbaEVr+22QH51yqs8tKx42twaTR9bDykhZj/zzq8V0/o3aPKGy3EaVRHUY2kbYDRvhX4g0w7791//ANoFINPpAbFSweP8wQ2yHvbRfOba2iVdIE/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GnZTBOTiaViRjl2hI0BmZXiyG6wGJy7U9euRhgUX3Q=;
 b=R7IqMOgWDhe663JBmiLZV41OX1maf22gkt0aJtKBztJmTSwcnHa37q/GUn6UStL4UpGTVdLoRCsdX6iaDb71BiXAgqLqliKNyeHWMl+6nXB6W8yrka6P3Z97WW0u3UGCK1T8nJ1YaS94n245bxCS8AASvfR88J3AJSdZXR56bQFeV6msyWfDxnjLFcIzSNiwusDBcAS7N25XYueaIir+AxvF1RXpRNPTZ14SwLvLN31mt9honOMe/LkcjCrXceHngkcUlMWOwIkdfzDtYE+SRIm365qiHojcj3Zar1Ipa8pImoyGUXGvce8WRxpbifWPFHhCGqVNMHQ87INZMrJAcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GnZTBOTiaViRjl2hI0BmZXiyG6wGJy7U9euRhgUX3Q=;
 b=kK2RUx/SAWR5kcQy58LQB4icYI4hDvaa0TCVwxua+h6GDA+9AM5HEdCsYeHIlOVnmcMyFFW2+LJQA6ZkC3vi9GRNiwRIK7EVrAkeyH5uBMqS3n0oZ0nSylSy+GkzF/qoozAKfN9Sogt7rCyr0x6zXgQTv5OJP43KUkZtXRG2LXVObp0IWlwsvH59sdbhSmU3Yte974YuxVejA53SWYerUGvQhnYqMSZjjDe5L2omRRL6lhmb1e0599C4nLwPIfbkRb3ntRtXPKFbg2PRECDOSl138PRB3ha/9FKvdxDRQdG6tfLYWfaLXK72TpRVjhneERDXZVbUCD5EzdYNSzQsew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bc831c56-6c1a-8aac-2185-b9c36babd1f9@suse.com>
Date: Wed, 18 Oct 2023 12:34:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v3] xen/mm: address violations of MISRA C:2012 Rules
 8.2 and 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <henry.wang@arm.com>, xen-devel@lists.xenproject.org
References: <eedcfeb8d1c81527b7e18fcc0eca252577f00035.1696344012.git.federico.serafini@bugseng.com>
 <d7cd7a02-b960-384e-4af2-f70b425e5ad1@suse.com>
 <da6e11ef-f35c-45d7-afcb-8c9b21defd9a@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <da6e11ef-f35c-45d7-afcb-8c9b21defd9a@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7721:EE_
X-MS-Office365-Filtering-Correlation-Id: 48767db7-3492-4135-aee5-08dbcfc5dd9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oR6W46HKrwtemRvMV9iCnD37geX94xcUFCQTORRNRZNworiD4mYhIyJhBFHmzOBX7bemBlXh/y56FEizq0nHP7kdISAYaEyqgvq18zFgQuUfj/g2ChUDGERL6USN0cVImo/Bjcq3V/7o5Q6eKOe+7QWOASX6c/frIBDDCA2nCXTBYvLTAwftOUQQYeS2XI9biCdlqzH8dThKoVxyOXOiUcLTKVHQazcG0Xs00ywWnhw6zl24Xxig7COYPJ8gr9SQCWrYYArTvrhpCBbVy4MiajFqFS6HdLkv28NDmhx0pOB9RVld83/XI2FmR0h1wYmTlzehAqepYmz1K0jHK/gwInuzHV/QjgIWGhiTpfRiPQ578DBfAIM/Xguo/ZYVh2P0qtEXKTw1MgvK0iHyipmUM4oM6HZHYmvpPhPwBr+J/S4qozUI4Z46Gu8QTL0zo9RpPgwi7Cw10y27dwpSCDwbdLy1J7Y2IsoUwXgoL2qkmOeueu6w3MiRbsUpAGBVKjKNWy1Icef/UPn0uOgnmBo/FAY8CvmZx3MWtp1G2sBuNGr2jHo+zbPd0qpgEl3fVh3rJhNrUNNVOBdlcnIrGYRXKuO1PKS6IlWDYAU5aDd4z9OA3CBmGOlhrAUMPOSlsE9djrtZ7wUFbK02z1pQChWyyw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(316002)(66476007)(38100700002)(54906003)(66946007)(66556008)(4326008)(8936002)(8676002)(6506007)(6512007)(6486002)(2616005)(478600001)(53546011)(26005)(7416002)(31696002)(2906002)(86362001)(5660300002)(41300700001)(36756003)(6916009)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzJxQmdHNnpNWkNJU2tDdEdnaDRLRzFHN3NIMWZIL2VvalhNUTU3eU9iRGt4?=
 =?utf-8?B?YkVlSTJtc1lzT0Z2aG90MXlvMEJCNWhHVzZROXR4SEUvLzdFY1ArdkoxQ0dP?=
 =?utf-8?B?Z3dFSGNPcDVjcTF0dC9WVnp3QlI1bWoxMmhiYVJnSUdvb3hLUlpMdUlSenV4?=
 =?utf-8?B?blZidlRoQVF2QjFGT25TY0lML29TNVIrU0xhWVdlMGdmQ082dnVwUWVBdVE0?=
 =?utf-8?B?aEpVN2UrR1dEWWZ4REtRbmR5Q1Q5cWo5dWxvM2FEZDIzTkpZY0pJTVFESy8z?=
 =?utf-8?B?a1FON0M4VDB0S2NwNW1oVFVVN0pPdlU5WjhCNFV1ZVFGbEMxOWN1eG9vYTY5?=
 =?utf-8?B?S0x2K0tIZFZuWmI3QlhYQXJJQ2JNODBkdXp3Z1F4bnlJYUdiTzh0aWN1NWh3?=
 =?utf-8?B?ZG5qWlNXZzRXb0lFSzk2N3pHUFZVZWNoUkNzMld6K1JJcHdQdHhSTTM0MnNF?=
 =?utf-8?B?TUV0M2tzelBFT0swaHJDYkxOdXF4V1ZiWm5Eck1CZ2NjSisrMEFPY3pFVU9o?=
 =?utf-8?B?eit2UWd1YUIyaFZVTkVGcXFodjI3ellBVVVqdjdoRVo0ek93QkJyYlNNQ2xO?=
 =?utf-8?B?akJIVE0yT0pCOUhYcTZ3TG5QYXN3VUdIYmhOWHdSYURRbjBiYllJaGRqMjd2?=
 =?utf-8?B?RjBJSGdTaEV5UVlFWWFzc1l2ZGo4WGNWeVoxMkNZNG9KdUN1TkVabTJ0ZVNX?=
 =?utf-8?B?aWwyNTAvampTTW9FcE5kckNHZ3NxVkIzZHNlSjRGcFAyMFZpRmd1Rk5TMEp0?=
 =?utf-8?B?OCtoMVc3MFpaeVhnQjNJMzZXS3NqYnRnQStmL0MyeWJXRFhmbXdoZndQamxN?=
 =?utf-8?B?S2V4SkpxekNrdjVTa0tFaW5tUWpTQ1pCdUNBdXNEdk1nOU5uUWdMTjVpK29S?=
 =?utf-8?B?M25Ba1VSNTRKNXhYaTFqamNqb0loUnBaTE0rWkx3MmJkY0dOQXZhaXF2UkFL?=
 =?utf-8?B?ZXl4d0ZkZUViZ3ZCVGJZOFRQeXdjMVJ3T21WbHIvVXRiK0cwZnJHTWpSb0Iv?=
 =?utf-8?B?VTlnMUFmQ0Vsa2tZOUxuMzJMNEJqcHpVcTdkZ1dLZ2IzTVIxOXUrYVhtaXFj?=
 =?utf-8?B?MCtOR1dvdnhqUHBtd01mU0NGOTlBQkZ4L0tkZi9WMFRPV0pMa0Fzd3ZnazFX?=
 =?utf-8?B?aEF3N1Q5bFJuY3F6MW1PSmlTU1c5UXE0dTh2VUQ2Rk9kbVZKL0RQSmRWc1l4?=
 =?utf-8?B?ZDBMeTQxRTkxSXpOVTdWODRFRVRsdjRSOXREWnFBNUpzM2ZLL0NCZnFQZTJK?=
 =?utf-8?B?OGdzVlZ2blZ6WDIweHREMXpzL2lkMksraGlWdm1VT2MzL2xlOC9jZGR2Y1Nt?=
 =?utf-8?B?TmpCcE1XcjRKbjFvQU56ZktTczVidWl2TUVMNjVUMzB1NUZxUDFaWVBvY3FV?=
 =?utf-8?B?U3JtZ1B0aWV5SmhEWklFOWh3N1Jxc1RoTTJsREtlbkJYU09sc0ZDOUdUaUNl?=
 =?utf-8?B?WGR3ZURoWkFNRGVuR2tFZEM2MVV5TmcvOUVMVzAraFF1Q1lOZzFad1RhcVpI?=
 =?utf-8?B?am5hdTFJN3hoS3FDd1JaKzZyc2RQeGdpd0MwZXRIR25tUHQ2TVRTRDhpdEsz?=
 =?utf-8?B?cUFXbXl1V3lJSjlMOWhGZklUbVR1VUdQQ1RHNEg1dVEvYy84cXd5TnBIdlZ4?=
 =?utf-8?B?NGdKbDBqcUtrdkt4SHpRR1NBU2w1bnZIaHh4WnViUmpKMlQrRXU4dVFuY1B0?=
 =?utf-8?B?bDNxSzdzd0ZjWVZRRVlkVTV0d0k5eTNwbGFXMWtXVEc0TUhNeFJBejU5emNC?=
 =?utf-8?B?bHJsRTFZMW9GZUlnQU95N3BHdDR3dldjOWhXUGxhWnVpRlZHNHNqK1FwdU84?=
 =?utf-8?B?UTRrNFlraVp1bWMwVTZjdjBaRWpTdGRYWnBBa3laL1liMWU0aDJSQkFWZ1BR?=
 =?utf-8?B?Z3FKajBiaVBCQWtaeWJWYjlaYnlGUWNiVWUvbmFUV2J2aGVnYnFxdm03VHVh?=
 =?utf-8?B?U29FUzNFdmdqRlFWdURnNFl0dEVidkRFMk5EMkJnVFI1ejlwNFZuWElZK0kr?=
 =?utf-8?B?ZW82L1JzQjdmcjYra2FGck0rMjYzMWJOQ0dpbU80elQ5eXkvZnk2bTMvbkll?=
 =?utf-8?B?di85VGJiSldDcWRvQ2JISWtiQ1ROMGZhWU1QWUExeXZYV2xEeTNVMXIrM3VZ?=
 =?utf-8?Q?36Qjr9l4HTsyfgWWmKGDfT+cF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48767db7-3492-4135-aee5-08dbcfc5dd9b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 10:34:53.8055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9l5abiYld5cuOhgULzb8ZTxK8OgzSPyE6b8/2vLYsnv6Ut9jUGpSWmicYzvzViOn9XTPBxHO77YagxuTitATXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7721

On 18.10.2023 12:07, Federico Serafini wrote:
> On 16/10/23 17:26, Jan Beulich wrote:
>> On 03.10.2023 17:24, Federico Serafini wrote:
>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -5901,17 +5901,17 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>>>    * a problem.
>>>    */
>>>   void init_or_livepatch modify_xen_mappings_lite(
>>> -    unsigned long s, unsigned long e, unsigned int _nf)
>>> +    unsigned long s, unsigned long e, unsigned int nf)
>>>   {
>>> -    unsigned long v = s, fm, nf;
>>> +    unsigned long v = s, fm, flags;
>>
>> While it looks correct, I consider this an unacceptably dangerous
>> change: What if by the time this is to be committed some new use of
>> the local "nf" appears, without resulting in fuzz while applying the
>> patch? Imo this needs doing in two steps: First nf -> flags, then
>> _nf -> nf.
>>
>> Furthermore since you alter the local variable, is there any reason
>> not to also change it to be "unsigned int", matching the function
>> argument it's set from?
> 
> If you are referring to the local variable 'flags', it is set using the
> value returned from put_pte_flags() which is an intpte_t (typedef for 
> u64). Am I missing something?

Oh, I'm sorry, I didn't look there carefully enough. Which means using
_nf and nf here was probably not a good idea in the first place, when
both are of different type and nature.

Jan

