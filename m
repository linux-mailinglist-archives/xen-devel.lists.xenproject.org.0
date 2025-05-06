Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C740BAAC4C1
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 14:57:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977195.1364246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCHqy-00022T-4g; Tue, 06 May 2025 12:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977195.1364246; Tue, 06 May 2025 12:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCHqy-00020P-1D; Tue, 06 May 2025 12:56:56 +0000
Received: by outflank-mailman (input) for mailman id 977195;
 Tue, 06 May 2025 12:56:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+p1E=XW=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uCHqw-00020J-UZ
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 12:56:55 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93272b6c-2a79-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 14:56:50 +0200 (CEST)
Received: from AS4P195CA0001.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::8)
 by AM9PR08MB6067.eurprd08.prod.outlook.com (2603:10a6:20b:287::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 12:56:45 +0000
Received: from AMS0EPF00000193.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::13) by AS4P195CA0001.outlook.office365.com
 (2603:10a6:20b:5e2::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Tue,
 6 May 2025 12:56:45 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000193.mail.protection.outlook.com (10.167.16.212) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Tue, 6 May 2025 12:56:44 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 GV1PR08MB8714.eurprd08.prod.outlook.com (2603:10a6:150:83::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.21; Tue, 6 May 2025 12:56:11 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 12:56:11 +0000
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
X-Inumbo-ID: 93272b6c-2a79-11f0-9ffb-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yDIgTw7nsG1vleemABAJrziZmoyeSmGTBFADbhRPsiZ0++xtIKWKMHU9C/geHLvGwyorCmOPsgaZm/ZCamYsIVFcCsKrUiEQHIc+IKZ3r8H5dbvgXTvkZv4Y5RR7TDo3/0FbiEJNPFZ1Fba01JLS0go0idUinhfMoa5lfK/uxaWa7CgVCiI2CPzUerx96fyiW7+/alweU+kBxAtNGTTUFQ/aC2bP5VroNhpjTvoADsTL7HE6ud+Sbx4lovMXQ7IPsYepJw6/x6eapp52nb28qS6MZ1C5hb7ybEXtEISDZ+0/XBLCSB89OhYidxgVBH3b03yJLi7+l/e4AxCOHEEq6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdaGjJ6EHlSDjKNMZrgZ8+8QmMhrREuwfAklL69J/NY=;
 b=vULMrm51t0MMcFVo+iFs0fyVdg6/z6bExj85PuXX8BzDJ9wOnvWzZss2Xj2+tiuraXBFME8J0tv/w74erzK0FX52LTf+uYiLooS+lVx528KxsBv0rG4r+ZUb7Cv9H1V2Acwkisj6WL5Uv2OE7LvC+4sPoNYFLOteImxH6bhdouB8ZMiTjM1eNIgQIlWw0O2LYFFG1xHCgb3Q45PpZuOJ4NdNdZXjXthhbm813CtBakeVcC0SE38TCyh/QUDz9ubxUwKl9qC1W6DslrbuzPI0A9Y/USJkLwKfcwLkUibAXoL1ccb4qW2A6V7LxbbUK/StaE3Jh3KS1qZYcy0/gKCGuQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdaGjJ6EHlSDjKNMZrgZ8+8QmMhrREuwfAklL69J/NY=;
 b=Z4hDDX4CwMw48/P0ejaYTSr7ZXOPOKVvtmUjbYaUotGgBEXAVwlNPrmt3uEwg/IN5un5+N55hNwFLtJd+pa2n79A0LT/40ZqCA4wQSrINwX/lBBHMOaFESybA02ncwtTiYqMnszF9lhsSV91KyKF6LKz499KoE0URQRxdmi9psU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M5wt/Shst9WqZZi9Iy1BMvwpVIfL/tZs2oqCUJcRv0y0EiBJbLITxSFRPa3a5xbYDSIqk+xfjf0OrSxyNpf6cl4425nDYTTFCz6l+VwFAL6oYwlsMkwJ7q6k0kOTzPa79X2DRDFfZG45ySGKOyr7W0xUjmT0VE+NB2Z5DWiIvD7UUkcyUoFJWtap2rLWu3uq4KThkD7/UEfzyytaDiPPCIGKqdDVe28ly+Ks4f3HwVUmiK1+ToNEKuHTvSIlHrLf43Lt9FuYF9vS2PlBb24+RVgTki1q0o3txeoUlyxGXekldL1Rax/4QWYXne+tOG1gR29x8RaUdFEr9cdx21m4Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdaGjJ6EHlSDjKNMZrgZ8+8QmMhrREuwfAklL69J/NY=;
 b=WUiThnsgLqugeXnwup33Ws9Wxf3vuyIQ4zVBptfnUyL57N8svqodcNrzDlu+6Fx5KPzte3L1rOLfCjlSpbIHZiYFwGXJ1/cCAkeHDARmCeSwaSEg6drRkuQYe7H9ity6LEFUntOrKCG56lk49vSFDqduyBhPBH53tf4DGIJnFE2WgBep5Xb2i7e3y4vAkpgv12kF1r6hJOF+9dCTDthyQGa4Ecynv4yACmUyALEi+WRqNIZllB+tbMoRoi8ahiupBEVji5V9Ecb41FdSXtGeGTZse+x3hJZa33aytZ3Pk5ho5AuXbIi/mdMPAZHAxHU2abOtgnYA/wYuQy/wke93Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdaGjJ6EHlSDjKNMZrgZ8+8QmMhrREuwfAklL69J/NY=;
 b=Z4hDDX4CwMw48/P0ejaYTSr7ZXOPOKVvtmUjbYaUotGgBEXAVwlNPrmt3uEwg/IN5un5+N55hNwFLtJd+pa2n79A0LT/40ZqCA4wQSrINwX/lBBHMOaFESybA02ncwtTiYqMnszF9lhsSV91KyKF6LKz499KoE0URQRxdmi9psU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 6/7] arm/mpu: Provide a constructor for pr_t type
Thread-Topic: [PATCH v4 6/7] arm/mpu: Provide a constructor for pr_t type
Thread-Index: AQHbuRpqbs0x64sbw06OBQfYV4WEtLPFavYAgAAvLYA=
Date: Tue, 6 May 2025 12:56:11 +0000
Message-ID: <23A4DA59-A279-45ED-B81C-3EEE72B79DE8@arm.com>
References: <20250429152057.2380536-1-luca.fancellu@arm.com>
 <20250429152057.2380536-7-luca.fancellu@arm.com>
 <42eab292-f9f6-4bc1-a011-c657544ebaf5@amd.com>
In-Reply-To: <42eab292-f9f6-4bc1-a011-c657544ebaf5@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|GV1PR08MB8714:EE_|AMS0EPF00000193:EE_|AM9PR08MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: 91dc7de6-6c7d-4cec-6df8-08dd8c9d7418
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Y0xpbCtVOVczTmQydWJDTkMySHc5eWZiM0tLVkY1d0F1VEI4SU04TCtzdy9M?=
 =?utf-8?B?bHp3T09weTVXWVovOUhidFNiUkcyS2R1VnJuMVVybVdReGlyY2RtQXRBa3cz?=
 =?utf-8?B?cGVnaFZES2dMV3h3cUZwbGJaUVNzY3M3NWx6T1QzY0M5azR6Rjg4RVZOTHAy?=
 =?utf-8?B?QmxUNzBKQnZTZldnZkpKd1BpMC96cFNqR0hQcXVRTFZyOVFBQktBcHNRTEl1?=
 =?utf-8?B?NVR0ZUxlSW9MT21oTFhTd2lDalYrbm93UXVCNHJWYmFYNEtmNW5ac0w3dHZx?=
 =?utf-8?B?YnJvdnF1SHhOYUtFdnpueE5RZS9WWGhmTnZhZmcxTmVuUnpMYU9xMGFMYThs?=
 =?utf-8?B?amxCVm9CeGt6SmZFZXZneHkvQjFidkVWSG5qT2FnYWtMVlptaW9BVmZDV1BO?=
 =?utf-8?B?SE5WSllXbFh0a2RyV3NkTnhMNW82bGpLTEowU1J0cUZIbWRHcFBTZ1dacXFJ?=
 =?utf-8?B?Ri9NOXJJY3lxK0t2OTE1bUVQSEhjSjNnTEdLV1hWS2RYK1hXQ0xXZFlZU0pV?=
 =?utf-8?B?R2huYlN2TkVSWWtld1ROZzdDZ2RWRERqWVFJWDNFVTJSUWJIbGF2QTZzb0hp?=
 =?utf-8?B?V2M2OVRGblllekRoQnUxeEQxSmdvQm03Q25hOFB5L2xpWUxtOEZrTHRkaWtH?=
 =?utf-8?B?REF0WXdYWnRlL2xsT2Y4WURPMUlmSG5PWHJ3R0VCNm42SVlwVi91YlR5SEE3?=
 =?utf-8?B?aDM5RHVrVUhwSEw0MDZNUlprUnV1T21XK1FjQkV4UWpGYnBvT0NUeDhtcC8x?=
 =?utf-8?B?dDZQR2J6c1ZkSDFaSzBhY0dPR3ArMkhEZ0dZSUphSnI2N1VMazhLWEV6dXlY?=
 =?utf-8?B?TTBnZ0p1NkRZLzRabnNtV29XUGJwMkVCdDgrZHRkRkNEUncvZmVBUGNyM2w5?=
 =?utf-8?B?ajBOdElFTUlJdithMTZqOTkxZ050alZmdG1hWlorRWt6THYvcHQ5dFNUL0NC?=
 =?utf-8?B?YldqZnBFTUJrNlpZVXZ2MmhlSEdCQVhNdXJVeC9NVWRqQkF5UWhiM2ZRbTY2?=
 =?utf-8?B?RmFIK2hqM1JidVNpaHhkR05WTFZNZ1BvTml1aTJaOGFtYXBkaDBScXl6K04x?=
 =?utf-8?B?bmEzYW9tR0JJeFpBOW9QNEdZRjdPZU9Dc0JYTjlhM0kzczNXU0N3VU10NXFT?=
 =?utf-8?B?TG9ubURISlkweUwrcmtWTHVFc3NvakYrQkpvV2VwVzhLUzlNcmxORmF4Q0NL?=
 =?utf-8?B?Z09sMW12VDhHS0pvdCsrQzk4dGhRZ2h4U3VlOVdNVEhhMDlRblpjVVYwV3FI?=
 =?utf-8?B?RGhmRjNsRnJuQjJLUnc0Um92WWZQVmxNbmFtc0xyRk5wSEFiK2tFUWNkaXY1?=
 =?utf-8?B?UjdrOHVoSWVNV3k1R1FvN29hVjE1V2poV285UFVFamd0Z2p6WExRbGgyQ1lm?=
 =?utf-8?B?YjdRUjNkNWJMQVdsQUVweHArTlVVMEFoVWNpU1dINVBUaWhZZWlhZStxR1oz?=
 =?utf-8?B?U1IvdTVpQXNENndvR3UrSjE1MElaSjNpUW5FTkthYmp1NHFEQkRIaTVaRGsy?=
 =?utf-8?B?dlpiMVBXcWdRTEJoUDNUbytaZGFaY0VCQy92dG1IaVNIZ3EwaHE1ZitVelpQ?=
 =?utf-8?B?dEFSVXdUbUpiMDFjOUErUzBuRThhOFc4djJ6S0hjbThvL1hXWWxHWHZ4NDFS?=
 =?utf-8?B?c2wzalRjenVpWFdVODZ5YnJXdHJzVnBUclZsMkU3R3N1MWxCWkRXSlhQSEhr?=
 =?utf-8?B?K1FRUEJIaUlZcXFJOTQ1STRTVEt5ODN3RG1RdnVGVE1qUTd6TUhTblFSWDU2?=
 =?utf-8?B?Nkd0UUhrL3ZUUHB2b0JFeW1IUUtKUXlqM3JxdTFGMWs0VHRwUWowWng3Qm81?=
 =?utf-8?B?RHFFYmMyMU54blBaK3o1bVRMdnF5alVzNTRHUmJqbkdCZ0VVUlVaendxMFp3?=
 =?utf-8?B?ZHhmc2tZYWZXdVhaRTVIeCtkaFF6dW9hMlRBMUt5djM1eFdjMjFycnpQN3Y2?=
 =?utf-8?B?T0hMdStUZndwQSsyTXg4SXZHVHpyVVB0Y2s5RVVmUmZ2c0k5ZXhpbUhYMmJF?=
 =?utf-8?Q?VCWwtiL9/hCIiexGRuRNYvEfdEYYNg=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3FEA5C432EB33542B9F509C40B343277@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8714
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	64b6b354-f6d5-41b7-a50b-08dd8c9d6085
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|14060799003|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K00ycVV5MTRubW1SZDVrTjlhRmQvVEtkWFpBaGpORW9aRllzQVEvMVJNc3FL?=
 =?utf-8?B?NzJQVzFoUVUyNkdwdm93Q0hReHJQMWZmWjBJQ25BeDd3MkZhdkxhUXJINXhI?=
 =?utf-8?B?VlpVMjRuYVRYeVNnY1U3OUp3d2FUNmhGQ3BwbS9BSWZMMUtxSTJTRWZ5dkE0?=
 =?utf-8?B?cFhHM21mT1UyWEgzUGpYcGhuSFI1MTdVZWl4VzY0ZFo0V0RHRk44NDBvMmNB?=
 =?utf-8?B?clBqQmp3dGU5MjAvSlN6NnBtaW0ybkxiMW1yNWdBbUY4QS82cFJEdGRMSmQ2?=
 =?utf-8?B?WjRJSmE2eXRrYmEzeWlFWStoeVh1NTREcjNTNmpKWEs4YTJuOUUyWEVKUFo1?=
 =?utf-8?B?ZmRhcVVjV3hlRzVxRndJbXV3cmJpUld0WFRMZFFWdnpBZUdjTzNPZmNwWEVZ?=
 =?utf-8?B?ZTQ5YXVWSUhUaEp4L01SOVROV1FvR0tuRnpueU1LcFZuRHNueGpMQW9zRUJ0?=
 =?utf-8?B?WmplRStpeWI0K3c5MnJGcHJ2bmdrZlg3MkI3MVo0djdyNEg4bnNrRWJjak80?=
 =?utf-8?B?bUtIWkNwMzhTTkVCeFdkTk5YRTU2SHg5S1drOUt1dXBIbjhyN3dRdG1TSGNZ?=
 =?utf-8?B?SmpyQ3Q0NkRvUHpXaXJ1WEZ0VEJPRFBRUnN0T0Nja0pGTVltM3lvRmROdFVl?=
 =?utf-8?B?cEdLYWt2dTIxdWZMYUplbThPNWhMTUk1N2NEMjNiNjRWalR5UWlpREE0NlI4?=
 =?utf-8?B?MmJVcmdRMVlsTDFQY3UzalBpOFdYSHdRa0E2TVlTa3ROaVRaZEw2ZnRYZWtG?=
 =?utf-8?B?OU50SEgyNlNyU0t2RmViSjJWQnVieVlNQTFGOHJUUExOM0tjejJpcVVqbWVJ?=
 =?utf-8?B?UTU0WkZJSFdSUXV1NTltYTZNN0t5eDRSMmVZQ0JiYmhhN2pXR0hMc0RPMkV0?=
 =?utf-8?B?OHFzQ3IyZk15TisweEhJNVl0eThKakFtaXRKcjIwdkdmWk5ZdDZZUGtLRnMr?=
 =?utf-8?B?ODlIVnh3M0VhbUdzSGx4bE94aGlydWxQOWtBTmZobmpsemkyY2tBOGhMc3I1?=
 =?utf-8?B?a1NiVEplQnVRME8zRldWRVBseTdFb3h1ZmgxZVlQUjR3LzVGdExDVGNXalhB?=
 =?utf-8?B?aWxpS09zK0E2dUZXZTl1dXdQMkt1ZVFUTHpsbGE1RzJwQXNtcTlWQTlQWU1E?=
 =?utf-8?B?MUIzRTVWUXBrWnJSRi9RZXlNaG5ka2wvZWpwTVJMcnZCcWdCeTZTZ0E1d01n?=
 =?utf-8?B?VlJqNU95WDlVQnoxZkJ1SWFjV0pxOXRCbDQvQzdhcHpUVEtVTEZrR0JFejVr?=
 =?utf-8?B?WS9UWkxzdE1Eb1ZFYUhjVDFMaVdhRVp6NFlPOHBRQ1FuWVgrekV0V3FXdUU1?=
 =?utf-8?B?Q3FUdGx4QUhDUS9DcUdCN082TStEQWVvMzV4ZGtTVS9OMmQxS0grWCtHYkVj?=
 =?utf-8?B?WXJHZnpWUno1aGlRV01rSUxZa0RBMjdjTHVqNmhqeDFQTXR5RmZDTDgvVXlB?=
 =?utf-8?B?TzFrNGFMMUE0dCsrK1dLTHlJZzlSb3NMTThhTXJ1c1FXU0wwT3E3Ty9hWHpM?=
 =?utf-8?B?QjBaNHBvVG53RTFSc3ZYMGtBWDlpYVVMNjdQQU1kL0czeGdLYW15RllTcGpk?=
 =?utf-8?B?MTlMSVRERk15NEt3ZHBPWjlxdGloQitvdlhmZFBBdWxoaTFLcFNFcnNPd0hz?=
 =?utf-8?B?bjBobUNXdTVscDBBZm5IbDRmdkRuMHpwRDFyZDVmaHcxNGtWS25aZHI3VVAz?=
 =?utf-8?B?SUNiMkYyTG1YOUV6Z2txSEVBUjZmejB2ZXlTNS9oOVR2dTQ2Ukw2QzNqWG5H?=
 =?utf-8?B?eGV5bVc5Z3NjTWNVaU1ZK1lEKzhmbldJNk5tRGJ6ekhJY1JjRnVtUGVUcmVQ?=
 =?utf-8?B?M3pKYkJSMjY0dnFKM1BWTjI2ek9rbm81S3Jjc1poV0prc2lSQU1rVmorUHRG?=
 =?utf-8?B?NEVJQlJsL0ZLMVNIVWl3Qy94UXgyYVFuWk5raHQ4OWFPQkdhRHcvZWFSOTVC?=
 =?utf-8?B?b1hQVS9Dd0pKUjlyQ2p6RXZ1Zm9QOWpVK09RbjBxVkdJemMrL29pR1UvMHdq?=
 =?utf-8?B?L1hTYmd0TDVkWktJN2V6aG5zbmlMdW9mcVRzT1pWQ1FaU1BQY24vR0JSOFk1?=
 =?utf-8?Q?ZB0Av+?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(14060799003)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 12:56:44.1038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91dc7de6-6c7d-4cec-6df8-08dd8c9d7418
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6067

SGkgTWljaGFsLA0KDQo+PiANCj4+ICsvKg0KPj4gKyAqIEV4Y3V0ZSBuZXZlci4NCj4+ICsgKiBT
dGFnZSAxIEVMMiB0cmFuc2xhdGlvbiByZWdpbWUuDQo+PiArICogWE5bMV0gZGV0ZXJtaW5lcyB3
aGV0aGVyIGV4ZWN1dGlvbiBvZiB0aGUgaW5zdHJ1Y3Rpb24gZmV0Y2hlZCBmcm9tIHRoZSBNUFUN
Cj4+ICsgKiBtZW1vcnkgcmVnaW9uIGlzIHBlcm1pdHRlZC4NCj4+ICsgKiBTdGFnZSAyIEVMMS9F
TDAgdHJhbnNsYXRpb24gcmVnaW1lLg0KPj4gKyAqIFhOWzBdIGRldGVybWluZXMgd2hldGhlciBl
eGVjdXRpb24gb2YgdGhlIGluc3RydWN0aW9uIGZldGNoZWQgZnJvbSB0aGUgTVBVDQo+PiArICog
bWVtb3J5IHJlZ2lvbiBpcyBwZXJtaXR0ZWQuDQo+PiArICovDQo+IFdoeSBkbyB3ZSBuZWVkIHRo
aXMgY29tbWVudD8gSWYgYW55LCB3aHkgZG8gd2UgbmVlZCBFTDEgZGVzY3JpcHRpb24gaWYgdGhl
IG1hY3JvDQo+IGlzIEVMMj8NCg0KVWhtIHllcyBJIHRoaW5rIEkgY2FuIHJlbW92ZSBhbHRvZ2V0
aGVyIHRoaXMgY29tbWVudA0KDQo+IA0KPj4gKyNkZWZpbmUgUFJCQVJfRUwyX1hOX0VOQUJMRUQg
IDB4Mg0KPj4gKw0KPj4gI2lmbmRlZiBfX0FTU0VNQkxZX18NCj4+IA0KPj4gLyogUHJvdGVjdGlv
biBSZWdpb24gQmFzZSBBZGRyZXNzIFJlZ2lzdGVyICovDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL2luY2x1ZGUvYXNtL21wdS5oIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21wdS5o
DQo+PiBpbmRleCAwZTBhN2YwNWFkZTkuLjdiODJmMTBkMzM2YiAxMDA2NDQNCj4+IC0tLSBhL3hl
bi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tcHUuaA0KPj4gKysrIGIveGVuL2FyY2gvYXJtL2luY2x1
ZGUvYXNtL21wdS5oDQo+PiBAQCAtMjQsNiArMjQsMTAgQEANCj4+ICNkZWZpbmUgTlVNX01QVV9S
RUdJT05TX01BU0sgICAgKE5VTV9NUFVfUkVHSU9OUyAtIDEpDQo+PiAjZGVmaW5lIE1BWF9NUFVf
UkVHSU9OX05SICAgICAgIDI1NQ0KPj4gDQo+PiArLyogQWNjZXNzIHBlcm1pc3Npb24gYXR0cmli
dXRlcy4gKi8NCj4+ICsvKiBSZWFkL1dyaXRlIGF0IEVMMiwgTm8gQWNjZXNzIGF0IEVMMS9FTDAu
ICovDQo+PiArI2RlZmluZSBBUF9SV19FTDIgMHgwDQo+IFRoaXMgbWFjcm8gYW5kIHRoZSBwcmV2
aW91cyBvbmUgYXJlIHVzZWQgb25seSBvbmNlIChJIGFsc28gY2hlY2tlZCB5b3VyIGZ1bGwNCj4g
dHJlZSkgYW5kIGNhbm5vdCBiZSBzZXQgYnkgdGhlIGNhbGxlci4gV2hhdCdzIHRoZSBwdXJwb3Nl
IG9mIHRoZSBtYWNyb3MgdGhlbj8NCj4gV2h5IGNhbid0IHdlIHNldCB0aGVzZSB2YWx1ZXMgaW4g
cHJfb2ZfeGVuYWRkcigpIGFuZCBhZGQgY29tbWVudCBuZXh0IHRvIHZhbHVlDQo+IHRoZXJlPw0K
DQpTdXJlLCBJ4oCZbGwgZG8gdGhhdA0KDQo+IA0KPj4gKw0KPj4gI2lmbmRlZiBfX0FTU0VNQkxZ
X18NCj4+IA0KPj4gI2lmZGVmIENPTkZJR19BUk1fNjQNCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vaW5jbHVkZS9hc20vbXB1L21tLmggYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbXB1
L21tLmgNCj4+IGluZGV4IGUyMjM1ZTU2OGU4MS4uMjk2ZmU3NGM1ZDYxIDEwMDY0NA0KPj4gLS0t
IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21wdS9tbS5oDQo+PiArKysgYi94ZW4vYXJjaC9h
cm0vaW5jbHVkZS9hc20vbXB1L21tLmgNCj4+IEBAIC03NSw2ICs3NSwxNiBAQCBleHRlcm4gdm9p
ZCByZWFkX3Byb3RlY3Rpb25fcmVnaW9uKHByX3QgKnByX3JlYWQsIHVpbnQ4X3Qgc2VsKTsNCj4+
ICAqLw0KPj4gZXh0ZXJuIHZvaWQgd3JpdGVfcHJvdGVjdGlvbl9yZWdpb24oY29uc3QgcHJfdCAq
cHJfd3JpdGUsIHVpbnQ4X3Qgc2VsKTsNCj4gSGVyZSBhbmQgLi4uDQo+IA0KPj4gDQo+PiArLyoN
Cj4+ICsgKiBDcmVhdGVzIGEgcHJfdCBzdHJ1Y3R1cmUgZGVzY3JpYmluZyBhIHByb3RlY3Rpb24g
cmVnaW9uLg0KPj4gKyAqDQo+PiArICogQGJhc2U6IGJhc2UgYWRkcmVzcyBhcyBiYXNlIG9mIHRo
ZSBwcm90ZWN0aW9uIHJlZ2lvbi4NCj4+ICsgKiBAbGltaXQ6IGV4Y2x1c2l2ZSBhZGRyZXNzIGFz
IGxpbWl0IG9mIHRoZSBwcm90ZWN0aW9uIHJlZ2lvbi4NCj4+ICsgKiBAYXR0cjogYXR0cmlidXRl
IGluZGV4IGZvciB0aGUgbWVtb3J5IHR5cGUuDQo+PiArICogQHJldHVybjogcHJfdCBzdHJ1Y3R1
cmUgZGVzY3JpYmluZyBhIHByb3RlY3Rpb24gcmVnaW9uLg0KPj4gKyAqLw0KPj4gK2V4dGVybiBw
cl90IHByX29mX3hlbmFkZHIocGFkZHJfdCBiYXNlLCBwYWRkcl90IGxpbWl0LCB1bnNpZ25lZCBp
bnQgYXR0cl9pZHgpOw0KPiBoZXJlLiBQbGVhc2UgZG9uJ3QgdXNlIGV4dGVybiBpbiBwcm90b3R5
cGVzLiBJdCdzIG5vdCBuZWVkZWQuDQoNCkkgc2VlIHdlIGhhdmUgYSBtaXhlZCB1c2FnZSBvZiB0
aGlzIGluIGFyY2gvYXJtIGFuZCBpdOKAmXMgbm90IGRvY3VtZW50ZWQgdG8gZG8gb3RoZXJ3aXNl
DQppbiB0aGUgY29kZSBzdHlsZSwgaW4gdGhpcyBjYXNlIEkgd291bGQgcHJlZmVyIHRvIGJlIGV4
cGxpY2l0IHVubGVzcyBpdOKAmXMgYSBzdHJvbmcgb2JqZWN0aW9uIG9uIHlvdXIgc2lkZSwNCmxl
dCBtZSBrbm93Lg0KDQoNCj4+IA0KPj4gK3ByX3QgcHJfb2ZfeGVuYWRkcihwYWRkcl90IGJhc2Us
IHBhZGRyX3QgbGltaXQsIHVuc2lnbmVkIGludCBhdHRyX2lkeCkNCj4+ICt7DQo+PiArICAgIHBy
YmFyX3QgcHJiYXI7DQo+PiArICAgIHBybGFyX3QgcHJsYXI7DQo+PiArICAgIHByX3QgcmVnaW9u
Ow0KPj4gKw0KPj4gKyAgICAvKiBCdWlsZCB1cCB2YWx1ZSBmb3IgUFJCQVJfRUwyLiAqLw0KPj4g
KyAgICBwcmJhciA9IChwcmJhcl90KSB7DQo+PiArICAgICAgICAucmVnID0gew0KPj4gKyAgICAg
ICAgICAgIC5hcCA9IEFQX1JXX0VMMiwgICAgICAvKiBSZWFkL1dyaXRlIGF0IEVMMiwgbm8gYWNj
ZXNzIGF0IEVMMS9FTDAuICovDQo+PiArICAgICAgICAgICAgLnhuID0gUFJCQVJfRUwyX1hOX0VO
QUJMRUQsICAgLyogTm8gbmVlZCB0byBleGVjdXRlIG91dHNpZGUgLnRleHQgKi8NCj4+ICsgICAg
ICAgIH19Ow0KPj4gKw0KPj4gKyAgICBzd2l0Y2ggKCBhdHRyX2lkeCApDQo+PiArICAgIHsNCj4+
ICsgICAgY2FzZSBNVF9OT1JNQUxfTkM6DQo+PiArICAgICAgICAvKg0KPj4gKyAgICAgICAgICog
QVJNIEFSTTogT3ZlcmxheWluZyB0aGUgc2hhcmVhYmlsaXR5IGF0dHJpYnV0ZSAoRERJDQo+PiAr
ICAgICAgICAgKiAwNDA2Qy5iIEIzLTEzNzYgdG8gMTM3NykNCj4gSXQncyBhIGJpdCBvZGQgdG8g
cHJvdmlkZSBoZXJlIHRoZSBtYW51YWwgZm9yIEFybXY3Lg0KPiBBbHNvLCBvdXIgZ2VuZXJhbCBh
ZHZpY2UgaXMgdG8gdXNlIHRoZSBsYXRlc3QgcmV2aXNpb24uDQoNCkkgc3VzcGVjdCB0aGlzIHdh
cyBjb3BpZWQgZnJvbSBtZm5fdG9feGVuX2VudHJ5LCBJ4oCZbGwgdHJ5IHRvIGZpbmQgdGhlIGxh
dGVzdCByZWZlcmVuY2UgdG8gdGhpcy4NCg0KPiANCj4+ICsgICAgICAgICAqDQo+PiArICAgICAg
ICAgKiBBIG1lbW9yeSByZWdpb24gd2l0aCBhIHJlc3VsdGFudCBtZW1vcnkgdHlwZSBhdHRyaWJ1
dGUgb2Ygbm9ybWFsLA0KPj4gKyAgICAgICAgICogYW5kIGEgcmVzdWx0YW50IGNhY2hlYWJpbGl0
eSBhdHRyaWJ1dGUgb2YgSW5uZXIgbm9uLWNhY2hlYWJsZSwNCj4+ICsgICAgICAgICAqIG91dGVy
IG5vbi1jYWNoZWFibGUsIG11c3QgaGF2ZSBhIHJlc3VsdGFudCBzaGFyZWFiaWxpdHkgYXR0cmli
dXRlDQo+PiArICAgICAgICAgKiBvZiBvdXRlciBzaGFyZWFibGUsIG90aGVyd2lzZSBzaGFyZWFi
aWxpdHkgaXMgVU5QUkVESUNUQUJMRS4NCj4+ICsgICAgICAgICAqDQo+PiArICAgICAgICAgKiBP
biBBUk12OCBzaGFyYWJpbGl0eSBpcyBpZ25vcmVkIGFuZCBleHBsaWNpdGx5IHRyZWF0ZWQgYXMg
b3V0ZXINCj4+ICsgICAgICAgICAqIHNoYXJlYWJsZSBmb3Igbm9ybWFsIGlubmVyIG5vbi1jYWNo
ZWFibGUsIG91dGVyIG5vbi1jYWNoZWFibGUuDQo+PiArICAgICAgICAgKi8NCj4+ICsgICAgICAg
IHByYmFyLnJlZy5zaCA9IExQQUVfU0hfT1VURVI7DQo+PiArICAgICAgICBicmVhazsNCj4+ICsg
ICAgY2FzZSBNVF9ERVZJQ0VfbkduUm5FOg0KPj4gKyAgICBjYXNlIE1UX0RFVklDRV9uR25SRToN
Cj4+ICsgICAgICAgIC8qDQo+PiArICAgICAgICAgKiBTaGFyZWFiaWxpdHkgaXMgaWdub3JlZCBm
b3Igbm9uLW5vcm1hbCBtZW1vcnksIE91dGVyIGlzIGFzDQo+PiArICAgICAgICAgKiBnb29kIGFz
IGFueXRoaW5nLg0KPj4gKyAgICAgICAgICoNCj4+ICsgICAgICAgICAqIE9uIEFSTXY4IHNoYXJh
YmlsaXR5IGlzIGlnbm9yZWQgYW5kIGV4cGxpY2l0bHkgdHJlYXRlZCBhcyBvdXRlcg0KPiBEb2Vz
IHRoaXMgQXJtdjggY29tbWVudHMgbWFrZSBzZW5zZT8gV2UgZG9uJ3Qgc3VwcG9ydCBBcm12NyBN
UFUuDQo+IA0KPj4gKyAgICAgICAgICogc2hhcmVhYmxlIGZvciBhbnkgZGV2aWNlIG1lbW9yeSB0
eXBlLg0KPj4gKyAgICAgICAgICovDQo+PiArICAgICAgICBwcmJhci5yZWcuc2ggPSBMUEFFX1NI
X09VVEVSOw0KPj4gKyAgICAgICAgYnJlYWs7DQo+PiArICAgIGRlZmF1bHQ6DQo+PiArICAgICAg
ICAvKiBYZW4gbWFwcGluZ3MgYXJlIFNNUCBjb2hlcmVudCAqLw0KPj4gKyAgICAgICAgcHJiYXIu
cmVnLnNoID0gTFBBRV9TSF9JTk5FUjsNCj4gQUZBSVIgTUlTUkEgQyByZXF1aXJlcyBldmVyeSBj
bGF1c2UgdG8gYmUgdGVybWluYXRlZCB3aXRoIGJyZWFrLg0KPiBUaGF0IHNhaWQgSSBkb24ndCBy
ZW1lbWJlciBpZiB3ZSBhY2NlcHRlZCB0aGlzIHJ1bGUuLi4NCg0KSeKAmWxsIGFkZCBhIGJyZWFr
LCBpdCBkb2VzbuKAmXQgaHVydC4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

