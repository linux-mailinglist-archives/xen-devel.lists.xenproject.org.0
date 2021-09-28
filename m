Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CEC41AAB4
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 10:38:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197805.351052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV8cx-0003kM-QD; Tue, 28 Sep 2021 08:38:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197805.351052; Tue, 28 Sep 2021 08:38:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV8cx-0003iZ-ND; Tue, 28 Sep 2021 08:38:15 +0000
Received: by outflank-mailman (input) for mailman id 197805;
 Tue, 28 Sep 2021 08:38:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mV8cw-0003iT-Av
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 08:38:14 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f37caef-b9cb-4d2d-ba7c-414ae0554c20;
 Tue, 28 Sep 2021 08:38:13 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-6-znf6ldxrOD-zwj04Bi_IUw-1; Tue, 28 Sep 2021 10:38:11 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2446.eurprd04.prod.outlook.com (2603:10a6:800:4e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.21; Tue, 28 Sep
 2021 08:38:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Tue, 28 Sep 2021
 08:38:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.8 via Frontend Transport; Tue, 28 Sep 2021 08:38:09 +0000
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
X-Inumbo-ID: 2f37caef-b9cb-4d2d-ba7c-414ae0554c20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632818292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hx1xK7HNytdaZ6oyQpvXTcUcCpRyZzwnXo4wE9i9NKI=;
	b=H7/o4AU/AMIVaqN7PnqhgVJ7G06VruPqxRrC3CZEhoMssZG+cUxaZMAMkLGHCsLYn/N2Xt
	hGAz7mXTW1ZdOGfyXor0M0xGrhoF8jwRnrU7J/6KLJLNnjfdBBVMRSaUntMwuiXbasnFGT
	lNdb+9VtIWF4PRX1BqiyZTVmMiXKVMY=
X-MC-Unique: znf6ldxrOD-zwj04Bi_IUw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LL/55CX1yd+8ozBKCaM/vrN7Cq197z/F/E5NETA2sGbba2M7bdrWLG0xk1OOEqJpqk9putukjXMW6jwjtTTr+gGkJNEVL7S7Mb9k4NpDYWLyBS6EY+TCObVF1fQomGq0WHi+r3wmY+OK12c6I9uudv1y/nRxdIQk1z/Oldrw04ee0I5qe0hYn9bh19tmYlJLoEgJ7214jWBUIypyQOJ8g3FDEMX0wshkh/Z5ctcESwXCQmWOlirLOSf0WUGfks4TmBEN1lDHub1zTcgU2LJvpzAFUm+F+86M2afSPhoS4WT7IeNb6wyQsLYGp3UBEp4/J5VaIIh3uUkrajfrjPsuew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=hx1xK7HNytdaZ6oyQpvXTcUcCpRyZzwnXo4wE9i9NKI=;
 b=HOSMbEO2kpkR2SRzlDpo5iZeXRC2bHIezV1eKNVq4FVcsa92FlXusFxoDbwg+25mSfoyIhPUbwMS6Cu7fwwmjwagm7n5MEgVZkKmwBz7LoSK1qZbH8RH0VZBzvShrrXQMbyE+Iy+td3WgPzf+Br8lfl7XDF+8ipASfUYrRmVlEV1dflh99VPFuC1J0zFZloy7B3v21wqHMmb0cMazZvIGHhfXavJCVgkS3ak2ezvLxh1E3IBv75W4zbiIyfWJYnL/TiSTkaL48ecnoIHvYYzT2yp0BGAspMniFv4MZgZW+Isf7uOa8YFhbROfVLGJtJ7P70zZDf3/58Jjx+k5MHHNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: sh_unshadow_for_p2m_change() vs p2m_set_entry()
To: Tim Deegan <tim@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ae8b6cf1-d1ae-8a55-7b88-7ef24db0c554@suse.com>
 <YVIo1sR283L/MUeN@deinos.phlegethon.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7400a394-2866-b4e8-42b8-b04e6f0bf4ed@suse.com>
Date: Tue, 28 Sep 2021 10:38:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YVIo1sR283L/MUeN@deinos.phlegethon.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f867db37-3a40-4cd8-f2fd-08d9825b4cd6
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2446:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2446F99AAB4779DF4611FE3DB3A89@VI1PR0401MB2446.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aNh2NBMoLLOkycwuvCuqEyZQxWsl3ot5YlUfie8e6yLyWwx2nGyvHjceU9bgVf+gN8ay+92iiH0/eOij0ZPgKwrrz6WKUd767TZZgfQ8lBK6nfmCluKHwEzVusTk3JwQ7HWOgTaT3jjZ4GyhPMz8vkyZIEm/gXrnZnqXapIR7RniujeEs11S5KcG5msMP8qMGUQbkJ/e0OgDWidO4aeUkRU0gRnFsn8tqfNCFYkjSqXXdc9YQYwOE6sbaOGmB01oZRW3JRAuREgo3fa0T8QRE2sjKyTay3bt504I3rNebsXGgJLBhcmwBCUsLecQ9qP/kJOdkEgCiUUlcjLjxG/zq+KWf+oIh/g8TSukHSGOk3hMTCx9waxChY8Uw5k7Puh7NdAjmYEappVO27VrH1DwjEtzShOiFqjy/IeI8YtsoNH4uk2WeDj3Ln3/AIKHR8D9KjeJfh4iQCpzWoOcZVNWrOrdyY6kZ52umLET/9Qc5QE6STOaydPnlb9tQluq4FDTmRZVHov9S7t6Ur7+TAAPcoWVrjUs+TKrjT84Lvk7kODFkAlgR0YgyciEU2MmTo4u4hsXMAnxETHrg+UCqfs9LF+ZrxVfSmzM5f9UTAmJR53pEBMj3Fke2Q8WPx6mmCRWucDW3QTllCPxcgw18J5lAtSqR0+ZWbk1dxgtoK++w/MIQ9wZ6BfKKafRR8rzCVfi4UnwSNw6bSstthE5g78z5WbbuLYdhQmoB/Qf0UCmSDy/kC/vgFEmrwqDzFZpxfW+lDnPQIPrY+hzPn6tJyzFrQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(66476007)(86362001)(38100700002)(66946007)(31696002)(31686004)(316002)(36756003)(6486002)(4326008)(26005)(16576012)(8936002)(6916009)(8676002)(508600001)(53546011)(956004)(186003)(2906002)(2616005)(5660300002)(70780200001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWg2Vk5KUm9EcjhxNHFOT1FTZ0xidDhGOW1yZzROR2lXd2VRVjhPVXgxZWFR?=
 =?utf-8?B?cUlqUi9IYkdObVliQTg2Tm9oN1ExdmFENVlxa3NSRUZYenhSMktHUkY5YXVU?=
 =?utf-8?B?d29SSzR2L3plY01tRmJOSGpFVW14eW1PV05GK3FGejI1Yjd5WXZDUSt3T3VQ?=
 =?utf-8?B?cEIvZjVaakMrN29NMGZRR0dsclY1UUFIZEwzcTBmNkwyMU1QY3J6a0Z4dmhL?=
 =?utf-8?B?VG1BQ056cWh1QSsvaENlV3VJQ2QvT1VTZnYvK3FRbE5mdWt2cURvRjZTbkdW?=
 =?utf-8?B?RDR3SGtzTjZKRktabytWNWQrVC9rSmNhaWdTOG9MR1FvQ1pDcG1OeTlNTTBh?=
 =?utf-8?B?QTM4NWE1TDRwVWp3cThGMkExUHdXSXJHdjRVV0dMS2RtVEJ3OStXV3Z6R3c4?=
 =?utf-8?B?MVpRcnFWb3QwQjdNWnIrKzlKamg0ZlQ4ZTRGUW5aRU1KMUs2M3JSeTRjbzZK?=
 =?utf-8?B?UHBrVUN0eHFkTStRWjI2YVdlOWVpTCtOc3IxNENxQXBQSm9ycDA3emRpT1hX?=
 =?utf-8?B?RGJYQkYwemUwRHFNVUpTZzFQN0Jsd3lNNXplQlV3RGVydDZZSDVET1dsSXFW?=
 =?utf-8?B?dFQyRy9lV0tvbHNhaUZNVzdXUmdtekptRWEvL2hpKzJlRXZoeHVEMTdmN0xE?=
 =?utf-8?B?TGt5K25TQW5XMDl2L3lWRmwrblE4Tm5MSlk1NGZMank5Z0FDMmZFc3Bmdk5l?=
 =?utf-8?B?RGlXaUdLY05xaExKalFpS0wxa2tKNzBMZ0tqdGJxeXdZTW5GcFRla01lMDFm?=
 =?utf-8?B?U3QzaXI5WG4wcXFIV0NHcFlTNldnNG1lM3AzTERpbXJiKzZudXZZaC9lcnpt?=
 =?utf-8?B?UGwrS2FHTHV4d2xLUWFaTDZDZGx2TEFyVmdOU1FsZ2crZTdxVFRNMVlidDFn?=
 =?utf-8?B?ZU1CZ2x6OUllV0ZpVnVnME9DTHFrajgrUm1Xb0xGN0RCcjJhRWRUTklKdm44?=
 =?utf-8?B?MjhzUDRaeDhkWUxWNElnK0N6TDI3TlFhVkhOWm5Hbkp0ZEJweThEd3BRUkt6?=
 =?utf-8?B?blVzaDd3WFJlQXhlZ0lFUE9WeEQzVGR0anMxeWVmaVdxYURWS0tzT3JLakRo?=
 =?utf-8?B?WVYvbUpvWENrbEdZcnNTTndFYVl2RDJnUW9Md0tBQmJ1VkNpRGFHOGJTMjNR?=
 =?utf-8?B?K1p4cWwxTzdYQnUrczFNYUZ3STlSSGlBTzJqWXd2L05HbHVIcG45QncrQ0lt?=
 =?utf-8?B?b3FtK2xHaGM4Z1ZrOVZxb3NxMHhFSURhZ1dCTDArNmNGa2xFTXBhNUtJV0Jy?=
 =?utf-8?B?NWcrdXQxdGVFVHowS3NyYlBZV0JPWmYxNjUwQWoxRXhIN3Vrb0IyWEJoRDBT?=
 =?utf-8?B?MCtPeFlhOFlWQWg1eXI2d2NvV1NQM1JzZjErUUU5QWhHbjM0NEJWNk9oT2p3?=
 =?utf-8?B?UmV4T0RCbDB2OEZVTi9QU253bFNIOWZpdjNzRkwya212QTFqSzZrUEJES0Vl?=
 =?utf-8?B?aVAxWm9md3pHZVNKWDdRYTJMMW1SWTJiTXA1cDBRWGsyU1FDVjJldGpZTEp4?=
 =?utf-8?B?Q1pvcm1vS0xUeTVBZ2I5b0xIUUpvNmlYMFQzL0x0KzNZMnAvTFQzK2FXTko4?=
 =?utf-8?B?ZldpZ01GMi9VV0YzaVRVbmlGTUlrcWVKMWlPUUxZbFhmaWg5b1dFMVhJUTJi?=
 =?utf-8?B?MnJBZ1A4NmpMdWdKSnhzR24xbTZrOG1zNHdrNk0zeHJxN0phYVB4eU45VHNt?=
 =?utf-8?B?aG5oUGZlU0JyTzNZRlhKSnZmTCt5a1ZtaWpvVVh3aXVOK2ppT2hlb20xS0dy?=
 =?utf-8?Q?Fl4TJ0Gzcjemlqj50M3cCDaOOFoFGdZguQrwC75?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f867db37-3a40-4cd8-f2fd-08d9825b4cd6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 08:38:09.3595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Msdz0smahRDI+XRkMXJa2I/BM0Da8FMnUhGCi1+E4NwR9/WWW4zcFZ2vhohwhZf4wV5NF0UyuvVG5bFvMBobgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2446

On 27.09.2021 22:25, Tim Deegan wrote:
> At 13:31 +0200 on 24 Sep (1632490304), Jan Beulich wrote:
>> I'm afraid you're still my best guess to hopefully get an insight
>> on issues like this one.
> 
> I'm now very rusty on all this but I'll do my best!  I suspect I'll
> just be following you through the code.

Thanks much!

>> While doing IOMMU superpage work I was, just in the background,
>> considering in how far the superpage re-coalescing to be used there
>> couldn't be re-used for P2M / EPT / NPT. Which got me to think about
>> shadow mode's using of p2m-pt.c: That's purely software use of the
>> tables in that case, isn't it? In which case hardware support for
>> superpages shouldn't matter at all.
> 
> ISTR at the time we used the same table for p2m and NPT.
> If that's gone away, then yes, we could have superpages
> in the p2m without caring about hardware support.

No, that code is still used two ways, but it can't be used for the
same domain in both of these ways. IOW I'm wondering whether the
check for 2M pages to be usable shouldn't be "!hap || hap_2mb", as
opposed to the 1G check continuing to be "hap && hap_1gb". Of
course once I make that change, I may end up learning what
"potential errors" that other commit was talking about ...

As to the further parts of your reply, I guess I'll try to
transform this (largely supporting my observations) and the above
into one or more patches then.

Jan


