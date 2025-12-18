Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2660CCC711
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 16:20:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189791.1510504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWFnc-0003Qc-A6; Thu, 18 Dec 2025 15:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189791.1510504; Thu, 18 Dec 2025 15:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWFnc-0003Ne-6H; Thu, 18 Dec 2025 15:20:16 +0000
Received: by outflank-mailman (input) for mailman id 1189791;
 Thu, 18 Dec 2025 15:20:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ars1=6Y=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vWFnb-0003NW-0V
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 15:20:15 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c3f3790-dc25-11f0-9cce-f158ae23cfc8;
 Thu, 18 Dec 2025 16:20:12 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by DB9PR03MB7194.eurprd03.prod.outlook.com (2603:10a6:10:22c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 15:20:10 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 15:20:10 +0000
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
X-Inumbo-ID: 0c3f3790-dc25-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LrrbkNah4+aJXvOpGP77fQGHLkHYuGf7HrSBd5uAVhhEnnTlfhZ8D50cj7p/p+GxtUs61VlbnSSWXlcCMd2KjWrqaZTmpE6qKJME9oK3zcxycOg7aTasOnEwd1gTrn2OLaQ/D6+8HlmS+MwxiUSyCbSfgSXbAcekWVmgPKr5/J1AgDgyivvwotOl21Me63dJXlANcpsChzWmtzcInh9dt0kTma9FXVFZBTiY9h1SplyJpc7TEQGVIVK9bAokSZSOSouL+sec2k8/ok4Z5tDlAPLvHkPGNKswfWX3S+PoLzsLYb7XgVAn1/azmuuQowJmMmBT3qOJftJH1BlVfIPSQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOw/OiQ9Hk6l/jPFyr2PywTlt1wkFNHno9E2uN0CUPc=;
 b=WlYjGz4hWXKjlaP7Ayb9o00KMt/ZUxxJfnswfFYtPH7WwBWceb+BQRUGQwAIWAHdOkSBNKZW0ZM2GH7vrZkv/C/eda20dwhzTghoqt/M+aPt+K/W9gObkZZiwVNUlZL/+8hJP1kiBYB4jdtoc+5I8GQhA/x2cN+5/413clouuV+MA2XeX4n+u8uKBlWdT/hAG7CAJBKSpTiyS/3ICgSl5OTBCwj3fXMHK9Sbbg+rfZHKEickucduGtU33rClz8RZEwxVuVs2GdDdE6+5n92PD+WzgHYZhMezH1tVa8pHW+JPl9MNEzSUdV9zp8XNr05jfDj5I/xzTaAUhDrFbFeNzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOw/OiQ9Hk6l/jPFyr2PywTlt1wkFNHno9E2uN0CUPc=;
 b=Z0reJ0MV1aq9xWGjyVBissKlZ1T2xQA2gCFsRv8Y5uwJ01MT6lP804VS63GnA0yu3A8YSWUeD9109d9xGv+dw995IeN1BNRhPZ/huMItRvBJ17S6mgZdNyMHVK+K3I4f8l1Sw9iTxttcef03Bbd6pgBvKj8c4j/aP6+OkLEhAN+3dSMVs26872bLDu279ZvjMh9nRIzxNQtVH5mVE+zEZNT6+QNlVFQTrYSp4ZyX19b59V2yVvxdmzGVJbpHI9Vr7OUSeJZMWrXrkLEp6A+YUqITA/9LMb8et4p8euO3L9W3P8zBzdrxcZNpY9Q5zmRU77hRbRVgp++oR7XUp5/ang==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <67f0d3e0-bd90-4817-a084-49d01d8305ff@epam.com>
Date: Thu, 18 Dec 2025 17:20:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] xen/domctl: add XEN_DOMCTL_CDF_ALL mask
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20251111201627.3579504-1-grygorii_strashko@epam.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20251111201627.3579504-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::9) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|DB9PR03MB7194:EE_
X-MS-Office365-Filtering-Correlation-Id: 31b4d442-0505-47e6-092a-08de3e48ef0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWZHMENrczFKNnVPWGdIVFcxWFpJTkVsSXFJUElvVVVsWkRUblBueGNGQXFa?=
 =?utf-8?B?OEgyTDdqRXA1amtvaFdwYVBTa1NRL0lDdVB6RFVYcHNqaUR4UHNybllNMGk0?=
 =?utf-8?B?VXZwazIwbHRqVUxSSTVRZjhaamV3OGdqVFQzUk01R0h6Z0RmS08yZXhqNnYz?=
 =?utf-8?B?UGN3dVExcUFjanYrRnh6S2xOT1NxQ2hlNysyaWJRT1F4SFJ5OC9oTEVqTDNa?=
 =?utf-8?B?UU5XTXhJWVgzVkxzaGVBcWVJclJYVEg4Z2xUVFgyRDZTQjJkNTlpR2FUOU5Z?=
 =?utf-8?B?cStoZzlacnhUZ0RxQkE0aHM2S1hxNzl2TUpVOFpFV09FTVJGT0VBM2Y3TkNT?=
 =?utf-8?B?SXZ0WmtYOWR1ckh4aGJNS1VRc0lSRmVqbER6ZXJzMkFiUEVJZHJzM1BTOW1I?=
 =?utf-8?B?ZnlXNE8ySEdkMExrbUxkU0VsdkY4Ym4vU1dpRjN4VW1wcEltckJ1cWV6dkhn?=
 =?utf-8?B?WUVKcXRibHdXeTE5azdDY1R0djFWb1dtbVZrRjFWNHplWEsyblZiMmZVeTZi?=
 =?utf-8?B?eVp5SGcvUTgvLzB0QkVsMWR0eS9DSUJhS1ZycVJPbG1rUmlFQ0ZENW0vZ2NG?=
 =?utf-8?B?cVovc1V1eVl4ekpZVGRHRGwvb1pmai9xbHA0MmlmS2EzWnZDeldDdEtkVkNR?=
 =?utf-8?B?c1NoV2Q1QTFxbFJHc3ZEUzdqNjBWSDRnQ2Q3Qmx2dkN5VWVnOHhzeUMxTW9j?=
 =?utf-8?B?VkFoMHRhZ0RXTW4vT0QvWDM3SWY3ZVVqcTMvaHNMTU5sZ2NoM2l1bEY5cDFT?=
 =?utf-8?B?ZHZ1U0lLcHN0eTkvY0g3eTg5MytaYWhqZzAxb3RFSm9INU96a1ZYYWo2dGEx?=
 =?utf-8?B?TWpBVkEyaTF5a3ZxdHpQcCt4YmxXNTE3d2pJcUxNSUVsdmhYaVR4Vkx2MlY1?=
 =?utf-8?B?aUZuQTBGWWJsRlhRczQyZWlKWUtpR0k1VW5vRHJtekhxeEtpQ2dhOUhUQlJw?=
 =?utf-8?B?N0NsbWEvZmU4U0JVazdxZlV2S1JSaWhHQlE5dStKMGNiZ0sydmxwUFJrMlhl?=
 =?utf-8?B?UGNYamtseE5MN1JQeVpkMzVMbXA2S0l5czQrblNHUVBiVExhbHhGcFFMYklK?=
 =?utf-8?B?bkZxdGFGWVhBd0RtYy9vcjFDdk51S3FuaTNsTUF4OUdnMGk3VitzNXlPSHFF?=
 =?utf-8?B?MzlneEljVFp3SU1valpFdWZyTHIxN3pDTlp4OGdJcXFhcDZ4OEtBenIzc3VT?=
 =?utf-8?B?NXI1Y2M3bDQvcld1YTlZcGZxWUpYazU5d2VDc1JTRERzWnFyaGZIOVBBaGF0?=
 =?utf-8?B?d0REUTRXa29kNERZTFl3cVFlRlMyN2s4T2NBNlRISmtCNmNhWUw5SGlKdHh0?=
 =?utf-8?B?aHBCWXlXMkNYc3U1MXBDVm0wUEgwSm5OSGFLMWpncDFrd1l0dzdpYk9INXFM?=
 =?utf-8?B?clBGRXJYQ1JZaW5IcjNXS1JlY09qVHJFOVlUUlBWZzZhK2ErdVhtd1JObzBo?=
 =?utf-8?B?Qm1FS0RPK2ZQeXdsYzZiaEhUVHNIdmxtWC9Oenl0ZUczSHhDcFAxMll3NStS?=
 =?utf-8?B?WWd1Nkc2RGRkN2l4N0ZUNm5sVnpJNFcxZExZYU5kZnA5Qzh4Sngrc0wwdTE1?=
 =?utf-8?B?K2hlU3p5cUI1VEdsd3VpbHQzM1BUM3VudDRlOTM2WHRyamRaekZIVVE5ci9k?=
 =?utf-8?B?NHZXYlhBZEUvcEpwVEFGSHBuV0tGcjN1b0NoL09adVRpZFNaWjVmZ3pCSHNm?=
 =?utf-8?B?V1IvRVJSSVJKbEs2aTdZenhHQWp5ZVRTUE1xKzh5ekcwR1dNWmx5VzNOSk1q?=
 =?utf-8?B?ZlFSZXRRMlJuYmFTZEUwalVEdXB4aUxZYTljcHN1czlPQlpTaW9rdEI1bDRj?=
 =?utf-8?B?cWd3RkhuVHg1MG41SEhSU0hmVTFwSWRmd2FpYStIeDkwWFB6Q2J3ZHFRa0FD?=
 =?utf-8?B?UVBJblpsVnRMU0crQUZyMU8xQ3RXMTFnek9PbFlGUHgzaWFFeW1GR21yU241?=
 =?utf-8?Q?4ePTfdFxN8DJmIUDZvD83UtwhsIMVzw0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wk51ejZZTlRjci9ULzdidEJxbDVUQTNDaDNYSHpPTGh0M0I2MGpqbk9nV01O?=
 =?utf-8?B?bFhJUXNNNVhlRWUwRFhDTWVQaEdWUG80dEdQZ3l1SnZ0UXNuWEIxb0pRM0pr?=
 =?utf-8?B?d2U0RFArU09YV3R1QWd0Q3UyVWVoMWMyV2xIcnljd041eGx6V09yMzlvVFo0?=
 =?utf-8?B?cHJPNEcxZnNVR1R3ZDB2dUc2ZnlxVnorY3hsM0dpR01SZkNwVmNyTFl3SzY4?=
 =?utf-8?B?b3psYjdJWnRUeWRzaEkyRGY3SUdKVHhmV0QxQkp3ek1HMlVvaEJXL2YvUFRV?=
 =?utf-8?B?ckpJWjBFQ2M4eTNDdVVUOExjbDcyL0wrcnBTOE9nMDQ4NzhrVEpzMldMeFov?=
 =?utf-8?B?cXlYSW1MUDJLeTZmNzkvc05ZUW1CVS9iM2xCUHJFV243RGhOWEllRGNqRGp6?=
 =?utf-8?B?K0pSVDgzc2F0bkc4UjI3TVRwdUtBV1hpNDlXa3A2NldTWTRwZ1pqL1graVZF?=
 =?utf-8?B?Y05Ja2lTaFhWY1lmcmw1aU1od3NEbHFra05qSTA5QXBRYmlwbDhhNEs1VkNR?=
 =?utf-8?B?TlBldnFKU3ltc0hGcFI0N0dIU0pkNzhzZ2Iyc01haE94WVIydnNMVUJxRnpx?=
 =?utf-8?B?aUNUdENVVzFuNGJJbVFYL0U2WWVRVEhhR0M3cE5YMFdvcmMwV2oxanRFNkk3?=
 =?utf-8?B?dytoME9OWGd0aWtIVXUwSVZ0bTExRkVMN2xyb2s4cHNBRktXOXZXYlNkb0JS?=
 =?utf-8?B?TlFjeElUaGl6S3pBNDZBTWhvaEJDaythNThNUm13N2IyZXRrN0VpaFlibW44?=
 =?utf-8?B?ZzFPWVBSdjdRTU55TWc2UkhWejlTanBSVjc4c1FCb2ZHRkcyQkNtamNKcEo5?=
 =?utf-8?B?R1E1QUlKK3gydWJ1T0dSMDYyaWFjd3hlT1lPWmI2VW80SER2LzhSTVVEK1Bj?=
 =?utf-8?B?QWQ5bVFlMnhKbmlMajdxRzVHcDdrNDZaZXltYVc1SUZTMml4Z2NmTXBnNDl2?=
 =?utf-8?B?dmZ4aXZHaktjQnFNS1FkNUU5N05PaEUxZkQ5SFo2RFMrbitCaW5PMkVzNENR?=
 =?utf-8?B?cVpUWi9RWjBkQXlwaCsrVTVHSmd5MkEwa2h2WHp0OWt0MyswcTZUN3NkR0hP?=
 =?utf-8?B?U1oxMFhSZk1jTUdsUlJUZVhhZC90V2xGM3VEUzNyUHdhVnJOdFd6NGJHK0Uv?=
 =?utf-8?B?VXNNZS9EOUV0cEVta0xlZDJQZThWUXlnTlhtVHhuQnlPVDVmcFNlNkxuMzBv?=
 =?utf-8?B?dlEwenc4MXByV1ZvY0R5TW42VXkvQU82QTlqek9qK1FHZWwvSS9lTmVNSFEx?=
 =?utf-8?B?bDc3dzFmOERET3RBQm8rQm9uaUhoQy9BVE92Q2NSTUExejJqQ1k0YlR1RCts?=
 =?utf-8?B?OFl6YWNUbVAzM2JUeFI0M3pWQzZZaFc0TkNXNXl5SmdzclA3enQ4MkdqK3RN?=
 =?utf-8?B?QXMyYnBGZEJISkxKVXhHNGtmM1lWVDF1Q0NiS2JiVnRxb3pBTHAvRThwL1Bz?=
 =?utf-8?B?djkzUjJNWlJwd1dXYk1JTFNOYVFLM2ZXNTA5TXg3WllacmJyam9XZ1ZQRG8y?=
 =?utf-8?B?cDJPTklmZVUwWGtHayt4S2syR3pKalJaSjNlNm9VT0xzU1FNemg2TXRqQU9X?=
 =?utf-8?B?MHRPZmN1RTdnMzIzM29Ja25DaFJ6ejQwS3lqQk9UaDZ5M1p5d1g3MkNmRFNi?=
 =?utf-8?B?MlVxS1E1NmpYSkc2K090NGxRQ1FPWWFBN3BRajhMbUtNak95Y3lVamFnZVRW?=
 =?utf-8?B?SVRuUHlnVU40WWFaaktnM0xQdE4yR1hveGxySnNYWW9jK2lydG5XUy9KeDdT?=
 =?utf-8?B?cVUwbC8rSmVGSlliSTE0OUpmNk5weHg4Z0dhNndnUUR0MXp1Yys1emRtVW5W?=
 =?utf-8?B?dzBDemtucE1QdUZjUm5RMzJqRGJJUDNvZzhMdm00NHkyL2NHVjVXcElrYmNO?=
 =?utf-8?B?R2tBRmdLb05pUVdEQnE5QURhdXpvV2NzUzZzVG9sczI2QUlLVGViWkxUNmV5?=
 =?utf-8?B?cEtQckU1bmxobHZyanZEUmJ4c2QvWUhzdVdUaDNHK09qWURVZjF0dzFRNi93?=
 =?utf-8?B?amRGcjNjY1U0ZWc4cHFiNjNXSzZUYXdGZ2JFQ3E0WnZJODNUeURNODd6VS9E?=
 =?utf-8?B?Zmp6VlZ0eXNvc2I4VGV4THE0eDhsUjdyMzNQdkQvT0pPMUNzeDZQTFlrNTZF?=
 =?utf-8?B?Q056aDRLTGdUczJTY0JCak01R1U0UjR2S0JjdW9RbHNSZ3lRalNNYUtVQ3Jl?=
 =?utf-8?B?VUE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b4d442-0505-47e6-092a-08de3e48ef0b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 15:20:10.3836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aUb0nYwFAs7SvX2c1Z7nsoOSPgyTI9zfWav8/ZI29WNejrHbEAIm7VK+FlMe1Vw4KAkDuhx2waslN2GdC49nODOoE8Kop/vhhH9YD9hsMIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7194



On 11.11.25 22:16, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Every XEN_DOMCTL_CDF_x flag:
> - is defined in public/domctl.h
> - explicitly listed in sanitise_domain_config() (common/domain.c) to form
> mask containing all supported DOMCTL_CDF flags for "Unknown CDF flags"
> check.
> 
> So, it is required to modify two files every time XEN_DOMCTL_CDF_x flags
> set is modified.
> 
> Simplify the things by introducing XEN_DOMCTL_CDF_ALL mask, so
> sanitise_domain_config() no need to be modified any more.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---

Seems nobody interested, sad, dropping from backlog.


>   xen/common/domain.c         | 7 +------
>   xen/include/public/domctl.h | 7 +++++++
>   2 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 775c33928585..4f91316ad93e 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -730,12 +730,7 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>       bool iommu = config->flags & XEN_DOMCTL_CDF_iommu;
>       bool vpmu = config->flags & XEN_DOMCTL_CDF_vpmu;
>   
> -    if ( config->flags &
> -         ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
> -           XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
> -           XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
> -           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu |
> -           XEN_DOMCTL_CDF_trap_unmapped_accesses) )
> +    if ( config->flags & ~XEN_DOMCTL_CDF_ALL )
>       {
>           dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
>           return -EINVAL;
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 8f6708c0a7cd..94a8e3042cbf 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -72,6 +72,13 @@ struct xen_domctl_createdomain {
>   /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
>   #define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_trap_unmapped_accesses
>   
> +#define XEN_DOMCTL_CDF_ALL                                                     \
> +        (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |                             \
> +         XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |                \
> +         XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |                     \
> +         XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu |                    \
> +         XEN_DOMCTL_CDF_trap_unmapped_accesses)
> +
>       uint32_t flags;
>   
>   #define _XEN_DOMCTL_IOMMU_no_sharept  0

-- 
Best regards,
-grygorii


