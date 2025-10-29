Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37415C1DA49
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 00:09:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153159.1483608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEFGy-0004O6-LB; Wed, 29 Oct 2025 23:08:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153159.1483608; Wed, 29 Oct 2025 23:08:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEFGy-0004Mf-IS; Wed, 29 Oct 2025 23:08:08 +0000
Received: by outflank-mailman (input) for mailman id 1153159;
 Wed, 29 Oct 2025 23:08:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xz0O=5G=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vEFGw-0004MD-Em
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 23:08:06 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2051c0ae-b51c-11f0-9d16-b5c5bf9af7f9;
 Thu, 30 Oct 2025 00:08:05 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by VI1PR03MB6558.eurprd03.prod.outlook.com (2603:10a6:800:19a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 23:08:03 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 23:08:02 +0000
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
X-Inumbo-ID: 2051c0ae-b51c-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yob2e8qdd0PGt4GQKQePgtTZa0lirSm6yP4GunXyyw5qQcx+cZB5023YK+7WZ2wxOthQRqTGxxK8tT/iG47Vc2wPB4KiWGM4hEmCvTrRVqwrf7+6GIeAMyJzAdiOROFYdaW6IUPxT+BmPraEHwWJB+csRmg3oP2nshG+POlZUg3VC7Tu+9kH0nzB+PJOj5/f8XW6DNFSQAly4UV4VoRdnmeUADIjxLK2lVV1J12qTS0QGxT3YWsRfy4OBaggGgBeDGKomdf8KMyXeB3hBy6TmpqaJgge/bExJ/wlEO+3rkaSNwNh31TXMw4gkJ+tLAJGlt476YxEfZop6tmJa7H6Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrLeplXh79pypeIlqsPO7ZRY8OH5CRWSIdvghemi1lw=;
 b=skEk6k6XPl2o/pkIsI4VQVb+gPxJoVDv4zLcHGLy+LPn+KBJUbJX4hkeTNQMvFctCm7ayYhfJRh9ea+aHY7OUGWJ2tOQu244aXPGiz0ric2s3qwfkKGz0k4W+zphymcinqDtVAVIFr9t6Yj1xqhoBA1B9Yvaw1s6N1MSr5HJPW/soZPOMYEM1saGOXedo6w0UzMBIYcDrbpZ9Y0DV7/LWftSPOH4e3Q1Vp4iHyETvgA9It4aPjOb1EGr81sFAcdtBJoRvE1vP3Mw29M9IGojmbcj5WVxfGJy5xCiF1p5VYjBp1A82N49FQ1iYJPYLY+IwQDyoVdwFLqUIKcnbtq8EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrLeplXh79pypeIlqsPO7ZRY8OH5CRWSIdvghemi1lw=;
 b=lM3cocOInZtqODzC/9Rav5vxTdVQ4TizdI8IPHHPT6lRF0UeOjieo0Xq2XqkJOE9P+kPtE58CsiU6PPgm6Cl0ZplnfNYuSECj/XjOUeuPqv7woLarRMW6Cu8ABK7zMbiPC3SZJHN0hj3J7DHwos5WYGRjKnO/zTJZoLHt9bX7R7G6hBKbben3fUNZaHhlb66iYqmKEvBmZZiISDEoS9IojN3RK36FXgoPFUrecV+Rllwn+2C3Swdg2sFiRMO0h1kkk9lHjpuVzilblOpn2gfGWQ58lONxSjfuNTo+KoDLDrRpB2Dl/NXtsWTikok2UV7Z7ge0Ez4DoPpBPlDXj7ZWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <ee234574-384f-438a-8bf2-e250b61bc75b@epam.com>
Date: Thu, 30 Oct 2025 01:08:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH for-4.22] x86/hvm: Introduce force_x2apic flag
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Alejandro.GarciaVallejo@amd.com" <Alejandro.GarciaVallejo@amd.com>,
 Jason Andryuk <Jason.Andryuk@amd.com>
References: <d498a50f6187b362ac5da3c6a7a7c348f35dc4b3.1761761288.git.teddy.astie@vates.tech>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <d498a50f6187b362ac5da3c6a7a7c348f35dc4b3.1761761288.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0017.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::16) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|VI1PR03MB6558:EE_
X-MS-Office365-Filtering-Correlation-Id: f0426f30-7bec-48d2-5cc8-08de174002b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cEozaWVnLzRkbUFreDh5ajh2QmlMSmZSZjEzeDJYeUkxU2xkWUZyR3BLMTBu?=
 =?utf-8?B?dEluTUE1RW5mSkw3UTZVK0hrRG4vTDJnZnRMNHNPY21wby9Ea1J0SjcxMCtO?=
 =?utf-8?B?c0Y1YmxCUTBWbnVqUkVobGFqcUV2MHZUMVdIOWVqQzhwd1N4aFlhbk9Ec0V3?=
 =?utf-8?B?QWhzTmppTVhXNDlSclhZa0k0TTZrY3VyTy9pNWJvNlVKYnQyUzZQZEZ4RGVZ?=
 =?utf-8?B?aG84Rm9RTklKNFlhZHdPZEFaZXF6cHZxTzg3SlNkQlMzOWY2SzVEaVNWZXNa?=
 =?utf-8?B?WEI2bFNKcVpVb0Y2akovZVJNRTNLSlNGVHkyOC84VmxVd1RmOWVqaVYxS3ky?=
 =?utf-8?B?YjFCbXJjRW84SWRyQ2Jla3JzWlQyTmtpZXVTbWpaSlhvdkVlaERNTURGWW1J?=
 =?utf-8?B?c0Fhb1lVVlZWZk1HSHh5T2h4M3ZleW13dDFHTzlZWHhLRnVaSU5KajBtam9X?=
 =?utf-8?B?Z1dtUytRZ1o5WlN1OVF3NlZnVUpmd0tsZWl0L2g5YmcyMmZTUUlNb2kxVTFC?=
 =?utf-8?B?cUQwNTJCMzlGTG4ybkErSFpmTTR4UHBxUitpSFFYNHJnSlpLUEZjTUpsYWdx?=
 =?utf-8?B?Yy96QVVtRFZYU0ZIdmNpK2xQZTdWVktvRWxEQ0RLOThtdFl2UDhwVFhJUkNq?=
 =?utf-8?B?eXlnMG5XN2tISklWTkpsaDJvUTREWDFtMDhST0lENDdyeWNBRnBrM2Y4cE0v?=
 =?utf-8?B?azh2Rnp3bXJ5bVVFQ3dFYXpQRmVQTituc1Y3SnBrNXNQSG9nUUJUbFRmRW5s?=
 =?utf-8?B?cjNEMUwrbjNLeTNKTTlZdUNnaVkyZ09ucFpvWFhYL3daTC9rV0taQWZKTE84?=
 =?utf-8?B?cGdiNUlMc2RBd01lWHRiWkIwaEozeFhJVnhxOTFjYW1qOUtWRVdkVzJvSnBW?=
 =?utf-8?B?TG1lSUYzcU5jb1dGTjk1dXhpaGFFWlgvcEIzdE1zaTlPWTFMZWgzaHNlaDRG?=
 =?utf-8?B?dzg3eUlIVXdJMzlKZGpvTUh4Y1E2T2o5c1ZydjVFU25xZEVzNHM1ZVM1RW5a?=
 =?utf-8?B?djhMSmc0bjhHUk9MMUE1TTFUR0pXRjdBMVY3c3gyR1FqTXlVODNGTS9rN0dE?=
 =?utf-8?B?Yi9OR2c0a3pWNkpHbEs2blB1QU5BK0IrTTdYclRkNEZ6TSt0aTFaZVpZZU8w?=
 =?utf-8?B?QTlFVE1Gb3R5ak52Qk93ZDEzcG1wZUFQRWVxMFJMRHZWU3UzZ1drQThuMUNM?=
 =?utf-8?B?TkhyNXN1SEFCOFArSjgzUWNCc3diUUUvekpHYTFjT205Q2orcEprMnk3R0l2?=
 =?utf-8?B?OXp4VnQ0b3pWRThZTGJhL0pIRkJwTTRTZVA1RG1SeFdKaTlTcnMrZWs4RTFu?=
 =?utf-8?B?S01hWTJLbSttYkc1YkFnTytuNndabitxMmtoRVpsdGpiU0NMVW93bTVkM1ZG?=
 =?utf-8?B?SWxrcHJrOWxVSmxlSGR6Uzh1dHkwTis4a1NRRS90dmpSeWNyOTdYQjVoN2hG?=
 =?utf-8?B?U3FRMzY4TzlhRFJzZXBhczJudWd5YjZwZGxIQW9aQ2VDdGRLeklNTDI1K01u?=
 =?utf-8?B?RTdSQ2EyZ0M4T0VERFlQeFZ2UkxadmlEWEJOZHFYaFdVMStOcGFFa2k2ZVVn?=
 =?utf-8?B?NGxYNHMvSGw0T1NIamNZTW90K0R5SUF0V2pJS2JLc2RIb2tZZ2dVZHEvaWd6?=
 =?utf-8?B?VVh1bmVucHh3SXhudWszQk1UeEJ0ckhuQy9DRitKTlZNWkpFbXFTcXRXQmdF?=
 =?utf-8?B?ODlBRVJSZFdPRXZ1cXg2UGhZSjQ0cFFQU0pJL1IwVkVMRmh1dHpLQnczUDlY?=
 =?utf-8?B?MzB0cnVYMHJpT1p6UCtLKzYwVXZOTHVCdmluM0c2cFFzOVhFcFU1a25tSVNF?=
 =?utf-8?B?aEJqayt5WUZvQXlHOUNpdmFLV2JocWdhbkpqSFlOSDZIY1RRdU85VjBvWitI?=
 =?utf-8?B?ZEV5S1RROTZaK0RESkt0bzhrU09HMTJWL1dib1lvOWZiQmRFdWNsZ0NoZVFv?=
 =?utf-8?Q?6FWU+hBblvXrtVRWiKyF6CdKl849Tkxg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTBHMmFNQWJONUplN2JWRU1JYTA5eldlbnVnMDkvS0ZDNGw3R01nTXgydVhj?=
 =?utf-8?B?WEQxZWJaRy9HaUhpUEFPNFo3N0dqN2ZiNDJlVURFMTIyZUVPcHZqaXpvMlB0?=
 =?utf-8?B?UEx6QlluRVNvME5qNVdKeDVsSjJwWVdYZmFlT3lEMjhiM0dEN01odTYvSW44?=
 =?utf-8?B?RnNIWWdBK3FQc3ZySUxGdUJJcGV3S3IrSmo3ZG90T05iODRTRkwrSlVEMEph?=
 =?utf-8?B?SDBtK1k0SUhIN1NpTEJzelhKUndTcFFsUFpXUmZKNGRDOHk1UDhVUVQ4S3d6?=
 =?utf-8?B?T3oxS3h4MnZRYTlqS3V6dWFOQU5CbWFuZ2lJUWhQYnpTL2xkVWZUUkRrQUVj?=
 =?utf-8?B?b0V0NGF4cDhhdDZKdUZ3RTRtS2hxWGhick5KRG1IVGVVODIzcFBrY2g5Zkp6?=
 =?utf-8?B?TXBrQjVrL2s2SFZqU3JsWTlsYXVpSnAzcmkxYmdlSWpTTSs3Z0pVUVo1and2?=
 =?utf-8?B?aU5yY2lFTjY3c1ltS2paVnhwQ2R3eHhUQ0tRdWNqT05ZaGJhcUk0SzVPMkpL?=
 =?utf-8?B?Rm44OUJoOWZuNHAxU3RGamFGL1BNWFg5elN2MlUrVlN2bkZ3N2N3SE5EcEtm?=
 =?utf-8?B?TzMzdnUyVThMN0ZwVExBc3kzakJHOE00OTlJbXV4MWozTUhBUlhJMWViMGt5?=
 =?utf-8?B?enJqWkhIOUxqbndUa0dLVkh2aDZORG13WHVTYmlGd1N0LzZHZEVjc3NkZUdK?=
 =?utf-8?B?eTZrYmF2TE9WeEloS0l0eTMwdjZ2bmlIMTA1U1Y5eXN5ZGt3M1RaMnFJY0xQ?=
 =?utf-8?B?eHJFY25LRkU1OERqd1YxRkVBWnRYOU5sa3dWMUtpbzRnUERibC96M0NWaFFK?=
 =?utf-8?B?NWYxYytLRWFBc3ZYYjQrWDUxSUYzL3Q4M1Zaekd1WjFkQ3hkMnRjbE8vQ1Yy?=
 =?utf-8?B?NzYrellCaGxBaUgyRmdRTkZjRGZWeHNLTWZML3NzeHFGSE95LzZLTVJnNkxO?=
 =?utf-8?B?b2Y1azZHT0hBV0FaLzIvcElpQjZDQXR3dFVYYTBqUTVzQ1ZWWFF5dUN4Vjhu?=
 =?utf-8?B?VDhjTnlja0N1R3hMOWMybGc1OThjZjZVQUsrdklUbi9qZEh6N3dDSURYUGVl?=
 =?utf-8?B?c25KTDg0ZXBvSzM4QzFYSnNmNlM0T2dHZjZFVXdNN3lPK1FvZ1ZkcU5rYnBH?=
 =?utf-8?B?b3NtdjhZclNrb2ZrajdoMk5NNzd2Q2Q1cHJGa2hibWhsdk96N1o3NVBib0Fs?=
 =?utf-8?B?YWFsekppOVNJZGpmRHJsTm8wOGtOZnV3V3NJWHZYdm9vMDl1Z3ZyUm1ZazIy?=
 =?utf-8?B?VUlKbHNrZEFHT0M3ZWhuN1d5N1ZLaXIwSCszbUIxRWxSY1lscnlmanZaK0Y0?=
 =?utf-8?B?Zy9BeWdOMzRmS3pNZkJwYWpwNURia0JuNE1zMStKS0JNOXp5VUNRcktmUzg5?=
 =?utf-8?B?eDZVclhxTHF2TTRyNVlHZkd2S21lN21CcXdWZXkzbEcyV3ByQkE1K2ppVW1a?=
 =?utf-8?B?MkFrVkEySHdxOTNhSGF2NW9XNEVOSHJQSk1IYjdTVXJvd3Q0WXlaL3ZsaTFM?=
 =?utf-8?B?T3BaWUk0aldLWHJValN6L3JnQk9lU21SMS9sMmNlMTIreVZUM09lc3I5L1BZ?=
 =?utf-8?B?TmhseHFiRGJJL29vekpZeUJlWlE1WjYvWnd3dEE5UTNESXV0RUVKcmlQUEpY?=
 =?utf-8?B?djI0dTMzY0JZd0g4QXFwK0ZTNTBpSDFydGRVU24vWXZ5bWF0M1ZSa0hPT0tw?=
 =?utf-8?B?dTdhTFlsOVY1QU90MysyQTcwL0lCWmZtQUM2WHdnYlBUb0JxbVlidDNkWlZV?=
 =?utf-8?B?UTJlWVZ6QTFlNG9tREdyWXh0RXQ2WjgzYWRaL3hHQVZMS2dRR2ZaK1kweEtu?=
 =?utf-8?B?cFVVOTd6aTFXT1hEbllEV0JrV3JKVEJHajBRWFR6UHptRWR5WFhwQnRPRmRx?=
 =?utf-8?B?U1lhNDFxSmxmQlJSM3VqSkx4L1RGOXZub1dKNTdoL01CWHlyd3E5ZkNRNW9R?=
 =?utf-8?B?WFUyeE1FbDlmb0lRMGJHcXIyaHd6dUI2VTQyemdmUDF1T3VLWTh6bUtpeTlL?=
 =?utf-8?B?Q2pSekluYkVhSThvMkthL2tqV0krQm5yYXl5a085eE9TKzllejZDU2tjNGtk?=
 =?utf-8?B?UTFkUE5wcnlqc2NINXYyNWpxdy8wamtJc1lhaFNzUlFnYUwrem5Zc0lSSTNH?=
 =?utf-8?B?SFVseWdYQ0tlWW1ocGM0aVJpSGl0VURjK1J2cE1jcWVubU8wOG9ybXQvWm9V?=
 =?utf-8?B?NWc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0426f30-7bec-48d2-5cc8-08de174002b2
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 23:08:02.5538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +QLUxxulSdjC70tCxY8j3zO5rPxfw91vr74LPlsIMvnPK/koTjx39qbZfDl9wmLWPuBz94WaOlEONvsutXH+Rg71OdxpEO0n4CxgsMujLWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6558



On 29.10.25 20:26, Teddy Astie wrote:
> Introduce a new flag to force the x2APIC enabled and preventing a
> guest from switching back LAPIC to xAPIC mode.
> 
> The semantics of this mode are based IA32_XAPIC_DISABLE_STATUS
> architectural MSR of Intel specification.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> This feature can be useful for various reasons, starting with SEV as
> it is complicated (especially with SEV-ES) to handle MMIO, and legacy
> xAPIC is one thing that needs MMIO intercepts (and Linux uses it during
> boot unless x2APIC is initially enabled, even if it switches to
> x2apic afterward). It could also be interesting to reduce the attack
> surface of the hypervisor (by only exposing x2apic to the guest).
> 
> As it can allow to have MMIO-less guest (using PVH), perhaps it can
> be enough for avoiding the problematic cases of virtualized INVLPGB
> (when we have it).
> 
> In my testing, Linux, FreeBSD and PV-shim works fine with it; OVMF
> freezes for some reason, NetBSD doesn't support it (no x2apic support
> as Xen guest). HVM BIOS gets stuck at SeaBIOS as it expects booting
> with xAPIC.
> 
> On Intel platforms, it would be better to expose the
> IA32_XAPIC_DISABLE_STATUS architectural MSR to advertise this to
> guest, but it's non-trivial as it needs to be properly exposed
> through IA32_ARCH_CAPABILITIES which is currently passed-through.
> 
>   docs/man/xl.cfg.5.pod.in              |  7 +++++++
>   tools/libs/light/libxl_types.idl      |  1 +
>   tools/libs/light/libxl_x86.c          |  4 ++++
>   tools/xl/xl_parse.c                   |  1 +
>   xen/arch/x86/domain.c                 |  2 +-
>   xen/arch/x86/hvm/hvm.c                |  2 ++
>   xen/arch/x86/hvm/vlapic.c             | 23 ++++++++++++++++++++++-
>   xen/arch/x86/include/asm/domain.h     |  2 ++
>   xen/arch/x86/include/asm/hvm/domain.h |  3 +++
>   xen/include/public/arch-x86/xen.h     | 12 +++++++++++-
>   10 files changed, 54 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index ad1553c5e9..01b41d93c0 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -3198,6 +3198,13 @@ option.
>   
>   If using this option is necessary to fix an issue, please report a bug.
>   
> +=item B<force_x2apic=BOOLEAN>
> +
> +Force the LAPIC in x2APIC mode and prevent the guest from disabling
> +it or switching to xAPIC mode.
> +
> +This option is disabled by default.
> +
>   =back
>   
>   =head1 SEE ALSO

[...]

>   
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> index 5df8c78253..771992d156 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -509,6 +509,8 @@ struct arch_domain
>   #define has_pirq(d)        (!!((d)->arch.emulation_flags & X86_EMU_USE_PIRQ))
>   #define has_vpci(d)        (!!((d)->arch.emulation_flags & X86_EMU_VPCI))
>   
> +#define has_force_x2apic(d) ((d)->arch.hvm.force_x2apic)

Would it be possible for you to consider having Kconfig option to make
such configuration global, static?
   

-- 
Best regards,
-grygorii


