Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E86C7A61D
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 16:04:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1169297.1495059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMSfs-00062o-RF; Fri, 21 Nov 2025 15:03:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1169297.1495059; Fri, 21 Nov 2025 15:03:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMSfs-000613-OS; Fri, 21 Nov 2025 15:03:48 +0000
Received: by outflank-mailman (input) for mailman id 1169297;
 Fri, 21 Nov 2025 15:03:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fili=55=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vMSfr-00060x-K7
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 15:03:47 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 468e65b5-c6eb-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 16:03:46 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH2PR03MB5366.namprd03.prod.outlook.com (2603:10b6:610:96::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 15:03:41 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 15:03:41 +0000
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
X-Inumbo-ID: 468e65b5-c6eb-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SyqerrGSTmGLU7D9pGSKHuCwkVssYahaQYunWL+MuGoCGN/6FWL30W+x/dy41X+5rhRgOMg5WizTwe58wEv6zuIGakzxdXzWZCboB4/xhYOheb6+IgObIXCJ2ZT/L2DCwCcVmYSH+74QeWpdB80R2UJ2ON/RmIjg+XGdcMAOB00ENfbQbJ9ZIj3Jofs7r7iHFXXG99GIisM2z/CJkzXsVpj/kDdreZWxvhlowpsXygXgcSGxQf1zpj09jvPvOhOtjmq8bAi18UBuG/Q88gQBsFcBxHrzFNdcZTYCdVrMzBoKofEsWTAQvviKz82+WaEkkCTWOknYR2CLKjy7xzxUkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fOaz8+DeRIrMeBhKJtCfiKmGwPIvGWTFHxf/4YwmhA=;
 b=Q/1N030Oq/XsBYpEfXwEozzWoWFRAMBp9hUWpPwgddhByTlsqphSDV99yjQ8nzveJVsecDel09mLoY1FI4SzFA/G3k4SgkpRdt7IeN6gX1Kth8azYyRRaTycZyEV08WzdseQv1gdiB32Eevd9DUoilg/gOAKwNFTv2ggdU+XESWRb9uuFObXdsdS9y0Xpn9iusPA4tr69uB6pY+6VIrdmkNdszCoNcOC8qcxN7OKK73Z7GWNwk+rZjegUGB9//pzNSt3ovvtz0Cd3mg/iKlw0bVFRlh2AK5Dj7E0UiiFXnIk/q78UFcX39py5TP3GXctqSqQALXfU0H18DX0N5RoNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fOaz8+DeRIrMeBhKJtCfiKmGwPIvGWTFHxf/4YwmhA=;
 b=eW29YcMN6C8cEUgll1QiVz57neVDKSuxbhFCj+o2ieSxz6SD5hZtSLexXGkfSsXsYvvUjIhbPH57YIBwvk4PMIb1VWz7vssMsTPs5TNys73Nu9F40nqnXjeZRSroZaMIj33xa20UuTJ/OB6nB0w1oEe+ZvVpzvY2n+LZYhMCGEo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4f898adc-323d-4c3a-a780-1acb2c58345d@citrix.com>
Date: Fri, 21 Nov 2025 15:03:38 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] build: add make macro for making file from file.in
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20251121132332.23514-1-jgross@suse.com>
 <20251121132332.23514-2-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251121132332.23514-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::30) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH2PR03MB5366:EE_
X-MS-Office365-Filtering-Correlation-Id: 6617731b-394e-48fe-aedc-08de290f2897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WGZvc0Fzekc2SGZrcng0S2tINzVIdXQxNlBYR3JDdVNHc2VIVFJoNVRyR3Ey?=
 =?utf-8?B?WkhhYy9wNitlZUtPRk1iQ3ZnVjVTZ093UWE3S1RoNE5oekljYm8rRHM4UnJQ?=
 =?utf-8?B?K1g0QWNCaG1yWVlybVk1bjhoNWFDRWdGOG1WaTdQcWxnNGlyK0NzQ0U2LzRt?=
 =?utf-8?B?NTU2OXlSa051NnJWMUNpeXBZc0QwOTgySFRJQWVyM0pZd3BjMEsxc2xXZWM1?=
 =?utf-8?B?TGxRcm5yazhwQTJGbXdaclBuanNDalltdWw1V1hGQUNVdUIySWJrSUVCdXFx?=
 =?utf-8?B?YklNR3Q1MEx2SllWRHozaEJTL1F1TGlWbitDWStJRlFYd0ExcG9yeU9XZnA0?=
 =?utf-8?B?cnBqNWZWaW5lbnQzK3lpQWRYWlJrcmdhT05EcmVPQnNScFNBNHBWMWh5cEtP?=
 =?utf-8?B?eHlxRVV4eWpKaTVDLyt1cnE5em5EMHJUMTZpdlFheFg0OEZxWDVDTnVJNFpi?=
 =?utf-8?B?Ym4wUlZLT0MwSDNERXd2dzJOTlVUTURLTlZ5S0pvQ3l1d3dxWmw4VXRycnl3?=
 =?utf-8?B?RGczN1pNb1UwMTZWditrcUZRdzRtRWhpT1NRK0IreWl2d3FxaE5BSE1VdEli?=
 =?utf-8?B?ZlpIN3pBRm56cW9sbXFidCswMVhzdEk3THlXd2R0N0RvZENFNVRacjJ2a2lh?=
 =?utf-8?B?bjk5R2ZBUSt1RkRzZTRIQ3drZGw1bWlyd0NXU3RGZmdzVWZjaS9BRHBkaCsw?=
 =?utf-8?B?NVZpdXlCSHNPWk92Skp2cHh1NXpDRldhQ0xaZWZxQ0tKZmdGTGdZcWNITFE5?=
 =?utf-8?B?dGVHTEF3d0lNalBxQ3VFYWNHU28xNm5mWnFjbWVrYXZUVUJNUlJsdWlQcE90?=
 =?utf-8?B?VGFhcC82S0lLMUdYNzB2ZVorY29JOFpEYzdtMGt0TTlpaGc5M1BRbEdNNGM2?=
 =?utf-8?B?SnFjcmZObnJRaFlva0Z3T0swb3RTaVhNYThmakQ3ek5raU04QUZvYUpmdER1?=
 =?utf-8?B?dUlwMkowWU1tNGR5TmpKMGJIYmhxUHBrbGpsMDZ1SktxaG5tMmZ4bGlqdGZX?=
 =?utf-8?B?ajh4MVBtMjEzOGZTbDVTY2ZwZDc5bndUbEIxQUxEMlhPenpzKzNaM2ZTSity?=
 =?utf-8?B?aVY2blBYMS9xclVKeGN3SnYvMXZyMENTb0xzaXpwb0RaNkkycWFaYis2VHU5?=
 =?utf-8?B?U3p0OTNNN0lKekJrQWF2WWFDdHlvWjNpaUhTdU9ZaXpIeTRNakR3QTluNitU?=
 =?utf-8?B?K0hEa1FaOVhqQmVBcC9zcUNuNytDMU9yaGF3SURQVzBYWGd2d0JtZENtYWNm?=
 =?utf-8?B?NWIxZXRQU25ZcHd6QlcvRDVDQkkzQms2WHBqQnAzdVV1U3c5T2hzYzM0RXJs?=
 =?utf-8?B?d3lOZ2E3NnJzKzlpMVN3NzVqdHpQTDNaVUNKa3ZkY0ZOeFdadVAwOVVWMDBQ?=
 =?utf-8?B?QUNRSzVvakFSVm1xVmwrNUZEbU5DUWd2V05ueHhoTThkMGpZMEpQSUJJaVM1?=
 =?utf-8?B?RW1vc05QY2RMMUFWQmcyKy9TZ080UWFuenNmYkF0ZDNCcjRyWXBkZFJZRWFa?=
 =?utf-8?B?KytJYWNVYWxXU2R0bWZkUTFjRHljdlNJWTRCZDgwYU9MNDYweXQ0cEVLVDJm?=
 =?utf-8?B?TUMyS3BJSlFsL0NnYklpUy82SFRPSVdlVVRYTDl2RGdoVE1Na1ViOUduNDJj?=
 =?utf-8?B?T0tHaERvREtoN2c5bCt0dUlDOEd1WlVMMm94NXo5S0pBaTNZKzUycDV0M3lX?=
 =?utf-8?B?MmpUUWd5OWE1Y2IzWnoyeG42ZDFmNXhPN1ZJZzBwcmVwZk1MeThwdFRKbFBP?=
 =?utf-8?B?TkZFSVRQcnVOcDdWU3NsdWI3YTJDSVBGM0dJOFN5TklWU3cwOVhrblZZZU9h?=
 =?utf-8?B?V2RBQ21BZGJ1SnA3ZDl4eitGeEpXWHh1Q3dWZnI4NFE1WUFodXBqakVBSUl3?=
 =?utf-8?B?NkRRV09CSFE0MFgydVIwd3NXU2x5Vll6YWRSaTk1ZGtZM3NKTERYU3g5cExI?=
 =?utf-8?Q?t3bE6nu68NodHCfj08ZvLNJtMbC+6JuS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VThkZWovZTlqelBhRDFqby9TVzlNVmpwWE1pSnhvWnZ4a3BwUUw0blFYL010?=
 =?utf-8?B?K2JKQUtFekxQK0M1WW9pa2FtU3RYekVuT1V0anI0WHE2UnROUi9Jajdib0NQ?=
 =?utf-8?B?SFFjSTB3MFJVaVV2RSs2U0NvVGtZTVZZa3pYVWFwcExjVnNBQUZwTEZwdXcx?=
 =?utf-8?B?Z2N4cHVjUG1MVTc0TElEOG52VFNSaGRoZnZKOVZpcVFqc20zVU9SUGMxWng3?=
 =?utf-8?B?SDBNbkZObTJweitrKzZQNW5xejB4MXdZeXV6dlNVcXZjTTNyZFF3dzhYLy92?=
 =?utf-8?B?bURJZlh4WEptbllvOW5UK1Jna0dqZWs3QWQ1eExQSHp2ekhFRVNRK2VFK1BW?=
 =?utf-8?B?TmRlbWxvaEErandvSVYzZEpCYTJiWVBDZW1nNC9WNUlkMDEyemFtdGVIQWlm?=
 =?utf-8?B?T1B3QXdFT2VqYlliUG5sV3NuSVJBMXlDZ1QvQUhSRmNERk5qMmplUkM5cVRK?=
 =?utf-8?B?cGxobEpaOXpIWWwvWitSdXZ5RWgyQkhsWGFFMk0wTTZZSmhhL3ZwaUkvTE5V?=
 =?utf-8?B?NWtZWnpQQXA5ajRQc2VyaEhLZmtHbXVvSVYwRDF0cVc2QVZ1azNQZGI3YjRz?=
 =?utf-8?B?SHVqUXJmeXAyTUVTYlNhaFQxaklZam9tTUltRnZNMy9QM1ZsSmJCN1h6YXl5?=
 =?utf-8?B?dmZtYW5jdnJiQWI4V3U0SXYrYVJRdkcwb2k2ejdGY1R2ZjVOSEwwREJhUWZ5?=
 =?utf-8?B?UzlWSkh0K092c3lWMy9WM3hUK3VoL2U5ZERDdmZ2ZHBLc2JpY3N5dlV1d1NC?=
 =?utf-8?B?N3hqdXUzVEdoRHBwUmdteGlrUkNtUCtlODhvbDBIeUFoN1JMTGhpMVd3MVov?=
 =?utf-8?B?emR1azBhNWZ5ZWpuU3hYck5kVDdrMTVoY3dwVUQ5VURkSVArQitBL0RKQUht?=
 =?utf-8?B?RlRISXFlUWc4MDcrSUdYajZGZjZWeWVrSmFmcDRZYXlnaHI1elFFMHYwMFBX?=
 =?utf-8?B?S2UybnV2T2o3MjB3cktyTE5ibWQ3Y2NSN2cweTJ0bFRTY0Z0Z2lFNENtMVNV?=
 =?utf-8?B?YXVXb0FSdi9qeG5oL3BZQW5Hem5FSmdzQmpTR0RDU09QRHVkT2dIdmEzLy83?=
 =?utf-8?B?dXFPcmRoYjltOUxZL1dZaXYyU0p5dkMyY0VjR2o1M3luckJYaHBrcS9QK1cz?=
 =?utf-8?B?Y01DSk9BM3VMUTNhWXZjQ1NFSjNqQ2gyck5QWVI3a2l4YXlPYVBuVWcyZ25F?=
 =?utf-8?B?bDU4Qnd1T0tEM29hemlpamdVTS9ucTFsQm9ZMXNvenJMT2JjTFM3aFpZVys5?=
 =?utf-8?B?aWplb0YrZ2o1K2FyYmY2REZ2K1RLTlBrZXF0TTBkQWlHZXdUTXlRNXRESlA2?=
 =?utf-8?B?R1JRZHYvVjRPSzA4N1FkWnMwMGZTSHI0elZhK083OVR5OC9BR3J0V1JERURs?=
 =?utf-8?B?Z3BIeXlRbkN0VmtkZTdOZ0V5M3pveXpYb2JJbzVXYzc1NHRHOGNrZVNWM25U?=
 =?utf-8?B?MVJ4YUxxRWFEajBwT3lHYmNIOFREMTYrc29maW83bzlTeWdRL3Y5d0lHSGRG?=
 =?utf-8?B?N0oxUndWL25IRnlyV2JNN3ZvNUlQL3NxZ0tTSVhZL09LenQ4QkNNcFAxcEVT?=
 =?utf-8?B?MXA5RUNvS2pCSnBRSE5HOUxjUkFVQjVMUkQxTHZ1Ti9KR0NTK0NDLy84M1Y4?=
 =?utf-8?B?TjhlUFlyLzBXaFF0Ym93dUx0MTNoVnJpYi90U2lhSE1XbVNzYjhZV1dlMjBo?=
 =?utf-8?B?UjRqVFgyZWN1VWlqbXJ5blBhMExSSWVwTkgzeVpQbzAzRHdXelhjKytMVlZG?=
 =?utf-8?B?QW1WL2x6VHMxeHJPbUFVUkhRazMzL3JiZWQxdC81OXlaVTdQWElYSnVOUzMr?=
 =?utf-8?B?NTJIL0VvdFNtQlZOVlF4RWhiVkFkZlNpcmNGUHVDQ2srRWtzM2ZpWnhpNlha?=
 =?utf-8?B?Ui95blBFL1E4a0NrNVNZVWhiaDNIZXVaTUUwdUx6ZlJXV3p1RTk5dnNsbThx?=
 =?utf-8?B?bVpPb2wxanNaU1Vjc0x2QmYvZzJRWU9hZXBncGRzOFBqUHZuclJYU1FVbFpW?=
 =?utf-8?B?UUVTTzFvZWdWNm84bWJqRWJQcU9sSVczdXdCUkhYTzZnaDI4NHp4d0lFWFc3?=
 =?utf-8?B?LzM1UE9lV3FkWHl2TmxaVndSQ0JHYXcxVXBMVml2TEpxdGlTRnBLUnoxandv?=
 =?utf-8?B?bjh2OHFZZDlqUmdXcnpSMU1pdTA0bXRibHcveW5VRWRtUUlpZHh2ZnlpbzFJ?=
 =?utf-8?B?eVE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6617731b-394e-48fe-aedc-08de290f2897
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:03:41.7272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EsIJYv7Qk/oL5LTfGLHIzjri/PWqvI4CxsEOhVXR+9UakP7lUE7jnzCheCewBpsrJ7HsPQ2tj2PhGXqbAyPEbwHTD/2ox+Np5ZPcQqal6dA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5366

On 21/11/2025 1:23 pm, Juergen Gross wrote:
> Add a new make macro for creating <file> from <file>.in at build
> time. To be used like this:
>
> $(foreach file,$(IN_TARGETS),$(eval $(call apply-build-vars,$(file))))
>
> This can be used instead of the current approach to perform the similar
> step for file.in during ./configure.
>
> This will avoid having to run ./configure just because of modifying a
> file depending on a variable set by configure.
>
> Prepare to have multiple files as source for the replacement patterns.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - don't use pattern rule, but create explicit dependency in macro,
>   don't require to rename source files (Jan Beulich, Andrew Cooper)
> V3:
> - prepare for $(PATH_FILES) to be extended by other Makefile
> - let generated file depend on $(INC_FILES)
> ---
>  Config.mk | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/Config.mk b/Config.mk
> index e1556dfbfa..39e8007b9c 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -159,6 +159,19 @@ define move-if-changed
>  	if ! cmp -s $(1) $(2); then mv -f $(1) $(2); else rm -f $(1); fi
>  endef
>  
> +PATH_FILES := Paths
> +INC_FILES = $(foreach f, $(PATH_FILES), $(XEN_ROOT)/config/$(f).mk)
> +
> +include $(INC_FILES)
> +
> +BUILD_MAKE_VARS = $(foreach f, $(PATH_FILES), $(shell awk '$$2 == ":=" { print $$1; }' $(XEN_ROOT)/config/$(f).mk.in))

Everything else in the series is looking fine now.  But why is
PATH_FILES dropping the .mk extension from the file?

It looks weird for both INC_FILES and BUILD_MAKE_VARS to have to
re-insert it.

~Andrew

