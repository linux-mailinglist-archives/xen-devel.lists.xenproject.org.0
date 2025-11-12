Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1A1C53476
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 17:07:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160288.1488473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJDNb-0005X7-QF; Wed, 12 Nov 2025 16:07:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160288.1488473; Wed, 12 Nov 2025 16:07:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJDNb-0005UT-Mm; Wed, 12 Nov 2025 16:07:31 +0000
Received: by outflank-mailman (input) for mailman id 1160288;
 Wed, 12 Nov 2025 16:07:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=21S/=5U=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1vJDNa-0005UK-J2
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 16:07:30 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aae7fde4-bfe1-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 17:07:20 +0100 (CET)
Received: from DUZPR01CA0269.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::18) by MRWPR08MB11806.eurprd08.prod.outlook.com
 (2603:10a6:501:9a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Wed, 12 Nov
 2025 16:07:16 +0000
Received: from DU6PEPF0000A7E3.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::a7) by DUZPR01CA0269.outlook.office365.com
 (2603:10a6:10:4b9::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Wed,
 12 Nov 2025 16:07:15 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E3.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.13 via
 Frontend Transport; Wed, 12 Nov 2025 16:07:15 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DU4PR08MB11790.eurprd08.prod.outlook.com (2603:10a6:10:63d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 16:06:44 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 16:06:43 +0000
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
X-Inumbo-ID: aae7fde4-bfe1-11f0-980a-7dc792cee155
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TubpE13QBW8QgGPX3pA+xn+ZJWSdNlSnbLNVMDEyyEERuCtqRJZF5QX9UNikLw+1uK8zttnel0elrR4fLvodBoVDPuroy7T76Ms4jnHazqMB46Azu2UJ7WHN2f/5FWjWJCu+w3CpR8u0PgIrfCNFEbw9fZMDsxCUjhv/S7AijKOa61VJQDfLkt+1vW3B0owTKJ8ORv37XvedmdP00yNOLL/PvXRRL94VtVzeh5vSQ9LkL5PSYrrJ4lWr/kAOnG5uA1+k050za3la3rI+xXfoC/duCIyNE3iebtTal1d+w5mJgPeadM6x0tSOmW87ALzk85tMDPihi2mBX7l/yqSqQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MiZanPlUn/H4shEpLntazS/TlvwQOAjkfJbdp3mM5S0=;
 b=O0ZtGg2LJQ0VoWhYlkq1f8gNLMSLYBOAIwUwr1SJAQCyhPpkWO4dUjtGnkQmA5jNvl8gMU2DK6OUMMdJv/cEqYCEYli/WBopV7UK+gJKpWsvVuj4DutWGdJwTwiFUw/HXXGz9vYDTWhrLjhJiFtPf33MbJKeUecU7k2GjyRsNpZGDCdYd51xx58gtiQyUf6fot0cmX+L9laxoDbVGGzCW7hhhEXPjELpoT2xJ4pvAp/+MuVoL43AIRoqyDnjk1ARUcsS1+p3Dj9q6AR9tycff4rbDFwm+/PAJ0uqKL2FegoKruxH1YOqZ6cQ0QQ+Hu9U7sYtc9F2m8lbWxgWRxtD2w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MiZanPlUn/H4shEpLntazS/TlvwQOAjkfJbdp3mM5S0=;
 b=N/6grF18TL841Le8fMfxNiMTtL8HNHgGVoe+DN3/n4THU/yuXkvKOq8gZ03JFjqnaurEsOmBQHijGZs225s77lT+1fJlmMJWmxFpz3nKcwzvQMzRF6iX9whO5v0YsZmE1nj6ZcpWw7tGMZeksZGNyaaG0Ntr2Mth7UQhPDatYSs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DuIM5LWuNcSaihjUOgqmpcfS6l1dcb2PTDgSPVbhNZCkp801rlGRHFhFzQNB58BAiF6cvADI2PhOtX9iPyGHhHaeWXqIceJ+AbmQIQ75lgu2YXOZbKVtIvClr7au4Hib/n7Lz0ZJMIxI1bcU+mFcUeGIfuXWjmvh8nork1sliRVxFyUjo6mWziOGr7wYIan1kKU2kbCquIGoL4S6xbedvboX9D5MLCSYNf3TJVEPiBU7SAUxevtBbWNNRiIs9lCnyQbMGkVYjYi0blvhOHjcZGkJoe760PBtLVl5G5o5xGRzJG7G+w+31v8TCpCE/O+x1tSDk7It8masqUzuBFvSvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MiZanPlUn/H4shEpLntazS/TlvwQOAjkfJbdp3mM5S0=;
 b=gwHcJMcVjrcDE+qbDCCuab9sBmzxWeKWRhcLrzUXMuuVPQrzABTc7e9zRmzyqJNMaaGqM4EMVajDeKIsFGcxcx8Y17n7R9fmxBohehWn/AdgOgJk/uKrmLctenvGaoi1gjS1e/xI60V5UilPGxdnfJ1VIqQpn7lzFAcdWITCF95fUMhFeDeNyL1j28O7+0rhRgotGexZ+vH25KX+QTHqqxUvH2o35+J+yOOWionpigjzBLO2atfpipzsG+IXy2jA/SO6OedzIpfiJpW+H2Iu1Fcx7p70kAyWwFjs4xMV7MdqcY8wu1kpEciIpPzrDtRIljfT+RB+WzDk8AhTenszxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MiZanPlUn/H4shEpLntazS/TlvwQOAjkfJbdp3mM5S0=;
 b=N/6grF18TL841Le8fMfxNiMTtL8HNHgGVoe+DN3/n4THU/yuXkvKOq8gZ03JFjqnaurEsOmBQHijGZs225s77lT+1fJlmMJWmxFpz3nKcwzvQMzRF6iX9whO5v0YsZmE1nj6ZcpWw7tGMZeksZGNyaaG0Ntr2Mth7UQhPDatYSs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Harry Ramsey <Harry.Ramsey@arm.com>
Subject: Re: [PATCH v2 1/3] arm/mpu: Implement setup_mm for MPU systems
Thread-Topic: [PATCH v2 1/3] arm/mpu: Implement setup_mm for MPU systems
Thread-Index: AQHcU9GZpx9Ewja+9EW1e1HUZJtzELTvMOuAgAAD+oA=
Date: Wed, 12 Nov 2025 16:06:43 +0000
Message-ID: <EF7146C1-4351-49F1-A0A2-9BAE0EEFB888@arm.com>
References: <20251111101601.4171120-1-harry.ramsey@arm.com>
 <20251111101601.4171120-2-harry.ramsey@arm.com>
 <80c02055-2687-4e24-8de0-8fb4dfe2af02@amd.com>
 <fe082ad9-ee55-46bd-8b93-5320649e6aca@arm.com>
In-Reply-To: <fe082ad9-ee55-46bd-8b93-5320649e6aca@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DU4PR08MB11790:EE_|DU6PEPF0000A7E3:EE_|MRWPR08MB11806:EE_
X-MS-Office365-Filtering-Correlation-Id: ae69e009-f1e8-4057-e6df-08de22058c42
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?bk5wTWhJOUYybisxa3kwcjkxQklCTW1LQzNhdHVkSnFoY0xtVXBCbnV4VHN3?=
 =?utf-8?B?SG5LNDMvU3BzVUtucTM1NmxheFdRTS9sVHZ5bVd3ZU00cEcra2NTRXFHQzRN?=
 =?utf-8?B?ZlorencxdGR6dm94NytyYUdWS2I4UGFMdy8xYlQzVEs4M243aWJxRHc1eUda?=
 =?utf-8?B?dXNIWENGVERsL3hnVHU3S3VUYjdQS2dxV1poVW1JNXQyZTYwVE9ENHQweU1E?=
 =?utf-8?B?NVNKOUM4emU0M1c5ajh1MjZUN1E2Rk04eWxhYkQvN3prVDBZdjR1T2xaWDRD?=
 =?utf-8?B?cUFIdXczcmk2QUNjbEEvT1ltWW1RQmw3L2lHWUlUSU9EL25oSmduRlEwWGtQ?=
 =?utf-8?B?eTRyY1ZKUStlcTFNcDJML0RndjcvQXR4d2FvcUhQbjIzNWYvR01oejVtamph?=
 =?utf-8?B?TXJOTXFuaTQvRWZwVm1hM0lobGNVckF5TDIreGRwNUVmaWV2dmYyQWFwOU1K?=
 =?utf-8?B?K1E1dUdtd0tlcStjYmxXNDZaY0xaaUdJRG1UVTRTdEJsRTZQdzE1MnlObVNx?=
 =?utf-8?B?dlRsM3YxdFV2V1dVUmp0eDlUd1RqVkNOMERwaTc0QWR1M2VPUEI1UEN5Syt0?=
 =?utf-8?B?NWRQUUpjalRlZXdEeEV2L3BzR0hWa3pNbVY3M1lMM1JxVGNzdk5seTZ0VGxs?=
 =?utf-8?B?cDhDb2V1NHUwQWFmZHhya0tBcjlqc0FYU1IvQzdVMmZjRHlZUDY0VGQ3enV1?=
 =?utf-8?B?bllQZklCZHk3UUxFTVl1S1JqVzlqaFVVRVBLeEJxZ2ZZUWtHZDNuVXcxRHJh?=
 =?utf-8?B?WVdpbzI2aTlqWm8zV2JnSVdKM2tHV1hLcmxlS01VWlFXelZ1eFNiWTl5T0xj?=
 =?utf-8?B?QVJTd1dXb0RSZzkvNW5sQ2Mxd0RCaGRVTkZUSXBKK1VtelF6bnpYck1zRkZG?=
 =?utf-8?B?cXZwYjBaSUo1ZzRaRzRJN1BXbkM5Y0tmZklONjFRQ2hTalJKTXpvbDkrZ25n?=
 =?utf-8?B?ajZuN1E3Ung0Wk9yT3d2bmQrRVEvVUlsS29UZjRLVXNOYVQ3RnlTVjJBK1Zo?=
 =?utf-8?B?bjNYTkwrSFFvQ1kzci9YQVdyOFlXMlZqR3lvSldTY3dwRE52SGRveGRsOFRk?=
 =?utf-8?B?eVBLS2I3N0FTdnJ0cGJZOVJXTGIxbEFKUlZSUzhvaWVQRjROYUJadDVIY1o1?=
 =?utf-8?B?aEZRMG9RNG41dVNtVnZrdjBTRHREUXVFcXhvbEZzWWNySFJSU2s3ZVNraHdH?=
 =?utf-8?B?a3c1LytFeVJsSjV6eXFQWmFicTdSNWt1SGZuWDdOVHdqUTI5UzArb3dwQkFv?=
 =?utf-8?B?YjZiTjZiS0p3ajJRdEg3YVFWNlNBYjFtbjdibGhNOHhkWXZkMkhTRnd2UUt0?=
 =?utf-8?B?SU83bmlXOTJ4czliUEgwYVdNWTlQWTJURjRERDRVY01CcE8vWU9FMDl6RnZR?=
 =?utf-8?B?QVpMT25nOTFJZEZsMlRMMmVlRjRxbCtDeWo4NDJka3ZPZGFVL0U2cUZFRjUy?=
 =?utf-8?B?QnVoRk5DaHMrN2Jjb3BFcXh3TElqYSsvZzNHRlNkL0JIUXd0T3FvMUdVcy9r?=
 =?utf-8?B?cFE3cWt4bytYZ05RbmlNbU84d1pNWGY5V2psa01DUHdpUmpvcnAybjV4N0pq?=
 =?utf-8?B?VTJENFRoWFJjdm56cWZnelMzZmZtc1ZmWDBoYklxazZHcWNXRGhaUjMxQ21t?=
 =?utf-8?B?b3M0SFFPMWtHL2pwaUd4b1gxTTRWZllHNjRmOXBXSGtQOC9BcjBGam0vVHVk?=
 =?utf-8?B?WkxGbE9KNHZkVVFaL2JLd0JwRUpIemJJODZEU01jSVZmaURsekY4TzJmQzJG?=
 =?utf-8?B?OTR2aWh2QnpHQjJuUlhYRm0zaXpXV0R1T3poQk53S0xtcDdPb0o4Y2VWMXFL?=
 =?utf-8?B?SkppNFlGWDk2MmU2dzVJZGx2N0s2Q0wvbGwzcDN4TmxXSm0xRERKWWhaUU00?=
 =?utf-8?B?OTBFSkRFSUY5Qy9yVEh0Nk1sYU93TExCMUdOUTVaelZPRzVIZHJicEhGMVUw?=
 =?utf-8?B?RjFIZTRpb0VNRHg5Q01wcmF3MWZHM2lRalUzRmZ5MmlNVVZtdm9zNTJDbDlx?=
 =?utf-8?B?OGZhMHFUaWNYdjAxS0JYczRsNWw0a2RsUEtvcjYyT1BMd01Dc3BsZk02dFE4?=
 =?utf-8?Q?LgVSuC?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C1D246E90183364FAC68ADEF83DF384F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11790
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	32c9c507-6150-433d-6e23-08de2205794d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|376014|36860700013|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVpsWUpUU2xxMHgvL0FEMDlHSDQ3aUdCdldoNGsxd29lR1hvNUhUTkNWTGFh?=
 =?utf-8?B?SEttMTVsOHdVTHc1b3B1MW5JSU4xT0dQblBWQTdKZW04YlUwMlVsemZEd2xn?=
 =?utf-8?B?cVp6ZTNkcVBkUGswaXdUeXA2ai9EdWFmTHhjaFlwVnlVeVAxK21lVHZTL3Rk?=
 =?utf-8?B?RmpMMmliL1MzSzgybEUvR3k5MEZmTzhDWUNadDZyQWZUM2syUUxoUzB0SHpP?=
 =?utf-8?B?czZTK3ZSdFZOQ3JJaG55RC9ETmswS09QRUVKQWFvWlNqMElkQlk3OUFDU3JR?=
 =?utf-8?B?a2dTUjlJcE4xWGp0WnduS3J4MFpReU9JbjZlNXM5QzVJaFBrSWtJWDd3WGtF?=
 =?utf-8?B?WXBqWWl0cGJ0SVBMSmhFU3JWa09xb1FLR2tlM3YvNFZRT0s1cGJDY2tlNWtN?=
 =?utf-8?B?RytVRDVtb0RJUUVKVjJwOXlhOENiUXpvUmN0MmhoQk52UjMxZTV2Rmk4aTIr?=
 =?utf-8?B?Y01IWWNSaE5RZjI5SHo2VStOQnNUYnRRbkRHQUZ4ay9PZFRTVFhWckV3dGFq?=
 =?utf-8?B?Z1pOeFErMFdDZnQ2bmIyWUtRL2xBRkpWOHlabHI0eTI4UXZtbnNLU0k0Umhr?=
 =?utf-8?B?TklPMVNlb2Y1UGVwZTBaYWttdjdrazlrb1hGYURBMGZJZG9VdWhYeWxHRldo?=
 =?utf-8?B?Y3NSMS9SZHlHOVlpcXNRVEVPZkJjN0I2MEtNMmtRcDV4U1dqVUEyMWJJS0Mw?=
 =?utf-8?B?MCthYVZuSktpOHpKNFhUSGM3REdXK0JDczhLd1l2RUJiczltNTJONDVuOXUr?=
 =?utf-8?B?WE5CZFRZaTVVb2F1bXVwb2pUNngzZU9GTnova1M4TEtBVmtDUDdNc2tOL3VJ?=
 =?utf-8?B?aktrQlJpVFhXd1k1ZUc2akVxOWd0RWxrSWxhZGpiNkZoZmFzSWFZeVc2U2FS?=
 =?utf-8?B?UXpaNnBCajBrTGVJYU42NU9wRnI5a3h3Uk9KNDNGYmFyY3lGeUdMMUpjUWIr?=
 =?utf-8?B?dnU3b2djZDVKdjRIUHptRUd3aUhiQmtxMkI3aGUxYlJEM1gzZlppa0RQL2xZ?=
 =?utf-8?B?cUxKa0dtYVIzQkZKV1JsZVpjWVhQUk9Wd3luU1hWQm1HTWpRNGhkSTNHdjA2?=
 =?utf-8?B?N0FZNEVyS3FIZmlERGpwb3AyVWMzcUZFVzJkZ1krdkpTT01HRHJiNTJZeTYy?=
 =?utf-8?B?ektNUzJFSER1YmpwNGN5WnFTaWZPMnA0eWl0cGJvR1A1M0xIQlZHK2FVaXFw?=
 =?utf-8?B?VXg0K2dpV2RvTXpoQ1FUQWdUQUs0SVFSVHFKWEpvQ3l0YTA5b0hiZGVnbUdG?=
 =?utf-8?B?V3dpUnNFUWdoZDdXSXdMVE9qbTk2VTRrNU1OaWJGS2duTktsQ3cya2hyK0cz?=
 =?utf-8?B?MWFmVk5Bb2RKOE4rcGtJV2JQVTdzbmdBbW5BbFJxbkFXTWF0YmtCd2VZcXB6?=
 =?utf-8?B?TXdzVWhMYkVaMG9nRndNbG5QOXJIOUs2REY3enRZZXFPMmZCbEFKeTg3bmlE?=
 =?utf-8?B?VDZ5U2wvMDZaSnRidzF0NDRzRkxoT252T3QrcVJrRTgyZTVNbjBaRnFwYnhT?=
 =?utf-8?B?TElpTGdNYjlYNHdCQ204b2lndmVJc1Y1blhQSGc4bUsrR3hUNkRSOTNZUkZL?=
 =?utf-8?B?ZTJ4MUp0Nm0rcWRZaCtydlUzd3dPcXM2cW5TWFpYN1JXYVBTQytabGlBUUlw?=
 =?utf-8?B?czRYelpmeStyeVlCMXhRQi80dW5iUzI3dkkwSGpNRGFkMFJoV3g3VGxNcWZT?=
 =?utf-8?B?R0NIaTloK0NaU09wMG1TdDd5OXUzVzcwY3V6YzdFK2xiajM3RTlMaVhsOXVn?=
 =?utf-8?B?RmlJYXZxRDhycjBROG1yQXNYRVM4N3cxeU1GWjNZQmZVSFBrcHJnamRScWJS?=
 =?utf-8?B?amUyYVpXV0NGUC9FM0FqT3lpb2FBRHVTbVJvVDRqOWdBeUhtdTB5blhTR3po?=
 =?utf-8?B?ZFR1Z0NZYjJWVTdyWUgrdVc1Mko4Yzc2alIvaW9ZaWIvU0R6aVZNaHVGUThK?=
 =?utf-8?B?NWxRSWEvdHorTmtGRXB2aGoxRWdiZGI0Q0RMaTRTSjBDWnRKWFFhRGZlL05F?=
 =?utf-8?B?dTNPWVhHQzlsWTA5bVhJVFg4QUt3bnFRZGZTRm42ODJSZ3cxSGtrckVpcTE3?=
 =?utf-8?B?SWc4VzdhNXVnNkZTdTB0Wm9kUk9IODNtZ3ZpNDFWY08reVJBZ2Q3WHRicEVp?=
 =?utf-8?Q?qPnU=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(376014)(36860700013)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 16:07:15.5493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae69e009-f1e8-4057-e6df-08de22058c42
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11806

SGkgTWljaGFsLA0KDQo+Pj4gK3ZvaWQgX19pbml0IHNldHVwX21tKHZvaWQpDQo+Pj4gK3sNCj4+
PiArICAgIGNvbnN0IHN0cnVjdCBtZW1iYW5rcyAqYmFua3MgPSBib290aW5mb19nZXRfbWVtKCk7
DQo+Pj4gKyAgICBwYWRkcl90IHJhbV9zdGFydCA9IElOVkFMSURfUEFERFI7DQo+Pj4gKyAgICBw
YWRkcl90IHJhbV9lbmQgPSAwOw0KPj4+ICsgICAgcGFkZHJfdCByYW1fc2l6ZSA9IDA7DQo+Pj4g
KyAgICB1bnNpZ25lZCBpbnQgaTsNCj4+PiArDQo+Pj4gKyAgICBpbml0X3BkeCgpOw0KPj4+ICsN
Cj4+PiArICAgIGZvciAoIGkgPSAwOyBpIDwgYmFua3MtPm5yX2JhbmtzOyBpKysgKQ0KPj4+ICsg
ICAgew0KPj4+ICsgICAgICAgIGNvbnN0IHN0cnVjdCBtZW1iYW5rICpiYW5rID0gJmJhbmtzLT5i
YW5rW2ldOw0KPj4+ICsgICAgICAgIHBhZGRyX3QgYmFua19lbmQgPSBiYW5rLT5zdGFydCArIGJh
bmstPnNpemU7DQo+Pj4gKw0KPj4+ICsgICAgICAgIHJhbV9zaXplID0gcmFtX3NpemUgKyBiYW5r
LT5zaXplOw0KPj4+ICsgICAgICAgIHJhbV9zdGFydCA9IG1pbihyYW1fc3RhcnQsIGJhbmstPnN0
YXJ0KTsNCj4+PiArICAgICAgICByYW1fZW5kID0gbWF4KHJhbV9lbmQsIGJhbmtfZW5kKTsNCj4+
PiArICAgIH0NCj4+PiArDQo+Pj4gKyAgICB0b3RhbF9wYWdlcyA9IHJhbV9zaXplID4+IFBBR0Vf
U0hJRlQ7DQo+Pj4gKw0KPj4+ICsgICAgLyoNCj4+PiArICAgICAqIE9uIE1NVSBzeXN0ZW1zIHdl
IG5lZWQgc29tZSBtZW1vcnkgdG8gYWxsb2NhdGUgdGhlIHBhZ2UtdGFibGVzIHVzZWQgZm9yDQo+
Pj4gKyAgICAgKiB0aGUgZGlyZWN0bWFwIG1hcHBpbmdzLiAgQnV0IHNvbWUgcmVnaW9ucyBtYXkg
Y29udGFpbiBtZW1vcnkgYWxyZWFkeQ0KPj4+ICsgICAgICogYWxsb2NhdGVkIGZvciBvdGhlciB1
c2VzIChlLmcuIG1vZHVsZXMsIHJlc2VydmVkLW1lbW9yeS4uLikuDQo+Pj4gKyAgICAgKg0KPj4+
ICsgICAgICogT24gTVBVIHN5c3RlbXMgd2UgbmVlZCB0byBwcmUtcmVzZXJ2ZSByZWdpb25zIHRo
YXQgd2VyZSBhbGxvY2F0ZWQgZm9yDQo+Pj4gKyAgICAgKiBvdGhlciB1c2VzIChlLmcuIG1vZHVs
ZXMsIHJlc2VydmVkLW1lbW9yeS4uLikuDQo+PiBJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHRo
aXMgcGFydCBvZiB0aGUgY29tbWVudCB3aXRoIHJlZ2FyZHMgdG8NCj4+IHBvcHVsYXRlX2Jvb3Rf
YWxsb2NhdG9yKCkuIENvdWxkIHlvdSBwbGVhc2UgZXhwbGFpbj8NCg0KTWF5YmUgaGVyZSB3ZSBz
aG91bGQganVzdCB3cml0ZSB0aGF0IG9uIE1QVSBzeXN0ZW0gd2UgYXJlIHBvcHVsYXRpbmcgdGhl
IGJvb3QgYWxsb2NhdG9yIHdpdGggdGhlDQpzdGF0aWMgaGVhcCByZWdpb24sIHNpbmNlIHN0YXRp
YyBoZWFwIGlzIG1hbmRhdG9yeSBmb3IgTVBVLg0KDQpXaGF0IGRvIHlvdSB0aGluaz8NCg0KZS5n
Lg0KDQovKg0KICogT24gTU1VIHN5c3RlbeKApg0KICogW+KApl0NCiAqIA0KICogT24gTVBVIHN5
c3RlbSB3ZSBuZWVkIHRvIHBvcHVsYXRlIHRoZSBib290IGFsbG9jYXRvciB3aXRoIHRoZSBzdGF0
aWMgaGVhcCByZWdpb24sIG9uIHN1Y2ggc3lzdGVtcw0KICogdGhlIHN0YXRpYyBoZWFwIGZlYXR1
cmUgaXMgbWFuZGF0b3J5Lg0KICoNCg0KQ2hlZXJzLA0KTHVjYQ==

