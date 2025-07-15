Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FA7B05428
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 10:09:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043724.1413739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaiY-0006iZ-9m; Tue, 15 Jul 2025 08:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043724.1413739; Tue, 15 Jul 2025 08:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaiY-0006h6-6k; Tue, 15 Jul 2025 08:08:50 +0000
Received: by outflank-mailman (input) for mailman id 1043724;
 Tue, 15 Jul 2025 08:08:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Lhd=Z4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ubaiW-00067F-KJ
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 08:08:48 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2406::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id edc48516-6152-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 10:08:46 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by LV2PR12MB5847.namprd12.prod.outlook.com (2603:10b6:408:174::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 15 Jul
 2025 08:08:42 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 08:08:42 +0000
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
X-Inumbo-ID: edc48516-6152-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dv+OKLURmP2n+8+YfGHVRs5NS0VztsycPC9F5ut3UWsV9RkrDq+X9j+pqr9Nxi/Qhw/FLqeuGD3zkzGx0d/FsXwYGF3Gepx3K5OvENQiXQTFVU+/bb6n8H57GhS5R5DUYf3tLsN8OKTd89xOHrrSHXEIyc0g8Cf9hG0p0gRnw2IoP338DbbCTMP5oQFEXOLdphdZo+1bUlhvsxvV6os5qb2uJDy7wzXHhhIROBbaoUNbWwXmiAkGmT2aup+6iK1jny+Tkzl8yYB0axl/nnYgHGhDrPCGt6gszxnGjoB3JnkDeg8+HGsWaODBqt8OeKB0L1gI2aSwnOOVaE94hboxAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BzcmLPqDOpwMd+dx6ks205PcTRNOApPia9V2s0vBaI=;
 b=mZMmYzDM/1uVB2rhT/AlRqmJByeMzhXXR/4XZ0oTKuTJjmuGldNB88XvdGAHzoSN4myqP2Zc+EulDc/e1NP2UJ6xmbi/r8KLWDtFFdHtpji8YGB+Ef6KmxZkZkaLiitxYVpBnexyWzY99fFeddCvF+VUKNcurDP8IXMD/Xk4rYuSbGO8gvQTl4QIQYnvFZn+Swa0+lpqe07tAyvNcx1yD6b3mzJdoFGxJx9WLF4x5zYswUGUGgpjV9CrvbauieUPaN1ECtCwSYtU9oOXQuUUuA0O5jBB3D+oy0mNtR1krxkLGOOam7AsnfmeGVwa/t6LNucau3EJCa4ACKU9HtSssw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BzcmLPqDOpwMd+dx6ks205PcTRNOApPia9V2s0vBaI=;
 b=l4TA9r5X4lL5KofSLO+7VivCc67WwE3ji0dnUAdS97I0S2kRTB7LsIz7zBPOk0RZm1lp1qsOpDmINRREZBkdm9ZMVxRlwbbXsG8FUiRk7xtmDlM0b6dqpo8purA9fXeuo56CJWhqQn9Gh/eCMbEUZCcDMIHHYo8aBZtozYBMpTI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <03fc835d-7833-4c1f-b061-da22a4ab9b75@amd.com>
Date: Tue, 15 Jul 2025 10:08:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] arm/mpu: Find MPU region by range
To: Hari Limaye <hari.limaye@arm.com>, xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1752565274.git.hari.limaye@arm.com>
 <3da52fda916ad2487ede9b193143d06debdcfc88.1752565274.git.hari.limaye@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <3da52fda916ad2487ede9b193143d06debdcfc88.1752565274.git.hari.limaye@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0431.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::19) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|LV2PR12MB5847:EE_
X-MS-Office365-Filtering-Correlation-Id: 507934f9-dadc-42af-180b-08ddc376d051
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTV0UG9GaGVJYkNFa2N4SWMxMDJxcHlPSXh1VjNtL2V5QWFwNXp2UERqVWs1?=
 =?utf-8?B?YURXUVdPdDQxWDQvTlFzeVJGMlVRYlU2TDkrS2lhMFpSMDF1MWh0Q3hnTEZs?=
 =?utf-8?B?dWdoREdiNE9VMTFOajB0bmxDUXdVVHZxZnFmM2JiZGlqT3FsRGxGMElGM296?=
 =?utf-8?B?UFlHVVV5U3JQYzRLSGRTYkNiSThUQzJKeW42ZnBQRWM3OW4vbHNjVG9rZzVt?=
 =?utf-8?B?WjJhdTYvbnBUdVN3N2FwSTBoVzdtak1VV05QUDIvZVh3YjVOWitJTHhNNDg5?=
 =?utf-8?B?bmVsZ0x2a0QwNmgrdUh1dExFWGpWRGpMcmFTRHh4ZEhjZ2JNVTNUdHYyZU11?=
 =?utf-8?B?dENWZG9YM29PemdqL203RlJtVFJMc21CUTgxdm1DT1ZEZWNCRkZQTCtBNTgv?=
 =?utf-8?B?azhtY0lEUkgvVDlXc05XbHZjRmtnUDZjY2c5R1h4Z0dKWTNVdUY4R2o1VDRF?=
 =?utf-8?B?Q1NMTk1oRTRVVEJYNVZIY2FiL3B5cFRVaXEwYWcyWGpteWxJZjdGeHd2OGhu?=
 =?utf-8?B?RkRaNUlzN2w1akh5Q3Vvc0RqMmFyeGF4WElvTmxkQ2dvREQ0TGxhamkrT2xN?=
 =?utf-8?B?OURoeFFid09DUE0xMmMxSkd4SjVNZ0w2TzhFRU5OZFVuKzBGTVdPSm9Lbmpp?=
 =?utf-8?B?TXZGcXlFM1BhOGNjUkhNRm1QZTlwSWEyQmhYSGorak1OZzJrczdVYk9aNkpD?=
 =?utf-8?B?SXo0Y1BvK2RqN1FxZzB5T2o3WkRjT3dwOEY0N1BDV09mSXpYUzRLaEJ1WW03?=
 =?utf-8?B?MkdpVE05eGtUa1VJTVphZUNsb1Z6Z2pJQVlkTmxVbUtKV3VKUHU2eXJXbE1i?=
 =?utf-8?B?ZmJFQkl5WDJnaTNTWm5XQ0VWcXR4SHZYUnRiRUZhY0FJT0pZbE1IZ3ZzNERT?=
 =?utf-8?B?NFUrUFNzNUdSbjUra2RYYml0KzJoc3NPTlR3RkZ6cjhZL1dKeDJnOUdhRlBj?=
 =?utf-8?B?dmVxNzNTRWlrdlA2ZHpTVHh6TDFsM3kwL3ozL3FYci9YVnpVeDlMRS9uSncr?=
 =?utf-8?B?dU9qUTRXV2o5K1lZOTZTUjAzSXYrWm9KSnZoWWdlejRTMWtxN2pLUStscmY3?=
 =?utf-8?B?V2tmRy9ibitOdENOemxGcnBQSEhCRTdPQyttMnFRYjN2VjNUNTFWRm5kei9Q?=
 =?utf-8?B?TUdtRk9pUjNuenVycksxejhsL2VSRXE1K3J3citCeHR6T2VYbFFOZUFwMC9F?=
 =?utf-8?B?Z0ZFRjh3SGJ2UnF3YXRoUHJMQ3E0NnQ5elo3VXBENnBSYjNjRVR5aHZhZ2xY?=
 =?utf-8?B?TkNySnRLT0ZSd3RMYVhvYkxQNUFKaWEzR2ZZQ29RcE1LQk9qNW0rVDJmekN2?=
 =?utf-8?B?NG02Z0tZUXRRamN2N1FneHBUa3JWSkszNkdkV2JiYVN6SFlkQjJ3aEpFbCsr?=
 =?utf-8?B?cnJuLy9sQU1FelRRcVNRVWtxREh3eDQ5OUVYZTZiMEgxa3pBSHdhUXN5MzBu?=
 =?utf-8?B?azZ4K2JDQXB2QmtXMEtGK1QxdHAzWTFtcDF6VW5wenlYaFJzdE9BMlRHTERU?=
 =?utf-8?B?R3YyZ3REeFRPQW56SnFLQ0tuWjNLWU5xcXU3REUrQ1RNT2pWcFFEV3VYNmFk?=
 =?utf-8?B?b0p5Rm01ejdFYS94UExyRmRwNHdyNFV2VlFMdDJ2TEFxNXVmdUgxZWZEbnRz?=
 =?utf-8?B?N2poR1lXcXU1MEdJQ2JwbXovSTN2ellGTFRVTWVpSFZYbEI5QllhYWtWVkRz?=
 =?utf-8?B?aFBiVVhXZVVFRGxEQ01SeDlqUktvUkRnVEw0czNKWHlnV0F5eWVGbE1zUXNM?=
 =?utf-8?B?Q01jTFRsZUhyT1lQM3I3amJydFk1ZThlMy9ZOTZxTnVDUVhCcXhJYWYwTUZS?=
 =?utf-8?B?eG0yQTFhVCsrWDVlRFRZcGVJT1QwZFQzN1k0bUd4TndPWjFqREpnMkdYYUxi?=
 =?utf-8?B?ZEpNV0puT01LWEhvbGs3SFgzV1ppRnhRRmJ6WWxLd1g3SGF4K0lBR3BnYUpn?=
 =?utf-8?Q?zWZ8O0crnsA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djBJbjhweVdnNnRYSy9NUVNKQjROUnJUQ2RySG16ekVGSWNmWHpmTHp6Vkla?=
 =?utf-8?B?c0l3ZHdRV2J1by9ZejhYemU2cnMybWJSYmQ3Ukh3dVZtQkdtUWFwTmpHSTZp?=
 =?utf-8?B?dFJqMm5CUEJKb2FyY0FiQVp2SEJkK3ZxajVvN1MwK0JETlR6WXBxOUdaNjBT?=
 =?utf-8?B?eXBJaEFLU216ZFhTTjZCeXNKcnliZWV2UDI3ZGNUZ2FNZm1oQVpUajVGK2Uy?=
 =?utf-8?B?YmJiL25aNmlUYTB5SkdON2dEazRZMnRyNng2ZEtGWE5mSkppbTlML1QvSEpX?=
 =?utf-8?B?OVdubDlYQjlFZWo3NXR3SHFFcms4Q2lnL2dWQlBhUnpLRkJZS3lGeVNlakps?=
 =?utf-8?B?eDFKYTVxT2pwWTZMZGovYW5MTnJOVkVRUW93SzVsb1JORmw2TzdJMjFkcnhY?=
 =?utf-8?B?bmhBNE1aMzMrMU5BSVN4Q0Q5bFZqNG5CbGs3RENTN1IvTW9MYm5sL3d1MVI4?=
 =?utf-8?B?WjFjdlZlQU1uT2tPYUJzSUV2NHVXbVhxa1Q3bm93UVgzZ0s3U3oxWHBvVXl2?=
 =?utf-8?B?a2FGRzRZODZLK2pCa0lmZTRvZDJISmFhV3V1R1gzSzI2VVVaNXZndGw5dHFI?=
 =?utf-8?B?aVAyTFJBQUxVNWFBL0s4ZGRNYVdscFFTQTJ0QlEvSTB5aGxmQUhpN3Q5RTJH?=
 =?utf-8?B?WlpLMlp4WFJhRkpiRUthY2pIWDFOTUI2NjJQL1l2WGttbkhGcEpTcW5jMlFB?=
 =?utf-8?B?RFdxNW0rbDFpR2lTdE9JU0xWOXJDZmpLV2YyK1pjZHNxUXdjV2VSUUFtREJH?=
 =?utf-8?B?K0J6WGpxWUNxWTZ5RktzbjcrclRsd1MzcWdqSmZJUXVnNzlCdWtKcFNLSzRt?=
 =?utf-8?B?UkJYU0U3RjNyd0tkcVFzTkoyeDJ4VCtGR0E0L2EwblplOXpmbXloZ2g4ZFZq?=
 =?utf-8?B?RHJ2dy9FYnRGU0JkTDl0ZWd6d1dKNENyRzB2ZEx2RWpvZXRHSzNqS21ZNmhB?=
 =?utf-8?B?YXdRRlhBYzNCTjE3cnFkb3dTdnhlN28xcTl3Uk9xTVVDZjRjb3FadnNJT0VH?=
 =?utf-8?B?R25xbUxjbHpsRUNzZDc4WDVrdGtDeU51S0RZVnJnZmE4QmxjYW9RL1Nwb3A3?=
 =?utf-8?B?QlJ6dUdxVGR3a2hSRlRaZDNNOFFnVFU1N050aUZDV0xqWnAvUmRZY1Y0VWhw?=
 =?utf-8?B?Z2V0cWkrRDhhbTV3WEZDaW03dUlqTnpNU1kySFg0ZEhvTXpJRUszWlFLNFN1?=
 =?utf-8?B?YVU1TEZ6aFFOTW9ibFhWNXE0Wm9oNGdSVm0weUkvTW9TYng5d2dUZEpZV2tH?=
 =?utf-8?B?TWFQeXJnRmhhdDBZbjVDTkRHM1VhZFJpeFFnV05tMjFEZ2NwVzVVbm95SDZJ?=
 =?utf-8?B?ekNNMVFzc05NOXptczBwYVdadUdBZTQwWUdLSVBkcTlTR016WUw4ckNhWG5V?=
 =?utf-8?B?NlhDYVVxWTg3Y3laVTZmeTFWcHBaaVhra0E2NXpPQUZDclhvdDJwQ0lMSkRL?=
 =?utf-8?B?VjUwd2lielZYd0RuYVI5aTZnYVM4OFU0OC8xa1JaeGtSZXJNekZJZU16bHZV?=
 =?utf-8?B?RTdJN0RQYTJ5MEx3UzJOdUU2U3VlaVNHUXhheEFXUVB0UGxLdVREbkp4MDRl?=
 =?utf-8?B?ZWJjSW02YnpOWmVBa3hldytHUk95TkIrd0lXME9Za0U5bFUzMDhacmF5a3ZB?=
 =?utf-8?B?eUpvaHhrdWUwemdnbXg5SjFnTEF1anJSeVp0NkRpVTBSMW1xalJyYk5LREFy?=
 =?utf-8?B?YmRUcTduZkgvRnFaakdhK2ZTZHFiN1pxN0JTbTlIbDZIWE5yeFNlSTFDNGZZ?=
 =?utf-8?B?OXNGa1NsbFpGTjFIWC9DZk1KdHk1OU9iVjBCeWNmUmoyNEpRcUFjWWRndldC?=
 =?utf-8?B?WE12SFRaVGhuYk56QldqQVJ2UTdORWJXSFFnMWhPUFJackRSb2VpRjg2ckIr?=
 =?utf-8?B?alpDZnlnbVd2QjFQSEpDa2d2T3diY1NYOGc2bUVFc204T2lLRUNLWjI5Q2Z4?=
 =?utf-8?B?bkNWSHFIeHd0OHgybDdnTUxCdEZ6OGNkL09IV0RWcEFLcUNuZlpBMDB6QXNy?=
 =?utf-8?B?b2FMYkljTWFqUTVzNnB1OTBMTEZaWjU1dC9vZHlsVm5NRUhESWNENnRlbHZZ?=
 =?utf-8?B?Q1BqSk1wVk5kUDlSQVkySFlTNVIrMzdueXJtVTRXUUxYakVLQUgvMmtRdUJR?=
 =?utf-8?Q?sKooaIZKlAEHFsWIB5Ni6gmx7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 507934f9-dadc-42af-180b-08ddc376d051
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 08:08:42.7301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YkzsWgL3C7PDi4Qzc6Ewz4jzL6S1PKW/rkysXLqg578fRwE4Q5nZiexRThz2dwxa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5847



On 15/07/2025 09:45, Hari Limaye wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> Implement a function to find the index of a MPU region in the xen_mpumap
> MPU region array. This function will be used in future commits to
> implement creating and destroying MPU regions.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> ---
> Changes from v1:
> - Update commit message
> - Remove internal _index variable
> - Simplify logic by disallowing NULL index parameter
> - Use normal printk
> - Reorder conditional checks
> - Update some comments
> 
> Changes from v2:
> - Replace conditional with assert
> - Improve comments regarding base and limit
> - Space between ( and uint8_t.
> ---
>  xen/arch/arm/include/asm/mpu/mm.h | 29 ++++++++++++++++
>  xen/arch/arm/mpu/mm.c             | 55 +++++++++++++++++++++++++++++++
>  2 files changed, 84 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index a7f970b465..5a2b9b498b 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -10,6 +10,13 @@
>  #include <asm/mm.h>
>  #include <asm/mpu.h>
>  
> +#define MPUMAP_REGION_OVERLAP      -1
> +#define MPUMAP_REGION_NOTFOUND      0
> +#define MPUMAP_REGION_FOUND         1
> +#define MPUMAP_REGION_INCLUSIVE     2
> +
> +#define INVALID_REGION_IDX     0xFFU
> +
>  extern struct page_info *frame_table;
>  
>  extern uint8_t max_mpu_regions;
> @@ -75,6 +82,28 @@ void write_protection_region(const pr_t *pr_write, uint8_t sel);
>   */
>  pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags);
>  
> +/*
> + * Checks whether a given memory range is present in the provided table of
> + * MPU protection regions.
> + *
> + * @param table         Array of pr_t protection regions.
> + * @param r_regions     Number of elements in `table`.
> + * @param base          Start of the memory region to be checked (inclusive).
> + * @param limit         End of the memory region to be checked (exclusive).
> + * @param index         Set to the index of the region if an exact or inclusive
> + *                      match is found, and INVALID_REGION otherwise.
> + * @return: Return code indicating the result of the search:
> + *          MPUMAP_REGION_NOTFOUND: no part of the range is present in `table`
> + *          MPUMAP_REGION_FOUND: found an exact match in `table`
> + *          MPUMAP_REGION_INCLUSIVE: found an inclusive match in `table`
> + *          MPUMAP_REGION_OVERLAP: found an overlap with a mapping in `table`
> + *
> + * Note: make sure that the range [`base`, `limit`) refers to the memory region
> + * inclusive of `base` and exclusive of `limit`.
> + */
> +int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t base,
> +                           paddr_t limit, uint8_t *index);
> +
>  #endif /* __ARM_MPU_MM_H__ */
>  
>  /*
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index ccfb37a67b..407264a88c 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -110,6 +110,61 @@ pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
>      return region;
>  }
>  
> +int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t base,
> +                           paddr_t limit, uint8_t *index)
> +{
> +    ASSERT(index);
> +    *index = INVALID_REGION_IDX;
> +
> +    /*
> +     * The caller supplies a half-open interval [base, limit), i.e. limit is the
> +     * first byte *after* the region. Require limit strictly greater than base,
> +     * which is necessarily a non-empty region.
> +     */
> +    ASSERT(base < limit);
Well, that does not guarantee a non-empty region.
Consider passing [x, x+1). The assert will pass, even though the region is empty.

~Michal


