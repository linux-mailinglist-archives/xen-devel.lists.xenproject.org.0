Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC4479E41E
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 11:49:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601141.937056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgMUk-0008QH-H8; Wed, 13 Sep 2023 09:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601141.937056; Wed, 13 Sep 2023 09:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgMUk-0008Ny-EM; Wed, 13 Sep 2023 09:49:14 +0000
Received: by outflank-mailman (input) for mailman id 601141;
 Wed, 13 Sep 2023 09:49:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgMUj-0008Ns-Gn
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 09:49:13 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb0174db-521a-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 11:49:12 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7839.eurprd04.prod.outlook.com (2603:10a6:102:c9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Wed, 13 Sep
 2023 09:49:10 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 09:49:10 +0000
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
X-Inumbo-ID: cb0174db-521a-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXgb+o9kIweu5tV+7YBl2EMUe/2Q2LXavYFpY3pS2xZHbXaMHv0DQa8T2gvroll4VsVws4nfiy+BW772IVgY1RvNgqj1Bmtd9S2A9PQBCmDs1ht8gJsnRdVxWWOW6xybq6Re0AYz3AfoA5FgLpZlaIJNKBKvkXTqofujY5eatOT1uP2bCFeXmyRBPAiMX+X5ylF0AnecpkY/kfrGbV+lJuyv51PJTnEAoL90NjQZWA/e28PAG/eU+6Fkm0gDr/BTJ6vazA6AL5XumBfbHcwW9ZKBY0voiTavEJpWTrmEmvkhibTRXdtAfN1vqu4rV0NnnO81u0hckhXlZtKxXamqQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JsknStAwn0a1b6zOzfjazy3CyHTY8TZHrEX+Omp/e8=;
 b=D/pc5vNghYGn4A4uFzhqbxyVroUfVG623aM8cgf3uGVnG/W5oDrrrWYYi0sBbJ/iFEpGKmrFj+J2nPTSeOK6a8Hl+psLYRW7TjZyBt18iBDOzvVCJXeWy68Y363et3Q2IkT7otSvj5osfZ7irwvZfPEOiOTsxw+mr5xKkuFJPZweX/+FUUmOYy2OryzpCx/qSmsMNkE/k2YScJrfVgvw7IlF1AnNYIhT4HxsaZJzGgJnMJU9toN7L7Bmh/47NaQpx/KdtSlLjbVPkJQeoZU7+JFjpC3LeTgE4uQqZltze/OTbYwVZ3QOlJkQeMXUfK7lsdDrGmrb2wOvEy0bSSSCig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JsknStAwn0a1b6zOzfjazy3CyHTY8TZHrEX+Omp/e8=;
 b=sEs03pRuVLY8zK1cM5URQN4PVaw6Z1JuYu780pIaT5/Cq3BBGpa4Sq4R7tFZFjoVC3ENVaYAkkRD29l5kiyZnuC1QJJk0mcqwH3CHHkCt6MqFG5MrjV9tmJS3SK5nMeyPujZkwEXxua0M/nCHYgmKHXGh+mfnQPQOeSVac9J80+h9nvLYLuQyjtTuRrusVO5T5OTVu56ZMiOSPI7hwN8gMEn3oiHu0r5QkDee6Ay0rxaaSIl6f/11n79+mj6taPXnlltRhGd/prxPO5JJKV6DFhn+w9kJW5mmpIv8dsXJakYxJV+MrLNqJYC6X6ullLF6ZeTHe+0BVkaXTojf1usHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <db6dfc14-72e8-3baa-b05e-4d232b0e4756@suse.com>
Date: Wed, 13 Sep 2023 11:49:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH v6 3/7] x86/asm: address violations of MISRA C:2012
 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Gianluca Luparini <gianluca.luparini@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694532795.git.simone.ballarin@bugseng.com>
 <65bb6eb5167e1ae499073007679726555db4c4a9.1694532795.git.simone.ballarin@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <65bb6eb5167e1ae499073007679726555db4c4a9.1694532795.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7839:EE_
X-MS-Office365-Filtering-Correlation-Id: b19308d5-733f-4cc5-3701-08dbb43eae00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w3+DAw1dy7oephlozfz9VAAnoD0O44lsFFPcyxn8m7dERuxBQQn0eUNO5g/CyiOUWoLMlt9pHfwzyFLgXsmbNR5pLf+KmXA2d1TYfk2diC7X2XQhWJmfgPwWyOhlchJTbnVwkATAyZpHIWKqZWDDQfvzbOE4rpzG+n0N1wzmv+Pj/XWXOu/4n6K/M68AbGxSmGhUIrcEtaQnEjM4PNsjl42wSNkPWRN9Mna2XYUdr1W6MFIQ2tP3k+FfbUoVRFZtc1tm+3jk0caGdGx3ZuTYK721KPGpNbhwnD/i0n1bx86aiH4grgC92SRPAgkGToTSpUks6sz+pvuiOBY+fCI10kp12mXtxnQTrETQYFu9rkupLRFG5yqk0XKW6mfIUpTfUWDQTqmpmb0S07sWM85ToIJ0Uswqwd17AvYHJqqMdA2VJ7NTE5ap1AfRTh4gPSJHuAu+QNpmuNLRfpbFZ9T6m/BOJIqYEkuBuxbbXc1yTCvYq6NHJQVbNRxlaZNZ4fAB+9O46ZOE3/Ask6XHM4SfKvEJA2Ip7l75CNVJZq80glfDeuMw4vGcHW3X9u/TyYrbFV8eFy0r9J59l7sh6FqE2tLJTEAundbtKzYlUbe7hcZdjMfjHkUv8n1BmM97IStcfrdBtfQT9mIJBlFUcF7v3A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(376002)(39860400002)(346002)(186009)(451199024)(1800799009)(478600001)(31686004)(6666004)(6486002)(6512007)(6506007)(53546011)(38100700002)(86362001)(31696002)(26005)(2616005)(36756003)(66556008)(5660300002)(8936002)(4326008)(8676002)(54906003)(6916009)(41300700001)(316002)(2906002)(66476007)(4744005)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2FGcmYyYkc1L3hPNFlaODMxVHFGRVQ2dGFhSCs5Y0FWMnVFOVBXNkN0VENK?=
 =?utf-8?B?UGo1clZWbWlKL3BvTGMveEYvTUxCNStwL01qUTNWSi9sbTlHbExIL0xubk5Y?=
 =?utf-8?B?ZjBIMGNiM29qaFlSZDczaWlQYUd4WXVkNzVJRE5JTXZ4aFdsdDVJaGtuOEhQ?=
 =?utf-8?B?V0QrZVcxcm1LWnRhaEh0cHJkK25RUWZ6SG9VS2dIYXBpNkFlak1iMTBsR3lo?=
 =?utf-8?B?MGJZUmN6cmJpbHFSZDh0cHpKNlppM2VVK2tWUWpQM3dGNkt1SW1mRWlmTm90?=
 =?utf-8?B?ZUdQZ1VpSWwvT0cwWEY3djZPZ1E0UWdTMzVNeGtwQlVVZjZjWmpxQnVqaEsv?=
 =?utf-8?B?YjJaZURYVk1CMVl3NjVNSzNldVIrbHZqMEJEdk83VE5xMVhvZEpneWQ0czJ0?=
 =?utf-8?B?ZjlZSFBkVlFpRmM5a0ZWTHBFaEwrUlRCSkFBOVFER0h3MU5HOXZxaVVESmJE?=
 =?utf-8?B?QXRGVVYyQkJMQTl3Sk0zNWkrZmk4OUJjUGQ5UUE2dEZuRTZ4VDZTQW5GVmFX?=
 =?utf-8?B?MXZua0o0NFFWUEhqcHZzNmJ2d1ZIRXI1bkhLa1hwVWhyYmxRdDZQRGJ1RVpP?=
 =?utf-8?B?ejA3TXh1bFBkb0YyYzB1aUREcjVPQ2tOWWdDYkFralFDcVFpMW9sNGRJWTY2?=
 =?utf-8?B?YldZRkZ3ZnROd2dHTjByU3NUV2lYZ2pTNkw4cFBDdHJKUnBsdG13OUQ3ZFpr?=
 =?utf-8?B?dEF2WC9GUFc3WDRhQ2RNNjFkeEFIbmR3dUVaSVFyOGJEaG44MmF4c0kzREV6?=
 =?utf-8?B?M3NKVjByU0ZwV1FmWGQxd0sveSt5NUhscTdUdStiLytJdWhLLzNCVEdQRDVk?=
 =?utf-8?B?T3M4RUlFMDhCck4ydUtZL1Y1Mm04cXI1VUp6QnpwU2hCME5uL1VxTG5PbVJz?=
 =?utf-8?B?eFJiL25sVEt1RUM4Q0RRTktCYkRqMEVJYWVyWlhobWVtK2hSUHQ5UTVZVU1U?=
 =?utf-8?B?NXhPY0w2eGpzNjBaMjVweFU0bVdBRVNKQ0ZWNEMzQUZ6a1YvNnlvdnJTNjJO?=
 =?utf-8?B?MEJ5TlR6cEtxSkNCT0ZQRlcxV1VrUTdxQUNCUzI2MHFDRDh6ZjNYN1BoK1Za?=
 =?utf-8?B?RkVoZkNxUm5NUi9MaG1zeUJKRXV5aUZvbUJPVmZtYnBWcUVkOHM3eE93WVZr?=
 =?utf-8?B?b1BoczV3SHVFTEFPaWYzZXpPZGpONndhTWRzMlhRYzFISEZ4aGVzb2ZRcGU0?=
 =?utf-8?B?a2ZkNTRTU2VjVVdoSkM0OE1vaHQwUWZoNnI1R295R2Yxampmb0JtS29iZGo2?=
 =?utf-8?B?TnVkajFTRzBjUmN0REVkSTdrWTVmMHhaTTFleng3RXpLVFI5T3NpdGREZHFx?=
 =?utf-8?B?UVdyRW5LOVh0Wm5rNm41dlBWZHhzamg1QU9ZYVZlbjBNdldHYTNqbUhDT0Iy?=
 =?utf-8?B?Mys0aHkzL2s0VlhmU1ZWNys2c0wrWTAyam5SRTZYVm9jV3VmZkN4d3ZYNFNF?=
 =?utf-8?B?SnY5UDRDaXd0VmYvRDJ4Q3ZrM0RZUDBTRlJlSzN3bTFtOEhmL3ZoaWM4UVBV?=
 =?utf-8?B?eUZqWHpSSUdxeE05aHIxVTFPNlVxd09nQW54ZVZoTWNxNHdSU1RKRmNjQ3NU?=
 =?utf-8?B?Vng3MUtZRU9iQWF6Ti94blRSNG85M3ZiSjdsMTNiMFIxM3VEVllkWEVDWUFp?=
 =?utf-8?B?by81azlmM3ZvaWIyb3ZlNHFPUlFXR1RzTmN2blB6MDFzWHJVcUZvWUl5dlVa?=
 =?utf-8?B?NXZlSXJxcmhXcXpXejBtc29jdmEvb2lFTEFrUStyY2did3E0aEdRdlQzOHpW?=
 =?utf-8?B?ZzNwWkI0VnFRZUlSUHdJK3pXK2szdC9ucHNaTEZEMlRvdUw1dy94cGYvM3ZF?=
 =?utf-8?B?bnFQa1lEMk1UejBsWTlrZmQrWms3VzJObTk0STdVbm02RGt2OVJLcUNoY212?=
 =?utf-8?B?ajR2aTgrbXlkMloxMmN4OXRiUW5ZNEo3OTQ3RWVGMjA1anBOTVAxUTlrUHNB?=
 =?utf-8?B?aXZaTHl1aHR0RStZM2cxU0h5eUFMUVZEYXZzcW5zR0F0cFlETjYzOW5LbW5C?=
 =?utf-8?B?S0w3SVAvR0g4dW54NWx5eU9oanRXMURHNzhvc0F4cVFFd3diTXFJYnRrSllI?=
 =?utf-8?B?M1dQaklZYmJWN2xMWmpnbmZpdnFqYzB2cjJTeVFQUjNDQS9YUWJNS2xNLzNH?=
 =?utf-8?Q?Bekwrwqm2dNVGnat7Vvoueam0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b19308d5-733f-4cc5-3701-08dbb43eae00
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 09:49:10.4418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 27KjUWcRi5uXLznsx1KIwlVXwasLDqKXrwEBsS3X/UCZhmZPlEFYuW6U8Tb+UaEtxdYPftg9s4+juVY//u1kgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7839

On 12.09.2023 17:39, Simone Ballarin wrote:
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
> 
> Add the 'U' suffix to integers literals with unsigned type.
> Use _AC() for macro costants that are used also in assembly files.
> 
> For the sake of uniformity, the following changes are made:
> - add the 'U' suffix to macros in 'pci.h'
> - use _AC() for macros near 'X86_CR0_PG'
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>

Changes look okay, but same comment as for patch 2 as to tags (which
apparently applies to the entire series). Plus "x86/asm:" is imo pretty
misleading in the title - you're not changing any assembly code.
"x86/include:" would seem more applicable to me.

Jan

