Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D46C5ED60
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 19:24:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162832.1490337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJySU-0005oD-T0; Fri, 14 Nov 2025 18:23:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162832.1490337; Fri, 14 Nov 2025 18:23:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJySU-0005ld-Pr; Fri, 14 Nov 2025 18:23:42 +0000
Received: by outflank-mailman (input) for mailman id 1162832;
 Fri, 14 Nov 2025 18:23:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Irg0=5W=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vJyST-0005lX-B5
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 18:23:41 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0911d82a-c187-11f0-980a-7dc792cee155;
 Fri, 14 Nov 2025 19:23:38 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV8PR03MB8140.namprd03.prod.outlook.com (2603:10b6:408:297::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 14 Nov
 2025 18:23:33 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 18:23:32 +0000
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
X-Inumbo-ID: 0911d82a-c187-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EoxDad3GquhWUer6jvYFL9WtOs/z/GU8CBFFID3vU1/zhgS9E8UU1cFGDbkmkUKQt8fFZVygoYcBTnyHupuYVcIeUG/p2rZCUImx+t0gmpdake6NrxS8W42jUfb17/MXTbFBgjWEWd/3zyAASXUCvJUF3aA5/GuoR6X5AJfA6QIJtEVMehHjkYPxWKRul9TBpc64g2u1nrDsrON+wCGcV/c0eXZbt+yS6eTMBmhGLcg2aBvOealpF6LxUTlVfD+GCV/oR4kS6dFz9Dxd3yx/fkZchWB6UW/aJRpC2NS3cniOYz0d3NJVQpseXZT2uOHS5nZF68XKX1CkfV7DxK1NLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iD+o1hjuFoNNfTYGi0JJpbGQkb819UHoDaqPZm8Sfdw=;
 b=sH7rZ6Y51AWAh5R+EYo++cI1Hw9YtkbUTfmYXpQ1osw7GdfPqazpl7o1wxN9CeC6T81mDTly8CtRM5bV5K5JHii5xyU1NKO6DxHMHLom5xs/Xv1jlgHkHzltdUtwxTctyUlWJUXkIbQtCf7lF5+B664W5QrAiGiY+o0LsT/YeZrPv4Ktdjwsf82amq8A93Oc77GORSVrrWQtba3b5oLfrz2U85WvcxtBvtz190h5hiCOZIF/Vu/O14vkpzofrlX0qWd6EvpR/ddhq1YFm3V8KnqxJxFzS6eBipejVvD1eR71B4Un2e3rA607XNoitGvXx1GULhXuuolI3tFKKKKzIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iD+o1hjuFoNNfTYGi0JJpbGQkb819UHoDaqPZm8Sfdw=;
 b=tFq4m7CQF5mqtibz/41IBsMuUS1Y31ymKtGw17RbXsZ5RBCn2/8UISkEGPRf4EJmlo2wYOumc/twsq5rMCY/2qIzBX6OPtTGEHSWoUFRfTkgKSyjPd/B06PvOqXnuQAlxze4s7iSfp1O0TAzF5EWyiBVM+h126zOxVF+3JwRGVE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b014b9de-a61c-4c75-8a7a-25af2697e33c@citrix.com>
Date: Fri, 14 Nov 2025 18:23:29 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ioreq: Check for out of bounds vCPU ID
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julian Vetter <julian.vetter@vates.tech>
References: <f6cc34ce96693545ba9b8db6fe668c37c80f16c5.1763137553.git.teddy.astie@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <f6cc34ce96693545ba9b8db6fe668c37c80f16c5.1763137553.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0030.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV8PR03MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 8db7d632-885b-4321-b60d-08de23aaeb01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tlg1cHFON0VCYVl4azRWNUdGK3o4Ym9jdGtGTGZUNkV2MW85elhUd01FMXdw?=
 =?utf-8?B?VmNjUGc4aDVrSjl0Y29nZlZUbXMrYmtFZEIweWl3TWxnWFpTWnFsMGpqbDIz?=
 =?utf-8?B?QkhkeUZzcXJ1VnIrYmFGM25qNGpSOFBGK1hiUC9vYW9ubEc1dWhaakhxR0kv?=
 =?utf-8?B?aVB0MjFObjlFUlAzeXlrdEJkTVpTNVJkUEh3U3p6V2hsUnU0ZWNkUXhSMXFC?=
 =?utf-8?B?S0pyUDFCdzA1RllrU05OcDZSUkZCN0dFbk1uVTFybHpQTUhpRFdERE83Y1kx?=
 =?utf-8?B?TzhyM2t6c3dPakJzT3VsbzVVTzNEMWFTZVo0Qm1haEc3T0pYY1NLNGkwejN2?=
 =?utf-8?B?MGJqV0VYOXdId3oxanlKdVovY1piVDZMbnNOTVFNOTZiY0dLOUlMbVh1SUVl?=
 =?utf-8?B?OWQ0TThaSVpJUCtMRE9ZeGkwbXF6elBweG5vTEQvOFVwS2R6aURnR2ZLOXdi?=
 =?utf-8?B?bFE0T0FCUUlFMXVybXJRTVZraUdsZW9oN1QvTUxjUmdKMVJ6b1Y3UjU3VUdq?=
 =?utf-8?B?NXg4SGo3K01VZjNtRktyZWl5ZS9HNVJsZm5iREtwRXZFNElzSDU0MmJKUzVp?=
 =?utf-8?B?QWlMNzVWY21wWU16Rk03ZGdhY0xhUk16SnlVMTI1QUV0ZmxRQzczZVgydlhU?=
 =?utf-8?B?M1h1NUxZR0dpaHhnRWtYRll3QUM3SlkrWlJTVFZ6UUh0UitLTjJVcUs3Zkhx?=
 =?utf-8?B?djlzOWQ4QWwzNVFVMVNQcEpkbk1qc1lGTm5SZjRNV0dTRU0yenU3OUorN2U0?=
 =?utf-8?B?WlJ1anRaWVVhUHI1UWYzRTdzdWRGVDZQTFhZY2U4QXhpaDF0L25iWjk2eXVH?=
 =?utf-8?B?RFBSNWtUNXZwdTNMNG9YVlFaaTZ0U1d1dVBxZXFIL29NaG9JeE1GUk1RcjFN?=
 =?utf-8?B?bmhBc0QxQ0M1ZmMvYTIvVmRsOGRveFBaZDBSbzVuRlg1VFhzM1lyYllxQXA5?=
 =?utf-8?B?enQ4clA1R04wRElGRnY5UXpwakdrR2M5VHpWVVA5ZTdISmJsWTI3SmkwWHRy?=
 =?utf-8?B?Ky9DTlBjZHFuYjhEc2RxcmV6cjBBY3VkRFNYdG45OUNjbzNRdFgxUGFyN2c4?=
 =?utf-8?B?ZlpocU9OaHBHem9neGQrZ2NDbTlxVzROcUUvWUt4SS95aDBZWmRKTW5SeHd0?=
 =?utf-8?B?RERhb0MzcGd4WGVDalc2QmtVRm1aeUVPcXdvcDNCUEIydlhDYlN2RnlHb0t0?=
 =?utf-8?B?Z2I0ZnAzWXcwaGo2SFZLTWlHSFB3SlRWZ0tJajZCTU1OTVAzVFd5RFEyZHJD?=
 =?utf-8?B?SjBEYVJIYWJZZ0dpWWJuSjlGeUJ1UnU3NVVUbDlsRFgzSHVTQW53QklONGNM?=
 =?utf-8?B?Si8wMVA2QURZNzZER2hLNmY0T1dmNjNRYnk0T3k0UGlGSy9Jem5tNXY2RFBX?=
 =?utf-8?B?TWQyai90TnhYU1lZZU9KQ2ZZckhENDVOWkdOcWJycGd2ZDNRRkZ4NXNtRTdp?=
 =?utf-8?B?T05tTEdjTjZ5elFBbjI4NDhvb1Btcm5ZOFUzazlkbEluTVFsa0tTTWRWN2dN?=
 =?utf-8?B?VGowVU9XS0RvS2Y1R01RcVgvZ3pYM0VhRkNSQTF1SFRjQW9pN29WbkUwN1ZG?=
 =?utf-8?B?U3VoQzJFY1FiM2F2OFlybDZOYzBtZkJ5Y2JSQ1hTODMrTTV6c2Z5Z045UElz?=
 =?utf-8?B?THErbGU5MldqZHVlVlA2TTlHUytUREExU3lraUZkUytQMy9mdmJJbldwVEI1?=
 =?utf-8?B?RW1Ua2JoMUkybnhrS0VaVzVNSjZzdFJkQnhNWC84V1FKc3k3dUU5ak1kQk53?=
 =?utf-8?B?Yi9KNmVwRko0MXREK2prbEYyaXNTYlZnVmQzeHZvSFZDOFFDU25yZEcvNjZi?=
 =?utf-8?B?QkJBNFdVYWp4VnFYVy9uakJPQk9NQXAwNVl6SzNSaUF5WUE0ZEdOWHRSVDBl?=
 =?utf-8?B?QUkwVjB0ODVvVk9TQzBOQWJ3WTBrVWc5cVorbWhxS0VsMnpEMTh4NDl3N0RW?=
 =?utf-8?Q?cO6rxzOqGuCkrRxmF0R9Nt4UblaUP3s2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aS9lNFdrY3ZjMGpDVXJ1MTB4TmJ3U2hDbUR1eHgxa01aZnVycSs2RDN0ajJT?=
 =?utf-8?B?OFp0UWdrK2lLeHpmOFdSMDNKWE9YVTNydkwyRkNkYTNUa3JPcm9nSnVmSitn?=
 =?utf-8?B?a04yUm9SQW5VWkl0RE1kNG5kaXpvNUR2cGllRS9iZWozL3lRQW42c2g0bUc5?=
 =?utf-8?B?cCtxTVR1K1NVNVhGbmJhdG1ZM2VWRjBDYnJrTGU1SFRCOFBYNWVlOGVQMzB3?=
 =?utf-8?B?SGMyN1N4Mzd3a3p5VVRPNGJMYVBUcHRlaGNyTFBOM0pSeEJIWlVLY1d5ZHli?=
 =?utf-8?B?aHgycWc1NzhxNStLWmsweUpWakRlRGFJSGFqMmNxR0tJWHFLdlRGMkxIaU1w?=
 =?utf-8?B?RnV1RXM5ZEs5KytaTzRUN1ZTbWsxdW92K1ByRHJEL0g3Y0MvY0hCd0tRQU5Q?=
 =?utf-8?B?eHU2VGU4QzlUeVR4cHFTMnh2M2ZTeldNRjNFWEg3MU1QZGd5bXZPNVRHKzVG?=
 =?utf-8?B?L3dpemcwTFZsOFY0cTZLOVNNeEs4YURLbXYyemh6ZVY4dWxDcCsvNzZaYjI2?=
 =?utf-8?B?bTlNQXFrcmgvcXRVOTRUVkQweVJib0hPZXF4KzVscDBTZFY5UUlwR0gwcXNN?=
 =?utf-8?B?d3VRZ1Y2YTRpWmxGQU1pRGNiamZzVFc0aVMwK0c5VlFXWnV0cjNDZ29jSE5v?=
 =?utf-8?B?Tkg1WnR3N1VTeVJVZm9zaUh1cmh5OEMxazRzOWc1TzVHQjhxSm5MM0RaM0VJ?=
 =?utf-8?B?eTBxNXpuMkNIMTAvckRiZnkyVTJrb0I2YnBFRUFvRG5jMFQ3dmdaVVQ4L3ox?=
 =?utf-8?B?cDlnK3E0UlVnN2VyV1gwdkRNZCttYWNaTHppKy9lK2hKbXRtdDZKaCtQVk1G?=
 =?utf-8?B?a1ZiL1UrWURQMnErMWJER2RaRVlURjhuR0owYzlxL0YrT0NuNVpaams0MWU4?=
 =?utf-8?B?NklsODFKUzJiQWdkczlWTStKQmthTkxsanJOc2YyVlhNT09UQ0dkWGFSRzJQ?=
 =?utf-8?B?czFPem9ONzZaY01NRUxiSUI1ajBESEhtK1c5ckpwWFNrOGNWV2pSTUVlZFRZ?=
 =?utf-8?B?a0ZWV2hXUVJyNURnOUM2RmFFUzgyaTEycWZQNjRGNkkyMjBoZnpwUmg1aVRM?=
 =?utf-8?B?T1pxNzYvbEpPKzZLUGpLNlJpY2wwWllsUjNDaXdzN1BGaEtDaEFlZWdNM2FB?=
 =?utf-8?B?bXl5WkM2Snc0bTBOQVRXczZieHpvU2xNZE5xMnAwTERxUU44UjJuVjY5YktB?=
 =?utf-8?B?UlZBeDlyaVlJQWIyU3NkcWwwYjdNcDRqUURYVVhuck0wQ2UyNGplbHEwVHND?=
 =?utf-8?B?TWxEYVZMZ1grMDZGZGY0M3c3cEJhWWhiRUxkWUM2clRieGVxR1lmbCtsSXg4?=
 =?utf-8?B?M1dtVWZ5V2sxZkhzeUc5MjFmSTZiTFVXUU5iSytmTjZEaWM2K3gzZXBDQmo0?=
 =?utf-8?B?QmVnSFZFa294Mk05Wk5RMUdBdUsrMXcvbm5yT3NtT2g5QXZZTDgzZGFyK09T?=
 =?utf-8?B?SkQ3aXptNTR6V2xXMEF2Z1NJZFM1TW4rL09INjhqSW9PNTk1VEZhRkZKMlpH?=
 =?utf-8?B?UCszaXE5OTJPM3ZjcndwU2lYODZ2ZjJPM1M0d1l0bUlPRkV2UHpudnd2VDI0?=
 =?utf-8?B?VjRHaTduQnRYRExhejhmL1FYbWlUaUhaY082TDN1QXhJNXVNME13TWc1Y0dk?=
 =?utf-8?B?NnlDNWcvUi9WL2RuMC9NL25FdlRrR2VZY3IxM3o3L2ZmKzRsU0VzZGF1dUtG?=
 =?utf-8?B?NVd3d1BvNEc5OUFBVm5ZcUl6Q0xySkxGelNxMzBBNGFVaFYyM1gyQysxVEwv?=
 =?utf-8?B?dUF3azNQTElPVEcxQWpqQkhHYTV0UFlvdVZXTGJFYStGdjhRNE5wcExhc2pj?=
 =?utf-8?B?SGVxS25va3RnWGYvLzg5MmxRUGtReVU5OVJOV1M3UGF2MXN1KzkwaGVNKzBE?=
 =?utf-8?B?ZUQ0d25LMTFVMUZoUGs3dVQ3b21SSzNjcmZZRUZQRXFmSysvMnZneGYwTXRt?=
 =?utf-8?B?OWxIRVFqL0lTZlQ5d0MySWU4VkQ0NFg0b1l4Z1hkb0JWWjhnb3pwNGxadUR6?=
 =?utf-8?B?dGQwMHVOZTVNek1iNW4xZmd0Rk5XYWVqcEpxWDNUZzN1L0QzKzNucXJOSCtr?=
 =?utf-8?B?QTQ0aVJhS2psNStyZkdWc214OCsvZW5FWjhUL1BYenI0Ni91Tlo4ZlNmZEl6?=
 =?utf-8?B?NVg0M0V6MXVqSmtGaXBEaGtKc1RFVU95eFFVakwwSU5sMVZzdWtRYTRIV0g1?=
 =?utf-8?B?YVE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db7d632-885b-4321-b60d-08de23aaeb01
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 18:23:32.8863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JwPalJgN7yTC4WoSkSfygYOk6tOfA34C4z2oyPFVQA0BCmZjJnJTIEFv9buKnqG8pPNRHlog6eXdFdsANTnGkDoAOcB/OAjAifWDemx1VGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB8140

On 14/11/2025 4:32 pm, Teddy Astie wrote:
> A 4K page appears to be able to hold 128 ioreq entries, which luckly
> matches the current vCPU limit. However, if we decide to increase the
> vCPU limit, that doesn't hold anymore and this function would now
> silently fetch a out of bounds pointer.
>
> All architectures have no more than 128 as vCPU limit on HVM guests,
> and have pages that are at most 4 KB, so this case doesn't occurs in
> with the current limits.
>
> Make sure that out of bounds attempts are reported and adjust the around
> logic to at worst crash the offending domain instead.
>
> No functional change.
>
> Reported-by: Julian Vetter <julian.vetter@vates.tech>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> v2:
>  - check and report instead of ASSERT and eventually crash offending domain
>
>  xen/common/ioreq.c | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
> index f5fd30ce12..a2a2dafe85 100644
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -100,7 +100,14 @@ static ioreq_t *get_ioreq(struct ioreq_server *s, struct vcpu *v)
>      ASSERT((v == current) || !vcpu_runnable(v));
>      ASSERT(p != NULL);
>  
> -    return &p->vcpu_ioreq[v->vcpu_id];
> +    if ( likely(v->vcpu_id < (PAGE_SIZE / sizeof(struct ioreq))) )
> +        return &p->vcpu_ioreq[v->vcpu_id];
> +    else
> +    {
> +        gprintk(XENLOG_ERR, "Out of bounds vCPU %pv in ioreq server\n", v);
> +        WARN();
> +        return NULL;
> +    }
>  }

While I appreciate this is fixing a latent bug, it's very invasive *and*
needs removing as part of changing the 128 limit.  (i.e. its a lot of
churn for no benefit in the meantime.)

Xen cannot release in a position where the user can request 130 CPUs but
explodes like this on the top two.

Furthermore, the WARN() isn't ratelimited, yet this is
guest-triggerable.  What we need to do is borrow WARN_ON_ONCE() from
Linux for cases like this, where it's obvious in the logs but can't be
triggered repeatedly.

~Andrew

