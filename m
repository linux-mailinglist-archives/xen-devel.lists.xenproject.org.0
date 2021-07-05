Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C22313BB833
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 09:49:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149822.277108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0JLH-00047N-8Q; Mon, 05 Jul 2021 07:48:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149822.277108; Mon, 05 Jul 2021 07:48:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0JLH-00044u-4g; Mon, 05 Jul 2021 07:48:35 +0000
Received: by outflank-mailman (input) for mailman id 149822;
 Mon, 05 Jul 2021 07:48:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0JLF-00044o-0T
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 07:48:33 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 640a733e-dd65-11eb-843e-12813bfff9fa;
 Mon, 05 Jul 2021 07:48:31 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-6-LtSUoOP_M9uh3XynrMA9MA-1; Mon, 05 Jul 2021 09:48:29 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3936.eurprd04.prod.outlook.com (2603:10a6:803:23::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Mon, 5 Jul
 2021 07:48:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 07:48:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM9P195CA0005.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 07:48:25 +0000
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
X-Inumbo-ID: 640a733e-dd65-11eb-843e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625471310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=379muhCbVU28mtoZW/NN4A3h4S25XYXXLW+AQ/yDtGY=;
	b=YNN1mInCyQQEpiVYaTy3WS1cW2h/Ja8FCEhGv8tuveyHdDJlisVQUj3p3ISsUn5FwHEA/4
	Z/ZNSHwZNI6rH8aJDfhYSIbuokv4i9LjjpO3fSKvYjSxY+de4JoMNIaRpU71vE5z2Hh52m
	a7gJihh4F1R++7zUN4AtxpTp0fX7nu4=
X-MC-Unique: LtSUoOP_M9uh3XynrMA9MA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1oW4cccrSM7ihy0ffe9bulXVCPr/QHMVtZwOpRN3XQF8SGLAIsFobSXOHmH++i7N5/t+RmR2UT/J7c/V/V5kp0Q0HwJUj1MlHImY3EIUgJimfhOw3SiyK+6M47uQPJcT2d1w6qb9DpLIqXZuRWhHt7VbUirDpvvBcLo8OPXP0TeGxrEvWnkyrkLBCA0A9KrwN8wX5o1ol/+NuwzeDidBopKfSWpTjpmoXRSc6tvZOTcL+FZIPvSFMyPbIR9uZ+8GwOzAh/5QMD0QxXbUKM4IU4tLyimeNSOHdLnjKIOXGvFP5Gfb+idfctSnI3shr6k2mzrYoxtejvcE9oNTOLbZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=379muhCbVU28mtoZW/NN4A3h4S25XYXXLW+AQ/yDtGY=;
 b=iOY/Lv7Oj/9fFGgY7WSJhqlpx6c9e4xgAoHzDaiiOPuOz3EHtk1kKVbBinxe3ctd/ceDsvyOCZp0mp71fZLaF5XxBieWXk38LaOpQPtNWhvc1bL51wNzQc1PLuXarnvYrdrVBEP2DyXDsDwHd8SVinKK9KpXCtRq0QS9i3Wuy6H26wO2UGJUVozu0S6MN7gWYXBQkj1AASOkkLkHSxm867C4bQzuZQA4iFEnIu558eVN9yMFxklGMr2Qmrj/kcuLJOHQC58fJeHeTcdQY+H3CsJZoKS0lGIsNrlb5LRgWI1Qwr1OFXxGatEMrtM3XqHYFPwj01lhTlSRJpEF5J4SWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 4/9] xen/arm: static memory initialization
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-5-penny.zheng@arm.com>
 <e0a312a1-f430-3ff0-6dd6-fcfe18e58071@suse.com>
 <7f77349f-015e-83d3-d646-af9897e31348@xen.org>
 <VE1PR08MB52150F476CA7E1989F9067C7F71C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <13bf976c-20af-f6d5-5532-5f11e75333b0@suse.com>
Date: Mon, 5 Jul 2021 09:48:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <VE1PR08MB52150F476CA7E1989F9067C7F71C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM9P195CA0005.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e4465c7-2cbe-4c92-e275-08d93f8945ec
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3936:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3936F72A09D7C302F05C72E9B31C9@VI1PR0402MB3936.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wbJ3G3/IaSoU9MEc2A0fh0A9/89YYslc37aipzhjXx6rzJ6g+kgqkMdnYTH1hn3743XtjujHfInLw9cthrM1TKfC6m1UVFRmpoGsYYT9gM8HcM7ODl5u0JnZyPWblZBWG5b+L3PtsFgrb2nWPNiamr1lRSqRnJcXRGRYCXwxjPOxc1Pl13aSfj+Z03gZ8/ozqJs26oLPka9RSOhZx7i+uWXySmOETeLJREZRPeuN60z7u1WUGaRHUXVLhyNKGaaDjC/LQsHWuiGh0qec5Yxx24vL44IP2dlAwk8y/J0t8+fi69gP8WDCaDouNY8EVuSDL5b55WCTbcUmaq3I+uYvNURfyY13BftKqlO+5w4fzZLo+r1A2J3AkkyKaniqXaqtOKjJQeVANpT0OFQCHImUWC5niUuJd8eO5Vj2P+5qrTDSOZo7THjObdkJUSIBWXIKv5TcYS3go71HxBsGJR1sVwFFB+gb8/y+SrTHjiMx8IQzmXvHENdZ1JxHnBniip8SuVSVU0MpbxXtAX7r0jOOVCuBGJOCEquZ6n52X1p2xKUWQFUk9UlHkr8gVHNLimonpPX5nFWklYfkgw/gGHah4rK5TzXm471fV4P05SHJCisEF6h4/dxPdUqPIQsLoiAKZ0QXx+lHBqPxVTBwQG0ncAU7GmfNt8fW8QjZEwmhe4J3Rc1J6xLq5LxiDM6l0ZwBFzGJJ+l5jxH+l8J4t3Xqbd2qvRVkxM6RghhiD57JpG0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(396003)(346002)(39850400004)(376002)(16576012)(8936002)(6486002)(8676002)(66476007)(66946007)(5660300002)(66556008)(4326008)(54906003)(956004)(6916009)(186003)(2616005)(26005)(86362001)(316002)(53546011)(16526019)(36756003)(31696002)(38100700002)(2906002)(478600001)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzUySGJYek5BZEIzT1ZFeHJBdElLRFVibEp5Y25BM2VpcUNLUit0RHByQ1pK?=
 =?utf-8?B?UDBHaEZZeEZadHBVSFh4b1RIL3JrTUxsSjQ5TEQrcExnUkN4eTQ0blJNNXor?=
 =?utf-8?B?QlV5TXpqK2M3YzZpM3BkWlY3Tk1jVm5XUUVWNjhOUUdFaWovUTlOeFR6ZjlK?=
 =?utf-8?B?cEdJTTNBNmhDTlp0TW5GNkV0aFNNOVhQQmpYL2ZBQkR3SWNuUGRIcHdVZnNB?=
 =?utf-8?B?ZnFNS3hmRWdzbzA2NUNEandGOEY3ZUVIcFQ5RHRMZzVudnZtTXVLdGFOQ0dh?=
 =?utf-8?B?RHNQeDlhMnVWcm9ydVFxOE4xSEtJWnloQlpMb2h5ZC9JM1hZWVJTYUtaSkZv?=
 =?utf-8?B?OEtVN2JTdFo3Wlp1Qy9DK1VNNE8yeXB6NWtZenZmRGplVzlEQlVOaTFlMGV0?=
 =?utf-8?B?MEdWTmd4cXlDYnVqYktlNFF3ZFJmc2gwWVJDOVpBYWs4VGE3VFhiRU9zdGxj?=
 =?utf-8?B?R3JVUDAvVko4amdkdDFndzVaTExHKzdtd2ZGNER3OUhjdkdhYmw2OXpxVnBC?=
 =?utf-8?B?OFpCNllmVUVBYllFY0Y3OVB3aDdrdVV6TUpiT0t5QVRyOUZjekk0MVlDUmhS?=
 =?utf-8?B?OUp3N1RyOUZLUFJXOXFIeUVWdlYwMm1MbEl3U011bUJnMTdHS3htaTVseDFl?=
 =?utf-8?B?YVdTajlIRFU1N3dacUduemxBZEtZVmo2REJDQ1dQRHF2c0Q1dnVCZVhkcHdm?=
 =?utf-8?B?RlZiL21UNXJabis5L0pZZXZDb2wvZTIvYVlhMVRmNEd4T1pWSnZGOTF1N2la?=
 =?utf-8?B?T1N5Szk0YUdKN2hlTE9Pb0lDT3JodjFnQ0tkdFdWWmZ2alc4bzF4eWR4WkFt?=
 =?utf-8?B?c0w0L2VVSFZvV3BBQ25XWUJrL001S3VGVUM5MDVSOUxhalVXcTdoeitHVUs5?=
 =?utf-8?B?cE1PalgwcDVHU3VkTEk1UG9WdFhpc0Y5a2dkRE9HUVlwSTNGaXFkeUE4Mnds?=
 =?utf-8?B?eVI3L2E0aEZ3VW9LUUJFZEN4MDl3YndoMitoNTkvT3dWMW1Ic3JOS0k4Mk95?=
 =?utf-8?B?L0N4Z2tZUklQUWRaMUJqV0N2TWcrdThHeS9IY0JmdFFqMWoycWpxdlEwTW9i?=
 =?utf-8?B?b3RKSnlTZjJVT1FPOFVZQmsraWZhM1RLK1E0d1lhdzh2d0JZU3hOTXEzbWll?=
 =?utf-8?B?ZEhqR1VhUVVRYmljcWNLNkdsNTVqYzZkcE5MUkcxYWtJT3FTVXZULzlORkxX?=
 =?utf-8?B?RGFNalpKeDh6OURDZ004TEhoWDZVdElXMGlTUFFzTFBmTnJnUUloYzV6elhY?=
 =?utf-8?B?TVhnS2dvWHd3Qjh3YmJITXhTbFM0Rnd6cUpaK0hCL3RWamJyZDJYWmdPK0Vr?=
 =?utf-8?B?ZE1qYU1LMVZDUFgydVY0aEt6S2t5QkdncWEvdTVNZk9ucVErTmsxN3FWUzFZ?=
 =?utf-8?B?Y3lpTHoxQXRpSDh4MGNNV3loN3J3S002TnFxSlJjUE0wNmxxcVZZZktpdzN6?=
 =?utf-8?B?a2ZyVm4wbFJ0cHU2ajY2MFpKallWTG1pNjNmQ1VmMHdMV2VIRVFFYUpsWHdO?=
 =?utf-8?B?RkVJWU9WV25POHkvQU9PSUF2WHVFQXFWTXJQZy84WFdnTlNkSDFQNlZ2LzNy?=
 =?utf-8?B?VnVoSXI5Ui9rd1VSdWRoYnRxTVZWamlYelUyZENwdElsOTRsZk1TdmVVQ1pi?=
 =?utf-8?B?ODNTL3Bva3FLT1p5akhsY0I1WFRLZXJVcUo0UXBlMTFMYnZsc0xyWFpzVnFk?=
 =?utf-8?B?V3ZYalUzbmNGR09PZEcxZUtPZlpIVUViemUyMmVCUkdUaDcwT2dxQjFpdWd0?=
 =?utf-8?Q?BtjhKyIYL2HBlpTUcrhJbjQe/noy5dkPhjj5I6h?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4465c7-2cbe-4c92-e275-08d93f8945ec
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 07:48:26.6867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xl271Z8+VQaEF8kYlrVhrHgxDShJwX5K19dCPQxap/mlS/xamFQAF8ZnfUhRmkvbo0zSEW6SlrouCg/dyTjb9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3936

On 05.07.2021 07:22, Penny Zheng wrote:
>> From: Julien Grall <julien@xen.org>
>> Sent: Thursday, July 1, 2021 1:46 AM
>>
>> On 10/06/2021 10:35, Jan Beulich wrote:
>>> On 07.06.2021 04:43, Penny Zheng wrote:
>>>> @@ -1512,6 +1530,38 @@ static void free_heap_pages(
>>>>       spin_unlock(&heap_lock);
>>>>   }
>>>>
>>>> +#ifdef CONFIG_STATIC_ALLOCATION
>>>> +/* Equivalent of free_heap_pages to free nr_mfns pages of static
>>>> +memory. */ void __init free_staticmem_pages(struct page_info *pg,
>> unsigned long nr_mfns,
>>>> +                                 bool need_scrub) {
>>>> +    mfn_t mfn = page_to_mfn(pg);
>>>> +    unsigned long i;
>>>> +
>>>> +    for ( i = 0; i < nr_mfns; i++ )
>>>> +    {
>>>> +        switch ( pg[i].count_info & PGC_state )
>>>> +        {
>>>> +        case PGC_state_inuse:
>>>> +            BUG_ON(pg[i].count_info & PGC_broken);
>>>> +            /* Mark it free and reserved. */
>>>> +            pg[i].count_info = PGC_state_free | PGC_reserved;
>>>> +            break;
>>>> +
>>>> +        default:
>>>> +            printk(XENLOG_ERR
>>>> +                   "Page state shall be only in PGC_state_inuse. "
>>>
>>> Why? A page (static or not) can become broken while in use. IOW I
>>> don't think you can avoid handling PGC_state_offlining here. At which
>>> point this code will match free_heap_pages()'es, and hence likely will
>>> want folding as well.
>>>
> 
> Yeah, I was following the logic in free_heap_pages.
> Hmmm, I could not think of any scenario that will lead to PGC_state_offlining, that's why
> I was not including it at the first place.
> For broken issue, tbh, I just copy the bug_on from free_heap_pages, after quite a time thinking,
> I also could not find any scenario when a page(static or not) can become broken while in use. ;/

I can see that what you say may be true for Arm, but we're in generic
code here with an arch-independent CONFIG_STATIC_ALLOCATION conditional
around. Hence you want to avoid deliberately not handling a case that
can occur on e.g. x86 (see mark_page_offline() and further related
handling elsewhere). I'd perhaps view this differently if you were
introducing completely new code, but you've specifically said you're
cloning existing code (where the case is being handled). Plus, as said,
you'll likely be able to actually share code by not excluding the case
here.

Jan


