Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C78C85503
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 15:05:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171903.1496980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNtfA-0006pl-4l; Tue, 25 Nov 2025 14:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171903.1496980; Tue, 25 Nov 2025 14:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNtfA-0006oK-0J; Tue, 25 Nov 2025 14:05:00 +0000
Received: by outflank-mailman (input) for mailman id 1171903;
 Tue, 25 Nov 2025 14:04:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUk1=6B=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vNtf7-0006nl-Uq
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 14:04:58 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b09b5d0a-ca07-11f0-9d18-b5c5bf9af7f9;
 Tue, 25 Nov 2025 15:04:44 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by AM7PR03MB6353.eurprd03.prod.outlook.com (2603:10a6:20b:1c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 14:04:39 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 14:04:39 +0000
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
X-Inumbo-ID: b09b5d0a-ca07-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IgW83fepUBlq1G+3RmLIpanOKfoOmqxy1FsyTH5V0zqpBrqQJyy1pAZvRd+ddN57ISshfAtNWWbQAYZsdr6Ba8vQfeeJwGAL9DVb5vv37iHCduDwIhD5luVbHgm+K0EfLJ+xGMh9DKr7N7tptfU9JIKohyj0D1aJU2glm1X48oJYGE3iNTTCQ1INb/yVnqGMikfWUhiOwy7SCK0N82GlReV0Tg8gKZwsByzG3+B243OnDxY+g9pXy9xWDYFq8xR1XH111Gpjik72+AWOP9+0jjeUuVuw+05ku1KC7y77zmSQI9+15N4EV66XKtIpxAoqQLX2TZWZ6mOEowLmctsJRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DpVWvFeo/n6vljsL5MRr27/glgod4IDeOWroYQd028=;
 b=cdZtE3PlXY7j9nhdNsKwQpOJzlilXygEWPJcjQUno63IFhf0R9T38TpfAGAg4U0RbMhary+fStjBgIgweRI7M2gHzdr6AGbUA8ji36sTazBzuThgJ7yUM1L12/TeRuR7Bg34+BWTVoHIUL5LtO229C0guJhvrKJ1OhSvicuiSkZNsg9Rp3QKggqhgFs9NmNIoen4IVOznynXxORFL3xpnvNR6ALiK55Gm74O0DO+LV63C2chW/C3iJQO2vlB1N77t12lPIEOh85VTecoeenN+Loyhoga7Otct0KMSKiduce8BULBEj2p6yz1b+X2ANQt0PoObZwnxTqE1nPJAyhR2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DpVWvFeo/n6vljsL5MRr27/glgod4IDeOWroYQd028=;
 b=VAPzY0dglSPr+L+3ouQfdVt7CpZ5mF3wGYmjZ4VXNaz1V66LfBdlViqvucNfWLdn/glmL/rKEQqJ4V9/RYNgn5fpASTAMURbxInfhYeUnhaptz2w9h8F4eH7qMudcdRuu1bOA3ecwMGm6ren2qqCrCoicGMuuVrDABhDdsdwVPrIdDHZ7MDkZQoZMRtcpTUi/BetFfUhqjVcRDn92+RhlOc7Z6Vvc3WK/f1gXyZFujdiDbfule6zDV57zHSNyGftA/yM60MHRoX1FgQZmz8wCaSm0z+LER7HviV0rxfeVTh4Y45eLTCeQV190OFtC2Huw9GljSTj1z4w2UXGpOYPAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <ed260928-8b86-42b0-812a-5390ac10fa12@epam.com>
Date: Tue, 25 Nov 2025 16:04:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/24] xen/domctl: wrap device-tree-subset
 iommu-related domctl op with CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>, xen-devel@lists.xenproject.org
Cc: ray.huang@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-16-Penny.Zheng@amd.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20251121105801.1251262-16-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0264.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::19) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|AM7PR03MB6353:EE_
X-MS-Office365-Filtering-Correlation-Id: e620c370-a1dd-4a54-e453-08de2c2b92ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MURkWWRwSko1V2JvTEltV1Rtek9YcUo1NE9GL2UrcnJNT2ZGQ0lRbkp0akYr?=
 =?utf-8?B?b0xGYlJvRmw5MTlFRGtRM2VhajlHbTcyMGZ1d1VTSTRPNjAzdmFEcko5U28y?=
 =?utf-8?B?U1ErV2VVaTlJSFc3bUFMMVNmL3NLd0pKUm42WDZibndOT2s1VkMzQWRHU0Ns?=
 =?utf-8?B?dmxZYVRodEVrNDNPa2tnUmh5K2NLWXZ0NW4wQ09heTBLTVZMZE9DWG9uNGlw?=
 =?utf-8?B?WmJybnduNm9vWVJ0ZTYyZDN1YjcrTHljUEVOUTd5TmRlU2Q0TVJUOWphM1NH?=
 =?utf-8?B?SWhGSUhyVTBWL0pTVHk3Y0Q1U0YrM3d4OGlqK3MzekJaQ3V5bC80S2FKaVNZ?=
 =?utf-8?B?alljVDZWd2s3Z1ErKzFOZU1LRzl0WkwxUlo3eVdDR3FLSG1RbXNrOTM4WWx0?=
 =?utf-8?B?OXpkUW5taFVEWUFPVEpyMkx3ZjZlQW8ydWwzVUpsaVg1Yjg0ekhGbUEzenZ4?=
 =?utf-8?B?QlRiYlZwQ2IyOHZEc1JNMFcwZkE1Vk53NlhCVndULzdRMUcxNFAyRFFPZG9S?=
 =?utf-8?B?K0h6VkRlckZXMVE1SzlLVk9tWXZaRFcxRk1iR3YxZUJ4VmxaWUtpVXhCZHNu?=
 =?utf-8?B?amd1ZHpKMFVUY0dJU2pEZlh3OG5sbFdRS1E5YnpMbGx4YiswdEhTU1FnVkdX?=
 =?utf-8?B?REQxOThia3RrN05XTnhBQ3cyREM3aEtlNGJiSmpEN2VLMUpWelYzMFEzQVFM?=
 =?utf-8?B?WDNzTkJ2Ti9yaEZUcUUzUlVMSEUyVU50aitUZy9aS0V4dTcvUkh0Q3RCVldo?=
 =?utf-8?B?dlB6Z0Z0QmdIK0w0OTVnVk1JUkcwaVhscVhDcXJwSlZKZFdNR2tjS09Qckt4?=
 =?utf-8?B?dHBBSWRDcGhlTFBqMmRWZzZ4TnllZ0hhcCt2Y092clRwSlpPYnhYV0xDZVpS?=
 =?utf-8?B?OGt2QXJrZVA0dEVYNHlDYndJRWhmTDErbXdSZXFnVFZTQ2tuREV5WElLUmNK?=
 =?utf-8?B?TW1tRWJsS09rUHQ2U3diR0YwbnB3Uno1TW8waERza29NWEpYbGt6ZXJEeit1?=
 =?utf-8?B?OC9UdUdwUmh3UWE0WDM3L1hjeGpvSitjSTNKNU1SK1dCYUdJbzFnOTZqN2ox?=
 =?utf-8?B?Y2kwZWMvWTA5NmR1U2tnaFBULzE1Q1ZYcWI3Z3VyRGtOUTd4Zkx2MDRWZklC?=
 =?utf-8?B?SmR4T2dDMFhHSUpWQXhzSzd0Mmk5MzJWUEZ2NjF6Y0FDYVJzeWV0RUZ1OEdS?=
 =?utf-8?B?SVBqR3VCa0drTUpaOExIR2hpYWtvRkZDM0hReE5hV0J5b2JJV2lkWVhaY084?=
 =?utf-8?B?OHFMek5UdTdpQkhQYlZnUjB1MnRrenZhWnVoai9pKzFvVzlGNnBySEtEdCsw?=
 =?utf-8?B?NjZWdE92dmluTGZmOWFvNmpHUnVsUkhEM3ptODUxK2RzU3hUQWYwZVhDSVQy?=
 =?utf-8?B?c2dUL3AyT1BFRGlyd0U5dmszWTliVGlBaHUyVUM5TXNjTWtkVnpTR1VHNkV0?=
 =?utf-8?B?SHRVcDdaY3JKZ253VUZlU0lGV1pPM0VhclZ4bHg3dS8vRWQ4UXZpMDJmSUdo?=
 =?utf-8?B?TThSN0tIcEFkeFVnMlk4YXBDUHJtcmFuWUZ2c1FyU2pxWThkVXlTWmpZclFR?=
 =?utf-8?B?czdZYmh6ZDBMcmhReERjc1dDdmZXZStiLzNvTG1KYWxwajFQaVZOOUM3bkR6?=
 =?utf-8?B?ZVRMTytvM1JoUW81d2owRHovOS9odXhWRVZFMEJVSkFjNmhXM0RESi9yOEpz?=
 =?utf-8?B?MU5pSDZmYm5tNC9QdjJkNzBaT3Z1ZFZOR3FESUxoMGQ2N2FncFQ1NGdGU1FY?=
 =?utf-8?B?T3djdGhMQmJiWG1MdWtMQ0UxM3Rsdm5hR1UwRTZqZ2I0MHdoNE9JeS9QWnRR?=
 =?utf-8?B?WTBhRGNDY0pCbCt6SGxMc2J0MGl5Mk1kc2hHSy83NDZMalgxQnJqSDlXSUlk?=
 =?utf-8?B?SGRiNTVpRDEyTHNVQVYvMDF4N2xBZXArSXVsWE9XR2k5emNPL3BMKzlNL20z?=
 =?utf-8?Q?p12xtqN5+75u3QA0UhtqvGJMS4DAcn7Z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzBwK0RZNlI5YnhOZURKbithVzBXZXlMNFJIVEJsV0ZwMElRWG5kb1c1NDlO?=
 =?utf-8?B?VFIvUG5ET0pISUhzTUJLSkxsVU1HcHB1TjdHNXUrUTNsSjVnc3dIemZTcG1q?=
 =?utf-8?B?OURPczdXeDJvTGl6dStCYW81L1d5T09YNlZLZDMydU94b3ZnbXlUVHdIbUtY?=
 =?utf-8?B?NkFmTjZSYU9kdFpRZmZrWkxNZWw4a2tLMHNseURqRm9YQ0lsd3p6Z1NHR3pw?=
 =?utf-8?B?K1VBdVlSZWZwb2pKTWQ5TUNWQUdvR3NKSlZjenJ4LzB1V2NUbEdUWlU5RkVL?=
 =?utf-8?B?SDdDS3JSeC9RaGEwL2RXRFczUUxNOFBFSkxkTjlRWDlDd2FEQlVnM04zSDll?=
 =?utf-8?B?NkZSUllicmFaaHA2ZHpIMncwV1FrNkdmN3RGMjd4V00yZk43K0hrQU5XN0Yz?=
 =?utf-8?B?SzAwa255VEdlSWxGNkNpYVZLS1ltSFR5Q3g2YWpkQjlNWDdxS3hac09XTVVQ?=
 =?utf-8?B?NXVOR0lRa09oTDRVR1JpZW54VXdZZU5BSkJxN2FzSmZicFZlRDQ0a2tIOEpO?=
 =?utf-8?B?U0loRS9udUtRMDJvS0orVTNydk9rWnAzUEJuTk1BV2ZxU0U5ZHNwcEIrOHpR?=
 =?utf-8?B?VXdIYVFHak04YUxlaVhzOGd0Wnc0eXJ3ZWtOTHhFemM0SHBabTRaTXdpa09Q?=
 =?utf-8?B?bGVCT2lwK0hiSGRYNEIxb3hUQnVjenhmV2h1cEtRbTZqV01CTjdwRGkyTDRn?=
 =?utf-8?B?b0pUNmR5cDB0cTJsTWFVUlFYZlRqWXdkeS8yMC9QYXBTRnlRYkJ6UjhxbUsw?=
 =?utf-8?B?ZTVtZWpXU3l3TkRseEZQMVRmT2UzaXVMOFFlSnBJalVzbzVPOWFRN0JTOS9K?=
 =?utf-8?B?MDd0bVFFbzcwNW0wNC9tYUVwQjlDb09zUEVqb0dmVUpFblIvUTVzcEN4M0xa?=
 =?utf-8?B?Tk9oQm9EZndwelJnbnN3elpCUVJycUlMRGFRaFBEOVRYOFBpNWluSWlTYW9N?=
 =?utf-8?B?ek5XWDM4bVBqVVpMK0ZNM2pEQmVVczNSQXJJdFo2TmpHRUI5Q1FhekJ1bWdX?=
 =?utf-8?B?RnlSczl1WndOOW91QUZwQ1dINERtYmdUamxEOEJuV09qcmxIT0M0cU5OQktB?=
 =?utf-8?B?UWVnUi8vTm1iRVhMa3FHanJpNFVHYXpzdUQ3TEk2Tm10emZFOHUrRkRDc3VP?=
 =?utf-8?B?K3UvekhrejdONXpBU0Nob3VIR3BrSVFORVRYRFBOQUNIdkEyKzN6cUhlWWha?=
 =?utf-8?B?WUUyT1FlaDNhOWlSSVZZZ1NtdE5tT0trZjNVKzY1eTBwSWdSaEFIRmxIRDNM?=
 =?utf-8?B?RXpsY0JQeERtcXptV3Zza1lXRVhlUnI0QXYwaERRTjQ3WUNhb09MV3lYb0U4?=
 =?utf-8?B?cSt1TXpYbXBkMnhYN1lSRzNVYm01VGFodEhPT0VXSFhqcXhaQy91MHBYSzQz?=
 =?utf-8?B?NW81S3RyazB5QmFUOWV4Ukp5WUlyaG54bStBb1lOcHhnWUNoclczYnF6aExv?=
 =?utf-8?B?QTZHNkc3c1ZDbU5PNFhuOCs1Nzk0cFlrV29NNFRkdVdCSW4waGFXeWJLc2pv?=
 =?utf-8?B?UlM0VnB1UFpJL3NmRDExM1FieVMydFBYRFpURGtQeGVpanlSRXhZTE1pTWdP?=
 =?utf-8?B?Ky9LZHgyenlKRmE2ZHZFaDFhQUwzQXZzT0FqQ0M2VmZac0o5Z1JyaWVRTGF5?=
 =?utf-8?B?eDA0RERXeXpFUXhYWGZ1ZnJwaSs4QS9WTElNcnhKdXdPdUZyNE5wV2tMVFph?=
 =?utf-8?B?THgzUjVNMk5DajFOc2p3TkIxRjExWHhHeUpoaGlsOStUOEpsYXhsVy9sSGJ0?=
 =?utf-8?B?R2dNc3lJNy81cTE0dkxxRmZ4Mk9xQ0c3dXBheHZIbEE2V2IvclVYQXJoQjN6?=
 =?utf-8?B?Mmd2eFdGT3VvT0FIZDFBaG1vOENvSGdzQzVBaHRSeUVQeXppUml0S1Zkc0h0?=
 =?utf-8?B?aVdjN2FJUW1pKzEyWHVtMUZQQWQ2SFcyam1VM1c0azh4SlBHVG82VGs1MmN1?=
 =?utf-8?B?bGpHNVplTlZzRzE4SUtDV0RnUGw1amVHRCs1T2dvdWFOck91Zm1QTk5LZy83?=
 =?utf-8?B?VGV3Y3N6b1RydkZsUXJBcnhKTDFkNHFPeFlUTks2amlJZ2dHQW1ub3k2V0x2?=
 =?utf-8?B?a2hIOStISktEMDF1aGF0UjY0MFhWbmV6REFyVnl6YmtvNnN6TDB5SVBKMEhH?=
 =?utf-8?B?SmFPQTduNll6a1Z0YnRFMmdyQktWVVp1VjNDcG9Qd2djbjZUUmRkTEExY2J3?=
 =?utf-8?B?UlE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e620c370-a1dd-4a54-e453-08de2c2b92ef
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 14:04:39.4935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rohmggL4dihS+u1b4xGO/bb4Kpz+4oK7er+g2jnRmyYVTwdJWUhEJqkCNB7F+cUNmk5doxdumqSbbe6BcZYwV6aU4vTDoRa1ij5XMq2vW/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6353

Hi Penny,

On 21.11.25 12:57, Penny Zheng wrote:
> Function iommu_do_dt_domctl() is the main entry for all device-tree-subset
> iommu-related domctl-op, and shall be wrapped with CONFIG_MGMT_HYPERCALLS.
> Tracking its calling chain, the following functions shall all be wrapped
> with CONFIG_MGMT_HYPERCALLS:
> - make PCI_PASSTHROUGH depend on MGMT_HYPERCALLS
> - iommu_do_dt_domctl
>    - xsm_assign_dtdevice
>    - xsm_deassign_dtdevice
>    - iommu_deassign_dt_device
>      - arm_smmu_reassign_dev
>        - arm_smmu_deassign_dev
>          - arm_smmu_detach_dev
>            - arm_smmu_domain_remove_master
>      - ipmmu_reassign_device
>        - ipmmu_deassign_device
>          - ipmmu_detach_device
>    - iommu_remove_dt_device
>      - iommu_dt_device_is_assigned_locked
>    - dt_find_node_by_gpath
> Otherwise all the functions will become unreachable when MGMT_HYPERCALLS=n,
> and hence violating Misra rule 2.1
> Move codes closer to avoid scattering #ifdef
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v3 -> v4
> - split into PCI related subset and DT subset
> - Move codes closer to avoid scattering #ifdef
> ---
>   xen/arch/arm/Kconfig                     |   2 +-
>   xen/common/device-tree/device-tree.c     |   2 +
>   xen/drivers/passthrough/arm/ipmmu-vmsa.c |  26 +++---
>   xen/drivers/passthrough/arm/smmu-v3.c    |   4 +
>   xen/drivers/passthrough/arm/smmu.c       |  55 ++++++------
>   xen/drivers/passthrough/device_tree.c    | 108 ++++++++++++-----------
>   xen/include/xsm/dummy.h                  |   6 +-
>   xen/include/xsm/xsm.h                    |  12 +--
>   xen/xsm/dummy.c                          |   6 +-
>   xen/xsm/flask/hooks.c                    |  12 +--
>   10 files changed, 126 insertions(+), 107 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index cf6af68299..5a5d7810c8 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -270,7 +270,7 @@ source "arch/arm/firmware/Kconfig"
>   
>   config PCI_PASSTHROUGH
>   	bool "PCI passthrough" if EXPERT
> -	depends on ARM_64 && HAS_PASSTHROUGH
> +	depends on ARM_64 && HAS_PASSTHROUGH && MGMT_HYPERCALLS
>   	help
>   	  This option enables PCI device passthrough
>   
> diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
> index 0b5375f151..70bd8e7da5 100644
> --- a/xen/common/device-tree/device-tree.c
> +++ b/xen/common/device-tree/device-tree.c
> @@ -371,6 +371,7 @@ struct dt_device_node *dt_find_node_by_path_from(struct dt_device_node *from,
>       return np;
>   }
>   
> +#ifdef CONFIG_MGMT_HYPERCALLS
>   int dt_find_node_by_gpath(XEN_GUEST_HANDLE(char) u_path, uint32_t u_plen,
>                             struct dt_device_node **node)
>   {
> @@ -386,6 +387,7 @@ int dt_find_node_by_gpath(XEN_GUEST_HANDLE(char) u_path, uint32_t u_plen,
>   
>       return (*node == NULL) ? -ESRCH : 0;
>   }
> +#endif /* CONFIG_MGMT_HYPERCALLS */

The common/device-tree/device-tree.c contains generic unflatten DT helpers API,
while dt_find_node_by_gpath() is specific for domctl (iommu) processing.

Therefore I'd like to propose to move this function into drivers\passthrough\device_tree.c
as it is used only there now.

>   
>   struct dt_device_node *dt_find_node_by_alias(const char *alias)
>   {

[...]

> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index bf153227db..22def57b03 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -2759,6 +2759,7 @@ out:
>   	return ret;
>   }

There is not wrapped arm_smmu_deassign_dev() at the beginning of the file which causes
ARM64 build failure:

drivers/passthrough/arm/smmu-v3.c:1474:12: error: 'arm_smmu_deassign_dev' declared 'static' but never defined [-Werror=unused-function]
  1474 | static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,


>   
> +#ifdef CONFIG_MGMT_HYPERCALLS
>   static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn, struct device *dev)
>   {
>   	struct iommu_domain *io_domain = arm_smmu_get_domain(d, dev);
> @@ -2826,6 +2827,7 @@ static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
>   
>   	return 0;
>   }
> +#endif /* CONFIG_MGMT_HYPERCALLS */
>   
>   static int arm_smmu_iommu_xen_domain_init(struct domain *d)
>   {
> @@ -2862,7 +2864,9 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
>   	.teardown		= arm_smmu_iommu_xen_domain_teardown,
>   	.iotlb_flush		= arm_smmu_iotlb_flush,
>   	.assign_device		= arm_smmu_assign_dev,
> +#ifdef CONFIG_MGMT_HYPERCALLS
>   	.reassign_device	= arm_smmu_reassign_dev,
> +#endif
>   	.map_page		= arm_iommu_map_page,
>   	.unmap_page		= arm_iommu_unmap_page,
>   	.dt_xlate		= arm_smmu_dt_xlate,
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 22d306d0cb..a75ec08633 100644

[...]

-- 
Best regards,
-grygorii


