Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EDD3D11A0
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 16:49:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159413.293240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6DXT-0002it-A8; Wed, 21 Jul 2021 14:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159413.293240; Wed, 21 Jul 2021 14:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6DXT-0002gS-79; Wed, 21 Jul 2021 14:49:35 +0000
Received: by outflank-mailman (input) for mailman id 159413;
 Wed, 21 Jul 2021 14:49:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NGKG=MN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m6DXS-0002gM-3Z
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 14:49:34 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37294502-cbcd-4a31-9b48-f2c10a7b7a65;
 Wed, 21 Jul 2021 14:49:32 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-6-SeuUDoSkPm-at2V8P_006g-1; Wed, 21 Jul 2021 16:49:30 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5165.eurprd04.prod.outlook.com (2603:10a6:803:54::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Wed, 21 Jul
 2021 14:49:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 14:49:29 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR2P281CA0012.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.13 via Frontend Transport; Wed, 21 Jul 2021 14:49:28 +0000
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
X-Inumbo-ID: 37294502-cbcd-4a31-9b48-f2c10a7b7a65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626878971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oMwdR2HUqYEVibwbAEUWwZ4aC+hMXmOtWp0nAWRqgeE=;
	b=moFsriBTcQzl7vsrtD78TWnQ8+ABuRRtWdcjdTh3K3d/jIlxsyGrkcfDUpGxFUKt8sBIsA
	pJX2qPTT/YJjCTtlQ78ZNx/RSS8HJoT5Md9fsG0iNrgmtcPgLLyWIUe3TQG8BLO57zVYdY
	Qck5UCdX7+pvv7033P7KeO4CaeAQwa0=
X-MC-Unique: SeuUDoSkPm-at2V8P_006g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TaFY9whsouvz6hI1vXk12Cy0Q0L7B7Bldve8uTEHX/cVfD/k+BfpVgXJuKRlhT/hsXCwG0XtjEaMGD7Ci74VMIhGc0YDDHGvGDMPmj1D6KZg0Lr1d/x0wKG2za3h7uH2AmAC2FG/CbYOatyCd0KokIM4y8iR7Aqhf5ol88wNXH9VCCHDDvLqy7oMZOksQpQ88/52fLgwF5wyq1aUAKjdFfN/Z3fX8hQDa+EvkyA9kIgDquHeJiIb2bsr7KX9hSdRnLs9WpLToE12xARbrYNZ23z6E6gbOg8kNPyOaaJ9z3zzypBdZlypvosRa2qmpZoYRP6mVIHCEKMCpUosZh7WDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oMwdR2HUqYEVibwbAEUWwZ4aC+hMXmOtWp0nAWRqgeE=;
 b=d7BEWwHKW4yM9LKFXAUbEfnF/GFV3rD/AW9LL20iaN4DPhRrV32QRqNCHUZnI1tuleBexTloeIgyAxOoooF51ot8uM3eKTQbeiUl6+v6wUG5tfpp7JhvGVZ/ChM3r3IVPUv7OmZqhOnkvIYW1usQE7+3kzr8cVxi9AES/gOWIHPdhG0m1vp0jAQekEGO7X5SF8Wn79nZ4m2bAoRKvFGzZoMgkH/gn6sftzL8smHTzBEubCtktWu7x0HSvlAxcRt/HD1sChu8YRpaZcU2E1S2oiUOz2Fr+pYKdmRH/0n/DM8owSIiWyrxUAFu0kN/ZpVhkaCixAZHjgipctS1uACENw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: 5.10.40 dom0 kernel - nvme: Invalid SGL for payload:131072
 nents:13
To: Andy Smith <andy@strugglers.net>
Cc: xen-devel@lists.xenproject.org
References: <20210720223239.fqbwj3escedolaqa@bitfolk.com>
 <c3d7f7c7-0231-dba2-344f-e2e3588e0cab@suse.com>
 <20210721141942.tnxyfpt7qttzjooo@bitfolk.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <acc3c000-3d62-d91d-3ad7-0e0b460f4b0f@suse.com>
Date: Wed, 21 Jul 2021 16:49:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210721141942.tnxyfpt7qttzjooo@bitfolk.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fe50552-b2f3-4fdd-03a9-08d94c56be13
X-MS-TrafficTypeDiagnostic: VI1PR04MB5165:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5165FA5BF9ED59D81ECF4C41B3E39@VI1PR04MB5165.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TnBOjGcybj1B1wZJjg3pFt8kZOXb8pmEu6caRJiBenoL24IgZii+2xMmmAYd5+L/IVX7HP0KItV5B5l6BnZmREQkfhsNJqOxmjFq5aEKmxwIS/ISiFI4+QQXhVFq5W+6JU/3npm5YfZk9K7n9zruThhR+KDIn3AnJfRFaWiz8jYDRJEfjzapGRsG+/e48UIl8XjDc0t/gDa3i/lWy3+UYQhZzh5Oa3MHICuXNHYVY5IZlCLQ0NpDTyt1u9ZlR7gIPjYDLvIygnBlaBS36NjY/GGoRIW01vo3rqI1+N4Oy0ZkQlCgE9eEZHY+UhHITUiWxjckTE+QN2tWCITAGj4DtzTZ8QvGvta6RzuYzMSxETwXVMOTU7/prB18XbwFYttQNbIO2TXRFJW5/DxHulzV1tWsfDShL/fu3mdib4+td5fVmuXj8LBK3A0i8WRWlu22jKfgC+13XuYyvlICLyZrJAsYmsNstUk+fZhpEbxBKGuPQyy9WAm71ULtTuD2y6DXsb7Rsx+z0nX2xxbzunA0TTHkzTVk1zVvy1K7KPmpkV0pCnxvYNApexsuuExrqx4woahkySM9Y0YLy8Mk64bQOu5seQ4QJMsbQM5C7QGbxzcUi+8TyXDKx0Rp5b6fw0yjnOe4CSrgcNM9VZu6+Q1gqVE891A7RIV6mIy4GaXrWdzBJ1lxK/UL7G0Rau7izUihX3coV9HBEDoEF9Jh4WB8lS5FJbVFrUn2eEl8wMb+zdKYSAI20JMMG0N9bdpdG8U2gkXm+TpPAGymWcwNqvN92fO0RNaEkTfUVRSHdjqgQZDTTJdnz6xMVCQB8yTutIyD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(366004)(346002)(39860400002)(396003)(186003)(16576012)(478600001)(316002)(4326008)(6916009)(83380400001)(2906002)(8936002)(6486002)(31686004)(36756003)(38100700002)(8676002)(966005)(66476007)(31696002)(66556008)(86362001)(66946007)(53546011)(26005)(2616005)(5660300002)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnB3NEhqcFdrR0hUQ1FIV0lVV3ErdmhOdXFXYW9KNGt6YW9sNVJnM2JUdTVu?=
 =?utf-8?B?TnJCTktlUUxBdWN6dTZZVmVWdExsVmFLaHdIazQwTmI5ZkV1M3NMSWRDUHB5?=
 =?utf-8?B?UjgvYWZTSkZsb01JUU5rbVFhR1NLSTJLZlY2WGxwYUhkY3g5akJCQk53b3F2?=
 =?utf-8?B?UW55MnRsTWNOSUdYaU5zYm53Y25tWlFKWmlYWVNvZjRUbDd3cFhmZVZvb3Y5?=
 =?utf-8?B?Wi9xT3hVU2UxdWt1OGR2Mzd2emd2UVJqKzdmZklpYnNnYVEzMStQNkhEb2U5?=
 =?utf-8?B?OEJxLzlyTGZpamZUQnM5N21pdkk2eXUxVUdvSHcxOHZ4T2RkbHdhNEJiQ29u?=
 =?utf-8?B?djlJcjB3TFFaVytTVkc2TURRUGxjUkRTd1BXejh5V3A3RjRRcld2cmYyMGlF?=
 =?utf-8?B?SU54dk1hMEFoYkRCOHpVekpHRkFkd1hOMUJXSkNhaEZmVHd2WXFGeit3MUVM?=
 =?utf-8?B?RWtSRW1IZSsvTTZIaklNa2tiV3ZnQVpDRXByWlNUa1Q4WngxRGlkdFNCNFhW?=
 =?utf-8?B?ek9NdXZodTUrQW96dWt4S0tjWWZnbVlISHlaK1Foa2RxRm9OVDROTjBZbUVX?=
 =?utf-8?B?RHhRWVNKcUI3akc3d0VCdlBZeEVndmYvN09DU3YvTWZITE5SMU5JeEJpN2RI?=
 =?utf-8?B?KzFGYlA5SHZBYTAydStjRytXZlZFbHR5bC9nKzVOVmtJK2tIcStpZXgzaVdn?=
 =?utf-8?B?ODF1U3hDRllIcW1RSGFPY29hRllDSG84M3VEcnFSK0dBSjlUUTdtcjJmYVlL?=
 =?utf-8?B?eGhPWWNhYWpMMUJGSERZR1l2TjUraDQ2VTFPc1BsKzJnd0N2akdxTHlDaUdn?=
 =?utf-8?B?K092Q2E3QUdqaVNLMnhZMkY4czlVL2xXc3huajZhaWpQbU9mWVZCeDg3RzVQ?=
 =?utf-8?B?QXo3MGk0QzRYY1EyUHEzcFdiaGhrbFErRWdXODJvblc1aDlRZ3p3cnAxQ0Vh?=
 =?utf-8?B?TlVydkJZdzJWVjZxbnZza25NNm5GNndXVFNOWWJycXB1SUVBM0dlWDZXQW4z?=
 =?utf-8?B?Mi94eWFxYkZpTFllRElIVTl4bTF5OXU4NkNBWFVlNWxidEJXRU9wU1l0WjZq?=
 =?utf-8?B?THQya0R2ZUVqd1dpb0x4RXRYa01McGtFaVB6T2k4eWQ3QjVadWVQTnR6TjBL?=
 =?utf-8?B?eXd0ZXRUaFUrME4zd29odENWZWNxTHVybWlBUG9ZV3FZQXNBcStPa3pmTW9j?=
 =?utf-8?B?RFI1dWQ5cTJpV2FFOWxzRzI5T3ozYVNCOG1KS1ZUOXZVRjFKNHlhSzVhaHZy?=
 =?utf-8?B?RlJpSjh5cTk4ekM1YjBBVHlHYzczaWFWYisyUmNwZGQ4RUp0S2NJRE1aN2hP?=
 =?utf-8?B?MGd2cG9xK25POUFtazlWWDNVM2IzeGsyb3g3QkpSNE9MUEwvdG9PMEFOUmc1?=
 =?utf-8?B?RlRta25mSWxCU3lOTVk5ekpyM3g4S1YraG1NN0QzYS9sREJGMW9TUGhNbzhq?=
 =?utf-8?B?cXNuSHo5Z3pNQ0h5Y05jdzNOcGF0bjhTZ0lCTjBsSzNLaGdLUXdzZURlZnc4?=
 =?utf-8?B?Y0VpbUdadGhCd2xKVUVLZnRMS2FIWUdvbHRQODlYOFZkdnB1R0Q0Q0NYQVRR?=
 =?utf-8?B?WVgxejBxM0pnOGdpNDlzdklvc25wcjliNm9GYTJtU0FEMzJwZ29mYXdOTmw3?=
 =?utf-8?B?cWxHMjhHbUZmMktHeTBROVMzR0RZOWxwVm1WSkcxU1VabmpKVkRIWkwyWVJk?=
 =?utf-8?B?MzdPdTRobzhrdFBsdll1ZjRZVzY1Wk9jMDI5eGRweVU2THhQU1BCNlZjbUVp?=
 =?utf-8?Q?yskTfoIqSXremwPpVcx0q9KytL72Cwbq1FNdGDs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe50552-b2f3-4fdd-03a9-08d94c56be13
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 14:49:29.0470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TjBI8rVy/CEzG27sg03IFwTJIFJC0kNSR9mdT9NGJRIHwXo2ASeiQzerPRS+OKA7QFATDdu5YK92IFtiXnMkIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5165

On 21.07.2021 16:19, Andy Smith wrote:
> On Wed, Jul 21, 2021 at 10:10:13AM +0200, Jan Beulich wrote:
>> Since xen-blkback only talks in terms of bio-s, I don't think it is
>> the party responsible for honoring such driver restrictions. Instead
>> I'd expect the block layer's bio merging to be where this needs to be
>> observed. Perhaps it simply doesn't expect to be passed requests in
>> multiples of 11 sectors together with the capping at 64k (as said -
>> iirc) and driver restrictions on where splits may occur? And as to
>> earlier Linux versions working - perhaps the merging logic was less
>> aggressive back then?
> 
> I later realised that there was another change in my setup besides
> the kernel version going from 4.19 to 5.10: I gave the dom0 8GiB of
> memory instead of the 3GiB it had before.
> 
> I understand that below 4GiB memory use of swiotlb is disabled so
> all the time previously this was not used, and now is. Perhaps the
> bug is in there?
> 
> I was told that the only simple way on a Xen dom0 to disable use of
> swiotlb would be to set the memory below 4GiB again, so I might try
> that.

I have no idea where you take this 4GiB aspect from. What the kernel
considers "below 4GiB" in its view of the world may be at a much
higher address in system address space. And the mere amount of
memory doesn't matter here at all.

> I was also pointed to this patch as a maybe fix for my issue:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=5f89468e2f060031cd89fd4287298e0eaf246bf6

Yes, this looks possibly related.

Jan


