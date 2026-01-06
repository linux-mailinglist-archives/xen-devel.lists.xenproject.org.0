Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE856CF8EFA
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 16:01:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196250.1514124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd8Xb-0006AL-Pk; Tue, 06 Jan 2026 15:00:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196250.1514124; Tue, 06 Jan 2026 15:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd8Xb-00068R-MN; Tue, 06 Jan 2026 15:00:11 +0000
Received: by outflank-mailman (input) for mailman id 1196250;
 Tue, 06 Jan 2026 15:00:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=heAF=7L=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vd8Xa-00068L-Ey
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 15:00:10 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6303c89f-eb10-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 16:00:07 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB7346.namprd03.prod.outlook.com (2603:10b6:806:382::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 6 Jan
 2026 15:00:03 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9478.005; Tue, 6 Jan 2026
 15:00:03 +0000
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
X-Inumbo-ID: 6303c89f-eb10-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LlCkHsDCZ1gA4YlawX/vvNFoAsFdU98LfmFd2oMX1uLZR1s1hu/DouR4xan8E863aWR0eWZgUxy7cUoG9jSeTIThxsMX4NblOEKc+maWD7TBi2Y7APPAbQaRaXRmPfTbACSmd0EPILvlKS3INMaej35oy04oUIbHZplHHYGbqF8NmZ7QJaUmxVOtRB66Zq4CdKueZ/OM0arvgV766hBXCGYAmPP2+hFZt14j6JV6vHKvBqX1pTzcoPobagtyjYqcc0v3zSnm1ZkQj8Athe4Ijmgi+aLgLhcO9nlV0rJ17ikmKMH9zjZy+DGgX0/u6rlDGfv4RsWwnYEGXWM8SF/UFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZfdYqZJGarK96C9DX+uTvdfguavdEJn0EYcuxDnZBo=;
 b=OvbEZIATjJOeXB1Eio5hAWiECjO7VZhawUO9eSi0B3rmFsScwdWX2Zh82fr1T8oaqENzrcLxghT2uuYxWUcBCaj6APizdADz2T/WCbutg9arwjmSHq3e8ZgNp6wioGWwkx2O3WAWggJksJVVXY6Dd+tuhNxQokoDlBFmwgZrlaGuBOqqhj8Pfi+uoY3z4CdTW43KxYP7atsTgEzrbNvSqkGiBCmVP3YDMDyPqW3C2xMs2FiQIg6XJZ88vfC6lxTRRapsW9qevG9lln5vR+ddAL72plt5j9ae/doVgO/Tw6GjmrUP2Na6IcV6wADL2u5+u+0lnCxNdPTPDtpBmD9zjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZfdYqZJGarK96C9DX+uTvdfguavdEJn0EYcuxDnZBo=;
 b=wQgOwNl/calrlcjfkHr+uC497mC3zzRfpF8Nkrmn11pFcIN4DrwGxgWDQ+XCYIXDYNfWdg2gfmftDRQq3a6Kdo8HSRys/qV8hQFzl7FHCMybBfbh+CUG1MrlNJfZ9KP5+yYATtIze2IX5fcPWxov/Fm+9b5tJOFJKJX0xjQLkFE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0d3aed3a-a32a-4234-b8db-ab1181a86afc@citrix.com>
Date: Tue, 6 Jan 2026 14:59:59 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 01/15] xen/riscv: introduce struct arch_vcpu
To: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <3b531dff3755da010664111cf7d936ccba7c1f5d.1766595589.git.oleksii.kurochko@gmail.com>
 <41b7b388-6c10-4cbe-a4af-a25baba64e2a@suse.com>
 <89629a0d-de6e-46e2-8517-a4b2fdd52183@gmail.com>
 <2253f28f-07af-46db-9116-e9b5427953a9@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <2253f28f-07af-46db-9116-e9b5427953a9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0019.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB7346:EE_
X-MS-Office365-Filtering-Correlation-Id: 72b40d46-a470-47c0-1049-08de4d344550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?akZvOVBFOU8vK3N3aitodmJFSFNzT3Y4TFNJSzVCVDdiYmxLSEV1ZWx1dXQr?=
 =?utf-8?B?dytoRjBZcGMwU3FjY3lxakhtTDB0UVZjOEZQMWhGS1lnSy9KaW5iZVFpdEtU?=
 =?utf-8?B?elRoMlR4MmlHOHl6WGkwUmxaVnJoUFVLMFU4d2V4V2Qwc1J5RmdGZk9nWDhH?=
 =?utf-8?B?aUdrajBIOEkwNnFXVE5vSlBrNGNqeFQxZm91Vmt6OXJQQ0dlNEtoUHl1RjJS?=
 =?utf-8?B?SFhpQ2J2Vk1IbWxrRGpXbmZIV2YyM21vNSttY1hMekczeEIvTi9GOHRlS0ky?=
 =?utf-8?B?ZVZUVUFpOVFGNk9nUUNFQXRkMHZ2TmZSN0JvckpEUVhkMC83eW56MGVOZU0x?=
 =?utf-8?B?Uy95MGZhMTBaSjh6cFVDRW1tRU9wOGdKMHAweE9oNENUSVpoMWdQdURPY3N4?=
 =?utf-8?B?cnRBSjduU0FIdTl3NndmbzhuWm1pUVo0cUFsdXkrNCsvRUFmY1Zoc3UwK1F4?=
 =?utf-8?B?T21wK0VjL3JLS3pzNGVwZGRSS0FFbm5QbUtoY3FURzJUOC95eHp0eVVnd2FN?=
 =?utf-8?B?Ym12R1YwR3JBeXcwd1REelRvUGdQa3ZweUhVM09yN1hmZWZzczZSWmthSHNS?=
 =?utf-8?B?NTZkMHRpUW1IRTBVKzN4N2NrNTRMN2dtYk1yNERwNERSU3oyVHFRUmRuZWJT?=
 =?utf-8?B?YTNMd2ZyZ0d6djhpNWhUQU9aMUxucGV3Qk1qTEZLZCsyTmJPZ0RGREE3eStn?=
 =?utf-8?B?cEh4bk1COXpoYkV6enMwd0dxNmNTME41dmJlUkR6ZC9JbGNPYWQrSmZNNk1M?=
 =?utf-8?B?U2R0OVhwYU4xdlpwMTk4K3Z4NnJxZXovaWp2MTZmcTVCbjlEQ2s2bTVQUDF3?=
 =?utf-8?B?K1dFMXNXTC9KWUhaUklwQUtockUraFUvaThvMFpzQmJ4eVBSekhrVDhUZ2dt?=
 =?utf-8?B?dmQzOXh1TURtNVBadXBYTG5vQUIzUno2T2doZDR2aG9KbnZUQjhwZ1N2OUNK?=
 =?utf-8?B?clpvMXhJc2ZNOW1FbEFSUDh0cVpEZ3ZwRUE4bWRJNDJBZG9xOU1BaGVmbG5N?=
 =?utf-8?B?S1hKc0I0NFV4cWQ3dzdyTFo3M3VzQW9HSUFubjdhOS9ZZWZmWWRmNGlQekVs?=
 =?utf-8?B?UVAvMGM3WmRsUlVUbXNicWNxOGxWSWl5NElMRllmME5UcCsvcjJTRWN5QjdS?=
 =?utf-8?B?QWE1NW1PSkVodjAxSG5pVXBYUlJQTDFkK0tkWm5DUFJWYS9JczFuR0tjSnl1?=
 =?utf-8?B?MC9sbmZTb1dkTTlUZy85eG5WVjM3bWxFOVpBUFVaS0x1cUFGRFZBT3k1cGhB?=
 =?utf-8?B?TzliQWRPMnpuMDRBUEFWQ2psakNnZDZ1MksrNG5McmxGYXkwVlFpUm5OZ1NQ?=
 =?utf-8?B?cUFFaXowdjcvYUNtSXpYME4yR0dCR001VU53a1o4SlpnVTFOUHdhanhuK1dy?=
 =?utf-8?B?RWtzazgyakpNdE11QjdQRVZkM0FWTU55ZE4yZjMrTDdmR2s2Q2kxLzY4MXNW?=
 =?utf-8?B?RUptUmNzL2pycmllWHRyYkJwUXVPSXhSNEE3SVlaaWxXMmFZbVNZZkxlbW1P?=
 =?utf-8?B?b3RlUmdFTG9FejdON1M2UzhQZmgyWktvNGtJdjg3VEtzQ1czMjhKa1dUNm9x?=
 =?utf-8?B?UEFadWcxeUg1M1J5cmZBcFYyN2FCdzNqZDZRQVd5ZUJUZEZ1L0oyOGNqNHEz?=
 =?utf-8?B?Vk5GS2xRNVp5YW0rSW93WmIxRENjdnZEQktpS2hrUmdpL1cxUXdKYlJrak94?=
 =?utf-8?B?R1EvWXZ1VTJ3WndYaVJ2QTUweWljY1ZITEFYZThUMTBZUWJGN0JTNE5mNThz?=
 =?utf-8?B?R0pySjBoekU4SmNqclJpZkRDdVVzRGZ3RDYwZU04bXZrdHdsbUhQdUdDUE9a?=
 =?utf-8?B?Qm8vV251bHNUT2oxSC9sNVRTUmQxd3ZqTm5NR0tJMFhYQXl1amRCM2RJWkVr?=
 =?utf-8?B?RWZ1Y244RVo4a3ZEQ0M2UWhkb3J5eHBwNm1WR1JyYm1vK01JZHA3a2RJd2lH?=
 =?utf-8?Q?X4CbKyqTWdSf1SB68LDjtDC87MJfiktm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1Z6MWNQSWhUZFdIT0VlTlNMTzVjUVU0OVB6b0ZEWnp3b21rOWI0TWV5cFZE?=
 =?utf-8?B?RlRNU0hVSEhrYWVucVdWK1NaVXh3T3YvUFc0cEt2VC9RcTVZdzkwRklxU1RV?=
 =?utf-8?B?Ungva3BuU2NkeFFaeVFDa0pWaWMxenhYbGJBMTkrYklYTHEvdkV3SWtFNGcz?=
 =?utf-8?B?SVVuMmxyRm1TS2t3bGZpK1V5dWVhRm5DYVgraGc1VGZMQU96clRzSHMyRkZY?=
 =?utf-8?B?ZDVKYVJWU0lVdGEySCtWZGU5YWp4T1RTZGk0U0dIekR1VVZ4ZnhJMWpISEhH?=
 =?utf-8?B?Q1VtaWZEdWl0aVBYNm5uM3gyTGhGN1VwaURzTXRVWG82VHQ2WUsxZE52Q3BH?=
 =?utf-8?B?V2pGVnErQm9jdDd6QVh5WG4vNjY4anFhNDNiRXZpbnhGQUc4VmtCaHlraVE2?=
 =?utf-8?B?cHhBWm1aRmpQWkMxOXh5bkxJRWFiYno3Ync0TUczSHhPUlFVNUpYbndYS3l4?=
 =?utf-8?B?bzdsVFZBd2srTEh1emFRSEVyVjlVSFJBSys2MnpWTjA4SHhKcUtsYkxFR05S?=
 =?utf-8?B?ZTVPUmdNQ1NxcXNiLzVvWnlKc0t5K3hnSXhQZW5Ob3lqbEtYYnZLSGQ2cnhP?=
 =?utf-8?B?RWV5NVNZemZudFhLMWFpYWFEbFlqMzhPT3Q4ZTEvcFdkNmxxTkpIbVgrRUFS?=
 =?utf-8?B?NjlwYnJvVjZLUTlkNmRHQWk3NmVCd1c2eE1wa2JMUGJ1VlBtMGpEazlKeGNS?=
 =?utf-8?B?LzhDVDk4ajdNOTJQMkZzQmxLN3FNNTBVSXpabVNtU0xDazd5TkRrbU1Kd2pQ?=
 =?utf-8?B?MlM4TG02MHZhY0poNHRKaU1ZeFRENkw3azNQaGY0cTR0MUdsbGdVL3dyODhL?=
 =?utf-8?B?b0R4cFJHNlFKRTFHbzJ2eERjOXhNakNzdXFrVUhGMVhmblJUYU1KVnBSb2w1?=
 =?utf-8?B?alY1S3dqYndqd2o4RzJFNHR2R3FQSFF5MVpoQ0dpRmRQU1Zxc2p0d0NiRi9W?=
 =?utf-8?B?dy85Zy8ySUFtZWk4KzdNQitlM0RtQWJiRG4rajFuTDVyY3h2U2ltcXhEeDd2?=
 =?utf-8?B?bFR1YmliYVdPbmJzWUNNWTBRUXJHdEdxRmZlOEcyejYwUEQ2SXgzTXBGalRT?=
 =?utf-8?B?d0pkZThZNG03NU1lenIxV3VVSS9YZW1GVEYwY1RjY3pLdUQxRG5HWmV3WjUv?=
 =?utf-8?B?ZUExTlVRSHgya2dQZG1NRW85MDJlcnR0UG5EYXozdFhKRGlpc041M3RydVFv?=
 =?utf-8?B?WFpzTVV4ZmZNSmxBMDdSZmNFMnpocHhVMlVpSk9EY2UzcE9Ia0gvbEg2NXk2?=
 =?utf-8?B?S2ppdXRSeHUra1lRdG9Sd1d6emNVNnpDa2N6TDRwOXhUSmJFTndrcXplb0lw?=
 =?utf-8?B?OHkrSnlNazRxRTBpbmZkSTVMVG4rSW1EbENoandHczBzalBpYXV5cVQ1cDZI?=
 =?utf-8?B?REhoSkpKSGhTZXNoTWw2emFrZm1zelJmTFBsRCtFSFRnS1lFSm9iYVgweDMx?=
 =?utf-8?B?WXgvRkhjVWpEYVBvakRqNVQ3NG9jMk9iaDdENkNnM0QrY1c2ZHkreHg4VXg1?=
 =?utf-8?B?WkRTejgrWGl4TmZQY2MvRGtodWF1TkI1bDF4bDZ6emtzMUZRTXZnMlQyT0hH?=
 =?utf-8?B?OWR0MmhHVFRPYkU3TEhlc3ZOcHVnRnBueXFZM2JjdDhrT1R0TXJ5bHhDWnNM?=
 =?utf-8?B?MFltWXhGczJ3OFhYWWU4T0pjL24rRVZOSUx4aE5KS09XY3BJamt1UlpkanhZ?=
 =?utf-8?B?SjdTVHJ5WVdzMmhEMnVSQjZDV3lBRk5VdmNmaEh5OWNXdEQrRlR5WGo0SmQ2?=
 =?utf-8?B?MzRYRFRscStVRHowSmxTdkx3blUwb1d5YWEvQ05kREx4TmIvcmxqUVdYT1dT?=
 =?utf-8?B?dU9xeGVVQWxEQzlid25xSHFyUE1SSWpjT3NaYy9abEhkdXMxTlB2ZW93RVRY?=
 =?utf-8?B?T0V4UktXdnZZaU1YWENjTDliWkx2VnpBYWEvSzg4MG5LZU9mbVU2alBPbVg2?=
 =?utf-8?B?T25TUXZ5S1RGeU91YjN0dldzbno0LzJlYS9SZ2JZd0pQaktMQ3ljOVFZeUNs?=
 =?utf-8?B?L1E5UVBaNm9mZUhVaEhYM1gwRkJoMEFnaEFUUmxPMHJyNkV0YkRiUXlrdWEz?=
 =?utf-8?B?NW5vWVdldnIrMXpKTnk5ZFFNYXlKMHBjRjVQZ3NlSHRQYnkydTdqT3kwYml0?=
 =?utf-8?B?RnlRaUFpNUNhYk83M1RtTzZsbU5SL054bk4rQis5MkJwREFnMlVGc1oweHJ0?=
 =?utf-8?B?VkZ2RHlxYXRZVndDQ3l4MmxGRTMrM2hRdElSUEM5dzR5OVlUWjNpS092ZmpD?=
 =?utf-8?B?N21NMFFrK0grTForM1Frby9RRmdQNjhQeG5sY2pQZ24vV3BGUkQyc3BFa1Iz?=
 =?utf-8?B?ZkRmckVIUzIyRU5xRTJBMjZPY00zcHJ4THBKS2Z5NU1DeFVwSWdGQ2txL0xm?=
 =?utf-8?Q?0/sM5uBP1io1kzIg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72b40d46-a470-47c0-1049-08de4d344550
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 15:00:03.0461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ajw4gVt+XYRSqTUioDQYLeq2SJWEwdeWOXazODWjJYVrztqyuu5p5e8Krz70BH/zXHVBvacne3H20+bTi8uqNzJhZfQlP0xNv2YdtAtmBn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7346

On 06/01/2026 2:26 pm, Jan Beulich wrote:
> On 06.01.2026 15:19, Oleksii Kurochko wrote:
>>>> +    struct
>>>> +    {
>>>> +        register_t s0;
>>>> +        register_t s1;
>>>> +        register_t s2;
>>>> +        register_t s3;
>>>> +        register_t s4;
>>>> +        register_t s5;
>>>> +        register_t s6;
>>>> +        register_t s7;
>>>> +        register_t s8;
>>>> +        register_t s9;
>>>> +        register_t s10;
>>>> +        register_t s11;
>>>> +
>>>> +        register_t sp;
>>>> +        register_t gp;
>>>> +
>>>> +        /* ra is used to jump to guest when creating new vcpu */
>>>> +        register_t ra;
>>>> +    } xen_saved_context;
>>> The xen_ prefix here also doesn't exist in Arm code.
>> I think it should be added for Arm too. I can send a patch.
> ... this, to reword my comment: What value does the xen_ prefix add?

This was my recommendation after reverse engineering how ARM worked to
explain it to Oleksii.  But I also thought I said to write a real
comment too.

This is arbitrary *Xen* state, not guest state like you'd expect to find
in struct vcpu.  The guest GPR state is at the base of the vCPU stack.

I suggested that this property be made clearer for the benefit of anyone
trying to decipher the context switching logic.

~Andrew

