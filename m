Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 890CC404B9A
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 13:52:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183058.330995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOIaq-0008U0-NQ; Thu, 09 Sep 2021 11:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183058.330995; Thu, 09 Sep 2021 11:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOIaq-0008R9-K8; Thu, 09 Sep 2021 11:51:48 +0000
Received: by outflank-mailman (input) for mailman id 183058;
 Thu, 09 Sep 2021 11:51:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZYDC=N7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOIap-0008R3-Hl
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 11:51:47 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9bc9dadd-65f4-405d-83ec-8073e79dde32;
 Thu, 09 Sep 2021 11:51:46 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-pnuuh1hBPkeRCJYtQ35FaA-1; Thu, 09 Sep 2021 13:51:44 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4944.eurprd04.prod.outlook.com (2603:10a6:803:60::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Thu, 9 Sep
 2021 11:51:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Thu, 9 Sep 2021
 11:51:42 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0015.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 11:51:42 +0000
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
X-Inumbo-ID: 9bc9dadd-65f4-405d-83ec-8073e79dde32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631188305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YPhBFtz05r6QxOq9a0dG0RzpyQqo+X417gOuB5y8k/M=;
	b=kjjmLZd/JIR+tf6GeQ+DxUg/WJXer8mnayyCYpAt7Bz2aKNp6rUv0LS0tB81iJiieh0i/2
	b7QdMxkZ6iqPtO29nCx1ws0mkv8Gh7tvkmyU5KPHEW69AhM4X9A8LqOs24zO5ZBwauNcr3
	MS/PkhUvomaNAQAOZOz71c60YsLkaz8=
X-MC-Unique: pnuuh1hBPkeRCJYtQ35FaA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJEAIjzhPeDtTk0/nwARO0bp3z3HtqFxyNH2Zvwfm8iyBumpo17OsNDqJl0rYVp8FhbJ111eGePhkafbTyogKhmc8mLmJGX//lP90EwMq8od8KiUIZ6SiterMhpdn3By6cQ3Jzk7BRIHJQREkGezEmLFc1zUasA5FrJIG73PokTrdSW107xRL1BZUk/yN0WRUzhYkhFNIJBvPI4amL/Ea8HDXhUlOFfENEKWafer38tLGpTvHpHzeA+ekjgHOxZ2sj4HTL2L9wxVY3fUFkmj0hcZCUSJhlD/4fn1T1EuQ8yiJsKtrzJP6P/qITwNptdmDB/IZJla+svvLwZlxi9q3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=YPhBFtz05r6QxOq9a0dG0RzpyQqo+X417gOuB5y8k/M=;
 b=iYNoIi8noba6aWXkMvsx8Mol7RKVQ14OxthGGHcqVmrwnRTVKA+5gqZtAP7IAaSMw19Yd3Um/T79lHboSlWX/Uy0cdrfTHPC+t5Rrp+1QXweBc6UkwcYimwyG/O2wH02cbgtcQp7+8ZZhouKX6bE1oq9UXKEyPx0VZBEA/s5ntnIwlf4RRAEgoRbwJBLCcKUTRgh8Pm+ZKc2Fy6Pcc1MW1yjkrlDZafJ/yCwXTt7+iQjs2JBV7cIUsEtIPQwvo03Qke2wQ7kBZFS3MwrgkK6NhUasfz/pUKM5iw/QyufQDuZ6PyK9moeHfYMqG3hiJm2M5aDdYpLjY8A4qorGlQzQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 6/9] vpci/header: Handle p2m range sets per BAR
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-7-andr2000@gmail.com>
 <1fb1223e-005d-dc78-cd34-dc97191b316e@suse.com>
 <ba644629-a251-4865-8a7a-075392b9dffe@epam.com>
 <7e0c9d9b-6087-83ef-f9e8-1e9e6eb2d1e9@suse.com>
 <206c7b6c-6c0f-ce5e-6e62-15b46035b036@epam.com>
 <422a6543-ec2e-0793-3db5-09456e04f65b@suse.com>
 <dfb66ff2-9c9e-645f-4789-2dc6c21ff751@epam.com>
 <27043082-bf9f-5bba-f5a0-bb0e10426aba@suse.com>
 <e154e4f7-bd60-2645-1ce5-1c2b5404236f@epam.com>
 <3e7dc9f3-1536-0643-b732-4a203bee34d4@suse.com>
 <d81e9eb2-c16c-1f59-644e-09bf3466be76@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8927d56b-7449-15cb-1dba-799d7f027e4e@suse.com>
Date: Thu, 9 Sep 2021 13:51:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <d81e9eb2-c16c-1f59-644e-09bf3466be76@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0015.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7800d995-67f2-4cc0-215b-08d97388312d
X-MS-TrafficTypeDiagnostic: VI1PR04MB4944:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4944CDBB3BD4BA10694A2729B3D59@VI1PR04MB4944.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2N7SjugojQjxd9rcjhAYcRwkukwisalID9Mu2Y29YEj+mej0VnatqZrL/vjprYwckqVqwRTkEeNZsBDU+PV0/+S8tXMvaf45GfTc4wywZ5Ajl6Ve2CZ04ZNB/yHcegdYc3OyOgLoe/Eo13O/H1cniIKqNH9ei+F7euwM2/6JXJxEEUJX/E3SaEK2XRBUrdfBT1wp4XuAfCURELiXPzY1EP6pw3rpzPmVdFY6kvp4hNlyHhv7t0opfgag8uH6CVznQnNDXIXi8g+JK4UeuOnDD5uxilAMkFwClaLpCiL74K7XKN5Mng2APq1UL14j2R/63+qtRBFAvjUqvbqjoDm+VeEkasNX5CclLAljiuo1eDoiK6ia2wvrnVHxWGYSXrkLaSAwgB0VwVK/wiUi0knjS46tcArNuWKKdNDfM3RN8Q6Kx0J1vz4yqIhIDjvW9hrKs8qeiIv0fs2GyW/iu0Pv0Ya8F+tQBOPL2BB9OEhVm4+FRvFQ5K+smUDH6x0/jgBeAQyDnRMGUZSWUqeNamdCuTypO1SzH73x8uW0yzqrGOhltxqJ3LF8EhzFjpsbGSgKaScphRrHwhc06UMd1FA5tfjj4Nznsdvv7MebROANYhul9G6rCFAHErMmxWUE8trTwu2RfDAMIyqtoTIgNq5+3Czxgc0GvGs+0uhqOFyytE7Wma1Sgebk7mqdYpwEshMNZSEFad0G8E/olrHfkKE3f7trqmM32E8gbef9YJw4hWjfN3smmlWRh/NQrq2h57pH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(366004)(346002)(39860400002)(376002)(16576012)(8676002)(31696002)(2906002)(7416002)(54906003)(6486002)(26005)(53546011)(110136005)(66476007)(316002)(5660300002)(66556008)(66946007)(83380400001)(4326008)(36756003)(956004)(31686004)(2616005)(38100700002)(478600001)(4744005)(86362001)(8936002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWR1OUFhbkkxaDhmdUVxc0xXeWJlaDlhbzhKdUZVb01VSW44OHI3aFErNTEr?=
 =?utf-8?B?NDhSVUlrUHVVRXUvVFA3YWZYdHM3MStrWXExenpHSENUZno0azdGZjdUZnFr?=
 =?utf-8?B?V3l0VVI1N09pUjNTV1hxMCtwTkpxRmN0QzA0YkZTRWV4R0NpSzlIUWF5clZk?=
 =?utf-8?B?Mm1qV3dRU1c3SUpMV2dqbzVMTHV3YzhKWjVFY0dtU2k1czJsUjF2T0MyQTZI?=
 =?utf-8?B?RHNiTjluMFhvdHRTL3VpbWhjQXpyS3U4NTgxd3hlaVhxZytSNUFDek13Z2tM?=
 =?utf-8?B?bTJxZ2R3RzBUbHRYVWhTNkR1Ny9GdlhVSDJUUFNxWnNCOG93T2RBdmhOUGVM?=
 =?utf-8?B?OUJIbFJaaWJTdndCSmE4QVpGWS8zVHBIUlFER2prNURQV1NGY0ZDSUZ2ZTUx?=
 =?utf-8?B?ZEoxUHM4d3l1dXNCZ0dEV2VqWlo4OFNiWHU4SUdzM2ZUMmFnVnBWTmFpRXBz?=
 =?utf-8?B?UnRSWDJKRUo5MEtqZzFtSEw0TnVhTkdzampjWTV0K1pGR21OVkdBK3pCNUE1?=
 =?utf-8?B?dGF4QzE0ME9LeDU4WC8rZFZlSzRWeDBKNmZ3Z2M1c09zbGpTbHZqVm5Va002?=
 =?utf-8?B?WC8yZndzVm11ZUNtTHdMZi83RG05eGxVZ2dVaWlna2VSd1ZHVzNFSlV1Q2l5?=
 =?utf-8?B?VWJxaTcvb1lCVXFDZ3VZcWdUcjVHWVpmdmNkWTUydUJ1ZUsyNnZkQlFRdE95?=
 =?utf-8?B?bEtCak1aTTlyenFhRVlmYkdwcjJUUWRxam9VMUpBSkp5b3hvTnZrYUpVbjgr?=
 =?utf-8?B?cWZsN2RSbnBWMVo2b2Q0WnR1dGNmeDEreEMydkNuYndmRzNZd015NHFjdG1D?=
 =?utf-8?B?VzZyMDRnbFROc3pQbHFJNzl2bDdKZituQUszelU3QzFaWkNUZlg3a2pEcHAy?=
 =?utf-8?B?NzhyNkpFNU9Da001V1FzYVpuc1RUUWZKcUtIdktRWHpjVW1HRXR0N05BNEpE?=
 =?utf-8?B?bERYNzZrMW5NOG9YdjB4SHMwTVlsdi9LWldkOW1HM0VlaE1aWTFHVm43MUt3?=
 =?utf-8?B?ZDQzNHZMQ0I4Z1pnYlk4ZXZDYnd3bHRObXVXcGkvNmszV0lPU2o1QWRxQlB2?=
 =?utf-8?B?UDFKazVJZ0hWaVk0NnNWbTYxTjNqTlZJVytkZ1NPZlU3MTZqQVNDYlZyU0xY?=
 =?utf-8?B?QmdGeCtyS1Nic2FIY0FsNU0vQWExckpGcjR4WTZPREFOQy9HcGI1UWFOT3BU?=
 =?utf-8?B?bkU1em9QTWtJU2tQTDBwSXdTUy9lVXZSYXg2U2IzOTc4SjVjWlo1U0FWYmNX?=
 =?utf-8?B?VHZsVGdxYmUxUTFqL0xZcXBwWGZRb21LWlRkajk3VTlwM2VSaUdnMzBIT1Nz?=
 =?utf-8?B?K0k5Rno3NWFtRnc5aFoyRWhPV2UranFkbTgrRjk1L01lTDU3MHNnZUJXRzRw?=
 =?utf-8?B?Q2RCblduT0liOTNrT21GSkYrbDdGaGQvL0xvSFJIeUV6aEloTHp6TjdpRUJD?=
 =?utf-8?B?NWlWdG9YTWJMcWI2dTc4T2them1xQjd0UW1QVzh2aUFPcFF0UUNobHhyZnZL?=
 =?utf-8?B?L3ozSzEzYnVrZVJ5QzNDRVZNMTFUNGtkNDdtcG9EVDhBWkJwclRQbmIweVow?=
 =?utf-8?B?L3ByR1lJbE9GUTFSLy9XMFJsWDF2YzlnZ012aVllZlY5bnk1QjZtbUxBYzNU?=
 =?utf-8?B?MnllbUdIZmdheXRmdlhWWS9pekt2TXJ3QjU5eVZDZWVad2dLVHUyU2tsUy9l?=
 =?utf-8?B?OFdYNndFOWJPU1dKMElGVEh2Vzh6UHBwZUltemNWOHZSdmo4MHJDaDRPcmJw?=
 =?utf-8?Q?cV3Ysn8owLcOw+J/8qTkr4DLqI4iOWE2BynnwEO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7800d995-67f2-4cc0-215b-08d97388312d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 11:51:42.9102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43oHzWWZLsJ0vpFk1nU5TPu6hLxBCUYFW37pqKJuEi7hcIvcAdVFeS+RmOizuQjKdrfPOUaVkcxeqd3Wd6YAJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4944

On 09.09.2021 13:30, Oleksandr Andrushchenko wrote:
> On 09.09.21 13:46, Jan Beulich wrote:
>> On 09.09.2021 12:03, Oleksandr Andrushchenko wrote:
>>> On 09.09.21 12:39, Jan Beulich wrote:
>>>> And in fact I wonder whether for DomU-s you want to support BAR changes
>>>> in the first place while memory decoding is enabled.
>>> No, why? I want to keep the existing logic, e.g. with memory decoding
>>> disabled as it is now.
>> Afaict existing code deals with both cases.
> 
> Hm, I thought that we only map/unmap with memory decoding disabled.
> For my education: what happens if you unmap with decoding enabled and
> domain accesses the MMIOs?

That would depend on the precise timing; it's certainly not well defined.
But supporting this may be needed for quirky OSes, as said before, as
they may get away with that on real hardware if they avoid actual accesses
at the time of the BAR change.

Jan


