Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADE4C2C567
	for <lists+xen-devel@lfdr.de>; Mon, 03 Nov 2025 15:11:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155361.1484860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFvGc-0001d8-U2; Mon, 03 Nov 2025 14:10:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155361.1484860; Mon, 03 Nov 2025 14:10:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFvGc-0001bQ-R0; Mon, 03 Nov 2025 14:10:42 +0000
Received: by outflank-mailman (input) for mailman id 1155361;
 Mon, 03 Nov 2025 14:10:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9qLe=5L=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vFvGb-0001bK-TC
 for xen-devel@lists.xenproject.org; Mon, 03 Nov 2025 14:10:42 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0732b57-b8be-11f0-9d16-b5c5bf9af7f9;
 Mon, 03 Nov 2025 15:10:40 +0100 (CET)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 MW5PR03MB6879.namprd03.prod.outlook.com (2603:10b6:303:1c9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 14:10:33 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 14:10:33 +0000
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
X-Inumbo-ID: e0732b57-b8be-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8Gy/0oquLfSqlQieghaEs3qgGFHfC3U2yP8MwSVnsY6PfulaKNYUo2lnjXCNvqU6id1KQDW9Yk4lsdFNp3CBlyw7crd/E59XK5bOEpB03B8lF5T64cw+3+aEuSwHLoxu6SAUIp/x4uDste1VomB+ueKqrGCEKSF8G8D6lFeoEfwSgu3j2hj4GEc36s2UUC15qJYUHD/2dK4+9FLKDkwDSqYjG0AcsAYqZUBCPtHxD/3nmw3i0L41mAaYSZ0krUzlP9W2DNL0jLtppPJGrTG7RytqZ1DX0LGKSMiy2ZmbqgMXMvB8C4l0LDF1AumdCNwVsaI5bKS0UBrgj3cQwjMdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3onIjthpmHhBsy+KQ4CCh6zxX5I/6thsGoo/Yqp7hWs=;
 b=UYYuxn9r/Z5O/U2xzTHs77riCwvMsPLOya1KjO9vugB7bfSTaCoY/Y0SlOyCPJjBBBdurDq5+JH2rvixlgeBrzSaDfA4z8Me6T6ROjE66j/ERYdVIjSXdZ4reBxTGm1sCnLKMOQ0SSbFXXEDY2P/fwkb7eDJ9rsfxNGoQB0w1uaqNHpcddKuaQpir+q50BYz1oX3x+536yCqcwZYUT/5WQvyxkKLopaViIrYNe/yKRsBNrC4Yc1imAzuGP3fWkGHKpGMrE7E1M7ouORts54pnntaVshYT4FecgwxQA0i7a2CRftNhePBG3p7QjuLYJSKvwhJniSv0Apkf60qZ8EgUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3onIjthpmHhBsy+KQ4CCh6zxX5I/6thsGoo/Yqp7hWs=;
 b=QLzpkAOoseY5Ivx0jsNZI4Z/GnfWb5u9NtaQtZHPamwGziwF62sdJXAC00iX290BUYXIjWfrOxcBmOUCra+7/xPb3vsOl0+nYOFNzN5EjuqYWdUeM5ZKv1ov6HHCg1UaJ1Ev2+Hh5KCNOSSUzYlHfH2eLZCHm9CM4ePBZaYod6g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <211906a8-7804-42c6-805c-572b4f673322@citrix.com>
Date: Mon, 3 Nov 2025 14:10:27 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.21 0/2] x86/AMD: deal with RDSEED issues
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <272093dc-c97c-434a-9977-ad1c26e7e229@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <272093dc-c97c-434a-9977-ad1c26e7e229@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0070.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::34) To PH7PR03MB7004.namprd03.prod.outlook.com
 (2603:10b6:510:12f::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|MW5PR03MB6879:EE_
X-MS-Office365-Filtering-Correlation-Id: d8919ae5-460c-4981-6fca-08de1ae2bf59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWxpRkpzVStKYk1DbkNVSXIwVmdGaHJqUkkyaTEzMldZZWJ0RVNHOTdxWUlP?=
 =?utf-8?B?emEvalYwSkVqbzJpY2tIWTZQUjliczlqdU9Gbi9iRmRMVDQ2UVNNdDNvaFZZ?=
 =?utf-8?B?NVVUNThQOTZ3RHF2VmZPUjB3RTNVTEROZ0NyL2QreVhiZmE1Q2RTWmxqb1RZ?=
 =?utf-8?B?cXJCKzlLemdRMHdIZVlCcDJKRGNNcW80cXFUaW1nN3F0QW4yK2JEbG1ZYnE5?=
 =?utf-8?B?YjMwSk5PQzNKWTJMMlN1Y3lFTVRyS2VldnBWeDV6Q0kwVWRuc1UvbnErRks1?=
 =?utf-8?B?NWhDYWJrQ0lzbGt6TTVXOW5YYUtNa2dSejhkUzRwTkdYSWJ2S1BDRnkwb0to?=
 =?utf-8?B?OU1hNHVxVmxmNFVzRHBNdDQ0Nm5WWlNWMnUrNG5ZK3lnRXdQdk8yM09tTnVq?=
 =?utf-8?B?NnFFbENEUnh1aE96Z3J6L3F0b0tzR0ZmeU01eDJ0c1pFTVVrVGg3ZDFhUTZp?=
 =?utf-8?B?bXMrN2R4RFZaQnFDS0dmejdSSnFDODJIK253NStIcEJ0UkloSThESisvWk5T?=
 =?utf-8?B?clJwdlIrQ3JHUUlWclA5NHROQVZWNkU4WG5EbXNJanM0UFUrNXFjN1ZMejdw?=
 =?utf-8?B?SWI4VCs5NWxxWEdoTUcvaXRMNE1sYTRLdnh6bFVPdFp1R0NvV1I5blZkNmRq?=
 =?utf-8?B?Q2FGa0lLTWYzcVlPSVNiWXRKdjEzbnYwNytPOTNiQUdVcGVwakxSeTRIUWgw?=
 =?utf-8?B?UlBsd1lGazI0ZlVyZDd4OGhpWEIxcVhEeXVuOTJ1YXdvZEtXaGpjV2lWNm4v?=
 =?utf-8?B?R3lqbWJ5UlJXQVdGb2drbVk5bXVncHRmcWJ6K3BkYWczanloY3FSb3VHVHNL?=
 =?utf-8?B?cGtjSXltNCtUempqT0IrczluSGo1Vi9qVmIzUSt1dWpVT2RkUGdNQVF6SVJI?=
 =?utf-8?B?RUxlSXhibSswV0ZnU1k2dVR3czVBc2N5OTM5eFhtODJYVW5tZDhHUXlHTkpX?=
 =?utf-8?B?RXk3VmhMN1BHTzB2S2Mwd0J3U2RmMFhPeGU5U3VwckVoQVFLaVdSZ2hPNUZq?=
 =?utf-8?B?d24yRDAwUTAyb3p5UzUxQXRyWndYZlFVWUNFQ0psS2EzSnJtNmMyZktGamFi?=
 =?utf-8?B?RGgxZitPUzFVUVVwZ0lLUHd2UHRIblE4Z09aSjlHdEpIdmI4ZDlqTjkzWHlD?=
 =?utf-8?B?eWV3OC9SeHZnSlpoMUJMSzIxbkJtMFpXaDBsZGgzT1BqZHpIcFZlVCtGMU41?=
 =?utf-8?B?SUFHUUpLTTR0UCt3ZzczY1FFS1NKSmNaOEZYOXh3NWRmdmthcEhOVjRrS0pM?=
 =?utf-8?B?NStaWncvMnoxNU5PRnFOV1phVEg2Q3I0QUNLZE5MZVV3NmRqelVZK0FlcHI5?=
 =?utf-8?B?NDRFa2JrVHIvREwxYVQ3TU1PWGJMdUJ3b2F4aXRwaDJJUWhnOUJVcWFsTll6?=
 =?utf-8?B?MUxhcjVzQ3ptdnB1QkxtdVNTWG11Q083Q3JNelArVEtWQUE5clRCc3dHVWVh?=
 =?utf-8?B?T2pjNUcvYnFYV3lsa1JRL2htM211NVhMR1drQThlNWxXNzJoVllieTRKU2FP?=
 =?utf-8?B?dENqd1VlcVROakg2d0xITXR4dVZ1NWJaYnplMlhoK3JKeVI4Tzk4MS9rcllB?=
 =?utf-8?B?OW1tcUUxZlhOSWExQm5hUmZIdmxHalBLWFFIV3FIWkE0eFR3Q1pLWDBscE1l?=
 =?utf-8?B?VXJBWmZ2eUxKYjNyTUtLUCtwWmxsa05BUWlDN01tcGFzZUJlSVZvaGpwdlBZ?=
 =?utf-8?B?L1FNY1h6NkFUbVU5SkxFazJkdzc4TlVQU1FJcmxuY3FBOHhxNGVQNms1N21E?=
 =?utf-8?B?NUZld0FZQzJBNGZCWDJHaU9iVXo5cDAwV29UM2ZkTi9rZndjdnVRNk80Wnlv?=
 =?utf-8?B?TEJZVEZoL25XaHpQYnF6RnB4S3NlVi8zWHB5QTNuNTVxdnM3T05xTDIrTmRa?=
 =?utf-8?B?R1NCZHJPUG9JclYvRlZiS1B6ZFNHS3VjRExXcnZaSy92RStpTFRRWkNRcmhX?=
 =?utf-8?Q?I84Y1WznYLGzFG9sdDtjPuGgvej9uu97?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVJ0VUZvUnE4TFhmMnJsOUxReE9sdnk0NWEwaHM4dzM5eEYxZHhndFBMTkNl?=
 =?utf-8?B?Wk1OSWlGNmNsZWl6Z0ZPNmRqOU1jK0lxQnJEeGxwaldZa1U2bHhyZFhrZFRS?=
 =?utf-8?B?ZzBBSGxUblI5ZmI5YkRmNTVBN2MyQ09OZ3BUTGFBdEdDT3VvS3NKQTRaVGNw?=
 =?utf-8?B?b0M0K01ZeW1HcGF6N1ZEdzJDV3dSdEhVY3lDaGo2QUxsZUhCOGZRdC9ObEJz?=
 =?utf-8?B?RENEU2VFWUlyeFBIRTlGd210ckdnTUxSN2NGc0JJQ2Z0NTJOWFk2SGpVRVVJ?=
 =?utf-8?B?SXJVT2F6QjBTUmFpVFdQdlF0YkhxYlh6OXRFV3k4N0hOeGFRL1p0eklFaURs?=
 =?utf-8?B?Vk9Ed3pMQ0tSaWdRNjF6MS9YTGxWZGV3Z1dtYlpGRzZxZ2JkOGtyb0tpeGwr?=
 =?utf-8?B?a1FFdmg3TnFtR1RaOElDM3pVUjB2U3JwRmF1WWVkK01BYTVXRzJLVm5maHRq?=
 =?utf-8?B?MG5MbUVpUGR0bTVnTjk4NFRSbVlhVi9pcTRUaDd4UEpWamM2N2ZVdUswNXdk?=
 =?utf-8?B?MENZUEcxbTFFT2oyajNCMU1wUTVLMnJpLy95VzNZc3gvMEttOEVyZi9vMDQ2?=
 =?utf-8?B?ZjVkQXdOSFhNTFhielZSNkEvOUhyV2s1VVg0TUVHTGR0RzAvWWVBdVV5anhQ?=
 =?utf-8?B?SWJJYllQRjZzQ2h0K0lTVFd0Z1U4aDdWWWx2akVPbWJIS0FsY1JuMngxNEln?=
 =?utf-8?B?UmUxR2ZpSldZZHI4QW5WMVoya0dBRGhmREtRQTBzTitTR0ZmREpGMVlhSnZF?=
 =?utf-8?B?d0Fjc211NEZJdld1NGdaS21nc2hvZ1EvQWdnUWZIbUxWWW1hVG5UdjNGT3JV?=
 =?utf-8?B?RGdiTzc4U2xnRExVMWdCYTdmTlZVZW1yVGZQKytnQ3dMSmxkTFMxYnhraWsz?=
 =?utf-8?B?U1hSeENDcWN2cUVLNlVBdVBwKzBmTzE2TlpEZjBSckc5Sm9zNXlhVTUyb1h3?=
 =?utf-8?B?Y3pyL1NBTGNBMi9zeXVBdXBYMEpNMTZ1MUlBUXc2UWxsUXByanFqeWIxK1VX?=
 =?utf-8?B?WnQ2TDhlYmdpTUlsSTIyTWVGNXh2Zm5xcUZ3cDE4MUVtVWYzV0F1L21jQmJ2?=
 =?utf-8?B?UXl3VTFobS9EZXVPZmNROGwyTVRGVDhSS1M1Q0pzbElHL1FFSlZma1lvWlNm?=
 =?utf-8?B?bDhUUE5QdHY0MEtTa21VczdLcGszZ2tEaDQ1M203SERGdXh0aWt1RE9wcHlz?=
 =?utf-8?B?N3o3YWNSTFA2QXBJUHNXVXM0UC9lK3doSy9YWEVNS3Z4VUJKOE4reWJvdmJC?=
 =?utf-8?B?Q0xPMW93TjBGdG9lQnlxTGhkQ2NnbFI3dE9lT0Voa3pQUGdOTk52NWFuTEd4?=
 =?utf-8?B?bHE5eWphUFUzRHV0bDJia0xQbjdoZTk1MDU5V3hRMUFKZHp3ZWJ6K3lFN2kv?=
 =?utf-8?B?ODR0YkNLMlVlMU1uOEhzZDlaSytpOC9ZRWNqQm1uVXlaZ2RvVkh2N3Vka0k0?=
 =?utf-8?B?L0tQcHhjdzkxeTUrZS91TGFFUWJnVURaSEVBbDJvRWFNR3dLTDlYVTNzMkxt?=
 =?utf-8?B?UlBjVm1tKzVBQWUzaXdId2ZmSEpBR2M5OXJhNEtqS1hhdFVneU9QS2I5QUtG?=
 =?utf-8?B?Nmx5a01oQlFCck1yRm1CVi9jeS9ER01tMmxLVVpNbG5vVHZLUGltRVFLN3lQ?=
 =?utf-8?B?YXcvMFNQSnNTZDJrZVkzaU1LaUJRUkdCdEZrTWZmVE9lNVU0L0g4b2crVzJC?=
 =?utf-8?B?R3FyaytzRkxaZDdhYzhFczk2a2VWMkZWbVFOUlV3RlRnUmR0RzhyZHlMdzFR?=
 =?utf-8?B?Q3M3VGFiUWc1cm10TFhHUVlueVNRVmhMZENBanI1d2dPTWYzdVJYUjNlUWJT?=
 =?utf-8?B?bGEzM28wSE9EcVRzL2JtNkluVkRyYjBaTWhwd2M0OWQvalJrYWhjUkhQZ3VU?=
 =?utf-8?B?WkVQN0ZrUXpVMjB0WGI2Nk9LVVRsWVE4UEhTQXZaV1hvUVVlSVZzbUNPc3ZJ?=
 =?utf-8?B?RkZkNVVaYnYvSSs3bkFtSHlFMmdjTFk2ZTM4U1ptWnhBNmtBVnU2WjRaMnFF?=
 =?utf-8?B?cW91ZVNjU2EzNjMreFhaL2RwR0dnQVFUTTZ6b3pVcEYyU1NlYTlnbjhMOVJs?=
 =?utf-8?B?WVBGVmZOckdFYzlNTE94ekxYczVLVzh2ZWkyVTNKU014eVZWdWFxdWhVNG1O?=
 =?utf-8?B?dFVhZ1IrWEdHMzJLYkcxaDRPYW5PUnlLSjNxWDdGSmh3dGdlYmtQZThTOTVa?=
 =?utf-8?B?blE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8919ae5-460c-4981-6fca-08de1ae2bf59
X-MS-Exchange-CrossTenant-AuthSource: PH7PR03MB7004.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 14:10:33.0197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLXHLNPCrCTvaWRwS+c/bPs17dBwbe0LoxjgGvceyx6x10tS9ND2Z/OivKHloql/IUffbFv0hgvk56Oqf//ZicRxSL3+u/kK86sAmYTXHOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6879

On 28/10/2025 3:32 pm, Jan Beulich wrote:
> Both patches also want 'x86/CPU: extend is_forced_cpu_cap()'s "reach"' in
> place.
>
> 1: disable RDSEED on Fam17 model 47 stepping 0
> 2: disable RDSEED on most of Zen5

We have two existing cases for RDRAND issues in Xen:

1) IvyBridge SRBDS speculative vulnerability.  Here, the RNG is good,
but use of the RDRAND instruction can allow another entity on the system
to observe the random number.  RDRAND is off by default, but can be
opted in to.

2) AMD Fam15/16h Laptop.  Here, the RNG is fine, except after S3 on one
single OEM.  Use of RDRAND can be activated on the command line, but
there's no ability for individual VMs to opt in.  Being a laptop,
migration isn't a major concern.


For this seres about RDSEED, we've got:

1) Cyan Skillfish, the PlayStation 5 CPU but also in one crypto-mining
rig.  Here, RDSEED is deterministically broken and not getting a fix.

The chances of Xen running on these systems is almost 0.  We should turn
off RDSEED and be done with it; it's not interesting in the slightest to
be able to turn back on.

2) Zen5.  Here, RDSEED gives a higher-than-expected rate of 0's for only
the 32bit and 16bit forms; the 64bit form is unaffected.

There is microcode to fix it, on server at least.  Firmware fixes for
client are rather further away.  64bit OSes are likely fine (using the
64bit instruction form).  Some Linux devs think that Linux would be safe
even using the 32bit form, if it really only has a 10% zeroes rate.

There is certainly a risk that software uses the 32b/16b forms, and not
mix it properly with other entropy, but the common case these days (64b)
works just fine.  This means that blanket-disabling does more harm than
good.

This case does really want to be off by default (given no microcode),
but able to be opted in to.  At least one major class of OSes (Linux)
are safe despite the issue.

~Andrew

