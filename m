Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C8E3D0A56
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 10:16:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159184.292823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m67OZ-0000u9-7I; Wed, 21 Jul 2021 08:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159184.292823; Wed, 21 Jul 2021 08:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m67OZ-0000rF-3c; Wed, 21 Jul 2021 08:15:59 +0000
Received: by outflank-mailman (input) for mailman id 159184;
 Wed, 21 Jul 2021 08:15:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NGKG=MN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m67OX-0000r9-O8
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 08:15:57 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df4b350e-e9fb-11eb-8c09-12813bfff9fa;
 Wed, 21 Jul 2021 08:15:56 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-4-nlY4GrJCO16meuu7LcpgtQ-1; Wed, 21 Jul 2021 10:15:54 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Wed, 21 Jul
 2021 08:15:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 08:15:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0009.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.23 via Frontend Transport; Wed, 21 Jul 2021 08:15:51 +0000
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
X-Inumbo-ID: df4b350e-e9fb-11eb-8c09-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626855355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1lnsFLGkSVQQ0HozFsqDtFwkQakqigH6bvo8zeWXz5k=;
	b=VFGLcX2qePBgcqg8Qf+ZTUAFqlCBCOsBx0RXO4uJ7rdcYuHHmOahOIFGQHTwsFW0OiPVga
	wontnIjPx0+9onuWEPVZNRzIBsuyGEXwjiq8gaOrejn3sPPsFZnZejdc78Wd43ConT3Ohq
	58i4AsT2Z1M3NrTshXCzyzWbE/0ARVA=
X-MC-Unique: nlY4GrJCO16meuu7LcpgtQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jIi4uy9u5DXmMeW2eabbiMMeD6P35VpxF7UPfmMkxvuKljyWB1ADrE3oFqaaEzsJnvNcGz9LsWRwLaSPxAYin0zobfBaCVE9/ZU6UjBlDU+khRMA3oe2hCbZVkF5LrFGSDZ4rlyWLbl5jTEICvApmxfitrpFvNnYVb36ZEBiIVXhjkXbrTUiV5cRg/rMNB184+Otd7P9CrsNiW6Kwoyn93ZNAFT5u5aS/ax6CuG6uc8Kic9GPHnhHBboTSfnMaSAc2jFOQ+eJLGZVEJhceJljNJgWID4VzsL8PilLjhYEqWOcyX2m9//wxQyX6e9klanusXLoFur5fySpHjY4hwqmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lnsFLGkSVQQ0HozFsqDtFwkQakqigH6bvo8zeWXz5k=;
 b=ZsItb/7GGGCB058BgKsFXgyj7Fny5REFaW1Oxi/zTl7zXDWLTwQKTzPpeim9YwjDBUS80tcR6c3/kuLvrOtz2vuzq+eC+atf0i7WqE10yn+lNH91Y020MNwRo5TgRYE3IVTm7keEIs8VNz1GKdKK3oEAE8GY8vs2iG1upoNhkhCsJAqVXrNZ8b3duHmuCi42oMQeGUNnIIgos672LlyLkQDCq/W4DYHQcqjsJAUcDjzmxsK2ZDaMd2rdN7cRsIIS1wj+ORvlTatNnqu9coTqo9JX4nlWRgfJx/wcJhAZT5KpuRwjGAhhgtsbLX1/GWKS0NsiVbp+oe9SKvvB1rhKuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH V3 05/10] xen/arm: static memory initialization
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 nd <nd@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>
References: <20210715051819.3073628-1-penny.zheng@arm.com>
 <20210715051819.3073628-6-penny.zheng@arm.com>
 <295913d9-5727-2ec7-ca20-70b94c53309d@suse.com>
 <VE1PR08MB52156DCB9D06B07718ACF9D4F7E39@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3b1685ea-ce3a-0ecb-8058-9c02e6f5cf7a@suse.com>
Date: Wed, 21 Jul 2021 10:15:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <VE1PR08MB52156DCB9D06B07718ACF9D4F7E39@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0009.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 369058da-e536-48fc-61e8-08d94c1fc17c
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70396B49E5E4C59D15CA2C55B3E39@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uEShUdPpG7v6flsAiNtcZ6ri5+Cw6yRk5QRSLeeDyOpTF9QrqIvSZJIM2pnHjN5UByGmYXDXvm7aMDhVnLBZQHeOlYuOF4B582ocA7AuwBRVHVKDYtpwVqvF7YxDvx+9Pfw5m31OJekcfJy9fkcSC9QXrWR2zjQztTkdUzFSHW3aXff+keHRf4cZinnPqF9WGv8kRuKccn5Fuk1spsEL590fgFe5KFvMfUuW7qv6iJgGNkNaTLl93T2917rdvAV5+3Q0DMgD9KZUi3/LIWUzA4uSxYANYGX+AsoNBLm3b912Ux6OZ4B+FjjYg9kZF5Z+6N4dXe/f4rg/cCdSMBwMC7rRKtNj+6/D/VwsFSe9deHXc3NWb/wTDDvIpCwiFDXor99gKE/6ArROvVe5exdBwLaAQbpB9Ek4cTCAB+bHBhuYyBUkLn1EA2/NOhwVmo42aMqD8jK6OL54gg9tCWbhn2Oj7jSE/7YSEbaZx/yPUNEFAnEUhM9fpVgwUd+QxcoUF/dG1OhV0blSG2kjVvtK9gbxBT2B+9M8uR0v6y8YUSXgohMtlqnj/NbUuZAt077FKLTTio5re74E5qMknmxQOBCJpwuFxc2x5be6VjpTrL1gRPwkHbzcoyXjLJ7otySYlsyjVQeM2kbzXAUqvDd+nn4DvLBCA2DhFL+Ic2DokwpDX2lDVhOmHHohu6xHLfXz6dZbMklrFL4eyfK9nf7UCmFrNiTsjDmiIKTFoVUg3SU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39850400004)(376002)(366004)(136003)(396003)(86362001)(31696002)(2906002)(66556008)(8676002)(956004)(186003)(26005)(478600001)(6916009)(83380400001)(36756003)(31686004)(316002)(66476007)(16576012)(2616005)(5660300002)(8936002)(38100700002)(54906003)(6486002)(53546011)(66946007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bC9OTEpYdFdBV2NqTWdlZE96dWVpd0RHVG8zZzhCd3BWS3htQmdRZUdqc0pF?=
 =?utf-8?B?MlhoMTU1SWF5SWk1SCs3bzZraEZnRHg2dXNicGo2V3VvZ2Z0YVluOC9IM2Vu?=
 =?utf-8?B?TDN1SjJWbzdVOEMvY0QrNUh5dm0rNmNCcmR0Sm9ZUTBNK0drcERvWHMxWm1u?=
 =?utf-8?B?SUxMeHUxYkdnaWo1YzZHUm80WjdYZWE4N3pJZk1TbHJ6ZGJ0S2pvMlJnSmhZ?=
 =?utf-8?B?aGlnQkNRdnNvZmZQSWd0anJmc3RScDZMZkVzamNmcVl4QzhEYXI1Q2g1a2xT?=
 =?utf-8?B?djh6cksvM28zL0p0emx2SjZmRUtFTnVJdEhBVVBiMVZ1bmU1bW1tMWhaOEF2?=
 =?utf-8?B?M2ErZVNqMldBbFQ3MkhwOG5EUUVpSGVobktkSExTSXRHb0lETStFSkc2enp0?=
 =?utf-8?B?bUNwSFViNzdFNjJlZ2Y5c0xUR2p3K2tYQ0NzME9lTmYxV09MVGpMOWJkMHhq?=
 =?utf-8?B?TXF0SmlzYXhUNHpQTDRZbS9Ea3hiVU50bHhRYkpMQkZ4VlFNWHV4T3ZmbTR1?=
 =?utf-8?B?NmpwdXY3SEoxZnl0Q2hhM21SaG56QjNTeThCczhjaS8yRjhHd0Q0R2xycy9z?=
 =?utf-8?B?NThEUFRtY2dYY21ITEJhY2h6dWdlZ1JvMkZlYmJKd2RiTjV6WEdXT2JmU0pI?=
 =?utf-8?B?M1pRVHBadng4QWpGVXZBUGc4aE9FV3pFNmVPaVM1K1lYUzhsSjFTZmFoWk9U?=
 =?utf-8?B?TEx2YmtPeFhhay84WW82V0JiYzV1bWtCN3dHMkJ2UlI4ODRWVjY5R3Rpa043?=
 =?utf-8?B?MzVydUNudEZ0MXhaY2p0T1E5aTFpaStLcXJlUDJXOVdaUVZnTVArL1U1RHh6?=
 =?utf-8?B?M2RVOEdwbWkwbkYrRzFiT3FTM3gyakx5a2cyM0xnOFlRVmtRMjlrZkQ2Z2ZO?=
 =?utf-8?B?TDduTGVuZjRIdHlEM0NhL21oRzZmbzNtYjd3bXpPM1d2QjY3OGgzcm9WTnBs?=
 =?utf-8?B?Q2FWTWIyZ2IzNk4xL3d6d3ozdVk4OXBJOUgzMGc3WnFwY0diN1k4MmF4WE5q?=
 =?utf-8?B?TkFLRkNvMExIUXlrTFJGcEJWVTBiMU1GTVBacExycU94TE04NDhtUkNTbzFF?=
 =?utf-8?B?NC9vbyt0YTBSUXV3MTIwSnQza0cxUlVZdFZqL09SVnBEQ09HM3ZuMWVDWjN4?=
 =?utf-8?B?UlIrWW5rdFc2SU14YjBhWkp6SHhSNVhKVmtidTNkeEN1Z0VjTE5vTFRaaFJ3?=
 =?utf-8?B?dkQzbnBlS1NoTmxSSUpxbzZKUnlTODFSK0hxL2l2WjV1ejZ5VnQraXRmRklw?=
 =?utf-8?B?cUt4QTZqZmF0L0tLR21xMUNGWE1sTnpLeng1MkkrUEpLVDA5THdDaVNmbjdO?=
 =?utf-8?B?OGhxell0cDQ5a3MxNVB0aDkrM1lWMzIzRGprWFNOakZnZU1ISXJJSFV3dWFs?=
 =?utf-8?B?UVZvVkRWQ1BPeU0zOGU4RmZIR2RZWGpTWitkemdmMUl2UzlVTzRrM2lVakxs?=
 =?utf-8?B?TjFoSk5VNXpLcXZIT095RFcvV2xHVzVpRVhvVHh6MzRZcGdkQ3I5S2lZL1h3?=
 =?utf-8?B?WjZoYyt3TFZLOEFkVG91aFZGQVlRVU1KUW1BQlFUMUFuUFJQYUJXV1VCakNV?=
 =?utf-8?B?dS95MmZPM2hYNHA0SjJiMUQ2eXM0SGY2c29TUCt3VFhuaWNiWXgvZjJSY3k5?=
 =?utf-8?B?OU9WRHpZK2NVSlBtajJ5Ym1scXZsL1o1OUFmQ3FqaFRmSlBpdXJzNndybzlL?=
 =?utf-8?B?Yi80L3o1L2t4cjRnZjJFSFhxWElOSHFhUFh5Q3dhRDJJTEFqSEp5ZURlVUxU?=
 =?utf-8?Q?RxUp0a7NCc+M1FdadIg/iXUZ5eec6Ddj9JTMe4j?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 369058da-e536-48fc-61e8-08d94c1fc17c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 08:15:52.4806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PAxX2zrIRKAGrOs6wbZRc/BcFrulKT1opWG+4tIGNR68O7eU0xzLTgDb17K+K1B1G8xIdm3EMqBC4jg+6evwZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039

On 21.07.2021 05:07, Penny Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Monday, July 19, 2021 4:20 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
>> <Wei.Chen@arm.com>; nd <nd@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org; julien@xen.org
>> Subject: Re: [PATCH V3 05/10] xen/arm: static memory initialization
>>
>> On 15.07.2021 07:18, Penny Zheng wrote:
>>> v3 change:
>>> - include addition of CONFIG_STATIC_ALLOCATION in this commit, where
>>> it is firstly used and also change the name to CONFIG_STATIC_MEMORY
>>> - Fix TAB typo in Kconfig
>>
>> Not sure what this relates to, but ...
>>
> 
> Before I was wrongly using " set tabstop=4 " for Kconfig file, so...
> 
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -106,6 +106,9 @@ config TEE
>>>
>>>  source "arch/arm/tee/Kconfig"
>>>
>>> +config STATIC_MEMORY
>>> +        def_bool y
>>
>> ... this is (wrongly) using spaces for indentation.
>>
>> I also wonder about the placement: Shouldn't the option live in common code,
>> with Arm "select"ing it?
>>
> 
> Sure, I will place it in xen/common/Kconfig, and add "depends on ARM".

But I didn't say to use "depends on", but "select". "depends on"
would be appropriate to use if the option had a prompt (i.e. if
one could also disable it on Arm).

Jan


