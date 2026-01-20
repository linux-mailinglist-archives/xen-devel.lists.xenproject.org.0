Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJV+Kya0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F39748215
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209012.1521137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viCOl-00085U-Te; Tue, 20 Jan 2026 14:07:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209012.1521137; Tue, 20 Jan 2026 14:07:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viCOl-00083P-Qn; Tue, 20 Jan 2026 14:07:59 +0000
Received: by outflank-mailman (input) for mailman id 1209012;
 Tue, 20 Jan 2026 14:07:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h83G=7Z=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1viCOk-0007O5-IV
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 14:07:58 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6adbdadb-f609-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 15:07:56 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5632.namprd03.prod.outlook.com (2603:10b6:a03:28a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 14:07:53 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 14:07:53 +0000
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
X-Inumbo-ID: 6adbdadb-f609-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fj8TJg2keQX7WRjrwmNK7YTbRVyB5245Gw+SZMSHTu+XxmpGad/vOOfrMgoElIyqoSp/LMo5T/UHOGEVE9fgmQ6Bz1dtA+tV1H2bEKuxUJdCxlRD8/zzZ8Elg9ipBs3xuShEfb9EdC4WJbQXG7Ly7TqPu3dQYr0U8b7mwaf6/fziFmYy5X5miGqINLCzzzBJHoHVpY9Rzob/0WnMO7X7mZgkz8W7KBNVZVHkRprhMNDH6ulDPAhwr17laT/Vv+1cHJF9swuFRUlUpRR7uyzPZjmBeooFHm0yik/nIkBfggsrxzTjuXYbLGrAitl8bRSXTwVBpo7Am7u0JHtHUZMsuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEvV2hGjhqbkoILmhOE5HLRnQ0qgPeIKeqryF3Vjh7E=;
 b=fUOqvNTGvIPnYd+s/ymt/dVrJEfqX4QiRKihj4ss0VpcxJoqsAkWhW0e588CVgcxWtFZVwO+O15Fqn9d04J22tRNEXMOfdx4e+Cx7svJpnxYh8UHW1B+lLFn0KQTMZJXuhZ0MPu4mFGF1x/7yrd7u6+BqjqVT3oBT1fEFRQupZOP48e0yWb4S/K6/JixVNU3q4JKa70AXlxXtkYT+j3A7bX08f6YDWI2Hd1XL23zXhwNPUJIP306ryhQSjzgJgYLaLti2SiTs2bzf3Rr8Q3ZLLwC89Vy1vHabXfFh9YDJ9mzVWsgi6KzbQ9L+J/S297itJIZU4MtoJlgubrzpirUxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEvV2hGjhqbkoILmhOE5HLRnQ0qgPeIKeqryF3Vjh7E=;
 b=vG4eA75Mr8ryuXRuU7c1HnZ2IcQZKXVatSlinSlSzQHwdd22rrShsrk5ybEkV5dvXqNiYtVRaCg0LosT5B3GSvd7PU4MmWlIuWZaNdkD2v6IKVzFmk/7kAJzOn3/LY8xwXqb1K3BIoVSFTNVBRWV5OVOvOXOwfdh9ENqLuwXtEM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <39c11b77-7a82-4a4a-bc1f-d1153907a085@citrix.com>
Date: Tue, 20 Jan 2026 14:07:49 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 3/5] earlycpio: lib-ify earlycpio.c
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
 <20260120093852.2380-4-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260120093852.2380-4-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0234.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5632:EE_
X-MS-Office365-Filtering-Correlation-Id: 52055c12-a8df-4956-3f84-08de582d4d51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L09nem5kZ1czaXBXT1BjYlJIaThMY2s0cTBVaklqSlZwb1dDdC8yb3VCNm82?=
 =?utf-8?B?U2dsekNOQ2pXbXhlZ0kwb3UvajlpOUt2VkdYTHR2Wk9FeDFJQnVpbVdhMVJi?=
 =?utf-8?B?UmxLdFdwL3gxNHhpVVE0UVk2c1RMMEZTb1MwNE1rZlk3VWVzZGhZL1JVV2hp?=
 =?utf-8?B?cE52ZDU4cXJMdVRELzRBaUNHWTdKT0JVZmVwV1lmQWxPVytlU3gxNzRHTFRP?=
 =?utf-8?B?cVJ0MVpEcEhuekJEZ2J0YWEwbzRBa0FEKzZXVk1ST1d0NDlHZVdsMS9CL05Z?=
 =?utf-8?B?Vm85dG5qNnREcE5qUkNOZENSL1VrQVdBT1dSRWNjMEtSNE03Mzh4SjJ3RTho?=
 =?utf-8?B?bGIxVkRNWHExbGVvWGx5NnhoUUlMMFpCZTN0M3dCWWl1ZG5KZ2JSUjNnOWN0?=
 =?utf-8?B?ZjBNTzZCN1M4eDJ2dU5sUCs3YkRCcEp5dnZlWEcyaTBtM1ZEUVhnbXFDdXFF?=
 =?utf-8?B?azR6SFJQdmxWTUxtb1NxOVZCZWJwV1pUK2JYL29OUitIRldFTFYzaU5pSHhO?=
 =?utf-8?B?NGZhM3JzQ1FsMkd2Q0RuVWhJeisvbjBmTEppQzJJdVIvZVI2Qy9ST0dtdTdr?=
 =?utf-8?B?YkRuY3Q2Tzl3ekVkMWdiVTA5SGc3cnVOVU96OWxlK21jcEtqcVRZQ0grNTdT?=
 =?utf-8?B?cmtyQmIvNXhvMlc4Qms4QmtEYVhLOHV5VnVVb3JpZXk3T3JEMmlxRFBBVGVE?=
 =?utf-8?B?OGVUL09pTWppUmRaUjAvVGpGb3dOWGVwZ3hVc3hjTER2c1BJZGJ0Qi9Vbkxv?=
 =?utf-8?B?L0hHUWpRenA0ODRqSHl2QmxIUDF5YW8xMm5MVExTRGhGbjRyOU9zTk1zUkVi?=
 =?utf-8?B?UkkxK3ZidzR6WGxuQVVlNUxOWTR3cCsvR2JhclB4VDUvYWJsTTRJcmNKMmlh?=
 =?utf-8?B?Q2pad3U3V3JQdnZsNmtadjBrYkJZciszK1F0c3NFOFNNSFN3NU44REErQ1hN?=
 =?utf-8?B?NSsvc3N3ZWtkb0RMM2JHeG1rSE9kSlk0cTBBdzErdmJsNERFeG1NMmJ0UDdy?=
 =?utf-8?B?cCt4d0dMNnVLUFF3ZEpSR0RKUTV2Zy8yUzMzdks2Wk5QaDBvT3JiQ1p5WEtQ?=
 =?utf-8?B?VTVBODVaZ29uT1pobVNNVHRLS1JqaCttcVBpd0hxNWxnemVHaUF5N2pCNU1o?=
 =?utf-8?B?OGxsUEtsbTl5WHVpekpFNDIwTGExSmh2VHNKemxHc0ZUT0JlSGhCTmlpR1M1?=
 =?utf-8?B?VmNXbXV4ODRyQ2ZSM2Q1Lzk4WE15cnNxcUllWmhkamkwUXhTRUtnQ0JrVXp1?=
 =?utf-8?B?Ty8vSDFhSUZDZk9hY0ZYcmJOM3NNM21ka1dSNStrdGxLeHRzVlNhWjRGbmdm?=
 =?utf-8?B?WUtDeUlLVnNOb3dDTlNKL0RpTnQ3a29ITkpvaTFaNUFCdWdGNklTZVZ6b1pY?=
 =?utf-8?B?RDlIRG5UQlMxdkE1ckIxSy9QNzQ0a2ZsT0xFbmlXaEJDWHdKenVPNVZOV0hP?=
 =?utf-8?B?Wjk2a2hRcFZRYkdxMW9ablJpb1I2bHFyS1l5dFNvTFd0a0ZyNVlZS0pMMER1?=
 =?utf-8?B?WmN2Z3ZrWGpuMW5DdGJuMEk4eTVTV3JLWkpjdEdxVUgzOE5mRC9IOC9BMkFP?=
 =?utf-8?B?Y1A1VStCajhMY3dSaFJXQWhGR1h1SGV5UVhVaGRQS2lKc2hQMlRSLzd5bEhY?=
 =?utf-8?B?SHdyQmwrcTRjd1hndE9haVdVWnI5SHp5aUtpNnk4Y0gvNUtTcmpxdFVSYVM1?=
 =?utf-8?B?M0loTHlOV3M3cThZVGRhZ0QwbXNaUlF3RnZGSkJ3ZmsvZDZCc2l6d244bWJ6?=
 =?utf-8?B?OUhFMTkzQlVua2dDTFVnN1E3eFdsMHExZkhZaGRZT2svSThsMEcySVZJT1Aw?=
 =?utf-8?B?aktndzBkcmxwK1ArZnk0enhJdm1nd2lkTEVUMGV0UkRCM1VCRlBreVdOVldC?=
 =?utf-8?B?KzNrbHZRdy84N3JISDN6aEl1U1lCOFZoMEdrTUhKRTh6M29FRFJXSzdJaHRp?=
 =?utf-8?B?bTFzVXdsaUY1VEc2MU5mZlg5VUs1Umh5RENHbUo1UitlT21rcy9JK2psZHVU?=
 =?utf-8?B?dlZ5amZzUlNsbUdlWmhURUVjK09rMG9FVmFnV2pXYithaW5FYUdjbFl6NWFU?=
 =?utf-8?B?Rm5GbC93cnUvaExtS0txVmw2U0VaTnVGanFLaytpSzE4b0E2K2FtbGQ1WDB2?=
 =?utf-8?Q?SWu8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHBjYXR4d21RTC9zYlNQREgrUlMrajVkS01xUWYyek0ramg3eGN2eDdQWlZ1?=
 =?utf-8?B?cFhQcVpmL3o5cFVwQ0U5YS9Ucm96bkFhZHMycHFiVGdxb2wvK3FkcWExa3dN?=
 =?utf-8?B?cjVUcGF4VmhnMVdUZkJ4WEI2bFA1YkdCNWdWK1p6VkE1a3JCM0lZWUdNYm5K?=
 =?utf-8?B?WWhBaEtNMVN4a1ZnSGpXbjd3TTVIR1ROM1NPb0xYT3NYTDVnaHZteFJnaTVi?=
 =?utf-8?B?R1ExcFc3R3Y1SURiN3M0S1QzeG9sWGlic0d5clUvWUsrclIzYnNRQUxtOXdt?=
 =?utf-8?B?Y0txQmkxMHN0TG1KVUl2bDBvVFNvWVJvamVMbm5XdjlPVGRDc00xVmtPYk5m?=
 =?utf-8?B?S0xkOEs4T3ova2d3MmFWSEU4bE9sK1B6TktyVjM2QVRzTTNsc1RiR0VmVGRq?=
 =?utf-8?B?bE40VisxMzZxLzhWeW80R3hDb3VkVWhCVWZ2WlY1MStydjk0Y3gzUW1aVmZv?=
 =?utf-8?B?aWZpTVhlRVhvTm9VVlRtaVAyRlh1K2Myak5IbEpyQlZ3MHg0SURFSS8xdlQx?=
 =?utf-8?B?VHB2V1lodkY4cjIrcUN2MmpYUUFtNFFJSE1hSGtSWnBSVkl0ZHJtV2JUaklG?=
 =?utf-8?B?RXZmbWVQUjczeWJQdDN5ak5ocExwUlFXOU50Z3RkQ0d6MmlGWHNjOXFvWHhS?=
 =?utf-8?B?OVd6dmZJUDk2OW01bVJOSWF6UkFRR25tVE9UUEgyWTJzdDhmSkhFZjA4aHJ4?=
 =?utf-8?B?YzBqRW5GSldRYm1paTkxcXovN1NLS05aWmdRcTBDZ082MWxIVGtycTRsQlE1?=
 =?utf-8?B?Q2hPejd2OHowQ3dPUVc1MEd0UnpyNHJ1Mk1oQ09FYXBRa29KcGJ0Wm51TmRo?=
 =?utf-8?B?bW9pWTVFUS8vdXdVWHgvOWw1dGs4WlNxYkpLejd6RkExN1pmc28zbCtVZkwz?=
 =?utf-8?B?ZmFiSlUwYVpKeGJTQ3Zkek9tVEpwY3FKZzJQaUk5aFpKais1dW0wbVFrblFF?=
 =?utf-8?B?VlRFTXRLMjcvYkg3RGg3L2FyTkE2WlFoVE5GeVpDQ3dBYmpybWpzOEwrdVF4?=
 =?utf-8?B?a0hkcklIMzB5amx4QUNPSklzV1MwS28rSW53clFMUFZJVnAyd1NGWjg0ekJ5?=
 =?utf-8?B?emVlckNwT0FKb1FrTGUybVc3T2JkZFV3Mmc3WHFEYWJsQyswV2hScXYwaUtG?=
 =?utf-8?B?SWp3RTV5WHlycG92Vmh4dk40QldXWUlkWCs0SnlQOWpCZjRFWEpjSUZLelhQ?=
 =?utf-8?B?cVlYTW9WeFBkV0pHeEJORk5UNEVLOGZPT01zdUZJWlB5U0R0eVVvSVZVbDQz?=
 =?utf-8?B?b21yd1JGVjhCclBiSkNYcDAyVkRXdXhDaHNqZEdwb1BHRnVaNTdYZ0wyeWNJ?=
 =?utf-8?B?WDRoVHJrcHIxVFlTUDR3b0xTS0tITlZ1TEpiVjVpdTVhSFY1ZlZ4aVBpL1dB?=
 =?utf-8?B?VTYrbDFybUs0NXk4MStBaTI0RS82N0ZxcVl4a2g2bWRacmViK0NCQU5EVkNk?=
 =?utf-8?B?aXhKRDdhbTMxdmxuM3ZWdXhWMUs0R3BGVXdtbG9OY0dySThXUnRKdFZtS0hi?=
 =?utf-8?B?OExMZzNKMVBYcmxvVFg5VU1kTzE0QUh6b2N0QjhHZTVmRStId2g2a3pXQmRw?=
 =?utf-8?B?UkkyWEhTaWFEbnEzZ044M0I5b25NcmRuSHA5cXJxU3RFY3BrUnUrUkRrOXFN?=
 =?utf-8?B?VTNTdmcwSTVyWEE1OU1lb3ovWWJ3djAwWnhxTUhPK0VaM3lOT3QvVGN3RUNk?=
 =?utf-8?B?U0ZrUzN4TEZsMG1IeTNmSEZRRzJ0NGxxU20wNTgyMU1sSFBhbWhaUGh6OXEr?=
 =?utf-8?B?Ukh4NFlNNHpqMGhqa25oK3JPUzd0dlJSZDVGbVd2Z0VrYlp3ZjZJQmhDQzRW?=
 =?utf-8?B?amhhWHIwRHppUlJSbUpyWHBlQmNIYld4OVNQdnl0b0V6S3VrK3A4WWJJRW9h?=
 =?utf-8?B?L0hyVGZQSmtNcFd0aVYxRzRNTU1uL3ZtbkYvMWIzQkwydVVRTGQvajZqcDdD?=
 =?utf-8?B?QVlSM2gyZVhpeWNkNzVEQmFvZ09yL0RHUnFpUGNsMEUzTlViaHRHN3JrTzRR?=
 =?utf-8?B?THNBUHlBSEw0eEUvcTI5KzJ3VEFjdEpvMHBqMkxxRVNubGhGbFZFUEdYdW52?=
 =?utf-8?B?ME5KZXcxbTVCRWRVOWxTWXZkd2pBSyttQU1EZWpmUGZoYStRbUZEYmtNczV1?=
 =?utf-8?B?TkoxNmJKRnpPcU51Sm1pVXpTdG5ITjVlZ0lQMWtNcHA4L2l0Q0NTQ3d6UEFZ?=
 =?utf-8?B?WlMwR1lSSHNXdzZkc3dGdHN1YnlPWEdpZTNrc0xPMmJYbDJPQWM0UWNmZ0JQ?=
 =?utf-8?B?ZjRtV1VnSXRHVDJ4TzBDamlVem96SHNtSVEwMEdIejBzZ0t6c0tkN0dWa0FR?=
 =?utf-8?B?NmY3SVNNanBHTEtEM0xLeFRlMWRYRzlyNFh4Z1RoSEhsR252anlPR0Vhdm41?=
 =?utf-8?Q?9pEAtkVEjGMGCQjs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52055c12-a8df-4956-3f84-08de582d4d51
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 14:07:52.9222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ggXVF6dV+wqHD5TKDcstP3q/sRnzesrTFNXkPj2qCKMPjsZHe/zIrQFTnVM+eVHiDazRD1obWA5cX5l9kuXho+qf9+jI+NVFGK6UsUkbb9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5632
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:email,citrix.com:dkim,citrix.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4F39748215
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/01/2026 9:38 am, Alejandro Vallejo wrote:
> It's only used for microcode loading on x86. By lib-ifying it we can make
> it go away automatically when microcode loading becomes an optional
> feature in follow-up patches.
>
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

