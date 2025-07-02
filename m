Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1571AF0D33
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 09:54:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030365.1404001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsH5-0004b1-58; Wed, 02 Jul 2025 07:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030365.1404001; Wed, 02 Jul 2025 07:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsH5-0004Z7-1o; Wed, 02 Jul 2025 07:52:59 +0000
Received: by outflank-mailman (input) for mailman id 1030365;
 Wed, 02 Jul 2025 07:52:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Y9l=ZP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uWsH3-0004Yz-Iq
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 07:52:57 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2009::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f029e9e-5719-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 09:52:53 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by BN7PPF915F74166.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 2 Jul
 2025 07:52:50 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 07:52:50 +0000
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
X-Inumbo-ID: 8f029e9e-5719-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPnGYjRDooKmqB+Rb34XpGaJNiEy955pS070oscohdqYPKMGBBLgo37z/wQLYsP1SF2jULYypQaICcob7xhHVGP7wYGt2VMD3ixcaNEo4AEeH5mhsp2jksqp/nj1bI6SnGBG2x/Zzbn2Tgbo5k6REEMJVsVBNl5X57cwiSdvx/mZRNZCqLu7ii4/iuUK9EksSpu+/uMyImBtoNL0CDtsfvwkNyBFct0EveQkfLbpGTC6Y7uhSGY82NTnGNAy7OB+cpYJamg1hHexD2gVv6rhPUgwFpyjIX7aeybJSL+emIDABPI2kR1ZXjA0Ahjn+PT0hUlkpIe7tMdMld1PB7g+GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2S9GevF7MCb+mILq/Qt6beXaVy3kW2sB1fVKu0i+jk=;
 b=SW6KgerlGXp8c+O9L7hkQ+CITOA1Cw5BJmGF4vaiOD8f7VevnXWrkscBqkdbsJdxJj1vW3L620p+EuFNQDZxpxt1Wn9CzvEoHyzZWdE4+xJztPrfDzsxNBKuUsmQVHyfVXMWL0YndRvLz+ktvIFykVZ7dnivWvW9OCFaQihad/SBgdEYzTwVLqLF8HC2ycFCt2zXST4hyXRsktP1MUE2FFs8818foyR8Xo1FGdvX7m3MXaE7Lys4KnHFw9qHlahkVxjgWVwalUFfaZ+QxA7U+VF+XB9LsEn5hF0Gm9QoBl0tnRRatX8LWfaUsJgz+Gh/l8ucsp2QBtSdP+25CzCEqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2S9GevF7MCb+mILq/Qt6beXaVy3kW2sB1fVKu0i+jk=;
 b=NR2IntW9saQnysejngfXvQPFamW4yRft3BELVCF6xS0jEOahJocW7YODpw0QT4xBv8YN7tDMhhUmH5F3xOFTyAyAK0THRoPzsNqzM3ZBFEXZso5iFBUvBkCMt/X5ADapcrdqJYsbRIFnaNHlVxCTF6d5s0TI0iVmp/7lgLSZ1Nk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <0807cdba-b0bb-42a7-a18d-407ab818709a@amd.com>
Date: Wed, 2 Jul 2025 09:52:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] pdx: introduce a new compression algorithm
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2506271905350.862517@ubuntu-linux-20-04-desktop>
 <aGKnDHtRD5OLGaYj@macbook.local>
 <alpine.DEB.2.22.394.2506301726500.862517@ubuntu-linux-20-04-desktop>
 <1507b441-dd3c-4a24-beda-0d1d3143faf9@suse.com>
 <alpine.DEB.2.22.394.2507011338360.862517@ubuntu-linux-20-04-desktop>
 <aGTZK0YmBTvGmNQr@macbook.local>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <aGTZK0YmBTvGmNQr@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::18) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|BN7PPF915F74166:EE_
X-MS-Office365-Filtering-Correlation-Id: 72534924-03e3-4e41-7166-08ddb93d70ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bkxGQkNyZHdLZE5yTUtCM0lPMHpibklaUjVmQ2VrL2FPcCtoNy9iRGJKYWdw?=
 =?utf-8?B?eWlZNTFRUXFXSlBnU2ZYTU5kMUw0ODNuSFBxZ21EUEFldEM5NXl2NEtFOFM1?=
 =?utf-8?B?L3BHdG9RTHJ4KzllRU9iVUZSNmljbzRkR0V2TUJkRjd2Tk9yNlZpYXdqbGhN?=
 =?utf-8?B?SzZaUWZZekxxcEdnVExPQk1pM0hRb3lCdEpGY1IwNGZseDNkYmxoM1JkY1ky?=
 =?utf-8?B?ZTB4UEtiQzR3RVBvTzI0Z25BdXo3djZrVGwybmF4a1hSbW1yS3pVT0V3dkRl?=
 =?utf-8?B?dmJnTnVRNStDczA3RnRZQmYvQVhKRHE2S0JpWkRpaTRPQURmYjY0cEhzSVhY?=
 =?utf-8?B?Mk15aE9ZRldRdlRNL2xpNE54d0U0N01Cb3FRYVlraEgyUURDSlBWb0I0RzF1?=
 =?utf-8?B?RktUK0g5U2lQTHg2KzZidFBQOVZlbUVlbFJHdkVRd3dyM3E2TFBNZGYyVzZM?=
 =?utf-8?B?dGxNYnd0OWVsVUNEaklqbWxJQTRjQnFuMjdodm1HekJKTm5nMTJWb24xT0J1?=
 =?utf-8?B?NkdUTkZrVEIwRG05RGU5L0VNa0dUQ1poQXhYcEFBdDhHdnJhNk5MWlVTR0pR?=
 =?utf-8?B?YzU1RU1lcmJBTmo1TDlTKzgvc1ZHZUhWd0lqb0tmN1B1UXpUTzF4N2JTODRL?=
 =?utf-8?B?OGhuUHRRaEFRbks2cDhXbk9mUG5kVHA4MHMwQlI3U1QwM0pCV1ZPWXpqdUMz?=
 =?utf-8?B?SDIrQWRHRlNuMGMwR3VDWGZpUzh6VC9nOXd4ZDVQWEhJZEx0MERIaEttN1V3?=
 =?utf-8?B?eXRxMTJ5SGxIa3V5dTZQWCsxb2cwVjdNdTZ6UXkrY1NVMjQ1eVJOYXhUNE8y?=
 =?utf-8?B?azgyM2VQdUtiTFQ0aVVSTGk4clpLZFJ5ejlyQUNhTU5STVN1MU80cGx2Z3gr?=
 =?utf-8?B?RTJsRVVXQ2VGOGpyMHBjN2VUVmQxdEFEVXhWbjBhZUZlMzd1QzVTSDM4M2hV?=
 =?utf-8?B?ejdpa0VIS0UyemdOeWRLenp5Z3JGRTRNK2pVY0o5QWRNSDdLUVFFZDBoTktG?=
 =?utf-8?B?aXkzeVU1WjhuMlZXeFI5YTB0cXFzdTBVNExnL2tGR1VSdWxFWWtDWTZ1RmdM?=
 =?utf-8?B?aTNxakZRWERiK2RwckxCSnl1ZWZZTVVpcnNpQ0d4a0IxbGhFbmREY29JY2I4?=
 =?utf-8?B?bFlMVWxMaTl0aWJFWndWRTdIS2lwOVVkRjZVSllyWkUzMThLVFhTaFo2Qk1R?=
 =?utf-8?B?UzJ5OWVlZmx3OUFRRjhrQ243NmpNU3Q5WWNlWitYdXlCdm5hM2FRcFE1cmpw?=
 =?utf-8?B?U1pXVW5ITXpUTEViTkZUVTgraDJabkNob1dIWklEZ3FVay9BMWxRZ01QQ3BO?=
 =?utf-8?B?RHpUWU9FcXFjMXdPQXkzcUFQTmd4ZCtmZ3pvYzBOaFQ5amh3S3I1RWdrR25v?=
 =?utf-8?B?UmxzTisxZzhlTEJIZFB1VEd2c2FDcUpveWpkaCtYdFFSK1oyWHFpbXFpejd2?=
 =?utf-8?B?U3BMZ0xEeW9oY1lta1pYT1RkN0J3K054Qkg4NnFRN1JsL2NVS3ZWc2VUSTQw?=
 =?utf-8?B?QzFCVlhSTnlvbnJQS01lTVFIWXFaMUZWdnVSbjAwRUhVMHhVOXBNUm92RHJu?=
 =?utf-8?B?UGppRWFMYllRM0lUVzBYTTdXVGt2Q1JYZWhMQjdKelYrcThOSjNSSGJ3UE9J?=
 =?utf-8?B?QWF5NHMzcVRoN3FzeVBDYTRkZTVMSEN3OHZVZG5aQWVLYlR0b2ZZMkR3ZWh3?=
 =?utf-8?B?dVdMZHpGMXk1dUtFbW9aSmJOTkh3ZGJXVlVTQjRFVi9ZTkJvWU40RVJ1RnY1?=
 =?utf-8?B?MjlTNDFiUk01cnlHeUlDdjFVZXhuMEVTdlF5TEl6VXFTYk5kU3ArK2ljMUlk?=
 =?utf-8?B?WnphS2tNVkNOTk9mSlN0SzdiSGF4R09LZzl3eHVUSVlRRmpIZXQyUFhPUm9z?=
 =?utf-8?B?ZWhTZFFHVDhtZVJ6M0Nsb0VlMW12OFZxVTJENVh3S3FtQ1F6RXBBdWhiYktu?=
 =?utf-8?Q?do4IS10xPoc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a05NM1lwd2tjTlRNSDdYUDlaRGc3TkxNTy9WSG5IMmlZejhsRGdkZ3JXb09Y?=
 =?utf-8?B?T1JQbWkzVmliaHB5NXgwRTVGd0dOcHRqc3o0VjVTbDJkaTJuaFZ4SkEyRlVo?=
 =?utf-8?B?OWIrL05oQ1ZiaG5ETWxOQWQrdzlDeHkrVVAwcmRKREx4UWhIK0x6UEJQR3cy?=
 =?utf-8?B?QnlST0VGYm8yT0JEanhpZEdtT3ZTZWZKSVVmT3V6WktFeUdZb0hKZncyMUZs?=
 =?utf-8?B?aUV1ZmZicG1JNk9sZGxucHRhc2k1UWRSVjVEUktlRm1Ec1duZ2VCcmlWQnAz?=
 =?utf-8?B?dExqUSthTGN6RDByTzZBeEZ2Q3JmRXFJWjJNeFJjeUNxSWE4N2pLSUxhZzkr?=
 =?utf-8?B?R2N6eDdlZDMraWc1TUo1TGdMK0pjL1Z2cUlUQ2FjNHViYW1PYm1EcDZ4UkI0?=
 =?utf-8?B?cU5iZXo4Yjk1U2VkYjRPRGhlbGsrUnpGWXhmSXhJSk92RGJpUW1EWENtSzFh?=
 =?utf-8?B?SkZMNVlBSDdvN2d4UUxGSkNZMGJvR1c1dTdwVFoxdm1VNHVKZHFuakZxazRZ?=
 =?utf-8?B?Qm5GMzA2NTFZSk44WmVxRWx4eW9vdE5nWHQ2dVQzUU43S0VOU2JSMUZRS0JW?=
 =?utf-8?B?TWtRcS9NZUppZ08wSVd0SjJ4Z21XSTNEM29Hdi9HendaU21EQVlzOXZkODMz?=
 =?utf-8?B?WHVHRTBJRGtLSUhSNE5acEY5Y052TXFIMTc1Q25pQXZlQTI4REVKYlBFazBJ?=
 =?utf-8?B?emRJV0d6UmpJSHAxUkNHbUZtVXBvZFpLK0VqK29zMkNxb0ljd2dtL2szSGhl?=
 =?utf-8?B?cE1vemVQTnh2WXFyMnZ0NmZTaUt3ck9BTUVDcExDcDQ0Z3Q2a0Z0LzFSQlJY?=
 =?utf-8?B?cGkrdXZFQml4TDlKem1YalpZNTd4U2Rxb2J0M3hJdktGdmpuV09rL1NLUFdH?=
 =?utf-8?B?d0oxeDlPVEw4dDZGRkJvUHY2TmlmNW55R0NPcXVxdmgvWmZQZk1wNUNSa1Z4?=
 =?utf-8?B?M3VoMldPUTVJQ2FWV1Z2R0xuSi9KamxKSU1PanhCOUYwTE4zcUVZU20yVDlz?=
 =?utf-8?B?YlpaWlkzbS9uTmZvZ1FvMEFTd0NCR1ZEbTM3aHhjSUZuNlptWVZEb08zTGJI?=
 =?utf-8?B?NU5ldW5jd0ZQVlJvZSswNjhtWFJHOGFIUHFCZFlwaklsMm1FVWNLaU1sWUNN?=
 =?utf-8?B?TTFlTFhPR3l4cEd3Q0xOV3VFUVRZN0dsUU9SUCtwdHBFTUdzYWJyZEdKY09s?=
 =?utf-8?B?R2dYY2VQZ0cyKzRmWXphTFl5NjJzMER5YjBsL01sNFpONzdoaEFPcVJtc1k1?=
 =?utf-8?B?b2FJMEFXRGptRzNIRDJSN0M1Yk9vN3FLTGJyS0tOM1Y3RXRmWWdaakpYWlhr?=
 =?utf-8?B?Sm5COW52Sm92M2h3VlpBaEhiSkxGSUxTWUpsTXRUcTdqSnFzUk8ybXZTaWxH?=
 =?utf-8?B?alVBejVSbWlwZGkwSFJrSmd1UzVBNzRkY1Q5dmo3aUdYOHRid2xGRTR1Z1ZF?=
 =?utf-8?B?SVlld3BoYU9ENFhIcTRLUnFPN29CdzlsbE45bktPcUl5dUZ3R25OK2Jkekcx?=
 =?utf-8?B?VVl6Smt2Rmt0UDBzQ242MHpjVlZrZTVXRFdDR2g1WThSc0ZwRXNpV0hPdGNl?=
 =?utf-8?B?NHhHeDBzVkVLYjUzbzZIQlVSaDBKT2QzSzlmWE9GWXBSbHBMc3BkVXo4Q0h0?=
 =?utf-8?B?MmRsWjQzbkxma0lXTG1HQjMzeGtvYmRJUG1PTEkzWW9TV2t3UzNjSmMwKzhp?=
 =?utf-8?B?akk3TU5idlFNSVp3SXZMVDZHQ0l2RjVycytPSkhoOTJKbWh5akhYR2crYlFr?=
 =?utf-8?B?N2RBeU8zSmJWRUgxd3VMQkhzOFFNaU5pSUNIemxVY2sxVXNUSUJKSStreS9F?=
 =?utf-8?B?ZG9WelRPaFBKaXBQa2NNekNybUR4TlcxczFZa0ljQlNNd3diTnkvckIvb0RW?=
 =?utf-8?B?MzhqeTI2Q09sbDArbVVCd05kaFdoN3pNS2NqQ1BPZ0R1cTBrV3FHb1dzckF2?=
 =?utf-8?B?a2JoNWRPS0llSWZYZXBkR2tYWGx1eEVYQXFqZm56UEM1eWZiR3ZmMEh6QnRC?=
 =?utf-8?B?eTNKcENjUUVmMUd0RlR2RjFnQytsaGh3U1pLemZxUXViZ1plTmw4Q2h3dUhs?=
 =?utf-8?B?WGlLV3NRYWhEVHNNc04yZlhRVWR3UG8yNTY4RUtuS3FTcmdCMEt4M2treHhy?=
 =?utf-8?Q?f2/w=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72534924-03e3-4e41-7166-08ddb93d70ff
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 07:52:49.9462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJCRIN0S4TVFpd+bIJwdxH+61Y3nY8qnIAgT/kXmZnN1mdYR/J11f2Sla9p81/0b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF915F74166



On 02/07/2025 09:00, Roger Pau Monné wrote:
> On Tue, Jul 01, 2025 at 01:46:19PM -0700, Stefano Stabellini wrote:
>> On Tue, 1 Jul 2025, Jan Beulich wrote:
>>> Sadly from this you omitted the output from the setup of the offsets
>>> arrays. Considering also your later reply, I'd be curious to know what
>>> mfn_to_pdx(0x50000000) is.
>>  
>> Full logs here, and debug patch in attachment.
>>
>> (XEN) Checking for initrd in /chosen
>> (XEN) RAM: 0000000000000000 - 000000007fffffff
>> (XEN) RAM: 0000000800000000 - 000000087fffffff
>> (XEN) RAM: 0000050000000000 - 000005007fffffff
>> (XEN) RAM: 0000060000000000 - 000006007fffffff
>> (XEN) RAM: 0000070000000000 - 000007007fffffff
>> (XEN) 
>> (XEN) MODULE[0]: 0000000022000000 - 0000000022172fff Xen         
>> (XEN) MODULE[1]: 0000000022200000 - 000000002220efff Device Tree 
>> (XEN) MODULE[2]: 0000000020400000 - 0000000021e2ffff Kernel      
>> (XEN)  RESVD[0]: 0000000000000000 - 0000000000ffffff
>> (XEN)  RESVD[1]: 0000000001000000 - 00000000015fffff
>> (XEN)  RESVD[2]: 0000000001600000 - 00000000017fffff
>> (XEN)  RESVD[3]: 0000000001800000 - 00000000097fffff
>> (XEN)  RESVD[4]: 0000000009800000 - 000000000bffffff
>> (XEN)  RESVD[5]: 0000000011126000 - 000000001114dfff
>> (XEN)  RESVD[6]: 000000001114e000 - 000000001214efff
>> (XEN)  RESVD[7]: 0000000017275000 - 000000001729cfff
>> (XEN)  RESVD[8]: 000000001729d000 - 000000001829dfff
>> (XEN)  RESVD[9]: 000000001a7df000 - 000000001a806fff
>> (XEN)  RESVD[10]: 000000001a807000 - 000000001b807fff
>> (XEN)  RESVD[11]: 000000001d908000 - 000000001d92ffff
>> (XEN)  RESVD[12]: 000000001d930000 - 000000001e930fff
>> (XEN)  RESVD[13]: 000000001829e000 - 000000001869dfff
>> (XEN)  RESVD[14]: 000000001869e000 - 00000000186ddfff
>> (XEN)  RESVD[15]: 0000000800000000 - 000000083fffffff
>> (XEN) 
>> (XEN) 
>> (XEN) Command line: console=dtuart dom0_mem=2048M console_timestamps=boot debug bootscrub=0 vwfi=native sched=null
>> (XEN) [00000006bfc302ec] parameter "debug" unknown!
>> (XEN) [00000006bfcc0476] DEBUG init_pdx 294 start=0 end=80000000
>> (XEN) [00000006bfcd2400] DEBUG init_pdx 294 start=800000000 end=880000000
>> (XEN) [00000006bfce29ec] DEBUG init_pdx 294 start=50000000000 end=50080000000
>> (XEN) [00000006bfcf1768] DEBUG init_pdx 294 start=60000000000 end=60080000000
>> (XEN) [00000006bfd015a4] DEBUG init_pdx 294 start=70000000000 end=70080000000
>> (XEN) [00000006bfd1444f] DEBUG setup_mm 252
>> (XEN) [00000006bfd3dc6f] DEBUG setup_mm 273 start=0 size=80000000 ram_end=80000000 directmap_base_pdx=0
>> (XEN) [00000006bfd5616e] DEBUG setup_directmap_mappings 229 base_mfn=0 nr_mfns=80000 directmap_base_pdx=0 mfn_to_pdx=0
>> (XEN) [00000006bfd7d38a] DEBUG setup_directmap_mappings 237 base_mfn=0 nr_mfns=80000 directmap_base_pdx=0
>> (XEN) [00000006bfd92728] DEBUG setup_mm 273 start=800000000 size=80000000 ram_end=880000000 directmap_base_pdx=0
>> (XEN) [00000006bfdaba3b] DEBUG setup_directmap_mappings 229 base_mfn=800000 nr_mfns=80000 directmap_base_pdx=0 mfn_to_pdx=800000
>> (XEN) [00000006bfdcd79c] DEBUG setup_directmap_mappings 237 base_mfn=800000 nr_mfns=80000 directmap_base_pdx=0
>> (XEN) [00000006bfde4d82] DEBUG setup_mm 273 start=50000000000 size=80000000 ram_end=50080000000 directmap_base_pdx=0
>> (XEN) [00000006bfdfaef0] DEBUG setup_directmap_mappings 229 base_mfn=50000000 nr_mfns=80000 directmap_base_pdx=0 mfn_to_pdx=50000000
>> (XEN) [00000006bfe35249] Assertion '(mfn_to_pdx(maddr_to_mfn(ma)) - directmap_base_pdx) < (DIRECTMAP_SIZE >> PAGE_SHIFT)' failed at ./arch/arm/include/asm/mmu/mm.h:72
> 
> As said on the other reply, the issue here is that with the v2 PDX
> offset compression logic your memory map is not compressible, and this
> leads to an overflow, as anything above 5TiB won't fit in the
> directmap AFAICT.  We already discussed with Jan that ARM seems to be
> missing any logic to account for the max addressable page:
> 
> https://lore.kernel.org/xen-devel/9074f1a6-a605-43f4-97f3-d0a626252d3f@suse.com/
> 
> x86 has setup_max_pdx() that truncates the maximum addressable MFN
> based on the active PDX compression and the virtual memory map
> restrictions.  ARM needs similar logic to account for this
> restrictions.

We have a few issues on Arm. First, we don't check whether direct map is big
enough provided max_pdx that we don't set at all. Second, we don't really use
PDX grouping (can be also used without compression). My patch (that Stefano
attached previously) fixes the second issue (Allejandro will take it over to
come up with common solution). For the first issue, we need to know max_page (at
the moment we calculate it in setup_mm() at the very end but we could do it in
init_pdx() to know it ahead of setting direct map) and PDX offset (on x86 there
is no offset). I also think that on Arm we should just panic if direct map is
too small.

The issue can be reproduced by disabling PDX compression, so not only with
Roger's patch.

@Julien, I'm thinking of something like this:

diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
index 4d22f35618aa..e6d9b49acd3c 100644
--- a/xen/arch/arm/arm32/mmu/mm.c
+++ b/xen/arch/arm/arm32/mmu/mm.c
@@ -190,7 +190,6 @@ void __init setup_mm(void)

     /* Frame table covers all of RAM region, including holes */
     setup_frametable_mappings(ram_start, ram_end);
-    max_page = PFN_DOWN(ram_end);

     /*
      * The allocators may need to use map_domain_page() (such as for
diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
index a0a2dd8cc762..3e64be6ae664 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -224,6 +224,9 @@ static void __init setup_directmap_mappings(unsigned long
base_mfn,
          */
         directmap_virt_start = DIRECTMAP_VIRT_START +
             (base_mfn - mfn_gb) * PAGE_SIZE;
+
+        if ( (max_pdx - directmap_base_pdx) > (DIRECTMAP_SIZE >> PAGE_SHIFT) )
+            panic("Direct map is too small\n");
     }

     if ( base_mfn < mfn_x(directmap_mfn_start) )
@@ -278,7 +281,6 @@ void __init setup_mm(void)
     directmap_mfn_end = maddr_to_mfn(ram_end);

     setup_frametable_mappings(ram_start, ram_end);
-    max_page = PFN_DOWN(ram_end);

     init_staticmem_pages();
     init_sharedmem_pages();
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 58acc2d0d4b8..e047225eb413 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -265,6 +265,7 @@ void __init init_pdx(void)
      */
     uint64_t mask = pdx_init_mask(0x0);
     int bank;
+    paddr_t ram_end = 0;

     for ( bank = 0 ; bank < mem->nr_banks; bank++ )
     {
@@ -290,10 +291,14 @@ void __init init_pdx(void)
         bank_start = mem->bank[bank].start;
         bank_size = mem->bank[bank].size;
         bank_end = bank_start + bank_size;
+        ram_end = max(ram_end, bank_end);

         set_pdx_range(paddr_to_pfn(bank_start),
                       paddr_to_pfn(bank_end));
     }
+
+    max_page = PFN_DOWN(ram_end);
+    max_pdx = pfn_to_pdx(max_page - 1) + 1;
 }

 size_t __read_mostly dcache_line_bytes;

~Michal


