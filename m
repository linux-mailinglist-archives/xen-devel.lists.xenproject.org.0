Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3836D7A08A3
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 17:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602407.939065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnxa-0007WI-0u; Thu, 14 Sep 2023 15:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602407.939065; Thu, 14 Sep 2023 15:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnxZ-0007TS-UH; Thu, 14 Sep 2023 15:08:49 +0000
Received: by outflank-mailman (input) for mailman id 602407;
 Thu, 14 Sep 2023 15:08:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgnxY-0007TM-PL
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 15:08:48 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a147b6e-5310-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 17:08:46 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7322.eurprd04.prod.outlook.com (2603:10a6:102:8e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 15:08:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 15:08:44 +0000
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
X-Inumbo-ID: 9a147b6e-5310-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjU3d0byNdz77L9rNN+yM5Yw5ngyOSyak01X5AbThoz1WkMD/tNJZPAINQTqfOpMkoTY75chcNW3bpi9c6LcNEEM3NP3D7pBP8GhhoimZCiwtbCJbpLXF9bOqZvowrR23XpgZU5IXscgkqKCWq/yShicKbp6DjUUfGuU3nAgX6QXfvYFR3nE1NfIufzK0xNURY7ibaG35v3cfEqudG1kPrQhPeyAxD3AqLq5/6Xz3KR9J1vsgLUH70CL25cifXXcBopdO0rInKUKvR9W0DHYrKde2qOhgb+Fx3yeeIn7b3RvKjhjkzbyp61aNKZUNKbGslcIXuzDbklmhDTOTrDjkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yoQtXL3IRg9/PPW9aIWUlddxBRrcNauH0VNbULdeGcE=;
 b=QykpH3c6ZmvFNCq7LJBrh+rTrNPO0t91bVGvA/S8Ixf6jzJTTGZvVcG/XSgeMLoQh5YssccCFuDFoAD15w1Hxd+57o5CMNSvMscALYdhmS0ZD2z1mmeq7G645lN0q9vcH498JqvQgS8pItaR1UcJVcjVw9T2sF1VEzF4H64II10ukDwm/eg7XqhHb2pSUV9xHpJOkGfJLl2GA72UherKtRlHXW/BUgk8PIFFhLuz6nkMBJ4g1rmHyT5juKIKGtiwq09uaBF/isJcIBNnKLzSHcITLnXRK6in6DTL8StTPOadnmvCQVAV8WsRbN39sJ+tT7KiZsnMvdKQctkrOxQrew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yoQtXL3IRg9/PPW9aIWUlddxBRrcNauH0VNbULdeGcE=;
 b=ICunv1aCJ+0388bsDN+uh/TYiTSW8IxaNukNiTqcsZDCjqasFYTYU7DWqrtYO9wbTkVHgG5L0ifQsw5R6TiBJIDriOKPejhA3lWVSHVbJraeELDOFqoBNXlVWphtwaBfobfuMOeyCYxsVxPRAxUKPhzJjLiVYBF7GW5WV6Jgyo2lmd1qf+siRkl8Sax4XkuZGwIcy2OiVEj14V2zozzND41ziU82Sdon/2/ArpYPyI1ghossuYTlFJLJwXQg2bPqqGa0kvDx1vxRcfGk31tcguKdk8kwskyXOGPi6E8k3jOEhs1cBFAkgB0uEB+Le9VR2Tu/OcwAzXgy8eqIO/a33Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <da588ba7-f22f-9aa2-4346-de75783bd65e@suse.com>
Date: Thu, 14 Sep 2023 17:08:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 00/29] Introduce stub headers necessary for full Xen
 build
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aed8c47-5155-4ec9-9f0b-08dbb5347cf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XBjnq8/FDiCNz5Gqz8KxIWtotJ4dEn62NCQVi+K8et7IsWLVAsgOrZVW3gBJJgMqcLmwmn2TPuL7G9PzAUANthahN9ASy4fDQaI3dS7ulo+CL4m4lYIqvQ66U1Bg+FUrjX91noWf8QtWvCBSyEd/wlVR7oCi1m6qh0mcDocP3J+ETzDoscEOY8ljh4efJcAB1XuidvVeVrx34egMN+UBNSyhkWBrEReknu+v5TyVJg0r8+7Vae97RjKblkW45HiggsQ07lNJoK2tkoZLm11Or7u6QvI3w74DhhXfmHeC4g+2JLuFOCpHI1g/94HOjfa8KoKFPKRivzl/Bag3rZB0nWbWF308IBOHYxgqsKcYwNlcxIymUFu17eVhRu+BenB/sNsEqfNOr9QWns+nxIyYNurUv+7FzPuvgX+3aJmBlb6bAiOCAd8lnelenR4v1tUNPpQ2EmPlRs2Y+8Zfw11xhS/iMybQL+EKDH+vPEcRGknSA6E4GZB0PDkypz4SRUoCx/P8q24AZyeuQvKv3qjPDC/M3zbEffNJOVOHPsaK0kcxVNgP36rAgDpmMIpJ6j4M/clVOF5rOiAFbXFuWGvqgzDxDP/RYErRR6aaQ3G7jvgsA982T6PQSHu/FfKzbKUIcWdEiUx9xetiPLLrsv1v9w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(346002)(136003)(39860400002)(451199024)(186009)(1800799009)(31686004)(6666004)(53546011)(6506007)(6486002)(36756003)(31696002)(86362001)(38100700002)(2616005)(4744005)(966005)(6512007)(83380400001)(2906002)(478600001)(8676002)(316002)(4326008)(5660300002)(41300700001)(8936002)(7416002)(66946007)(54906003)(6916009)(66476007)(66556008)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akhhUGE0aHNHeDJSQytVdFNkSTlmZFRHWmptRlNyNm5mK0l5TFpFVElOUWtC?=
 =?utf-8?B?UTlaMXY3cXcrKzJJQ2E4UGpHZGFDV1ZZcjdxVnVmdCtINTI1ZjZyTldoSGJR?=
 =?utf-8?B?WE1jZnJVR1NiRlpaY01STXpxdzNvSngvWEc3Ykx5aXE1ZnRobXFkcklQd2VG?=
 =?utf-8?B?NmtxaHN0OGhRWWNFN3lsT0tHL0o5dDRsMTQzYkUxSFB2cjNsdkcvcGh4eG4v?=
 =?utf-8?B?YkNSS1dkN2NscXZ0cTlXQW5pR0J1NXhwZTJRUzRybHQvS1czUkF5M0ZXcG1s?=
 =?utf-8?B?dDJuZ1hIb0pFbFJraVVmMGFKcXR3VThNUTExNzk5Rk1iVWMzWGk4RllNcEJP?=
 =?utf-8?B?c1RxdFdwbG5rTWMvTVZFSzZ4cVg1M0dzeHVDcmt1d3lsWWRyQnErQU9UNy9O?=
 =?utf-8?B?NXp1STlLUnhnSnkwYmhWcUtjMW1RU2xXLzdqQ1NKVGcwYmJQTC9laU8zaUwx?=
 =?utf-8?B?TExGcjlRbmlRa28xcjJzNUZLc1JGeFFHMDFTZzUyRWhQMHVZLzVqWmJEVTdj?=
 =?utf-8?B?bzd3V3NrZ1NLTk1QdzMxbEJsTTY4eVdTa2JKcXhZV1ZNRGZPaE9raUlqTkxD?=
 =?utf-8?B?UWo5RmRlZFdDd3VkeW54RDRQZUJFUWZSTzdzaHhXN1ExbURiU2c5UU43MTJm?=
 =?utf-8?B?ZGVIclJQTDRoOExaVDJTS2J3L3lwYy9FTURqQXhjdjdsZ0MwWXlUUVlTZkNU?=
 =?utf-8?B?UVBwRUtUbTZCU1k2R1B6d0tYWlRSd0JDZ3cwNXljcEtMb1pITytyUXN6NkNw?=
 =?utf-8?B?TGN1Nm9lMkdQT3ltRWJ1S2xkVm1BSmM5em1QYjZKc1FQZy9tdTVKRzM5elIz?=
 =?utf-8?B?WDFheWxmTEE0SitreVFaQ2tVQ0FQSnR2QklMczdJcHljY3NuKzJzd0xPWlFD?=
 =?utf-8?B?MW9takxjZUJyOVZjcjNXMWR4S1BuTzh5S3lVS1FVVDVqc3cvMjR1MU5KVk5Y?=
 =?utf-8?B?Q2kzaWFxaDBTZ2d6WDJDZTk3WEVSL01SQVplSklFVy9GWjFaVDVoMUFJVVBJ?=
 =?utf-8?B?ZlR2eUhqYko0YWJiQjNueHpWN0RZRUEvRXRaS3Awemc4NDI3eG9jams3N0Y4?=
 =?utf-8?B?UzllNi9reTI1Y1NoN2k4TXhWaFZkRUo0VXdqQUxpOEpFaUp2TEh3ZkM5RHNp?=
 =?utf-8?B?VXUwQ0xIUDlocUhOVGNSY3I4M2s2ajNDSVY5ZU1LRm1vYmVQRHZ3WmZlbHpN?=
 =?utf-8?B?cFN1VyszZmJXSnRzUC9PL3Z4cFFSU3NPVDZnZHRMMnMvRUloSWUwaXBvY2R3?=
 =?utf-8?B?NnRuOW11bEpkcW1ZeUt3elpybENENlVUUkVmT05FNUNCU0dlOExQSzVxZnlR?=
 =?utf-8?B?R3EwSEs0UHEvUXBrRU9MTURaaXNkSkRiQ25nRHVtbXF6R1lBTVVHK2RCVTJa?=
 =?utf-8?B?Qkt5djRFSE11cUkwQmZSbVpvNGREV3dpYlExYVdpR0NYYmFIaTFvUG4xRmov?=
 =?utf-8?B?dS9Hek9iRml3TDRSakFHQVIybkhvRVBMa2EwL3liczhXSFpjNG5uOTNCVzBG?=
 =?utf-8?B?RFRSRzFqQXRTeW0yTExTOEJFaTZjT0Q4RTgrYStxUGtxdmRQQmJacjZIUEEy?=
 =?utf-8?B?ZUlKeXZWRnV5MVRIRWgwRVRSdkwvUHNvS0ZMWDFINkdoV2JjWTZXeGtDazJE?=
 =?utf-8?B?dGRITHpydm5rZzdXVXFnbzJCRWdObjlMNFJnM2s5a1phRDlDSXl3UkxLbVl1?=
 =?utf-8?B?aE1weGs1S3NzUkFZM3M3QnlYdzcwVHlqN011VXh6ejhmN1pBRTk1bUx1UWVW?=
 =?utf-8?B?UmNkbW0zMmlsKzdkSzFZT1g1RDEyT3ZxREFmeEdDcThkTmRyQ3dTeWlZdXd4?=
 =?utf-8?B?RWgrbTNxdVZQN2VCNWx3akp0MUhhazE1VU04ekhocWo1d1hJZnF0RUhGRGdl?=
 =?utf-8?B?R3J6WDNBaDRQZkZabktMdWc0NS9DQ1FickxqeFREVTFTZ1hjdUhQTXE2eXpP?=
 =?utf-8?B?ZDFiM0kyNVhGeENoK3NUaGxGZVZ5Nlc1L1E5ZWZaeW9tc2Q3Mm1mSnJ0K2dE?=
 =?utf-8?B?TXcwWUFKM0ZQeVJvS0JnWi9HckI4MFFSOExPazcvT0g4S1NiTFJTeENuVk5B?=
 =?utf-8?B?ek9vaEVIMzlrTVNYS2hQL05QdTNjQ1dEQTRsWFFuZUlYRHA3ZU5aQVFIZ1hh?=
 =?utf-8?Q?Jzm02MzpzsN3PbgGsoS/9DYrz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aed8c47-5155-4ec9-9f0b-08dbb5347cf8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 15:08:44.3818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xZKF5t/Xm14JJdnA2hyBJL4wV7jMNPfNZJxwER51Gl2aS31S8sKXk9Y0CVKcT/OSoRYHd4ysJfImV89QX8gTPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7322

On 14.09.2023 16:56, Oleksii Kurochko wrote:
> Based on two patch series [1] and [2], the idea of which is to provide minimal
> amount of things for a complete Xen build, a large amount of headers are the same
> or almost the same, so it makes sense to move them to asm-generic.
> 
> Also, providing such stub headers should help future architectures to add
> a full Xen build.
> 
> [1] https://lore.kernel.org/xen-devel/cover.1694543103.git.sanastasio@raptorengineering.com/
> [2] https://lore.kernel.org/xen-devel/cover.1692181079.git.oleksii.kurochko@gmail.com/
> 
> Oleksii Kurochko (29):
>   xen/asm-generic: introduce stub header spinlock.h

At the example of this, personally I think this goes too far. Headers in
asm-generic should be for the case where an arch elects to not implement
certain functionality. Clearly spinlocks are required uniformly.

Jan

