Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD13CCC849
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 16:39:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189849.1510555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWG6H-0007lQ-Ue; Thu, 18 Dec 2025 15:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189849.1510555; Thu, 18 Dec 2025 15:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWG6H-0007iL-R2; Thu, 18 Dec 2025 15:39:33 +0000
Received: by outflank-mailman (input) for mailman id 1189849;
 Thu, 18 Dec 2025 15:39:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ars1=6Y=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vWG6G-0007iF-8h
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 15:39:32 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc220243-dc27-11f0-9cce-f158ae23cfc8;
 Thu, 18 Dec 2025 16:39:26 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by GV2PR03MB8751.eurprd03.prod.outlook.com (2603:10a6:150:a8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 15:39:24 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 15:39:24 +0000
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
X-Inumbo-ID: bc220243-dc27-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZYwfkAPzycyP+OQuW155V0vgcbBIFNk8ZZPSWdrs3YMcAH+JENKLDokvVin2YvTXrXSTXUZQKSm3WW50Wl5gFxAqDCq0ebQS05PPjZWUh3fUtsLZV1zl2r/MpY1QXpU9rNodc19Zl7SKd7Xrecz+gXKHAtYcE03xrtaqlzmMutD8WbVb0TM6Ws5TiS4yNz7siNdcKJmtdfWdLPySuy+Q/fcns7Leo8a3flaPhZ7y0NnSyz7f6bh+AW3Xzn5JsTpk6hvheY4sxuQYA2XgP44MHT3oXZGUEWwiqdt2Fvng6KW0EXuttstREjNQZonhLN7T+KAThdJ4AhsJYWhbmeyVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yROL6qwXR/NO4o/u+IU8nol6Gq44egK5+UBEFIOJFHM=;
 b=dMn98kpi+5Vw2k8dfsD/JiMnV6fCM8HpIRacywKLeI3qm8nf74M6GZmEECs7s021a8SFpPZzGmDa1elbW3W98BY86uf7Qf3mOnI7Dzh9ySQ1sHrfG/L+z+EtU36CjTkkvud4BettGtOlBAHI9umT/s2+5h0PzYqKtWX9DdwGgsR7bBs9A1b3b3dLTDlyh626ck+rtQm+pTMjQBatCv9NOwx+mZvh15uCVsUXKooN4O8wgCI2cqdv6lImsTCzACHWSJNPkZl5hxvHFqodOLAQ2J5kHJlmYpnp71YcXJOqB2uW2+C+5kotHQ7ZqPPLllYBId62n5W0ygJAp0hYGMm7rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yROL6qwXR/NO4o/u+IU8nol6Gq44egK5+UBEFIOJFHM=;
 b=QfddbewlbhbvackoUUUzE42W1LGhuMuJVQq3cWyqbD4LHxC54PnJNReAET27xqcerIRgKR8Jk/i/fygUNzcKEkiiPn5uVimMxiz72SxIxt3DX6OKZCbC2oL0bnrE8o/YD6b8p62C1059c6Q2TMnBemUbA3cGWCJ3IxcPjUr6taaF8yFBy9ld6+b8sArxK9ehDAYSDeE6buOdI//5DqxbcYRoorNyQySP2BoFyvjlCwoQwlUV4E/jr7ifNB5F+fbsrBljgbBmW+9yJ8yzfH6EL08AWOlYjskfxv27lPg34ijB31oTRjIk108jLcbK+s0PVUf3gx4I+vKUGC2kL9hylg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <6f2a1bec-3497-4860-975b-57c06d86625a@epam.com>
Date: Thu, 18 Dec 2025 17:39:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v5] xen/x86: guest_access: optimize raw_x_guest() for
 PV and HVM combinations
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251218135926.188059-1-grygorii_strashko@epam.com>
 <eb7d910d-8fe1-453c-933d-9b2f208c8b12@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <eb7d910d-8fe1-453c-933d-9b2f208c8b12@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::26) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|GV2PR03MB8751:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c8e8b87-78c1-4d04-0277-08de3e4b9eeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cENCNGlZUW5ITTJ6RndwUmZHQnZtMDlzVWZxNldZK241amlHOFZGbUw2azh3?=
 =?utf-8?B?R2FBb3pydUxveXU0eDhLd0oyc2NiVlVIdmoveWxCa2k2RkFpdXJ3VVJRZ3Iw?=
 =?utf-8?B?VzR3cXROY1ZRa0JoZDVrMm1vUEFxdVk4UzZlVm4xeTFyNkZPeVY2QzlEM0ZE?=
 =?utf-8?B?YVQwTXB4dG40RDl6UmliY2ZuMWNTcXBMZGdHS3ZsKzNrVi9BTUhMbFRjclZv?=
 =?utf-8?B?Zml6ek9UKy8xWWZ3YnJjYUI5RlRITGFIMkJMcVJvRExkSEQ5WUMxTldTVXNk?=
 =?utf-8?B?YmFLNXVDTG9oS2JHVjBvSlM0YWl6aUo5UHczR0NmMEE0alRUaDJxR2RkQmRx?=
 =?utf-8?B?eVV4M2doM3o2aHEyUlpVTmhpV08yMVQ0dUlYWXgxZVZIUXRmQ3FyZERVK2Z3?=
 =?utf-8?B?R094aHdsNUFJRGh3M1N4ZVFUTTFsZ1ZaN0Q3WTZablpEVXZIeUhoN0cvK09V?=
 =?utf-8?B?YzA2cTF1SXVqWXg2K2ZRazhmSVhYNkV5VkJKNUFwb0RmU2loelpwaXMxL3Fp?=
 =?utf-8?B?S2xxemJqSDlMZkxGYVlXWFB4QWw4NW83d0JPdnkvcEVxSGxNZ2dRRFdNclhK?=
 =?utf-8?B?NHFkV2NmUDVqSy9vZDUwenBrb2prT1NXaUVtaU01aWRFUnd2amtGc3FIcnhq?=
 =?utf-8?B?bktWQnpQYUJWQWVrdlFwbllnS3hFOWZqTFZTc2NHSnpJNjBWMzRNcGdNZkc5?=
 =?utf-8?B?UUFRT0tnM2JHakZNTWxWM1JEa0JjdEZNakVabHNUc2k3dm1iT3VueklXMlNC?=
 =?utf-8?B?elpnS2g0d0dVQ0lHdElzZ1dBT0JrS3NpcHdwSUUvbHNSb0hPWHcwYkdFT2xS?=
 =?utf-8?B?RDVHdVF1eEE4cUxoVmJaaW4zMGhzYXQ4S1VtZzRUL0VjaUdTWHdyamF2Tmtm?=
 =?utf-8?B?aCszMWNkL1ZaalVwejFsRGl0VUYwWThDaHZremxsVTd1MWhRNTNnRHJhNEJa?=
 =?utf-8?B?S1JXOHJhaEY2VnZPbmp1OXZpdkxOS3ltZEl2MDNRSVk0V2hNUHdPdUJUU2VM?=
 =?utf-8?B?NHVpelpyWGpUUy9SeVg4OVFBQVF2TUhabGIvbmtJZ0tUb3g1WU03QmtlQVpS?=
 =?utf-8?B?VnBFQWd0b0FZd1BQandtS0VBZjFSMmRIZVk3SzNNSnltb2FBQVBidnR0WDdM?=
 =?utf-8?B?THoyY0p0V1h3dEhhZEJsaDNsUjUvU0lxRk1Xc0tTK3VVMzB2Q2RIODRGdllW?=
 =?utf-8?B?elhBdlFQcEMrY1RzcFA3akJwT0dmaGFvTU4xUmZ0Y1YzUUJzZUY5YkVLWFc4?=
 =?utf-8?B?VXdGRFYxZUN5THJmam5aQzNDK1Ftamp3aWs0YnB5eDhOenFzSkdBM1dZMHNz?=
 =?utf-8?B?UWJFRVc2WWJtMmJDSUcxbnZCSjVFMnd0cmoxdWM5bEZ2V2d0dEp6cm1rWkxV?=
 =?utf-8?B?RTBYS1hSVWhxMzE5cXNZc2tzMWJXZGlSM3c2M2JibU1BOVk3UHV6bXZBU0Np?=
 =?utf-8?B?SDNFOGxYK09DN3VrYkNKRDZZWmJ2dWp1MnhDNjRHaEI4KzB2WFZTbWRJZnNX?=
 =?utf-8?B?L2Q5aUZKejU3VGVzaHhNZ2NXWmlqTW5sQ2RIVHBaNTlGQWJrelNJUmR2eU84?=
 =?utf-8?B?N05yRzZ4T2FmY3VsbGdaLzZ1YldjeVZ1Q2lOazdKSjU4OUNmemtkMDFpTFlG?=
 =?utf-8?B?aWpvTit3MG9sQmpDb09xd0haN01LWjQyeXF4YUEybFpjQ3VIMEIzeFgvUjFa?=
 =?utf-8?B?cjNTaEtvc3g2ZVQ0Ymhsb1JjcVFoWFFMSmFsekZ6RENJSUdJRXNsWUsvV09Q?=
 =?utf-8?B?SzVWTDdSMWovUkpiTDN2L3FGYWRTTmJHYTBzVkZuYVlpbE9aakpta0VVaExl?=
 =?utf-8?B?dTBBWExxeXU4aUFCUmdSckt1QnFOaTAwZ2dLWWorUVRBVjZOK20yQWd0OVBT?=
 =?utf-8?B?V0xacmNqbnByN244disrYjI5VjlOcnl6akw3SXEvRDlHMFdGWmx2cGxtMlBU?=
 =?utf-8?Q?eFjNkG1w3eCni5g6x7vpW0yovUoYEa4D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDkySlFwakdZUXIrSU5yd1c1cUVYeXpTZmhSWnBxTmVqTStnQ0loY3pmb0tn?=
 =?utf-8?B?MUZYM21HcFhvVThMRTlYU3hZSmFFTnpFd1JLVTJTejFiNkF6cEpydkVGNGVl?=
 =?utf-8?B?dUdlVDNkOXNJbk5ibHZ1QXo1UnRhWTVLTytaTC9Ha09nbmMrc0ppTk56ckNz?=
 =?utf-8?B?Q1hLbEp3V0MwNVp2NmllT21xZVhBYzhVVWlqZG5QNmxnMHpENUcyZVNqMGdq?=
 =?utf-8?B?RHpmZEhJOUcvb0ZvZXNlbFhKUndteWFJVDUxeXBFMXhpRVh4dUtpMHlCVnIw?=
 =?utf-8?B?N1dCVDFlWXZxQUFqeE5PY2c1cmh1eXl0RGpaY21GSHRlV2FpZ2p1VkhDUURD?=
 =?utf-8?B?ZWRqQUx2cWl4UlN5NjBXWVRNOEpVeVI2b2VHUHEyc3N5aWtUSG82NG8wRUhz?=
 =?utf-8?B?b2RjOWltWUVOZ1NKUEViS2l5Wk9yeGJwRVlyZTFjYzI3VnhvSUQ1QU1paHRj?=
 =?utf-8?B?ZGZ4RzFsT3p3WjlKR2tQeE9rak1ZaHJ3VDVkcGdCYW5KMExVR0RCU01QMHdk?=
 =?utf-8?B?UzhXcnJCZUpyNld4clhFRW5yYS9TdHNPNEdaMUd4YVlsTWt5V1cyUnVWZXo4?=
 =?utf-8?B?eVU5TVJoOU5hcGtYREFTL2E0eTMrQmJabnlZYitwYi8yWXBSR29nY0VNd1Vx?=
 =?utf-8?B?Z1BsTUdVdDFrOWJRSVM4anJ6dDhMZkxLYlhYL3lpRkJ2TWNaSVlEUkZNYmtN?=
 =?utf-8?B?YU1FZUVnSnBTUEpzNk8vWHVBUkM3dGVLZ2k1eFNtUUNVblgvWGd4Z2YxS0hr?=
 =?utf-8?B?RHZHUVNsUEMrSVQrY2MwdFQ2UEFQeU9pWmMvR2J6UStjZjdsNDhzSEtMczJI?=
 =?utf-8?B?Ym83MGU4aFhNRHlYL3RXbmlKSnZldklqMlU2WW1HYm9OZXVYd2lzRGFzbmpP?=
 =?utf-8?B?MnlCYVNHU1VmOHArVFVBaVBaK20rWVIzUERaYW8xQTF4T0h1dVdDZ1piNmlS?=
 =?utf-8?B?UWxFSGVQWVcwRjc3MVhRYnBySXJkVDMwY0ludmVWMER3Tlp4RTErdWJ2aUZ1?=
 =?utf-8?B?Yko3NGZDSncvRlNLRklXQVNRcHpTdmNGem1yWGVub0dPb0VhWStHUnpKZi9n?=
 =?utf-8?B?M2xWYjErR3AydHdTRmlwVUFoTHEzVWhKYXh1TDhIVVpBY0JMbzd6aXU2Rnph?=
 =?utf-8?B?eThrc3haam1ZcVBKaEZFdkNrV0VvT0FjdHNWeXZ1NFdXNkV3NHhIbHFjcTVR?=
 =?utf-8?B?Wk5nVVU0MnJQdVMzQ05OdjhxSHBqRjcvS3M4b29Kc2x0cHhkS0tkcGRnS0hM?=
 =?utf-8?B?eGQ3c0dwMVlwWDRwc2U0UUo4dHpGZm4rTW03YUl1aEFCT0NlNWZaUFpoUklS?=
 =?utf-8?B?dzNrUzlPeVVNdjVTbFVXaWRkR3VBSHBIRnFuTEQvWWVDaFZCN1VRVHI2TGJY?=
 =?utf-8?B?Qk9PeGZ2Y213UHJwNE1ZTlEwaFdVMzlsbUtvQ0VBRGVNMTl4MFlKNGovbEZx?=
 =?utf-8?B?NGo2OWwwQTE2Z0pGTXNUVmxqZlV5MW1EdXhkbkdBSWpiZDRlZzFlczlVZ0VY?=
 =?utf-8?B?WWZocVJtS2NTMWZxMWxFQmYzcjZkelBpN2N0amRLZTdsbjVQTnlEenR6SkZ6?=
 =?utf-8?B?STM0YzJ2OFd5c2RmK0xIaEpBS3JmVzJ3UzVLV2o2aGQvbXhhdkdFWi9WTXM4?=
 =?utf-8?B?azNPZFVxUmFSVm0ralgwUGFuekd3QmJLQVlJazlFZng2OVBmVlE4aGc3R3hK?=
 =?utf-8?B?NldPN0pXKzlCL1hDVTk2WHhyb21HM0xZQk9icW1kSm5Hb3h4dVlTUm9pb0dj?=
 =?utf-8?B?WFBPWlg1cmkrUzgvOVd0ZXFCM0lyYklaekwybUl5WFJOU1ZnakpYRkZmMkRZ?=
 =?utf-8?B?bncwb29ieFdWUkdNQXR2K25jZjgwU05CcXprb0o5Zk9LdG9KeXJWa2NkOGd2?=
 =?utf-8?B?RjlDOU1RRWY3ZXEzY2JTYlFpUi80VzNTVUZZSWlIWXM5UHlQbmlrK0k2RTM2?=
 =?utf-8?B?QWR2UUFoOWlJVjd2dTh4YUlabjN2Si8yM3hSZFhNZlJ4dmJkQ29HUnJRUFJz?=
 =?utf-8?B?Y0tRdXJNcThCVHUyN0U3MTVJSlZ1Ti91RWdKdkc1TGplZXZkSUxuK3V2c2hH?=
 =?utf-8?B?WHZSa2UrcFpSWUgzQkRsVDNWaTEwWTBTaHBGQU9wdldRY044U1lobytYR2Z2?=
 =?utf-8?B?RUdsYXhnZXh5TGlkc1pSaXpLWjZtZ1Zpc2M1bVVZZVdOZ0plWmoyL3RwbGxy?=
 =?utf-8?B?d1E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8e8b87-78c1-4d04-0277-08de3e4b9eeb
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 15:39:24.3793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uy4Ztqrk6ewfTUNzm3PUz5SP3ml6eWvRc7WFqHK6WHX4zg9yjqTX0Id3Spoh+jzY02RLCPNXgWc5sNF9t0T6iFPDTBTt+eOtyZJP+51UoMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8751



On 18.12.25 17:22, Jan Beulich wrote:
> On 18.12.2025 14:59, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Xen uses below pattern for raw_x_guest() functions:
>>
>> define raw_copy_to_guest(dst, src, len)        \
>>      (is_hvm_vcpu(current) ?                     \
>>       copy_to_user_hvm((dst), (src), (len)) :    \
>>       copy_to_guest_pv(dst, src, len))
>>
>> This pattern works depending on CONFIG_PV/CONFIG_HVM as:
>> - PV=y and HVM=y
>>    Proper guest access function is selected depending on domain type.
>> - PV=y and HVM=n
>>    Only PV domains are possible. is_hvm_domain/vcpu() will constify to "false"
>>    and compiler will optimize code and skip HVM specific part.
>> - PV=n and HVM=y
>>    Only HVM domains are possible. is_hvm_domain/vcpu() will not be constified.
>>    No PV specific code will be optimized by compiler.
>> - PV=n and HVM=n
>>    No guests should possible. The code will still follow PV path.
>>
>> Rework raw_x_guest() code to use static inline functions which account for
>> above PV/HVM possible configurations with main intention to optimize code
>> for (PV=n and HVM=y) case.
>>
>> For the case (PV=n and HVM=n) return "len" value indicating a failure (no
>> guests should be possible in this case, which means no access to guest
>> memory should ever happen).
> 
> I agree with Teddy's sentiment towards HVM={y,n} not really mattering when
> PV=n, as far as non-HVM domains go.
> 
>> --- a/xen/arch/x86/include/asm/guest_access.h
>> +++ b/xen/arch/x86/include/asm/guest_access.h
>> @@ -13,26 +13,64 @@
>>   #include <asm/hvm/guest_access.h>
>>   
>>   /* Raw access functions: no type checking. */
>> -#define raw_copy_to_guest(dst, src, len)        \
>> -    (is_hvm_vcpu(current) ?                     \
>> -     copy_to_user_hvm((dst), (src), (len)) :    \
>> -     copy_to_guest_pv(dst, src, len))
>> -#define raw_copy_from_guest(dst, src, len)      \
>> -    (is_hvm_vcpu(current) ?                     \
>> -     copy_from_user_hvm((dst), (src), (len)) :  \
>> -     copy_from_guest_pv(dst, src, len))
>> -#define raw_clear_guest(dst,  len)              \
>> -    (is_hvm_vcpu(current) ?                     \
>> -     clear_user_hvm((dst), (len)) :             \
>> -     clear_guest_pv(dst, len))
>> -#define __raw_copy_to_guest(dst, src, len)      \
>> -    (is_hvm_vcpu(current) ?                     \
>> -     copy_to_user_hvm((dst), (src), (len)) :    \
>> -     __copy_to_guest_pv(dst, src, len))
>> -#define __raw_copy_from_guest(dst, src, len)    \
>> -    (is_hvm_vcpu(current) ?                     \
>> -     copy_from_user_hvm((dst), (src), (len)) :  \
>> -     __copy_from_guest_pv(dst, src, len))
>> +static inline unsigned int raw_copy_to_guest(void *dst, const void *src,
>> +                                             unsigned int len)
> 
> A side effect of the converting to inline functions, besides being more
> intrusive, is that now you will want to add proper __user modifiers.
> See lib/copy-guest.c's use of them. That said, ..._user_hvm() functions
> also don't have them, but imo wrongly so. Really I question the use of
> pointers in that case, because they "point" into a different address
> space, entirely inaccessible via use of those pointers. Hence adding
> __user is going to be only a marginal improvement for the HVM case, but
> is going to be wanted for the PV side of things.

ok. so it need to be like this in all funcs

-static inline unsigned int raw_copy_to_guest(void *dst, const void *src,
+static inline unsigned int raw_copy_to_guest(void __user *dst, const void *src,
                                               unsigned int len)



-- 
Best regards,
-grygorii


