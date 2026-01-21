Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COLWAk0rcWniewAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 20:38:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 699465C582
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 20:38:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210242.1522031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vie1X-0000wt-8P; Wed, 21 Jan 2026 19:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210242.1522031; Wed, 21 Jan 2026 19:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vie1X-0000u6-4o; Wed, 21 Jan 2026 19:37:51 +0000
Received: by outflank-mailman (input) for mailman id 1210242;
 Wed, 21 Jan 2026 19:37:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GdGN=72=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vie1V-0000u0-RQ
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 19:37:49 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a958ae2d-f700-11f0-9ccf-f158ae23cfc8;
 Wed, 21 Jan 2026 20:37:47 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ2PR03MB7499.namprd03.prod.outlook.com (2603:10b6:a03:556::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 19:37:31 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 19:37:31 +0000
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
X-Inumbo-ID: a958ae2d-f700-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m/89oHjKfvI/zsGj4o2Bp6lxE7FRYYBadjUTvmTpcTDIpcbyMJGCfu/4zenRHswB8kVDGqeAoev1m/XXqxoApSay4pJzgdPu1dhA+bi53BL57b1KFJQmZKArSOaJQCzSdPSHZQChGYfmHOrfMkHze/w9XKtFSwgAhmn1hyoEPbNjVPgMddfGi+w7X2vyQpOOem7+vjE6bPpFP7ZVRZMrpU/sUkepvhkgdIpmWluvx5y2sDFxgfV6MGX1V9ie5TDljhGvRvHA13o3L8dn26av/IqOhp8mpgX+9xIy4wIDLT/qd3YWQ6B8PufxlBTXSAu2mwVb3HLxca1uQUqLMc6+qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSIQnihWBTGLNNhyFlRPTs2hQiNRhL30wvoBa53DoMg=;
 b=b0QFxkeYMnAKy/LQqSu5ZizwVrP5f7+rfzv0mH/58zwQPJqRszZC0ZOIsUsNfXjPbBEpgzpR/04/iE5WMPOwm8Or1pPxOh05v+NmN9BvxEvXp9/eEEBY4gqTQbVqZiABXFtOTVYtBCk4NSDaudLEnqTmvs30jz73NinRDELrwZmc5/KZXbU6ahbKb9hjYOdyJ12MYdb1vQ8tQBxJNqKbcHwzS+u5WaJGX2AoJ0mHmx+J077GuMLHfy/BmfsakA1QetgHXjm1T9ymcQXbqpIzxeb2UX2Yea5e8gL2yrTto6d8USE5F0GEQsWiqJfGeaYFcogRlKF2vxHh8YMl6X872g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSIQnihWBTGLNNhyFlRPTs2hQiNRhL30wvoBa53DoMg=;
 b=IshFluRlEh08SDESxD4R++KOl4pfJCzzgJukhW6AECSZg1Wl1+j0L4jmoPruZD2z2zky3uUT57QoeHfP5wslQl13KVlTNXG5niln8Jv355nCYaSPMlcnvBkHHbA4WkKvvIU4KTATd7VkiRnZvmeRVW4kvsFJwNCz4ANR90tU8gU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <546d2385-5119-408b-9da2-35e09d2e7536@citrix.com>
Date: Wed, 21 Jan 2026 19:37:27 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH v5 2/2] earlycpio: lib-ify earlycpio.c
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260121154757.44350-1-alejandro.garciavallejo@amd.com>
 <20260121154757.44350-3-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260121154757.44350-3-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0154.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ2PR03MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: 08f17da6-a2cd-4440-a65b-08de592484ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3FiK3k4djBGYzhjZXNlNDF1eE1ucjFZQTJmVzhxQit3aDZqVW5oRXR1L1Fp?=
 =?utf-8?B?U1BHSnFnVWs0dVlKRHV5RkNjem9ZQVo3QWFxeGl4RVN4V0ZMNmhlYnpCQzU1?=
 =?utf-8?B?QW8xOU56NlpGeWE2RVhvL1drV0xwbVhpNHZNWlZBQlR6Vml1UkFMR2Q3OG9F?=
 =?utf-8?B?QTNFY3R5YXYvYjROdFZWR0s1allhbnhlc09nbUJycjVaQ2ZVbjBqNWgzWjY4?=
 =?utf-8?B?NlUyYzdtZHk3akRyRGF3NllVRWxTSStYQUNvUzgyTmttS2JHN1pMME9ZMkMz?=
 =?utf-8?B?QTRKN0I0ZUVPZHpCaDdQV29KK2tWK3lrNlZQS2N0eGVXQWxub1B4ZXlxZ041?=
 =?utf-8?B?RUZIa2wrdUdPa3ZQaiszVXZtL2tLZXVDTU4xLy9wY2drVTdPQTdvMmdpSEJu?=
 =?utf-8?B?MCtiTS9QdmFnQjRVYzNRc2F4M09pUXpKSUtUQ3FPd3ZtSHFDckMyL1VsbDFZ?=
 =?utf-8?B?NjVUWjF5RmFDdlAwUXBRQUhkamtHdHNLN2h4MlV3OXpKZklOTGZOOGNreG9O?=
 =?utf-8?B?TGhQbXBWdjRTWVNkQ01Nam1LMGkvK0tTMkN4ck9jQ25NSVVNS21JbnlyMXZh?=
 =?utf-8?B?NWZxSWVhL1JrYzN6Yy96WnJFc0Q4QlNOWTNJUUtZTlYvaU8xU2sraDllN1B0?=
 =?utf-8?B?SFFPbFBteFRONkRzRktFdXFsOVF6SWtXSk1kUFZ0TzFMNGlKTTRadTMvbnox?=
 =?utf-8?B?RWFkN3FldE0va3BPVXAzS25KdG52M2JJdi9yU3VQcG5aaTFVTUhpT1JFVXk1?=
 =?utf-8?B?ZzBRcGcxTFF2UXdtSVp0U09ubU11RVg4YmtIQlhDV2dDWFVwQm11S2FqMjky?=
 =?utf-8?B?SVdQc3p6QTg4ckdRdTRPQmxmZlNDS0U3K3RxOC94SUlBY1FUd0hmb1VOaVE4?=
 =?utf-8?B?bG5LVHBXY0J4MjYxektRK3kvbndvSlhDb3ZWQ25pUS9nL21lUEFqdFMxY0NB?=
 =?utf-8?B?YUt6NURTYnhIZ0orUFFMVm1HdFBZd3JJZzdxQjFKWHQvNUlQc3p1UUt2MmVT?=
 =?utf-8?B?UG1INks2V0tZZEFyUnhLWk0xbC9mQW1rd05NbGcwa2NZSjQvNW52ejBzSnM5?=
 =?utf-8?B?VDlGQXpsZWpQRlZ2dWlhL0Q0bk5LWDVKN3YzSjFBeUZwRGo1Unprc3psa2xK?=
 =?utf-8?B?eFRFQU5mNngwMzc4ZTJYYjRSeHNuQlpRVitXdU4xVlRGbnZpcXFLaDc4YnZy?=
 =?utf-8?B?Nm1HaUxadCtzMjJCKzM4MTRIVlN3Y25FS1RscHRnUzNMYkdIMTJ0cHY3VlM0?=
 =?utf-8?B?T3ZybkZwa2IzaUdyMnlXSkJ0YVM5Wk5iS1pESVdsdlU1SDdPZXpPMHY1ZExh?=
 =?utf-8?B?d2tKSTNNOXJOMzBEYTZhdVZMTDJta1lBODUvczNKUEVXZnEwd0VaSFZOaHBU?=
 =?utf-8?B?UlI0SG5OMUdwcy9nL0taWUlZdGpmaHNYQnNMaFpBU2tTM2l1elZZd05PWnll?=
 =?utf-8?B?RzVveEdHenA1WmJKZGxTSVFvYlpyT2VZcVNSZFBzenRwRWsvV1VTb2Jua0Fk?=
 =?utf-8?B?VEVMUk1nTzFUSE5lR1lzUCthTlQreTRURy9Sdi9EbVZSL3pKWEtkWno2bmdD?=
 =?utf-8?B?NkF0NHRORUcvZGZ6UVZ3eGpqUkxCWjdmUjlSN2F3ekdISFNwOVdrK29ITlRD?=
 =?utf-8?B?dzhyWjBETWxqRHJNdmxtR3Mrb1dTS3AwZFprL2p6UXhpV2hFWklpODQwNmVN?=
 =?utf-8?B?UmpERi9VcGxUVzB2bGRrOUZEbnd4Zk95Z3laZEg3a2xOT2kyRTNhdnpmazdX?=
 =?utf-8?B?dE5QMnp0b05XMFdONmw4L3Z4RUpXT1U0MkZOZHpNeTFvWVBmRTArTG54VDlp?=
 =?utf-8?B?NitzQlRLcDV3T29SZVRaZjZneG4wNVRZVTFHN0VOOHo3dmRodlBxUkI5dHcv?=
 =?utf-8?B?cnNYdXNhdkJISGY5WGZXU2tER2FadmtDNDU3Z1V2UFdZMTdjNDdORTd2Y0pu?=
 =?utf-8?B?K0VVeER4S2lBaXFtYXJuWFpHTXA0aWRBWVpDbkJvVGNtajFSVFlNM2RPY1Q5?=
 =?utf-8?B?d0wreVNMWmIrVHdJY29YZ1ZPMHVoeGVTcm9sb0FwendKQTlWdzJBM3c3eVdj?=
 =?utf-8?B?ODhyN0JTTzI3a0VNS2JqYVJMcVBGZjVkc0syYitqYk1MYzh0QWwxRmduTHZr?=
 =?utf-8?Q?UGIk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2prdjVzenhQNUtxb0dvMSswQk40STdHWGVEVElzZjVHbVZwU0FnaHpUQVFv?=
 =?utf-8?B?eVJWcVozR3dVOGpvTFJ1bjNlYVFKQ1JoUFNPNFdnOW1VZ0FGbzByNlU0QjBQ?=
 =?utf-8?B?RDUwZnpjNkowbVlvTGF5ZUMzSFJhTWtqMG01NWxqdVdnVTlSQUYrMmtFMjhP?=
 =?utf-8?B?bFc5TU03ZEZiTzE2VytvK2FJWk5GV1ZrbkJOVDV4Vk1GM3d4TDNMUE5GQzZy?=
 =?utf-8?B?RXRIcm5yMWcyaTFzM0prZUVrejNPZzJKL1FiVVIrU2Rjb3JURjJoeVB4Q1Js?=
 =?utf-8?B?MXliOEM1aTVNcjZmb2laVXdaeFdkM05UNDBGL1RVUElia0d1VThiYkE2bm1X?=
 =?utf-8?B?UjNpbGdqSTRkMFY0UWRDNlpqZ24zbXlYdDQ4b2xGbjUzZVBZRXNsZDZSMlBW?=
 =?utf-8?B?dlVBaHBYUkoxK24zc1V2cDVMK2VJVDFpbEhFTUI5SjNhbVdHb2QwUXBmcmIw?=
 =?utf-8?B?MG1XK0F2cTVXUTFnOWVaTXlGT3F1YzIrUGhsSHlpQ1Fpc0svdWVScjhqUCtl?=
 =?utf-8?B?eW4wMWlZUWlHVE40dFpFbWRwM2psS1ozOWZPQytnVnVHclZhYVluanZ5QzNu?=
 =?utf-8?B?TnkwMWx0ZTNYSTBSdHJpeUs0ZHBNUkllMkpNcGNyYkpibG1ZWm90ZjFMZ2l1?=
 =?utf-8?B?R25PQ1hYbDlzMXJqeFhab2x2aE5mdlRSaEVkdzl3UENoc0lHRTZnV29vbGZh?=
 =?utf-8?B?RUcxSHROWWNyMHVnUHNmbmRkRmd2VW4vS3FzZHdaNWVUL1dmaExSTEVSUGJ4?=
 =?utf-8?B?OHlacjZ5YTJDN09Fc21jc1BJazF2bktnZGtncnpyczViTzJDYVBhdUd4Ly9U?=
 =?utf-8?B?dU4zcUozUGZpVzM5L1E5TkVRcWo3RTlPNkg0WFprWWZZbWtoTEhEMmI2VC83?=
 =?utf-8?B?Y2dDYmU3WUN1ZmRsWHk2MHEvRFFDelVLOUk2V1pENHhHY1dmaVlLZklsVTVl?=
 =?utf-8?B?Z1V4eG4vN2NBTW8wbmNRVklMQ3hSdTZ0WmtBbFQ2bkxCaUJyYkhNNzVRV1dy?=
 =?utf-8?B?dTk1cFpiUWRVMVB2aEVNVCs0amZORU9wTzlobldHejNPTm91Q081UGx5aFdy?=
 =?utf-8?B?eVQ5OHRlbHNUTEU2TWx0ck13MWVYS2VtTmphWEtuV0pNOTB0cys3MUI4UnVX?=
 =?utf-8?B?ZURVZGRlNHZoa2hHVXJuNU9HaGRiV3NZWk9ma0I0aVIycVRtb3dhd3lmSFhW?=
 =?utf-8?B?NnBmcGpvMHJCc2dHMC9pQ2tLQTVqL0tIRE9ZaFdBclM3TUNGaE11SkNpcVFY?=
 =?utf-8?B?NkM1R3J6eDNva0hLUy9YTUNmT1RPd085eUhpMHNYcWNjS1gzbVZ6MWdqYlgv?=
 =?utf-8?B?T3MyK2pESm5vZE5hWXZNK0l5VzlVb3czNEUwSnRxaFpVZThHT1JlRm9mR1Bs?=
 =?utf-8?B?VHU0UURhWEs0K3gwb0VJNFpxVlZEYmJuVFc0T3dSMFdNT00wZEZubXBJa2Js?=
 =?utf-8?B?Y0pWT1JyYjBDSFBKcXNyWHB3dFh3Y0EwaTBLU3UzMlNVYVkyWWZpdHZsYmRK?=
 =?utf-8?B?S2NQcHdaS1hJNWZGbGppWm1PRkFTakpJN3NncVh1VjBETlRJQnoyYWJuTS9x?=
 =?utf-8?B?NnhXOFpwWUQ2SzJQMlM3Tks2eFd1c0Z3dGdYbkw1Rk1waWw3MmxUNy9FcTRl?=
 =?utf-8?B?aW5uUURNVWhVWlFHNG1LTGtORkd0U3EzdVVpRkE2Nm9WQ3gvTmFXOWpFREox?=
 =?utf-8?B?ODQvb0hMeVduMVBaYVdtYU90Unp6ZnBHa1Rnc2FQRlZXcUZxdll6RnNrRHU5?=
 =?utf-8?B?V1JLUStuK1NTRlpza3BEY3VKbnJ1NmlJd3F2Nkh0R05XRzVzdnlqZTJ6L3Rn?=
 =?utf-8?B?ei9ra1JneE9aZnowMEh2cndLM1FCSEE4RTNkR3ZwRG85T1l4NHZHWXVmY2Nx?=
 =?utf-8?B?QXpiYzRXS0l4dVB0VVFETTRBZEdocnIrQWVwTjNVZkV3U25JR2Uya3ZpZlh1?=
 =?utf-8?B?TCtzT05CL2tPRm5KVmhDRVZIaUR3TXBncGdQVmw0RWovN3l4NDlteEIrYkY0?=
 =?utf-8?B?V0drNktHQVhJSlhXWVpiQUdPdjUwbXhQVmxGOXpiM1dEcmMrL3dyelN3NXNo?=
 =?utf-8?B?Nzg5RGthOTlKbUtqNlAyRURSbWN6REl6Q3FVeHUxdDdwWERCZmhiZE9BUXNr?=
 =?utf-8?B?dmJzelRTTHJVKzlabGVhQUVtN3lGN0l1cmJJWE5mNzVDcGVPWVdsSmJwdDFC?=
 =?utf-8?B?cFpwS2xramN6NzlPMTF6Zk1TdTJyUFRjei9Ia2NUbEkrNG52eWhBdndGWnhr?=
 =?utf-8?B?NGdIM0VqR1RYTlg5ejNlUW5MTXZ4RCt4cS9kVWR5L1ZWUTVqU1N2UVFGbXZs?=
 =?utf-8?B?VEF1OXF5UWxFRFdORHdPMk5yZWZDbGhBdUdNb0grc3VxWm5oYzJub1lXMzZD?=
 =?utf-8?Q?RbeUkvtPlIbP1SYY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f17da6-a2cd-4440-a65b-08de592484ad
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 19:37:31.5371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EzezxlJn6PzZ28jpZhI7XHA4YlhpbfJ1EGgMPo7Pl6cAe+UwyfAeVk7Gj+9qstKt9dR+K4b+x/NPi8kSgqh310aQXNRsjFqNyggerwqWMG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7499
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,bugseng.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:email,citrix.com:dkim,citrix.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:nicola.vetrini@bugseng.com,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 699465C582
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21/01/2026 3:47 pm, Alejandro Vallejo wrote:
> It's only used for microcode loading on x86. By lib-ifying it we can make
> it go away automatically when microcode loading becomes an optional
> feature in follow-up patches.

Given what's committed, this becomes "when CONFIG_MICROCODE_LOADING=n" now.

> The exclude-list.json file goes stale after the move, so remove the entry
> for earlycpio.c now that it's not included in AMD's build.
>
> Its breakages will be fixed in due time and not ignored.

---8<---
exclude-list.json becomes stale with the move, but earlycpio is now
absent entirely in the *-amd target build, so the violations don't matter.

Simply drop the exclusion, so the logic gets scanned as part of the
*-allcode targets.
---8<---


>
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com> # lib-ify only
> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com> # exclude-list.json

Consider my A-by extended to a full R-by, and this looks fine to go in now.

~Andrew

