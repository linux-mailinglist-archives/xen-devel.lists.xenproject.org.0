Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 166DFCC2BF8
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 13:31:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187875.1509190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVUCh-0006pX-5j; Tue, 16 Dec 2025 12:30:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187875.1509190; Tue, 16 Dec 2025 12:30:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVUCh-0006nR-2y; Tue, 16 Dec 2025 12:30:59 +0000
Received: by outflank-mailman (input) for mailman id 1187875;
 Tue, 16 Dec 2025 12:30:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZKfF=6W=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vVUCf-0006nL-5x
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 12:30:57 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1115d1a9-da7b-11f0-b15b-2bf370ae4941;
 Tue, 16 Dec 2025 13:30:56 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN8PR03MB5042.namprd03.prod.outlook.com (2603:10b6:408:da::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 12:30:53 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 12:30:53 +0000
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
X-Inumbo-ID: 1115d1a9-da7b-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ioX7ikABXUafH64y9ZwnXUIpdaFmfGNte1/+h8O2T4sHIdUXTsT9t/46r3uI6bKS5QpNvjFkCR5X4/U2IdY9/KNXI2EU1zirQq3kw+7naOUIaFVhSI+2fW+BuToX1HZZSqNUgoPLGTbVyFV62xJMLFHWgeLtv4X1f0xL2EeQu07Mcd9GuFK/4MxLDZcqa/WTNdW6wf6cPlgH7MzAvoQFi7mas5YMOV2dBFyOpCLvvwZTqaeM2tb4phD653niTfkXz7nrR0gq2CeTbA4qPWTBtDRmh9Ulr6W2+REJgeBt6axFB56vOOu2NARoW6EvqDlDOvrY7nNpIwBSkEjyA0HYKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iw9q8K6aiI8GanyDXrZ3nNcVUx+ko9jl9O8GIHCy95c=;
 b=U7c3UrZrgfBktBOJ/LXZwpsW+zzbtROqK7sqk9AY4JZMozqnbWitgSt31umu9LYQB50BwfLT+gRBrPYZCUQTORF7VXpDOr3fLgq8z88YihgqOyt1MQXSUZC5+Pm3TxNhcKJQ2X46DeyEgqmoi7Toeh3FCCZfbaP0qi5xjyTJzThSwH2DeMUOhkPkZjmWogTk3jKU5ftprV41sSkoiebyhS5iSI5sN2TjuhtYXyMC5EVLsz7E/AIV4KymSBInUp70N4VO8s7iherkhO0Hp9TsIdyXh5ztdm5g0QmMcUnXT7yL34+izR9/IL2tkwp5oubV3NZDZLiNwpTOnFCPecFVPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iw9q8K6aiI8GanyDXrZ3nNcVUx+ko9jl9O8GIHCy95c=;
 b=mzEtf7O5G+c+X/b0cxQqUIvW/96WKjPdE/1o9bb3CME7biX+W915bCB0SLkA6ACd9mlq1pnp9HrFOB4n9RdRfzUpwjnMGvhv2ql8xzFIiH+TH2SH3T3Lv97VLhlccjXmqnPOxW9zYfN97qocKXA3xplPqJjN+IUFRE+lMayzCUM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f98a660b-5fc9-45d0-92ba-12e0638d3e62@citrix.com>
Date: Tue, 16 Dec 2025 12:30:50 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 0/3] x86: move more stuff to lib/
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f73aa7e9-c176-40c3-b5f5-81c69cb219ac@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <f73aa7e9-c176-40c3-b5f5-81c69cb219ac@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0697.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN8PR03MB5042:EE_
X-MS-Office365-Filtering-Correlation-Id: 05253f14-d243-4d4d-ec4c-08de3c9ef423
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGUzNnRNL3ZRSXJtZ3pSQ01CZFloMzNoekpPbzIvYVZTMWVib2dkN0h2Ym8z?=
 =?utf-8?B?ZmRSeFliNTNRNG5OZEtXbnVpa240S21kOU1WRi9HdFp1U3hnNmhLSXRiRjRS?=
 =?utf-8?B?bWJtRVdMNytQNElYMlQzb2ZFTjhsaFA1eHBObkV6ZTBWM3dxb2xnc0d3Smlh?=
 =?utf-8?B?eXZ2Uk9ZNXJZaXg3WUJ4dkROZk1LYUhBazBSa0ZvWWVMSGZLcGNieklMY0JI?=
 =?utf-8?B?c0hWRmpXNlIzNE1sZ0JIZDNGeGRiUkRqeXF4VVg0QlFvQkkzMnNTa2lzTGtO?=
 =?utf-8?B?clpaeWxXMG5Xd0JhTUVMSHgxendBOXpGL01uR0ZDaGhXcGVWUXoyZWVEeEZL?=
 =?utf-8?B?dTIybzNudVZrcXc5VkhlU3B2alVGbENxWm9oM1YwS0s2LzdhVHJidUVIdjVG?=
 =?utf-8?B?eXVhQ3hPcXkvTTBNUDNpTG9JTVNVQk9JM3lsR3diZUVpOExFam5zTk5LZUZs?=
 =?utf-8?B?OTRZNll0NVhkQ0NBWVlveXF0UDFLNlJoWHliY2FrWlduOENKdFNWSkRuK3dC?=
 =?utf-8?B?cWY5N05FUlRLVzRDUUJKTkZiemNIcWtaZDgvOUNnNGZzNThrenF3eWJlVHdv?=
 =?utf-8?B?TmRyTUZOMldSSWV3UGhnM1ZkTnA4VG4xeFBzWWk3RGV4RFA0SmRaRjBFSHhH?=
 =?utf-8?B?SDdWL3ZzRlZyQ3AyUzBsUUlHTkJ6ZTBJSitwSmt6bmtDSnBwQXU5ZEduTEN0?=
 =?utf-8?B?RXFJbDhGdER0RFNRcGw0UTBUSmFxL2FoTHpzQ25XZFZXSUFvVTJ2MGp3Sklt?=
 =?utf-8?B?UFc3bSt5cmVHV3RTZ0FwcWtYYXhVQ281blM0dS9ncENwUUVOVnhnNkRFVzBm?=
 =?utf-8?B?c0hLbE81dStLY29VdU5PMk5laWFkMmQ5bEFrbkxjMlVDZ242bzcwcVU3TVRO?=
 =?utf-8?B?amxLNmtydnpTVEE3QWlzZndmVjF6djhPL1hGQTU0ZmUwamF5Szh5ZXlsb0wz?=
 =?utf-8?B?QmtHbmUvMUY4OHFyQ1R6SWpQQzVHT09kelRYV012OVJoNHUzR1hTd0o5VklG?=
 =?utf-8?B?UUJPM3ZXSkRmRGZpd1oxTFpvSlFuckZYU2FtTVNLOFNGSFlSRTBONmZlcTlM?=
 =?utf-8?B?SXZhV1pDbUNFaDk2NXN4UEM2SFN0U0Z4aXJPWXJhb21nK0J1RHJVd1FzNk9I?=
 =?utf-8?B?M0JDbUxWV1JBNk54eDltQUQvVjNsNkREZlBsd3EwMVpOYnVlWDBadmcwNnc3?=
 =?utf-8?B?SXhCRVhDV1YwOFpRejZqUW5OaEttSkZ1T1RsVThkcEtGc2p1MHBUVWEvU3lR?=
 =?utf-8?B?Z0xmcVBpK004NVBTWVczRzFYTG5Qc0VGRmlzWU1EQk5LQWxZNG5OaXFtcFlK?=
 =?utf-8?B?TW5TcENiQU1Eb2UwaEE5UkptL3lpMHgzSUZUWHUxRGd2YnRCQ2U0THdWcXdY?=
 =?utf-8?B?VW1kcVZHOHJLV2JTSzM5RTYxT2d4M21nVWJIMHo1QVJOOGVRZnZpT0tBQlg1?=
 =?utf-8?B?VlpMYjV2MjdpVkNwTDVUajRSblRhNFEyZkRDbGNSREIwa0dYL05EWnZqMkxT?=
 =?utf-8?B?MXpmMGp3TEh6QWtqZml6RkdFb0NyT0NlSXBZVjFQV1U4WHNTWEMyTS83c2h3?=
 =?utf-8?B?dFAvbHl5UjY4cU9MaTNwMzRtc3FNWkh2dk10bVlOSUFhNzJaRlY1Zi9OWXl5?=
 =?utf-8?B?dVNld29tRGFPT3E2bmt3WnhJMXpETkZsUmpuM3hjVmFzMXBYaHpXZWFsNVNh?=
 =?utf-8?B?MTgrZXZXTUhaL1Q2SEVNL1NRdTZoSzVBMkFrYTV1L2hDMmxjL1JYcGtQVW1K?=
 =?utf-8?B?OVRLSEwyVFJUKzVjR1RtVS9aTmNCQmtrazEzdlBaY1dqdnlNSS8rV3dTaFVs?=
 =?utf-8?B?eHdyUGI1RmF6ZVRBbjJvbGVabHlELy9td3lPMG5Ud0RrOXFNM05SQlQzbWZT?=
 =?utf-8?B?RWRFQjZNM25XWW80d0xpc1RabEhIeUN0dzFaaG9hbmhrenVKbjNDZXp5czFO?=
 =?utf-8?Q?i+sKQ05x3tYJ5MpqPneJ24ubf3tm2kOv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHRKZXZqM1Q0a2gxY0dCS2s0SzFpNTdmcVdxUi9valozZ3dsVGwvd2lTZjc5?=
 =?utf-8?B?UjUxbWgvNmVZVE4xbGZaaEV3Q0tuc21DQ20wZU1sQUxraGVJajZpZzRRTm9o?=
 =?utf-8?B?Q29XbndnT1pOR2xZejBxQVdLNFdHWVFvRGpWelVQdlhVUzJuMXRUdFR3Z2h4?=
 =?utf-8?B?S0pCOXpla043RVlIL1R2ZndFK2xDUERFZkNYZUZkR2NmQjJwMTFoNG4yNXE2?=
 =?utf-8?B?UC9QcUd1UVJ6Y1ZnTHF0NjJmMGgrTnNwSXJsd0g4Z01PUGdhU2JjUnc5SmRJ?=
 =?utf-8?B?NEM2c1NNTjc2b2pwQjRFUVp4VEVJSDliWDVnOXF2ZUY5T2xmb1hxZS9ETVVP?=
 =?utf-8?B?V2V0a2lqaDJhc1dkeUlub2xuUVJwTTBmNktNTXZaOWZvLzk1QUtSVkEzZDQz?=
 =?utf-8?B?YW5nb2wxWS9NVEIvdEhsQXhpSEwxamxHY2FjSWk1YjhBYS9mR2gzUUxDUUw3?=
 =?utf-8?B?ZkxpZWhuWUliYVNyZmpiNWJTVmdNM1dNMjRsUFovSFdKQzBTR2EzUGk4UXM1?=
 =?utf-8?B?T291S2ExREZRY0hCK2tTa3dhamZjRit0K0Y3eGxBNWVMS2Y5TWU3VDdCNXAr?=
 =?utf-8?B?T3JQYTdjUTVUNjhJeENhRFpXdnlCSFUrY0ZEZUVDUUVrMnNVOGpQVnBmY0NC?=
 =?utf-8?B?WktPdCtNVS9DL25IUFhPYU9Fa05xN2dmR3NmMjBWN3dCcVJ4YXZiYThUcmgx?=
 =?utf-8?B?UEtLVVA3d3hSNFlIelZTTXY1OVNXcDdFMTF5Wk9DMTV6Rmo1aGN5SThLMjFE?=
 =?utf-8?B?RU5aM0grcm42Ui95ZlpQcUhSRExpcTcxbG82bHRVVzhhVUtXMGFDd3Q4UWJo?=
 =?utf-8?B?ei94TXlTTWM2THBOTHl5cVpDcWV2ZDdJbFdpTG5uNjBvMlR4ZWhFeVJsNlB1?=
 =?utf-8?B?RjR0QVNlM3RBMEJRbzdtcHNkbEdqa0hkSFRITi9mRXdhSHJNdzR0YjdzTUN4?=
 =?utf-8?B?KzByVTFWVEZwNXo0SHdESVJqMWtrc1o0OE41VzZNamdJM3FrcThodllnWm5M?=
 =?utf-8?B?RENNN0xKRkhZR2J4emt0NG1yZDF0VUoxelpJaVZiK09hUThseVQ3QWJwOHAr?=
 =?utf-8?B?RnlMaFY4aDJ2VjlBNGpYR1FYaDFNSjlZY1B6MkFKa3Y1aTNHbFhNSGdWZzNw?=
 =?utf-8?B?SU55YysxOHd4WUF5dWp1WDZSMHBIZ3JXaThOTm9zeTl6K0YwbHVYMkFpem4r?=
 =?utf-8?B?UDZTN0pXZlRqOWMzNGJRcFBjVElZZW5UN21KczJDcmhzU052SUxJSnBUcFIx?=
 =?utf-8?B?UEkrYmE3NXpKU1k0cm9wQnVSNzB3NC9HK2pLK1NmWEEreW9oT3NzVVRvMDdp?=
 =?utf-8?B?WlpzZ1YvNVRvckRIcEJxcHMxYkp1dHJKV0VwUFVYaXI2R05ZNEtaUXJDSG1p?=
 =?utf-8?B?dGFWNzhnM0NQU0UxY1A2ZVppK1VIbmhlVkEvNHlaVGk4MlVKQ1oxanhCbytD?=
 =?utf-8?B?UDlTR1pJWEZjOGZiWFVFTUEzcVF5VXNHV0x0d0lMM1hNeEc3S0hyZUFDeDRS?=
 =?utf-8?B?OU95K3V2NGtZb0ZqTlEya0x4VG9GYjN0akV4SEZhWER2ejVyQzYrMXYwMldN?=
 =?utf-8?B?OTRyYUErQnk3bGVueC93aGZwN25XMFZhV2hKQ3RsR0FYa21QSHpMRGdXMnBJ?=
 =?utf-8?B?M1M2M1crMTgwNTdpNHFqY0FlZ1BOM21VK1FvMWlXZ1NsWkk1cm51encrZ3VC?=
 =?utf-8?B?Q1doaTBRVEtnY29uSkpZSmZUWXBFRksxbEtFRm5acDR3ZmJoOWd0QmEyNFRv?=
 =?utf-8?B?SXo3NVIzaGtxOGZMOTlKQUxxSFkvK08xNlJyVDFsV2NLZ3JqVXdpczZHNnoz?=
 =?utf-8?B?RWkwV01oK1pZdkdNOWx3eEJRZW53SXg0WHJ3YmZvT0x3bzlORUE4Z1czdjNI?=
 =?utf-8?B?OHp1bU16UUR2Q0wwbzYyd21DV0lqaHdWV0s5cTdBU3FwQ24zYnFYTEZBR0l0?=
 =?utf-8?B?eWpCTmdZV1R2aElPMVBJLzJDV1JKTmMyaFZoZXZiMi9adFVpKzZoWFNkZEt1?=
 =?utf-8?B?N3JSWWQzV0E1L09BRmIxQ1U0SG0ycm5JMnhSSTV3UnB5eVdTVzhEbnNwQitr?=
 =?utf-8?B?VzY4cVo2a0lOczc2NHlSQXpHeWllUkVwbDA5K3lCTTRWeHpMYnZTdUdmbmlq?=
 =?utf-8?B?WkgwNkZyVFVOTkxZK2MrODhGc1I3MFVmak80aG00Y2JjcnVHSFRacThuWHpJ?=
 =?utf-8?B?K3N6YmYxUWJweHJMK3hLTXdZU05Xc1E2NURnQ045ZVBBa3NSWUlEaUxHOTVW?=
 =?utf-8?B?RG5QTGJ1RW55dUtHcTFqa3QzS2ZlNDl2S21BSW05ZEZXN292YXo5MDFkU3d2?=
 =?utf-8?B?OVd6RFl6NEo4aGVlMVJiK3RVQmJrS0VGdDJDZjY4Y2d5OUxXUkE5dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05253f14-d243-4d4d-ec4c-08de3c9ef423
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 12:30:53.3882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BSR1zCqfx0Z6lnPj5wIPCXZzlEbqTrK6yd1PVnuPA0+PXbwh/XC3tYWeZOfN7QyM+EhIyGI/Ofjt2tuLyksdNU5WeW7PLP9GLNUnZ/NbqB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5042

On 16/12/2025 9:16 am, Jan Beulich wrote:
> 1: move / split usercopy.c to / into arch-specific library
> 2: move mem{cpy,set}.S to arch-specific library
> 3: move {clear_,copy_,scrub-}page.S to arch-specific library

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

