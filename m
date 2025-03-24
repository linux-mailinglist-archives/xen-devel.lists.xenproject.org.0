Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D448BA6DCE8
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 15:25:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925668.1328542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twikE-0003Ta-Ml; Mon, 24 Mar 2025 14:25:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925668.1328542; Mon, 24 Mar 2025 14:25:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twikE-0003RF-Iu; Mon, 24 Mar 2025 14:25:38 +0000
Received: by outflank-mailman (input) for mailman id 925668;
 Mon, 24 Mar 2025 14:25:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r2bg=WL=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1twikC-0003R9-MC
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 14:25:36 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20608.outbound.protection.outlook.com
 [2a01:111:f403:2606::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9031161-08bb-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 15:25:34 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by VI0PR03MB10614.eurprd03.prod.outlook.com (2603:10a6:800:269::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 14:25:32 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 14:25:32 +0000
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
X-Inumbo-ID: d9031161-08bb-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J12mpLc43AYRLCLos+5xhcpESW4Cxy9FgQN4E1GSjerihuEvWBI+oVPgH55jg4Vh8FCy4P0nu5Hc9Wnq5utrNr5SeGoSlhfyf7Xju4nfyrYYN82EV7pv0ZoLpITRuvxw+X0liaxKblnn3zYaUhYFw/TyvBSYmwOgDrLtCfhsXyPS14QkuxRQGt0zLDkI0kxk2yQ3fw7b+cH5TuUqtrbm0Afh0N2ljWWjcLUpxwU1Zne6Fkg//gSY9Poj7mjxzdifgQPG8YJvRMqPN2ubh0iQf2E75pfCvdxvfAOv667zpakV6Cd4R8ioVb8bVE1N1i+UlN0fp5JcjFVUBdlsMECB+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BcCoAHYQ5JafEmtZK6LpQgE7WrMUtPnG+SB+M9l0CmQ=;
 b=pEze5qUMaPaDsbPM0S/CMXw7L9hMLlh18ceeyVZLbA4rxzOFNwvd1tBlJwYJnWt2mLC4wefndgRy2qNXf2scIua8Y5Cfpt+qAxrOb5cHgdT2bcqZDh8Oq5b0JQbL1QeSN1L463wMhbUneWY0YrwK4lG+uoxJ7LirbMhWfbg7WUcnj/1JCmpo3nmcP0DfRL4D8FPcNViK4qeE/XHFW8ALWRbwjUEA1wuO5LLL6Wjr7ad9jK3WkZZUDCEDqAjqxHlrRCVLWvNaBYxySRw37o+TGNRjkrhJV/xOWLbFfF9GnOzIL8r1aB4L8WLk1wxnxERFsD6QATt/4YtA1P7EN/pO4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcCoAHYQ5JafEmtZK6LpQgE7WrMUtPnG+SB+M9l0CmQ=;
 b=QxCcaX5gwFPveiIq4MtNz3RWx/kNem/7fJV+Rud+n26Jv1y2dm9DMQ/+PpDr6OA6BMS1sLkM0JkbN+vsGPTT4hR/zxBBiFFmvvDHKEMwok2yPhicmIO85+m2cn0yFj8e2usKI+uAo/wLLLOJGcxDeohot1fbWz7ooc2qbnxiFL5uhYxtsNV8GIokcSLSSDU+UxtIntn33+O/sM5fRC8Y1dxHD8Bf+F8HuHZ54gu3zLPK/ZNV4fwH9fr9TLu2/aSD9ztuH4NHfFGlgStT2BsDwB/06UBPPt8HrR1Z3XvNcplx0GaQqRjpd9JABA2+yCm/f2dL4JwtbzJLtPsW2jwpgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <53758670-ca39-4df2-93be-5dc417231f1d@epam.com>
Date: Mon, 24 Mar 2025 16:25:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/7] xen/arm: add generic SCI subsystem
To: Jan Beulich <jbeulich@suse.com>,
 Grygorii Strashko <gragst.linux@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20250311111618.1850927-1-grygorii_strashko@epam.com>
 <20250311111618.1850927-2-grygorii_strashko@epam.com>
 <6a0a3b3d-9bbd-49da-a37c-eb1cbad94cc1@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <6a0a3b3d-9bbd-49da-a37c-eb1cbad94cc1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::17) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|VI0PR03MB10614:EE_
X-MS-Office365-Filtering-Correlation-Id: e16e8b95-4d9f-48ed-d56c-08dd6adfbc18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGhSUTlScHVDOWpRWUlXbDFNdU5JNHVJbkNXd1dKMWtVeitpcWFWdllmczZh?=
 =?utf-8?B?NmxhTURyRjVSLzB3NWdGRGFkdlczRWxndzIzajZIbEdJZFNFRC9EWWV0THJL?=
 =?utf-8?B?NGR6ZzArTWQxRG9ldWd6cklWVXlpMVhpbU9ZeTZPQmxVVWtkSjhick10T1Vn?=
 =?utf-8?B?bFR6LzhLdzVMcW4yVFNNTWcrdzhpSktZY0g0eVJVSHA5OSs5dzF2d0dWZ1Vy?=
 =?utf-8?B?TXJTTzB6d0diaUhDUVJQSUlGeS8wY3dYa1V5c092bGsrUUFMcVNJSWZrVklr?=
 =?utf-8?B?ZGtSSnNjbk9tTktDcklCZVptRjl3OGQ3ckJYcFM0akRlMEhiR2U2SEtydGpt?=
 =?utf-8?B?WmZtK2ZtVTdmam9nS0hIWWYvRWpVZDE2bE0zYlJVNnE1K1Z4dUlLT29MZVRX?=
 =?utf-8?B?Uk8xMTRPZnV4aTVmKzFnVUNSRC8xWURFOFAza1ZKNmkxelpLb0IrRE40bzBn?=
 =?utf-8?B?M1l3cmpkSk1Jamw2OXFvSTRYeGZQMzRRYWdXRE4xZHlmQVAyMWxWb1VCeGtO?=
 =?utf-8?B?LzFPSDNmNGk0a083TTZpWTZUcmxocGpnelM2SW5SdWVuOVM5cUNBeUFUOXB5?=
 =?utf-8?B?b0FzdXZDT1JoYldOUjlNV1RnVERvSWxJb3lUNGRvUmt0cy9yZDI4WHpXSFVG?=
 =?utf-8?B?T3VZaCtpUWJHMkxJbWd3M21pU2ZHYlFCR0w2TVJNdGYwUTdsZis4U3ZaSVY3?=
 =?utf-8?B?dGdxa0lPY1J4aURYd2tnMWZkUGFsd0dMd3ZqV3gwdWVqdWdPS1dyUXFXOG1j?=
 =?utf-8?B?VkVtWVBWb1llQWVYSlRUc0lPMlpCMU9mTHdqNGtpM0Z2aXRCelVNSkVzWXBY?=
 =?utf-8?B?dG41R1BmbEZTTE1KR2NMR09xRHNkUWlNd084MFhNN1lVb2d4aVFWd0xucmYr?=
 =?utf-8?B?OTEvalFmUVFjMGxHZHo1NWNFWU9hR1E2bjB3T2pBZStONDJDazB3bHd5cmRo?=
 =?utf-8?B?SzE5Q1ArTFdxSU91VDIxbGNxdHVvMTlwbVA5cmNqTGtBMEwzMzVsaW5MdFVD?=
 =?utf-8?B?VUtFeTljRGxBWEYyTVY2c2QxK1Bab2JtU3NVM0NMWHRSQmlhTUpWUG9FSGdw?=
 =?utf-8?B?cTVwb1BJUFAyS2RJRVByL25yb2NHYmdzblRPb0taVnVkZHU0QUtiQ2xQVkhh?=
 =?utf-8?B?K1FKdUZLQjVFYXVZWk5qYnBoZlN6STVvSnNGeW9XUDJNV0EycWNaaklKdS9k?=
 =?utf-8?B?MUN5amRKWEo5Y2Q5QTFLUzcxOXlPQXJVb1JRYVhZTXRsM011aVZId3dncFMx?=
 =?utf-8?B?YUFnNDdqeHJKbXhvNjk4a1M5bmF2QlI1VldTdTJvWkZFZFA4OHF3OVQwREk4?=
 =?utf-8?B?UHNQWHJ6YVA1TFRYVE02a2ViOGdxRjdxYkJiU2MrejNSRGpCNWpJdU4vNGVr?=
 =?utf-8?B?elcxa2ZSUTdGREpEcVBpOVpKQUFBTFVZSUFxVXZnTk4xMnowT0pzZUFONFNs?=
 =?utf-8?B?ODJhZmFZUk1FL01KNUlIcm11OXJobEZIQVZBd2FQQTVsWkdlZHVEQXFoSTBH?=
 =?utf-8?B?KzdTdDZOR0NySDBKM0xnZmVHMkpkeVlwdlpMZ1RwTUZwUmZIbmtGZjYxRTdV?=
 =?utf-8?B?aXo5dEZYSTFPYnpscEpnc0VlNEIwWkV2a2gzZkcxSlJJYndsOWhhdnZZNmxY?=
 =?utf-8?B?MjJyRWt2NENnbUxZMDJIUzNxanF2cncvTE9TZEtsbTV3S21YeGYwNkFQQlNm?=
 =?utf-8?B?RDRkVXZQLzJEWnM1blBscjE0QUw4eEowQVVDSUN4VVBNYVRXblJBbEtFeFcw?=
 =?utf-8?B?SUpUeTQxL3RVSllieDVEampnM1pCdENIbnJ6VzlOZUZZc2gzMitnd1FNQ2U5?=
 =?utf-8?B?MS9udjhPWGxGb2tMQXhGNTIvU1FhOUU1Q2VIU1dDRGRGc2FVb1pqSGY2QVZM?=
 =?utf-8?Q?G/M5K34tmpANd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXZtcUZJUnU3TDVuaGtpUjl4MjhLQmZUK1AzZnhmQ0hXdEZMMkdKOCsrSFBy?=
 =?utf-8?B?S0M4VmVjQVlRWEJrR21ib0JuQ0YyTTZkclJWODkyOE1CV1RuV1FYOUFPOEEw?=
 =?utf-8?B?aFFNTkdnV2Z2NVhxM2U2YUlvTFpHUVJ3ekVrYXY4VEp4MGRwWkk0NnZvZnFt?=
 =?utf-8?B?MVZ6ZHFnNmNhby9DWVhXMjJueCs2N29zVVU4NlpVb1NGN01Ga0MvaHNSTVJk?=
 =?utf-8?B?MmV6VnRMczd4UkRta1JzUFI2UjdQNXVKbDBkaWUwL1czTmZ5dEpybmpYTVNm?=
 =?utf-8?B?WjhoRkI4eU1uMUp0Si9kY1JZaE5wSXB4NFhlWm4zWVM2TDltN1YwdkM3UnNu?=
 =?utf-8?B?d1MxTUZ6eExjMFVOdGxLVzR4N3BYZ3poTittRjg2TVpxTis4SkZ1OHlUUmFY?=
 =?utf-8?B?dnc5bHhhelVmSUlJK1NRY1UzQWVRRTNoM2pBSXVvTG1jU0pkRTc4dHl3RWs3?=
 =?utf-8?B?OTB5UnZzVU1Oc3pML2Z5M0dnblIzb3lOaGhuMnNMR2pGVlFBYTJOcDNEZWxv?=
 =?utf-8?B?MmJCNVN5cVpvL1pJMkZIUno1ZkpUN0l3WTRuNnhmVWFxanFCeFBvSnJFZDA5?=
 =?utf-8?B?THJub202S1ZIVE5MUXNwbEJBYkJhVnJQV2Mvb3NtVkJlSERuR2dnMkZhTDBN?=
 =?utf-8?B?NnVGbTNGUkVuZG5LaE1pVDhMZFo0L3loSUFheFUrTzRNd3lnWXBiTVFKWXNG?=
 =?utf-8?B?R0hoYkF3Wlh3TGc3T1dqTG5ubW0vNElCcWNvQzUwRjZqY29nQWswMFM2c3po?=
 =?utf-8?B?aWZSZ2x2ZUJmNFZURVB2aXNnUUx0S3QvWFI1ZGJJazdOVEJKMnRoQ1RlZzUv?=
 =?utf-8?B?SGtTblRseVZEOHZHa3hLVUNXcW45aWdFV2ZhRU1oSHFpOGZGK0YwT2FZTW9r?=
 =?utf-8?B?aytNalQ2cFVaZTJZSGtvL2tuTk5zYVM2cGxuUWpSc1lIZVI0eWdvTDM3cHhF?=
 =?utf-8?B?aFJ1U0JhTURnVTVjaFBVVnQ4L1A4UlZkOW9Zc3RGaytWQ24vWEVxbVVzbFhC?=
 =?utf-8?B?UEdyY0RROEl2U05tUnNPY25MSGpyc0x0K1JSWHk1RU1NWC9xS2svZHgyMCtY?=
 =?utf-8?B?UWtCOTlJSHZwZGFiTlJLTHE5TmZlU2pTTWQwVEdEYmp3OUJmNXFFZlNvNXlm?=
 =?utf-8?B?aE5IRVlrdy9ZU2d1L3JTVDNjeFNaeEo4VU1qUFFRanJKSHR0T3JPWDBrcXli?=
 =?utf-8?B?QmRZOTlkelBEWHpMZ1JsK1JCSkFGTmZRK2xrYzVjTHZlNTNGV3I3TmptY0dq?=
 =?utf-8?B?TFlmdzk3Y2EyY0RHU2ZCb2haNEZpU25GUlplckxPditaQ3dOVjkvZDhBOWJ3?=
 =?utf-8?B?eURVdExIZXhGU3VUUzRpU3lxS2JwRVd2S0l2aEc0TndhT2c5MEZGbWpOUXIr?=
 =?utf-8?B?S3VlZy8wMWhDeXdMUkZGa011QkkvZHJvWkdCVGduUmgxOVEzTXNXUEYzekwv?=
 =?utf-8?B?eVRVdnd2UmFKSitoOThVaFNHQUFmazlSdEFmRURhbC9XempVU0VnNUZad1I2?=
 =?utf-8?B?U0ZmdmFQRnkwWlBiZGllVENBTlowT2g1TXJ2Q29rR0xtUndoMFNnREd3ZWQz?=
 =?utf-8?B?MEZRSjczK3MvV281b0U0TklhREdlOUpvTUlpK2J0ZyttVmZuWVRVQTczUWVo?=
 =?utf-8?B?Wk8xMjNMeHBRVG1lUFlra3VmN04wM1Y5OFZWT2JNUGxsOHlHWTl5SHYvMk56?=
 =?utf-8?B?Q0dYZkllNktmeEluRnFwNytCSkl4SllWODZ5MHBLcXJjN3AyNUp2ZDd6SHA0?=
 =?utf-8?B?R25PRzI0MDRiMlIvWUlscHhPcmpVL0pLUWs2V2p2aStjMWt6T0xOaHFPR2hu?=
 =?utf-8?B?bmpOMTAwM3M0Nm91UUI1V09XOGNOSFMzMEplaVhPejA0eXNrZmpkbzJVMnVX?=
 =?utf-8?B?cmF3N0RGVWY0RnlRTnNNK1U4ckhabFgydmFaZWJHT0JubnI4YTZ2emZPY2xn?=
 =?utf-8?B?YzZkeGRnZVJVTjV1VEY2d1NWTUJEaDhKaHlxMksxanVrVk9BcEVHMC9aVVor?=
 =?utf-8?B?SjNwSkpicUpsMW1ja05ldXJ3Rm94cXk0M1NvcWo0YW1iYTdXc2VPNEJweXVY?=
 =?utf-8?B?KzR5MHZFWWIwR1R3SmprVEJGOVl1NDFqMi9KbVVWeVo5ZjNubUVmMUpNaHdx?=
 =?utf-8?B?VXUydXBnT3R4YTZ0UW55SHgzN2Y0bER2bkxRa1JuaWd0ZDlpSWo5N2JtbGRD?=
 =?utf-8?B?TVE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e16e8b95-4d9f-48ed-d56c-08dd6adfbc18
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 14:25:32.4062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NG1ZDSV4HCHYiq/b1RpgAwv7EHoFa/e2YYSkAY5JhSP8IdCLfM3s/HoQq8ZvOlwFy4AgUANgts1LhrVDF3TNiEVmv0Zi519/Ot1UZip4nXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10614

Hi Jan,

Thank you for your comments.

On 11.03.25 13:43, Jan Beulich wrote:> On 11.03.2025 12:16, Grygorii Strashko wrote:
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -526,6 +526,12 @@ S:	Supported
>>   F:	xen/arch/arm/include/asm/tee/
>>   F:	xen/arch/arm/tee/
>>   
>> +SCI MEDIATORS
>> +M:	Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>> +S:	Supported
>> +F:	xen/arch/arm/sci
>> +F:	xen/include/asm-arm/sci
>> +
>>   TOOLSTACK
>>   M:	Anthony PERARD <anthony.perard@vates.tech>
>>   S:	Supported
> 
> Please can you respect alphabetical sorting in this file?
> 
>> @@ -851,6 +852,18 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>       case XEN_DOMCTL_deassign_device:
>>       case XEN_DOMCTL_get_device_group:
>>           ret = iommu_do_domctl(op, d, u_domctl);
>> +
>> +        if ( ret >= 0 || (ret == -EOPNOTSUPP) || (ret == -ENODEV) )
>> +        {
>> +            /*
>> +             * TODO: RFC
>> +             * This change will allow to pass DT nodes/devices to
>> +             * XEN_DOMCTL_assign_device OP using xl.cfg:"dtdev" property even
>> +             * if those DT nodes/devices even are not behind IOMMU (or IOMMU
>> +             * is disabled) without failure.
>> +             */
>> +            ret = sci_do_domctl(op, d, u_domctl);
>> +        }
>>           break;
> 
> Despite the comment I fear I don't understand what you're trying to do here.

It enables in toolstack "Device specific access control" function, which is implemented in SCI FW.
SCI FW has privileged management interface assigned to Xen,
and non-privileged interfaces assigned to guest (VM) and identified by agent_id.

SCI FW manages access to HW resources clocks, resets, etc, which considered shared and
which can't be accessed from multiple domains due to HW limitations.
SCI FW can also manage safety specific resources like HW firewalls for example.

Each device identified by device_id and can have HW resources assigned to it
device_id_res = {clk_1, clk_2, reset_1, pd_1 } - FW implementation specific.

Device can be assigned:
1) to any VM, but only to one - dynamic configuration;
2) only one, specific VM identified by agent_id - static configuration.
The policy is FW implementation specific.

Here and below the case (1) is considered, while in the case (2) - nothing need to be done.
To enable VMx access to device_id (and its resources) the special request need
to be sent to the FW management interface to get device_id accessible from VMx.

In case of SCMI, ARM System Control and Management Interface (SCMI)
specification (DEN0056E) - functionality defined in sections
4.2.1.1 Device specific access control
4.2.2.11 BASE_SET_DEVICE_PERMISSIONS

The HW configuration described in device tree, like in the below example
(abstract, not related to any specific FW, but principle is generic)

Host DT:
/sci_fw {
	#access-controller-cells = <1>;
	#reset-cells = <1>;
	#clock-cells = <1>;
	#power-domain-cells = <1>;
}

/soc/deviceA {
	clocks = <&sci_fw 1>, <&sci_fw 2>;
	power-domains = <&sci_fw 1>;
	resets = <&sci_fw 1>;
	access-controllers = <&sci_fw 0>;
}

To trigger SCI FW it required to pass Host DT device path "/soc/deviceA" down
to the corresponding SCI FW driver during domain creation by toolstack.
And it has to be done as for devices behind IOMMU, as for devices
not protected by IOMMU.

To achieve above xl.cfg:"dtdev" property was selected to be used due to:
- xen doc says
"
Specifies the host device tree nodes to pass through to this guest.
Each DTDEV_PATH is an absolute path in the device tree.
"
- toolstack triggers XEN_DOMCTL_assign_device(XEN_DOMCTL_DEV_DT) hypercall
nothing from above says it's strictly limited to IOMMU-protected devices only.

But now ARM XEN_DOMCTL_assign_device actually limited to IOMMU-protected devices
and will return to toolstack:
-EOPNOTSUPP if iommu is not enabled
-EINVAL if DT device is not IOMMU-protected

in both cases toolstack will fail.

Idea behind this change (and change in iommu_do_dt_domctl()) is to enable
XEN_DOMCTL_assign_device(XEN_DOMCTL_DEV_DT) and so xl.cfg:"dtdev"
for DT devices which
- IOMMU-protected only (has "iommus" property)
- require device access control (has "access-controllers" property)
- both


> In any event you may not clobber the original "ret", if all you do is some
> "add-on".

I'll check and rework return code handling.

>> --- a/xen/include/asm-generic/device.h
>> +++ b/xen/include/asm-generic/device.h
>> @@ -18,6 +18,7 @@ enum device_class
>>       DEVICE_IOMMU,
>>       DEVICE_INTERRUPT_CONTROLLER,
>>       DEVICE_PCI_HOSTBRIDGE,
>> +    DEVICE_ARM_SCI,
>>       /* Use for error */
>>       DEVICE_UNKNOWN,
> 
> This is a generic header - I don't see how anything arch-specific could
> validly end up here.

Huh. Not a long time ago it was ARM specific only.

I could rename it to DEVICE_SCI, or may be to even more generic one DEVICE_FIRMWARE.


[...]

-- 
Best regards,
-grygorii

