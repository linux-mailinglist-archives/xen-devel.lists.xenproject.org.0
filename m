Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AF9AF0E80
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 10:55:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030766.1404430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWtEl-0001Ic-Gq; Wed, 02 Jul 2025 08:54:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030766.1404430; Wed, 02 Jul 2025 08:54:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWtEl-0001G1-Da; Wed, 02 Jul 2025 08:54:39 +0000
Received: by outflank-mailman (input) for mailman id 1030766;
 Wed, 02 Jul 2025 08:54:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Y9l=ZP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uWtEj-0001Fv-SB
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 08:54:38 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20623.outbound.protection.outlook.com
 [2a01:111:f403:2418::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c4f2891-5722-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 10:54:34 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CH3PR12MB7570.namprd12.prod.outlook.com (2603:10b6:610:149::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 2 Jul
 2025 08:54:30 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 08:54:30 +0000
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
X-Inumbo-ID: 2c4f2891-5722-11f0-a313-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=odl7SrVVTbkzmEvahYg6IFuOOuJgOUdbxADdRa83WvPAHK5oRG6BmXnX3GL2J1CPYLbpqU2JXvtwJMEgKJNqjwZOcLCneSvhm+MxBbrBelhZg8tbA0yXy74mtfEc6V33JlVKY97El6qiymvMQ97wam6IJX809KLO6Di8WYu705bt14kbH4vYtMZrpxZ6qg4VFqABaVr6XidunK3pja5hQSxsjy9wOns7EQ0lK5MHerGQOXy2U4uLNsmrrwRovCO852SF6ouJb6AVNYaRdPpHQyFLANNgSzUy71OByNok5b96Ss9WW0M/XXyMvBYFU6/U78Fb3s4x0QK8oJOZUXvDeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLnUpBTUFYOxpjYosgJsl3b4piSCSi1Kss8BL7dHlvo=;
 b=VJ0cwtMV8PmY5aqVOY5zfPXCtNBaJes2+daVA97RMoihPS5Hi4p9Gfoyh1zv2hmJU1C7Rs4EopKJXb0UQolv5fkLxefOd75d7Tp5iVj7rmIf7FvzzAY+6O4eVLqeDGQKZCITQJmmPRvIJmM2tVe4z6jj+oHUS37zQKbH+pjiV2SpEBu9vATFR40/wd/2uI+Dbwr0IV4WluaXF4TjHGfV7vy7+tUei3DLHMXurvs8eXFxL6dSXLRX5vxMclyqy8gf6EgOUmmTqXxMniTE0aOCLv0mKuCA4X31Zmle0mpeLArGF/rQ4gSNalQeULiT7p9j+lEz1dU0WYwBk47vGmQbcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLnUpBTUFYOxpjYosgJsl3b4piSCSi1Kss8BL7dHlvo=;
 b=f39+oqJYwRLT/P1KaNKaGPNO+mXuqJAt68Y4pcFdMhGPlcADUOR3GsYfy69UlIZI3KAB6jyMUUMTv10TbJ52z4oHKXGjeBvVIwa/JiKX4mrd4/d0kJffbQt69YQc8x8rWuZnu5B/9dBSLgndG66N8iaw+SSdMZc8VoH2TlEtKiE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <adc8f96c-6aad-4d67-9e78-118a29a58bce@amd.com>
Date: Wed, 2 Jul 2025 10:54:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] pdx: introduce a new compression algorithm
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2506271905350.862517@ubuntu-linux-20-04-desktop>
 <aGKnDHtRD5OLGaYj@macbook.local>
 <alpine.DEB.2.22.394.2506301726500.862517@ubuntu-linux-20-04-desktop>
 <1507b441-dd3c-4a24-beda-0d1d3143faf9@suse.com>
 <alpine.DEB.2.22.394.2507011338360.862517@ubuntu-linux-20-04-desktop>
 <aGTZK0YmBTvGmNQr@macbook.local>
 <0807cdba-b0bb-42a7-a18d-407ab818709a@amd.com>
 <aGTtJTTbEkYvnMq6@macbook.local>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <aGTtJTTbEkYvnMq6@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::8) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CH3PR12MB7570:EE_
X-MS-Office365-Filtering-Correlation-Id: ac1a5f20-fbbe-41ea-a6fe-08ddb9460e80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?alVkZm02RzNxV0I3RmhWN09yZURVbWxLMTA3dmZXdXdiSDBmdkl0L05jb2VH?=
 =?utf-8?B?OFRPaVlWRCs3dVEzc1N4Y3VzQXRFTTBiQlpXK3Z5MmVEakg4ZUc2Lzl6OCtU?=
 =?utf-8?B?MnR6OVErbVgwVEFwK2dKazNwWmVzL2ZSS0dzZTVyaVI1WlNmZEpwSE5rYjBx?=
 =?utf-8?B?ZS9Ec2VBQkxOMXFnR0I5T0ZiV2pab1ZKNGNCQlhjMlRtbHJ2bVdxVFpCYVhs?=
 =?utf-8?B?QjdCNEtVbGs0VnRSNFVGZXo5Wk1LN1BSR1FFQTluMHZzcGxWclVGbSsyTHBK?=
 =?utf-8?B?NTdVS1lNakpkRUExcnlZNWdsNFVXN2pWeS9Dc3hhL2M5L29id2RQNjk2YkdB?=
 =?utf-8?B?d1Z0NVh4TnpJKzgxTUlqLzZhbGRSN1ZDRnk1MEZvcG0yaWxCNjR1NlZUU0t4?=
 =?utf-8?B?TmxxWXdrUy84SmJQcHRCUlMweTVkMTY3RjRBVlZiUzFRUXc5QnU0K2tWNTVW?=
 =?utf-8?B?LzZET1RhaDVPeWpFSGo2NjR0R1pIdjV4eURDNjJLdmc4TS9DUVlBZkRld2l6?=
 =?utf-8?B?NHgvKzlOSG1Cb21aWWphcEJBVHZwajh0TG9GZDFwbHdEa0thb1gzMmcyaHRT?=
 =?utf-8?B?dk5Pa2lJTkVrNDZRS3IwaVZEQkIvdSs0MHl1WFNyelJKMVduZERMQkVUeS9N?=
 =?utf-8?B?ZTM4MDNWRzRQMXVwSTVpSjhIbFFlWElHR0pNbjhpaEZQUy9ZS1NTSlJZRUtD?=
 =?utf-8?B?Qmc4UlNKaVlrTjBwcTNGYS9ReEJFenZYUlM0R1MxRTRTanIxRlp3allqbmlN?=
 =?utf-8?B?cGhUM0JTZjNLc01ob1h4bUQ5WmFUbWVmMzI2SzY1NzlZV1huQnNiVFgxdFcy?=
 =?utf-8?B?WDhTeEhYVmxIVHRCckJqS2JBcFlHUXB2ZXQ2d3YzVTVBR0o3dHlTZVVRRi95?=
 =?utf-8?B?T0xLMHhKb0RvZUEyWWt2RWs3S3d3NmhMUTc3bWRWY3pXYURROUFXcUFTTUkz?=
 =?utf-8?B?S1hvaHV0YWZkUG1TWmVTemh6RGExY3NpeFVhdE5Lc1k1QjNOY2dkaFZMakNC?=
 =?utf-8?B?OG9Vbk81M1d2TTBzdGc4T3RZYVA0MUNGTDZvRjJtL2Nib0pYYzF3ellhaWhm?=
 =?utf-8?B?UWlYZlJrMUpnTklPdHdJb0NIaUordWNRZkZ0RDJaVnhhbWsrMFpHbm5uTjN1?=
 =?utf-8?B?bHhoRU5VRndlYWU3OUI3aVkrelV2bHJjNHRTT2pPaWY5SXI2K3YrSjBWQmNh?=
 =?utf-8?B?Z2UyMGdFejVGME5qRDlHNk4yazlIVHQvYWZjUVFWbTlXcWtzUThhRUVVOGRL?=
 =?utf-8?B?NEMrOHhOYnplSTA5Y2lOUXNHbld5RnJTNHl0WEt3d0pRNGdGdlVkNWphKzRH?=
 =?utf-8?B?ZTZSbnlxUWRkVis2RnNJZVdEcGhZanBVZEhPT25iajdkOVdId1Nmb3ZJUGtU?=
 =?utf-8?B?V0l6bDRVOWh1V0xyUlEvZVVibHhKcmhvME5lb3RJZm5CSDJIcG9KbU9Nb3lH?=
 =?utf-8?B?cVB3dVhvTWo5UzlDNFMrRFJHMDZqNmZFeVROVmh2aVU5QWhmSGx1WEVqeHll?=
 =?utf-8?B?d213QXo0ZncxTDBYeUFOZGVKa3pSdzFmR003cUZ1NzVwMEt4QTRzTkVVaGpv?=
 =?utf-8?B?TldnbFY2TGJhZ1ZvdGJzTjk5STV6T2dqSURjNkZINWtVaWVVN2xTZFJSbFNt?=
 =?utf-8?B?dmZCNUdCMndhSWVjOUN3VFloS3pkaXBBVnlaV3hSVkNFNXY1cDdSaVNtNmVp?=
 =?utf-8?B?YitGa0M1MmpoQUs1eXgwMjFhdjVZNGpLS2NGS0pHRE02T2JBS1MyRTRwODVZ?=
 =?utf-8?B?cmdZWUQxZWFsWFVVRXJuTGZuTmUxd0xlN1BNYXRUdUlDbTdjSTFXZjJHWW5E?=
 =?utf-8?B?dkxIM3hJeHF3a0E4Mm93eXpnOThkTnFwK2xNZUpiOVZCRElYTnViaUw4YTNh?=
 =?utf-8?B?Uzd2YXRkRy9mbjNQT2JSVHYzUEdQdXdVUmZLbGVtcHMvUzlQK1A2LytlV0Y1?=
 =?utf-8?Q?hISzwvlPiJY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U21rL1BhMFdqOFNpOUU3OGRtWGZ5cUNQR09MRVhHbWh2RnNwMkd6QzhJNUZH?=
 =?utf-8?B?N0pRSy8xT2FCdE5uSEE4R0NyTUJKVzBFd21BWG85UVdoZERIZGIzYVJaM2Ra?=
 =?utf-8?B?U1Rkdk5BQkt4K2JNR2lweUxQTmJ2RUFwb2JML1UwYWkrcDRZTW9LZjhGa3g5?=
 =?utf-8?B?akZNOFFhM1lXZnNvazg2WjVpNFgxSmo2VXdaVEdiY3l5RFRTaitJU2hDRkJo?=
 =?utf-8?B?RGtJRHQxRHV0OHdYeG1yWkhHbzdJMmV3Uy95aGZwdGRBajVqR3lVc1N3OW91?=
 =?utf-8?B?TzNDTzNXRG5MTVl4emhhWTNDQVYraDNqY1BIUzdkQ2FjNnVSUXRLN1ZtZFRt?=
 =?utf-8?B?ZS91UzMvbGJKUUl1TU9lN0pGTGZ5b3VQYXF1SWNENDcvbHZMVjhiSkR2NWJR?=
 =?utf-8?B?aXA1a1h4cWVLSHpVb3lFeG5SVHJ0RXVZemg4bWNnbWsrMVF3OG4zU0VVVTVC?=
 =?utf-8?B?T0FhZ1YyUE5FdkNGYlBhb1RQbXp1K3pTQWc4TFN3VjY3WjhYQ0R4QVNjU1I3?=
 =?utf-8?B?aU1sQllob2NtNVhaSFdtMnNLL0czeWt5VzJsY2ZrUXpnSDdsd3d1VGpORlNR?=
 =?utf-8?B?Wk4yM3ZISzg4aUNsSUs2WmM1aEFLZjhCNmc1N0JBUjZLVEg2ZDV6N0R4MXlR?=
 =?utf-8?B?ZW9UYzBGREJ5RVJWMkdsazBlVXlwZDBueWlqY2hwVlZMUk5MZmM3VmhFRXBW?=
 =?utf-8?B?ckRRNTZnc2p5bW1pUXNoc3JSMWJyTjZZdWI5cUJyZ3ROeURYOCtjM09NY1FP?=
 =?utf-8?B?WGxqUVUycjJSdUVnbnlnTHZWYUhKdW5sczBONVZ0YllTOFRicTRRM0pSWHlU?=
 =?utf-8?B?ZDJ1ajhnWnBLend5T1pHWEJjWnM0eE9GMVlHWitSQjVZMmlrOEx6elpFNElY?=
 =?utf-8?B?d1BMdjZ6V29ELytBOFhuMDJRcVZ4YnhQa1IxSlMxNlhxRXpFb25VWE1YNE5z?=
 =?utf-8?B?UWtQd0ZLMHVGWEJYNXdQMzFKUFVCY2p4L0pGT3RCYlZLdStYRjVVOXpab1RZ?=
 =?utf-8?B?ZXhycHljU0hBQ2J5ejFqSG1RVGxrL1YwaFJxZ29lREJwdkFPakRIV3RuSDVr?=
 =?utf-8?B?Z25vUTB6azlsbTRFMklVWDRNVGVwYlRGSnJYam5yaGJvSUhkcHRuRmFVTkJH?=
 =?utf-8?B?ZkJvR3U5b0RzUlZqbGovNzAzMjVjcjVGR3IyNTMvMlEvMFNqNHlFeDg3bGhQ?=
 =?utf-8?B?YlJyQnNubExLTGZlRDdvYXRDZ3lhU3pHVG0xeHJrZ2tXbUhLMWlZeWxhZ2Jk?=
 =?utf-8?B?ODJiaFdZdVcvbC9WSU03Rzh4aUlnWk5WdUQzbGlhSlZOcnI3RmZaMjRYZnJH?=
 =?utf-8?B?NUIwYWhhL0Jqb0Y5dWZQOEJYRmswcjZWUmhkMVQzMTFzUHlmWUpUOWpCY1FB?=
 =?utf-8?B?MFVhZG5ZZStOb3h6ZzhUanJ0MGZhOUxlUTJtZ0craHIzTi9pWUJVMDAwMDE0?=
 =?utf-8?B?WmtyUHVsSnVTN3RibCtRUHVJRGJteHZFTmhSOXVOSWszQjYyK0lDWlpTRWEr?=
 =?utf-8?B?UFBRTi9STEIrekVKWkVPWEE1UjRIZytaMjR5NlJ3ZkhXV01TcTZDbDJUZngz?=
 =?utf-8?B?UmdWWDE3alpLRFE1cnF5bUlodlBxR1VYUy9qckRrWkxpRFcxaEFPVTFtZVVH?=
 =?utf-8?B?cDBtRHlrYTRLTFQwU1RpNFdueHJQUG4yTnhaNEZ2L0s3aWs2Z1RaazhYQ2sy?=
 =?utf-8?B?cnQ0c0dsd0RyTXVpVXVYaFNwUUZsM2xZVGJIK0N1cS9LU0dVVDcxWG01OTl5?=
 =?utf-8?B?VG53U0NCZHB1b0twRCszV2djeVY5aEo4T3pzQ2ZqSGtvcDFGc051eTNIcXZ6?=
 =?utf-8?B?bHNRcEkzNzl5SllEeUZ2d3JocHYzRmFkQngrdDlsRGVZWm1BK3VLTzdQeC9V?=
 =?utf-8?B?TmRqdkJrQ0taaUNpT1BHRkRBWDBGeU42UDU4Q2JlZlh2NTZXVUgvQWtkR0RL?=
 =?utf-8?B?RHlCSzMzT1hlTkxPVDUvelFNSUxSQWxRYm4rNEhCVmRwQi92anRTOHdGMDFh?=
 =?utf-8?B?R3Z3UnV0RitMNk4wZlM1Q0FpQzBCbVlSVmVzUEZaVTI0MDcrSmk4WTN4VjdH?=
 =?utf-8?B?aUI5ZmZ4dFo1K1dBS1B2Znc3UXBVbXdsS0VTNU5DeUt6MWVPaUM4d01KNTEr?=
 =?utf-8?Q?mDUY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac1a5f20-fbbe-41ea-a6fe-08ddb9460e80
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 08:54:30.1058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOo1d3nei/Y295GoE7DPa/xcZKNqrZuWXOUCTEjo3DgtshaQcQ8WZdlSHfAK3ZnB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7570



On 02/07/2025 10:26, Roger Pau Monné wrote:
> On Wed, Jul 02, 2025 at 09:52:45AM +0200, Orzel, Michal wrote:
>>
>>
>> On 02/07/2025 09:00, Roger Pau Monné wrote:
>>> On Tue, Jul 01, 2025 at 01:46:19PM -0700, Stefano Stabellini wrote:
>>>> On Tue, 1 Jul 2025, Jan Beulich wrote:
>>>>> Sadly from this you omitted the output from the setup of the offsets
>>>>> arrays. Considering also your later reply, I'd be curious to know what
>>>>> mfn_to_pdx(0x50000000) is.
>>>>  
>>>> Full logs here, and debug patch in attachment.
>>>>
>>>> (XEN) Checking for initrd in /chosen
>>>> (XEN) RAM: 0000000000000000 - 000000007fffffff
>>>> (XEN) RAM: 0000000800000000 - 000000087fffffff
>>>> (XEN) RAM: 0000050000000000 - 000005007fffffff
>>>> (XEN) RAM: 0000060000000000 - 000006007fffffff
>>>> (XEN) RAM: 0000070000000000 - 000007007fffffff
>>>> (XEN) 
>>>> (XEN) MODULE[0]: 0000000022000000 - 0000000022172fff Xen         
>>>> (XEN) MODULE[1]: 0000000022200000 - 000000002220efff Device Tree 
>>>> (XEN) MODULE[2]: 0000000020400000 - 0000000021e2ffff Kernel      
>>>> (XEN)  RESVD[0]: 0000000000000000 - 0000000000ffffff
>>>> (XEN)  RESVD[1]: 0000000001000000 - 00000000015fffff
>>>> (XEN)  RESVD[2]: 0000000001600000 - 00000000017fffff
>>>> (XEN)  RESVD[3]: 0000000001800000 - 00000000097fffff
>>>> (XEN)  RESVD[4]: 0000000009800000 - 000000000bffffff
>>>> (XEN)  RESVD[5]: 0000000011126000 - 000000001114dfff
>>>> (XEN)  RESVD[6]: 000000001114e000 - 000000001214efff
>>>> (XEN)  RESVD[7]: 0000000017275000 - 000000001729cfff
>>>> (XEN)  RESVD[8]: 000000001729d000 - 000000001829dfff
>>>> (XEN)  RESVD[9]: 000000001a7df000 - 000000001a806fff
>>>> (XEN)  RESVD[10]: 000000001a807000 - 000000001b807fff
>>>> (XEN)  RESVD[11]: 000000001d908000 - 000000001d92ffff
>>>> (XEN)  RESVD[12]: 000000001d930000 - 000000001e930fff
>>>> (XEN)  RESVD[13]: 000000001829e000 - 000000001869dfff
>>>> (XEN)  RESVD[14]: 000000001869e000 - 00000000186ddfff
>>>> (XEN)  RESVD[15]: 0000000800000000 - 000000083fffffff
>>>> (XEN) 
>>>> (XEN) 
>>>> (XEN) Command line: console=dtuart dom0_mem=2048M console_timestamps=boot debug bootscrub=0 vwfi=native sched=null
>>>> (XEN) [00000006bfc302ec] parameter "debug" unknown!
>>>> (XEN) [00000006bfcc0476] DEBUG init_pdx 294 start=0 end=80000000
>>>> (XEN) [00000006bfcd2400] DEBUG init_pdx 294 start=800000000 end=880000000
>>>> (XEN) [00000006bfce29ec] DEBUG init_pdx 294 start=50000000000 end=50080000000
>>>> (XEN) [00000006bfcf1768] DEBUG init_pdx 294 start=60000000000 end=60080000000
>>>> (XEN) [00000006bfd015a4] DEBUG init_pdx 294 start=70000000000 end=70080000000
>>>> (XEN) [00000006bfd1444f] DEBUG setup_mm 252
>>>> (XEN) [00000006bfd3dc6f] DEBUG setup_mm 273 start=0 size=80000000 ram_end=80000000 directmap_base_pdx=0
>>>> (XEN) [00000006bfd5616e] DEBUG setup_directmap_mappings 229 base_mfn=0 nr_mfns=80000 directmap_base_pdx=0 mfn_to_pdx=0
>>>> (XEN) [00000006bfd7d38a] DEBUG setup_directmap_mappings 237 base_mfn=0 nr_mfns=80000 directmap_base_pdx=0
>>>> (XEN) [00000006bfd92728] DEBUG setup_mm 273 start=800000000 size=80000000 ram_end=880000000 directmap_base_pdx=0
>>>> (XEN) [00000006bfdaba3b] DEBUG setup_directmap_mappings 229 base_mfn=800000 nr_mfns=80000 directmap_base_pdx=0 mfn_to_pdx=800000
>>>> (XEN) [00000006bfdcd79c] DEBUG setup_directmap_mappings 237 base_mfn=800000 nr_mfns=80000 directmap_base_pdx=0
>>>> (XEN) [00000006bfde4d82] DEBUG setup_mm 273 start=50000000000 size=80000000 ram_end=50080000000 directmap_base_pdx=0
>>>> (XEN) [00000006bfdfaef0] DEBUG setup_directmap_mappings 229 base_mfn=50000000 nr_mfns=80000 directmap_base_pdx=0 mfn_to_pdx=50000000
>>>> (XEN) [00000006bfe35249] Assertion '(mfn_to_pdx(maddr_to_mfn(ma)) - directmap_base_pdx) < (DIRECTMAP_SIZE >> PAGE_SHIFT)' failed at ./arch/arm/include/asm/mmu/mm.h:72
>>>
>>> As said on the other reply, the issue here is that with the v2 PDX
>>> offset compression logic your memory map is not compressible, and this
>>> leads to an overflow, as anything above 5TiB won't fit in the
>>> directmap AFAICT.  We already discussed with Jan that ARM seems to be
>>> missing any logic to account for the max addressable page:
>>>
>>> https://lore.kernel.org/xen-devel/9074f1a6-a605-43f4-97f3-d0a626252d3f@suse.com/
>>>
>>> x86 has setup_max_pdx() that truncates the maximum addressable MFN
>>> based on the active PDX compression and the virtual memory map
>>> restrictions.  ARM needs similar logic to account for this
>>> restrictions.
>>
>> We have a few issues on Arm. First, we don't check whether direct map is big
>> enough provided max_pdx that we don't set at all. Second, we don't really use
>> PDX grouping (can be also used without compression). My patch (that Stefano
>> attached previously) fixes the second issue (Allejandro will take it over to
>> come up with common solution).
> 
> You probably can handle those as different issues, as PDX grouping is
> completely disjoint from PDX compression.  It might be helpful if
> we could split the PDX grouping into a separate file from the PDX
> compression.
> 
> One weirdness I've noticed with ARM is the addition of start offsets
> to the existing PDX compression, by using directmap_base_pdx,
> directmap_mfn_start, directmap_base_pdx &c.  I'm not sure whether this will
> interfere with the PDX compression, but it looks like a bodge.  This
> should be part of the generic PDX compression implementation, not an
> extra added on a per-arch basis.
> 
> FWIW, PDX offset translation should already compress any gaps from 0
> to the first RAM range, and hence this won't be needed (in fact it
> would just make ARM translations slower by doing an extra unneeded
> operation).  My recommendation would be to move this initial offset
> compression inside the PDX mask translation.
> 
>> For the first issue, we need to know max_page (at
>> the moment we calculate it in setup_mm() at the very end but we could do it in
>> init_pdx() to know it ahead of setting direct map) and PDX offset (on x86 there
>> is no offset). I also think that on Arm we should just panic if direct map is
>> too small.
> 
> Hm, that's up to the ARM folks, but my opinion is that you should
> simply ignore memory above the threshold.  Panicking should IMO be a
> last resort option when there's no way to workaround the issue.
On Arm we handle user errors and suspicious behavior usually as panics as oppose
to x86 which is more liberal in that regard. We want to fail as soon as possible.

> 
>> The issue can be reproduced by disabling PDX compression, so not only with
>> Roger's patch.
>>
>> @Julien, I'm thinking of something like this:
>>
>> diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
>> index 4d22f35618aa..e6d9b49acd3c 100644
>> --- a/xen/arch/arm/arm32/mmu/mm.c
>> +++ b/xen/arch/arm/arm32/mmu/mm.c
>> @@ -190,7 +190,6 @@ void __init setup_mm(void)
>>
>>      /* Frame table covers all of RAM region, including holes */
>>      setup_frametable_mappings(ram_start, ram_end);
>> -    max_page = PFN_DOWN(ram_end);
>>
>>      /*
>>       * The allocators may need to use map_domain_page() (such as for
>> diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
>> index a0a2dd8cc762..3e64be6ae664 100644
>> --- a/xen/arch/arm/arm64/mmu/mm.c
>> +++ b/xen/arch/arm/arm64/mmu/mm.c
>> @@ -224,6 +224,9 @@ static void __init setup_directmap_mappings(unsigned long
>> base_mfn,
>>           */
>>          directmap_virt_start = DIRECTMAP_VIRT_START +
>>              (base_mfn - mfn_gb) * PAGE_SIZE;
>> +
>> +        if ( (max_pdx - directmap_base_pdx) > (DIRECTMAP_SIZE >> PAGE_SHIFT) )
>> +            panic("Direct map is too small\n");
> 
> As said above - I would avoid propagating the usage of those offsets
> into generic memory management code, it's usage should be confined
> inside the translation functions.
directmap_base_pdx is set a few lines above, so I would not call it propagation.

> 
> Here you probably want to use maddr_to_virt() or similar.
I can't because maddr_to_virt() has the ASSERT with similar check.
> 
> You can maybe pickup:
> 
> https://lore.kernel.org/xen-devel/20250611171636.5674-3-roger.pau@citrix.com/
> 
> And attempt to hook it into ARM?
As said above, we have different ways to approach setting max_pdx. On Arm we
want to panic, on x86 you want to limit the max_pdx.

> 
> I don't think it would that difficult to reduce the consumption of
> memory map ranges to what Xen can handle.
> 
> Thanks, Roger.

The diff I sent fixes the issue for direct map now. We can take it now if we
want to solve the issue. If we instead want to wait for frametable fixes (\wrt
grouping) and possible PDX changes (making offsets common) to be done first, I
can simply park this patch.

~Michal


