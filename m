Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD46A3D349D
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jul 2021 08:26:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159976.294211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6oby-0003Cy-Vj; Fri, 23 Jul 2021 06:24:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159976.294211; Fri, 23 Jul 2021 06:24:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6oby-0003AG-SO; Fri, 23 Jul 2021 06:24:42 +0000
Received: by outflank-mailman (input) for mailman id 159976;
 Fri, 23 Jul 2021 06:24:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WrFY=MP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m6obx-0003AA-S4
 for xen-devel@lists.xenproject.org; Fri, 23 Jul 2021 06:24:41 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8b426e8-eb7e-11eb-9277-12813bfff9fa;
 Fri, 23 Jul 2021 06:24:40 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-9E6quH_oMDOpTfkDhw5yUA-1; Fri, 23 Jul 2021 08:24:37 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3934.eurprd04.prod.outlook.com (2603:10a6:803:1b::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Fri, 23 Jul
 2021 06:24:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4352.025; Fri, 23 Jul 2021
 06:24:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0217.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Fri, 23 Jul 2021 06:24:35 +0000
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
X-Inumbo-ID: a8b426e8-eb7e-11eb-9277-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1627021479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zmeApPHhlgFHu91apKk0n7x5cvV6anvVNM0ZknI1MXU=;
	b=bdfeEr0afPC8LYpSr2jJBHZ1TDvcK4J1z9ifU/RMu5HqkJkuUqD1n3DrtXETArl2cCZS0A
	L7T85r3BI7TZf3Kap2RDn/gbus3u3PVzzl7cmFiuwaE9LYHk7AYSHcWfT70us1mXrTMaeA
	cTQ1kXPpnBIzcyMMNq2Big8Vf/+Joiw=
X-MC-Unique: 9E6quH_oMDOpTfkDhw5yUA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JOvgyH5MIvtrciEU+xVPrfTrE04V15cTDAnobGJwDsclbS/pki0vlXHHnOJVJ01kFIDFRAR9fyDbq9riAmzF8C1H65f91Ga6iNsKC/6sctbvKFJjjnG/ARQYl3Lx66ESTRV8yNGvyUlU1swr3NV7J1+zY2728/iWBLJoiUtPxIFkAnMeJNvRjVb+br4pXbj3H9fBuFU6b30x/0uYmS2cBOEIjw3sdtIRbavspNBKIOuy/FJIDJXnnOuVyI1Ke9P/5O3dEHZ9EeLlXRzB3mXjd25QQhNntTCtIIJjUnBlYHliPbWzzAWQZJWv+orpKN8PpXTEtTm8QRlUKOV8j3BHlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmeApPHhlgFHu91apKk0n7x5cvV6anvVNM0ZknI1MXU=;
 b=YuM/VxK2dKPnwR3jPJasGcvbcvnggPCpnSMzxlMSpK3WApZbaTCatq4fYI+hDeuR5oMYs1Oquhy3I9J+s2wJN3dodP6Et1b0NANE4b3iTZyDJ2hltgjyK6Y/fP/d0vdClAiE8GYAQOFoFUQriP3DyE851ILzcO2hE3OORZdSfOXweazpe+Pwpm9sYb8zX/kvtKPfNLwpmIqdbA0Ie6oQkEjrPZcMh3R3TojtckAaK4r8SaTxHIKQADxw+QE076lVF3h34ZWwnMvMNrHVRnSfcTUg1TUwfS2v1Bzg15jjp82TOvFkjZ/WH+6wppvGUvezcZFXdTB6ejeSTqkhG4Nxtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: your change "iommu: make map and unmap take a page count, similar
 to flush"
To: paul@xen.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <185f185b-443b-bea4-5068-b9ed763a4c2f@suse.com>
 <0553727e-5dd3-23d1-6698-01b8bcb5dd1f@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d002358b-3b8a-6911-2ba2-c93c4aff38f7@suse.com>
Date: Fri, 23 Jul 2021 08:24:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <0553727e-5dd3-23d1-6698-01b8bcb5dd1f@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0217.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7b7311b-d204-48c2-a1d4-08d94da28ad2
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3934:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3934174898F64B272CCC1A98B3E59@VI1PR0402MB3934.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vETFtWLuUcryKlGVvtEq8wLStQRHw/hATeDGpOnubaFPsgVGHDjAZ/xrBBKVRDZ1MjET+Q1pUXjATywMsHR6cGfm8z0XyN70v3onwy3df7wsX/VVRdfNzxiYYF7nVo4xPv5ms8YsHkq+Zt0M8CsyLHjwSIJi1mn8PaT7aIiSQLJpESNmjK/0SF9+APP+N26I6fhxtftnt47EkaOAB96l4rFn+UzhNHQGsiy7urWMXzyvNr2dBGXlNwklP0QHiMxbqROQ5g4yx6m6qQkDqj+ORSsXnu4UbJcfmW+3Ca51BCLG0m2hqzcnCWFbZicHElEAP/xyUj1A5cCe6PVYCScBKM+5FRPuwCvjjUfqcQydrR2LaremhDoUK6KTOBh3kb3mQK9ydWLQIbP1grFg1o5VLH6E163Mdy36b69I9vpZmIF6HS4Lqzei0ZwQzfVXUi5TkEYIyndEp+q1ATwwhy1opneUz6mXCpuGVag1uRbBbdRp05QADZDckL/9Kd5oInCbCG1LO4uIVdyjQwnss4HLzqCIKaCx0cDnw2AyXwH9SunlShPBxT3STRfIc/5UCsFiCeO/iDuxQ+KIvjz8/mdEQkxVsUppdA3V126P0dRDF9r87WlXCdoX/Sf8dzD3pOomIkjGWbZyyz4U4EsFVs8t+jB/yctXQDwxm1Rj1prOukd+AlYNjdNeHMOw9fWjgKF2levV3BNpl/ZOwJ1Irch8lcYygK3n3+zetlwWTsYLHwI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(39860400002)(376002)(396003)(346002)(4326008)(83380400001)(316002)(66946007)(6486002)(8676002)(16576012)(26005)(478600001)(31686004)(31696002)(38100700002)(86362001)(2906002)(186003)(36756003)(2616005)(956004)(66476007)(66556008)(6916009)(8936002)(5660300002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekg1V0tTRzhURGdONStUQU1QQlp6Y2I2T2RoQWZVZGRQNnZCY2haZW5zR3R2?=
 =?utf-8?B?NTJYTUI1UzBpMHhkWjdnRVlKMHd1b3ZRTGFiVFp3L2NLaEM2bWNhQWFpby9p?=
 =?utf-8?B?U3F3bElMSG1oaVlMc0tHamY4cDVYM1I4cHFWRGF5enJrNU0yYUNZclNuUkpr?=
 =?utf-8?B?T3MrNkFEbUFXT3VXL1dZbkRMT3pjUy8wajdHWFJyRldVUWZIRHYzTVNnV0d4?=
 =?utf-8?B?cW1YOWhyR0dMclJrTFloT2QvRFlWQXhkanhrV1FGZHhPM1U2Wm1BSlNueEdB?=
 =?utf-8?B?STlhU3ZLMzB1NU5JdzMzaVFWaERreW9CN2c5eVk0WE1lTjhXM0JScFdnSGFD?=
 =?utf-8?B?blBXSzM4Y1ZoTnJ0Q28wTlZWS3lsMXorQk43bHlEbi8xaS9RTXYvb283ak9G?=
 =?utf-8?B?Nkhpenc2NFJCem1MZFFQWDlIbEdwd2lrVkd5ajg4SjZrYWdUeGpZbkJIUU1B?=
 =?utf-8?B?UWJMR2JtMnV4NkMrcjU1MnpLRU9YNEsrcS9kMWxtdmR4U1RjWFhrRHVlTTgz?=
 =?utf-8?B?THpKdThORzhKYzU4RXREdWN1L1M4L28rMzEzQVZGRHkzQXp5aS8raTlmOWdh?=
 =?utf-8?B?Rjdtbkd6RXcyTUI0UW9ZQkdPeUlrRytJeWtjbDdKZnBueGMrVmhUNDlCOVN2?=
 =?utf-8?B?dDhScUxrdlNveTZKVnloSG9qMmpLUDBxMFJSekFDL2tWSjIxRURoenNkTTBS?=
 =?utf-8?B?bzFWM0pyQzFCWWFlM1NXd3pSMHpEZ3MvMGt4bTJ1SzVUR3lnNWFkQUc2RWhu?=
 =?utf-8?B?UU01NzRsRnk1Zk9WS3Z6dUdGcklUckhVYzNvRVd1VlVFNGFwOXdsRkVPVnAz?=
 =?utf-8?B?OXF0VU1CTWo2Mjdhc2JYKzhmQXRRekhHcGxGM1B6WVI2bWZvcVVPRHRtdDU5?=
 =?utf-8?B?MnFsQ0dpeEttNjh1Wml3MEx4Y3pFZ05zcVp3VUlMUG9Wa3cyNm9sWUFZanVu?=
 =?utf-8?B?RG9RUDhSRlo0V0huQlZjL1NDOU5hd3VsY0ZHUC9COE52T2M2aHpubkJYMFpH?=
 =?utf-8?B?U0VlY3hnclFpYmxhZ1U4U1duU2xZSzlhNVllY1EvS2dCZk1sSjRDcFFoR1h1?=
 =?utf-8?B?VE9EN3VZWVBFYUg3Qi9QeFltUkF6WFlQU1Zsb3ZScUJjdzZwcWpFMmxMcmg4?=
 =?utf-8?B?SmpIRGFwRmJPTGMxaDBGQklQOFRuVi9rTjlmMUZqNFVMMG9pY1VraHo2N05H?=
 =?utf-8?B?eVN2RC85clROZ0kwV2xLNGVYWFd5d3pYd0xrUFd2NjdqTng0c2QvNjFlWkVm?=
 =?utf-8?B?aWpLYnRtWVFXMHFYZjhrK24zRDFFV2pEamYxS1RMTndtUGR2Z3U2RE11NXNH?=
 =?utf-8?B?ZVl4ODV0MUhMTDQ4OVBwRjFIWlJWQWJvVEZucVZPS3NsM09Sb2ZKZlV6TzY2?=
 =?utf-8?B?WFc4TzJUS2FlQzRwb0tzdXJLdDcyamJ3c1VyWEtJOVQvRU1sRjBuQVhYdzlY?=
 =?utf-8?B?M25nNGYwd2JDSkZHRTFpSzU5a1VyemREbWRQMk5ZamhoY3JqYXV0Z1hHUnJi?=
 =?utf-8?B?SndhRG04aDJoTlplaTJHaXZrNGZVMnY1T1F3Y2tjNUMwWEpNQ2QvM3NCeXFi?=
 =?utf-8?B?R2R6Uk5BM0s4UzNtRDB4dFZ2M3FSSTRTa2dNRk5UVzI4aVNuK29jZllVM2li?=
 =?utf-8?B?c1Z5ampKbFE0dk9oSWh3azNLWVk4ZHlRYmVoVlU1amZTRmtTZERCTEhsWEh6?=
 =?utf-8?B?VStZSEFiK3NvTkxIWk9kb2lqMVZINGhJZ2NnUmplSmtHak5HalhBU2tLT2pv?=
 =?utf-8?Q?UpABWAMv+r5mpJ37n63UPpecto/Zh/K9OpbmF0s?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b7311b-d204-48c2-a1d4-08d94da28ad2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 06:24:35.9665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3IaDUBk+Qvd9X1VOjU/d0B27eXsrHSrnJKHQvgJcSzyRi+BqoHjWCHUDud17OVuj+PYsACxG0mS9JhAcpxQ5bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3934

On 21.07.2021 18:53, Paul Durrant wrote:
> On 21/07/2021 16:58, Jan Beulich wrote:
>> Paul,
>>
>> the description of this says
>>
>> "At the moment iommu_map() and iommu_unmap() take a page order rather than a
>>   count, whereas iommu_iotlb_flush() takes a page count rather than an order.
>>   This patch makes them consistent with each other, opting for a page count since
>>   CPU page orders are not necessarily the same as those of an IOMMU."
>>
>> I don't understand the latter sentence at all, now that I read it again.
>> What may differ is the base page size, but that affects counts of pages
>> and page order all the same.
> 
> What it's supposed to mean is that a CPU may e.g. have page orders 0 
> (4k) , 9 (2M), etc. but the IOMMU may not use the same orders. And by 
> page count it means a count of (CPU) order 0 pages (which I assume all 
> IOMMUs will support).

Oh, that's still somewhat odd. Which particular (higher) orders an IOMMU
variant supports should be of no interest in what the generic layer
passes down. For example in reality the AMD IOMMUs support all page
orders, by allowing "non-default page size" through a leaf level setting
of 7. I'd therefore expect the generic layer to pass down arbitrary
order values, with the vendor code needing to split the request if
necessary.

The only thing that the generic layer needs to know is the base page
size, because it can't request mappings that are finer grained than
that. But perhaps for the immediate purpose we can continue to assume
a common base page size of 4k.

>> I'm intending to make an attempt to cut through the page order (or
>> count) to the actual vendor functions, in order to then be able to
>> establish large page mappings where possible. In all cases (perhaps
>> most noticable on Arm) handing them a page order would seem easier, so
>> I was considering to have iommu_{,un}map() do that step of abstraction
>> (or transformation). But since you did explicitly convert from order to
>> count, I was wondering whether me following this plan would cause
>> problems with any of your further intentions back then.
>>
>> If we really wanted to cater for base page size varying between CPU and
>> IOMMU, besides the IOMMU vendor code needing to announce their value, I
>> guess we'd have to do quite a bit more abstracting work, as it would
>> matter to outer layers in particular if the IOMMU base page size was
>> larger than the CPU's.
> 
> Yes, if the order 0 page size was different between IOMMU and MMU then 
> that would clearly be more tricky to deal with.
> 
>> Supporting just smaller IOMMU base page sizes,
>> otoh, would seem entirely feasible to deal with inside the rework of
>> iommu_{,un}map() as mentioned above.
>>
> 
> Yes. The aim of the patch was really only to make the calls consistent. 
> Changing all of them to use an order rather than a count would be ok too 
> I think.

I'll go check whether all the flush operations would convert cleanly,
and if so I may indeed move things back and beyond.

Jan


