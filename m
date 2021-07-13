Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 130F53C7215
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 16:23:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155409.286879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3JJj-00034g-Ba; Tue, 13 Jul 2021 14:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155409.286879; Tue, 13 Jul 2021 14:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3JJj-000321-82; Tue, 13 Jul 2021 14:23:23 +0000
Received: by outflank-mailman (input) for mailman id 155409;
 Tue, 13 Jul 2021 14:23:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3JJh-00031v-LK
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 14:23:21 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df6cfb6a-e3e5-11eb-8766-12813bfff9fa;
 Tue, 13 Jul 2021 14:23:20 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-onCbJJhXP0uIPvpFIohJfw-2; Tue, 13 Jul 2021 16:23:18 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2334.eurprd04.prod.outlook.com (2603:10a6:800:29::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Tue, 13 Jul
 2021 14:23:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 14:23:16 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0009.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.21 via Frontend Transport; Tue, 13 Jul 2021 14:23:15 +0000
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
X-Inumbo-ID: df6cfb6a-e3e5-11eb-8766-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626186199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QQ2kfo7NyDf0RDajIvE+rIqhi8x8fQmOx9DdY947RNI=;
	b=kiy7SiC5Ce7NUvXp8oNxrTQlIl4VNvq0XG13NweJswGdTXVENCBK4nByBB1xqxEDwYCMiv
	yts7du+DSOkBxVJ3hApjuXyiPNDufyrv8qOQCkOSAabo/gebD6fxA/IwMJS15ulhdmwgXX
	fkAcbDt+DDq4B9Be2hpAJ2dEB3LOTvk=
X-MC-Unique: onCbJJhXP0uIPvpFIohJfw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UO25kwCx1CMT/71tFBznuFywSKuv7n7hqLJj1qqNcanWxislbYKbe2p7VFD1CJH5AMVEVzk3nEOA1eMPXRaU6ADNuPfOY44Pm9w6lvO8s1yrTbJ5eJMEgmrjcBGmEzkWoaoHR9la2eRoMHv0hnu3dVP1lC6voZnkaif9sFCTPTEr4LgEPUoOdaO/7kE22PDj70FeWBW0sVkkzmbVk4YijTPMdPCjr3A0BcMWYL6yR/FCFmdWlcsGYmgIcO7RkLxzYYGcYD/Z73Si/Y3co4DepooQRKveoHdZQJyA4VvmSz2R8/5h1Jpd4MBUGwSWZBPAsySUMBDeS3fRNOkVKFwpkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQ2kfo7NyDf0RDajIvE+rIqhi8x8fQmOx9DdY947RNI=;
 b=C0OgO8ACINiJIK6miR7jbD1bv/YjZVIK6Yw5PnZmakuoiQ1os0I2YijY8fFmXvcjoAaOJMA5uBCmlrm5Q5eqoQVr3xKEvW91BlqrUhqw7egsy1u5eNF/GVAX2hKzaGiSwIo9snp5IuDl0d8/rCFhRbqYyW9GKnt9RCY43xUeI/wUR2fGg+l7yZE3Tw5eHT2bIohblt4B7yVm2UWsOEjCMO1Ql8aHTlkb1cWip9yn89+xGRL0NYcQ9yKhmf1T9gvWVqIB+N5C3S45goSSzY2LO2BHIXvt9nCHTqZ1Zj+AZKK6I56wup57wFIdqt3CDd07EqdUm1N+kXiugjK8qiIlfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] stubdom: foreignmemory: Fix build after 0dbb4be739c5
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Costin Lupu <costin.lupu@cs.pub.ro>, Juergen Gross <jgross@suse.com>
References: <20210713092019.7379-1-julien@xen.org>
 <0698e4b1-8fb9-919e-e9a2-1b135a808e3e@suse.com>
 <d84bb0ca-ff51-2def-3826-c0a921ec1835@citrix.com>
 <fb6cc1b7-37b4-1819-6f6f-ebf96aefe00e@xen.org>
 <756ba923-17a6-0889-cc7e-bcd43a5eb258@citrix.com>
 <3505f2da-4c41-f5ca-d775-814d038d5bad@xen.org>
 <badec201-6719-844e-2a07-6508e891ca3e@citrix.com>
 <3c819563-b354-5527-050d-f698324d6021@xen.org>
 <c299355b-c031-3efd-ef97-671bd102809b@cs.pub.ro>
 <65d35862-304c-7fe3-82de-3ff62f06529a@suse.com>
 <40c00267-60d2-c0fc-cde4-8ac4ce936f87@suse.com>
 <d7cbedf3-bb67-1eda-70e2-d15c5649c0cd@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ce9e3ba3-7e1a-b592-7e9a-e35099c8d483@suse.com>
Date: Tue, 13 Jul 2021 16:23:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d7cbedf3-bb67-1eda-70e2-d15c5649c0cd@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0009.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f5d6ffd-4031-44a6-609b-08d94609c13f
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2334:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2334674055AC74253A41CB78B3149@VI1PR0401MB2334.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NKbKsRZpNbyD8DByOrPVV6t3VSXFrlh7Kqi1fcRyXqTDFUuXOKeVFPLZdxCVR5a0GOqZ5/QXr9YmLAq97k7hMrk7+jQAN3FWEJ0OscgqxtzO58RCy2EjBRo8gJazps/B4zCg2ciGdQD8kfMdyLW11Sm7kMJ6kWOIM9IuyQTLkvSf6Ek68z8LbwFH9V7pS3DHaIqCmOmLvKnZksdgz2E8HKxdjK9BnQJtz/xn54YooPS9qFJZLJKyFOYVDnzukSETOduz6yKQwlGaicAA3y4L8g+KIAMcePYe8j+jDkBnuTno2kbfh97zucn5TwLa2ZXLUzcNWVkuRGKZoi/MonaLhgSURSggz/d2SihNlvwbyn2QhPF9pV1VqRX3UGw1eHXQQ+1jaOCntvAgVtjLa/yU8pxjyPaP1g/+2J6qbiOH8AQljOeotWDbU5rHYChck3ZUINHRPUgrutQPy4QWgJOdnsI4iwOFJX4Z+QSCT9Z7t+fJky+w2WImTh1OhEgN3ZVL9fCebKubxk3KqW/B6hmdG9forAgF5cEs8cQnp0M1glZbvWUbxsvdsEynX0KJUhhkC+PmDto8mfYpbLBnwQmcUAHcEMY5ZDhhlw0gcpgG5rOnPfmIek6ANoW/Xwxm10ZcikfUEofX0sEueniy2oI9hJJ+Hpcxmn6B2qpirBe67+Qr6rrw74DbXda67nB2ff/FBdOiKF2H8EMdvZEcQ4GLdu6YKlkFVwyB3WulYm8qjnEbCStgkGU5e8UsEM9NeuwFgHgNFhpaPMQvztO1AQHbwA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(366004)(136003)(39850400004)(396003)(53546011)(16576012)(107886003)(478600001)(8936002)(38100700002)(316002)(54906003)(31686004)(8676002)(31696002)(5660300002)(6486002)(186003)(6916009)(2616005)(66556008)(36756003)(86362001)(956004)(66946007)(66476007)(26005)(4326008)(2906002)(98903001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmRwaUpBVThPK1lUb2p2ajZFS2xMMEQyZTVWUzlEYk9mSXpUMzRSSUV1VEpX?=
 =?utf-8?B?MDJsTFplQzJRcHZ2bVF3WElXNlhBQWl3Qkp0SnpCNkZYeHJyS1Z5aHgvKzZp?=
 =?utf-8?B?S3RobzZUWHBSQ2hHd1VrWWtwU1JQblp6OXVHTjMwMFAxS0JlTU5XbDhTcWd3?=
 =?utf-8?B?NWhkV0lQTkwwQ0J2dlQ5dmt1N2U2SE0zdkFSTFpsNEJUdjVmRUNXY3VyTDFr?=
 =?utf-8?B?VC9YZmkydUJIQURlNk5IZzl5Q2RWRU9JRmJXWEFzblQvbi9GeEt5V0pOWVJa?=
 =?utf-8?B?azQrMUJPZ3ZpVndZVkRtUjVjYjVVMGFwS2J6RTB5T1NyNU81dU1QN09pSUFm?=
 =?utf-8?B?YTNEOUVwL0JrbFcwejZqcVZVTUR2UTlHY0pLS29tZHRzMnVQcmRTb1NFK2g5?=
 =?utf-8?B?L1NESzllc3lvVzc4OTBnSEx5S2RjRFZ1SkV6V2hLYWhWMTh0YXJvSnJzRURx?=
 =?utf-8?B?d1ZJV0hiN2ZwNXh4WitmcUl5akplRUptdTdjVWFHK1dJVFp1RVgycVRRRHIr?=
 =?utf-8?B?ZFpqOHFidnpaK0ZhMisySjRUZTZEVmZjakVid295MjJQa1FraW5VaXFJbFlu?=
 =?utf-8?B?Wml3Y3JUKzFLWVgvYkxreFRWS2pySDQrYUNYN0tCWHQyRU85ZVRUcjU4UmpU?=
 =?utf-8?B?S2pCY3JEdmtEeTJTM0xqaTYzK3dxTUZtb1RpWXlTVTA4cm83OXlzdWh5V3Z1?=
 =?utf-8?B?emh2NnU2WkhoTmdGMTg5dmNDK2ZWQjNibXp2Q2ZpUHVDNkM5RFh0bkRpN2wr?=
 =?utf-8?B?c0ZSVTNwMVYzL013SndPMVVubjFmUFo1cVhMRGxKcWFsNkFrTnBqblNVcnJG?=
 =?utf-8?B?elZwbytjR2EybmNUNXh2eEhPcThwMnYrc0ZoblQvQlhQQzVNci9UMEl5Smoz?=
 =?utf-8?B?UDFON29vV1lQR1ZpQ1h0eTVnQjVGMG53bG00cndQRUhPVUVDLzV6aVJ0YWFJ?=
 =?utf-8?B?VTBUTlBZWHQ5b1l3a0ExcmRRSEZmSHd2U3RoQmh1VXVDZVhZQmRST3FhMmhE?=
 =?utf-8?B?eldaMURCcGI4NDRYempZZFdHZHJieVFHRU9sWUM0dGgzc2ZNMDJCYmJjOVdN?=
 =?utf-8?B?V0xaMSt0cVVheGtGcUJDYkprMWhwTWl5NEVrSzdzUHVlWE5CL3NUd082LzQy?=
 =?utf-8?B?L0gvSGhwSkgzVW5sajBGU2JVNjk0dERFR0VSZ3N6b2xaQ1pyaUlUOEtpZmMr?=
 =?utf-8?B?eHljVkFONk5aRyt0VllJRjBwWGcvVW11S2tOdjlMYkRvMmZFYUpoR0IvMFUz?=
 =?utf-8?B?NWhhYlpGZW04TWF3OStHa0xCaUtOamxzbUhuSzVlU0xsdTI0WmVRL2xLcWVH?=
 =?utf-8?B?eDRaK2RzMXJteU9sc0QxekhYbVE3c2pUVFZRSGx5bDg2bmRCRGEyRFJxczVh?=
 =?utf-8?B?ZFEvdVJKU2lvSzQ4ZHFaUzhsaFhPN3hPTHZ1RGlocXA2RVBFSGJ4eTQwL3lj?=
 =?utf-8?B?QWlIS29SNHhSMFdUbjRvNzE4Y3hOSU5hMDJaK3h4V2dvOTFDSzg0RFM0clRW?=
 =?utf-8?B?cy9KMDl6Z1VxS3dOeTVCcnB5aEQrZkVSY1RUKy9hSWRJNE1FNzliUXozemdw?=
 =?utf-8?B?OXNpQzN3U2NtWGNJS1FVdDhRa21OZG9zRXRzNnd0Z2thaTJ2dDR1U0dadFZ2?=
 =?utf-8?B?TGN6akQzN2lEZUQvN3V1S1UxSzBiRndkS29KUWo3QW1JQWloVmxyVS93ZFNN?=
 =?utf-8?B?cFQ4bzJ5N0R0S2R0eUxmUE11K2J5blkyUy9BeEdsbG95QzYzMGJjdHJRbnNY?=
 =?utf-8?Q?NgrZBnKo/FImJLbZe/jRHd+iCPsorpJ4dJiUZv/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f5d6ffd-4031-44a6-609b-08d94609c13f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 14:23:16.2131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PXpt8179gc3n3bPCxx2XeUFmjzLaH5wzJkUL7xEu0ZwdVOm8iinrTkwLrCf3CBo/m+wNPqHV/ZWMPp/pVvQZ5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2334

On 13.07.2021 16:19, Julien Grall wrote:
> On 13/07/2021 15:14, Jan Beulich wrote:
>>> And I don't think it should be named XC_PAGE_*, but rather XEN_PAGE_*.
>>
>> Even that doesn't seem right to me, at least in principle. There shouldn't
>> be a build time setting when it may vary at runtime. IOW on Arm I think a
>> runtime query to the hypervisor would be needed instead.
> 
> Yes, we want to be able to use the same userspace/OS without rebuilding 
> to a specific hypervisor page size.
> 
>> And thinking
>> even more generally, perhaps there could also be mixed (base) page sizes
>> in use at run time, so it may need to be a bit mask which gets returned.
> 
> I am not sure to understand this. Are you saying the hypervisor may use 
> at the same time different page size?

I think so, yes. And I further think the hypervisor could even allow its
guests to do so. There would be a distinction between the granularity at
which RAM gets allocated and the granularity at which page mappings (RAM
or other) can be established. Which yields an environment which I'd say
has no clear "system page size".

Jan


