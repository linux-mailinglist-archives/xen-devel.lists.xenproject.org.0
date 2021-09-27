Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E5A419234
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 12:26:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196669.349605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUnqE-0006wB-9n; Mon, 27 Sep 2021 10:26:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196669.349605; Mon, 27 Sep 2021 10:26:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUnqE-0006uD-5A; Mon, 27 Sep 2021 10:26:34 +0000
Received: by outflank-mailman (input) for mailman id 196669;
 Mon, 27 Sep 2021 10:26:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xtCR=OR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mUnqC-0006u7-F4
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 10:26:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6174ac66-1f7d-11ec-bc44-12813bfff9fa;
 Mon, 27 Sep 2021 10:26:31 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-RDFUha55OfuIfF9dDF9szg-1; Mon, 27 Sep 2021 12:26:29 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3934.eurprd04.prod.outlook.com (2603:10a6:803:1b::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.20; Mon, 27 Sep
 2021 10:26:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 10:26:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0021.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 10:26:26 +0000
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
X-Inumbo-ID: 6174ac66-1f7d-11ec-bc44-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632738390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YUY1eXGShgXO0KNmTzeyUwyq/wBL8aX1DbFFl/+h4R0=;
	b=Vry0M0oYlvGlXmg8R2ntkWxZ1HZX39jCNfQc7/eoCkXNXnMNGevwsQkimUU9+1A+Nn2a3C
	uzJkZBxiRHDIqbI/OvXoOVBugDhjOE56GFl+TuciSZVt++U9l8Xonv7AZpNO6ONPcygL3k
	gHxW9xPf+jMhEXO8LWmIlhVgGRi6qRo=
X-MC-Unique: RDFUha55OfuIfF9dDF9szg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+MxufCO1QpkO07WRHLgKhX+2PQhH5Fm1t+hD3AXtlyR6/0ZECb8GMVaLmac0XW+nBKVs6v6tStt2Hf0iBFJpxdWDfg+/faHlGBH9rjkkt7tFubuxUzW0ie/jgcecujBCttNrwPIJ2J3QBocqxa3hVj9l5xisd1mMNCTrSVm9Z107SLTJQHfUjm0TP1L7SqN0MqRtVpl+C9txReY5pLjvtdxJO2o00UVyvje0ZQgYV1seSZ50rj+N2FQ9lfjIkYfq56/TM4zxPzbR0ryWrVySjvzy2oQjfNc2gjkXzgIpXNa69mvRHeHpjx4pS/nrlIc3BdjtNi7UQAVqP1JXlEzig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=YUY1eXGShgXO0KNmTzeyUwyq/wBL8aX1DbFFl/+h4R0=;
 b=VJ3wnKay3upwtx8xmzuTbd91+EVKpS39AktO9wAYJLmbMmR4fDv3smvLNy6gWyIfqVwQYahdq5XbKeiBO0gyAPU9gDWNEjDXyLYb2kdpcOv1pkS96HQJSNG6FP3Cf0WX1AS2fJlg0y/gLvZhpYBtHVOPDsovsLfXzrOKxWqKe47CWS76gbw5ewUtguX/B0McsFxWogiL/SsTImTIJCTUeOjRoz/0LWZ4Kr4Yl+SRegqgAcIXI8fbUAGHDwJRMqxrfFpnZl3Lwd2VCXFUxJqMH1zGNZhp5BIirqHYSQzuKv73PsGHkT7rj50BLPAdzntQz3Le4hU3Y0ufJVr6LGuubw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 05/11] xen/arm: Mark device as PCI while creating one
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210923125438.234162-1-andr2000@gmail.com>
 <20210923125438.234162-6-andr2000@gmail.com>
 <443f57db-7b0d-e14a-88bb-78a31c0271d6@suse.com>
 <55beed13-3a7f-7269-870c-ee0361e23a1c@epam.com>
 <7b093c2f-33cf-ac9d-9583-f0d8b2bb4f48@suse.com>
 <23ae58de-6bd0-b299-a7d9-e6433d1b0689@epam.com>
 <56d30f56-d9fb-e7ca-f3e1-6795973d648c@suse.com>
 <a119740d-02c2-315f-432e-67aec806ada6@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6eefff6f-97ed-e7f5-37f2-96065bd1f27e@suse.com>
Date: Mon, 27 Sep 2021 12:26:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <a119740d-02c2-315f-432e-67aec806ada6@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0021.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 929964b6-6702-43b3-5398-08d981a1433a
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3934:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3934C3D326F9BE60DCC62AB6B3A79@VI1PR0402MB3934.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rL0olxL2iDI11Mw/qJl8OQAk7cKQ90bSMdeObHL1rYng4IHH2kRL0K6lhPSne2BU2BpWLTjJ1fT+bM4t44XW1/O1doJRu9jRYjvqifxLhlJqMQSn/mdI0XFNdiPd2kVKxrip6Ikfu4dT198UoNHNmMVcR2DUHpenmz6BZ4c4WG5BKa5uZLj4Emx7eTvWMe9PdbWGSxMNIuVH0OI5EKTsApT+fVjLKL+FUBGNfWYUknRCzHHyXb0dX50dRwAtpZ6vXkQODt25/VV81csmr25uQ4ycDmhUMNV1ZkeTdZB3PR6JHKjC5W7FWTSLqtb7Bg4QjnwUffplaAb0AmbDXHREdgJPIZV/0TtJ9DhUTvGYeCJEWts5C+s0ZtPCZGYNRl+lrZYo2xVQPlrdngodWGbuIWPPC6KESFrq+owEljyy5+ndBaaMXGuBaoZbUWcayBv2hZhkxjVoNgmLRfmCEEQSzQeJjSmmauwNypMupvKD7nNjD4gFB1fus/HIGMxVT+GCaeqAbjPLLxeXB4gGHW6ODnmy+eQUz8qwMZZ7pQFk3DqQUds9sOVCJzSrhwJFI92OLpirjzlqv35UH5Ewhpd6u2qDWRdIQT36FDX+kJnWe2PrBjRJku7on3QQt2js8KCmTeH1fI6kY58QaZXCaRoq8hG8Jl/Xw9qgJdU7IBa0ej8zwjTITc3tx7ETbsy+dq7GgsES/Wv2Fj/TnDcS6vAjxb8x5aiYfLrce+2BinjtwkHve8RFggNHVk0v4X6yWukg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(956004)(38100700002)(66946007)(6486002)(36756003)(66476007)(508600001)(66556008)(53546011)(31696002)(26005)(54906003)(86362001)(186003)(2906002)(8676002)(31686004)(8936002)(2616005)(6916009)(4326008)(316002)(7416002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDg0VnJtNUY4YWd6c0VXaHBGU1g1aTU2endHbkV5WTFPZk5xVmplYWp6L3FI?=
 =?utf-8?B?NHRFOVFTbnE2UUpWMFh2RXExcnRndlU1Mmkxb0NjR0Y2c3ZWOTN2VEVVYnZv?=
 =?utf-8?B?c054TFpyV0pHWVV2dFRsRVJNSFpjczFkNUV4cDBveUlaU1pmZ3VMVXRvb0J1?=
 =?utf-8?B?SXpvQmxLZGhiaVU1bmVwaXlNOGp0N3NxeGVHVWdxWDc2bHFtSk16QStKOXl4?=
 =?utf-8?B?eDB0Kzljc3ZoRE9mV1pERHdBMzdvWWkyTEc1bFVGNFVzL0V2dStwNk1Rajd0?=
 =?utf-8?B?emhmckhNQ2FGWGZRQ3luL0hYa1VRdEE0alNDNHNTNHJ3bitSK1UzYzBXb0xj?=
 =?utf-8?B?ZWt6bmZSN21tWXBYbHlzTHk4QTlCZytMRHpkZzFqQzFXanJvVG1LQkZYZm81?=
 =?utf-8?B?Y1Zjam1BMmdsdnlIRkM5NzI0UDhSbTVmOVpBdDRPSngzUUExRDZza3RXRnBX?=
 =?utf-8?B?TFNqdkcvODVaQXRKV3pPMGxlaUd2SmRWYTFhenFmaVJScmZNNXgrOVVPZmRH?=
 =?utf-8?B?ZmtFT3N6SXpMdnpuOXJteWdPclVHdU9ndTMvNkJ3K0tBaXEvWlhnZ1JwL0tq?=
 =?utf-8?B?WTVUQmN6WDNETmZoMGN2UUpJZEgxSW9YWnlwL2wxRlFsVXAxNVNVQWE1clF2?=
 =?utf-8?B?MVk2bGhwWGwvYmNYYituRGhsTWpOdjNZK1g5YjhyTzA4eXRmQnRaNXpTdzdZ?=
 =?utf-8?B?aC9HajFYd08rMFlzRm1hVWYrZGR5RDA1aDJjUXBHRlYwS2swSFdtTXkxZXFi?=
 =?utf-8?B?aFFaNkR5L3lySWZGcDBReVErRVdwdUFrdnR3cVdYTGpOZE1EZGl3SCtIQlZF?=
 =?utf-8?B?R3pKT0xhaDZPTGQ0ZDRqd2EvNEtiTVdWd1piNnErUmZYSS90RWFlQjI3Z2hq?=
 =?utf-8?B?TUFENldOOEJsL2g1eEFiT21SWWJlS1RSaEg2VGJrV2Q2Y2JVM1ordUFmamZE?=
 =?utf-8?B?bGxSYnJPTElMZ011UUprcXZsQWdLcEd6YmdoYlh6aTZDbnpwaGQvOHc0akNq?=
 =?utf-8?B?SGh1VTNCdkE5bEltSW5BVHBhYTB0Q0RQaDVMSm5TR2JyMlV3ak80T3RWR1R3?=
 =?utf-8?B?dENEVkFwRXlrbVlxeEZ5dGlFeHk2bUtleGlVT1VIRDI2VFJLNnhPRVZobWw4?=
 =?utf-8?B?aUlWaWw2ZUUraXpMRm9sSTRqMVNHaHFOWmNzeFJZQitIZXBOUURDeFlYemtX?=
 =?utf-8?B?ejBYbXcxcUx4RndDNzVNMHJ0TEdVMHJ6UGxaTFA3WnMxUkluSFJNZEhRTk9L?=
 =?utf-8?B?WVh1elpocDEzY0J0K3h3QThUMGZOb1dnL3VucnpPM1VETWdhR3RzeSt1SnBy?=
 =?utf-8?B?cTFXRVBmL3dJQUhpNkdyakVDUDM2SDBNUkk3d2gyN0RYeWJsaVJ5WDVob2Jk?=
 =?utf-8?B?Q3ZOVW9iQWJ6VS9wMGVMY3hFNDE0dFVzaEFHZUF4WjVQRkttdkNsR0ZDRVMz?=
 =?utf-8?B?MmZJclNEaUsrMjNtUWF1dDZ2WlBaY0dkUW83MjVLZlNZM2ZhRmpQVUQrbE5t?=
 =?utf-8?B?WEcrM3FTRmlEdVVPc2VYc0RpWUh5d1BZK0JNY05YaDZjYWhOMU56a2R6Smtw?=
 =?utf-8?B?SGRKR295OUZTeEordmdXOEJwUFpzdUVWRFFwbUJwMmNjdStoOHA4bXJiQmla?=
 =?utf-8?B?SUlmZTAwYi95MEhPMk4wMUt2Mk5uUzhLcXI1TkpSWGNSc0JIYXg4WTMxOFNy?=
 =?utf-8?B?Q1k0Q0IyTEtoQjFtbXplajZQaDdDRnRwaVJYbUVGaWRUUFRTQnRyRWFPZ3RI?=
 =?utf-8?Q?gVmBn9q9n63tlClpa2pjr76M7mqU2m1wueYfLMm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 929964b6-6702-43b3-5398-08d981a1433a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 10:26:26.8418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JQoNspEhaEcBfANLcQcMdjz1IMLVQQbDY3/NcQRMLhmqjDcIxeAI3BlJ0xFGWzlwZw523AMDxTnOwX4xxLNG4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3934

On 27.09.2021 12:04, Oleksandr Andrushchenko wrote:
> 
> On 27.09.21 13:00, Jan Beulich wrote:
>> On 27.09.2021 11:35, Oleksandr Andrushchenko wrote:
>>> On 27.09.21 12:19, Jan Beulich wrote:
>>>> On 27.09.2021 10:45, Oleksandr Andrushchenko wrote:
>>>>> On 27.09.21 10:45, Jan Beulich wrote:
>>>>>> On 23.09.2021 14:54, Oleksandr Andrushchenko wrote:
>>>>>>> --- a/xen/drivers/passthrough/pci.c
>>>>>>> +++ b/xen/drivers/passthrough/pci.c
>>>>>>> @@ -328,6 +328,9 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>>>>>>>         *((u8*) &pdev->bus) = bus;
>>>>>>>         *((u8*) &pdev->devfn) = devfn;
>>>>>>>         pdev->domain = NULL;
>>>>>>> +#ifdef CONFIG_ARM
>>>>>>> +    pci_to_dev(pdev)->type = DEV_PCI;
>>>>>>> +#endif
>>>>>> I have to admit that I'm not happy about new CONFIG_<arch> conditionals
>>>>>> here. I'd prefer to see this done by a new arch helper, unless there are
>>>>>> obstacles I'm overlooking.
>>>>> Do you mean something like arch_pci_alloc_pdev(dev)?
>>>> I'd recommend against "alloc" in its name; "new" instead maybe?
>>> I am fine with arch_pci_new_pdev, but arch prefix points to the fact that
>>> this is just an architecture specific part of the pdev allocation rather than
>>> actual pdev allocation itself, so with this respect arch_pci_alloc_pdev seems
>>> more natural to me.
>> The bulk of the function is about populating the just allocated struct.
>> There's no arch-specific part of the allocation (so far, leaving aside
>> MSI-X), you only want and arch-specific part of the initialization. I
>> would agree with "alloc" in the name if further allocation was to
>> happen there.
> Hm, then arch_pci_init_pdev sounds more reasonable

Fine with me.

Jan


