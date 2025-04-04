Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA142A7B938
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 10:48:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937956.1338800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0cjD-0004kQ-Py; Fri, 04 Apr 2025 08:48:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937956.1338800; Fri, 04 Apr 2025 08:48:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0cjD-0004hr-N0; Fri, 04 Apr 2025 08:48:43 +0000
Received: by outflank-mailman (input) for mailman id 937956;
 Fri, 04 Apr 2025 08:48:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YWcl=WW=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u0cjB-0004hl-MU
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 08:48:41 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ab565a9-1131-11f0-9eaa-5ba50f476ded;
 Fri, 04 Apr 2025 10:48:39 +0200 (CEST)
Received: from DU2P250CA0015.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::20)
 by DU0PR08MB8322.eurprd08.prod.outlook.com (2603:10a6:10:40d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 4 Apr
 2025 08:48:34 +0000
Received: from DB1PEPF000509EC.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::cf) by DU2P250CA0015.outlook.office365.com
 (2603:10a6:10:231::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.26 via Frontend Transport; Fri,
 4 Apr 2025 08:48:34 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EC.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Fri, 4 Apr 2025 08:48:33 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 AS2PR08MB9101.eurprd08.prod.outlook.com (2603:10a6:20b:5fd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Fri, 4 Apr
 2025 08:47:58 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8583.041; Fri, 4 Apr 2025
 08:47:58 +0000
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
X-Inumbo-ID: 9ab565a9-1131-11f0-9eaa-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jkkeV+2ibPp9TdCJOVrDgGFZysf1fW7M/QFM73tGaM529auMRL+YwI4Y2VUIAHoWnkfEw+xQco19dOi/mN+l3MAZ7tG/Bt6XwHGVRrtoLddJoVdsxgLTjZ8sJAZTO/KA7csgsU9jX4RVx2gCt9jVj1+tIde1dQWrwGSrzRtJSsuR3txncW9ogAU2Ew9ejzwAn0ki91eNwbUJLiqn7MrZqY7HNoAXG0VeMrUyCmkZ3wFNhx17Ge5RwuU4AeLiwKFgavYAFQrWbs20+70yfw2LHEyW9miVzAqWaolIrL3sTkTaunYLEAOE6ZJoCzKjrHlklIyzQQlbrvc+sQzTILa12g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9DgsYlvnjv/AwiHinyPUoFGfa2bfYT7PouZ1r+EIFs=;
 b=KLkvb+3yKtxIJceCUBcukydyfvHhAGoQSyly5M2taRMxVGr1cU3vDeb1BWajWuslAHBbw+DoghFEcffh7kIWVc8fikaYBXqXlV1MCeZYLt7wFfivLPTAlVfS7j04eFYYHiGywhA86wFVXO83u3v5jnazyyZSsj9EYzpMKEt6DbcGQKiYh0KU+5GmScBTOF3V9K6yz8dVPQ9V1SzVDbaZ/zOc4wSfaLAq7yTz62oDXMheBq2KCJlKFbI0j586flzG1fPdxKCvTAJVVLZC2CN98WXgtPVOYUuelRkDeafSwzbjmxGgSyZlb51NpTlCQjuCY0PcB3LZX5Gn/5QzbG6e0w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9DgsYlvnjv/AwiHinyPUoFGfa2bfYT7PouZ1r+EIFs=;
 b=LcGmbKbtWzOIv4WR+kaGYgX6XG7E8pxIenqxj1QdHExS1M+QpYBm1z6zFOyfqSjFLxMyTpezbj/WJGiQ2f91EsdPTZeD5yPzmBfFs2I4VeR+1szwcR080j7LOu8UXVx8uBvMezx3l8lLhEGHXrsa+9NYLPDA38S4z6ZGKyDiX3Q=
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VYazvq73dnzhIGcK78jIN7O1pQECKGJc6mRQsoVAdRHB4uiTL8IufXFw9XgbZFvLpx45dGjD2Xi73iE0FSAklbqMWhHC0ntavybfxJUTqmNqJGrGjTVmmyoHh+ufCv2DsQwj3SLCzujGz7e+9KunQFWhZEoBwsxAZUsmclGp7xQWui1EPqlblke2r9d1xtVmmBLLUZA8eYAM40M6fu1r3f52mKzwE/6f10EuPicONf0ZGy6Rj/di20am9yY5CewBhURz03eF3APxn+Sw9oKxYUk/bR/+fuHps224/hAmSIkY5DcKGcgSt0WH2p1dRJVs0LwlFbDuulhxdDw2mCRuxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9DgsYlvnjv/AwiHinyPUoFGfa2bfYT7PouZ1r+EIFs=;
 b=Ngob0RluAYbitTy/0uALMj5ghFgBAiDcAX6Jv3Ah84dp1ekV6+O4Hs5ysi2vKGa0V9E0ZxxxW7XEOk/U7hs6K67Y/RajxkZp+AjiGnpVyypyVaQ2tvSML1NVZlASEfcVwDIZZiM3VPr1fCfVQz59kOYvzep++htn0q1gcnuTL3SVYHAANd7Sa0aCETEAtanSr/j80f04vPRWT3C0e5BJ5lK2Yq0Vyftr07KrczWf4AXLRlu2R9Jim9pazkX2c2IqdAVSPk81c4sSt+DuQZjfMfwiI1Nh5JT+6AYheFAX7+m97J2MeKNfXwaUrC6q3/0z2kG1G4tb8f6p7K08OCUBrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9DgsYlvnjv/AwiHinyPUoFGfa2bfYT7PouZ1r+EIFs=;
 b=LcGmbKbtWzOIv4WR+kaGYgX6XG7E8pxIenqxj1QdHExS1M+QpYBm1z6zFOyfqSjFLxMyTpezbj/WJGiQ2f91EsdPTZeD5yPzmBfFs2I4VeR+1szwcR080j7LOu8UXVx8uBvMezx3l8lLhEGHXrsa+9NYLPDA38S4z6ZGKyDiX3Q=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 0/3] Enable early bootup of Armv8-R AArch32 systems
Thread-Topic: [PATCH v4 0/3] Enable early bootup of Armv8-R AArch32 systems
Thread-Index: AQHbpLu5GfFGjlHeZU6shwRT92O93bOTMuuA
Date: Fri, 4 Apr 2025 08:47:58 +0000
Message-ID: <6E6B9795-B3AC-4BEA-88CA-091F4608652D@arm.com>
References: <20250403171241.975377-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20250403171241.975377-1-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|AS2PR08MB9101:EE_|DB1PEPF000509EC:EE_|DU0PR08MB8322:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f74e014-f321-4a02-8157-08dd73557b1e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?MGdPVGx4RWRwRGhISkxOaGE0OXFiZW5UL0piVHZTYmtJU3BpZmlxSmpyZFAr?=
 =?utf-8?B?NCtyTllOaCtaME91blVjbkFiVmVzcnhpY2xrSzZMUEYyZjhoVE4zQkNrNTBN?=
 =?utf-8?B?NlZlUjdQMWJwSFR4c1NFazc2a0RGeEIwaTJjMUJVbDNBdFV5aHhXOVRXd2lX?=
 =?utf-8?B?RW1ZWEpqVWpPMCtxNEc0YlZWY0QrOFhTMG5tcEdEMmdvdmFGSGN0eGhJQzVL?=
 =?utf-8?B?OVpxUWhvSDNuK2wrYjZXNThQbDB3NnF0OFljS2xtT0hyMUtQeTluTkM5YStp?=
 =?utf-8?B?WWV1WDB1RC9YZzduZk1xekZUWW9DTjdqNkdFdFYveG5MZXNSQUpJQzNmRWtk?=
 =?utf-8?B?d1hnNjJHRlVmVzFsVnRNTVBNWEJGOHRtY1RBUWEvSHNkZlp4Zit1amJrRlRE?=
 =?utf-8?B?VCt1Y0dNRlRrTFNqSFl4YjBqbTVXMUJ2VEpvdW82T1liOXdGb3EvdE9Hb05P?=
 =?utf-8?B?U1hOb05KZmFzVzRDOE8wallaUHJhRjBSYnFEUEtJUUdLUEJxbExYYTEwNmJL?=
 =?utf-8?B?K0pSb2dESnVHYzVCa1plSFJtdG90eDFFc0RMSzN1c0tvWVdzWnlOS3Rqa1lC?=
 =?utf-8?B?MWcrbEY0MklmVEdJdE1ITWY2T29DK1YrSEUvZVZ5cDl5WjZnSzV4ODFmbFBD?=
 =?utf-8?B?WWNaTUdqbU5Sc3VPMk1lR3p1blBDc0g4eVV3Z1lIOHRIejZwSG9lVHJGdXFF?=
 =?utf-8?B?VWd0MmpERUlrWmFGRXBLRks4cllDN29NWm0xYUlVVEEyU3U2aTIxSU5ybUY1?=
 =?utf-8?B?aStxcG9OZ1VpdGdzRStwRUhHTjE1d2hMYXBXQTY5M1hTZHJZYVFHWVlXbDgr?=
 =?utf-8?B?WnM4R3dGVXUwZlo4VWRDajJSc3N3dDF2c2hvSkhIRU1iVFp6NnNnU3pUY2hp?=
 =?utf-8?B?bW1DUDBwZ0FWNzUzN1R6T01WWTRQR2dCdzJCeTRtazNxejA0dDQ2MWhMRHgz?=
 =?utf-8?B?aEU5NHBsVWl6Zmo4VnBXQzlzWnRQdnk2d0FVbm9CelVweHpyTEJNc29PcHFs?=
 =?utf-8?B?Q3BxNWhPSllrOE5veDlhV1N2VjVsNlZLVWdndjFmRlRFQktpRXdUMHlFUmdp?=
 =?utf-8?B?cFp1UFZPM25ra1duTW1hRDVwQzV1MVFDS0VjNDdLdjlzOEtGM2MrOFREOVlj?=
 =?utf-8?B?VzZvZmM1QUVsMHV6ZmpkeUpYMERub2NGallnWFE4Zks1QWZMcytTSmhSWDdh?=
 =?utf-8?B?ci9ob3IycyswT1RIRHAzcGRpSzY3alFLRXgzU0YyekpGZERCQ2FHOC94SU8x?=
 =?utf-8?B?Y0tDQnRhSGMzUjVEMXBMcCtVQ2ZDaHBkZjZVM3ZFL01ScWNLVlRVTnQxenJV?=
 =?utf-8?B?dkRsZUJFS3NnL2NlOUtzVXNYa3NDb2w2YmwyakRLRnRPMTdvZDI3aVZTOTZT?=
 =?utf-8?B?ak5UR3JFUkcvUXF0QmFnMHRObkIwZjUrdi9rU3E0SU5wUmEwd3F2TjQxaXFP?=
 =?utf-8?B?Y2hEYWdJQ3FuQXMreEI5WGF5YmJPZHhiK001YlkxckwyL2FqekVPRkpiQnRL?=
 =?utf-8?B?WlJ1RW41b1FNSStCQUVqaGM0elZuK1pTaWJZamFidDFoaEYvd01rbUFnOHZy?=
 =?utf-8?B?RXdmcDFxVU42bU9CVS82b1B2T1M5bmR1T1NpU255N0thMytkMXRZYUpSS2FY?=
 =?utf-8?B?Q21FcFdlZWxvTnNsRC8zV1BqTThCWDkzYXJRNUlUUWpXWFYxUmdUckp5WEFv?=
 =?utf-8?B?QzczTE84TWNiRHhQTGt0Ymh6MlZlL3dvZHFYVVd6WDRGMjBSOFAzUVdMVG9x?=
 =?utf-8?B?Q1NJQ3ExcjFqeTJrRjBvV3hlVHR6VDFsTmhYUEsraUczdUxUSnYxTUI4S1Zu?=
 =?utf-8?B?dEJWcnhrUlh1S2o3VXBTS3UvVEpyZGw1RE1rSkJURk82MVJQbkhCSjduelVh?=
 =?utf-8?B?MWdmTHJIWHlqcDZPZlJFKzR3K0F2eGlncE5nV3FvMnF5bkJQRDYyTXJ0QkxY?=
 =?utf-8?Q?36KL/NedE2fffzgz7NihYoU0eb5tO3lK?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5A6B9FB233C9A468371667113363511@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9101
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	62190c69-9136-478f-536b-08dd73556651
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|14060799003|82310400026|35042699022|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MnE0SkowT0NONHAvekRSekZHajV1em5FcjJFSVVJS1BUWnJaeU9xbUtEWTIr?=
 =?utf-8?B?OGdaREFnNlNIRkU5Y1lueVNvbkE2SnFUU2hWV2UzU3JNUnBZVE5aMGtuN2hG?=
 =?utf-8?B?OTg1TFRFUnQ2TVZ2dER1SEtvOHVBajhEOGlVVk55U0pQckRvYmpzaUV3Wm41?=
 =?utf-8?B?NTdrS3ZKOHkxTk82TWp3anRtVklRaEQyTFZFSlU5QVRiVi9KZ0haTmxXOGpN?=
 =?utf-8?B?TGFKa0twdTFNZDdrQnkwOHVvVzZQRittSjhRdXFXRTBkdElwK3ZrTFZiZnZu?=
 =?utf-8?B?cG5OYVVMWGdBSW52cHgyRFc0ZlVENG1MSzlxYTZ1QVlzT0pyZGNha2RycTFT?=
 =?utf-8?B?S2wycmZKVXlRcFdvRVVzY2dCTmxtK0lTSnBmUmdmUEdldi9MWnNMcmNzTGlz?=
 =?utf-8?B?SXFIV255RS95SXBOZ3VHWjdOSzBpeG1YN0E5MndyWUVGaGxCbjI2cDVIVFl0?=
 =?utf-8?B?TEZUVXoxTk9hdlNsdllaT3dvUEZkbzNoNzFnalo4RlhjRm9YTktneTRYa1dP?=
 =?utf-8?B?d09jMWdmTHI5RVI2L2RXUERHVlhVZS9ndEdBS21zQmN5Q2xXZzJNRVU3OWNs?=
 =?utf-8?B?VkRHSmVoZ3BxTzN2QW5wRUlEV0cwamJ1SzN3dURYc2R5SXlBWllpdFk0QUZR?=
 =?utf-8?B?OGg4NWk1MW9iT09IQUp2N052ZjNCTUhRdVhMSlZ0d0lyVHV3VWxxNHA2WnNs?=
 =?utf-8?B?NDR0NHVJY3ZYb2MwdnF1SHFkS2M5S1FyNUtrTFovUW1YcERoL0xiYVR6YzM2?=
 =?utf-8?B?VCs3UUprUnNMN0lkdWFoRExBMzFJUVZ2VU5RQnlYT3RhVGFad0s2V1RWbGxW?=
 =?utf-8?B?SjBQeVhsdWxOem42Q3I0VXAzekd4VWRibS93U0JickZ0bWx5TzFzbmxUa1ht?=
 =?utf-8?B?R05zVTJQNllka3J4K3l2NEFBQmRnN2Y2dU1kaEw3bGVrd0VVbW1ZMEFraEcx?=
 =?utf-8?B?cWtkV1B3RTRxOXlqZW5iSDM4ZFhydjRiZTkvdEtENVpOZEdxMzZnaWlPb2Q2?=
 =?utf-8?B?Wmh5UVdKelJ3L1dXSGtDNzJGQWprdUVVNGs2cFduQklTd3gyNHUzc1l0Z1pU?=
 =?utf-8?B?aTRVRjQva0E1U2prWUdqK3VrZ1dCbVdyUkRZM2JZUStwSlFJMlN2MWIyR1FR?=
 =?utf-8?B?dUd1OTNtVG5WSTI5aVpyUllXL09NMlkzRmVxS0lVWGdUTjZmcXBjbjlGTGZj?=
 =?utf-8?B?bVd6Zi9qNGlLbEU1bVplWFFYZlViNCtzQlpPZWVveE56dEorUU8zamZ2VSt6?=
 =?utf-8?B?dWM4b04xR0lNZFk4NkJVMDZiTlRRc0YzdnBMSnVnMkkrcmIzaCtUYWFDQ1Y2?=
 =?utf-8?B?RmU2N1BxMFFneDFXcEFRdmorMGx5eG5VTUFDNlQ0SXN5NmNxU1JjZkw5a0NU?=
 =?utf-8?B?WTlrbWxkQ1poUHdLeDlzL041NndKUnFGSlk1UTVnekt6WTh6NVFSc3dmbHZW?=
 =?utf-8?B?L0NXUEUrVDBRbVM1UkZkdFhwcThidXZmZlJLRFRlK21DeVFPT2QzQkpTdEJ5?=
 =?utf-8?B?ekFqNzQwc045SVRhL0ladHBQWE4wUWNWalM1OHg4b2RJR0duNU5uSGlRMml0?=
 =?utf-8?B?Mm14N1BnNW96ZlV5VEhpN1gxdXd1bFNQV0Y5cm1VbTh4czJZR2RaV01KNm4y?=
 =?utf-8?B?d0p2YzZVQnlkOEM4WC9aVkFZeXBYNXcrTmpnajZONzg4MXUvVWMra0pMMm83?=
 =?utf-8?B?WHMzb0ViR3YrOVpwOGpnM09ZUlZzTDI2R0ZpREZUdjkwbWc4cnhjb2lpQ3M5?=
 =?utf-8?B?dFlwN0ZDSVMrV3pRRGYwYlR6QUM0bjMreGZIZFU2MzVia255MDd6NTQveFBP?=
 =?utf-8?B?SURraFRhdTczRE1QTFIzQ2s4NjJSVTlFRVJ0Qks1YVVxM1FzKzE1TDhyUWE4?=
 =?utf-8?B?RmZxVUxwWnNSbEplNTEzRjByTjJzNWppNGQxSXpVWTJQMTAweHA4SGFqTTJW?=
 =?utf-8?B?SXRlZjJQZWhiNTBYM1FkcGNhZHJUTjNwRlUyRDV0cEZoeVgxRDBrZVRWMVdz?=
 =?utf-8?Q?qP6H/nSL9iw0speg1pwYIOlX9yBuyo=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(14060799003)(82310400026)(35042699022)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 08:48:33.0552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f74e014-f321-4a02-8157-08dd73557b1e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8322

SGkgQXlhbiwNCg0KPiBPbiAzIEFwciAyMDI1LCBhdCAxODoxMiwgQXlhbiBLdW1hciBIYWxkZXIg
PGF5YW4ua3VtYXIuaGFsZGVyQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gRW5hYmxlIGVhcmx5IGJv
b3Rpbmcgb2YgQXJtdjgtUiBBQXJjaDMyIGJhc2VkIHN5c3RlbXMuDQo+IA0KPiBBeWFuIEt1bWFy
IEhhbGRlciAoMyk6DQo+ICB4ZW4vYXJtOiBNb3ZlIHNvbWUgb2YgdGhlIGZ1bmN0aW9ucyB0byBj
b21tb24gZmlsZQ0KPiAgeGVuL2FybTMyOiBDcmVhdGUgdGhlIHNhbWUgYm9vdC10aW1lIE1QVSBy
ZWdpb25zIGFzIGFybTY0DQo+ICB4ZW4vYXJtMzI6IG1wdTogU3R1YnMgdG8gYnVpbGQgTVBVIGZv
ciBhcm0zMg0KDQp0aGUgc2VyaWUgaXMgYnJlYWtpbmcgdGhlIGNvbXBpbGF0aW9uIG9mIEFybTY0
IE1QVToNCg0KW+KApl0NCnhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tcHUvY3ByZWdzLmg6Njog
ZXJyb3I6ICJSRUdJT05fVEVYVF9QUkJBUiIgcmVkZWZpbmVkIFstV2Vycm9yXQ0KICAgIDYgfCAj
ZGVmaW5lIFJFR0lPTl9URVhUX1BSQkFSICAgICAgIDB4MTggICAgLyogU0g9MTEgQVA9MTAgWE49
MCAqLw0KICAgICAgfCANClvigKZdDQoNCkNoZWVycywNCkx1Y2ENCg0KDQo=

