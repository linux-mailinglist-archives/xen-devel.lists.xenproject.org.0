Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGukNjhqcmnckQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 19:19:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5126C3C2
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 19:19:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211812.1523279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vizHA-0000oM-Ft; Thu, 22 Jan 2026 18:19:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211812.1523279; Thu, 22 Jan 2026 18:19:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vizHA-0000mo-DA; Thu, 22 Jan 2026 18:19:24 +0000
Received: by outflank-mailman (input) for mailman id 1211812;
 Thu, 22 Jan 2026 18:19:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yxn8=73=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vizH9-0000mi-Hw
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 18:19:23 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dec8b3bf-f7be-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 19:19:21 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA1PR03MB6372.namprd03.prod.outlook.com (2603:10b6:806:1b7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 18:19:17 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Thu, 22 Jan 2026
 18:19:17 +0000
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
X-Inumbo-ID: dec8b3bf-f7be-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v13M2o3Djim5y1tvys3+kvBGqmRD8niad0fvlJgsBeSBeNsxDeVQkf8wQBng++px4o7udDvqFbGCeT4ivrZ4H942/JwwydYpQ9A92Fu+RvBBXbyVjI5djOjGF9JX5VhW9sx87BvXQY5Ph4gqM4IHtkO46NWcz7GL8HzG54kR+C/tgC9V5rCKemz/LV55ruakn5GnjsLFMKZnYWZA/Fjl7dOtaeU0ULBuc/ZXOZWZhhmC5BvfnJDRmRywtk8G9J0lPF4EPoACSbQcCQPctUTY+zrGSC+JEcOBYPTTt1ug9cYu1yhqRdRhgk+ZxL5Qtog72A/RXrd2Zj3JoxHEN24BQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CxWeTEFuMzuKeWWjvbQ9SgcNKKg8lO+lVkE8QGD6n9w=;
 b=fmmNV9adyfCJlbNQXCPgkpt42SVDaetchZzH2kRs2AsDxGzNkSnjG7hKQmHEzZnvw+tjCl+vJenzgw2j6Rl+WbqY2L+T7uI3E5oKfitjmiuCl8j9CPJZT3qSvx8pY5m0jS60P8OTpFos+bUgKj1j34FRWqRum4aOSlyHbjwq++KgDz7AAYAnM3/7+n1SlRxjqlew/Q3tSLrKkWnXD+xJyAHaIR2TX1n/B1fGyTCFPw2+IXzNAJRmfZpz1c0PL/CjM8StxW72ZirpX/9TWUgy/GfNj2irQ1ZwrtqKxWizXoVJs2wW3gyeKhb/XgMnJHlKY3piJPbzYPwCz6tmoFpShA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxWeTEFuMzuKeWWjvbQ9SgcNKKg8lO+lVkE8QGD6n9w=;
 b=0AgqedBvVMCd6PbSNwepJwgFVrDzfJDHJPy4/nmv03NhQ/D2ZxUhKh8HiCdDizCei4lpJah+lKtR/g12kOne0x6ciyK56TW8MrJAYERcVuT+OQIvhITTxidy7iWQ884Jxf9MyqD6HKdD0tgmSGFfUlXbsGA9mmI0BuyHZMSFXJ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6d41d205-7318-45e4-a487-5e35e398d96a@citrix.com>
Date: Thu, 22 Jan 2026 18:19:12 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH 0/4] x86: Drop cross-vendor support
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260122164943.20691-1-alejandro.garciavallejo@amd.com>
 <3421e525-fb04-4306-9320-4fa359c2ee28@citrix.com>
 <DFVAXLGSFPWC.3UXT3BXSBVFRZ@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <DFVAXLGSFPWC.3UXT3BXSBVFRZ@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0334.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::34) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA1PR03MB6372:EE_
X-MS-Office365-Filtering-Correlation-Id: 97394931-2c9e-4c7b-90c4-08de59e2c138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bzNodDZiQm8wOVFUZW1RZVBqQWZRakxndTl2QzhxYW5wNTlkR1RnTWphWFBZ?=
 =?utf-8?B?OWRrVkk0TjJLMGgzWEdRRmdjNnphdCtDVlQyTUpYOWpNd3ZORTNTbWJDNDRV?=
 =?utf-8?B?bGR6TzB1RXR6b0RYTDcxWmVRR2h0SGpnWkxoelNDaEU3bmRibTdaaEg1RXpT?=
 =?utf-8?B?SXRJbkg0b040Qnd2a08veWJJSlU4OXg4Q2RKRkRUalNCV2FsYXNmUnBvQ1Vi?=
 =?utf-8?B?L05sTE5MN3U2ZnQ1RDU2RE1pYmdvWW1qYWsyZTdhNHcrbk1yOXlETHZSSXVK?=
 =?utf-8?B?NDllVkFEK2ZUTjdoVjBuZUhIUkt6cDdrbm8xVUx3d0J3d3BQcDZoaEpQRnRO?=
 =?utf-8?B?ajQ1RzkzZDE0SEpQWnpOdXhxOUxkTGF4NVVoNDNsL0gvTEM3S1YvOE0vM25S?=
 =?utf-8?B?QUwwLzI1WkZtK0UwYWpBS1hGRVJ6cWRJTVdDMEVsVDd0RHRPbDFKcVB4ekJR?=
 =?utf-8?B?Sm9CaHNQVmR4VTBiRDBPc1R4TjFnVmdoQUxKODQ5V1lCTlQ3cy83VDB4dmlY?=
 =?utf-8?B?UjVaZDJoR2FSR1RkQ0ZzU0M4cHVKMzN0ZmRad0M3ajZ1NEF5ai80S0FwTVNj?=
 =?utf-8?B?MzA3UnNGbWVDa0QwYnN6QmIvMTIxT0k5QlR5UVVWUkdHRVNha1pXbi9oL3pS?=
 =?utf-8?B?Y3JKYU1pM0pmK3BjVGVQeFBMWEc3T1ArNE5YZDhIbEFIQ0xpc2pVUVFsRjQv?=
 =?utf-8?B?TTM4cEw2bWxBeXhDUTd3MStKM1FiSEdSZUZRZXBBTGo1THptWUlJMHRva1ZJ?=
 =?utf-8?B?Y0svdHp1Q0srVmxqZEdVam1NYVFvRkZ1OVhxdDV5QUoyYUdMOWlPNDFVWmJr?=
 =?utf-8?B?SDVjWElmcHNESDN6RkN6ZWllakt5WVpZL0FHbzNMcUZybVk2Ni9hN2xwclBV?=
 =?utf-8?B?dEZDYjYvNHUzSW45dW5Ya2ptV3lTZ0p6NUhFSWdVc3IyZWdVaSt0TUcySmY0?=
 =?utf-8?B?enFQY0hGbjQ0TzRPNW1NOVU4Y0V6UkNNMzNTODdxQzN4TDUxYmFjbTZEeTJY?=
 =?utf-8?B?Z2g3SmR1K0l4TFA1Y1hvTFlCSlVQOE80VXN1YTdYaW9JcmtkQXZHcXNYdXNk?=
 =?utf-8?B?TzNhR1IrNXRZNVllZjFJRDVLMjFzY1pKejVKVk01S21WSWZxSFRvTFJWOWtH?=
 =?utf-8?B?dzM4SnhyYXNnbmoxNFdGSkNoRzVpdmh1cVhnTlBteHR3MVYwMzNYY2c5azU1?=
 =?utf-8?B?ZUVnNk1GcWY0Y1Fic0tDTDZzYnZGYUJiak1mL0F3ZUZUeU05bHA5ZDhpMGti?=
 =?utf-8?B?RVZuVTljYlVuYmlDdUFkM3Vib3kwK2tUVUE4VXZVOTNNU0x1RnpOSzY3L2Ji?=
 =?utf-8?B?emNKaTEvSDl5czlocXhaZmlGWE1QWFI4Q05vRStMT2I1dGdZcHMrcjBpdU1E?=
 =?utf-8?B?UFVOVjZLckMzM1BQc1ExMndJSEdlYmE0ZGovU0VlRzN1WkFwckhxb2RQQVdE?=
 =?utf-8?B?cE9IcmJwZktlTkh0dHMzS3BoclA0VmdVNlNDYnp1ZXRDdTBRTldJaVlmVzkx?=
 =?utf-8?B?clUzemJnMy9iWnhWdlVYR2lIRUFLTHM5QmxTZzJWR254RStoSkowZzNHTGVk?=
 =?utf-8?B?V01rZXMxczk0VEJTQzFpN3N2UHN0VWZQQUd3Mll4Lzd3Y3YrcTk1VUUyYWVi?=
 =?utf-8?B?MjFteC9lUTJOOFl4dnpWS1NQRjhWN2RQWGwrT2dROTl5UU51ME9weW1MZXUw?=
 =?utf-8?B?ZXVQbmhNV3l5TjJyV21kUjczNjU0RlRjYzl1QUFIUXlhenRsaVpmdXk1Rzdl?=
 =?utf-8?B?bjgyWVJmcm1xMHUya3VhNWZFUEZFQm5DU0RQeG9BUWUwMDZaSGtnUjFpb0xZ?=
 =?utf-8?B?bXZtazhvWENGUVo4R25sd2Zqb2FYaStuVkg5dGtRRGlmTkdWdk5zWTBPaHF4?=
 =?utf-8?B?aUhZYXkrQ0N5cjdma1NDbkJTN2NOUGh5UmtjSEFrbjdxQTdtWDdKMWJvZ0JM?=
 =?utf-8?B?STFiUjJBQXQvdjRGYk1JbTBueWNxTDFEUGdwK0hYV0RCR3l3aWRGbnZIU1d1?=
 =?utf-8?B?NkVnS1dCcDA5MVNXSHF3QXRreDJ3eWNMdXk3clFPZUgzZlpPZmNmL0x2UzNG?=
 =?utf-8?B?WlpiZU85bk04SVFpTUZpUEJNTGVQYWZZQVZSUzNIVWpOTFN5czlaTURkUnZC?=
 =?utf-8?Q?NS84=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTB0L3NLclR1bGgwbFJMKzNSM05pbTlMZnNaSFNWL1Y5aERFbGM0ZDhXZHpJ?=
 =?utf-8?B?YytPSFhLb0R5NlF2Wkp0VGRWTzdOVGE2ZEx5YjZLdnNHM1BNbWFCWmMyNDE3?=
 =?utf-8?B?OW9rM21mTklzL0MyemxvTjFtZ1FGMHFPM3dFcUMydHJRQnUrSFc3VXFkd1VH?=
 =?utf-8?B?L3dFTU1qZDMxOGZSdW5nWGFEaEVZS1YxQngzOVRHWXg1Y2NSMStNT0Vvc081?=
 =?utf-8?B?Snd2Szl5eVVzTHBES0hXRGlvdS9ibnFVbjVYMlNaaCtuWmdhQUg5MEx5dG0z?=
 =?utf-8?B?akY0MW8vWmk4dTcvbzFXc3dKRWgxWjBJYVp2Syt4aERCMWVPL3BSY0twSVZD?=
 =?utf-8?B?YVoxSWlPVUFORnVicUtqakVYVm1INnk2OTRhNXJ3NHpWb1daWk9oUk1XTm9o?=
 =?utf-8?B?WGNzMUJtdWxzVjdlaGpKeEdja3JVd1M1TWtjMzg3U3FBcjdpeDJPMnJxQzZF?=
 =?utf-8?B?TVg5UHUwQU8yS3lja1lkOWR2WlYyQjhLdUFCV1dXT0R5N09CeUNPUFNOYzhl?=
 =?utf-8?B?SVJaZFdicElsQlV4clllL1FCc3FFQVYwaSs4QVhGbG1YbkdoekV6SkNTbWE0?=
 =?utf-8?B?QVdmRkxxOTZDMHZ5UElQVEFEdXZoT1hsQVZOTmp0NTFOQnpWNitXeFU3NkJJ?=
 =?utf-8?B?Q25pOGRoaTdjZWlCWm5TMTYwZnh0N3N0TFFrOEdxZkpwakxEa1hiNzZwUlZx?=
 =?utf-8?B?NDdnaGRlK2UxdFhpM3hNNHhuc3ovUE4wRUpYZlV6ZE9kaUFuNEh1VFQxTDNj?=
 =?utf-8?B?SHNmMm9tOFNNcFByQUMzMTJ0MnZkZjNBUk5zV0NMRkdVOFdWS0JYZ253NFhx?=
 =?utf-8?B?d1Bmc0Z5VFl3RWlYcDh0djA1M25MVVRvT1JYcWkzcGFsNk5DbGxpbTB4SVVz?=
 =?utf-8?B?YWpIaGNHakNNVFA0Nmc3TlVDcWFQaVRENU4rcXFwb05ISy9iUkxkU3owQ0dj?=
 =?utf-8?B?WWNoQ2JIdWkwTVNMeEYrNmRGVGhDaWR1ZzRZS1JLVm9lMnNUdkNiU2ZaMmxk?=
 =?utf-8?B?THh6S0JtcGYwZjBSb3hvd1RyeUJDRkcybm5lVjdNSDloMjhIb3BFNkJFcFZy?=
 =?utf-8?B?d01OTUlmeS81RXJMbG84MDlRV0czWG5yclNGSzV1WUVCZ2FtamorRE5vVG8y?=
 =?utf-8?B?Mk5KRk0rUmtuY1E4QjlqZjFZK3FnUVZpRWxWS2czcnp1VGFHYUtmYk1SRjRZ?=
 =?utf-8?B?dU41bVhHVnJYRGFuaHZmcHFwWHNJUENJQUMvb3k1TENoOFVZbmJRTVlVK3h0?=
 =?utf-8?B?T21xMVV3YmlnbzVHbVpyMUZaWEt1YlVDajlPak1rVUVyc24xelVOTTlscXBY?=
 =?utf-8?B?ZjB0R0ZHRG1BTnVoTEswbmREbjUvVGk0YmlyOFVpc0lGclpWaUo2T2Y5RHUr?=
 =?utf-8?B?MFVtSXdHclVUbk1hRXloODlnbWxmZ3hNNUxVOXRvcVRmUWljNE4xSXlsYUgw?=
 =?utf-8?B?cDNoUGlNRldidnUvVWQ1aTJyWnZiYlhDZ2g4Zzl4ZjRVeklyd2FIS3ByY1R2?=
 =?utf-8?B?bFZPY050ZGwrNkhhVlBwbmkxN2p0OXNTeW5KSCtHRVBYOGlybG4zT2NId0dy?=
 =?utf-8?B?Mm9HU2M3T3lQWlRjOEJIK25qRDdLQ2x5QnJFRCswUjlyTFZ0WVNXOWxQK3Y1?=
 =?utf-8?B?cDlYU2E3ZGljT3U1OUJYTXdGcHd4ZTFVRmxmMG1IUS8xMk5iRlNkSG9xTmVE?=
 =?utf-8?B?dy9KN2E2eTRqdkdTSGJEb2FhQ3R3SkR4cVZBQ2JrYlZScUhId3d4ZjlkdUdN?=
 =?utf-8?B?MTZTT2FlcnMzWjFETzROUWV1ZS9nbU9VSVpPc3ZseHF4djhoVkwzOTFTekF6?=
 =?utf-8?B?MkRncWlZOGl1ZkhFZ1AyYytQOHRMSWE5UVlCLzAwRkUvclJIc2xsbGFEU0E0?=
 =?utf-8?B?ZUs1aWh2NG9VQm5KSVlXa3VuTmVIWW94OG9aOXRhTFRaU1d6OHRGcHZuVDRt?=
 =?utf-8?B?Z25UbnhuUXh1YXJZNXdCVmw4ZzUySEpTWTRaYzJINFZwazdaMWxiRTlQcmxw?=
 =?utf-8?B?d0MzR0luM0FDblpsaHZPWTY5L0pzWTRuRTR5eUwreCt0VUVEM2g5enFSV3py?=
 =?utf-8?B?MmZ0dVgxMnBtT3RqZ3YzZzc1QkxISzZxbUpQank5MDBCQUMwQ3pCaXZHUWs2?=
 =?utf-8?B?U2V5VkRvM2l5NkNKVWN6ZlQ4NkJuaU45MmQ1WVNMcjEyWVRNUUhJbTJNa0pU?=
 =?utf-8?B?cGFRQmJ0QVh6V3B0L1hRQUpnaXo0aDZreWVZcU5RVmUrU3dGMXEvZmt3NTFN?=
 =?utf-8?B?Mi9JMHJ3UGVHOEZNOVlPYVprRlVNR2tOY1g1NHNJaUpkWS93bUQ4c292M2pZ?=
 =?utf-8?B?SU1ZWW9FRjRLbWZaUnFmWWtYWTN1ZHdnbnovRFFSeVlKQ05nWk1Vdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97394931-2c9e-4c7b-90c4-08de59e2c138
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 18:19:17.3155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V0VsweVFNmxsZMVaLRu4NFAzdp6Cjw572Z/9+BepWZWZ7ZdIbp6x/143JdMbiw0+R6pwUuYG3qElql950/6vrWtq5VG7W6JAzIokNNfOL/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6372
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[citrix.com,gmail.com,xenproject.org,suse.com,amd.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.403];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4C5126C3C2
X-Rspamd-Action: no action

On 22/01/2026 5:42 pm, Alejandro Vallejo wrote:
> On Thu Jan 22, 2026 at 6:10 PM CET, Andrew Cooper wrote:
>> On 22/01/2026 4:49 pm, Alejandro Vallejo wrote:
>>> Open question unrelated to the series: Does it make sense to conditionalise the
>>> MSR handlers for non intercepted MSRs on HVM_FEP?
>> I'm not quite sure what you're asking here.
>>
>> ~Andrew
> The handlers for LSTAR and the like are dead code with !CONFIG_HVM_FEP as far
> as I can tell. The question I'm asking is whether there is another code path
> that might invoke MSR handlers for non-intercepted MSRs. I can't see it, but
> I'm not sure.
>
> If there isn't I'm considering (conditionally) getting rid of them.

Introspection can (and HVMI does) hook them.  Changes to LSTAR during
runtime is usually an exploit in progress.

Nested virt also makes it far more complicated to reason about
"intercepted or not", given that there are multiple opinions merged
together.

~Andrew

