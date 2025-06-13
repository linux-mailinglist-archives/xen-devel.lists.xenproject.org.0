Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0DDAD861F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 10:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013931.1392118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ0Dt-0000SZ-NA; Fri, 13 Jun 2025 08:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013931.1392118; Fri, 13 Jun 2025 08:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ0Dt-0000QJ-Jv; Fri, 13 Jun 2025 08:57:17 +0000
Received: by outflank-mailman (input) for mailman id 1013931;
 Fri, 13 Jun 2025 08:57:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8fEO=Y4=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uQ0Ds-0000QD-8v
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 08:57:16 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060e.outbound.protection.outlook.com
 [2a01:111:f403:200a::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5eb3e8ca-4834-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 10:57:02 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SJ2PR12MB8977.namprd12.prod.outlook.com (2603:10b6:a03:539::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 08:57:09 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 08:57:09 +0000
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
X-Inumbo-ID: 5eb3e8ca-4834-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdHkdiM3JQvLiy4rEkUjrzQS/LtkuFyVApMcw1tvAZYuDzAIF5LLj11iVREPqxin0YNg31t9k6sn47O/anvUKLQGp03rLOq0YRzPRCFqp9qg6CGqt0x5RSxYuZ4EOn+SZNPorzkGm4awkLuzewr4ClXG3fjih2lEsK16JAi/FOOClvw8nAett+qkGWRiymWzNQ3QAXn9wfCiNreMd74cR505oeumpA5RWQzV8vX3JSUtIihwalnf+3VMakjraJBtgk/W71cjPCfGpP470AmYPdm0fgf+UD8JWfLE5+1hG5Wi9100se2XozKz5X+CMAp8hdtlnPav/DYqfhnSL6dalA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlSauoV2LjRS8KayhtQ7JOGxzqrkeuD5EDozn8s/AVw=;
 b=UGsJa62apOKQRkIMgih8jwl3BKhmSkjJteZ3DmP70LX24Y9Kg6okFXgYl3E0GcwkETjSDsrR7ih/m46YjKr6MEthDJ4v9gKuFBX2iOTNbcjuETzCmf44nETnPmLsOUvm8QycR/LHe/2AaU3PQIe04soyH47PvbmyVOfKZEnxKWM+qOCO8VYkCa3S5IeOoyWR2+uEb3mt6hqVYJjHkwo5ujiDMmTy2mB9PB+h/TMFpXBvE2ODNgu2WjrFaZZBM1oa2HMA1EF13Im+t0f1iWiMsyygVHNu8+FKsqW6k4rbmwArM9EhONmvDMhANgIi5WOWCHOEAo4dGONiRguwEnV+ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlSauoV2LjRS8KayhtQ7JOGxzqrkeuD5EDozn8s/AVw=;
 b=FVlFWBpSWc1WAi7HKIlGMmhmKqegWaecouQCM+kqijwbcmuk7CrufbFAqDCSCl53oMp9XG4p8eWsMxDL1T4KJasldVnPtUZoukxGRJgNb2SeZ1CgGsVXeKtbbOr+s1ucUwTEmIyWx8L9dscFlEifLc8z4HOIxPwV6h+GlWdFTL4=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>, Julien
 Grall <julien@xen.org>, "Stabellini, Stefano" <stefano.stabellini@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 20/20] xen/sysctl: wrap around sysctl hypercall
Thread-Topic: [PATCH v4 20/20] xen/sysctl: wrap around sysctl hypercall
Thread-Index: AQHbz7GB7JuzUuWzwkuFXAiKCBRn07P8fpKAgARiCjA=
Date: Fri, 13 Jun 2025 08:57:09 +0000
Message-ID:
 <DM4PR12MB8451FA91DB0D570352C796D0E177A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
 <20250528091708.390767-21-Penny.Zheng@amd.com>
 <a3e3945d-66c6-454d-a334-72f8154cab76@suse.com>
In-Reply-To: <a3e3945d-66c6-454d-a334-72f8154cab76@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-06-13T08:57:02.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SJ2PR12MB8977:EE_
x-ms-office365-filtering-correlation-id: 0429b226-5cb9-42ca-dfaf-08ddaa5847bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WktJMGNNQ0hGVjdOMnkyMm44bEM0b3BPYkt6WlBlMnd5ZGZKRWVwSEF0czFq?=
 =?utf-8?B?YU1ka014OFlyNlZTMFBKK05QSkJFVzRmd0Y1bmZXVStOU0JqQ3J5Ykt0MlJB?=
 =?utf-8?B?VVBxOVNXaHJOVUF3ampwNWgrcVNOd1FWb05zazYrWThpWHJqc0xUcURmNlox?=
 =?utf-8?B?aVl0bEFUeTR2OTBTcTY0bTZqbjVITEl3UHpSblQ1QW1qblNINVlqejQ3NHk2?=
 =?utf-8?B?THVBdVUzUFdhd1dHaEhSanU3WWJoWUhHOSt2K2pBMk94ckJIVG40RXh6amVq?=
 =?utf-8?B?OTBsaGc0WlBVanJEWXArY21tcnJObmh1aXNZN0Nhd3ZQWG1CWnI4bFJGdTR6?=
 =?utf-8?B?YkhRNk9qUUZ0bERrRXg0UFBUeFdTY252TXQwbUhOamRudFhtaEZ2NG1zbi8v?=
 =?utf-8?B?NFNsMUpQV2VGanNtVC9iTStlYXdCai9OZXc1L09USXgrb2Rpd2xBdHJ5Q1Bx?=
 =?utf-8?B?N2lFL3huMSszQlBhNDZvZCsrSmt5WFRtbEt4MXI3Q1V4TW5JcmF1QXdiblU4?=
 =?utf-8?B?RDRmOHhjdWo2ajM1cGp4SzlrNWhCR2orV0JuYjM2b0t4UGRPUWVMREpuTXps?=
 =?utf-8?B?R3ZHZWE2TUYxMmNHTTVKSU14RXNCcW1TUzN6YlRJandPWUhUdjNrZUdEMlpH?=
 =?utf-8?B?ajY3N0U1RlozQmpqc1VHQ2RuTjNyclZ3eDVQVU5obUd0dVVrellFbFZFLzVT?=
 =?utf-8?B?Zm14VHBWME5BTlZqaDdaVWo3R0hMeTZHUEwyVVhrNnliaW5TaDhnT1J4ODhw?=
 =?utf-8?B?NUsrV2lxRDFPayswODZVRUVDTFhFcFdDTVlvYXV6S1R5VVdyZEdjR1Y1b0Rv?=
 =?utf-8?B?SmkrVEY1dTZsZENUVnMxdS9jQWs0OUJicUhuS2xxVUJYSnlZT0IrdDdTWTE1?=
 =?utf-8?B?STFoUnJLeFMveXVkbFhiZGFzRWh5bUhqQUlqWmtFTmFTVCtDTWJaamh4REVH?=
 =?utf-8?B?RVZjbStsSzdZKzBoQWpncWhvbGVDNVI1YW10RXVGOEpSSkF3eU9DeHpsT1Nq?=
 =?utf-8?B?ZllEaXZweURHckF1WTdVRHhSdXd6YUtia09zVTlUSkgzcXBTMDdHU0VCYWJG?=
 =?utf-8?B?dHJvZDYzRmdJQ3c2ZzRaS28zOHdIM2NLWHNlQlgvSEY1QXlpTnpqcWJxSy9t?=
 =?utf-8?B?N0N6SUNFWkh4akpUZGVVNFFnUUgrcTVvNWNzby9ra3hDVmN3TnhZcVJDZ0Vl?=
 =?utf-8?B?TjVBOW9pQUNvQ0Q5aHVKaGZFRGljMnUzUDZRQ0tYVzIzdmpLMUQ2UlFlMmpD?=
 =?utf-8?B?ci8wcjhkWVV5RFYwRjMvMEJaZUNHa3E4V2xPdUlRTFNQY2JITVBNSVZrc3Zv?=
 =?utf-8?B?dWh3azczSWExN1RscU1Wejdud3JjcVJTR3FvWHlleEc0dDV4TGpWS0JNVUYy?=
 =?utf-8?B?VUV0ZEFwdGVMaXpmUUJLTUtzYlk5cW9EYUFyM0NEc0VUZEdETmxza2VDQms1?=
 =?utf-8?B?b2pUVmRPYXRjUEdWaHM4ZE51MU1nZ2hBaThteDlVUU5HaGFRWG4zbWpMU0V5?=
 =?utf-8?B?b3E2b0FWb00yTjVFYlBrV29PbmxpYi96dm5XbGcxdnhwMGovOXluZTgzdVR1?=
 =?utf-8?B?eUFBODJvL0VyTTljUUxFdklHc09HWlIxYWNzK2ZWZ05QRVRpcnNQZ1ZzVzhP?=
 =?utf-8?B?QitvVVRDWW12ek1MVjBNMHptRnh3SktDMTl5SGVjckV3YUZsVno4SVZqcW14?=
 =?utf-8?B?aFo4Mld5NTgzMDFOTWI5MXFQaTA0NFVmVUhBdXAwcnZZTFUrVGtodUl2WXZx?=
 =?utf-8?B?YlhycTRMQlJSNkpLemI0ZEpZZjBSQ1hEa1RlcnpVNDV4Yy9DRFNLTDEwZmdr?=
 =?utf-8?B?cXhEY1ZMcjVWMzhaeUdmUGl2ZTFCMGNoSUdxRWxIbk4zMUdmbVJCZ29GRFlB?=
 =?utf-8?B?WndIcVJnMFhrem5Od09QazNsRTloQ0R2bkZ2MFhZZUlsOWJybHh3enRJaExP?=
 =?utf-8?B?TXl3elhPUU55SVpCcmdyOHB0TUR4YkVGL01lRzNkYXlPUmQrYVJjQ3BUTEpO?=
 =?utf-8?Q?Twgcf3e1YhlIxbMoPYrN3uNKoWDT0w=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NVFtaEFhblQrQnZaSWJWSG9Jei9UVUtQMkl0a3h0c041R0pYUDZ5d3l2dWZr?=
 =?utf-8?B?Y05IT1BDQlhBazZrb1E5czB0TXBNY0xOY0RuandlWVVYamxGTkdIRDFnMG1H?=
 =?utf-8?B?Sm1ZZnFnS1dCVUV2eENyd3FzaXl5dkoxaEV6R0FLMHlZZk9oTy9VM2pBWXBP?=
 =?utf-8?B?UXRqVnp0U0ZkUkhCMUZmdFRYbjNpRjd0aUp1bTVzSWtKa0o5UXZCWkpDbGly?=
 =?utf-8?B?cVhPWU9acVNsZ0V0aXIwa0dTb2dBRnkvTG1JM2JtQUxwY09JSXVrRXJkNzlK?=
 =?utf-8?B?R2ozNVA0SkpjRU9VNWxJQnY5bEo0bXJYYlRjRlhuOW5SS2U0OUd1R3FXSUsz?=
 =?utf-8?B?eWlLdHltTVliRkIycm11TGFmSmZIaHBGdHhHZlJCemVXNHdWeDlBenlYdnR3?=
 =?utf-8?B?WDdoZ3dUQXVCaUM2THF5eTZiWG0wd0ZUN29tSmo0WnFpSklUeUU0anJaR2Vp?=
 =?utf-8?B?V25rdWRvcW5TZmRUVnFrcEJ1WkplM2lZTHNGUTRqSHBReGJtZjVmcTN5WUEz?=
 =?utf-8?B?N1ZSVnVjbVh6NjVEL1VLZkR4bm1tZFVjMnk4eUF4YjNzSlJjRTFVMWZVb2pU?=
 =?utf-8?B?dER4RTJxbEJtL25WMGtldlc0emFOMjM3ZmZsaG12UE00R1huV0R0TU9zUWEy?=
 =?utf-8?B?WkNsSC9kMWRJZHh6WFhyYTVTNzM3QmtSWFl1UTd4U2RBaEc5cDJhZFAvNDU2?=
 =?utf-8?B?cE5BZXpNTGlLTGlCbnczd2o1UGRhaXBzdWYyS0k1N1pRSTErc0NmZFJiU0JU?=
 =?utf-8?B?WE85T3VxRHpUWkZ2V3M2TEFReUJvZmtmTHJNSlc0d3F1b0ZWVkt3VWdvUWFY?=
 =?utf-8?B?eGg2cjQxVXBoRGplTXJva0dtMlN6R2M3VmdJVnBrbWVjQWVwRG5WRkhmRWtx?=
 =?utf-8?B?MGF6M21kSXVpckd3cjJ5L25uc00ybkE2N3VWVDEzOGRoRVFJekI5akxhc0V5?=
 =?utf-8?B?TlN0RWZ3VjZ2TS9SUnpzOEo1RjI3TzVOTzU0cFc4eEhxZGpLWEVFUUZ4c3lv?=
 =?utf-8?B?OVluSlowRjVJZjF4TU43SDV6NHNpN3AvMkJyeEhDTkg5R2hiQ0RnWnlnb1dO?=
 =?utf-8?B?S1Y5a1gveWtPWGNvYXlRTlk4bnllQy9acE5kREF4UjZIOGh6ZWYxTzR1UE5n?=
 =?utf-8?B?WE43VFdsa0JKMVRSaVZRbGZJQ3ZKVHNQYUlmeEVDcWVlQ2FialBtL0xZeHZU?=
 =?utf-8?B?cDVQWmF0d3lIdjVJUkdkaDE1NUUwem1rVzBVZG9mcitMeDg1ZjlKNjdmWExJ?=
 =?utf-8?B?RVl3aUpkRnp3Q3ErQncwcENFKzRrL29pN3lsQXpITm51TW9lQ0pULzB2SDZL?=
 =?utf-8?B?cllIVnF3YTJEWUxhL1l3RDRCcnd1UFRPRjlWVTNVZHJONGR5WEtZTGJ4NDl4?=
 =?utf-8?B?UnNaRjFndmxMVUNNVTBpMGwxRFdmVlYwRC91dml5bi9BeUc3UHUvY2VUUHdL?=
 =?utf-8?B?Wk50aEkrejFJNElTTjFoNGJmTGFxU0ptQld5aHlKSzkyb0ZmUzZtUjE0YkY1?=
 =?utf-8?B?SmhCbnZaZGhQZnRpUytzdDRJN2VDd0lubDZlcG9jcWozUWpaZ0hRUDI0UTJs?=
 =?utf-8?B?SzRsMG1wcWFieFFOSGZkenlVU2tKYlg3Mm1CUnJrellPN0RBbmRXNEM3MjhC?=
 =?utf-8?B?M2NtWTJTNjNVT1RQRnF4WTlKQUdsaFlXZ3Fsd1FHWTJMRTBJYnpHMHhkV1ZJ?=
 =?utf-8?B?WmlmdTVxeEZkbzk2SUlqUER3N1BlS1ByNm9YZGhiNm5mVWVFNGZteGdNMXE2?=
 =?utf-8?B?bnJqVDNwTktiYnBLcXV2TS8vSFZab3JPbFBFZkJhZ2k3VHFyUWEyWEpySUMy?=
 =?utf-8?B?cFhvNFZPcHl4YXBmVElvRlp1MmFleGlZMG5FU3Q4RzRRYTBBVklFR1h6SzA0?=
 =?utf-8?B?bjFSV1VuUUZNdno5QWJKUEN0WHBaZ2lRRG0vaFZUQlNtY2pqVkpCMjlGdld4?=
 =?utf-8?B?K21GU05WNDZ3K05sa1JVVldtSksreGRwemY5SUh0ZHFVeTdwS2h6WkRBSlFT?=
 =?utf-8?B?dUdERjFsQjlaQ0h4am5MTDZuSjFtY0ZLYnJHZmh6SDFUdC8ybThhRjh4MzlO?=
 =?utf-8?B?SWl2RmovRHZreFBZaUJCdERSUlU3eCtFTjlyZ3htdmplNmRCVFVRT0E4WS9P?=
 =?utf-8?Q?OAug=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0429b226-5cb9-42ca-dfaf-08ddaa5847bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2025 08:57:09.3349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +dUKpezUfg8MXdDBwsBlhttPxJ+3asq06YSrBlXx3SJGOIbIRv14JE63+Bx/udreTwE2oJ5by0F2qVO8AxQdzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8977

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bmUgMTAsIDIwMjUg
OTo1MyBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBDYzog
SHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPjsgUm9nZXINCj4gUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBBbnRo
b255IFBFUkFSRA0KPiA8YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47IE9yemVsLCBNaWNoYWwg
PE1pY2hhbC5PcnplbEBhbWQuY29tPjsgSnVsaWVuDQo+IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47
IFN0YWJlbGxpbmksIFN0ZWZhbm8gPHN0ZWZhbm8uc3RhYmVsbGluaUBhbWQuY29tPjsgU2VyZ2l5
DQo+IEtpYnJpayA8U2VyZ2l5X0tpYnJpa0BlcGFtLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDIwLzIwXSB4ZW4vc3lzY3RsOiB3
cmFwIGFyb3VuZCBzeXNjdGwgaHlwZXJjYWxsDQo+DQo+IE9uIDI4LjA1LjIwMjUgMTE6MTcsIFBl
bm55IFpoZW5nIHdyb3RlOg0KPiA+IEZyb206IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxp
bmlAa2VybmVsLm9yZz4NCj4gPg0KPiA+IFdyYXAgc3lzY3RsIGh5cGVyY2FsbCBkZWYgYW5kIHN5
c2N0bC5vIHdpdGggQ09ORklHX1NZU0NUTCwgYW5kIHNpbmNlDQo+ID4gUFZfU0hJTV9FWENMVVNJ
VkUgbmVlZHMgc29ydGluZyBpbiB0aGUgZnV0dXJlLCB3ZSBtb3ZlIHRoZW0gb3V0IG9mDQo+ID4g
UFZfU0hJTV9FWENMVVNJVkUgY29uZGl0aW9uIGF0IHRoZSBzYW1lIHRpbWUuDQo+ID4NCj4gPiBX
ZSBuZWVkIHRvIG1ha2UgU1lTQ1RMIHdpdGggcHJvbXB0IGJhY2sgYW5kIHN0YXRlIHVuc2V0dGlu
ZyBTWVNDVEwgaW4NCj4gPiBwdnNoaW1fZGVmY29uZmlnIHRvIGV4cGxpY2l0bHkgbWFrZSBpdCB1
bmF2YWlsYWJsZSBmb3IgUFYgc2hpbS4NCj4NCj4gSSdtIHN0cnVnZ2xpbmcgd2l0aCB0aGlzIHNl
bnRlbmNlLiBidXQgbmV2ZXJ0aGVsZXNzIGl0IHNlZW1zIHByZXR0eSBjbGVhciB0aGF0IHdoYXQN
Cj4gdGhlIGxhdHRlciBoYWxmIG9mIHRoZSBzZW50ZW5jZSBzYXlzIGlzIG5vdCB0aGUgZWZmZWN0
IG9mIC4uLg0KDQpIb3cgYWJvdXQg4oCcDQpXZSBzaGFsbCBhZGQgIiNDT05GSUdfU1lTQ1RMIGlz
IG5vdCBzZXQiIGluIHB2c2hpbV9kZWZjb25maWcgdG8gYXQgbGVhc3QgcHJvdmlkZQ0KY29ycmVj
dCBwcmVzZXQgZm9yIFBWIHNoaW0NCiINCg0KPg0KPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jb25m
aWdzL3B2c2hpbV9kZWZjb25maWcNCj4gPiArKysgYi94ZW4vYXJjaC94ODYvY29uZmlncy9wdnNo
aW1fZGVmY29uZmlnDQo+ID4gQEAgLTMxLDMgKzMxLDQgQEAgQ09ORklHX0VYUEVSVD15DQo+ID4g
ICMgSFlQRVJWX0hZUEVSVl9HVUVTVCBpcyBub3Qgc2V0DQo+ID4gICMgQ09ORklHX0hWTSBpcyBu
b3Qgc2V0DQo+ID4gICMgQ09ORklHX1ZHQSBpcyBub3Qgc2V0DQo+ID4gKyMgQ09ORklHX1NZU0NU
TCBpcyBub3Qgc2V0DQo+DQo+IC4uLiB0aGlzIGNoYW5nZS4gVGhlIG9wdGlvbiBpcyBzdGlsbCBn
b2luZyB0byBiZSBhdmFpbGFibGU7IGl0J3MganVzdCB0aGF0IHRoZSBwcmVzZXQgaXMgIm9mZiIN
Cj4gbm93Lg0KPg0KPiBKYW4NCg==

