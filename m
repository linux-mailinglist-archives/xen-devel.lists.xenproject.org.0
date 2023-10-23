Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8517D2C74
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 10:17:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621060.967081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quq7e-00044j-8l; Mon, 23 Oct 2023 08:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621060.967081; Mon, 23 Oct 2023 08:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quq7e-00041u-5v; Mon, 23 Oct 2023 08:17:14 +0000
Received: by outflank-mailman (input) for mailman id 621060;
 Mon, 23 Oct 2023 08:17:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1quq7d-00041o-8j
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 08:17:13 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20626.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 912cfb0b-717c-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 10:17:12 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9638.eurprd04.prod.outlook.com (2603:10a6:102:273::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 23 Oct
 2023 08:17:09 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 08:17:09 +0000
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
X-Inumbo-ID: 912cfb0b-717c-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xpfu3Q2Q34072HEOnP+sLAazZl8pJGK18qrLezJPJwZvOhQMBMmE25KI24Wgk0MU3EKjmGVaRvJoXvHjEG73SJqsXwnbYyACe9XBHuik1btT+Qk/vNQCdt7IyVl2wTmRWgOgWRV1mt2rAsOgPcA2lFHSYl4kv3zjEHdv4dDBWlcdeMiHHrZqTW/3MzdzhVR8Vlw608Vdm3JKKNaFd+/z83y/6OeBY6f8l2yTOT7zs9Yld8zjX7DgifiuxyRR2JMNp6svVneajqSSRZBPHBcFPKUdgpgx2oJLK5tkGQj7Fnrd/tA0Un0CiJuiB9DmLT0WkI0xIS4cYnnoSDki19+l1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l42HPtITSB6Jhs/9RaNRTCiOQ9s5v32+L7ZkZtXXPbM=;
 b=dueIG0Fp/BC6U5hPIeBhCsHZdXbS78KD/EnZmk55wP+himkpXA5ItJ17TBqDaEF41Ue4EWb1GfJ620wgzXrGHTVTK+dw3uegz9wmT4Susd/EkBk77WmtXixoj18Ozo5duloKwfievEfcz3Qd/+HFRyQX5DNhWWMPwnXNhA5YZl4ffcf33QcHIaarT0QxxLvX412QWy59zcIVo/3SkT8GAS9aSwadIXVVxb833xyQAm+ZPEQ4kglzgH1rbsJr3iNbqhu9rk/pReILxmWgM7aB/TYhCw35wXUt6KsLed2hJRt+1R7mnJHSiP+peJEEvduPbh9OZ1yv1JBeivsiaZHA1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l42HPtITSB6Jhs/9RaNRTCiOQ9s5v32+L7ZkZtXXPbM=;
 b=TT2QRpdBiuPwVarMJhY++EUlzzfrRfxnAVyDi/kppwNg3WjTOGRe4Krh1/uv83tG6cWqhRsnLmaVqRgCWKWNNL6Dep7wlnvOGaQ87cEp8P78k+h8ny5i/JRpxar382mnO3p0Icdyn/k0mNsD1f+/5qz9NplTDaJwSuDYyxj6/rhHpc549U0n3Kl505AdcbQlclBs1rY0c2FRHeP6vjqmyIwT1v5g/I9G7hN7H/vfPRcRR9OwVaFhxDJnsqDl7tc3WP1cEUIynlHVyQqo7w7439qR8q1tWdLZ14h/P6syxOECuKzmslntV++AVey99Cn5Rufs1FssuLwQ2cI1lWptKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <23f2682f-acc4-20aa-21fc-644a3c1141b5@suse.com>
Date: Mon, 23 Oct 2023 10:17:07 +0200
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
 <d83c024b-05a9-5298-9e43-e693675c2da5@suse.com>
 <6a90edf81f410db8069526228de75d7e@bugseng.com>
 <7d7ebafa-9751-bd0a-c47a-1894d9edadf5@suse.com>
 <800b2c809829942210323804b6778c40@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <800b2c809829942210323804b6778c40@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9638:EE_
X-MS-Office365-Filtering-Correlation-Id: ed9aec4c-3f04-4cb0-47e2-08dbd3a073eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RGyYpqzYHkyyB612DOn0PVCk3H3E1q9y5uwAIej5xRtzK4uan/4PBEtGdslymJIG33P+XpoqcQDoaJlUy7YCtO6jIca/vw/HJZiW+9J4zbDqOrEohj64e40a5n6qlLFguUoFhDuI/aIAZWD+hvNcgTQpQHqNaotLT/F/JwOLSVjF+L8a9W4RcGcg34ZytkHGmYecfvKOiDLazCabMlwP8N2L0Ezwc2aje5gc7yYbB7sqWB28I7HI6uFjJbzFE9edGt8KCUhD0VrpaezhC/saPw6zGktyWKCFzrsFtTuKaCKSPPFkUemWVzyEp78mIp2DARf2FhBNk5bc8fFnAcHge1U6yZunHmvglprh/nDr+G9cQCBw27XRi4jjMVoO3iiKTwMwUPjHPu1VKhuxzfALHNAd7AhleGaOgB7zMFWCg1cY6GMWONzFMEgv0TzBqYHVoRMlRcuIWmnUZorrJDMW5OpLtf+Lreh87pw+/wb1oJy7Nzomi/6xZEMuMkxMmtjSQmNYdkEDS+II6FqDiJwJ75BdlokpjpxbMSulhgc3bdcIFKmgOjoL5wi2H1adDJLG3WX1bxSKIucT5E7lCCZVLNjXwJKK33kMkBwehgiwYENo7n/7JpaEILREsGbCQBIshTsIu0jDOmNz597Ae7OnkA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39860400002)(346002)(366004)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(31686004)(86362001)(2616005)(38100700002)(83380400001)(2906002)(5660300002)(36756003)(31696002)(7416002)(41300700001)(26005)(6512007)(53546011)(6506007)(478600001)(6486002)(4326008)(66476007)(66556008)(66946007)(8936002)(54906003)(8676002)(316002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z09JRlNQTGJ4U3FsUWNzWlNFLzFTeXFwWjc0NDVZb3ZyRXZiay9VQm5zUy9P?=
 =?utf-8?B?eGl0QXZIN0lTWkFMOHNUYzdRWlpFeUp2QTNzMnFDWWZsRlY2NmJ6SGRXL011?=
 =?utf-8?B?ejBlWEljWWJDZVFnL2N3S25EZ3Q0Zkp3ajJBdlZxTlZ6NkRvTFJLK2NjTklX?=
 =?utf-8?B?SWhUU2ZTbmdlYkFSMFE3ajh4ZWdSUUh0dzd5MXRibkViVjNON2pCbHd5Q1VY?=
 =?utf-8?B?RUFnV1kwMWNrbmN1R2R3NW5qZjlySmY5TWhhMGFxMW15aTBXUHVmNTdwZEhm?=
 =?utf-8?B?YzRCamtlQ2xIWnhtZmlhYU9JclRRTGZtWmd1Zy9rRUQ4MlduQlpITzFqWE02?=
 =?utf-8?B?a25wNzVUQ1IzWlAydHZYb1kyM1RtOUVyemxiUlpOb3hBSXUvMWh4aVhyU3Nj?=
 =?utf-8?B?YXpTb1drcHhibklHa2l4c0tWaWxpc05jOEgzdzVBN1pscnFMcG51VGI4TkZa?=
 =?utf-8?B?QUNwbEhmRWcyUGhVMzhHeHBONHNYNTcxbjVFakN6dU41VnliVHZ1OHpjOFVK?=
 =?utf-8?B?MnEyVnQ3NW1hUkpEQ0dMbWxwaXIwUHdzQStNcVRVRkNnVW1EMDU4OHNoUHdy?=
 =?utf-8?B?aytxalk0NjVRTnpzNHpRNVFIRXQyamFDZm9CY2Y5S0kvaXZCc1FObjJMWDd4?=
 =?utf-8?B?bjNHMDQ5TGVhV2t0M0ROT0xoTnNYKytTWjN4R3diWERhMmw0YmV4eFRFa0VS?=
 =?utf-8?B?N2ZteG41eDM2NjBiUHdwbjZmUXBvYXdyWnRQbzdTaXB6VXNkUzBJbXhidGsy?=
 =?utf-8?B?MWROZlE2UFFZdmdZdVoxQndRV0xzZ3lCcGVkNmVRcXgxL3lNemNEYnJyTWxO?=
 =?utf-8?B?UzBoTlJaTVRmQ1pNQlFZL20zYWZGeWkrM1Zrdnhwdm1mbGd6VW1IWTN0RGRW?=
 =?utf-8?B?YkFZUHFiRVc1THVrZXZielV1aWhtaXUvMlRYajVSSERoci9wOGw4azZDQlVI?=
 =?utf-8?B?U056M0d4cHdNZUtOak5ta3RsT0dlR2QyN2pnNFovTmYwajJiVTJuOUVDMWhX?=
 =?utf-8?B?VU9neHpTNVVWY2FvMXNDZ1M2S0lvM3p1MlZUQndlU282V0llUHZOKzFRVU44?=
 =?utf-8?B?OFpEdFd6eUV5RitBMVJ0dm1zYUtUaTJKUDJnL24zWHd2eW1uZDJDOEVWUU5F?=
 =?utf-8?B?aDVNaDJTb1lPLzJyYmpFanpkc1ZmdldHVStrTE9PQVVMd0ZFRFFYcUVPakc1?=
 =?utf-8?B?bVRaU3hTL3NnRXZNNlluK0RWMzg0aVdDaEp2ak5TNVFzRURvTU5rbEtqSkpH?=
 =?utf-8?B?UmhWNE5xa2hSTkxuanBWRHRiZUZ4QU5Eeklnci82S3BEZG9FY3ZTUUZTZGk1?=
 =?utf-8?B?VmUyVEFjejh6WHhUZ1QrOFVZN01VbGp1VTFDVmdWTDcwWXFDalhEUTJjRkpu?=
 =?utf-8?B?NmhlZ09pUGZMSndweGhUdS9CZ29DdjJBZE13ZGFkZkJ6N2ZuU3lJOTV5L1JM?=
 =?utf-8?B?YllUd1V3ak84MkkxV1BVYkVUVmlHYlB5Z0xJUVltZ3c3R1NIejVUSlF0d3Rz?=
 =?utf-8?B?aFZUNnVuYU1waitQblM4ZUR5dTZZQkZrWC9wbXh0WTZQbjdFa3V3aHlseTRV?=
 =?utf-8?B?aEtRUXRtM2IrYVlSbDViTWdIbU02Ky9YOUl1djFqN25xS244RE1FOUF3WFo2?=
 =?utf-8?B?UWoycExwdE1RM1l4TXJ3enMwMnlDNWtvTi9xMG1OR05WMjViUTl6dXlJVHJ5?=
 =?utf-8?B?d3hta1FTb0dzM0ttMFUvQ3hrQ2txTGptVHNxMHdMd2ZTWVNhenZpakkwZFYy?=
 =?utf-8?B?VnB0V3JheUU0YWM5MWdnWE1ET2c4VG00MDViajhQays4dWd3QndnVjVnczMr?=
 =?utf-8?B?ZFRiN1VTMkpWdG82Z2MvaDhiTjIvaHFPcm95amphVnVJVFdsam9NUzN1eGFS?=
 =?utf-8?B?UHFvbUcvbUpNQkEybytpV1JYdVpTYVJUVllKUnFmOHFTRnhFOEJUZnNUVlhK?=
 =?utf-8?B?ZnZQSmdQOGZLamxoc1kyMWNraW5rSG9VNUhkTnVUcHNObW9scmx3UGM3U1Av?=
 =?utf-8?B?L3BDZmYzR205eDFlODZWWEQrUWlmOVNkTFNlZnhlRjdEVlI3RFdUQWhiYktn?=
 =?utf-8?B?aURsSGRzL25NZGc3K0hCVDBPRFRTVm5VcWlGdzJaZHc1c1ZJWHVsb3FXK2lC?=
 =?utf-8?Q?Y9tnaf48ohHHQdVm6OrWdTgQq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed9aec4c-3f04-4cb0-47e2-08dbd3a073eb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 08:17:09.7116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eCzbUjRR6lb03Jti4Hhp0yyQsN+Etz+DUMV16C0wENcsTH/dJh+EGc0QcdUMSp6XqBmiJJa2L67+CELLV3U+nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9638

On 23.10.2023 10:03, Nicola Vetrini wrote:
> On 23/10/2023 08:34, Jan Beulich wrote:
>> On 20.10.2023 16:58, Nicola Vetrini wrote:
>>> On 20/10/2023 15:24, Jan Beulich wrote:
>>>> On 20.10.2023 12:33, Nicola Vetrini wrote:
>>>>> On 20/10/2023 08:38, Jan Beulich wrote:
>>>>>> On 19.10.2023 18:34, Nicola Vetrini wrote:
>>>>>>> On 19/10/2023 17:57, Jan Beulich wrote:
>>>>>>>> On 19.10.2023 13:04, Nicola Vetrini wrote:
>>>>>>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>>>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>>>>>> @@ -85,10 +85,10 @@ conform to the directive."
>>>>>>>>>  # Series 7.
>>>>>>>>>  #
>>>>>>>>>
>>>>>>>>> --doc_begin="Usage of the following constants is safe, since 
>>>>>>>>> they
>>>>>>>>> are
>>>>>>>>> given as-is
>>>>>>>>> -in the inflate algorithm specification and there is therefore 
>>>>>>>>> no
>>>>>>>>> risk
>>>>>>>>> of them
>>>>>>>>> -being interpreted as decimal constants."
>>>>>>>>> --config=MC3R1.R7.1,literals={safe,
>>>>>>>>> "^0(007|37|070|213|236|300|321|330|331|332|333|334|335|337|371)$"}
>>>>>>>>> +-doc_begin="Octal constants used as arguments to macro 
>>>>>>>>> INSTR_ENC
>>>>>>>>> or
>>>>>>>>> MASK_EXTR
>>>>>>>>> +can be used, because they appear as is in specifications,
>>>>>>>>> manuals,
>>>>>>>>> and
>>>>>>>>> +algorithm descriptions."
>>>>>>>>> +-config=MC3R1.R7.1,reports+={safe,
>>>>>>>>> "any_area(any_loc(any_exp(macro(^(INSTR_ENC|MASK_EXTR)$))))"}
>>>>>>>>
>>>>>>>> INSTR_ENC() is a local macro in x86'es AMD SVM code. A macro of 
>>>>>>>> the
>>>>>>>> same
>>>>>>>> name could imo be introduced without issues in, say, Arm code. 
>>>>>>>> The
>>>>>>>> above
>>>>>>>> would then needlessly suppress findings there, aiui.
>>>>>>>>
>>>>>>>> MASK_EXTR() otoh is a global macro which ise used for various
>>>>>>>> purposes.
>>>>>>>> Excluding checking there is imo going too far, too.
>>>>>>>
>>>>>>> I should have thought about it; I can simply enforce the deviation
>>>>>>> to
>>>>>>> additionally match
>>>>>>> only a specific file for each of the macros.
>>>>>>
>>>>>> That'll work for INSTR_ENC(), but not for MASK_EXTR().
>>>>>>
>>>>>
>>>>> Why? What I'm deviating is reports due to octal constants used in
>>>>> expressions
>>>>> that contain MASK_EXTR in their expansion if and only if these are
>>>>> located in the
>>>>> file svm.h.
>>>>> No extra octal constant will match all these constraints.
>>>>
>>>> New MASK_EXTR() uses can appear at any time, without necessarily
>>>> matching the justification.
>>>>
>>>> Jan
>>>
>>> Sorry, but I don't understand what's your concern exactly. With the
>>> improvements I proposed
>>> (hence a new patch revision) I see the following possible future
>>> scenarios:
>>>
>>> 1. an use of MASK_EXTR() in a file other than x86/hvm/svm/emulate.c
>>> appears, with no
>>>     use of octal constants in the expansion. This won't be deviated;
>>> 2. an use of MASK_EXTR() in x86/hvm/svm/emulate.c appears, with no use
>>> of octal
>>>     constants in the expansion. This won't be deviated;
>>> 3. an use of MASK_EXTR() in x86/hvm/svm/emulate.c appears, with octal
>>>     constants in the expansion. This will be deviated;
>>
>> This is what I'm concerned of: How do you know up front whether such 
>> new
>> uses want deviating?
> 
> I understand you concern now. I can argue that all the macros in that 
> table have indeed
> an octal constant in their definition (0 is explicitly allowed by 
> MISRA).
> This is also specified in the comment above the INSTR_ENC macro 
> definition, therefore any
> new addition should have an octal the second argument to INSTR_ENC.

Right, and I previously indicated I agree as far as INSTR_ENC() goes.
What we appear to continue to disagree about is MASK_EXTR().

Jan

