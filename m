Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8470C579CF
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 14:19:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161480.1489425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXE1-0006xC-Rj; Thu, 13 Nov 2025 13:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161480.1489425; Thu, 13 Nov 2025 13:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXE1-0006v1-OP; Thu, 13 Nov 2025 13:18:57 +0000
Received: by outflank-mailman (input) for mailman id 1161480;
 Thu, 13 Nov 2025 13:18:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xbc0=5V=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vJXE0-0006uu-C1
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 13:18:56 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ba1958f-c093-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 14:18:51 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by GVXPR03MB10384.eurprd03.prod.outlook.com (2603:10a6:150:153::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 13:18:46 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 13:18:46 +0000
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
X-Inumbo-ID: 4ba1958f-c093-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2DVFNOzrlX2YS2EkDcrEZ6zBc1Kl0sd/Sx2PlaRUojAxbmejIWX/yl5X0Z8pkd9ktDXxufChtK1KGK42dHLGGTxD66rEczduNOwqgvkDXBHNcHV5neWmZnUh+KByI8yO7yT3n8vZCY3NdaFAFIhih+RygvmWQRe+kIohl9lamiz+rbfsY+qUBIGAatdJxc709HmAzN4tVL9ze8gIErOTdj2oo6KPB2k1jKU+Enf5rtrGXU9AxaSmNakXApPH3Pd77EseYZDr3cIDfG+L+sMMoOCs1uCm6DdNYh1pHLeXoKFdI0qrXK/CpY8S9dW8ml5vhZmdCS/LIfqFruYrbNTYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIilaY1RUm0BC0spLx7CjqNpWzOHlrprmYkck2DSCvg=;
 b=y00qwUIF3teeF2GSF7bwsj5EOzN3VinjItyQTc3fZNPTPWa9iafUgWJd+C1XT6zC13U0Y/h/ZOBICbBboAqM8e/5hA0mZhMFeM1aoHqvIiiklCnev8Gt0dS/xZaR5ZpYNKtmSqrkPE1qPzPjVC7pVyzomy3zjqnZtBEIUp61cqBo165qkBi9aJrZP9vM/ePmvY+56cIzqJuzeaDEWoxdtOkLsr2zJCQ7X9Nl9zuXCBVYVlmtYekLjR/U9o3g3dFR1bi5aQ9yqHTG3brIlKRiUNoh/QBoKJJrHmMUzpSUVH8iRJa4kc25wV/QV3+XbuHgWKlt/Dwp1hhQiTowvOxjeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIilaY1RUm0BC0spLx7CjqNpWzOHlrprmYkck2DSCvg=;
 b=u5yWSvzN8h1omfP9hVxXbdHIZNn/h6C/BhAbEYGymBuWzdm65G1xc8xuJOKyT1NNpI/r8/8tCh4w914mbv2uqhJzmTBar8JHEmZFq9wvUmzDHRcyOO1cTEp24VHHtyFh3S/3W8hWuNgAFXVCmWVn5IrynBRRm//dL5K7/x9trqV6zQv4TXHztEUX8qxIZ/vq4Z22KxEf5SHtyra4Qv4r0VBkw38ejSLw03qLKmYXzbtPeb+EbGmFZ/PRcvJLEul8LLHRNuwt9Pw5QpLRPWeulXK1tHrXs5v+7WDdD/FXtGfxlMxlbzoN5lttMjCb2+p24cKs6akJt6d8lmvVSD2dcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <4e4aa540-514b-458f-8036-7941a0ecf268@epam.com>
Date: Thu, 13 Nov 2025 15:18:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 3/5] x86: hvm: factor out compat code under ifdefs
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251111175413.3540690-1-grygorii_strashko@epam.com>
 <20251111175413.3540690-4-grygorii_strashko@epam.com>
 <af736490-5f04-4fa8-9b73-4071b72e1c33@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <af736490-5f04-4fa8-9b73-4071b72e1c33@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::22) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|GVXPR03MB10384:EE_
X-MS-Office365-Filtering-Correlation-Id: 19be8b0e-aa3c-466c-e571-08de22b72cd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Um91bm9UVGlZdzBTeVVxTE9uaDAzYUdxelFoeGdRSllndU9OUWhkRnZDVE9p?=
 =?utf-8?B?dkR3STNtZFFZM0kyQVI4U3V1N1JuMWNuWFVwYjdtNHFzbEFuOWt1SlA3RWs5?=
 =?utf-8?B?TWVoL0VaVENMV0s3NkZYVXpBTFpVRVBOUGJPSkc4anJtOVJSU080UTkydUM3?=
 =?utf-8?B?OFVrSnRvTzlQYnhXVzZ6TUM5Z3hESWJjS1M1SFEwYThEVEFaYTZZT1J0RWRM?=
 =?utf-8?B?NkptSjdNbWRRa0VFT1h2Z29OcTgrQzcrOFZhV29Jbk13MVZhNTNPWm91UUQw?=
 =?utf-8?B?NXlITEdjOGd5OVdQSncvTEJ0UDhTazVUSmZwMFBLZzYzMWdIUkNNSnY5a1o3?=
 =?utf-8?B?RE5qVXdkU0dmRlJjcVZXOFZPbzBJYnFyS2liWjAzalRzd2tNa09tdG1FL2hB?=
 =?utf-8?B?TWFNd25SY041cEF6ZjNDTG1hcnNUUjg5V3ZxYnNudDc5ZHZjd1VuUU9BVnNs?=
 =?utf-8?B?NXljalNIa0c0RWN2MFZmclFxZjRuNit0MERheTJ4NDNTdXlMOHV6dmpEbFpR?=
 =?utf-8?B?eFl5enFpM1c3dXZHckpVNFpIU0Q0YlBRV0YrN3djZjBCaUdBc2FIZldUZWNV?=
 =?utf-8?B?R1RnOVFkQ0NLbmUwb3JlcVFNUVFLVk81anhaWTNjZER4ckJDRzgwbEZwUU5U?=
 =?utf-8?B?Z2gyK1VmVXhrUkVzTTlMTHp2OW5GTHJ2SEM4bzBHbDFHTmVrb2s1b2crTTZL?=
 =?utf-8?B?bE5BZ2Q4UDR1ZnRubEJqQmQ5WE9KaGZGRGtWSXJxbGF0ak8yTy9Sc1JNb1dH?=
 =?utf-8?B?R1NLbmdJVHBZRU42RTcrMDcrdWhzd2R1VXYyZUpUMkR3bnQzbWpRNnFqM1U5?=
 =?utf-8?B?TWxhWENHQkFKQklMaHY1dUhVNi9KaUJNclhweDBVMHdzNDcrMHJNQWEzak1V?=
 =?utf-8?B?V1Nkejl5L3Q0OGhRKzdTdi94MzdnNWxXanZKMXJGb1YzU08yRCtRSy9qc1ht?=
 =?utf-8?B?KzkwUWJmY1dJL2w4S1lMS2pRZHRvVUdBNDV1SndXMUdrdzB5MVdFWDlGckNw?=
 =?utf-8?B?U3lZcW9kZzVXZVB5Z3dvcllIQUZaaDBqT0ZPZ0pLaHVSYVZMQ2N4UFhBWGZt?=
 =?utf-8?B?R3VaRWIxK2xHWjVWUDlqK2s5ZHV6Qk5kNUxaMnVpb0VZY0hMelhwaWZLVlQr?=
 =?utf-8?B?clZpYjBjcjMzUmhxQ3ZBTFI2VkNuMGFySU9CSmxYOStWTnBONEhmZGxuWEt2?=
 =?utf-8?B?VDJyVEtibnJmdi9kU2NlMGZTTEw0TWRXZnlZcTFRcUVOQ1VvQ1NSS3FwbHRK?=
 =?utf-8?B?MTVEK2lXNDdJbzFKMjYzQlZOSldIVndNUEFFUGNUbmNValhMcUtNQVhIc3Uz?=
 =?utf-8?B?WXBTSXVXVnJNM2lxU2w1ZVZEeUVwakdvY2xFNFpaSXBHU2w5cHc5anBiL0gx?=
 =?utf-8?B?ZVg0bmM3SGpleXJUSjFrTlJSK2hKY1VCeWlFZVZMejk4bDljc3ExL1JnUC9L?=
 =?utf-8?B?R28zY0s2QXQ5YzYxb2E3Z2R6UThTRHRmZGVCb1ovUGttR1JndjdyUnJkN2pT?=
 =?utf-8?B?Vmh0Z1I2cTBTN3M3MHpPQVB1a3N3bnEzZ1p0bUNvVzFrZEl1VnlzMFhHempt?=
 =?utf-8?B?bzZ1NS9EVSsxQ010VVBJZzVxaGpDN0tZanBQSTNUQjZGVXJmMlF5OC9hK1h1?=
 =?utf-8?B?TTFrcytuM0JESDIrRmErd1RrQWYrYzlEL0JTS1ByN0tYTTVMR0d4RlRwZmx1?=
 =?utf-8?B?WU9odTVuMEpBdGgzaWdWY2JQNFNnQW1mTnJLTFpBdHQwSEtTQ3p6a3lEanRY?=
 =?utf-8?B?Ujg2RTdaUmkwclJXYVB6K3hMZitMaWh0aTdFVXNESHFhaGNsR29qRG55Rkxn?=
 =?utf-8?B?UW9ZTENoa0JSSmd0Q3gyRkFSSC95QTNvSWMwVlpuYkFMd0xOaVh4WGJpOGw4?=
 =?utf-8?B?czZyM2RYellFT2RoaUUwU2JGZEF4REN2SHRxbHNIaDVCcWo1eVJKR055NHdS?=
 =?utf-8?Q?KELjjAz7UHvZADyNLi04lt1cKwff9wmZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y09vUFJDV1J3U1Q1cVYzeWpjZWl6Y09mYk53U3pDaXZiclU2a3RqbDE5aEZW?=
 =?utf-8?B?cEJxVXdrMEhzKzJiUE1QVGpaTzNDVW5ic0l4M29RV1E2NzUyLzdlWURzNXQ0?=
 =?utf-8?B?QTBERjlGcERlTkhQWmgwNHlZUTZMK1kvVnY1aG55Z3J4bGppWWVkWktaaUpW?=
 =?utf-8?B?T09tTlpOay91M3p3cWtDd0VmamkwS1g2Wk1JTHdBbG5QL2pzcDFjTUM3a3lw?=
 =?utf-8?B?eE96VUhOa29QazlPYlRVLzJydUxWNEpQd2gyZE5wVXd1NmpPQTVEblF6bzE5?=
 =?utf-8?B?czg2enZPYXhtQ2hudUFBNzlRTGxJRFE3NENwdVBuTUpGS3NLRHNoMmV3L1VD?=
 =?utf-8?B?WU5oN0tPU09zK09KK2JIY25iSE9seUZqd1lwaENZNEpXTnJYSVdjMHpzU2li?=
 =?utf-8?B?UHFmYnRGN08zbXRsY1VFWHQ2eUE3NGRXM2ZIOSt5SGJOTDJPVTJuV2FjV2ps?=
 =?utf-8?B?UDBzOE9VaFJDNDRScHRtSjkxTlpwaU4zL3NjdWFOMGZXTVhPSk1taHN2QjQ3?=
 =?utf-8?B?WEhyZkp4bzBSR0RmK3MwZldqMHFEM1JCeHBVazBaSEFtOFUwYndBOHFOOWx0?=
 =?utf-8?B?Z294RTN4T2s4TDBFZWVhS1A5d2lXM2FuMngyUkVaWWpka0h6WllGK21FR0RK?=
 =?utf-8?B?Q2pTcnd6RmRoT0ZGMys3WkpzQTQvWjJmeXkwamhpV0M5UzNVT2xoNjhGQVJ5?=
 =?utf-8?B?VUdVcUcwUHdHdVN2ZTFaZlNHZUlkRVVpYnFyV1I1YTNnQUZsWVdUeUlhUEIw?=
 =?utf-8?B?M2lJLzJMcGorVzVaQm54UHF0UUZMTTFGT2IycFljM1ZJWTRIUS8rN1oxZ1NZ?=
 =?utf-8?B?eFNCYWNPR1BXejVjL0ZmOEJGd2lhdTZBZ1dqZG9lb0FJMlJ6UHhoMXlXdVBB?=
 =?utf-8?B?VGhxdjZHNHdRSVNQNXJ5ZG1sRVpRTFNsNkpDeEtwR0xSWWp1Yy9GYzlDaWxW?=
 =?utf-8?B?clFzemNwT2VZRFlzVEFvNVkwMDFCTGczR3cwNUdXNXdsaWFHL3MyVktGTWsr?=
 =?utf-8?B?Qk1Xb3lWVC9PUEU5dTh2aDFVQU1QcUZaYmM5dGt3SlNHWnRtZTEzOFZVTUQ1?=
 =?utf-8?B?RlNlVis0UGpoVHQ3MnJvWThXb2x6N0pNcHBBdEJaenpHci9pbDg1dW5hUWtr?=
 =?utf-8?B?WndqQnAyelVBaTEvSjcyMFdmUi93RjlibXM0cHBvdXN3dHdXK1hIeXNScjJL?=
 =?utf-8?B?L3ZGOTRJMkdjZ2pxRDlwdzE4WkJIWWpMR0xFODdzY3NZWnVaTEFvYUlTL1Rh?=
 =?utf-8?B?dGtjNVlFQnZ3cVUzSksrYTY5Y2Uxa1pHV1l4MU9WKzJHZng3Zk1iQTBqVGgx?=
 =?utf-8?B?dG8vcmxVbWpIZGZFQnRGbHV4UGZIQ0xyUEVoZHhkVkdHeU9mRVBLS2ZrOUhT?=
 =?utf-8?B?VUlpbzNqNGR3SndlZlloNjdsR1lhblVpN25xZmF2WG95NXZxc0QrZm1QQkJn?=
 =?utf-8?B?Ynk4bDZRNmVuNlFKY1JVQkpzc05Tb0RrendmZGU0Z0lCQ2xqVnVmSk0zZ04w?=
 =?utf-8?B?ZXc4eFFNRzViUTNpaXVvSC9TS00zUUF0TG1KUGlTSG5xTkI3OVNuTGJyeWxT?=
 =?utf-8?B?Sy9WSVpnQnp3UE1hRGlKK1NPbGxVeGlOV2hHa2JwRmllUFpyZnc3cTNVNWg0?=
 =?utf-8?B?S1V4SlRpbnhpdmhYRitFQy94S2JmRDNNRU1mM0c5K0hCQklIRUdDVU1zaUVN?=
 =?utf-8?B?NndtV3E3NEZ0S0tUZkZORjRtcWFJS3NQOXF5MjZrM2Vjd1ROSE9uaG5sNzJ5?=
 =?utf-8?B?TDFXbm9HT21EcmxKdjJCWEJ6UHdkcFlieEE0TGJ4VkpGREF2eUZta1BzMmFT?=
 =?utf-8?B?VjdrWCs0SEhNQkxZcis1c0lFaXh4TGhWdEZWZDcvSmYzSHVJL3VPOFZ5VUUx?=
 =?utf-8?B?VDJ2VEJLVEJiK3lzQS94SmI2RFltaUpPQ0w1cVJSQnp0eWhhU1BUSE5SclZx?=
 =?utf-8?B?SnhadEY4WGFCUUZneWtQL1hKUFJiZnYwL3dvcnJ3RFNNVCs4U05oNUJJbkhr?=
 =?utf-8?B?dHhJcVBaek1jd0d0eHp5OUVTL0pIclo5TytvbElLcUlXQjNmbmxMemNjUUx6?=
 =?utf-8?B?cEFMVXlxVFBwUnFqUjc2RXRIZWFhT3VpemJseUV3dkNHLzZOdGs5andxYUxk?=
 =?utf-8?B?YW9za0RSM3l3NUVJSjZxQno2T1ByZ2tFeUdpL2dNMk9ZbGNrbnlPVGhRcjlV?=
 =?utf-8?B?Rnc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19be8b0e-aa3c-466c-e571-08de22b72cd7
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 13:18:46.1359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cFApE2MB/w+J9SLu8+3kGB6WEm9Yk0GQfoxHF4nKByQMaqRUwE2WpchZV7AGMZREIJdSREKCeQDhEi+31DNdJINShRP36ZtqbSFmbTS99jQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10384



On 13.11.25 14:30, Jan Beulich wrote:
> On 11.11.2025 18:54, Grygorii Strashko wrote:
>> @@ -3991,7 +3995,7 @@ static void hvm_latch_shinfo_size(struct domain *d)
>>        */
>>       if ( current->domain == d )
>>       {
>> -        d->arch.has_32bit_shinfo =
>> +        d->arch.has_32bit_shinfo = IS_ENABLED(CONFIG_COMPAT) &&
>>               hvm_guest_x86_mode(current) != X86_MODE_64BIT;
> 
> I think this could need commenting on if we really want to put it in this shape.

ok.

> But why would we retain the has_32bit_shinfo field in the first place when
> COMPAT=n?

Here I'm not sure. May be other can comment.

> 
>> @@ -4965,6 +4969,7 @@ static int do_altp2m_op(
>>   #endif /* CONFIG_ALTP2M */
>>   }
>>   
>> +#ifdef CONFIG_COMPAT
>>   DEFINE_XEN_GUEST_HANDLE(compat_hvm_altp2m_op_t);
>>   
>>   /*
>> @@ -5064,6 +5069,12 @@ static int compat_altp2m_op(
>>   
>>       return rc;
>>   }
>> +#else
>> +static int compat_altp2m_op(XEN_GUEST_HANDLE_PARAM(void) arg)
>> +{
>> +    return -EOPNOTSUPP;
>> +}
>> +#endif /* CONFIG_COMPAT */
> 
> I'm not in favor of repeating the function "header". Imo such #ifdef-s better
> go inside respective functions' bodies.

ok.

> 
>> --- a/xen/arch/x86/hvm/hypercall.c
>> +++ b/xen/arch/x86/hvm/hypercall.c
>> @@ -29,10 +29,12 @@ long hvm_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>           return -ENOSYS;
>>       }
>>   
>> -    if ( !vcpu_is_hcall_compat(current) )
>> -        rc = do_memory_op(cmd, arg);
>> -    else
>> +#ifdef CONFIG_COMPAT
>> +    if ( vcpu_is_hcall_compat(current) )
>>           rc = compat_memory_op(cmd, arg);
>> +    else
>> +#endif
>> +        rc = do_memory_op(cmd, arg);
> 
> Why would this be needed when vcpu_is_hcall_compat() already honors CONFIG_COMPAT?
> (Same question then applies elsewhere, of course.)

This I do not like by myself, but I was not able to find other options :(

hypercall-defs.h is autogenerated and it's the only one place where functions
declarations like do_x_op() are appeared or disappeared.
So build is failing without ifdefs as compiler can't find compat_memory_op()
declaration.

> 
>> @@ -171,6 +177,7 @@ int hvm_hypercall(struct cpu_user_regs *regs)
>>           HVM_DBG_LOG(DBG_LEVEL_HCALL, "hcall%lu(%x, %x, %x, %x, %x)", eax,
>>                       regs->ebx, regs->ecx, regs->edx, regs->esi, regs->edi);
>>   
>> +#ifdef CONFIG_COMPAT
>>           curr->hcall_compat = true;
>>           call_handlers_hvm32(eax, regs->eax, regs->ebx, regs->ecx, regs->edx,
>>                               regs->esi, regs->edi);
>> @@ -178,6 +185,9 @@ int hvm_hypercall(struct cpu_user_regs *regs)
>>   
>>           if ( !curr->hcall_preempted && regs->eax != -ENOSYS )
>>               clobber_regs(regs, eax, hvm, 32);
>> +#else
>> +        regs->eax = -EOPNOTSUPP;
>> +#endif
> 
> I'm generally against most attempts to use ENOSYS, but here it should be used:
> The top-level hypercalls are (effectively) unimplemented in this mode.

ok.

> 
>> @@ -208,10 +218,19 @@ enum mc_disposition hvm_do_multicall_call(struct mc_state *state)
>>       }
>>       else
>>       {
>> +#ifdef CONFIG_COMPAT
>>           struct compat_multicall_entry *call = &state->compat_call;
>>   
>>           call_handlers_hvm32(call->op, call->result, call->args[0], call->args[1],
>>                               call->args[2], call->args[3], call->args[4]);
>> +#else
>> +        /*
>> +         * code should never reach here in case !CONFIG_COMPAT as any
>> +         * 32-bit hypercall should bail out earlier from hvm_hypercall()
>> +         * with -EOPNOTSUPP
>> +         */
>> +        unreachable();
> 
> I.e. you rather mean ASSERT_UNREACHABLE()?

ok.

-- 
Best regards,
-grygorii


