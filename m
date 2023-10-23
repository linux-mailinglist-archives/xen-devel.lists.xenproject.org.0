Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFAF7D2A83
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 08:34:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.620983.966900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quoWA-0004a2-0t; Mon, 23 Oct 2023 06:34:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620983.966900; Mon, 23 Oct 2023 06:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quoW9-0004Xh-UO; Mon, 23 Oct 2023 06:34:25 +0000
Received: by outflank-mailman (input) for mailman id 620983;
 Mon, 23 Oct 2023 06:34:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1quoW7-0004XZ-SX
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 06:34:23 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060a.outbound.protection.outlook.com
 [2a01:111:f400:fe12::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32be13c5-716e-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 08:34:21 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7843.eurprd04.prod.outlook.com (2603:10a6:20b:235::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 23 Oct
 2023 06:34:19 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 06:34:18 +0000
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
X-Inumbo-ID: 32be13c5-716e-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Za04EurTx+enGMledJZWjIhIVk423XQhU7kmIXc4/MQDYk/PoWGBflm4FY6fMGFr1Zm+bIlJKUtMHKYuNfRMtwtuYdtDihucREbL7f8UMnl1GPFuad1oBLnsYhf0G684WSrDLOzq8BvmwBUs77Hdl4a2e83AxhGuInkleK+gnGcPzZXL4WCBQv8f0zx7H9BNYFcCvEOuXYfNdYj9AdQK9N3tXDKfh24U522qchIQuniXVu856THv2Mu7HviDwnVrKiN5ExJwgDQW9H7skUASYR2p+vRKzOHhwCwnlwZAduoMFPgO3OZynU7hUYs5XQCA8cDFDR2LNaMkOiwrU6gOCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1tFomd5FlTyvWlPsc9890A4p9Pm8Be/F/j2GShjuUQ=;
 b=ZDDZx7y2IcHnrjx9PiS17f3kNyl4Jate+bOpSRUbUs4WbI4XJmYXMfbAPhF9day4dWSO7IpAK/O/mhKuISybO4BJoI4Q/mhAIZLTFCpafqMumin2A1OLroIr4P8u6GKcMMJkN+H80y7TVSBsczcYG0B51+skuNhK78crQXZnuI85BecMq/9eoqU89xflGGIzcvlrWTwJQV0Jj85jFrg4coelziRgobY88HD9A9GTfwHRQAxWvPbksWPf9IfJ+b3J/KMBNwg6h70LF8OCmG2JiO+OwvGL8cOhKJwjfh+8EUp1ua8Tg8Mh4/cF+bBviEwNPpzXR5WO5rGKfAhPOCKNBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1tFomd5FlTyvWlPsc9890A4p9Pm8Be/F/j2GShjuUQ=;
 b=LA0x9sK6u4ji21cJPRIngNSWSmqN1LINnAN6y4sCLXUy0RDR1Ot5kcxsrIT126rcLAXoz+a/GEDgXR2sWEFnl/ruvFiCTR9WaN3ShVrgIzn1RoBZ9+ci+JZRgW2F7I265ybhXByWQoMNhymIGe7esjtwj/tbnDYyQPdBhbf3f49JsE/uvLEmwTrVJq9lnmQ524VbAla+kkg/hdQjKN2WF5Nt0DDOasvr+ZI40RGm6jTeozS1Qhg1ASKzKqRmgc0akegeWs9lUHCnWn1yKqqzudTVgi9IIGOm5QsxIQrT0kRbfzw5E/edsNmPgdaVbC2dMf1bZp6p8Aus6DOEyUMgnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7d7ebafa-9751-bd0a-c47a-1894d9edadf5@suse.com>
Date: Mon, 23 Oct 2023 08:34:16 +0200
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6a90edf81f410db8069526228de75d7e@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7843:EE_
X-MS-Office365-Filtering-Correlation-Id: acd7b999-3139-467e-59a1-08dbd39215cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OzRbw7v+iYRJH+nCwEmM+d+T/I9nWupsnAbgYUnzIa/KO/9QaZ/XrMJLL92TbR0UEZ/q6U778LeNbz93ipZSk0ZuZCqkp5/fLmSrZqALREHtRFlPBw9THHH3P1IJ4CzloEjK5THkVykKL9obFv2kWLU4VWbvnsZgTNIFyUGtATdAiSXP3+KQG/BODWxQ6VkYzeHb/DtcQS2Lx2JY8CZVbkqAX8nMRiEzJieiqzujAuK8L5KdHF1FYyPRm6hqmUAd16qOFr8LkgMbieJfr4DtNOw+IU+FE2XyY7uT1K4jch8paKOVVE4VgdJ8GL8Q049gw5rHs4Zny+uUohEBtPtOPBsJFotLL+iflqhm9hc+q/n6frhwug+NCJbVze73tuFoZLZX3DGOliHRBqq0vCT+CkR3g1aHxLqcM0sHlrakQXVbUnxBOdR1l2A2XKvSJI8nxyzARldIF4QIwlqYKZGqSYPZZ9H7dTqvCWaN8MVX+JD+D4nA+/gRtG0UDEPG3bYuIQZzy/2Ar9RDwjKEHWvQxQ+VKvWK55UYgGzAW1ZYrTtTZp23ETEz66n9fKen6gsWmsZlrA20YYLNtPe+Ggc4lyvNdfRomm/J9GrGgcE6FbcNxa+OWvm2+yWkLfDKfdsRPmFnqBSbwt9CdVn26je9pQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(346002)(366004)(136003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(2906002)(38100700002)(316002)(6916009)(66946007)(66556008)(54906003)(66476007)(2616005)(478600001)(6506007)(6512007)(53546011)(6486002)(83380400001)(41300700001)(5660300002)(7416002)(36756003)(31696002)(86362001)(4326008)(8936002)(8676002)(26005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z05yUUFIWkJoejl4aUViNmZkZG5mTzZuVlQyM3o1TlY2Qk1BZC8xMytnMnZU?=
 =?utf-8?B?ejRIdVJLNWNod0NwaDNEaFhXa2tzL21NNHFUaUR1TDNYS21tYkFNV3pybU5R?=
 =?utf-8?B?bm5VT1pFTG9SdGV0bWVKbFpsOGNJT0gvdEJvTFNrRzlZSWZydnEvMnJITUlm?=
 =?utf-8?B?aW5nNkNvb1pETUFTT3lKa2d4SUJuNXlIWlRqT1BoanZmM1ZEMlVDUGkvSFk0?=
 =?utf-8?B?NStjUU1YQ051dDJlMXA1Y1RmK1Z3NTVsZnhldExoRzROQ1RmMWcra1ZVdDBk?=
 =?utf-8?B?NE1lTUQ2UUUyOHdYQng4YVZzQmUxanVwSnY4eUt5bllNOGhaWGJxbkh0bS9F?=
 =?utf-8?B?a3lGQXVxT0pLZ3R6Y0k0c3dXQzN2bXZHR3cwK2VPdmhEcFpPQVJJQW1laE1z?=
 =?utf-8?B?SEJFazFQWXBsdTh5elVIYm9nRnlvTThhVWVTS2xlQ3JLRjlObmk1cFM3L1hG?=
 =?utf-8?B?Ym0zdWxvY3JCMEJ3RjYxQVRBNGsxRzBuSXB0c2FET29uYi8vcEhiZmNuUGdY?=
 =?utf-8?B?aWM5ZWQyb3NpWmdqcFVBQjVHMkxXSlRTVE85QWhwVFZsUitWMVRDL1did2xt?=
 =?utf-8?B?OW1ZTEJsSXloemliYlBpa0NNMFhENml2NGhzSUZ4WG9FWUpzQTl4ZlZPYzVU?=
 =?utf-8?B?NU16Wm4xT1JwcnRlWWhGL0FuU2NjYXZiOHZ6ZFAxUlZwUEZtRUg1dSt4SWth?=
 =?utf-8?B?NXF6QThrYmExMUw4am5zVUJxYUJZZmhGSTJzbzVYY25aTkRhekowN05xSUN2?=
 =?utf-8?B?bnZqTmZKR3NnaW5zd1RPcklxbDU5cEVqNTJSQWRFb0o4S05qNWJ3bjB6aTM1?=
 =?utf-8?B?WVZldE5hTEFTbWtNWHBCY25qSkxPNjkvV2xjbEtyN3RlVU5haEJoaGZSSEYw?=
 =?utf-8?B?UTAvby92RDlveDg3WlExR1lUa3dKUFdhemNKaElRaVFDcU4yeUVQK1JPSU1z?=
 =?utf-8?B?b0g3SzNUU09DK293TlRWdnQ0cytiOU40QXBUM29nTDF4V09CM0k2bDJ3dEZw?=
 =?utf-8?B?dU5DdXVlc1FmckZTcERRNExqOHZpTCttdzhpNk1nbTJ0a3BTN0tDNVNkRlFL?=
 =?utf-8?B?c0xBTHVmTysxT2lrTDFyT0xXbnFGdHFXNWZJY0FtU3M1Yy9ONHArSmVBbGdj?=
 =?utf-8?B?cnh6ejRnRVA3U0JWa2FEVjA1Tm1SbTBISmZ6Y2xoTitITE5LTlRrMm9HQWNx?=
 =?utf-8?B?eUM0RVNZVHlHNmFkQjBNSUdLVEZ4aWQvb0FXUE5OZFUvSTVCRHFNbUh4VmRJ?=
 =?utf-8?B?dCtLbjlidFVVQ1d4NlN4ajNNb0lvd1kyczY3bk9hdVJTemlpOTZrZXdoT2pm?=
 =?utf-8?B?NFVMd0xBa1BYOEk0MmlRL2JGT0tMUVlpUHRpNldONTZxVEV6aUZzamI1UFhL?=
 =?utf-8?B?OGhaTGxua2hVMDU0clJuMHF0Mk9BSzNRZTdESmVrMnFjSG1DbGJ1eWdINjkr?=
 =?utf-8?B?MTNnUDNQVEpQY1NlSVl1TEZieFdOU2s5a2tqUlJKY2ZGM2o2eld2N2wvUjFH?=
 =?utf-8?B?anFwQjZlRnRicHFDL2QySmxrMWpCNEZIUjRYcXZlUWlzSVlVekFCeTBZY0p6?=
 =?utf-8?B?Q1RlNTNlTFQyaWdyeVRaWll2anBGVG8xaXZZRExCWHlNODVhV0hlWlk1SkJP?=
 =?utf-8?B?VFJxbmx5b1ZrUWtLcDNtZHhza2c0Uklva2p4TU9QSzVmc29tdEh4SkJHTHR2?=
 =?utf-8?B?djZGeTNzbFh6Tlh6U2JUeXdvL0FFNzlVY2NpVi9hSzhUR2s3MDdMWlpIR1BZ?=
 =?utf-8?B?ZVp6VExqTG5FR0R5QmU5L2FScnRja052YktCWmRCRzFJRmpLZ2hDOGhRemxi?=
 =?utf-8?B?WHdRVU5Nb3dBWVdtL2N5YWM2MTRFY0dEZ3FCdWxxVkptTWk2SzczMmVCNWJo?=
 =?utf-8?B?WXNPdlRzSHJXZ25zVExZTG4yMnkwUGNDRm5OUjRqZ1l4bHRURGcxMkpCbW90?=
 =?utf-8?B?RGxLSmJENFg2NE4xMVpuN25ZMCt6Rk4wN29iUHpLTDNpb09WOTRFSE9PRXFY?=
 =?utf-8?B?OUxQaG9FcjlLdGdsSlVvWURXTlA4VDNMQWpsVFhxOUhBRlZqSll6MDFnNE51?=
 =?utf-8?B?RzlsLzh0b01CT2JqK1VNb1EzOEZUcjAyQUJsLzFYT1E1a1d6dmF2NmZWK3BC?=
 =?utf-8?Q?KUF0uoYywsNnDOGo4y5RIysl5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acd7b999-3139-467e-59a1-08dbd39215cc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 06:34:18.8550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tavc0OczaOdaENuFXaKEOSGq6QtDle+YVtPFeRM/UHGAHrUi93CxjDsKahBkq1OYAr4kz0dj75Gg2Lkp8zJpoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7843

On 20.10.2023 16:58, Nicola Vetrini wrote:
> On 20/10/2023 15:24, Jan Beulich wrote:
>> On 20.10.2023 12:33, Nicola Vetrini wrote:
>>> On 20/10/2023 08:38, Jan Beulich wrote:
>>>> On 19.10.2023 18:34, Nicola Vetrini wrote:
>>>>> On 19/10/2023 17:57, Jan Beulich wrote:
>>>>>> On 19.10.2023 13:04, Nicola Vetrini wrote:
>>>>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>>>> @@ -85,10 +85,10 @@ conform to the directive."
>>>>>>>  # Series 7.
>>>>>>>  #
>>>>>>>
>>>>>>> --doc_begin="Usage of the following constants is safe, since they
>>>>>>> are
>>>>>>> given as-is
>>>>>>> -in the inflate algorithm specification and there is therefore no
>>>>>>> risk
>>>>>>> of them
>>>>>>> -being interpreted as decimal constants."
>>>>>>> --config=MC3R1.R7.1,literals={safe,
>>>>>>> "^0(007|37|070|213|236|300|321|330|331|332|333|334|335|337|371)$"}
>>>>>>> +-doc_begin="Octal constants used as arguments to macro INSTR_ENC 
>>>>>>> or
>>>>>>> MASK_EXTR
>>>>>>> +can be used, because they appear as is in specifications, 
>>>>>>> manuals,
>>>>>>> and
>>>>>>> +algorithm descriptions."
>>>>>>> +-config=MC3R1.R7.1,reports+={safe,
>>>>>>> "any_area(any_loc(any_exp(macro(^(INSTR_ENC|MASK_EXTR)$))))"}
>>>>>>
>>>>>> INSTR_ENC() is a local macro in x86'es AMD SVM code. A macro of the
>>>>>> same
>>>>>> name could imo be introduced without issues in, say, Arm code. The
>>>>>> above
>>>>>> would then needlessly suppress findings there, aiui.
>>>>>>
>>>>>> MASK_EXTR() otoh is a global macro which ise used for various
>>>>>> purposes.
>>>>>> Excluding checking there is imo going too far, too.
>>>>>
>>>>> I should have thought about it; I can simply enforce the deviation 
>>>>> to
>>>>> additionally match
>>>>> only a specific file for each of the macros.
>>>>
>>>> That'll work for INSTR_ENC(), but not for MASK_EXTR().
>>>>
>>>
>>> Why? What I'm deviating is reports due to octal constants used in
>>> expressions
>>> that contain MASK_EXTR in their expansion if and only if these are
>>> located in the
>>> file svm.h.
>>> No extra octal constant will match all these constraints.
>>
>> New MASK_EXTR() uses can appear at any time, without necessarily
>> matching the justification.
>>
>> Jan
> 
> Sorry, but I don't understand what's your concern exactly. With the 
> improvements I proposed
> (hence a new patch revision) I see the following possible future 
> scenarios:
> 
> 1. an use of MASK_EXTR() in a file other than x86/hvm/svm/emulate.c 
> appears, with no
>     use of octal constants in the expansion. This won't be deviated;
> 2. an use of MASK_EXTR() in x86/hvm/svm/emulate.c appears, with no use 
> of octal
>     constants in the expansion. This won't be deviated;
> 3. an use of MASK_EXTR() in x86/hvm/svm/emulate.c appears, with octal
>     constants in the expansion. This will be deviated;

This is what I'm concerned of: How do you know up front whether such new
uses want deviating?

Jan

> 4. an use of any other macro with an octal constant in its expansion 
> won't be deviated,
>     unless the configuration is suitably edited.
> 
> Does this address your concern?


