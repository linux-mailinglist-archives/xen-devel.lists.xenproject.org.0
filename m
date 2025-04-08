Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E029EA812CA
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 18:49:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943135.1342024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2C87-0004Qa-4v; Tue, 08 Apr 2025 16:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943135.1342024; Tue, 08 Apr 2025 16:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2C87-0004OV-2J; Tue, 08 Apr 2025 16:48:55 +0000
Received: by outflank-mailman (input) for mailman id 943135;
 Tue, 08 Apr 2025 16:48:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wetR=W2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u2C85-0004OP-EK
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 16:48:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2613::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57645cce-1499-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 18:48:47 +0200 (CEST)
Received: from CWLP265CA0309.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5d::33)
 by AM8PR08MB5764.eurprd08.prod.outlook.com (2603:10a6:20b:1d2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.28; Tue, 8 Apr
 2025 16:48:44 +0000
Received: from AM3PEPF00009BA1.eurprd04.prod.outlook.com
 (2603:10a6:401:5d:cafe::f1) by CWLP265CA0309.outlook.office365.com
 (2603:10a6:401:5d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Tue,
 8 Apr 2025 16:48:44 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009BA1.mail.protection.outlook.com (10.167.16.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Tue, 8 Apr 2025 16:48:44 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 VE1PR08MB5712.eurprd08.prod.outlook.com (2603:10a6:800:1a8::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.35; Tue, 8 Apr 2025 16:48:10 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 16:48:10 +0000
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
X-Inumbo-ID: 57645cce-1499-11f0-9eaa-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=lbHyqgdaOq3M1EvhvlAyfcEYs3TCaB7idoYtIOxyBPYSdTxGa0+Yc/tqTpNQNmsj86mFjLvXsMtY4MHtTw0IwmoevmCfR788R8VkNlhQ+DUSivQZeZzWT357+0leS7y0iDngj5FHBlPM3ZfKbWodPk3EZ0Prr4Yq1tD2afH5RwjU/5dCRKrwlWUVNRVRzG4Iajg6OYNPSZB9iaS0ypwqK7pQwGSq/sSGcITf0xdoaevgAaUyQsvLn0OJWvlHSXVcqaG4ra4ek3JoCjmMrwAMdOM4XIaXBv1vC5B0jOpFcyK7AlExr1e+IHOWzF5bExf5VRLtACDafwCJ9do1o2xohA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6Pp9KzJTE8dExpoLZhAL/6alg3HrjlasVcZjOahRYo=;
 b=nlWYC9mci2B4HNVamVvL6ch/m9BwkO3Kx4ZYs4xpuOv/cINpb/Ebb9Svm4RMSUPEw3FCkzjV/RGJ0U6ThWRgF9ircoOMWOjCkVVvJF6ZVZj6gtcxin4rnypX15/EYRA0djhVqMXOkEsiVRCAAzKu4U3G5E5+PFqOCz+qXJRR5WlQc40JwDqzbRaKttCUoRRWH0BDK7c3Wju93grSAiLxiJEpjOfWM6avcgg4Bpg/l4oOcezUYJEBwOrkRQ3XM+xYadgv+UCMp0bW1oC10xBAFZJ4B5go70v287zkmYEvk3kMU6DXyOcvQo0yX2yjvEe7mEqQX27fW5d0wRMFGVrusg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=permerror (sender ip
 is 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6Pp9KzJTE8dExpoLZhAL/6alg3HrjlasVcZjOahRYo=;
 b=o78Hww303udD50InP9mAYGkXxx0Fr1YuqU51M3ShX4g4qcVIYNHrTEASVPpebsuMSbs8U8l+fVU1ciDydRfZ/wpnZnX9OznKuEYXPqOtH/PHe9wTHdfEytvvfXiPq+uJpOKBtLpBN0Yj1wofh477ch/CURMzlkewDBKI0LvmmC4=
X-MS-Exchange-Authentication-Results: spf=permerror (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: PermError (protection.outlook.com: domain of arm.com used an
 invalid SPF mechanism)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wNJQDNTkVy+GOwPWnQE4w0npWoMsSxpzLfB9CURKW279YJdXMpysI53rxSmJVhh7p06ZNv0fEUfVmCjqPfCwO512Ipn8b5YHse+PmoI6/zeIopI0ioZ1ym4NX0ldIozqKdP/O2JoVHjUKY1ZFT3CY5Lmw5oHGeIKnUso/N8hfUVX1LAPkIGbirUvvetAlTtayYYld63zM3CIvShDN5t+b9FVrK8cBUTlPPLwqrgXpxt3PD9++TNQ2Y3FY0HFCOMf4q+XH0uPu/GtAGc5qkXLG3I3nNTdd0kywIMLWatuEVkD3sxsocRHzOjP7VcE/vwdL2Gj0N0gTT2Lcf4Jhom5og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6Pp9KzJTE8dExpoLZhAL/6alg3HrjlasVcZjOahRYo=;
 b=RKIG4+9amHcByq9DUl18iZu6PrIhdr4qZu217U5cwjg2Zb3Rk/F0GGa69RU04jZvxbMtEnpaJoEWfCMqAn7d7PvMdweciAyb1uBi4Rx+YE7s6TW7fg/MrPJKZUOxmDx0y/v/Ur+NBBQis2D8iPc23Ght4RnwG/ZrOV0V97VbfYe4+xpdKsqhG8ig1PSMdFqmHoCORAaxAGlIZAuLzD3Vl8HHuYDQzVptzD03x6krXtkQ9fB/FWVWdYsrWJJiW0cP51vZHm3OxQH0NwQmL7mzLU33Bh08XXjq2mzn0HCaKujfW/8LWYWfDEZAWY+hKy5nwXViKs4BroUrK5RyXfGDUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6Pp9KzJTE8dExpoLZhAL/6alg3HrjlasVcZjOahRYo=;
 b=o78Hww303udD50InP9mAYGkXxx0Fr1YuqU51M3ShX4g4qcVIYNHrTEASVPpebsuMSbs8U8l+fVU1ciDydRfZ/wpnZnX9OznKuEYXPqOtH/PHe9wTHdfEytvvfXiPq+uJpOKBtLpBN0Yj1wofh477ch/CURMzlkewDBKI0LvmmC4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 2/7] arm/mpu: Provide access to the MPU region from the
 C code
Thread-Topic: [PATCH v2 2/7] arm/mpu: Provide access to the MPU region from
 the C code
Thread-Index: AQHbp52Ro+Yg+pQClU+WnJSxei+hH7OZzl8AgAAHm4CAACKVAIAABC6A
Date: Tue, 8 Apr 2025 16:48:10 +0000
Message-ID: <40C7A4DC-0216-4981-A501-AFDA0E8671DD@arm.com>
References: <20250407091430.2342709-1-luca.fancellu@arm.com>
 <20250407091430.2342709-3-luca.fancellu@arm.com>
 <0acf63c0-267e-44c0-b629-fa576307497c@amd.com>
 <1AC85CBD-02B1-4AA4-B9A3-68DFC06137AA@arm.com>
 <4f860a56-5536-455b-9490-196bfc220556@amd.com>
In-Reply-To: <4f860a56-5536-455b-9490-196bfc220556@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|VE1PR08MB5712:EE_|AM3PEPF00009BA1:EE_|AM8PR08MB5764:EE_
X-MS-Office365-Filtering-Correlation-Id: 50406d55-a971-41fa-3ee5-08dd76bd396d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?K044S2RVWGl5blNzL1l6MUtRMzhLSHRHZHpRMFo4RGxiNFBkMWpjMGVMMHYv?=
 =?utf-8?B?L3lkcWNFUWRMMHBwL01reWdtV0pGS2ZRUEdVaUE1VnM3SjhENE1xN1JhWnJB?=
 =?utf-8?B?dUlNeCt2aW1qOVp0RDRwbThOU0NFWDNzT3kvYzhNWWJtV29XcEFaMHFsVFVh?=
 =?utf-8?B?dFl6Y2VJRnAyOU9MZ1ZPMlM5Z1JWa2loWjFjeFVDTTFaM2djeHhTVUg2Y0NP?=
 =?utf-8?B?b2xxamNMdXdVRVhTa0hZdEZmSHBJdVVvTXBra1Z4MXNzRE9SNFVwL243QitZ?=
 =?utf-8?B?WUlxN2Joa3lyUS9WT3E1aG5TRHdBU2dYajc1TWF3MzBtdEIyaDkvamxkWVAr?=
 =?utf-8?B?dTE3T0ppQXh4dTgrK05jbGdaZmI4RTU2blFQM01DSEkyeDhwM0VoUUJtcGI1?=
 =?utf-8?B?TzVwZU1hVUs3VXFjZnJ2U0N4Y2VsWlc5YW1nRWtzYUxOWFF4eTVFYVp6eW1B?=
 =?utf-8?B?Q2svY0JPZldPdzVvYytJK3kzeEQyMUpRU0lxRFJQK3Yrc0lEamw5YklUKzRQ?=
 =?utf-8?B?Z2tTaENOQWtHMzV2RHFBQXVoVk9BUHhhK1VsQVhwdkNYb0UrSGtPRVBqUjFE?=
 =?utf-8?B?K2l3b0VnaU02LzJaVFk1WHB4M0FITkpGRGxVcTQvV1ZVTUJzS0VJenNXM1Z0?=
 =?utf-8?B?WnZIejdBeTdYeEpXQk5DUCt0MFVCV01lTWNIQUhSZ1R4eUEwTVJ5WEwwQXIr?=
 =?utf-8?B?THJtbkorR0tIclZmMjhaQnluaVkyQnNGeDdPNjhCOWJZTERZc0xiUU16VW5Y?=
 =?utf-8?B?ZVFQMGNUdGU5L1A1WDhGNG00YzFPa3hLVXRGdUxoVTE5cmRRY3p3UlUvY3Z3?=
 =?utf-8?B?WVBLblZ2eFhDbU02eG1FMmZVK1dJRW0rY3FmNlcwOXdMRVlaaHFGRnNzY3ZY?=
 =?utf-8?B?czdzUGZMd0JPd3Roc01qWm02dmJKYklpem5hZ0lLSk5tTXFhS1A5UERQdFBy?=
 =?utf-8?B?YTZCcHRXcDNSSGhocjZyQnUwTXA3L2lKdkdlcit2b05SNTZrWEwyNWl2bk5Y?=
 =?utf-8?B?N1pZUDBBdVJhMlRmczR4aWM3UFpWT3pHcWdCdDUrRjdzd21mWlVyUi9rSVov?=
 =?utf-8?B?VEtINGtzV1RBSjE2TW1sVS9IL1lnUWVMVjI5eXdTdW5hZHgxVVVlRDh5MGpl?=
 =?utf-8?B?YjMwaFFIemlpMjA2WnNXUmVKVS81b0kvOGZmR3hSNjdsY0p1RzZZR2liU3k5?=
 =?utf-8?B?SzBHMGljQVNwZ3N3OWxPSm1saHp1K1M1c0NwUVhHMTFIZUJ2VHhwbTYrZGVi?=
 =?utf-8?B?ZzJPb2ZGb2xJNURuWVZCeHBFako2dEZBNVl2WDF1aTdzaEFUeFNVU3pxT042?=
 =?utf-8?B?N250M3RXbit5MW9rMnlZSjRnbDd2cUV6TUV1aWFTMS8xQXk5UkpnRG1oZWQv?=
 =?utf-8?B?YmVXMU1ueGNzR01rRFBBMFd2dU5KQ0dRb1R4Sm45bk5mSzRha0J4MTBuaWps?=
 =?utf-8?B?cXJGcVpVdzgxV3V4OGFudldPcUxBOXRGeHROWnFkaER0VUIvVXNRQ2M3UzVZ?=
 =?utf-8?B?TzhHSlZkVi93OTRmdGpxLzRXZ1pHUnhXMnYxUjRRL1NpV1lreVlTb0Vld09w?=
 =?utf-8?B?QWlCNG1aUy9Xc3NjUEV5aGNibWJidEhnQjl5akFKb0lHQ3Jtb25mNkdsYTNz?=
 =?utf-8?B?a0svMGZ6ZzdWYlZpZ2k4RzY2Z1VMR3RpTURMbmFxSVdza3pMbGIxbVY2VlEw?=
 =?utf-8?B?VHEzb0FVNnpjTDduemRJZDlwSGVqUTk2bWd4OXp4R3pYaVdwbHdPUFVwQ2k2?=
 =?utf-8?B?S0gvM2NIVmQyNWpPaStnMHRlSFczbk8vbkdHZWJldFZtSmxXT1plS0VnYkNw?=
 =?utf-8?B?UzRlYTFQRDZRcFkwQkhhL0tOQ3IxeFRkczhJZEtmTHhaTHFLd2lRaHJqVTlK?=
 =?utf-8?B?dTJEYjZ5NklKQldMUDBNanZiOWNPUlhFcm8yRXU1aFNXTDdZa0o0bjJsNWRq?=
 =?utf-8?B?dSt2ZzRQdldOZlo0dmFhbDRRaWY1NmVlT2o1aFRTK3czSnJCNmhZSWhhVk81?=
 =?utf-8?B?SkN5c3M2K2RnPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F695A5AB295DC4893A68664ED88111E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5712
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009BA1.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0582f394-833a-4582-ca65-08dd76bd2543
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|35042699022|14060799003|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TnRhWmF6RkhzdXowa1ZvVmVaZjhkWEFhRmtTVWYrN2VPTHZWSTRMZ090Z2ow?=
 =?utf-8?B?L0ZNUmZhcTNheW90ZysrdlRjYWZVVEEweFlEY2kwZXlVd0ZPZzJDTktpbjkx?=
 =?utf-8?B?N0VIQkNXeERJZnNiVmFGMXlCcFVBOHJ1djFqZ3RGU2M5L2lFYXMwNTZ6NWlO?=
 =?utf-8?B?ZFRNenpGSVl0UTROUHNQSHdGSXpLTjJXZVkxMGpUQWZoUkQveGRlMmczeWs3?=
 =?utf-8?B?cDV6MEpPVTlXbmxYRHcrWDlpYTNMaUs5amo2VlNXaUR2c0tnMGpaOHFZQ3pT?=
 =?utf-8?B?d2tiK21KUDIvRUZUaW1zVVo0V0Y1OExJV213R2RpUjZHK2hBRTZqSjZHcHNj?=
 =?utf-8?B?NG94UEpXYTFSS1V0TjVZd2xyQyszTGRaeEg5TTJWeFc2TXhaMUpTdFBHM25r?=
 =?utf-8?B?eEdkVmpranU4YlUxOVl1aDc0aGQ5ellMa2JGRXdlRzZYYXdVU0dDMGRVUmhr?=
 =?utf-8?B?akM2ekpPQjhvUmFYWjV0UDhubDhKUGwvNExFcXROd0VPRVdHUHVid1pMcGYy?=
 =?utf-8?B?Zk83U0pGT214ZDZjQzJla1FPM0pkZU13VjBHQXc3WXo4Q2g2TGI0S3lqRzVr?=
 =?utf-8?B?c0U2ZFBsZFV3WHd6eUVlZkxGOHZOTm9CclBKdEFwamlBL2VibHFydXAwUUZT?=
 =?utf-8?B?SC9nSVRBZG9VZENHRy93ZkJ4THZPOXcvMWtTZU5rWlpFVEJVd0dZYW5BNDF4?=
 =?utf-8?B?aVpMQTZpT2dJWGl3OEJTL3N3NUIwc2ZNNC9pTVhLMGE4cytVL3ZjVEMvUG4y?=
 =?utf-8?B?Vm1NbGwwb2RTMjE0Q0p1Y3VJMU1CTUlaTk5hVncrazJQYXl1ang2QktkbTh1?=
 =?utf-8?B?dEVSbFJ5WEVZdUJhMzhXZXNHTWQ5bkJCTXA2NFJ6dVczZmc5djZyT2libVlP?=
 =?utf-8?B?Slc0aG5rL0tnZVdZblBweVJ1Tkl1dlUrYkpwd3NPdGd6Vmp6UU5KZVRwMTh2?=
 =?utf-8?B?YmVRM1FCSWE1QTVPSlN5Wm53VUpXMXZkWURIY1hxcG1KQ25xOUQrazExVXlG?=
 =?utf-8?B?Mms1QUh3NkJvanN6Mk9iRHRFMWpiNFVqRStkRFAzL2RZMU5pWjQwdHF3d0Na?=
 =?utf-8?B?UmVTU2pVQ0JoNDBjS0pvSjhxam1BK0VlVnVnbXlVTWJlU05jcUhhM3JIUnFo?=
 =?utf-8?B?S2NPdlBTcjdtckZFcm8zdUE5VEJwRjR2dlBBc21kaDZxZkRhcW5JVXg2bjlr?=
 =?utf-8?B?U1pQbU9BMnJQelNpcExLbEZKR0JYbkNIMVJPbE1iUWU3K2RwUUZ1bzNFa09z?=
 =?utf-8?B?TkNMV2x0ZEphQnZvUDRha2M3TnRINU50cUI1WVl3Wm9uNW1sb2x0aTRNUzQr?=
 =?utf-8?B?QS9UNGRlZklka0xZd1ZheVZnRXRaaGdKT05UT1RmbzhCampXK1VVUDhwSmNB?=
 =?utf-8?B?ZmxqaXJWMDl2RVRmWDRBNENGS1gzQ2lPTG5mOEZLb3dobEZIUndpMmh1Tmpp?=
 =?utf-8?B?ZExOYUZWOUVIb3lxdDVtUm01OUMwWXpMT2hKcGZhd05XSVp3V1BJeWptcnlY?=
 =?utf-8?B?MWV0N1FTcWw2MnBhVXcvN3haZ1Zzekczd1R1dlpWbGdzZ0JoNmNTb3ZpQXdQ?=
 =?utf-8?B?L0tycFNBbVR3ZVowSFYvMDV2WWtZMytQTmpiN0lDSEhpYld4ajFiaExrMjVH?=
 =?utf-8?B?L1ZScmMzV1RqYW5rcFZJVmJNY1J1L21oNzc2elBnNmZGclVHenN6SnB4NUJP?=
 =?utf-8?B?eDZybG1QZk1oOHVJSXdrRUVCRi9UTGNVWkVuTFhkR1ZIOTRNWUxCNG1uYmZv?=
 =?utf-8?B?ckVBZkdySlBqOVJCV0RKTWhHRXdiamFBeWkvb2cyb3N6TnBZUXQ4ZnN4RnI0?=
 =?utf-8?B?NVowYnZXaUkzaVIweUJBeEdqczg1WWlybEQva25OdFNRdWxMNTFFbklhVEZ2?=
 =?utf-8?B?c3JON3ZuWVBNa0xOMCtZZjQ1NTR2bFZDZzBxYXVaZ0lkc2hFNVBUbTNwaTZm?=
 =?utf-8?B?bmFQUUg0QjV5Q0c0clBnR2FlbUVqNU83QklMZ2VXNHpHTXU0Nm1WS00xQ1Ry?=
 =?utf-8?B?SGtxa0gvVTJ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(14060799003)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:48:44.0054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50406d55-a971-41fa-3ee5-08dd76bd396d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009BA1.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5764

DQoNCj4gT24gOCBBcHIgMjAyNSwgYXQgMTc6MzMsIEF5YW4gS3VtYXIgSGFsZGVyIDxheWFua3Vt
YUBhbWQuY29tPiB3cm90ZToNCj4gDQo+IA0KPiBPbiAwOC8wNC8yMDI1IDE1OjI5LCBMdWNhIEZh
bmNlbGx1IHdyb3RlOg0KPj4gSGkgQXlhbiwNCj4gSGkgTHVjYSwNCj4+IA0KPj4+IE9uIDggQXBy
IDIwMjUsIGF0IDE1OjAyLCBBeWFuIEt1bWFyIEhhbGRlciA8YXlhbmt1bWFAYW1kLmNvbT4gd3Jv
dGU6DQo+Pj4gDQo+Pj4gSGkgTHVjYSwNCj4+PiANCj4+Pj4gK3N0YXRpYyB2b2lkIHByZXBhcmVf
c2VsZWN0b3IodWludDhfdCBzZWwpDQo+Pj4+ICt7DQo+Pj4+ICsgICAgLyoNCj4+Pj4gKyAgICAg
KiB7cmVhZCx3cml0ZX1fcHJvdGVjdGlvbl9yZWdpb24gd29ya3MgdXNpbmcgdGhlIGRpcmVjdCBh
Y2Nlc3MgdG8gdGhlIDAuLjE1DQo+Pj4+ICsgICAgICogcmVnaW9ucywgc28gaW4gb3JkZXIgdG8g
c2F2ZSB0aGUgaXNiKCkgb3ZlcmhlYWQsIGNoYW5nZSB0aGUgUFJTRUxSX0VMMg0KPj4+PiArICAg
ICAqIG9ubHkgd2hlbiBuZWVkZWQsIHNvIHdoZW4gdGhlIHVwcGVyIDQgYml0cyBvZiB0aGUgc2Vs
ZWN0b3Igd2lsbCBjaGFuZ2UuDQo+Pj4+ICsgICAgICovDQo+Pj4+ICsgICAgc2VsICY9IDB4RjBV
Ow0KPj4+PiArICAgIGlmICggUkVBRF9TWVNSRUcoUFJTRUxSX0VMMikgIT0gc2VsICkNCj4+Pj4g
KyAgICB7DQo+Pj4+ICsgICAgICAgIFdSSVRFX1NZU1JFRyhzZWwsIFBSU0VMUl9FTDIpOw0KPj4+
PiArICAgICAgICBpc2IoKTsNCj4+Pj4gKyAgICB9DQo+Pj4gVGhpcyBuZWVkcyB0byBiZSBhcm02
NCBzcGVjaWZpYy4gUmVmZXIgQVJNIERESSAwNjAwQS5kIElEMTIwODIxDQo+Pj4gDQo+Pj4gRzEu
My4xOSAgUFJCQVI8bj5fRUwyLCAvKiBJIGd1ZXNzIHRoaXMgaXMgd2hhdCB5b3UgYXJlIGZvbGxv
d2luZyAqLw0KPj4+IA0KPj4+IFByb3ZpZGVzIGFjY2VzcyB0byB0aGUgYmFzZSBhZGRyZXNzIGZv
ciB0aGUgTVBVIHJlZ2lvbiBkZXRlcm1pbmVkIGJ5IHRoZSB2YWx1ZSBvZiAnbicgYW5kDQo+Pj4g
UFJTRUxSX0VMMi5SRUdJT04gYXMgUFJTRUxSX0VMMi5SRUdJT048Nzo0PjpuLg0KPj4+IA0KPj4+
IA0KPj4+IFdoZXJlYXMgZm9yIGFybTMyIC4gUmVmZXIgQVJNIERESSAwNTY4QS5jIElEMTEwNTIw
DQo+Pj4gDQo+Pj4gRTIuMi4zIEhQUkJBUjxuPiwNCj4+PiANCj4+PiBQcm92aWRlcyBhY2Nlc3Mg
dG8gdGhlIGJhc2UgYWRkcmVzc2VzIGZvciB0aGUgZmlyc3QgMzIgZGVmaW5lZCBFTDIgTVBVIHJl
Z2lvbnMuDQo+Pj4gDQo+Pj4gLyogSGVyZSB3ZSBkbyBub3QgbmVlZCB0byB1c2UgSFBSU0VMUiBm
b3IgcmVnaW9uIHNlbGVjdGlvbiAqLw0KPj4+IA0KPj4+IA0KPj4+IElmIHlvdSB3YW50IHRvIG1h
a2UgdGhlIGNvZGUgc2ltaWxhciBiZXR3ZWVuIGFybTMyIGFuZCBhcm02NCwgdGhlbiBJIGNhbiBz
dWdnZXN0IHlvdSBjYW4gdXNlIHRoZXNlIHJlZ2lzdGVycy4NCj4+PiANCj4+PiBHMS4zLjE3IFBS
QkFSX0VMMg0KPj4+IA0KPj4+IFByb3ZpZGVzIGFjY2VzcyB0byB0aGUgYmFzZSBhZGRyZXNzZXMg
Zm9yIHRoZSBFTDIgTVBVIHJlZ2lvbi4gUFJTRUxSX0VMMi5SRUdJT04gZGV0ZXJtaW5lcw0KPj4+
IHdoaWNoIE1QVSByZWdpb24gaXMgc2VsZWN0ZWQuDQo+Pj4gDQo+Pj4gRTIuMi4yIEhQUkJBUg0K
Pj4+IA0KPj4+IFByb3ZpZGVzIGluZGlyZWN0IGFjY2VzcyB0byB0aGUgYmFzZSBhZGRyZXNzIG9m
IHRoZSBFTDIgTVBVIHJlZ2lvbiBjdXJyZW50bHkgZGVmaW5lZCBieQ0KPj4+IEhQUlNFTFIuDQo+
Pj4gDQo+Pj4gTGV0IG1lIGtub3cgaWYgaXQgbWFrZXMgc2Vuc2UuDQo+Pj4gDQo+Pj4gLSBBeWFu
DQo+PiBPayBJIGRpZGlu4oCZdCBnZXQgdGhhdCBiZWZvcmUsIHdoYXQgZG8geW91IHRoaW5rIGlm
IEkgbW9kaWZ5IHRoZSBjb2RlIGFzIGluIHRoaXMgZGlmZiAobm90IHRlc3RlZCk6DQo+PiANCj4+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbXB1L21tLmMgYi94ZW4vYXJjaC9hcm0vbXB1L21t
LmMNCj4+IGluZGV4IGZlMDVjODA5NzE1NS4uMWJjNmQ3YTc3Mjk2IDEwMDY0NA0KPj4gLS0tIGEv
eGVuL2FyY2gvYXJtL21wdS9tbS5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vbXB1L21tLmMNCj4+
IEBAIC01OCwxOSArNTgsMjEgQEAgc3RhdGljIHZvaWQgX19pbml0IF9fbWF5YmVfdW51c2VkIGJ1
aWxkX2Fzc2VydGlvbnModm9pZCkNCj4+ICAgICAgQlVJTERfQlVHX09OKFBBR0VfU0laRSAhPSBT
Wl80Syk7DQo+PiAgfQ0KPj4gIC1zdGF0aWMgdm9pZCBwcmVwYXJlX3NlbGVjdG9yKHVpbnQ4X3Qg
c2VsKQ0KPj4gK3N0YXRpYyB2b2lkIHByZXBhcmVfc2VsZWN0b3IodWludDhfdCAqc2VsKQ0KPj4g
IHsNCj4+ICsgICAgdWludDhfdCBjdXJfc2VsID0gKnNlbDsNCj4+ICAgICAgLyoNCj4+ICAgICAg
ICoge3JlYWQsd3JpdGV9X3Byb3RlY3Rpb25fcmVnaW9uIHdvcmtzIHVzaW5nIHRoZSBkaXJlY3Qg
YWNjZXNzIHRvIHRoZSAwLi4xNQ0KPj4gICAgICAgKiByZWdpb25zLCBzbyBpbiBvcmRlciB0byBz
YXZlIHRoZSBpc2IoKSBvdmVyaGVhZCwgY2hhbmdlIHRoZSBQUlNFTFJfRUwyDQo+PiAgICAgICAq
IG9ubHkgd2hlbiBuZWVkZWQsIHNvIHdoZW4gdGhlIHVwcGVyIDQgYml0cyBvZiB0aGUgc2VsZWN0
b3Igd2lsbCBjaGFuZ2UuDQo+PiAgICAgICAqLw0KPj4gLSAgICBzZWwgJj0gMHhGMFU7DQo+PiAt
ICAgIGlmICggUkVBRF9TWVNSRUcoUFJTRUxSX0VMMikgIT0gc2VsICkNCj4+ICsgICAgY3VyX3Nl
bCAmPSAweEYwVTsNCj4+ICsgICAgaWYgKCBSRUFEX1NZU1JFRyhQUlNFTFJfRUwyKSAhPSBjdXJf
c2VsICkNCj4+ICAgICAgew0KPj4gLSAgICAgICAgV1JJVEVfU1lTUkVHKHNlbCwgUFJTRUxSX0VM
Mik7DQo+PiArICAgICAgICBXUklURV9TWVNSRUcoY3VyX3NlbCwgUFJTRUxSX0VMMik7DQo+PiAg
ICAgICAgICBpc2IoKTsNCj4+ICAgICAgfQ0KPj4gKyAgICAqc2VsID0gKnNlbCAmIDB4RlU7DQo+
PiAgfQ0KPj4gICAgLyoNCj4+IEBAIC0xMDIsNyArMTA0LDcgQEAgdm9pZCByZWFkX3Byb3RlY3Rp
b25fcmVnaW9uKHByX3QgKnByX3JlYWQsIHVpbnQ4X3Qgc2VsKQ0KPj4gICAgICAgKi8NCj4+ICAg
ICAgcHJlcGFyZV9zZWxlY3RvcihzZWwpOw0KPj4gIC0gICAgc3dpdGNoICggc2VsICYgMHhGVSAp
DQo+PiArICAgIHN3aXRjaCAoIHNlbCApDQo+PiAgICAgIHsNCj4+ICAgICAgICAgIEdFTkVSQVRF
X1JFQURfUFJfUkVHX0NBU0UoMCwgcHJfcmVhZCk7DQo+PiAgICAgICAgICBHRU5FUkFURV9SRUFE
X1BSX1JFR19DQVNFKDEsIHByX3JlYWQpOw0KPj4gQEAgLTE0MCw3ICsxNDIsNyBAQCB2b2lkIHdy
aXRlX3Byb3RlY3Rpb25fcmVnaW9uKGNvbnN0IHByX3QgKnByX3dyaXRlLCB1aW50OF90IHNlbCkN
Cj4+ICAgICAgICovDQo+PiAgICAgIHByZXBhcmVfc2VsZWN0b3Ioc2VsKTsNCj4+ICAtICAgIHN3
aXRjaCAoIHNlbCAmIDB4RlUgKQ0KPj4gKyAgICBzd2l0Y2ggKCBzZWwgKQ0KPj4gICAgICB7DQo+
PiAgICAgICAgICBHRU5FUkFURV9XUklURV9QUl9SRUdfQ0FTRSgwLCBwcl93cml0ZSk7DQo+PiAg
ICAgICAgICBHRU5FUkFURV9XUklURV9QUl9SRUdfQ0FTRSgxLCBwcl93cml0ZSk7DQo+PiANCj4+
IEFuZCBsYXRlciB5b3Ugd2lsbCB1c2Ugc29tZSAjaWZkZWYgQ09ORklHX0FSTV8zMiBpbnNpZGUg
cHJlcGFyZV9zZWxlY3RvcigpIHRvIGNoZWNrDQo+PiB0aGF0IHRoZSBjb2RlIGlzIHBhc3Npbmcg
dXAgdG8gdGhlIG1heCBzdXBwb3J0ZWQgcmVnaW9uIG9yIHBhbmljLg0KPj4gQW5kIGluIHtyZWFk
LHdyaXRlfV9wcm90ZWN0aW9uX3JlZ2lvbigpIHlvdSBjb3VsZCBhZGQgc29tZSAjaWZkZWYgQ09O
RklHX0FSTV8zMiB0byBhZGQNCj4+IHRoZSBjYXNlIGdlbmVyYXRvcnMgZm9yIHJlZ2lvbnMgZnJv
bSAxNiB0byAyMyBzaW5jZSBSNTIgY2FuIGFkZHJlc3MgdGhlbSBkaXJlY3RseS4NCj4+IA0KPj4g
V2hhdCBkbyB5b3UgdGhpbms/DQo+IA0KPiBJIGdvdCB0aGlzIGRpZmYgd29ya2luZyBhcyBpdCBp
cyBmb3IgUjgyLiBUaGlzIGxvb2tzIG11Y2ggbGVzc2VyIGNvZGUNCj4gDQo+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vbXB1L21tLmMgYi94ZW4vYXJjaC9hcm0vbXB1L21tLmMNCj4gaW5kZXgg
ZmUwNWM4MDk3MS4uNjM2MjdjODVkYyAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL21wdS9t
bS5jDQo+ICsrKyBiL3hlbi9hcmNoL2FybS9tcHUvbW0uYw0KPiBAQCAtMjgsMjMgKzI4LDE5IEBA
IERFQ0xBUkVfQklUTUFQKHhlbl9tcHVtYXBfbWFzaywgTUFYX01QVV9SRUdJT05TKTsNCj4gIC8q
IEVMMiBYZW4gTVBVIG1lbW9yeSByZWdpb24gbWFwcGluZyB0YWJsZS4gKi8NCj4gIHByX3QgeGVu
X21wdW1hcFtNQVhfTVBVX1JFR0lPTlNdOw0KPiANCj4gLS8qIFRoZSBmb2xsb3dpbmcgYXJlIG5l
ZWRlZCBmb3IgdGhlIGNhc2UgZ2VuZXJhdG9yIHdpdGggbnVtPT0wICovDQo+IC0jZGVmaW5lIFBS
QkFSMF9FTDIgUFJCQVJfRUwyDQo+IC0jZGVmaW5lIFBSTEFSMF9FTDIgUFJMQVJfRUwyDQo+IC0N
Cj4gICNkZWZpbmUgR0VORVJBVEVfV1JJVEVfUFJfUkVHX0NBU0UobnVtLCBwcikgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICAgICAgY2FzZSBudW06IFwNCj4geyBcDQo+IC0g
ICAgICAgIFdSSVRFX1NZU1JFRyhwci0+cHJiYXIuYml0cyAmIH5NUFVfUkVHSU9OX1JFUzAsIFBS
QkFSIyNudW0jI19FTDIpOyAgXA0KPiAtICAgICAgICBXUklURV9TWVNSRUcocHItPnBybGFyLmJp
dHMgJiB+TVBVX1JFR0lPTl9SRVMwLCBQUkxBUiMjbnVtIyNfRUwyKTsgIFwNCj4gKyAgICAgICAg
V1JJVEVfU1lTUkVHKHByLT5wcmJhci5iaXRzICYgfk1QVV9SRUdJT05fUkVTMCwgUFJCQVJfRUwy
KTsgIFwNCj4gKyAgICAgICAgV1JJVEVfU1lTUkVHKHByLT5wcmxhci5iaXRzICYgfk1QVV9SRUdJ
T05fUkVTMCwgUFJMQVJfRUwyKTsgIFwNCj4gYnJlYWs7IFwNCj4gICAgICB9DQo+IA0KPiAgI2Rl
ZmluZSBHRU5FUkFURV9SRUFEX1BSX1JFR19DQVNFKG51bSwgcHIpICAgICAgICAgICAgICAgICAg
ICAgIFwNCj4gICAgICBjYXNlIG51bTogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcDQo+ICAgICAgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiAtICAgICAgICBwci0+cHJiYXIuYml0
cyA9IFJFQURfU1lTUkVHKFBSQkFSIyNudW0jI19FTDIpOyAgICAgICAgIFwNCj4gLSAgICAgICAg
cHItPnBybGFyLmJpdHMgPSBSRUFEX1NZU1JFRyhQUkxBUiMjbnVtIyNfRUwyKTsgICAgICAgICBc
DQo+ICsgICAgICAgIHByLT5wcmJhci5iaXRzID0gUkVBRF9TWVNSRUcoUFJCQVJfRUwyKTsgICAg
ICAgICBcDQo+ICsgICAgICAgIHByLT5wcmxhci5iaXRzID0gUkVBRF9TWVNSRUcoUFJMQVJfRUwy
KTsgICAgICAgICBcDQo+ICAgICAgICAgIGJyZWFrOyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiAgICAgIH0NCj4gDQo+IEBAIC02NSw3ICs2MSw2
IEBAIHN0YXRpYyB2b2lkIHByZXBhcmVfc2VsZWN0b3IodWludDhfdCBzZWwpDQo+ICAgICAgICog
cmVnaW9ucywgc28gaW4gb3JkZXIgdG8gc2F2ZSB0aGUgaXNiKCkgb3ZlcmhlYWQsIGNoYW5nZSB0
aGUgUFJTRUxSX0VMMg0KPiAgICAgICAqIG9ubHkgd2hlbiBuZWVkZWQsIHNvIHdoZW4gdGhlIHVw
cGVyIDQgYml0cyBvZiB0aGUgc2VsZWN0b3Igd2lsbCBjaGFuZ2UuDQo+ICAgICAgICovDQo+IC0g
ICAgc2VsICY9IDB4RjBVOw0KPiAgICAgIGlmICggUkVBRF9TWVNSRUcoUFJTRUxSX0VMMikgIT0g
c2VsICkNCj4gICAgICB7DQo+ICAgICAgICAgIFdSSVRFX1NZU1JFRyhzZWwsIFBSU0VMUl9FTDIp
Ow0KPiANCj4gUGxlYXNlIGdpdmUgaXQgYSB0cnkgdG8gc2VlIGlmIGl0IHdvcmtzIGF0IHlvdXIg
ZW5kLg0KPiANCj4gDQo+IEFuZCB0aGVuLCB0aGUgY29kZSBjYW4gYmUgcmVkdWNlZCBmdXJ0aGVy
IGFzDQo+IA0KPiB2b2lkIHJlYWRfcHJvdGVjdGlvbl9yZWdpb24ocHJfdCAqcHJfcmVhZCwgdWlu
dDhfdCBzZWwpDQo+IHsNCj4gICAgIC8qDQo+ICAgICAgKiBCZWZvcmUgYWNjZXNzaW5nIEVMMiBN
UFUgcmVnaW9uIHJlZ2lzdGVyIFBSQkFSX0VMMi9QUkxBUl9FTDIsDQo+ICAgICAgKiBtYWtlIHN1
cmUgUFJTRUxSX0VMMiBpcyBzZXQsIGFzIGl0IGRldGVybWluZXMgd2hpY2ggTVBVIHJlZ2lvbg0K
PiAgICAgICogaXMgc2VsZWN0ZWQuDQo+ICAgICAgKi8NCj4gICAgIHByZXBhcmVfc2VsZWN0b3Io
c2VsKTsNCj4gDQo+ICAgICBwcl9yZWFkLT5wcmJhci5iaXRzID0gUkVBRF9TWVNSRUcoUFJCQVJf
RUwyKTsNCj4gDQo+ICAgICBwcl9yZWFkLT5wcmxhci5iaXRzID0gUkVBRF9TWVNSRUcoUFJMQVJf
RUwyKTsNCj4gDQo+IH0NCj4gDQo+IFRoZSBzYW1lIGNhbiBiZSBkb25lIGZvciB3cml0ZV9wcm90
ZWN0aW9uX3JlZ2lvbiguLi4pDQo+IA0KPiAtIEF5YW4NCg0KVGhlIHBvaW50IG9mIHRoZSBjb2Rl
IHdhcyB0byBkb27igJl0IGlzc3VlIGFuIGlzYigpIGV2ZXJ5IHRpbWUgd2UgY2hhbmdlIHRoZSBz
ZWxlY3RvciwNCm9mIGNvdXJzZSB0aGUgY29kZSB3b3VsZCBiZSBlYXNpZXIgb3RoZXJ3aXNlLCBi
dXQgZG8gd2Ugd2FudCB0byBkbyB0aGF0Pw0KDQoNCj4gDQo+PiANCj4+IENoZWVycywNCj4+IEx1
Y2ENCj4+IA0KPj4gDQo+PiANCj4+IA0KDQo=

