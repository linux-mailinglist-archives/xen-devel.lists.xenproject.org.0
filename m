Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0FDB037E1
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 09:26:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042596.1412652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubDZG-00055u-J1; Mon, 14 Jul 2025 07:25:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042596.1412652; Mon, 14 Jul 2025 07:25:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubDZG-00053O-Fc; Mon, 14 Jul 2025 07:25:42 +0000
Received: by outflank-mailman (input) for mailman id 1042596;
 Mon, 14 Jul 2025 07:25:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LaQv=Z3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ubDZF-00053I-CR
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 07:25:41 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcb2494e-6083-11f0-b894-0df219b8e170;
 Mon, 14 Jul 2025 09:25:38 +0200 (CEST)
Received: from DM4PR12MB5277.namprd12.prod.outlook.com (2603:10b6:5:390::7) by
 IA1PR12MB8540.namprd12.prod.outlook.com (2603:10b6:208:454::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Mon, 14 Jul
 2025 07:25:34 +0000
Received: from DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e]) by DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e%5]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 07:25:34 +0000
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
X-Inumbo-ID: bcb2494e-6083-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n71OyKs0T2BmYgNGIzy3B6dOoGLbiFbz3jJQhaaAIHkiD7smi7Ltj8I8BnubGRRss0/wi+KDOiCVsZm4lFwxcByVD+tiYX+CHFGB02khybNixUzK8SgYGKiahKTZF4PykkSmRmLUlpeDRge+mnDSsxE/lskxIXft3SZrJXN71/jr4spUZkox9S1qo6KNLiPYdFLDxZmONjIsO11WTsNUSMOPQ6gEcn9OCCdOKaZRkENyGj3ydni2tIZbLXe8rDbnwWdKEJQdaomwN90UF98Z5y1je5OSuT/hgxNLZc1oIAxdb5gn1qpHavjqfuhbM0BY8SivxuBuuGVqX3U6ZFA2gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wE+VtMJXEwNlpmWTJJd4ELSY4+awdCWU1MrcgI4q/4A=;
 b=v65vGR3Qs+dcZRdGwTTKcZfi/saCW9bxxz0NIk0h1G7Dq1rTc7Gs6l0SH3LtIbQpvWVp5tER3WrzM6v05rzdfyrxQeD0j5unDUYwYJLdFPWX1YFli52I2STMBBpPDM71Viqekqod68sta3/a5eQuWN6Rr5DkkH083GsYoEWb0wEbQF0GrfixJxDwbdlUVEaIflkk7qqeelHxJ1AxVaaKHJXjb5+5fkkzJrcCV6lQF7RAoQsLOwHUJAgSpxTJDilNrsQmvGIhMMhP/GrzDRgnjP0nh894pZjWuhrIE9Ablk6RUwzWUMhOGmllfT7aX7RzrF6suzOIorMuoYefPF+V+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wE+VtMJXEwNlpmWTJJd4ELSY4+awdCWU1MrcgI4q/4A=;
 b=oc80nqtjl2zPa9HtaaH2iMSlsCPKWi0vJfXqfa00XoHDR4BFKPqv7Y5p+oNI5HHO7A8A/l5CVsJufj/kX3171CQvR0BW0kEp8baQ6Ns87KWLzU3p/5Cs1JAHQht8G7XD6+IGBZTPTD34ZqtDmsjdGgxL6ABMlX2hLZxIsiU2LPo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <fc167c1c-def4-4490-9502-6b5d388cf795@amd.com>
Date: Mon, 14 Jul 2025 09:25:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm/mpu: Destroy an existing entry in Xen MPU
 memory mapping table
To: Hari Limaye <Hari.Limaye@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
References: <cover.1751464757.git.hari.limaye@arm.com>
 <b3ed60f28d7234f4091196d7bdab8c9ae12ea6d0.1751464757.git.hari.limaye@arm.com>
 <8b8592ea-2508-435f-994a-826070cd68ff@amd.com>
 <AS2PR08MB87459AB8D0BC1C09D20984A4E24BA@AS2PR08MB8745.eurprd08.prod.outlook.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <AS2PR08MB87459AB8D0BC1C09D20984A4E24BA@AS2PR08MB8745.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::7) To BL1PR12MB5272.namprd12.prod.outlook.com
 (2603:10b6:208:319::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5277:EE_|IA1PR12MB8540:EE_
X-MS-Office365-Filtering-Correlation-Id: 56b4638e-86a8-46ab-b618-08ddc2a79e29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2pSTXNVYlFidDJxY21iaGxsK1UxSDdvd1F0aklkbFF6MnFhZGtvM0h2N29i?=
 =?utf-8?B?dGFNakRxeVZrT0JwbWVWTXhQMVRwUTBTTDJONEFZRnJ2ZWdjK3RLVmFJSWxR?=
 =?utf-8?B?dlNUMi9NYmIyUEg2NFJNUzdTc1ljQUVMVXc2aW54bFpUL094VE1Oc3BFM3du?=
 =?utf-8?B?RnUrcWpJNCtHTXVwSFk4Nm96blQ4cHdJdW9CM1Ftb0ZpSWJJRmg4c1hBUmJo?=
 =?utf-8?B?RlJHL0V0YXp4MWZmQlZ2bkpyUXN3RWRjMjlpR3pDS3ZoVTdyY0R1RVpLV2JZ?=
 =?utf-8?B?UWhtdkFsSGxsUDh5YWh6VU50Mys4MitmWTF5Tlc4MFRDbk5SR2N0bVdYbXpk?=
 =?utf-8?B?aFJTRXFkZFpIdTZydGtKb01ZSXFGYkxJVmJTT2VaSm1MWUpZRnRsQ0lSRDN6?=
 =?utf-8?B?OGZ6L0dwV0FJTzNWZmFhRURMcFl4c0hjVDlra0wwbWtYVzloaEdyT2hRWE1u?=
 =?utf-8?B?c1QyREQ0UjFoTHpkZEYzNE1TelYvcUVwT1l0MlljcnhMc2tGTWpjQXFTRXVs?=
 =?utf-8?B?SDVRdFhmNFRJa1c1bXZ2K3hiNnFNY1dGQlk0YjlDWktTbTRuRmsrbFZNSlZw?=
 =?utf-8?B?cW1VK3RQWVRTRE5qaHZnT3VVbmo0NzNDdVl3dERGV1FyazZGV2x2eEh5d1cy?=
 =?utf-8?B?YUdCS2NTdDQ2RVhpNHI3ZDdjREZhdVhaeGdqSnlDUjk3czdINjg1MEIvUnRn?=
 =?utf-8?B?bWV6MER3REVNVHdwcGtISTd1ckhtcmN3Y3czOGNDR2hMNHdKb0x6UHMvMHlU?=
 =?utf-8?B?LzQ2L2tweEdYN25DTC9GZjQ0RzcrNkxvSUZkSU5BL1Z5QW5SYVRxTTljS3V6?=
 =?utf-8?B?RlgyUW0xOE5oMGdJYUVlWjRCbHNyZUpFeitoTjVDU0ZjanFBRnhKWGVKaFJz?=
 =?utf-8?B?UVAyUmtmQkFSd0gyK2R2VTZNU09YaENCWVM2Uk5RNUEweFBZaERTenAxOWNx?=
 =?utf-8?B?Y2lMT2RySDRkNFpic1p2S1JtYUQ0bExNYk12TVAzWHhuVTk3MDBHbStLdklu?=
 =?utf-8?B?Vi9RM0QzdUF6ZkJETWtmQWdKaFFPM09zUHVOMGtmMU92dVdERjhIUzJxY2Qr?=
 =?utf-8?B?aDNhWEppTEpNcUZZVndMNS8rZm1BRGNGMi9NTjN2RVU1bkNFczNIVzhvLzVy?=
 =?utf-8?B?WGRjNUFKNWJvTkVuRVNRQU1RK1FmeTdnZm0yVVhZc0hQYlpKaEhXMUtmUERw?=
 =?utf-8?B?NTNjQ2tGVUNodVdobFQxL0k2SzdZeXJxS3gzUTlJNDlBazU1VlRla0huMVpq?=
 =?utf-8?B?YVRMbEptTEI4dkVZSzNBRGh2K1licjlNVXJ1eDZqWFJzdXgwb3pyMmhsclhi?=
 =?utf-8?B?NmZ2SzA3UG41TmEwbnZic0VjSkZ4Y2lIVVZaR0hEYllJSWtlVzBMejJSQnNE?=
 =?utf-8?B?T2RZZi9Ickgva0dlSzVuNzk1WXdaRlFOM2VwZVZseDJqRlpoS2p5QXN4L0FZ?=
 =?utf-8?B?ZHNkRkpUZXZOSEFnUGxQa0p1d2V1TWFqQXd2dExBMUtVYzB5eVpIdzlVZGR4?=
 =?utf-8?B?c2FuSWM5WTBYTHZWY2p1YVlYWUcxdG1oamJvQ21FY3NRNWV1WkVSYzNjTVpn?=
 =?utf-8?B?RkhVbHh1Y1g3c29NdklKc2I0a3o4c1dlek54WmxGRXdUNmUyclIyaTc4R0R2?=
 =?utf-8?B?aXBpUmcrT2Fha2Zsb0hQc2VzcGlJSSt4aEhyVlBOSENxZ3RZaXE2MVhHakZj?=
 =?utf-8?B?Q0Y3Q1hxankraFFKUmI4TGM2c01hbFJZTW9XU29GNWdqMUdId0VZTVZUL1BG?=
 =?utf-8?B?VDdZRS9NR0RJaktkL3FLUldta3NBNUlOM2dMbXR5VkNjWEJMbGMxdTRRaVRa?=
 =?utf-8?B?Vmp3SThNVE11T3hLWVJPbUZ0MDhqYTkxNFI4V0x0WGdUNFJhS1hCaVBYZzcv?=
 =?utf-8?B?WkVKU2ZDQXZGTG9rUFlELzhBMlBrZVhTaVByYWk4VUdmYlE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmZYNExITUVsQ3pSTVhjZjZHdzA2dmU5REd3dW1vN0VBbnlqd0RuZGc2M0Rq?=
 =?utf-8?B?R3prTjdLcldlcVFsV3JaTFVzcmduNEx6c2RVR3lzeWQwUVhWTTJGTE54aHRu?=
 =?utf-8?B?ZTNlOUwzN3lMeTQ1OWlObm1zY2R1QjdyeVhaL3l1MkNkQURST3FWQUJweWdU?=
 =?utf-8?B?N3BnWm5aK0VKdXFsd01aQ3dDYncvOERGeHV6Z2FNbWg3eFp5dEVJTjcyRC9z?=
 =?utf-8?B?ZWpNaThLWFBSelhzUGY2MU9MWWtlWllQdHFiUlpST0VMSFU0V0R2STFLaUpm?=
 =?utf-8?B?QW5KRWlyMlprNHFzdnp2RVpIak05cUJOKzd1bGh3TGRYTHZtZ25MUWlQZlR4?=
 =?utf-8?B?Y1dtT1I1UFhmcFFMNnBhOWJrTnhteE5jYklzaTZZWXhabCtBdUxkMUdTVHQ0?=
 =?utf-8?B?Wjg5V1lOUTgxVnQwUHNQcEhpTHAzemwvd21YVEdEWjlzbVNZZ1RVK2xMMnRa?=
 =?utf-8?B?SDZCNTRUdVZ0QTJlcDkxdEhHazdJb3l6eFJXZnhWSTh3OGVrWFhkYTMvemVK?=
 =?utf-8?B?S0J6SlNlNHJjdmhwUmVlaTBncWxSYzJMM2h4V01TOG1ZQy9Mc1RxOEY5TjdW?=
 =?utf-8?B?SkhtZFNnSDlyb0xvRWVBVEgwS2VlbUVYQm85OHNLU3IwME0xUGhleVhkZkUx?=
 =?utf-8?B?NGxqMXBnT2ZoaEtQWlBSdXpVSDQwSUtUTHZYVU1OM2dNdDdZZnN1Y2ZuWldR?=
 =?utf-8?B?U0hNc3ZKV1dEM3R4a3BKQU1BNFpjdmU0dFYwTUxPczJpQkg3TGgzSDZUY1hw?=
 =?utf-8?B?dUpOS1F4eXprTmZybGxnbG5GRytyL1NBK2VjNEIvOXZ1a21paWtBci8yLzNI?=
 =?utf-8?B?dXNtMGgrczBvL3oxaDhYR3JaSEFTRjU0QVpqQ2FWcE5FQ1ZwZjRQVHUxZU5N?=
 =?utf-8?B?UFNUclpXcEdleDFGSm5NeTk1SUJ2MWw1aVN4QWJ0Mll5d3p0Uit5UDkxNHcy?=
 =?utf-8?B?MWNSaTB5bnNvWnhyQU1xUSs3T3MvWU8vWWZCTmFlME9mZ3h6cU1YbUNYY3oy?=
 =?utf-8?B?Nk5FYXpxVlBJUUhhUW1zL28yTHJ4RUlXL3ZOaml2THkzSU8wcWw2UE9hNkhn?=
 =?utf-8?B?QjJBcUZFdGJoRmhCRXVsSGQ1Qzc1azBkVFVJL1pzRzZWeU11SkpCM3BORnor?=
 =?utf-8?B?Z3pTRmUrbHFSYmhhdGRVUzdtTU5oZEdnTFNZbGFZK1AweTZ2S3VzbEVEUU1G?=
 =?utf-8?B?YzQ3VmNtNnV5VkFHMW8rMnR6OWNWQk9ObytHM05WOCtIRFNQVUlnclFNc2R6?=
 =?utf-8?B?aGZwYWMvdFVjYnRjTGdtU3NVQ1JGSTl0NEpwVURzOTcyb3F5L1hBMG0vdHoy?=
 =?utf-8?B?OTNNODlwVlBVbWloOGlLdmlNTk1KSU9lYXJPL2RLMXNqU2syazZySTJKeGVF?=
 =?utf-8?B?SzZuZVp0SkZrUnZuUUxuSHRCcXRYSE5UVEV4K29aK3dPb2czRytEc0RQYWZX?=
 =?utf-8?B?L05ZM3dHTHg0ZjVkWnRKWHVXNFpoWE9uY2xtNFROMklwWUtXOGpFTmZ3TzY0?=
 =?utf-8?B?Tmh6bUtXK3RtcWFoOGlodzZ0Y2tPOSt2UTUvZUJNNVV4U0lzRzduZkZYc2FM?=
 =?utf-8?B?ZTQ4VnRmWTRZUzVwN2RCYnFIVGJONWNiV0xHbEIrNzVwQnB6QW03RlVaYXhJ?=
 =?utf-8?B?V2s2T3crNXZpdlRheEMzeExrWitVZE0zT2xOTVEzcVVlbnI5SUJWTk5ITWs3?=
 =?utf-8?B?UXdXSlc3dVZMVzVORlVyaFltaGRKdzVUSGZKbXpua0tNcE8reTdaZS9LNHpE?=
 =?utf-8?B?Y1ZDTkl3Z3hTV1pBV3JhRVJTYTQ2VzBSQlhqd3NzY1dEMTJXTkc0T1cwYS9s?=
 =?utf-8?B?Y2N2NkN6M3JSODRSOWlkdkJGRkxyaGxqZkV2NjBabU1wbnlDZkRFNndkSnUv?=
 =?utf-8?B?M3NZMVI5Sk5hcngrbWNlRE8ra3RyQ29hTWdmbXRPVmRkKzA0bWNKcmZoOW1B?=
 =?utf-8?B?RFJXaHBadXJOa3AxcVlyNCtLZGU4dUhSUVg3WEZrb29MNGNnc1czMzFLS3Jv?=
 =?utf-8?B?V2cwYyttTExrcFVJZFRWYjZuUmZJZ0Zac3pXdGxjbTBNajdhb1BmVFJFV3cz?=
 =?utf-8?B?Zm11aCtxbksrcWVyOCtDemxicEhrcnJjNEhuR2I2RlQxRDBLOTlQYy9CRXpE?=
 =?utf-8?Q?MgVQ1IRlGZzyVpYMx/tWa4eYa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56b4638e-86a8-46ab-b618-08ddc2a79e29
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 07:25:34.0120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ofEahom1mUj72b2+B2WwYs5MXBfUxCVy6qO3jcPb5byQr/qyNR9+SBANKSjF7EKS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8540



On 11/07/2025 08:04, Hari Limaye wrote:
> Hi Michal,
> 
> Thank you for reviewing the patch.
> 
>  
> 
>> > +    /* Zeroing the region will also zero the region enable */
> 
>> > +    memset(&xen_mpumap[index], 0, sizeof(pr_t));
> 
>> Is it ok that for a fast case (i.e. 0-31) our representation of prbar/prlar will
> 
>> be different from the HW i.e. xen_mpumap[index] is 0 vs only .en bit of prlar
> 
>> being 0 in HW?
> 
>  
> 
> I think this should not matter - there is nothing reading registers directly and
> 
> all the decisions are taken looking into xen_mpumap.
> 
>  
> 
> However, if you would prefer, we could alter the logic here to only clear the .en
> 
> bit in xen_mpumap[index] in the fast case, so that things remain consistent?
> Alternatively we could always directly zero the entirety of the registers, but
> then we would remove the use of the fast case entirely.
I don't have a strong preference here. I think we can keep your current solution.

~Michal


