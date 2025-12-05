Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EADCA8146
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 16:05:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179169.1502776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRXNA-0001LH-BU; Fri, 05 Dec 2025 15:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179169.1502776; Fri, 05 Dec 2025 15:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRXNA-0001JB-8t; Fri, 05 Dec 2025 15:05:28 +0000
Received: by outflank-mailman (input) for mailman id 1179169;
 Fri, 05 Dec 2025 15:05:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K96r=6L=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vRXN8-0001J5-Bv
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 15:05:26 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2839be1-d1eb-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 16:05:23 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS0PR03MB7677.namprd03.prod.outlook.com (2603:10b6:8:1f8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 15:05:19 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 15:05:19 +0000
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
X-Inumbo-ID: d2839be1-d1eb-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=If7S0Kson7x33p/70fTIHs45SDHBBovz7Fwf+peFsmeJer0IP914KlOr0Xy/rOiinsyBeB09TgoGu84H78oFVmriv4++AedLW5vnTSRXhu6seDoPppON2LXdST+rZHhMw49T/a4NWGMaklid2raYLXEv81dkI5S3om/W8vESCe/JpI5lpG+16E2IuqQidtuzK1lL2VmanqNp2cPk4NmmL7a9+9dMq8nBP1D2YzMW8ohZnX6oE+M9/VooPlbH0AjOYK7ezbeGMuqZU0bV1C/NETJ094x+EcRioKYA6aGWaizDSby3jL+/L89Njl4MXkHnWTjf0P4+CMgldhjwc1sv/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yGAjyj6tt0na3EhHIgXsFnrJrm/rdwBQBTX7GA5403M=;
 b=lj6b4ckPVjdydUFyyZ8Ta1N6+rdKJNKdhrvMEC7d2cvsdX//d5ukijHei3Q9Jz3SCI2wCEHIyUieUoFAadBIPQCX/8RDsw+L9LYm7WDILzFx8MCaeP7cAI/P0l3ovxknzE5BmrUzawOBC7JCL6JEJeHB3/N/Y/SOfhtYVnAm8BoXlmBTbfCAnSOFmSuesjYJ8AQQbQSg/KUB/sZR49867CrY/ey3LpDdRgW5tflPDniuejJ3hoZM2AUlY2MhPH/89O4pEELnzbyuD0VzDh9SxEjfHIgYvs6iCKEtj6Oz8QWBZ8fDbbod2yuOf53xtdfvwygg5SxDD1kVOigJtQwn+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGAjyj6tt0na3EhHIgXsFnrJrm/rdwBQBTX7GA5403M=;
 b=pgNMqRuIEGf9fP6WffUN54u9GWBWVIq8gPed4yS6nVIvFMd8FoToj/zKMqJfc1yTzjN+gt4ZHthh5gYwRWtgJI6Jgcz+JkmWzvIalWUn9R+khYcWQpvuhFcW4ezH5Ss1krsLRo82L5MZvcRo7/FEjOz5oGeQi5wcX5KnvCajo90=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <71a560d9-c96a-4cf1-a616-c4366c1bb9c2@citrix.com>
Date: Fri, 5 Dec 2025 15:05:15 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Mykola Kvach <mykola_kvach@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] systemd: default system-sleep dir without pkg-config
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
References: <f03c8a2fe81527841966ed6c8ed603d1d90ee5c4.1764940296.git.mykola_kvach@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <f03c8a2fe81527841966ed6c8ed603d1d90ee5c4.1764940296.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0453.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::33) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS0PR03MB7677:EE_
X-MS-Office365-Filtering-Correlation-Id: 3546c3fd-7019-4673-446e-08de340fb429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MklZRWpTSlByaER3OG1uRmNqK08zdmR5UnlHQ0dIY1ljL2tONGVwaHQvYWV5?=
 =?utf-8?B?dFN2TVVza29DdjVwTSs5Ny9sdDE1NGhsRFZvRXpDY1ZSZ0dCOUE3bkdGeTZi?=
 =?utf-8?B?L0VGMHBLZVFRZDZFbGpRMWExL2lVeW4vZ255RTVKeUhLbkZTWitudWRLUnUw?=
 =?utf-8?B?eExZQjlpcVcxaFBuWVRKVGJqTjd6Zm9UMVRUajc3b0RnbU44ejIxSkVzRzBp?=
 =?utf-8?B?YVB1dmVMa21yaFlQMEs2ZWFhT3gvdkxuTGpoR25OWjRMeGJ0bjlCQnVVb1FM?=
 =?utf-8?B?aFI3NmVUV1JtQmVNeWE4d29WQURnb2lhN1dpajhTb21Pb0F0ZHJGMVRCRG1u?=
 =?utf-8?B?eWRHeDF2WUNERFY5V1ZGdlJ1MS9BY0ErSnpHV1RvSE9iWUxwSExGak9mZlRJ?=
 =?utf-8?B?aDlCWlhseGlMRUkwK0l4N01sam9RRWhmUHRjbTh1WEhqdDBrQ3FscVlsZm4w?=
 =?utf-8?B?blVtcXFWcVVkY1JQRjBrOVRvdHRxYUNjM0QvYm1id0VvQ1UySm9RQWJGOFpD?=
 =?utf-8?B?WnI2WjU2M0tCNUVVaFRCVkp6dGFta1VUeTgwaWVqTXk5MXpaYkFjVUpuRUs4?=
 =?utf-8?B?RGRvYlQwTU95OG01SU9KZ3ArSFB4NjEvV2N3ZUp0aFRXdHRIaU1kZml5VHBy?=
 =?utf-8?B?WmZVeUNDUFN1dXRLY29rWGkreW4yNzhtSHcrMWh5ZFBmVzJmSHZINlhSeWNu?=
 =?utf-8?B?UEw4N1FZRDljby9GMWpqcFhBUWRFdkNLb3FLSHNQNE5XNWtaUzk1bG4xbTM3?=
 =?utf-8?B?RHNVbko3WXRTWFJQalljdHZzN2xWWlhpUXhPREdiNmViaTZicWxUVEhnSk1V?=
 =?utf-8?B?Y25WTzVXVWZLZzlvQnozbzRodERxWUlwSm04Ujg1a0JzR1VLc21waEsyTlZQ?=
 =?utf-8?B?YjVsMHZjb2I4YlRBdDZIcVJXK0ExN2JLb3ZJSWk5Z2F5Zm5kQUJUWTlVWSsv?=
 =?utf-8?B?ZkVWMFpPMG5EMWZweXJwQXAzbWQwbXREbjErU3JxVW85dlIwanJqaEZkZTJ6?=
 =?utf-8?B?ZzJyeVo3a0dTelNsN0paemkyRWJSbE01WSt4aHB6dVMrWHFFSVE4U3JFckZU?=
 =?utf-8?B?Mm1FYzZSZk9EYU5LU09mRElmNzJQVGNLTk9YVkZLUmF1SU40NjEyMlNFWFN3?=
 =?utf-8?B?Z1U3NkQzOXRoWHFMTmpHK0p5VXM0dUxhL3lEVFFFdzdHS0MzT2xTOVgwNTZT?=
 =?utf-8?B?ZTI1My9rRWJDT2hYMlFycTUyYmJHSWtPS3ZZajlMQU5EbWRQRlZYWG9kUFB2?=
 =?utf-8?B?TFk0ZE9BVEVENUIyV2pCZDVlOVRiSlFTUXl4ZXp2eDlETnp4YVpmQmhZYktn?=
 =?utf-8?B?cU15VVNxaHJJMnU3U1ZEdkxjQ2p3bzJDWVJqeGptbG1rV3JmVWZmOUpkY1hy?=
 =?utf-8?B?SDFPcEZCV1ZhSmtCclV5SGtyM0U2U29GTjhoM3dxVkQ2cDJiUmpRWU0yU29U?=
 =?utf-8?B?dVg2azcrVDBKMEEzZzNYQUE3ei9rNXRmc1dvaHJpUmlrMDYwaDU0RWdrR2Rx?=
 =?utf-8?B?UHh6MG1WR3ErbWtZZGlsTkJaSHpZdENtM2l2WEU4eTlMMjd2SFhpLzV4V1JP?=
 =?utf-8?B?YmJMckc5MG1wdHc3cWFiUkFGYTJiQzVHVlovZkFGUnArbHpJS3N6WUdtcWRE?=
 =?utf-8?B?cWxzS21wL241Tnk5Zi83dzNWa3RPN1VRQ3dON2dOUlcydHI2UDJXN295NUtM?=
 =?utf-8?B?YzhjNkRCd1dvZVdaelNnZXNnTUtZVEhTNTQydjhqaVA1UGlncDVKa01mZWF6?=
 =?utf-8?B?U1plSWxObkpxTVhialExa1JxaDQ2MFpjay8va1ZQbllkbE4wRGpJUG9LdDdl?=
 =?utf-8?B?ZmoyMmdnc2hSZkZEZUZOS2YyUUQyb3VLWWttSXdmT3N6UHlYK1lRRThWdTI2?=
 =?utf-8?B?M21YQzNoN0RjUHp1ZkNYK1hPZHBHbG85cjNZTU12eHc0Y2xmeWlUaENSTHhR?=
 =?utf-8?B?cnBZV0xjN2FRdUUrNktWVmZVSjlKMjRpYlR0ZnZacjRuOE1rK2E4dFArTGxN?=
 =?utf-8?B?ci9XaVliQlJBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFZRWFZIY0VPWkhDWDM3d2QzN3BKcXh3d3VGR0dJTFRJbmRucE16VnlGUWVo?=
 =?utf-8?B?ZzZTS1BBd0xEWEVFQkRkQS9yakpuaHA0NDVReUVtZWNjY1k4ODBtVStUWUl2?=
 =?utf-8?B?OXZrajlBc1hZdUx0R2pWcFlWeHNuWFQ3RXczMjJTbFQrVVBVNjBTMXlSSko0?=
 =?utf-8?B?YjlCZkxHb05rSDhPdm1JcGhaU3ZOSVhibExLN000UmVkbEcxNCtNM2JKYXF0?=
 =?utf-8?B?cmdBWDhpWXc2Z2NxQkRPb3JBaDRlemY3VzdlUDJqMnF0ZjVDTkF5QmxEZDd6?=
 =?utf-8?B?aXBuWlNEcTRtcTlVU3BUVHozWGtLc1ZROHhvbFdjdW9peEozSXp4QWVEMzVz?=
 =?utf-8?B?WUdnV1lTZDJwc0FDUGNMYk1YazhQRUorWmJjRlUvNFZITEp0UEJxTnRuaXRl?=
 =?utf-8?B?ZmFLTHdRWlJRWDJEZHBRckkzRndIcHUva054WnlaVEpQOUhKYzROT3k5VWpx?=
 =?utf-8?B?MXJ4dURRQXJ1OUdtcTFTUVpXNnIrTms3VzlQcW0xTlU4c0ZWcnJmQTJvQTFE?=
 =?utf-8?B?R3VLWmJwM0hIOVFpdUREMjc1SEZhVEVmMEJzM2Y1WW9sakxpRG9BQ29EbDAx?=
 =?utf-8?B?UlpHT3FPdjQrVFdGUWlLcVcvejF1SUlLSW5kL2U5VWRlc1NxelRaWUJreUxK?=
 =?utf-8?B?VVlHa0xHT25NWEJUZllQMzhlblNtSGdnZVZGSmVuTEV6MjJzZ0NZaURuSHNl?=
 =?utf-8?B?QUppcHBqMkcrV3JiTDRMSkhBZXJrdHladkxBSkxvWXl3T3Jycmp6VHV6aW5G?=
 =?utf-8?B?VUNLdXVwL2VkS1hHUTF3RXk5NmRWNDF4S09UK3EvMUh2NjFPT2xJWnV1M1Fm?=
 =?utf-8?B?NW85UWpwcktneFpPTzNLUUhWd0lrT1ZwdDRVK2lPSVBYcCtua3NWd1k1NVE0?=
 =?utf-8?B?N1ZJN3JlRmwvaDhkVGxkZ2QwbTVxTUVQMTVhSnpMRVpyY0VVVXlRTUN5S1pC?=
 =?utf-8?B?VGhHc3JxdWdNQkhrVTMwRzh3RStGeGxNZ0Z2RUtHV2o3N2NQc2M3a2h6K3pv?=
 =?utf-8?B?cEZCWW96Tm9URXh0MWRDK085RzlmVnVZYmlwV0V6YjhjYkpxM3VZYUx5QTkr?=
 =?utf-8?B?NW9WRGRXeE1LamliSS9mUjdIa1ZTdGtDUmh6QTBsLzBkSUJUb2EzWjNXY3hx?=
 =?utf-8?B?RGNwUVpZTFZxdUdmN3AwTGFWdDlaQk1rZFRpdlVuY2FxS2ZoUVM2dFVscHN2?=
 =?utf-8?B?NGcxZWx6ZkozdWdCMnAyZmRSU1pGWmxLTGJmZ1lqdE5mdjJqNmdQeEZra0E2?=
 =?utf-8?B?OXRncTFUVEY3UzRzUGFaWWhaejEwVnM3UVNaOE5oVGcyMitUbFVIQ0hhK3lo?=
 =?utf-8?B?bXJiRnh6bUlNR1pxdVBkTHp1SmplbENrY3dkM01TaUN4c2RleFhHSXA1b0dr?=
 =?utf-8?B?K0xOMWQ2SDJmK0FMejlUK1p2MkZtWmxXOHMxNUFrbTIrdVVXMCs5S0JTZzNV?=
 =?utf-8?B?VmFGWFgrZ2RMdkQ1enl1T3RZOTAyYUZWU0V5SjQ4ZkJLREljQzZMYXdHejFn?=
 =?utf-8?B?MFZkNmRydGUzZVgzMmlMQzk3c25qTzVQcEMveGIyajNvdFdoT1Z5MmFQN1hv?=
 =?utf-8?B?TENQZGx4Z3FZQ1V4aFBNYlhXTG03YUlSSmY3ZHRodVkvaTlwcU1JYlhQZEg2?=
 =?utf-8?B?aWdzMExST1M4WUdiVzJhaWI3eUdaZzdnbDg2MG1Od0NSUXRLdlBMYnVOR1JS?=
 =?utf-8?B?RjB1aGJhZjhCdkF2aGl6c0w0WXdTU2VOQmZVbkc3cnpjdWRtSENMSk5jZnYr?=
 =?utf-8?B?V2RiRVI4WGsvZVhsZENvM1dNb0s2NkJPVS8rZkZOYWx3cmhsYm1wb3MzcnhL?=
 =?utf-8?B?bHZraXZGMXg5bUdBZnZ6Z2xaaWgrcWV4ZklmNjlWT1pBeVNFVEpZaERqT0FD?=
 =?utf-8?B?V2o5QXFxaG1aVEZTYjdidWF1OENySmVBQk96TStscGRwd2hpRllobzRGc2U1?=
 =?utf-8?B?YVNwMGlOTkZXY2UwZXE5VEFnV3FoL1M3NWFIc1QvTEZHaXZYeTBwNmVLMFdV?=
 =?utf-8?B?SUUwWlZsWjdta0R0WHlzM1Y3dk5vWmxvcWw4eXZCNnpRaUMrRE5ObURyQk0x?=
 =?utf-8?B?QnVtSkVOR0ZYWnRyQ015SjNoYmU5SWg1RHNXRHVtZlNWMkZKZEo3NDMxcmkw?=
 =?utf-8?B?TjRZcXY0djhtZFFZQmdESlZpTzlQU3RKSzFmKyt0SWtpVG02NTBWbS9FY0Fx?=
 =?utf-8?B?bnc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3546c3fd-7019-4673-446e-08de340fb429
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 15:05:19.0068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DPn/0peEGQN1naYqFjqYqhPERsz+K24fzx15yhgGeo+xjO17YVB1NkBwimkXEXxz3QacIGxPhpI2KqLjxz3Z7ZR/BBF3B3UjnYTWWXaIqMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7677

On 05/12/2025 1:13 pm, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
>
> Using PKG_CHECK_VAR() to obtain SYSTEMD_SLEEP_DIR reintroduced a build-time
> dependency on systemd-devel. This breaks --enable-systemd builds that only
> need the initscripts.
>
> Use the same defaulting scheme as other systemd paths: if SYSTEMD_SLEEP_DIR
> isn't provided, set it to "$(prefix)/lib/systemd/system-sleep/".
>
> Fixes: e54a6cd6a1f3 ("systemd: Add hooks to stop/start xen-watchdog on suspend/resume")
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Build in which the regression was detected:
> https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/10959608099
> ---
>  m4/systemd.m4 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/m4/systemd.m4 b/m4/systemd.m4
> index c47a25ef93..ee684d3391 100644
> --- a/m4/systemd.m4
> +++ b/m4/systemd.m4
> @@ -77,7 +77,7 @@ AC_DEFUN([AX_CHECK_SYSTEMD_LIBS], [
>  	], [])
>  
>  	AS_IF([test "x$SYSTEMD_SLEEP_DIR" = x], [
> -	    PKG_CHECK_VAR([SYSTEMD_SLEEP_DIR], [systemd], [systemdsleepdir])
> +	    SYSTEMD_SLEEP_DIR="\$(prefix)/lib/systemd/system-sleep/"
>  	], [])
>  
>  	AS_IF([test "x$SYSTEMD_SLEEP_DIR" = x], [

Actually on second thoughts...  The build failure was hitting this
second check, not the PKG_CHECK_VAR() itself.

If systemd-devel is installed, we should use what it provides.  So,
can't we just do this:

diff --git a/m4/systemd.m4 b/m4/systemd.m4
index c47a25ef9393..5fb5a7089ee3 100644
--- a/m4/systemd.m4
+++ b/m4/systemd.m4
@@ -81,7 +81,7 @@ AC_DEFUN([AX_CHECK_SYSTEMD_LIBS], [
        ], [])
 
        AS_IF([test "x$SYSTEMD_SLEEP_DIR" = x], [
-           AC_MSG_ERROR([SYSTEMD_SLEEP_DIR is unset])
+           SYSTEMD_SLEEP_DIR="\$(prefix)/lib/systemd/system-sleep/"
        ], [])
 ])

 
?

~Andrew

