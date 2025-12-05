Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A79CA8ADA
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 18:50:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179363.1502897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRZx1-0003Mi-9X; Fri, 05 Dec 2025 17:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179363.1502897; Fri, 05 Dec 2025 17:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRZx1-0003Jv-6A; Fri, 05 Dec 2025 17:50:39 +0000
Received: by outflank-mailman (input) for mailman id 1179363;
 Fri, 05 Dec 2025 17:50:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K96r=6L=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vRZx0-0003Jp-C3
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 17:50:38 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e74a7ab4-d202-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 18:50:37 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA3PR03MB7690.namprd03.prod.outlook.com (2603:10b6:208:50d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 17:50:33 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 17:50:33 +0000
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
X-Inumbo-ID: e74a7ab4-d202-11f0-9d1b-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4X5uya2XtbROaQoB6kAjsCAV3AObB2uiuPr4Ag5DVWrELtlM6hglM3/4Dsi3+m1sYGYZQSiE0fnzY3yIRU2JJOLryFGOn5F92yHHTsEbuWDT0k9lqallgXh8+35hLwyjMqp4HjfZFtuFbxD0a4U3RMZ7leIDTX6xvWRuir8dXG5yrJ7K4miQRad9dZEwL3dzSyTR5+at0CY2qQXWNduFcUWtFIhz1tM+wtvleNVhVki14lCNsUqj/cFE6ZnzQZd0ofT+62cv0qwcHHva1Rjs/oYdtWgRKObb6WkpFjNHApiqEFiM47RAYSX+gar+gwuiwbnXveodgpnL/FJlXd+3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DysLUJs5zDHvBbYGxogiknpvqHBS4m/tiJb+mQaTGFM=;
 b=X//xbp+xQg1Z+RygukALd5DOAlBgnanL3PQ7l6VYZpm/oWvIniIZim9jfbkH95KdXLsLim0zoFJHWGppPrUN/FO7jVh9VDQjG77Hab3lu4jxUVVj6RQQZueteIX6MvYDL05hKFMl1zm0IcRH9/mdih8WyYgKllNz2sCKSVHk0abvmal975KJ+oP8hVIMZO/4bpITonDpdai+sXDyMkwdn6aOO1DqeWneuLKDtMYyyUYxxnT3ylApRcOS9VBZKS7YR9kf4PO9eMSE3sf3HSKHwDReebIWvZI3EugL2TnJ+7g8SDmkyd8kF4P2ENSsGPmy70e9ho+eYySiYE0E2BE0Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DysLUJs5zDHvBbYGxogiknpvqHBS4m/tiJb+mQaTGFM=;
 b=qmMOWYybLE+jEIvhX/sM999JTKsrWqpt06efh8cz0m4mHp+y5sskFRQn3p8LF2QL82GppQLwpsdyQQ7K2dAwKKcxb3LpM/vbcVd6shuG30bAKfFswkmT2kdW/6TOqZ3ROmIJQfPJe2hlBnld1ddK7S80xXPFPP2M6phiEtoixhU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2dba3524-3386-4dd9-ae4e-fac0fad46623@citrix.com>
Date: Fri, 5 Dec 2025 17:50:29 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Frediano Ziglio <frediano.ziglio@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Frediano Ziglio <freddy77@gmail.com>,
 Demi Marie Obenour <demiobenour@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v9 2/2] xen: Strip xen.efi by default
To: Frediano Ziglio <frediano.ziglio@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20251205160942.46694-1-frediano.ziglio@citrix.com>
 <20251205160942.46694-3-frediano.ziglio@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251205160942.46694-3-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0012.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA3PR03MB7690:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ba2ab3a-5151-442a-b856-08de3426c9e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUNRY0VuQ2RJdHA1NG9sZzlUTktxYkRCUkY5V2svaFVKOFR2MHpxSDNNUFQ3?=
 =?utf-8?B?elZhakJNV1E1aUJGVzQ2TW1Cd3dMY3d0ZnpuOExxNjIxU1NNT3VTYnViTUg1?=
 =?utf-8?B?d0tjM01ncDZuWWtOcm5kVHpZRkw3WmNaYTdzQ0xBdDFHNEMwTFBhdXpRTk1n?=
 =?utf-8?B?MVhPTUNlRUw4ZVo4Nkp3K0RabjJsbUt3cnRyUnFuUmhPNWUzVmZhZlZuTmx3?=
 =?utf-8?B?THJpYTV4R1l0SHhCUDdjYW1TWGhnT0EzS2tMTzh1cmYzc3RSaEVnTG4wQ21Y?=
 =?utf-8?B?bGI4Z3VKaFFBVEJxQmppYy9nMjBMbHVzUjU1eWdHSWNiVjl2NFBGblMzaktO?=
 =?utf-8?B?UjVzTzR1WkJkZFFHR29YMnd3Snh0VXo0ODZqU2ZVb2d0MCtKZjZqYWlUa284?=
 =?utf-8?B?YWpFTEhPWTJDZi9sbDNBT0JMVFh1Ky8wVGYwZzlNeEVuSkVpOFc2WDhCc3dv?=
 =?utf-8?B?S0VZeHUzc0FyRHM0djljemVuS01FUjZGeHl0ckc0SE9uWEpVdkVvUVIvczdl?=
 =?utf-8?B?eE05eFdmVzBzbUFhbFNvUkFHd1p1T3BzaWJMNklWekluNjZ4ZHdQbWxJOEpY?=
 =?utf-8?B?RHZHNDJUNlBYTTFMT0xoeXFJcUxTenE0N1N0WDhIWmVmdGxyWXl1R0dmZ0I1?=
 =?utf-8?B?akRobGM2clh2bDk0ZURTNWxLRTJDMGl5Z3VCV21sZDNLaTRjZ3dQcitoSDd2?=
 =?utf-8?B?M0xBR1lOS0lRaTZhTFFyb0tSZTlmaUlDbTR2ZlVsV2k2emE5UjRhVHJhMjAv?=
 =?utf-8?B?bkV2NE11bjdZcDFTVXN2RXZlNzU4Y2F1c2dIc29idGJ0SC9Fc25kTk5zcXgy?=
 =?utf-8?B?eUdhMERUaURKUUpVMFVweEg5eUd3YVh4eGMzWHg0b1JVbytiLzNYaG8vN2U2?=
 =?utf-8?B?ZWsvb1ozeUZZemZ3anNqYzBDbXRGdTZ2bGxPTTBuVXo2TTZ5eWlCbVc5ajdj?=
 =?utf-8?B?OFFqazVremNZa1hHcGdYek80VFp4OEd1cUI0Q01SUWVqY25WeW41bUZLd0J6?=
 =?utf-8?B?R1hiMUFGTlVBdFNaYzdoUmw3QWZGQVpoSHhDR2E4T3I2T3FFNjRmUUxaWjNs?=
 =?utf-8?B?T0lINTErd2w3Um93ZzlrOUtQei9GUXU1MDZ6UER5dURsSmk5K0NqZ3hHZ2E2?=
 =?utf-8?B?Z1BycWpSbXZBV3ZqUTVjbTg4ZGpGdm1RRWhud2g3RTFtdjAvcWdzQld2Sm9r?=
 =?utf-8?B?Vm1xWmNySW9oOXBsQ2RoZ3MxQVYzaWxaTjFoYWZxUUhqSXI3RTVmV21OWllm?=
 =?utf-8?B?WUViMVUwN1Y5WVU5S3Bld1JLTGo3L1ljYU9PdW96U2ZqRjZybWtRZTdkR1Ri?=
 =?utf-8?B?NlVya0RPQWQ1UG0rZXAyaVp4WTdNZXRwVjlGam5NdXUyLzJXMkZxRncxd3Fn?=
 =?utf-8?B?aHBPa2ZwSjhrNnZiSzd5RHUxRTFwK0NRM1RYQkJHMHFzNDhES2NVMmdNQjZw?=
 =?utf-8?B?ek1kQUYyRmk0eG1lSmowZ2VtTTQySW12Z0hmdVBiZzdxMTRnYm1RVXN6Q0hn?=
 =?utf-8?B?Q2pQaXVEcGFOTHVSeVdYVDBUaFlOaEhac3lFaVhlTUx3bk9vSDhBZkRrUnR6?=
 =?utf-8?B?S2MvMldDQy8ySGswOHRQZkxSSVlvbjR3VytvTEtERTYyVjJmYW1TMDB1d3h2?=
 =?utf-8?B?RmFvODRlZjZyYWNGamxRNk03YTFjcFlFYzdoNGRDV0V1UVVzc0FYaktUdm9r?=
 =?utf-8?B?ZUpCK3Z2OEJQUVloZG4zR1JUZmZqZ05kWjRQeWU5Q1JXYUVmLy9MREI4eTk3?=
 =?utf-8?B?dlVVMG9CdXk2V1J0Rm9DenFUMHdZV09wVVJ3Nk9ET2lrQ2lNSzFwRXNNR0xW?=
 =?utf-8?B?SXkvV1Jzc3dMUUpLQ25YWXVQa2xUT2dLTURzWmlxSlBJYVpXQmZBaUQ5aVRn?=
 =?utf-8?B?RUd0bUN2cFRsQkZaTDRvdlBFaWpBOUtNSElPQjNOVCtLQ1kyTURLaHRSejN1?=
 =?utf-8?Q?8ZBBTdmgBgkLjEm5gSt4dYtTlAR3TB4S?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUJjdHNnUVBhZWVuSUhJNzVsYlJTOEJuYm90c3hJNHBXUFJYUmVaTTYrejFi?=
 =?utf-8?B?U3NXS3UrUjhCaDQyWVJwNDMzOEFUUzVyWHNaZFczS04vZ2dwRGwxcDdicDJk?=
 =?utf-8?B?THRTTlY5S0w2dHorL3hTZHBkRmNZclU0UGRxUUU5RHBoSlhZb3czZlJKUTNz?=
 =?utf-8?B?emV5UDJVaElsNHFGOXA3d2lBWXhzVXl0akUxazFCUHNQenR4UVAvTXVrQUFI?=
 =?utf-8?B?Rm9nOWVMMFUxTlM2cGlsRXhiWW4wcTFZeldIQ0diSDUyR2NyN1B0REtvYzNy?=
 =?utf-8?B?aDRtQitISHBtd3F3ejkvQ2xKL3h3K000eVV2L0MyK0NDb1h5MFVmTVpJQ0V3?=
 =?utf-8?B?UDZ2WFVPNUZLSkhIaW5nZVlqMkxqcmNlYnd0T3BNUDE0VFZKaHRBY0VKSitG?=
 =?utf-8?B?d1dxbmpxNmlQSVVpQkovd1dPbGsvSTJ4ZlNEUEVRYWtjOEZtYTcxT0wwbmwz?=
 =?utf-8?B?NTczVHd2cHhUNnhjVUlaWnVwYmlqcXNRV3FreDFtaDB1WjJVd2FMS0MraEcr?=
 =?utf-8?B?Ukh6dmNRVEZMVVRJUWFidXFVeWNkMkE1UGE3ZmFvSklkekFrb0tPQWgxaVJp?=
 =?utf-8?B?ZnNtbVpFd0JKczJ3MWZ3ZWw0dHQ3djY4WDNNb3BtR0FVU25uQVYyN1gwQWJn?=
 =?utf-8?B?WTZHenMwOUhjWTRuWDNvUWdrS2hEUCszMkJ5bnJoemc0U3pveWhnZ3o4WFBN?=
 =?utf-8?B?cUhGNm9UcU1wWFM4MTRNQ2s5SjcvY043eE44Z211aHBBNmtPUHF1UEhPbUR3?=
 =?utf-8?B?cWdlM01Zak9WN0NZZTBGdWdRbnh5N3lZbEdFN2NFS2xPQXdXUjh1a1k0Ym5o?=
 =?utf-8?B?VEJkMUIyK2ROTytkRG9rdVBqSHNpcjlQYkpVTjYyL211SEg1TFNTYVc3WWQ4?=
 =?utf-8?B?M3NEd3ZEeTlUbjlxZnhDOFVPK3QrUjBQZGlFaVNXYnRFTzFudlJjcjdiQjVZ?=
 =?utf-8?B?YUpMb09rL0Z2RWlRaXRFRS9tWnpxQ3ZUWmZLdFlOOTZZYmJYS1Y4eHBDdTF0?=
 =?utf-8?B?UFhhN1IwN1RxTVF2c3I1TDUrSWxmbkFQYWFzaG9jbWxtaTBzb0NxUjVHV3FT?=
 =?utf-8?B?NUQyNENFYmJ1eklscVlYL3dQdnh4Z3F5UW5lR2lvRzVwRmUrNFZoM0hMeDEy?=
 =?utf-8?B?SDBOY01QT2N5Nk1TYk9kRkNBTHR2R1pxV3JNNGdTNElVbDR0eitQc1c2Vkdu?=
 =?utf-8?B?YS9QUnE0dmY1TEVWb2VHaEdJeUNmZ3FNUFlCemhML2dTTjNsa3loN0xhakRW?=
 =?utf-8?B?emJUbEw1ZlA3RzJGRDNxdXJZeVR6dDVvVEVLendoY0FEMUhlVXd5NE1aSGx0?=
 =?utf-8?B?OVZtWTNDb1ZOekJON2dlZ3FmNUhlbDY0Q2tCVzU5c2tFbjNzakFjdDdlVUY0?=
 =?utf-8?B?RmRSZ0JOaU9Yd1JVOUQ0bTlVUFlWVS94R1dxZUZzbm5sYkI2cjI5M3hqZzBH?=
 =?utf-8?B?VjR1Y1Y5SE5kWk9kNm1rSW9yc085Uk5uenRRWGRoQVNKRkJFNFpGTGRYQTVa?=
 =?utf-8?B?N0pWUW5ZODZBamRHMFg0TGhybzJDekIyd0p0UGR1aUU3WitzWjdubnJpNUZw?=
 =?utf-8?B?bk1YQ3dsWHBUYWJQYVFHVzRUb1A5ZmJ4VjdERVRpQ1ZXRlJTaENwd0FoSHBQ?=
 =?utf-8?B?RS9YQ3NzdFY4bFRwSkdDa3Q2ZnVkTjBjOXNQYlJLcUdVMit1MlpqbUxneU8z?=
 =?utf-8?B?OTlsR214RG5LcDZPcnFwZUQ4MS9RTDNtdHpwVkpvZ2ZJb3ZVVXBxdFkySzdY?=
 =?utf-8?B?c0pnc2JEaHZ2SHlXc3V5QmFQWmpJQllFWTJzTXEwL2tOeW1lMmJSQUR2Y2k4?=
 =?utf-8?B?QWdJWkxhajdwS3RiWU5RcnN1YXVTSkowVUtpdHUydDNJdEhSbkkxZUVCWWU1?=
 =?utf-8?B?d0VjMDh3YWtkU0srSWRzUzdrWWM2bGRmS0V4djA0eDViaDRtTFlOOGQrdTNM?=
 =?utf-8?B?MGVxZlZ1WkhwYWpsQytRWWtLdFJMSk93RDhyTkVFOUIvNE9wWHdYVEJnV2Nt?=
 =?utf-8?B?ZnBUeEt1b2VNcTBQb09laTJSOC9vdzczeHE2ekU2RkY1bGN2TE9XV3h3QkxP?=
 =?utf-8?B?M2ZFK2ltZUJhYnFETHFFdmhwbXEvQy91YVZiUmRmSno3cFpKUnlzeVh3OVRK?=
 =?utf-8?B?QUhXNlVybCtORmhiNDU4L0phcDR1SlpFZUphamcxV2NrazJSNWV5V09zTy9y?=
 =?utf-8?B?bGc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba2ab3a-5151-442a-b856-08de3426c9e5
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 17:50:33.5308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EvcPPisXq0y5LZTnsi3tpApF2YqmR9oS9/g+xJ1IdAcX3ul+o5FOlDycdCBo1vJ3m3WgasDrmmNXwh3j+I532HJ8vQO6s2292MX0oCW3pGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB7690

On 05/12/2025 4:09 pm, Frediano Ziglio wrote:
> From: Frediano Ziglio <frediano.ziglio@cloud.com>
>
> For xen.gz file we strip all symbols and have an additional
> xen-syms.efi file version with all symbols.
> Make xen.efi more coherent stripping all symbols too.
> xen-syms.efi can be used for debugging.
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

