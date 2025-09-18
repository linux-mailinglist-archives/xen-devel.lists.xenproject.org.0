Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF8AB862D6
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 19:14:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126377.1467966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzICM-0008Np-Pq; Thu, 18 Sep 2025 17:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126377.1467966; Thu, 18 Sep 2025 17:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzICM-0008MY-Lp; Thu, 18 Sep 2025 17:13:34 +0000
Received: by outflank-mailman (input) for mailman id 1126377;
 Thu, 18 Sep 2025 17:13:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R72V=35=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uzICL-0008MS-CQ
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 17:13:33 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccff7210-94b2-11f0-9d14-b5c5bf9af7f9;
 Thu, 18 Sep 2025 19:13:31 +0200 (CEST)
Received: from PAVPR03MB8921.eurprd03.prod.outlook.com (2603:10a6:102:322::9)
 by VI0PR03MB10420.eurprd03.prod.outlook.com (2603:10a6:800:20a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 17:13:29 +0000
Received: from PAVPR03MB8921.eurprd03.prod.outlook.com
 ([fe80::1fbe:d673:80a7:6ebd]) by PAVPR03MB8921.eurprd03.prod.outlook.com
 ([fe80::1fbe:d673:80a7:6ebd%5]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 17:13:29 +0000
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
X-Inumbo-ID: ccff7210-94b2-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vngOfbvKJzjzjowqTqgL/HQHI/pgEZUsOqCXbhPCfm8ASYBfJSQGUI+X5cMZdDwQ27+nwNM1p5jyj+vpmRxDUrcpm2p6DAHY/aEd9i0PgVIbe9xPBOGC/MBppEml20TYRNfaw89z5/HFiA9h3cBpd0Iep0FNn+6t8twwfzisxpdFbDZSzHt9t059oqdRX4ZQR75pHqx/+QIWz2K7sLB1Q29dPBv5HtI0n84kAyBq/Skgdiu14W1t9pU0dGkYgKYO4H+E6r9aLgXfiRfce0TYvBUbsOuLRW5X5+b41hyOMQXgi13P9irMOVRchnvQ1/XOEAxak0IhKZFqo2WjT/Mbmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZL8IXhLsjCs0n4Fvevruujiq59sJrvq4hPUYosNbT0Q=;
 b=MqlU9UTvCUMwOc6NRnfQxhms2QWtZyi6ew9WRNg9BlEBsrFO0MpW01hIOchQEsE5bUqgPNIqF2hgadbhFTDNqF74fRCjUdD8ZCmuYkN3YczZYmf2rYvQMaOpfyohJVcm/2yCJd+cN9mrbUs64oxLZViEo6jYHMu6qzVrecv3ukCkIPsqVjRQPooo10C8r2JdjatE67tBhcKgSqQoa7HPNGALPZq/QHFVlNT8b3XBomLZ8noJr/o8O3BXxb/l2Y1C0sjn0HkTZpJwzlWyuy7+I6RUAU+ow/U9BqzP5kploF6hLEIPowgRHHh/hZvco4qDSry3ncInpBH+GPJheDRzgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZL8IXhLsjCs0n4Fvevruujiq59sJrvq4hPUYosNbT0Q=;
 b=PAhXSPGebRWMjaSMoNsXmLwjJo4r+JoGpsDiiyridpMlCml5+njS/7bRzfn4Zd4mFTQ15GLJzpQ/45pDRiuJNCSX8dJFWdTgv1a/J6TpU7nWQ9KZT1519X1Me2E25yAnEpNNqitsgadKrC8QPmc1+bmoKorNv/OlQRQ5YqhaoC5Oe7vQcRzukmD/85O1l12A25Q7QKQDWFu8B20zhq9tHiqnpPq78gmQGajPvXWZEV6pM0Ky+/Jm/aRYkZoqF8Sc2vW+O/AF5IZ/vPxOwifMi/IYWXDjlJmVmXSsPaWRM5tWtgxRqZ+OAurMbnOMzNIjBuIP2D5Dqk76DmzymrAJPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <323babfe-2fe4-45ef-b3f7-fe15739c87da@epam.com>
Date: Thu, 18 Sep 2025 20:13:27 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v3] x86: make Viridian support optional
To: Jan Beulich <jbeulich@suse.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250916134114.2214104-1-grygorii_strashko@epam.com>
 <d6df84f5-862b-48af-8dea-3e15c029c433@epam.com>
 <d23f9b58-8da2-43e7-b8cc-351ee6d8c849@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <d23f9b58-8da2-43e7-b8cc-351ee6d8c849@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::14) To PAVPR03MB8921.eurprd03.prod.outlook.com
 (2603:10a6:102:322::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAVPR03MB8921:EE_|VI0PR03MB10420:EE_
X-MS-Office365-Filtering-Correlation-Id: f1b79d69-aa08-4414-6967-08ddf6d6afb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZGd0UXB5aTFqeGFLcCt3UnUxU3o1MURuSVMwZk9PTlhXVDRwMjVYNkhvNHNK?=
 =?utf-8?B?ak84Vys1L2dRSGZSTmxsTGMxMFdIdlZITEdDYTRyaWdwZ1Z3SDFxM2JONUVa?=
 =?utf-8?B?d3BDWHdjZTMvZWtWMmdLbXVCU0k1ZHdzM1Vmb3JUSjB4d2J0NHZ3UlhBcEpQ?=
 =?utf-8?B?MEppYS9aVXcyNTVXTVVyTjdkMGUyOFdVTTF4bng5MlNDcG5WdWduaU1tNzVM?=
 =?utf-8?B?UDVyRGhoMlZvRENyOTNYNEh5RlJBY1QrY1k3NVREM2ZyeGN6dWpPeUZZVGJT?=
 =?utf-8?B?MmxjbE82VnZMNGFqaTdabmVReWN0azhHakxoZldJWVZ0UGp1a3ZKdG5kNXhh?=
 =?utf-8?B?U1NCMDhORXUvV2Q1YmI1QWpiT3ZkZjd3dXJyVGJydjlhMHIwRkNUTkhFV3Bl?=
 =?utf-8?B?N2JsT3BrQVNsUkxnWGlpWTBGcVM4NERxVjdUU1pzNm5ES2lPVEdzZ0F6M1pZ?=
 =?utf-8?B?NGt0ZFpJN3R2OUdWbk4xSEsyUXZPTStBUXpKUkozZ0pySTByQU1PbUN1ZW1q?=
 =?utf-8?B?L1NTYm1PMzJ2RDJGMUtTMDNUQ2tTbWpsNlVjMjNRYTNNK2dmUzRvZEJQOEdk?=
 =?utf-8?B?REtJaHo2R1RyZGgra0swcHE0dEorMnhqSGx5TWhvUmVweSt0dVo3a3UzRjNz?=
 =?utf-8?B?M1NqOG01TitTUEIzMzZiSWtOMmt5cXJZemVKSzlxYi9KZkUwTEdTamhiK29q?=
 =?utf-8?B?Ym1xeC9OZFdkeTRaeVQ0cWxkd0hLd3dsa2dvTVp5b2RBQ2czU2I0ZlhuYVdM?=
 =?utf-8?B?Z0dJU3ZydVdQbThVdDhPOUZ6NVh0anNRV0NLd2NnbTBVT0hTdlllQlFNL1Fr?=
 =?utf-8?B?a1N6dGc1KzgzM1RwS1cyZGhxMjRweDZXSk1VZS9vVVJxQUY5VFRab1FOc2Rv?=
 =?utf-8?B?U0lkcldBbGZDMXp3b0RHVFdXODZCL0JrOFBDYS9FbGhnaHJySnBQY2RZaGZD?=
 =?utf-8?B?dEl1OXdNZkR3V1FWZ0c1WFlTdXY0ZEZLa1dIQjBWckpETExuMS9KV2d2bi9k?=
 =?utf-8?B?R3Q5Sm9BY1J3NHU1NDllQW1za3JMQUZFRVZwRG9qdkN5VTI3MjNNUGlqb3pO?=
 =?utf-8?B?ZHVCUHF3NnZUeHF1aFZhb1lPYUJPNWY5N1VaWGtZd2U4Y0J3ei80TDN0cDdW?=
 =?utf-8?B?M2FLUlY3QVpFTjRXbXFBaFRtNCtIazludmlDWDlBUU1JcldnSVlCMFJjbjZY?=
 =?utf-8?B?K2xEZUdTaTFJTStyV1pVK2luUGVuRTZUeEtCYlRDUUlTKytVTmNUT1NMOUli?=
 =?utf-8?B?aGlPQnE4RlFSZ0p3RStmQ21nMHRZOEU4LzNpMXM5eDJBQlJNaklWK0pjMDIy?=
 =?utf-8?B?UXlPNEdMcEJrUlVUN083eUxWTmJIMWJjbUEwdE5wT1E1eWtPNlY5SWd4bTQ3?=
 =?utf-8?B?NHNtM3AxSlB5S0t5TWpoRFM5YW5kNllwUXB2UVgvUnFIVlZVZFgwdFQ0Tkdt?=
 =?utf-8?B?UmZNRXV0YXNGRXpNRHZEQzgzQlMwclFYcEdzbUlDa1BteG5wTjlHSDh4RDhw?=
 =?utf-8?B?RWgrVXhuVUtsZ1RDSVpCbjZ2ZUFUMkVpemd6UXkzTnRuOWY2dndxNFRFbnBj?=
 =?utf-8?B?ci9iNHNBTEFxWUpxTmN5SFFuMGtLZy9OVkdTbVUwMTc0UDR0NVI0YTQrdHdO?=
 =?utf-8?B?Y1B1UzdUQ0tUbUMzL0FRanplV3RDeXVHUXNHS3ljMkRJS1NhcS93MHg2Z0cv?=
 =?utf-8?B?bUg0dEp0OVhINlA5MGhpR1NWMmZYM2NiNzVLbS9KME1tRWF6d3FEUTh5azJL?=
 =?utf-8?B?VmM4R1Ewb0JQRlBETjJsVm1zcElNMTF2bm80VkFWK2xSYXFaSDlna2ZmVHl3?=
 =?utf-8?B?L1gvU2ZtUzVkbXQ1Z3Y0ZGdZZlJ5V2dnSW5Rd0hzMzk2YWdvTFlCZDBRckpm?=
 =?utf-8?B?ZCtkODhsT0NjNlZQNExmb25GcU9RcXMyOTZuVnZVL05odTJvbGVKODF4amNC?=
 =?utf-8?Q?dLfnJJDQPhg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8921.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXJSK2djajh2RkQxZGVUTW1pczdGRnE2Z3U4emdaQlhtWmxQUXpjbmlYdytQ?=
 =?utf-8?B?OXRZVjhQUVlRZDVhOWJuQWFnNWZ3dXVjTlhlZjhPUS84NnZDYjNaaGx1YVVK?=
 =?utf-8?B?cHlOZzdsT2x0N1UremI5b1E0T3cwYmxoVUdkU1dCQWY2b2lBVGV3RHVOY2RD?=
 =?utf-8?B?UUVBeVE3M1QrVVUxb3NZa2ZQeHo2a2xSaUhDSVB4V0dCei9tNjZOUW02UGVv?=
 =?utf-8?B?QmVMTHRUNTNINlZWeHlwYVFXM0lLTFBGRGg2a0hQY1BIRi9PRjlNQWIrUHZG?=
 =?utf-8?B?eElUNFVNYlNmTndkaDJGK0h3UWdlSFdHcWhhcThDaU8rdmhIeFdlR091c3Fk?=
 =?utf-8?B?Y2d5clp5VGU1MlVuYmV1eEhsYzlvUHVkeERlOVAzR3pzbStYbzdqQkRFcXhF?=
 =?utf-8?B?RGxqSlljVUp0WDZaamo2ZDRHOWJBQjh2S1RBY1hvN0wyd2NoUUlNUVpUVEM1?=
 =?utf-8?B?aHhGK0xQaDhicENVUHZub2VUdStFbWI4akFKY1VYNmt4bXhlWGpnVXVNcFBq?=
 =?utf-8?B?MmdmM2NzRW1ReFBiSzk0UlBhdU41Q0JsZ0dBWkgrbTlRUnF1UVoyakFhTGhY?=
 =?utf-8?B?NHBzVjVyY093emVWK3U1bXJTUkQyc2lPdzh6T3ZNNXg5ZEt6N09uQjlwTm5s?=
 =?utf-8?B?NzNXUDRwVmg2ZWR1S2wvM0YvVU5CZkpRcVZ6RHFwY1NDSUJGUG9QSlBHVWFD?=
 =?utf-8?B?c2ljc3ZPOGJ1b24wcVJSa2xBdnBtTFZ4MEtJWTRMV1JKUzAyTExmaVZENE0w?=
 =?utf-8?B?L3FxeFFabk04dHFVL0VHd1dWM2RDQWsyaVVRYkhFUnExdmI0b0VvenRwckly?=
 =?utf-8?B?NnhVcXlOd3ZRUmFrQkI1clNMYTZyN2Y3SStsRzQxK1NieWRWTHBWamN4SDJU?=
 =?utf-8?B?NGJkYkVta09pQXNuWGVob0lkMXp5NFpCdnVLNEhpWjgxZXhRSDdzNHFDY2xw?=
 =?utf-8?B?TldWREwxYm5ua3hkMUFKQzhITmwrc1pmd0ZkN0h3MWZ0cWV0ZXc5cWxtMDdz?=
 =?utf-8?B?Ukg1K25DRGF5MUk5bjdxcG1YWEJaeUx0a3dKTExadk1IOGsvWWh2ejdGTlJU?=
 =?utf-8?B?RlF2Tzg3T3lwN2dnTnFvazZRVXBGZ08zS0luUElEd0FuUnVpS2pJSFp5MXRx?=
 =?utf-8?B?WlJvcXkwc2swdUxRczYrNEN0dFlEU2dQZE92SkVMTW9sMVdYY0pSMXRYTlBw?=
 =?utf-8?B?TWlZbTJWWWZVVVRBTm5lYy9ZeFFvMjgyYmo1V0dHTUlJdmI1OEY5eXArNUJC?=
 =?utf-8?B?UmhGUEZYS2FWY2NXa3pFNmVjZkJtcTBXdGs2TEd2dWcyeUFESjA5eXUxQ1Vs?=
 =?utf-8?B?R0h6bksyNFlNTUxRcVIxOXMrSHQ0N1l0bVEzUTdmS3JZc0FLTXpEek0yM2hp?=
 =?utf-8?B?UU1SQndmWUFJb1U2MEgrSURWeEhxb0t3NTVRL2E4YVRBTy8zT0lnQ2VSakkv?=
 =?utf-8?B?czNQYzJEejZ5U1ZaRlZRYnVwNWNOaEJCQXorRitTYTExZWlGNkQ0dDZGWWlr?=
 =?utf-8?B?QnREVWQ4bGhxR3lyb3YvTURYZndFeHJrLzNtTHcyN1JIOVM4aHhmMnJqVVNP?=
 =?utf-8?B?bmRzUmgvM1lRaEw1dGUrTG04WmhMK2creDVQZFVQdHNJY0o5OXgrclJCdFdB?=
 =?utf-8?B?QXBkY29qY2NzeFUxQTJ3cEJ0WWM5Z2hWWkhnSlhHNXlkN2h2R29xQ1VUTmp4?=
 =?utf-8?B?aEJ0M2FQM2t3K3lQUTA1cEFOWWdyMUt2aGU3dWt5Y1FubmJaRkE1MTZMVWZZ?=
 =?utf-8?B?eDdXZk1GUkdzd3VGQnhCTjVpcklFQVVrL3FlWUdFRHVtWWgxMXJGcmZGYnV0?=
 =?utf-8?B?V2FzVTg0aFIxZlN6blZBWkoxMkJ0Yk4xVnVHQjY2RjRQd0J1d3BVSFhLVmtw?=
 =?utf-8?B?VHhlZnhEQ1loUEY2L0k4eXFFRmEzMWpSSzFJVUx6Q0ZWVHhlZUFTSVNjSUFx?=
 =?utf-8?B?SXlVeHRpT2J0VFdOckN5YzYzd01wU1Q3R0ppRU1kODVsWUpNQ2NNNlBkWEZr?=
 =?utf-8?B?cVM4UUtzODZpb25vNjhKQ1VseG1JalFwbTZ4VGFFcXVVZS96RGJSbWdLWktt?=
 =?utf-8?B?UXRwaU02TEpsaEtZWlJuK3JTbHNSQVFNQUxaUzlRUG94c21McmdqQUcrNlht?=
 =?utf-8?B?RWNqN2lNMkpGcWs1aiswUDZuQmhmRzJpZmJNZHhvQmlJN0RIeEFtckdTNDVh?=
 =?utf-8?B?TlE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b79d69-aa08-4414-6967-08ddf6d6afb5
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8921.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 17:13:28.9383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JABZevCQvfJ7a6ZsliVRdj2aPHJPy7mqbhVlh4DfujQMTQmMDN5efvVntIV+VNzJpWQuWXJNT6FvOfKdvJOOZOLkKAGHnUdcUId7JXQYXe0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10420



On 18.09.25 18:19, Jan Beulich wrote:
> On 18.09.2025 17:15, Grygorii Strashko wrote:
>> On 16.09.25 16:41, Grygorii Strashko wrote:
>>> --- a/xen/arch/x86/hvm/Kconfig
>>> +++ b/xen/arch/x86/hvm/Kconfig
>>> @@ -62,6 +62,16 @@ config ALTP2M
>>>    
>>>    	  If unsure, stay with defaults.
>>>    
>>> +config HVM_VIRIDIAN
>>> +	bool "Hyper-V enlightenments for guests" if EXPERT
>>> +	default y
>>> +	help
>>> +	  Support optimizations for Hyper-V guests such as faster hypercalls,
>>> +	  efficient timer and interrupt handling, and enhanced paravirtualized
>>> +	  I/O. This is to improve performance and compatibility of Windows VMs.
>>> +
>>> +	  If unsure, say Y.
>>> +
>>
>> Actually there is a question for x86 Experts -
>> Does it make sense to have HVM_VIRIDIAN enabled without enabled AMD_SVM/INTEL_VMX Virtualization extensions?
> 
> It makes as much or as little sense as HVM=y with both of the ones you mention
> turned off. Iirc Andrew in particular wanted to permit such configurations, to
> allow to prove the (abstract) correctness of building them, even if the
> resulting hypervisor may be of little use.

I've been thinking about adding "depends on AMD_SVM || INTEL_VMX"
to cleanly note dependency.

It's very hard to understand dependencies within x86 code :(

-- 
Best regards,
-grygorii


