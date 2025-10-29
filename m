Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFCFC1CC76
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 19:29:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153046.1483529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEAur-00082O-4p; Wed, 29 Oct 2025 18:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153046.1483529; Wed, 29 Oct 2025 18:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEAur-00080w-1g; Wed, 29 Oct 2025 18:29:01 +0000
Received: by outflank-mailman (input) for mailman id 1153046;
 Wed, 29 Oct 2025 18:28:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=brwG=5G=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vEAup-00080m-3M
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 18:28:59 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20f6e8e7-b4f5-11f0-980a-7dc792cee155;
 Wed, 29 Oct 2025 19:28:57 +0100 (CET)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 DS7PR03MB5592.namprd03.prod.outlook.com (2603:10b6:5:2c2::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.12; Wed, 29 Oct 2025 18:28:54 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 18:28:53 +0000
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
X-Inumbo-ID: 20f6e8e7-b4f5-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fk9E7VdRp5wuP/QIvfPJwPJzSTDNJN4bSuxRsIK3aSdfBuCTN97BmVtjGTjqPnobXf0DKw+juFpAG8Idma9lVm72guDpF5M7wIXtyr9sZIP/+KPdUOS1hJYsSvGEcWdegEzim/RMoQX29sjG9FQkL0minknpErbKngwBIR7EfdULMeM7tljdPKqS0KmUZkOaflr5WbjM63vl1IGoqxwXHrKpn/jZBi5eNIcuJGDVCNIPZ1cfqTDA7L0b8d2BwZK+V5vaAgI+afkUw+B0qJ+1nVP2LbpNs5+3KUGQTcX2Vf4DtQtpNKBM46dfVU+qKyWLzi3FHqb6zn+DA2O3hrx6bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7qy+yEkKFbdq1RocrZsOY3plHPFISBgb/g4L2H9JUc=;
 b=JsDKVKtmvE9VSmlgvVe2U0KwjMyF594j4vdCS0724UDNKQSzthcsRZc6ctjcf5aY8lKtUo2iSD96/dAtiRVX9cvMgPDP+Pl2n8+2c6CyBL95CCeT5WiBOPvmdnK2ZQ6b6klFJy4imTHkxhwXH/479p0kHznQz9zrvE4Pby4Z0o9K7nUm1/rFzpbAV6qQe7uKF1mu/IevuZ4RroZ0KIC/Vretwc+x4mu8uYeupXcNlMScNtE5C1n+xY6D9SXuXZ55ErKERdnqL9r36mgcUAsMX7wQOqFUl3SpJ/zfK0A1S4DmCqHH69vxdKzrKjqoizwt28RFZXc/B7hlFKoKQt9x6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7qy+yEkKFbdq1RocrZsOY3plHPFISBgb/g4L2H9JUc=;
 b=UeR3IvkmO96T6yChVsfmGAsx91UhGS8y1s1XRd+O8a7pcyI0FVCc9Dc1HjGVIv/pem89l/Qn3F7X89/2LfJaTz4OjndAFXRHhAV9GWBZv6nYIZN0CGCsORMNVExBi6GXbOXFYUMEPkQFaXwVsNPjP7SGYYuJaUaAa4vlIJaYlEI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <34dfa026-b231-4ab1-bcea-4ab7ab047de7@citrix.com>
Date: Wed, 29 Oct 2025 18:28:49 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Remove Shawn Anastasio as PPC64 reviewer
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <1669204635.4117.1761694107160.JavaMail.zimbra@raptorengineeringinc.com>
 <51be9c37-2102-48f6-a135-a079fec334ff@citrix.com>
 <984265211.4841.1761754494758.JavaMail.zimbra@raptorengineeringinc.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <984265211.4841.1761754494758.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0612.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::6) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|DS7PR03MB5592:EE_
X-MS-Office365-Filtering-Correlation-Id: f7eed063-f933-4c37-3deb-08de17190374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?clpLUEZLQ2o1OE1vR2NRQVlRcGNHRjRxRnZCZEUwRm03SlNSVzA3TkRWZlpo?=
 =?utf-8?B?Rng4M2N4RGt4am5wcm5OWlRic0s0Rkp2MlJvT0NGWnNBd29lNFRYU1NMVDdM?=
 =?utf-8?B?dHUzdERET3pHdDRjaTFzZUZPOTRkWDl4RUIrSFVRUFY0dHBpMy83S0tUbjE5?=
 =?utf-8?B?MjgxVFo2SnNWU1hSZTVEcXA0YjcwRUlURVFpKzRoT293aTlVazdEU2FFM2xz?=
 =?utf-8?B?VXNBLzNUVnU4UEV2QnBTS3dITmYyVDdEdzdUUVJWSHRNYVlQWnlkcnArQTJ0?=
 =?utf-8?B?QUppdFZoOXF4R2IzSWNxcy96Z0RIZTBYU2xhUW9tdlkyUjAraVFsODlkUEMr?=
 =?utf-8?B?OHRsUS9LTEQ0clYydUpDNk9vWmZvK0xsSVNYa0pwa09FVGJsVkR4OXRxQ0hF?=
 =?utf-8?B?c1JrRUdrMUxLZ2Q5cEtiMjF3Si9COFhXSW4zRXFNNXJvUWlNZ2F1N3paNXBu?=
 =?utf-8?B?QWFqOEZLc0tCU2VidjNBSkYyY3l5SjNBSmJYNkZRejBWTzZ0ZUF0RWVNVTJx?=
 =?utf-8?B?VGhGa1V4MVBzNWsrakRhZ1RralZKQUZhSEhxSjFyTDdQTnZZNlhTZ3p3SE5K?=
 =?utf-8?B?UlNOSlVyWHc1Z2RITUVkQXhEN1VrYmM1Wmg0V0Z6ZXlvZktCTnV2dzN2bDN4?=
 =?utf-8?B?MHd0b1Y3ejRxU1AxT25kVTN0ZGlrcDdLaURrRjVRbHVpYVNaRG9UWlBNZjY2?=
 =?utf-8?B?UExLVHRBSUx4cXJPRitKSnBMWWxuTUhHMmhNRDlUMGdIbkM2b2hVVENDOHY5?=
 =?utf-8?B?TStJQUlIZ2h6d0VSM2M4V0JqYjRFVFJGRE52TEtqVHVsZzRRMXRBTmZtd2Rv?=
 =?utf-8?B?NUFueTh0S296NWVLSkorVnRWTHZDSmxpUWNSQ3MyRXZTQjA3N0s4Q2tGUml1?=
 =?utf-8?B?VkVuUURuYzNYbmZUUDd3R0FtSUMvRHIyU0ZRR2Q2K0M5K1hoUXg5d1NSM3Bs?=
 =?utf-8?B?a0N2ZGwvZzYrc3d5NFpmNXVGeGtaRXZrOGR1ZlcyMXVpVFFNNjdyQ2poNUtF?=
 =?utf-8?B?YWtUNDd0TGtZNUViMDNCWGJlVHdWeWJ0RGtIazM2aWk5bEtjQndFYlF2K1RI?=
 =?utf-8?B?ME9XTk9TOFJ1YXYrdlNoL3UwV3NPdVRKMlhnc3I5b2xwVnZTWDZoemRxdHZs?=
 =?utf-8?B?UHV5c2JSbnZEWmxCMXRZOERJWFMzOE16L2lzRkFDL1RhSmxIaU9uSnNYZHRF?=
 =?utf-8?B?R2RkVHZDOE5KdWlodjlPQTNIQXY0OGZBSmFvcUVYU3hhbC94SUFRdGp0L0Nm?=
 =?utf-8?B?MmZxbXZSdGtWQVFqL2gza3QrSFF4dlBZOUsyUTdLRmtMQ3VZZFpycnBVWUdp?=
 =?utf-8?B?RUpRWElmeFk3SzQ2QVFuQ1FyVVlIZ1lkbGFtRk5jUDRkMmh4TllrcS9QQ0V2?=
 =?utf-8?B?QVM3V3RSb2VpVGJwejk2Q25SMWxZOHFxcWxuN2Z4T1c5bkdnZHU2eStPYUNt?=
 =?utf-8?B?bWhNdE1ENG9yaU1CbDFsZVhLUUxlMENPL2dHV3BnZjZIT0tRYmtxeDdlVFl4?=
 =?utf-8?B?TlpTdHlqZU1EbmZzRkg0Y2N0MEZzNlJ1THI4ZWxMOWd0V0hSby9wcHI5a1pO?=
 =?utf-8?B?T1A5cGk2QVBmZzc5U2QrWUdTdmpUdUQ3MUtxQXlXSEQ3V3hZTzY5eXdDOUlU?=
 =?utf-8?B?SnRtaWNXMzM4ZXpwVmZKY0ZoSkRnLy8zZ3YwYVBUazFNVXFkdTZES3pOUlVS?=
 =?utf-8?B?bDA2c0NoU3VaS0o5VDlLeDBOMkFHSXoyQ0kxdms2SkJiWWdVdTBCZ213dDFP?=
 =?utf-8?B?Q1d2V1lBWmlRVHkrU2lwNUowRytiSTcyRlRjcit1UExPRGdUZ0dud0YyL0VE?=
 =?utf-8?B?RE5TRXFvcnkxQ0FUbW9ZL0NNNW1yTXdHVE43NXFFU090Ykk1TXpDaWNkbDdl?=
 =?utf-8?B?VFRSN1oyNE15TCtIa3pXZFBGcnV6cVJ5YVRYeStPS2E2NmI3aHliWFZ2aU5Z?=
 =?utf-8?Q?gdkbz2fJSmCsIegPSUzTdaCibctOV/Ms?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TG9YQWc3aTZBSXRIYXJYQjhYVE9wZDFsNGd4Q2o1aXBwR3UxRnpNWm4xWU1L?=
 =?utf-8?B?WGx4WEhCRjZFYlQxWTZNMUh2MFZxTDNQejdJWUltYnd5bTBhSkgvMzFyeWdz?=
 =?utf-8?B?QkhNWmJhNDVyYWRkQkFaMmYydE9iZWZFckFPcWMzc2NSTWhmRG1pdE01OUcx?=
 =?utf-8?B?aEZ5L0wrdTN5c0tqSGRRdHk0ZDEwZmRFWkcrT205QmJFeFJPay9WSVBONGdG?=
 =?utf-8?B?TXR3UjM5MElrU05wWG9PdURHL2xYdFRQaG1OZ2RPMXArdnNmVW9HTFNEcTdp?=
 =?utf-8?B?c2JDL3JiZ1NIUGFNQlNLaTQyM1oyeWFqVXlaODhqeFY5LzlFcG5zdWxlZHdL?=
 =?utf-8?B?TXZxMmRBaGVkVGVrS0hWejd4TmloemFkNXBKcGFUT1ZybTRkWmlLTWpuVUhh?=
 =?utf-8?B?VkFVenY2K0p5OWRkM25GVk9aUTFSSEtmc1dLNFNsUytUVElFTlcyM1RiOEZL?=
 =?utf-8?B?eHhCRDJ4cTZXekcvTzBOMWVjMUlySDBML2VSNllZY0lsU2VZMGFIVVIwemxB?=
 =?utf-8?B?UlVTLzM4N0R6TmlsRmFYbnRydy92OUk5WFRGeFNaRUJXUU9BbnFIWEloQWIx?=
 =?utf-8?B?Q3FvUWxjS3hRdFN0SFd2QVlBeUZoeHkyWktFVXFjNkhPcjRGTGhPY3B0TGxT?=
 =?utf-8?B?YjNaQ1R3YWgyOHBJM3Fhc01LSHBWOGlQWWh2K0g5R0U2Q3MxRHZteWlWWWtm?=
 =?utf-8?B?N2l0S2svQ1M1ZHRodVNkUHlhTUFMUG9mSEdEUmgvZC8yZHJnYmczNWdUQU5W?=
 =?utf-8?B?cE1iYXhGd0plamZMY243dUg0SHhaTkc1Q2VGTDlYRHRlN3RTaUE5akwrK3Q3?=
 =?utf-8?B?ZjNtcmpuL3NDZXUxajBrT20yenBqeDBwbFlZK08rMHBkNnFJVXlzSmxDZTVL?=
 =?utf-8?B?UnZKYkYvYS9laDJUam45OE1vM3dOVVppWnhLeHhwWXRGUHpiNUpLREdLRU5G?=
 =?utf-8?B?OG9LK0kyTlJwSGF6M1ZyUVdKV2swL3E5UXpidkp6MVd5UEtmT2V2NldsUU14?=
 =?utf-8?B?aG5Ha2ltcDRsQXdjWFhxK3cvNmJMMmtyRGlUT1NoUUpqT3F3RkxSczN2Wjlr?=
 =?utf-8?B?NlRaaCtaazIyQUF0WDVzODE3d0tkSW9SbDR2RW9KQUYxNTNFY2M3QzBwd2dQ?=
 =?utf-8?B?L2pNQU9BeU16Tmc1Nm9yaUExZmdkVmpKVVdsWHFhNnJ4LzM5eDNUR3R3Nmwr?=
 =?utf-8?B?eGNyZmhHRWdCM0R0b3gxUkhtQTRrVitmOU1KdldZeFpDMi9vYVRSRTY1ZE1B?=
 =?utf-8?B?SFpqQlhVMU9rbkJtbnFVU2J2Y0p0bGFjOHowTlUydzhEN1VxNlhVR2lLMFlE?=
 =?utf-8?B?NlptVVJIN3BNRTdSK1dtNW5YR0R3Vy96ckJrYzBSL25mNjVsVmx1L2U4ckxs?=
 =?utf-8?B?VzFVZm03Z2J1YUJENXZScG1Jc3Uwb3dHSkFUSWMvVzN2TzFSaDNmV1EyYnh2?=
 =?utf-8?B?ZXprOVRsM0U0V1BPTVNsMmFMMmdQVnEyZC9tZm81azRLVG9lcWR2L3R0ZEQz?=
 =?utf-8?B?Z05vcjFPWUFESWpsQkwrVm03NjgyMTBrcG41VkhHQnl6cisrVThnNmliRUMv?=
 =?utf-8?B?ZjV4YWpFVDFSV2hRWnZYTWdkdEZaSXlGTlB1clpSa0JrRXdtMDZVNzZOUm9W?=
 =?utf-8?B?dUxkcGVRTERpdTBTbHI2NDExK2F3SDhxbHhnOGI2UDYyNEk3QXRtRzgxeTNH?=
 =?utf-8?B?RlZIb0NyUlpJU05NYzNCVDBabmlvZnRQZDdrVEFFemxvSWJiVmNocmdaZ3RC?=
 =?utf-8?B?SkhHTmQ2Tm52SmRCTzcyTEc5a3VkTEZib0RoZ0lVOGdSQzBrSjJaRHFYNWJ6?=
 =?utf-8?B?YWFDWHFFa3hxU2Nkc2EzS3V6bEgwTnVzL01iejZXOXN3WDhsMGtrYnN1bnBx?=
 =?utf-8?B?TnY5Slpjbm1ZVjZzM2pidm9YQ0E5UkZDZFdJUEhKNU91TGhnWWNvQzJ1ckRP?=
 =?utf-8?B?aXpKYXhsNlYvOTNkNVFoOWhVWTRjaktFTFZuTDZpUmgxZml1dEJkaEo5NEVz?=
 =?utf-8?B?UnBlT2xWd2x2SDhPT1dUREpURktLWURqSUg1RGtXZHRDV09qOTF5aGI5NHh6?=
 =?utf-8?B?SFFpSjNlbWluVFB3azBXTHB2QWh2L1lkYWJhZGZGeDZpNDU3OTFoK1ZoT3Y2?=
 =?utf-8?B?MGhqdzJBck9QQ0ROMlBsTUx0M3JQQ3Q4b1R4SkFuNXJDWFllOFNwc0JDZnFF?=
 =?utf-8?B?d3c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7eed063-f933-4c37-3deb-08de17190374
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 18:28:53.7757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v0AX1FpRqmJujPOythw4Gs3WaNbNeEGa/f4SWTbdjsGkvGtUvxvU2qpTTCX4Vxyz25LKS0V2skHiw0e8MOM81Ru7+jSQMaaeG7vRiNDdSEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5592

On 29/10/2025 4:14 pm, Timothy Pearson wrote:
>> If you're not aware, we do have some PPC64 build jobs and one QEMU boot
>> test in CI running on every commit.  e.g.
>> https://gitlab.com/xen-project/hardware/xen/-/pipelines/2127184050
> Indeed!  In fact, if there is any desire for native builds in parallel on our POWER9 infrastructure we could arrange that as well.

We will need that in due course.  Cross-compiling the hypervisor is
fine, but the userspace tooling is a different matter.

>
>> Would you mind changing to R to reflect how things are working in practice?
> I can do that.  Is there a path where we would want to move that back toward M or is this decision a wait and see as the port progresses?

Yes, there is a path, probably as we get to the point of tech preview.

>
>> Also, we're in code freeze for the Xen 4.21 release right now.  This
>> patch will be fine, with a SoB, but the others will have to wait until
>> 4.22 opens.
> Fair enough, nothing here is time sensitive.  Work continues on the port and patches will start flowing again for 4.22.
>
> Thanks again, and looking forward to working with you over the coming months!

Thanks,

~Andrew

