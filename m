Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C97C70D5B
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 20:36:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166427.1492968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLnyq-0006JY-GU; Wed, 19 Nov 2025 19:36:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166427.1492968; Wed, 19 Nov 2025 19:36:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLnyq-0006I7-Df; Wed, 19 Nov 2025 19:36:40 +0000
Received: by outflank-mailman (input) for mailman id 1166427;
 Wed, 19 Nov 2025 19:36:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GacY=53=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vLnyp-0006I1-0q
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 19:36:39 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f95f41b-c57f-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 20:36:36 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by AM9PR03MB7012.eurprd03.prod.outlook.com (2603:10a6:20b:2d4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 19:36:33 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 19:36:31 +0000
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
X-Inumbo-ID: 0f95f41b-c57f-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZBXTzGPB0VpMo/Iv6MDHckxjfQKG7Jseycw9i1JVqZ+dZhSJVEQ7eSoth5zEAXBWXRU3sI6ifISTqeUrmJIO+pX49D6GQ6uzMPRTr65Ks3TDSpUUmVDBo3Md+zFbLg/rjf6VxVXGA4TiFBztXPQqmRXejyx6kfgRv1qnlb7YSjR/9o9BrmYLxwbN2nQrmAmLgM1v5USsY00h7H5n0G0wQk4Ku4GV+aECE6SG5yKJ/iiqrC0ppfJMTQ5D7fuUWl8OPUqsxRQzdOKFGxai5Jq4yJ7pKgHTO7ty4veQXcn6P4s3bzbmvGuPoast3TV6837FnIw8YyEfW14jalFD3D2HVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CS4ctYxn8RLiheRAQXqyYaZGe+SL2L5OEIBpefv1+Rg=;
 b=wosBBRCTw/wU1DKgxG+wamjkRRnS7El3xjERcztjWvkd3ba6XWn2QFo+ic25WWHLm75bE7JsMLV62TQK7dhUqG9c7V8qLeJe4IJ+Xi2Em6sZA+ZqphF/NgarFZg1mQWLZN8RDDYred4VeDKKjN5x7BWqrPRCZV4BdKpmuXcf6wEV/hHkJTAnLjYugW+gx4BkxAYngY024i0/iq/f8da+lUYWoeZJAlpsp8Yi1b8o5Y8gUkf2Z15SuEMhKnGnIIVzviDJoWLqq1aYKgtN23G0YLAmBsn5QKuJsB7e9na9bxg4CpfR3sMAXXGNFON0tixiN8UOeM5k5/HDE9atwJTvMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CS4ctYxn8RLiheRAQXqyYaZGe+SL2L5OEIBpefv1+Rg=;
 b=uIcJUiLboOpK9wCpsq5c/KA71ZwYKUohdXBh+MK+7ZVyO3/HKZ3lL73AXAyx+eL3yxvSc7kas778HQrQYe50/FjHWUGS6IhaIGIiR5RnB8UWBQO1V2AkmaJG+i4/xdOhhR1dxpbOGJw2NRwkPGtFSKsMvjsameu7oHi0mn2jNPRLsayCRiK2l+78CvlNgBQd//LtbKzTh8SDywIIIcS+ONRRiAN7lecvSqxwUl9mc4x/H2P1quJPEy5ffPf2Po49FYFzENfaAxe7des0nBKVBCkh53cZCRo4OWyx+0dYQUY/Tk6KdlskaTi6brMg5GyaO7KdOFnM5foLTVH2eC1v6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <276968a6-4688-48bb-b0a1-5270ad3f0002@epam.com>
Date: Wed, 19 Nov 2025 21:36:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v4] xen/x86: guest_access: optimize raw_x_guest() for
 PV and HVM combinations
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251114140117.270461-1-grygorii_strashko@epam.com>
 <11c3929a-977b-4ef8-aaaa-9aea01657b04@suse.com>
 <fdd51da7-c8dc-4c0f-aaaf-a9fd2094bcd4@epam.com>
 <567f2759-fa03-43bd-9ae4-75e0e3811b60@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <567f2759-fa03-43bd-9ae4-75e0e3811b60@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::12) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|AM9PR03MB7012:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f368ff9-a1db-4e93-70ca-08de27a2f095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?KzFxalB4b3FveUFUWFByc1NHWUR2UUthdzFmMmZ6TmxIcm11M0R4WFRadTZX?=
 =?utf-8?B?UWJXZGlzQWZBKzR4Vnk2T3NRemJFc2phUi9YNXNiQjllUE5STDRBZ0ZBTnZM?=
 =?utf-8?B?S2FTT29ybFFickdLZzZTcEp6bkorYmZDOWdhcDN3T2NVWE9QY1NUVWk1VDZ6?=
 =?utf-8?B?ZituRFdJeEZ3ZE9icWN5Mmhid0pJQ2UwRDdwMGhuRFFVOVpLTndDcTVDZW5G?=
 =?utf-8?B?YVpBdUxJbHpBM0ZGOHVaem9aeTN5SlNkT0h6clNYSlpHVFBhaUFDSE1IYnB0?=
 =?utf-8?B?ZW85a3pDOXU0OCtIbEk5VDFQYmFEd3RvV1dWKy9OR1g0a0hMSjE1UUozRllt?=
 =?utf-8?B?U0h4NjdiTHdpalVHc2wzdW9aT0lNZDkzbEsyLzZRaStaY2c4TFdlempFOEFm?=
 =?utf-8?B?M1dKNXBFYmNiRjBaREEySFVhWndhdk9LVDdjOU9STXBOKzdsYnM2a2szdXVl?=
 =?utf-8?B?b3NCL2hTUmJzRlc0NHpUR3VKeEN1MGVWTWpyZGpOeWV5Uk9jcXE3U3pJYVhQ?=
 =?utf-8?B?TWpTTUFXeWp2aUc0SHJoNXlvT21XQnZGS09vR3Y5OW5BcnVaNG9QdXB0THhZ?=
 =?utf-8?B?My9kelpRV2pDMCtJMlNvU1FRNXZabElXRFBXTytRYmFhWmpIakV5Wld2S0hr?=
 =?utf-8?B?aTlXUkgvTWFYTHljemg0VTZqVzlxRzZhM2w0RDYyNzcwYlhEVmhpQ3F0TFh2?=
 =?utf-8?B?NEQ3L2p2a0U2RGRsZUlSZUxVUFE2UEpXUnFkS3I0U3ZxMitOMk1aOVRIV3R2?=
 =?utf-8?B?Qmt1aUU3OE5DT1d5S1pTKzlSdTlLWHNCdDhqVzNBZHFXUVROeXFBa29aeVJt?=
 =?utf-8?B?NFUyU3RzQjF3RStIdHhhczZwUnh3NlQybkhnRTY4clB2SGlNMDBrSFd3WkZw?=
 =?utf-8?B?Y0xiaUdwaHc4WE1ETFRvY1NEK3pld1ZTeHVXbUZxUUlNS1liUFdHSFkrcXJv?=
 =?utf-8?B?SjZUSEk1bUJlanNNODRDUDFZOGgzZThGMUhHRTduYmdtblo1QWd3dG94aFJU?=
 =?utf-8?B?Sk1rU3ZCd1pDRldvMm1mQjZIUmlvR29qcEJrN1U5WnROMEtsdzFQTlhkcndz?=
 =?utf-8?B?Wm0yYmM3cjV4cXBvRnFBM21MWEVhclZkVTVKMk9tVzh1ekhRWnhqaG9RUmxs?=
 =?utf-8?B?aW5pbThIN2pRTXB0VWxxb1cyUzZONis1KzRXenIyUVVmdzluSC9TdEtLdW1H?=
 =?utf-8?B?dlRhL2llYnlPbTl4UFovTzdicHVzelVJdCtvbFMyOTlBS2h3emRiTm5mNnp5?=
 =?utf-8?B?dzA1NVBOeWFwLy95Y2VXN1hocjJ3bzVWZHlVNHRQbWFSTVRsM2RnaDlBenIx?=
 =?utf-8?B?anlFYTdNMEFscWVQK1hqWkRuNDYzSDNMVW8wb05NeDRQZmtwNXp6a29XS1B4?=
 =?utf-8?B?MHJHalM3MnZUcktrVWZLVEZQSThDMGFFVlBxbWdaaFVhWFpZNkF0MEFGcFlS?=
 =?utf-8?B?dnc5KzUvVVBqTEUrZDI3ZFdkQzVHSGxIMXhVNkRvRVhnRU1XRysrWmRhSDRU?=
 =?utf-8?B?eWFvQUpoSXhuMVJKTEZUQUhydzIvZGhWS0RCU1NXSkFxWjR6Mkd1a3k4KzMv?=
 =?utf-8?B?SE5LeFdHVVlVSXIvdTVmMGNvbjM0bmF4N1hPMVpJOW1IM25pb2l3ckNxMnM0?=
 =?utf-8?B?dmpLTTNMN1d6b3lweG5qekJQUW9LNDJmc1hRWWIzTHBOR3V6aS9DVFh4elpZ?=
 =?utf-8?B?OXpneEpQWDhzNE9oSlFZK2tEN3NPNnJYVU1VRTZadWhmcUY2a21EYnR6TlJZ?=
 =?utf-8?B?SDViRk14eHJpUnN3U2hETXpsODVQR2V6Ykk3c1JNLzgrTkRDdi9EYmNhQjRp?=
 =?utf-8?B?Tk8wZlQ5blM2MGNaRWFvc2RiQ0dWUjdJelk0cnlnVnZJMVVJazlBYytER3V1?=
 =?utf-8?B?dHI5QW5kR2FtQWNFLzkyVUYzOElvVHNYNUFBY0hqWFBJaldpWnlrSW44WjNC?=
 =?utf-8?Q?8BGlaac1xjD4s7hgKGS4mXb53JBdy/aW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmRLdjE4MWEwUkxHUzV3Wmp1WE9nWjF5K3YwUVpEalkvdFI3aW5Xekhpa3Bw?=
 =?utf-8?B?d2hhQjB6MDB1K045Q0d2MUh3WEd5NEk5aDMxM3JGOG0zd21aT2Nza0hWSmpG?=
 =?utf-8?B?QzFYd3Q2TjV4UmVhQmJDMEpMNnJkc08yZDByeHNSbXVvUkM1WmdaU01jbDdj?=
 =?utf-8?B?ZWVVVGpscGVybUlSV1ZMN3htSk56NWlieHRYREF3eHY5UC95K0pmcW5sdHBy?=
 =?utf-8?B?VHZnREJvZzc3QmRQdlUza25HbUlTMHN0aWJOQzNHcWhYZTQwN2tEeFoyMGV4?=
 =?utf-8?B?Zk84RDY0bldNamg3Vjd3azdsd0ZleGRnNG1id2ZUL3R3NlVoUCtCL2xzQ0pw?=
 =?utf-8?B?Y2J1NGY0ZGQvNlN1ZE05aVl4aHFCYnV6Y2lPQTdKQVhEalBsZFJtQXZjUmZp?=
 =?utf-8?B?Ry9uZWtJSzZSNTNUNnVBV2ErQytDYXJ1N1Y5QTBZdHQ2NnpxMnV1NE1xR3VB?=
 =?utf-8?B?M0gzYzFBRS9CdXQyWU80ektwSkEwZ1BjUzE3UjhVeGdNVnVObjRocElxdGZZ?=
 =?utf-8?B?SEdvRE1RZjQ1MXAwQTZxTUVLalNTZTFPdDFHd0FmNTNRUjRGNUFkWmk1enA2?=
 =?utf-8?B?UFdIbU96czZUUUVwdUpxWXBlaFZRSVRMMWZWY004bjFramdwQnRFallGaUdG?=
 =?utf-8?B?V29mR1ZRZnJLNVlsQTBiUk0rU0FaVXVCbUxCOXJSZzdMWWlBWHU4QWdNUUJG?=
 =?utf-8?B?NWJvSHhpK3Zrcms0bERPQVBZb3FFZ1hNcmhKWWxDL2R2d0ViZ2RCWFZFa1Uw?=
 =?utf-8?B?MWFBT2xSb2dPejd0V09pYU9ZZHlDOHdid3ZBRjlPc0RkR1hXZzhlTVVkSlox?=
 =?utf-8?B?cnQ0VmszaTU3MlNteFV5T1lzVXlLZXNIYkVoMnQybDhHekZpKzR0S3NwNDRZ?=
 =?utf-8?B?MG9mS2JhdGxtd3lPYnRKZC8wOU5heDJ3ME4wWmc5Z2JnWExZdGo4Z1NFa0VJ?=
 =?utf-8?B?cW1MamhQKy9PeTIwWUwrbDFBWEpwVHJqN1dvYXlLWWx1SWdjK0RIZm9seGh4?=
 =?utf-8?B?NEd5emkyV1VDbEhveU5xWGgwUjZEb0ExUXdycW1rY01QdEJqcmd1M0UrYWFG?=
 =?utf-8?B?Sk9veE8vRFZxSkl5TnE4Y2FHbmpYdnlMMEwrVnBKd0xqbHZMZzFqenZDVkFo?=
 =?utf-8?B?akZSSXZ2QnVBNzRibUVlUFdZdnJnOUcxaXdlVmx6SFk2TGR2eTJxb0pjN3lU?=
 =?utf-8?B?ODJ0cVhScmZ1cjdabXB3R0lWUjFtbjZacDlaaWZNeXRZU0hhbit2WUhvbm54?=
 =?utf-8?B?dE5aaHBhZEZ2ekVDSXdTWGd1eUJ4QVZKL0F5QlFlQVhkeklaZlZyeUMxY0lD?=
 =?utf-8?B?RGt2RVFtaHRlV3NMaHV0Zkk0SElzUnNGbUdDRkQwRURPZ2srL0k3QjVIOXBi?=
 =?utf-8?B?eXVIeEw5eUR5RjNmRGRrMnlCNHZuRVNobnFNK3dCWThqNzRSWnBNY21lWk9O?=
 =?utf-8?B?K1oxRnBFQ3hqdk9FT2k0UHdxaTRITEtkSmVML1ZCSUkwUlhhWWRZdkx1Yzd6?=
 =?utf-8?B?dTd4aHNqeHlWT1BlcGtLMHdIUG53WDNZZTNOQ1hZQTZLUWo0ZnFzR1g2aUwy?=
 =?utf-8?B?S1N0VkM2ZmZRQ1NkMlZjcWtWVU9HbjBkeWR5clZKbWJMNkltRGlYRG9xUTZq?=
 =?utf-8?B?NjNraGtNZDdTL0VkVDcrdjMyS2txck1xbTd6STdyT1dzNXY4bTgxbW8ydnZI?=
 =?utf-8?B?MWJRUWkySm1aTTNJRTl1dGthU3pUL1o5RVgxV3hxdUczaHNPT01UZWtXMkph?=
 =?utf-8?B?QXA4UUZxZmhscVhoUk5RZnFPellCclAwYW80eis2VWZBbncwbVNmOHltai9k?=
 =?utf-8?B?UERyTVo3RldzbnVwd0dTazN2aWRhQnBCNFBTWEJpVENwVXNlaXJvTlo5SlZV?=
 =?utf-8?B?UCtYYzlqRjVsTVM2eUp0TGZ1K24vWFh3dFk2UXF0MWdwL2k2aDVkRkluSW91?=
 =?utf-8?B?MTNUcG5HK0EraXNlbGU1OFZ5czNINTNqNDROUzJvUlJvMzZnN0RLak0rVG5s?=
 =?utf-8?B?U2dtZzRCN1JkT1BMaVA4OFNFUFk5MXRJb0JkcXA2SE8wYUJQTXI0S29xRHM2?=
 =?utf-8?B?R0I0WWpueS9kd245ZmdHZ2htd1pxU09kb2IvQjVMN0ZpM0ZZRklzTFRuaE45?=
 =?utf-8?B?em1pc0pBUHk1ZzltWkprUVk2bEU3ZldMY29jR3J5Q2lhT25TdDd2WVJNRVNH?=
 =?utf-8?B?cFE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f368ff9-a1db-4e93-70ca-08de27a2f095
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 19:36:31.0737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DInDtGx0qziEP/O8jPU3Q86xWP1sMpRo3oHz9BNUShz74mzmYV0+ZGY3dsOwhLsrMY8sAyszMK50ct4utV9+iEAHK6XYYipYcBKhq1UYWd0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7012

Hi Jan

On 18.11.25 15:45, Jan Beulich wrote:
> On 18.11.2025 14:08, Grygorii Strashko wrote:
>> On 17.11.25 18:43, Jan Beulich wrote:
>>> On 14.11.2025 15:01, Grygorii Strashko wrote:
>>>> --- a/xen/arch/x86/pv/Makefile
>>>> +++ b/xen/arch/x86/pv/Makefile
>>>> @@ -14,6 +14,10 @@ obj-y += ro-page-fault.o
>>>>    obj-$(CONFIG_PV_SHIM) += shim.o
>>>>    obj-$(CONFIG_TRACEBUFFER) += trace.o
>>>>    obj-y += traps.o
>>>> +obj-$(CONFIG_PV) += usercopy.o
>>>
>>> Just obj-y with the movement.
>>>
>>> However, is the movement (and was the adding of $(CONFIG_PV) in the earlier
>>> version) actually correct? The file also produces copy_{from,to}_unsafe_ll(),
>>> which aren't PV-specific. This may be only a latent issue right now, as we
>>> have only a single use site of copy_from_unsafe(), but those functions need
>>> to remain available. (We may want to arrange for them to be removed when
>>> linking, as long as they're not referenced. But that's a separate topic.)
>>
>> It is confusing that none of build cfg combinations have failed
>> (HVM=y PV=n, HVM=n PV=n) :(
>>
>> copy_to_unsafe_ll()
>> - called from copy_to_unsafe()
>> - copy_to_unsafe() has no users (unreachable, MISRA 2.1?)
>>
>> copy_from_unsafe_ll()
>> - called from copy_from_unsafe()
>> - copy_from_unsafe() called from one place do_invalid_op() with
>>     copy_from_unsafe(,, n = sizeof(bug_insn)).
>>     Due to __builtin_constant_p(n) check the copy_from_unsafe() call
>>     optimized by compiler to
>>     get_unsafe_size(*(uint16_t *)to, from, 2, UA_DROP, ret, 2);
>>
>> as result copy_from_unsafe_ll() is unreachable also (?).
> 
> Yes, these likely all want to become library-like, so they are linked in only
> when actually referenced.
> 
>> If those function are not subject to be removed, the
>>    usercopy.c can't be moved in "x86/pv", Right?
> 
> That's my take, yes.
> 
>> Making copy_{from,to}_unsafe_ll() available for !PV means
>> rewriting usercopy.c in some way, Right?
> 
> "Re-writing" is probably too much, but some adjustments would be needed if
> you want to keep the "unsafe" functions but compile out the "guest" ones.
> It may be possible to compile the file twice, once from x86/pv/ and once
> from x86/, replacing the self-#include near the bottom of the file. The
> former would then produce the "guest" functions, the latter the "unsafe"
> ones.

Below is the difference I came up with, will it work?

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 6e2b17471719..a2017b4600b3 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -71,6 +71,7 @@ obj-y += time.o
  obj-y += traps-setup.o
  obj-y += traps.o
  obj-$(CONFIG_INTEL) += tsx.o
+obj-y += usercopy.o
  obj-y += x86_emulate.o
  obj-$(CONFIG_TBOOT) += tboot.o
  obj-y += hpet.o
diff --git a/xen/arch/x86/pv/Makefile b/xen/arch/x86/pv/Makefile
index 59489cd75af6..1fddfac8303e 100644
--- a/xen/arch/x86/pv/Makefile
+++ b/xen/arch/x86/pv/Makefile
@@ -14,10 +14,7 @@ obj-y += ro-page-fault.o
  obj-$(CONFIG_PV_SHIM) += shim.o
  obj-$(CONFIG_TRACEBUFFER) += trace.o
  obj-y += traps.o
-obj-$(CONFIG_PV) += usercopy.o
+obj-y += usercopy.o
  
  obj-bin-y += dom0_build.init.o
  obj-bin-y += gpr_switch.o
-
-# Allows usercopy.c to include itself
-$(obj)/usercopy.o: CFLAGS-y += -iquote .
diff --git a/xen/arch/x86/pv/usercopy.c b/xen/arch/x86/pv/usercopy.c
index a24b52cc66c1..6ca6eca5d818 100644
--- a/xen/arch/x86/pv/usercopy.c
+++ b/xen/arch/x86/pv/usercopy.c
@@ -64,8 +64,6 @@ unsigned int copy_from_guest_ll(void *to, const void __user *from, unsigned int
      return n;
  }
  
-#if GUARD(1) + 0
-
  /**
   * copy_to_guest_pv: - Copy a block of data into PV guest space.
   * @to:   Destination address, in PV guest space.
@@ -139,16 +137,6 @@ unsigned int copy_from_guest_pv(void *to, const void __user *from,
      return n;
  }
  
-# undef GUARD
-# define GUARD UA_DROP
-# define copy_to_guest_ll copy_to_unsafe_ll
-# define copy_from_guest_ll copy_from_unsafe_ll
-# undef __user
-# define __user
-# include __FILE__
-
-#endif /* GUARD(1) */
-
  /*
   * Local variables:
   * mode: C
diff --git a/xen/arch/x86/usercopy.c b/xen/arch/x86/usercopy.c
new file mode 100644
index 000000000000..9c12eda64181
--- /dev/null
+++ b/xen/arch/x86/usercopy.c
@@ -0,0 +1,77 @@
+/*
+ * User address space access functions.
+ *
+ * Copyright 1997 Andi Kleen <ak@muc.de>
+ * Copyright 1997 Linus Torvalds
+ * Copyright 2002 Andi Kleen <ak@suse.de>
+ */
+
+#include <xen/lib.h>
+#include <xen/sched.h>
+#include <asm/uaccess.h>
+
+# define GUARD UA_DROP
+# define copy_to_guest_ll copy_to_unsafe_ll
+# define copy_from_guest_ll copy_from_unsafe_ll
+# undef __user
+# define __user
+
+unsigned int copy_to_guest_ll(void __user *to, const void *from, unsigned int n)
+{
+    GUARD(unsigned dummy);
+
+    stac();
+    asm_inline volatile (
+        GUARD(
+        "    guest_access_mask_ptr %[to], %q[scratch1], %q[scratch2]\n"
+        )
+        "1:  rep movsb\n"
+        "2:\n"
+        _ASM_EXTABLE(1b, 2b)
+        : [cnt] "+c" (n), [to] "+D" (to), [from] "+S" (from)
+          GUARD(, [scratch1] "=&r" (dummy), [scratch2] "=&r" (dummy))
+        :: "memory" );
+    clac();
+
+    return n;
+}
+
+unsigned int copy_from_guest_ll(void *to, const void __user *from, unsigned int n)
+{
+    unsigned dummy;
+
+    stac();
+    asm_inline volatile (
+        GUARD(
+        "    guest_access_mask_ptr %[from], %q[scratch1], %q[scratch2]\n"
+        )
+        "1:  rep movsb\n"
+        "2:\n"
+        ".section .fixup,\"ax\"\n"
+        "6:  mov  %[cnt], %k[from]\n"
+        "    xchg %%eax, %[aux]\n"
+        "    xor  %%eax, %%eax\n"
+        "    rep stosb\n"
+        "    xchg %[aux], %%eax\n"
+        "    mov  %k[from], %[cnt]\n"
+        "    jmp 2b\n"
+        ".previous\n"
+        _ASM_EXTABLE(1b, 6b)
+        : [cnt] "+c" (n), [to] "+D" (to), [from] "+S" (from),
+          [aux] "=&r" (dummy)
+          GUARD(, [scratch1] "=&r" (dummy), [scratch2] "=&r" (dummy))
+        :: "memory" );
+    clac();
+
+    return n;
+}


