Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC303CC8C72
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 17:31:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188943.1509943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVuQa-0008TW-RK; Wed, 17 Dec 2025 16:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188943.1509943; Wed, 17 Dec 2025 16:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVuQa-0008RB-OD; Wed, 17 Dec 2025 16:31:04 +0000
Received: by outflank-mailman (input) for mailman id 1188943;
 Wed, 17 Dec 2025 16:31:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZVrU=6X=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vVuQZ-0008M1-Ez
 for xen-devel@lists.xenproject.org; Wed, 17 Dec 2025 16:31:03 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c682f987-db65-11f0-b15b-2bf370ae4941;
 Wed, 17 Dec 2025 17:31:02 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by CH2PR03MB5335.namprd03.prod.outlook.com (2603:10b6:610:91::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Wed, 17 Dec
 2025 16:30:59 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19%7]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 16:30:59 +0000
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
X-Inumbo-ID: c682f987-db65-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CpFI6mJl/cN9dOk/a9EWOmpkGE8FkZNT79aykTyhxK5P2KzIVMsrb/rp5nrhRM9vRiv8aIIh/UeHuc6j7v/yJBn6bpsi2CIe/0EA6MEN9b8KW9EmVrc8VAp+pBsXOze5KnNSXNvPL1/DxYXSMKOKqdtcQpuO6X2mAtOzoBDT7ZjriYSwD0QrQcS3Exs2fWkILZrS51hFlx0EJ0v5MX2AqvRhLr4xjOySfrnzDF2F0v0p4Jktd/leVC9cqZugyYfkztb3Vk7JkW1M7jr62ulVBUeqLTFLTvqCUgHYhVxB9qZvTQb6bpMHh+s4iGL06L6ODZ4ZCc+9wYOALXqDE548qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfXXNBgz5zm4UyHUY0uUXzkNYp0xJLCHdjFgLkATsWw=;
 b=SXa9QUfAnFi4UNxrqCKmLHvbALDasm0hU9/8s0a8XCHbvlUibqVzQiIBK4gqAp/e+XBI9p+mpKinZnbfgbluVBjJdR95LbQlHlT7bM1ZZGRQ7boUbKqbf0Hjk5V+hTJRk8okXMnmHOpuDrJxm9djGuHSmQF/BPA6dnSxBny4lTlMxaTTqNCj5ArVr81F16BrNInyZc8Hvp2WgrUo+l5c+Po6vLdoZ8zl6sMnEqMeJCjQHAtJA0gKeTEyDmlLcmdTgR7urjXE5YtwZe4uuk97ehP1P1gfS6b7FigJr5zytColO0Jf3Nx7XVMwjMY5hHZcg3zM9FLcVla9Jmt1J0kc6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfXXNBgz5zm4UyHUY0uUXzkNYp0xJLCHdjFgLkATsWw=;
 b=ZY2Up+JMaUdQjHsxht/CqrJ/F66Wk/lGm47qS+nOC8CuHhgpzETHfVdvcmQFWEv2eCkls2Is3LRx94NiKNc2KPnJEX9jUdEG8e8RDu4PJX0K+vKb5vpChzUtkynmO62lezRPeCLMXNyKgSB0OS3neNSzA8nVu5mdHK18YTqhVNQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 17 Dec 2025 17:30:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 3/4] tools/tests: Sort Makefile
Message-ID: <aULav20jlJnb9Pg4@Mac.lan>
References: <20251216163230.2768186-1-andrew.cooper3@citrix.com>
 <20251216163230.2768186-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251216163230.2768186-4-andrew.cooper3@citrix.com>
X-ClientProxiedBy: PR3P192CA0004.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::9) To BY1PR03MB7875.namprd03.prod.outlook.com
 (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|CH2PR03MB5335:EE_
X-MS-Office365-Filtering-Correlation-Id: 62df28f7-be89-49ef-0ddb-08de3d89a969
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eUdTaHBGenM5Q2pCendVZ2lCNDdZdkljcm52TmdpRnd4czh0Z3dENWdUeHJo?=
 =?utf-8?B?THlISzJuQ1hVaTEveUtGSlZpV0ZhdmIvejJvREErVzNEVGF0R0pNZUZVOVBi?=
 =?utf-8?B?V1NnaUJBdEFVU3FnV2NBSkx2QmR1Z3FVaGdPNkxiVTJaZWYwZGtkYnBOL2F2?=
 =?utf-8?B?YnF3RERkUGNLdmZMTHhXRE5wOTBzUzVGZlN1QWtNT0t4dVI4VlYxc201VDlr?=
 =?utf-8?B?ZlJtWkdtLzM2eXhJSXJPQkpSTUJJTmpHT0UvMWYrbGgzOVhCekQ1UmFPRnUz?=
 =?utf-8?B?VFZUQ2dpNWNHaTB5eVpDR3M0Y09UdkJxNVBzUldpR2x2aGYzUGY3WEZtYy9z?=
 =?utf-8?B?Q1JacTNSRDlrR1pUeXRITnZOT2JNTXZZNytROUF6VklZOHJhUUNPZzFZbm95?=
 =?utf-8?B?dk5XMFRhQkRnYVpTMkh2d0YwbUNMS0Uyc0VBM1NEbGYwNnpBdURlcEFNSnV2?=
 =?utf-8?B?VUlWRWR2Uis2TWRXR0pUQ2tXazNtZ0FqSUh0NVZoMmlEVW5mTmQ0Y2lRakZn?=
 =?utf-8?B?K1ErR0M3YmtlZjNIdkRONnlONFgrSDA4TTRrRHB4S2hpM05NTGZLYUJSQ25E?=
 =?utf-8?B?QWwwM2FCWEpRMitoQmlBN2JRNStWRklidy94VHBmMWdIS2Uzalc2cTJxdVVl?=
 =?utf-8?B?TkhDRTc3b1B4UzE2V3ZpR0p1cm4vdWNCZjk1ZjR6RlZZOWVONDZiUUtDcDY4?=
 =?utf-8?B?VERUVWt1TlpLbjZnbXFld29uNys0ODBnNUIwYkpoMGJDR2gzNlVuYTBZeWs0?=
 =?utf-8?B?a1JHNS84NnVDRjUxbVZyTmkzaitHZVNreWU1ckFpSGVkZHhOdklIMTB3VTZJ?=
 =?utf-8?B?clVRSENPek9XaXUvQURocFdCbkJjR05JSHBWSmFoRkdScUFVU0ZQaGRmb011?=
 =?utf-8?B?LzUxWENtNzBsUXBSNjFyazZQQ1dRR3E4QytsZ0xUdkkyZmkzTVdzVkxTUTE1?=
 =?utf-8?B?V0dMRXJsUGhVNjdiL2tCOE9qNW9aY3BiY2lLUWhnTUU0OUxML3FpOVpDQlNv?=
 =?utf-8?B?WHJYSDF6K1ZRQnN3VXZYT1NXelNNNnkxNG1BZElVUzdnb2NnNy9wQ05Lakt1?=
 =?utf-8?B?UnZqeWFiWUVLcXpaU0tDTmRFcDNramoxTHVESnVNaHhYUDIvMzZ0SFFxMEEz?=
 =?utf-8?B?UnhZalBzUU5PMmdQK3FQSVNtRlE4RGU5cGZMYjI4eDFSYThzME1qQnVVcU9H?=
 =?utf-8?B?amx5ZXNpSU9NbEtQdVRaTHVwTnIwNkg4NDRGTmw1T25BQXBmNXhxT3lMWDg1?=
 =?utf-8?B?UGtsa1VCMmtla05Qd0tNaHRsbldsWGtMbzVLK054bGtrYTRPMUlmY2Jxb1VJ?=
 =?utf-8?B?T09heWwvdXc0Umc4ZlpkQWVFMHVnZEoxamJNMU9ObER3ZUttRE9wSnc5WFJJ?=
 =?utf-8?B?d1FJZGRVM2FQZmJKTGgrUHhDZTFxU0FLVDB3d3prSi9lTFdtaG90dWpCRS9X?=
 =?utf-8?B?ajFQS2lrdXE3emhDYmFFblZrd3p0dmFpYXZyQ3Z5MURYMDl5MnF4ZTBpa1VI?=
 =?utf-8?B?MTdCcDlvZTgyRmFMcnJ0djFabDNPYVlrdjJpUzZIMjd0WXk2bWZ0LzhVMzBy?=
 =?utf-8?B?dlFPTXk0QUh3OHhOSzJsclJwVkJ2Vi9zRnFXa3NJeGlmZjRjc3pqQW9FeGVs?=
 =?utf-8?B?a0k4WG9XU1Z2cHpMeUFjdXFhV2YvL1NzeEdmdGJueVUyR1oxVzVCY0lWNGFx?=
 =?utf-8?B?TnFxT212QXNwZ201bWkvcE40dlVRSnNmeEVqWmg2RVRMR1BGQS9BNEF1U1h3?=
 =?utf-8?B?d3lXNHlTWUtQOU5NSkI5SnJTeHVIcWdSWlN0MW40VGZ1azk4UWhIZmdNOXJw?=
 =?utf-8?B?VjlzQmF2bGxSd2JEOWVhbUM0ZHc2ZzExQVVZa0FwTG8xaWJWb0FBZkhPcnRk?=
 =?utf-8?B?RUpLTGR5ekZ3RUR6T3hZenAwdS9LV0tVNHcvaUxGN2xHNjN1aTJXVUViUzd0?=
 =?utf-8?Q?PlX0elzi/xjiynH+4Od8cSZCjABUOTbt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnJYbVYrQ1RLbWk0bkNVbk1aaURucGRsVG82N2dUNDcxYXRtTGlzOGxub0to?=
 =?utf-8?B?WlVxbmFxU0IrUXJPN0Vic1Y0NWR2Z214a1pYbU5MbnFxZGhkQml1cTJuOUlD?=
 =?utf-8?B?N0dteGVCNzhhVmdzMXo1U1ZNenNQY2hZYjN4SStVeXZodGxSQUl2d3lFT2kx?=
 =?utf-8?B?VGZ2TDVjRU13SEljQ2puUEoxMEVPUndaNFdSSWpSSGpuOTJ4SXlyNVYwZnBj?=
 =?utf-8?B?K2Q5bzc4c2F1SXd2MTNOTEM1L2kybXkvNzQvYjZWcklBOWVKYW1DNkNTc3Nz?=
 =?utf-8?B?SDhGcWc0cmNDNkN3Q1RjYTFmMzVIOWtjcW1pVnBiNmNYTzBjVGY3RStCbURi?=
 =?utf-8?B?Qm1RZExRRnBteGxBbjZNNGJPTVJPVFBBMkV4b1A3RVFKaFpESml1dnkrQXFx?=
 =?utf-8?B?Z0FOdTgrSm4yb3BKNW5NQ0k3ZEtrOHFkdjJKRDVTdHpwak80Y2JSWXo1cGo1?=
 =?utf-8?B?cWlidTEyMndKNjhGeWppelZ4NjcyNUV0ZmRQa2xXdXRNaFNtZGJKeWZTTDFr?=
 =?utf-8?B?SU0zQkF3eEpCSytWK3NncDZkcFFMRmp2OVV6T3JtZnh3WElIMzUydFlMVjNX?=
 =?utf-8?B?S3dQcnlpVWtqd3g2MWhwWXN2ZkEzWDdPY1JJVjRwY2Z6MHAwUTRxZEVXUE1V?=
 =?utf-8?B?TzZJR2lhWWJwc1NIMXdwUjBHUERuejBVNzcreEFkQlRlWWZBTnp4Vi85QXRM?=
 =?utf-8?B?VlJYUnR0MCt4WFRyU2M5SU9nMXZIcGFUdUJ0azl0SVJHU2NKWkZvVXdXaUY5?=
 =?utf-8?B?UDFkWEpHNmxWdlRCWkNOTEJqeUFQR3Vyc3pCak45YkRPOTFUL0ZtL1dBQzA3?=
 =?utf-8?B?RmtrYlJXUHJZeVNSUEFXQmVrY3lUZWRKOVY1WHZKRTdGL3ZnNWx4cE41Q1R1?=
 =?utf-8?B?SHpZUzVEWXVxampicWZVdDlpNUdFNStNUUhoOVpSQVpreHlZUFRweS9Td1Mz?=
 =?utf-8?B?MFgzQVM1VVRNUk1oMUl5M1dZdWVqZk82cklGVGg0cUlFdmtZUUNjclV4TTRt?=
 =?utf-8?B?cE9HWnNQK3JLcmgvR3U1T1IreG11M3JvcDR3WU5QaDg0WTRIakhON25uam5m?=
 =?utf-8?B?NE80YU5wbHhFYlNVV0YyTVN4bWZNRzJCZEt4MFUyenQ2eXpXWG1PbTJIdWdH?=
 =?utf-8?B?TVI1ejA0Mmp0b0kvdHo3S2xyOG1WWVJHZjMwNHdwSy9VcFM0MGVzNE5yUFF4?=
 =?utf-8?B?NUJzNml3cWtsUXhFaHVoaEdwcTdHYXlkVGErSVVhbUNzWk9JM3pYRnp3Rkl3?=
 =?utf-8?B?Ym1lRjdxbWZCQkxzcjVodmdCSTVuU3JaTTRwZEpGejErcVdBNU52bUtrNCt6?=
 =?utf-8?B?WEFhMk5aNTl4VFc5Nm5uRWxBdlUxbWJ1NnJYR1ptNTZ4UVVtV2hDWnorWGFT?=
 =?utf-8?B?MmRwMlhiOGs0V0NVWG5rVkQxMzMzR0N6SG5WYWRaazZ0WjBWOE9GUnhJdWFs?=
 =?utf-8?B?WVA5aDlHUmtwM0FoRktTT05yNFlmblhWdWQ4dDYrYmJURlh3bGxjNEE5cHJE?=
 =?utf-8?B?L0JGVDdxaVFWV09zNU8wczVMcE1aUi82bEFreW4zaXpPdStQWXk0L0RGVlRC?=
 =?utf-8?B?QytXdTBSakJ5MTdqUzk4dEZMT0xobENHSWxNNWtoQmZRbTlBeFRCVW1QcDRO?=
 =?utf-8?B?WDZoV1FVZUVFaFcreGJtcngvNmQ2YnNCR2w3bzhtQmZLVHZQU3dqallnbnlC?=
 =?utf-8?B?NjlnKytmdnR4dTdVM3l2WWJIaER5aHpKalljS0xGUXFiekZOZnNHWU1XME1u?=
 =?utf-8?B?VnEvTnNSbEZibmlmRTBRTytLVkZXbGFQdEpGNHVjUis3aE1CVXF4c25FZ1Zt?=
 =?utf-8?B?dG9hUGFpa1VHWEJsSEhCa2xlbjNtYnN1Zkk4enFwd2hsSmhWeUhMYTNhOHIr?=
 =?utf-8?B?aTZiRzdPMmVRVCtOS3NrRC9yTk1DSzFrcmYxZDVmRS9vamwybWdMYS84VWNW?=
 =?utf-8?B?d2VBZkxKMmZsRkw4TU1MckJwTTU4QlIrQUoycjdhbVRTRGdNbnNBNEd1K0pZ?=
 =?utf-8?B?WmlZcTFZTVlRWUdFdjNhYkhaVlV3SDNYUGVGY3FWVmxFd3NlbnMxVkNZVzRr?=
 =?utf-8?B?cndMcFlaMnF5OSs1VFI4VHNSY0pkcGdnejNKOGFKQTdDWFF1OGZTR3B1TXBM?=
 =?utf-8?B?anJ4QjZZcnJTaG9TVjYxdjNpSUZzWFZueEtPeER6NEpEcHkyb0pFUERHbHdt?=
 =?utf-8?B?Njl6QmZlUmFjaytsV1dkelc2Ny9BWWxCbGpuYTVodUtEOFhoVTJWVUJydkM1?=
 =?utf-8?B?c3Y4Tkd0dlk0UzA0eGNEZGcwcVhXMkJJK1JIZEhIQUxSWDAwclhvWVFTekk4?=
 =?utf-8?B?NkZoZkYxWkdZM0pBcnJKeHovSzNXMCtqcVhna05ZVWtsVzhBUnF3dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62df28f7-be89-49ef-0ddb-08de3d89a969
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 16:30:59.6160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwVrArwKy9uhuvmHCvNFBoU/wMUWiG34PNYFE5Q+mMDpqKhdI3i5flaBM0+4UQwbrJXotoOnavqeLX+/q4zzxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5335

On Tue, Dec 16, 2025 at 04:32:29PM +0000, Andrew Cooper wrote:
> ... and split the x86 group away from the common group.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

