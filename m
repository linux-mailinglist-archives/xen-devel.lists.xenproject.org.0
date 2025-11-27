Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D16E6C9005A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 20:31:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174347.1499294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOhi8-0004jt-2y; Thu, 27 Nov 2025 19:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174347.1499294; Thu, 27 Nov 2025 19:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOhi8-0004i1-01; Thu, 27 Nov 2025 19:31:24 +0000
Received: by outflank-mailman (input) for mailman id 1174347;
 Thu, 27 Nov 2025 19:31:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jSjm=6D=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vOhi5-0004hv-Oc
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 19:31:21 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a575eead-cbc7-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 20:31:19 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV4PR03MB8258.namprd03.prod.outlook.com (2603:10b6:408:2db::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 19:31:16 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 19:31:16 +0000
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
X-Inumbo-ID: a575eead-cbc7-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HrAFANMoUXJRyqhWz9+CDRGZb9xRMUv7k1eoBFzIDuatEp7aCGxIlZpeKJbczBBbXVLB4Px0h9eBRwggLp95vbv1w+PAKs1UpndMjABzgOXuQXtTPsoJ3MWiSBr4T5Yt6/fai/rbOK9Jb8A7KMetGWV2W6QCzpv/0Co9yAO5bHRg78O5b9OncCm0WzZAuPYgLW7eskrWkxS1SiGkTebzvQz14eEYnSDzD3CGZ+bCuaCpSYTa5Gn1a64AsmzjlXOn7afE+CEl6U5Itl9B7lKHZcUgNyg4f+2EKPFMnQx69NuKHZZ1S2iP8UNHD7fnsFWPJ/58O7baylgp33VOShBqpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wl0y529pq9n3omXwnY0iihpa3F18F8q7jdffHawZgDI=;
 b=j1aV6kc2hWP8X+6MDk82/261ukUn/tE+ug8pkljpNW2Z+buZBBMo8337ZbntLymwwOqsQ3bw/SZmUsQ35aG3IhXA8w6SyFvGhrzJvaR5OiX7a1OHJr4WwRxjAOVPnfeehBxEW0Mttr9ZSJBmnqlhfBfQX+1/wUjNcJbs7gZnhgQbh/Pog6RtnIrSSuX7itMleTigDHLF5aniM00teQ7JWNEHzpmypeln7/bjQaAUtUDLFX4ncAuxy41eRu7rpLYBT/qhLBrRsHxpeLTn00erQxyUtBhFIcDOPGSNPh16HwWAbpPTClqC78j8NS9gNeLBr1OSZWu4ZQPsRckxQH/3Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wl0y529pq9n3omXwnY0iihpa3F18F8q7jdffHawZgDI=;
 b=XOAMAz+KH76Iuw9pqAWhkKQU7lXu+R5lrJOHfopZ/xbhZkfh+xEIncNddsO3kC47TE3IqosKKIZXHWwELs26+dAvwAmR1IdN70hpDYmVR3zW3ld7RzGG71DXaYEl3t17fKYgMAiQlLbP3p0WrxamCs4jgn6uLUiHkRQLdHmxXZk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cd3bcac3-8889-4300-a488-b84963391c01@citrix.com>
Date: Thu, 27 Nov 2025 19:31:12 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH v1' 8/8] symbols: check table sizes don't change between
 linking passes 2 and 3
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bd689f02-3e6b-4d15-aa1d-d757a9ee54a8@suse.com>
 <94f993b2-93f4-43a5-a502-da53b810b201@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <94f993b2-93f4-43a5-a502-da53b810b201@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0050.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV4PR03MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: 30c8a97b-2264-43f0-7963-08de2deb8860
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWtXWHQ1RFBmZ0tIYVFtem4xZmZSVk5za3hyYVNtQVR3VWN1SXpFWXZ1UEZF?=
 =?utf-8?B?VjV0M0pLRjlwNXFNcGcwZmtRRGd5NGlLTGMydjFKbFJHK2srNGpmTlFnR3hK?=
 =?utf-8?B?Mlk5YzBXdFNQZmtoR09DVlNBTHVvemd5NzkwQUNuSFAyOXlyZEFxSHhVdEpJ?=
 =?utf-8?B?ZU40MWtYRThiMjNwQXZLOW4wTDhqckVQTmdoSGFLNDRuS2dBcitSNHhqTXV5?=
 =?utf-8?B?TngyQWZabVIrUlRGS1h5UjJSaWZrZjYxUEhzNExscytVV3dMSkFMOWhNUjRT?=
 =?utf-8?B?M29OZDc1OXZYaVNHZFc3Y1lJd2ZVRGwvUzBqV0JjT1ZBdVlpbHFPNURyRkVT?=
 =?utf-8?B?aFJqbDcxOGlFMklHZ3VhSjZ1b3M5NWpJTkpIdzA0ekNMUzNSVU55dlJoSnM4?=
 =?utf-8?B?L2tMWkcwQXloTVhpWDhWTldVbGRsbWlHYUplM0lYQy9HNCtYQWZqVUFOVDJ0?=
 =?utf-8?B?dUpMdGx0bmJMUlE4OHd2YWk0RkhzOHlBYlFUOVpSK29JdVdnRjhER1gxaThB?=
 =?utf-8?B?NjlwMHNXa09QblNoalR5Z2EwK3Y0MDdFRGNVc3EyS0FuTjZDMTBFUVV4emtH?=
 =?utf-8?B?WDNVdDgrb0g3Yys3bm0xUS9Ed0FnTTdTUUJhTUxST0V1ekVOMmQ3bjVMT1pw?=
 =?utf-8?B?YU00S0Nja25JN2dvRVYrSU5RSDJUYjY5Z1ZDRWVUVXR4ZG5PaFRwdCsxMUhQ?=
 =?utf-8?B?ZThFdkJ2ZlJ1MFR2cGFMUGJmSjEzdW9rZG13YUN4M1AyYXlRckFUdzZQUFY0?=
 =?utf-8?B?MStsWkl0eVowTDFoNURuNS9aQVZ2K29SeFAvMXEwd2t6TTQ3dHA4M09iRVdi?=
 =?utf-8?B?RlFHQ1BNcVlUTEpUS295cEpTWmJleENjOWk5UVpDcmtlN09tTVQ4dVNwSXZ0?=
 =?utf-8?B?d0k2RWZrcXFnT3ozaEw0eVdYRDhlbWl5OXVOUi9Ea2RJbHUyL2lCQjR2N0Ex?=
 =?utf-8?B?bU12WnB5ZkZLeU9TbHJTUDdaOUlRbmV3WEZFTkh5R3drNmdqelc5UGNFOVEy?=
 =?utf-8?B?YmlDSjZmQTVpWTRDUmZBN0drMTNGSXYra05veXl6TXRFKy9FTFA2OVNqdzBX?=
 =?utf-8?B?U1lsemYvUGxTTUhkZG50alExUUpnY21sOVdBVGZrcjJPc2JXeitRYUw1ZlBB?=
 =?utf-8?B?V1VrNkpjVHRXbjFBNWlyRHFFZld6eTgvZ20vcWJTZlU2NStKSTBXbThWMzIx?=
 =?utf-8?B?RGUycFA1bjFlZkR3bDN4c1R1WEt6aDB5aWFkRjBJWGl2ckpTTDJkQTVYOW0w?=
 =?utf-8?B?UTFNZER6dTFTVWhJTGk1cGpmWnEwWmpVaDJocjlRNHpsNEhic0hDWGdjN0xi?=
 =?utf-8?B?N3licXZhZjM0clhPNnF1Nmt3d0RzZGwxUHN0Y09YbW13LzF0blBpdTNwTkdO?=
 =?utf-8?B?M1dlVVNuQVp2eDNvVllxeTRBK1hZTEZiTjBTeXdNNnU0YXN1eGZSQ3BpVU9h?=
 =?utf-8?B?SnVyWFVIaGxxSFZPbkgrUFc5bFhlRVM1TlZHMlBsalhTU0RDUVB1RXdSbTFJ?=
 =?utf-8?B?Qldqb0FuTGNMQ0Q2VTJQMmdYS0RKTklSdTBsMVF6d0pSTVZQYmJjM3c0Y3lk?=
 =?utf-8?B?b1dwWGVRaDBnaDZHRkI4UnYweWswL3NpNkE1ekFIbGl2enQweVpnN09ZWm11?=
 =?utf-8?B?NjNNSCtlZWw2VkZpMXdxZXRGUGFnQnFGbXdXN09pUjI2Z05Vc3J1QWtnMExl?=
 =?utf-8?B?YkY3dkVRd3MxcDRob2NHQWYxeU5vMzZQVzc1NWxLMjZORFZLUlltUHAremVF?=
 =?utf-8?B?N3RHY2lvUG1WNVViTzM5bDJqdFRvYnF1VE9UNENlY3RWTGRFK01icUZudzJk?=
 =?utf-8?B?enBiTnNib29hbHlGbndMNlF1WlRsY0hVZTBZMWd0eEtjY3JGZXIzMThnblpS?=
 =?utf-8?B?Lzhkak14Nk5ON1dYQWI4bDhKSDNPVStOM1h5SGR1N0x3NnJ1NmFYLzdKcDBX?=
 =?utf-8?Q?vUVkp51xqGNS/9OUK/9+I7cwUsqhF5ra?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SG5YUVlDZUNyNWtzQWdMaERyRFVPVjgxWmdYNE5iZlcxbStxQnFad1hlUmtW?=
 =?utf-8?B?S3h5Wk9TRi9ueCt1eEZZNGpKYnhxNnBRaXdTVzVxSXNqVHdBVDVVeWpLbWVl?=
 =?utf-8?B?eWQ4MzNVaHN1bVFaNTByamUyTlc5WmRQUGpXSzVncmZPMm8yOXQ2ZFR1eWpT?=
 =?utf-8?B?U0RIcjVWUmhYVEVMTERvQ05JOEwydStITE1SeWpWVmN1L2ovZVNpMURvWHhm?=
 =?utf-8?B?ZU1Lbko4OERvQk9DUFB2a2ZRTkh4VzgyTG9VenNYOE5ncDVYTzB2U1hDNG1H?=
 =?utf-8?B?elFyUzFQbGFpK2Jqb0x0aE9oSGFtNVY1NHNVREJRZkZkUWhYRngxS1pFQmVE?=
 =?utf-8?B?em4rWnZVM1p0TEwvTXYzWHJybERmNThDWnhkY0dGWXhUY3M4VUZtaFd6NldU?=
 =?utf-8?B?M1dIUFZ3clZ3NE9PbzZhcFkxQWU4dTR0VlFkWXdBalR0QnFOc0laUmxGOHpq?=
 =?utf-8?B?TXhyRzNxTUE2bXExUlJDL0Vzd1B5MFBqM01ET205eThwbzVwdjBqWUd2Vzlo?=
 =?utf-8?B?NEI4czVTQ1FHNTJqbFgySUVKWFBWeDk0SmU2ZDI5Vjk3MW1CYVpWRHdERTVL?=
 =?utf-8?B?UzRqRXJhaTJjT3dPS3l4Rk42ZVlDR2RmZ0UxN2EyNnhGT29DYW5RR3JxSnI4?=
 =?utf-8?B?WGFCMHBnNUdFNnEvMVpjWU85VWg5aWo5V1VzbGRuL1F1Z2p1RU5wWHQrL0dU?=
 =?utf-8?B?Q0hoZzgwQzNqTnpSYmRNZmlYeVF4RnZhRXltOXVNQ1RiNWYwd2FqVWlHaE5v?=
 =?utf-8?B?WXN6d0VVUkhpdCtlZGtGcXpUd21QY1IxZk42MlhRemVHeU9FOVlsWWtGbXMr?=
 =?utf-8?B?ZVdHc0p5dG1kUkhLd0pqYk5mOWZsWGtzZGFRaHlzc0hIOFBIRkhIVVJhMnh5?=
 =?utf-8?B?amMzMlhjQWJYVVFrb2t3aDJBK3AyUUk0L2FQK1JsR1FUck12S203R0xQMEVC?=
 =?utf-8?B?Z2xLUEFnc3dIV2pkWjkvRjIvL0ZjdjB6YnRGWWt2MTF1eVZONlN5S2ZlQTBm?=
 =?utf-8?B?UW9mZS9NVjFYUSs3Yk9hZk5SeGVIMFB1dmlEdEtuUEhMZ0ZWeTFGNnEyQmtL?=
 =?utf-8?B?N3FJZldESXJDWEEzdCtWVzBzbytkb2puazIyRG5LNndEa2dDTWV3Y0tXaFI0?=
 =?utf-8?B?U2hlWXNQQVJwN0gvWEF2VTl1eGs0SXB6M0VhR0FOV0VwWXNpb0Z0YW8xS0lM?=
 =?utf-8?B?a0ZXSkExc1B1SWdycTdFYnNYVUZYNzRabUtOSDIrWHh1T295OW9VMkVVY2t4?=
 =?utf-8?B?SGwxRVlDOStSVzlKVjE2N1gyYjlNTHBYVVY0ME12Q293MXZhTTNBOTkvUGFX?=
 =?utf-8?B?ZVJ0eEthQ2QvaEdTOXBLSzFEZE83VzNsK0FOVkpsOHRCemtuNllvNlNKZmZE?=
 =?utf-8?B?blVPSkZpbDRBRElxZ2VYUDU5bjBCMG16UWdHNHo0VUtKWlFmRUZGNEsyYzBz?=
 =?utf-8?B?Z1pRVlUxeGdDRjhSeUV0U1dERkNjUXB0RDJYakd3R1Y4ZHg4cTIvam9xL1Ry?=
 =?utf-8?B?SEpHcGxjaTFxQWRmcnBNeGh6YUZIVnkwV0E2V3lna2FVS1p1K3l0NGdXTFRx?=
 =?utf-8?B?cFQ5dFJUby9kcFVKeVl0VlFMUytBRmdocm9PTXRpNUtBV3NQcVZMODNRT01r?=
 =?utf-8?B?U0JDTHorWVJyODNXd2crQWVpaHFIT09ybi9zZ200c3NhVnZqOFJCV2REcVBX?=
 =?utf-8?B?ZzRxSXBmcjFjdnJSdWM2dm5oK0pnMVBQNVIwc05PZDBtV2Z1ZU4yeDBReTZQ?=
 =?utf-8?B?QnVOQ1ZQNGJqeGtlWWNTWE5zQkpuS0NicDFuNXhEanFhS2tmOUN3WHpkQ0xU?=
 =?utf-8?B?MlBvYUFrYjU1YVpmVzd0NzR5b0hFdG1rNTVxR3ZGcFpEektYL2lUbFhtbHRv?=
 =?utf-8?B?TjBwaEZpWHVTeWl4NlJxeHFtcll5ekRZOEJlNk5pcTd2NUZVMC9hSG00blZN?=
 =?utf-8?B?WGlvY2NrLzU5bFN4ODNwZzlNQkJPWllDV1g1cHYrenNEQ3NyZkl1VmNScWk3?=
 =?utf-8?B?ZjFrNlR4dUZPeU81UHNiakFNRnNkRS9qK2N3ZFp6dHU2YjBHaWhvSE5WOFlU?=
 =?utf-8?B?VkY0TnQ0NER6WFJROENFNVBSNVArRGxxdzJmb0NhYk9Fbmk2U1BIOWk4TVk1?=
 =?utf-8?B?ajU2NGh2cHJJbHh1THo3MkM3R201SVZOK0VpOUgxTW9FQ3VFZzhtYUhWUlk4?=
 =?utf-8?B?RGc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c8a97b-2264-43f0-7963-08de2deb8860
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 19:31:16.6372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3AL1EFTaL55aMG9dxOsV28lhjfaD7muM+LwunGaOkw5qHHT5paZuWtEtGmDHQolGN9p2GBYf51AA5Wf+AqUa7XdUdUGzSFguPZ0MKpBCPp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR03MB8258

On 26/11/2025 1:48 pm, Jan Beulich wrote:
> --- a/xen/scripts/Kbuild.include
> +++ b/xen/scripts/Kbuild.include
> @@ -56,6 +56,19 @@ define filechk
>  	fi
>  endef
>  
> +###
> +# Compare the symbol tables of two object files.  As diff's -I option isn't
> +# standardized, the name difference of the two object files needs abstracting
> +# out.
> +define compare-symbol-tables
> +    ln -f $(1) $(@D)/.cst.$$$$; \
> +    $(OBJDUMP) -t $(@D)/.cst.$$$$ > $(1).sym; \
> +    ln -f $(1) $(@D)/.cst.$$$$; \
> +    $(OBJDUMP) -t $(@D)/.cst.$$$$ > $(2).sym; \
> +    rm -f $(@D)/.cst.$$$$

Doesn't the second link want to be `ln -f $(2)` ?

It looks like this is comparing $(1) to itself.

> +    diff -u $(1).sym $(2).sym
> +endef

While I am generally in favour of build time checks, this looks like
it's a large overhead?

~Andrew

