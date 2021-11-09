Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E6144AC33
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 12:01:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223867.386801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkOsF-0002zm-Oh; Tue, 09 Nov 2021 11:01:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223867.386801; Tue, 09 Nov 2021 11:01:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkOsF-0002xq-K8; Tue, 09 Nov 2021 11:01:07 +0000
Received: by outflank-mailman (input) for mailman id 223867;
 Tue, 09 Nov 2021 11:01:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mkOsE-0002xk-OQ
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 11:01:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 551f6ae6-414c-11ec-a9d2-d9f7a1cc8784;
 Tue, 09 Nov 2021 12:01:05 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-2-1Mlfokk2MxKH7eh3D5ArGw-1; Tue, 09 Nov 2021 12:01:02 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3775.eurprd04.prod.outlook.com (2603:10a6:803:1a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 11:01:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 11:01:00 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9P194CA0008.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Tue, 9 Nov 2021 11:00:59 +0000
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
X-Inumbo-ID: 551f6ae6-414c-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636455664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zjJuk/KrpS4ruiwa4Pg3T5VONjH3xlHdxkrjsajOmys=;
	b=k40S3IWr1qZDrgz8MKlzBrN7QgFrYKlDsLfj/KdzyhU15QplvP78q9bBIc1JhJihcqbfI6
	C1z8n5Y5C0hj/vngFZl+NK3huaMHVnLVnTNwg2CHy4Fvsicpw5i4Q8CqV5KmeM2RCiwnCC
	z5Zcd6o4eHUh+hPtBMYG5Gy6ZypPYzU=
X-MC-Unique: 1Mlfokk2MxKH7eh3D5ArGw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfPSHc5TirtQORw4bo9hUpqIjQalBL2UAkCtx38agerV/MMajIYD5ud/0hTUS9GOMq0+1jGEsmUVDg551NAJXtoQA2ta4cTKPcKMfz226E0jrrNdELaf3jPeml31uTv3NAfU/uV1XKsbPfkhAwpfOaD9NTixZiDYroDtVxXeRf1tMIkcjtuhGRUUS3c/C6A8ZKATsx5DwJLlUWCi9z+4HGKSh2a8A9U8+qtRSS/dnSYjjur2hpwCLWTCkgg1AR7lGDi8tre8Qg4SV6f/uEQGrvOVwvLFIgbHAVz714weC+eIg4Vpn4ozzIjKOZzNTpmh1Ht7pehBFJ+/nqoqkG7ZmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjJuk/KrpS4ruiwa4Pg3T5VONjH3xlHdxkrjsajOmys=;
 b=G4KqdR6Mu69p7L1kNNKd5Y+ILb06iuQBHwqbYxVO47284VQMhw+B+9w3mYX/UOUSaXkT3eh63ZaVDQbPrt9iBmuuyFdx9lyohqaCUiGBpFHaIzjKtDbEGwB9Mk3bBrb1+tdqdvxQjBE90qkd3F4pqpgghyQgGbXhx2E06b6ClcvYal+XDYadLzSrnyiQDTRE71rh0NBbCtNo8ez5aQJq7Fgtpq6G5sw5Z9DDbzWTBJgip5EpBtwGtyDL+WoA0Ib+JkUhWUaE+ePpIAY5jDOiq1K5vn4LuFaaNpyLG66nJ3A+3R7fJjoR+5sAqjLwyKHHWzctpe+C5hch8ucCFEq9Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <191dd1b2-8e2a-ee91-f401-dda4fabf4c7c@suse.com>
Date: Tue, 9 Nov 2021 12:00:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-4.16 v2] xen/efi: Fix Grub2 boot on arm64
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Luca Fancellu <luca.fancellu@arm.com>
References: <20211104141206.25153-1-luca.fancellu@arm.com>
 <81685961-501e-7a41-6f6f-bc4491645264@suse.com>
 <alpine.DEB.2.22.394.2111041351490.284830@ubuntu-linux-20-04-desktop>
 <97C884F7-0577-4996-AB79-0A07A8D48FD8@arm.com>
 <alpine.DEB.2.22.394.2111041431070.284830@ubuntu-linux-20-04-desktop>
 <9E52FA33-422B-4B1C-A6AF-601CDF565700@arm.com>
 <alpine.DEB.2.22.394.2111041449180.284830@ubuntu-linux-20-04-desktop>
 <e4b2e1be-0e41-0e6e-5ea8-3c12b4593724@suse.com>
 <alpine.DEB.2.22.394.2111050825240.284830@ubuntu-linux-20-04-desktop>
 <9bd58aa4-602b-4c64-e759-581513909457@suse.com>
 <alpine.DEB.2.22.394.2111081805530.3317@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2111081805530.3317@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P194CA0008.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7da6c56-bc68-4613-b01f-08d9a3703701
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3775:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3775330C80AAE836D14D3244B3929@VI1PR0402MB3775.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pRN493NTq8P+UmRUINQtfchCG08L50i3LCYnBOBmweMWKvHpnrYUxMgAvKSdf9+Djf4+wmKHTLtH4RfALAYl0gD5JuJWTi/43UBqJgVNtsaltUgKwawCxLbL1SvcbLRmy+4OQ4UvBPJ9lF3Qoec+p2uStZMvlS1grjQFoVbjFZzUaobyoKpVegmDH3/q0Vv+nx7X2023tmqMQqDkmu9dj5k6NaBUTvDhEqjv3dIi6Oqz08ye1puE1Ng1TffjE0no3dqdzeDvv0imuoxUZzmP9nLSt6sAmVgSaCAc8ptzquURVyftGP6WtAk5oJnguo37ihVhD6vqq5H7slSR7JKSk9XGacw5LIIThgPUxaBQtX5sKqvIWhwXu0xyOcxNX2cw0+gYdG3Fysi5RxJEqXk8hobjrW9+dgpgV+1ulRvd9HNj7jIp8C8jBT+rGXK0/qHPVzVlxZTJbnBGop1uApD1cLyyavJH53FeD4E0LA2bMkFj1M2lR5vhf8x6OVbD1qMMUichAuJjBAi+yMXgqSzyrsYN1PeQrYaZ0buOevS24VbXTVwLyDqLdN1CCa+PMUUuxW7nlFWFLfV0EWBZIrwoECYiBgZQOcBh0mhECiAZSM5wyZdsUCE2BNXAajhoifw+9U+ZiL1YadzP5VLr8hdunrtM8ilhhhMaRm3PFp3jaUMXibDAuKCcVKeK8TJEw3rTPnpKEiPKD/V/tyIqqxU4VHMCrHA9JZ+i39KRIfHN/h0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(2616005)(26005)(186003)(8936002)(956004)(508600001)(83380400001)(53546011)(6486002)(36756003)(8676002)(316002)(38100700002)(66476007)(54906003)(31686004)(86362001)(66556008)(2906002)(6916009)(66946007)(4326008)(16576012)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?citxTDFVNXhiNk9rRVUxSEErS3pqaEJYQXRjS2ZRTVcrRHVMczlwa3pPTkJC?=
 =?utf-8?B?cnJQd2R5VEhWWUE1U2RZY3cveWFhVXhEdWh1aW5TVDU2NEt6QkNqSE00M3lW?=
 =?utf-8?B?RFl1QlFpekdPZTAxa212bXVHUE1pNEZHWGozNTNXY1c4YjBQS3J2RWt1QS9x?=
 =?utf-8?B?ZUlhU1M2Y1Bzb3F6VFZzWUJjZUdBSHRzQThPdUxxVmtaUG45ZmZjQXZia3ZZ?=
 =?utf-8?B?QncwK3JRcTJDeTVxaEZ6L0RSMGlIL2pkbk5mc1E2UmNEV1dvWENlRjA3dkhj?=
 =?utf-8?B?NUh1WElYKzhJVWpxQVhoYUY0MHdRbFNyTEZBQkIwalV2VTdTWGNZOXN0Zkt6?=
 =?utf-8?B?YUREZ2h3SElrdTFBN3NrUjFiR1dHUCsxR0l4MFVZMjR1NjFzd05kTVp2VlVQ?=
 =?utf-8?B?SVRtSjJyTERFa1VpRk1qaCtlVnVDR0RDOThjUUNpQVo3S3JubFdwQVlYZm1n?=
 =?utf-8?B?cWRST1RQSkVjb1lCUk4vb09qekwreGtCK0UrZm40ai9XN3M3YWNUWGpxdURj?=
 =?utf-8?B?bEhncE5MeXdPakNJZCszc0dXc0prMGgvWEFCVFNGdTRsc2FMT1lhMHdWYzBy?=
 =?utf-8?B?MDNBbEhsQ3JvTTNXTStRWlg2T1lXUU9razRaNEwzNnkyMFRWMitxc0V0cjdP?=
 =?utf-8?B?VVhzdnU5bXJ5S3FXUUkvc1dzM2Vhc2hwa2pSbXdtTU1RcExWb0V4bElNTW5r?=
 =?utf-8?B?a3JjU0RHOGhiOURjdmg3STVuNE5DeGdabmdMOWpEZ1FEVW9TMGpwY0c2U212?=
 =?utf-8?B?bE52RFpDRTRnQWszbk0wbXRKZ1BSOWpQRWkvYTdORVBIMnArMUYvcEpPSVdk?=
 =?utf-8?B?SlpmOGZkSEJqdzk4NTBkOURtZGNVSlNJRnF6OEI2OU5abkk3QUN3Z0UyblZQ?=
 =?utf-8?B?Y2xDUzdMVWF3SG9adkVhY3VrNU9MejRiYjdTOG16dEtHTFRoTXFXb3RIZzVT?=
 =?utf-8?B?eHlRVnppdFMxejBHSm9DeC8zUjlkVndQTHoxSHVUT2hWMy9GalFzdllieCtw?=
 =?utf-8?B?OWovdHMyeW9IeG1lQjFSTzdFb3N4UkhvWGFzUFN2UjlOdjN3UzBSanQrbnph?=
 =?utf-8?B?T2RxajUwMHFwQ1Z6cG5ZV1ppYjd0OHUvU0I2UFNvN1pjL2RaUDhEUVZIalB4?=
 =?utf-8?B?Zlh6TU44QmFrMDZJUGx2MU8yRGpEV0w0d2lHZUlQRjAyWmpYRmhrc3MwY0JC?=
 =?utf-8?B?VmxXWWRGaU9wTVRRMFhPQkYrcG56VzdyRUZjZWFvb3BLQ2d2ck5EMVFLWm5J?=
 =?utf-8?B?ZHgvcTBodUM0SkFHMHhlSlNqcVVibHFFNE9veFJ5cTBQNGpvb1hFcTF3Z2U3?=
 =?utf-8?B?S3hQZGMxM0xyb1hHNzBmcnoyeUh6OE9VRGJEbldjSUd2VEdrRUtOK1BoTzVG?=
 =?utf-8?B?bmhzNFZTOG83KzFGNFdQU2VLa3k5RlFreE81YzdkZnJFeCtwU0doSHNnMkR6?=
 =?utf-8?B?Nm1TSUpwYjBSeDUvcVFwdUw4ZjBPVVJkRmV6NjQwYUxQT0xsWjhEV3VqLzU1?=
 =?utf-8?B?M1REKzdwSUQxcWQxYzdwdWs0YW5Yc0U2dHl0bW0xRFFHVWRiZlBRKzBWaVVu?=
 =?utf-8?B?NFR5QWJSTlcvRjZWejM4Y0pDdWNWWXB1d3pJNFBMemVhc1NLdWtYWVo2akVz?=
 =?utf-8?B?bFFZWlk2RXVoeC9JRmphelZQZ1NveHVpTk8vclVkcHh6L25uenhqQnBTczRC?=
 =?utf-8?B?dm5sNDZNMnRHYndSWGRwai9GRzVLY1l0TXRzcEtoWkttVy9GMy9Hdk9iZmM2?=
 =?utf-8?B?M2xTVjhtaFFvcmVPNzdvVmcwM2dQaXRlTVFCSDYvamNxcXVYSkNvWGFMcWxV?=
 =?utf-8?B?NmFDbDltYzd5TVpVeFhSaUxCTkwrZllxK0hSa29zUmVVNnNwZFJwRVNWOGZi?=
 =?utf-8?B?bEphL2Y2VG5KZVJwVTIvTC9xMlBSRThxYkRRYXJaT3BQcS8zeEVUZjZkSlNF?=
 =?utf-8?B?cW53R25qRlZwc1E4cEFlVnJ4SWg0bFMycHVqbEZCQ2JQWGk3UzYyMkhxbkhU?=
 =?utf-8?B?c1VoenBXek1LYnl0djROZXZ5emxVUlBqOWRlMVd1SUJpT3pvQ2swU293a3I0?=
 =?utf-8?B?WGkxOHhLTHluOHdTQ3BZaE1PMjA5bkNUbU94Z204K09ZSTR2ZzZPV0MvbTBi?=
 =?utf-8?B?YWNWRTFldlk5OUd1VW9RMlovTGxQd2s3ajFrTGovcXBIT2pFdExZSnJNa3F4?=
 =?utf-8?Q?ksEf3F+t3LhryXLFdGJHEps=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7da6c56-bc68-4613-b01f-08d9a3703701
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 11:01:00.6856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 41Igf0see/RUo7EfHNZ1v7g0WeInzxF1uzeFjBbuZon5a3J8kKQv8sEUbrwiutPNmu9yVR1RiHSKi53eb0PExg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3775

On 09.11.2021 03:11, Stefano Stabellini wrote:
> On Mon, 8 Nov 2021, Jan Beulich wrote:
>> On 05.11.2021 16:33, Stefano Stabellini wrote:
>>> My main concern is performance and resource utilization. With v3 of the
>>> patch get_parent_handle will get called for every module to be loaded.
>>> With dom0less, it could easily get called 10 times or more. Taking a
>>> look at get_parent_handle, the Xen side doesn't seem small and I have
>>> no idea how the EDK2 side looks. I am just worried that it would
>>> actually have an impact on boot times (also depending on the bootloader
>>> implementation).
>>
>> The biggest part of the function deals with determining the "residual" of
>> the file name. That part looks to be of no interest at all to
>> allocate_module_file() (whether that's actually correct I can't tell). I
>> don't see why this couldn't be made conditional (e.g. by passing in NULL
>> for "leaf").
> 
> I understand the idea of passing NULL instead of "leaf", but I tried
> having a look and I can't tell what we would be able to skip in
> get_parent_handle.

My bad - I did overlook that dir_handle gets updated even past the
initial loop.

> Should we have a global variable to keep the dir_handle open during
> dom0less module loading?

If that's contained within Arm-specific code, I (obviously) don't mind.
Otherwise I remain to be convinced.

Jan


