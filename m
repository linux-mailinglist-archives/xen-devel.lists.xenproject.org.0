Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD7FA9B9FA
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 23:38:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966949.1356991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u84HI-0006HE-KT; Thu, 24 Apr 2025 21:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966949.1356991; Thu, 24 Apr 2025 21:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u84HI-0006F6-Hp; Thu, 24 Apr 2025 21:38:40 +0000
Received: by outflank-mailman (input) for mailman id 966949;
 Thu, 24 Apr 2025 21:38:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WO6P=XK=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1u84HH-0006F0-Jv
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 21:38:39 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20617.outbound.protection.outlook.com
 [2a01:111:f403:2413::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a143081-2154-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 23:38:37 +0200 (CEST)
Received: from IA0PR12MB8864.namprd12.prod.outlook.com (2603:10b6:208:485::16)
 by LV3PR12MB9120.namprd12.prod.outlook.com (2603:10b6:408:1a3::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Thu, 24 Apr
 2025 21:38:33 +0000
Received: from IA0PR12MB8864.namprd12.prod.outlook.com
 ([fe80::b579:5233:e4a2:9077]) by IA0PR12MB8864.namprd12.prod.outlook.com
 ([fe80::b579:5233:e4a2:9077%7]) with mapi id 15.20.8678.025; Thu, 24 Apr 2025
 21:38:32 +0000
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
X-Inumbo-ID: 7a143081-2154-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dXsztuMa0NtTJudCfYSplZvsq0W2s+xscciSt64vLrq0C8Uw3Nyy3P/rSar+zOcy/wgLxl4x3fGXgDQc+gH9uJZj+SznMbJJoI7yWmLXTpmvqCPagiFhzZHlq9SEci20+1BY4nG/oCf1+RD4MKjrWTMxfZwoYBwQ4JBstv49Cv2IKY/sUEDmPB/EqfYdd2yfDYz1wmiEJmNFGh4T1FKQCup0ApPxX2VQCOYHPFQa7mvT2W8mOlWJpcw4PwWMd65GPwGnaFs1xS9O5GnA/irgWXaUwsRbWOApgFVIkal9e7OGfUd2LHhnJDYIICY97zpY4sw8zNVqytA3YTKWKqwMNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2XKyGySSq3DgauchUF3lCVEgxnvamPXIGj3RBNtPxM=;
 b=fdf/g7uyFxelpMdmaiKR3AJEwA479DiZkhdfFNUzDaqV6neQNJ6ATsJkfVJq8W1gvNahlheWu/C7r0GV32Ur/QS9IBqv+5543mNHt+uNFdA2jv41cQyFGjkuBOQBydXG73ngCa2YQcYBuxa5jUFSdzh+7EJsnSPT5396gBhhGXW8xt1GCO0YcqJmhBdwBPE78cAk/faKuKtU/5tfuiH7zTKSfG6netQLXkTmgXivftyJi1O25SYV5lESL/MM+61I9IQVGNEyKzLCBw71suNgceQ46ak5SE+tVMHh8xEejJtKPCb/2bwovgVH9QO5UgFxaiApjZ6P0MReUywEIDIfYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u2XKyGySSq3DgauchUF3lCVEgxnvamPXIGj3RBNtPxM=;
 b=b/RZfJw/UbGiHOkQxBdvBn88OaI1mwDTk/bndhVNOEbEGcWvQkdtAOK42/oLgU9jnkHwicOXvB+ilFEbdbiCRKu2gVxIBwpHFuyW5FJnQiazh8XRgqyrZXTeS8XbGk/MOnBAYZHKcKBjxdit0HBnwJr0vpq4hqcJYLeuGpfuhIw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <554026de-bbb4-488f-95c4-8e2f034d6d0e@amd.com>
Date: Thu, 24 Apr 2025 14:38:29 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] xen/x86: allow overlaps with non-RAM regions
To: Jason Andryuk <jason.andryuk@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Xenia.Ragiadakou@amd.com,
 Alejandro.GarciaVallejo@amd.com
References: <alpine.DEB.2.22.394.2504031755440.3529306@ubuntu-linux-20-04-desktop>
 <Z--0USril0UIhR4R@macbook.lan> <3c5dfd26-3c12-498b-aca4-0beac4e991a5@amd.com>
 <Z_jFSb2-efexUNlL@macbook.lan> <9ed89e50-c645-407d-80b4-5b78cb6e36fa@amd.com>
 <Z_zGdE91KwlYxu_A@macbook.lan> <ce06ec74-1a73-4a02-87fc-3e829399cc77@amd.com>
 <aAnvRMgJxAskbCtE@macbook.lan> <aAoPNTsLjMMfsHvJ@mail-itl>
 <aAoW-kvpsWuPJwrC@macbook.lan> <775d3ac0-8f43-415a-a32d-14377092b96b@amd.com>
Content-Language: en-US
From: "Lira, Victor M" <VictorM.Lira@amd.com>
In-Reply-To: <775d3ac0-8f43-415a-a32d-14377092b96b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::10) To IA0PR12MB8864.namprd12.prod.outlook.com
 (2603:10b6:208:485::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8864:EE_|LV3PR12MB9120:EE_
X-MS-Office365-Filtering-Correlation-Id: f0ae7392-506e-4cf1-9986-08dd83785c50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkdUak9xVWhjN1BpazAzRU5ZQnpKMXh1NFY3RmM1Q0JjSnlPSjQyVUdwaE90?=
 =?utf-8?B?dXpJOUlzNzJMa2pOK3JoYWFLU1ZGanlsVmxCNXoyV1BkQ3h1THhwYk9PdmN1?=
 =?utf-8?B?NE1LVmlSTUNsQ1VURVQ4Mk1KQ1p1ZSt4ZHJhcWNKSy9wajZLdU1nNERUd1Uz?=
 =?utf-8?B?bm1DV0ovSk44eWFwL1BnZnVaRW05KzdWUENlaWVVM1czWHZQUE1hQ3d6Yldm?=
 =?utf-8?B?ZkdJQnBlUEgxSEhYSHJhdzNjR2k2TDdqMkFXakx3cXNnUVJHWldvcEtPaU9j?=
 =?utf-8?B?aWI5d1FKemQzUE1mK000NkRrWWRrYnRZUGVEK2xhakIrK3MxNitoblViQ0dN?=
 =?utf-8?B?RmdaS2VFa2FsdXZsMVZYR2M5TVk2UmZPZzBlMzRrMFJkT0w2ZS9LS0lKd0ZQ?=
 =?utf-8?B?clpPc2h3VUNaNGoyT01zZmVzamRYVEliUWdMQ1lkaURYRW9wMStMM3A1ZVFF?=
 =?utf-8?B?M1R2cGNiV2VsUFdCVFJQWGdpd0NvNWg1QzBDNHBveWtHc0hkVnpDU2UxQTkz?=
 =?utf-8?B?ZXl2b1BqakJIRjFubFpneUJQWlFWT20wL050MnpPZytqdWYzd0hWTWlyN1A3?=
 =?utf-8?B?Z21pZG81WDkycWtVMGtaMlVzaVNScS9INW1PdzQyYklCbU5oUW5Nem5CdStE?=
 =?utf-8?B?YzVuQUNGd3JPWW9jZnlmdmhXT0R2SmUvRVFiaHMyRXQ5U3VDNmxUZ05LSkdC?=
 =?utf-8?B?Wmdob3MrZHoxUWU1NW5Fdncvb1FGYXdWb0ExRVVESUVBS2RpVkdqQWl4Mkds?=
 =?utf-8?B?QkJwRS9hUGx1K3RjTkxFM3ZtMHR4akNSZlRYZ2VJYVdWbjZRT1Zqc1lscEx6?=
 =?utf-8?B?ZkRWMEJ4Njl1bU4rL21PRkhDQzN0M0QxNkFYdW0xSGt4NmZuVGNjL2NOaC9J?=
 =?utf-8?B?MGp1dGJTNzZxL0dLY1hrUkFpT0NmU1UzVEhIcUFKaDg5ZHh4alBxVDhGdnNC?=
 =?utf-8?B?ZHFTTkI4ZzlEdU5tRU44azRNVk54L3hqMzU1TnZ1VVVxSnNaMXlRam1SMWQ0?=
 =?utf-8?B?V3VzZ2JFRjZIWVZyRlZzZngwWXlSNTFDUHZtY01KT2YySDBTWWduQ1dhVVRK?=
 =?utf-8?B?K0pWVGdoYVV2VjZuSkVQYkZZR3BpbzNidXI3WG5oMEZOMEhRbWpXcVIvMEM4?=
 =?utf-8?B?a1NhT01ib3FHYVlkN3U4NUZTUThNMjltNUVGcmQ3c2E1dE92V2R2WHVFM1VB?=
 =?utf-8?B?MHVxZ0VDSXZSTC9keFd5MzY5Y0FvTkd4NjNYeGtkUWZncmlaWlIya3lhMG9Y?=
 =?utf-8?B?eGpyS0NTZ1VNSzJxU2lzdDNiWWloNjBZK1JsV1l5SmVpTU5IT21UOWJTdTNx?=
 =?utf-8?B?eURLSlJSc3FUSkhla2NzNHJkbG5tUkljQlp5NmhLd3VzNWhYaDZrQWZKTnVk?=
 =?utf-8?B?UjY3K1l3TzJqRHJjaER2ZnlhUDBDRUlYaERPUnIreUxGM3J3Mmdpa3ZpN2ds?=
 =?utf-8?B?emJhdW9mdXFCbHhNTlNRYU0vZWhLdlVaNzQ5dVc0V1Q3K25RRWFVRFVrT2FZ?=
 =?utf-8?B?Q3ZmYkJNWnpuWkt2ZWRkcFllTU1HaXA1ZGZtSHlsSWZvL0pTNktGdXRYSFhj?=
 =?utf-8?B?TUZZVnF1Z2cySWJHUzRNV1VVK0kwYVpPa1FSNmpsbWVLZnhMbWpMNjlmaEVw?=
 =?utf-8?B?cEw2Qm9rT0NRM0Z4MmMxRW42UG0zb2tvSTFUUHJuMVZaQ0lOSlRLWG9RZzdW?=
 =?utf-8?B?Vlg1Z2F5ODdYS25DZElMN2tZMUdGM05ud3pOQmtiSW5SR3VsUGYvR2cyOWRO?=
 =?utf-8?B?ZSs2MnRzbVhTVTAzc0RzWG5yTE1JekN5T3I2bzd5TkQzSko3N25zbWtvN1Vk?=
 =?utf-8?B?UWJueWMvZWVUOW5UOGxmOGlPdGUrSTAvZG5nNmxIdERxNThlOUZSUmVOSVZo?=
 =?utf-8?B?Uk5LVDNvdGdTWkQzNzg5NGVHRDd1UTlqSzM2c0FNdjM5aEg3OVpDaFZlWDVT?=
 =?utf-8?Q?A/ngV/1XKbM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8864.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUFucTR2SzBCWVlzZkhzUnZoRURDNWJySG01ZS9WK2NlR0V2bmRsTUpGUkh2?=
 =?utf-8?B?R2s3VUpobGJxaVlTVXBjaVc1UzJsVitGSFZQeDVHaFl5QmY5ZjBqemd3UGU5?=
 =?utf-8?B?UHVzTnVQeUo3SkZvcy9vcUUzbnVDRU9NSWp1OU1KOUtpdjAxSThoYkRzREFq?=
 =?utf-8?B?NW9WQngzQk1TV0t1enJ4ZjdIN1FuNnpsb3J2d1J1S0pUNElHSlpwWk1DaS9L?=
 =?utf-8?B?NG9kV3IxcmhScEQvSFhZNDVTUGQ3NE1KTXJpNi9RVFYvSmNXMk9rVmFqYUZa?=
 =?utf-8?B?ekRUcUtlcWtMeEprRUhMTGVZMVluSWhyamRMVHVQR01LQjdkc056TjEyazRq?=
 =?utf-8?B?OWxaNVJMYWlWVzI2anV5RFA3K2pqRDdzY21KaEMwamdJdFZVdkZXcm9JaC94?=
 =?utf-8?B?bUdKYUY3cU5DYmRjOUFpSzZkMXp5WjFOU1JWOXlseWRFNUpUVGdvWGpmYjRx?=
 =?utf-8?B?akRMRHRsajd6eFdJWEJVOHVvb1Rjd3NZR1RaN29kandnTGM1dHZBN1RYT3Zm?=
 =?utf-8?B?SkJvKzQ0SWJxSXNWTGNmRTBJUXhQVzdxNlZjZ25vQmpqWTJkdy94TFdLcWY1?=
 =?utf-8?B?M0sxRjVFdWFSMWtvNFpKK3JISWFJd1kxaU5nWFV2VHlWdE9rTTYyaElRYStX?=
 =?utf-8?B?K0ljeEd1R0h6VGd6V0tYS2x3cU9FejRHN2w4Y3hqeGtzcE5xOGRXZEZBVTdM?=
 =?utf-8?B?MEd6WmdCTUZwZHl1Z3g5amxBZU1Bd0k2VDRZc04vdXNDTXZaU1BoRVVvK0Mx?=
 =?utf-8?B?MnFZUXhzUmdkeWJWN3pkVkJmeGwzZjdZNVBXcjdhMjJ2UktuZUdFcE1VeThh?=
 =?utf-8?B?MFRvWlBxSjhsMFIrNVpKZ3pTZVZscVRhbi9sUWhDcE9jL1NqTGh2MHltN2xp?=
 =?utf-8?B?eUl5cW55TWVuekdBaHpMR2JZWWg5S3dISHZzQ3d6bkhOTjRVRDJXWGxHQU9O?=
 =?utf-8?B?VmxTZXoyMnFQNTdUUE5YYVI0MmJhT1lQTEg5d213dlMrM0Z1cmpNWnJIQlJO?=
 =?utf-8?B?Q1YyRTBJS0t5M1RjZENzQzZ4bmJwRUN1TUhFY3o2UWJDS2lsQkowRmtnM3RI?=
 =?utf-8?B?Z0dIVGNlU1IrZFhBMm10Z3E5Z3hySnNybGplTDhGakR5U0RHN0tHVDFRRzBx?=
 =?utf-8?B?S1FlNTRFbkNXS1lEUHh2czBXVHJLVFZwV1ZZV0w4RnUxc2g5SGRLcmN3Zjh5?=
 =?utf-8?B?UkhYQlRHR3ZUcXpMMW5EaVl0b0lkY1MrWVZDbjQ5SkN0UXVwd2VrM3NiQ1BZ?=
 =?utf-8?B?QUJBTlo5Rzdmb1R5L2RyWndhSEl4WnI5RVpvdFJmaUIzRGNHTUFGOHJUQXdD?=
 =?utf-8?B?UDlMYmpkZlhWbWNPbUtQN0wvTUZ1UERtSVV0c3V3cmZjUFN0cXJHa3dpVDc5?=
 =?utf-8?B?YjBxS2tXM1RYTGhKUkZYL1NZUEJheFc1L0lxQTRHeWwvcmdjeW5KakVvYmlN?=
 =?utf-8?B?LzY0ZFFaUXJtZkVyWGdTbDJNSEhOSzIzK2RRcHRCNkRZZXY2M25NdzM4U3Rr?=
 =?utf-8?B?cmtzV3VTL3RCcjA0NURUMUVkeGFEUWFHanlEeHc1TzJudHFERXN2VDZiWmpX?=
 =?utf-8?B?WjROZ2VSd3k5VWZRbEFLMjJaZElXQjZidXgwWlpWQkdkazZWdTBQUVgyLzE0?=
 =?utf-8?B?TlVHMGFuUkxFMnpGd3hlU1F0NFNaWlJXYVAvUyttR3V3NmJuV082Tm4vSWhF?=
 =?utf-8?B?QjBONktmcGxBT1c0cHBkYmp2emVKaFR6VGI5TzBoREU3OHlMTnBCaDEwOFoy?=
 =?utf-8?B?T1ZLZ28yaFhrQ2RLWE0yeW51ZjhLTVljWW96Vk1XWnI5RW43M3F0MytaQ2hG?=
 =?utf-8?B?dzErT1FmVHl6TGo5OHdwZFRWQ21lSThSWkQ1VFMzYWZ4TUY1ODJvK2JHLytk?=
 =?utf-8?B?MVFDN1l1bzF0a0dMc2ZITXFJc3NSNTdxanRIR3FuYVZmVUVUeGozRUpTRTdH?=
 =?utf-8?B?MVFzayszUS9jcEtjNnJlRmVoUTdCU05pR3pPR3pOQmpDWWV2NmFvRG5IamZ0?=
 =?utf-8?B?aFNFOEszdDhORlhtbEtVSkhFL2R6UFNwcE5GcGZyV1FqQnRtSmswZm5IbUJO?=
 =?utf-8?B?ZEtLVitrYkJPMXcwNnNGYUhRRCszM2hVWlRhQVJZNGN2YTVrUVl6eGJVYXVx?=
 =?utf-8?Q?re/G4QO3V+XvfxeJxfP/yA77C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0ae7392-506e-4cf1-9986-08dd83785c50
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8864.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 21:38:32.7317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JCUUIWR5KzGgmXNbW0nbAArXbvwqy49wSw9iTKVXn0RKc7E2+eEAe36aA7yyidZO71pNAucuCt921ar2/cYA3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9120

Hello all,

Here is the output from Roger's patch.
This is the section of interest:

> (XEN) [ 7.547326] d0 has maximum 3328PIRQs
> (XEN) [ 7.555644] *** Building a PVH Dom0 ***
> (XEN) [ 7.567780] d0: identity mappings for IOMMU:
> (XEN) [ 7.577312]  [00000000a0, 00000000ff] RW
> (XEN) [ 7.586153]  [0000009bff, 0000009fff] RW
> (XEN) [ 7.594992]  [00000cabc9, 00000cc14c] RW
> (XEN) [ 7.603866]  [00000cc389, 00000cc389] RW
> (XEN) [ 7.612707]  [00000cc70a, 00000cd1fe] RW
> (XEN) [ 7.621896]  [00000ce000, 00000cffff] RW
> (XEN) [ 7.630731]  [00000fd000, 00000fd2ff] RW
> (XEN) [ 7.639573]  [00000fd304, 00000febff] RW
> (XEN) [ 7.648414] gfn 0xfe800mfn 0xfe800type 5order 9
> (XEN) [ 7.658985] Xen WARNat arch/x86/mm/p2m-pt.c:599
> (XEN) [ 7.669215] ----[ Xen-4.21-unstable x86_64  debug=y  Tainted:   
> C    ]----
> ...
> (XEN) [ 8.227521] Xen call trace:
> (XEN) [ 8.234107]    [<ffff82d040309bd6>] R 
> arch/x86/mm/p2m-pt.c#p2m_pt_set_entry+0xc1/0x961
> (XEN) [ 8.250925]    [<ffff82d0402fbf0d>] F p2m_set_entry+0xb5/0x13c
> (XEN) [ 8.263579]    [<ffff82d0402fc091>] F 
> arch/x86/mm/p2m.c#set_typed_p2m_entry+0xfd/0x6f0
> (XEN) [ 8.280388]    [<ffff82d0402fdcd4>] F set_mmio_p2m_entry+0x62/0x6b
> (XEN) [ 8.293735]    [<ffff82d0402ff9cf>] F map_mmio_regions+0x77/0xcf
> (XEN) [ 8.306734]    [<ffff82d04042fc1b>] F 
> drivers/passthrough/x86/iommu.c#identity_map+0x7e/0x196
> (XEN) [ 8.324761]    [<ffff82d040232935>] F 
> rangeset_report_ranges+0x10a/0x159
> (XEN) [ 8.339149]    [<ffff82d0404301e6>] F 
> arch_iommu_hwdom_init+0x27f/0x316
> (XEN) [ 8.353361]    [<ffff82d04042cffa>] F 
> drivers/passthrough/amd/pci_amd_iommu.c#amd_iommu_hwdom_init+0xa9/0xc1
> (XEN) [ 8.373988]    [<ffff82d040430846>] F iommu_hwdom_init+0x26/0x2e
> (XEN) [ 8.386989]    [<ffff82d040441a30>] F 
> dom0_construct_pvh+0x265/0x1141
> (XEN) [ 8.400860]    [<ffff82d040457f7c>] F construct_dom0+0x47/0x93
> (XEN) [ 8.413511]    [<ffff82d0404504e0>] F __start_xen+0x21fc/0x2425
> (XEN) [ 8.426340]    [<ffff82d0402043be>] F __high_start+0x8e/0x90
> (XEN) [ 8.438646]
> (XEN) [ 8.442632]  [00000fec02, 00000fedff] RW
> (XEN) [ 8.451599]  [00000fee01, 00000fffff] RW
> (XEN) [ 8.460571]  [000080f340, 00008501ff] RW
> (XEN) [ 8.470205] 0000:02:00.0: not mapping BAR [fea00, fea03] invalid 
> position
> (XEN) [ 8.484769] 0000:03:00.0: not mapping BAR [fe900, fe90f] invalid 
> position
> (XEN) [ 8.499330] 0000:03:00.0: not mapping BAR [fe910, fe913] invalid 
> position
> (XEN) [ 8.513890] gfn 0xfe910mfn 0xfffffffffffffffftype 1order 0
> (XEN) [ 8.526370] Xen WARNat arch/x86/mm/p2m-pt.c:599
> ...
> (XEN) [ 9.094902] Xen call trace:
> (XEN) [ 9.101491]    [<ffff82d040309bd6>] R 
> arch/x86/mm/p2m-pt.c#p2m_pt_set_entry+0xc1/0x961
> (XEN) [ 9.118306]    [<ffff82d0402fbf0d>] F p2m_set_entry+0xb5/0x13c
> (XEN) [ 9.130957]    [<ffff82d0402fe1fb>] F 
> p2m_remove_identity_entry+0x26f/0x2ca
> (XEN) [ 9.145865]    [<ffff82d040268a4a>] F 
> vpci_make_msix_hole+0x11a/0x27a
> (XEN) [ 9.159734]    [<ffff82d0402654c4>] F 
> drivers/vpci/header.c#modify_decoding+0x4e/0x1b3
> (XEN) [ 9.176547]    [<ffff82d040265c89>] F 
> drivers/vpci/header.c#modify_bars+0x660/0x6c4
> (XEN) [ 9.192838]    [<ffff82d040266427>] F 
> drivers/vpci/header.c#init_header+0x5e7/0x86f
> (XEN) [ 9.209129]    [<ffff82d04026449c>] F vpci_assign_device+0xd3/0x115
> (XEN) [ 9.222648]    [<ffff82d040430de4>] F 
> drivers/passthrough/pci.c#setup_one_hwdom_device+0x92/0x15b
> (XEN) [ 9.241368]    [<ffff82d04043112a>] F 
> drivers/passthrough/pci.c#_setup_hwdom_pci_devices+0x158/0x241
> (XEN) [ 9.260612]    [<ffff82d04027aad7>] F 
> drivers/passthrough/pci.c#pci_segments_iterate+0x43/0x69
> (XEN) [ 9.278814]    [<ffff82d040431513>] F 
> setup_hwdom_pci_devices+0x28/0x2f
> (XEN) [ 9.293026]    [<ffff82d04042d009>] F 
> drivers/passthrough/amd/pci_amd_iommu.c#amd_iommu_hwdom_init+0xb8/0xc1
> (XEN) [ 9.313649]    [<ffff82d040430846>] F iommu_hwdom_init+0x26/0x2e
> (XEN) [ 9.326652]    [<ffff82d040441a30>] F 
> dom0_construct_pvh+0x265/0x1141
> (XEN) [ 9.340516]    [<ffff82d040457f7c>] F construct_dom0+0x47/0x93
> (XEN) [ 9.353172]    [<ffff82d0404504e0>] F __start_xen+0x21fc/0x2425
> (XEN) [ 9.365999]    [<ffff82d0402043be>] F __high_start+0x8e/0x90
> (XEN) [ 9.378305]
> (XEN) [ 9.382289] 0000:04:00.0: not mapping BAR [fe700, fe77f] invalid 
> position
> (XEN) [ 9.396850] 0000:04:00.3: not mapping BAR [fe500, fe5ff] invalid 
> position
> (XEN) [ 9.411412] 0000:04:00.4: not mapping BAR [fe400, fe4ff] invalid 
> position
> (XEN) [ 9.425972] 0000:05:00.0: not mapping BAR [fe801, fe801] invalid 
> position
> (XEN) [ 9.440531] 0000:05:00.1: not mapping BAR [fe800, fe800] invalid 
> position

So vpci_make_msix_hole is where it's getting removed.


Victor

