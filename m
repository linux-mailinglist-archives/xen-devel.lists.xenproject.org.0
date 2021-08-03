Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C543DE72A
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 09:23:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163310.299178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAolY-0000wn-Nr; Tue, 03 Aug 2021 07:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163310.299178; Tue, 03 Aug 2021 07:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAolY-0000ud-K1; Tue, 03 Aug 2021 07:23:08 +0000
Received: by outflank-mailman (input) for mailman id 163310;
 Tue, 03 Aug 2021 07:23:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfYh=M2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mAolX-0000uX-Ew
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 07:23:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a50342bc-f42b-11eb-9a8d-12813bfff9fa;
 Tue, 03 Aug 2021 07:23:06 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2051.outbound.protection.outlook.com [104.47.4.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-4Ul4FkfoMnmt4PVCo7ecgA-1; Tue, 03 Aug 2021 09:23:04 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Tue, 3 Aug
 2021 07:23:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 07:23:02 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0008.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.26 via Frontend Transport; Tue, 3 Aug 2021 07:23:02 +0000
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
X-Inumbo-ID: a50342bc-f42b-11eb-9a8d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1627975385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Um8OFBst2d/TNNvASZvF2v8hlBGgAC74kNHSdvEV+1I=;
	b=Hgl+8bEUnstxe2HyUwmNXTP4FT7W/h24q6bPKutpwMpq9W8/TwucEr+Xxzaprk4byjhH97
	ekqzgrQI7i/rXhoG265Zr39r1ygO1icQmh/OjOqrBp8c3Qn1Y06W0r/ItbXGEUlyd3GUWj
	0H7o5sFutQDVW8sPwcClUUvf4ZXtxV4=
X-MC-Unique: 4Ul4FkfoMnmt4PVCo7ecgA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8wb5S6W0cdRLRH2qJ+xmZAMoXzSl7SLwkayml4/Vbae+YIRVfBVs9dkU1r5tkGWpC8o/5vzFsbzFG4zhimbOVQIyenRShvtyqNPK03HtOHzhuun6Lff7EFxQ4t05ERgXbdgASKl2Q3MBGLLIi0l4GRxpv2R0Yn58kJjuDZsmmugI627PFzZnGGzFoVBMgbmNWy7x0KExfUkiCDWawuT31z0oRCrfN2lh8HC73m+tA/hnzwhsYAg+EV/H4BElyn2uLpaD8W6BVdr0cTSexkIAtWHcVM0aYBuCacDNKExThkDS/Xsgn/aT9ndwDLYvHpSAfty37itRgU4lHfdrqfR2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Um8OFBst2d/TNNvASZvF2v8hlBGgAC74kNHSdvEV+1I=;
 b=ElA0UJeCzGr63HPLQMiMph7oQ0zb8B6ROIVKWQwPsurVtXx9GLBIdQcVHVj/pPxWK2QvCUxoIXb3Gz/6CxIZfIULhBodzUxkWuf5nSLSTmdozbj1pCVn/9+fx6S7uzFgOYeUg3ZERU0FlBuhWxa2nKK9mYkaJn8Ybc49qD/19gsMvAv2a84o+YKnxN4Km81CUVnPh4MTxUp5Pwm3x+73Ae4WVMI8u/YVuVjyrXte2dcalhI+yywEXDBMxwbD50tF2qsnDncKDL180bH3GH3B5rDkYG9rr/yuiriAQIZVlW6fAM6oKurhAlUpWce/90Dcn1p3v539h6t4GUTZ/JpiOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 09/10] xsm: expand the function related macros in
 dummy.h
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-10-dpsmith@apertussolutions.com>
 <34c71bc9-18e8-08cd-d55f-9f5f97bde91e@suse.com>
 <0c944d5f-cc79-4df9-9531-cb918aef8fe8@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <75b2e3a8-4e6e-c73e-9e35-8f1c9f501b9d@suse.com>
Date: Tue, 3 Aug 2021 09:23:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <0c944d5f-cc79-4df9-9531-cb918aef8fe8@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0008.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d11af1b8-9c6b-4886-ba78-08d9564f879d
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB703922FD4E4F5F98417F65D0B3F09@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zh4n58cPNQO1gZjKmp3CNH1izXUK/N165OGeAbZmihyvStb1t5WbVBX/styJqRkyfvoo0+QHUzhmrgXWI1h8d4oQmflcJ8oeqY05ULlrGkS3R2WztANVLi3/P9i/fkZquuFao/wHe0awhrVO+FPnii0i/XVcQiEJdlH/wqYytPT3yfuaTVI5OjnqZVbjC1BTufILS4S8HCALRieVb1g50oreDnbeWCSJop9t7ujreaarBUpjFt1pt4lS3XcgJCLTkDyEvzwaunTxA5f0spgIGygHNf9J2tj1LKtABktJvJr/pXxj2D8ciEI+usjMRX/UbVC2plfu4VYX9EtxcfjFGLpLfE82tmFk3yHW3tN//oJmr+D9RNTMHl43N6IUxkq3wuwyXP+tc1cPaTVGAhyNGkwD0sYDXnDpa2KmW1jRIQmLtU+IoSrfs4vu7iuvGUFNS78y80B/cliUW/3GgwfLBui2endel355MMheTZOXHOVjiuKlUcD0ws45ZBOqVpOA97jl340vrpmdoayuIarSzXb9hvvw6lX9NXHvT7EHDdK63ryZfsA/OQhUCyS0yALIyGauGpzW3UYTLMqh0Py9HKRLCv9CiP1QAvcasVQ+vPvmgloA4PKiUKrPWR/o4RYNLXE9+tbQcIC/iVekhuTxmSlwRtrWHApx5QP2jVNBi8tu2S44qAs5H4g7VNbI55jEhQeYlRez2r6DAMuZl1hPMRHOcdMJUi72hOhWkkwsSw+7lrMeQpSSmK4Fdez5DPhcnBLObMCodVCg6x5cGrFdNMj9M6XjZYtG/1WhkJYcB+g3cTIG4WnS1cq5meAWRRKH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(376002)(346002)(39850400004)(396003)(66556008)(66476007)(31696002)(36756003)(86362001)(6486002)(966005)(31686004)(6916009)(5660300002)(478600001)(66946007)(4326008)(2616005)(26005)(956004)(2906002)(8676002)(186003)(8936002)(83380400001)(16576012)(38100700002)(53546011)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vy9NUDY3Y0tnWnRteW00NGZUTm1LblJma3hBdVE5MFJjMkNRRnQ0NmhxdnJP?=
 =?utf-8?B?MUw4WmlkTGExcHUyaUNNVm5HR1dSeVV6bXppRzRNQzhneHJrcU11WUYzTkNT?=
 =?utf-8?B?K0RMVVdhMVVCSmd6dSsrdkY0LzhlU2c4c2wzSWhHVzdOQVc5dmpvdkhROGpu?=
 =?utf-8?B?Q0FWcGIwOCtzcCtlTEFmNy9TeVRzZGtYeExSek01dEdWWnJHcXRvdDlSY0l5?=
 =?utf-8?B?RUswaTBwV20wbldSSnpXZkFMVHhMbnlWemhENnFza0ZQWU5VUitSOXdBaG9q?=
 =?utf-8?B?eUdac3h5YjdBSmIzY3lqT0t4dUptY2s3V2V1eFFQZlZSRURzeDJGN0VobERB?=
 =?utf-8?B?N1VuY0RpYXBPM1N2OW5ycnh5STJBdmlDSExJclE0R1Q0djlScHc3Ni8vcmFV?=
 =?utf-8?B?VzltaHphR2EyR3l6NkM1dFJFVU9qczhTc281UkpUbC9YKzJpQmN1MnM5Zm5X?=
 =?utf-8?B?bkRydEs5dWk3ZmRkWFpIWFJBcjB6NFp2U3lFTGFYY0oycDRJUmliQStUaUxU?=
 =?utf-8?B?b25vekRNMmVUZEVWMW9EckRsSmVZdzdMZVhuU21taFIvWGMyR3dndEZ3alRt?=
 =?utf-8?B?ZzkxL3JBOFFNek1qUVBCVFJZVVpoWDIzZGsvQXhXSVBuN3BaVGR3MnRKQmJr?=
 =?utf-8?B?ZmxHa0w5cmNXZHhGOUIrL04rRGl3TTluSFRveFhEK0xlUmg4VmhablhmVTVW?=
 =?utf-8?B?RCtNWDBWNEpMWDJheUhZb2l2Qk5Dd0N2NmQrenBFWWRCL0hEZG9xWVRWbXlK?=
 =?utf-8?B?elZNbCt1SlN6bmJxZERoWThhZnIvL3hmSVZyUWZydFhpcUhRWS84dU80REtm?=
 =?utf-8?B?TVBXSjF5TXV5U2RKYWFmeDZXdjZidXlrOVNGd1RMLzVkTzZqYW9RMDhydXVS?=
 =?utf-8?B?Qk45aklkcmdlYWlDZDdCc1IrVnJBeDhlZjVhQU5mWWFVZG5YQzNyK0g5OHN3?=
 =?utf-8?B?Mzlsd0VTSUlGaGI3dElyaS8rZHhqVlhCZFU4UGozNWM3NzRsaDZNNURLVjBE?=
 =?utf-8?B?Vkd3ZUREdXdDY3FjQjJRZnVCdHFRNkhjNjZ5dTNDdlpiRC9QZzRCMi9tRUlY?=
 =?utf-8?B?cXFYejZlVStRais4REJabkNjbWFiVlZTbWJiMU0wWUJLN1VnWlNOV0lJaVZ4?=
 =?utf-8?B?R24rQ2ZRNWMwekFpZWIyQ0lSekdHMzlieDVxTlE0bDRXb0w4NjlzNEUwa3Uz?=
 =?utf-8?B?RUJYQW1lV3g1T0JremRVQVBBZkk0M3RhdGxnTlViQUxaUTBxSTU3VUgwKzIw?=
 =?utf-8?B?NkxSOXdEQnB6VWxUQ3hnRWl4anFQbktLc0w1M2FpWlMvU016ZS81V29FeFhI?=
 =?utf-8?B?bnVHN29tYkdnY1diakV0MTlSNnNZR1V6NDhvM0V3eVZnT0IvcmdnelJYeE8v?=
 =?utf-8?B?UmhvQUgzOWhpcW1IUUkyYTdJWSsvdlUvRkZUTXo3Y2R0ekRBTjBKMlluSHJm?=
 =?utf-8?B?Q25taWhXMVc2UUxQamxXanNLcHVyeTQxVXlSWEVTVFYybVJTZnE0TDRwcXR4?=
 =?utf-8?B?VVBBcjlMNmwvVmRkTzAyVVMyaHFtRWRGcWdTVU41SWY3ZzBRbjdrR2lXQWtl?=
 =?utf-8?B?NmYxOVVoWVR5YW9ab2JDR3IyR0FsU3NoMFgyREQ3UXRHaFNibFlWZ0d2dUw2?=
 =?utf-8?B?c2hvcnFzblg3bVpsamN3d0lUNUFPVkVJVS9BVnQ5bkhncjRVMllwWnpFMUFn?=
 =?utf-8?B?T1FHTEJqZFVQeW1CelZyT2ZxOGhxU3krMk5JNzkyLzBVdzZwVjJzc0R5bmdZ?=
 =?utf-8?Q?nawUoOXp+D9VeKTQjGGcdFR+aLsm/r2weKqw1Ii?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d11af1b8-9c6b-4886-ba78-08d9564f879d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 07:23:02.8651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g2Vre20bswUIFHcM46HbUfDgTxhbTsK8b6A5HzqahfdUxEEJRVIjNKW24ZEIAGhK6WbxquePBtwD0vbrJHJaiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039

On 24.07.2021 22:07, Daniel P. Smith wrote:
> On 7/16/21 3:34 AM, Jan Beulich wrote:
>> On 12.07.2021 22:32, Daniel P. Smith wrote:
>>> With the elimination of switching how dummy.h gets included, the function
>>> declaration macros are no longer necessary. This commit expands them out to the
>>> only value for which they will ever be set. This results in function
>>> declaration lengths changing and since some definitions did not even follow the
>>> 80 column wrapping style, all function definitions were aligned with the
>>> predominate style found in core hypervisor code.
>>
>> I'm afraid this last half sentence is quite far from true:
> 
> I would disagree since I know I went through the frustration of trying
> to find a discernible consistency in the files in common/ in the end I
> settled on following common/memory.c since it seemed to have the most
> uniform, it had only a couple of anomalies, as opposed to other files
> where indentation was varied throughout.
> 
>>> @@ -82,43 +79,43 @@ static always_inline int xsm_default_action(
>>>      }
>>>  }
>>>  
>>> -static XSM_INLINE void dummy_security_domaininfo(struct domain *d,
>>> +static inline void dummy_security_domaininfo(struct domain *d,
>>>                                      struct xen_domctl_getdomaininfo *info)
>>
>> Padding wasn't good here before, but you clearly do not change it to
>> either of the forms we agreed on as being the goal for consistency:
> 
> Then that agreement should be document as CODING_STYLE only states:
> 
> 
> Line Length
> -----------
> 
> Lines should be less than 80 characters in length.  Long lines should
> be split at sensible places and the trailing portions indented.
> 
> 
> I found that in common/memory.c the predominate style was to align
> parameters with the first parameter when wrapping, which is what I
> followed. In this specific case when I wrapped the second parameter to
> make the line less than 80 chars (an explicit rule in CODING_STYLE) and
> attempted to align with the first paramter resulted in the line
> exceeding 80 chars. Since the only hard rule is lines must be less than
> 80, I decreased the indent by enough characters for the line to be less
> than 80 to be in line with CODING_STYLE since it only calls for sensible
> splits that are indented.
> 
>> static inline void dummy_security_domaininfo(struct domain *d,
>>                                              struct xen_domctl_getdomaininfo *info)
>>
>> or
>>
>> static inline void dummy_security_domaininfo(
>>     struct domain *d,
>>     struct xen_domctl_getdomaininfo *info)
>>
> 
> I will align to the second, even though I find it annoying to switch
> alignment styles, since the first would be in violation of CODING_STYLE
> sine the second line would exceed 80 chars

I guess you nevertheless realize that this 2nd form is precisely to
overcome the problem with otherwise exceeding the 80 chars limit,
while at the same time making sure the indentation doesn't end up
entirely random then?

As to extending ./CODING_STYLE - I've had rather bad experience
with attempts to do so, with my two most recent patches to that effect
just having had their 2nd anniversary without getting any feedback
moving things forward (despite, unlike in some earlier instances, the
proposed changes not looking overly controversial to me).

Coincidence or not, just a few days after my submission Volodymyr
submitted a patch making an attempt to document function parameter
indentation [1]. While the patch as is had some comments, it didn't
seem like it was controversial either. Yet nothing has since made it
in.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2019-07/msg02440.html


