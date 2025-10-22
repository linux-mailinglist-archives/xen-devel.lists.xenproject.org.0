Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F67BFE4AF
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 23:20:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148483.1480488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBgFO-0004gd-VN; Wed, 22 Oct 2025 21:19:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148483.1480488; Wed, 22 Oct 2025 21:19:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBgFO-0004ew-Sl; Wed, 22 Oct 2025 21:19:54 +0000
Received: by outflank-mailman (input) for mailman id 1148483;
 Wed, 22 Oct 2025 21:19:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+n4a=47=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vBgFN-0004eq-GZ
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 21:19:53 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d883fad1-af8c-11f0-9d15-b5c5bf9af7f9;
 Wed, 22 Oct 2025 23:19:52 +0200 (CEST)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 BY5PR03MB5170.namprd03.prod.outlook.com (2603:10b6:a03:22e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 21:19:47 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 21:19:47 +0000
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
X-Inumbo-ID: d883fad1-af8c-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSDQ+yRdv50xeE84oMCxjaN7olFDt09VVlLjgEPQBkI869LWG3TRQ36CT9kGxe0oEufka5OKfEMX1wZtMuApPIeAlkGPGJfjQuXDL57xdcyU3/KZySopoIlNjUwZ5CiqTZIfP/gJKJh3MxyOLjT4rMxrJgZtY/m49LylEzJ9RTlz/HBHoHSdd6YGlQEXMDD0uE3aoz025xGgZ2Nx75AP/sJJ+ryyd3P7womNB03e7bcV4Ej6rfVOGr+u+K1kGICxG8F2tvHgk1yjyc6QPx5GN/x2q5yISmDDSqt3wyokAihTUQ0f0j49qwKFTmmCfOpsRbUWn35G/y9WMnGiwLUAMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gmVlJBoaVP7Z0N12LNPDhtfdaRkMo4eGpcvspqwYmk=;
 b=vVFYicy2gzE46MG4Dux7RDbSNVWb1srAWEyzVQz2/2xxdE7Nu4gSFxTp9OawJ5Ohxofp0tsQNNWhqaVy8+dxEYqdJlQA1cKxqbAd80nJE4n5QGN8bpehz4NuuWMghatm2a+0kqoZnwewHR1p8un3f3GUaFHC/Kk45QlqyPUZHlf9Fuee7RfRDw0ABAzxjofFfaZUmDsklChavO6TdO/g0JGjWeO7JikW1JQ5m0/NZoTz5di/IGZK9sGBGh864N+SUh6SE5Uub6larCbmt83gUhPAeTr3D/ONeYH7/Any5mPpzsYMJK8MYobqVWpv+RcfUwz2kl+Zzh54nri1oIH+vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gmVlJBoaVP7Z0N12LNPDhtfdaRkMo4eGpcvspqwYmk=;
 b=dpOvbM27FZD2IfwkIXiwYGPfM/Hm89YKyawAbWONCzwjtNZaoRlerN+3PNFW0LWiXN32M/vi7chytQIiZEK8f9gAeXsRSrBdHm5d54HILFpm5k/5pxQc9V3z6KwT/iF1vKkn9aSh3PuGfI4SY5Jv8KpFqCUld67OPK7yl0kAmhQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8306217c-2f7b-4d69-b051-ae1e6b4f443a@citrix.com>
Date: Wed, 22 Oct 2025 22:19:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] x86/ucode: Relax digest check when Entrysign is fixed
 in firmware
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251020131955.2928261-1-andrew.cooper3@citrix.com>
 <20251020131955.2928261-6-andrew.cooper3@citrix.com>
 <dbe8a444-daf2-4929-921f-704aa5f48cde@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <dbe8a444-daf2-4929-921f-704aa5f48cde@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0227.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::16) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|BY5PR03MB5170:EE_
X-MS-Office365-Filtering-Correlation-Id: 447fa83b-484e-4f4d-3439-08de11b0ba93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VkVGbGlKTDJubUhUeHhyQTBWWExFaTF1Y1hPdFVZcjRsWnZwbWtXaS8vcTha?=
 =?utf-8?B?MnZrcWlIQ1VZSW9UZmVpVkVvUkZwelZoZzgxNnpLNllzVGtrYmpvZXoxbWRE?=
 =?utf-8?B?U1RJZjY5T2JGUGRnRTlYQ0NEUEJZMVkycWIzUC9GaSthOEpMa2J6SEtoOWht?=
 =?utf-8?B?ckRXVFFiRmxBSEU3dUV4THIxOW5GcndIUCtsVnhtNG9oeVZhQmtIR0sxQVBt?=
 =?utf-8?B?TW5ycVc5WGtjT0UvYlFrMmJWVzlYWlNKay9QN0ZwMXlCUzc3S1Yyb1IwNlVr?=
 =?utf-8?B?V0p0VzNlZmhtY01Bem8zcWVjYjBKaFE0L25zbWdCaFByZWYyRkRBVTFqZEYx?=
 =?utf-8?B?bVQ0R1RMSW40aW4vTkJUV3NJekgzRkw2Ny9zbTB1SE9Cb2xueTdwV3kzUFdU?=
 =?utf-8?B?T1Ixd01GQWVwSEVhOFN1bG5YV3JOOVEwSTB0VWlmc2NhbXVCbTVaNFgranp3?=
 =?utf-8?B?QnpJMnFIZWZuU3dHcjhWUUtQa0NCTElrOVV0UCtjMlQrK2h4WXRaMjZZeVFN?=
 =?utf-8?B?aXRoTjFnWElHWE1vajNLb3pNaEEvLy9rY0NORXh2UGpuK3ZMcnRZMTFhWmRh?=
 =?utf-8?B?VG45YkU0U29OVmd6d1FwbUhiNkQyU3E3NEEwYzdLN2NQdktsTm96eWlMSEsv?=
 =?utf-8?B?WVpOQ1U1SlJrMjB3amt6cWdPK2tCdUFnb3FZK2dSS3ZrRStJSkVYcXYwanpz?=
 =?utf-8?B?RklsVUdqVFBTSlNleFF6L3JzYkdrYlM0QU4wSXBvMlIzalRmSUV0NHpYcCtv?=
 =?utf-8?B?d3kybGxCSzIwL2pWbmhESjVqakIyUThmYVpMdnlWME5qT3JOdC9qMnI0N2xz?=
 =?utf-8?B?MmJLczRNd0NaclFMb2FodSttSXFaQUMwbk5JRXErMTdvaWc4RGM2YXVOQmQw?=
 =?utf-8?B?NEs4MVErMFBhT04rVkpVSHUwdGlIMkcrZUdOTGFnUFNzNVBtR3JGY0J1V3Iz?=
 =?utf-8?B?YVhGeEdQeE83U3dQSkFQN2MxM0k1SE5RTHpMazJmekxneXBNSlRGbDYxWDJj?=
 =?utf-8?B?bFRYZ3RNOHd4R2FvRjFoUWZSREhIRUxUOVNHaTVBTllaa3RkeVlVNGNzOFht?=
 =?utf-8?B?b3dEKzVtZmtna3NTeDVrYU13bDlWRHFkVlE2YlhSYXBibk5uRldZcDB1NWlV?=
 =?utf-8?B?eTVuK09VUE5JVVMzV1JWcXlIeHljMjJwRHpMZzFMU1N1QlVvTHNwdTloMmZH?=
 =?utf-8?B?NVhpY0VCVHVuUUxqc3pXVTZtTkpxMlRHdVhkQy9ZSTVZQjRaclFlL1ppL0dO?=
 =?utf-8?B?eEl5eUpPT3l6UUQvZUdFRnBxMHZzMHY3b0JTTDYvb0VhNUtjbnc5aTdTd2d0?=
 =?utf-8?B?RVlkbFV4NTBZMlB0ZjFwdWozemJUYUR4emN3THh0T3RWY3diMUFpR3V6WEVm?=
 =?utf-8?B?WmxESUJhcFhVa0VlZ3BqQjFVMXQxaTZCRCsyVENkQktTRXZubFA1YTl1c211?=
 =?utf-8?B?YUZDUVI2ejNQVDVFTHNnaDY0YU5tZDJ4SzdHaXNYbmFxSHp1R2FnYkNGYUVG?=
 =?utf-8?B?bXVTTjRjOE5RTXVENm0rd3FTRGtkZzNncHpZK01YMGZpTVI3V0NLL3V3dnZz?=
 =?utf-8?B?ZytPcmVOL3JkNG9BWm51SEkyRkNqclNKTkFGMklqcWZDNG4xS0xaNnkyNnNw?=
 =?utf-8?B?WlQ4UTlOUTAzQ0w1d0d3K1J6TGpoZWcyK21jYk1RdnFGcmwwU0xacUQ0V2pP?=
 =?utf-8?B?c3FEMkFRMzgwd1kxNWcrWWJHUWgzWjBsTGpJZDJWcHUrYTY3UjlrdWRkZ2NF?=
 =?utf-8?B?T2l6NldZRlZtQWd0R0JJdU1jSU9CUytVTUE3aGF2ZTNLM3RTdUNEVHVXdGpL?=
 =?utf-8?B?VG9RSG9GWjVvOXBoekphWURSYnE2N0QxY0IzN21NcDFtc0I1OXlRN0RWTWpj?=
 =?utf-8?B?NTEvQXlnblhrUjVrK01nYzlYN3hLeVV1aUt1bmxvYllLVnEyazhteitkRXRv?=
 =?utf-8?Q?N3jmv/DXkyBw3Fa5K8nTa71VRcKxwATI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZE0wZ2RIUjhKcDNPMkM5L0N0ZCttSXZBZ1VwOFFwYThUUjQ4YzMwVFVvMVEz?=
 =?utf-8?B?WHBXREJLajBoTXArMUpNSVE1OFZBUUtXN2Q0WlNaQ282UVNpZnFzY2tBcUVK?=
 =?utf-8?B?QkZoaVZ5VW9YRlREb1hMS1dUcEwxMTlnczhSa3B1cXU5YmlyQ0xQNFl1RHFh?=
 =?utf-8?B?cmZndURoZ1dQZVVkbEJ3N3VWWWJVYXhzSmZkUTNKcEhLZEkyVEw4RmtnblIx?=
 =?utf-8?B?K2xJcjNXZmI5VDgwN01ndWlTaEpNM3lIbWs5YXQ0SXV2QkV1eHpJU2RBblVr?=
 =?utf-8?B?WHAvbXVWZEFSWlhaNjBlTCtNNFg4bFVyZEhaYkVEUGY1c2xTeGo5SjBFY081?=
 =?utf-8?B?bzRoajY4YjJFbW1FWjU2Y1NFd1ZOUmN5Q1RCeGJpeXphcFBYc3JtSm5pRVRp?=
 =?utf-8?B?UUdNNmtwQjBLaXF2NVkrSVpnS2crc1V6MWxmV1dtaVgyN0E5aUxBVmVrbHZV?=
 =?utf-8?B?V2ZjR042WmZiZ2lvNUNJN0J2REJFaUwrVFRSSTdRUmpidmRBS0w3akhoR3d6?=
 =?utf-8?B?UERtaDdCcFR4bVAvcDVxVXdzMlBvNEMzMkR3dzErcy9rRElva0F1MHhpMXU5?=
 =?utf-8?B?UG0ySTdreFNLclZCZk90RzNsaVZoN2psMXRjdUdtWG9NVTMwK3JRR3B3bmJh?=
 =?utf-8?B?bXV3NnVyd09walJXWDV0MEF1MzYrR1MxK0tadHZQNkh1K00yQjUrbWFBbjlM?=
 =?utf-8?B?OHZuVkxsek5ING5NQU0yWDRYOW02RnByKzEzTkFBK3RDSU1BYklrWFhtNnh4?=
 =?utf-8?B?eERrRUFVWWJqYUkvbkM3MkhDeUF1N2NzV2E3bEVUcGt2anZGTVFyMEk5aXBz?=
 =?utf-8?B?cC9LM2RoaWtKSW1GbUZ3VmdlWm9qOVR1bFVJbkJEWkZFQWlycW1CNmdlRHFn?=
 =?utf-8?B?U2xPNjNpeHB5QlBCY1ROcWlCdUtzelZlR2pWNmhYZDRpZWhlQWNBc2NoRUJF?=
 =?utf-8?B?WFc1SkhkT3M3cVZmYWpvSHRrYTlhZitGSnJ0UkorTGlINjJOamhlbzdWS0s3?=
 =?utf-8?B?cHpMQ3ZIUjNmZ1hCQnRzeS8vb1dmcDJwV3RNMmFUcmI2dkFKV05KMTJqSVJm?=
 =?utf-8?B?U2hKTE1EOWlSRWRGeVZaMFpZY21kQm9zYjJ4bmJQRmIrNkQzV2VqUllqSWxW?=
 =?utf-8?B?T25PdDNMSi9CZGkySVdjaFprMlVGUFcwcHF3Uk5kVDRWYXFTN1d6OGVhREhX?=
 =?utf-8?B?ODdkQStFYUd3K3ozVTVPaENKVVFYNHVEa2RJdGxDZEhCQmhIZElQeUx1UGJX?=
 =?utf-8?B?K1ZtS2V0K2hTT1MwMERYR0NTN3g5ejVBZmRzb0RRc3ptY0RxckVsNGdEZEt0?=
 =?utf-8?B?Y3IzS054a24vZ3dyemdpbGxJQUZJZWt5Y2JMWDNHdVNEeXJhRkJhb2ZDZWVZ?=
 =?utf-8?B?eTM1RHN0WmFpdkNQcE11NnJIdVdWQTV2UE4rdEVQZkNtRndacHBwcTJWOE9G?=
 =?utf-8?B?bVdlam5LSDdFclhGSzkxbnVVVmtjL3MybDJJNy82bTM0K3NXaXBaZUpJcHdQ?=
 =?utf-8?B?UW5uTjJzckViQnhvZGl6c05jQVFRT0k5YlZXV0MydmF0STlxY01Rd3VBRmdP?=
 =?utf-8?B?OWsyZUlYN1I1anhTdWpzQjhTVVlxQmRqRHF3NVFSRklSODFLM2F1YzRtS0Fw?=
 =?utf-8?B?aHZnSDl6cjM2K25uWjYrTUpDWmdJYU4vcEVjZnl4dDFqOVQ4ODB0aC9wQXN1?=
 =?utf-8?B?VExxZG9QKzNHRTcydmNUcS8vMXZjcVcwTGFBUUxsVmFMdDBQRjJWaVlpUzA3?=
 =?utf-8?B?QnJRK05obHZpNTJGR1pua3VnTlZ4SlJ2Ny9YeWN3YlFnN1BjRFZiYTZGUzNm?=
 =?utf-8?B?YmU5WFJWT280UFgwWUhOblB4Zjd4U29CMWFsUFIwWkJvdXJTZWlPeElQUGlo?=
 =?utf-8?B?TXdqdmJFTVBLQkduK1NsLzkrQjFRZ2lCWXI3R1hKaXovdDJKa1JjVnlrZ0Rq?=
 =?utf-8?B?U0t4OW1FQTBZK1NuMmdsQllhRUxuTURhV3dSS080SUZCOWMzdGVIMk1xZ2ZG?=
 =?utf-8?B?SzcrLzBENCtSektpVDU0WE9hbVF0cHYySXExVnhqQ0Nqcjh1Vkhjd3h0TFQr?=
 =?utf-8?B?bkVwMHZEQ2gvQUV0ZTVVM1VYaDBUdmo4OFk2VSs2dzNrYWM2ZXNic0JWZU1h?=
 =?utf-8?B?L2tRZ3RSZ0t2UHF1Z0dMZGhKbUVDb0syMjJLT3d3cEdSM2FscGcxUitvS1Za?=
 =?utf-8?B?aGc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 447fa83b-484e-4f4d-3439-08de11b0ba93
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 21:19:47.7846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXInb5jMslBWA4EwAp/1pH5/cxicAMRIeSiVnQgJREWJrmRB1gkistKIa/02ndxa7Rm3u6IL+5lw1yivTNmZOW+Xi/4D0BL3QuVj60S7sc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5170

On 21/10/2025 10:47 am, Jan Beulich wrote:
> On 20.10.2025 15:19, Andrew Cooper wrote:
>> @@ -597,3 +598,81 @@ static void __init __constructor test_digests_sorted(void)
>>      }
>>  }
>>  #endif /* CONFIG_SELF_TESTS */
>> +
>> +/*
>> + * The Entrysign vulnerability affects all Zen1 thru Zen5 CPUs.
> And older ones are fine, or merely have no fixes produced?

Unknown.  Everything prior to Zen1 is fully out of support from AMD.

>
>>  Firmware
>> + * fixes were produced in Nov/Dec 2025.  Zen3 thru Zen5 can continue to take
>> + * OS-loadable microcode updates using a new signature scheme, as long as
>> + * firmware has been updated first.
>> + */
> Yet what about Zen1/2?

There's no signature fix for Zen1/2.  The "fix" disables microcode
loading, and firmware updates are the only way to get new fixes.

This is footnote 1 in the bulletin.  "Microcode cannot be hot-loaded
after updating to this PI version."

>
>> +void __init amd_check_entrysign(void)
>> +{
>> +    unsigned int curr_rev;
>> +    uint8_t fixed_rev;
>> +
>> +    if ( boot_cpu_data.vendor != X86_VENDOR_AMD ||
>> +         boot_cpu_data.family < 0x17 ||
>> +         boot_cpu_data.family > 0x1a )
>> +        return;
>> +
>> +    /*
>> +     * Table taken from Linux, which is the only known source of information
>> +     * about client revisions.
>> +     */
>> +    curr_rev = this_cpu(cpu_sig).rev;
>> +    switch ( curr_rev >> 8 )
>> +    {
>> +    case 0x080012: fixed_rev = 0x6f; break;
>> +    case 0x080082: fixed_rev = 0x0f; break;
> In your reply you mentioned a "general off-by-1" when comparing with Linux,
> but I'm in trouble understanding how both can be correct. Leaving aside the
> 1st line (for which you sent a Linux patch anyway), how can our
> "(uint8_t)curr_rev >= fixed_rev" (i.e. "(uint8_t)curr_rev >= 0x0f") further
> below be correct at the same time as Linux'es "return cur_rev <= 0x800820f"
> (indicating to the caller whether a SHA check is needed) is also correct?
> We say 0x0f is okay, while they demand a SHA check for that revision.
>
> In any event, whatever (legitimate) off-by-1 it is that I'm failing to spot,
> I think this would want explaining in the comment above.

What you've spotted is the off-by-one error.

Linux is written as "curr <= last-vuln-rev" in order to do the digest check.

Xen wants "cur >= first-fixed-rev"; I renamed the variable and forgot to
adjust the table to compensate.  I've already fixed it in v2, so this
line now reads fixed_rev = 0x0a.

>
>> +    case 0x083010: fixed_rev = 0x7c; break;
>> +    case 0x086001: fixed_rev = 0x0e; break;
>> +    case 0x086081: fixed_rev = 0x08; break;
>> +    case 0x087010: fixed_rev = 0x34; break;
>> +    case 0x08a000: fixed_rev = 0x0a; break;
>> +    case 0x0a0010: fixed_rev = 0x7a; break;
>> +    case 0x0a0011: fixed_rev = 0xda; break;
>> +    case 0x0a0012: fixed_rev = 0x43; break;
>> +    case 0x0a0082: fixed_rev = 0x0e; break;
>> +    case 0x0a1011: fixed_rev = 0x53; break;
>> +    case 0x0a1012: fixed_rev = 0x4e; break;
>> +    case 0x0a1081: fixed_rev = 0x09; break;
>> +    case 0x0a2010: fixed_rev = 0x2f; break;
>> +    case 0x0a2012: fixed_rev = 0x12; break;
>> +    case 0x0a4041: fixed_rev = 0x09; break;
>> +    case 0x0a5000: fixed_rev = 0x13; break;
>> +    case 0x0a6012: fixed_rev = 0x0a; break;
>> +    case 0x0a7041: fixed_rev = 0x09; break;
>> +    case 0x0a7052: fixed_rev = 0x08; break;
>> +    case 0x0a7080: fixed_rev = 0x09; break;
>> +    case 0x0a70c0: fixed_rev = 0x09; break;
>> +    case 0x0aa001: fixed_rev = 0x16; break;
>> +    case 0x0aa002: fixed_rev = 0x18; break;
>> +    case 0x0b0021: fixed_rev = 0x46; break;
>> +    case 0x0b1010: fixed_rev = 0x46; break;
>> +    case 0x0b2040: fixed_rev = 0x31; break;
>> +    case 0x0b4040: fixed_rev = 0x31; break;
>> +    case 0x0b6000: fixed_rev = 0x31; break;
>> +    case 0x0b7000: fixed_rev = 0x31; break;
> Without at least brief model related comments this looks extremely opaque.
> Linux, as a minimal reference, at least has cpuid_to_ucode_rev() and the
> accompanying union zen_patch_rev.

We have other tables like this in Xen.  Linux has even more.

These case labels are family/model/steppings, but not in the same format
as CPUID.1.EAX, and also not in the same format at patch->processor_id.

This is true even on CPUs prior to Zen1, making union zen_patch_rev
misleading and why I have intentionally not ported it across.  Fam11h
seems to be where this started being true in practice.

Fam10h has cases the same ucode applies to different steppings of CPUs.

>  Background of my remark is that I would
> have expected there to be more models per Zen<N>, seeing in particular how
> many different BKDGs / PPRs and RGs there are. Many RGs in particular say
> they apply to a range of models, yet no similar ranges are covered here
> (unless my deciphering attempts went wrong).

PPRs/RGs are generally per block of 0x10 models and all steppings
therewith.  This is quite often one production CPU and a handful of
preproduction steppings, but e.g. Milan and MilanX are two production
CPUs share a same PPR/RG, as they differ only by stepping.

Preproduction CPUs probably won't have a fix (other than the final two
rows which are A0 stepping of something presumably trying to get out of
the door when Entrysign was found.)  The list does look to be right
order of magnitude for the production CPUs.

The AMD bulletin only gives microcode versions for server.  Clients only
state AgesaPI versions, so I'm entirely reliant on Linux for the
microcode versions.

~Andrew

