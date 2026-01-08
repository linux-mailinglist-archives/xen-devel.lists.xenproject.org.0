Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CF5D0567C
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 19:13:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197992.1515301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vduVD-0005Fb-VV; Thu, 08 Jan 2026 18:12:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197992.1515301; Thu, 08 Jan 2026 18:12:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vduVD-0005E5-RC; Thu, 08 Jan 2026 18:12:55 +0000
Received: by outflank-mailman (input) for mailman id 1197992;
 Thu, 08 Jan 2026 18:12:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4HrZ=7N=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vduVC-0005Dz-23
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 18:12:54 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a58170ad-ecbd-11f0-b15e-2bf370ae4941;
 Thu, 08 Jan 2026 19:12:52 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS7PR03MB5589.namprd03.prod.outlook.com (2603:10b6:5:2cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 8 Jan
 2026 18:12:49 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 18:12:48 +0000
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
X-Inumbo-ID: a58170ad-ecbd-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bn4f7H8nA+kp6zRNvc9CcE5dZ9w3gXca+Fja/xEQS1kUBQoI1k4f3DkNVrjT9AcJyN016kY8iFqcTd495qiDNgw+qePFca6/Sqsa0VJ1WI0u028XC1XgqMgR3E6OBI4+pSLoG7rRvGGRcYPMm5RUkJnAfhNvWBgMWwRmUpTwo2SYzRy73YokSptLRAmFZFiPJyKts0OY/9dd3d6O+JausZ6JZHBW9GKnoldtqZXneMf3+hVdGFySPOn2hOaUBSouoBMzNY3bjztHMe/OWlYQEPQPcKdej56NjFL34BKSd86Ras3KDQqcKdysi5UJQxWSKvgVd7XSk9LsX3i8mifVVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIV0UM0RSzqyDTOYO61g2uqGwOb1ENaSUjQ5Ywx9RHQ=;
 b=OBqPHJJ1o4Ia1YeL3E0mNqp6XFsf4H6nNEkprstUtS4mGcEg3aeQnvz3GwGpxWD3yb8ACYhML/lCD0Ok9I/sAJpWgVq9HR/PTW3Rexb0fsqpExAruV9ytuOuqb8eeJ8rTk2v16P89rUBHvezxyMGRaMa2Qj2IL5sGJb5cS79qiZN37wl+mBw++qkHIaKH63JsXYlYFVkepPk9oSU+evQ7CpKvphvxpTfaCRScLHCctFhquCW8uTvRo1ipsuKJzj+mwLrRaW4JrQbjOOyklYEychD/fncvzAp5x2CRVFW02fnDChbyyLnFMqwCsgB0a8shSLV+YIFQVvukYx33lzsbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIV0UM0RSzqyDTOYO61g2uqGwOb1ENaSUjQ5Ywx9RHQ=;
 b=G4F10hxitevSzxfX6Ic5fkekluI6F4JK1azw1IprMqBhgUapkhpp6VAiKYq/eI/1jtKP6fv7F5GeXIoWmMwDoRza3owNic2bN8GTtNpZRnZirm5wcH0hQpumuMgBh/6dAM4wP636KUyg2lV0cyoh1CmR+jOQORI0rmhsgk++8mU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <feb1e200-e852-4c51-b993-ee078f4e6beb@citrix.com>
Date: Thu, 8 Jan 2026 18:12:43 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2] x86: guard synthetic feature and bug enumerators
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <239a5d80-c0af-410b-a053-5fa84273aecd@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <239a5d80-c0af-410b-a053-5fa84273aecd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0035.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS7PR03MB5589:EE_
X-MS-Office365-Filtering-Correlation-Id: 78909355-4b7a-4ac4-9e96-08de4ee187de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NSt5TnZ2VzJicDhZaEt3YTN2RGpnTUJJRGovVGdZWHFJOUk5Rk44NkJ3RVlT?=
 =?utf-8?B?bWpYQjBnQkZUWHJYTmQ4Z0EvWDY0elVsM2tHVE9lQzMweG9VcUNseTdaaldX?=
 =?utf-8?B?SE94ejNhMVJ1SzJjYlh5T0hsTkdNWmlBTGNGSjhLb2QydGxxdGNjVUR6SG5Y?=
 =?utf-8?B?SGVjcFl4cmFJek1XNENUV2pVMmlZa0c3S3NmN29CZ1ZhMk41YTI3SkU2Qy9B?=
 =?utf-8?B?ZjVYem1jVDljeGI0MGlaMm40WHg0Sks3cFZwRkJwNHJTZlN1cnVHWEIxQ2NY?=
 =?utf-8?B?WGx2aElnZURGOXZqQ3hqMVdlYmZST1ZsbnhqZ0Y1S3psSXJHajlaZGFFaHFz?=
 =?utf-8?B?UEJmaVorYnNWYkw5Sit2bEZ4TUxDbURibW0zbzhkbVFpWmtXSk9IY1hmOVZj?=
 =?utf-8?B?bVorZ2RITFFYSVNxaXRRL0hISzh2L2xxY3FqTGJGTmw5bGxhMVVkTTB4VG5r?=
 =?utf-8?B?bkV3TEZzbmxJK0RJUTRleHdSQTYzSUxDcGgreG9nM0hwb3E1NG9nNFVmWmcy?=
 =?utf-8?B?elVta0hpTjA1T241MGlNN2VUeHpDYk5QU1poanN4S0ZXTHdma2NicjRVVEov?=
 =?utf-8?B?OEZid3l4QjJiTktpcWowMkFZQkhsQzdzbGxvcThmbUhYSkgydm5WWFBwZVBG?=
 =?utf-8?B?TGl4RGtrcmxhZnBGd1NPUnByWkFCM1BVLzhzM3RZQlNUdm9MQjk1ZVpBUWFV?=
 =?utf-8?B?MEpNcUxCQmxRU1NRMkJHZHM3dU5YM3AxdG91T21LbWhjdFlnUVFYN2k1ay9Q?=
 =?utf-8?B?enVBd1NwempDVUJzZEt0NGNoU05jUUV3R2lKYUhBd1lqc004Y0lZbnpyWmVn?=
 =?utf-8?B?aFFPUHNZN1hubXRXNFVJUEJIZFFwejhvbEh6V2ZvODY3dWhkK1RCakxIeWVT?=
 =?utf-8?B?V3FnRWpBMTQxVDhUVXEvR1YyaG5nbDlSdURlek0xTFhWVFR4RGI4MU0valN0?=
 =?utf-8?B?RmdkR21xeWVMWnFmd3JNQlhwMWtSMFUrTmFJVmJGWG15M3hPd1VXYk05S0VD?=
 =?utf-8?B?NVlJU0ltYUNQd3B0V1hOUG5HbUdtS2p6d2txOFNsK0RyNXBLYURDb0lYSDRt?=
 =?utf-8?B?K0cwMkdXS0l2NzNRYjZudzZJRTluOTNibndEQ1BHdjhIL1hxdGtQbGw0bW9h?=
 =?utf-8?B?SlpJdWxZbFF6VWJxdzI5SzJtdTlMZXJJTWgvaUQ4cUZUaHp0VDE0R1J2bVpZ?=
 =?utf-8?B?d3FFejdZTms5UGhxV1czMmZMTU16Rk1PZFk4a25MVzhWa0ZWdnJEbHBPVjY4?=
 =?utf-8?B?L0NFc1ZaZkMyV3UyNUpSa2xteEU2alNDeGtYTkh0OWNTcXhnL0F2WWY1ZzlW?=
 =?utf-8?B?TTN3RlNjT1dGQTlGT3kxdDFlWXpvWS9UaUFudVgvMFN5VW1wN0c0SG03UUNJ?=
 =?utf-8?B?amh2ZWhHZTFLTXZVOWZ1b0dnVXUrSGNkRXFNQk5lZXB2azZ6d3l6MlhlOUhI?=
 =?utf-8?B?ZzZ0R0puMUxXS2tOK3I1RG50V3cyRXl1RG1CeG8yK0VFcFZIQTdTL2ZDcVk2?=
 =?utf-8?B?QVg3OEdYUVpFL3RHVVNkM2dROVljSUkrMkdkSmRyQTB5bTE3WThlMHFESjR5?=
 =?utf-8?B?cG0rSnBqMEZuR1ViWHNTTWx4SE1BSWtQQ3hOUlpOZXZnZmdXQktvV3RiTUU0?=
 =?utf-8?B?b0grR2E2Y2FRYnkxR0VSTVFJTDFRaHJjUmFIVDZNbzBMcnI0aXBqbkp5ZldO?=
 =?utf-8?B?elZOWXRXeklVTXV1L1JnbTJLMnUwekhQalJTNkxxbHBJbjRTT2pZWHhVWU10?=
 =?utf-8?B?TjE0a2trWW8vcDhLV3NNRk5lNWsvYkRrU1g5ZmNjM2JoSDRFWDJrOEFQU1o3?=
 =?utf-8?B?Njk2VTFRU002YjhaWERTcXdNUkUySFJQUytPbHpRYUJwRzRuRlRySlVrc21S?=
 =?utf-8?B?RkVCMkY3U2dqYTYwV0Y2MkpmL1JxV0xDUktXam9JL0RVOW5QT2pYOHJVNjY4?=
 =?utf-8?Q?43O10KKWkqrGU7C+uOkRLaR7Z7PjAPkj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzlqTFR6Sk05a2xXSHJGZ2MvbmVlK1NHbDNCTklIWm1MVVpDRlpOakk3Z0Y0?=
 =?utf-8?B?OUJyQVVqMDhSY2EwTEwwV0RFSGl2ZlltVGpJV0tTaFVqMTExcGpwNU9KM2Fz?=
 =?utf-8?B?NlhaNTlTQXVBKzlEOVJ2NTZSUk4wT0VxZlF3aUlyWVVxODZtdFJJcVlqaGJN?=
 =?utf-8?B?aU5URm9hekJmZnl0NXhnQzBnMmwxY1J2Q09UZnhIYjhHZzVpQUdOak1DNElv?=
 =?utf-8?B?Wmd5VjB3MmovUkZ6eS93QmpBd3dZQjJBaWtwN0NTbGQrVDhLdGZiNXRtNUVq?=
 =?utf-8?B?cGsreUx6aUhBcU5iSzVPeXdZd2sxbkVxTWxrWEVBUzBZRUJyNlp3aW1VSFd6?=
 =?utf-8?B?cCtiK0N0V2V0RS9ucFpBalY1dEZtWk4xcXp5Z1hJRzJlMURwVjgwdE5IRE9S?=
 =?utf-8?B?V1ZJNDR0bnhmMUhPZnJKN3cxTjFnYkFtWWpsS0pSOC9uRFpxZ2MySEFGVThD?=
 =?utf-8?B?YUVnQTNqU3duUjZYVnE3VHBLWUJLRTYrdzk4UXNHS2NtZmVkZm5KTFg3V2VG?=
 =?utf-8?B?KzdLY2tDUlBlWVBXMU4xWjU5L2VWMVdqM1h5SkVjNWdDVy9WdktHaEp0R3dr?=
 =?utf-8?B?dFdacW42YVZkdXJ3bmRaZ1N0YUhuNXUyRUFDWDNMWFVVaGZ0bkNNNDgvempF?=
 =?utf-8?B?WGl1K1EyeU44aGF6VUoyZi90YkhsYmRxdXJLbnNyV2JEblYyRkJxMmJkTnh1?=
 =?utf-8?B?aWJPMVRiMGNnWXBHTmZkZFVZbytHUkFRZS9VM202QlYvU2tZelRld2l0dkZs?=
 =?utf-8?B?YTVEMjRRSlVLVE1pbkUxUVUvLy96WExoOXNFc0dBaDhmU3prY3V5RGRtemxH?=
 =?utf-8?B?cHI2TEtxd09ocU15TkNqSFFsTTNqbWZuaFdhdzZXWGVMdEV3YVBMUjIwa2or?=
 =?utf-8?B?azFJLzhWbDkxWDB1ZHZ3MTQyc2xwNzNsM0cyS2hYQ3pSeWVpbW1lZnJ3VmRn?=
 =?utf-8?B?QWJ5ak9mMmlEZy96WVNkYUh1MDN1ZUlqZ0VmaWExZ1Q1S0NaQWR4a3F3bVNm?=
 =?utf-8?B?V3F3UHU2VGxIb0YxQ2lCc25kWkZYbHZpVWNjS1VhNE9JSHZDbWFzVExmMjQ1?=
 =?utf-8?B?MFRHWUdYWE1yV0JIS2Z6N0ZPTVVYUytzdzllcHdvdTFlVnd3T1ZUWFVSUjBX?=
 =?utf-8?B?bmg3MnNWcHBNZ3A3YkpqenpnZkJURTVrbi9uWUd5U1ZqVnRGSzFDamQ1cTZF?=
 =?utf-8?B?K0p2MWtuSE1ZNDZoVU9OUCtIa2ZCb0lQazN0bWdUN3RXcDlXeHZJcytPZ09t?=
 =?utf-8?B?NE1VenlLRWdXNVl1STkzaXdhV2NTd0Zjb3NwU1ZqeGczRzF4bTltSUovQVRT?=
 =?utf-8?B?bXFKekp4QWoxNGFnQmM3QTliUzFPQVpUTXhybGFBd3A4T2hFNThKL2dIa1Ay?=
 =?utf-8?B?OFh5M1l4MENNRjZFMTRBQTY0OFpNVjRNY0t1SU9IajJ5cHhnTDByaDNyc1ZU?=
 =?utf-8?B?dTdNdm1OQzlZMC8vVHQrR0taMXR2ZFdrM0xWSHhKanNMTGx1dnR4VXRhcTQr?=
 =?utf-8?B?aXpUVlFKRFNSM1dlRDZQYkUrTVh2TnJzNlNoRnc1ZnVTaFhpSDRya01aYmN0?=
 =?utf-8?B?UFNWOWc3aERGWk5ZMDIvemhFa0YvSzZqdHJnRmhYYzc5d2JBQ3FkTDRXNlV5?=
 =?utf-8?B?NWx1dUNTOVJNME83SzhqOFBEaFdrblV5L3UwUzVGSUk2VWdmQm9MVytvUEhJ?=
 =?utf-8?B?Q29hOGdHczZ2M3F4ZUpHdlJNcTYyaUk3cWd3c08yaE1SUUxMa0RiaE1ZMlJh?=
 =?utf-8?B?TjFMTnRPbGV1V053RE8wVlV1WC91YlE5R0cxSXQ3UTZSY1pqdXNhN2RTS0N4?=
 =?utf-8?B?K2N2aGE5MnRDdUlQdTltMGNrS3NETHU0SFVZeCtxSmw0YnVLR1RSRDh4aUhh?=
 =?utf-8?B?YUU0cUVhOElVWjEyWHoyZ3BWRmphMTQ1RStqUmlRMnI3WXNmU0ZYVnd3NUJR?=
 =?utf-8?B?ZzkreCtOOVMwK0c3Unh0NElNUURPaG1IWTJjKzA0aXowNlJXTlhOMUl3MUpk?=
 =?utf-8?B?QnhEN3o5Y1BTZGNUWFFXTnlWbTc0T2F3TUIrUVRBeU5lT1EycFJxcXRQc0RS?=
 =?utf-8?B?RE94VTRFT2VBQWFORVFYdForZ0JQUU1MQ2Y4cjNyZjBNSzBkZ1U1d0RzWXk4?=
 =?utf-8?B?T1drSEQwVU1QN2JzTCtRVnBQYTlTcC9pRUo2ZmQxQkUyVzh2VGdSa3hsQStk?=
 =?utf-8?B?YXlybDBYR1c5ajFvWkVEQ1FtaCtLRm9QZFdhZE5hazJqb01ZcHhJbDhHcytY?=
 =?utf-8?B?NmNtbmJQbGFiazJHc2RZNS9zK1Q4cmd0dUtSQUFNK2dnNmdzQmVQZXJzRG4w?=
 =?utf-8?B?UUl1cEpXOFIvczZaRVpOMnllREYyTmFTZ1phenozeXBkTCtqQ2xlTEpxTWpw?=
 =?utf-8?Q?xTWT0pVDCbd+WU3A=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78909355-4b7a-4ac4-9e96-08de4ee187de
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 18:12:48.8889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMKo636Z+JsD2ec5Ag2gpZi6JLG4CMXWNuYf7sOXVfBG7h9ehshWU3i2gzxu0Odffmhmu6wzSzH1sibJjOavgLG8MR0WKrr3vuzIraqaHA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5589

On 07/01/2026 2:11 pm, Jan Beulich wrote:
> While adding new enumerators one may overlook the (rare) need to bump
> X86_NR_{SYNTH,BUG}. Guard against that happening by adding respective
> checking. The use of BUILD_BUG_ON_ZERO(), however, entails a number of
> other changes, as the expansion may not appear in the assembly produced.
> Furthermore inputs to file-scope asm() are only supported in gcc15 (or
> newer).
>
> No difference in generated code (debug info, however, grows quite a bit).
>
> An implication from the changes is that users of the alternatives patching
> macros may not use unnamed asm() input operands anymore, as the "injected"
> new operands would break numbering expectations.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Fix shim build. Use named label operand in pdx.h.

I'm pretty sure that will be rejected by Eclair as a Rule R20.12
violation (using a parameter as a regular value, and stringised), and is
a blocking rule.

But more generally...  I see why you want a guard rail here, I can't
help feeling that the cure is worse than the poison.

Updating every alternative is very invasive, and this in particular

> --- a/xen/arch/x86/include/asm/spec_ctrl.h
> +++ b/xen/arch/x86/include/asm/spec_ctrl.h
> @@ -73,7 +73,7 @@ static always_inline void spec_ctrl_new_
>  
>      /* (ab)use alternative_input() to specify clobbers. */
>      alternative_input("", "DO_OVERWRITE_RSB xu=%=", X86_BUG_IBPB_NO_RET,
> -                      : "rax", "rcx");
> +                      "i" (0) : "rax", "rcx");
>  }
>  

without even an explanation of why, is an immediate red flag.


Could we not split X86_SYNTH()/BUG() to take a leaf/bit pair, similar to
how we express regular features as a*32+b?

That would at least make it more obvious than currently when a new leaf
is needed, and contained it to a single header.

~Andrew

