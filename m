Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3084BC9A4C
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 16:55:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140700.1475499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6s36-0005W1-30; Thu, 09 Oct 2025 14:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140700.1475499; Thu, 09 Oct 2025 14:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6s35-0005UW-VQ; Thu, 09 Oct 2025 14:55:19 +0000
Received: by outflank-mailman (input) for mailman id 1140700;
 Thu, 09 Oct 2025 14:55:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VZ0Z=4S=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v6s34-0005UL-FW
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 14:55:18 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f83e76ea-a51f-11f0-9d15-b5c5bf9af7f9;
 Thu, 09 Oct 2025 16:55:17 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU0PR03MB8440.eurprd03.prod.outlook.com (2603:10a6:10:3b4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 14:55:13 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 14:55:13 +0000
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
X-Inumbo-ID: f83e76ea-a51f-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/7vyEME3YlbSnUE1ddzIscc0DM8IScuv9/G0eMt31NB/F5TDhqDh4ZfjnGtgyjkjPJ7FhONiJrj6WZhHJamDETFF0MP2GGmrviKHeD+lw5KT9+wcn8j2RrMW1h9ttWx/m0c02Pe5Vzx+Xf+wRwq2NcihgjtSPaHyxuSc+13R3lqA2cvLKqoquG94/hHbBWtx+xxlP3gh6Mf1hgUbhz83TPc0SQ7DSMKz6LsmMCYagwwbOwLYTEM0C1gLbWPuo9brw/SX1tU7Uir2jf22L42MDjOp4if7Gdb8ZA2DwZ7s9qENBA5WjIc5AZPEJG3OFxbml9IpdxKXhuWgy8+FsuI1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FoRRyf0zVWWasqZQ08H7PUBwiesnlWet7TQlo9f5Lb8=;
 b=tV+244KQUxsLR24dhYzW44MdeAA7Ib2WSTSRqT35laaxpr28JF2YbNYMjXJ9hvlp0wDWqOdA3EM31C6UDyQlG56s1/+ezO/96MZAu/booI7iRJ+5dUbo2KFYasAoU7J2U3AYbnjzyROCpX5y+ExTucI1e8rX0lBaumkdRIy5pcdSgyWXHK8pe1pm6mrTtf9eoYbkBVs1UmWKl58KVMI1FfjMcCcQRM+DMKm2HblEHsEP5WwuxIc0WuGW/uRftulAFHBgacqqWl55ONYMl6WU/jDh+rC8axpHl6FIrukHKYCM/yVcVxAjCgpLxuBZc/HIO0hggoLAFO+fRhtlQi8iTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FoRRyf0zVWWasqZQ08H7PUBwiesnlWet7TQlo9f5Lb8=;
 b=LmpKSloYl7ZwfeyRT1BMC2WZhXCSh2PQhSgK9JgTC2DtJ6YcWwrmZtK31M5Y7xB3d3q8NwS+JuW+xA+flHkbCychc7JhsrfMbSGFCIQqFtpHwAIggIVzohP36dEMXciJWvt+LaB4Z67gbHskHT91y89mt4/pofm5Tl7QG7YHrkG4uyKsgJQRIQAU+A0qi+ak6kDDRoXW3harv/pm6gi7uquFkD31yJ+cUdSxSYIpD9wYLQyAYQAbRiW5wDWGU8MKX1Svrb39mYwdYsG1c1BKYhhN3IlAOzG+9CAJQ/1iVxTnBw7Uhc7OidDTALdokkUUCuS007uapCqEAOYfE1ZmQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <a80dc58d-a6b7-4de4-be1e-7c2fa03b17aa@epam.com>
Date: Thu, 9 Oct 2025 17:55:12 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/hvm: vlapic: fix RO bits emulation in LVTx regs
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250930190550.1166875-1-grygorii_strashko@epam.com>
 <DD733UWP8JVK.SSX8U5ENELIE@amd.com>
 <3715a68a-dc35-42f4-99e2-e1a45ebd1b16@epam.com>
 <ad2818bd-bf36-46b9-89f3-ffa8b9dd364a@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <ad2818bd-bf36-46b9-89f3-ffa8b9dd364a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR5P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::20) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DU0PR03MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: 2800493b-29a5-4b25-e91c-08de0743d9e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UTJEK1VvN21PdnFjaVJhclIyOEZOcUFJS3hYME5VSG5uSXZ2TzZHR1VBSlZZ?=
 =?utf-8?B?U3N6eW5SQXFPU0tSWkZsVGxzY2NIT202TXlLc3hGZElpeUdneUpoWnNKZHJN?=
 =?utf-8?B?cGZUQ0luekNRNUtjdEJMSi8rSEQ1N0sxQ3ZjQStvOWt2OG5jd0lyTDRpWVo5?=
 =?utf-8?B?aHU4V2tpN2V3N2tObm1idVpwV1ZUbitxb3ZOazZoUDVSMlBNamtXMXNMLzVn?=
 =?utf-8?B?WDlSNVZobnpyN2g3SUIxR252RHFxZURPaGhVbFFwUjJQZm15MlNJd0xRSWFx?=
 =?utf-8?B?QTYvTC9rOWFaVUk1VjBtQkxpdWNQODZ1UFo0aEZsV3Jwc0xBVDZCMkZ1Nmkz?=
 =?utf-8?B?NXVjK1NwYUlWRzlQRXRFNWZuRUZnOTR6ZGdrbE1uVSs4M1ozVmZFZlg2S0pm?=
 =?utf-8?B?SGc5TG10cUtsZGtZKzI0eEVlRHdFditnN1ZHNG4zOTBha0hiUlByc1JGTnEz?=
 =?utf-8?B?TGNhWUY0dm5QSEk5dk5pclRkZnU1ZXcrdlJDZnZzUmFHMFNZQ1Z0anBnb0Y4?=
 =?utf-8?B?dCsxSk10bkx1TFhlc3VIbGExeDVyWUQzMmpFZlhESnVRTmpYVW9QWmhLU2VY?=
 =?utf-8?B?YlJjejQ2K2ZwY0lRUjcvRzhVUUg1eE9OSkhzZ0M1WFRBaEdVc2hDMWRmWklI?=
 =?utf-8?B?cHd3OE1ra09nQ2poTTE3T0RidFZtMFd6cFEwSm0vZmkwMGxnd3dIVjdTSHdh?=
 =?utf-8?B?VWlrWmloOXlyY3JYMzZnY09EZEZPY1lMN2FVWkUrT2h4S2VQRWpoUm8zcmhD?=
 =?utf-8?B?MXFDQW5ONzBlMTBYZWlGT1hUdFBvdnY0VVhOZjZlTGdNTXI0NTlMRlRQNHVZ?=
 =?utf-8?B?S0tTUTVDMFBMaHdIOEJsOWpqSnR4OUh5OThKOXgrcFFUNWlpV1BBTEV6dHI5?=
 =?utf-8?B?b240UFhIOXp6NlV1anB3TlFGV3VzbGZaT0M3eXV1VDdOSFZBU0Z3bEExajRE?=
 =?utf-8?B?TEY2dDNpbWl0RUtZL1grZGNPWGRVbXJsVmVRSHhQd0lGem5VSXYycitlT1NQ?=
 =?utf-8?B?eGRTQ1ZBRGpFRy9ycWc5b210V1VSYkVINWlFUXRIZEk0QndXVTBFTTQ5RDFa?=
 =?utf-8?B?clc4eVNpbWdnS25DUnVyaHJOV09qdEwzaFNiK0xFNnJFeVBtOGxoOWtLRzJw?=
 =?utf-8?B?NVBnK0hjbWp1TVd5WCtKcUdXUi9uWGdRVlorTTE5T3luYXJrRnVFVUNlUllL?=
 =?utf-8?B?eTBNb201eVhUbER6d1BTZmVYeGd0MXVTOEtZSmxMT3VEVW9RU3FOY1NHL3gv?=
 =?utf-8?B?VzJ5QXo1b0tudXdmTkV3aGdESExJV3Q1aUxKSXBwRG9ldFVtL3pXcFdjYVJQ?=
 =?utf-8?B?S1craDBicnJEaktZZjJJOG4rRG03Ky93R0lKK28zZUF2WXN6VzlUdVJWMnNG?=
 =?utf-8?B?LzRtemF6OENxMzQzZXJTYzY5Qm1NMVhpVCtxYTdzcDJtQkRucURQTlZwSUU2?=
 =?utf-8?B?YnRlczhmRmZyejNrYXlFL2p2MkFKOGZ2RHg2dnQzWjVFaDRKSzNHeG9iOVhl?=
 =?utf-8?B?dzdaSDRuZi9nYllFN2ZtOTNqcm0vV3JMTGhoeXVuM1RWNVd0amQ2N2VNcG5q?=
 =?utf-8?B?ZUs2NUZpdTdrZUh3OG41Q05neGdFZGhSMWpxT2R4Z0hMdEpqMkxCMFRCSHB6?=
 =?utf-8?B?S2I1ZW5hcjJ4NGZCb1ZmT0dSZXhLcHBZMzdnRUh2d2l0R05MSGh5amZIcEFo?=
 =?utf-8?B?RjhLYXJ6SlpVN1ZWTjM0R1dWRzJYWU5WSmU2OG1MTXNMb2hMYWlhcVJjY3Ur?=
 =?utf-8?B?UVlWazZDT0hEd3lTZXVBUmw1aStpQjB4cWkrTDVlRmxWdDh6MmRITFBIZWo0?=
 =?utf-8?B?WnFINUNUK0R0ME5oNmE2Y1lHRkxnM2NQS2Y3SDA2eWdYdkh3WXpPRDhuRGVK?=
 =?utf-8?B?dWl2bW9yQUpqeUE4QlpCNU9NQk0rOCtlM1N3ZWR4RGVaeXdhbzhLRU5admIy?=
 =?utf-8?B?WWt4N213STlKQ010elhpdGtQc1VId0hnMHlFZUVVK2JNYkNObEtWWkdVS0VI?=
 =?utf-8?B?RXFXekx5QnBnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enFyTWt5cVFNYXEwcDBTWE9vbi9qZFhXUm54V3ZQRDJ2SHJSWS9UNlJQcW5O?=
 =?utf-8?B?VGp3dFZOdlp2b2NEWm5ELzZiSW5FS1JGNjREZUhjanh3VjdKQmFwVU5ieUc5?=
 =?utf-8?B?RXBkTHZncEZEM1dxeWEreDQ3QkRoZm1vRnU3VXFaTEpreGw3a2dGNDF6V1Zi?=
 =?utf-8?B?ck12UmFMTlh3Qlo4MFRHV08rczZQTDRML0lBbml3Q3IvTE1DUG4vQW9pMTIy?=
 =?utf-8?B?Yi9wVjFGV3FFemxqYnE2aHFrQjVmQzBjT2J6bGdueWNLdzRuVFp4NXJCVGFI?=
 =?utf-8?B?cnpLdW5FYmdEQllqUFFDdWFZaDRxNkl1WWVIZmlGMTlNZ0VYZXlDVHBENnVZ?=
 =?utf-8?B?NitTMjFzQ3hlN1Z5ZzNHSkZhMkMxdXBvaUNOQ1ByaXNBWHRuby9mb1RQWElE?=
 =?utf-8?B?MDd5M3dUT2JuckhKM2V6SEVRKzBiNjVoeVVrK1prU2ZVRGNhcVBUbVlUTkpp?=
 =?utf-8?B?dVpJckQxdHBvLzdaVmJwekQ2clNTdkttV3VocUMyTHEyM0tzTmNDNlEzbkJS?=
 =?utf-8?B?ME1DakNvL3RCaUNKenVHbC8ybzduRlN6OTliakx0Qy9oMVFBaW9SMkFjV3JH?=
 =?utf-8?B?QjBJM3FYWEMxT0IxU2d2ZFVxZjZpQklNY0NuMkNwK0pQRjRyL2VaczdBMHFs?=
 =?utf-8?B?Q0VwRnNJUXVUU0hlV2Qrd29VSnhPWXFmU1QyemNxYUJXT21ia1h6Rmd2Nmw2?=
 =?utf-8?B?WDhDa3pPMVFLL1FMN1ZZRnlHbEhLc2QrYytmM0F6YmZUWGJEWmlpY3dkMEZZ?=
 =?utf-8?B?ZkVsVUdKMkVoVTdaZDdEbkdtUlZEejlQVGlubXArSFc4QXpTQ1hEY29vVGww?=
 =?utf-8?B?dmlRYzdkZUZTVFQ5Q2E4YmVHTmlmT2lFU1RpTW96MDBuejJ5d3hYRU8yaytE?=
 =?utf-8?B?QkFyajkzME9JRnZHaWlvT2FmMjRWdkpZazBsNzhxUVZxcGdJMXdkdFc0YW93?=
 =?utf-8?B?ekFNZ2Fqd2RWdGFHRUJFQTNpdjZOenhMQndNNzBGWXRlMll1ZTZwRGZzTVgw?=
 =?utf-8?B?QU9sYzB1dkF4OFFnUnVEYjRoSTErM1BhZFI4enZYTVN1TURmenQ4NmxtODNt?=
 =?utf-8?B?OGhRb1BieXd4eUpBZEwvL3hSbWpBNk1WRFFvTmU1Nmw2dVdqTWl4amJ3MEo2?=
 =?utf-8?B?VDNhdCtvTE9oMWExd2NwdzJFZjZKVks0OVdFb3B2ZGVJNnJZMERJRU0zK0VC?=
 =?utf-8?B?VEVWa1ZhN2ZnUE9XYVVFbElkMElBVjQvSzRuU25WcmpQQkI2cHVQT3V6Zjdh?=
 =?utf-8?B?ajN3Q2c4Q0l4SHhkdWtCdi9xbnVFY09JTVNidkYvd08vV3pFS1VTUklHeFRK?=
 =?utf-8?B?ejJiUk1PcThqQmFWSWVNWit2dVArL2JQbEgxeDZkUnVneGdTSk84Ky9BeWJH?=
 =?utf-8?B?WmZaUk5mMzZ3dkkyT1pMNWdWbHBJNXVQTStzeWNDY1RkVlhSMVhjSGFqREYw?=
 =?utf-8?B?bEpzUi9aKzRMa2h3M2FmTkFiMHY2TzgyMDIxak1IMkF6dEs0VG13VlQzQ0pP?=
 =?utf-8?B?aE1jV0hmTktyOXVCbUhZZ0ZRc2IxWnZnRVFWQVZHWWU5YTljaDhudzBSZkk3?=
 =?utf-8?B?UGZzS1RtMDgwN3k1UHpFK2RBQVgvM3g3Z2dtMnFqeUhUaU9rbmhldVR4UE9s?=
 =?utf-8?B?cEpoZWluck9XZ25lYjhFOWFmbFNHTVFFcWlLNk8raWI0U1gweFF0SFlCTGtT?=
 =?utf-8?B?TUU2ci9PWVRWa0tXTTBDeExxaHh1aE1VUUd2MzNKWkZ0U2VzbmRYbXVhdElQ?=
 =?utf-8?B?U1FTdldnUEZOdDhTaE13bFVZRWVFY1c5SDFYVVI3SjNnSXp3eXlvSFZPMzBF?=
 =?utf-8?B?RHFDa0I5c2Q5bzFFZXJMRlV5UHNRSmlpR2JYdkd2S00zeStoQnhlYmNOdHVZ?=
 =?utf-8?B?VG5rME1yRmRjRkl6RUNaOFhJbWNuRmt3SkxMblVPb0NJb0hCcVQ4NTFTQkpL?=
 =?utf-8?B?SE02RE9QRjc0MTdvZmtKR2FNeS9ZMEhKN2Rsa1FQeHp1ZlFma3o0cjNMZm1Y?=
 =?utf-8?B?VU9Fc0RIcUE1NC9QL3RBenNzSEExcW1qN1JEZ3NyMDZXOHBFTkxtekNhbjNp?=
 =?utf-8?B?YnRoZCthVk9yelVSaGZVcGJBV094d05qN3FyM3hxYXFBNmpkL0pKRzlPZVBB?=
 =?utf-8?B?akJUZmFUZ0EzTlU5VUFXb2JvMjdDT1RXWjBUaklQZ01rYnp0NHVtZldLWWdC?=
 =?utf-8?B?YkE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2800493b-29a5-4b25-e91c-08de0743d9e9
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 14:55:13.5499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tzfSziwEzWOxL2flYqehZezUwIjXtx8yI+cXkwx5QfprW+qveZ96bak7RSVygDuUhMeEmhQeq4M7qZP9fo4CjGvjj3FRKnwtR5tZDyWSzLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8440

Hi Jan,

Thanks for your comments and support.

On 07.10.25 18:35, Jan Beulich wrote:
> On 03.10.2025 16:04, Grygorii Strashko wrote:
>>
>>
>> On 01.10.25 18:18, Alejandro Vallejo wrote:
>>> On Tue Sep 30, 2025 at 9:05 PM CEST, Grygorii Strashko wrote:
>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>
>>>> The LAPIC LVTx registers have two RO bits:
>>>> - all: Delivery Status (DS) bit 12
>>>> - LINT0/LINT1: Remote IRR Flag (RIR) bit 14.
>>>>
>>>> The Delivery Status (DS) is not emulated by Xen - there is no IRQ msg bus,
>>>> and the IRQ is:
>>>> - or accepted at destination and appears as pending
>>>>     (vLAPIC Interrupt Request Register (IRR))
>>>> - or get rejected immediately.
>>>>
>>>> The Remote IRR Flag (RIR) behavior emulation is not implemented for
>>>> LINT0/LINT1 in Xen for now.
>>>>
>>>> The current vLAPIC implementations allows guest to write to these RO bits.
>>>>
>>>> The vLAPIC LVTx registers write happens in vlapic_reg_write() which expect
>>>> to implement "Write ignore" access type for RO bits by applying masks from
>>>> vlapic_lvt_mask[], but vlapic_lvt_mask[] contains incorrect masks which
>>>> allows writing to RO fields.
>>>>
>>>> Hence it is definitely wrong to allow guest to write to LVTx regs RO bits,
>>>> fix it by fixing LVTx registers masks in vlapic_lvt_mask[].
>>>>
>>>> In case of WRMSR (guest_wrmsr_x2apic()) access to LVTx registers, the SDM
>>>> clearly defines access type for "Reserved" bits as RsvdZ (Non-zero writes
>>>> to reserved bits should cause #GP exception), but contains no statements
>>>> for RO bits except that they are not "Reserved". So, guest_wrmsr_x2apic()
>>>> now uses different masks (than vlapic_reg_write()) for checking LVTx
>>>> registers values for "Reserved" bit settings, which include RO bits and
>>>> do not cause #GP exception.
>>>>
>>>> Fixes: d1bd157fbc9b ("Big merge the HVM full-virtualisation abstractions.")
>>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>>> ---
>>>> Changes in v2:
>>>> - masks fixed in vlapic_lvt_mask[]
>>>> - commit msg reworded
>>>>
>>>> v1: https://patchwork.kernel.org/project/xen-devel/patch/20250925195558.519568-1-grygorii_strashko@epam.com/
>>>>    xen/arch/x86/hvm/vlapic.c | 14 ++++++++------
>>>>    1 file changed, 8 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
>>>> index 79697487ba90..2ecba8163f48 100644
>>>> --- a/xen/arch/x86/hvm/vlapic.c
>>>> +++ b/xen/arch/x86/hvm/vlapic.c
>>>> @@ -44,15 +44,17 @@
>>>>    static const unsigned int vlapic_lvt_mask[VLAPIC_LVT_NUM] =
>>>>    {
>>>>         /* LVTT */
>>>> -     LVT_MASK | APIC_TIMER_MODE_MASK,
>>>> +     (LVT_MASK | APIC_TIMER_MODE_MASK) & ~APIC_SEND_PENDING,
>>>>         /* LVTTHMR */
>>>> -     LVT_MASK | APIC_DM_MASK,
>>>> +     (LVT_MASK | APIC_DM_MASK) & ~APIC_SEND_PENDING,
>>>>         /* LVTPC */
>>>> -     LVT_MASK | APIC_DM_MASK,
>>>> -     /* LVT0-1 */
>>>> -     LINT_MASK, LINT_MASK,
>>>> +     (LVT_MASK | APIC_DM_MASK) & ~APIC_SEND_PENDING,
>>>> +     /* LVT0 */
>>>> +     LINT_MASK & ~(APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING),
>>>> +     /* LVT1 */
>>>> +     LINT_MASK & ~(APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING),
>>>>         /* LVTERR */
>>>> -     LVT_MASK
>>>> +     LVT_MASK & ~APIC_SEND_PENDING,
>>>>    };
>>>
>>> This is a bit messy. Why not have 2 masks? One for rsvdZ bits, and one
>>> for RO?
>>>
>>> That ought to simplify the logic in both the MSR and MMIO cases.
>>>
>>> MMIO would do RAZ/WI on the OR of both, while the MSR interface would gate
>>> #GP(0) on the mask for rsvd bits only and ensure all RO bits are preserved on
>>> writes.
>>>
>>> Thoughts?
>>
>> I've been thinking about the same and It can be done, np.
>> I always trying to make "fix" with as small diff as possible
>> considering back-porting.
>>
>> How about "follow up" patch if there is an agreement to proceed this way on the Top level?
> 
> Doing it in two steps would be okay with me (I expected it to go that way
> anyway), but then it would still be nice to limit churn some. Specifically,
> taking LINT_MASK as example, can't we do
> 
> #define LINT_RO_MASK (LVT_RO_MASK | APIC_LVT_REMOTE_IRR)
> 
> #define LINT_WR_MASK \
>      (LVT_WR_MASK | APIC_DM_MASK | APIC_INPUT_POLARITY | \
>      APIC_LVT_LEVEL_TRIGGER)
> 
> #define LINT_MASK (LINT_WR_MASK | LINT_RO_MASK)
> 
> or some such, and then use *_WR_MASK in the table initializer?

Huh. I seems lost a bit, so it's time for ask for more clarifications.

I was under impression (seems wrong) that this patch is ok in general, but
more improvements need to be done while here [1].
My situation is simple - I have a broken safety test with obvious reason "RO bits are writable".
And for me fixing a bug (in most simple and fast way) is a high priority.
Then whatever optimization/improvements/refactoring (while have time slot).

So, what need to be done to get the bug fixed and fix merged? (preferably in 4.21)

Should i update this patch and port here "do LVTx masks renaming and rearranging to x_WR_MASK/x_RO_MASK" part from [1]?

Will it be enough?


[1] https://patchwork.kernel.org/project/xen-devel/patch/20251009114249.1964387-1-grygorii_strashko@epam.com/

-- 
Best regards,
-grygorii


