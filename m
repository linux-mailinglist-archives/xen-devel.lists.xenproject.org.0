Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B43CFF147
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 18:23:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197047.1514720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdXEf-0005Tu-Ff; Wed, 07 Jan 2026 17:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197047.1514720; Wed, 07 Jan 2026 17:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdXEf-0005Rd-Cb; Wed, 07 Jan 2026 17:22:17 +0000
Received: by outflank-mailman (input) for mailman id 1197047;
 Wed, 07 Jan 2026 17:22:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PFOO=7M=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vdXEe-0005RX-18
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 17:22:16 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68652112-ebed-11f0-b15e-2bf370ae4941;
 Wed, 07 Jan 2026 18:22:15 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS7PR03MB5493.namprd03.prod.outlook.com (2603:10b6:5:2cb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 17:22:10 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 17:22:09 +0000
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
X-Inumbo-ID: 68652112-ebed-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+Xq+h+dOngc8N6IMxYRWxqF7csN5yjsAYx1p8E7y/nOWM5eUa1FW8yt/0oSOR46U5tJouFetzCyYfRQ2/1hgfCcvL76N3qjS/xakm25cUldqLTPQV6ckzDkP679OTjUR8KnJI6melzRaaWPNnxZz1Ad6trB3VYGNKeezHg9kRg3duT3scYDb1KaNEDYkTk8CfaoKi00y9+Gu60LBMTyyUlEdcXyHuVe25Q/Ma+q4X5tBp2NjO9Q9VzXBRifUUxOe0kmtigdQfSj7+sEIRsu3o2Zqwz7h/o9Du1UCTZ3WevaBq8KHSsL7NYI0Zimk1OZcdbVbC9Ba0HrS+cnXd339g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPYlnYbBbiSiGYzw8Mr7Ua51lO3OKfKwABQ+pvjgi5U=;
 b=WAEKBmdUeHayUNxFWTlS9I3AqnYgvBEQ/5bOcbxqeNirFqWebR3aO5dwN4ASKaSL7jMpoMkjhMPAEj25sG/c7Ulq96k90sNh2K2tqqLIYCLhap8yA65FQiEOYu0huXB298G8yhQhLkfkC2OpuP4dGYGMXFJE5dltO1fZMjNrP3ZynWeal8L6Xh/17PrmwSyukac32ByXLheuyYYnqvR7KY4k11dBuJvy8hHd6cvyTJiM0V4qZFnxa/9t4cRljW6FgCNFbscO86Kk73mAvb8o5SK/YUNxcPOKhRjtfSE/mnq8gmB2DLxGh6DuhI5fuLdrsF2EakwNWuAPa/HXME6C/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPYlnYbBbiSiGYzw8Mr7Ua51lO3OKfKwABQ+pvjgi5U=;
 b=WsRfm6YjY8lufbPfv+Qwbvh18WM7HHYgrHp3bS3DmgLvUIx9nmoOZbkEjyLMNL86bWh9jvGKY4VyRWsdHFbEmks61TK+p7PVHeEqncx5q/uO1KwdYiL/GgoqZ+DqwqskjE6R142YLZgfOWqDmyGCCEHqdwOZ5j3pPRPt1JlVluY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 7 Jan 2026 18:22:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1 0/2] x86/pci: MMCFG improvements and always use it if
 available
Message-ID: <aV6WPQlni-gkRCVo@Mac.lan>
References: <cover.1767804090.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1767804090.git.teddy.astie@vates.tech>
X-ClientProxiedBy: PA7P264CA0372.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:37c::29) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS7PR03MB5493:EE_
X-MS-Office365-Filtering-Correlation-Id: 69ec1295-aa52-4369-8103-08de4e114a01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3hVcGxJdERkeXpQVWpVTGlGaGRRaFJNQmFyTXNpUXBHcm5TdFllSFBBVWhX?=
 =?utf-8?B?Tk1WZVJMS1p6U3RPbjliQ0tpR2hnRFFjaHplOEZLWkl1ZWNmdTh1eit4WmY2?=
 =?utf-8?B?Yy9vak9EMXJlRGpybDFENHh3R0JVRFhqWEtnb09Tb3p2T3A0c3JGbjhIRUJJ?=
 =?utf-8?B?NENubHZWYnQ1R1A0MElBekQwdVFieDc3Y2tvbnd5UWxXM2gzdmZHNmRMN3NR?=
 =?utf-8?B?RUJCOGdYSjRXcld4U1FONDYzUW50N0dOeG56blpPOExvaVJ6K2Yza0RxK3lL?=
 =?utf-8?B?RkpkZDM5OTlUdzgzVi9tZHMvNjdrK1EwbVpTUXpTalZGVUVSN0hWWURidUhi?=
 =?utf-8?B?SGRFczBzK1BVUGJCR0J0bzZGSjBuaHdwSStMenN5OUdmcks2S1N4T2g3ZEtt?=
 =?utf-8?B?NHc4VTVMRTMxRGZlUnJkczRuZjgrQWpyTVJGVEY3YXVWdUdjWGVySVZTYVFU?=
 =?utf-8?B?cTM4bnZOSE1WMm1jU2lEVm82TWdWV1BNQy9RNDJuN1J0K1RKYTZ2aTVKbzF6?=
 =?utf-8?B?dGlHQWVqM25Rbk0rTEZQcmplWktKWTByZ3ZQVHl0UEVzcW9pQ0hFRlVGVGtw?=
 =?utf-8?B?RG5sTjZnSFFhWnl5akNQeE9EQ2JXbDJYREU4MFJlQ0FXRGxoSVJaeWM2NmJQ?=
 =?utf-8?B?Q2xuZ3pzK2VleUVJbXdwNHFhK05ZM1lKc1U2a1FnNXorSE8waDQrTFp1WEtS?=
 =?utf-8?B?Y3FJcmNBTXpYM2N4RlJoOWI5UGNINlNPOEFzZDR2VzBNQktzVWRlUmErajNy?=
 =?utf-8?B?THQ0VVh4enFxakNlbDdYN25MTVorMUtoRmtNSVlHQWdObkFyenl1c0JENTMy?=
 =?utf-8?B?ZU1VRFFFamlaYkI2d20yQm1HVkZ4N1o2Wlp0RlVTVk9rcE41Mm4rbjY5bmJY?=
 =?utf-8?B?NGZ4RHVlcDNqNkVwQ2VObS93NDVjRzdYRVRUblQzOWVpNHlDdWVkeXZwbktJ?=
 =?utf-8?B?ckQrY2ZJSE1nT3lLWE1JYWt2cVNjTEpSeVMvU3Z6TmFuS09Iem5rVGFSTmwx?=
 =?utf-8?B?eUtDd1VvRmNVK1RpayttM2hXS3Byc0JnbFd4bW5HSjBFaGNNczRBT3RoL2V0?=
 =?utf-8?B?b29qU05wV3IrcHJjYzVOZlhkTEc4aGVWeTVEZU5wVnVJTjVDb1Nnbm9nSXQz?=
 =?utf-8?B?SzNJNU95MlRhYlYzUFdyRVptcVNZbmV5dHhtU3Foa2FCc0o1NFcwNk81ZEpU?=
 =?utf-8?B?ci8ycU1pa1ZESkhQbDlvVG1zQmRwbWJIVGhad05hRU1FSXRvcW9ZV2FLUGox?=
 =?utf-8?B?Rll4NlYrSjFmendPWWh5azRYSzk3bCthV3lHeWxYczNnSy9vYXY3YlA2YkpD?=
 =?utf-8?B?VFJzWVUxVStidE9mNkFPYkQwTTV0a0VBTllWUFdDS0Z2bGFsNkdmZ0dhQmpO?=
 =?utf-8?B?Mko1R0UvRm13RkdxdWVIaHJuQ1ZsZlZ0Q3hHbVVlNDIvWDdFWldDZUEzdllp?=
 =?utf-8?B?Z2ZVcm9ZTFVPaGVhOXVDTjBIZGFKM2JJN2pmZHJvZjZrdXE3UFBzcVlJdjQ1?=
 =?utf-8?B?bktXUVppcHU2Q0tTZk00OXNNOFZUdjFPa0hOdTd1T09tV2w5RmczemoycXZE?=
 =?utf-8?B?VDU0Z2w2bGhmYnBYRTYxVzZxbC9yTXR2MUN4NnV4ZkZYT0djZVBKZWFWUzg0?=
 =?utf-8?B?YmpmWDc0Mk1la2FIenc4NFkrT210UW9tRk9IMCtTQk52UUVlZTV5UjlsZGs0?=
 =?utf-8?B?ZlQyMlYvZEg3cytHL24xS3dpWU9mdFhEWUNPQnZpQzg5alV1VlVxQllaWmRo?=
 =?utf-8?B?V1NrcENXZ0NIckQzV1d0aVRYeVA3RW9wdmZ1dUhwRThDdWFHTFJxMzF2K1gv?=
 =?utf-8?B?QWZmU1dkSnE0Y3lZenNyNk5Hblk4MlloU1VZMVBvUHE0NlUra3ZsRUdOT3M2?=
 =?utf-8?B?Q3pmeU9pdlZadzJUS3JaQXEvblJUaUl6bnFOWEtxQTFlNHhPSFNySktqRksz?=
 =?utf-8?Q?bGG/kyAWVOiZ9qH1lC0tfguYNO/5Skg2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTBYT2tPc2pTTzV0R1lkSUk2dWVDV3Z6bGlpYzd1MGZOWXlLaVVXaEVOeGM1?=
 =?utf-8?B?empBYjBKY242cThqQ3FmaFlEZURuZWx5ODBibHU1Y0o1dVMxUmdTNXlaR1ZK?=
 =?utf-8?B?ZDdMVUxJcTg1aFBUYmpyUjVjVVp0RXk3aHFOczNkSlRwZTdLaE9ZQ3BVaGgw?=
 =?utf-8?B?SVo1RkVMS0xZVmRYYzI2K1FmZk10UHkwRGFDRUVQTWtJamRaeXNSR3hmdXB5?=
 =?utf-8?B?a0hYeTNXUlBGRnR6Q2FTb003aTZCbGdRY1MxaG42dWF1MElOdCt6dUVPcDFX?=
 =?utf-8?B?NG1HcXVScGZmVW8vRU5rNWNxaTFOQXE0eXVWSm9HUWRDOUJwNGp1c0RNT1lk?=
 =?utf-8?B?bGxydHN6Vk1UZC9XMGtPNTdlT1pKVG9KcVBaeW1obytPNE5sNGJEa2FDWms2?=
 =?utf-8?B?QXQ0L3AwTy9YcGdScDFZRTZlV2Qvam5SOGFYaDg3MjFRMmpsVFRZc2RROTZM?=
 =?utf-8?B?aCtwbC9sdGJocDZUUWFLVTdIUmlwRnJnS0haNTZ0Q3NONERGYm1YY05GWFQx?=
 =?utf-8?B?dnhNMGV4ckJGbjFBQzRDQ3lqdDRiN1M0ZjJSSzJHUlNaVTJZOXlXbFk3RU11?=
 =?utf-8?B?bE9tMlc0amMvbklzT1huaTdiZ3drQnpwQUhmdE1HdHU0WENDa1dMeXhGc0RQ?=
 =?utf-8?B?empKVHZ4cW9EQlRNaDNzQ25tOG9sZ3VabmJvZFliMGhlK0QxdnhFR1dUTDU5?=
 =?utf-8?B?anF2V1lPSmxmQlRRaHlrWis5SWRXbEpQbTdkeWUwSVBsUjNZQmZTdi9XTFJj?=
 =?utf-8?B?MHdIMU9TQ2Njd25wSTBJaUtmWGFqSkNMRUxkM0FQcW5XQnVNR3pQSWpuY05w?=
 =?utf-8?B?ZlI2aHBhMGIrWiszRUpDOVZhYU9GM1NtajI2RHk4SmhXUW1WSW5TS002STVR?=
 =?utf-8?B?TXhRVkNvSE1nek81NHdQM3htSU1wL2ZPOENXMFVzcFY0a0w0ZXdIYTVTWHpV?=
 =?utf-8?B?SlJkcGsvQ2VmYXFicDY3Tndia3h4M2xjVHhZU2Z2UnIvN1BhUmxHYXJCZmFC?=
 =?utf-8?B?TFY4NGNJMGR0TnBRVU1Rczc0eFUwNU5hT2tkUEx4cWxQN2cwUlFvMWtKMHZO?=
 =?utf-8?B?SjNBbkI0ZEJxUDBQMU4vUWlkTTkxTFFDbE9HSVlpblJ4V3htemltNDU0NWdY?=
 =?utf-8?B?aXVPU0NCSVZwLzJ2NkpVdGk4Z1ROSVpiK0hwZEdIR2NXeDVhbC82cG1MVkJD?=
 =?utf-8?B?SVY4V0dJZStsSFJyZUNlK1ZMQ0N4NjRnbWRZc2luUnBDdzI2UnJ5REljMXhF?=
 =?utf-8?B?Rit2VkRwWmZaNHlNVEpuMkpqYXdQTW5WUnQxR0VZZk5XUE4wRnZqK0lLdXNx?=
 =?utf-8?B?UnJjUFRodmhXWTVXOUNVM3ZuV2xLdnNaa201L3JMckcrRXR4bkpKOG5ISlUw?=
 =?utf-8?B?ZG5nRWJsRyt2Q1VnZVBWbDRyK2JmOWhHVUIzSGwrM1BlMWt2VVpyWXk5OVVs?=
 =?utf-8?B?ZFl3cXFxNDNXNVo3VFluY3dIZzFmYjVrNHlXTE0wVGVkNWNXT3dvT01xYW14?=
 =?utf-8?B?WnVZNnVvM24xWXhDYmZhc3VGQm1NRHRPMGdVTU5weGdQM3M4SmlDaVZsUXhj?=
 =?utf-8?B?WGl5VTlxbXdJa3JkTmx6NWhrbjF1L3lDc3hZUEtyOXhyUmtiZ1hVTzJkWW1L?=
 =?utf-8?B?ZUpQT09PdE5yaUVDSFZvREYzTWgrOURYNE1paVc3c3pUWnpKWjhaYVNKUEMr?=
 =?utf-8?B?WlJyRXpRY1JYSFpGbjN2OGRWSUZNRVRHLzNocjAxZVVOcEZKQWc5dEoxS2RG?=
 =?utf-8?B?SWVtS2E2d3NrR3I5NXFidWlFN3dvME5NMnZpMUJicURaNjBYdTJFbmZXSDRr?=
 =?utf-8?B?dzROMjNxM2p4cDg4eUM1dHBQam44a1BhaTJzSXZlMXN3Zjk2TmE0a1B1LzhK?=
 =?utf-8?B?ZDBtVXlZbGp0NWNFTWFyTkVybnE2U0FGT1BoM0xoeGRyV25rSjdpRlIvMVE3?=
 =?utf-8?B?MG5lbGM1dFlhV0Zsdmd5VG5pZDZ6d3ZoOExSSEhyMXlhWThjYml3NDYwSDZq?=
 =?utf-8?B?ZnR3RVJpbEp0UUllV0lmUTNXdVUvZERKc0RRTlpzNGxVZmhZOVZHT0laUzQw?=
 =?utf-8?B?YmkxYmRXeGdVTnBHZUFianYzV2NKSjVQenh0K3VYZzB5WHlTdjhGZHdWV1U3?=
 =?utf-8?B?OWRQQllkdDFyQlA0WUtXZi94UXJLR3JsWUhPS2IrTUFQNFZQYUVaNTI3dm1n?=
 =?utf-8?B?djd5dERaYW45NklUREJmdlJpQzRoT0dJeU9IeU1iSC9tUFpGS0VIdU4xTXdh?=
 =?utf-8?B?QUVuaS9jR1JLUU9OUEFqUDVZdElXWnl4d2JOZ0ZmM29UTzlQd2xNaVFsUDFj?=
 =?utf-8?B?REpKclMvUXQzNlpEa2ErNC9vOEVoMUh6MjNKbHR2cjJmNUYzVGVKdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69ec1295-aa52-4369-8103-08de4e114a01
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 17:22:09.7537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ah6t++1jc53z4MiIXnZZ4rTzYsU9ZwLoFm1mG2zxKid94Z4pVBDZvaTgmwXCpiI9VJlYCRj1vhLljTQhvq0Ofg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5493

On Wed, Jan 07, 2026 at 04:54:55PM +0000, Teddy Astie wrote:
> Currently, Xen uses legacy method to access the configuration space unless the
> access cannot be made with it, where Xen fallbacks to MMCFG. This is not really
> great, as MMCFG is more flexible and doesn't require a dedicated lock, so it would
> be preferable to use it whenever possible.
> 
> Teddy Astie (2):
>   x86/pci: Improve pci_mmcfg_{read,write} error handling
>   x86/pci: Prefer using mmcfg for accessing configuration space

AFAICT Linux is using the same approach as Xen to perform PCI
accesses.  Registers below 256 on segment 0 are accessed using the
legacy method (IO ports), while the extended space is accessed using
MMCFG.  Do you know the reason for this?  I fear there might be
legacy devices/bridges (or root complexes?) where MMCFG is not
working as expected?

I think we need to understand why Xen (and Linux) do it this way so it
can be properly justified why it's safe to switch to a different
approach.

Thanks, Roger.

