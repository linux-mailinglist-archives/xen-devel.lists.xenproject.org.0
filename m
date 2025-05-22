Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A73AC06D7
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 10:18:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993189.1376633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI18X-0006Yb-D4; Thu, 22 May 2025 08:18:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993189.1376633; Thu, 22 May 2025 08:18:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI18X-0006VV-AB; Thu, 22 May 2025 08:18:45 +0000
Received: by outflank-mailman (input) for mailman id 993189;
 Thu, 22 May 2025 08:18:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isH4=YG=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1uI18W-0006VN-6O
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 08:18:44 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20629.outbound.protection.outlook.com
 [2a01:111:f403:2613::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5efc8f6f-36e5-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 10:18:42 +0200 (CEST)
Received: from DU7PR01CA0041.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::6) by GV1PR08MB10569.eurprd08.prod.outlook.com
 (2603:10a6:150:16e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 08:18:33 +0000
Received: from DB1PEPF000509EB.eurprd03.prod.outlook.com
 (2603:10a6:10:50e:cafe::28) by DU7PR01CA0041.outlook.office365.com
 (2603:10a6:10:50e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.21 via Frontend Transport; Thu,
 22 May 2025 08:18:50 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EB.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 08:18:31 +0000
Received: from AM8PR08MB6578.eurprd08.prod.outlook.com (2603:10a6:20b:36a::15)
 by DU0PR08MB7857.eurprd08.prod.outlook.com (2603:10a6:10:3b3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 08:17:57 +0000
Received: from AM8PR08MB6578.eurprd08.prod.outlook.com
 ([fe80::bb1a:3ac6:3110:e2d5]) by AM8PR08MB6578.eurprd08.prod.outlook.com
 ([fe80::bb1a:3ac6:3110:e2d5%4]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 08:17:57 +0000
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
X-Inumbo-ID: 5efc8f6f-36e5-11f0-b892-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=XiUQ+wxjWeixToppqnxffnbDdFQadeIZuOpSfCV/SQ+XvS4DoeT5VUOoff7h+afMHhRTZ/t+EujXzA4n7Ha719Ye+U1SXAW1/t2Jd5Ogdzppcg4nK4Fld2biO+LGe5bkkCR+SSIcvF/Qse2HRHzutfzACC1rfjSWgCdWJjkq3hA7+vQj9LQfdntvq4PeKPs6OU9pFsmMTTbzOcFBZ44aODaZwtFqBXz2m+RRygrIafAjGT6M7MayurwBOmvt72koj38JAQtk/5j4SstEM1OWChs4kK+u0Xj3XzkEsttdW8wmiFGz/jBKJXZ8mCP0V7DBq3vVMV1BldeNJbT0OOF1MQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1XRav/QsWkRMbyiOydWxzIelX1zYefLFVrxxInw+rE=;
 b=h8GAUzS1PC9ROwmbp3m3s+xFRoDz9gd59hz1487OR/lJQEq998RZPOiySYMB/nSiEqPs+qP1KoDF4VVjz/8ufb2XNKndj/lFdXtP3sPZQL3JWPNnPoeyJTwrTrhI6w1uxlNfHXUs1eIr9OBreyu+wck71T+HG+0+rJI2fM/TkUNpMjkLM8S2yZpgY7xscRjKyE8ge8ohI1VBKaqxFrMBxGh09uHt9aw8vMvoY4oMI6LdMAAIztLhnKeXbPKBQL/t2ND3YvkCG/AICpBSws5up21h2aDgqQY3aE7HBTltSl2Z7mX/Gx/E1uibwvYkQ6jw7kutkHxQAGIJ8b4j8v5DPA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1XRav/QsWkRMbyiOydWxzIelX1zYefLFVrxxInw+rE=;
 b=K+A93faXnkc39KKABHva1WvOZqSS9IpEayqCwef1PM7pi9ZE9kINchbG1+pbGz/FV812sW04+zZBNV2M35ewLsjU+MW7Hjlex5yP/GoiM0xTp2Bmhm5gbreVYYWloYAidCy4BszHOGK8zw79BKoIz8L/o5BHoziBT1pHPUYJGlc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eUYIF6EWDqGdnc8VnsRYmEQjmauoyBCCiourvv2tWmlS1nhE5ecp1IYpJh8SAiofF2YNcq0DlAfsBRUUJk4NYsbcssOIRm1QKrwoJjqGsyYyLoyJXxiEPViAUHmLi/GSUziqW4UtAaBeDa729OZMv6MQeHmFzI2hgUQVVGthxUSqYc9qemPQrRYdRBvkT1DqsLEMjhfKyq7RmVySDTZWryWRyxK1uSu4bS/XHw4SjU2/0kDykhDEJNfqPPFNuetRlF8Hssy+c5yV/V1R4V4zu0eYGLuxtiAvaFy6EYm/Q4OuEoG524rvYfGnIAO2zk8qQAp1BdihB86R5rqXgSmPKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1XRav/QsWkRMbyiOydWxzIelX1zYefLFVrxxInw+rE=;
 b=fN6H5/WktnXCTdwI0FckpS1/f6ywNhfuoWWFtcXv5oaf9ieYLEcugEAlJYNutBkl/HdE37+YSqB/nuYGzS0ge4RAoxexGu4LeAW7B0Et+4tjAGJD9G/U4x3zsG2rXaS0xDX3nqDU+kCXYj/VB0s906WBsXQatYs6mxS0fGj4F1KaVKrOFq/6Ya0M8eH4V0l0l7FXOjn0Ib7oBVhEel7PKCw47yML1zpDR0C4iqsU+EPg9TEQ1RnkaiWJ+YW4o0l/Nb9CzEp4nRutMlIQRHuTHjLkqLq9yovhN0dLbmpyMj09pvWg66T7pDp5cLYXyiYmOuM6HnQV0CvHzRiUh9GCyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1XRav/QsWkRMbyiOydWxzIelX1zYefLFVrxxInw+rE=;
 b=K+A93faXnkc39KKABHva1WvOZqSS9IpEayqCwef1PM7pi9ZE9kINchbG1+pbGz/FV812sW04+zZBNV2M35ewLsjU+MW7Hjlex5yP/GoiM0xTp2Bmhm5gbreVYYWloYAidCy4BszHOGK8zw79BKoIz8L/o5BHoziBT1pHPUYJGlc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH v5 6/6] xen/arm: ffa: Enable VM to VM without firmware
Thread-Topic: [PATCH v5 6/6] xen/arm: ffa: Enable VM to VM without firmware
Thread-Index: AQHbrqLcLBT6scPDY02nTshBGWfMDLPegcqAgAAE8IA=
Date: Thu, 22 May 2025 08:17:57 +0000
Message-ID: <D2791D4F-C357-43D3-A5ED-6719E5650F02@arm.com>
References: <cover.1744787720.git.bertrand.marquis@arm.com>
 <ec7213548581c176a2328d051aee77bbd8a6d45a.1744787720.git.bertrand.marquis@arm.com>
 <CAHUa44H5K+=eX_OhPMTCsNAeBb-XWMNout0UeLvSyJzYrnXRcg@mail.gmail.com>
In-Reply-To:
 <CAHUa44H5K+=eX_OhPMTCsNAeBb-XWMNout0UeLvSyJzYrnXRcg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM8PR08MB6578:EE_|DU0PR08MB7857:EE_|DB1PEPF000509EB:EE_|GV1PR08MB10569:EE_
X-MS-Office365-Filtering-Correlation-Id: 85c7ba05-e160-4bac-ba93-08dd99093d31
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dmNNUGpkczR3NWhrNmVLM3pGYjNXZ0h3ZFZCRWlaakV2bytaZGhnV29jdzRh?=
 =?utf-8?B?STZiSk56R3BQcmFKM08xWExDOFVjTG9HMHNzc2tVUGdmd3Y5a002eWEzNTE5?=
 =?utf-8?B?dUdGb0w5UDJZd1V2RXFrOVF3aDVOOG1TcjNYSmlHSUtOaUZBaTZtN3VabVFS?=
 =?utf-8?B?OXhSVWM1ZzhzQ29MVUZjV3NCSWJLa01ad0UyYmFCTllIa2lTUk5lSDQ1NTVN?=
 =?utf-8?B?RmVrLzFobzFJU2JYOGJkZndHSGxIV0h2RjVYR3htanFDdDFPemxWZFZ4OWE3?=
 =?utf-8?B?Tis2N3duaDhPTnUydzhFL3JyUEo1ZUlOa2tNeVFObmJzajJLRityT3NYcDUx?=
 =?utf-8?B?WjAwclhtTHhZbSthWWVxNk1WQXh3Vnl4cjAyYzB3cThRZHdPWllJZWZZL2pj?=
 =?utf-8?B?bDR6MEMrZHpNWVhod05sbXo4Ly8yZ1dMYWZWME1oOTM2Y1ZrcGdNdlU1TGhQ?=
 =?utf-8?B?Y1lxamJpSndUc0doa0RxcHFYenZaUCtjOVRMRDdYczBSTGVma0JjNzVnUWFO?=
 =?utf-8?B?VFZuSjBpMTZaeDUwbWJubVdHUm9DbVZ2ZlJGU0J2K0Q1ZHh5U0FOK3NNTGsy?=
 =?utf-8?B?VXpmWWs4d2NxbSs4cWhSZkkvbVNBNmxnVkgrZjRBV1A0RzVWN040Nm12dHZC?=
 =?utf-8?B?Qy8yb0pRckRvYjFMQW9HS1RMMy9vblJxcXA2UDAwQUJpQmM3T2JqVDI4aWJi?=
 =?utf-8?B?djUzRytaNEg0N2Qwb2VLelhKR1Q3YkF4S29TbFJsei9sVDNaY3A5NWRmMGpj?=
 =?utf-8?B?UXJrQTJWYVVmME1paXZUSU9Jb3lCSUgwUGNGc01PNkZFSnQxRW9XcTFXbzRI?=
 =?utf-8?B?VE5hUHNlamNwbS9ma1V2TEhuSFZ5WkU1WldDUzgrcmg3bXVVN1pZVjNwQ2hM?=
 =?utf-8?B?dFRKRlRvTVkxaXdlUlhuK0t6Wk15MU5ycEZWUzFYZGVWMWxyRUNETVBDVzVT?=
 =?utf-8?B?bHU3MTMxaHVodXBxWVV2KzhIdndQU0V5MDczUUwwaHNVVmRLend6TnVDQWcy?=
 =?utf-8?B?dmJIRGdzUUdmMW5MVkVTM1VONFhxS2dPdEZLUUlkR3pFSjZCUmM3NXBubnlQ?=
 =?utf-8?B?UTFMaFUreU9UejhyN3Vyb3A1d1BPTzFaRXhpSGJrNUtMdFcvSzZzL1RnNXBu?=
 =?utf-8?B?K0dacFNqbmRkbG5NTkM2MmdDUlI3ZDNNTnJ5TEp4WHE4RVc3aVJJOHlTWFRF?=
 =?utf-8?B?Wm1RQzZRaFN1WE92VGJZOFZXaWRXdnp5ajhIZ0pZckROL2hkSHc2Yk9MRGlO?=
 =?utf-8?B?WXlEMTRMSFBwc3FWSDlHVjBROTdKMFljK3ZuTlU2aFZEblhvRUo4UFdJRXJ5?=
 =?utf-8?B?aWhXNE9xYytqZUFoaFhkczVrTDF4UjE1REtjOVR2aVBLam5XaW8xbURXL1Zx?=
 =?utf-8?B?YTRZRnpaempQdWxXWmJMSWx5dmxXbVYyanNHNVJvbjN4b1cxUllRMWFualp6?=
 =?utf-8?B?bGIwTUVYTmF3YWdySE56WUxOZkN4RURmUVl2Z3M3VHErSnZzMlhYYVYyeGhV?=
 =?utf-8?B?aklHNXR3bGZyUUpDbnAwUm85K1hlTzIxVVM2Mm1MWVc1aUVqRmdSQVQ0N1c3?=
 =?utf-8?B?ZzYwdHNER3RBbjZTclJxSUljV1J5WHhjQW9EM2VyOXJuSDVzOW1jTWY2MkY1?=
 =?utf-8?B?TVBIUHltVzJ2d0Y0aWV0b0xvNElkVWVpZ1dxS2JPNjd0YjBYSllsZldZNTZo?=
 =?utf-8?B?Ukx4VmxrOHg0cnpmNWhHNlZYc0FLWTNZVWxValVQaVFkWHpKU0t4UjF6Y0c1?=
 =?utf-8?B?T0YxaktEQzJBZ2xkS1FNaEVQeU1TTFIxa2NqbG1aKy9Pem5nVnI4cC9HbndM?=
 =?utf-8?B?dlk4WnN5T3FJL1BCYXVPaWlISXk3Sk1tZkwwbzE5Vng1a29MQndaREJ6dVJJ?=
 =?utf-8?B?SVdmdEtvZ25PT1NpOWo3TlBBS3ZYcTRHTVc3dWNuNGlva0ZDYVVQblo0eGU4?=
 =?utf-8?B?TmFtM2lmQWJQMUpnaHR0RFc2TmNkb1pRTkJaWnFWRTB4OC9VeS91cVlBRDh0?=
 =?utf-8?Q?hzTmpkGFHP25IrSfv299nIP/5QHt+o=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR08MB6578.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D348F84B2427A45A4F75E29A6902C09@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7857
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EB.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b45c3bbd-341d-4ad9-f7eb-08dd990928b9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|14060799003|376014|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXFzT3BiV1VHMGRFanlhcUtGOUZtRHAvTWlBZ1MwTmJPOENpTFArb1pTM1Nm?=
 =?utf-8?B?TmRBL2RCd3l3Y3lNK3FCM2VLSm1Gc1Fxc0RZMG5sMmNZa011NnNaMlUwQmMx?=
 =?utf-8?B?a3YxcWtBSDVXaTh2N2NjVUdLbk1iaEVYL2dmSjJkamJFdnhoUXZNR3JSVi9D?=
 =?utf-8?B?a3prNW1vbFNGU0tNZGZIb3k2MjBRemdSRkxzanVmSFpmZWRRVTdaWXR0bE1T?=
 =?utf-8?B?TzYvemhsTmNrZEl1WWlQaVNLN0tuMmZTSk02OGJkSHhWdUVDTklLZUpHaGNT?=
 =?utf-8?B?OGxyK1NQNjBmNFo2MlI1R01yQnlIT1d5OWZOa1hFWStoNGNYZnc2ekVJZkpG?=
 =?utf-8?B?bVFhbmdVU2tyLzZhd1VHcG1iVEk4RDNpZkt0bnhMeG8wY0wrcHVranNBSXNN?=
 =?utf-8?B?bG00Zjg4d3E0Y0xtRVJ1cER2UFlvbjJFQzBqRmNrU3NLSmo4eWJtd1ZiMytT?=
 =?utf-8?B?d1hPNlBTQ01xOVduUG5VcEJjeUpNTXFhZUZ5c3FyMzFsdUl6MUJhN0xobXZ4?=
 =?utf-8?B?ZUNIVjRYVUZHZHllNDF5LzN4Sjd5Yk5NZ3M1M3U0SUJVbWRoNWZXRlpmRjJi?=
 =?utf-8?B?cVRSLzhGYTdWL0VpNWFaTnM4Wnh5bmJsdmpDdWsxejNNTFdOQ3ltZmNlY2pm?=
 =?utf-8?B?dWVQWldpV3dmelRZRzdJbUk3LzRZem90S3ZZREFPdHNpWkt0T0RmN1BieFNV?=
 =?utf-8?B?anRHODVpRXBYaS9VdzNaUk1wSUpCa2VGMFE2Z2lYRTVhYjVOcXMybHFXcFF5?=
 =?utf-8?B?OFVNcHYyNUhDb2twVmRtc0h2NmYwd1BXcTFYa1hrWVFJTTZSaTRuN3FvTzVW?=
 =?utf-8?B?RDVKTkl1ejF4Y2k4MjRveU1RWjBDUXcrek0wS20rd0ZTdWVkNXhiQnQxRUkr?=
 =?utf-8?B?cTdNTUF6ZmxBUExXSUdhRys3MjQrMklrUk5IeDJhTXp3TWgzRExnKzk2VTFw?=
 =?utf-8?B?ZTYzdXVFNGFGKzQzSnlta0c5SnJaVXBoWG9QazlSM0dHcURlYlRnZ0xZdEVU?=
 =?utf-8?B?SXdTSGI1VEEvY3Q1cWc5c0N4ampRbFJOaFpyUDhDVEV0b3FjSmRuS3JIa0Zx?=
 =?utf-8?B?aXpVSCtvZ0FqNE1LR3VLVnhydDY2bnRpNmZvcUVUa1l4cVc2RzNvc0p0U01z?=
 =?utf-8?B?L0NaU0g2RDlxUFFueHB1a1hBT2xIQmpWODJaeWZtSnFhM1RCTHhqYzZQc0hK?=
 =?utf-8?B?YWd3Mnc2NkpybnNnUkozQkgxLzhuTEdKUzFadVlxQUxYS3FFTHBFMEhqVWRE?=
 =?utf-8?B?dHVvclp2QlJKWlpRc0lYMFkxRWhuY1N5NVYvWTlYOUJNWWZNSlJDbzkwMVc1?=
 =?utf-8?B?VE1BcmxXS3Rtbzd5eDhNMjVjNHdMVUNNbnJ2S29vaGpJck1veXFRclJwNzdy?=
 =?utf-8?B?a1VFSWc4dTVwWWFjcEtjWUxsWmVZL2JFQlFDeWMzN0Q0VFZoNzM1bUI2bXor?=
 =?utf-8?B?TWlpYXZFVjNiTGZSc1FKOVlvQTBzRHVKdy9JckJlUDVhMUtSOC9qanV0bmNN?=
 =?utf-8?B?bUp6WjR3YUN4Mmd5MkIrVVl3a1VqcEtUdE9vcUZrbHBKWjhrc2xFWksyLzRF?=
 =?utf-8?B?SDlRRmxGc3NHUkRRVXBYMStHOFNKdVNwV2dTL3pody82bklOc2J4SVp1TjQ4?=
 =?utf-8?B?V0NGQ2pzNGtXSHZhbWY1L20wQlpVOUsydDlXK1RCbzA0WmR5U1loTFNYR01P?=
 =?utf-8?B?blFuUmRia1BnWlFFbDBxejFveTVYMllkZ2V6d0ZZTWxKeUxTRS9NVE85Y1pV?=
 =?utf-8?B?Zlo4OHRyMzA0MWNUYkxuRXlTVzN2V0NhL2pNcDZ1dEpqS1RqNGhERnpZNktS?=
 =?utf-8?B?aFNLNGEwZ25KZ1FPeW4wOEo1NXBaNVhpNFBRNm9xT3FHejlDaFYyTWh5Q0tB?=
 =?utf-8?B?SHNYWG0yLzMzY1VNRmFMbms1eHNqdkoxbnJIanJvS21idnR0ZEJpNGFyNmxV?=
 =?utf-8?B?cEVHanB2UXpzU0RZSXdZblpuTFQ1SDdoK1gwQ3dEOElndVFEakN0RDhmbllp?=
 =?utf-8?B?VlZoRm9ObE9jRkhXOUpRR2JjQ09Wa3J4bGRkRGtMZGpwK2ZKSkFBYlhQNjFH?=
 =?utf-8?Q?/gE4G/?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(14060799003)(376014)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 08:18:31.5800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c7ba05-e160-4bac-ba93-08dd99093d31
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10569

SGkgSmVucywNCg0KPiBPbiAyMiBNYXkgMjAyNSwgYXQgMTA6MDAsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiAN
Cj4gT24gV2VkLCBBcHIgMTYsIDIwMjUgYXQgOTo0MOKAr0FNIEJlcnRyYW5kIE1hcnF1aXMNCj4g
PGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+PiANCj4+IFdoZW4gVk0gdG8gVk0g
c3VwcG9ydCBpcyBhY3RpdmF0ZWQgYW5kIHRoZXJlIGlzIG5vIHN1aXRhYmxlIEZGLUEgc3VwcG9y
dA0KPj4gaW4gdGhlIGZpcm13YXJlLCBlbmFibGUgRkYtQSBzdXBwb3J0IGZvciBWTXMgdG8gYWxs
b3cgdXNpbmcgaXQgZm9yIFZNIHRvDQo+PiBWTSBjb21tdW5pY2F0aW9ucy4NCj4+IElmIHRoZXJl
IGlzIE9QLVRFRSBydW5uaW5nIGluIHRoZSBzZWN1cmUgd29ybGQgYW5kIHVzaW5nIHRoZSBub24g
RkYtQQ0KPj4gY29tbXVuaWNhdGlvbiBzeXN0ZW0sIGhhdmluZyBDT05GSUdfRkZBX1ZNX1RPX1ZN
IGNvdWxkIGJlIG5vbiBmdW5jdGlvbmFsDQo+PiAoaWYgb3B0ZWUgaXMgcHJvYmVkIGZpcnN0KSBv
ciBPUC1URUUgY291bGQgYmUgbm9uIGZ1bmN0aW9uYWwgKGlmIEZGLUEgaXMNCj4+IHByb2JlZCBm
aXJzdCkgc28gaXQgaXMgbm90IHJlY29tbWVuZGVkIHRvIGFjdGl2YXRlIHRoZSBjb25maWd1cmF0
aW9uDQo+PiBvcHRpb24gZm9yIHN1Y2ggc3lzdGVtcy4NCj4+IA0KPj4gVG8gbWFrZSBidWZmZXIg
ZnVsbCBub3RpZmljYXRpb24gd29yayBiZXR3ZWVuIFZNcyB3aGVuIHRoZXJlIGlzIG5vDQo+PiBm
aXJtd2FyZSwgcmV3b3JrIHRoZSBub3RpZmljYXRpb24gaGFuZGxpbmcgYW5kIG1vZGlmeSB0aGUg
Z2xvYmFsIGZsYWcgdG8NCj4+IG9ubHkgYmUgdXNlZCBhcyBjaGVjayBmb3IgZmlybXdhcmUgbm90
aWZpY2F0aW9uIHN1cHBvcnQgaW5zdGVhZC4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogQmVydHJh
bmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KPj4gLS0tDQo+PiBDaGFuZ2Vz
IGluIHY1Og0KPj4gLSBpbml0IGN0eCBsaXN0IHdoZW4gdGhlcmUgaXMgbm8gZmlybXdhcmUNCj4+
IC0gcmV3b3JrIGluaXQgYSBiaXQgdG8gcHJldmVudCBkdXBsaWNhdGVzDQo+PiAtIFJlbW92ZSBK
ZW5zIFItYiBkdWUgdG8gY2hhbmdlcyBkb25lDQo+PiBDaGFuZ2VzIGluIHY0Og0KPj4gLSBGaXgg
T3B0ZWUgdG8gT1AtVEVFIGluIGNvbW1pdCBtZXNzYWdlDQo+PiAtIEFkZCBKZW5zIFItYg0KPj4g
Q2hhbmdlcyBpbiB2MzoNCj4+IC0gZml4IHR5cG9zIGluIGNvbW1pdCBtZXNzYWdlDQo+PiAtIGFk
ZCBzcGFjZXMgYXJvdW5kIDw8DQo+PiAtIG1vdmUgbm90aWZpY2F0aW9uIGlkIGZpeCBiYWNrIGlu
dG8gYnVmZmVyIGZ1bGwgcGF0Y2gNCj4+IC0gZml4IHwgcG9zaXRpb24gaW4gaWYNCj4+IENoYW5n
ZXMgaW4gdjI6DQo+PiAtIHJlcGxhY2UgaWZkZWYgd2l0aCBJU19FTkFCTEVEIHdoZW4gcG9zc2li
bGUNCj4+IC0tLQ0KPj4geGVuL2FyY2gvYXJtL3RlZS9mZmEuYyAgICAgICB8ICAyNCArKysrKyst
LQ0KPj4geGVuL2FyY2gvYXJtL3RlZS9mZmFfbm90aWYuYyB8IDEwNCArKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4gMiBmaWxlcyBjaGFuZ2VkLCA2NyBpbnNlcnRpb25zKCsp
LCA2MSBkZWxldGlvbnMoLSkNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90ZWUv
ZmZhLmMgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jDQo+PiBpbmRleCBjMWM0YzA5NTcwOTEuLmI4
NmM4OGNlZmE4YyAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS90ZWUvZmZhLmMNCj4+ICsr
KyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhLmMNCj4+IEBAIC0zNDIsOCArMzQyLDkgQEAgc3RhdGlj
IGludCBmZmFfZG9tYWluX2luaXQoc3RydWN0IGRvbWFpbiAqZCkNCj4+ICAgICBzdHJ1Y3QgZmZh
X2N0eCAqY3R4Ow0KPj4gICAgIGludCByZXQ7DQo+PiANCj4+IC0gICAgaWYgKCAhZmZhX2Z3X3Zl
cnNpb24gKQ0KPj4gKyAgICBpZiAoICFJU19FTkFCTEVEKENPTkZJR19GRkFfVk1fVE9fVk0pICYm
ICFmZmFfZndfdmVyc2lvbiApDQo+PiAgICAgICAgIHJldHVybiAtRU5PREVWOw0KPj4gKw0KPj4g
ICAgIC8qDQo+PiAgICAgICogV2UgYXJlIHVzaW5nIHRoZSBkb21haW5faWQgKyAxIGFzIHRoZSBG
Ri1BIElEIGZvciBWTXMgYXMgRkYtQSBJRCAwIGlzDQo+PiAgICAgICogcmVzZXJ2ZWQgZm9yIHRo
ZSBoeXBlcnZpc29yIGFuZCB3ZSBvbmx5IHN1cHBvcnQgc2VjdXJlIGVuZHBvaW50cyB1c2luZw0K
Pj4gQEAgLTU3OSwxMSArNTgwLDggQEAgc3RhdGljIGJvb2wgZmZhX3Byb2JlKHZvaWQpDQo+PiAg
ICAgICAgIGdvdG8gZXJyX3J4dHhfZGVzdHJveTsNCj4+IA0KPj4gICAgIGZmYV9ub3RpZl9pbml0
KCk7DQo+PiAtICAgIElOSVRfTElTVF9IRUFEKCZmZmFfdGVhcmRvd25faGVhZCk7DQo+PiAtICAg
IElOSVRfTElTVF9IRUFEKCZmZmFfY3R4X2hlYWQpOw0KPj4gLSAgICBpbml0X3RpbWVyKCZmZmFf
dGVhcmRvd25fdGltZXIsIGZmYV90ZWFyZG93bl90aW1lcl9jYWxsYmFjaywgTlVMTCwgMCk7DQo+
PiANCj4+IC0gICAgcmV0dXJuIHRydWU7DQo+PiArICAgIGdvdG8gZXhpdDsNCj4+IA0KPj4gZXJy
X3J4dHhfZGVzdHJveToNCj4+ICAgICBmZmFfcnh0eF9kZXN0cm95KCk7DQo+PiBAQCAtNTkyLDYg
KzU5MCwyMiBAQCBlcnJfbm9fZnc6DQo+PiAgICAgYml0bWFwX3plcm8oZmZhX2Z3X2FiaV9zdXBw
b3J0ZWQsIEZGQV9BQklfQklUTUFQX1NJWkUpOw0KPj4gICAgIHByaW50ayhYRU5MT0dfV0FSTklO
RyAiQVJNIEZGLUEgTm8gZmlybXdhcmUgc3VwcG9ydFxuIik7DQo+PiANCj4+ICtleGl0Og0KPj4g
KyAgICBpZiAoIElTX0VOQUJMRUQoQ09ORklHX0ZGQV9WTV9UT19WTSkgfHwgZmZhX2Z3X3ZlcnNp
b24gKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBJTklUX0xJU1RfSEVBRCgmZmZhX3RlYXJkb3du
X2hlYWQpOw0KPj4gKyAgICAgICAgSU5JVF9MSVNUX0hFQUQoJmZmYV9jdHhfaGVhZCk7DQo+PiAr
ICAgICAgICBpbml0X3RpbWVyKCZmZmFfdGVhcmRvd25fdGltZXIsIGZmYV90ZWFyZG93bl90aW1l
cl9jYWxsYmFjaywgTlVMTCwgMCk7DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgaWYgKCBJU19F
TkFCTEVEKENPTkZJR19GRkFfVk1fVE9fVk0pICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgcHJp
bnRrKFhFTkxPR19JTkZPICJBUk0gRkYtQSBvbmx5IGF2YWlsYWJsZSBiZXR3ZWVuIFZNc1xuIik7
DQo+IA0KPiBUaGlzIHNob3VsZCBvbmx5IGJlIHByaW50ZWQgaWYgZmZhX2Z3X3ZlcnNpb24gPT0g
MA0KDQpSaWdodCBpIHdpbGwgZml4IGJ1dCAuLi4NCg0KPiANCj4+ICsgICAgICAgIHJldHVybiB0
cnVlOw0KPj4gKyAgICB9DQo+PiArICAgIGVsc2UgaWYgKCBmZmFfZndfdmVyc2lvbiApDQo+IA0K
PiBUaGUgZWxzZSBpc24ndCBuZWVkZWQuDQoNCnRoZSBlbHNlIGlzIG5lZWRlZCBzbyB0aGF0IHdl
IHJldHVybiB0cnVlIGFuZCBub3QgZmFsc2UuDQoNCldlIGhhdmUgMyBjYXNlczoNCi0gZmlybXdh
cmUgaXMgdGhlcmU6IHJldHVybiB0cnVlDQotIGZpcm13YXJlIG5vdCB0aGVyZSBidXQgdm0gdG8g
dm0gZW5hYmxlOiByZXR1cm4gdHJ1ZQ0KLSBvdGhlcndpc2U6IHJldHVybiBmYWxzZQ0KDQpJIHdp
bGwgbW9kaWZ5IGl0IGxpa2UgdGhpcyB0byBtYWtlIGl0IGNsZWFyZXI6DQpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL3RlZS9mZmEuYyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhLmMNCmluZGV4IDU3
YjY0OGEyMjg0MC4uNzY4YjRlOWVjOTY4IDEwMDY0NA0KLS0tIGEveGVuL2FyY2gvYXJtL3RlZS9m
ZmEuYw0KKysrIGIveGVuL2FyY2gvYXJtL3RlZS9mZmEuYw0KQEAgLTYwMSwxMyArNjAxLDEzIEBA
IGV4aXQ6DQogICAgICAgICBpbml0X3RpbWVyKCZmZmFfdGVhcmRvd25fdGltZXIsIGZmYV90ZWFy
ZG93bl90aW1lcl9jYWxsYmFjaywgTlVMTCwgMCk7DQogICAgIH0NCg0KLSAgICBpZiAoIElTX0VO
QUJMRUQoQ09ORklHX0ZGQV9WTV9UT19WTSkgKQ0KKyAgICBpZiAoIGZmYV9md192ZXJzaW9uICkN
CisgICAgICAgIHJldHVybiB0cnVlOw0KKyAgICBlbHNlIGlmICggSVNfRU5BQkxFRChDT05GSUdf
RkZBX1ZNX1RPX1ZNKSApDQogICAgIHsNCiAgICAgICAgIHByaW50ayhYRU5MT0dfSU5GTyAiQVJN
IEZGLUEgb25seSBhdmFpbGFibGUgYmV0d2VlbiBWTXNcbiIpOw0KICAgICAgICAgcmV0dXJuIHRy
dWU7DQogICAgIH0NCi0gICAgZWxzZSBpZiAoIGZmYV9md192ZXJzaW9uICkNCi0gICAgICAgIHJl
dHVybiB0cnVlOw0KDQogICAgIHJldHVybiBmYWxzZTsNCiB9DQoNClRlbGwgbWUgaWYgeW91IGFn
cmVlLg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCg==

