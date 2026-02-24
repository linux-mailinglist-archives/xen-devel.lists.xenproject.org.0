Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKRuF7/LnWnfSAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 17:03:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A45118980C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 17:03:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240175.1541662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuuru-0003it-53; Tue, 24 Feb 2026 16:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240175.1541662; Tue, 24 Feb 2026 16:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuuru-0003gf-2E; Tue, 24 Feb 2026 16:02:38 +0000
Received: by outflank-mailman (input) for mailman id 1240175;
 Tue, 24 Feb 2026 16:02:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dCRR=A4=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vuurs-0003gZ-AE
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 16:02:36 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b69128f-119a-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 17:02:35 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB7418.namprd03.prod.outlook.com (2603:10b6:806:396::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 16:02:30 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 16:02:30 +0000
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
X-Inumbo-ID: 3b69128f-119a-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JacaHmRQ/Db2M9+++pta7yDWFkjCXx8PoRhzEsOYLjjBJYtk7AIa4hwCs1Tj2Coi3OwIuKhfWF/2M8OMDl3IXKF/y0IRYGWBMUBxl8mOYJHbL+Q1tGpSyfPve8BKuguP67UBNkgtIbjvnO8MQ9Ieg0uIXN9qLmajmVtUbLiD0lBfGeryPgJFG1kt7Ul+baUUIY+ngzvm6pcfqJfR+AghGq7IUMs7DHulGeeLI/B4zNyzTHNrvmm+fuTZB237YfUqzgcIFTrYG8Y3p+4KboVhKSURSFO1iWsUmeBfsyGYd3R7xgtEs7a17OMnoIlnn3X2+eMtMaSOqwY5eY30SRhy6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2iOVr2rKpTPcFlleJfTLbpXf91VeXgKjE/3A2eZ9VZY=;
 b=VxnAUtg30LSYQhzMx0DV/nE+voKW/5LWoo9V1cNXlZo9ZqHQd87yxRBo3OvABO0VYbkOUP9wIOeuaUgZIhzXmrCxH9dZCJv4b1McZDeWb2Eifx31d14kuXN4dhKAxy9gZ0K4MwsDbUZVESbcl0/vjDgnDcVI8klK6TCJi6LTli89i4WIwILVj/YLsqBYTF2bJPxvrqJ4Mm45McVL2pKO1lfcOPO5skpKp728EsIWMEWpH0JOyx90iQpzc7UMNVlLXa45irdpN5Tyzj/dWyOs4Pm/4TqzInO14OQbR/iQbi8A0qwJwMTpjZnQy8Px8e3Ra3Sx43ejlCiv9PzKr5ZB8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2iOVr2rKpTPcFlleJfTLbpXf91VeXgKjE/3A2eZ9VZY=;
 b=RvKENYjKS/Slv2L0orwwEWNITZ+6Zur5vmCSSz8WaQtag0p91BdsBuFU2pQWLVR4U8gsfzCS7NC86pLHA8Oqp7Zpoqx7W9JP5iqvEBXhQH/s1Sj95nwQzeWDGWau9G6vqenEFJ0IG169hH8h3UM6yBy6Xime5AIMU3Y+EbD4lf0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f8a0d742-18f1-48bd-841b-1943fcb632d5@citrix.com>
Date: Tue, 24 Feb 2026 16:02:26 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH 2/2] xen/arm: Simplify type handling for SMCCC
 declarations
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260224124558.3675278-1-andrew.cooper3@citrix.com>
 <20260224124558.3675278-3-andrew.cooper3@citrix.com>
 <261af40e-db79-477a-b67d-1af7428782d4@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <261af40e-db79-477a-b67d-1af7428782d4@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0467.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::22) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB7418:EE_
X-MS-Office365-Filtering-Correlation-Id: ea04cee7-acd2-4462-6fc7-08de73be1d2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MjdKRTl2SUR5RmhwKzd2dlBQSG56VXpjWXVxb3pnU1hXYUlLQnJJYjZwVFFV?=
 =?utf-8?B?Y28yMXhXSnQrZC83enhkdndheVVlYjd5UXQ0YVNUZFJ2NkZQRkhsYmJydHVL?=
 =?utf-8?B?UitZK09tMWQ2WnNOanNON3hFVGhRT1lYcE1DbjZNZnVXN3dPU2NEY3h5SlNL?=
 =?utf-8?B?WHg2UDlDdUN3SFVPUUFIbDBxZTNiditocTkyRURqVlJrNG1FalRkNkx4akpi?=
 =?utf-8?B?ZytQOHJWSktValhXQ3BrYlNYcVc5SHpBUTlKMXpFTHhnZ1dyME9JUEZnY0dN?=
 =?utf-8?B?cXIvbmdYYmdaQmJublp4Yk9kTHVkL1VxQ1F1aGthRHNNc3A3VVl6QitObFVY?=
 =?utf-8?B?STVRNDNETFo5dUpDcXNCbDVFZWlKd2pFbERLVWlTVVB2Q0I0YTd5ZzRoSFJq?=
 =?utf-8?B?c0M3Ym9qVFpDcUE1Y0puZm9PVU0rY3lzVUJmQWRXVkdndUlSQ2N6YWl3OEpr?=
 =?utf-8?B?UjdRTjNFN2VXeERKVThkUGRlSVJUU0RUV1N1TTB6Y3lYRDEranl1SlFnZy9x?=
 =?utf-8?B?QWMzUkM0RWR5M1d5UnVDdW4rSGhTbVlMQTJEdXc4dHQ1NEUzS1l6REJzeDhl?=
 =?utf-8?B?MiszU2pyZUQ4c1ZuQ1N2cktyUllHek1DT0NIb3c1NHFkd08raW1Rak1adjRs?=
 =?utf-8?B?amRRbG15NlJ2ZndabFNKUHZqaHVrY2lCRFdWODBMb0R1akFwMXJvdHQ3M3lL?=
 =?utf-8?B?c1ZMZFZ1TlpnbXR5S0NUbGh0eEhKc0JySVZjczNqZHdWSFNTZDRYaXFhOHBH?=
 =?utf-8?B?SnNTNDhMU0lDRFpONDU4bHZZcWVEd2k3NWpFbW96MklOUWF4R2RCQWorTDJi?=
 =?utf-8?B?UW5zSU9oeVF4NUVRSm1WeTVhaXkxUHZvNkRmZnhNOEx2M2tPb0taaWpIVWdh?=
 =?utf-8?B?Um5ja3lTTUV1VElvaFVJSXRxTUpNSEJoY2NQVG14QWRSWnVvUm9lcEthSGxR?=
 =?utf-8?B?b3E1czBZMG40L2ZyZkVXSXVKNlJ5SzhnWGVnNFR5NktmcStYQXBheVRVeElq?=
 =?utf-8?B?M2RTR2RUQ3A4Z3F0ajRmWG5nVkt3U00yNGgzcVZnUDBmVWY4eW53UTFZRU51?=
 =?utf-8?B?SFN2bXZ0dG90TGMveGdPTktweDExLy9RTGxNOWZFdFMxR3NtRDVpc0JuNCsr?=
 =?utf-8?B?cFAzNnl6V3VsalRNRkppaW9PL0hzK1c5akFlSnk0OEJqZ2M5ajBhcXRFN1M3?=
 =?utf-8?B?OXVHWmRhdEN1STd0eWQ4bEQwL1JPOXZ6ajEwRG1kM3ZQS2liTGc1ajZCaWJ1?=
 =?utf-8?B?OEYxUTFiTjBBaS8wc2YyeHVKZjAyN0hJdjRyYXhqbkZzVHUvWWtuRHRIM3RC?=
 =?utf-8?B?eTEzcXdodDg2ajFheENVYjR3UDQ4dE93WVBHdjh2dlpmeEkyMkZNL0VVQnVh?=
 =?utf-8?B?cWhReWRNbXI2eEEvNlA3V2h0ZDBNdC9SRlp4V2hjQzQ4bmRLNWZwdGdZWUJP?=
 =?utf-8?B?enBKQUVrZU91RjFFN3MrNno3R3RUTVYxUXpZRTY0RzErN0hEcXh2bDNST0ow?=
 =?utf-8?B?NFBDZWg4aVgyc3dpT0dKVGUzc1hNT0VKNC8rb0dhZ3FZaDJUVHFUUm5CQnpU?=
 =?utf-8?B?S2NKN0RsN3BiYng1SUxPVHhNZm5UMmxxZUY4dVc4N24zT2RSdFpZVzVRWGtX?=
 =?utf-8?B?cmc0dEFlZXZxc3pneWsxdFpmaFNZb1ZYT3g0TTIySEYycmQ2RVZ0UE44aWc2?=
 =?utf-8?B?Tk5uR2w5YnBSQUR6dmwxbmVCaTdzMnJ3cHJqdmlkOW54WnVJTWtNUzlsOGhV?=
 =?utf-8?B?V0RBRE11VG5DL1JjV0JVNkkyY3Rqbi9Ecng3bEQ4NVlpY1g5SmU5NVFFL0hl?=
 =?utf-8?B?RlZ6M0Q1OFVNM0pXOEpQK0tUSnF5ODIwbzhuRmc4N2lvUUhONGxiUjBTSzNu?=
 =?utf-8?B?MGtiemJPNVd2cUt2a2s3eEdxZE90RkpDcXg1c1FDSmtNRWdVR3dobGJqYUR2?=
 =?utf-8?B?ZFg5aFJGS0tFNENlV1ZDM2VhUGl2Z1g1em0vMWlzQzhPQXJaMm9JL2ZIZ01J?=
 =?utf-8?B?bGMyUWp0UXR2NU5XVnY3YmlKS1laT3ZWUUpvTklNSlpBU01HMzdNaVg3TmVF?=
 =?utf-8?B?MGxZSUFzMjM5b2t4a0lJSXQrL0ZxdHJTWjl4UVdTRktFakFRUXFzd2krSndu?=
 =?utf-8?Q?cO0E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3JLYi84SmppU0lCZ2Eyd0gxOXdRU1c1Uk9hbUhybVFia1I0MkwvNTFTcUVt?=
 =?utf-8?B?TncrRmJ1Vm9vWDU0TVNQbHRMS1I2VWpUQ0JURGxwVE5DTVhEcG5FcXNJMVR6?=
 =?utf-8?B?NUlRSFpVYkNSaFY1Ym5Od2JtN01aTzNBR3JZYnEvYzdGTm4xNC9JWEpoYktK?=
 =?utf-8?B?dUlsMTZJR3Z5VzVRemZkdEV1b0pnRmIvcWRpSHVzZzd5Wlp1NUZuM1RqY3gz?=
 =?utf-8?B?MWdnTC9tM3dqZ1pDQk9JcTY1YVZ4eExrdW1PRGZEYXNzOHIxM2xPRDFqQ0RV?=
 =?utf-8?B?WTAxbnF2U3Z2M0o1UWNINjc2K2Yxd3ppYUxoWUpXL0N4TVBRWDFoS0cyU2tz?=
 =?utf-8?B?ZGQ4NE03ZGZxbjZMSXIxN2tOblBvZHhyRjVmakE4bWtOdkw1SGNuME9zL2Z3?=
 =?utf-8?B?WkxlZnRoR2FKbVkwN1pUNzdWN3FDb1FrNjh0bm1CQ0tkWHFNeFZMWXYvNTVD?=
 =?utf-8?B?RDYvQnNEZ2FhUXVFSUp1cmlIcktiMXEvcDBiN0dSSkExdm15cFNxRUFBZUI4?=
 =?utf-8?B?aDc0Y3JxTm5NRXJFTDVKaFFTUFd4TzZuU0xhOElPZ09tRWRiaXY0cVZXQ1lN?=
 =?utf-8?B?UHBOdjZJM1RmUnRGVi9ySWhlaDhwZUN5Q1E1WjdRb0wxOHJRMWwxMTRsVFNR?=
 =?utf-8?B?KzFJYVNhREJVMVRkL2hRRGNKSWg2b2tDdFI5Ym5pVVRyR3ZiS1ZISkMyT3Rw?=
 =?utf-8?B?cm91ZlhyanF6WTNOVXV4eDg1eEhjd2VlZUZmaGZQd2hIOE8rYUZ5UWZIOWhX?=
 =?utf-8?B?Ujh0YmRLSllvV1lzVVRVSUdCN0ErRTF5TmJQdTErL2pUVllJRnZoWWJqS2hh?=
 =?utf-8?B?cGJHSENKTzIwNFNLa3FZYjArSGVSU3lWWlBzUVJjT25qQXpVV2JYVlVEQzFE?=
 =?utf-8?B?di9vZkJOdFNTVVdVWWJGUzdyNTR0a2xJZ2dRL1kraC9maERnZU9XKzdsRG9o?=
 =?utf-8?B?YStmWGUwS2xqRTZaUUN0cU9ranZERU03QkF0OStrdU5oZnkxMHRFRytxK2pt?=
 =?utf-8?B?L1NTak5XSCtoSWRNTXJIaXAyVVdqUVBGMU1SVUZKTlAwVlk3UDkzLzBJK2Na?=
 =?utf-8?B?NmNiUHgxN1BGalkvYVFrMGpmaW5kZXcwT1ZZSWc3OE1nQkxVR2laRnVpSzNn?=
 =?utf-8?B?Vm1Kenc0anFKcFlESWZQQzEwSkZWOWJKKzVxMkZFUDZIMytYSUtSR0lEQWlS?=
 =?utf-8?B?emxpVGpyNGNaUC9kZTYxVURiMVdNaTVoaWpJKzl4TFRqSUx6ejdhNTQzMGty?=
 =?utf-8?B?U0VSVCtoOEFPbUlWNkloeUVXRHpJVTNFc2FEV2dna2pHNFIyWnJhbXM1b29m?=
 =?utf-8?B?WFc4SEpwN2lPajNpWUY1MGsxM2I2VEhaajk3ZXlMTXdLdUxmSXZ1azJHbkRB?=
 =?utf-8?B?cWVRd2d2eURkV2RhYnZ2UkxIa0Q2L3dGdGgzS0NlUHc3bk5yYW1maG9zSnND?=
 =?utf-8?B?N3pvNlh4QjZCQTIwOThlTkxiWTJhWW1qdjZMSWVJZG9pRTNQTjQ2Z1FxL1ZZ?=
 =?utf-8?B?TitnQmRxVjBTalVPVHl6TWs4ejRJazc5S1QvanliNXduQytpN0wwSkpMbFpw?=
 =?utf-8?B?K2sweGFnYXYxNmZRNzF4Y0kwUTRWV3d2VXFZSkY3R2tQR0gva1ljSnE3S3ZX?=
 =?utf-8?B?dmFkOVZOUm5LWTJxTmtLaWZyNzB6b0xrd0pScS9JRzdSdVY3MkI5RWZGOUlt?=
 =?utf-8?B?NnQ2cGlUa0hGUURKODY5VExnTUVlNEkyUjlKS3hpTGZoS2FzNE9mR21ORGMv?=
 =?utf-8?B?OUJvV25wY3Q1c2ZJblFMLzRjRkdBZjhPd2FQbzBmTVlVSHZDYUV2NThQdVRF?=
 =?utf-8?B?T0gxcFJTUDduazZtRDNJMHBBK2traXhGb01hT3RxbTJ4bnNncDQ4VUFDRE85?=
 =?utf-8?B?bDlybitONDZlS0VSdDMyajdheXhHRnMvTHFIR05uMjZ0Vk5lNFdRZ0kwTGJm?=
 =?utf-8?B?S3BPY3dzMjZDNUM4c3ZOMnorUVNMKzlVTjYzQUJKL1daVXA0QTB3a2hVYk80?=
 =?utf-8?B?Zmx3NnpvOXp6UWRmMklKczllNXl0d3FKL2czcTR6aHRXKzEvanZnQ0FEbElO?=
 =?utf-8?B?ZDcyM2lRSlZtNlhKeHVKSDBHUmQrbEdTcHNJUkZlNW5LRmwwazd0clNBWUpu?=
 =?utf-8?B?L2JEdFBWU0tmRGpUL1VPN2w3eU9oNHZzWnRzNk1iNi8xV2tENk5iQ3dIeVZH?=
 =?utf-8?B?aytlT25LdHREdDE2RURXWmRaS1pUWVNXL2V0aGFzYVE2QVpuQk5vMnFRbklt?=
 =?utf-8?B?b2NFMTN2dGwwaE5ybWoyQzFnWGxacm8yVk0xbFNoMGhud1MwWlk1RGlCbHN0?=
 =?utf-8?B?cjdaYm9Ka3ROR0NmM3V0M1hFMTVWMVByMnFrTEo2bTM5bkxkR3B2Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea04cee7-acd2-4462-6fc7-08de73be1d2b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:02:30.4394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M6dEM5xttLONWD2I/OAcsoTlIft6R9wipfiVXiCK6kU4rhHyAR+qzihU1uNzTLi+s+SiF4WQNL4EEv8gz8HSN0IxS5fC52k4K5F4f2QeOq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7418
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.18 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[xen.org:query timed out];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,xen.org:email,arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 0A45118980C
X-Rspamd-Action: no action

On 24/02/2026 2:18 pm, Orzel, Michal wrote:
>
> On 24/02/2026 13:45, Andrew Cooper wrote:
>> There's no use creating a typed copy of a macro argument, simply to use it to
>> create a second typed copy.  Remove the indirection, halving the number of
>> local variables created in scope.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Julien Grall <julien@xen.org>
>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>> CC: Michal Orzel <michal.orzel@amd.com>
>>
>> This also makes them clearly elliglbe for converstion to auto, where they
>> weren't before (typeof expression not being that of the RHS).
>> ---
>>  xen/arch/arm/include/asm/smccc.h | 21 +++++++--------------
>>  1 file changed, 7 insertions(+), 14 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
>> index 347c4526d12a..7e90b0b56550 100644
>> --- a/xen/arch/arm/include/asm/smccc.h
>> +++ b/xen/arch/arm/include/asm/smccc.h
>> @@ -113,39 +113,32 @@ struct arm_smccc_res {
>>      register unsigned long  arg0 ASM_REG(0) = (uint32_t)(a0)
>>  
>>  #define __declare_arg_1(a0, a1, res)                        \
>> -    typeof(a1) __a1 = (a1);                                 \
>>      __declare_arg_0(a0, res);                               \
>> -    register typeof(a1)     arg1 ASM_REG(1) = __a1
>> +    register typeof(a1)     arg1 ASM_REG(1) = a1
>>  
>>  #define __declare_arg_2(a0, a1, a2, res)                    \
>> -    typeof(a1) __a1 = (a1);                                 \
>>      __declare_arg_1(a0, a1, res);                           \
>> -    register typeof(a2)     arg2 ASM_REG(2) = __a2
>> +    register typeof(a2)     arg2 ASM_REG(2) = a2
> Here you fix the issue introduced in patch 1/2 :) You drop typeof(a1) and
> replace it with correct typeof(a2).
>
> Provided this patch is rebased on fixed 1/2:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks.  Sadly, ECLAIR rejects this change.  I need to retain the
brackets around the macro parameter after move, so this kind of
incremental diff:

> @@ -114,7 +114,7 @@ struct arm_smccc_res {
>  
>  #define __declare_arg_1(a0, a1, res)                        \
>      __declare_arg_0(a0, res);                               \
> -    register typeof(a1)     arg1 ASM_REG(1) = a1
> +    register typeof(a1)     arg1 ASM_REG(1) = (a1)
>  
>  #define __declare_arg_2(a0, a1, a2, res)                    \
>      __declare_arg_1(a0, a1, res);                           \

~Andrew

