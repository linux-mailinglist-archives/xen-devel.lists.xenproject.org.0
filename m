Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F38F6CAE0F8
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 20:22:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181111.1504212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSgnn-0000ax-TA; Mon, 08 Dec 2025 19:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181111.1504212; Mon, 08 Dec 2025 19:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSgnn-0000Yb-QV; Mon, 08 Dec 2025 19:21:43 +0000
Received: by outflank-mailman (input) for mailman id 1181111;
 Mon, 08 Dec 2025 19:21:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NKnm=6O=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vSgnm-0000YV-35
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 19:21:42 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f036ca1-d46b-11f0-9cce-f158ae23cfc8;
 Mon, 08 Dec 2025 20:21:39 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by PR3PR03MB6604.eurprd03.prod.outlook.com (2603:10a6:102:7e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 19:21:36 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%6]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 19:21:36 +0000
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
X-Inumbo-ID: 1f036ca1-d46b-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5nEXjAmZlM+HrKZ5glVjJ7mk6CTe9dd1wEIyqpZLxn15OAt+LxBnbbxR5OcVNTQNNcbfwY0R/x3HI6/Kfd8YOfepQ1+XTXKK7j8kWiw43oA45eDI6gxVnY3OS4qz6KuLiCc8YWsnuNlKXC0VvGtcIxiNx9Cyw+T9P1m4LvzzxtZA8VCICrfWBFfmhQcS8gCVqraD9tTsxm3nbtuAA6xC5TbmnIP+3lR5+2Te/vRnA2lFSPuVpsBIgxnQa+bEMEcFe+mJQjcU5M8F0ygiFmxQgAI37CngEWJrjjflgKZ6Nw6F2XcvXgb9/Q4NpDmluMw1lsw+pzsjY5Ep5ULWw7bGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZLetCFDuJZr4FOq/Ep6H0TruFN0Jjex2HqkTby0WI8=;
 b=l0A2lwbK8bR8ryb64UQRirtM02dt6dT+8Rvtj6VUKsd1yFncbj+CzXH3A1Mh5nX8Gd2kzybAtAh/TzniWaz65Bpc9XXRO3ngWY1roHTP0iR1/u8YDaESKu4tJOGFrJrQegjHkduUJDZ4anIDF626HoOuz0G+i5nqCPo7Ea69FkkxfsuN9RewKvWr8pP6PUZD01hMX8mPOWPKcagiqDTkgLhg9ObfO3Vf9GLEHBt7zP87UYLZ11kmYdp50rLIc4UWmyX12UlXD5CvsVH0hwo8DkQsxECt8nQUH1p9AfAri2495MZmne4xrarFVR6GjSKGRzS27HXsQmcUfF4ybRmqcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZLetCFDuJZr4FOq/Ep6H0TruFN0Jjex2HqkTby0WI8=;
 b=f+lESEqOCel8/m13/YxBztrCEPBzT8hSz4BVyeOaIadSLZKot5Nh3sfKFG9NijIx1oezlHlWhYRcUSoV9egSeZSjvpxg3VMczdO2BD1mgagI4nKiQJ5QmTZNvG1rdEIRTD1wxhfZsN1/HPgTJqlOHHpyDTb2jkl9LjsGfhzrOZcfhhsAfcYPrkyicf6qZRr3HteQIC44ipzWO0xswCzS1WA2NcQ6RGeloGUOGlEgD6oBkUNu4DawnRTsMIrc9PYrGIuHko35yJEM61I46JHfjbrp+K879zh6POi/PXOUUIvGDljdn6PkPC2wgORFpyOONYo/03uBOky+VLUasa/VjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <d025e3dd-ba2a-4a9d-af37-37570e690aee@epam.com>
Date: Mon, 8 Dec 2025 21:21:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] xen/x86: move d->arch.physaddr_bitsize field
 handling to pv32
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251128152218.3886583-1-grygorii_strashko@epam.com>
 <20251128152218.3886583-4-grygorii_strashko@epam.com>
 <c9ee4fc8-44c6-43e8-88eb-9041c51aed16@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <c9ee4fc8-44c6-43e8-88eb-9041c51aed16@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0044.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::20) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|PR3PR03MB6604:EE_
X-MS-Office365-Filtering-Correlation-Id: 67802059-74de-4f86-3488-08de368f016f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlN4aENSOTdzaDFVZllnV2EyWHZBenZVZW4rbEhRRk9TcWhqUThQeXVtU0Jj?=
 =?utf-8?B?MDdnM08vTkpES1lzZ05KNTE2Z0VJK01sWjVNeS9EdTBpWVEzd3pXYVhFYjV4?=
 =?utf-8?B?ZzRkViswMUt6UVFSZ2RsQ2ZpYmI5UCs5aE5zekV3MHRYaHR2ZEpkZkxYT1hw?=
 =?utf-8?B?L0ZZZWg0TkNsVldISUlrOXJ1OVRlN2xORkhSZ0IvbEtyOFpjSUV6QUN3MFE3?=
 =?utf-8?B?SW9FWFQ3K3lYYVJkeGZQSlJmWjJwQVpzR0lzZlpueTc4RW5oY1Z5S01UU2FG?=
 =?utf-8?B?WXpGb2Ivc2NzWFc2c2VpZUErNUtCZXErNVphRUNJNnVxMGxhTmNaRGdZUGYz?=
 =?utf-8?B?SkU1TnZHTC83STFZVU1ERnY4SnpyQU1mM29LVFFlWnJqamNXakJDMlF5TFZX?=
 =?utf-8?B?aGl2eEFkRGNKQy92VDh2WjAwc3ZCQnhtRGVvN3E2WHVBczFmaGNpK2xhY0Ny?=
 =?utf-8?B?bWtNNWtKSjlYdEw3OEdiMDdZUnRpTG5OaWFGQ3VlaTB6Tzhyc3RESG5iOGJy?=
 =?utf-8?B?NERBMDhZbk12WXdjZStzNXpZYlJuT1Q2UHpnL1h5cFp6bFh3K21qbzZHbWdl?=
 =?utf-8?B?WTlnTEJhaEhHejgxY1p5WHZVTmd0c3J3dmZ3Q05DQ1FaZHllVFhKOGJrOGRw?=
 =?utf-8?B?WFZhVVY0MU9Xc0VXY01vbm9ZUE8yTXJiSTVob2ZZUGZQeVhhdVRGTjUvTWo0?=
 =?utf-8?B?d2Vnb1V2Rk1ycklYMDg1ZVVkOXJiUWdOa2pCMGtZVzhCWE56Q2g2aUR6dk9D?=
 =?utf-8?B?M3V4MHFvZ0ZHSzN6NFdKb2FiOGNLS1BvbUR5N28rV0VrSlVabVhFeWRjMXcx?=
 =?utf-8?B?U001aWtmNGRIL2t4R3dyclh0cGF1VGxPeU1KVGUrcTBYVXhORHpBTUF4dHBr?=
 =?utf-8?B?NjU5SlBlV1VQOG5YR05TL3Y4cFloY1lKTnM2SUxRclVSMGRBL3Z2VC9PZUVq?=
 =?utf-8?B?S0NXd1pBaW14bTgxRFlERkpYYlJWZUdEQUdOaUlUR010L0VVcHNvM3ZqU3J0?=
 =?utf-8?B?Ny92dnQvbm5tNzVUd3laS05LVWNBdElOQm42Ujh0MTkvWDFvME9kL0VrTFFP?=
 =?utf-8?B?c2VXeUtUeE92Vm1uRldRSXZKNU1XUFY2MHhuOC91UTNPVnJ3NEovUkFhRFdp?=
 =?utf-8?B?OHQ0czJUVzdhdDMyazZpVkZWdlNFZ0UxenZlTDZhYjBYVGExaWp6anRrdjZZ?=
 =?utf-8?B?ZDhnSm8wR0RHL0Q3SjNyTXYyYTR1akNjNVMwdEYwcVBBcnA3WkF2YzROK1hW?=
 =?utf-8?B?cEZQV0dVb2c2Y25SY1BqTkUrSU55eEhZMHM2YTZ4eXBPRFVzUnhaNUpDODhl?=
 =?utf-8?B?WHVWRStWVzFEV0IvcndHTjhKKytkNGNaWDZoUDdaOTh1K3B1cEFYajFTNjE4?=
 =?utf-8?B?eGVwdGloMndFTG1lOC9KaVRqM0hMcExzZlQ4aEZHanJKb2gwK3hXRkpFZnRz?=
 =?utf-8?B?cnM2NjBpVG4yWFJ6UTNnSTNRM29TOVhHS2tueTk0ZXVaTjhhY0J6OUMzMzVV?=
 =?utf-8?B?V2xuWHhPenJrT3lYWnp2Q3QzWG9XMm5wdXJva2J5NlJLc0VBZERHd2NyUEZU?=
 =?utf-8?B?cytVVVRUVU8vYUlFOFdEUDd5V09HdVJ2bW1IeDdQQUxmZHRxb2YzQmxJdHpo?=
 =?utf-8?B?ZE9obUppcTBrUTFxcW9iallvc216MERkMTNySVVXUDViNVF6NDRsOUFudjFj?=
 =?utf-8?B?SWMrcFg1MHUxWmp3QzNNME9TV212UWRZZS93RlNaa2NXWkFvbEdiSWJNUDVH?=
 =?utf-8?B?U3NnQXY2NmpLdCs4VUV4b1VKRWJDZ1dEbmhOc3BZS2ZDVXpjZFZuTzI3U2JP?=
 =?utf-8?B?dEgrQUhIeXd5Y092TCt6N2VOQ2tJZ1dsQWMxN2UyZ0ZET3lFRFpqRnNoVW9P?=
 =?utf-8?B?bkRLdnRRRFBBdHdCOFdUbEdXVlhkY2hBSjJZMVV4bU5UVDZyUGZzTTdCYmFs?=
 =?utf-8?B?Sk9jbnRjVzZLbThqNnVvRGlRcHlMVVFyYkZ1ekljVERJWGlXU2c2K0JlR2t5?=
 =?utf-8?B?OEVCUVVIdEtBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmhMSmpFbitTK3pMc0ozcVBWbmMzRDVLVk1yb3BiZnpoNXk0UEF5OWdJaWpa?=
 =?utf-8?B?MENjNzcwbnoyUm5ibVBYKzNmaTNuUm1YaHAwblBLcndpVWx3ZXdJVkVXVWdM?=
 =?utf-8?B?RVVaVU56MnBFVE1Gck02Zjl3Vng3NE1tRXpBVnZYd2wydmZGWHVuQit6ZGZW?=
 =?utf-8?B?VHBlN1RWVm54Y28yRTVuZkw1UHdzamdHZmh5Mkw5TTJkdnZBc25STnd1Mkxk?=
 =?utf-8?B?OG9VOXBxWGEzYy9nU0VzdlQ1NzJLbHhIZlFvVVFsSTNibW9TY2hoaHZDc2Ni?=
 =?utf-8?B?WEU2Mm5vQ1ZIRC95MzRtVXlYa2hlRHlkUjBNS0JnNlVsUFZPNk9rSjlCTVYr?=
 =?utf-8?B?WHFISzBhUUVuNXUxcXE3NnpBQnByQ3BKbmFPaVp0dC9LWUFTVXYzTXNRUklo?=
 =?utf-8?B?VWgvVGJlbWtvSktDUFJ6bWF3ZTczTGp4OTZqNXE1YUc3N0FJZkJmekFwSVRP?=
 =?utf-8?B?NUV0aHZKc3Z6L2trNDg5SExDR0ZHa0pMdzU2VEhYOU43OHJRSXpzSVJQL1p6?=
 =?utf-8?B?blNvSzZKMWNtbnQ2RGgzNUVGWmxicmh4OWRLRXZQekVVaDBXTDBxY096cUdX?=
 =?utf-8?B?WWdCVVFieDB5bmJJRy90SXAzSkFnM01uemVsTTVxRWs3bXRSMzRaaDVwZytv?=
 =?utf-8?B?eERPUFVGdzNuQnhVbVZPYVljK2VhRE01cyt3KzdkcUcxMDV4VVQvMys2eElI?=
 =?utf-8?B?d0ZEa09MVlNWTFJmUnVjSUpGelV2UXY4SmpYUE5NczNsdmcwR3ZmOWFYQ0Fk?=
 =?utf-8?B?bXd3L1Y1blAzcW4zc1dzNGV5U05WUzFjTS9NTHFUNFpOM3FGaTlwbXBidld0?=
 =?utf-8?B?Um41NUtKTzB4VEtNUFc0SjZkWFNWNFpNeFpPcnAyVmhQdTVrZVc5bDVtZ3pz?=
 =?utf-8?B?NWpNSHpucnBEVWgwMVp2MnIxakVmODBBNUhKQ0Fqa1h1VU1FWEsrc055TTVR?=
 =?utf-8?B?MW0yaW9hamVuWml6U1FCZjhINXFNT0R3c0ZCTGlKQWlIWUJlVUcxem5QSm9t?=
 =?utf-8?B?ZE9TOExnc293TndOUmZ5MVUwZlJFRGRMaTlrOU5ENnJ1WEl1Z3BGUWE1MWVT?=
 =?utf-8?B?WnE3SmlEOHEzRHlaUmRuemQ1dE1HaUNZaUF6bTFpRFBpK2NUTmxOYkVSZjl2?=
 =?utf-8?B?TUlPTkk5bFFkRTk1UW5xdkNLZTVXK3VNQnFNVEZiTXFEakNuOVpRY0k2aDVZ?=
 =?utf-8?B?ZVBhSVNtZ3h2SDF4R216cW5hVkhOS29ORFl4NG1nV2tqcVV3aUhHYXl1RTUw?=
 =?utf-8?B?ampjTW40K1Z0dzNTaXRmRlJ2dSsrVllLYTRUaDdkeStwYnpwNkVQaWNibzFH?=
 =?utf-8?B?dDFIMVUrRmpXbjJSU1dQRklyelRaN0ZoSXFsQTFIWXVzeDV5RURGZmJ2Skw2?=
 =?utf-8?B?V0lLaW56OEp6VWpzT0NGZW9BVjAvVGdORzJ4ck9WMTAzQXY4ZWxwWkorR1BL?=
 =?utf-8?B?RkJUazVsemFPdE84SHU5dUgwMTY4NFU3c1FuV0JYSnJMSkR2c3o1Z1hWWDla?=
 =?utf-8?B?MzFpZjlhZytTTi9NQVBkQk9JV3lwUVVSek9vZmpiQW9TbG5jb0owMlB1RGpS?=
 =?utf-8?B?ZlZROXZ4cjFrL2dYbkJnS1g2UUNqQXBQbzZ5UGNlelFEcGY4Z0tUQmc0cVor?=
 =?utf-8?B?ODZNRk0vcTZ1K250WXBYUlVudGpMRXZZaEo4WWhMSmg4NTgvdi9vQm5MNUtt?=
 =?utf-8?B?UEV0YWE4bG1DWlVNcTRaUVdCYmhWNW4vZjFKUzhZZWIvclRsRGhDdVpSeWdX?=
 =?utf-8?B?YVNVNTVLcEVRakRUTWN2OWRITWxvVkJQZU9mdm14d0lqV21Ea1Q3a2dZdFFy?=
 =?utf-8?B?d3ZLRzRwRWxZTnExak9hL1U5RUxjUjQzWGRMckNkUjlVSU91VnR5UVQvamc1?=
 =?utf-8?B?THIwUWk4ZGRDWG5iTUFPcEFaK0M4N1ZuZWk0bTVGM2VVK2g4eWFtQnJBZk5v?=
 =?utf-8?B?ZlkrMWdkeXNlNEJZNENtRUYzWlVUSHRuZjE2alRWUkw0TVE4aUV1MjlkZ094?=
 =?utf-8?B?Z1dFeHdsL3FxVGVQK3pkTG9ZNmNpemR5STBWR3lTOStUU0ZJajVvZitoS3Zp?=
 =?utf-8?B?WWdxVkRkZFpZc0RDNTdMVG9vV2c4alhubjB5V2VMSVVBVnI2dHgydHlkVm5W?=
 =?utf-8?B?a2FMbzFOdHIyQ1lLUGZqU2JNUGg5ZTVrdkQxcStpc2xjTHREUlpKeUltTXJY?=
 =?utf-8?B?M1E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67802059-74de-4f86-3488-08de368f016f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 19:21:36.6433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gLnjKKJRvoAT+C6AARXcB6S3g26lZIfXRWyKGQ+zzi8+xV88Mh+wRuR1sV6CII7UB+G+S2kX+iW4miS2hgh/sOUqYo6C2VKpfPtU3KXDRuA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6604



On 08.12.25 14:44, Jan Beulich wrote:
> On 28.11.2025 16:22, Grygorii Strashko wrote:
>> --- a/xen/arch/x86/include/asm/mm.h
>> +++ b/xen/arch/x86/include/asm/mm.h
>> @@ -619,9 +619,12 @@ void __iomem *ioremap_wc(paddr_t pa, size_t len);
>>   
>>   extern int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm);
>>   
>> -void domain_set_alloc_bitsize(struct domain *d);
>> -unsigned int domain_clamp_alloc_bitsize(struct domain *d, unsigned int bits);
>> -#define domain_clamp_alloc_bitsize(d, bits) domain_clamp_alloc_bitsize(d, bits)
>> +#ifdef CONFIG_PV32
>> +#define domain_clamp_alloc_bitsize(d, bits)                                    \
>> +    (((d) && (d)->arch.pv.physaddr_bitsize)                                    \
>> +         ? min_t(uint32_t, (d)->arch.pv.physaddr_bitsize, (bits))              \
>> +         : (bits))
> 
> I'm not quite sure if converting to a macro was a good idea. But now that it's
> done this way, so be it. Just that a couple of issues may want / need sorting:
> - d is now evaluated up to 3 times,
> - indentation is wrong,
> - the use of uint32_t is against ./CODING_STYLE (I dislike the use of min_t()
>    anyway, but what do you do when a macro was asked for; of course we could
>    [easily] arrange for BITS_PER_LONG to be of type "unsigned int"),
> - the use of "bits" in min_t() doesn't really need parentheses.
> 

I'll update it.

>> --- a/xen/arch/x86/pv/domain.c
>> +++ b/xen/arch/x86/pv/domain.c
>> @@ -254,7 +254,11 @@ int switch_compat(struct domain *d)
>>               goto undo_and_fail;
>>       }
>>   
>> -    domain_set_alloc_bitsize(d);
>> +    if ( MACH2PHYS_COMPAT_NR_ENTRIES(d) < max_page )
> 
> You mention the change in condition in the revlog (but not in the description),

The updated chunk was based on snippet from Andrew [1], which
used incorrect condition - I've changed it and noted in change log

[1] https://patchwork.kernel.org/comment/26680551/

> and I'm having trouble to follow why ...
> 
>> --- a/xen/arch/x86/x86_64/mm.c
>> +++ b/xen/arch/x86/x86_64/mm.c
>> @@ -1119,26 +1119,6 @@ unmap:
>>       return ret;
>>   }
>>   
>> -void domain_set_alloc_bitsize(struct domain *d)
>> -{

The domain_set_alloc_bitsize() inlined in  switch_compat() and x86 PV domain
always created as 64bit domain.

At the beginning of switch_compat() there is:

  ( is_pv_32bit_domain(d) )
         return 0;
[2]
above ensures that switch_compat() can be actually called only once (at least it can reach
point [2] only once, because there is no way to reset PV domain state 32bit->64bit

this is original condition which says:
>> -    if ( !is_pv_32bit_domain(d) ||

do nothing if !is_pv_32bit_domain(d)
  - for inlined code is_pv_32bit_domain(d) == true, so is_pv_32bit_domain(d) can be ignored

>> -         (MACH2PHYS_COMPAT_NR_ENTRIES(d) >= max_page) ||

do nothing if (MACH2PHYS_COMPAT_NR_ENTRIES(d) >= max_page)
   - inlinded code should proceed if this condition is opposite
     (MACH2PHYS_COMPAT_NR_ENTRIES(d) < max_page)

>> -         d->arch.physaddr_bitsize > 0 )

do nothing if d->arch.physaddr_bitsize > 0 (already set)
   - inlined code will be executed only once, so (d->arch.physaddr_bitsize ==/!= 0)
     can be ignored

> 
> ... this 3rd part is going away.

Another observation: MACH2PHYS_COMPAT_NR_ENTRIES(d) is looks like a const, as
(d)->arch.hv_compat_vstart is always 0.

grep -rw hv_compat_vstart ./*
./arch/x86/include/asm/config.h:#define HYPERVISOR_COMPAT_VIRT_START(d) ((d)->arch.hv_compat_vstart)
./arch/x86/include/asm/domain.h:    unsigned int hv_compat_vstart;


-- 
Best regards,
-grygorii


