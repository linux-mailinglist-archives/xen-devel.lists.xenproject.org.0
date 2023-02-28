Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA73D6A5B67
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 16:10:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503470.775740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX1cU-0001k1-J9; Tue, 28 Feb 2023 15:10:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503470.775740; Tue, 28 Feb 2023 15:10:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX1cU-0001hb-GM; Tue, 28 Feb 2023 15:10:22 +0000
Received: by outflank-mailman (input) for mailman id 503470;
 Tue, 28 Feb 2023 15:10:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pX1cT-0001hR-2a
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 15:10:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7d00::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 034d257d-b77a-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 16:10:19 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8636.eurprd04.prod.outlook.com (2603:10a6:20b:43f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 15:10:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 15:10:14 +0000
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
X-Inumbo-ID: 034d257d-b77a-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEiMzbP3g4K46tfuWAswrzAaUbN5c4313GzTeOoWW41vGlP+HL8SASWoJd2a9DHqBK+e3OgggHh1BwIPaCtRJ7YhTHqtL37RDxGS24ADVKXA+u+tuSDOg29GSQV9us6F4XTsCN/wccH2qLmOkq91e2SJgy3oL61MSlB8H9XJaTIf9QupY9TlhwLuXaiAzt60iAAm1+XGrIGxC1wOKxyboEBNVIPqGSOQo/19ZzBRCQI6Pl1Ly6Khsg9qzYNWMfGq/2xTb9smFuTMnIfRLz/qO7nSDqTzSzVlkeolZ+8dvJ6mcj/mGUT/xtggYENWahUlG44aGNpHNnguKowfqDcu4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bm4HmUsu75gjAfOtTSd8blTh8qdYLvsHQ9HjKt+lDGU=;
 b=mmPhf+fI4anJLloWmXiJ+xlUrhlHYydioGEsY4p+7MTRMStiNsvJfCdquXDEJA8ShUnJumzCnd8UA//vgca0kekHbQluLZasLMSrHHDnoFGj6jOSoA5BuvQf0SRosVqSDLOUUNZ6/DTq6BY0mJKSBoKt+XC/KwXmLnelgvQ9Y8Z8TKt/LBMv3s0IhkV5jD102aHBIY95ZSxMX1/uwMg/J4KYcspChFvRk5duVEQUfJeW/YtUD3Xmh/o3SLPP65FMFIzUXX9NXKXtYeg6RrJ/qWPBxDfrtQ1kZAcB6nG6O8cqjyAWh9AXER0C+LqQ8j/+pUSNXt1jV1lY2Ms7LkW9uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bm4HmUsu75gjAfOtTSd8blTh8qdYLvsHQ9HjKt+lDGU=;
 b=SEdDqYOjxTCrz+gXi21KF2F/0Cn88FeQYBDbarVi1Ez2Jc9pxOErd0WgA6mJMnUfOzTqaF3BmqeR0kGgsWGoO9/YcOr2DLcKe3APbSY1Dp88P+BBDdtng6devK9WMXuIVX4tvwOpdqlTVapbBPGd8SAuZkzuBW7HNBxdGusbhblWfSwMj6lmwxsT/id1xdqHXqw2dSvus2xoyi71r5pS5sayXhowL4FVq8N6+TWF58WtTTpy2VwsZkGIZanwZmMN/MRCgL7gDUpJRcO6FhKIBN3fU/2Tx5cn1PXP58+fgCWixBqYR/ygTsAGu3gBxkAroShZbMaT6j4L06/UgrfSTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dea4bf56-6b8a-7cdc-fa98-a9624f4fc67d@suse.com>
Date: Tue, 28 Feb 2023 16:10:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/4] x86/svm: split svm_intercept_msr() into
 svm_{set,clear}_msr_intercept()
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230227075652.3782973-1-burzalodowa@gmail.com>
 <20230227075652.3782973-3-burzalodowa@gmail.com>
 <bf77733a-d0cc-8e31-5a05-f0709e7ef1fb@suse.com>
 <b13c5685-7d52-e0e0-95ad-7d766790d057@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b13c5685-7d52-e0e0-95ad-7d766790d057@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8636:EE_
X-MS-Office365-Filtering-Correlation-Id: f16e1733-1dd6-41f0-6704-08db199de4ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UbwY50GfNBzXxZKADirZnEHlpfgW+L3mWdimnZCDEEBav1qJlNP7gtFmhZUC9I3hSXSFQjovejGrTPR6wAu8q8ta3M7rjZIx30LSKuaNK7/rKi0ECwa3wlwnLzIjOtf1estUqLqO7s8YrZTnT/oQ+l/WNiyjBil5AFnDCYonwY+3hLRMiQMi6IWTF90YM24y+QI0J707ueYjBkOCnbLx5P5J231ngbHcT5IGh95rzmEsFXyrOU87nLzbRgIynaoMgwcxUKKS3m75vmzpmZNyBDDPIpdqeDW0DbRbMzgp4mUjkDcgtombJ9QCfVxDYmMasl7nsyQf/4yDS1xPES6LSz/x3hKYIB9+SzRJbRBJ/Z4E8DzNaIM4QkhgaEcYxSTjrBde0bvjPkgwehHzIHwIrP77dOcSVjycFoRhV9ItsMn2UHC/ZDkQbDlrPgXv8FQCeUUfVwxgM0DDtdHTeygEmdT1d0c/0GhsKvoJbgZjwt+X9GYVfS+MEzSXarD00wWrj0IZLPVQyAdYJiVI2Bc2LQIm6q2JciNOLdSXSXlddMHpFgxXwMGqYvo124R/LKpe2jGT4AKyWN/QROALtk4dKUPn+GgQJzmECxrlw2+kAKM2DsX1x+h7DumVAMSHCFywEyj0GB93gcyDobjhQZVcz1TO3DusRgek+zv7tITAigpto6m2AlCtODB8U7tGfEnPTPB05nhv7ShclF5JOC3UfKAoy0cpKdtkb+JQ7fKdbWU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199018)(31686004)(6916009)(36756003)(8676002)(66556008)(8936002)(66946007)(2906002)(66476007)(5660300002)(41300700001)(4326008)(31696002)(86362001)(38100700002)(6486002)(316002)(478600001)(83380400001)(54906003)(6506007)(6512007)(2616005)(53546011)(186003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjZrNHpwdkFsNjFxWmZmbnlYc2FXUmlFMHlMd1NjWU5DQVJoYVhMejZvOHdm?=
 =?utf-8?B?dmY5czNlVFhWODZZYUV5K2VaMDJoRExtQkJETlRzenJkZUxDLytrTitsYXdy?=
 =?utf-8?B?YTduc043dlBpcGk4TkhqUU1xTXI4OHp2bHQ2WmFUQ0dGN094czR2S2ptaUp4?=
 =?utf-8?B?c2dyR1ZBc3lUTFhkVWdzVHZsOGRDNkJEK3ZEc2VrZmVFUW92VmxwZWwySGc4?=
 =?utf-8?B?K28wR1NsYTRZc09VL210Rm5GRThVSlIweGtZUlNVYnZUK1BaVFVMZS81VUI3?=
 =?utf-8?B?TldpdnIwRndGWFVDTjZQZEJIcURXbEFnRzNKNHlGeXhJalhHZ1kzd3dNQ04x?=
 =?utf-8?B?YzRabDhTUFlhbFlWamplTGFyVk9UZmpSMnN2VHorb1daa2ZXSkI3MExRMjBL?=
 =?utf-8?B?ZVhZQkVpTkwrMVRnY2F0OG9vbjRyNk4xaEsxeG5LRnBVOS9FN1g4cncxSzBp?=
 =?utf-8?B?YTE5SnVTbFlDVnZORFB1K3N5eDZCbGdoTjYvSmliVnhDZlJIcXJEUytKUWkx?=
 =?utf-8?B?a1RIM2RsUlBtalN0VXdSbjkzdVNpeXZSZDNiZUdvN3BVNlJYSnhTNngvTm8r?=
 =?utf-8?B?UlZOdWIwZFZiRHNDamhJN0M0bUl0SEswVGxob1I2OTVUcDBQeUg4U3FCYXpU?=
 =?utf-8?B?Y1QyMm45d3NOK2tqSFJBRGkyR3RWTVFlYUFXVEZWOFJzNjZ5QkIrYlRTQlpS?=
 =?utf-8?B?VWx0Q0NOUzYwZEdZTzZEWmZMRzdyVkRXeE9YNlRmYjZnU0RXZDQyOG1hdUZv?=
 =?utf-8?B?dHhIN3ZhMGxxaTNzeXI4NnZROWNDdjUzeWZob0IyQWdRQUZtaWwrVVFZZXF0?=
 =?utf-8?B?V3liQ1dBaHhjMWJOazIxWmd2bHpya1VBcWNUd0RPZmpKa3N5UGZ2dWxBVU1r?=
 =?utf-8?B?dXNraWxycFpQMDI4NTZQalIzN3hWbGN0S001a09wYUFCR0NNVGZscGt2cC91?=
 =?utf-8?B?dTJYMXBzVXJ6UHpDUG5tMlF1eXM1dGZmR0NwdUVaS3F3K2RZZTFCRzFXTWNM?=
 =?utf-8?B?NW5wL1habWlHK05yNS9kTlY1SDYrU2FaMXZHWEhKMUpBL1VaUyt0ZllVRUJa?=
 =?utf-8?B?TmdTa042eFlsOE82ZzAzSW5venRxejRpeXdxcFhEclJENWlQd0xkUDF5WHNp?=
 =?utf-8?B?UjNBTGdGM0gyVzZ0Q29ZcklDQU53eTJsNmxmODRnOWJsNE4xRzlmK3ZQWU0y?=
 =?utf-8?B?VzRSRG1zU2kvdTA2a01YTXFON2FvcGZFVE92azhtcGlvQkZObDZ2S1VtZWJI?=
 =?utf-8?B?eDdTV0s0eUwycUpFQXRjaExCeHZFN1hqTmR4Y25uVVlLdFpnWWFUeFlVSGxz?=
 =?utf-8?B?L1lDSHl3RmhNY0ZiRDNzTTJya3lmTCtYVWo3QjUwTlZLVmh2K3p1RDYyMHU5?=
 =?utf-8?B?KzkrRnZlMGdoanh5K1hlT2gxM29ic2t6a2dtS1Z2bE5ucXlLSGc1UkJyWWpQ?=
 =?utf-8?B?UHFRME5IUng2VHhsZTFsSG5yWldkSHFUQzEzOWN0V1h2ZW55VmJTKzFtMHVm?=
 =?utf-8?B?bEc2U3pzRnJoaEl5d0V6OWRmK1ZGVFlWZ0VYS21PRHBUbTZuckl5Ui9zZW1Z?=
 =?utf-8?B?YmNLa2wvbWsyTUdGSUoyczRxU2xGN2VoSmpwSytXYjhTZm1mUkxxSEpBWEE2?=
 =?utf-8?B?a2VhL1o3NjlhdHJQTU05QUFhbkdNUHdmdjJQSXNrMXBJRW9WenhkZ2kyVGp2?=
 =?utf-8?B?RVdQZmZIamdyb2hHNGJtU210czFGcWFPQkRXL1BYUXNUUUVuWHMrQnVVNlk2?=
 =?utf-8?B?QUhuWEJnVEZ5SmZUNzhDelJQcXJ6aUhyYU0vejQzUUVBYUdGN0FFVjJVQnZl?=
 =?utf-8?B?UlRQTlh2QTZxRXMyRnYyeU9WNm43YVhPbEVwVUhZVFV5OGo0QURra2dMa3Zj?=
 =?utf-8?B?UTU2R0oyTnNLS0NTMzZ5N1FMelBXWTJmQzB2Q2NiUWZUMDNIakFIT0ZESHZY?=
 =?utf-8?B?UVRMRm01NTJoRG5pN01CRkZDSko2OUkzWWo1OFdhcnZjT3JvcEZjeXpON1ZO?=
 =?utf-8?B?aTQ5dUFZM2Fhd2hjajlWeEw5QW5sRVBlUFVmU2V6VDFNQS9nM3VnSENOR1JY?=
 =?utf-8?B?aStnaWRSQ251OUd4bEx2bTVwNEU2dk1haDRrZDVTVkluSHo4ZVNwSFEvSGpm?=
 =?utf-8?Q?78P197fhH/uhk3ZWUbd4OlmU+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f16e1733-1dd6-41f0-6704-08db199de4ea
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 15:10:14.5277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CkL8wws8JS7nndlLk8pnFoewNOCpMsp/uW90pNrA07pSbUaolQrC5JC05BxEHJJb2xd+rHqqzQQ6N8U90IeseA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8636

On 28.02.2023 16:05, Xenia Ragiadakou wrote:
> On 2/28/23 16:20, Jan Beulich wrote:
>> On 27.02.2023 08:56, Xenia Ragiadakou wrote:
>>> This change aims to render the control interface of MSR intercepts identical
>>> between SVM and VMX code, so that the control of the MSR intercept in common
>>> code can be done through an hvm_funcs callback.
>>>
>>> Create two new functions:
>>> - svm_set_msr_intercept(), enables interception of read/write accesses to the
>>>    corresponding MSR, by setting the corresponding read/write bits in the MSRPM
>>>    based on the flags
>>> - svm_clear_msr_intercept(), disables interception of read/write accesses to
>>>    the corresponding MSR, by clearing the corresponding read/write bits in the
>>>    MSRPM based on the flags
>>
>> In how far is VMX'es present model better than SVM's? They both have pros and
>> cons, depending on the specific use. I'm not asking to do it the other way
>> around (at least not yet), I'd merely like to understand why we're going to
>> gain two new hooks (if I'm not mistaken) when we could also get away with
>> just one.
> 
> SVM approach always touches both read/write bits (either by setting or 
> clearing them). I thought that using the SVM approach on VMX could be 
> considered a functional change (because there are parts where VMX 
> assumes that a bit is already set or cleared and does not touch it).

As per my comment on the last patch a question is whether both actually
need to become uniform. But if they do, then the new model should imo
be followed right away, and that VMX'es simply leaving bits alone when
already in known state.

>>> --- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
>>> +++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
>>> @@ -585,13 +585,12 @@ void svm_destroy_vmcb(struct vcpu *v);
>>>   
>>>   void setup_vmcb_dump(void);
>>>   
>>> -#define MSR_INTERCEPT_NONE    0
>>> -#define MSR_INTERCEPT_READ    1
>>> -#define MSR_INTERCEPT_WRITE   2
>>> -#define MSR_INTERCEPT_RW      (MSR_INTERCEPT_WRITE | MSR_INTERCEPT_READ)
>>> -void svm_intercept_msr(struct vcpu *v, uint32_t msr, int enable);
>>> -#define svm_disable_intercept_for_msr(v, msr) svm_intercept_msr((v), (msr), MSR_INTERCEPT_NONE)
>>> -#define svm_enable_intercept_for_msr(v, msr) svm_intercept_msr((v), (msr), MSR_INTERCEPT_RW)
>>> +void svm_set_msr_intercept(struct vcpu *v, uint32_t msr, int flags);
>>> +void svm_clear_msr_intercept(struct vcpu *v, uint32_t msr, int flags);
>>> +#define svm_disable_intercept_for_msr(v, msr) \
>>> +    svm_clear_msr_intercept((v), (msr), MSR_RW)
>>> +#define svm_enable_intercept_for_msr(v, msr) \
>>> +    svm_set_intercept_msr((v), (msr), MSR_RW)
>>
>> Please avoid excess parentheses. Also could you clarify why you retain
>> these shorthands when you don't use them in the conversion that you're
>> doing (e.g. ())? Are you intending them to go
>> away down the road?
> 
> Ok.
> I did not understand the question. Which shorthands?

svm_disable_intercept_for_msr() and svm_enable_intercept_for_msr().

Jan

