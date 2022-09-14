Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9363F5B8196
	for <lists+xen-devel@lfdr.de>; Wed, 14 Sep 2022 08:44:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406785.649158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYM8O-0002xJ-Ai; Wed, 14 Sep 2022 06:44:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406785.649158; Wed, 14 Sep 2022 06:44:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYM8O-0002v4-7v; Wed, 14 Sep 2022 06:44:32 +0000
Received: by outflank-mailman (input) for mailman id 406785;
 Wed, 14 Sep 2022 06:44:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oYM8N-0002uy-7z
 for xen-devel@lists.xenproject.org; Wed, 14 Sep 2022 06:44:31 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10061.outbound.protection.outlook.com [40.107.1.61])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aedb5943-33f8-11ed-a31c-8f8a9ae3403f;
 Wed, 14 Sep 2022 08:44:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 06:44:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 06:44:26 +0000
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
X-Inumbo-ID: aedb5943-33f8-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=efQVeguR8UUiN4yv05XBSv6+aX+8EEQ4CBU3e+cP+1GlcQPAerNvcnmJ79pUBaIl1YXP2XoggrUgA2QlYvTqIBgnH3u1cLSfelw2U3OIRjazEA6Vlw+07xhARLkTgr1DglWpknBv/EZ/Mu1np5DDbTvtmzWfEKJZjKUZ9WwVhw1xnTETfSOVBQWRXu3QXgrrh4foBfhgorxpWHxa4Bo0sbvZDMFPGGI6Snmb42RYUFWHMJ5Yyh38pIiNyG0cXSpt+fN8xhFKO8EG8z8y00RJVxOa+CiRBR4d+OsFLnLxnBXPVQUh1nhnQh7xh2p54XnDm8HeRCPiZB3jZuGeDzMNQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYaNcawrhpuZ47FaJSjbasxEWLPRosz4mIU8FFPRdNk=;
 b=BHqXAAEhVzTsHSL5te+hK0td2LG8oEGWKaqZuq21ewH4qx1Nkc2O5BAjqPw9sEUX4XOUVfr/rs9FRpSnbEKsVRWE8Njs7JJZdmyj+LQbHCs/wYJu79/R6e14iRmf9XZYGAr/SS/H8m46RMXcklPCya5JjGZtb4edDeVH/6ukK4XI6CJ5SCXf6hZLS/bQXojnWzEBvtj3lIrcDBDE9EVqzJuBWz3/qbcAB6briep8mbNRTDVWeWfCzFp4D9W9Sqp+/HQpcqvINeaR4ZL5liSzS9LrneHTrkpv5NVn/Qe33hNYHlM6Q3HKk12XfpXrhIcbIv3sDuUUGBfpravhVC0acA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYaNcawrhpuZ47FaJSjbasxEWLPRosz4mIU8FFPRdNk=;
 b=pKDFneloNzUZXto/HOovEP/Z5sxdYzsQA5pr4UyEYtXAPoX+RtNrW7iF/2O1uVuhCsPiMFCaYb70AwsXLKKr63slbErvuvU9d4rNploBGFzvWLYC0dNKHaD0WGl9XhKEcws6KD+PFTJE6psGQrcO38WtvyzI84QLBNRtdv1v4NXU8fNSkAHzQTwYR9sYuVX1gfIGCdtlNf19AlGrLtqeYAxiYNK0cd6tOyZREsP2Fcy9N+RGu229F1+gB7m49j2urfLDqEZl/cK6MyD7stfRZ30rxvK4i0wM+1KVtgBs2vjfPKhN1M5FVWQRjWzRghTi/bd9uq74I8AmGlmUPPtUxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <62f0ebdb-d06b-f361-40e9-711258c03a56@suse.com>
Date: Wed, 14 Sep 2022 08:44:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Setting constant-time mode CPU flag
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Simon Gaiser <simon@invisiblethingslab.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <YxFk2GaIQVCAFsyi@itl-email>
 <1d7b9e30-975b-b49f-fe09-e2aeda9e2af6@suse.com>
 <1b85702f-7efd-b13f-40d4-615750e20f4c@citrix.com>
 <YyCSIxyH4hDmTXIh@itl-email> <037151d0-0920-5d99-9932-df044729c00a@suse.com>
 <YyC8PMxsQyRp07vW@itl-email> <61f083c8-34c7-563b-b010-8d8d0286da6a@suse.com>
 <YyF3UoneRmBGQSHo@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YyF3UoneRmBGQSHo@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: 48e8a0f2-4fa5-4cfc-7884-08da961c9145
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9v9hvoj+Wnw00zNDnPVUffybtB7VpiTUIQCWHxgocIqkwy6zaAvf20nJMsF9wvznSm4jDAXJnQemgODpzCR3BFLQAHD0wZCucSNETec4eDVvjclTxMu86lS929mSDbSs+iNZX36RV4/n2H2SJ497FOPCxAHQU00bCB/6j9mZby6wxl18CS9Uvdsp46OlME0ue0bSj+ejLeSg7IDMa4I7Ij2Fh8+T/MCnnCMQUo70DdCrfeJE+W6mCnY4fC/5Ddm7Pe3+B+1Xw2sRIpxTYEQD7XF1su5r5KswuM91gk6LBgiAWXjlt83ys3hS31wTNGG2eY9tJw0kzw6mmrPPBegjrZwC5HgoeNEY6bpR4G/HsK/IeHClcXr5ketu88YHQvQULpyVA86DhnKMaXQ89/anRQadI2SqWIbNh2PO9m3boejwPbzhALIGb3KbeSkzkx3gk64bB3NdMlcaExZUIDT8nW7PY3I7HfZcKKHU5mlY5NOlZSZKB1LfGkejvodcSBPUouGkAks8yPPO55BFwr28MaNPuViZ/AvW8WchduNONxJXqsWvNxBDkT+xE3yxqb7Jcs/XfeWGR+ziFlY6KM/kfJTGZvcyuHSgGRXcnTzbqzuPOHi8khXKLnVHIqXGhbtpo8B0e5DfdAbYQoMp54WMnZywF/Jp7OVObyz7PQlvWnYsA91LKB8jv8NMZe0YB8xwG/1IZZjF99NCJRx6YOT3peGDMUOx+tSNUw3u6UCLc6vm+FNqk7y0jKeEw4UMmFOdjnTm4TdtcT5YfFohEtv2fh179KfbFDXOXaurifS5OgwVRa9gNBvhi5QqvtLGHabsx30V76XlJ45JBbBA+lVrGw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(396003)(136003)(366004)(376002)(451199015)(83380400001)(186003)(2616005)(38100700002)(5660300002)(8676002)(4326008)(8936002)(66476007)(26005)(2906002)(966005)(66946007)(6486002)(478600001)(316002)(6512007)(41300700001)(53546011)(6506007)(66556008)(31686004)(6916009)(54906003)(36756003)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkRtc3dGdEpPdDZEUkpPYWpPQU1nK0tLNzFicVZrRVNURkpKUlVWWjdWZUF2?=
 =?utf-8?B?Q3RtanI3RGhFRG4ycHNnRjFZR1c4RW9xTEg4UFc2MGlXUWpqdnZSR3U3c2xF?=
 =?utf-8?B?RHI5dTd3UStXTlc3Q3ZqaVV5Z2RLSUs2VXFXaXY5YTEzSXZpUlZ1Z0x2dStS?=
 =?utf-8?B?UG5kdndHekVHVWhDeStZYkk1VWplZGhPbWRTTk9Bd0tnV3FLM1NkaFUzN29D?=
 =?utf-8?B?WVpRVXZDWCt2YUZGMGRucUlSc3QzK3lQbjIvZUhaTGhwaXRnZlpIb0c5dzJ5?=
 =?utf-8?B?VlhpR1ljZkRuYm5PeFJKakpzOGNtS2RCSHNFS0VxZm54VjlXWTR2SHdKM1Fv?=
 =?utf-8?B?UGZQNXc3QzRxeVlYeDkrZHhSc2F2M0Y2NHQyQ1VMeHZvVUF6eVc0dWxPa2JV?=
 =?utf-8?B?Y3k2aEVXT0hsNTNXaUE4T0wyL081UFVlSDNDeVlqSmdDWGQxei84R0tXWW1i?=
 =?utf-8?B?d3RMWFFDcUthYzhwcW5iR1EvZUxYRnVwamEzZWZaejRuZ0kvbmcrTmhyYjBh?=
 =?utf-8?B?eU5zS2E4Z2ZsVnZMb0o3d0hkNFFLb2F2TDh1SmVBMkVmYkFPWnFKNkJ1SFY2?=
 =?utf-8?B?ZksxY3JuQTFvRHU0MFpPNkNMNmh3U0k0dlB4RmFSSXRuSWt2Q2FWOWdZN2dJ?=
 =?utf-8?B?M1U4ZFNha0dWcU5jL01KeXBpdTAzdE1yNFdkVlVreGRSOFZudDlrYmtXYVRt?=
 =?utf-8?B?VWw2NE5ZVWVDWFZhS250cDJxenArVml4RjJBZnpRZW5WU2hYRERkZ0RYWDIx?=
 =?utf-8?B?YXBLRldYVHR6Rk5ZWUU0VzZERTZmeFRlYjJjWEZUazJPWjlNVnV3ZlBzc0dt?=
 =?utf-8?B?SVlUMldGMkFaa0Zhb0tGSVVuT1U0OStiSEdwNU43SGVJcjZYVEQrMnp4OHZO?=
 =?utf-8?B?SFQ3cjdTdkd4RVVZc3lMUE4zTUE1VWtTK082YkZCa081Vkc2QXhMY2pqTEp1?=
 =?utf-8?B?UE5ES0plNFdiWnY4alA4TjlFRFZsRmxCcnpmMm9nbnpuZ2x5c1hRQ0ZWT3li?=
 =?utf-8?B?K0wvaVc1ZWxqMzhxKzB6QktBUGFISW56TzNhUmR3d3ZoRjB2RTZWUnNFZVdw?=
 =?utf-8?B?bWl1M2trV0dxb2hYVWxBampTeTlTWDNTcTZ6VlkxRlJtMjE0dEJCNlBFVGdt?=
 =?utf-8?B?dnZkVUcxT1hLRVBWSVc5MnAzY3J6ZHNzVGxLWFErWHVUNTh5SjlHczdRYytM?=
 =?utf-8?B?SVo4bVJaenNjYmNVRnFuMlhYdUhubnBzU0N0OGNIVXdrWGU1RnljK1ZlSU5K?=
 =?utf-8?B?Y1pSdHhKTEtic1pSREkyNHVnTVRKQWNrOVdPQjRjWU9NQTVhY2R4YnpSOHh0?=
 =?utf-8?B?cmNzU1czcklEU1hwanhjYWlrbDE3Z0xPMWIwV1NLL2x1WVdwOFBCa2YyVU95?=
 =?utf-8?B?VnNWN2o4cDhIYWxCRXJyRjVaYlQzdVVrODMwVTczcE5yc21FbVVaemlGTkN0?=
 =?utf-8?B?bW5FOFFVZ3BuK0VnWHRmSXBBWW5CQ3d5bmk3RHJJSnhpTndvaVc1bzhTOSs2?=
 =?utf-8?B?T29LV3FscjQvSjI1Wis2MnR4OE5BaDRleE5CMzZxbnROU2xSc0RLTkhRL2R4?=
 =?utf-8?B?RDhQYXYzRStQNDhabFhlNEdQb09tU2J0MzhRZDQvTXZUMHFEbU94NWJOMnpV?=
 =?utf-8?B?WHB4amhuVUp2Qkc1ZjUvbzVZUmNXcCtYVFA1aWFqQlZOb09VcnowR3d0czZq?=
 =?utf-8?B?MTFuQXVVQjdIWkNTV2xzYXJwTnNnV0xzaWxjaFJ1YVpEMmxhUVNyQXF4N1Rj?=
 =?utf-8?B?b0NnZTFQRXVvZXBIdkxSbnE5RGtnSC9lSDFJbSs2azV2Mi9YeFJyODZZR0w4?=
 =?utf-8?B?ZGZaTUpDSmZOVXhpaGtxQy9sam8xVDNUVUpyQ0R3R01oMjcwaEgzTEg3Tk0x?=
 =?utf-8?B?bGJsRjluZDZ5UUkyM0xZcDFmeVJEU1VBNU04T3pUcHFHMWRnVTNPS3U0dkF0?=
 =?utf-8?B?c3Azb1pkc1VJK05kbVY1dEx6ZjJRUnB6ZHlxZFloNytmNElMUm5xbmJCanJD?=
 =?utf-8?B?YkF4M09KV1RoK1VyZDJ2VWxNUXVCejQ5MHdMZmpacThvZDd5ZDJveFRndmdr?=
 =?utf-8?B?cVRUSFN5SXVmU3ZTR2JzR0dkc2Rpb1VHY0dtVVkzc1AxUGFncmlzVk5jbkVD?=
 =?utf-8?Q?P8NaREFa6EpS8iwzgkkokA1uk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e8a0f2-4fa5-4cfc-7884-08da961c9145
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 06:44:26.8564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CkkOd3rlFFJNdPtJ2Y5vDSeL8MNAyyElxB9v0SYZNZHP6hlyI0ZtG7XsAfcJNCEvZrRVC3o7CIq7yRIguOiYAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7737

On 14.09.2022 08:40, Demi Marie Obenour wrote:
> On Wed, Sep 14, 2022 at 08:36:02AM +0200, Jan Beulich wrote:
>> On 13.09.2022 19:22, Demi Marie Obenour wrote:
>>> On Tue, Sep 13, 2022 at 04:47:24PM +0200, Jan Beulich wrote:
>>>> On 13.09.2022 16:22, Demi Marie Obenour wrote:
>>>>> On Tue, Sep 06, 2022 at 10:01:00AM +0000, Andrew Cooper wrote:
>>>>>> On 06/09/2022 10:52, Jan Beulich wrote:
>>>>>>> On 02.09.2022 04:05, Demi Marie Obenour wrote:
>>>>>>>> On Intel chips (Ice Lake and later) and ARM64, a bit needs to be set in
>>>>>>>> a CPU register to enforce constant-time execution.  Linux plans to set
>>>>>>>> this bit by default; Xen should do the same.  See
>>>>>>>> https://lore.kernel.org/lkml/YwgCrqutxmX0W72r@gmail.com/T/ for details.
>>>>>>>> I recommend setting the bit unconditionally and ignoring guest attempts
>>>>>>>> to change it.
>>>>>>> I don't think we ought to set it by default; I can see reasons why kernels
>>>>>>> may want to set it by default (providing a way to turn it off). In Xen
>>>>>>> what I think we need is exposure of the bit to be guest-controllable.
>>>>>>
>>>>>> We absolutely should not have it set by default.  It's a substantial
>>>>>> overhead for something that is only applicable to code which otherwise
>>>>>> crafted to be constant-time.
>>>>>
>>>>> Either Xen needs to set the bit by default, or guests need to both know
>>>>> the bit needs to be set and be able set it.  Otherwise code that *is*
>>>>> intended to be constant-time has no way to protect itself.
>>>>>
>>>>>> As for why Xen doesn't enumerate/virtualise it, that's because
>>>>>> virtualising MSR_ARCH_CAPS for guests is still not working yet, so the
>>>>>> feature can't be enumerated yet even if we did support context switching it.
>>>>>
>>>>> Intel and ARM64 guarantee that CPUs that do not enumerate this flag
>>>>> behave as if it is set unconditionally.
>>>>
>>>> I'm not qualified to talk about the Arm side, but may I ask what you've
>>>> derived this statement from for Intel? The doc page referenced by the
>>>> link you did provide (still in context above) specifically further links
>>>> to a page listing instruction with data operand independent timing. All
>>>> other instructions, as I conclude, have variable timing unless the bit
>>>> in ARCH_CAPS enumerates DOITM and then the new MSR bit (of the same name)
>>>> is set.
>>>
>>> My understanding is that only instructions in the constant-time subset
>>> are ever guaranteed to be constant time.
>>
>> Hmm, yes, I did overlook respective wording in the doc.
>>
>>>  On architectures where DOITM
>>> is not enumerated, this guarantee is unconditional.
>>
>> I have to admit I'm suspicious of this "guarantee".
> 
> Do you mean that previous CPUs had a vulnerability that has no fix?

I'm not sure I'd call it a vulnerability, but at least if going back far
enough in history I think you'll find insns on the list which don't have
invariant timing. Like with other documentation on e.g. speculation
issues I take it that Intel simply doesn't consider sufficiently old
CPUs relevant anymore for such new documents.

>>>  On architectures
>>> where DOITM is enumerated, this guarantee only holds when DOITM is set.
>>> Therefore, it is critical that on CPUs that enumerate DOITM, Xen does
>>> one of the following:
>>>
>>> - Ensure that all vCPUs enumerate DOITM, and virtualize the DOITM MSR
>>>   bit for use by guests.
>>>
>>> - Set DOITM by default.
>>>
>>> Since Xen does not support virtualizing MSR_ARCH_CAPS, vCPUs cannot
>>> enumerate DOITM.  Therefore, the only secure option is to set DOITM by
>>> default, so that guests do not need to be aware of it.
>>
>> I can see where you're coming from, but I also agree with Andrew that
>> the resulting loss of performance is a counter-indication to making
>> this the (universal) default. What I could see us doing is make this
>> both Kconfig and command line controllable.
> 
> How large is the loss of performance?

I have no (practical) way to know.

Jan

>  Linux seems to be setting the
> flag unconditionally, so I think my point about guests needing to be
> able to ensure the flag is set stands.  The default can be changed once
> Xen gets support for virtualizing the bit properly, but until then
> unconditionally setting DOITM seems to be the only safe option.


