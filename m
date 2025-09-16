Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E2EB59E83
	for <lists+xen-devel@lfdr.de>; Tue, 16 Sep 2025 18:58:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124732.1466962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyYzr-00088c-BJ; Tue, 16 Sep 2025 16:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124732.1466962; Tue, 16 Sep 2025 16:57:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyYzr-00085T-4h; Tue, 16 Sep 2025 16:57:39 +0000
Received: by outflank-mailman (input) for mailman id 1124732;
 Tue, 16 Sep 2025 16:57:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U/dE=33=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uyYzp-00085K-Li
 for xen-devel@lists.xenproject.org; Tue, 16 Sep 2025 16:57:37 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e56b9e0-931e-11f0-9809-7dc792cee155;
 Tue, 16 Sep 2025 18:57:35 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by VI0PR03MB10902.eurprd03.prod.outlook.com (2603:10a6:800:265::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Tue, 16 Sep
 2025 16:57:33 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%5]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 16:57:33 +0000
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
X-Inumbo-ID: 3e56b9e0-931e-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LBxKqCnktg2oZLXt6La/NcAzRsU/IvVbhozorCnRd3VwHkC0yodu0BiRizQFm7EDQMDQySGcCyxRuTfklOezTpoJQYff903GnWNV+fsXFa5L75sxYisM9D+8+qvQ57hA9C0axSf+QyfO1tf25ZCPDWCfjJQfTgR1VxeoqYR2Jo6HtBKVB7Lcwhl7BbXKI80WTa+vbSenf6E27Jy+RSLzn6iLgAV1cFyrL9TjCpBeQCO66Z/iWomhwjTIVD8oM5XAGv5nj4TqQapDQDQJzhD65eaGMhhXZZrKnTbBOTkusZuxIaoY5HLlEE+068B0sdvWf1gq/GjwIgb0Ig+CjUfEbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5uYeXa3i9VaZACp93bIk8qhtw6G0YlYhQ16KKrxULw=;
 b=WqihaDziY7AsR0FteMVw7WXxVOrwDZnqc1Sf2Zs5cturMAwQ5F2+ZWPbgOMw2iTmZp9EU7rpois5GvOBM1RKNS8NVkuInMjT46PELwLaJ3eQNGcrGM05JgHbs53KwA49ZSbi5B+IeHs5fKOSkkLOEOtfm8S9vltzT05SzIxP4xK4BvnY5QxId+LzBGZu37Q4dAB2vS0F9pTQnp5RShv7HRjQ1mZBmYFKMYLGp55zRO7sXlembBtZH+SeX5A+cIPOPHQcISPDYbzE5U2oai6dd6E94HdZImc/gz3HyOCLBfs0ABujhw8jvHeK+ks4jIgdlq4pi50n5lbUVoJFj2JRAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5uYeXa3i9VaZACp93bIk8qhtw6G0YlYhQ16KKrxULw=;
 b=PgJYKhVT7YBUsjKJljY7FO3S8qzxa0ocz/mhJCrpn+UaHQPcK5MAzYngmmVWxA/r5AEZnWTMRTZTjuUpawhERNhvJbWbor3HRhHubpBeNYovvqw9Gou5hKoSclrUkH1ZjvYcC6HWwf+YvY9yA2lzfNdZmrOLQOrZNPC/cu1dIDSOaXE6huuRdHJcRsrU7Z+/vWtjT3Y9TeIRkzpht+JOMVbMyb7QjDxyRTArN4fTUGCfDzQoj7LT/zjeAOdQMvg5VNUy48eBMqVOt6EM1kDIxSiHiPvaYrzv3sQXzO9GgP07ZxTsuuHRTy1GsgboJEyFIXPg3wh5jsYPOXe8Fudhsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <bcd7a98b-5827-4b4d-baa6-52fe24339faa@epam.com>
Date: Tue, 16 Sep 2025 19:57:31 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 1/2] x86: hvm: vmx: fix runtime vmx presence check
 for !CONFIG_INTEL_VMX case
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250916103251.2144449-1-grygorii_strashko@epam.com>
 <3baf457c-d32b-4965-96bb-022a2f92bb9d@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <3baf457c-d32b-4965-96bb-022a2f92bb9d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::6) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|VI0PR03MB10902:EE_
X-MS-Office365-Filtering-Correlation-Id: e0999994-7538-426a-45a2-08ddf54220a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVh6aU1WZ0Ewb3N5TXJuZmRwVTIxWmpJTm5oVy90ZEoyaGd3bGZRNFA5aVJ6?=
 =?utf-8?B?MEZ6bUV6Q1kxVFU3NEgrNndQZ0VUcnA4TGpFRVZIV0tyMU9sdkJVZUhaamJm?=
 =?utf-8?B?TWx2dzJZY29qWE1oU0dtSUZEZ25TbHE5R1dGeWFXeDUrN0RNL04rRTByejF2?=
 =?utf-8?B?TnZqZER6K1lOcEVRT3JHT3dCN2IvVGRUb0Q0KytHZXk2MHZTQjZBaWp6M1Nq?=
 =?utf-8?B?c3pGYXpBSk9QYXRXMnczUTFTWVlFSDA5VVYyeG44Nm5oSjYvYUJ0OW50UllL?=
 =?utf-8?B?SXB5UDRES084OXdSUjBzd0RNS0RhenBxR2ZIODE5VUtQenBaRW5qaWNNdDNT?=
 =?utf-8?B?cWFKWGRsSmJMcEp4Y0lYekI2K0YwT2JGcit0MG1ZSnc2bUo1aWo4dldHTzdH?=
 =?utf-8?B?Z2xXUUZTR2k1TXF2bVBKYkxvMkgreFlxNWpWOW5BdmNoNURUbktkYUUwdlBh?=
 =?utf-8?B?bTMvVlBDZzQ5RkJzRXBJV2kwdlo5UmpnN3F6U2tjakFJdjhRUUF4aGQ3Mi80?=
 =?utf-8?B?eEYrZHFzdjRZNUxQeGtJVnZ4ZUV5b0lMMmNjc3I1eVRWcG9HM0NmSWFBMHFx?=
 =?utf-8?B?N0NhdWZtdHlHTk1yN09WOGEyV29XT0kvbzZ0N3F3cmE1Mnk1TWhZWEo3eWdY?=
 =?utf-8?B?SCs4TDhzdTBVNVppRy81aFFkRkQvZmwvWHJ4Q2FiRVdudC9UcURGZ1J4Nkow?=
 =?utf-8?B?ZUtrekRTWWJRY0QvUlh4cG85RFU3L3NnZHNaUHZGazhQQi84cnhBcTNFZjl1?=
 =?utf-8?B?MWdubnE3clVhMjBaTXVsUGJtdUFyaFpDUmQySXV3SnBNa3M2d0ZoRTd1UzRr?=
 =?utf-8?B?b0hVVVAvb2hBbytBamxoR3hJaWJKUm9HaW9LalB3eDBVOUR6amJ1ckQzNStJ?=
 =?utf-8?B?ZEhzallIWTMyOUtqTGtVZ05FNWIvOW1XTDQrM2lLUlRIaGY2bldHbGg4UnR0?=
 =?utf-8?B?SFk1ZTR2NVViVlA2UGVaYkk0OXEzSWxjVlMyWHJUWEhTL2REaERod0FYRXpk?=
 =?utf-8?B?U2dlRVNDR3VsMnAwY3A3WUl2aVJodWRibjNvR2kvRURNYkhjVXVia3pBOU9s?=
 =?utf-8?B?dG5lR1NzenhaRVlSZytmeFNZMkRaazFMRkFmdUhKd2NRR0g0a21WYm5NYmxl?=
 =?utf-8?B?MFRNc1hBbXhNZms0RmpESG5YOUlTOFVtUG9oMHlsVC9vNXdaRHBxU2NoOEZz?=
 =?utf-8?B?WXdrcGZUWXFUaU1iSlRTM2g0ZW1peldycVFaOHFUTUhZMTFvRHBsQUhmcGVl?=
 =?utf-8?B?c0I4UEVkMWpOcGliR05KZHRwa3hrYUlJM01ub1NyRksyNTBpNjJsSU5iOGMz?=
 =?utf-8?B?bmw0WjBiNE1pSmlua20rdUlFVzViSWI0cXFUWEMzcjRpbTM5Y3ZpdVBOQVB3?=
 =?utf-8?B?MGRlN0s4eVNwMFUya1pyUVRjOFFZU1ZEYmVwckpSZ3lzRmpMZDNJTndOWE5z?=
 =?utf-8?B?c0VjT05SWE9lbmtnK3ZLQkhMWUFsR0dEM0JTdktBbGw4TFZMNUswdEhDM2sx?=
 =?utf-8?B?Q2d4S29vaDNXK2dLZmdKdFpoSVNXckkrd0FHdG9QREFJbW5FSTVrZ1liMTJG?=
 =?utf-8?B?RGNFWGp4Z2N6Rm1qWXFHSGFGSXFtSWtIZE5NL0lJODBHMVhVaWppMkw0K0Np?=
 =?utf-8?B?bEdQSnNPUkc1TlNYNEgzTjBJUXZlT3hNOVdEeWk0VVpOOGZwY1Y5LzlMNzVv?=
 =?utf-8?B?VVhRMlpDM3RnV09ZamQ4ck43ZHBDOWdtdkxSdXBTZXBFL3R5NnZiR0hKdkpH?=
 =?utf-8?B?VEdCdGpvVlY3TXNZa3krM1BCWFgwR2Fub2luR0QrZ3VNeURyS3UyK0NuYmJu?=
 =?utf-8?B?TGtPTnBtMkh3czM2SHV6b1Q5SVhMSkkyb1ZrbmRKUGFtc2g0Z2pwMUQvOFBw?=
 =?utf-8?B?cWc3NXZsVEZzbmlzVzF0NGorZnRyQW9QZGJGTGFrU0ZQZjc4ZTdPVFBYdlNn?=
 =?utf-8?Q?kSebAGpvRNY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTlNNTBkdUZPYjBzM3FBR2R1d2lvWU9kK1gzTFJFRFVRelpPa2pGZm5Tc3hD?=
 =?utf-8?B?dzJndmRQRVBIOWY0QllrbHJFODJKbTB1VFlCdkFGMlNBZkZMU1dGZkp4UVVM?=
 =?utf-8?B?eDNjYVdzRXpTSk5IMDBYNW85clJUSTZWeFNNaXhZbVB1aGRSaS9pbmR5a20v?=
 =?utf-8?B?Z0ZzRjdkQUFQRncwblVoaG5sYXdhbVRzMUhMdVo2eTBMbWlnNEttMWhGTGhh?=
 =?utf-8?B?TDVxYmwzRXhZWVgyTlQ0L055QnYyRDA0TmU4NVdmenRQaVpsaHVkZ0hYbEt2?=
 =?utf-8?B?emJ4enVCZTdmeW50cHRGSGJDQ0lCWVFUS3RkU1RGTUQyZmp3YzhIOGIwaWpw?=
 =?utf-8?B?andsZWQvYUxPeUpCWG05VVNWUmVJVzFxczBIY291STZzVW9XY3MzcjRLb0JL?=
 =?utf-8?B?Q3l2eFFMZGRpc1RKRkhWY0Y5ZVI4dGNFOEdFT29pVjNGQ0g4K1VTQk1mbkpW?=
 =?utf-8?B?Y09pN2RYUDRHTWo3VDJOR0ZUL0VSMmN5V0NtdTJoVXFGVDNCMEkzMFkvaEpr?=
 =?utf-8?B?YXRxeENLZWtLK0RRWUZnTnAvWlpRdlo2S3FCWVJPV29DUXFlSXcrY0xMeU50?=
 =?utf-8?B?UjdTNUNDZEFYS0wvbmhWdnVMZS9YcEcwWmZhOXJmZ3hvSW5NUVhKUjBzdjBm?=
 =?utf-8?B?TFlxNEs0dHNnWFdCU0pDa0hLU0ZXNGIwVkhyVW9wWXMzUEZWd1I3OThmaVk3?=
 =?utf-8?B?anZJZ1hsWjBYa0Q4MW9nOUg4Q042OVZ4SDR1Vis5ZUdxcDU4SnRacUhRRnVU?=
 =?utf-8?B?SlBHNFhDVmp4MWZZNVdMSmFmWVdJbSt2L2tnQjA5OElyRWN2cytadmtIZ0Ev?=
 =?utf-8?B?MFBxZVNjL1dlZkdFcjZCM3JkVVdheEpFbldETHVmeE1sVzVsVVZ2VW8rUldt?=
 =?utf-8?B?RWE1TXY1VUhHMFk4dXFwSW5XQkNZVmVlWk9acSt4Qm53L0FZaXNLRzRURkhk?=
 =?utf-8?B?NVZIVUUzeDZXYU14SFg3ODlOT0krTU43NjQ4MlI4QktnVG80L3k1bExDeUZY?=
 =?utf-8?B?bXVsZEd1SUc4T3pjK0l4WlJPbStoOGxVcEU4aHRmVFBsR3BpMW9CN1pmbXA3?=
 =?utf-8?B?MUNmVEtabzdsUzBQOFZQZTRWMjgxeFlXcmZQK09sUjgwRzhsWWhPaXFEbm5R?=
 =?utf-8?B?a2J3ODBUUU1HWTVURjl6ckJMbVNrcmVvK3h4V2dxdU9oRzBHcWpia0Fkb1hL?=
 =?utf-8?B?cUZ6UFRWUm5NKy9NN2dJaUo5RWdRci9aenlaek1GLzRxUC8ydmlMcm9NZi96?=
 =?utf-8?B?NVYvNmFSb1ZDeStPd0ZuaXN5bmM0ZFFlV1kzZHFrYzR1T045RjVGSmFNbkJp?=
 =?utf-8?B?Wit1bERWbHVQMzRUTVR3SjJEanp2c1ZRZTBaODJWZXZaS1hjVG5lZ25Icyta?=
 =?utf-8?B?ejdCZTF0LzV3TW50emVBY0ltVm1TMy9JZEFsV2NkSkw1NlR2SmIyUlczK2FH?=
 =?utf-8?B?Q1M4NkJEajFwelhhTGFJcmdKUG91ZFp2QkdidnRmVnBEdnBSazlXbjMxOVNF?=
 =?utf-8?B?cng1MldKOFdjeWpyNmVTMWFqSUkwU1lObXBYV3piOGVrWW9NT1hIQ3Q2OGdl?=
 =?utf-8?B?WTBQSlZYc1hZeWdMeVlKMkNsNjdRSmZzR2FON1JvTzdTc20vdE9OQ3dhVjRI?=
 =?utf-8?B?N3pXT0MvMkdyd2hHbWlPMWp0MU5wTlpod1JzcUtHcGMwZ2Q1d3hTVVVKRWl5?=
 =?utf-8?B?aVpLRlBYeDIvYzBKZkdlZUxERlJhRDdsckFzd3RTMk80Vlh1M1RIdXdRZHA3?=
 =?utf-8?B?bXhBeUI5L0JnSlVYTWpnY0RPZlBCUmx4SHJXYzhMSVNXL01KTm15TzFGWEVP?=
 =?utf-8?B?YUVicmc4R0pSdGR6T0NUUXQ0Z0J4dUFhR3FteWVkRWx3ZGI3cE8zQ09DbHRM?=
 =?utf-8?B?aSt6b0VYVDNSbzRRTlhSTENWV2VoUkF3RW1GSjcxUjg3ZkNlTGJ6UDNkMGVH?=
 =?utf-8?B?UmxFeWVYUFRoUUtzcUlGTVZPZ3hvbHFURWtPVkFTOWU3WmFFN2orOEdMNWZT?=
 =?utf-8?B?U3huQlRmUnlRanFBL2FPelBQN3N6QkptQWkvUlFlQmhMQmNyQ3MwYks5ZG8z?=
 =?utf-8?B?OW1BMCtNV0NPOHpoc0duUzROVVowYTViMTZLSWU3OUhaNUVjd2JNMU5WWk5w?=
 =?utf-8?B?MHR1V0t6V0tVdXdHZkNRbGF0NnJMS28vWmdqTXJRVWlaSnZXYlVjNGZoQU13?=
 =?utf-8?B?d0E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0999994-7538-426a-45a2-08ddf54220a6
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 16:57:33.1128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QhNoCpiRwXxMkefuVFU/cQPBmdBMflxus8zjWAVNpoUxsAIaUgfYHeB7c8r4P+JeXop36vyezoHFyLoxSnk7O1YLplIgmBRrnHp40dwJDwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10902

Hi Jan,

On 16.09.25 17:34, Jan Beulich wrote:
> On 16.09.2025 12:32, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Since commit b99227347230 ("x86: Fix AMD_SVM and INTEL_VMX dependency") the
>> HVM Intel VT-x support can be gracefully disabled, but it still keeps VMX
>> code partially built-in, because HVM code uses mix of:
>>
>>   - "cpu_has_vmx" macro, which doesn't account for CONFIG_INTEL_VMX cfg
>>   - "using_vmx()" function, which accounts for CONFIG_INTEL_VMX cfg
>>
>> for runtime VMX availability checking. As result compiler DCE can't remove
>> all, unreachable VMX code.
>>
>> Fix it by sticking to "cpu_has_vmx" macro usage only which is updated to
>> account CONFIG_INTEL_VMX cfg.
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>> Hi
>>
>> It could be good to have it in 4.21, so vmx/svm disabling
>> option will be in complete state within 4.21 version.
> 
> Imo this isn't release critical and has come too late. It's of course
> Oleksii's call in the end.
> 
>> --- a/xen/arch/x86/include/asm/cpufeature.h
>> +++ b/xen/arch/x86/include/asm/cpufeature.h
>> @@ -136,7 +136,8 @@ static inline bool boot_cpu_has(unsigned int feat)
>>   #define cpu_has_sse3            boot_cpu_has(X86_FEATURE_SSE3)
>>   #define cpu_has_pclmulqdq       boot_cpu_has(X86_FEATURE_PCLMULQDQ)
>>   #define cpu_has_monitor         boot_cpu_has(X86_FEATURE_MONITOR)
>> -#define cpu_has_vmx             boot_cpu_has(X86_FEATURE_VMX)
>> +#define cpu_has_vmx             (IS_ENABLED(CONFIG_INTEL_VMX) && \
>> +                                 boot_cpu_has(X86_FEATURE_VMX))
> 
> I'm pretty sure using_vmx() was introduced precisely to avoid the use of
> IS_ENABLED() here. What is completely missing from the description is a
> discussion of the effect of this change on pre-existing uses of the
> macro. ISTR there being at least one instance which would break with
> that change. And no, I'm not looking forward to digging that out again,
> when I already did at the time the using_vmx() was suggested and then
> implemented. (I can't exclude it was the SVM counterpart; we want to
> keep both in sync in any event, imo.)

Thank you for your comments and sorry for not digging into the history of
the related patches.

All, please ignore these patches as existing places. where cpu_has_vmx/smv
are still used, need to be revised one by one.

-- 
Best regards,
-grygorii


