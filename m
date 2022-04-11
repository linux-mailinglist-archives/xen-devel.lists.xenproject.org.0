Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A54EB4FB384
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 08:13:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302662.516341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndnIf-0005aI-92; Mon, 11 Apr 2022 06:13:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302662.516341; Mon, 11 Apr 2022 06:13:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndnIf-0005XJ-63; Mon, 11 Apr 2022 06:13:21 +0000
Received: by outflank-mailman (input) for mailman id 302662;
 Mon, 11 Apr 2022 06:13:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ndnIe-0005XD-0J
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 06:13:20 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7aa41de4-b95e-11ec-8fbc-03012f2f19d4;
 Mon, 11 Apr 2022 08:13:18 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-1N6I73H8MhCtm8w2nZXkew-1; Mon, 11 Apr 2022 08:13:14 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DBBPR04MB6028.eurprd04.prod.outlook.com (2603:10a6:10:c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 06:13:13 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 06:13:13 +0000
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
X-Inumbo-ID: 7aa41de4-b95e-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649657598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ETHHPGadrGIBjS/7HRxDm2c4pKN8l04pwuOifkVBBuA=;
	b=JjtD7oS5ZmREEM/A9R3fUiWpjFAi69KcSiFrKfPMSWa3mplcZmpyZH9ZBcbWzQvIOhwAr0
	IV5nlnN1wI5S7Pplvei3//nSJY+lqb2g3NPFWdpHECBhkbJfRZQiTE8A2YxC3jqkE3zIhE
	iW6kkfoetG9qsbWNLIfAl+wBG5YApYo=
X-MC-Unique: 1N6I73H8MhCtm8w2nZXkew-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=drb5rZRqDxx3iWkHbAuRRZS+Xh2k7kc/PPNHFAGEEG594+pFsv86tixRhMYW/4PhMY/HTxIpkG5xBoQ7UJd8GUi4OM+mFuEVeCsf27IS0j9g6UtNxc/CisftuXu9Ndi4gaj5X0bXZeMe5iB9vEZAe7ACc+TrCyeuQVw/2cRLvY71PrpWN5A1fUmEcMTqm/PFGtNWluQHaRWxjis+bu4N1VMOj8GiabqorEiP6hi4QhZOu4zqKYlL8+5ofJ2+zfRKP6MSjJIuzl1Ew18hp3uF9fKnboUt11yDP6831VEaET2fGD2zWMeqlDyUdvtmj6eovD/N1iIFQbOrje/zotMhvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETHHPGadrGIBjS/7HRxDm2c4pKN8l04pwuOifkVBBuA=;
 b=VD/UJfPNvnNsxUJ1RVB3oD3b44zwxokFIB7oImqcbcezpW2alajduNSnW+9riKjDnu3AyTEBJI8EieGx2vc+SVg7yiyaL68URrqdPk2pISREWh05TmBANNfBnkQJ+qOu26uSkIyrQbOW9Z2Xca8vGtP709UBIDlC86W3azoLkKcdPdsb+bcv36TVNvn7Hf5nq7KYfq3um+BgFZaexciqRY4EDf/72ieyAHY5PuRCmYOe89/NkMx792O6eN1yputbkt83+37+DJjuRXGLT0uZCeuu9plZPceWlfQkL2YQsqyitoiBgjSTr1NAfKCX4MdKRtH+S80VaxhY7JEm/1Bg+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <747017ab-9aa9-b958-8cbf-42c2cc3ffdb1@suse.com>
Date: Mon, 11 Apr 2022 08:13:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH RFC] evtchn: add early-out to evtchn_move_pirqs()
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a0fbf06a-be3c-37bd-2abf-599912ad9bf5@suse.com>
 <42d16ff2-725d-ae10-ba6b-561487252125@xen.org>
 <3217803e-16d5-6e2a-bde7-ff9a1237dd39@suse.com>
 <decf721a-8062-a23f-a810-78fb86a42d1d@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <decf721a-8062-a23f-a810-78fb86a42d1d@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0111.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::26) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 884469cf-2f87-42c5-b53b-08da1b825c47
X-MS-TrafficTypeDiagnostic: DBBPR04MB6028:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB60280B629F33442EBF627C25B3EA9@DBBPR04MB6028.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IFhuAF6KRihPI9bWv+tE4FWosx33ScK5UBui2Y5lgQiJId/W74ZQ3eFxUvOBkIImaU0IWOMOhhaPQ6RA4+bqEodWHdPn4s7MJ3ShvQqc380A4obNK8LtdxcWACCFiT2TclkFCA7dScPod4rOUr+QRT2M2eXw7/nVj0DmBffvHOHyPCzCHE0zgFYexAxf64spJqtKYlP9jPQE4eHNesllq3C9bReZfL967jvAQM5cxr9uHvc4app0BLUnXQS+k7gC01yedTz93m+CEYdQJB89gMl0Uivacvn+IFaJgaEy7km6adeWw6pMBVfz7LKooGM5eOPNEUzTDoP7iunPLGAbxIAa17vgV2W1FbexSsDYTTKcsfE0CL8h68po2STERRTEIV7XG8tpXyg+EuoyqsZk6VhxsUnTDQQfPaAWodbEHFXK7BgwhxEo1ZqiKJLAkKr9Stp56Dqgb8deJGo/+SZRxTE1q0E6Hz4AwSww6uGw5/twv0eSfDxSA4yS/WGCGjLUmaePjlcoYgt3wOlhBKP2ORmm+eDTZf3uz/Bp3r/hteduPZIXXQ9ofKnh5Uf/c/IdP2qfXbuQqk6yCWhC9M5vmAnZ6UwiOz54xr1MVkmggdboanA1O8bF/NP/1L5SJME2x3dJFGaar2/qyIJCKB9MisWClKJHiQnvy4XSUsjVyQAOnnpW3/eASLltA3JSrx17+cnXXXVpYfSaG1ciHKYz/6kBUAC0a5pfb2hma5zDLE+kRpKzw91Kc/Cfbxl9Xtxh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(6506007)(316002)(31686004)(31696002)(86362001)(186003)(6512007)(83380400001)(36756003)(26005)(38100700002)(6916009)(54906003)(4326008)(8676002)(5660300002)(66476007)(66556008)(66946007)(2906002)(2616005)(508600001)(6486002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2Fac0xuTUpZL3JvUk5FQWR4Vk9UOE9Yc0xHRWlrRXZmVlppU2w3SVlKaCta?=
 =?utf-8?B?bG9oTkRXaGJLVzlCaEU2WkRnWFBiNlVhZDF6ZGU1Y3VsNjJ6K2NBVFQzQmdB?=
 =?utf-8?B?QURGN1F5ekRGTFhvMGw2SXI3VWwzeVVSMWNFbGNLNklIckV6aFJDV0twSGdx?=
 =?utf-8?B?b0U2TS91SmxMelYxR0VMN0ZYcHY1NXppeW41TGI5SGFxdTBCbTBXS3M5K1c4?=
 =?utf-8?B?b0ZVSFRucTk2c09nQ1d0VHdIWUVLbFdkMnJhSXVSM2NQcEdjeUg4Mkpka1RX?=
 =?utf-8?B?TzhFR0lVMXNib09YWGovZHZ4NmtIdTFQMkF5RzJpS0dvaFRmb1BYLzEvODJM?=
 =?utf-8?B?K2VXNzR5VEl3SEsyTmIxcjBlVzFzSlBDZkt5STM5WHdEUUtJTGs5MjBSU1FG?=
 =?utf-8?B?eDJBM21IZEU5OHNJUTJZeDA0TFhFZmFEQzdsazhXVnZ1R0gxTm8wVkgvREZG?=
 =?utf-8?B?UXl4THIyc1VrTGNvajkyWFdRTlFNc2VwbFJuYm85Qi94Z3ZuRXVndjFEQ09S?=
 =?utf-8?B?T0huM3YxZXdxV1Jhd1IvL29TbFpJK2lTamoxdzI3YzVyNUtzckprdThUeVI3?=
 =?utf-8?B?YWNod0lGUGx3d1FPd0F3cUtXV1Y0bkk1VHRKSGhuVTdGT3RZWGdndUZCZndy?=
 =?utf-8?B?WXFRQzNFUzNxZXM0Nlp3M0hRYjh4YXhCbEtpLzhxelhRTTBpZ3pmUzdkaUtR?=
 =?utf-8?B?YTF3MldnQ2wxVkV3eEJjTUhBYTMyQlFVQzJ6VGs5MUJOUGRUN3huSEludkFO?=
 =?utf-8?B?VmpGbHZ0Uk1URmM2Ly9XQndwUmJpTXNhbHMxS1NGelordEhKNUN2ZUVobi9C?=
 =?utf-8?B?VnZ0UGZUMWpucjlCZTJZbm53Wk0zTHFxQWg1S2NUR0pvZGhnV1VlY0tub0Zm?=
 =?utf-8?B?ZU53R3J3OUZ3Qm1NRFhqTXBMSzl1S3M0bDRhb2M2TlQydnoyTlJ0NlVVUlFZ?=
 =?utf-8?B?UVVPZXNUbFdCSlJCSWZ2VVRXRUhCaExxZHF1K0Y0Q3RFU01NRU9qRmVUNSsv?=
 =?utf-8?B?V1JaZ0NSMW94OEhYRi9SbEgwTlZETVZmWDJuS25oaG5Welkwa2g5TkdYQ2JM?=
 =?utf-8?B?b2RuTjRZRENuM3FzT0dYMHV0L3cxMjVyZ1h1S0JHVzA4VXNJZHQ0V21hWTht?=
 =?utf-8?B?bzRndFZiajV5R2svbVQxRUFVUEJnbE9oVlU5RllpMmxqekRFTlFjeFMyWHBw?=
 =?utf-8?B?eWFVMlphQ0c2dThJeGdqNkJXTlNNeVZseG1QaTZtd1BvYUQxVFkwdUdOVlBZ?=
 =?utf-8?B?b1VaUVJUa1NOaEFaY2dLc0MwTnpGQlZOUFJRRFkrbFhhUWJ5M0lXbDlrcm1R?=
 =?utf-8?B?UXRXWXMreUNuOUFMSEVLKzdLY3pCcjRMSTU0T2FEK0J2Q0YyNDdUMDJpdTdo?=
 =?utf-8?B?MGNyVlJMRjhKaWd6RWZ1VUtQT2tuVlNxalV4QTkwenM0eGZOUVVBU041NVNo?=
 =?utf-8?B?QTl6N002cWgyT0x0S0d0NUV0ZUtOQit1blptOTBodjFab2ZvTndDdUljWWZ6?=
 =?utf-8?B?U3BoNlEyWDdxOXdZRndQYTlHQXMvSW0weHV2U001T3Yyb1dIUDdHcERJT3Qy?=
 =?utf-8?B?VjUrZHJpRGpzMmZFbHhCdEhtYjZhN2hvZVptK0tLMXNPekVtbUhxSnIzMm4z?=
 =?utf-8?B?MjFvWGNLdXNlRTZjZnU5K20zSFpRV2lGaWdWN1JVNnJvK1hRellvMXBiR0do?=
 =?utf-8?B?S1BhYVpGVUgraTdNRXFxOXl6YkpqbHIxNlJTU2xOaldVaVNkT1hpSEszODZL?=
 =?utf-8?B?TjNzS1oraG1DdGl4TDA3WnErbDk5ZWd2Y1NzOWd1a2FWR0diWm40S1o0V1cr?=
 =?utf-8?B?ZlhXUm5OMDhxOGI5U2VydGFSRGNGaU1jWVhUUXdhUHZyemRCQVg0OFU2blJz?=
 =?utf-8?B?NWF2T2p0RFFTek5HYTQzZS9Yd242TmFPV09uSFdpWXNNZG5NekpqS29VaDZz?=
 =?utf-8?B?S0d4L2VoVlQxbXc0L2lOSk9vR2MrQ015L3JkU2UzaFd4TG5HckVMUk9vemNW?=
 =?utf-8?B?L2lwOStINElxVTl5ZEUvc3hZYlVqQmdHWkhQSlErczdWU2UwNWpveFhYNGZ6?=
 =?utf-8?B?KzhPZ1RWZmZVekFzN0FPV1FwemFkUW1uWERiNDVKNDd2Rlc1Q1RuSTQzNUZN?=
 =?utf-8?B?OFRZTkVSNks3RlpyRnJMRzBuTXVTTDBDZStDbDJEanVnZGJXQWNpOXJuQVhh?=
 =?utf-8?B?V0kwZVRVb0lqdUdvWGFaSjdQcFgremhvSFNmQnFGdXNSc1dYNVZUOXFKWnhu?=
 =?utf-8?B?NVByS01BMkRIbVBIYWlTenNSdVh2bjJQWlpHT2ZYK280dmNYN2M5Z0FMbjhE?=
 =?utf-8?B?SFRld2lrdlNVc0hieDBNUkRvZEQzK21FYm1XRDhtNTh2OWhpL01Kdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 884469cf-2f87-42c5-b53b-08da1b825c47
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 06:13:13.5341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDmOvRy/pa1x6GWXrGgDx1MUyQYawasBri9dFOPfbAQ3fP2rIgSYsjtEPAgnXIRqqA5EeUbAGfllTb+vHcN8Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6028

On 08.04.2022 19:17, Julien Grall wrote:
> On 08/04/2022 13:25, Jan Beulich wrote:
>> On 08.04.2022 13:02, Julien Grall wrote:
>>> On 08/04/2022 08:16, Jan Beulich wrote:
>>>> See the code comment. The higher the rate of vCPU-s migrating across
>>>> pCPU-s, the less useful this attempted optimization actually is. With
>>>> credit2 the migration rate looks to be unduly high even on mostly idle
>>>> systems, and hence on large systems lock contention here isn't very
>>>> difficult to observe.
>>>
>>> "high" and "large" is quite vague. Do you have more details on where you
>>> observed this issue and the improvement after this patch?
>>
>> I have no data beyond the observation on the failed 4.12 osstest flights,
>> where I mentioned I would make such a patch and send out as RFC.
> 
> Ok. I think a pointer to the failed 4.12 osstest would be good here.

Done, albeit personally I don't think that's overly helpful.

>>>> --- a/xen/common/event_channel.c
>>>> +++ b/xen/common/event_channel.c
>>>> @@ -1559,6 +1559,16 @@ void evtchn_move_pirqs(struct vcpu *v)
>>>>        unsigned int port;
>>>>        struct evtchn *chn;
>>>>    
>>>> +    /*
>>>> +     * The work done below is an attempt to keep pIRQ-s on the pCPU-s that the
>>>> +     * vCPU-s they're to be delivered to run on. In order to limit lock
>>>> +     * contention, check for an empty list prior to acquiring the lock. In the
>>>> +     * worst case a pIRQ just bound to this vCPU will be delivered elsewhere
>>>> +     * until the vCPU is migrated (again) to another pCPU.
>>>> +     */
>>>
>>> AFAIU, the downside is another pCPU (and therefore vCPU) will get
>>> disturbed by the interrupt.
>>
>> But only rarely, i.e. in case a race would actually have occurred.
> 
> Maybe I am too paranoid here. The other side of race is controlled by a 
> domain. So wouldn't it be possible to increase how often the race is hit?

Yes, of course - just to harm itself. The important points are
- that correctness will be maintained, and
- that this is relevant for pass-through guests only (which are
  already not supposed to be entirely untrusted).

Jan


