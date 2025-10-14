Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30467BD9B24
	for <lists+xen-devel@lfdr.de>; Tue, 14 Oct 2025 15:25:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142801.1476725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8f1X-0000nn-UR; Tue, 14 Oct 2025 13:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142801.1476725; Tue, 14 Oct 2025 13:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8f1X-0000kh-RV; Tue, 14 Oct 2025 13:25:07 +0000
Received: by outflank-mailman (input) for mailman id 1142801;
 Tue, 14 Oct 2025 13:25:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BBX0=4X=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v8f1V-0000kb-Ko
 for xen-devel@lists.xenproject.org; Tue, 14 Oct 2025 13:25:05 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31d74130-a901-11f0-9d15-b5c5bf9af7f9;
 Tue, 14 Oct 2025 15:25:04 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU0PR03MB9519.eurprd03.prod.outlook.com (2603:10a6:10:41e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 13:24:55 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 13:24:55 +0000
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
X-Inumbo-ID: 31d74130-a901-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UfZr0oEqeTlVFIizmWwgwhbH271xWx55lm2FTVoz0mYtNNeyd2j/G+SieSOxRCumPFHAm4eEjWkPIp06K1UDCW4MVTrcw4n/2bknNkmjwvofipbgez8ug3tJ4/Ho+D4vFeQKq0EmHLKN+rNIAn5be47i+bDLhhk/F+RDrbClONLj8xvv2KF5qjAF4SczhJ31qzI6Tl60RXRUilZ0GkcMsET43LYvGAySO1z+ReltyYVNvMMTEcnOJk7zwCJghWLkoZYAkLBuxMwiP87EFHB+Ro7CDnWHT3HnEFLH+V4TydBa1zgevA5ruYxL6pc+FYUMozfKW87qtBcMqEQvd2qC2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRRiJq8izfULBxgWUNa6eRuBgidxp59NsROtV6AgWsM=;
 b=uT+0w4Ww4ve9Pd1G7n655y4nAqYdLdKHBids8z2OuOwvqaoYTEuJ4KXghJJXM2oj6esC/n8T1CCr576YNDQ7t+k4WjYALXBHSsg5VmcaCw47+gModB8zEpbdfHPhktdcAmgalx6V3tugt+BjJgqJDUQl4556pkPDdQ0lW1w93W+m7QUaMdZ4NA3IeMx2wQSzPXhJAx84FDObkNPU9h9G0qokA0+d6qslbZhgboIGFZzpLejOQIS44wybvCE4I+wkFa8dCLZBysk2HvBA8YendevICI6B3iXE5jtLUM2Tj1fIjoQAwxEqjfkX6/QUVxScIADN3/MqFeQIh8OQtFea0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRRiJq8izfULBxgWUNa6eRuBgidxp59NsROtV6AgWsM=;
 b=b+Q2mS2Jq6jPUKtaE4/bUHpaLCtQyBVblv1GaVZHaq4aVRhSACYNZTCGuRDln4xrHIvioXcTu4FQ2Ls0RtI3EoopgZCz4T0xqyDiEEjqMc6nrMA8BZDHzjP12KsiIM1rCMJWOjjmxxIrgdf5gNkup7h0hhhEwCECnx6SvJFefQ4wwGqB/QyXon1pqmBpobI7JpF2v3bwpXIy2C2N/wjXuYPvK+HTdK9ns3QwPXlGph647GZOoyPVjNCmcwkSYAe5Tmi07I63qFiKMS16dsguva8c8dlZePfQQVFJOlpL2zjfuv3m2zgJcXg7Mc3tZFmLVxQo/cMKSbkYOoF1PUeINQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <e6972ea5-2139-4f4d-8d2c-2979fe2fad99@epam.com>
Date: Tue, 14 Oct 2025 16:24:53 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] x86: make Viridian support optional
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>
References: <20250930125215.1087214-1-grygorii_strashko@epam.com>
 <aOzt8gfxkdQXZ6O1@Mac.lan>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <aOzt8gfxkdQXZ6O1@Mac.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::12) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DU0PR03MB9519:EE_
X-MS-Office365-Filtering-Correlation-Id: e4c81994-aa72-415b-906e-08de0b25106e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXZIN01NTjdpT2tUL3ZWa1FKRmpwaUMxSDBCNWNMTXY3LzJpK053cFlNZ2dR?=
 =?utf-8?B?azUrUkNBOWl4Q2VOd0U3UDdrMFJRL0xzWDJmU2JOdjZ2dGYreC81V0lwTm9C?=
 =?utf-8?B?Y0JGeFZCcEM4WmQ4WEVLUzBGWGgzTGMzUEc0WmIyb3JnMG5kS2NOUUh0WkZD?=
 =?utf-8?B?QkZlek82OTJqbGo5MnEzQUVWUEg0QTN6c0FiR0dHTy81ZkRzeFhwemFLVjh1?=
 =?utf-8?B?MVZFR3VkNy8rVjNia3hKYXFoR0VxZCtha2UvZXB5eERKQ2s0UXo1emtUY2My?=
 =?utf-8?B?VnJLL3FVL1p0OHl3b0Jrckw0MG42bTM2N1g1YkhhV1k0cno0Z3ZaZTlReGp5?=
 =?utf-8?B?ZEhtTEozbUhsakhucTBWN2xLQndWdWJ0VmZGUkhGbHFmQ0dNZVY4ZHBaTzFF?=
 =?utf-8?B?MUZ1VTVWRVVIRlROZUF1bXpKc2JrV29EWU5NTUZPbTRueEpjSlBLU2RHVTlV?=
 =?utf-8?B?SEFOZzF4cHRuMjRMdndLVFJ4UllRQmVsT1BjdWVOdG1nVG52NGE2SnJGRzFu?=
 =?utf-8?B?ZnEzc0tJdFNFUDRUVFN6Vkh4eGs1ZzRpTTREbmZSRTBSd2dpb3ppSUpDMWRn?=
 =?utf-8?B?UHVLR2pvalp5S1RiY3dVcXBNamVPVkdoLzBKVWk1NHJLTTEralV2ME0rdUcz?=
 =?utf-8?B?dmhvS2dLaVZUUFFWclM3OXZpMTNKcDd2M0V6YmtlRkZhbU4rN2NNbGkrS2s4?=
 =?utf-8?B?azZhQzBJOW5uc1Y2QllDb2d1RjFaNUlPRW5waUVvWkNyRGE0MXpzdy9obFdm?=
 =?utf-8?B?T09KUm1mVVBOd3JyV0ZJQXhCMEJLSEk4OFVKMXdQZXhUT2dkU2xtL2poVzdF?=
 =?utf-8?B?NmRRSC9iMTdRbk9mTWF3eXhiMTM5aUZnZzJFcFdtKzdML0lBTURXUEdWN3Qv?=
 =?utf-8?B?T2Zra2dCa0NZL25VYXpHc3ZONkVjK3hTWnE3d2lkWEJNS2FRUXBaS3pneU5I?=
 =?utf-8?B?cExQalkwR2UxaGlOZ0RJZU9ZQURpbTZoNDBJNDZacnpOdFJXWFZJTWN2Tllo?=
 =?utf-8?B?TGFjcDFkcWtDc296d1MzbjJ1L1pHNlhVYW1uRlEzVkRENVpyYlQ3eFdzM1N1?=
 =?utf-8?B?NlY0S3lMcytYdFJzdjZFeUdTQ3htUE04d1dFVTZ6RlE5Tjh1NURtek94Qmkw?=
 =?utf-8?B?MWxEZytzMC9qakIwQitBdHlVRXEySXFIdXp5dzRMTUNzVisyMlNkdDFtMTRq?=
 =?utf-8?B?WVprczZuOGNybkc1eHNyOUhadGpkeU5LMjlvbnUyZFV4R2tTUEtiSGtETkZt?=
 =?utf-8?B?WlQ1UmhCREViSDNqVS96WVE3U3lqeXAxaTc5WE5Ed3Jja1NvV1ZxeWpSNVBV?=
 =?utf-8?B?SFg1ajAxTGVrQmdsSVhRV3BXVzkxTGxwa0Y2bnZXeTdMT0hwNGhNcHc2OHF2?=
 =?utf-8?B?VG5zUzNIc2J5L1NPbDZoQSs1ZnQ1UXFuY3Q4b25sN2ZpQ2NsSWZDME1SMUg0?=
 =?utf-8?B?MUMyNzNJS29lTnduU0xiblhaOVZJU3BXTE5TaXQzd0w0cVU5UUFaMFRoSVVY?=
 =?utf-8?B?bHJocUZZU0kzcmVwN0Y0cWpQSkk0KzJlVjVOeHFSTmkrN3NXc3ZTRnJaOXJJ?=
 =?utf-8?B?QTM3U0hoZlp6VDgzTGs4WW5vWVYvZ214dS9JTkVMemxOdmEydUJ4LzFUeTVM?=
 =?utf-8?B?UWR6RUZCS0UwOW5WZlUxTUUrYkQya3lhek8vY0o1MWFDZTZENUg2a202ZUF6?=
 =?utf-8?B?VnloRW9Zanoyam5CVzBaYTB6b2hLbzFUMFdJMUxXZmU2RU9Sb1QvUTljc3dW?=
 =?utf-8?B?a1lkSzU5UHRvNnFrbWNrNW5IeVh4byt6elpHTkdpY2dOZGlydHJ4OU1JdXpn?=
 =?utf-8?B?Mk42YTNrTHRHV1d5bXEyTFJaajFENUl5UDJKRFdSYjV2Uk1GQ2R4UFZlOWhM?=
 =?utf-8?B?YU1YMkpHalVtUGlOTTdIczc2MGNxK0JnSmNlaktHNXJqNzNROUpqUWJ6SlE0?=
 =?utf-8?Q?dTQaJLro8Iq4d0yMSlwgdbhBfVnp0c3y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEhaOVpMSEJ2Zys4NTlTS1lycXlQNEZkOEhpenJXZ0ZJSXRETVFpc1BwdmtB?=
 =?utf-8?B?RXVFR3gvcEZOdkJrck16RVlhRXRDcllZU2VIMzVSNVRaTUNqN3dRVzhjQWJy?=
 =?utf-8?B?UkhvN3NnTWttZjBDWFFEVk9tQ1BCMnNTUjYreHJGS1p2bnZpbzRjcWF1NTAw?=
 =?utf-8?B?U2ZrNTkvTlFoWU5FVXhJUElUK1BINWs4UXJqUFh2T0R0bnZxYm1Oa01HTCtE?=
 =?utf-8?B?cWRaeFV6cG5lWVp4cFJHYmo4NGEwSk9FK3hwekRNRFh3TzFMODI0RjIyWDlV?=
 =?utf-8?B?QkthbEwyd2hEWmY5QXZiUTIwbk1TTlJ3azFVR3V5L003OGJBZHNhNjM4bVcx?=
 =?utf-8?B?eXRjSGNxU21vWVZWbXV6NzlDNW1Eb292dFRXQWFwN1hBd3lZV3dOK241ZllP?=
 =?utf-8?B?KzFCTnI4UTMwWUZQR3MxbFlNWkZKSU1tU2dKOG1ScHRhM1M3M0UzQmo3ZlBr?=
 =?utf-8?B?Tml6aUE0SlUreUpBQk81bC9RYld0SEhLc3lnRkJ6eFZjclZIZmFudEpLc2oy?=
 =?utf-8?B?Ymt4MnBZVmNSL2luYlBWS1dncnM5VEE2TkZOcUpTNHBIbkhuKys2VDlNOGVQ?=
 =?utf-8?B?SnlOcmU0VnJyRjkrYTFXWFZOWGNwODF3aTFJUlB4L3dvdmZtbFhQcWRTZFp3?=
 =?utf-8?B?OU9aSnpCb0RnbG9SSEl5NDRnUnVTb05BSyszaUFzSmlsKzZSMjUxVkZWVVY4?=
 =?utf-8?B?aXZZSzZLTWFTVU9VMm5qQzROVUYvdDhIOWpNQUZuV0trUkt0QStodEtSTVZS?=
 =?utf-8?B?SE9JVy8ydVFLaVVZZmZUdmdnQU4vaFJxRnJJOGJQa1V1WkVUdzhxTGI4ZU43?=
 =?utf-8?B?Tmp0cHVtMktCRE5ubDVsa25LeU1aMmtqaHVyZ0prWjk2RmloRS9rUlNoU3dY?=
 =?utf-8?B?N2NtaE5BNDFUaWIvWmwzR29pOXZ5U0lpWkI1MHZtSkltV1RFRFJ1dlB3aHU2?=
 =?utf-8?B?akJnV3lDaG83RFFIUEhNZTZ4TUcycDE2T0NMNitQaFBiQnRBR24rTkdMR2NE?=
 =?utf-8?B?VVR3SVFSNmpjVkdvKzdvSXNtUURCbll2dER5RXlNTzRxeXZuVWRjL1V4Uk5v?=
 =?utf-8?B?VXF1ZHZOV29nTllTWjViS1lHR2t3ME1GY29TOW1UaTlJODA0M2kvNTR6VmQr?=
 =?utf-8?B?RGtYbUJoVnB6N0RCV2dIcmF3QzBoZEVVekkrSC81MEJkSmx4VWJ2ZzZMRzBv?=
 =?utf-8?B?NUpyU3VlNFNNUHV5QmM1MVVoWEtwSk1henlXYzllalNLazhyQ0NLeEFaSTYx?=
 =?utf-8?B?WWEyZmdvR0N0OUtaK0ZrRGlwNDlCUXJ3WWJsTzEyNmlIQTk0cDFhRDRGTXlU?=
 =?utf-8?B?dDkvL0tDcUhwWG5hQWxNZ0xZaUo3Y2FGN3crM3NPR1ZVNHlabE5icUdjcC9Z?=
 =?utf-8?B?TEZSVm9QRDgrVDBUaW5ZaS94KzlKRXJETlF6WmthVGNBcFJidWVJV21pN1pD?=
 =?utf-8?B?dnNZa3I2Rnh1MVNPK1ZVdVJJMmRraTYxZHVuZUY0T3hmVndRWTRsMzlLUzJV?=
 =?utf-8?B?aEcyc0tFMlJNS1V5RnQ4WjUvOFpHYVdhaUlRc0NCZVN3WjdobWI4ZWc4bnRk?=
 =?utf-8?B?RHVnV0NBVTBYL0hKOWtvb2lqTXNjVWlvV2N5cXRPQnFENTZ3OTduQ0NDdzBZ?=
 =?utf-8?B?SGZUcm1BS01CUGZJNDRZSHRpbUFvUUY3SDkzSC9NUXFMYUgwdUtEbFduak1r?=
 =?utf-8?B?Z2VaK3U3YkhSZGViQ3ZheVFYQjh0dlZLZ054dVM1dHZ1RklrVXdESldSZlgw?=
 =?utf-8?B?dE42cTNRZnBJMjNRRC83U040VVNlWnN5NkNZTVFhWmtCejhLbDlZNnp6Zis1?=
 =?utf-8?B?Q3ZQSG0wWFdTVDk4bEhUblBNZmZhM0NoWjR0V1VGNXc2NFh2bjF0U0tQbUd2?=
 =?utf-8?B?Qk8ybGt0djFubUl1a1VOOVZybEU5RzJ5OENQa0pveENqYnRwRmNMTmNsalVz?=
 =?utf-8?B?WlJSUVNsazlZOVlmSUpXaVl1aWRXOU5Va1dWSEZCZDdBM2ZWMDJKUFFESkgw?=
 =?utf-8?B?YjlKS3hUbnFaVjU5V3dGNmtpc1BodFY4YVl3anBaeWs0ZExJb0VDbFQxUEQx?=
 =?utf-8?B?VWg5NHp5WHRLb2NLSFoycjY1WWwwQTd3a0drYkFQT1RRUmpTWCtvSEQ2cFAz?=
 =?utf-8?B?alZUVXJJNExaS3pwaTRnbUF6dFZIY2lPallhRWYxcTUzb1phdnhUNUhXYmd0?=
 =?utf-8?B?bXc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c81994-aa72-415b-906e-08de0b25106e
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 13:24:55.1631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7hVtyOwZ+RSWEQVF2CicbXqgcPBsrDwLQ9Wa/07S2/CXrgY0RYxOrCM7HWUacd+T07fjZNM414q7ByEOr7T7q2SxyEGYaIC9YcbHFtqOUrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9519

Hi Roger, All,

Thank you for your comments.

On 13.10.25 15:17, Roger Pau Monné wrote:
> On Tue, Sep 30, 2025 at 12:52:16PM +0000, Grygorii Strashko wrote:
>> From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>>
>> Add config option VIRIDIAN that covers viridian code within HVM.
>> Calls to viridian functions guarded by is_viridian_domain() and related macros.
>> Having this option may be beneficial by reducing code footprint for systems
>> that are not using Hyper-V.
>>
>> [grygorii_strashko@epam.com: fixed NULL pointer deref in
>> viridian_save_domain_ctxt()]
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>> changes in v5:
>> - drop "depends on AMD_SVM || INTEL_VMX"
>> - return -EILSEQ from viridian_load_x() if !VIRIDIAN
>>
>> changes in v4:
>> - s/HVM_VIRIDIAN/VIRIDIAN
>> - add "depends on AMD_SVM || INTEL_VMX"
>> - add guard !is_viridian_vcpu() checks in viridian_load_vcpu_ctxt/viridian_load_domain_ctxt
>>
>> changes in v3:
>> - fixed NULL pointer deref in viridian_save_domain_ctxt() reported for v2,
>>    which caused v2 revert by commit 1fffcf10cd71 ("Revert "x86: make Viridian
>>    support optional"")
>>
>> v4: https://patchwork.kernel.org/project/xen-devel/patch/20250919163139.2821531-1-grygorii_strashko@epam.com/
>> v3: https://patchwork.kernel.org/project/xen-devel/patch/20250916134114.2214104-1-grygorii_strashko@epam.com/
>> v2: https://patchwork.kernel.org/project/xen-devel/patch/20250321092633.3982645-1-Sergiy_Kibrik@epam.com/
>>
>>   xen/arch/x86/hvm/Kconfig              | 10 ++++++++++
>>   xen/arch/x86/hvm/Makefile             |  2 +-
>>   xen/arch/x86/hvm/hvm.c                | 27 ++++++++++++++++++---------
>>   xen/arch/x86/hvm/viridian/viridian.c  | 14 ++++++++++----
>>   xen/arch/x86/hvm/vlapic.c             | 11 +++++++----
>>   xen/arch/x86/include/asm/hvm/domain.h |  2 ++
>>   xen/arch/x86/include/asm/hvm/hvm.h    |  3 ++-
>>   xen/arch/x86/include/asm/hvm/vcpu.h   |  2 ++
>>   8 files changed, 52 insertions(+), 19 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
>> index 5cb9f2904255..928bb5662b89 100644
>> --- a/xen/arch/x86/hvm/Kconfig
>> +++ b/xen/arch/x86/hvm/Kconfig
>> @@ -62,6 +62,16 @@ config ALTP2M
>>   
>>   	  If unsure, stay with defaults.
>>   
>> +config VIRIDIAN
>> +	bool "Hyper-V enlightenments for guests" if EXPERT
>> +	default y
>> +	help
>> +	  Support optimizations for Hyper-V guests such as faster hypercalls,
>> +	  efficient timer and interrupt handling, and enhanced paravirtualized
>> +	  I/O. This is to improve performance and compatibility of Windows VMs.
> 
> I would leave "paravirtualized I/O" out of the text, as the hypervisor
> Viridian extensions don't provide anything related to I/O.  AFAICT
> that would be the vmbus stuff, which I'm not sure is supported when
> running as a Xen guest, and would require QEMU to emulate such
> interfaces?  IOW: the paravirtualized I/O part is out-of-scope for an
> hypervisor-only related config option:
> 
> 	  Support optimizations for Hyper-V guests such as hypercalls,
> 	  efficient timers and interrupt handling. This is to improve
> 	  performance and compatibility of Windows VMs.
> 
> Nit: I would also drop the "faster" prefix for hypercalls.  Without
> this option enabled there are no Hyper-V hypercalls available,
> neither fast nor slow.


If no objections I'll change it as you proposed (and thank you for this proposal):

"
	  Support optimizations for Hyper-V guests such as hypercalls,
  	  efficient timers and interrupt handling. This is to improve
  	  performance and compatibility of Windows VMs.
"

> 
> 
>> +
>> +	  If unsure, say Y.
>> +
>>   config MEM_PAGING
>>   	bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
>>   	depends on VM_EVENT
>> diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
>> index 6ec2c8f2db56..736eb3f966e9 100644
>> --- a/xen/arch/x86/hvm/Makefile
>> +++ b/xen/arch/x86/hvm/Makefile
>> @@ -1,6 +1,6 @@
>>   obj-$(CONFIG_AMD_SVM) += svm/
>>   obj-$(CONFIG_INTEL_VMX) += vmx/
>> -obj-y += viridian/
>> +obj-$(CONFIG_VIRIDIAN) += viridian/
>>   
>>   obj-y += asid.o
>>   obj-y += dm.o
>> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
>> index 23bd7f078a1d..95a80369b9b8 100644
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -701,9 +701,12 @@ int hvm_domain_initialise(struct domain *d,
>>       if ( hvm_tsc_scaling_supported )
>>           d->arch.hvm.tsc_scaling_ratio = hvm_default_tsc_scaling_ratio;
>>   
>> -    rc = viridian_domain_init(d);
>> -    if ( rc )
>> -        goto fail2;
>> +    if ( is_viridian_domain(d) )
>> +    {
>> +        rc = viridian_domain_init(d);
>> +        if ( rc )
>> +            goto fail2;
>> +    }
> 
> Are you sure this works as expected?
> 
> The viridian_feature_mask() check is implemented using an HVM param,
> and hence can only be possibly set after the domain object is created.
> AFAICT is_viridian_domain(d) will unconditionally return false when
> called from domain_create() context, because the HVM params cannot
> possibly be set ahead of the domain being created.

You are right. Thanks for the this catch.

Taking above into account above, it seems Jan's proposal to convert below
viridian APIs into wrappers for VIRIDIAN=n case is right way to move forward:

int viridian_vcpu_init(struct vcpu *v);
int viridian_domain_init(struct domain *d);
void viridian_vcpu_deinit(struct vcpu *v);
void viridian_domain_deinit(struct domain *d);

Right?

[1] https://patchwork.kernel.org/comment/26595213/

> 
> If you want to do anything like this you will possibly need to
> introduce a new flag to XEN_DOMCTL_createdomain to signal whether the
> domain has Viridian extensions are enabled or not, so that it's know
> in the context where domain_create() gets called.

In my opinion, it might be good not to go so far within this submission.
- It's not intended  to change existing behavior of neither Xen nor toolstack
   for VIRIDIAN=y (default)
- just optout Viridian support when not needed.
   
> 
> Given that HyperV is available on arm64 also it should be a global
> flag, as opposed to a per-arch one in xen_arch_domainconfig IMO.
>>   
>>       rc = alternative_call(hvm_funcs.domain_initialise, d);
>>       if ( rc != 0 )
>> @@ -739,7 +742,8 @@ void hvm_domain_relinquish_resources(struct domain *d)
>>       if ( hvm_funcs.nhvm_domain_relinquish_resources )
>>           alternative_vcall(hvm_funcs.nhvm_domain_relinquish_resources, d);
>>   
>> -    viridian_domain_deinit(d);
>> +    if ( is_viridian_domain(d) )
>> +        viridian_domain_deinit(d);
>>   
>>       ioreq_server_destroy_all(d);
>>   
>> @@ -1643,9 +1647,12 @@ int hvm_vcpu_initialise(struct vcpu *v)
>>            && (rc = nestedhvm_vcpu_initialise(v)) < 0 ) /* teardown: nestedhvm_vcpu_destroy */
>>           goto fail5;
>>   
>> -    rc = viridian_vcpu_init(v);
>> -    if ( rc )
>> -        goto fail6;
>> +    if ( is_viridian_domain(d) )
>> +    {
>> +        rc = viridian_vcpu_init(v);
>> +        if ( rc )
>> +            goto fail6;
>> +    }
>>   
>>       rc = ioreq_server_add_vcpu_all(d, v);
>>       if ( rc != 0 )
>> @@ -1675,13 +1682,15 @@ int hvm_vcpu_initialise(struct vcpu *v)
>>    fail2:
>>       hvm_vcpu_cacheattr_destroy(v);
>>    fail1:
>> -    viridian_vcpu_deinit(v);
>> +    if ( is_viridian_domain(d) )
>> +        viridian_vcpu_deinit(v);
>>       return rc;
>>   }
>>   
>>   void hvm_vcpu_destroy(struct vcpu *v)
>>   {
>> -    viridian_vcpu_deinit(v);
>> +    if ( is_viridian_domain(v->domain) )
>> +        viridian_vcpu_deinit(v);
>>   
>>       ioreq_server_remove_vcpu_all(v->domain, v);
>>   
>> diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
>> index c0be24bd2210..1212cc418728 100644
>> --- a/xen/arch/x86/hvm/viridian/viridian.c
>> +++ b/xen/arch/x86/hvm/viridian/viridian.c
>> @@ -1116,14 +1116,14 @@ static int cf_check viridian_save_domain_ctxt(
>>   {
>>       const struct domain *d = v->domain;
>>       const struct viridian_domain *vd = d->arch.hvm.viridian;
>> -    struct hvm_viridian_domain_context ctxt = {
>> -        .hypercall_gpa = vd->hypercall_gpa.raw,
>> -        .guest_os_id = vd->guest_os_id.raw,
>> -    };
>> +    struct hvm_viridian_domain_context ctxt = {};
>>   
>>       if ( !is_viridian_domain(d) )
>>           return 0;
>>   
>> +    ctxt.hypercall_gpa = vd->hypercall_gpa.raw;
>> +    ctxt.guest_os_id = vd->guest_os_id.raw,
>> +
>>       viridian_time_save_domain_ctxt(d, &ctxt);
>>       viridian_synic_save_domain_ctxt(d, &ctxt);
>>   
>> @@ -1136,6 +1136,9 @@ static int cf_check viridian_load_domain_ctxt(
>>       struct viridian_domain *vd = d->arch.hvm.viridian;
>>       struct hvm_viridian_domain_context ctxt;
>>   
>> +    if ( !is_viridian_domain(d) )
>> +        return -EILSEQ;
>> +
>>       if ( hvm_load_entry_zeroextend(VIRIDIAN_DOMAIN, h, &ctxt) != 0 )
>>           return -EINVAL;
>>   
>> @@ -1172,6 +1175,9 @@ static int cf_check viridian_load_vcpu_ctxt(
>>       struct vcpu *v;
>>       struct hvm_viridian_vcpu_context ctxt;
>>   
>> +    if ( !is_viridian_domain(d) )
>> +        return -EILSEQ;
> 
> Nit: we usually use EILSEQ for unreachable conditions, but here it's a
> toolstack controlled input.  Maybe we could instead use ENODEV here?
> 
> As it's not really an illegal restore stream, but the selected guest
> configuration doesn't match what's then loaded.

I'm a "working bee" here and can change it once again her to -ENODEV here.
But It will be really cool if it will be agreed on Maintainers level somehow.

EILSEQ was used as per [2]

[2] https://patchwork.kernel.org/project/xen-devel/patch/20250919163139.2821531-1-grygorii_strashko@epam.com/#26579990

-- 
Best regards,
-grygorii


