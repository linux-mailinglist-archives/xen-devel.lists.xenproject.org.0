Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F12DCA80A0
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 15:58:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179154.1502767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRXFl-0007zs-Ii; Fri, 05 Dec 2025 14:57:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179154.1502767; Fri, 05 Dec 2025 14:57:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRXFl-0007yR-Du; Fri, 05 Dec 2025 14:57:49 +0000
Received: by outflank-mailman (input) for mailman id 1179154;
 Fri, 05 Dec 2025 14:57:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K96r=6L=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vRXFj-0007yL-FL
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 14:57:47 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id beab4d33-d1ea-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 15:57:41 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB5289.namprd03.prod.outlook.com (2603:10b6:5:24c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 14:57:36 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 14:57:36 +0000
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
X-Inumbo-ID: beab4d33-d1ea-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AsC+XRiuIfMMCgjuxChLn+clIb7Zle4ec0rdDmrp3Rn2MGokGZRoBY+paXDlKB88q7EzZE+Igq4RW0J5B2lz6QevNT+Rp1m5hhLDQwKI3YvoOi1e+DhI2u+E10tk2eCUz2e/OS+t0VbmyGE0hwBO7NszJd+UzxxVklJN+1bOJT9fAZBTVp/kbXuUj3jKBYsA8t34sURwAk/5prENsOPcqpagoX9WWl6BYs4iXl17+a/Zh++Gxwcz3T3J9qtu9v2PT9bghwEAkMV6uyf9rQfkmZD/S2XoC+8fZVwpN5HfrnmbRVp8pVNnzHo7PFfEK5xi1WCTWUytzVm8Z9yeqsEmlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4x+ICUOAWqcOZ5W88jw/FCe99ylcnb1IoDnnnTeZFg=;
 b=OHyM7uFLuZdJ7LCN3v5I6j0BiywCyD4VDgrGrICKcKvmtvR7BuJxkTtA9LaEbtbP6+ZG1KPh1+kE/L3evVgqm6Xho5oNvBmJ+b69VHp0lhBHEQzd5gITArYgbwO75Gp2UA2y0IeZShwTUCzbdZynIiG5dfhjnRyfYIA+b8yXtpaMnCHtyGpzYGzm+ZPmjaoiilI+09N9Y6lzHh/XaZqzmAlqHQuhlmnsz5G544SkW7FMvOwnv3xJpSPOtAuRpTwY88/cFHCRyJduK4Sp891kvSXk01Egc5GelumSD3tednCaI8vvGGQAF4Sv9e1pYGMwyrla7AuvKngzf6QgEvz4iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4x+ICUOAWqcOZ5W88jw/FCe99ylcnb1IoDnnnTeZFg=;
 b=YM6/HkcVjK9hOM1+WwlsfFt3GZUvTQP2k+zVN4fCaY79rc29WFRMuzl30Ibh0AkoXk2Vh0/8y1UJCKOwIlPeXSLHrewjoOKV5CNAIEJq+77pwIGJbkI74X50DJSOnkrZ4Z+qJcS/p+80JlchvC77AukfO7zxX6T+lubr1mlhu8k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <95799f50-12ec-48de-9847-cf46835f1a98@citrix.com>
Date: Fri, 5 Dec 2025 14:57:32 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org,
 Mykola Kvach <mykola_kvach@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] systemd: default system-sleep dir without pkg-config
To: Mykola Kvach <xakep.amatop@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <f03c8a2fe81527841966ed6c8ed603d1d90ee5c4.1764940296.git.mykola_kvach@epam.com>
 <aTLkwMpxchYSMnyT@mail-itl>
 <CAGeoDV8FnNxoqr18W82DhE=fLWJSQr68xr_vPew_z=hyt2BbeA@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <CAGeoDV8FnNxoqr18W82DhE=fLWJSQr68xr_vPew_z=hyt2BbeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0105.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB5289:EE_
X-MS-Office365-Filtering-Correlation-Id: 14ce9cf0-a3f0-4b85-9ee2-08de340ea074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXRVUGRPdE15b0pIMzhCSmpHZXRCT2pGd1FaU0JDYmt4a2dLOHFZblNSNnNU?=
 =?utf-8?B?dk9zQ2hwdTRZOGFwUVMzWmpZT2d2QldKaTUyanhJYTZxYlNFZmpKdWE3Rm5v?=
 =?utf-8?B?alc2QkNsZ0p6Vm9Ia3N3RU1KVkk3NHh3SUxiVEY5QnNGMWxjMTArN3lwbFVo?=
 =?utf-8?B?Q2dIeXpCQS9VdXk5MU5KWWNXbUVhT2t5VVlRclc1UE44WmdmSVQ0OG1ZaXN4?=
 =?utf-8?B?OVUrOGIxVlNRc01IaVdKUUM2MkdIbFI5SmFOTjhGdGlJTjg5cjZ4UkxwdFJQ?=
 =?utf-8?B?a1BiOERUQjNrUEdMT2h4TUpia3M2bnBDZ24wMFZCcDg4azBhSkowVkkzSnpn?=
 =?utf-8?B?RGhkM0NRQVVrOThtdzdEVmt1L0E5WGZocUdBcmxmQ2QyY1o1T3BOSE96Ujds?=
 =?utf-8?B?T2tiWUZpZytVL0hvQklOVTRqcytOcFFPOTZldWdHM0YwQmJCMjVkTXZud0hH?=
 =?utf-8?B?T3V4aExESDR3Vm9PSkgyYUtzeW5GbFgzQk1FZ29yak9YV3ZTUnJYTnkwaDlT?=
 =?utf-8?B?Ky9pVDJ2MFdJOVZVelNOeDkxbTBOcEJhaldHaVQwSTlEUlpucUx1SWZZSkVO?=
 =?utf-8?B?WWVaMGdOQXJXSmhwV0RvMHlaUlUzdUo4RHlPWC80V3AxZm41V1RqWEZ2WGN5?=
 =?utf-8?B?OFAxT3RlaG1XUWVZTDV2TWxua0lhNmVicGNRVytaWWVGYWZoTXYzMnNXaUxi?=
 =?utf-8?B?TDI2eFZLaVhIUTYrTmlLN0hrRS9XdzNGYm5aZlZOOUYrdVNWRnYrTUY5SzJj?=
 =?utf-8?B?YVo5ak44Qmdzb3QxNnNCQ1FuZmlKbk5sZGJHZUxzQmJpeUdCNVpqZXFWL2Qz?=
 =?utf-8?B?UVl6dU1ZY1RPWENXNU00bGh0WmNpdm0xYnVYUVMvMk1vanpvZ0FOekl3SldO?=
 =?utf-8?B?b3FWQUhTdG5lZmsvUERQdVN6V1hSU3NXMlpibkwxMzJ2YXgrSkJMN1ljYTJV?=
 =?utf-8?B?SzhJM1lxeUtwTEhKa1JYcy9aNXhxODRlMnRwbnBaUzBBak9SMXEwWm81VkE4?=
 =?utf-8?B?T0pRNUFRdUp5WnpnNko3TllqNTVGaXRjWjZVYmZQK2F3cFNPM3ROT210N1Fl?=
 =?utf-8?B?MUdGaDdSeWNJQkxDR3pWclhHRmRGd1Nxa3dLbVJTK2QxQ1BCaHpMelExQkxS?=
 =?utf-8?B?Zm9xU0p2YmJ4cHFjZCtza3BsMHVOcnpVYzFDbXNER3Irem1zMUNNMVY4KzFW?=
 =?utf-8?B?Nmt6Z2tIUG1GUGdzeUxPalpLZTZvSjh1Lzh6Vkx6MVhPNzR5Z0dpRXhkcU1j?=
 =?utf-8?B?SkIzODh2dis1amJMbGcyT3FWMm1xVWVxczhlUXpSbStxc1EyV0JhNmtLYXRw?=
 =?utf-8?B?Y3o1S091ekc4eTFnNHM3b1lMcDZycjd1SUJHMEI1RmZGTkJNakl1Z05EUEFp?=
 =?utf-8?B?ODE1U2ZxRmQ5WHVqRXluU3NyUUpDRjBYc0hMUzFnQ0dQcDdaZEFKSVJvWTFF?=
 =?utf-8?B?ZTFCRW42K3pzM3hrL21URTZvZnpuVWFaUWtZNXBBRzRUeE45NGhZYlQ4dDR3?=
 =?utf-8?B?OXc4UzE2YnZvNkVTUHYxcFE5M2Y2Q1hZSmdjdGV1VDhRS1BMTmhDNkhkZ3U3?=
 =?utf-8?B?KzMxSExpckJRVit2WGNNTVJzdzdGWFd3dS94YlVLZEQ4Zk52bE9NOURNbGUx?=
 =?utf-8?B?OUU0ZkZ0Qmc3ZjNpMVJ3T2gvVEY3czNYZXBFT3Y1VDFIK0hnR0xPd29SQTU4?=
 =?utf-8?B?UjBvMnFtcmZ6SzJFSWNIMVp4cnh4WVhtL1pRSnJkUzRPb1l2aXVYYmRoZ0Y3?=
 =?utf-8?B?cTFPR3d3N3hGb0NIY2lFSGZGdWtFZW9kcUVOcUU0MFBIblViQnJFY3dzS29K?=
 =?utf-8?B?bnFsSjEreHh1ZytON1VlSHVaaUwrN0lVUWtGWGpTSnRpOHBacTZVbXJibVZJ?=
 =?utf-8?B?WmFRMW1xSGlZWDJZNDBncy80NmJwdlNPRlJ4ME1VbXgwNTVUdzJRZUdqcDJH?=
 =?utf-8?B?SmExNDMwaStCWHE3RWVEWjFuRVIrZCt4WWhydlR3TXZtM2pSN1k4NG5qMFY3?=
 =?utf-8?B?czJqT1ZSaEJBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlZTYkY5QWVtM2IzbzhBdDZsUWF5NkcrSFNFaStxdEtrWC9oMlpHdzBoTm54?=
 =?utf-8?B?SDBqSEZTOGYrblVLNEVTV09IQkU0VFpVcEJPZ2M2SXRGUWovL1NCZXZ1YVhF?=
 =?utf-8?B?andSN0haTW52WkU4OHFTb3RWOU81dklsQTh2SnRTTSsxUDRMTXVlRS9mdTRW?=
 =?utf-8?B?YkoybUFsa0xYUkN0azQxUkVudjhkMFhLbkdiUlV1d2dKUTlTRW52dmdGWDhx?=
 =?utf-8?B?c01tc2lrbjRqcVhjTFczNExHMDcreDFCZHg1Z3JyUUlvMi9zcWRjT0MzdVBC?=
 =?utf-8?B?RGNoQWJkRVNlUExZWjNuNUNCS2NXS2hERDNMdmJwbDA3UTBsd1pOaW80Myt3?=
 =?utf-8?B?VjhRY0V1VFpKVnJPcTJPZDNYT1R4YUhUdlBOTll0dmdmNWRQdDFiQjUzUkM1?=
 =?utf-8?B?bzNJbVBnN1NiVUhqUENMaHVNdFlkVWl3Vk5hN2JHTFYxWVJoM3QwTlo1U3hj?=
 =?utf-8?B?eGUrajhZNU16NEpPWTJzaTJxVjdjaU13ejAxTUV3WVhZNjdhZGZnVzg5VHFK?=
 =?utf-8?B?emh1YlY5Z0p6QnVzSmNKa1RsLzNEWnI5VjladnFsUE0xQThBSWNBSnBReTl0?=
 =?utf-8?B?bjJWRzBTZ2xBQWFFSXpJTGNtbzBtek1sYXhDQXVZUDhid2FEWUs4RjBoZWln?=
 =?utf-8?B?MXIrTCs1Q0ZJTlZIbTVZbzlSOGxOQ0hvWHJvRHFTU3BqOUZjaUY2emkrNy9m?=
 =?utf-8?B?T1ppZTlTZTQxVlVVTjVidUI5ZFFnNjlweXJzeUgzU1ZvL2I2VWdnNytoOGEw?=
 =?utf-8?B?cElNVHUwNmdNWWVpTHdNdmNFalBKR25EV0ttRFlUWHpIa0xpZGlZaDNwUVBS?=
 =?utf-8?B?WnBaRDFuMFBSUngvSVBiUzFhVU1TN1VrbjVoalJqcnFycEpQWTZUVCtOdHZt?=
 =?utf-8?B?Mjl5dXFTMGUrTnVlNmRJaWZIRWR4RmdiKzAwT3EydXI4Z0R0TUFtOGJBTWVw?=
 =?utf-8?B?SUJWRGtISHVZaEVPS1dRLzJiRUtXdk1DbHNhOTgyYjZBNTd0NWF1RCtmdU81?=
 =?utf-8?B?cjNTMXFPVjhlaUVDVk4vblhWSEJ0T3hVcHNmUEFlOVJKZmJTT1hvWThUa2M2?=
 =?utf-8?B?ZXFjNWZweEZ6dXJXQkc3NXdxZ2NxTDUva2h0bE8wUERyQ2pzUExROXZpRER1?=
 =?utf-8?B?UyszVTdacGFxYlJFOTZTRERVMytZL1hDL2V1aUIwMzBwbjZuUzlLRGF0VE8x?=
 =?utf-8?B?QXk2QnFTemtudnVPQzJoaWVnRVNDY2dmZGR4U2Z4cWNnV1BzWk1SaUFaZVRq?=
 =?utf-8?B?YlpWaHc1a3NOMTRnZlkvS0daeUhnaGpVbVZjNWh4ZUtPSEJzbE45UTdUdncx?=
 =?utf-8?B?VFNRWVpLUmZNR1pVamtyS1VBYWFlMVF5UGR0em13VE1LdHpGdW95bmlBZ1ZG?=
 =?utf-8?B?cE1TMEhyaFFoT2dsZkZGVml5em1hS2dBd3RoN3ZKdjNESUsrdmdVWXRjRk9a?=
 =?utf-8?B?dTk3QWNodVhHRVFaNDNXUk5XWWJSek5iVnBDanJ6V3d5Z1FRaS9CRVc4bCtI?=
 =?utf-8?B?akpmM2NYeEcwSmZjRXdSdjd1U1FJbDI1WFRiejZaTXE5QmRBUXhRQ1BBaExn?=
 =?utf-8?B?L1JOWkIvWWUwa2NmUkVzcEZ3KzZMWW1hdzVVRmEvL0diQlczTTc0ZVc4L1V1?=
 =?utf-8?B?c3d2N2dkUkpQVHFPZldVZzBOb0lVK0dTZ2ZTcmc0eENvQzVDZThrdDJQaDFF?=
 =?utf-8?B?M0ZTdEFidG5XdU9vNmRPTm8zaGU3ZTlmMWdJOGlPY0N4ZXdjdmZBZ2ZzZ3Nl?=
 =?utf-8?B?U04zbW93WUdBSTMyRytJTmJ5dUJzWjlva1diZ2V0S1RhSlNVakZrNmpqVGZI?=
 =?utf-8?B?L3VlQ09TbDRIaE9VRWJVMTBYTUVObGgrZS9SYk1UZWk0bEZyK3BKYmlTNXI2?=
 =?utf-8?B?Qk1qWVlmaHlqSmFMZ2pGb2VhMHVOWkszR0dkUitDeHNhUGU4ZGlHY0phKzl1?=
 =?utf-8?B?WHljYm1zTGtONGl2L2p6OVA0eDliWjNBM3lpS1J3U3hGVnRKblJoQzVwVVZh?=
 =?utf-8?B?cU5lQzRDemcvbU5QTDBQNXBPbDJQYzBGaW1wMFVFVUkyeEtZekxINGludDJC?=
 =?utf-8?B?OFVkN1Z2OVlqaW5xdkwyRHkxRHpMM0lpU0QreUV1cjBlbXdRWFhUV1JJNnJm?=
 =?utf-8?B?cFRod3FRdjdHSnVvcU8zeU5VSW1odHBNZnFQTXVVdTVkNUp5TFl3dzAxZ1JQ?=
 =?utf-8?B?M3c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ce9cf0-a3f0-4b85-9ee2-08de340ea074
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 14:57:36.1067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bHsvkwlVjikqDWefEmRwmWyftvJajdDFpuhsf/jMIDM0pkbvP6peEpT0IXLt2ykvyiQheZYQ6fMw6ONbwS0E0zX25v0l5KNJKgXfseFYKF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5289

On 05/12/2025 2:54 pm, Mykola Kvach wrote:
> Hi,
>
> On Fri, Dec 5, 2025 at 3:57 PM Marek Marczykowski-Górecki
> <marmarek@invisiblethingslab.com> wrote:
>> On Fri, Dec 05, 2025 at 03:13:32PM +0200, Mykola Kvach wrote:
>>> From: Mykola Kvach <mykola_kvach@epam.com>
>>>
>>> Using PKG_CHECK_VAR() to obtain SYSTEMD_SLEEP_DIR reintroduced a build-time
>>> dependency on systemd-devel. This breaks --enable-systemd builds that only
>>> need the initscripts.
>>>
>>> Use the same defaulting scheme as other systemd paths: if SYSTEMD_SLEEP_DIR
>>> isn't provided, set it to "$(prefix)/lib/systemd/system-sleep/".
>>>
>>> Fixes: e54a6cd6a1f3 ("systemd: Add hooks to stop/start xen-watchdog on suspend/resume")
>>> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>>> ---
>>> Build in which the regression was detected:
>>> https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/10959608099
>> Requires re-running autoconf, otherwise still fails:
> Thanks for the note. I had assumed the Autoconf-generated files were refreshed
> during release or at merge time, since this updates generated artifacts. If the
> expectation is that contributors regenerate and include them with the patch,
> I will add the updated Autoconf outputs in the next revision of this series.

We regenerate on commit, but that still needs a reminder to remember to
do so.

>
>> https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/12336879267
>>
>> With autoconf:
>> https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/2198372475
>>
>> It's better now, so:
>> Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks for the quick turnaround.  I'll queue this shortly.

