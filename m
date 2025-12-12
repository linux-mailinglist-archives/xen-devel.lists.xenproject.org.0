Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E06CB8A44
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 11:43:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185326.1507534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU0c1-0005Jo-Qh; Fri, 12 Dec 2025 10:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185326.1507534; Fri, 12 Dec 2025 10:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU0c1-0005I2-Nt; Fri, 12 Dec 2025 10:43:01 +0000
Received: by outflank-mailman (input) for mailman id 1185326;
 Fri, 12 Dec 2025 10:43:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nb96=6S=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vU0c0-0005Hv-ER
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 10:43:00 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 509aae9d-d747-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 11:42:54 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by VI1PR03MB10157.eurprd03.prod.outlook.com (2603:10a6:800:1c6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Fri, 12 Dec
 2025 10:42:46 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 10:42:46 +0000
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
X-Inumbo-ID: 509aae9d-d747-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J2UUHKDyKxykGYlUT+RSSpD049Ww3PakOZrdSCwTYiEtZrgpWRAIAbYx8w/RVhhRuEalQ4jt5r6vZV4FH7vkdaxOa+V6yS4aGAl83lBu028LP//1lDnM44He9jxiW/sgCk6tYDukD3ngaX7rHjmy3OZRwUqY/RUP6AS9idE7Acdzj7tiF/+AjwdHnXwv/2O5FAT1cRDz/w3qpjTqzWHkpC6bhEDNpCXQvS6xTWDfVm4WpMNJUcTCfkaMxhhyVm5r5Z40LU57UoxFKRffxC4W9pBwIfgPKA+XJJZPWLE+3ZPa8AyokonOhfMcezVq8VkfAjkyBUnlAOmMo72ODCGzeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKoF8jsSm5qGPJmylvxaCTX2wl326sDA8irhOg3O5MU=;
 b=mHq6ilUesAv0sTW+Vj9x7Zlfev56S+zrjxd7Aa5hWBQC6+c8aU6EGynJPmEpXG2Ga62hKePW9r2nBXjAdXp3PaUe4TikF/l7Jbmukj9vleEG9bcl7iNJb1cbn6pjv6KcyljqXlUvSsdWX68BWnWrmKZfTMcdx1iDZ/4AK//BNQVmSRr8JcmG39qF/FFD1fSXxWb1Dr/pWFJwDEw/1UUJF5XO/Bzi45SUnAQqID2OJI1nef6l6FFUyXLo3OapdNQl7wTroxPz9rPseMkYQRHXzahB88gUmF2xdR/mytNqhKVJG/Wt/VkUVcCD0l5Me0w7woseBn1atjvskpBJszNODw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKoF8jsSm5qGPJmylvxaCTX2wl326sDA8irhOg3O5MU=;
 b=Jqf08GGmNSk+tc23q+nm9+rSWONBTgw7oBKealceYBGNq9/aIEi/Zp29i2GjrMKHageiH9jJ8UwWzTeeZF8rru3hIDQvy4onFCRMyXwOUWLrhz3UMyW24XJ+JHcvpKnyKSExGjwh201bpg9dWbfLw4DnH0tKZz8ksWN2Jpxk8H6VyQAFp1RXzaE1F5zg0GZTB6//M29kFec+dI6psYLtYVxrWkmigFFn/4tzQUHY1dVV2IL+Dnn3AcMS1c71rz/JtVgcu88eCHOwiki0q1y9+TAFWDw/3DtUTqWgoNxrLRGNCMEc9ZiD6px/DVlyVGAtSRkgtYYCQn4ne1iuhjAo/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <b162424a-0ef1-46a6-bb3e-85aab5bb5a4f@epam.com>
Date: Fri, 12 Dec 2025 12:42:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen: Add CONFIG_GC_SECTIONS
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Victor Lira <victorm.lira@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20251209214728.278949-1-jason.andryuk@amd.com>
 <20251209214728.278949-3-jason.andryuk@amd.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20251209214728.278949-3-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::13)
 To AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|VI1PR03MB10157:EE_
X-MS-Office365-Filtering-Correlation-Id: e7a9aba7-94bd-45c2-7c6b-08de396b3029
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aC8ydE13VkRTMUJvdFczdDBWTHZHeXZWSVBJeEdtR1hJak1ZSUNEcFVhTXhK?=
 =?utf-8?B?N0FJVXM3V0NQaU9DVytXeEtCZk9RKzgwM2FibmJRdnVQYUQ3RFRRbGttTWdY?=
 =?utf-8?B?SVd2Y2dxSlAxZHA4Z0pPTEkyaDNBc3R1NXNIcG5zT1p1bHNhRis5VUdLNllG?=
 =?utf-8?B?TDR3c1NpbGpCazFyZzl4YTdRTkFETXJrZFZGeG9uUy9TTE1hRmhZdUVqdXMr?=
 =?utf-8?B?WkZoTmxVbWNWKzFRZldNMmc0QTRJd1pFUHhpQmU5OE5oeDNiMXRLQ0t3UWly?=
 =?utf-8?B?cWdYTEhIeDVhTjYrRktrcTJvZU96dHRIYTdpTm1KTDljVzJsWXdJZ0h6UFpH?=
 =?utf-8?B?TC8yTXJsVUFqSi9YOWFSaFNrNUZxT2FMZ25xRUZ2VEpleDluVk0vVlhUenpB?=
 =?utf-8?B?RnVwTCtzMmxFaHM3Z0JTVTBrUWJuNW03dk5vcDlCSnpkbHFrRjVlT05zVkdQ?=
 =?utf-8?B?RW9DQjJpaUh4cWJyNk9OOHJ1ZnhxNmp6OGpvVkZpM1JVU2xRUENuVURLQ3hU?=
 =?utf-8?B?YVg2VGxmd2xlTnB4Q0s2SHFqb0tNUzRlbk1TSVU3bTFncy9Gck53RDFueG5x?=
 =?utf-8?B?RktZZ0xDeitCT052Z2hyMkVHOEdGZEJ1cUozVEJRQXhuRlJaeXVVY1J4eitE?=
 =?utf-8?B?aUVNaXBMcnpCa05VckhlbFdacU01SlRjRzNVVUJ4MmJMTXVBRjFmeXhUaU9p?=
 =?utf-8?B?UVdGaUZ2TCtxeS9jT2pCNlUwUEhNbitlSVBJU3o1UVJMZWM4SjB0bDZHTC9U?=
 =?utf-8?B?Ny9mZW51Y21RbVhGbUEvdjhwRzlCN3NqU3puL2h3elQrM2xwT3o0VjZtTy9k?=
 =?utf-8?B?d2VPMTZiZVlNVlltOGRjU0lIMEpad0hCTmdMUXBncXBuN2d1eU9vNXdvR0FY?=
 =?utf-8?B?QVRFRnJCQS9TM3hzQ0dBc25teVhuaTRZOERMbGlqa2ZOVHN3dnVIQk9ZS3pt?=
 =?utf-8?B?WUpRaG1EWDE4R1FqR2o0czFIYXpheldyck9ZeC91cDVSTGlYekI0NUxFaHBV?=
 =?utf-8?B?N2VSNFd2YUdiTEVkcTVJMk9WYjh0emdmMXFsTmtMcStzR1NlRDNBWEJ1akU0?=
 =?utf-8?B?ZFV5L045ZnpQM0FDMDMvd1BvTEdObWd6ZExTRFJFOE1ibWJwbk1iaVdjTjBP?=
 =?utf-8?B?SkZmWHlsellSSGE0bnk0ZUJLZjM1MHhZZitpWERGRHpwYUpRcldnT1ZzOUw2?=
 =?utf-8?B?MkdsZ1JnT25rUXZDY2ZpMDFXZFhDcTFPRU9HN3BwbExPV3czNzFseHVhSUFu?=
 =?utf-8?B?VmVhSWJnc3lDZ0RkRE94VGpBbnp1NFQ1MXVjbDh1Z0IwU1YvRFUvNytmNlJG?=
 =?utf-8?B?UlpCMVFKS2Y5SWllTUt1MTBmMC8ydGgzenVGWUVSMGRGUUQwTkZSTmdVMlFX?=
 =?utf-8?B?aGU3QVZ6cXN3UUNrY2JqWS81cWE0NGErQmxPOWx4M3NyWC93eGZEa2dlNFRJ?=
 =?utf-8?B?NlgxYWtUdTdEZjRxNHV1emdrSFB0dDdlazdWQkZZTW01TU5Zdm9sL0Q0MUFK?=
 =?utf-8?B?NUZCOENJZFJUbmw2U01iN1ZJTmUwZ3VYT1oxMDVFZFllV3N4aHBRck4rblQ2?=
 =?utf-8?B?eGpMdng2cFFWZjhiV0dyMzAzV25FNStnU0lXaGdWZFB5dDB5bEZHNVFlNWZL?=
 =?utf-8?B?eUcrczNqWC9sUXRLQWRRbko4YVdwT3k2OGRRQzllTDhFOGJKV2J4RDZ2NXlO?=
 =?utf-8?B?L2NDNVJ5cEo2djY1a0tkeDBwMjBkeFpoVXJIekpFc2UwWVJRUHpnWGExckhj?=
 =?utf-8?B?eDJ5RWQzL1V3NkdvK21neXdiam5VMWRhKy9nL09IeFNvVWRvcSttUmU5SUxO?=
 =?utf-8?B?YkJENEI4VFlyL2xwTmlLWTBxZ0V5bHdEYmN0MEtrcHg2NWxiREFjbE0vQjkv?=
 =?utf-8?B?cGd1U1JteVhmR0RNSkQxRzRZS3Rma25OVGM3UVVpVE1yWUdnR0RLdTlDUUVs?=
 =?utf-8?B?K0JxN0IwVWJ1U21QTzdrK1NWRmFCaGdpWnpIcFJFbjBhUXVLYmNoTjg4dmwz?=
 =?utf-8?B?UkE2aUI0S0dRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXJwSVhsb1daL1hLRS9IdlBTbzErM3BNazFIS1NBaG5GeFY4anRyZjdpdTVT?=
 =?utf-8?B?TTNoOHU0ZWluSytmSkFtcTlJSzFhdEhkWDdrT01JV1FqRWVFamtOelZzd3Z1?=
 =?utf-8?B?Qy9DbWV1dmpISGh4VXJ3NTIyRGhBbUs4OHRjY1Fib1pTVHBqRjdLNDE1NEZk?=
 =?utf-8?B?emRMNWJFVjV1UjR6OHZWT0k2U2VRVEtNVkI4b2FwWE9jUGNydzJHK2c3bTNu?=
 =?utf-8?B?VEZQajlMSTdsdnJ6RzYrT3lyR3o5QzVuYndHVk9MNzBSVlhlWU0zWVJ4WGFi?=
 =?utf-8?B?dkdVSmJJdUVRSjZ0Rk5QQTRUS2prM1c2T1VHR3hWVXQrL0xPWjlGZWtseWoz?=
 =?utf-8?B?VjdENFNjcElsTHVIUG5Ya0NHRFRJSEkrOE1vdjY2OSt0cTN0VitZOGJMNjJB?=
 =?utf-8?B?U2lZVzkwTWxpOW1iM25ncEFNM1ZMYTdDQmJxR1grY3Z6RjRDbkIxMjN1Tzhq?=
 =?utf-8?B?dXMyMFBUQ1hUK1FML28rb0VSQWdMSUl0TE0rRGE4YmJrUktOck4vMVlVL0Zy?=
 =?utf-8?B?Zkdod0FCSHZmYjlSSE96eU9pVmZyWUx4RUIzdnB1dkp4dTEwamVGdmpDVlpW?=
 =?utf-8?B?Mm5KOXVJenlkSnhxeE94N1VMSkI4amlwWkdQK0IvMlIrYk5CTVVFVEhpQmhs?=
 =?utf-8?B?cnk5YUFWaWlyeDErVnpnTXJHM1Q4ZUlLbmJyRlN3MThWYTRRd1gzWjJoYkc0?=
 =?utf-8?B?Mzg0SnVRa0JJWUNyMEMxZGdTZjM3RkxXZmgxZXRHZEs4U3I0N01mZHFtZWMx?=
 =?utf-8?B?TXJkUk9wUjY1OXU5N1FTT0ovd0VBOGlVSVUrS3JhSGQ0Y0JtdkNRZ3BKbitk?=
 =?utf-8?B?WE4zSVFIYlN0Y3RJMHZFcGdPODFDMEhvdEV2QUdYZXF4YXFnczh2VVRWNlFu?=
 =?utf-8?B?cmptTEl3Qis1eWRQYVp0a0x4Z0FMN016NzFwSWFQOGxDSFVoVjVZVlRsZUlj?=
 =?utf-8?B?QjdjaWhSK0hnaXNoUW51OEt0MjNXYmtsUWtDY2tuNDdFL3krYThMdUNKTnNC?=
 =?utf-8?B?U21BUi9RT0dzeDBKNVJHZ1hWRkZBTWR2ak9JYUlwN1I2OVZkWmV3eUFtUjdR?=
 =?utf-8?B?TWlGc2hFeWdKdGpDVG56UzdOd1krSS9iWW1RbDMzVkNydEtqdzVDSTJxUGJl?=
 =?utf-8?B?T1dCck9hODZZWkNuSDJqV01Mc09hU1c2cmRHN1lrdzlYS1AxVjBPYjFKNG55?=
 =?utf-8?B?RmxDa1hrQk5BTWtBQndPbldNRi9wTFBiajJqMFZ1SkdOcDg3cnhwRnd1RFA0?=
 =?utf-8?B?blVwOTdlQjRxbDdwQk1PajFxNU42eG5pTjVBOTVUNXkyTWdobm8yanB0dVlY?=
 =?utf-8?B?ZXhodnpWN0dCQ0tLenZaTGs1eGFjcUptcWhLaGtVME5oTVZ3Wnc0NWNrblVq?=
 =?utf-8?B?bVJnT1QxVTI0V3JRR1RjaWxldWUvTjIwV3BkV0VuNUJ6NStsemVXU3JMMEZm?=
 =?utf-8?B?THFPUm5peTJUbkhJVkNrV3E1OU9zUnNTNURUd1RHVHZIcDZQUThSRlRGZXZt?=
 =?utf-8?B?d0pqNDZmWS9QRTRhTHQwMkw5N3NDdTVBYWxZQlhpbjVuQzArTGMzR0FxM2Iw?=
 =?utf-8?B?SExpVGJySEZjdWFQRmlUZytjb0c4M25ZUkliTDZndE9zOHZMdmxjK2xYeXhM?=
 =?utf-8?B?MGNGOUpPY2p4ZEQxdU15cnpvdk9tRzVUS3dycU50UG5kN091MG53SnNPSjNp?=
 =?utf-8?B?djNoTVA0N1lpV2pVbERRcjdHSnZEMDJ6UHcxUTN4N0RTbXcyWUc3R1NiTWhw?=
 =?utf-8?B?Y0NlUjVFU3RUSkNCYmR6Q2NjUUhaNkphc3dWQ3dWVVJTRldGRFVFbHo4NXU2?=
 =?utf-8?B?UHdub0FUbnF5K0JodFMra2ZmYjZKeEJZNWRwazhLUlNoa2MrdnhyU1hSd1hO?=
 =?utf-8?B?V29vUFh5aE1ybWhtY2NtMVdGVlZBNzI2c2JmVzQxa1B4bXlSU3QrNkxrUXpp?=
 =?utf-8?B?eW92ci8zbDdySFhRZGlacXBUWFM4OFpGTkNMekdUK0xFblZpVGt0NElzeEpM?=
 =?utf-8?B?RUUrcDNlcmlKRkhOL09RbFpydTZQUDVZdTJSNC9Xd2JFOGxlZjNadlg4L3Zt?=
 =?utf-8?B?QnhvRjRDRnBRMmJsNDB1akFrRCsyUHFReU1nNk9XM290TlU4RlpRelpFQW5R?=
 =?utf-8?B?djhpVWFSTittRjJSSnZtZDdoa083Z09ZNkVwRTQ2dDgyRThSUzQyWGlzZjVS?=
 =?utf-8?B?Qmc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a9aba7-94bd-45c2-7c6b-08de396b3029
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 10:42:46.6441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yyu9nmtLuJGK9RAoXNwPLLB1Z+duKOTJtGizBlx8uVb8E3/Q2ZiYDr87Uy2r85ViAvwtj3hX2KZQnyi0DPVqms5VHPCXIT3r2hI+VPsjo8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB10157

Hi Jason,

On 09.12.25 23:47, Jason Andryuk wrote:
> Add a new Kconfig CONFIG_GC_SECTIONS to control linking with
> --gc-sections.  --gc-sections witll garbage collect unused sections.
> Combined with CONFIG_CC_SPLIT_SECTIONS, this will remove unreachable
> code and data.
> 
> Linker scripts need to add KEEP() assorted places to retain
> appropriate data - especially the arrays created by the linker script.
> 
> This has some affect, but it is inomplete.  In a test where memory_add()
> is unreachable, it is still included.  I'm not sure, but it seems that
> alternatives keep a relocation reference to it.
> 
> Only ELF xen is supported.  xen.efi fails to link with many undefined
> references when using --gc-sections.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> v1:
> Add Kconfig
> select CC_SPLIT_SECTIONS
> remove KEEP from .fixup
> Add KEEP to .text.entry.* (Only needed with Jan's "common: honor
> CONFIG_CC_SPLIT_SECTIONS also for assembly functions" ?)
> Add ARM, RISC-V and PPC
> 
> Pipeline passes:
> https://gitlab.com/xen-project/people/jandryuk-amd/xen/-/pipelines/2205223331
> 
> It defaults CONFIG_GC_SECTIONS=y and adds --print-gc-sections
> 

[...]

> ---
>   xen/Makefile              |  3 +++
>   xen/arch/arm/Makefile     |  6 +++---
>   xen/arch/arm/xen.lds.S    | 22 +++++++++++-----------
>   xen/arch/ppc/Makefile     |  6 +++---
>   xen/arch/ppc/xen.lds.S    | 14 +++++++-------
>   xen/arch/riscv/Makefile   |  6 +++---
>   xen/arch/riscv/xen.lds.S  | 14 +++++++-------
>   xen/arch/x86/Makefile     |  6 +++---
>   xen/arch/x86/xen.lds.S    | 34 +++++++++++++++++-----------------
>   xen/common/Kconfig        |  9 +++++++++
>   xen/include/xen/xen.lds.h | 20 ++++++++++----------
>   11 files changed, 76 insertions(+), 64 deletions(-)
> 
> diff --git a/xen/Makefile b/xen/Makefile
> index e6cf287425..aeb5dcf2ee 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -469,10 +469,13 @@ all-symbols-$(CONFIG_FAST_SYMBOL_LOOKUP) += --sort-by-name
>   
>   include $(srctree)/arch/$(SRCARCH)/arch.mk
>   
> +XEN_FINAL_LDFLAGS-$(CONFIG_GC_SECTIONS) := --gc-sections
> +
>   # define new variables to avoid the ones defined in Config.mk
>   export XEN_CFLAGS := $(CFLAGS)
>   export XEN_AFLAGS := $(AFLAGS)
>   export XEN_LDFLAGS := $(LDFLAGS)
> +export XEN_FINAL_LDFLAGS := $(LDFLAGS) $(XEN_FINAL_LDFLAGS-y)
>   export CFLAGS_UBSAN
>   
>   endif # need-config

[...]

> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index 2d5f1c516d..178af612a2 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -63,7 +63,7 @@ SECTIONS
>   
>          . = ALIGN(4);
>          __proc_info_start = .;
> -       *(.proc.info)
> +       KEEP(*(.proc.info))
>          __proc_info_end = .;
>     } :text
>   
> @@ -103,7 +103,7 @@ SECTIONS
>     . = ALIGN(8);
>     .arch.info : {
>         _splatform = .;
> -      *(.arch.info)
> +      KEEP(*(.arch.info))
>         _eplatform = .;
>     } :text
>   
> @@ -116,7 +116,7 @@ SECTIONS
>     . = ALIGN(8);
>     .teemediator.info : {
>         _steemediator = .;
> -      *(.teemediator.info)
> +      KEEP(*(.teemediator.info))
>         _eteemediator = .;
>     } :text
>   
> @@ -127,7 +127,7 @@ SECTIONS
>          *(.init.text)
>          _einittext = .;
>          . = ALIGN(PAGE_SIZE);        /* Avoid mapping alt insns executable */
> -       *(.altinstr_replacement)
> +       KEEP(*(.altinstr_replacement))
>     } :text
>     . = ALIGN(PAGE_SIZE);
>     __init_data_begin = .;
> @@ -137,18 +137,18 @@ SECTIONS
>   
>          . = ALIGN(POINTER_ALIGN);
>          __setup_start = .;
> -       *(.init.setup)
> +       KEEP(*(.init.setup))
>          __setup_end = .;
>   
>          __initcall_start = .;
> -       *(.initcallpresmp.init)
> +       KEEP(*(.initcallpresmp.init))
>          __presmp_initcall_end = .;
> -       *(.initcall1.init)
> +       KEEP(*(.initcall1.init))
>          __initcall_end = .;

Wouldn't it be reasonable to do the same here for "initcall/setup" as was done for
"schedulers_array"?


[...]

-- 
Best regards,
-grygorii


