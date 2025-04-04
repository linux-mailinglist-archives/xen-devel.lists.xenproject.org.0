Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF7BA7B9A7
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 11:12:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937982.1338820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0d5Y-00054t-Ri; Fri, 04 Apr 2025 09:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937982.1338820; Fri, 04 Apr 2025 09:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0d5Y-00052c-Ov; Fri, 04 Apr 2025 09:11:48 +0000
Received: by outflank-mailman (input) for mailman id 937982;
 Fri, 04 Apr 2025 09:11:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YWcl=WW=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u0d5X-00052S-EV
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 09:11:47 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [2a01:111:f403:c200::4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d499d329-1134-11f0-9ffb-bf95429c2676;
 Fri, 04 Apr 2025 11:11:45 +0200 (CEST)
Received: from AS4P251CA0024.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::16)
 by PAXPR08MB7336.eurprd08.prod.outlook.com (2603:10a6:102:223::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Fri, 4 Apr
 2025 09:11:38 +0000
Received: from AM3PEPF00009B9B.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::5e) by AS4P251CA0024.outlook.office365.com
 (2603:10a6:20b:5d3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.27 via Frontend Transport; Fri,
 4 Apr 2025 09:11:38 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9B.mail.protection.outlook.com (10.167.16.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Fri, 4 Apr 2025 09:11:37 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 AS2PR08MB8783.eurprd08.prod.outlook.com (2603:10a6:20b:5e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 4 Apr
 2025 09:11:04 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8583.041; Fri, 4 Apr 2025
 09:11:04 +0000
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
X-Inumbo-ID: d499d329-1134-11f0-9ffb-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dg5XbvabApD1eFznJNBRAoDB7GYEo9KMGRm7Oj4jRVj6HsxEjn4V9rsYIqgUg9sm8AxtSkXC144vLkCBLfDaTu+P1EWUmUQB8u7CZz+PnfpL6YJqe5OnJgjppq8AegbhvW1KAdq2rbID4odkIoD+zXa2aQsrvAVFpNPeQfU6jXjijo1Koaoeb9HZ1gn2st5LcvdhpgiyvMAnSV84ekryAg/Y56G3vLW/eDsALuRC3EKWtBw393dDMrg76U7xXpTsERL0+AFStHjzaqkhcSpJqW9RqDLVJ79xXp1qWXf42MK9ec5EQkG3+LL6fhebKe5XnsIYrAd1/3qUq2bCBPy4bA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ye2CP5boQbxkr6JQv0lu9EtqLHajEC77tVRIcAQdqVI=;
 b=bxppekwZ2ejaDI1Yp1nivHt3RgFuuYTEXzPBPneyhyL0gGJwUnt+xWlJJGO5heYTmS1w+lRLrBewvRof8z2y96+L1XDEUpdzOXEwbMtQXUqri5SALt8B0xLoWFiCrWOy80kB+9FMn93zGCS8tbKz4qer5zKxVHjwfmsmlOYRREiWJUWU5PGbE7nZwL5cgQLfxW/L08yyD91AqD+dHGTnENMMCl79DkDnvXNzai/HhnG8PcLXcC9HXyZ8yCeWY+WhyuFljY4fw7G0BJNDVruTRPez7c/GRb0IgvRTq1d3u2TP2SOB1sW90PMEsiZUUqac2InJ1C/Cgc5Lmu8ZFfz/vw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ye2CP5boQbxkr6JQv0lu9EtqLHajEC77tVRIcAQdqVI=;
 b=oSw0/AL05ijsZLm8O1KgzTgMagGrjK3bh+e3iELTP7mB8bP6TC0XADaRIBwe9Lv8ZKvJjtRKQJxBQh1Jh5WOhcdi2JdEsDBuEq0jxfW3TiY8alYe+mzsIAZZ9Qtd7noPb49Kl/+s/4O3UlcG9VxJCarj4dbIyBdeYTyNTF2mzas=
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mx8eRZyROdFbotvO1t6obrHU+3vkKnK6LPFaTsqkxpls3G6R+ztwaSRAUV5LZwlMBAK5TkKWIcyR24D/KwZa/Ud10m3cGPdem+rATAQ8kJEHUkmelnai/M9OBOKtyvEcUxnO4vntndzuQTCdK2njNitw6uKyruDc7MJ62EXQ8rKFWHt7WpFmXG2pfvu1+Vio+JkcKnRd5GCzHjRkOk7j0cDAXAAgY2kIEaCp/h7nVcXoWS1V70ExqFgaEWuwEoJvb+CNm8DgHKx2rZ0Wl9LRyFJSUi0vNstYLE6xPS6zY4qxWAr+Fs01/KejWZj1vWggmceBG3bW31SDVeq2gg8rJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ye2CP5boQbxkr6JQv0lu9EtqLHajEC77tVRIcAQdqVI=;
 b=GbUgD/iNhFIM/JoqytLNTUTLyc0fjxwHUjyqaiw5BpZsMxh+vyhJ7jgYuDOtJjYgYKA1YuM+g6iGLfxjNTEQlfzWbtLSKknzEs2HQq6mKhRQx6AO0fL4oHcC04/4AwL3zBDY5TEwCJ4TV1DseyiRJ9yUEEHL1oDVW//WyALT44YDUxewdEeePVDtnrlTj9IOhoGATkOaDz/b382MjNHHu/jv0BcRP7L3YfNKVG58+wEfbylOK964a4RZVFNkJRKu5Can1rtcVzodXpQDvgKwj4EehC2SUZd5cOH2jP29QXdgEpQPRwcytJZgYzX/L9ktJ9KfPsJeSiHWD1AQH7rIaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ye2CP5boQbxkr6JQv0lu9EtqLHajEC77tVRIcAQdqVI=;
 b=oSw0/AL05ijsZLm8O1KgzTgMagGrjK3bh+e3iELTP7mB8bP6TC0XADaRIBwe9Lv8ZKvJjtRKQJxBQh1Jh5WOhcdi2JdEsDBuEq0jxfW3TiY8alYe+mzsIAZZ9Qtd7noPb49Kl/+s/4O3UlcG9VxJCarj4dbIyBdeYTyNTF2mzas=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 3/3] xen/arm32: mpu: Stubs to build MPU for arm32
Thread-Topic: [PATCH v4 3/3] xen/arm32: mpu: Stubs to build MPU for arm32
Thread-Index: AQHbpLu+qDQrebRIZEGOW3V0WpA7GrOTOWAA
Date: Fri, 4 Apr 2025 09:11:04 +0000
Message-ID: <A3945B22-D60E-4E66-B4FE-C0013A532E62@arm.com>
References: <20250403171241.975377-1-ayan.kumar.halder@amd.com>
 <20250403171241.975377-4-ayan.kumar.halder@amd.com>
In-Reply-To: <20250403171241.975377-4-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|AS2PR08MB8783:EE_|AM3PEPF00009B9B:EE_|PAXPR08MB7336:EE_
X-MS-Office365-Filtering-Correlation-Id: 562b7b36-ae72-4d8e-a375-08dd7358b40f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?MkZudHVhUVhOSkxaOGVyVUEySnhrSjNjK3BadjVEdDZmTFdmSTNyaW04allm?=
 =?utf-8?B?UFNYNUVzeHlNWUpHODljTHcrZUczUkFkWlFWejBkaWc4QWdsY1JUZ3dZTjZ5?=
 =?utf-8?B?ZncxOUllL1lIN2txcnllNEdiMk4xeHNLWFh4R3czK21uQmNYRmlNT3dyck0v?=
 =?utf-8?B?U1QvOXJadWRSWTNPRVVtLzN4VGNQd2FIZ0tYTFpPaGROd3VyVUNyeGhKblNl?=
 =?utf-8?B?amlUZHUwL1ZsTnJXRXZSMmk3QjJ1RlpSRmFBSVpPcVp1VnF3dnlhM1RQYTVm?=
 =?utf-8?B?SU9EL1krc2t4SVEyLzEwSSt5bWRaLzJhWUQ5WnBHZUgxSU9DY1FBVXp0Tlhr?=
 =?utf-8?B?VEh5UnFRVE5iU05LaEg1T1lTc3dkdVBoRDU3Q2hTMTlsY0hVRzdMbEpqeUhH?=
 =?utf-8?B?Y2twZ3E1cE51UEhIQUx5L2xoWVR4bGpXVDVTZElrMG9hQVlXdEpjWnpPU3R5?=
 =?utf-8?B?UUthYm8wbTc5MFA1UzkyNlQ4WTJEQjhkT0lwZWtHSzdSaUZydk9XQ29sblRr?=
 =?utf-8?B?cWpSOUpVdE5aKzh3UzdwY2lDeGhaT0xEVTZnemZWUkx6bmM1RXZVRzBsYTg3?=
 =?utf-8?B?bCtEUk5jRnlzV0hiczVyWFRBbzhIMlY0OHVKUEJxVzZaN01taVZGWFRPdkpE?=
 =?utf-8?B?eXpFZ0pEYUFpRmdQa1NIZThqQ08rd3lBeWl5MFRPRmpTTkg3eEEvUWlCbzZH?=
 =?utf-8?B?OWptZ2cxczNWTm1SOFUxKzMvKzhHc0E4UlpMSDZFQ2dlakZrNU9XSXp0WXNB?=
 =?utf-8?B?cytmQzB4RkRiM25hWGdpZ1lnQ0hFOENmanN2d0NKdXJlUEZneFh2YUxaNjJV?=
 =?utf-8?B?WnJFcWhScnlvNTZrcWNlUDU4bVprem9HR29rallnZXVGTnd6UnBvZ1dqbjJa?=
 =?utf-8?B?ZVp6bk1GQkZqK2c1SkpyS0s1ZkExc2JlRWJEaE8zUmVJcGFSdjIrZHBKS0ZP?=
 =?utf-8?B?dzMrUFNONDI4NDlYdEtWYWtOZVBMSVk4Y0JydGNzYm1aKzdqellDS1dUWU5s?=
 =?utf-8?B?Tm80bUF2OUd3OUpUTEN6QytOQjI5WFl0d2ZNQmNPNDI2OWhVNldLRmhEQUtN?=
 =?utf-8?B?QjhNUlB3MjJhQXV4UmlDYkFta2JxL1RhU1hyRUxiQ2E0MjNwSnVyQnpMVlU5?=
 =?utf-8?B?MnBkK3hwMG4wSmU1eU9KTlpaZ1RaZEQ4T3hRa2hacHVjK2lCeGtObnNwMmZG?=
 =?utf-8?B?MVB1azFMQXBiZEVFcHppSTJEMWpNbmNTWW8vLy9CYytJRnFOQ3l6UkhDZEd4?=
 =?utf-8?B?Mmpwbm9BVzRZRVBHYVVNWTlmcHR3MDFTTjc4UVEydS91Z3lZbVpNRk9qVU5N?=
 =?utf-8?B?TE82WnRBV29raDZ1TVc3eFMvWCtyOTdJOHlFRTU4cVhSRWtqSkNUbkJ4SmRU?=
 =?utf-8?B?Mkc0dXdxc3ZBYXpCYlBseTNqWjlQL1JsV2RKSVJONUo4NEM5WE90YUpOS3Vm?=
 =?utf-8?B?OW4waXZXV3hRbkN3V0YyMXFNS3hDR0JjTlVlbEVaNER6c2dLMndUSzlucGda?=
 =?utf-8?B?VVVZWEFnR3ltMnRoRlRjYWlQR0hyMWVvakI3OFRQaXNxdXhnRG41bEFnc0Q4?=
 =?utf-8?B?U0RoZmk1OU9yL3ZJbXRtZHZoMzBhL3JYcmJGVStzYkZORUtuM3VGL0x3bUpL?=
 =?utf-8?B?a1JraDZQT3hwTkxlS1RnWVU0RlhoYlNOV1B0MTNrSnJVWTkydVphekE0YUsw?=
 =?utf-8?B?MGF5dWNTOVRBeC9SaWljL3UzNFl6OVdCemZ0dC9aRUFkaEM5UDV5OC9rQ2FP?=
 =?utf-8?B?ZDdXdTROWFplMlBUU0JXcDdVaVVHNVdKMDVKYi85RDhtRzQxU3FSUUNud2RC?=
 =?utf-8?B?dUhtalhSK203cTMzTTZweGQ1KzAyYlJiN21QZThiNXpFMG9jb21vdnVDa3hL?=
 =?utf-8?B?WlRiVVlzT2hGUEpHV0VvZ0RnY2xCMFBXVEJRT3JCMVdTT0ZzZzVkbkRlSlRY?=
 =?utf-8?B?VlVnRWZvUUJYYWw4NzBLRmxFdlR0aHE1cVpwKytkdFYza3Q1MlJvS3dzemtT?=
 =?utf-8?B?akdyc0xKRnVBPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <92F7262822C88D4EAAF69B4A71C26863@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8783
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c4dfd546-b06e-4335-b9da-08dd7358a0bd
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|14060799003|35042699022|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QU9HT3J5cTdzYjJUTVErSE4rRkVLRDV4NWowSFF5ZEZLZm1aNm5nL29HSzhq?=
 =?utf-8?B?MEkwalRZT1dTT1FCZXBJeWlRWFk2S1VPWm1Jcjl3SXkwbVIySEg4cUZyc2Zq?=
 =?utf-8?B?eUkxd1VoWis3dDZKMUMrUi83Unh4UmJ0WFp2QlQwMTRzWEtha2Erd3czYVV2?=
 =?utf-8?B?NVpaalN5SHhoSGtkU3BxZkxTZ0QxNWtMOXBiT3BMVEdGSzF2WXZxZEo5L245?=
 =?utf-8?B?MmNNeElJeFZPdkFHb24zRTFkVmtZZTFNZnJiNnJ4c3FrSjFSM0VNVzArZm01?=
 =?utf-8?B?bHRZYWxpeGNFS0FpL1h5NFBNeG9GcGkxUkFtcktXYXpaNzNuQ3prMFUwOFZ5?=
 =?utf-8?B?ZXFOa0owTUhPdW00eDI1bTVaQytCODRFdStXRDN1OFl0algrYndzRmh5YmY2?=
 =?utf-8?B?cUhMNEluaW1OUGpMSDVLdnFRQnppNldCRXIrYzZQSENJekh6OTNMV3hEdmVE?=
 =?utf-8?B?N1Q1NU10citFZ3Y4NTA5YnV5V2daYmU1KzdvcmlrT1R4UElNOWJRTnN6M2pY?=
 =?utf-8?B?YlNnNld6SWtjbTVqRVNGb3VUZVpPWTl6cGJTdnZYdVF0ZkF3ODJLODN0MWV4?=
 =?utf-8?B?bkxzcmgwd2ZmdUtpeVdvTENqczlkZXB0dDdmOCtiQ3BQOVUwRmc4Z01tYWRt?=
 =?utf-8?B?UG1sNytOT0g3dkNnS0p6ZTFZTE5qVXY2US9GSnBxTnRTamFUb1JzQ1pXSnhQ?=
 =?utf-8?B?RlpaNldkZFpHRzNrQWw4MFNCcVBOeGorV0EwZER1N1FHL1g4Y1pxbll3ZndP?=
 =?utf-8?B?VjRKZ0htOWgrRUM5RU9lVmFPdGZNNUNZV1Q4aU4yY2VrNzJJVjdNbDFCbEU2?=
 =?utf-8?B?TmVoem13V2xpVWpINFpZbCs5WVNBQkgxS1RKdm9GQ0lXby9BbURkRGw5MzFT?=
 =?utf-8?B?WHFSY1MzSHZlR3ozUThjSjEvaGRyb2N0L2w3RWhlUkhORHA0NGJJdDJpSlVV?=
 =?utf-8?B?dWh2b3czNjVlbldtWWtnMU9wM2lBd3pjSm9XRkZ2Q2dOdFBYZ0tKZWwyWHow?=
 =?utf-8?B?WGVrdklMZTJUSUprTzd0QmxYRW1CMk5jUHhSZk5qdUR3cExRYTc3bSttdmlQ?=
 =?utf-8?B?WEtWUWhUVTNlSFhYSWN4RUxYMk1vTXdQdC9VYk00bU9saE5ncEpkM2pNczlz?=
 =?utf-8?B?c0FaUVo4dE1VM1F3SVF2bWgzNi9DK0swc1MyTE8zemJ3SVZXQWxDNXJlREJu?=
 =?utf-8?B?S2RXclhEdG1CcE12VDVZc1lnQlE5d1N4Wnc3WUo3ZWhlRDJhSDJJb2xucjVV?=
 =?utf-8?B?VWRhaEtzY0hKM1dkM2F2bFZPUVEydDhmSzVZQ3BGNmxBVXV5SE82Q1FaR0p3?=
 =?utf-8?B?UGpXM2owVmwrMk1IVXZ2bjNMdnR4ZitqT3VpZFhJYUhMSkcxMTZQL0x5OFhX?=
 =?utf-8?B?c0ltNUpZYXZkRTJOZFo2MURZM2ZFZ3NkMG9pODdpTzJ3dW11QzJvZndUNDFJ?=
 =?utf-8?B?ZE54RUlCc0hpc1d3OTRGZWY0WFkwNTErSDFBU1pCOGpqdlpEZW1xdU1idlFF?=
 =?utf-8?B?dURmU09sV0h5WEowVlZkZkJ6VkR0Tkp4b2d6UnBOZktVWVUrZDlmMnk2MFNr?=
 =?utf-8?B?NjUrOHM5bWJuV0FId21sUnpEd24zUDNXVVl2SlByd3RnVmhFRkViUzBxV0do?=
 =?utf-8?B?K1BpL3dOVnVtR1FMYVRCak05RnRsbzBac3dSd3lkcTZUbURWZ1lDOFRKYkYy?=
 =?utf-8?B?TG9aeHVFbU1kcW9Bdjl4RkRMVkRuczJETXJkK1JGZysrWHF0RHJCeGRZQndC?=
 =?utf-8?B?blhKOGgxektKZ25TbzQySWFtNkM3L1p0d1BiMG4raWlJTkZWei9uRC9naFEr?=
 =?utf-8?B?QnlqS0VjQ01Pdk1udGR4OGo5Yit0Tk5HSjR1TFJIaEwvWlF6WUxZWmhDcEZx?=
 =?utf-8?B?dUtVaE9mUWRCdDdVU2k3MUlsYUNBSUpJdEZDTFNtbU9QWmNHbmxXdmlEeGNi?=
 =?utf-8?B?WkcvZWo0eHd0cEVTT0hYSWpLOUZZSnBBUHBGMzE1WDlXU1FOUmwra3Y5ZUMx?=
 =?utf-8?Q?9QEJiDNNk8oYe/FMCZdC/hIfRbJBkc=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(14060799003)(35042699022)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 09:11:37.0781
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 562b7b36-ae72-4d8e-a375-08dd7358b40f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7336

SGkgQXlhbiwNCg0KPiBPbiAzIEFwciAyMDI1LCBhdCAxODoxMiwgQXlhbiBLdW1hciBIYWxkZXIg
PGF5YW4ua3VtYXIuaGFsZGVyQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gQWRkIHN0dWJzIHRvIGVu
YWJsZSBjb21waWxhdGlvbg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQXlhbiBLdW1hciBIYWxkZXIg
PGF5YW4ua3VtYXIuaGFsZGVyQGFtZC5jb20+DQo+IC0tLQ0KPiANCj4gQ2hhbmdlcyBmcm9tIDot
DQo+IA0KPiB2MSwgdjIgLQ0KPiAxLiBOZXcgcGF0Y2ggaW50cm9kdWNlZCBpbiB2My4NCj4gMi4g
U2hvdWxkIGJlIGFwcGxpZWQgb24gdG9wIG9mDQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcHJvamVjdC94ZW4tZGV2ZWwvY292ZXIvMjAyNTAzMTYxOTI0NDUuMjM3NjQ4NC0xLWx1Y2Eu
ZmFuY2VsbHVAYXJtLmNvbS8NCj4gDQo+IHYzIC0NCj4gMS4gQWRkIHN0dWJzIGZvciBtYXBfZG9t
YWluX3BhZ2UoKSBhbmQgc2ltaWxhciBmdW5jdGlvbnMuDQo+IA0KPiAyLiAnQlVHX09OKCJ1bmlt
cGxlbWVudGVkIiknIGlzIGtlcHQgaW4gYWxsIHRoZSBzdHVicy4NCj4gDQo+IHhlbi9hcmNoL2Fy
bS9hcm0zMi9tcHUvTWFrZWZpbGUgIHwgIDIgKysNCj4geGVuL2FyY2gvYXJtL2FybTMyL21wdS9w
Mm0uYyAgICAgfCAxOCArKysrKysrKysrKysrKw0KPiB4ZW4vYXJjaC9hcm0vYXJtMzIvbXB1L3Nt
cGJvb3QuYyB8IDIzICsrKysrKysrKysrKysrKysrKw0KPiB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9h
c20vbW0uaCAgICB8ICA1ICsrKysNCj4geGVuL2FyY2gvYXJtL21wdS9NYWtlZmlsZSAgICAgICAg
fCAgMSArDQo+IHhlbi9hcmNoL2FybS9tcHUvZG9tYWluX3BhZ2UuYyAgIHwgNDAgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysNCj4gNiBmaWxlcyBjaGFuZ2VkLCA4OSBpbnNlcnRpb25z
KCspDQo+IGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC9hcm0vYXJtMzIvbXB1L3AybS5jDQo+
IGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC9hcm0vYXJtMzIvbXB1L3NtcGJvb3QuYw0KPiBj
cmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL21wdS9kb21haW5fcGFnZS5jDQo+IA0KPiAN
Cg0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21tLmggYi94ZW4vYXJj
aC9hcm0vaW5jbHVkZS9hc20vbW0uaA0KPiBpbmRleCBmYmZmYWNjZWY0Li4yYTUyY2Y1MzBmIDEw
MDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbW0uaA0KPiArKysgYi94ZW4v
YXJjaC9hcm0vaW5jbHVkZS9hc20vbW0uaA0KPiBAQCAtMTcxLDEyICsxNzEsMTcgQEAgc3RydWN0
IHBhZ2VfaW5mbw0KPiAjZGVmaW5lIFBHQ19uZWVkX3NjcnViICAgIFBHQ19hbGxvY2F0ZWQNCj4g
DQo+ICNpZmRlZiBDT05GSUdfQVJNXzMyDQo+ICsjaWZkZWYgQ09ORklHX01QVQ0KPiArI2RlZmlu
ZSBpc194ZW5faGVhcF9wYWdlKHBhZ2UpICh7IEJVR19PTigidW5pbXBsZW1lbnRlZCIpOyBmYWxz
ZTsgfSkNCj4gKyNkZWZpbmUgaXNfeGVuX2hlYXBfbWZuKG1mbikgKHsgQlVHX09OKCJ1bmltcGxl
bWVudGVkIik7IGZhbHNlOyB9KQ0KPiArI2Vsc2UgLyogIUNPTkZJR19NUFUgKi8NCj4gI2RlZmlu
ZSBpc194ZW5faGVhcF9wYWdlKHBhZ2UpIGlzX3hlbl9oZWFwX21mbihwYWdlX3RvX21mbihwYWdl
KSkNCj4gI2RlZmluZSBpc194ZW5faGVhcF9tZm4obWZuKSAoeyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwNCj4gICAgIHVuc2lnbmVkIGxvbmcgbWZuXyA9IG1mbl94KG1mbik7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gICAgIChtZm5fID49IG1mbl94KGRpcmVjdG1h
cF9tZm5fc3RhcnQpICYmICAgICAgICAgICAgICAgICAgICAgIFwNCj4gICAgICBtZm5fIDwgbWZu
X3goZGlyZWN0bWFwX21mbl9lbmQpKTsgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gfSkN
Cj4gKyNlbmRpZiAvKiAhQ09ORklHX01QVSAqLw0KPiAjZWxzZQ0KPiAjZGVmaW5lIGlzX3hlbl9o
ZWFwX3BhZ2UocGFnZSkgKChwYWdlKS0+Y291bnRfaW5mbyAmIFBHQ194ZW5faGVhcCkNCj4gI2Rl
ZmluZSBpc194ZW5faGVhcF9tZm4obWZuKSBcDQoNCknigJl2ZSBoYWQgYSBsb29rIG9uIHRoaXMs
IGlmIHdlIHdhbnQgdG8gZ2V0IHJpZCBvZiBzb21lICNpZmRlZiB3ZSBjb3VsZCBkbyB0aGlzOg0K
DQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21tLmggYi94ZW4vYXJjaC9h
cm0vaW5jbHVkZS9hc20vbW0uaA0KaW5kZXggMmE1MmNmNTMwZjI1Li41YjY3YzBmOGJiMWMgMTAw
NjQ0DQotLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbW0uaA0KKysrIGIveGVuL2FyY2gv
YXJtL2luY2x1ZGUvYXNtL21tLmgNCkBAIC0xNzAsMTkgKzE3MCw3IEBAIHN0cnVjdCBwYWdlX2lu
Zm8NCiAjZGVmaW5lIF9QR0NfbmVlZF9zY3J1YiAgIF9QR0NfYWxsb2NhdGVkDQogI2RlZmluZSBQ
R0NfbmVlZF9zY3J1YiAgICBQR0NfYWxsb2NhdGVkDQogDQotI2lmZGVmIENPTkZJR19BUk1fMzIN
Ci0jaWZkZWYgQ09ORklHX01QVQ0KLSNkZWZpbmUgaXNfeGVuX2hlYXBfcGFnZShwYWdlKSAoeyBC
VUdfT04oInVuaW1wbGVtZW50ZWQiKTsgZmFsc2U7IH0pDQotI2RlZmluZSBpc194ZW5faGVhcF9t
Zm4obWZuKSAoeyBCVUdfT04oInVuaW1wbGVtZW50ZWQiKTsgZmFsc2U7IH0pDQotI2Vsc2UgLyog
IUNPTkZJR19NUFUgKi8NCi0jZGVmaW5lIGlzX3hlbl9oZWFwX3BhZ2UocGFnZSkgaXNfeGVuX2hl
YXBfbWZuKHBhZ2VfdG9fbWZuKHBhZ2UpKQ0KLSNkZWZpbmUgaXNfeGVuX2hlYXBfbWZuKG1mbikg
KHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQotICAgIHVuc2lnbmVkIGxvbmcg
bWZuXyA9IG1mbl94KG1mbik7ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCi0gICAgKG1m
bl8gPj0gbWZuX3goZGlyZWN0bWFwX21mbl9zdGFydCkgJiYgICAgICAgICAgICAgICAgICAgICAg
XA0KLSAgICAgbWZuXyA8IG1mbl94KGRpcmVjdG1hcF9tZm5fZW5kKSk7ICAgICAgICAgICAgICAg
ICAgICAgICAgICBcDQotfSkNCi0jZW5kaWYgLyogIUNPTkZJR19NUFUgKi8NCi0jZWxzZQ0KKyNp
ZmRlZiBDT05GSUdfQVJNXzY0DQogI2RlZmluZSBpc194ZW5faGVhcF9wYWdlKHBhZ2UpICgocGFn
ZSktPmNvdW50X2luZm8gJiBQR0NfeGVuX2hlYXApDQogI2RlZmluZSBpc194ZW5faGVhcF9tZm4o
bWZuKSBcDQogICAgIChtZm5fdmFsaWQobWZuKSAmJiBpc194ZW5faGVhcF9wYWdlKG1mbl90b19w
YWdlKG1mbikpKQ0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tbXUvbW0u
aCBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tbXUvbW0uaA0KaW5kZXggY2FiYTk4N2VkYzg1
Li45Yjk4ZDEyYjA3NmIgMTAwNjQ0DQotLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbW11
L21tLmgNCisrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tbXUvbW0uaA0KQEAgLTIxLDYg
KzIxLDE1IEBAIGV4dGVybiB1bnNpZ25lZCBsb25nIGRpcmVjdG1hcF9iYXNlX3BkeDsNCiANCiAj
ZGVmaW5lIGZyYW1lX3RhYmxlICgoc3RydWN0IHBhZ2VfaW5mbyAqKUZSQU1FVEFCTEVfVklSVF9T
VEFSVCkNCiANCisjaWZkZWYgQ09ORklHX0FSTV8zMg0KKyNkZWZpbmUgaXNfeGVuX2hlYXBfcGFn
ZShwYWdlKSBpc194ZW5faGVhcF9tZm4ocGFnZV90b19tZm4ocGFnZSkpDQorI2RlZmluZSBpc194
ZW5faGVhcF9tZm4obWZuKSAoeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCisg
ICAgdW5zaWduZWQgbG9uZyBtZm5fID0gbWZuX3gobWZuKTsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXA0KKyAgICAobWZuXyA+PSBtZm5feChkaXJlY3RtYXBfbWZuX3N0YXJ0KSAmJiAgICAg
ICAgICAgICAgICAgICAgICBcDQorICAgICBtZm5fIDwgbWZuX3goZGlyZWN0bWFwX21mbl9lbmQp
KTsgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCit9KQ0KKyNlbmRpZg0KKw0KICNkZWZpbmUg
dmlydF90b19tYWRkcih2YSkgKHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcDQogICAgIHZhZGRyX3QgdmFfID0gKHZhZGRyX3QpKHZhKTsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCiAgICAgKHBhZGRyX3Qp
KCh2YV90b19wYXIodmFfKSAmIFBBRERSX01BU0sgJiBQQUdFX01BU0spIHwgKHZhXyAmIH5QQUdF
X01BU0spKTsgXA0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tcHUvbW0u
aCBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tcHUvbW0uaA0KaW5kZXggODZmMzNkOTgzNmI3
Li5iZmQ4NDBmYTVkMzEgMTAwNjQ0DQotLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbXB1
L21tLmgNCisrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tcHUvbW0uaA0KQEAgLTEzLDYg
KzEzLDExIEBAIGV4dGVybiBzdHJ1Y3QgcGFnZV9pbmZvICpmcmFtZV90YWJsZTsNCiANCiAjZGVm
aW5lIHZpcnRfdG9fbWFkZHIodmEpICgocGFkZHJfdCkoKHZhZGRyX3QpKHZhKSAmIFBBRERSX01B
U0spKQ0KIA0KKyNpZmRlZiBDT05GSUdfQVJNXzMyDQorI2RlZmluZSBpc194ZW5faGVhcF9wYWdl
KHBhZ2UpICh7IEJVR19PTigidW5pbXBsZW1lbnRlZCIpOyBmYWxzZTsgfSkNCisjZGVmaW5lIGlz
X3hlbl9oZWFwX21mbihtZm4pICh7IEJVR19PTigidW5pbXBsZW1lbnRlZCIpOyBmYWxzZTsgfSkN
CisjZW5kaWYNCisNCiAvKiBPbiBNUFUgc3lzdGVtcyB0aGVyZSBpcyBubyB0cmFuc2xhdGlvbiwg
bWEgPT0gdmEuICovDQogc3RhdGljIGlubGluZSB2b2lkICptYWRkcl90b192aXJ0KHBhZGRyX3Qg
bWEpDQogew0KDQpCdXQgZmVlbCBmcmVlIHRvIGlnbm9yZSBpZiBpdOKAmXMgbm90IGRlc2lyYWJs
ZS4NCg0KDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbXB1L01ha2VmaWxlIGIveGVuL2Fy
Y2gvYXJtL21wdS9NYWtlZmlsZQ0KPiBpbmRleCAyMWJiYzUxN2I1Li5mZjIyMTAxMWQ1IDEwMDY0
NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vbXB1L01ha2VmaWxlDQo+ICsrKyBiL3hlbi9hcmNoL2Fy
bS9tcHUvTWFrZWZpbGUNCj4gQEAgLTIsMyArMiw0IEBAIG9iai15ICs9IG1tLm8NCj4gb2JqLXkg
Kz0gcDJtLm8NCj4gb2JqLXkgKz0gc2V0dXAuaW5pdC5vDQo+IG9iai15ICs9IHZtYXAubw0KPiAr
b2JqLSQoQ09ORklHX0FSTV8zMikgKz0gZG9tYWluX3BhZ2Uubw0KPiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL21wdS9kb21haW5fcGFnZS5jIGIveGVuL2FyY2gvYXJtL21wdS9kb21haW5fcGFn
ZS5jDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAuLmI5ZWJiMDNk
NjcNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi94ZW4vYXJjaC9hcm0vbXB1L2RvbWFpbl9wYWdl
LmMNCj4gQEAgLTAsMCArMSw0MCBAQA0KPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAtb3ItbGF0ZXIgKi8NCj4gKyNpbmNsdWRlIDx4ZW4vZG9tYWluX3BhZ2UuaD4NCj4gKw0K
PiArdm9pZCAqbWFwX2RvbWFpbl9wYWdlX2dsb2JhbChtZm5fdCBtZm4pDQo+ICt7DQo+ICsgICAg
QlVHX09OKCJ1bmltcGxlbWVudGVkIik7DQo+ICsgICAgcmV0dXJuICh2b2lkKikwOw0KDQpyZXR1
cm4gTlVMTD8gaGVyZSBhbmQgYmVsb3cNCg0KPiArfQ0KPiArDQo+ICsvKiBNYXAgYSBwYWdlIG9m
IGRvbWhlYXAgbWVtb3J5ICovDQo+ICt2b2lkICptYXBfZG9tYWluX3BhZ2UobWZuX3QgbWZuKQ0K
PiArew0KPiArICAgIEJVR19PTigidW5pbXBsZW1lbnRlZCIpOw0KPiArICAgIHJldHVybiAodm9p
ZCopMDsNCj4gK30NCj4gKw0KPiArLyogUmVsZWFzZSBhIG1hcHBpbmcgdGFrZW4gd2l0aCBtYXBf
ZG9tYWluX3BhZ2UoKSAqLw0KPiArdm9pZCB1bm1hcF9kb21haW5fcGFnZShjb25zdCB2b2lkICpw
dHIpDQo+ICt7DQo+ICsgICAgQlVHX09OKCJ1bmltcGxlbWVudGVkIik7DQo+ICt9DQo+ICsNCj4g
K21mbl90IGRvbWFpbl9wYWdlX21hcF90b19tZm4oY29uc3Qgdm9pZCAqcHRyKQ0KPiArew0KPiAr
ICAgIEJVR19PTigidW5pbXBsZW1lbnRlZCIpOw0KDQpOb3QgcmVhbGx5IG5lY2Vzc2FyeSwgYnV0
IGlmIHlvdSB3YW50OiByZXR1cm4gSU5WQUxJRF9NRk47DQoNCj4gK30NCj4gKw0KPiArdm9pZCB1
bm1hcF9kb21haW5fcGFnZV9nbG9iYWwoY29uc3Qgdm9pZCAqdmEpDQo+ICt7DQo+ICsgICAgQlVH
X09OKCJ1bmltcGxlbWVudGVkIik7DQo+ICt9DQo+ICsNCj4gKy8qDQo+ICsgKiBMb2NhbCB2YXJp
YWJsZXM6DQo+ICsgKiBtb2RlOiBDDQo+ICsgKiBjLWZpbGUtc3R5bGU6ICJCU0QiDQo+ICsgKiBj
LWJhc2ljLW9mZnNldDogNA0KPiArICogaW5kZW50LXRhYnMtbW9kZTogbmlsDQo+ICsgKiBFbmQ6
DQo+ICsgKi8NCj4gLS0gDQo+IDIuMjUuMQ0KPiANCj4gDQoNCg==

