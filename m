Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE72CB6E63
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 19:26:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184517.1506936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlMT-0008A7-5g; Thu, 11 Dec 2025 18:25:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184517.1506936; Thu, 11 Dec 2025 18:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlMT-00088P-2g; Thu, 11 Dec 2025 18:25:57 +0000
Received: by outflank-mailman (input) for mailman id 1184517;
 Thu, 11 Dec 2025 18:25:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cEbC=6R=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vTlMS-00088J-6E
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 18:25:56 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d38f474d-d6be-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 19:25:54 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS0PR03MB7725.namprd03.prod.outlook.com (2603:10b6:8:1f5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Thu, 11 Dec
 2025 18:25:50 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.013; Thu, 11 Dec 2025
 18:25:50 +0000
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
X-Inumbo-ID: d38f474d-d6be-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ES1xgBYfBnCaCp48HN6a4vFvgDhQAArzrR3m5QOQ6Gt0Zjn8w6k5fEHcUE/PHgt3LKiToc1egDPcxcDlw0Q0iBcaOsS9FssxyJ0RditSUAvkNn9Z1QKUaymXrJe8BwS5yXj3aYGkXp7e1P8EqBi0MkxWTYviRFIClNes9wIvcbEqNO1PocrgGyKXzgmFiQDmJb9+JfLWwgKezcfn6YNqt3wocEyJ+3UbofRIucw6ZRsoKvZqxinCOyC2Lh24RjGKKbvVXPRrkR+b8amkE1EqKiNRQpyU9/pIBMXdHcQ2S4CCT5rMoeD54d44miCj4/q5oLuKqQozSxUy9vFBocdEkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Igm2lSavKk9C4uIAnsibMCgx1OuyheeSx595p2OHjI=;
 b=WThrQZMs/tiKqaURku2diAYRHbmBCb0VW+PP0AySgVedMLQXmzs2Dyz2sRVvba60BFr+oIIfUjF9Pyl6t54iok0UpSkseAgKuaCFlDtp+X6ivZIbAoLmj2CYOXnrA0fHO1j3eCpPIF7yjHhAh0CAC4i8U2CVzrQ5qXjmPCZpFHPMhIkVr+MD09oJsuNLLYUB8GbJ2oo9Fpxf6+G7r2y7oDehXOE+AhjzLpzkEx73mATZ/IllJCfYZYLjHedSm0XR/uQeoLuwGHoMcTAOuPIbegJMZuCepW/4CwmL8J2HEeRPPcxlt7tbk2rw+spiLtuXu9V4qQeOeWwXTp/z8sUAmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Igm2lSavKk9C4uIAnsibMCgx1OuyheeSx595p2OHjI=;
 b=TnTzIedtLuhdSBJeOq+enqkn+JQ0zORmMDrsk7GBL9O9Nw2rwA6aQ5iNiJkRmk4+F3z2JHs64tndUqlqkOgiL+qKet4n5ZwwrOC1oxzZMN5ccHjHnoso+KMgllwcZ7ttNCRpvRH14vHVrX2RlAZYZiKHGY62CbnoSxVmumSKgs0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <62ee89f5-b7dc-4168-8041-e5764e74e27f@citrix.com>
Date: Thu, 11 Dec 2025 18:25:46 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "consulting @ bugseng . com"
 <consulting@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] CI/eclair: Rename the eclair-* jobs to *-all and *-amd
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20251211161339.2296433-1-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2512110959140.17367@ubuntu-linux-20-04-desktop>
 <03bbb773-cc02-408f-a01d-bb7f2447e57b@citrix.com>
 <alpine.DEB.2.22.394.2512111005140.17367@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <alpine.DEB.2.22.394.2512111005140.17367@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0098.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS0PR03MB7725:EE_
X-MS-Office365-Filtering-Correlation-Id: f999be4c-23be-41b4-b6c5-08de38e2b64b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDlKdzVVNEV3bDg2NnNDMURuT3M1bkFrNmk4amI0Y0ZFMUYwQjR6a3Q0R3R4?=
 =?utf-8?B?L0EzOVdTZFZSb2NxZExuSk93dXA2SmtvUlBuNW1QYVFOUkcyMHg3TzFxaXcz?=
 =?utf-8?B?TnpMVlhpbEJsUThodlFMTm9Pd05KTnRoUXNLSElvWDNEVlBwZjZTeWlhTmgw?=
 =?utf-8?B?Y2E1M0JrdFRHK1VNb0xQYmNIekdnUjBPUGtHS1Q0WGg0cU1TbWp4S0RTblRH?=
 =?utf-8?B?OWdXNjR3NFM3eXYwYjJVaFRkMUF3Ry9mY2VzbmdETWpCZmRIUzMxS0lmUFFr?=
 =?utf-8?B?c0kxYkdTNjFSQmo2SUo5S3pDY3l3bDZnL1JjcHhFRHRNT0s2T2VRNUk0N3lH?=
 =?utf-8?B?RzJ2K1UzQk9IUFZVVWluU3h2MVpGNmpmN2x3UnNNdm1CUjdmWlJveSthM1FQ?=
 =?utf-8?B?TWZ2cmQ2TzdTdmx6cG04RGx6bXEzS1YvWFRGTXRTb0VUa21DS0cySnphTUZt?=
 =?utf-8?B?R05OUjFCYWNXWGk2c05JSXd6S0pnclAxaHduUFZJUmZ5K0hjTGgxbjJsSCtX?=
 =?utf-8?B?QjNZVHpPUUtJV2NWTlcrS0gxdFNYSnk2bVlMT3BRaDNldmlFYUlhblRsWnRU?=
 =?utf-8?B?VDNZanRBTHZwUTNKMFRoTytHSjVMMmJ6Vk5ma1l0NXhjR1oxNmtVblBKcEt3?=
 =?utf-8?B?T05zVFB5alRKcVVJLzZNNmRYNGNIOFBlNVR5Q0dzZk9kc0cvZkZqSElxRjFw?=
 =?utf-8?B?czhnejAzMVB4UUNHY1JXVzl1WTFSaG1zVExNNnVaOU55dTU0QWl0d2p2K2xP?=
 =?utf-8?B?cHF0WENkMDhuMWpLN05taDhuditERmdkc0dFWk5jVGpYQ0ZFZVRMV2paaW1a?=
 =?utf-8?B?ZGx5WEYxVnJDNHdhYVdEU0d3MVVzeW8zWFl2V3VHSWppVXJzRitSd0xoeWRE?=
 =?utf-8?B?QWVKekdCanFVajl3L3hjSkhudTlhTGFBSGFWd1ZKaXdmcENMOVZzbWNHYUJ4?=
 =?utf-8?B?M0JoT3dHcEdQM01hTGdVMmNTeXRqaWxFb1MwN1ZnZ0pXbEh5ZkNQbkFSK05C?=
 =?utf-8?B?OGFZNXZjSDRlUjVkSDUyZjl5eGo4eXFaS3N4WEU2SUFJRkVUYnV3U1BoUXA5?=
 =?utf-8?B?QnpFSk5oN1NObHdSdkI4ODg4Q1hHQzFVaUtnRHh5Y1J6ZWZCQTFZelNybGVr?=
 =?utf-8?B?Q2NkSk1DcUZNS1R6dllvdVhHWTZ0cUdSb1hORGcvbjRwWUNCSzVEM3dsYVR0?=
 =?utf-8?B?V01QZ1pBUVA0Y2hGNm1pdjJIa3ZjNVJ0LzFFUUhKYnp5N0RvRytMTlFnZXFj?=
 =?utf-8?B?dXBPNVVZUG1lSUpVa3hOcjF5TkhrNC9aOWJhazNDV2hGL2gvQllGZklMUnN2?=
 =?utf-8?B?eHJkVVVpby9SRkRWWm56SXJIdUQwSkhvN2FDTzlZZGlSV3JOYjJzUmVORlBK?=
 =?utf-8?B?bDhidmZabmdRU0tPaEdocUFneStjMUJkQjFBMmFYYUMxVWZ6ODFkWDM0WURh?=
 =?utf-8?B?b0ZXeXAyMVROOW1ERmpzN1B6WGZET3p0SUpwenlpTmpqYXhsUHIyNXJ1MTZl?=
 =?utf-8?B?R1NUMERDWUpDOExOeHFJbFdYNUdDYW40T04vWW1TZW02MnJEWmwzUDJjWUd1?=
 =?utf-8?B?OXZESDJtOFR3bmxDOGNqYXJNYVRWa0NLb25BVStkTHFaQm1jTGt3Z3JoMEZ6?=
 =?utf-8?B?NUlwcnNQV3B6YVA4NmZLUVZZT0tZa3JvQlpmV2hFVkFBcEhTUk16V2tuMGth?=
 =?utf-8?B?Z0s4bng4SmFtTFFUTWRQeE5xa1JZSnlzcTYzbnZ4eXM2SzdmMk43dThRenVH?=
 =?utf-8?B?U1hBRHhiN05vYmFYeENJNFg4VW0wZ1F2MVN3NUVsWElhZFFQZGsxKzJjZXQ5?=
 =?utf-8?B?dTZIRUlXcmZZT1lYWkl5TUp6SXA3K1JRMGErbDFnQWdJckFnRENRM1p2MnJ2?=
 =?utf-8?B?TTUzcFhEQWxDUTlmZysyVEFFbytCeXJPbjAvR1puRDRMYzBYY0k3K3JhRXA2?=
 =?utf-8?Q?mQuD3LTG+YsrToWJiT9fZ3s0uCU5scou?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K09Pdms0UTJ0NCszS3E0ZGhDUHI1Um9GWmpPaVBRc28zbzZHb215aG55QXRa?=
 =?utf-8?B?N1Fnb1JLM1d4NTdUSHVlOUdwb0JyNWJjTWpCcFp1YkRxcS9WUFBkTHpYcGJn?=
 =?utf-8?B?Wk1hVDZGV3g0UEdjNC9ockt5YXozMUthUlVuK2dXQXV3NXlnTkNWLzYySmRY?=
 =?utf-8?B?WUlweDB3cXdrWHdOLzhVQVFyeWpxeEhGeG9Iek1rV1U2QmZSWGFsZmo5RW5v?=
 =?utf-8?B?YjJCTVlON3ZYZDNRNmE0TGRxMXNlWWFQSlI0ditvc2dLNTV6eUQyRHlDZm1V?=
 =?utf-8?B?VlFvL21uN2hNVmJ0TDVkdWVQYzdDdnJtZWZycEZNTlIwS25QQnNCUEN6cUhL?=
 =?utf-8?B?b0c4TWxKeC9kUTM5WkV1WXBSSnpQSUJuSEtJRWdMT2VFNEtlWktKTjJDUjZo?=
 =?utf-8?B?ZXp3MGN0Ym1IaVIrMzNKSXVuRnhRWE51bDIrVlF5cFVsNXRKQm5hT1NNRDQ3?=
 =?utf-8?B?OGdqNUMreDJBOEx2eWx0STVRbUFjSXVUN0RUZUR6M2QxR0JYZUh2cDJ0VkYr?=
 =?utf-8?B?K1VXemlJcHYveDh1MXJuemUvNTM5ZXBmTlFIK1FTeGRzbytpdFBSV3gvaDJl?=
 =?utf-8?B?M3VtQWg5c2w0a0VwZFJ1bDlvc09pald4bS9MNDlaVHN6Znd5dkhsZmpocWps?=
 =?utf-8?B?TmZsQndEUVlIRk9PTkFZWG9IbU5oWmFLa3ZqL1Q3cWR6WStVSTByUG9VaTBO?=
 =?utf-8?B?K1hjaXBnbjRWaXRzdDZuMDQ3eGM5VWNPNktWVDJUNk5kUTE0T3h4UVRkWWEw?=
 =?utf-8?B?NmI1Yk5FWCtRWjVwRjA0MjhQU25CYkdsU0NZRnVlY3V1MEgrY0QwUnZyVkk0?=
 =?utf-8?B?Y3AyR2w3eDdzNGF1THBBbXg2bjhQVUxOUDVvd05IWlR6RHVYSVJxY2R3TGsx?=
 =?utf-8?B?WENiZTh4RTJDaCtkL3k5NUxldTkvZUhnWTFXdWJwVlJWZWpEQ0NLZ1BYVno3?=
 =?utf-8?B?SERzSHV0Y2RKVi94WTMrSmY2MEg4NWtBbkd3TmM1RjV4cE00RFhUVnFQZktv?=
 =?utf-8?B?aUZ6Smh2eEk2Sk1nUHcvTDdmbGZsSTdJZU9ML1V5dk9lMnIveHpRaXNYT3dy?=
 =?utf-8?B?U3FKZldpYXphemc5K2gxaFlzN211Vm5FRjR5VG1mUzF5dVJKMTV4VjFhYTBG?=
 =?utf-8?B?dnYwMFFaN0hPa3lpc29vdEtnVVUxRDRwM0dhVEd3K0RLVUd5eEhkdWttVS9U?=
 =?utf-8?B?b1dzWTdjdFJLRlUzMDRlNC9UUEVMNHRXdnA1NmdLQk1waXJlYWJDWTl4TFdn?=
 =?utf-8?B?a1Z0MXI0VjZkZjVZZVdiRUNWVk9GRGd0eTY4SkpZUmQ1Rlpnc0NDcGZEMmZl?=
 =?utf-8?B?dVVzSGpMTnE4bW5xTUJnZ3pCVXVndGx1VzIyQ0o3OE1lYWd4NDZoZVUwNURL?=
 =?utf-8?B?c0x5dGV6T0p2cG5aUnVHMEluTjBXbGNDYmZCWkZDYVRkVUx1U20yOWpLenhV?=
 =?utf-8?B?MktUUjF1UU91UmRQbE41Rk1nekNVOHp1YTdWZGtjR015QU42NHRrOUtyc3R1?=
 =?utf-8?B?QlVZb3hLSzJkZmRmUWVXRWV3SDNlQWlVUFUybUJYZzBkQ015OXl6S1BqMG5X?=
 =?utf-8?B?N3NSRU50QkIxdlc2b1VTaHRvbXR3Yy9lTk04KzlMNlhzY0NXVGc2S09YenBs?=
 =?utf-8?B?cFkyaGRTQ2NZTnlJczVNLzloNm1RMWF3RnpiWlJXcm01ZXpKTkZKbEZoVk5a?=
 =?utf-8?B?ZjA5VUdYVnpNWldhQlNnOGhBZFRUcWxtd281dEdOQURuZStJMjc3OWd1U3pY?=
 =?utf-8?B?aUlaRng4MmRRUlFZWnlLblhmdFB6Q3oxdVk0R1krb2lSRXFFK2MwUTVMQTRH?=
 =?utf-8?B?a1ROZDlnVXFUQ284RGM2Q3JhK1QvNEtnamJDNFFaQmUrbHNqUW5TRFdONjVi?=
 =?utf-8?B?engzeVVaZks0WWJiUlE4TWtTYTJacFdlQWx4RnJITGFkVUllSmZXZkJ4Yjd2?=
 =?utf-8?B?R2dQVC9mYnprN1VFUUFvUXN1UGw0cHRQaEdBZ2Z2V1ZjUnJOZTRaVzZ1SWZJ?=
 =?utf-8?B?YWpyUGppMURNa2RrZUsrTGJpT1YvZWF4MTY2b3hpTWRPTFlCelNrbE93S3kz?=
 =?utf-8?B?SndZN1pzOWxTOWFpek5Kd0dNU1V2cFR3M1J5NG1wN3VLRmFDTXY1TXplVlA0?=
 =?utf-8?B?YSsyQXh6MzArejVGSlFMdFlUZXpiZnhSV2Fxd053NS9icjZHVTZ1OWNhN3Zw?=
 =?utf-8?B?L0E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f999be4c-23be-41b4-b6c5-08de38e2b64b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 18:25:50.5947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +UMoo8oid+DnTmDaQXEY1Ua6pK0zmpFTuyVIdYvIkkSq0OGJY+9lGSsMLPaBkA5rs2v+/V9iGXyn4nJ87wK7evAnVEtq/49ZZ88C6KcGG8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7725

On 11/12/2025 6:05 pm, Stefano Stabellini wrote:
> On Thu, 11 Dec 2025, Andrew Cooper wrote:
>> On 11/12/2025 5:59 pm, Stefano Stabellini wrote:
>>> On Thu, 11 Dec 2025, Andrew Cooper wrote:
>>>> The *-safety jobs are AMD's configuration specifically, and other
>>>> configurations will likely be different.
>>>>
>>>> Give the un-suffixed job an *-all suffix to make it clearer what they're
>>>> doing.
>>>>
>>>> No functional change.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> This is straightforward:
>>>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>>
>>> I like this and I think we should also rename eclair-x86_64:on-schedule
>>> and eclair-ARM64:on-schedule for extra clarity. For instance:
>>>
>>> eclair-x86_64-allrules:on-schedule
>>> eclair-ARM64-allrules:on-schedule
>>>
>>> It could be in this patch but also in a different patch.
>> Oh, that's easy enough to do.  I'll fold in.
>>
>> Given allrules for that, do we want to make this allcode for clarity?
> I am happy with that, good idea

Ok, I'll fold that in too.

Thanks.

~Andrew

