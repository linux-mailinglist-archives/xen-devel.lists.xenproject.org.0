Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D87E1CB0EB1
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 20:20:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182125.1505057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT3F3-0008JD-KG; Tue, 09 Dec 2025 19:19:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182125.1505057; Tue, 09 Dec 2025 19:19:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT3F3-0008G6-Gs; Tue, 09 Dec 2025 19:19:21 +0000
Received: by outflank-mailman (input) for mailman id 1182125;
 Tue, 09 Dec 2025 19:19:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I/6M=6P=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vT3F1-0008Fx-F0
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 19:19:19 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f471183b-d533-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 20:19:17 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by DU4PR03MB10910.eurprd03.prod.outlook.com (2603:10a6:10:593::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Tue, 9 Dec
 2025 19:19:14 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%6]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 19:19:14 +0000
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
X-Inumbo-ID: f471183b-d533-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D24MxNr70clYAp+nfZ67eMoOFB9+ESbuSsTJ/4hOnGi8EaoTQ0Vei/72cOWZ5RSJ1Dm2EURGoCborJVhCdu2GV2NPh0AvmcS7AijacaXlOKPwIHL7eHgItBKtmMjJFjMGmeC9s9iVNrMfN5qneJupUNxYwsCh00nIooz8+L3B4zTP5JM0BMRg+IvaIrFmu7a19UgBemSnmk/xYF+U2KRtKZa+B26Ap4DmsCM/Z4xpGGGCUafOSfu42ErzxrWbHVRoaN2XrAa89lLqdvhUBYvEcEV6BhPHRPJtOb8eDdb2lEw6qJn/5qWpH1+qU6HDiviTY5TDuQ7HQXNdsdtcFOT1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUNwCmG78b9LMMATcUiuU5iYhBPylNLMGrW7cfX9wXA=;
 b=nW7ots2hxPaOE4ifmT1pdmhkh+/SbCWyV/jtW0RA7RvOEltpf0NPfiTIXv7rOZ1wE4+rMRDJd2h1TajofOJ0x5YRc+ZrEdRgbNZndIEKTIX/10pAPsgzTwDj4fb/mWWNdo52+aIg2sISuole0MTVYTg4C2rXCPpg1dEg06oaYw/bJXecfAxvxexMfcXidFk6FTE/EoL17tMkLYAS3UK1Pi4kJ2e5OnlDQCoIkX1+Bu1Aa8v1LOcrxo9na0j3ceVZWYY7u/Y0M5mxiYDTSAr5JrFMgLde8HGhxae7mwV1QBMrxKRmkSJZlQSB8SI0YBdJtLjjQmU3FZzt7oVELmBC4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUNwCmG78b9LMMATcUiuU5iYhBPylNLMGrW7cfX9wXA=;
 b=WKIE9MTc/prmsgOA9FrSHsKH9uAPx/SaFvvAs4CzR24T3SUqtr85KzadyvC7BYV2u3xWFNRxEM2Z9iERfTU8Zs56UBsM0S3wI1x+NhO3818zETaqXpZckQ5nl0ATSnG+sAOmtbKCaIjDytgcpbJVBqODAMLdqvddaha1tK91uBG0ylpNPa597FEjK8k0aDLKyaBxAQpS2RGyqI+qzXZ8+Jo2k7d4rrK9twqKWYS5cSQzQltM9e1rWUAFC+BZzkeI0v/AUUvAMGBsjBDRyVsJGUk86wlXnYCpNKqev/kp8B0VNp3QlNqBJvR4sx/pClxSBCG/2uxWxipfLXut/OkxCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <d0f0bfc0-e0d2-45bf-8969-c09590429ab8@epam.com>
Date: Tue, 9 Dec 2025 21:19:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pv: Unhide writes to d->arch.hv_compat_vstart
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20251209155719.2098440-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20251209155719.2098440-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0013.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::14) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|DU4PR03MB10910:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fa26d7c-933e-49fe-0c60-08de3757d702
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VnBiZkdES2dNaWVKMTMveHNTdEtkR2ZkVlRCakJsYUUrTlpNblNCYlFQS0JS?=
 =?utf-8?B?QVFJTzdoNzhlbmtqUVo1STg0My9Xa053OEthM1h5NWdvbFdHUmwxbERBMEFM?=
 =?utf-8?B?dTdMazZvRmM3QTRFTFJma2JiSG9QbXphZVdXYzRncUhMeUU3UDVrcU5ZOG51?=
 =?utf-8?B?cGYzaEFqdmgveFhlNGdPcm13L1Q1QSszNGxFNWo5L2lhTmxkaThHM1lhcTZL?=
 =?utf-8?B?dDNBaXhPVEQzeTZZYURlNWpwUkh4M1I2b1h4WStXVjQ4MlR4M0w4b3J4RVNP?=
 =?utf-8?B?anJPM0dSWkorMTJFRHpKTlVxV0NkUEsvZWkxL296UVRHQk5IUi8xRUpqZ21T?=
 =?utf-8?B?Z1VEWVV4WFdvU0d5WkQ5WFVRN3QvMkdhV3FWbDBWbjhUc0VDdEJlSkFrM1Br?=
 =?utf-8?B?Z29IN0pVZ0ZsMWdvempzSVpvaDUrQVlVemVqcWRydU8yTmFVRmhlQWJzbzlu?=
 =?utf-8?B?R2Z3TG8wQ1JUeW1GSXRPSkU1ekZzZDVsRUZpTzV2QmdmMVRXQjVGZWg1Kzlw?=
 =?utf-8?B?Y2VKUmI2eHdIQTBYMGY4YVN6YTFDU3V0eDBQLy80c0djVDNFSE9lcG5yaGJF?=
 =?utf-8?B?OVlpYXdQbUJZaUcwMTF1RVlTSmdScmo3dGdwakoyQjJUYmJyS2FNVTlBdlJ0?=
 =?utf-8?B?UnpHejk4TnQ5TUhqanlKOHdyRHdydXBVUHJjdmNFUHJGYVVRMTRrOXhUcENB?=
 =?utf-8?B?Nkk3RHZnNWgvS2NSM1BHSFhKdFJrWTA1UFFZeTRzMlAzbkZDbUxnMHl5b3FS?=
 =?utf-8?B?ZmlKQ3NhQ3FCcjZ5V0VNdkgvYnNjeFMyalNrSzQrNFZENmRscFJxSUVFcmxw?=
 =?utf-8?B?MFhibTlHSm5xaklUSldBRG4rcDhkdGpaSUhrYmp5R240UlgrOVZtU3c2L0xW?=
 =?utf-8?B?SmdMN3EwVEloeHlNcWp3QVdXL2VZdjlCc0RMUjJQNk9pQlRBdDBCY0JvZ3E2?=
 =?utf-8?B?S0pad2F2TE41elZPV09abm1BMlBXcnVmTk1WSUwrN2dFUEY3Y3pjS2FPTTdn?=
 =?utf-8?B?cGRtNE1UMVM3cDFnWjZxQ2J1eXBaYnJ3bFNZWmhQeTZLYzFnb3MzQVlOK2Zw?=
 =?utf-8?B?c3VTR0Vwa0EwNENOWlIrS1kxdDJyZzcxTnFTdy9nUE5lM0ZxZDJtS0s0THZT?=
 =?utf-8?B?ZUNkK1ljQVdnV09SMHBFaXFCN254dFdTZmV5V2ZJY0lQTHZSaVV0eFNpM3lZ?=
 =?utf-8?B?RTdnQjF2MVJXZ3R1bFhKN3Q5R3YzRVl1YlY5a0wwcmRlQzVNM3NoYXROVXQz?=
 =?utf-8?B?aUVSU1RXNmIyeTMrdDIvOXFJek0vT2I4YUFFWWlYMW9WdnJXcnNmWDJDQk1T?=
 =?utf-8?B?Y0JBbGhsQ0hDdWlpUWJtOXZXanpZODhmOWx3bTdrdGV4YTVHTWRFTVNHYjJG?=
 =?utf-8?B?ckFuazhhN1VUM2l0cmJMQzloL016bStYaUE3WkNqT3VVNk1tbWQ1NC9BSUpj?=
 =?utf-8?B?K3hmS1o5Qmd4Q3JvbzBjSUFmelU1YVNHY2p5VkYvU1FUV1VhbUpzR2RiOXR4?=
 =?utf-8?B?UmhKajZ5WEIvQTBQNVJ4b1U3Qkh6YXg1NWk5NU4xU2hJUHU5SGpsKzFNYlRJ?=
 =?utf-8?B?TFJiL29rMEhDQzBFTWZwOWkwSUliSmxsZnRMU0l4QmwxTmx3bWJkNUJscDRU?=
 =?utf-8?B?S25KSG5YaGhBMmZRUTBZZmhQdFRicjlhVWI4L2JLTkpSWDRnbmZxZTlIZ3A3?=
 =?utf-8?B?eTZiRDdwWTBxdmJhdEJwZUFwZ09xUFk5Zld4dndZaEZPSEx3a2wxYVZHajZS?=
 =?utf-8?B?Vm54M0F4Qk90QnNhK2JPRjVaRzJDd1BOQ014M2F5U0IyaWsvZmJuak12WlRz?=
 =?utf-8?B?NXRLWFNSb0VpbHo2cE1QQ2dIcEVBYll5NlVWLzhLLzZXL1FBaGgzQS8vQkJM?=
 =?utf-8?B?OGdtMGkrRFBsQktKWmpuYldwZ2dqM0JjcHBJcDlVeEV4T3EycmI5Kzk3aXdr?=
 =?utf-8?Q?vFFZWfkQM3JAb0erOlxNrno0FnzQsg0Y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmJtYkQ5ZFIrT2U5UU1ETTdOZzc3UVJxMlNBREUxbTRnZTcwQlFicFhGUG5S?=
 =?utf-8?B?VHZnT2VQazZXMkI1Ulp1cGRLYmlmVU9tV1duNE5HTVgzS3lsZTk4S3kzbWdq?=
 =?utf-8?B?UXNVMTZiSHFPMURQSWFMYnlySDN3ZVlVQXhBd0Q4Z1gzemZEVk9wcC9icTlK?=
 =?utf-8?B?TW43QWVRcmRXdVlnZUo1Y2pSNVZTU1IxRkpWLytRamZwQU9RdWtiTWVISFQv?=
 =?utf-8?B?akVmNHRLNXBKcTJwY1E0a1Y4N2F0L3ZraTRBNnJxZXBMU0lqLzdOekFTWVJo?=
 =?utf-8?B?R3RJMmVYbk5xQ0taRFJveXVjdUFIOVphMFAxMTUvNW9kL0wyK3Qra0VPb21o?=
 =?utf-8?B?SVA5d3FnK1BZOHNjM05ZTHVFR2h5K1BDcXVpYXQrVDJadk92SEdYV2lPOEJD?=
 =?utf-8?B?SmdkeHpOa2VGSU51dTNzWXJjb05sLzZGYi9PUW03QjVCbTdIVjNuRnlyZlZQ?=
 =?utf-8?B?Vm9kN2xSM05UTi9UN3BaN1M0OWxDcENnRVlwYm9kSTJTTiswakFsMnBmQlU3?=
 =?utf-8?B?MkI0T3M5dHNDbWFpZDdPRGo5bnhJQkYrUVBmdC9XMFRIVGI3VjVSVk9YZHRB?=
 =?utf-8?B?cTR4S3hvRi9qMDI4djVLY2o5c0VCcGhBbGp6T3VCcDVaQ1d4MG1iak1vaWx5?=
 =?utf-8?B?czluTmxSVlZnTG1Pa0JIUVpoSUwzVGdsTzl1RStQaFFkZm5iTFErOGxhL2JM?=
 =?utf-8?B?YVh5RkhrYWpORmQ0SDhKU1M0UnNIQXhBYnJJVWJQRkZuQVFpb1Q5aDA0c0l2?=
 =?utf-8?B?cjVNdm0zbEFocDhtRDdac1FQOHdPR2dTbkExb25reWZ0MlQweWR6N2licmxE?=
 =?utf-8?B?N2tVcm5MV3lSa2U4cEpKOUh2bjFDOXhIeTdTaVVlME1GWWN2WGEzL0kzR0RG?=
 =?utf-8?B?bDVvR2FJQ3RiMXpUdXN2MjluRnNIRnRyRUw3ZW00dHk1VTkyandwak51ZUkx?=
 =?utf-8?B?bHJXZ1RPa3BqTitHUmpNK1NMa3R3eHplUEVLVEVublBld0dhOGl2V3dEYWpH?=
 =?utf-8?B?aXFDa0UzcENSK000aVZXQ3g4NlRHdGNna2xsUzNLUENyZVowK2hnUzNQZHVv?=
 =?utf-8?B?N0cyUGsyOXc0M1RnMURBNy9DclJtOHRkNkszN2VQTXZRN2dESlo2R3htNzN5?=
 =?utf-8?B?RndNeERDNklhc1FPR01qNkF2UjRvRUJpaXF1UDF0OWNDam82eSs3NWh1YmJF?=
 =?utf-8?B?d3ZqWW5pRVI5Lyt2ZVkzcEpZUFNzUnlRRTBQSEwvMXYyR1hLS2d5WnpMcXpE?=
 =?utf-8?B?dWU5MGRXYjhaWWdMUjNYYXp6NVZLTU03M1lOcHR3TjIwbkZ4WndVMmhCSE9R?=
 =?utf-8?B?ZlZnWDQzWFFvcGJ4WXplUEFKdlhxOFdOVVBhODRzUTNuTEZmVDU5aTVaNXN4?=
 =?utf-8?B?T3prd3NuRllReXpBeFpGR0g2TTlWNjNLNnhTazNrTExpYmFzM1huaVFqUDY5?=
 =?utf-8?B?UWg4eDBsZkR6Vy9tNzdCRSttWHNhVTRRc3AvYVJpUlE4TkR1VDZPNjViL2N1?=
 =?utf-8?B?TzJGY2hDczJSZ1JxRlcxVngrcHNxL2hZZUpRb3I1dHZQbXNIcG41SWl0bXUv?=
 =?utf-8?B?TUtES0J5djR5WGk1c3dkazVZS3Jqa3RpVEpFaEIzdEJlSWE1cjFyWSs2c0NT?=
 =?utf-8?B?eEQ4WUNFVEJxUVB2WW9hNStaZU5KNVZrNFRrTEtKRFl4dmFxcURBYlp3MmJH?=
 =?utf-8?B?MU9tKzYwTlZuSW1WOHAwZVFGZlBUa2JnenZudVk1UkhsNHJ3Nk9uTy9LdXNO?=
 =?utf-8?B?bU9hL3NNTzlzWENWanpUU2dFY0IydVhvdENUU2traDdGbzRJU1BzVlBVdXVV?=
 =?utf-8?B?bG9oWWpvREUycklaZGdIREdwRHcrcFUwWUtZT1FNUlVNMnQxaElaWm8rcUZ1?=
 =?utf-8?B?cUgxYkdBTjNaS1ZLYW5KRHZhdEV2MkJFR1BYelZsQ0xWdk9LZXFvbmlSd3VK?=
 =?utf-8?B?OVJZS2FRd2VnUTRlV1F5aEtHUjhiNHlmTnRXekhKbndBT1MrZ2RGMzZzRDdD?=
 =?utf-8?B?MG1DVW9ROVRkaGNIUTBSUkhqTzVTUjVqZlRpaWdxRVkrdS93bFU2a3A1K3FM?=
 =?utf-8?B?ZithL29GNzBybUZDWWxRWWpoNGlnUTdJWkVYdUJkeGh0dGVYZDVlZDRDTkdJ?=
 =?utf-8?B?Nk5hMU5KZElZV1R3VktUeVB3U2hscGVyMWZXVjVMdjBWNXFyOUZ5YTlSbnRW?=
 =?utf-8?B?VXc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa26d7c-933e-49fe-0c60-08de3757d702
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 19:19:14.4186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cu+myPDOUIbq94Rt4PmV30da4gjJ79rXdR9os0IqM5C00lnl/RRPR5VloKXprQWK5uSUYBsyH125RQioRRYYyQhNqBh/FwWMv89xwKVxV9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10910



On 09.12.25 17:57, Andrew Cooper wrote:
> The variable is never 0, but because the writes into it are hidden behind the
> HYPERVISOR_COMPAT_VIRT_START() macro, it does a good impression of appearing
> to be 0.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
>   xen/arch/x86/domain.c        | 2 +-
>   xen/arch/x86/pv/dom0_build.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index bd75d044a01b..d33a42c8824c 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -891,7 +891,7 @@ int arch_domain_create(struct domain *d,
>       d->arch.emulation_flags = emflags;
>   
>   #ifdef CONFIG_PV32
> -    HYPERVISOR_COMPAT_VIRT_START(d) =
> +    d->arch.hv_compat_vstart =
>           is_pv_domain(d) ? __HYPERVISOR_COMPAT_VIRT_START : ~0u;
>   #endif
>   
> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index 21158ce1812e..fed03dc15dcf 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -521,7 +521,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
>                   printk("Dom0 expects too high a hypervisor start address\n");
>                   return -ERANGE;
>               }
> -            HYPERVISOR_COMPAT_VIRT_START(d) =
> +            d->arch.hv_compat_vstart =
>                   max_t(unsigned int, m2p_compat_vstart, value);
>           }
>   
> 

Thank you.
Reviewed-by: Grygorii Strashko <grygorii_strashko@epam.com>

-- 
Best regards,
-grygorii


