Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E359A91625
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 10:08:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957080.1350272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5KId-000839-3K; Thu, 17 Apr 2025 08:08:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957080.1350272; Thu, 17 Apr 2025 08:08:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5KIc-00081v-UO; Thu, 17 Apr 2025 08:08:42 +0000
Received: by outflank-mailman (input) for mailman id 957080;
 Thu, 17 Apr 2025 08:08:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/8PF=XD=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u5KIc-0007l4-4n
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 08:08:42 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2009::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bfa5807-1b63-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 10:08:40 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by MN0PR12MB5930.namprd12.prod.outlook.com (2603:10b6:208:37d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 08:08:36 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 08:08:36 +0000
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
X-Inumbo-ID: 2bfa5807-1b63-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cw7vBmnUUTXAhcRHthrR7OmGR9PNyCAnjHfOGEhdvWuUb4IdiKgA5O3DzuqxpFyECeUr3HWofffUtuNNZyKaSzFlNluKrz4mzpwmEqO22+E+Zb88jBMy7wLCWw3Q0UPnnx64DFd5DuReuE49o04waTKFVPiXEwtpMd48Xm5ZQe9lyccr2IFLQT0naANZf5UkHWIwTHNnLyvN/uiLx3jgmssvVeFxvuEVGH4kLC0n+fE+6dM/gkCzF0tkQy9qJt4vtLmKWR5mqZDoAMi/yxnal7tdY2F80YoCm3hZhE5aROKUhKcG0HZc4YRuNye80q0Pg8KLcejHXwUqBnewvqpHIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/rZUlDTGTibTU0OIxME61lhrrI/BhiOSh+Ax4g7DDrs=;
 b=eJdpwbr4JQJ/tQ60WSFobN/77DkkQEspTyrGar89B/Ss6/tcfGA2RII9nrLLHaOZbpBkn8hQPKDfQcHWYDNffXC+7kEs/ALmdfhg8cs41vtdpxLDJ9uHTqHTZK4ruyC1/yaIw7l+jSb9ZladdoZDHk/e55u2E/S6l4xLDxG0RMT4I92VXwuUlJyorwfG/KsDXvkvJXS/V+cgxcT9VxLdvXQeG4XAS0jQtXXwGEMgaK1qiTtApe2o+H1P+b3PL1Tvb5DF4i4ympaM+Bry6ERdalOejoeCaSJnbWGHmK7Ib7wwztSMKdL+Iy+EHZrOpB/wQhNyyBGtl/e+aBnVvRH8fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/rZUlDTGTibTU0OIxME61lhrrI/BhiOSh+Ax4g7DDrs=;
 b=gWMtONwOEkECuGfM+kx9DhlgtEnJngxKDCFAcoqK6lTnCNkcbTqaQH3i6Far2zplkUk3k1pYMbmRsO6mbicnbAXCjtqRjq4hV+pqXnM10dbQ7lV62YGNM6IuFOMKPm64PLsqLQxjIVWCYILiXCm8q7IqhPZHIjS8Ap+y3LZk958=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <6e0ec1f3-08e5-475f-8d66-f3814e047760@amd.com>
Date: Thu, 17 Apr 2025 10:08:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] xen/common: dom0less: make some parts of Arm's
 CONFIG_DOM0LESS common
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1744626032.git.oleksii.kurochko@gmail.com>
 <c31977cb20be408ac695ec44edaa6e058e6ec10f.1744626032.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <c31977cb20be408ac695ec44edaa6e058e6ec10f.1744626032.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0433.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::15) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|MN0PR12MB5930:EE_
X-MS-Office365-Filtering-Correlation-Id: 1138e257-c25d-4ad4-7638-08dd7d870de5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXJEMzg2akRNNGkwSXJvZEJuTjh3OHFRdEFpenIveWxKelJpUTFaRkZ0NEhE?=
 =?utf-8?B?SEtuZlVkTlRYeDhWVjJGTFVyVURUZHFyTDFIbTZ1Y2E1TkoySFl5d20rdG5q?=
 =?utf-8?B?eHZram1JVTc4UjQ4d1ErbGFEVDF5dHllbkg1cmk1ZjA3TGpkbkZiUzQ4Vm8r?=
 =?utf-8?B?UUZENUJldHZ6M1NETHdnZjQ4amNENmNjWlM5VVBwRHdvNTBJV3o0bVNCSlpE?=
 =?utf-8?B?OVZIUXhaTTRsQmdIRXg3OTNaaUphc1BUVmZxajNSMDN3MHNZRGZ6MlIwTWZN?=
 =?utf-8?B?UzFuNnVNZjRYeFNhTERHWFBIcHVHcjhRbE9MNW8yeWN5RmtzSTJaZHNMRzhK?=
 =?utf-8?B?alU3OTdSLzduK2k1Kzc4cm1xeFVIdFlySzlOM3pBYXBwaEZuUGZBc1o4NWZo?=
 =?utf-8?B?Z1VLMVlOeldudmhVaEl1U0FocW5oSWk4eDRuT3AzbVNvUEVITGNqdWowSFdJ?=
 =?utf-8?B?R25SbEYwTE55eHZmZjVwbmZSQ3Raa0RhMGVNN0NOd085UU03VkZrNS9sdGpO?=
 =?utf-8?B?bUVWRXltVlZNdE1PbEhCRFgrSnVDVmpGM3NsVC9hZEpGMEhTeTN1akY5K09o?=
 =?utf-8?B?TVoyYks1MXlkYVdiVFloMDdPUjlDaS92RnozTldRRVlQZXVQUGRlRjFqK1Ez?=
 =?utf-8?B?RUxmMXlEeDA3Z0dJSXB4OCtIbnBqNS8vNDM3WVZ4WTVaOWpiamJySmc1KzVG?=
 =?utf-8?B?OUFBZDF4RjBJNVhETElWR0RPVG5oc1IwOGh6bzREK0FwOVc2S2xJREpPRHI0?=
 =?utf-8?B?SnY3YkhpRzlza09mLzArS2N1K29RWXdGbVoxSjd3SytOY2lCMGt3TXR4QzFo?=
 =?utf-8?B?cU1zRyt0RE9zaE1tbURkSnZJNWdneERpRGhLY2VYWE5YNGJWMFdCTTB0OEd5?=
 =?utf-8?B?RTBiZ05iNlhaY0ZGanBqR2M1MnpjdzhNbnczQVF3L2plaiswbWQ2L1FMWmta?=
 =?utf-8?B?L1VlQjIzeEdCcjJpbTR0bU1iZkQrWnB4LzM3WTdIRG1tNmx0SldsdWJVUU5G?=
 =?utf-8?B?QlZ4YjZaUm1JdW9NWnd4WEJua1VPVmh4bStKYktsa0dsLzlGeUxXdzZBdUlB?=
 =?utf-8?B?OEthTnVXOVBudG8wekdNWmR4eDVUQTE5R2tuN3hJMjdUMXFsdW1kQXppekRs?=
 =?utf-8?B?SDhXYUVIR2M1b01NZmlqaHc1SWtlb3JvTFhYZ0RuK1hOK2RYcmRraG5wMlA2?=
 =?utf-8?B?QWxvOWJtU0FuU2c2TllOVjVCYWhKTURDSkpsdCtNZTllelVrQjhKT01PK0hP?=
 =?utf-8?B?cVcxb3VmWFRsem1IWjJzUDBMZEZRUG9VVGFOenNXdDhLNmxWaXBBR2djQWVI?=
 =?utf-8?B?UmZWWkRYNzhZZmVKd0xPbzRLdHY3M1UxSHBJRlozSW54WmJ4MGxSQlB5dUM3?=
 =?utf-8?B?Rkk3T3ZvUlovb3NTbnI2SEpHSzlkY3pIclFPbVNrQVh5QlQ2RXNvbUN6ZVlC?=
 =?utf-8?B?c0JJQ0MwQ2RGbzM0SVUvUEJSSXA0QTlBS0E1UUM3TzhORkxFK0FzWVhaS2xs?=
 =?utf-8?B?QktDdmswVnNtMHJqaVNSUloxeXN2bXd3MEdQWld3aldHRzJpWDd2d3FoNjYr?=
 =?utf-8?B?TVpqa3NUMnZ6MXBCZXpjTDFmWkZhMEZUUEpTZHBmaFN2SkNBTFdWdTF1Z0pk?=
 =?utf-8?B?L0o2SWVyVnY5QVpPeElscXBQL3dxS3dUNFBMN3RudUlRM2hJbHdYNW5Ea01z?=
 =?utf-8?B?ZmFFcFR4NUpNYUVGT3FZMWZzcGNnaU42RXlmOW8zc1IzM1pWMlp5bzBTazdl?=
 =?utf-8?B?UDVac1hyN3I1R3A4djYyb0hKdXQ4KzRxUW5tY1dxR0llNnljbU9FWWhvMVFR?=
 =?utf-8?B?MmI2bXB1WVhoQ0Ria3pWTldMS2dTa0VLZ0p2ZUptajdVWUt4Wm93V3oxK1R4?=
 =?utf-8?B?TkEvdXZYVXd1ZW5jbmZXUnNvYXZ5ck5lQ1ZyOFNHMUtqdFc4emNPekZFb1hk?=
 =?utf-8?Q?drHKTY4TzKs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mm41MFZYaE1Oby84amxuampyaDluWXlBSXAvTG1XU0NNOHFLS1BYSXJKbHNz?=
 =?utf-8?B?bk0vcVpyN3l4QXNpazVHK0hEVmhGRk9OMVBsSGxHMXhlb2VySTcvR1Y4QXpt?=
 =?utf-8?B?aDZPajVCNkVFc3dFbG5XUkZQakVHaTNwMkRtTXJQYjdBeU1heEVIRWdXY3o5?=
 =?utf-8?B?WUt0eG5WY2FzSVRnazNEMU91cHpZL3NtTVcrYnBBZEw3ZE90MmFTTTJWMTZU?=
 =?utf-8?B?NkVzM3AzYVR5VlllMW43L1A2N1VCUEVRTmhZdzdlNy8ybys2OFhsNW1ueHFR?=
 =?utf-8?B?Zmg1Q09ZRnRKUDVCbHN2YVppS0s1eVZBRDMvSEhzNjNvTG0wcGFZTHNQSnVs?=
 =?utf-8?B?MHRvOGgyVmM1eE4va3ZHdUloeVZnd1ZkNEdmTDV6dnJjL3c0Sk9mN1BTUkhM?=
 =?utf-8?B?OFlxWEhGVXVlR0M4N2RTTU4yWS9GUFRKWldRRUpmVnVXQmpPNUhlY0owcE9u?=
 =?utf-8?B?L2Z2Ty9BTU1WNWRWVFZLbXFWaWNEQlR5V1VwQ1pUVnl0WmU0MGQ1UVNuZ1ls?=
 =?utf-8?B?c1lUQ1VEcEo4eHN3a1F0RjJhbmx4cGtPOTBGSkQ5cXZXUUU4QlcwbFB1WlhZ?=
 =?utf-8?B?aHZIN2xWUUNLdi9PbG93dGM2aWlDaVhSeHJhcWNRSStkWmpjQXp1eE1LdDZ2?=
 =?utf-8?B?Z0ZqMlBOaUd2S1gyN1NiaWlhQVdKbXBHb0FDQUR0ZFJaNnFkSWdFWGxmRVNN?=
 =?utf-8?B?U2psTDMvREdoQS80YlQ0SnZMWU9hNURZeVpJYWpvUGYxZTJ0ODVhYnhHM0w0?=
 =?utf-8?B?TDM5M1MxOElGY1Y3OWNpQjdsc3pOMXRucmRsU1dYdURhSEs2Nkk1YkMwTlBm?=
 =?utf-8?B?eEFtVDdOcm12RzVybGdhdDMzTmtadjRSSjhvTmdKQytUWFRtc3VQbmdPNUNW?=
 =?utf-8?B?Q3kxRHpuSmlTT2hJbUZ1Rjh6eWVYSHRIZzVnR2JBNG1XdG1tTEVPK0FnUjVJ?=
 =?utf-8?B?dHpNak9rOWNFTUNpOWcreHFXdm9zWjVtdkhXNlQ5T2NMaUgxN3RpUmsrN1ZR?=
 =?utf-8?B?bVp3QWtMeHVmRkRtMWdhclBwNmhVRExaekZoeG51UW1uVlVFWkJPZEFtYjVI?=
 =?utf-8?B?cGxMOGhlbEc1U0J3Q0ZPQzRhRGlXYWFGQ1NQVHlUaUkxcXgzakxPdjJXZGZX?=
 =?utf-8?B?QWRzQWR1SFRQUi9NL0d1bS9tdnUwZ3VreSswVXgxSlhjT3hpQmdPRDI3R1Qx?=
 =?utf-8?B?R2JhRnZrUG5JcUU5OEdjeG1tUWxqRWlEVW91MWhxUWRRNFdTU3dnTHJKeHds?=
 =?utf-8?B?SnprRm4wOXlENkQyRkVlWkt4VHJieU1rRlhYMzRLU1NkK09RYnpWbFhRZ2xU?=
 =?utf-8?B?QUNYVkM4MmQ0cHlUYnd4cU1QcGRGbStmMllKd2JVVkh4Nmt4ZmNjVUszakpm?=
 =?utf-8?B?aFdxVmIyYSt5WFVJT0x0WDlaNFo2eS9FMDkyMVVDbmQ1cmZKOU9XUXRzOUo1?=
 =?utf-8?B?amZTazdYellVRzRQL1lWMTJzZWtIVnVMME1Ka2dBSEtJVHBOUzJJOGt1Q2V5?=
 =?utf-8?B?eVh5VDdkN1laWk1md1MvQmpyRDBDWmJJaXRIWUQ1TlQwc3pFZ1FaYmJ3RFhk?=
 =?utf-8?B?dFNkQnYrTFBRdGJMbU00L3JUaE5lMEQ2bDEvNjJyZmhZcXdIbVhIeGpOSi8r?=
 =?utf-8?B?NzVrVnFpOWNuWW1nbDVod09HaXAveG9wRXRjYVlvWXlRZmhTMmYwUTQwSm9J?=
 =?utf-8?B?VUszVnc0SmNsRkZucEFZVUZwQ2lwQ29GbTdmVEt3NVI0V0c3cCtpZlB1d1p2?=
 =?utf-8?B?ek40ZzloTzAvQWlxcW1pVysvWjdOcDlrTkpGMTBtTjZPMGhmWWw4MnQwd01L?=
 =?utf-8?B?RXA1WStnS0hUYzk2V0diMml6MUVQU2pqR1RNUG44UitibHlmWWlMdlhpZDlF?=
 =?utf-8?B?Q2xLRFNtTUxtVVh4V2J5YmkybDQveDExUjR0U0VUcEg4b0JmRXZRS0E5Q0FI?=
 =?utf-8?B?ZS9VcDFqbDhxZE1pZEFaaElveHAraHhXbVQ3ckN5VG9kMXBrNklZV3o3ZExL?=
 =?utf-8?B?blk1UmxoU0ZsMUtCV1crdkhBRXNHNmJHbCtLR3AxRnNvTDloTFJWWFlrSytu?=
 =?utf-8?B?SVFjdnpZVDBiZkttUVN1VEk3Q3AxcTBiWHBLcFB1SG5YYlRwY3BlOXBTemZp?=
 =?utf-8?Q?OQzM5Eo0ezW6dv2Hi5PWuNaTR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1138e257-c25d-4ad4-7638-08dd7d870de5
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 08:08:36.5500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zpvISxjEnU6k2NzqjX1WFzepOr2kwtWOkVs7xiaRI6lw6c7QBYK3a7TaaF153KZA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5930

I'm ok with making dom0less common in principle but I don't know if we should
keep using the word dom0less which we all know is confusing. In one of the
maintainers call we agreed on using "predefined domUs" to denote the concept of
starting domUs at boot in a static way. This was so that we could have a common
name for parts that are common between dom0less and hyperlaunch, while leaving
dom0less/hyperlaunch to denote arch specific bits. We need more opinions here.

On 14/04/2025 17:56, Oleksii Kurochko wrote:
> Move some parts of Arm's Dom0Less code to be reused by other architectures.
> At the moment, RISC-V is going to reuse these parts.
> 
> Move dom0less-build.h from the Arm-specific directory to asm-generic
> as these header is expected to be the same across acrhictectures with
> some updates: add the following declaration of construct_domU(),
> arch_xen_domctl_createdomain() and arch_create_domus() as there are
> some parts which are still architecture-specific.
Why do we need arch_xen_domctl_createdomain() and arch_create_domus()?
FWICS the latter already takes d_cfg as parameter. I think we could get away
with just a single arch specific function called during domU creation to e.g.
cover arch specific DT bindings.

Also, if there are already functions with _domU, use it instead of _domu (i.e.
lowercase) for consistency.

> 
> Introduce HAS_DOM0LESS to provide ability to enable generic Dom0less
> code for an architecture.
> 
> Relocate the CONFIG_DOM0LESS configuration to the common with adding
> "depends on HAS_DOM0LESS" to not break builds for architectures which
> don't support CONFIG_DOM0LESS config, especically it would be useful
> to not provide stubs for  construct_domU(), arch_xen_domctl_createdomain()
> and arch_create_domus() in case of *-randconfig which may set
> CONFIG_DOM0LESS=y.
> 
> Move is_dom0less_mode() function to the common code, as it depends on
> boot modules that are already part of the common code.
> 
> Move create_domUs() function to the common code with some updates:
> - Add function arch_xen_domctl_createdomain() as structure
>   xen_domctl_createdomain may have some arch-spicific information and
>   initialization.
> - Add arch_create_domus() to cover parsing of arch-specific features,
>   for example, SVE (Scalar Vector Extension ) exists only in Arm.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v2:
>  - Convert 'depends on Arm' to 'depends on HAS_DOM0LESS' for
>    CONFIG_DOM0LESS_BOOT.
>  - Change 'default Arm' to 'default y' for CONFIG_DOM0LESS_BOOT as there is
>    dependency on HAS_DOM0LESS.
>  - Introduce HAS_DOM0LESS and enable it for Arm.
>  - Update the commit message.
> ---
>  xen/arch/arm/Kconfig                      |   9 +-
>  xen/arch/arm/dom0less-build.c             | 270 ++++++----------------
>  xen/arch/arm/include/asm/Makefile         |   1 +
>  xen/arch/arm/include/asm/dom0less-build.h |  32 ---
>  xen/common/Kconfig                        |  12 +
>  xen/common/device-tree/Makefile           |   1 +
>  xen/common/device-tree/dom0less-build.c   | 161 +++++++++++++
>  xen/include/asm-generic/dom0less-build.h  |  40 ++++
>  8 files changed, 287 insertions(+), 239 deletions(-)
>  delete mode 100644 xen/arch/arm/include/asm/dom0less-build.h
>  create mode 100644 xen/common/device-tree/dom0less-build.c
>  create mode 100644 xen/include/asm-generic/dom0less-build.h
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 565f288331..060389c3c8 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -15,6 +15,7 @@ config ARM
>  	select GENERIC_UART_INIT
>  	select HAS_ALTERNATIVE if HAS_VMAP
>  	select HAS_DEVICE_TREE
> +	select HAS_DOM0LESS
>  	select HAS_UBSAN
>  
>  config ARCH_DEFCONFIG
> @@ -119,14 +120,6 @@ config GICV2
>  	  Driver for the ARM Generic Interrupt Controller v2.
>  	  If unsure, say Y
>  
> -config DOM0LESS_BOOT
> -	bool "Dom0less boot support" if EXPERT
> -	default y
> -	help
> -	  Dom0less boot support enables Xen to create and start domU guests during
> -	  Xen boot without the need of a control domain (Dom0), which could be
> -	  present anyway.
> -
>  config GICV3
>  	bool "GICv3 driver"
>  	depends on !NEW_VGIC
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index bd15563750..7ec3f85795 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -20,38 +20,6 @@
>  #include <asm/static-memory.h>
>  #include <asm/static-shmem.h>
>  
> -bool __init is_dom0less_mode(void)
> -{
> -    struct bootmodules *mods = &bootinfo.modules;
> -    struct bootmodule *mod;
> -    unsigned int i;
> -    bool dom0found = false;
> -    bool domUfound = false;
> -
> -    /* Look into the bootmodules */
> -    for ( i = 0 ; i < mods->nr_mods ; i++ )
> -    {
> -        mod = &mods->module[i];
> -        /* Find if dom0 and domU kernels are present */
> -        if ( mod->kind == BOOTMOD_KERNEL )
> -        {
> -            if ( mod->domU == false )
> -            {
> -                dom0found = true;
> -                break;
> -            }
> -            else
> -                domUfound = true;
> -        }
> -    }
> -
> -    /*
> -     * If there is no dom0 kernel but at least one domU, then we are in
> -     * dom0less mode
> -     */
> -    return ( !dom0found && domUfound );
> -}
> -
>  #ifdef CONFIG_VGICV2
>  static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
>  {
> @@ -869,8 +837,8 @@ static inline int domain_p2m_set_allocation(struct domain *d, uint64_t mem,
>  }
>  #endif /* CONFIG_ARCH_PAGING_MEMPOOL */
>  
> -static int __init construct_domU(struct domain *d,
> -                                 const struct dt_device_node *node)
> +int __init construct_domU(struct domain *d,
> +                          const struct dt_device_node *node)
>  {
>      struct kernel_info kinfo = KERNEL_INFO_INIT;
>      const char *dom0less_enhanced;
> @@ -965,188 +933,92 @@ static int __init construct_domU(struct domain *d,
>      return alloc_xenstore_params(&kinfo);
>  }
>  
> -void __init create_domUs(void)
> -{
> -    struct dt_device_node *node;
> -    const char *dom0less_iommu;
> -    bool iommu = false;
> -    const struct dt_device_node *cpupool_node,
> -                                *chosen = dt_find_node_by_path("/chosen");
> -    const char *llc_colors_str = NULL;
> -
> -    BUG_ON(chosen == NULL);
> -    dt_for_each_child_node(chosen, node)
> -    {
> -        struct domain *d;
> -        struct xen_domctl_createdomain d_cfg = {
> -            .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
> -            .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
> -            /*
> -             * The default of 1023 should be sufficient for guests because
> -             * on ARM we don't bind physical interrupts to event channels.
> -             * The only use of the evtchn port is inter-domain communications.
> -             * 1023 is also the default value used in libxl.
> -             */
> -            .max_evtchn_port = 1023,
> -            .max_grant_frames = -1,
> -            .max_maptrack_frames = -1,
> -            .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
> -        };
> -        unsigned int flags = 0U;
> -        uint32_t val;
> -        int rc;
> -
> -        if ( !dt_device_is_compatible(node, "xen,domain") )
> -            continue;
> -
> -        if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
> -            panic("No more domain IDs available\n");
> -
> -        if ( dt_find_property(node, "xen,static-mem", NULL) )
> -        {
> -            if ( llc_coloring_enabled )
> -                panic("LLC coloring and static memory are incompatible\n");
> -
> -            flags |= CDF_staticmem;
> -        }
> -
> -        if ( dt_property_read_bool(node, "direct-map") )
> -        {
> -            if ( !(flags & CDF_staticmem) )
> -                panic("direct-map is not valid for domain %s without static allocation.\n",
> -                      dt_node_name(node));
> -
> -            flags |= CDF_directmap;
> -        }
>  
> -        if ( !dt_property_read_u32(node, "cpus", &d_cfg.max_vcpus) )
> -            panic("Missing property 'cpus' for domain %s\n",
> -                  dt_node_name(node));
> -
> -        if ( !dt_property_read_string(node, "passthrough", &dom0less_iommu) &&
> -             !strcmp(dom0less_iommu, "enabled") )
> -            iommu = true;
> +struct xen_domctl_createdomain __init arch_xen_domctl_createdomain(void)
Out of curiosity. Why by value?

> +{
> +    struct xen_domctl_createdomain d_cfg = {
> +        .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
> +        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
> +        /*
> +            * The default of 1023 should be sufficient for guests because
> +            * on ARM we don't bind physical interrupts to event channels.
> +            * The only use of the evtchn port is inter-domain communications.
> +            * 1023 is also the default value used in libxl.
> +            */
> +        .max_evtchn_port = 1023,
> +        .max_grant_frames = -1,
> +        .max_maptrack_frames = -1,
> +        .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
> +    };
> +
> +    return d_cfg;
> +}
>  
> -        if ( iommu_enabled &&
> -             (iommu || dt_find_compatible_node(node, NULL,
> -                                               "multiboot,device-tree")) )
> -            d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
> +void __init arch_create_domus(struct dt_device_node *node,
> +                       struct xen_domctl_createdomain *d_cfg,
> +                       unsigned int flags)
> +{
> +    uint32_t val;
>  
> -        if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
> -        {
> -            int vpl011_virq = GUEST_VPL011_SPI;
> -
> -            d_cfg.arch.nr_spis = VGIC_DEF_NR_SPIS;
> -
> -            /*
> -             * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
> -             * set, in which case it'll match the hardware.
> -             *
> -             * Since the domain is not yet created, we can't use
> -             * d->arch.vpl011.irq. So the logic to find the vIRQ has to
> -             * be hardcoded.
> -             * The logic here shall be consistent with the one in
> -             * domain_vpl011_init().
> -             */
> -            if ( flags & CDF_directmap )
> -            {
> -                vpl011_virq = serial_irq(SERHND_DTUART);
> -                if ( vpl011_virq < 0 )
> -                    panic("Error getting IRQ number for this serial port %d\n",
> -                          SERHND_DTUART);
> -            }
> +    if ( !dt_property_read_u32(node, "nr_spis", &d_cfg->arch.nr_spis) )
> +    {
> +        int vpl011_virq = GUEST_VPL011_SPI;
>  
> -            /*
> -             * vpl011 uses one emulated SPI. If vpl011 is requested, make
> -             * sure that we allocate enough SPIs for it.
> -             */
> -            if ( dt_property_read_bool(node, "vpl011") )
> -                d_cfg.arch.nr_spis = MAX(d_cfg.arch.nr_spis,
> -                                         vpl011_virq - 32 + 1);
> -        }
> +        d_cfg->arch.nr_spis = VGIC_DEF_NR_SPIS;
>  
> -        /* Get the optional property domain-cpupool */
> -        cpupool_node = dt_parse_phandle(node, "domain-cpupool", 0);
> -        if ( cpupool_node )
> +        /*
> +         * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
> +         * set, in which case it'll match the hardware.
> +         *
> +         * Since the domain is not yet created, we can't use
> +         * d->arch.vpl011.irq. So the logic to find the vIRQ has to
> +         * be hardcoded.
> +         * The logic here shall be consistent with the one in
> +         * domain_vpl011_init().
> +         */
> +        if ( flags & CDF_directmap )
>          {
> -            int pool_id = btcpupools_get_domain_pool_id(cpupool_node);
> -            if ( pool_id < 0 )
> -                panic("Error getting cpupool id from domain-cpupool (%d)\n",
> -                      pool_id);
> -            d_cfg.cpupool_id = pool_id;
> +            vpl011_virq = serial_irq(SERHND_DTUART);
> +            if ( vpl011_virq < 0 )
> +                panic("Error getting IRQ number for this serial port %d\n",
> +                        SERHND_DTUART);
>          }
>  
> -        if ( dt_property_read_u32(node, "max_grant_version", &val) )
> -            d_cfg.grant_opts = XEN_DOMCTL_GRANT_version(val);
> +        /*
> +         * vpl011 uses one emulated SPI. If vpl011 is requested, make
> +         * sure that we allocate enough SPIs for it.
> +         */
> +        if ( dt_property_read_bool(node, "vpl011") )
> +            d_cfg->arch.nr_spis = MAX(d_cfg->arch.nr_spis,
> +                                      vpl011_virq - 32 + 1);
> +    }
>  
> -        if ( dt_property_read_u32(node, "max_grant_frames", &val) )
> -        {
> -            if ( val > INT32_MAX )
> -                panic("max_grant_frames (%"PRIu32") overflow\n", val);
> -            d_cfg.max_grant_frames = val;
> -        }
> +    if ( dt_get_property(node, "sve", &val) )
> +    {
> +#ifdef CONFIG_ARM64_SVE
> +        unsigned int sve_vl_bits;
> +        bool ret = false;
>  
> -        if ( dt_property_read_u32(node, "max_maptrack_frames", &val) )
> +        if ( !val )
>          {
> -            if ( val > INT32_MAX )
> -                panic("max_maptrack_frames (%"PRIu32") overflow\n", val);
> -            d_cfg.max_maptrack_frames = val;
> +            /* Property found with no value, means max HW VL supported */
> +            ret = sve_domctl_vl_param(-1, &sve_vl_bits);
>          }
> -
> -        if ( dt_get_property(node, "sve", &val) )
> +        else
>          {
> -#ifdef CONFIG_ARM64_SVE
> -            unsigned int sve_vl_bits;
> -            bool ret = false;
> -
> -            if ( !val )
> -            {
> -                /* Property found with no value, means max HW VL supported */
> -                ret = sve_domctl_vl_param(-1, &sve_vl_bits);
> -            }
> +            if ( dt_property_read_u32(node, "sve", &val) )
> +                ret = sve_domctl_vl_param(val, &sve_vl_bits);
>              else
> -            {
> -                if ( dt_property_read_u32(node, "sve", &val) )
> -                    ret = sve_domctl_vl_param(val, &sve_vl_bits);
> -                else
> -                    panic("Error reading 'sve' property\n");
> -            }
> +                panic("Error reading 'sve' property\n");
> +        }
>  
> -            if ( ret )
> -                d_cfg.arch.sve_vl = sve_encode_vl(sve_vl_bits);
> -            else
> -                panic("SVE vector length error\n");
> +        if ( ret )
> +            d_cfg->arch.sve_vl = sve_encode_vl(sve_vl_bits);
> +        else
> +            panic("SVE vector length error\n");
>  #else
> -            panic("'sve' property found, but CONFIG_ARM64_SVE not selected\n");
> +        panic("'sve' property found, but CONFIG_ARM64_SVE not selected\n");
>  #endif
> -        }
> -
> -        dt_property_read_string(node, "llc-colors", &llc_colors_str);
> -        if ( !llc_coloring_enabled && llc_colors_str )
> -            panic("'llc-colors' found, but LLC coloring is disabled\n");
> -
> -        /*
> -         * The variable max_init_domid is initialized with zero, so here it's
> -         * very important to use the pre-increment operator to call
> -         * domain_create() with a domid > 0. (domid == 0 is reserved for Dom0)
> -         */
> -        d = domain_create(++max_init_domid, &d_cfg, flags);
> -        if ( IS_ERR(d) )
> -            panic("Error creating domain %s (rc = %ld)\n",
> -                  dt_node_name(node), PTR_ERR(d));
> -
> -        if ( llc_coloring_enabled &&
> -             (rc = domain_set_llc_colors_from_str(d, llc_colors_str)) )
> -            panic("Error initializing LLC coloring for domain %s (rc = %d)\n",
> -                  dt_node_name(node), rc);
> -
> -        d->is_console = true;
> -        dt_device_set_used_by(node, d->domain_id);
> -
> -        rc = construct_domU(d, node);
> -        if ( rc )
> -            panic("Could not set up domain %s (rc = %d)\n",
> -                  dt_node_name(node), rc);
>      }
>  }
>  
> diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
> index 4a4036c951..831c914cce 100644
> --- a/xen/arch/arm/include/asm/Makefile
> +++ b/xen/arch/arm/include/asm/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  generic-y += altp2m.h
>  generic-y += device.h
> +generic-y += dom0less-build.h
>  generic-y += hardirq.h
>  generic-y += iocap.h
>  generic-y += paging.h
> diff --git a/xen/arch/arm/include/asm/dom0less-build.h b/xen/arch/arm/include/asm/dom0less-build.h
> deleted file mode 100644
> index 5864944bda..0000000000
> --- a/xen/arch/arm/include/asm/dom0less-build.h
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -
> -#ifndef __ASM_DOM0LESS_BUILD_H_
> -#define __ASM_DOM0LESS_BUILD_H_
> -
> -#include <xen/stdbool.h>
> -
> -#ifdef CONFIG_DOM0LESS_BOOT
> -
> -void create_domUs(void);
> -bool is_dom0less_mode(void);
> -
> -#else /* !CONFIG_DOM0LESS_BOOT */
> -
> -static inline void create_domUs(void) {}
> -static inline bool is_dom0less_mode(void)
> -{
> -    return false;
> -}
> -
> -#endif /* CONFIG_DOM0LESS_BOOT */
> -
> -#endif /* __ASM_DOM0LESS_BUILD_H_ */
> -
> -/*
> - * Local variables:
> - * mode: C
> - * c-file-style: "BSD"
> - * c-basic-offset: 4
> - * indent-tabs-mode: nil
> - * End:
> - */
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 06ae9751aa..2fd79aea5b 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -12,6 +12,15 @@ config CORE_PARKING
>  	bool
>  	depends on NR_CPUS > 1
>  
> +config DOM0LESS_BOOT
> +	bool "Dom0less boot support" if EXPERT
> +	depends on HAS_DOM0LESS
You put dom0less code under device-tree, yet I don't see any of these Kconfig
options being dependent on HAS_DEVICE_TREE. I think this is wrong.

> +	default y
> +	help
> +	  Dom0less boot support enables Xen to create and start domU guests during
> +	  Xen boot without the need of a control domain (Dom0), which could be
> +	  present anyway.
> +
>  config GRANT_TABLE
>  	bool "Grant table support" if EXPERT
>  	default y
> @@ -73,6 +82,9 @@ config HAS_COMPAT
>  config HAS_DEVICE_TREE
>  	bool
>  
> +config HAS_DOM0LESS
> +	bool
> +
>  config HAS_DIT # Data Independent Timing
>  	bool
>  
> diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
> index 7c549be38a..f3dafc9b81 100644
> --- a/xen/common/device-tree/Makefile
> +++ b/xen/common/device-tree/Makefile
> @@ -1,5 +1,6 @@
>  obj-y += bootfdt.init.o
>  obj-y += bootinfo.init.o
>  obj-y += device-tree.o
> +obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.o
>  obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
>  obj-y += intc.o
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> new file mode 100644
> index 0000000000..19bfa5e005
> --- /dev/null
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -0,0 +1,161 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
empty line here please

> +#include <xen/bootfdt.h>
> +#include <xen/device_tree.h>
> +#include <xen/domain.h>
> +#include <xen/err.h>
> +#include <xen/init.h>
> +#include <xen/iommu.h>
> +#include <xen/llc-coloring.h>
> +#include <xen/sched.h>
> +#include <xen/stdbool.h>
> +#include <xen/types.h>
> +
> +#include <public/domctl.h>
> +
> +#include <asm/dom0less-build.h>
> +#include <asm/setup.h>
> +
> +bool __init is_dom0less_mode(void)
> +{
> +    struct bootmodules *mods = &bootinfo.modules;
> +    struct bootmodule *mod;
> +    unsigned int i;
> +    bool dom0found = false;
> +    bool domUfound = false;
> +
> +    /* Look into the bootmodules */
> +    for ( i = 0 ; i < mods->nr_mods ; i++ )
> +    {
> +        mod = &mods->module[i];
> +        /* Find if dom0 and domU kernels are present */
> +        if ( mod->kind == BOOTMOD_KERNEL )
> +        {
> +            if ( mod->domU == false )
> +            {
> +                dom0found = true;
> +                break;
> +            }
> +            else
> +                domUfound = true;
> +        }
> +    }
> +
> +    /*
> +     * If there is no dom0 kernel but at least one domU, then we are in
> +     * dom0less mode
> +     */
> +    return ( !dom0found && domUfound );
> +}
> +
> +void __init create_domUs(void)
> +{
> +    struct dt_device_node *node;
> +    const char *dom0less_iommu;
> +    bool iommu = false;
> +    const struct dt_device_node *cpupool_node,
> +                                *chosen = dt_find_node_by_path("/chosen");
> +    const char *llc_colors_str = NULL;
> +
> +    BUG_ON(chosen == NULL);
> +    dt_for_each_child_node(chosen, node)
> +    {
> +        struct domain *d;
> +        struct xen_domctl_createdomain d_cfg = arch_xen_domctl_createdomain();
> +        unsigned int flags = 0U;
> +        uint32_t val;
> +        int rc;
> +
> +        if ( !dt_device_is_compatible(node, "xen,domain") )
> +            continue;
> +
> +        if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
> +            panic("No more domain IDs available\n");
> +
> +        if ( dt_find_property(node, "xen,static-mem", NULL) )
> +        {
> +            if ( llc_coloring_enabled )
> +                panic("LLC coloring and static memory are incompatible\n");
> +
> +            flags |= CDF_staticmem;
> +        }
> +
> +        if ( dt_property_read_bool(node, "direct-map") )
> +        {
> +            if ( !(flags & CDF_staticmem) )
> +                panic("direct-map is not valid for domain %s without static allocation.\n",
> +                      dt_node_name(node));
> +
> +            flags |= CDF_directmap;
> +        }
> +
> +        if ( !dt_property_read_u32(node, "cpus", &d_cfg.max_vcpus) )
> +            panic("Missing property 'cpus' for domain %s\n",
> +                  dt_node_name(node));
> +
> +        if ( !dt_property_read_string(node, "passthrough", &dom0less_iommu) &&
> +             !strcmp(dom0less_iommu, "enabled") )
> +            iommu = true;
> +
> +        if ( iommu_enabled &&
> +             (iommu || dt_find_compatible_node(node, NULL,
> +                                               "multiboot,device-tree")) )
> +            d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
> +
> +        /* Get the optional property domain-cpupool */
> +        cpupool_node = dt_parse_phandle(node, "domain-cpupool", 0);
> +        if ( cpupool_node )
> +        {
> +            int pool_id = btcpupools_get_domain_pool_id(cpupool_node);
> +            if ( pool_id < 0 )
> +                panic("Error getting cpupool id from domain-cpupool (%d)\n",
> +                      pool_id);
> +            d_cfg.cpupool_id = pool_id;
> +        }
> +
> +        if ( dt_property_read_u32(node, "max_grant_version", &val) )
> +            d_cfg.grant_opts = XEN_DOMCTL_GRANT_version(val);
> +
> +        if ( dt_property_read_u32(node, "max_grant_frames", &val) )
> +        {
> +            if ( val > INT32_MAX )
> +                panic("max_grant_frames (%"PRIu32") overflow\n", val);
> +            d_cfg.max_grant_frames = val;
> +        }
> +
> +        if ( dt_property_read_u32(node, "max_maptrack_frames", &val) )
> +        {
> +            if ( val > INT32_MAX )
> +                panic("max_maptrack_frames (%"PRIu32") overflow\n", val);
> +            d_cfg.max_maptrack_frames = val;
> +        }
> +
> +        dt_property_read_string(node, "llc-colors", &llc_colors_str);
> +        if ( !llc_coloring_enabled && llc_colors_str )
> +            panic("'llc-colors' found, but LLC coloring is disabled\n");
> +
> +        arch_create_domus(node, &d_cfg, flags);
> +
> +        /*
> +         * The variable max_init_domid is initialized with zero, so here it's
> +         * very important to use the pre-increment operator to call
> +         * domain_create() with a domid > 0. (domid == 0 is reserved for Dom0)
> +         */
> +        d = domain_create(++max_init_domid, &d_cfg, flags);
> +        if ( IS_ERR(d) )
> +            panic("Error creating domain %s (rc = %ld)\n",
> +                  dt_node_name(node), PTR_ERR(d));
> +
> +        if ( llc_coloring_enabled &&
> +             (rc = domain_set_llc_colors_from_str(d, llc_colors_str)) )
> +            panic("Error initializing LLC coloring for domain %s (rc = %d)\n",
> +                  dt_node_name(node), rc);
> +
> +        d->is_console = true;
> +        dt_device_set_used_by(node, d->domain_id);
> +
> +        rc = construct_domU(d, node);
> +        if ( rc )
> +            panic("Could not set up domain %s (rc = %d)\n",
> +                  dt_node_name(node), rc);
> +    }
> +}
> diff --git a/xen/include/asm-generic/dom0less-build.h b/xen/include/asm-generic/dom0less-build.h
> new file mode 100644
> index 0000000000..a6985bc20a
> --- /dev/null
> +++ b/xen/include/asm-generic/dom0less-build.h
> @@ -0,0 +1,40 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
empty line here please

> +#ifndef __ASM_GENERIC_DOM0LESS_BUILD_H__
> +#define __ASM_GENERIC_DOM0LESS_BUILD_H__
> +
> +#include <xen/stdbool.h>
> +
> +#ifdef CONFIG_DOM0LESS_BOOT
> +
> +#include <public/domctl.h>
> +
> +void create_domUs(void);
> +bool is_dom0less_mode(void);
> +
> +int construct_domU(struct domain *d, const struct dt_device_node *node);
I don't see necessary headers included for these structs
> +
> +struct xen_domctl_createdomain arch_xen_domctl_createdomain(void);
> +void arch_create_domus(struct dt_device_node *node,
> +                       struct xen_domctl_createdomain *d_cfg,
> +                       unsigned int flags);
> +
> +#else /* !CONFIG_DOM0LESS_BOOT */
> +
> +static inline void create_domUs(void) {}
> +static inline bool is_dom0less_mode(void)
> +{
> +    return false;
> +}
> +
> +#endif /* CONFIG_DOM0LESS_BOOT */
> +
> +#endif /* __ASM_GENERIC_DOM0LESS_BUILD_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */

~Michal


