Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A068A9F931
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 21:05:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970988.1359500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Tn2-0007F0-KG; Mon, 28 Apr 2025 19:05:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970988.1359500; Mon, 28 Apr 2025 19:05:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Tn2-0007Cp-GD; Mon, 28 Apr 2025 19:05:16 +0000
Received: by outflank-mailman (input) for mailman id 970988;
 Mon, 28 Apr 2025 19:05:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ud9o=XO=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u9Tn0-0007Ci-F8
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 19:05:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20626.outbound.protection.outlook.com
 [2a01:111:f403:2612::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b58045ca-2463-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 21:05:11 +0200 (CEST)
Received: from AM9P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::17)
 by PAWPR08MB9066.eurprd08.prod.outlook.com (2603:10a6:102:342::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 19:05:07 +0000
Received: from AM4PEPF00027A67.eurprd04.prod.outlook.com
 (2603:10a6:20b:21d:cafe::5b) by AM9P192CA0012.outlook.office365.com
 (2603:10a6:20b:21d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Mon,
 28 Apr 2025 19:05:06 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A67.mail.protection.outlook.com (10.167.16.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.33
 via Frontend Transport; Mon, 28 Apr 2025 19:05:05 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 AS8PR08MB6040.eurprd08.prod.outlook.com (2603:10a6:20b:296::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.31; Mon, 28 Apr 2025 19:04:33 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 19:04:32 +0000
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
X-Inumbo-ID: b58045ca-2463-11f0-9ffb-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oo6Qvt7uxp8esTObambZxOUW0w/3KIhJFZq7sRFzzw/en2S2FLrBja8Hniw6n/F2qEZ4ahscW+2F3gIK4e6vIR0muT+VqjsH6pPfk5eUjHKAHahiHsi/gcisjvaA6MeJ5hS+CSqvBiZ2AU2TRV+j15LDYBqaNyrRxWKXGxsIW3pSkz+DgfjpkMdGSq9rabwZU5Xx+hMB6w3EXAhw6qu+qsKzJIgWjKeqtcGknqD2ZpiGTP4qXoICpxTRmCrmOziYm5jvLOCKM8HldwOpbef9lk21KqvMzti6z2Ob8uvU79HAhSDTxKR3iHlKRhBSomao0CONH8lA0oBcCoOTghpmlg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0Kc3cMjXD/rixMDFuiEt41JY/62/l+nRDhpR+MnBKU=;
 b=ELmiBs03166uLX6uDvWEygs287A4xTygs6a4LrpsYJWOxtso5zlP7vfyU6HQ0dsjhLdYCZ1xhRul+aEvYhJAtCJ6kxEI8USKp8vX6QNdDKPMqszPyd+1uwJAVS3FFQ09vIbbLzlFuoWk1brK30MvwDVr5qMfR6DLPs0+fnwq+MT4FBEenpMRzwQxOI2rqwjKp0IFKls6mVPIoUAW1+wvbIQqhA6Kpm+9CJ5wNX+ZVk2SWaI9XVnPfh+4mg7et5GKl5U+Y1ybba552lIquk1cIe546MaVyE3o4uDvxR4mazKbCd5bTZDoz9+o7Xkdx/rH7WXsimTnYRV++vPJ/UIRzA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0Kc3cMjXD/rixMDFuiEt41JY/62/l+nRDhpR+MnBKU=;
 b=E0bHzavYeC3nvQ8hHN0DGx/y5HUhvVOMdHKgOU1uVIpOTWOXVfRJgdA1ai4uVIjajMnVdbOpBMIJWBFX/1uqslnhJVbn6ECYib8yCLW0BxaVAqVpud83az3bbREWLFXrilJLrx0rIJmuKLNmp8dv3UugS6J+0yt+9g7jU/kjrqI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8WryDXDj/seW7PthhITvNNG43FGip+tLvvyoNTYjt4qqYNH02oo3+vjrxEaRT5xVi5VcbSoRibSfgS7N6ZkJXDKCyAlpMiG53qI0GD6/1C3Miu1qCiMLwD5ewqYinj5hMAQjVrzPXvrldxydbopVHBQF2Ww5KVhyQS8Hr8WnOK3X/XOIw4NfgqcFLouOmB1B8gHijttss0hZuzPUgWN6vXiax/kdDXVMdEgVfL5mD4YiZHWpLUV0AVR5zdyOc59Zc/p4e7GFd/e3VuKDwvhWfGUlMbmgvDfHDmi/2OqhH53s+d/KifaNCTWOcNTTft65aYSA95wbp7aTKEWEd6PJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0Kc3cMjXD/rixMDFuiEt41JY/62/l+nRDhpR+MnBKU=;
 b=tC5Y76DOnqqn9HgfROAeRiWGOUQXFONEsJvBIUwrpNr5OOVR2rkohq9Na9OkztkUaJqA9e/OPACXd02UAIwcQwo6dOCFzwh2IedAOOf8TcRhe4LEpXX3yJU1d6zbsNrqKXLvUtULSaqF7fyVkBCivjbu0C/Kx3qqWbbAPLK0UdtAgAhtEjf83b6ql7J1NtmKA5DMTNBti+4IQcsmTWHHyJUG24/OSFyQdDnWyKLOV6fDHiD431rUz721utL2olNw0yeZht2kChYzfG7a5t7Y42ulyrmxTq/rvmuov68y4l3zRGQcsh35J4bcjaBhp42JlhEUaowVjYVurSc24gojtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0Kc3cMjXD/rixMDFuiEt41JY/62/l+nRDhpR+MnBKU=;
 b=E0bHzavYeC3nvQ8hHN0DGx/y5HUhvVOMdHKgOU1uVIpOTWOXVfRJgdA1ai4uVIjajMnVdbOpBMIJWBFX/1uqslnhJVbn6ECYib8yCLW0BxaVAqVpud83az3bbREWLFXrilJLrx0rIJmuKLNmp8dv3UugS6J+0yt+9g7jU/kjrqI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1] xen/arm: AArch32-V8R: Add MPU register definitions
Thread-Topic: [PATCH v1] xen/arm: AArch32-V8R: Add MPU register definitions
Thread-Index: AQHbr7FEzJkzCX7IxEuG28e/+R7zurOo3KoAgAt3HYCABS1xgA==
Date: Mon, 28 Apr 2025 19:04:32 +0000
Message-ID: <2697BC06-8A78-42B4-9977-07907BBBDC3D@arm.com>
References: <20250417155511.1854081-1-ayan.kumar.halder@amd.com>
 <306e5414-1552-4605-86d6-b23b89d00bc9@xen.org>
 <cebb0020-531f-467c-bc81-54d2ba1aa8e0@amd.com>
In-Reply-To: <cebb0020-531f-467c-bc81-54d2ba1aa8e0@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|AS8PR08MB6040:EE_|AM4PEPF00027A67:EE_|PAWPR08MB9066:EE_
X-MS-Office365-Filtering-Correlation-Id: ff797cb6-e935-48a8-1a65-08dd8687962b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?UkxPaWlmRGV5SjVXdzJXRUVYbCtpWm42TW9jVllzQWs5OHdzZitZa0p4T0ds?=
 =?utf-8?B?TjRaYjhHam1halZBcjZNbDM2MXM2RzhtVGZzbGIvdWhDejdRUHVGdnBCWTZ1?=
 =?utf-8?B?OSt2ZWkwTU9heDV0RGlPN2RhNGxWOURlM081YVJQZWRLQXdaaGY5UVorSzg3?=
 =?utf-8?B?WVRKNUxoNDJOT3pEWWRWUXlzbURkL290anlVY0p2eUJnODd5S1ZIVXphSWlX?=
 =?utf-8?B?TlFCMWd3c3dOaXQvdGdYUUlGcmN1cVUrSWxYTEt4M1o2Q2hMeXVqL3Yyc1JY?=
 =?utf-8?B?ZlovbEQzN3RSWk9LeDN1Z0RlczN2YU51ZnJlUGZrZlpzWXZtc3h1VjlGQXNy?=
 =?utf-8?B?bjhHLzB3VkRBaG5vVFZKMXZCTzl6NHV4VzJybWE0TDIvVVc1QXp4QzVOTEg3?=
 =?utf-8?B?YlRQNGJjS0hSblpxem9yT2ZMZ2hPTkt6eE1mNHpRa0VxNXByaHpaTXNmNG9k?=
 =?utf-8?B?VlNEc3FDYVZXZWdCQ01abVZpeXNyc0Q0ZUROd1JLVnZoZVRXSzNrL1hPR3g5?=
 =?utf-8?B?VE5UVllKNUt0MHZxTzNVSkVrenVoR043b1I2d0ZjMGpIdnAzSmpUcSsyTHNB?=
 =?utf-8?B?WUltQm00NWhhRHVHK01xQVowbnVTa2I3M2JIT28vTW9pTGtiQUdQd1ZtRjhO?=
 =?utf-8?B?a2g2ZkRVTmF0aE1OOSthV0VtM29EOVJNQzRpaTF0ZVUwbTR5bGhaSWkwYU1H?=
 =?utf-8?B?alZMRzlWdHhySGxEc2E5TnIyeCtpcVF6aXE1OWt5Y29VVnhlcy9yZUFCZ2FT?=
 =?utf-8?B?MlhrZSsrVFpocVZlOWZxanlscGlJdG83RVpsUW10ZzdDYmVUTHF4V3RUUUtD?=
 =?utf-8?B?dER0bkZleGFlU29hSjV5YkM2V3dmdzlFQzFlK0VPV2xmY2x2UDRJRENGUVRN?=
 =?utf-8?B?SjFTYU9CWmJDRTRWNndFRWtnT1lZN1J0KzFHTGR4WkVVeFlWMVhtNGkraWFU?=
 =?utf-8?B?cWJVWVlxL3VBay9hWGlFZHN2WlIwNmJTbXBEdjk2UEZiSTJmNm9ycW04clVa?=
 =?utf-8?B?NlFwR3hPOTJCK2RPSHFSRTlha3dZUTQrcTN1MzNRNnRWckN4UGhCM3JaUE50?=
 =?utf-8?B?bkVTNjBTdnlpWHV5WGVoYnpnemlKVTJ1SDE2SnhtRnNTUWtUNFp3WHYxcTY2?=
 =?utf-8?B?Q1ZqYy8xWWxQZFpUS1pia0FzZUt2ZC9vWk83MFZ4YzNxZmJKMFM3Y3ppZ21R?=
 =?utf-8?B?Q2NvTUpnTittTmxoVEpPSGxTSHArenZBMFpyU2JrL3AvbG9KWjN6SDFMOVh4?=
 =?utf-8?B?K1VrTHNkZ2Y3Z21XdVZFUjEzOElibjV3cjJ0ajJiM1lNbmR2SU1ZOTlrQm9j?=
 =?utf-8?B?R1l6eEhGbjFQT3pEdWZFanBLS0xoUmZpYTN3TzFLNVM4dGhEWWlEOE5XTFRp?=
 =?utf-8?B?bVFjaGRYeHMyRWIzQ01NZUx5RytCVEtOakVrNURKaG5yRUJNbTY3cmUzTit3?=
 =?utf-8?B?T3pNVmNybmpxbWF4dThwQjJreWx2bFlveFBXb3hUNnZEVklVMmJyNUtEOXc1?=
 =?utf-8?B?cXNzZm4yUXFGck9rUlVOR1ErTy85RjhCU1J0VGFoVnRKTWk4K0NpUlg2Vzlz?=
 =?utf-8?B?NjNJVHlTcks4Y0JtYzh2UHJlUWdWUmZLeFZweFJUVVYxSlIvZEdLTTFxZjBr?=
 =?utf-8?B?U1MvRFFDSDYwOVhIYlVuKzRhOVRrUFBlbTh1ZGtSbG10Z3diS1N2Y0wzS3Vl?=
 =?utf-8?B?dFNkb085VDVBZzJESzlhdDVYUjVQamduRm1yRDd1TkdpWk9EMHdmOVdTcFc0?=
 =?utf-8?B?YlZWclJ2eEYvdHpVcHNlNW1WTFJLTzFUcDgzanJzMFZCTldTUVJsTGJZU0Fv?=
 =?utf-8?B?dG1kbE04MHFSUlg4b0lyZVl1dlJBWEhZVXdUSWF6c2piTXdaVk1lWWlJRitJ?=
 =?utf-8?B?YnFhRUgzYzNQV3R4dVZOV3RtczZsRCt6Q2lrV251VmJ4R3IzeXozay9ZUHpV?=
 =?utf-8?B?Sk96Z09XWFlNQnhzWlF0bVROZnRKTWNpS3pPQ0dncXFYbzhkTWhqblg5RmVT?=
 =?utf-8?B?aXMyd1REVUJBPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <02DBF0D4A8C1604C82C286F2A870D3EA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6040
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cdbeeb81-50c3-4b40-eeb7-08dd86878293
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|376014|82310400026|14060799003|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGpPV3dqRDBxVkVLS01SSi9vTTRJalZNdWJ1Y0NIZWVhcFJ5NXJqMmJNZjl3?=
 =?utf-8?B?VS96Qy9HTXJxTGsyVGtsdXprOFZnbVZMRUJIeHpJa245V3p5V2EyT216T0E1?=
 =?utf-8?B?M2NrelF4SmQyUUhmZjIvSzVqQW5RcHNVY1lCZ05jbm5HWjlKRWRsRWx1Rmcz?=
 =?utf-8?B?Z2FETXpUTFZCT3JYNmM3M3hmcWtDVEZMTGNHdjZiMUhObVJyMEVvZlRDTDJF?=
 =?utf-8?B?cDlvcW8zUWtnUVRncmRMaEoyakNHWnhrT29UUG1FQllibHNuY0NCMmdocDVK?=
 =?utf-8?B?UTNzUFZ6MVZtTlZqeVpvemphc1B0eGcvS0FwaFBtc0V1amtvMm9vb21xMzRi?=
 =?utf-8?B?a3g2cGRGYzZzaDJvVElnNmxmWW5kendTck1xMVVPOWs3aWtJSk9oTmphNEVU?=
 =?utf-8?B?dnFaT1BNMC8zU2xmRmc2RDk4MnJPWmU4SHlmS3UzYzJjZkJrMkZXdG9aVFVR?=
 =?utf-8?B?Wk5SaHFwL0hsdHRUVUlndkd3QkYwVzdSU2VFUVhJQzhVaVpZR1pRaFRvdkFU?=
 =?utf-8?B?Y2FtKy95WHNhOTl2UDRsTmdSeVNQOEcxUURtMjgxTXRQUHlsMU9UWWNSWGdz?=
 =?utf-8?B?dklVMXcvalRCbUNFZ0hBSUNtV1BNTk9VZGNUczQ3QTJwazkzYzZpK09KY29W?=
 =?utf-8?B?MElIWGhnUGFrZHh2cWtrQys1ZGpOdGVCNjdVanliUGtZZzRRV3htZi9ZRWZl?=
 =?utf-8?B?Z1hGUTFzOWE0WnpuTmZ3bTluemhwWWhzTlN0bmozWVVlS3hlQWU2SklwT212?=
 =?utf-8?B?YUZDaFY1dHpUYnpXQWltUjFNc3YxbXYvK0p5RTlGeStDWTNzTVZDREJ1OERO?=
 =?utf-8?B?MlYrb3psMVhqTlcvWUxlMllqUkFqVm1uV2YzdFg3Tk5KNDhxSVkyYU4zWlBM?=
 =?utf-8?B?SkUrbHdLc0JNWE03a2lSck5UaHllZVVxQ1pqd0RIdHcvOUxwVVRmQWZzSzVE?=
 =?utf-8?B?K3laTlRNWUdYbE1yYit1UmVjaEhQTlJRZnM2bytmUGpTL1F4YStienpPbGgv?=
 =?utf-8?B?V0ZuRUttazdTRjhFeXpzc1pGa0tOcGhsMmNrTHBkRllQWFJXN0hUejc0Ykwx?=
 =?utf-8?B?TzF0aWJUR1NsMzVkUnZLSDJMd3hvbEVsZnpVQTRPUjg4VWFPTkMyVDVSNDdV?=
 =?utf-8?B?c0RKRVJuME5maXRQbXFmZTgzNEJoVk5sNnd5ZDdSbmNYOE5SclFLZDdFbUJN?=
 =?utf-8?B?N0JKTmwzOFFib3lvM0w5N01nOFM0emprNEtWUFl0OTV4RGozOFBQZGRCNGJj?=
 =?utf-8?B?eHFxVzBlNVJEV2pYT2dSek5tZVIzZFVCbkEwSi9aNVdmWTEra3IwOVFadDZZ?=
 =?utf-8?B?TVk3bUR0NXRNdlFnL3N4eHcycXRBdk1aYjFqZWw5QmJ0ZUlCU1pJTEtzbDBz?=
 =?utf-8?B?SzN5SVlXVVFKMjNKNVc2YitzamxsV2hNajRrbk1raTRUcFUvaVVHK3puYlVD?=
 =?utf-8?B?N2lSRm5yOE5heVl1a01jTW12Uis3UFVubWZwQzdONDAzc3IxdDJkNDU4VnVD?=
 =?utf-8?B?QUt3YjI4N3VjU3E4cjFpbkZVaDc3UnpkekVJOFpVYnduL2txQWFtclJCZmZN?=
 =?utf-8?B?NzE0ZHVFUlZ3TUFBcmJoYVdNTDRlT3dCWCtSYlRnM2JLTk9hMm5KOStaZlNY?=
 =?utf-8?B?QW1CZXhlSzV5NGR1b09WU1RCVmt0VnJ3SU9kWGZ1aUFPWitmUHVTQ2hJUkpZ?=
 =?utf-8?B?eW4yb293Kzlpc3lJcFZsdFBQRXZ3OTVWK3d5eVJlRm8rTTNaYVVQdS93NVds?=
 =?utf-8?B?ektEZ245S3hWalJhdCs3NUIzVjFXR3U4UE50N0VNaTExdllzRmJIdXoxWnl1?=
 =?utf-8?B?WHFMMThDK3hlTUV6bSt5QkVPOFJaUnlNYktyUC9QVzAwV21BeElhdXd5dm9D?=
 =?utf-8?B?QkxJaEFsTWJiN2IyVmdpcm1vR0pqbDlJOWpOTis4TVpWb2YwU0gzS2Jyc0N3?=
 =?utf-8?B?NzhGS1JrWEo5bUZsVEIrbTlUQ3kzeGxuR1V5aVFhZ0J6blROcVltVHRlZFlj?=
 =?utf-8?B?QkFWbWV6Q3BzNEY3eTFmYTEvaHZQYWNlQ1RqZDRtUE9NaFBRYlcyOG55MkFK?=
 =?utf-8?Q?VBYV/S?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(376014)(82310400026)(14060799003)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 19:05:05.3602
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff797cb6-e935-48a8-1a65-08dd8687962b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9066

SGkgQXlhbiwNCg0KPiBPbiAyNSBBcHIgMjAyNSwgYXQgMTM6MDAsIEF5YW4gS3VtYXIgSGFsZGVy
IDxheWFua3VtYUBhbWQuY29tPiB3cm90ZToNCj4gDQo+IEhpIEp1bGllbiwNCj4gDQo+IGNjLWVk
IEx1Y2EgZm9yIGZlZWRiYWNrIG9uIHNwZWNpZmljIHBvaW50cy4NCj4gDQo+IE9uIDE4LzA0LzIw
MjUgMDU6NTQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+IEhpIEF5YW4sDQo+PiANCj4+IE9uIDE4
LzA0LzIwMjUgMDA6NTUsIEF5YW4gS3VtYXIgSGFsZGVyIHdyb3RlOg0KPj4+IEFkZCB0aGUgZGVm
aW5pdGlvbnMgZm9yIEhQUkJBUjwwLi4zMT4sIEhQUkxBUjwwLi4zMT4gYW5kIEhQUkVOUi4NCj4+
PiBUaGUgZGVmaW5pdGlvbnMgYXJlIHRha2VuIGZyb20gQVJNIERESSAwNTY4QS5jIElEMTEwNTIw
LCBFMi4yLjMgSFBSQkFSPG4+LA0KPj4+IEUyLjIuNCBIUFJFTlIgYW5kIEUyLjIuNiBIUFJMQVI8
bj4uDQo+Pj4gDQo+Pj4gSW50cm9kdWNlIHByX3QgdHlwZWRlZiB3aGljaCBpcyBhIHN0cnVjdHVy
ZSBoYXZpbmcgdGhlIHByYmFyIGFuZCBwcmxhciBtZW1iZXJzLA0KPj4+IGVhY2ggYmVpbmcgc3Ry
dWN0dXJlZCBhcyB0aGUgcmVnaXN0ZXJzIG9mIHRoZSBBQXJjaDMyLVY4UiBhcmNoaXRlY3R1cmUu
DQo+Pj4gVGhpcyBpcyB0aGUgYXJtMzIgZXF1aXZhbGVudCBvZg0KPj4+ICJhcm0vbXB1OiBJbnRy
b2R1Y2UgTVBVIG1lbW9yeSByZWdpb24gbWFwIHN0cnVjdHVyZSIuDQo+Pj4gDQo+Pj4gU2lnbmVk
LW9mZi1ieTogQXlhbiBLdW1hciBIYWxkZXIgPGF5YW4ua3VtYXIuaGFsZGVyQGFtZC5jb20+DQo+
Pj4gLS0tDQo+Pj4gVGhpcyBwYXRjaCBzaG91bGQgYmUgYXBwbGllZCBhZnRlcg0KPj4+ICJbUEFU
Q0ggdjMgMC83XSBGaXJzdCBjaHVuayBmb3IgQXJtIFI4MiBhbmQgTVBVIHN1cHBvcnQiIGluIG9y
ZGVyIHRvIGVuYWJsZQ0KPj4+IGNvbXBpbGF0aW9uIGZvciBBQXJjaDMyLg0KPj4+IA0KPj4+ICAg
eGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2FybTMyL21wdS5oICB8ICA1OSArKysrKysrKysrKw0K
Pj4+ICAgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21wdS5oICAgICAgICB8ICAgNCArDQo+Pj4g
ICB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbXB1L2NwcmVncy5oIHwgMTM1ICsrKysrKysrKysr
KysrKysrKysrKysrKysrDQo+Pj4gICAzIGZpbGVzIGNoYW5nZWQsIDE5OCBpbnNlcnRpb25zKCsp
DQo+Pj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2FybTMy
L21wdS5oDQo+Pj4gDQo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9h
cm0zMi9tcHUuaCBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9hcm0zMi9tcHUuaA0KPj4+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0DQo+Pj4gaW5kZXggMDAwMDAwMDAwMC4uNGFhYmQ5MzQ3OQ0KPj4+
IC0tLSAvZGV2L251bGwNCj4+PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vYXJtMzIv
bXB1LmgNCj4+PiBAQCAtMCwwICsxLDU5IEBADQo+Pj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wLW9ubHkgKi8NCj4+PiArLyoNCj4+PiArICogbXB1Lmg6IEFybSBNZW1vcnkg
UHJvdGVjdGlvbiBVbml0IGRlZmluaXRpb25zIGZvciBhYXJjaDY0Lg0KPj4+ICsgKi8NCj4+PiAr
DQo+Pj4gKyNpZm5kZWYgX19BUk1fQVJNMzJfTVBVX0gNCj4+PiArI2RlZmluZSBfX0FSTV9BUk0z
Ml9NUFVfSA0KPj4+ICsNCj4+PiArI2RlZmluZSBYTl9FTDJfRU5BQkxFRCAgMHgxDQo+PiANCj4+
IEkgdW5kZXJzdGFuZCB0aGUgZGVmaW5lIGlzIGludHJvZHVjZWQgaW4gTHVjYSdzIHBhdGNoLCBi
dXQgdGhpcyBhIGJpdCBub24tZGVzY3JpcHRpdmUuLi4gQ2FuIHdlIGZpbmQgYSBiZXR0ZXIgbmFt
ZT8gTWF5YmUgYnkgYWRkaW5nIHRoZSBuYW1lIG9mIHRoZSByZWdpc3RlciBhbmQgc29tZSBkb2N1
bWVudGF0aW9uPw0KPiANCj4gV2UgY2FuIHJlbmFtZSB0aGlzIGFzIFBSQkFSX0VMMl9YTiBpZiB0
aGlzIHNvdW5kcyBiZXR0ZXIgKGNjIEBMdWNhKSBpbiBMdWNhJ3MgcGF0Y2gNCg0Kd2hhdCBhYm91
dCBQUkJBUl9FTDJfWE5fRU5BQkxFRD8gSSBjYW4gY2hhbmdlIGl0IGluIG15IHNlcmllDQoNCj4g
DQo+IFRoZSBkZXNjcmlwdGlvbiBjYW4gYmUNCj4gDQo+IFJlZmVyIEFSTSBEREkgMDU2OEEuYyAg
SUQxMTA1MjAgLCBFMi4yLjINCj4gDQo+IEhQUkJBUiBbMDoxXSBFeGVjdXRlIE5ldmVyDQo+IA0K
Pj4gDQo+Pj4gKw0KPj4+ICsjaWZuZGVmIF9fQVNTRU1CTFlfXw0KPj4+ICsNCj4+PiArLyogSHlw
ZXJ2aXNvciBQcm90ZWN0aW9uIFJlZ2lvbiBCYXNlIEFkZHJlc3MgUmVnaXN0ZXIgKi8NCj4+PiAr
dHlwZWRlZiB1bmlvbiB7DQo+Pj4gKyAgICBzdHJ1Y3Qgew0KPj4+ICsgICAgICAgIHVuc2lnbmVk
IGludCB4bjoxOyAgICAgICAvKiBFeGVjdXRlLU5ldmVyICovDQo+Pj4gKyAgICAgICAgdW5zaWdu
ZWQgaW50IGFwOjI7ICAgICAgIC8qIEFjZXNzIFBlcm1pc3Npb24gKi8NCj4+PiArICAgICAgICB1
bnNpZ25lZCBpbnQgc2g6MjsgICAgICAgLyogU2hhcmViaWxpdHkgKi8NCj4+PiArICAgICAgICB1
bnNpZ25lZCBpbnQgcmVzMDoxOyAgICAgLyogUmVzZXJ2ZWQgYXMgMCAqLw0KPj4+ICsgICAgICAg
IHVuc2lnbmVkIGludCBiYXNlOjI2OyAgICAvKiBCYXNlIEFkZHJlc3MgKi8NCj4+PiArICAgIH0g
cmVnOw0KPj4+ICsgICAgdWludDMyX3QgYml0czsNCj4+PiArfSBwcmJhcl90Ow0KPj4+ICsNCj4+
PiArLyogSHlwZXJ2aXNvciBQcm90ZWN0aW9uIFJlZ2lvbiBMaW1pdCBBZGRyZXNzIFJlZ2lzdGVy
ICovDQo+Pj4gK3R5cGVkZWYgdW5pb24gew0KPj4+ICsgICAgc3RydWN0IHsNCj4+PiArICAgICAg
ICB1bnNpZ25lZCBpbnQgZW46MTsgICAgIC8qIFJlZ2lvbiBlbmFibGUgKi8NCj4+PiArICAgICAg
ICB1bnNpZ25lZCBpbnQgYWk6MzsgICAgIC8qIE1lbW9yeSBBdHRyaWJ1dGUgSW5kZXggKi8NCj4+
PiArICAgICAgICAvKg0KPj4+ICsgICAgICAgICAqIFRoZXJlIGlzIG5vIGFjdHVhbCBucyBiaXQg
aW4gaGFyZHdhcmUuIEl0IGlzIHVzZWQgaGVyZSBmb3INCj4+PiArICAgICAgICAgKiBjb21wYXRp
YmlsaXR5IHdpdGggQXJtcjY0IGNvZGUuIFRodXMsIHdlIGFyZSByZXVzaW5nIGEgcmVzMCBiaXQg
Zm9yIG5zLg0KPj4gDQo+PiB0eXBvOiBBcm02NC4NCj4gQWNrDQo+PiANCj4+PiArICAgICAgICAg
Ki8NCj4+IA0KPj4gSG1tbW0sIHRoaXMgd291bGQgbWVhbiBzb21lb25lIG1heSBtaXN0YWtlbmx5
IHNldCB0aGUgYml0IHRvIDAgYnkgbWlzdGFrZS4gSWYgdGhlIGZpZWxkIGlzIGFsd2F5cyBtZWFu
dCB0byBiZSAwIG9uIGFybTY0LCB0aGVuIEkgd291bGQgY29uc2lkZXIgdG8gbmFtZSBpcyByZXMw
IG9uIGFybTY0IHdpdGggYW4gZXhwbGFuYXRpb24uDQo+PiANCj4+IFRoaXMgd291bGQgbWFrZSBj
bGVhciB0aGUgYml0IGlzIG5vdCBzdXBwb3NlZCB0byBoYXZlIGEgdmFsdWUgb3RoZXIgdGhhbiAw
Lg0KPiANCj4gT24gQXJtNjQsIG5zID09IDAgYXMgaXQgY2FuIG9ubHkgc3VwcG9ydCBzZWN1cmUg
bW9kZS4NCj4gDQo+IFNvIHdlIGNhbiBjaGFuZ2UgdGhpcyBvbiBBcm02NCBhcyB3ZWxsIDotDQo+
IA0KPiB1bnNpZ25lZCBpbnQgcmVzMDoyOyAvKiBucyA9PSAwIGFzIG9ubHkgc2VjdXJlIG1vZGUg
aXMgc3VwcG9ydGVkICovDQo+IA0KPiBATHVjYSB0byBjbGFyaWZ5DQoNCkZyb20gdGhlIHNwZWNp
ZmljYXRpb25zOiAiTm9uLXNlY3VyZSBiaXQuIFNwZWNpZmllcyB3aGV0aGVyIHRoZSBvdXRwdXQg
YWRkcmVzcyBpcyBpbiB0aGUgU2VjdXJlIG9yIE5vbi1zZWN1cmUgbWVtb3J54oCdLCBJ4oCZbSBu
b3Qgc3VyZQ0KdGhhdCB3ZSBzaG91bGQgcmVtb3ZlIGl0IGZyb20gQXJtNjQsIHNvIEkgZG9u4oCZ
dCB0aGluayB5b3Ugc2hvdWxkIGhhdmUgc29tZXRoaW5nIG9ubHkgZm9yIGNvbXBhdGliaWxpdHks
IG1heWJlIHRoZSBjb2RlIGFjY2Vzc2luZyAubnMNCmNhbiBiZSBjb21waWxlZCBvdXQgZm9yIEFy
bTMyIG9yIHdlIGNhbiBoYXZlIGFyY2gtc3BlY2lmaWMgaW1wbGVtZW50YXRpb24uIEkgdGhpbmsg
eW91IGFyZSByZWZlcnJpbmcgdG8gcHJfb2ZfeGVuYWRkciB3aGVuIHlvdSBzYXkNCuKAnGNvbXBh
dGliaWxpdHkgd2l0aCBBcm02NCBjb2RlIg0KDQo+IA0KPj4gDQo+Pj4gKyAgICAgICAgdW5zaWdu
ZWQgaW50IG5zOjE7ICAgICAvKiBSZXNlcnZlZCAwIGJ5IGhhcmR3YXJlICovDQo+Pj4gKyAgICAg
ICAgdW5zaWduZWQgaW50IHJlczA6MTsgICAvKiBSZXNlcnZlZCAwIGJ5IGhhcmR3YXJlICovDQo+
IFRoZW4sIHdlIGNhbiBjaGFuZ2UgdGhpcyBvbiBBcm0zMiBhcyB3ZWxsLg0KPj4+ICsgICAgICAg
IHVuc2lnbmVkIGludCBsaW1pdDoyNjsgIC8qIExpbWl0IEFkZHJlc3MgKi8NCj4+IA0KPj4gTklU
OiBDYW4gd2UgYWxpZ24gdGhlIGNvbW1lbnRzPw0KPiBBY2suDQo+PiANCj4+PiArICAgIH0gcmVn
Ow0KPj4+ICsgICAgdWludDMyX3QgYml0czsNCj4+PiArfSBwcmxhcl90Ow0KPj4+ICsNCj4+PiAr
LyogUHJvdGVjdGlvbiBSZWdpb24gKi8NCj4+PiArdHlwZWRlZiBzdHJ1Y3Qgew0KPj4+ICsgICAg
cHJiYXJfdCBwcmJhcjsNCj4+PiArICAgIHBybGFyX3QgcHJsYXI7DQo+Pj4gKyAgICB1aW50NjRf
dCBwMm1fdHlwZTsgICAgICAgICAgLyogVXNlZCB0byBzdG9yZSBwMm0gdHlwZXMuICovDQo+Pj4g
K30gcHJfdDsNCj4+IA0KPj4gVGhpcyBsb29rcyB0byBiZSBjb21tb24gd2l0aCBhcm02NC4gSWYg
c28sIEkgd291bGQgcHJlZmVyIGlmIHRoZSBzdHJ1Y3R1cmUgaXMgaW4gYSBjb21tb24gaGVhZGVy
Lg0KPiANCj4gTm8sIGluIGFybTY0IHRoaXMgaXMNCj4gDQo+IHR5cGVkZWYgc3RydWN0IHsNCj4g
ICAgICBwcmJhcl90IHByYmFyOw0KPiAgICAgIHBybGFyX3QgcHJsYXI7DQo+IH0gcHJfdDsNCj4g
DQo+IFRoZSByZWFzb24gYmVpbmcgQXJtNjQgdXNlcyB1bnVzZWQgYml0cyAoaWUgJ3BhZCcpIHRv
IHN0b3JlIHRoZSB0eXBlLg0KPiANCj4+IA0KPj4+ICsNCj4+PiArI2VuZGlmIC8qIF9fQVNTRU1C
TFlfXyAqLw0KPj4+ICsNCj4+PiArI2VuZGlmIC8qIF9fQVJNX0FSTTMyX01QVV9IICovDQo+Pj4g
Kw0KPj4+ICsvKg0KPj4+ICsgKiBMb2NhbCB2YXJpYWJsZXM6DQo+Pj4gKyAqIG1vZGU6IEMNCj4+
PiArICogYy1maWxlLXN0eWxlOiAiQlNEIg0KPj4+ICsgKiBjLWJhc2ljLW9mZnNldDogNA0KPj4+
ICsgKiBpbmRlbnQtdGFicy1tb2RlOiBuaWwNCj4+PiArICogRW5kOg0KPj4+ICsgKi8NCj4+PiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21wdS5oIGIveGVuL2FyY2gvYXJt
L2luY2x1ZGUvYXNtL21wdS5oDQo+Pj4gaW5kZXggNzdkMDU2NmY5Ny4uNjcxMjcxNDljMCAxMDA2
NDQNCj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbXB1LmgNCj4+PiArKysgYi94
ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbXB1LmgNCj4+PiBAQCAtOCw4ICs4LDEyIEBADQo+Pj4g
ICAgICNpZiBkZWZpbmVkKENPTkZJR19BUk1fNjQpDQo+Pj4gICAjIGluY2x1ZGUgPGFzbS9hcm02
NC9tcHUuaD4NCj4+PiArI2VsaWYgZGVmaW5lZChDT05GSUdfQVJNXzMyKQ0KPj4+ICsjIGluY2x1
ZGUgPGFzbS9hcm0zMi9tcHUuaD4NCj4+PiAgICNlbmRpZg0KPj4+ICAgKyNkZWZpbmUgUFJFTlJf
TUFTSyAgR0VOTUFTSygzMSwgMCkNCj4+PiArDQo+Pj4gICAjZGVmaW5lIE1QVV9SRUdJT05fU0hJ
RlQgIDYNCj4+PiAgICNkZWZpbmUgTVBVX1JFR0lPTl9BTElHTiAgKF9BQygxLCBVTCkgPDwgTVBV
X1JFR0lPTl9TSElGVCkNCj4+PiAgICNkZWZpbmUgTVBVX1JFR0lPTl9NQVNLICAgKH4oTVBVX1JF
R0lPTl9BTElHTiAtIDEpKQ0KPj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9h
c20vbXB1L2NwcmVncy5oIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21wdS9jcHJlZ3MuaA0K
Pj4+IGluZGV4IGQ1Y2QwZTA0ZDUuLjdjZjUyYWEwOWEgMTAwNjQ0DQo+Pj4gLS0tIGEveGVuL2Fy
Y2gvYXJtL2luY2x1ZGUvYXNtL21wdS9jcHJlZ3MuaA0KPj4+ICsrKyBiL3hlbi9hcmNoL2FybS9p
bmNsdWRlL2FzbS9tcHUvY3ByZWdzLmgNCj4+PiBAQCAtNiwxOCArNiwxNTMgQEANCj4+PiAgIC8q
IENQMTUgQ1IwOiBNUFUgVHlwZSBSZWdpc3RlciAqLw0KPj4+ICAgI2RlZmluZSBITVBVSVIgICAg
ICAgICAgcDE1LDQsYzAsYzAsNA0KPj4+ICAgKy8qIENQMTUgQ1I2OiBQcm90ZWN0aW9uIFJlZ2lv
biBFbmFibGUgUmVnaXN0ZXIgKi8NCj4+PiArI2RlZmluZSBIUFJFTlIgICAgICAgICAgcDE1LDQs
YzYsYzEsMQ0KPj4+ICsNCj4+PiAgIC8qIENQMTUgQ1I2OiBNUFUgUHJvdGVjdGlvbiBSZWdpb24g
QmFzZS9MaW1pdC9TZWxlY3QgQWRkcmVzcyBSZWdpc3RlciAqLw0KPj4+ICAgI2RlZmluZSBIUFJT
RUxSICAgICAgICAgcDE1LDQsYzYsYzIsMQ0KPj4+ICAgI2RlZmluZSBIUFJCQVIgICAgICAgICAg
cDE1LDQsYzYsYzMsMA0KPj4+ICAgI2RlZmluZSBIUFJMQVIgICAgICAgICAgcDE1LDQsYzYsYzgs
MQ0KPj4+ICAgKy8qIENQMTUgQ1I2OiBNUFUgUHJvdGVjdGlvbiBSZWdpb24gQmFzZS9MaW1pdCBB
ZGRyZXNzIFJlZ2lzdGVyICovDQo+Pj4gKyNkZWZpbmUgSFBSQkFSMCAgICAgICAgIHAxNSw0LGM2
LGM4LDANCj4+PiArI2RlZmluZSBIUFJMQVIwICAgICAgICAgcDE1LDQsYzYsYzgsMQ0KPj4+ICsj
ZGVmaW5lIEhQUkJBUjEgICAgICAgICBwMTUsNCxjNixjOCw0DQo+Pj4gKyNkZWZpbmUgSFBSTEFS
MSAgICAgICAgIHAxNSw0LGM2LGM4LDUNCj4+PiArI2RlZmluZSBIUFJCQVIyICAgICAgICAgcDE1
LDQsYzYsYzksMA0KPj4+ICsjZGVmaW5lIEhQUkxBUjIgICAgICAgICBwMTUsNCxjNixjOSwxDQo+
Pj4gKyNkZWZpbmUgSFBSQkFSMyAgICAgICAgIHAxNSw0LGM2LGM5LDQNCj4+PiArI2RlZmluZSBI
UFJMQVIzICAgICAgICAgcDE1LDQsYzYsYzksNQ0KPj4+ICsjZGVmaW5lIEhQUkJBUjQgICAgICAg
ICBwMTUsNCxjNixjMTAsMA0KPj4+ICsjZGVmaW5lIEhQUkxBUjQgICAgICAgICBwMTUsNCxjNixj
MTAsMQ0KPj4+ICsjZGVmaW5lIEhQUkJBUjUgICAgICAgICBwMTUsNCxjNixjMTAsNA0KPj4+ICsj
ZGVmaW5lIEhQUkxBUjUgICAgICAgICBwMTUsNCxjNixjMTAsNQ0KPj4+ICsjZGVmaW5lIEhQUkJB
UjYgICAgICAgICBwMTUsNCxjNixjMTEsMA0KPj4+ICsjZGVmaW5lIEhQUkxBUjYgICAgICAgICBw
MTUsNCxjNixjMTEsMQ0KPj4+ICsjZGVmaW5lIEhQUkJBUjcgICAgICAgICBwMTUsNCxjNixjMTEs
NA0KPj4+ICsjZGVmaW5lIEhQUkxBUjcgICAgICAgICBwMTUsNCxjNixjMTEsNQ0KPj4+ICsjZGVm
aW5lIEhQUkJBUjggICAgICAgICBwMTUsNCxjNixjMTIsMA0KPj4+ICsjZGVmaW5lIEhQUkxBUjgg
ICAgICAgICBwMTUsNCxjNixjMTIsMQ0KPj4+ICsjZGVmaW5lIEhQUkJBUjkgICAgICAgICBwMTUs
NCxjNixjMTIsNA0KPj4+ICsjZGVmaW5lIEhQUkxBUjkgICAgICAgICBwMTUsNCxjNixjMTIsNQ0K
Pj4+ICsjZGVmaW5lIEhQUkJBUjEwICAgICAgICBwMTUsNCxjNixjMTMsMA0KPj4+ICsjZGVmaW5l
IEhQUkxBUjEwICAgICAgICBwMTUsNCxjNixjMTMsMQ0KPj4+ICsjZGVmaW5lIEhQUkJBUjExICAg
ICAgICBwMTUsNCxjNixjMTMsNA0KPj4+ICsjZGVmaW5lIEhQUkxBUjExICAgICAgICBwMTUsNCxj
NixjMTMsNQ0KPj4+ICsjZGVmaW5lIEhQUkJBUjEyICAgICAgICBwMTUsNCxjNixjMTQsMA0KPj4+
ICsjZGVmaW5lIEhQUkxBUjEyICAgICAgICBwMTUsNCxjNixjMTQsMQ0KPj4+ICsjZGVmaW5lIEhQ
UkJBUjEzICAgICAgICBwMTUsNCxjNixjMTQsNA0KPj4+ICsjZGVmaW5lIEhQUkxBUjEzICAgICAg
ICBwMTUsNCxjNixjMTQsNQ0KPj4+ICsjZGVmaW5lIEhQUkJBUjE0ICAgICAgICBwMTUsNCxjNixj
MTUsMA0KPj4+ICsjZGVmaW5lIEhQUkxBUjE0ICAgICAgICBwMTUsNCxjNixjMTUsMQ0KPj4+ICsj
ZGVmaW5lIEhQUkJBUjE1ICAgICAgICBwMTUsNCxjNixjMTUsNA0KPj4+ICsjZGVmaW5lIEhQUkxB
UjE1ICAgICAgICBwMTUsNCxjNixjMTUsNQ0KPj4+ICsjZGVmaW5lIEhQUkJBUjE2ICAgICAgICBw
MTUsNSxjNixjOCwwDQo+Pj4gKyNkZWZpbmUgSFBSTEFSMTYgICAgICAgIHAxNSw1LGM2LGM4LDEN
Cj4+PiArI2RlZmluZSBIUFJCQVIxNyAgICAgICAgcDE1LDUsYzYsYzgsNA0KPj4+ICsjZGVmaW5l
IEhQUkxBUjE3ICAgICAgICBwMTUsNSxjNixjOCw1DQo+Pj4gKyNkZWZpbmUgSFBSQkFSMTggICAg
ICAgIHAxNSw1LGM2LGM5LDANCj4+PiArI2RlZmluZSBIUFJMQVIxOCAgICAgICAgcDE1LDUsYzYs
YzksMQ0KPj4+ICsjZGVmaW5lIEhQUkJBUjE5ICAgICAgICBwMTUsNSxjNixjOSw0DQo+Pj4gKyNk
ZWZpbmUgSFBSTEFSMTkgICAgICAgIHAxNSw1LGM2LGM5LDUNCj4+PiArI2RlZmluZSBIUFJCQVIy
MCAgICAgICAgcDE1LDUsYzYsYzEwLDANCj4+PiArI2RlZmluZSBIUFJMQVIyMCAgICAgICAgcDE1
LDUsYzYsYzEwLDENCj4+PiArI2RlZmluZSBIUFJCQVIyMSAgICAgICAgcDE1LDUsYzYsYzEwLDQN
Cj4+PiArI2RlZmluZSBIUFJMQVIyMSAgICAgICAgcDE1LDUsYzYsYzEwLDUNCj4+PiArI2RlZmlu
ZSBIUFJCQVIyMiAgICAgICAgcDE1LDUsYzYsYzExLDANCj4+PiArI2RlZmluZSBIUFJMQVIyMiAg
ICAgICAgcDE1LDUsYzYsYzExLDENCj4+PiArI2RlZmluZSBIUFJCQVIyMyAgICAgICAgcDE1LDUs
YzYsYzExLDQNCj4+PiArI2RlZmluZSBIUFJMQVIyMyAgICAgICAgcDE1LDUsYzYsYzExLDUNCj4+
PiArI2RlZmluZSBIUFJCQVIyNCAgICAgICAgcDE1LDUsYzYsYzEyLDANCj4+PiArI2RlZmluZSBI
UFJMQVIyNCAgICAgICAgcDE1LDUsYzYsYzEyLDENCj4+PiArI2RlZmluZSBIUFJCQVIyNSAgICAg
ICAgcDE1LDUsYzYsYzEyLDQNCj4+PiArI2RlZmluZSBIUFJMQVIyNSAgICAgICAgcDE1LDUsYzYs
YzEyLDUNCj4+PiArI2RlZmluZSBIUFJCQVIyNiAgICAgICAgcDE1LDUsYzYsYzEzLDANCj4+PiAr
I2RlZmluZSBIUFJMQVIyNiAgICAgICAgcDE1LDUsYzYsYzEzLDENCj4+PiArI2RlZmluZSBIUFJC
QVIyNyAgICAgICAgcDE1LDUsYzYsYzEzLDQNCj4+PiArI2RlZmluZSBIUFJMQVIyNyAgICAgICAg
cDE1LDUsYzYsYzEzLDUNCj4+PiArI2RlZmluZSBIUFJCQVIyOCAgICAgICAgcDE1LDUsYzYsYzE0
LDANCj4+PiArI2RlZmluZSBIUFJMQVIyOCAgICAgICAgcDE1LDUsYzYsYzE0LDENCj4+PiArI2Rl
ZmluZSBIUFJCQVIyOSAgICAgICAgcDE1LDUsYzYsYzE0LDQNCj4+PiArI2RlZmluZSBIUFJMQVIy
OSAgICAgICAgcDE1LDUsYzYsYzE0LDUNCj4+PiArI2RlZmluZSBIUFJCQVIzMCAgICAgICAgcDE1
LDUsYzYsYzE1LDANCj4+PiArI2RlZmluZSBIUFJMQVIzMCAgICAgICAgcDE1LDUsYzYsYzE1LDEN
Cj4+PiArI2RlZmluZSBIUFJCQVIzMSAgICAgICAgcDE1LDUsYzYsYzE1LDQNCj4+PiArI2RlZmlu
ZSBIUFJMQVIzMSAgICAgICAgcDE1LDUsYzYsYzE1LDUNCj4+IA0KPj4gTklUOiBJcyB0aGVyZSBh
bnkgd2F5IHdlIGNvdWxkIGdlbmVyYXRlIHRoZSB2YWx1ZXMgdXNpbmcgbWFjcm9zPw0KPiBUaGlz
IGxvb2tzIHRyaWNreS4gU28gSSB3aWxsIHByZWZlciB0byBrZWVwIHRoaXMgYXMgaXQgaXMuDQo+
PiANCj4+PiArDQo+Pj4gICAvKiBBbGlhc2VzIG9mIEFBcmNoNjQgbmFtZXMgZm9yIHVzZSBpbiBj
b21tb24gY29kZSAqLw0KPj4+ICAgI2lmZGVmIENPTkZJR19BUk1fMzINCj4+PiAgIC8qIEFscGhh
YmV0aWNhbGx5Li4uICovDQo+Pj4gICAjZGVmaW5lIE1QVUlSX0VMMiAgICAgICBITVBVSVINCj4+
PiAgICNkZWZpbmUgUFJCQVJfRUwyICAgICAgIEhQUkJBUg0KPj4+ICsjZGVmaW5lIFBSQkFSMF9F
TDIgICAgICBIUFJCQVIwDQo+PiANCj4+IEFGQUlVLCB0aGUgYWxpYXMgd2lsbCBiZSBtYWlubHkg
dXNlZCBpbiB0aGUgbWFjcm8gZ2VuZXJhdGUNCj4+IHRoZSBzd2l0Y2guIFJhdGhlciB0aGFuIG9w
ZW4tY29kaW5nIGFsbCB0aGUgUFIqQVJfRUwyLCBjYW4gd2UNCj4+IHByb3ZpZGUgdHdvIG1hY3Jv
cyBQUntCLCBMfUFSX04gdGhhdCB3aWxsIGJlIGltcGxlbWVudGVkIGFzDQo+PiBIUFJ7QixMfUFS
IyNuIGZvciBhcm0zMiBhbmQgUFJ7QixMfUFSIyNuIGZvciBhcm02ND8NCj4gDQo+IFllcyAsIHdl
IGNhbiBoYXZlDQo+IA0KPiAjZGVmaW5lIFBSe0IsTH1BUl9FTDJfKG4pICAgICAgICAgIEhQUntC
LEx9QVIjI24gZm9yIGFybTMyDQo+IA0KPiAjZGVmaW5lIFBSe0IsTH1BUl9FTDJfKG4pICAgICAg
ICAgIFBSe0IsTH1BUiMjbiMjX0VMMg0KDQp3ZSBjb3VsZCBoYXZlIHRoZW0gaW4gbW0uYywgSSBz
ZWUgaW4geW91ciB2MiB5b3XigJl2ZSBwdXQgdGhlbSBpbiBjcHJlZ3MuaCwNCmJ1dCBzaW5jZSB0
aGV5IGFyZSBvbmx5IHVzZWQgYnkgdGhlIGdlbmVyYXRvciwgSSB3b3VsZCBwdXQgdGhlbSB0aGVy
ZS4NCg0KDQoNCg==

