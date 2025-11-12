Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76189C511F4
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 09:31:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159584.1487900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ6G3-0001lu-EM; Wed, 12 Nov 2025 08:31:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159584.1487900; Wed, 12 Nov 2025 08:31:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ6G3-0001kS-B7; Wed, 12 Nov 2025 08:31:15 +0000
Received: by outflank-mailman (input) for mailman id 1159584;
 Wed, 12 Nov 2025 08:31:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=21S/=5U=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1vJ6G2-0001kM-Gx
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 08:31:14 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2be3599-bfa1-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 09:31:13 +0100 (CET)
Received: from DU6P191CA0027.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::27)
 by PAXPR08MB6686.eurprd08.prod.outlook.com (2603:10a6:102:13e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 08:31:10 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:53f:cafe::4f) by DU6P191CA0027.outlook.office365.com
 (2603:10a6:10:53f::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Wed,
 12 Nov 2025 08:31:10 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.13 via
 Frontend Transport; Wed, 12 Nov 2025 08:31:09 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AM0PR08MB11703.eurprd08.prod.outlook.com (2603:10a6:20b:743::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 08:30:38 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 08:30:37 +0000
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
X-Inumbo-ID: f2be3599-bfa1-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bpF+eKUeqjT9AHeADAo7m674hwZdv9/3BOEjX/K0DpoJsZuUv+QzI8M4/bzfg4/uj9Qq1zabEgmcZwljWwlmJR21+lOGA69zj836IGcfwdi6k9KPWnwATCjWQTaKqdf3t41sMJQM2ELycBxLjHL4INwVawfbyjG3p+OoVlzQcKc0LSZoDuxl2BZCQrK9BzBqVAp95ryxzJkStTkjsHQGQxOK/8in/7328vaKGe+3XOP6F0bz+U85i1M7LU/NgEMqnWTYYfB0RCpseBuxfU1M4G09XtgB24CTD8qqUMG46phs4efmotDp/Wx2+IeZ7Fj5UrMbFnQ2kVJPsEkTC9Hx4A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/rSRZyPrz26OL8ssugMf6l3FFTzeAKS/w/k9327CUA=;
 b=t1utpVmT3lKTT/Vpn1s6R/EXV1fJEWbcyI8wdQ280448TT7qM9I5ept/a0LZ95Qm9Kog+i39UJxPy6PmpLvEy4OQMdveZsboLJD89YZD/O9LUpIPRioLp86a+OcwbmrskIJiy+wNCJOIc2x1cYJt5TAo4BQwsaEXNt+nvyXq62n/uYQncqeBlgE5GkPl72IvdpH6W/JN6rBf/Ezt4mla+4bbgNGZb3Tlb9PP6Zqu8Ouvom+YBKtvgT9kaRfuNgZFOyEKCjTdDGf7wsohC6Rl83+RYEtFK61WgqUPyuz6XiUngtNnI9QimiLCyK+XkVowBQXvTnuKUzuMSa7NKwykyw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/rSRZyPrz26OL8ssugMf6l3FFTzeAKS/w/k9327CUA=;
 b=DEt+/d/MRlC3hNoEfm3QDY4CBEj3wPa3vCILnqpYTiQVYV4kwJvsNln/pXwfG5TWKPe+gpP6+5Vorl/REbLir8HtZEmAE1Q15pyHUSEnZ5yG8UGB/JTdKY2wR1kP7HGKi/qpxFhST2pBQGX06Hl++A+GgXDPVUVGwaJo2DJ9dRs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NNlckOIblKdaV+qJpn1BG6kKP9up/8IywTRtw5YC6wb4N8CwaMK/K/s6+pGc6uGcj0biFy121whVXH5LjwJUKPs8II+pD2qgWbtdT3rNnS/3CIo6arF9QzRdtE+icFZFLj2RNfDzyhwaKgf+jxVHTBUZSLR4drNSIf2P1FJwsn0JOmeUgJAJ9iitemyepTkMpuUoYysQsFJsoXYtnYhm57vCso1Th6BpBAPEMTe42hQWSmcLr4EgsefuFxp4FwxOSuRcJIIb7V9NO7Tm2CS1ihGsRx/PxYhmi9yrI1MEk0NBZZYOtSIhFuML25tDDCaRmiTAzA/FUD2dm3qilw6cPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/rSRZyPrz26OL8ssugMf6l3FFTzeAKS/w/k9327CUA=;
 b=nan2fL3EQZeuzGiGWBgmE6CsWl0hJbg2Db0+YDdVI52ZKScqWzBxsU0B2cRYwlif8+iOy3/VIxd/BKTawf51jYo+UyFT9l3YiDzHU34FUuJA+9OH2FCKiVaw9f4wh6qa2wun0iVJtSZzVax0Ix2s1cmZ83ITeaFCVjq4h6mFQxkPO6J6W4STbH1z4sTIHsyrdbiUJUV1smHr8Fh/M/Bv42mw+4ULkvjiB+snH2sSeikDg2G2ODW8SK0oerYINebmIbP7qoQpnmXRNMlI7bqfzVW2BGqbCXtJcRS1AgphU97/Nr/FpGQI7EVyzWaDMomlB/7PWZmPip+Wan1L1P4RMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/rSRZyPrz26OL8ssugMf6l3FFTzeAKS/w/k9327CUA=;
 b=DEt+/d/MRlC3hNoEfm3QDY4CBEj3wPa3vCILnqpYTiQVYV4kwJvsNln/pXwfG5TWKPe+gpP6+5Vorl/REbLir8HtZEmAE1Q15pyHUSEnZ5yG8UGB/JTdKY2wR1kP7HGKi/qpxFhST2pBQGX06Hl++A+GgXDPVUVGwaJo2DJ9dRs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] arm/xen: zero init memory region before returning to
 the heap
Thread-Topic: [PATCH v2] arm/xen: zero init memory region before returning to
 the heap
Thread-Index: AQHcSn+3Bvk2A/mifU6ZI0j7ZDmNtLTuyBqA
Date: Wed, 12 Nov 2025 08:30:37 +0000
Message-ID: <5DCD0584-BFC8-41EA-84B2-B87A66BFB0BF@arm.com>
References:
 <c2a15402f87de85c2733362ef3ebc3ffe55b231f.1761926280.git.dmytro_prokopchuk1@epam.com>
In-Reply-To:
 <c2a15402f87de85c2733362ef3ebc3ffe55b231f.1761926280.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AM0PR08MB11703:EE_|DU6PEPF00009528:EE_|PAXPR08MB6686:EE_
X-MS-Office365-Filtering-Correlation-Id: 979be9cc-5b02-408f-8abd-08de21c5d511
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?SjZrdE9LVzk1L3Zwb0p3V2hvYUdWOTJVOXFqL0VCTi9BenFDV3d1MEZlSlBr?=
 =?utf-8?B?Zmt2cWxvTGV3aXIrSTUwbHg5UzkrOUtIVzd1TmV2NTJnR3NEdHJ2Y2x0SEZQ?=
 =?utf-8?B?OVpkczBkU0QrTnE3WVZTNHRmQldaVXFWV2dCaUV3WlhMb3h6SmlwSWlwcVEy?=
 =?utf-8?B?L2JRaHZSMWFUa1VuanJ5YkV4Ynl2RlVkVFJLSCsxK1pUZmNuY3BPMklKZkpQ?=
 =?utf-8?B?emJLa1NoR0toKzZZY2VUeSs5QUVSS1NhMU51RFhhZklHYlZVWU9oazJsV1pR?=
 =?utf-8?B?RFdCem11ODZBeFB6L2FWZVB6MmJycmM0dExBL3ZPS0t5TDdraVQvbXN5NVYw?=
 =?utf-8?B?aGQwS3BXUi9QVnUwWDBZZE52UE9RV2N1T2R0S0NYQytDeTBTWllLQUJoNVJu?=
 =?utf-8?B?cndtTUcybFhOYWNpeFJ4Q2VxNUh5b3pYZWVJUTJVMitXcFBmWlZUTVpNUVhq?=
 =?utf-8?B?MjdzUzM4eXIzTU9tRVJTN3ZRRVNXRUdhSkc1MjZuWDIwWFlpUm5sWXdCMWhY?=
 =?utf-8?B?azNmVkZIUmxNTEdiN2VwbGl1OEg5MjdzUFVJbEorU0I5aExHTmY2OEdCNVR6?=
 =?utf-8?B?bFhkSm1iQ2ZHYklIZ1NkOU9zRi94WmZvcXBuM1REVDFhZ0dXbTJ5ZnAySElZ?=
 =?utf-8?B?dVRGa1Jmb1hlWlpZbXpvQnRXQmU2a0orUmxGMTE4VWNTaEE1REdvSXBYMHRz?=
 =?utf-8?B?czF6ZkNxb2RKa2NiV21yZFVpaXpnK1NsalFDRE02eG41bjg4VlZRNmprR1dT?=
 =?utf-8?B?VDhnQzkyWHd3c05LWGlnaVcyVTFLU3ZqeUlWZDJhSnBmNkIrUENwSGlQekgv?=
 =?utf-8?B?VFkzQ2x5bTVGVzBxVldUNTFyYU5wemlmVjMzR3BsQW12OFBLaFdxcTNWTW80?=
 =?utf-8?B?cGovMC9EbkZIVnJsSnhwWGQxN1poUHpUQ2FlTERjM3F2cjV6am1HajdvS2Ew?=
 =?utf-8?B?WFpsTFl4Y2RGcHNXcTNnWDNBMGliU000bk5LM3JuU1Noc2RzZ2JqRWl3MEox?=
 =?utf-8?B?dDU0eDJzMUdsblJOVnRXeVcrcnB3aTRCQUJMNDJyMnZrcWlkMHJHY0x5TkZw?=
 =?utf-8?B?SzkvZXFNTGkzdUNidmF5WmRSY3dKQXRDakMyZDFtbzhJajZQd2M4VzhLQnpH?=
 =?utf-8?B?eUt5YUpFUkQyckNXR3ViYzh3V0R6K2FSMW9JM1dmLzc0K1prajcvNXZsV0R5?=
 =?utf-8?B?dGI1alVSMkRwWEVUcHZnVzNFZ0tTWHRKVW1RQkI4ak9EbElLbG90RXhSb0lT?=
 =?utf-8?B?dDY1dnFPL3dQRWJWbXhmTGVkei9lZFJ5Q1FLclVwMDNtUE8yb3psdDVtVzBV?=
 =?utf-8?B?MnVGL0JTcFl5SjZCWDRSamxidDBrOFFNTDR6ZlN2MHhlVktuMlVMWXprblVx?=
 =?utf-8?B?b3I2cnJSOXYxbzE2V0dMbVBBM01BV2Fmc05jZGdrT3NNMDdabGRhZlVtRTdF?=
 =?utf-8?B?ZXlEeGhYSjJ6ZDBZMEwza3p1K1dGK3h2a1h4RjJDTmRPUFRKaCtPTFBSQktK?=
 =?utf-8?B?YU1sdWJOd2ZiMVJTMlNsdEVCZ3hZaitJeU84bmNQVFFBc0NHUFhXZE01eUU0?=
 =?utf-8?B?bTdiZFdmYklFU2x6Qk9WNGdGdHQ3UjFSUjBtM1BIZVg3NnJ5bllXeGNDT1JZ?=
 =?utf-8?B?WUgrMVZZQkhLanF4VEJGZ2NjNkQrR2RkV084NU9KbFFDMkVqUDZveUY2eW01?=
 =?utf-8?B?OU5yR3FTY2F6Wlg1Qi9SN1VRK2lKM2JnbnZPMVUvcWE5bnl2RXRKMytSRGNi?=
 =?utf-8?B?L2kyWVdBc25ONU1RdW5MVE5QK3VWZk5vRE5yZHpuTHYybUVReGZ0emc3NUZY?=
 =?utf-8?B?NVdlMHJZcHl2bkJUOGZsSkJoc2FiekV6TmVxMUMrTmJyOTBSRllHcXJnUTFp?=
 =?utf-8?B?Q3lQK2dsSDMwSXhsSnFLSzdXcVVZeFRLYTVBYk4rME5CMGp2dGYyQ1lzZG1o?=
 =?utf-8?B?c3NWKzJOWGRBbXFseFJSQ2laNXMySXJia2pWU3JuS3dXUUtFVEV1UksyOGN0?=
 =?utf-8?B?dW0ydEpTK0R2dVZlamdpbzljZjVIME8vcXNzcVJON2pxOEFXNksrTmt0c3Np?=
 =?utf-8?Q?DVKtA3?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <950054021BE0124EB553E82551EE177B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB11703
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	50cc5064-1bf9-4e18-d373-08de21c5c1d1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|376014|36860700013|1800799024|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?akV4bnVza0J6bFlnb2orQVhFMUZ1T1RzUmVvZGlKWU9zd1pMcXNsaUM4N3lI?=
 =?utf-8?B?TDdtWkRWYWpJT2MxcnkyckNxN3ZWZkZ3UzNLdDhSdTR0NGVkemVlcnlqVUNL?=
 =?utf-8?B?Vzc0UnVqelBEUTFjNENzRFlSRnJYMmJUbVgxdkU1V2taa0k4YlRqMEpVTnhh?=
 =?utf-8?B?Q1BTZTZyT21GaE9SM1R5VGlYaVZ4WTRUeElkZlR0ZzFhRHNtZHo0czNmdDBx?=
 =?utf-8?B?T1pnSzF6WHpIWk9IK1Q0RDFpcmptMlYvZTBhMlN3MTNTZWJXZW1vTCtsbnlO?=
 =?utf-8?B?bm00VmV0eGZCUldDOWk5M1RwM0lBVjBTSzZzU2ZvK3h1Rng2Mk1rL1d4a2VK?=
 =?utf-8?B?dW5RRTdjeFIxTTdqbUdQREUybUVOaXl1eFBBWlovdW16RFhxenlsWVJFejhO?=
 =?utf-8?B?cmZPSndUYmVyVkZnMTZOZllXMGlkMVRBTHUvNWdHY0lDL0h1a0k3MTlYakdr?=
 =?utf-8?B?WC9UdG5XK2dBdEJtTExpZFoyNWkrUVdpbGNpOGNxYlJ6eHBPSWVMRUQvNXVu?=
 =?utf-8?B?QzZsUDRlK3l6SERkbHFjVFZIQllZN2pRcVNOc2cxdDFPSUlQc0tuMlRRdlNn?=
 =?utf-8?B?M0x5Nm1ISjBCNUN0VEF2OHUwWmE0THdIaVhWK0RWd0IrTUxSVzQxRVpBbUlu?=
 =?utf-8?B?RDVseThzaFlLbDMvSzh5NXM4MFh2RU9BbU5YTHltNFkwbWw5R2QvRmNLTURS?=
 =?utf-8?B?R2w3Sk9UUiszRDdxUVJEdUJ1cUpvUHVIRWFyK0cvT2JXdklHYkxucUtZa3ZP?=
 =?utf-8?B?bDc0UEdpajd4NWE3MXo4N3gwZWdZTSt1cDl0Umk2d1pQam53eDByY3FKZE94?=
 =?utf-8?B?SHk4YVJvMlVReVdEcHZkM2FVRmJIWDhmVTVtdFV2RTFacGFUKzFXdVZaL0R2?=
 =?utf-8?B?ZWtQZ0FGMEdJb211QjFmaFZZSkhKUjdrczVnOXJpY1NQbmFmUnhZV2QwSmtS?=
 =?utf-8?B?RzJZMWg4VjhwRUowUExELzNzRFV6R3hieVdQWmwwOWFJSnl2bHBLNzc2dzJZ?=
 =?utf-8?B?REM5N09DQjFwOVlSRzdzOUt5djNZNE1rc01JQXJJSC9qaDdtMXltRnpWRWYx?=
 =?utf-8?B?eGpVT1pFRTlrZWo5MjRoUUg3MlNkM2xORjVkRkVqSGpHZUlvRGNPYW5UOEw1?=
 =?utf-8?B?c01GTVBab3czNEp5WVFMRlFJVjFmWWVzcFBrSERhZFBRaVg4RU1FL3VUeDd2?=
 =?utf-8?B?WE00NWpvQzFRNkYvcjdyVXNjV0pMWnpkMzRvVnpEQm1ONlNFN2Jra3ZwV0t3?=
 =?utf-8?B?UFFEdnFZUDUzT29pSXBvd1V4RUtJdlZvc2VTazB6SjRyOHhPdTYxbEtzWmFk?=
 =?utf-8?B?cUlXUFltN3lkaXFSTmZQY0wwczJTNU1NMTdPWEdWc1hmVWdVL25rRmNDUHRC?=
 =?utf-8?B?Y3lNdWdzbXZ1SUVwWU5Ebjl4MjQ1UzhhakdRaGxOdlcrSjZmcWkwTHBpZ3RT?=
 =?utf-8?B?OGxsUHFnWlRTZTJsbnZpb09QQlRPSXB5bXh6UHNIME9SUE0zNEV4K0RqZm8w?=
 =?utf-8?B?N3ZXMnhZUzdhLzUrcTBJeG1WK283dWttY0NjWXdKT2JqRlpOK082TmFvdWYx?=
 =?utf-8?B?aWFMK1JsZFJvNVdMS2ZIMTd3dngvckw3WmRyL3gxZnh1RFZTZkhmRU4yWWxp?=
 =?utf-8?B?c21ld1BIVmJTejF5blp2TUphMmJ4NGtZOXlTcHk0VVNNNDU3Rk9pazNPdE5T?=
 =?utf-8?B?bjdpWEpUQ2RzZWZGRXZUQUh6QzVhWVl6aVdqT2hjbCtyeWxDTTlvS1JWTTQ4?=
 =?utf-8?B?emE2d2lZSE1TRFJpelVrT3U1L3hoUjdjRmRWUjdzZFBUYUZoWmQreXdjNDRR?=
 =?utf-8?B?QnY5aGl3c21lRm13cklnNmpUdk1WRFV1R0taTnBDMUN5a2szT1ByakZmVDhV?=
 =?utf-8?B?SmMyL2NXQStibjc5ZlpNVW1Idmd6L2FQZW5yTUdQejFwWU42aVBGc2hBVk9y?=
 =?utf-8?B?aFNhVDVBTE9OQndqbHhZem5BK0x5aXRGVmJWMFc3dTB0MDNVU2ZISkRHZ1Vk?=
 =?utf-8?B?UnVIajF0M2U1LysvMzBTMkN2N1o4bFJFZFJ4SWFmQXZQSWV5YXU0eWFXdDJD?=
 =?utf-8?B?Wms1WUplZ1Y0RlNMUk8vM0NlZHNObS9QeE1LRFJiNEllamUvc2JXVjdwS09Q?=
 =?utf-8?Q?ePYg=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(376014)(36860700013)(1800799024)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 08:31:09.9179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 979be9cc-5b02-408f-8abd-08de21c5d511
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6686

SGkgRG15dHJvLA0KDQo+IE9uIDMxIE9jdCAyMDI1LCBhdCAxNjowMiwgRG15dHJvIFByb2tvcGNo
dWsxIDxkbXl0cm9fcHJva29wY2h1azFAZXBhbS5jb20+IHdyb3RlOg0KPiANCj4gVGhlIGN1cnJl
bnQgaW1wbGVtZW50YXRpb24gb2YgJ2ZyZWVfaW5pdF9tZW1vcnkoKScgZmlsbHMgdGhlIGZyZWVk
ICdfX2luaXQnDQo+IGFuZCAnX19pbml0ZGF0YScgbWVtb3J5IHJlZ2lvbnMgd2l0aCBhIGZhdWx0
aW5nIGluc3RydWN0aW9uIGJlZm9yZSB1bm1hcHBpbmcNCj4gYW5kIHJldHVybmluZyB0aGVtIHRv
IHRoZSBoZWFwLiBIb3dldmVyLCBhZnRlciB1bm1hcHBpbmcsIGFueSBhY2Nlc3MgdG8gdGhpcw0K
PiByZWdpb24gd2lsbCByZXN1bHQgaW4gYSBwYWdlIGZhdWx0LCBtYWtpbmcgdGhlIGluc3RydWN0
aW9uIGZpbGwgcmVkdW5kYW50Lg0KPiANCj4gUmVwbGFjZSB0aGUgaW5zdHJ1Y3Rpb24gZmlsbCB3
aXRoIGEgY2FsbCB0byAnbWVtc2V0KCknLCB6ZXJvaW5nIHRoZSBlbnRpcmUNCj4gcmVnaW9uIGJl
Zm9yZSBpdCBpcyB1bm1hcHBlZCBhbmQgcmV0dXJuZWQgdG8gdGhlIGFsbG9jYXRvci4NCj4gDQo+
IEFkZGl0aW9uYWxseSwgdGhpcyBjaGFuZ2UgcmVzb2x2ZXMgYSB2aW9sYXRpb24gb2YgTUlTUkEg
QzoyMDEyIFJ1bGUgMTEuMw0KPiAoY2FzdCBiZXR3ZWVuIHBvaW50ZXIgdG8gb2JqZWN0IHR5cGUg
YW5kIHBvaW50ZXIgdG8gYSBkaWZmZXJlbnQgb2JqZWN0IHR5cGUpLA0KPiBjYXVzZWQgYnkgcGVy
Zm9ybWluZyBhIGNhc3QgZnJvbSBhICdjaGFyIConIHRvIGEgJ3VpbnQzMl90IConIHBvaW50ZXIg
dG8NCj4gd3JpdGUgaW5zdHJ1Y3Rpb25zIGRpcmVjdGx5IGludG8gbWVtb3J5LCB3aGljaCBpcyBu
b3QgY29tcGxpYW50IHdpdGggTUlTUkENCj4gZ3VpZGVsaW5lcy4NCj4gDQo+IE5vIGZ1bmN0aW9u
YWwgY2hhbmdlcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERteXRybyBQcm9rb3BjaHVrIDxkbXl0
cm9fcHJva29wY2h1azFAZXBhbS5jb20+DQo+IEFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFs
bEBhbWF6b24uY29tPg0KPiAtLS0NCg0KTG9va3MgZ29vZCB0byBtZSwgSeKAmXZlIGFsc28gdGVz
dGVkIG9uIEFybTY0IGFuZCBBcm0zMiBxZW11Lg0KDQpSZXZpZXdlZC1ieTogTHVjYSBGYW5jZWxs
dSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KVGVzdGVkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNh
LmZhbmNlbGx1QGFybS5jb20+DQoNCkNoZWVycywNCkx1Y2ENCg0K

