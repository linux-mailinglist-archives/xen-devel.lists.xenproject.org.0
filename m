Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 932E8A5BF0B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 12:31:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907925.1315118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trxpt-0004c2-DC; Tue, 11 Mar 2025 11:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907925.1315118; Tue, 11 Mar 2025 11:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trxpt-0004aa-AO; Tue, 11 Mar 2025 11:31:49 +0000
Received: by outflank-mailman (input) for mailman id 907925;
 Tue, 11 Mar 2025 11:31:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0SOU=V6=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1trxpr-0004aT-Uu
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 11:31:47 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20617.outbound.protection.outlook.com
 [2a01:111:f403:260d::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bc2b0a0-fe6c-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 12:31:22 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by GV1PR03MB8494.eurprd03.prod.outlook.com (2603:10a6:150:8d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 11:31:20 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 11:31:19 +0000
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
X-Inumbo-ID: 5bc2b0a0-fe6c-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=suERWYgbKc3U8i0SerpkUkCKby0atXAhXfmZvXr2hqT9uhPHRAgFcekCKfsuX7Ib5o0ys+s43EU20JWroPpgcKXdpIVsPldBEmLpaRCxrBtQUCPzFvZ3Yr6ZkvT5hsV4bbwrjYVy0dYeVslTFzI076BRGKvveQhd/pVKhAf6x15oklL0vg+ixHrjxCnXhHrHgf8lDV0IqFVDOxj5i7cNnP8RW/x0jfxkt0TNB8BftBF3Ex8cO7lbep14XjOExMxaWh7o52E0NEyd9OKl/+R2vNh56TsPzlEi8cn3zzDfBn28cIjFNNUxnoGIElgxempiUJ0O0JtcU0QwdpUYMT/Hmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X3G/o5aj+YPdppb8CyOOCrUi6lyaBkvp2EFrk0XcZgY=;
 b=pvUWe+7umYPvRG8xm0K4mjHGwKgy7dEa8WzFqEZ/J3yf6Q1N22AZZoTVvcusxywzTCdcFylNCp9glQ/VaFV53mH2dNTUKWmInITmpDIdtwJBknUNGBJFlaCJlYSVFeCP7SpkmU0tS70q5qIKDAFo6Gw5wabqJGvYGYHAnbuWdmIZrLIKwDdPnp5S42fYdK6fsxXbItFyD8PeZMWveiTbtBhbu32BMFunA0ydNRBYMunNvvx010gtltDpcKMAHpfVPQ7HuOHVtXqtqb5YbEoPGQce5D4vC0rlwKrFJWj9mX5CStOPRBIz1ZPqD2AIWQnuYWiO2JLOiRde2lwvz4AUkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3G/o5aj+YPdppb8CyOOCrUi6lyaBkvp2EFrk0XcZgY=;
 b=BVgk9lD5NLoWY3uAe9VN5P2b+/OqwfXURNPMY8Ez4by8/UhDEId1tcnVgk/186q84G0uglYGIioD/bYYSbqdLocCx51LmCg6BmpF92A6vYKhh/oKeN51doUo0gy07/RPgpkT1taw/irfPON33OYxf2Vki6QEJdPmlutbWIQWV+sP4dymgNKiYVEtjhj926HWpefRCIK56LnkkwL5mn8IIqB8/A/Jcw0K+mVNjxYgpiYoS1VmLNQe0iJAi1cumqTTK/CjOkHwPMuLarknLK/RR+DJ6k2vna1S/nDmopU26Ytnx85lrPf2kTfz2rmiLA/84LwrqEVE7gLE/RX+FiufPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <f938f8f2-052b-4456-947e-2f8925eb406b@epam.com>
Date: Tue, 11 Mar 2025 13:31:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/arm: fix iomem permissions cfg in
 map_range_to_domain()
To: Julien Grall <julien@xen.org>, Grygorii Strashko
 <gragst.linux@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250218112253.3136505-1-grygorii_strashko@epam.com>
 <20250218112253.3136505-2-grygorii_strashko@epam.com>
 <8f0c8df3-3e6c-40a4-a88e-b81174a170f6@xen.org>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <8f0c8df3-3e6c-40a4-a88e-b81174a170f6@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0203.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::6) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|GV1PR03MB8494:EE_
X-MS-Office365-Filtering-Correlation-Id: f7e70002-ac8d-4fe8-8c8b-08dd60903e88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFJtdGhGb3dNdW5HMnMrdHlBZFBVdjRDRDdUY3BKd2wrYkpwd0ZxVnUzVmt2?=
 =?utf-8?B?Vm9JLzhobkZqblRzMHBhR3NFeklwbUY4Z3RaaWVXVE1ocXlnVzhjMDh5NG43?=
 =?utf-8?B?cWwxcVBEbzYwSWhyKzlON0RuYzNiTHNKNytHSHZaOVlGa0lMWW9mcFo2d1A0?=
 =?utf-8?B?bHpKVUhLSnVqeWloaUdkM3hSaG13N2x0K1NTMUdodzBsY2RFYWltTHYzTlRv?=
 =?utf-8?B?S01oMmdPdWxlZGpOMFVwdzd6bGdOTXhwN21rOEZCMDhnUlJoY1ZNaTM5SXhw?=
 =?utf-8?B?amVveWhoand6MXRMWDJkT3h5TzYwV2JRckd0eTd5R2c1SU9SemxmZmhHN1dE?=
 =?utf-8?B?bVJ3VVBnQU1ud0JOV29IbUxZK2lkdTdlbG51Q0JLU2pob0VCZ2NNN1d3RkIr?=
 =?utf-8?B?ajFNOXFWZ2Y5cEJ4QnF1b3BmemZ1Nzladk9welVybUdreDdBelIyN3I0blRI?=
 =?utf-8?B?blVmTFV4ZzZXT0oreU9vZU9rUmExdGhpemxuY2dTblA5RDcwaDdWTWtRL0hr?=
 =?utf-8?B?ZXZnZjBJREZ5N3V1WnhWZUNGN1A0RERMSU9vcGV2UW5vRUh2VHZ3djJIMWhp?=
 =?utf-8?B?bUJOaDcyR2R1MW50YnBLeXhZczUvZ3BiMmNTbUZjVjJNMTMwQjUxZ0lkWEtk?=
 =?utf-8?B?Y1VwVUI5RS9ENDVZQy9BN0dTRlB4V0hCZy9oN3hDaXJDajJMTGVldkRHWExu?=
 =?utf-8?B?VllvY1YvWEhJOFcvK1NucmZJcm1FdmRoUStqbjNqUmZiUTB1Zks4Wi8rMy9a?=
 =?utf-8?B?T0tpSFc3NlhwdFU2cDd3ZURqMC82N1NCWjg2bEVadk9sL05BSEUrSHhTendB?=
 =?utf-8?B?bENJc1NVbXJBVklqcHN4bmVPeENrV0E3OEF1ek02SnpjWmdoVzhmWWRUVFhJ?=
 =?utf-8?B?VGkweitqbEhKVXRkRTMzVHpHQ00wcWI1WGhCRmFLWW9jVzBSSVhuOWxJaTVZ?=
 =?utf-8?B?MzFtMmVmMmlPbXRtbElCMXZ3NWRadnhWczdFUVRIRmR4MkY3MzBqUWVUUERW?=
 =?utf-8?B?Z2FOVEVKcFg4UUxEUGFCbGxoK3ljYW1TSkYrM2tSWVpmZkdMNnlOWEJPUTN6?=
 =?utf-8?B?eFBqcHFIMHV1NTNyamtQUFR0OW02KzdaY1pHSkFjMHA3eGZDbWgwZXVIWWl5?=
 =?utf-8?B?WFAvTTEyVUkrZHdvTDhqNnlKbmZuS0VneFhsUElFdzVWUEdocXZGOThsRjNC?=
 =?utf-8?B?bmtPTzFRaC9TWUxDN0wrWnlYUG5zTGxKa2IzZXdnenhIS2kxKzU4VVkvMERm?=
 =?utf-8?B?cVAvK2lNWERQVTFWd20rbENYMjV5S1NnS0FkQlR5ckExRWRuelpyVGFnUmtB?=
 =?utf-8?B?TXY3WUpBTjN2SytkS200dFhrNGpLbVlmRjdPbVJ6bkNubHYvUmVWb29oL285?=
 =?utf-8?B?WkloOHF4T1E2NXJZRVAxNC8vdkVKTGdhWllmUXFUOUEzMGZYVjJiRitRMWc1?=
 =?utf-8?B?YUlxcjZxM2lHUFF5M1IxU0oxWGJKSlRvVkxFN0lrUTBQY0pHOXVpdE02QTFm?=
 =?utf-8?B?amFHV1ZsT2RPM0VEbEs1M1RzR2xiYjBlOXpwbFNRUTFvSjdFSHBsVlR1TEJG?=
 =?utf-8?B?WFYweGIyemFiWmNaNjdwRERad2F2aG0ySktOOUsxU1Y3MG9kMUV0aThodnRB?=
 =?utf-8?B?bVhvNWptZkJIdkVPZWVmS3dsSnhCaWc3cWp1QXAzWmRyeWM2YjVweUhuTkE1?=
 =?utf-8?B?cVBIdkhmTm9GaHAyOEpmM3VCbnlrQVVUOFE0c2xyZ3NzcUkrSnBFbWZoSzFn?=
 =?utf-8?B?MXN5R3BRQkJPL3V5dWdJbVpPcE50cGtDWHAvOEpQQlFQUDBUSHVObHM1aUpq?=
 =?utf-8?B?YkRBQ1hxTVdOeno5Q0hlR0x5UkFCb2JCVFFuK3VWaFY5bG5wQnV1V2NGaEFG?=
 =?utf-8?Q?DpvXCzD8vLbc4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlRSNmJvaHBlZURWenI5Z0V4ZE5JRGZBSmFQNk9FWjdqenVpbXAzYjR2aUJx?=
 =?utf-8?B?d3BXWGkveW5jNmRCR1cwbWh6SEhOR0VlMUV2NjlGZncxUHJoSjNIUXc5QXIr?=
 =?utf-8?B?L2Jlb0lFUDBEV3J5d2lWbFk5V1N5RlJaL0ROYjZLNmdYdGNRd0gxNGdoZUlR?=
 =?utf-8?B?NEtGWCtYeldaTEdtcFdySk5DdWlzVlJ3cUJkOGNHMm9mNlJHcytEYlhZWGd0?=
 =?utf-8?B?YkQ3TzFkdVpMUFhiR3YvVjZOUmY1azNQSFBvUlk2YUNORndVZG1yakhOU0Fo?=
 =?utf-8?B?RzV4cWNSempnU2VRSHdmRmV3M1VpektVNDNXdmRUUlZpU1ZySzF0MVNpTUZr?=
 =?utf-8?B?c3kraCtWN09henpsMkQ0RE4xdittNWZaZVlqci94c0VmUjRuc1J5Z25aV1Ja?=
 =?utf-8?B?UHZDNExvN1gyRU5UOE1qeDRaMFY2RlMyK1dZbm9Pako2dkE4TTVKUkxSK2Ft?=
 =?utf-8?B?bjF3eVJQRzJiYmdsQ09hdk41NURXZThGR3Qrc2FRRXhzTmwybVpwZEdBRDVk?=
 =?utf-8?B?ejA4dUFKSmtCTEMyZGpoNnA2YkNpOTFuSTcxSVVaRk5UV2pBNEJRbkR6VkJX?=
 =?utf-8?B?dHc3eFlZdFlIaWVGRE9qeXlpUkZoOG0wR0svS2JJTjRIN3hUVGRpS29CWkJ1?=
 =?utf-8?B?SHA5RUgyVnNLSHhSV3VVc1NKK0lVbWVUeDU1NGZCNUFYQ2E1eVc0eDF0Tk80?=
 =?utf-8?B?R0xnU2M1RzhQWk9RUHRrTUlINlJIcENBM3BVQnh4anMwekpwZlIzSXo1Q0ZZ?=
 =?utf-8?B?ZmtMQmFzY3NhOTNpUnVkSzhjMnVnaUpHaWhRQWJxMXJNZlUvWmdBS3JJMk52?=
 =?utf-8?B?K3A2THNiOXNaSXZ4SFV6TlU0aXBhamwyR2lZbXdyaktvK21sazYxZDBDalp3?=
 =?utf-8?B?eGtFSjRkREYxa2RNU1BrWnlaTmMzRXpxbFk0dzU2WldpVkRxL0xWVnBVY2tD?=
 =?utf-8?B?dGh2cWJyVGpCTDZacEpobGdxY0xITFdpRnZUMllMZTAyYUZ5Um1GVXNjRW1o?=
 =?utf-8?B?NW9CYm9ENGxVQjRFUWJBS3BHZWpWMGhZR0M3cXg4YVVCMGJrY2Ruc2M0NHlp?=
 =?utf-8?B?TzhUUEQ3RlBkY0ZMN2NwaTMzUEEwanNjTEpkbWJNQklxV08xK054czRlQWR2?=
 =?utf-8?B?L01UellyTU1HOTVXa0FGaU9tMnJmeFJjUTMybVI3bE1FZVorM0VQSjhjVFVh?=
 =?utf-8?B?eDM0VUR2eVlUb1RMVWxZTFcrbHlLWEppTEpTTDZ1NUwwdkJ1MzdmNTR1Z2px?=
 =?utf-8?B?VGMxQU1iYWVKS1lmVGtIekh2SmxnbWxDTTROWnAxY3V0bjhxVWR0cHZWbUdK?=
 =?utf-8?B?dnNLNENuTld6VHQycFpUdUtUVFVIZWlZZGNHTGhYR1NxclRrNmZTOFNaZ24r?=
 =?utf-8?B?YjdWcitSTXp3U0hMWEhCbU5zN01OcVNTenJlMjBXUWVXc0g0T0tPbktFeG9a?=
 =?utf-8?B?dVN2amxIeXJYSEVwNzhVRk5mT3FocTVXNWk4RzF5Unk0MVBEYkdCQXRUbkJC?=
 =?utf-8?B?UFhwbTNEeXJZdkdrL3poVUx2bC82bm5TTlZSVGRiY1lIQmZZNW5iUmtSWGY4?=
 =?utf-8?B?UjIvNVUvV2JvNS9rUGE5cWxaUFh1cXdaUnVzUitGcXlqOWx4bEIyTzJMQ0JZ?=
 =?utf-8?B?MnFuMXQybzBudWdSTVpUb0RQMmJYWnlNMXJtVWZrTU9SVXFHVzVEYTMweWUy?=
 =?utf-8?B?VUN2SlFnVCtrRTVUb0xhS0JTWk9wbUFDUGpKa3pLMzR0bm1kbFFXNGpHeDhY?=
 =?utf-8?B?Q3Nqa2F6RFM0SkNWMDFZUnhtNWVlSjBWSGlMSkF2REpyaGs1SmRhRkRPK3hh?=
 =?utf-8?B?MjF4N01JdE52eVhLVm5ES0g2dzB0enpXMm80R3VrcER6YUk5SVBLRm1rOFRR?=
 =?utf-8?B?WWtMWUttd0s0dXp5TkZjMGZJUGtpcXVqekxYZnBDQVdJWmtUbGE2NkJwbng0?=
 =?utf-8?B?bnpJbzVEOHl0R1FlU01zV3ZaUURVZ0RGY3QwN0IyZms4OVFscXQyWG8zcWt2?=
 =?utf-8?B?bWVVN002dG1kajArM1ZiVG9ZY3lWeUxhZDBnYnRsNE41WHlOQzVYaStZdG5B?=
 =?utf-8?B?M1RnYUZDcFRHNjhsYXNwVTlJM0QyTTYxTzNWbk5WeG02VUNaY2pkYjZBbE1v?=
 =?utf-8?B?MlliS0EvZjM3QzhnMWo2ZHNsZUFUZjJHbW1zbU0vZm51dlZOUjYyRWlJZ3Fa?=
 =?utf-8?B?dmc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e70002-ac8d-4fe8-8c8b-08dd60903e88
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 11:31:19.8857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q3gvZV7l6s+oTicJaIbZw+D2XZw+hnOG0no9ZeZhjR3/jToENqnW9WnUOD1F4sd1IEyGlULuk2+exgXz3QJpkOHac3Q25uohFIYdB13JGK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8494

Hi

On 19.02.25 13:25, Julien Grall wrote:
> Hi Grygorii,
> 
> On 18/02/2025 11:22, Grygorii Strashko wrote:
>> Now the following code in map_range_to_domain()
>>
>>      res = iomem_permit_access(d, paddr_to_pfn(addr),
>>                      paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
>>
>> calculates the iomem range end address by rounding it up to the next Xen
>> page with incorrect assumption that iomem range end address passed to
>> iomem_permit_access() is exclusive, while it is expected to be inclusive.
>> It gives Control domain (Dom0) access to manage incorrect MMIO range with
>> one additional page.
>>
>> For example, if requested range is [00e6140000:00e6141004] then it expected
>> to add [e6140:e6141] range (num_pages=2) to the domain iomem_caps rangeset,
>> but will add [e6140:e6142] (num_pages=3) instead.
>>
>> To fix it, drop PAGE_ALIGN() from the iomem range end address calculation
>> formula.
>>
>> Fixes: 33233c2758345 ("arch/arm: domain build: let dom0 access I/O memory
>> of mapped devices")
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Sorry, that I'm disturbing you, but do i need to perform any additional actions here?

> 
> Cheers,
> 
>> ---
>>   xen/arch/arm/device.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
>> index 5610cddcba8e..97e613e06afa 100644
>> --- a/xen/arch/arm/device.c
>> +++ b/xen/arch/arm/device.c
>> @@ -71,7 +71,7 @@ int map_range_to_domain(const struct dt_device_node *dev,
>>                        strlen("/reserved-memory/")) != 0 )
>>       {
>>           res = iomem_permit_access(d, paddr_to_pfn(addr),
>> -                paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
>> +                                  paddr_to_pfn(addr + len - 1));
>>           if ( res )
>>           {
>>               printk(XENLOG_ERR "Unable to permit to dom%d access to"
> 

Best regards,
-grygorii

