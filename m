Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1737140F29B
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 08:50:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188968.338399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR7hL-0000Hw-Dv; Fri, 17 Sep 2021 06:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188968.338399; Fri, 17 Sep 2021 06:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR7hL-0000FD-99; Fri, 17 Sep 2021 06:50:11 +0000
Received: by outflank-mailman (input) for mailman id 188968;
 Fri, 17 Sep 2021 06:50:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fBbp=OH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mR7hJ-0000F4-JS
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 06:50:09 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f07dbc4-1783-11ec-b66e-12813bfff9fa;
 Fri, 17 Sep 2021 06:50:08 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-AbPAybkkP8yYkEdNhk1H8A-1;
 Fri, 17 Sep 2021 08:50:06 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5901.eurprd04.prod.outlook.com (2603:10a6:803:e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 06:50:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 06:50:04 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0034.eurprd02.prod.outlook.com (2603:10a6:208:3e::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 06:50:03 +0000
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
X-Inumbo-ID: 7f07dbc4-1783-11ec-b66e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631861407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DVe4Aso3E2y3NYywvH6035yhOAAjc8CdQzTeVqfYczE=;
	b=jly3Sb+QjgGB/dGUtrOrxMR5jjPKyzTCIn48vExOTgTu6d9MmZpyx3JEjrSc7nXd8dVAbM
	62c7/VYZ5Nej9ahp60hQzm73WLbyTXvDh4hFG3gaCjwLI1THo9XAkQPp+JCvYbpUKp68u9
	Qe32xic1IcFVMzHYTHqMWht+60lNi5k=
X-MC-Unique: AbPAybkkP8yYkEdNhk1H8A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwCpruoNzv/WEK9yseZCrB6UZY3YV9kZfiKLicIi4f1lgGNYzmQx/MLiY0Ibk+dYimGWyXxamEHgZ3NEczshGjxR7VdGe3dFSlFFPkJQ/jOCOagqpOikBA59ivB+K7gX7RBBAzYecuKO9uh69/azNzE8Hp3YCiBpHLTMwOGyMVsU0/Iiss9Kx2sv9zysBZ2E9Dv+Gs4amqHblvoo2S76sVp76/RapVRIKEpJ72DlJBbbUxEVCh+E5lQ9Hl/lRURjdRTDvI0BT1Bv97BHxAumYNoGgk6nf1KH13QRt8y6Kdk/cSXS0wOve6DDMACUl5ABu+tDEB6Zb5W4hWNTsZ9Jdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=DVe4Aso3E2y3NYywvH6035yhOAAjc8CdQzTeVqfYczE=;
 b=mH7ta+NWX3g4WacVQBODUyEGB+NztoYrTooiAOlEYpg9VmYZPWmcQeOr1w/Q/whM99DIHEmWWluWxRZYcFXyFFKdZlzscT/qawSSzRwe06XkbJUcy3Lf+4KQx4q8I9wIiUogXJmwBasxje1U11wHdtJi1Tq66NoW1nZPo29EfeTgwlay+W6HfsGGiIiFEYWIBh9ZOL6/mNEzP8fBE6fmN0Pelcvn+46gF51AjhQlCy0FzmLZy8OmCWzejtolhaFSY62Hd3d/WV4V1pVvpzkh+fS267ryAW5DUFnNiFbpLB0BaltLyqZkEidDPOP8XPigsQQAVqAtrHeFM6K8eCaZ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] xen/x86: fix PV trap handling on secondary processors
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <34898e9c-5883-a978-98ee-b81b22d8caed@suse.com>
 <823f4ef4-f9e5-68cb-d6e9-d079483c1e21@oracle.com>
 <0afce6e8-3c8a-e5ae-cd54-0fd598276506@suse.com>
 <62ccf5b7-b903-e604-d113-67c7633278cd@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2c4549c8-bdeb-3584-95c4-7076b7cf79bb@suse.com>
Date: Fri, 17 Sep 2021 08:50:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <62ccf5b7-b903-e604-d113-67c7633278cd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0034.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::47) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6dfae42b-c3f8-45e5-eb65-08d979a760e1
X-MS-TrafficTypeDiagnostic: VI1PR04MB5901:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5901255B0F3701CA32472049B3DD9@VI1PR04MB5901.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SOxWRvGAEh/iopF9c1ArzN3KuYfuLhWHAXAH1lDtehRAu09Vv6/CzmsdNEv5y5Joc12feTqGDMboDvMXtIsnUIXA/IGuT49wi1tdbsO/K50NF+6UD+uZwCefX36UccQZVUzV4U1P9kRK15mAWTH/yaBTQPUUZLw2sJYqFPLSC9U/bGYXrn5l+PFydq3bo3nqu4UBVfrVIpTtYuDKj2cQBmM+AG/6zjZ9EjU55alHGAORmWH+VOtSwfe1Rt9Jx5sBASWjgzXCkjzgqFunlR5AefjqnXnv70CvPYZsnNoUbnjhvbsDQrs28kcciUpZpPu7fg8v+7ubQK/KdxFCZRtvQ4mPuoiKGUkdoOIIeZ43KIpMPKpaV3wOv0O4FUJUcc5U3KGAvJ9nMIYTzqzASe5eThbXIG3pK8IsNaA5X9EwSqe7/ynow2HBCIlUV+Q2eJ9jQrorDPjfpW9sxC8iKVvKPN5LrJ8hj/PUH0aTXdSldETfv9R1H/x7fe521RyKSEDPxaoDn67EtbecsFey4A3t05lJSvofwxe40B23qyeqSnjy6oxlhCV9my4NE4XnAZtVj+CpVHDyQmSaW5LRt7MRMndzdXMS9PUbEECvlUGbA3jmrOdnYYchx48Chp7MTqsWKHgb8gaEyf7QeizCHJqNcY6AyV8i9EA0QNuyrJPu/mq4uQEtXqDy8SckuTwjLdHvWWP4jYncFVGNYYAVBIqb4t8QXyDYKtocTLJKpqG9a50=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(366004)(346002)(376002)(396003)(66476007)(66556008)(31696002)(5660300002)(316002)(186003)(2616005)(956004)(36756003)(6486002)(38100700002)(83380400001)(6636002)(478600001)(8676002)(8936002)(53546011)(26005)(31686004)(37006003)(54906003)(16576012)(66946007)(2906002)(86362001)(4326008)(6862004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3Q5ejNYdU8xSjB4N1dTeGM2cnRlbk1pNnNGZ3J5NGJ6SW1XUHNkNDdDeUY2?=
 =?utf-8?B?QVFQdUVtSldXSlk1ekJrblp1M09mL3hJYjdUd21hUTNQYlc4cHZaR0RXZzdk?=
 =?utf-8?B?Q3dGeHU4Z1BiMzJGVFVjQWVqdGwzMFVVL1JuOXM0ZDBqMUNPN21XOVJtRW93?=
 =?utf-8?B?WEU5YXora0g3ckt0OExCaXB1TEs3M2RUNnhKeUNRQWREam1MZjc0L2xRNjFq?=
 =?utf-8?B?R0RkVGlXS1p5QTFNbHcvWmhsdi90OTBRbXlEM1R4OFBCZTR1L3Q4QmQ0cnBY?=
 =?utf-8?B?ajVMa3NGaGFMY2MyV3kyYmZWb2tuR3VHN2tQTzFCai8zcDVJaTNkeTdPKzJn?=
 =?utf-8?B?RkpvdXNxelRDUWJvcTI5Ni9kVUk4VExTVFQyTWg1c2lmRC95ZDY0Y2lHZmVD?=
 =?utf-8?B?eG5PMFJ5RTllck5xUFUrT3dZQ3BSajNsNHN4S3FjNW01NW80djFtNzhRb09R?=
 =?utf-8?B?SVY1ckdRMmdWNnlTelZ0MXNMdWEvUUxOOWI4QUc3ZmVxVC81UDdLQnBvcDRh?=
 =?utf-8?B?YnRBc2Uyd0NUY1pkdkw5eFhGcjF6MXFaUW44dyt2a3VROFI5Z1NNemxkZ3Nt?=
 =?utf-8?B?YnhZbkJOeW15VDRQWXJOVmlQTkppNkViYVJzT20zcGtGWWxhMXlqbENGSlIx?=
 =?utf-8?B?UVYrODR4UGVNTkNwVUYwL0QyNW1Xd2YvK041YytXeDMyWTBhdFVSV2MxUTB2?=
 =?utf-8?B?VkRxVFJMQmEyWWFCZU9iWkVkTUFTb0pML2N6dDN0NWdpTWdod1lMT0Vhcnk2?=
 =?utf-8?B?SXdyampHaWdsY25UZXg3NzQ1T1RxL3B5RndlUnZhRnNuRjJwOW16WGRmSDB0?=
 =?utf-8?B?REU2KzNBeHp2RW5XcnhFbm1abW9WbTdkUDFLbys3KzlEWG1HYlhwaFViMUdY?=
 =?utf-8?B?WDJ5Y2c1Y21JeWQ2WWFsZEswUWZRQ0NxZ1Bab1VvY1NvRkhhMGtzdkk3cDJl?=
 =?utf-8?B?azQrbFlGWFFpMzhZYmx3NTE3QVp5bm9XRWJJMnNmeUZ4U04ybFhCL0pTWDhB?=
 =?utf-8?B?Zlp1Y0ZyRGhEN3lYa3d3Q05VaUV1Z1VWWW8zdHZyeUhIOEFCakZOMk9NUU41?=
 =?utf-8?B?YTZwVkxESElwSkhianloSGkrR1ZaNDVOT3FZSGJuTVNKVkVhZzRzemNrTlFi?=
 =?utf-8?B?ejg0T0tvSHZmaU1xeFVPTU1SZGpRbjQrQWdPRHZJR3A0bk11VDRidGlhelM4?=
 =?utf-8?B?WGRQSWVPOFk4aHZZc1dlUXdHbjJaMUJBSzI4bEx4YjVpM1hmTHQyTWhpb3lC?=
 =?utf-8?B?cTdsWlZlRkFid2RSYUJpdXVaT0NmbWtGSXFaeUk1S3FTaDJNRzcvYzJJbDFO?=
 =?utf-8?B?YVBIenp3RGlITkZTaVoreVR3YlVmVk9kQTJpbkZrNW1FOW0wRXovRDNQZXRr?=
 =?utf-8?B?UkRucVRQbjZ3emE0MFM2U1MzUUdyZllJNjNhdm9tV3VOSE8xbDB1OUU3eXdG?=
 =?utf-8?B?NHI5Y3dYSkNRelhFanRvQzUrQ0I3RWFZTjZuRXVscms5WjRtekwrRkx0bjVL?=
 =?utf-8?B?VThYYXFRUzVlZG1JZ1BYS25DYmxKUVBYbklCV2UvQ2Q4eVNDbEt2RFBTMjdy?=
 =?utf-8?B?RWdObHNUWEtGTzBZMUpqRWp0Nk52YzRMTHdtaVhzai94bitkWEtrUlQwa2lL?=
 =?utf-8?B?WGFxUXBQbFdkRVZEY1RxMlVGMkl1OUlmdVFhajVMUmUrK1Nib3VsME1KV1pk?=
 =?utf-8?B?ek5HSnRxL0gvWUduVGdZOW1vWHJXeG1tbUhlMEkyT2MzNzFIQUpRSVRqRmlE?=
 =?utf-8?Q?Zv7Z4Q1ImVfrr9pPTtNm6Z3T0m3XYbAD5oIB1Vy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dfae42b-c3f8-45e5-eb65-08d979a760e1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 06:50:04.2773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vVJ8VpcVhbjlIebMAuHKpmyQGFkit66vdEWkMjl8//7S0wQ+pfmGR8wRNxxT0b+J3YXCFsGUSxQRozPaJeqvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5901

On 17.09.2021 08:47, Juergen Gross wrote:
> On 17.09.21 08:40, Jan Beulich wrote:
>> On 17.09.2021 03:34, Boris Ostrovsky wrote:
>>>
>>> On 9/16/21 11:04 AM, Jan Beulich wrote:
>>>>   {
>>>>   	const struct desc_ptr *desc = this_cpu_ptr(&idt_desc);
>>>> +	unsigned i, count = (desc->size + 1) / sizeof(gate_desc);
>>>>   
>>>> -	xen_convert_trap_info(desc, traps);
>>>
>>>
>>> Can you instead add a boolean parameter to xen_convert_trap_info() to indicate whether to skip empty entries? That will avoid (almost) duplicating the code.
>>
>> I can, sure, but I specifically didn't, as the result is going to be less
>> readable imo. Instead I was considering to fold xen_convert_trap_info()
>> into its only remaining caller. Yet if you're convinced adding the
>> parameter is the way to do, I will go that route. But please confirm.
> 
> I don't think the result will be very hard to read. All you need is the
> new parameter and extending the if statement in xen_convert_trap_info()
> to increment out always if no entry is to be skipped.

And skip writing the sentinel.

Jan


