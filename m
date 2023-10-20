Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F11DF7D1078
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 15:24:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619776.965404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtpUQ-0007Kr-Km; Fri, 20 Oct 2023 13:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619776.965404; Fri, 20 Oct 2023 13:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtpUQ-0007Iu-HL; Fri, 20 Oct 2023 13:24:34 +0000
Received: by outflank-mailman (input) for mailman id 619776;
 Fri, 20 Oct 2023 13:24:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8lwx=GC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtpUP-0007Il-58
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 13:24:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7d00::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00fb78d4-6f4c-11ee-98d5-6d05b1d4d9a1;
 Fri, 20 Oct 2023 15:24:32 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAWPR04MB9807.eurprd04.prod.outlook.com (2603:10a6:102:384::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Fri, 20 Oct
 2023 13:24:30 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 13:24:30 +0000
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
X-Inumbo-ID: 00fb78d4-6f4c-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLWlruq25vAwFoqnjxRwAq19vJwbMV2+N7a5syXm3DpeyJds3sOmAwTwJUoWAMrcLKlPpAcWBwSWrH5kiNUdNPSsTM/UfFkp0C12W0YfEjMHiLsBP4JtRAFxu98iYKVOePFaPsjYxKyQF5UqV2RUJswl+vAaGZH7SndwTfCMz/xzLe+E1KayeyO8vjsk4gOeTh1VFBAa/tnFP/0CAr8rjO13k4O+pvE/ZFCozkILNAWzBVska1nZ2kPC0EjbCXRJJWVzlz2hLGRmDXCcX+jK4hZp9GkOzEFxPGdZ92yBhgykFf9eWwHbWe/DDWpoUYB9dG+V4Ss2IVEFWtarjVimvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dv39S4Ni7hQ8MPT928Tci0t/QZzxekh5cXID8P5T/uU=;
 b=JrOpsZgnhtfFcPPPSd/GcicxGny1pIij6sFT3erSqiNmu2rt6MJvhfGE2ojXxdO0aMDaYET1Q7uPLoXMV7U+YJeBWmP+ddm9SslRb9v+hGdsM1jdSIgvwYP8ow+czH8irbFAjGMWBTj/b926YsydiyLMyY4h4sG1omsVZIku9KX4G15CDh43friw22h5TX4dJihiB71l8Ra7rCDI7Tj8o8aSTEkqmwNPBi8ucpTT4GzRMq81RMDFqen9FaucD0BKnSf0nVcEkXYi8OIYyHnVKz6GBwovrT6kMnmYQUREqfb3fEbAvgSC0Xmo/xgZBdVItIrTvfnya3ClE4L3LnRxTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dv39S4Ni7hQ8MPT928Tci0t/QZzxekh5cXID8P5T/uU=;
 b=g3qSaTlvB3Z253H3lzI1c8IK1tbAVFEv1KZCy2KjJUuRfDB7bQalZtlZvoW7sZJgONKiHibMQB3UIymOwMtiv66iPlaUmnuqn4T4cjWvReEU8ZHnUOvex8pYQ53bCDDfJ8nCKGXfr5xtVXaCV+xqvh1+zAOllkVtT16ioO9Df5vmzp6wwnM37hmUhHkcJRopiZoAau8T5s6uONuxYgal2P22bQwXHKWXU1kyOPAMi8ZFeuX/WcSzMEPMz70lH5jXXGbyZtg/KYgVIMdV7gloTkewsH9aaS0qNXX6C4Y4HXMpcZyENeJnvB8KscDA/Xhbb95wNVhLgt5K5UuTZX5Nag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d83c024b-05a9-5298-9e43-e693675c2da5@suse.com>
Date: Fri, 20 Oct 2023 15:24:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v2] xen: Add SAF deviations for MISRA C:2012
 Rule 7.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <a9c52c943380f2c35f0a6ccab8215c03e87c99dc.1697712857.git.nicola.vetrini@bugseng.com>
 <de2b666e-ca48-58d2-73eb-5adc797f818e@suse.com>
 <d879b8e4689e51131f081edcb3b2abe6@bugseng.com>
 <dd58e1cb-8f17-986d-f4f9-f39e998e05a0@suse.com>
 <5b1cd4fba12664f2ef49bcc2eb198e31@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5b1cd4fba12664f2ef49bcc2eb198e31@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAWPR04MB9807:EE_
X-MS-Office365-Filtering-Correlation-Id: 6988c762-ed82-4531-eda1-08dbd16fe3fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7hy3n2UcwLaQr4ZsHxjx0E2dG4+gsJg0rrUb7MCckT+oJLQDhB1jejy0DN1qT6K5OkjVSIqHGxTCA512M6ukm0ur4SKRm5OUcXG7OXzg27qMC2Zf2/TbBupo97ubEixVefG3W95nmfXMhZ5mcrg+eJA5Uj283B991iymwvM7/7J7Es38VAGuiOz+f5TwlZjSaH6Q2i1TsWCihanc3ChocHlUppsWDr9rejyMna81ZIzVK5xkZ8be/njvTzbss+/B+9ML3sjDKBaElk/gYkaHdH/+ZBw/bZfGshSjY2Gu12zHZPwT/NnmzN45HDjXChjGmu4IRQ1dgv0/LvkaZwkXG9P7vzi5YRtZQ13P9W59vWQOcuQGsahkMSpnREV7UtjQd1SD0pG7myOE+75T69Wyeae0v358RUmqayVWPUcqTKn4T24ChReylP0eGuzLEFTR/Des795IrLD4qeYI+5l73imKU42DRAtK0rsqaNMFWGE9Ed5iA8MbA1aBniZKu1LXWZlsBiXIG8tuFYnJDtMq7xryCi/gICWl06cnnSRx4S7BBnDRVl4LEAyVlaTktIgpLTv9Q59+lORJaTq+uquO7PN8OdtyZvDR/Is8qOulC5v4f7Dk4irrLZEFDviYhwjlC7fLI5micUgBB0mVzO9h5w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(376002)(396003)(39860400002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(31686004)(6512007)(36756003)(86362001)(66946007)(66476007)(2616005)(6916009)(6666004)(316002)(38100700002)(31696002)(66556008)(478600001)(53546011)(83380400001)(26005)(6506007)(8936002)(6486002)(8676002)(54906003)(5660300002)(41300700001)(7416002)(2906002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjhYMHcxbnlVYmdTdFozRUNjOVB3OFlsWnpvZW9NOHBNWURIczVMYmxGTjNt?=
 =?utf-8?B?TjFRNU95T3U2MUJtL3hpSC9GZUdiRnNvc0VpRFE4cm83SmNCejBzTnN3TUZY?=
 =?utf-8?B?NjFDZHB0QStZaVFvY2tlV09LaHYzUXRtVkd0dVNNb3ArK3N1RFJKRkVqS2hJ?=
 =?utf-8?B?bGxJdnl1MExkZmlxbUxsWHVtdHVhUEdKQi8yc2JCeDdCZmI0NHBKMjhNYUQr?=
 =?utf-8?B?ZldldDZFK012VDBIL2RKYUltdlljK3R5bm80V0hrT1o3L3VxQithc1VwZUNW?=
 =?utf-8?B?Vi9vWTQvVXVZUGRyN3JGS3NpTE9ZODNWMzE0SmdvYnYyM1U2cDZPeUViUmkw?=
 =?utf-8?B?ckRvVTZUQXZ5bWNFd01BYXJjVXdVcEwwMVdDT3oraHM1WlE1OXBpcWNDZDFL?=
 =?utf-8?B?U01qbUgrNGFpRnk1U0RlTWtyT2RPaFpzcHI2a1ZoakVwZlNqeVZyMWZUYUVM?=
 =?utf-8?B?YTkxZ3Z5eWhrRXJlOFNGNE5wbnV3bE5USGNTbHNrMjQ3RkVDdUZMUUtneHRZ?=
 =?utf-8?B?SmJRdlJCVlhNSXRONHFLK1VjYllyYVdVWDZ5WGhlZTljU2Y0V2lQcFRJaGZ3?=
 =?utf-8?B?SVB2UWpnZldwZU1VOGJBcGRrK2s5MkJONjcwYWN0Mm5PcTZOQlQraTR4ODhL?=
 =?utf-8?B?amRhUnplZUw0M0loaFQzWU0waVIxTHIwbVVxRXQybUZvQXBrcVFTWmZVQXRk?=
 =?utf-8?B?Mk1WRVh5bnpKMG9YdWs4bzFXMXhCbFhQUVBZSnA0QUI2V1Z2S0NIVm85Vmp6?=
 =?utf-8?B?bXh2YjYwYnJRdkwzTUdEa2JiL2dNNjROQzVJeVFGK0VwLzE2VzhxNUxPb3p3?=
 =?utf-8?B?dWc5YVBlcC9ETFpSd3pOODd1UitjWlJYaGtDYzlOanZjQmgyMlZ4am0rK2Rl?=
 =?utf-8?B?NzlzVk5rTXhsL2FQVVh3cG5aMC91aWdIdStVVWFnYnRZdGJ5RnQ5bFNyaU9O?=
 =?utf-8?B?ekxSdWtjMHJPOXg0Z1lnSkpjZ2k5ZUxhYkVaZUkycElyajEzMzVOeUpZWFdR?=
 =?utf-8?B?dlN6UjJiR0YyL1dwMFlZWXFLOE5DcTloRFJxcUtlQlBUNzA2QkxZVEpqa2dE?=
 =?utf-8?B?SEc2RGFYOXdhVHNZYzE1VjhITmxmU0E5ZGoxSkhjUDNLbHd5VXZmSG93Wngz?=
 =?utf-8?B?UkFtZ2grUWNweXpjYjh4OVZxdVRINm5ta2k3WkRxOERNbDhqVGVobDlVZENZ?=
 =?utf-8?B?UUFJN3R0K1FpNkI5VGx5ZEp0cHlTTTNGdDBUYmVnV0QwdWtYTHlIR2txWXRu?=
 =?utf-8?B?cUhDOGF6V2hqTFVxaFlhTzZFTkRPTEdZckpYbTdiTWdkcDY1dVA4WVdGc2VU?=
 =?utf-8?B?TDF0SldVblB6SkMrU3BIa2I4Y3IvRk9udjAyUGJVZmU3aDliYitXc25sYnha?=
 =?utf-8?B?NGtyQ2NqM1U4NllZeDlld1ZFQTlPbkJZcEhNMGc5OWROZzVDOVA3RmtWOG1x?=
 =?utf-8?B?MUJJdTdmZWMvSysyeFJhdEc0V2pwanNjVmJyUFF6T0pTSFk3aEhCVnZycHZ1?=
 =?utf-8?B?LzFaS1dzakFiZW9rMFFyVkFYdm83a1hVWDIyQ2gyRWUrOHBHa0RuSERxb2NM?=
 =?utf-8?B?Wjg3TllDZWpiVWt0UTFLN1dORW5jcTFtdGg3b29XMGVxT2grL1h6OUs4TjZE?=
 =?utf-8?B?cEVhVlRHTzJhVVA3RkU1WEtQUU14QWh5YS9yMVR3UlFOb21XbDlORHhQVCsr?=
 =?utf-8?B?T0lqZDZmbHZobmdpLy9CSFVEQm84eVBISVN4NUo5TXd6Y2ppcit1ZFlzYmps?=
 =?utf-8?B?Z1JyY3BxTmhPM0NkalhXL3RVVzRLSlhSS3BrTHNqMTlGTDJlcFhtSnVINDU2?=
 =?utf-8?B?UDhZMENjWW5wLzVNMnhzTVZZQ2Uwak52TnhJbnFic3AveXZuR203V1M0VzJQ?=
 =?utf-8?B?VUtsbEJvMHlTdVAzc1RlMGQrZW4ycElyT2RmZ00zTEhvNGhwbW96S0oxV0l0?=
 =?utf-8?B?T2lUTk0rU3RXUXhxOFFSbThkTEJrd1p4b0s5NGdzYnJXZExUa1lXaXpaRHFj?=
 =?utf-8?B?TlMrWUt2YnZEQm9aRW9pSVVwOW14ZlhQaE8yVUgxQ0RNaUZFUDBZN1c2TGQr?=
 =?utf-8?B?VDA5MHhoNGkzVFZNWm9HNlJYbUlYYkh5QnZrRFpyZGtaSmZqRVJsUFFUSDJ6?=
 =?utf-8?Q?Ftqs50O+0TvRXuIC/KlX1iBTq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6988c762-ed82-4531-eda1-08dbd16fe3fd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 13:24:30.1282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3qUz0S3JurRhUhVV3eGea6p4GWqz+knZfPHPnklNfTu1RRp1VbhQwMDJJAosnKf/TGafF9OJK0jk7cHySvd1Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9807

On 20.10.2023 12:33, Nicola Vetrini wrote:
> On 20/10/2023 08:38, Jan Beulich wrote:
>> On 19.10.2023 18:34, Nicola Vetrini wrote:
>>> On 19/10/2023 17:57, Jan Beulich wrote:
>>>> On 19.10.2023 13:04, Nicola Vetrini wrote:
>>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>> @@ -85,10 +85,10 @@ conform to the directive."
>>>>>  # Series 7.
>>>>>  #
>>>>>
>>>>> --doc_begin="Usage of the following constants is safe, since they 
>>>>> are
>>>>> given as-is
>>>>> -in the inflate algorithm specification and there is therefore no 
>>>>> risk
>>>>> of them
>>>>> -being interpreted as decimal constants."
>>>>> --config=MC3R1.R7.1,literals={safe,
>>>>> "^0(007|37|070|213|236|300|321|330|331|332|333|334|335|337|371)$"}
>>>>> +-doc_begin="Octal constants used as arguments to macro INSTR_ENC or
>>>>> MASK_EXTR
>>>>> +can be used, because they appear as is in specifications, manuals,
>>>>> and
>>>>> +algorithm descriptions."
>>>>> +-config=MC3R1.R7.1,reports+={safe,
>>>>> "any_area(any_loc(any_exp(macro(^(INSTR_ENC|MASK_EXTR)$))))"}
>>>>
>>>> INSTR_ENC() is a local macro in x86'es AMD SVM code. A macro of the
>>>> same
>>>> name could imo be introduced without issues in, say, Arm code. The
>>>> above
>>>> would then needlessly suppress findings there, aiui.
>>>>
>>>> MASK_EXTR() otoh is a global macro which ise used for various 
>>>> purposes.
>>>> Excluding checking there is imo going too far, too.
>>>
>>> I should have thought about it; I can simply enforce the deviation to
>>> additionally match
>>> only a specific file for each of the macros.
>>
>> That'll work for INSTR_ENC(), but not for MASK_EXTR().
>>
> 
> Why? What I'm deviating is reports due to octal constants used in 
> expressions
> that contain MASK_EXTR in their expansion if and only if these are 
> located in the
> file svm.h.
> No extra octal constant will match all these constraints.

New MASK_EXTR() uses can appear at any time, without necessarily
matching the justification.

Jan

