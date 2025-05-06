Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5144AAAC707
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 15:54:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977304.1364335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCIkQ-0006li-3x; Tue, 06 May 2025 13:54:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977304.1364335; Tue, 06 May 2025 13:54:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCIkQ-0006jQ-0n; Tue, 06 May 2025 13:54:14 +0000
Received: by outflank-mailman (input) for mailman id 977304;
 Tue, 06 May 2025 13:54:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+p1E=XW=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uCIkO-0006jK-Np
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 13:54:12 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20609.outbound.protection.outlook.com
 [2a01:111:f403:2608::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 961a1979-2a81-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 15:54:10 +0200 (CEST)
Received: from DUZPR01CA0263.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::11) by PA4PR08MB6317.eurprd08.prod.outlook.com
 (2603:10a6:102:ec::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 13:54:07 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:4b9:cafe::13) by DUZPR01CA0263.outlook.office365.com
 (2603:10a6:10:4b9::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Tue,
 6 May 2025 13:54:19 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Tue, 6 May 2025 13:54:05 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 PAWPR08MB10041.eurprd08.prod.outlook.com (2603:10a6:102:34f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 13:53:33 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 13:53:33 +0000
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
X-Inumbo-ID: 961a1979-2a81-11f0-9ffb-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GIIvulSqGVjfN0Mpi3khqe7M9wZFDyZGOdkxuhkFp1mqQ6Yy3jyxR0Aw1aNKXbVPxCpdaD8Ry0a5T/2wlALDCTHQYPbtDI1H4xlAFmkIIHlYX3BGVqG7yVILn3676jpLQdMew/l0gh7SQk25pVGwjxdwKWn+j5B2rQhbUlqAYdpcVru1JV2OaI/2NVZ3Sn7v1r0kzLnTlIx5fgyjfSV774qJkR1zpWJeat7ecwhTaiDiSWw5dn1TmfFaWIKu5BHb88UzdqdK/KS4ZxMS/TGgJHITO/6lKK7ZEGmbcYvsf07gtYNjFZLnC0p49yvG1yx2Q0H1heSsK7x/zuHS90iVKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axEw20NFGkMJnYlA17fJsOAa6P2He4Wmbs7PedWK16Y=;
 b=kHhFKYdr07KA8S3DElD6ZSMNvll+8Ay6IWwNrvcoik3qUFi6bOSWJ3//bexoV0vw+fKihY6jhq0jyeNbMaAMJ37M/Kkmff50d6YvOLGGykt/LlAbhY5vXkbTukP59Qfom07Nv1LLAjY0Tw8VfGP5gQkpy7lrLim92Hip+8Iv4dmFIZqPm+zvMMiNp1t0c0gn6AA/Pzg3t+FO7jUaNkQ75bpnag4DrtXTYQmLFOLcefH3ouMdm/7igmveSw5J3/I916P460E+feD4wJmPVhZuL7FsApw9ctaHliD2fM0Kx+NYtdh+iI5ML/x/BsAyXFeg0ac3IIBYmN9QU97cf0qw6g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axEw20NFGkMJnYlA17fJsOAa6P2He4Wmbs7PedWK16Y=;
 b=eKoO6Pg+Vs+VxW33eamL/xgcpibFOEx2Sl7bxXNx6wJoxC3DiD84HCBzwyQCNcmv8rceDFt3kqfMSWOpfT/yEWBUel8H90QeQWSuk/KctsB7eDn5WVUhwlwynlkhKYtX4MdG6V/qBdnbS79kaF4VhVpCNqG0Z1+8ldnazaqYO28=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yD+Wda3vIbQWlvTwfpOpeu1yPMAmXHpKwifGxWDGUqbETcGVTqg/cVCve1vMvkkJW7OYMOqI1ye674mpnu5ln+GwAOXlGhC/JFSgBS+EMT+/9uNOk8No7otsRpDMBYZLMM0lHnAn1TFabV2qtRLP6ZJKDXDs6SAWbZTDtXR9pPSGwZ9tdnzYMmLvpAhvfPvVJEzYxskykeu583ZxGTpWIiSxrlNVRjBk51Vmt81idjZvzYAHb/Vh98/Hhv3cEpr3/Oj9v845E6/s3v9lnw/MYuDpwbiG+FHmAfWwnbsrBHdfbLZ3tlSKeLjsob7mOY/wYGjGZCfqpF4YhG9opi3ERg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axEw20NFGkMJnYlA17fJsOAa6P2He4Wmbs7PedWK16Y=;
 b=SQ6Tnu/aG0iWLnSguvEO918+Be/TFZjopOGKNGtk4Za8QEaL5sTe/n1jpXxgSSnv2z+39IaMp9K7SoRqAIsY1oK3OT27gfLYgwIQeAP+7WKTOOIJ52OmZNqO6jOmR2JkJdgxfzQlaVSa2FPrAppEAu+zOlE3t0595FGAO3hK9hnTNbj6gDbDRc2Q0V6By2stmkaC0nf3wy4P7zut9ivc6cQmgq3Io+2Y5itM/ZkQp28275NECarNn/Ytvx6B1pfQrah+T8bbeFXsUNQwQZSNSpFPUzAO27ZQFy6L8wBnye9/aAtUdwHA+s8O9LI7mlMDMSD/F3Gjt2KTXRGcxp/gdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axEw20NFGkMJnYlA17fJsOAa6P2He4Wmbs7PedWK16Y=;
 b=eKoO6Pg+Vs+VxW33eamL/xgcpibFOEx2Sl7bxXNx6wJoxC3DiD84HCBzwyQCNcmv8rceDFt3kqfMSWOpfT/yEWBUel8H90QeQWSuk/KctsB7eDn5WVUhwlwynlkhKYtX4MdG6V/qBdnbS79kaF4VhVpCNqG0Z1+8ldnazaqYO28=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: "Orzel, Michal" <Michal.Orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 6/7] arm/mpu: Provide a constructor for pr_t type
Thread-Topic: [PATCH v4 6/7] arm/mpu: Provide a constructor for pr_t type
Thread-Index: AQHbuRpqbs0x64sbw06OBQfYV4WEtLPFavYAgAAvLYCAAA+6gIAAAEwA
Date: Tue, 6 May 2025 13:53:32 +0000
Message-ID: <F549E9AF-F59F-42E9-9E70-73A47ED6678D@arm.com>
References: <20250429152057.2380536-1-luca.fancellu@arm.com>
 <20250429152057.2380536-7-luca.fancellu@arm.com>
 <42eab292-f9f6-4bc1-a011-c657544ebaf5@amd.com>
 <23A4DA59-A279-45ED-B81C-3EEE72B79DE8@arm.com>
 <02fde9e1-7833-4b22-ae56-e42687c1c26a@xen.org>
In-Reply-To: <02fde9e1-7833-4b22-ae56-e42687c1c26a@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|PAWPR08MB10041:EE_|DB1PEPF000509FC:EE_|PA4PR08MB6317:EE_
X-MS-Office365-Filtering-Correlation-Id: c6eb01e6-9012-4ecd-5aac-08dd8ca57731
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TkFYb0NuR3dxTXZjZ1g0bGtTZlo2aHNMWVBtalN4VlpSbjJsWndSVENueDIx?=
 =?utf-8?B?eGpOOHF2K1hRMDhoUEZhb2VZYzA1bDZmOUFaWk1jNnNWQlBwVlJoaFY4Mm4r?=
 =?utf-8?B?MjdoWU5WRndEVzBhTGVLK0NxWXBQVzVtZWhOK3BlaElseHBoTDBWaWRsS1BT?=
 =?utf-8?B?UWU1MGJOTHNlMDZPaTBudVRSWXNOQU00RDBScGJqUDJoOHphUWJiR3NiL1I3?=
 =?utf-8?B?bHJPSytTOVJYa0dJR21VMlRmeWVERm9nM0R1R0JnOGdvS3BWTHVOb2txci9p?=
 =?utf-8?B?YkhuRzU4RkZwQUV2aDREZ2NaQitocnJLK3A2SVZvT3psS2orMlp6TW5jV2tT?=
 =?utf-8?B?ZnFFaGRGNHZOWGFNaDdIUXp5MXN2T2ZPSXd3NUZ6dERlR0ZMS0V5VXo5ZlVM?=
 =?utf-8?B?ZGk4WjNBTGEzcHluMExRMkp3RENzcWE5Y1I0ZEV0NFBSU3hJdmNtR0ZqMjJt?=
 =?utf-8?B?ayszS0tJNm5KUUpGNXluSDBYTHFDTmtsTHN5dm83NnFPMHZqQ3lFTnErTEg0?=
 =?utf-8?B?Q2p5bDF0ZmRUNXIrYUl1dTh0T25HRTRxcHFrazE5K3JlZFpsMmM4cVJWNXFx?=
 =?utf-8?B?MUNtbE1wRmdDaHFibzAzbEFjWDBwUEc2MklnOFdmYnFEeUxEa01na1VnSG1m?=
 =?utf-8?B?UmV6THJsaDRTR201SmlSMXZTelJ2bWdMZkdjcDRlM3pOYVZxV0NCUlhrZGpz?=
 =?utf-8?B?Y2VTZmxNMjkyM002NXlQQ01UWFFnclk0a09nRGpUZ3k2UTdvTGxxUURjeDVw?=
 =?utf-8?B?UzRxK2dqQWx0TFN3VE5CUlhsZXNoaFYzU3JCd2JYRll4YVl3VTVrSzFOOEVu?=
 =?utf-8?B?Wmx6cjZkUk92UHcxVkJEMGFBaXR6WFZNTytENmtBelZpVWdjN3RqbW1jZFdG?=
 =?utf-8?B?b1I0cjVyRnVaVTJ3M0txZE5EUDBBU0UwcU41akxRcEpkSjdvV1Rvd24wZS9s?=
 =?utf-8?B?K3lOelJOQmZnTlhxSS9UcGdxR1ZId3dWK0tlUGtIU3dvNmJRMjh1QnV0VG4w?=
 =?utf-8?B?WGlHNUR2YnhOSHlIV3NWZDdaQWljL2syUzAzb2pxRWM5T1ArdXQwRExKUXBj?=
 =?utf-8?B?ZzkzVHJZLzNFMTJJZ3pUeDM0UVVyOWZWRjBWWjRXelhHa0ZtdTJqaFdtZGpS?=
 =?utf-8?B?dnBXZmhjR3F3SGNQZFRSTTlwQ01UaWdJc2dNdG01UDFQODkva2o0MWJ4dFRR?=
 =?utf-8?B?eWZvSTNYYnltRUF4R3U3a1FnLzdoRVRQL2U1QmxYZW4xUFR3eXU3VmpVcHRY?=
 =?utf-8?B?b2Y2SjI3QmY0Tmd0MzRxczhwVW15Q1ZxSWl6Q3JLQVMzY1B5U0hnU2JVMW9w?=
 =?utf-8?B?USswMVo0WldUZFFTd2VuS3F1azR1WHpTZjY2Sk55NUdSMWlIcm4yOFRJeFNa?=
 =?utf-8?B?WU1nY0gwcytHU3BkSFluZ2JLSFAvdEFDT0dWMzk2aTVETldHQWRuWlBKZHph?=
 =?utf-8?B?VVlMTVVoTnR1a2JvdjkrRDVVVFJWMVAvMzBMRmtQaUlzTUpMTEc1VXVIbEE4?=
 =?utf-8?B?alBIZXRoL2FYY2cwL1BhdkZkeTYwazVkRTVORWt3QWt3a09XcjFYMmpCOEY3?=
 =?utf-8?B?TmtZTzNFY0l6SUNydittTzBORlRPM0V3a21yRUtGWUV5QVRTaXFTVGNVbGRz?=
 =?utf-8?B?cjBPVVdlMTRLdjJQTmN1RVBQZVdXZmxXNjFiZ0lzaFFnakxzTUNnNlNwNlph?=
 =?utf-8?B?cldrWm9FYlV0UHVpSmZKWWF3UWtlNm11WWpzeUNlbFBjSzdKY2oxK2VrZTh0?=
 =?utf-8?B?SUtyZG81YjNiVUtPQjhyS2I2WHE2YUNFc1VybGhWRUVzV2NPODI5OGNDeDhW?=
 =?utf-8?B?ZWlla05SN0dvUGVxaTVjRFk5eWFHWksxRG9sa1hzait2WGdDY214dXYycE41?=
 =?utf-8?B?cnhsKzhxdnZjbXF5endBaENibFhRaHY0ZkVwdlAxUzhxS0FaRHRuSWxoWFM0?=
 =?utf-8?B?aFNnR3pNZjZaeGYwb09qZzQ3YlptUzFPbVRUOGIzR3JheCtmc21zYVd0SkFO?=
 =?utf-8?Q?0pqOnzFmpn0MXiCteceCO3L3EMRTrM=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1503A74184D36347AEA9633580BAD9D7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10041
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6f9183f1-1e6a-435a-18d7-08dd8ca563ea
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|35042699022|36860700013|14060799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UHViQVFSU1RtOXR0RXJRY012WVo4MDZDNWVLcExyMDRpTXMvUkFNZ0hYWVkr?=
 =?utf-8?B?QmF2VThsU3lzdllzMU9hN2R3WTBOMTlTdTQ3a3VZTGRiVnhuNkxJdjZLSUtG?=
 =?utf-8?B?dmVkak51T3lWMFVSTHBBMWYzMjRDR2t0TDlrdnJCMVQyT2J6TldhdHVGVmQ4?=
 =?utf-8?B?eHdzSnFUQnVLTExZdk11bWxENHF5NWFhSURHWlZSUEJPSzZNbXVESnFFYXhH?=
 =?utf-8?B?OUc3TU84SWQ5eUVlUGMrWjdldzZxRFdIaHI5d2kveTJRa2RCVCtuMlo1MFQy?=
 =?utf-8?B?RW5qb0I5Y1VzVVFXaWR5TG5TVktXelpHZjZ1TXlJZEQvb3JzdDdVYVJtWVRO?=
 =?utf-8?B?Rm1jbEJ6ZFltRmpXRHMrWUhVdGQxRzNwQkpZZHViY0Zocml2TjJYWHpPRmRY?=
 =?utf-8?B?OTlSSlpUOHYwOVEybE1Tdi94WFFNWUpZc3lOenhjNVo0dm80ZWJ3c0RqQXpF?=
 =?utf-8?B?VFk3QkFMNnFXeEZGMXhGSzlmOHBFaFpXQXJnc0dPUlRwMWJENlFEOEFvYXoy?=
 =?utf-8?B?MGN0RXYxeEh6ZHIvYXhNbGxqbW5rN2U5V2EyT21RS3FVM2lKeXRKTXV6dXkr?=
 =?utf-8?B?bTBCWFZmOEN2VE5Ld1BZeCswNjNEeDBHdmNnc0lvZjNDdEMxN0NOVnlPWHJZ?=
 =?utf-8?B?RDhWemdGdHpWaWNTekFmaFZIQmFOSUxYMjBlMllKSnFHb3FFWjZ2YVZiNFpV?=
 =?utf-8?B?azlFWnZ2c2R2b0NDRTUyald6RWJwdmZhcDV3YmhRWTR0VGg1TlFTRTluQmVV?=
 =?utf-8?B?REtoWFZKZVpoOHBwTGxzRVA0RHdvV0ZKN2ZVSXdFaS8rWWZQSDVTUXVGN2pj?=
 =?utf-8?B?ZWN4OWQ3dnJSVUs5dHRxbE5HamxxRnZuY0p6ZUdlZkYyOEl4SXFpdXVNMUVV?=
 =?utf-8?B?Uk9JMXhwcVRzY2xVZzVBbkdpV3c2ZU9wcHVvcGxiKzFQUCtoaGJJT0RmQ3Uy?=
 =?utf-8?B?VlIxZDY1RGRyb29ES2RBWTNVN0N4Y295UjRBT1BvUVRzbmJVdFdIdjU3SGxm?=
 =?utf-8?B?OUNrSW8yVVVxL3JYbXFJbDF0bHdmYW8xRjNvREp6b2NIME1EWHJvZXRUSGEv?=
 =?utf-8?B?RUNNNGNPdStMSzRaSFpSU240RzBxdWJ3Y3AxanhTcVFYNjZYb2lUR2ZmK2ps?=
 =?utf-8?B?SDhld0xTaEpFRmhuS3lyejhid3ZzQ1ZkQm1zajZGQ3EzeTgwZzcyN0krdllz?=
 =?utf-8?B?cUpHRW1obUxuOFE1WG1pdXExN21KRG1aRlErSkVBYTIxR05pWUNrZmc2eXpa?=
 =?utf-8?B?S2pGdEV2QW5lNE9HUmtIMjNuMlZUbGgyZldieGhZRGxIeWkzam5PRlc4Z0tZ?=
 =?utf-8?B?Z0F0RWhvVURPbXByb0R3TDFITXMrS2NDTXVqenpsbUNxUDNXMnA4bXFTd0lp?=
 =?utf-8?B?dko1Q3VyR2lRRERuN29DY2FUMHJBV3pMazROTnJrRGRlUm5FYktabDR3N0lq?=
 =?utf-8?B?b2pkWDBqNjhlN0ZRaUN2UVJwd0s1eGxtQVluL3VBZENiQU02dXdwbnhTNXlC?=
 =?utf-8?B?SmRZRjIvOCtHRjhVK0xnc05LSUQvd1dYcW5GeWw4WnFOZnFKWUNpT2ZDeDBt?=
 =?utf-8?B?aUNkeVlXOVI3eHE0N2NBUGtvcWE1UkMySkxsNGowRlp0eU5EbWJPK21YR0k2?=
 =?utf-8?B?WTZIelFuT05lVVIwSWNUcWEyRlUrMlJrRWxJbVM3OWZuOXJOZk9HbkVWRFNW?=
 =?utf-8?B?RGhudjNIcTlUcHVEYlZZSy9uZ3ZCRnhLaTlacFN1eWZlRkpyUkdNc3JnWkdS?=
 =?utf-8?B?eW1wT1dtajBkYkxLU1h5dHl4N0tzWEMyT0FnTC83TEhwK1BmL2dNNE1PNldi?=
 =?utf-8?B?SVdPTWorTFdPcHVBQkNtVFJDUzFZRGVFVVVzZU1mdWNFM1FCNyt1N2ZhNXN5?=
 =?utf-8?B?VGFyNFZ5MGlaVm9wRGZwSjdqWk1GbnNqTStUTlhiYk44UytwVWtta0w4Uld0?=
 =?utf-8?B?L2JEZXoyRXhRbzJJQk5kTzAyQmVCS2k1V2lqOVNDWXFyYUVGNDM0MVpPbnZo?=
 =?utf-8?B?bWNGeDZtRElaazgzMTEvOXg3RGw5TDJpZEN0RmF4QXJpVC9VOThCbmxSREdT?=
 =?utf-8?Q?Lnbx77?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(36860700013)(14060799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 13:54:05.2662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6eb01e6-9012-4ecd-5aac-08dd8ca57731
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6317

SGkgSnVsaWVuLA0KDQo+IE9uIDYgTWF5IDIwMjUsIGF0IDE0OjUxLCBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBPbiAwNi8wNS8yMDI1
IDEzOjU2LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+PiArLyoNCj4+Pj4gKyAqIENyZWF0ZXMg
YSBwcl90IHN0cnVjdHVyZSBkZXNjcmliaW5nIGEgcHJvdGVjdGlvbiByZWdpb24uDQo+Pj4+ICsg
Kg0KPj4+PiArICogQGJhc2U6IGJhc2UgYWRkcmVzcyBhcyBiYXNlIG9mIHRoZSBwcm90ZWN0aW9u
IHJlZ2lvbi4NCj4+Pj4gKyAqIEBsaW1pdDogZXhjbHVzaXZlIGFkZHJlc3MgYXMgbGltaXQgb2Yg
dGhlIHByb3RlY3Rpb24gcmVnaW9uLg0KPj4+PiArICogQGF0dHI6IGF0dHJpYnV0ZSBpbmRleCBm
b3IgdGhlIG1lbW9yeSB0eXBlLg0KPj4+PiArICogQHJldHVybjogcHJfdCBzdHJ1Y3R1cmUgZGVz
Y3JpYmluZyBhIHByb3RlY3Rpb24gcmVnaW9uLg0KPj4+PiArICovDQo+Pj4+ICtleHRlcm4gcHJf
dCBwcl9vZl94ZW5hZGRyKHBhZGRyX3QgYmFzZSwgcGFkZHJfdCBsaW1pdCwgdW5zaWduZWQgaW50
IGF0dHJfaWR4KTsNCj4+PiBoZXJlLiBQbGVhc2UgZG9uJ3QgdXNlIGV4dGVybiBpbiBwcm90b3R5
cGVzLiBJdCdzIG5vdCBuZWVkZWQuDQo+PiBJIHNlZSB3ZSBoYXZlIGEgbWl4ZWQgdXNhZ2Ugb2Yg
dGhpcyBpbiBhcmNoL2FybSBhbmQgaXTigJlzIG5vdCBkb2N1bWVudGVkIHRvIGRvIG90aGVyd2lz
ZQ0KPj4gaW4gdGhlIGNvZGUgc3R5bGUsIGluIHRoaXMgY2FzZSBJIHdvdWxkIHByZWZlciB0byBi
ZSBleHBsaWNpdCB1bmxlc3MgaXTigJlzIGEgc3Ryb25nIG9iamVjdGlvbiBvbiB5b3VyIHNpZGUs
DQo+PiBsZXQgbWUga25vdy4NCj4gDQo+IE9sZCBBcm0gY29kZSBpcyB1c2luZyAiZXh0ZXJuIi4g
QnV0IG5ldyBjb2RlIHNob3VsZCBhdm9pZCBpdCBmb3IgcHJvdG90eXBlcy4NCg0Kb2sgSSBzZWUs
IEnigJlsbCBkcm9wIGl0IHRoZW4uIA0KDQpDaGVlcnMsDQpMdWNhDQoNCg0K

