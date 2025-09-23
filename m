Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB9FB94FBD
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 10:26:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128302.1468705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0yLh-0000Q9-0S; Tue, 23 Sep 2025 08:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128302.1468705; Tue, 23 Sep 2025 08:26:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0yLg-0000Nb-Tt; Tue, 23 Sep 2025 08:26:08 +0000
Received: by outflank-mailman (input) for mailman id 1128302;
 Tue, 23 Sep 2025 08:26:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/X/M=4C=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1v0yLf-0000MD-H0
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 08:26:07 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2ea9889-9856-11f0-9d14-b5c5bf9af7f9;
 Tue, 23 Sep 2025 10:26:05 +0200 (CEST)
Received: from PR3P189CA0083.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::28)
 by DB5PR08MB10256.eurprd08.prod.outlook.com (2603:10a6:10:4aa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 08:26:01 +0000
Received: from AMS0EPF00000191.eurprd05.prod.outlook.com
 (2603:10a6:102:b4:cafe::eb) by PR3P189CA0083.outlook.office365.com
 (2603:10a6:102:b4::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Tue,
 23 Sep 2025 08:26:01 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000191.mail.protection.outlook.com (10.167.16.216) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12
 via Frontend Transport; Tue, 23 Sep 2025 08:26:00 +0000
Received: from PAWPR08MB9005.eurprd08.prod.outlook.com (2603:10a6:102:33e::18)
 by VI0PR08MB10488.eurprd08.prod.outlook.com (2603:10a6:800:203::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Tue, 23 Sep
 2025 08:25:22 +0000
Received: from PAWPR08MB9005.eurprd08.prod.outlook.com
 ([fe80::d65b:a08:278:38e3]) by PAWPR08MB9005.eurprd08.prod.outlook.com
 ([fe80::d65b:a08:278:38e3%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 08:25:19 +0000
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
X-Inumbo-ID: f2ea9889-9856-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tVnbQ3PMV7cQl+ca0S5u4wEpGRqxHi3Ne8TNN2BvmQhAs4Sw/PmRNmFUmT/q6M17Vl+terg+3YI92NLmamJ39ubry65NoSJ+KGYLlmrupKgdTPMvehUifrKlfoTpf2gQ2M+T397UGH9Zp4cCOiLASlIGwqXLwmAuD4kP8Hcpi1bQ2NXL0QZpc98X0t9CaQML/8RJBJQe+WY2YcqcwuLRQWCmKM7EVbVHNThkJtJ/WAA4hZInXUMVq4WBEm35orpxqld5G0ByeNYBV8f80ylHx/8QrfbhQSFIt/fWZMlmKEA6VHhPpidCx4oV4jw2tQmXvPiiGN9BTKrw9qFWVnfZ0g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SP0OOSwrewED/qPMOJBcKwbVCgSapH/nyVp98pFg94o=;
 b=dWk7Ar11rxhaGWY6t5/zGJ6HE9LKwDc62ozgFFo7CvbrB0mCrEeiSOuQb5sgUNC3InPMGs8PZe0vL840YEAaVBQ4axlD7V62dpcLc6AZgnSu/rtEQDml++N2QAcjCMzBlkxm6ijYRThhSCGIF4Suy9s+ddUcMAHpRKuXN0dg6hWCzh6NcmcQ1Y8zebCsP35DG6g9fQUNXh4vOduAkbe3Pd0ev1eaT1KWl0167OH0CsFVFD/z+ZB+3Y/Don1+jqbHyyjzcrcJU+BKT6vFoF6Uc/aSesRBfh6YYo8MVud6CXmbE2KjtyxNDgiQekcbZnZkwVmIF0SFqym+lDc3idurOw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SP0OOSwrewED/qPMOJBcKwbVCgSapH/nyVp98pFg94o=;
 b=Q553d2g5FNQWPtY39BJSWdbemCLcvFRHBhha0aOQBtdORFaG3kPg6iLEYS6SlHWp19Z2UUV66uu+TJk+2AcWOaqcga5jWd/de3Hk4PMCAecv3lbg2c/P/Gd0gf1f1hyMqzUa0ss55XT0HgAjuwTJSkV5Awte8octy+O1UA3D5yA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYvThoqKTtHA1PTauf0ZQpfcXSqJ1zpQMX+cvFTP/4Sv4R8JWEHPHrXKqMrcXpKvK3Tt0MEEtCbFOHEHDNiBFKjcembGduATxKBDb29bB894JnA/768KHgeXWJamBH5oFYkM43EqR1/D24BoxLxYTJDGcg6sRjQQ3Fi5RRuK1cgPjU64KTo7LZ1vOGdDCM4bNumfo/fhUE8aFc0DlNzRu8oacRgAMO/WrdsfxaUJCYXYH8jSJsOAz5sh/C66sANcnNkiFtr0BA3SDgY3Sydp2nDAA02OWPc8sqhAKy+PsZ217WajvH4mlcOjBXtdnEtPR/CMQUcHZtNlyOoZCFOA+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SP0OOSwrewED/qPMOJBcKwbVCgSapH/nyVp98pFg94o=;
 b=d71HjJUvjyYu3HLg1Zx0tbrDvwLunP5b3ClHgOe+suz6lh7nz5R0s1IxMlKkUubu3ttjkPnsmGnE4rQR/+B57aQfOim7V1PIe54GC2NnBiBV1WZGjfrIkIS2FGZBbiiq226tOCiIhE0fqXxRVtS/7asZ8iKnlt2ZK7lRCj6oH23fFfBecdCju6WmLbX7gQ6FA6FcB69Wx9FMEelt9YAnj5nXokXh2GYsFBjIZ6snTjd//ZlN2ZstBHpSRE++bSDQ0uhNSLaizGlWTA2bIjhzQSSuvsbsaWT8pOVcJDWR5YJEt742v08i5dmfeHu6YkxN0fVpXBY1Nf2Ubr9RckJM9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SP0OOSwrewED/qPMOJBcKwbVCgSapH/nyVp98pFg94o=;
 b=Q553d2g5FNQWPtY39BJSWdbemCLcvFRHBhha0aOQBtdORFaG3kPg6iLEYS6SlHWp19Z2UUV66uu+TJk+2AcWOaqcga5jWd/de3Hk4PMCAecv3lbg2c/P/Gd0gf1f1hyMqzUa0ss55XT0HgAjuwTJSkV5Awte8octy+O1UA3D5yA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Viresh Kumar <viresh.kumar@linaro.org>, "Bill Mills
 (bill.mills@linaro.org)" <bill.mills@linaro.org>, "Edgar E. Iglesias"
	<Edgar.Iglesias@amd.com>
Subject: Xen Summit 2025 - "Virtio Message challenges" design session
Thread-Topic: Xen Summit 2025 - "Virtio Message challenges" design session
Thread-Index: AQHcLGOZDZwUIN3nakWMTf8xAnZKbQ==
Date: Tue, 23 Sep 2025 08:25:19 +0000
Message-ID: <C9CB2348-33F7-46BC-8853-E2192F34D07D@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAWPR08MB9005:EE_|VI0PR08MB10488:EE_|AMS0EPF00000191:EE_|DB5PR08MB10256:EE_
X-MS-Office365-Filtering-Correlation-Id: 67539f39-9798-4424-7123-08ddfa7ad415
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?YjR5NnBMNEJWUW9zd3UwNGRaWTBxamtDNm1nY1c1NEVJSUtOSi9vRTF2OVBP?=
 =?utf-8?B?NVppSS9RcFJ3YUlycmRJUFV5dXFQSGQzQlFERkhhTTd2Z3lBVEZKK0NBMVo5?=
 =?utf-8?B?SCt5Q0lIc0IvOWUrc3Z3Y2VrcjdGbk9FWkJsTG9mc3Rlc3JtZytzd0RMZmxK?=
 =?utf-8?B?Y1pENDhCK0NSM3BOMGgxWWhnWjd3VGhqMkRNQWlteEd1SWxUU0NXUW9yQ0NY?=
 =?utf-8?B?SzNXUWhXN09TNDFPOXJhQVBQdXBSeEE3c05xcm53Yzg3OVg0VjZlYmYxOXc0?=
 =?utf-8?B?dlpreXZZVDdqU0k4a3NOcHJsei9LT0t1a2t4M2kzRFJvUEhkUlU4NFR0QTBu?=
 =?utf-8?B?QW1rNWRHdVB5K0p1M3pTZWVrZGNtM2pXbU1abDY1NXp1MGpuWWJ4MC82c0ta?=
 =?utf-8?B?SkNERFZHaWdEZnk2T0tBT241SVpLYk9zNVdNcDlRN2ZmdjJoc0ZiZWtUdHF2?=
 =?utf-8?B?L3hqczdYWXMra29FMzJpVmVWRElkb2MvRzQ4YmZib2RhV0hzSjdKRzZtVi9R?=
 =?utf-8?B?T0RFZXV2T0Zad3QzK2U4RE4rTUE5RVByZkdvL0V4cHBsQWNCMkxrdzBYTG5t?=
 =?utf-8?B?ZXQvSUwwWVV3bTE4NHhOK2NobVVleVk5eEFLV1MvZXV2SDB3ekpiNlM4d2dR?=
 =?utf-8?B?bHNxMU95cUh3NkFVVEF5bmozQ0FkOFlTSUdLeHhjVUlGQXJOSmZHQmIwd0Rs?=
 =?utf-8?B?TEdsdXYyUnl1MXk4b0VhYnl4RlNqRmxrV0xiNm9WSFJIenV2dkoxaU9jTEVM?=
 =?utf-8?B?NjlSdWw5NysrNWIrMVpUOXNjMkRSR0wwaDhRN1Q3ZFhpT1FDbDh2UkpMQkZ3?=
 =?utf-8?B?YTNSQk1MZ0dJNnI3ckhwK2hONDRUbHIwNXozNjBabFNxOEhFUktIOWpnTitJ?=
 =?utf-8?B?d0xEWEJXOGFPaHYyVE5nYW8xUlA3NjlWMWk0Uy9zZG1kTVMvbjU0d2pMdnVB?=
 =?utf-8?B?TmdqSkFhc1d4bW5IdUlEdmRNVHRjczJDRURaWDdYNytGQjFDSkptdERzVURa?=
 =?utf-8?B?TnhEMFR3OFNKbU5qK3lKUS9iZkFkakEyYTFXNHlpVUJ6SDFJeWxsQlFtUGlF?=
 =?utf-8?B?YTZNZVY5c1FrNlVwUlVQVk8wYm9CanEvT0gwNTdIMFBpUFlFVGdRelVLVTd6?=
 =?utf-8?B?QWdBWG5sMHk4bERtS05hOTgzM0NHSG1CWGovRHVYdkdZL2VjTkpRS2JzeWZW?=
 =?utf-8?B?WUFXR1A1WURoRmRHM0xWZ000WTYyK290SjJpMUhDMVluRzZyY1l3NlJDRkl6?=
 =?utf-8?B?MjBFSEpVRVl5OWp3Mk5ac0lVUU5jUlBMb05jZHlnNmw0amdLRnlHUlRxVVBZ?=
 =?utf-8?B?RVc3U1NPakRDK1NzQ2cxNUM4M1U1ZVp1ay9jRUNaN1E1dHdzbnluZlRRV0lI?=
 =?utf-8?B?SXZJQ0RrZXExdmJ0TVFrSHV4YUFYWHJNMnVSdCtYSytOTWN5aFNMZ3ErMEdP?=
 =?utf-8?B?YWtkNlNyL2NMaEd6MzQ4dVJ0a01VdXJCcTU1L2k1YktuZkRPSmI3d05QSi93?=
 =?utf-8?B?S1dVZWNtK3Q2YUh3cTJKS0U0SjZYbnorVmtYaHlVcGdUempzemJUZHUzOXZs?=
 =?utf-8?B?bjRQZ285ejNELzZBSVlUNTIzZ3A2dWlqUFU2RU13RmlZSE4wNGF2ci9ENGRL?=
 =?utf-8?B?T3V0Qy9yd0lWaUErakRkaHA4eDFVVk1tTGphQ054WkZYYWI1aFZEbW9UVEo0?=
 =?utf-8?B?bDljNnNGWVRpSDlhend5TjRMaXZvY1BpUnk0QmlGTy9UQlJVZ3BQOGFuWmE0?=
 =?utf-8?B?d1JHNTVSclEwNldpengyR0ZNbU1Ca2hZdE1ISFBMTW9UV0RtOUJKUkN0SWM2?=
 =?utf-8?B?Y1RxVmZZZjB0WHY2QXBpaXhEUUlVTU4wSGVoeWFGZEhIakEzQi9tb3Y3TlhX?=
 =?utf-8?B?alRSMkhjUmZUTUpYZWlYMnVZTWx0bVh3enJ1ZStwNXIzWDVjek9LMlZYa3Fm?=
 =?utf-8?B?VjRxR2RvSDJ3aTVjeXBqWCt0NlUwcCtBWTNuenNoR2dTYzcxWmd6blpuTmNE?=
 =?utf-8?Q?aBRtygkS0d3Jqe71GxArWsNaB+IzRA=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB9005.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <58AA704E3DF6F143A05C584E37D57D33@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10488
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	588389ed-c8db-42bd-bfd3-08ddfa7abb93
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXVmRk1DUjZKKy9VaWVFRk5YZEEyclUxNFlmaGpIOW1UR042OXo2d2ZVVTVF?=
 =?utf-8?B?RXVYaHBNQU56RnY2QW9DRGJBcGhGalZUWUt1bzdzZ0svRkdSY0VaSzVkYU82?=
 =?utf-8?B?NWpnRmdZeURhVmN0UGg4S0FnZ2c4WUZzeitoMHM0cXhyZm5LeWV4SUUvRkZY?=
 =?utf-8?B?eWxIaFdHMUI2R3o4NjBlK2loZHgwT1hlOUNONHJIRXNoU3lUcFhsTk9hYjVI?=
 =?utf-8?B?NjFPdnJJT2Myc0hWcVFIbzhiQ21KbEFvbHMwRjFDMGxCSmxoOUFHREM3aEgw?=
 =?utf-8?B?Sjk0VGRCMkVRVU5zSVRiVklSem9RUjB0Y1RHcmE1aytPMkxDeCt5YXJPa2RW?=
 =?utf-8?B?VUJaRE5zUHhFa2dTa2E4b1RRL0MzVWlsWmt0MUt5elA4bzF3a3NyQzRoV1I2?=
 =?utf-8?B?bngzRG9IZ1dxbXUvQWtiL1hIQWxDaENtYzhadzhxOVJ6OUFNNDIyN2p6S2VW?=
 =?utf-8?B?dm4vbDJXTFdkK2dZbGNac1dYRHpRbjl4ek8xQ29GT3pjSkRYWXFaUGU3dmpN?=
 =?utf-8?B?R0F5L2FsbllzMUxwTS9kZVRtQTkvTkVYNk1QZTI2bnRON3AzK2Z5NFF5WDFh?=
 =?utf-8?B?L2JpNnV1NFhoU2dlK0ViTzA0T25oa3IvbzhVdlEwaTB3ZzU0NUNLZ2toMlpo?=
 =?utf-8?B?NzNza2ZqeW5Jd21RbGgyZlJ1dmxKUGR5L2tlOUNraTJsQi9YeXQwblNIWkdT?=
 =?utf-8?B?YnRpbW5kNGc4Um1CcEZ4MG4wTlJTdFd1RkxrOVB0VFh4ZHNtTlMvYWVhUWxR?=
 =?utf-8?B?ejYxZ3hYalBOb3lEdlVqNWtoQThUR21GcmVmMHkydTk2aERJaEJhRHpGS3Z5?=
 =?utf-8?B?QStGeGE0R1FEcm56QUwxdGdlYkFIYjk5NU1hdWJnVFFqSmdQUlhMNkI0cmNz?=
 =?utf-8?B?dzNzbTU4N2xDcXBDRHNyR1BoYUZRRmFYd1dLOVRiaDczTHdMMnAxVnY0OEl6?=
 =?utf-8?B?RFNwdTJZc25XTjNUQVNsWVZaZGU0R3M1bmRMbjd4aER2K1VwNktXQ01XN2Ry?=
 =?utf-8?B?YW5mRjlLa3E2RTJmWCtmcVpqZDNpKzFKVkNMQzNsVFEvU3pUTlUyVUpES25U?=
 =?utf-8?B?SVZqMHJaRFBqeVYyU21rbXljWUlKVGl3em9lSVBBSklRUERnOEJtbkJ2ZHBF?=
 =?utf-8?B?bVRNSTQyaVpHY2NweVZ2QWhvbWh5OEF5a29wcEI1b3VMaGFFVElvZ25nNERG?=
 =?utf-8?B?czRRTGY5QVFlbWRvMGdMN0o1cndMdDBjS2EvdVFnS3k3UzFFUk5XWTc2VWh5?=
 =?utf-8?B?ZDNOQmN6YzgxNkZkaW51eXB4WkEzNWY2ak9ETythbWFsVHE0cXo5VkxnMGtw?=
 =?utf-8?B?bmYxVEtQY1NmaEhyZ1o1ck1pNlBNV0RPekZhUmNqRlpiVHRvcDhRNHg4V1ly?=
 =?utf-8?B?UWwyV0JyMVlqNnYrNWk1dDVnUTlGYlNJdGR1REMwcmE1dXRpTFZWUnlhV2lo?=
 =?utf-8?B?bmdyaXBOeGhySzFFK3YwVXQrWVZkZlBtOVpCOUp3Z3pjb3Y4amlCRmtncHFu?=
 =?utf-8?B?MklHYXZvTlVLK1N2SlJGR0JSd2xENVJub05QSWo1MTdZWlZreGlTb2VHa3dk?=
 =?utf-8?B?T1A3bXBzZ04zNG5kSlJrUGRmK2t3RnBGZExZSFJxMjZqejd1djFaRXU4MEl5?=
 =?utf-8?B?UXFuQmErUlo1RzFvQkRiZERIOXdvMzlZc1E0MGJYWjUwUW5iWmZjZmVlUU1s?=
 =?utf-8?B?b3ZTWSt0T0xvT3RmZDltWU5xdVFpekJSRUtwSVRsMVM0NGhweWlZSDk1TkVn?=
 =?utf-8?B?eEhFWXp3MWN3M29DTlJKNVYxWGQzeWZBL2tRdnFtblVGQzJoUW9WMmU0dnNk?=
 =?utf-8?B?dlUwcVJQb0dmTzZpa2dvK3pseWhCN2J5VDVGbnljUmN0SnY4dEJyeXdmN2w1?=
 =?utf-8?B?bWNpeFBmdlNIa1pEYTdxUFNWbEtqTFBOQzlFUGFROUlsRTZjeldCLzJPTGdw?=
 =?utf-8?B?TTNBWE5wRHVSakV3ajA0ZitkcFd1T0x6T2R0dVVIN1RwMWw3M244Z2VsV1RL?=
 =?utf-8?B?d2hDNEdqWkttVTlSSjFqOWdQdGhYc1REenhqajRUd1Z3SUZINjduai9qQkVW?=
 =?utf-8?Q?Okf+5/?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 08:26:00.6640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67539f39-9798-4424-7123-08ddfa7ad415
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10256

SGksDQoNCkhlcmUgYXJlIHRoZSBub3RlcyAiTHVjYSBGYW5jZWxsdSIgdG9vayBkdXJpbmcgdGhl
IGRlc2lnbiBzZXNzaW9uIG9uIFZpcnRpbyBNZXNzYWdlOg0KDQotLS0tLQ0KQmVyOiB3ZSBoYXZl
IGNoYWxsZW5nZXMgaW4gWGVuIGFuZCBhbHNvIG90aGVyIHNjZW5hcmlvcywgSSB3b3VsZCBsaWtl
IHRvIGRpc2N1c3MgdG8gZG9uJ3QgcmUtaW52ZW50IHRoZSB3aGVlbCANCk1haW4gb25lIGlzIHRo
YXQgd2UgYXJlIGludHJvZHVjaW5nICJ2aXJ0dWFsbHkiIG5ldyBWTXMgKFNlY3VyZSBwYXJ0aXRp
b25zKSB3ZSBuZWVkIHRvIGRlZmluZSB3aG8gY2FuIGJlIGNvbnRhY3RlZCwgY29tcHJpc2luZyB0
aGUgc2VjdXJlIHBhcnRpdGlvbi4gV2UgaGF2ZSB1cCB0byA2NWsgcG9zc2libGUgcGVlcnMuIA0K
SURzIGFyZSAzMmsgYXJlIGZvciBub3JtYWwgd29ybGQsIG90aGVyIDMyayBmb3Igc2VjdXJlLiAN
CkluaXRpYWwgaWRlYSB3YXMgWFNNLUZsYXNrLCBidXQgaXQgZ29lcyBvdmVyIGl0cyBjYXBhY2l0
eS4gDQpXZSBkb24ndCB3YW50IHRvIHVzZSB4ZW5zdG9yZWQuICANCg0KQW5kcmV3OiBJdCdzIFhT
TS1GbGFzaywgd2hhdCB3ZSBoYXZlIHdhcyBwb3J0ZWQgZnJvbSBMaW51eCwgWHJheXMgY2FuIHNv
bHZlLCBzbyB3ZSBjb3VsZCBwb3J0IGl0IGZyb20gTGludXguICANCg0KQmVyOiBIb3cgZG8geW91
IGNvbmZpZ3VyZSB0aGlzPyBBdCBib290IHRpbWU/IENhbiB3ZSBtb2RpZnkgYXQgcnVudGltZT8g
DQoNCkFuZHJldzogWW91IGhhdmUgdG8gcmVsb2FkIHRoZSBwb2xpY2llcyBvZiB0aGUgc3lzdGVt
LiANCg0KQmVydHJhbmQ6IFlvdSBjYW4gaGF2ZSBWTXMgYXBwZWFyaW5nIGFuZCBkaXNhcHBlYXJp
bmcsIGRvIHdlIHRoaW5rIGl0J3MgdGhlIHJpZ2h0IHNvbHV0aW9uPyANCg0KTGltaXRhdGlvbiB3
b3VsZCBiZSwgeW91IHdpbGwgaGF2ZSB0byBoYXZlIGEgZml4ZWQgYW1vdW50IG9mIHBvbGljaWVz
LiBb4oCmXSANCg0KQW55b25lIGhhcyBhbnkgb3RoZXIgaWRlYT8gDQoNCkFub3RoZXIgcHJvYmxl
bSBub3csIGFkZCBhIGRpc2NvdmVyeSBzeXN0ZW0sIHdlIGRvbid0IGhhdmUgeGVuc3RvcmVkIG5v
dy4gDQoNCg0KQW5kcmV3OiBUaGUgaWRlYSBpcyB0byB1c2UgYXJnbyBwb3J0IHplcm8gYXMgYW4g
ZW51bWVyYXRpb24gc3lzdGVtLiANCg0KDQpCZXJ0cmFuZDogV2UgbmVlZCB0byBkaWcgb24gQXJn
bywgYW5kIFhTTS1GbGFzay4gTm93IGxhc3QgcHJvYmxlbTogVmlydElPIGJhc2VkIG9uIGdyYW50
IHRhYmxlIGFuZCBldmVudC4gTWFpbiBxdWVzdGlvbiBpcyBzaG91bGQgd2UgZG8gdGhpcyBhbmQg
d2hvIGlzIHdpbGxpbmcgdG8gaGVscD8gDQoNCldobyB0aGlua3MgaXQgdXNlZnVsIGZvciBzZXJ2
ZXJzPyANCg0KDQpBbmRyZXc6IExlZ2FjeSBTVyB3aWxsIGJlIHRoZXJlIGZvcmV2ZXIsIHRoaXMg
dGhpbmcgd2lsbCBoZWxwIGluIHRoZSBsb25nIHRlcm0uIEl04oCZcyBpbnRlcmVzdGluZyB0byBp
bnZlc3RpZ2F0ZS4gIA0KLS0tLQ0KDQpNYWluIGNvbmNsdXNpb25zOg0KLSBJbnZlc3RpZ2F0ZSBY
U00vRmxhc2sgZm9yIGRlZmluaW5nIHdobyBpcyBhYmxlIHRvIGNvbW11bmljYXRlIHdpdGggd2hv
IHdoZW4gRkYtQSBpcyB1c2VkIG9uIGEgc3lzdGVtDQoJLSBNaWdodCBub3QgYmUgcG9zc2libGUv
ZWFzeSB0byByZWNvbmZpZ3VyZSBhdCBydW50aW1lDQoJLSBXb3VsZCByZXF1aXJlIHRoZSB1c2Vy
IHRvIGRlZmluZSBzZXZlcmFsICJwcm9maWxlcyIgYW5kIGFzc2lnbiBlYWNoIFZNIHRvIGEgcHJv
ZmlsZQ0KCS0gRXhhbXBsZTogbWFzdGVyIGNhbiBjb21tdW5pY2F0ZSB3aXRoIGFueSBWTSBhbmQg
c2VjdXJlIHdvcmxkLCBkb21VIGNhbiBvbmx5IGNvbW11bmljYXRlIHdpdGggZG9tMA0KLSBJbnZl
c3RpZ2F0ZSBob3cgQXJnbyBjaGFubmVsIDAgY291bGQgYmUgdXNlZCBmb3IgZGlzY292ZXJ5IG9m
IFZpcnRpbyBNZXNzYWdlIGJhY2tlbmRzDQoJLSBEZWZpbmUgYSBwcm90b2NvbCBvdmVyIENoYW5u
ZWwgMCB0byByZXRyaWV2ZSBhdmFpbGFibGUgZHJpdmVycy9iYWNrZW5kIGlmIGFueQ0KCS0gSG93
IGRvIHdlIGRpc2NvdmVyIGFsbCBWTXMgd2UgY2FuIGNvbW11bmljYXRlIHdpdGggdXNpbmcgQXJn
byA/IGNhbiB3ZSB1c2UgWFNNID8NCi0gQ29udGludWUgY3JlYXRpbmcgYSBQb0Mgb2YgVmlydGlv
IE1lc3NhZ2Ugb3ZlciBHcmFudC10YWJsZS94ZW4gZXZlbnRzDQoJLSBjaGVjayBwZXJmb3JtYW5j
ZSB3ZSBjYW4gYWNoaWV2ZQ0KCS0gY2hlY2sgaG93IGNvbmZpZ3VyYXRpb24gd291bGQgd29yaw0K
CS0gY2hlY2sgaG93IHRoaXMgY2FuIGxlYXZlIG9uIHRoZSBzaWRlIG9mIGV4aXN0aW5nIHB2IGRy
aXZlcnMNCg0KSWYgeW91IGhhdmUgYW55IGNvbW1lbnRzIG9yIHdhbnQgdG8gYWRkIHNvbWV0aGlu
ZyB3ZSBtaXNzZWQsIHBsZWFzZSBhbnN3ZXIgdG8gdGhpcyBtYWlsLg0KDQpSZWdhcmRzDQpCZXJ0
cmFuZA==

