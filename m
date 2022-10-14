Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B31AA5FECD0
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 13:00:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422767.669025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojIPn-00050Z-FA; Fri, 14 Oct 2022 10:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422767.669025; Fri, 14 Oct 2022 10:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojIPn-0004xc-BX; Fri, 14 Oct 2022 10:59:43 +0000
Received: by outflank-mailman (input) for mailman id 422767;
 Fri, 14 Oct 2022 10:59:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F+Di=2P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ojIPm-0004xW-Ia
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 10:59:42 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80042.outbound.protection.outlook.com [40.107.8.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d760819-4baf-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 12:59:41 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7212.eurprd04.prod.outlook.com (2603:10a6:102:8c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 10:59:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.026; Fri, 14 Oct 2022
 10:59:39 +0000
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
X-Inumbo-ID: 4d760819-4baf-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdwqBLsGR6z0unlWkQ2kiJX72FXwn6uJ8fkOqzYxCs9rgpvAzBdfkdzKCSwa/gRLeCUtUDuR8W6yrW0jxk7E0TURepjRh8W5BFzFClZTrsBckDkUYHqdgKtJHH7rctENVV2Rj0Nj/0vpYHwUStyIPrLR0tL6LddMxikWthhlB3VLs2mQphtsXwBK3x5TgGhgDSXNiKJG/ISG6kNkMAEIvF2vZJkIQiTVeNzfC2KEU2kveTR0xdD1GGpfIQY9GG+2NDLZ/yuQHZUOijGXKmOFI6L+u6Yx/89kbYAG/cv1USGigDGjcBABjHQKbYFj23Y3ipQn0oF4gKcAZn+JjbC+cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6iqmbL5oucMnsSVY5xfcBr49F+PoJ5RNN4o392i2tN0=;
 b=dpLUDSlPOsv8wVpyWeDMbuk5HxbtmQsv8bMuXrUJClKWfxsjDx7kuESd1x2Zz+VdYIxFXE+V98kCK5GLgjnA+/lOCNxobWcaj5plQGwqtSl/ITKPfRBim4zPuqt7gBbOqfhuUX7VABnoHzRacjRMI86Sq8DYNnYnZpU5aawkPG1k/hUTvGw/E35MMGvxo8Fwo++Vr8IhHbt5fQvYw+7SKxiJQK1+k9PoZ1e44N5/KB57Mht0q79U5Ryd40mFEIVUCuXpvShtW1YErF6PMDU8Kujz0hAqASKs1XhTeYoafQoamypvl4GsvHopZ/uclHX1RPpkckEVK9bPtjFqLWmVBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6iqmbL5oucMnsSVY5xfcBr49F+PoJ5RNN4o392i2tN0=;
 b=iZGlTlaWYjjuGD7/d+juIG1JQKVPuosZ5PS6U+Y2TY1xrtVvm8y3GuYXx45iMBRsj7XonxOi6N4StYSmCvFnttX1QI+uOScDNXeXpItGL1DUEcKR0Zf8C91uQrOrrpGZMye+tCpRdiLTIur16Y1z/7K+VF4StH/xHLObCu7enXukPlWuToXXcnbN3LRcMTB5lSk97BrX/K8YEO9tSLtWVFWEtPM5MHdP0HixwVWkXyMnYHPRwN10UE7sAFjf7uUCNDOcq5uXAzabxzn1LAPcpFPxs0/1E3T1QJIu3ffqD80F4/mQjnklcu3/tht7UOT/82tLRmKqGtk/Ohs9pDOX6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e60803a6-44c5-9d22-88b5-c924ee854fca@suse.com>
Date: Fri, 14 Oct 2022 12:59:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>
References: <20221014080917.14980-1-Henry.Wang@arm.com>
 <70670b7c-e87d-9eb7-691f-48c44e9d57db@suse.com>
 <AS8PR08MB79913CFDD2388EA05ADD187D92249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e7e24a21-1ebb-ede0-efed-275bbf503021@xen.org>
 <AS8PR08MB7991B0B2400B1B9D0E6B1C4592249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <db3e4568-edf4-c5c6-4f99-3444a38cc40a@suse.com>
 <AS8PR08MB79919FFC44E975825EE9CB3392249@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB79919FFC44E975825EE9CB3392249@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7212:EE_
X-MS-Office365-Filtering-Correlation-Id: c53fecb2-b769-4e6b-55c7-08daadd330bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Is8WYn8m8UmhqmZ1op8bzPhwi8jA0jE8TDt5abyByXEIfCigkKCN+JocHW7RL4Cu1mUhBf4kGAbrS3zYh2qB2GSCLPnc32uaRb8AV74HbNJvRH6ILVJHilLHn066ROML1ScY/9W9vdKVr/ncFPL2DQk4TN3XihH5+zMhhDlklAXcUK5tiZ+/Rc/8t+T5oROxycqyzzJOKv2dW282/0kkkOYhgIaDGs4W8OsiTK82eDk1Oee5tvK6dv8vuXSXqirxj4qajnI620q4P8vQcSniiJ2Z/ye7R0PrutUZuWhmPqDvYx1/UX+wbQFUUqVhc/gXKLGzupkQe04+y7igXwu9mCpqecQtyidDNhR4p8J7V++vuhUUxxCUrZ7yGuxwVeuFliNx0TZFLKBdiJHS71Pzowwr4AkMosSByUwQQXoHKutQipgGmURjpQnEbAY+7sCrmbdAwzUcUD1ZFYYU/ghY1voh1x2t3om5dfgPAI2Y7jxf4Q6sLXn4NmSjUy8UM8Qr+zQe+u2gelT2K4krFTIo7lYX151r+8ZyQlZ1by0WI9+EZkrjTtllHAZZ+BCTOlDjuPzoiZ+apgowueVzyGeOc5QfCEvCsh6j0A2Rr4drrwPT30450EOMyDTZAtezNNx3LzkcSUZCZltj+aH/DMjnlAVYyVBayL7izL0BKDtxlo5TMZ386i3Aipad8ynxmcP5zJPDraYAwRxwlXrqINLsV6BpL0jEFspYX0fuj3rN26ag5hPpM+M424QxGRY2at1GrPuOpz/AaaPZxEsxwYqKDJkxhpt13lf95U0DJ97tvNA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(376002)(39860400002)(346002)(396003)(451199015)(6916009)(54906003)(316002)(66946007)(6486002)(8676002)(66556008)(66476007)(4326008)(31686004)(478600001)(41300700001)(6506007)(53546011)(6512007)(5660300002)(8936002)(86362001)(26005)(31696002)(2906002)(36756003)(83380400001)(186003)(2616005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXdsZEhUU3FFdXVXcGNUQ1VabEdheDhJVDNvQ1c2ZGc2cUNwUzViZUJZS2Uy?=
 =?utf-8?B?OHJISlNWV3hDNDEwQm02T21rekpKRGh4OVkrWmNIMjFyblBRcjJxVmVXSlB0?=
 =?utf-8?B?QWo0VmJqWFdXQXdLZzNDVjhTVHc2eE9vU3NBZUQ3VTV4Y2ZvWjlKTTg2cllo?=
 =?utf-8?B?RUExWDNsT2JpdlI5L2xmYTdSZlpOWllKbU9jNFVNc3VVM2NUY1F5b0QzQm42?=
 =?utf-8?B?bE1uN1lZS3dIR0MzNVZWakFGUHlTclpSMXBIWFM2R2l5bTlNVHNpMnVqMC9t?=
 =?utf-8?B?cEJ2TTZNamRIZ2lxelJrNmdka0E3RDd0VStJRlFSSUdaZFNZQmZ4WE10ajhL?=
 =?utf-8?B?NGRJM3hwaS9iN3B6WnBjMk5Rb2svdG5DL2FwT25JMkdRSnRtUkhuczYwRGxK?=
 =?utf-8?B?bGZQeHFwNVZJTFNGVHRvcE5uWGlOazBNVk9NRGZZUEZrVnhKU0QxMjF1RVRt?=
 =?utf-8?B?d0ZrSkZWeHFIV2gzR1l3Q3BlZ3dYN3N2cC9ZU2FDcytKTjVYVHZweW9Ddjh5?=
 =?utf-8?B?ZDVoTGNGd05uL1NZc3ZwV21PYmY4eXJoRnpYVEErMmpHeGJuMG1zLzJkdUhE?=
 =?utf-8?B?eG9xb3hBSHRRNTBOTDIzV3R5VFhLeFZ3MytEZ0s4cXUyQmVpdS9uMTVWcElU?=
 =?utf-8?B?ZzRKTGY1VXFVTEM4UmY1ZGZTSWN6TDRnSitHZzlrK29pNGEvM2dyNmZuNTdj?=
 =?utf-8?B?Nk1jRGpkUUtVTFhINzR6TVYwM1lEa21RZi9rcm4yTmhUYmRPdDFEMkg2aDBG?=
 =?utf-8?B?NG1sY2I1cXZ5VHNxVXJ2bTZLT3JXaUhMN21aWkhISnhmc1B6Ym5Qa1UzN0Qx?=
 =?utf-8?B?RkM3RmxsOHlPSnQrQll5NmVsQVcyYkQxL2VKYUxVS3pnd3k3dUpXZkpFek1O?=
 =?utf-8?B?SnI2bVpOQm9BbVMzS1MwK284SUdNNmNuN0Jac2trdzE3QWE3anZGQzlwYmFn?=
 =?utf-8?B?ejNPdTlxV0prMmV2V1M1OHdLUUx5ZStGUENmend3dklhRkM0Y3pTMkY1TGVV?=
 =?utf-8?B?OWhHZTIrWG5xUkFKQmRrd1REejFzWGdTUEttYTRFejhJWEo0TlRKZmxubGJG?=
 =?utf-8?B?SGxycGgyTEI0dElEY1RFZzg1RzQ1cGV5cHlickEyMjFqU1FPVTJ1L0FCczRV?=
 =?utf-8?B?dDZaK2Z0bDdpT1FtSnBSY2k2OGpROUxNMWREY1dORlRsUTlUSHVJZHFaR2dT?=
 =?utf-8?B?OEZDSmtpeUd1dGNRNUJjSjBld2VLKzYrNWVpelI5ckhCclZ0QkVlazNENk1F?=
 =?utf-8?B?c0IzRUNwdThsUVlmWW1IWldJdHE5ck5yV29vTXk1eS80dFdrNmMxdU80NWlF?=
 =?utf-8?B?N1hBNnhyNE9Pdy96NnVVYWd4Ykp4b0pyOHhDaXkxK2V0TDQzZTExL25vK012?=
 =?utf-8?B?UjNPcUFzV3l5WmpaeSs0dEVLdTBRT1hyRVlLdmhaaVRnbmZueDJyYzArVDJX?=
 =?utf-8?B?OGgwSHJNSG5EdG9CZUtGdVM5L0ljcDdtVnMyeXh1MWRwUFQvOG5uZFdUbFpR?=
 =?utf-8?B?U2NObXMyYytJZXZ2cTZvNldFYkF1TjM4Nzd3K05UN3g3emthMWVDZEpLUnpW?=
 =?utf-8?B?V2dUQ3p0NVlLeGNON1JFcEdIR2lwWllhNzROMGdKNkI1VU9kL0NWZ251WlRo?=
 =?utf-8?B?eFVIUFpiaXFETjRTYWp5QUJMNmkvQlp1TGtrRkd4OTlHSVRKZ0tsMkE4UlN0?=
 =?utf-8?B?SUVPalFISVNvVEdadWRrd3FHYnpXWk80K2h6WnJDeEFTbU8yWHdPR0l1bCt3?=
 =?utf-8?B?eWJjTVdNMWFCSUpZa3haQ1lOcFl1U29OT3ppT1hNUGdUdlJjS2U1dnBuMDFr?=
 =?utf-8?B?VmJrYVBPT0pvL2RlUmwvbDZlVThxNFRFRVJCTkJoVFpLbXoxTHMwRTZoL1hQ?=
 =?utf-8?B?MDNNN2N6dUlkckRPTjBJTW83YTFLb1doOGtGSGZieGh3N25CNjMvcXQ2Z3o2?=
 =?utf-8?B?Q0hkTUJkNHpxUm1NNURaemFlbERQWXJZZEg5V0EwNUUyL1VzSjRpbTVSTmM1?=
 =?utf-8?B?WVFibmFoQ2NUWGJYUDNEbVZGUG5JZWxSQ1VzSzhIMTlPZkMraHppK0w0RXZq?=
 =?utf-8?B?S0YxNE5QL2dOZWovNElmaXNtTTJ6U0toVlpzdjZCNUwxbEt5U21Rb1RBZjBE?=
 =?utf-8?Q?d5PuPUY1brqzQwgMWblRiHE0d?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c53fecb2-b769-4e6b-55c7-08daadd330bc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 10:59:39.4637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Q8RH0K4Xxbp+tHv1L37vNF2gNyGhHLR34wk7YDPtgLRwQWBh6HeWoGIsv6+h6P2M3lEolF278V52rZoPn/cOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7212

On 14.10.2022 12:53, Henry Wang wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>>
>> On 14.10.2022 12:38, Henry Wang wrote:
>>>> -----Original Message-----
>>>> From: Julien Grall <julien@xen.org>
>>>>>>> +    if ( d->arch.paging.p2m_total_pages != 0 )
>>>>>>> +    {
>>>>>>> +        spin_lock(&d->arch.paging.lock);
>>>>>>> +        p2m_set_allocation(d, 0, NULL);
>>>>>>> +        spin_unlock(&d->arch.paging.lock);
>>>>>>> +        ASSERT(d->arch.paging.p2m_total_pages == 0);
>>>>>>> +    }
>>>>>>
>>>>>> Is it intentional to largely open-code p2m_teardown_allocation() here?
>>>>>
>>>>> Yes, AFAICT p2m_teardown_allocation() is preemptible and we don't
>> want
>>>>> any preemption here.
>>>>
>>>> Like Jan, I would prefer if we can avoid the duplication. The loop
>>>> suggested by Jan should work.
>>>
>>> I am a little bit worried about the -ENOMEM, if -ENOMEM is
>>> returned from p2m_teardown_allocation(d), I think we are in
>>> the infinite loop, or did I miss understood the loop that Jan referred
>>> to?
>>
>> Where would -ENOMEM come from? We're firmly freeing memory here. -
>> ENOMEM
>> can only occur for a non-zero 2nd argument.
> 
> My initial thought is the "else if" part in p2m_set_allocation. It might be
> wrong. Would the code below seems ok to you?
> 
> int err;
> 
> do {
>     err = p2m_teardown_allocation(d)
> } while ( err == -ERESTART )

Sure, one of several ways of doing it.

Jan

