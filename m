Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B5DA647A7
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 10:39:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916466.1321551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu6wG-0007x2-Bc; Mon, 17 Mar 2025 09:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916466.1321551; Mon, 17 Mar 2025 09:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu6wG-0007vW-8g; Mon, 17 Mar 2025 09:39:16 +0000
Received: by outflank-mailman (input) for mailman id 916466;
 Mon, 17 Mar 2025 09:39:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WXuz=WE=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tu6wE-0007vQ-15
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 09:39:14 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2413::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae6c25b5-0313-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 10:39:12 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS7PR12MB8249.namprd12.prod.outlook.com (2603:10b6:8:ea::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 09:39:09 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 09:39:09 +0000
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
X-Inumbo-ID: ae6c25b5-0313-11f0-9aba-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXCNJ0/TJk+VPm/k3sWObffGKKIPRNp2mbhz6dpTZvW47Y7VR+wG0f8p0SOONSf2jvmS0lY9atIk1HeYvzMBoZaM8UcuZNcaRG7YObcSXSpnhF72bb+DTYi+i0VdS+1DvNYoU6SA6NnVw49IMSz+FZXyc1t8+ni5Hgeuf9gUqNrPfuSm1sb/UpA9Tjqmc83xBm/eQfCio82wksSbr15ua7wuDLpUNqs+Q7EmdNc3C3Puxhiu9q6dVRsDS2cyZu7Y2ijysYZ4tgqrKEcint5Xj2lnuLka6URcAeryVWRsptH11VcyyuKWnc0YH6k3Na/Se9Zom64Xgup/aUBRFj/jKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzILHqHd65LsP3jWe0txe2a26eqJFnipWa8+hQEp0nE=;
 b=rcXsnQ5VNYMs32lM5LiQJ+vPqNkMu7u7cIR3K/8W6zCfZ7AO1feFKua9TKs2S3kja4hpLn7omVLvwLYHcvn0W/HKJDeAp8FUPA+06u+ufeOcaZayUm9ltsculd9y/+os2xxAMIVj4WKvGacI9+xxIFyy+WBGvGap3frqDvSroR5HMY6KIf3Jiiq1IZ8XEB3jT1dIVchcPpl5KhA7Q8TQna7bTYYkl6aY3zX4zkZ8dVIB/o1NJVz913tH+maM7K5ApgDbORgUq8g5nPqArHSbVVAg84MTChl4iIc8dlh2uDvP6ej7u2xqo7XunY3UWESv0jBPuKyEhatA/EYJdRS3TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzILHqHd65LsP3jWe0txe2a26eqJFnipWa8+hQEp0nE=;
 b=AHMAfxXYM+V8oKBD2TA6u6wa3FAF7LTtsJQQoUci4LOQEZIBnbXvISVzVlwOCfEsc0vjBNGBQfQtcVWJ7h7Zj6iqdd11CpWuk7pK93iH9yDbafs9POPJZMrcIjZGzVyJ5Rpwq0eAPXRKoE1PoPP0ndCdDYkTlkAt0f0leZEIlzM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <b31beb50-f1e9-487a-b319-6face9aa692c@amd.com>
Date: Mon, 17 Mar 2025 10:39:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] xen: introduce Kconfig HAS_PAGING_MEMPOOL
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Chen <wei.chen@arm.com>
References: <20250316192445.2376484-1-luca.fancellu@arm.com>
 <20250316192445.2376484-7-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250316192445.2376484-7-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::11) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS7PR12MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: 66b3e49e-4f32-4f38-0366-08dd6537916a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VjJZMUtrZit2dHZhazNNTEIrd3NiRWJzRjJtTjhTcm95WFloY1ZjcEVQbXND?=
 =?utf-8?B?S3ZwMjNQZDdQSER2MVpZQ0FubDZ3V2JCelBIVHErZC8xNTRJaTM1MGU3TTli?=
 =?utf-8?B?WWZYYkZ0QjNyL3JkNUZzTmtUcHpkbGp2MHNsSTRxOG43eXFHRHA0cEFSNmhm?=
 =?utf-8?B?RGVQUEJCSjdZWjZ5SUVmazhnc2czRnFpTlUrVm8rYXQrOTIrRUt0VzV5Yytn?=
 =?utf-8?B?QW4vUlJnVy9QaEVaNmRnbENkWUd0YjUvOGRiUGR5VjRtZXJwcE9iSkN4RU5B?=
 =?utf-8?B?SnVQei93Q0hRT0loQ2lUUlJHZU1nbzdaYlBWaXp0OElwSGZpUkVueDFXZG9M?=
 =?utf-8?B?dXZsRWNQdjZGd0lxZjdGS1BVTFNwUXFFOHZHejhMNWtLTHhXcVpOYW1wQkYv?=
 =?utf-8?B?bWRHcHZURENwSyt1WWI2MTZrdlc1R1JWek05NXVrNVh1b1FLV0c0dDJzaW5C?=
 =?utf-8?B?bURPWEVRZzlXV2lXVEpNKy9PTTZXa2JSNTB5ZDhSRDBySGp1TWlnYllKajZD?=
 =?utf-8?B?dFJIdjd2WXZIY0ZQSnUzM0lOZzFTejk4Q2FlQURqTUloY3FJUlhxSGJFMTM5?=
 =?utf-8?B?NVdPa1BoMGhIMVpwUFdVU21rOTlQLzRHVG5KSnF2NmxZL3dEL1ZFNDNCQ09B?=
 =?utf-8?B?RXlrcXg4UCtmbUdHUnh0ZU9oY1ljRDZkUk4zcWZKQldCaityTXU3aHJ1MVQv?=
 =?utf-8?B?OGVMRkYrRDBkK0x4bDR2NjhFSmdRVGFWNG9xbWJTRXlIcFFaU3pvUWVoY0Fs?=
 =?utf-8?B?L1JmSCtlTll4Vlh3NmJMaGlKKzNUT0haNzRwblFNcEZleUFlMXVyelFKWFZE?=
 =?utf-8?B?VWkwV01GaUs5MlRRb3VUaGNPU1JSYkJ3WlJTeU9aSzVTeFZEcHl0RlZUWHpZ?=
 =?utf-8?B?RkE4S0xZWXVtdXdCbHl6UXdLU0VlTzkydEFaVFQwSjk2TjNmYnB0UmFzTFVR?=
 =?utf-8?B?VGFidGtoYVMxZEJxcGpSci9aMnFsYzlzT2czNHNkTWRQTkFwVVJGYkdNbHc2?=
 =?utf-8?B?cnpraVZ1NmpDbnpnS0xCckt6WTN4OWNpMjNvcXdCTDg4Zm5XNU9DN2FXbVFV?=
 =?utf-8?B?NDlHZWkyV3VlbzJJTHR5Rkx0R1JobXRUdGFNZ1B0MURyc2psZHR6K2YwVjVO?=
 =?utf-8?B?Y042RWpjWURvdE83Y2hpR1R2dGFXT3VCVXpNRDdkS0ZPdGlGV2JRaG1jQ2hO?=
 =?utf-8?B?cGc2REpZWFRBK3lUN2F4cjNWRFhveGlGTTVocEROVEtmSk1nSEpVVUJrY2xk?=
 =?utf-8?B?NnlZakxmSVM3aTJGMzZtMG0wL1o0YldkcWg5YXpzdms2Wlc2TEtVemNxQ011?=
 =?utf-8?B?Ky9WVEFJUzE5ZWJ3SjhEZ1dGYUdpT01XVlNMQ0d6cXI2d1RHeDJ3VWVCV1Az?=
 =?utf-8?B?aDFVTFRCSWVJZUQ1ZUc5M0xhSUIvM1FmbmRPT1pKWXB1ZnVkdTIwU2VoTVRJ?=
 =?utf-8?B?TUxUYVNROUFCTGFLcWFOUDZmYzlFU0lUNG1ncFRyeFVjSXFqSWw2cldsOEJt?=
 =?utf-8?B?eFBVYXBXSDNxQkExb0MvTFpEaGppL0RVUU9oNld2ZmJTTmUyYVRZeVlrcUNW?=
 =?utf-8?B?WUw5RzNkNk50TDFMb0drcEFNN0RMeW1ld3ovSjZBRU1Ja1I4bXFiZ3JwK1hZ?=
 =?utf-8?B?ekZXMjlDRDJiSkgvQ2g5OG5RYk5Mc3I1ak5IN1pva3dSWERBUGJReEN1T2ZP?=
 =?utf-8?B?Wmh5Q1UzelVhL1ZGMlpzeDlaVCs3YzAzbTFhcFRQM1cxM2l3aWljWEFUdFo1?=
 =?utf-8?B?SEl3cHl0QzAwVTBmMVhpQVRSbERXTy8vWi9MNXJJdlF4MXQ5dEZZbVF1U09q?=
 =?utf-8?B?aGpLWDRnQnJXY2dHKzZGMTBYOXJwNHF3aHhidWtJOXNtQVkvQWRqWDFBeVBJ?=
 =?utf-8?Q?EGN0QPESRSXT9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1ZzK041TXQzRmJRUmx6bHlpZ3grK1ROTjZoK2F6NlQ5MTJVZWswVlA4MGlU?=
 =?utf-8?B?N2liclMyb3dhbFNDc0lwb2poQmg3Y241YXZsd2pJNmN2aGhCUS9lK0pKZElS?=
 =?utf-8?B?L2IwUVZnZVV1NHh5TUZ3d1h3ZEZjVGZCMHRoejl4UFNNTXZ3SUt5V0ozN3h0?=
 =?utf-8?B?NnhHeEF5dnpPcFRMMllITlpZWEFBdDlTMm1CKzdBVXAwZlBNNWpGcWZadC9Q?=
 =?utf-8?B?Vkx6ZUxJd003T3JNcWRhVjJzU01pMFc3NUJKZ0RJTmljdzl3UU5BK2lxM21C?=
 =?utf-8?B?R05rMVI5ZFJTcUJLTWE1dnVtSjdjT2VmRndqai8ralhtbU8raHRsVU53RVlW?=
 =?utf-8?B?cHZFQ1YyODNESTYwQ29PMXppUkNaOWRLNjN2dGVuWDVBNmdPUEJoWlJHS0Ny?=
 =?utf-8?B?VEllTlhpcmRzaUhkbmZzQ3hkTjRRMW4vWWl4SnVPTkhhK3hwNFZwMno3bHFB?=
 =?utf-8?B?M3NwVThlZldZSXhWSmluSzcwWUpscnpFR3liVHQ5ZGVNU2R3SE5qdVR2TWhj?=
 =?utf-8?B?eU9jbEdKRTZsRXM0cWExb3c3QmxSQnRKTTVwamhxaVZkZXRuZ3ZnRmJJY2hk?=
 =?utf-8?B?NjJpVmh6UnlYMkZzZ0pQVjErYlJ5bTFUQklrd3FxZkFucVNkNG9xRXNSUEwv?=
 =?utf-8?B?RHhDZzl1eGxtK3lEQmFQNEJuSnlKeE5nTDREMGdxM3hRWmdVZmtCVWhpWWZs?=
 =?utf-8?B?QmZMUnZuR0hLOU8reGQ5bUhQaU84MmlkQU02eGh1NGVQTlFmaWZoOUZ5bTI5?=
 =?utf-8?B?ZHpzb28xNHdSZ0ppNkpoSFZVaUZQbEFBT3N4dHh2SEJBaXdVVi9GQ096QVBQ?=
 =?utf-8?B?NGVmQXNBMUcyRGovU1dOYVdiQVJoaGFrQURTWVUrZDJTZlgzRy9HMzlzSXd1?=
 =?utf-8?B?OGNzQnBRRmdnUFJzQ2JwYnFsa25OUWVPR3pNMm5rdXpaVWN2aFE2U1ladjk2?=
 =?utf-8?B?aU9ydmF4dUJjZ2ZJY1JzblM3dTVlV3kzUGx5Q3JPZVJKLzFxTEFBanZtYjZr?=
 =?utf-8?B?bkJ2SGEydkdMbk5NNVNzajNwcjUrcy9TdG9oc0V6RHV4Zm5JMzk2RDMyTW9N?=
 =?utf-8?B?QnZxbHFFbkNTcmpSZjV6Y3dTZmRvVUUwakMyOXEvSTl0ZEtxUWY5OWZzdlR4?=
 =?utf-8?B?NlhDUjBSVmUvczRHZEh0b2JFWnRFV3lpUVNEN00zakRqcVBQckNocHRyeWN5?=
 =?utf-8?B?MXkvcU0zd1RhUE04NEN0aEhFWlhMUFBhZ1lld0ZGbG4xQ0J0OHJGdmJqeEVP?=
 =?utf-8?B?eU9VUHQvcit2WWVpVVB2NDhodzA1S3dkMmphVk9IL1VHSktDbkJBVFJGR1pO?=
 =?utf-8?B?NjhkVkYzS2xZSTJ0cVZObDA4WVBicGRrT01SWW1La1puTE5Yd3lHcml2QnYx?=
 =?utf-8?B?QVQ4MVNPalZFSGJmRG9nbS8wYVEyRGZQOEJaOU4yRVhRL1RuaXdQUWdMZlhv?=
 =?utf-8?B?TTA2dU5vQnV4c1pGMlpqRmZlRzN3aTV4ajRWYnJ5NzNXVjlxRGJrbk5kQVRO?=
 =?utf-8?B?MTQ5eHo3elJwNXF3WTFFU09yZXk0TnB2RDJHcytLaFpJU3NwQzNoSW5vK0pE?=
 =?utf-8?B?d3pjZGE5eGZJaDFNb3QzMjJhck5tZFV5djFZbTZJdU9XR3ZpalBuMStJa2pV?=
 =?utf-8?B?dURKRENVMnZpeUlPbitpMXFWVmhrMFFOejJmWUpLQU5sQjRVNE9vYWdvZHAv?=
 =?utf-8?B?UGVLdGhjUHVoeWsyaUgxcG9tTFl0YWlGTG5leVlacHlKTzZiSmJDVy9zTWlM?=
 =?utf-8?B?RzU3Q2V1a0dCd0xMNDhzdkYvb0dYRXVkMUxwVW4ySmFNVGtpR2xacXdqaGx2?=
 =?utf-8?B?WDlBU3VMUmFxUHVuYkhUcUxkYktyQVBXTjVCZkJTMXQrNWRaWVFGb0NhM21W?=
 =?utf-8?B?Mmk3Z3NHU3ppVnFKL2kxTGhnZjRtL1NQeVpjWWl3NFVXdldVQ00vdDI0djFT?=
 =?utf-8?B?OHNzU1lkUWZQT1RDVlVHMU1ST2FHUm9Qeno2NHdkTUVQcFlmZHA5dlVTZlRt?=
 =?utf-8?B?V3lLQ2V6SkJkNzM3MDg5c2hQd2VHMVpHb2h4NnNuZzVpNGpuNCt3LzI2Uisw?=
 =?utf-8?B?R1hBVVJCMWIzLzkyWDJkWk5KVWIzL2ZuMmh2RTIycGNhTjJDckR1djVjVXBp?=
 =?utf-8?Q?7iqw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b3e49e-4f32-4f38-0366-08dd6537916a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 09:39:09.5268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dR9rRksaHuTy2z0tnQWDw9oKcqqgCpUB/shDlJwj/7vu9jlwaumMhJ4GNizCUoFG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8249



On 16/03/2025 20:24, Luca Fancellu wrote:
> 
> 
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> ARM MPU system doesn't need to use paging memory pool, as MPU memory
> mapping table at most takes only one 4KB page, which is enough to
> manage the maximum 255 MPU memory regions, for all EL2 stage 1
> translation and EL1 stage 2 translation.
> 
> Introduce HAS_PAGING_MEMPOOL Kconfig common symbol, selected for Arm
> MMU systems.
I think it should be selected by other arches that implement the stubs.
Anyway, Jan added a comment and I do agree with him.

Just a few remarks.

> 
> Wrap the code inside 'construct_domU' that deal with p2m paging
> allocation in a new function 'domu_p2m_set_allocation', protected
> by HAS_PAGING_MEMPOOL, this is done in this way to prevent polluting
> the former function with #ifdefs and improve readability
> 
> Introduce arch_{get,set}_paging_mempool_size implementation for MPU
> system.
> 
> Remove 'struct paging_domain' from Arm 'struct arch_domain' when the
> field is not required.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v2 changes:
>  - make Kconfig HAS_PAGING_MEMPOOL common
>  - protect also "xen,domain-p2m-mem-mb" reading with HAS_PAGING_MEMPOOL
>  - do not define p2m_teardown{_allocation} in this patch
>  - change commit message
> ---
>  xen/arch/arm/Kconfig              |  1 +
>  xen/arch/arm/dom0less-build.c     | 48 ++++++++++++++++++++++++-------
>  xen/arch/arm/include/asm/domain.h |  2 ++
>  xen/arch/arm/mpu/Makefile         |  1 +
>  xen/arch/arm/mpu/p2m.c            | 25 ++++++++++++++++
>  xen/common/Kconfig                |  3 ++
>  6 files changed, 69 insertions(+), 11 deletions(-)
>  create mode 100644 xen/arch/arm/mpu/p2m.c
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 5ac6ec0212d2..6b4bcf12683e 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -76,6 +76,7 @@ choice
>  config MMU
>         bool "MMU"
>         select HAS_LLC_COLORING if !NUMA && ARM_64
> +       select HAS_PAGING_MEMPOOL
>         select HAS_PMAP
>         select HAS_VMAP
>         select HAS_PASSTHROUGH
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 573b0d25ae41..a65bbbb05301 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -673,6 +673,8 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>      return -EINVAL;
>  }
> 
> +#ifdef CONFIG_HAS_PAGING_MEMPOOL
> +
>  static unsigned long __init domain_p2m_pages(unsigned long maxmem_kb,
>                                               unsigned int smp_cpus)
>  {
> @@ -688,6 +690,8 @@ static unsigned long __init domain_p2m_pages(unsigned long maxmem_kb,
>      return DIV_ROUND_UP(memkb, 1024) << (20 - PAGE_SHIFT);
>  }
> 
> +#endif
> +
>  static int __init alloc_xenstore_evtchn(struct domain *d)
>  {
>      evtchn_alloc_unbound_t alloc;
> @@ -841,6 +845,38 @@ static void __init domain_vcpu_affinity(struct domain *d,
>      }
>  }
> 
> +#ifdef CONFIG_HAS_PAGING_MEMPOOL
Why can't this be moved to upper CONFIG_HAS_PAGING_MEMPOOL block to avoid
excessive ifdefery?

> +
> +static int __init domu_p2m_set_allocation(struct domain *d, u64 mem,
s/domu/domain/ to match naming of other functions.
uint64_t. Linux types shall no longer be used.

> +                                          const struct dt_device_node *node)
> +{
> +    unsigned long p2m_pages;
> +    u32 p2m_mem_mb;
uint32_t

~Michal


