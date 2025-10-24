Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA552C07056
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 17:42:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150588.1481700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCJva-0006wr-4w; Fri, 24 Oct 2025 15:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150588.1481700; Fri, 24 Oct 2025 15:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCJva-0006un-13; Fri, 24 Oct 2025 15:42:06 +0000
Received: by outflank-mailman (input) for mailman id 1150588;
 Fri, 24 Oct 2025 15:42:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=btSP=5B=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1vCJvY-0006uh-8j
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 15:42:04 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa17ef03-b0ef-11f0-980a-7dc792cee155;
 Fri, 24 Oct 2025 17:41:59 +0200 (CEST)
Received: from DB3PR06CA0029.eurprd06.prod.outlook.com (2603:10a6:8:1::42) by
 DU0PR08MB9417.eurprd08.prod.outlook.com (2603:10a6:10:420::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.13; Fri, 24 Oct 2025 15:41:55 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:8:1:cafe::1e) by DB3PR06CA0029.outlook.office365.com
 (2603:10a6:8:1::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Fri,
 24 Oct 2025 15:41:55 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Fri, 24 Oct 2025 15:41:55 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DU0PR08MB8041.eurprd08.prod.outlook.com (2603:10a6:10:3e5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 15:41:22 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc%5]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:41:21 +0000
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
X-Inumbo-ID: fa17ef03-b0ef-11f0-980a-7dc792cee155
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fMcNOTX5vGq+WwjGSdIFCUQ71vVvhgmDlefYyrv0dUsBTm/VuOSwRTiXWMcqIS3rqP+1YD+5QHReNQxkkv1DW5AVMZK85e6zAiX+lU7jG4zdGh5stQaKyAyYC5nzFNOiOzm7DV1vpUXEcJCXCp4vW3zZ4WZ58CRhzAIJlPn62ooI7cgXpW/MP5KyFK3qzuc5IaK58F52bJ7coKswMTsJdDuDBM35fBcXVBzhYJYKYvMCaVWTxWzHWzB3+qqEtlBD7sz2/eNqJryiBoKwbMiz8uT4rnZyGeb3LP/+cACiHdupoH81tdBHQQ8iEvV0rBvVdMxq3BShdo5tE+qS0rvjWA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBBqelmR6bkOUaL51ofDaDC3tEoXtyZOGD7eXlEuaBw=;
 b=DvBLjt6qjiHyX7wYqv2z16b6hoRBWa5bJ2Q9K59ST355yzGM9KYVd/nQDOtlWNS6BWFSbaXtFRKEbIt6PFuvg+4g0Qr50ryyRFyNzV98N0nMgJoGj9oRQE34XAPt7JBxddesx6ZsE4vzYjzHQAPoeDb/vFjDzU4g/m7xYvTOC7dNkNMGf6aLai9SFve1u7gL4XUQB5LnFogqnbLMkMK3EyK5wkpnbr0Bd9Y1bdBSp1v7ASxy024hdGUqTX/s7EsTJFrCnESfWxw2GKFxlG2DhgglADSY3Ly1rfUA/L9Kpv9uxIP0XcDgmWr25Zxyc8TbOJFZcc7kWWGqUBQ/zyisRw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBBqelmR6bkOUaL51ofDaDC3tEoXtyZOGD7eXlEuaBw=;
 b=Q4lSzmiPdmdTAUPWLF1GNGJJma1RG0HBAcXk42Z+mEzfF5oXO06NVx3XLsk8w6C0efwv+6bpdJr5LA1GhHjTToVFY6LZlPQ3OCBIkedR8fi5qOQx6WFCE21sdy/voZwZTwsfhYrrji1QkAOCH+sx88XXvxxL4G1ZVWrcyVXVO2U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y6xghRwnyxl1iXlOgyCKM0m2bOXkWErSms/7G/6WPTb3v2acHBxlUfQSViGFJ2qVxwU+nOG5fdQvNWZmkbFsVV1tTWyD19k4XQbL7cHPjC+bndLib8J3fhSNNLwl8VPDZN6tg882Q+9HVrDeaZXXflqsRs1wOeVJNA+xn+DeU9MswSmSzxDQObxX93cqfmdmm5lZdJD/DZgv0ZBDgS8ng2V9j8k6+I7J6GnSq42X5lOPdYSM1L4bQAPAG5YGjvYsQBa+7Unsstyw1ggRxTinnFW4M0OC/ouUqgM/iFDF6s9l/X5rB4uFkq39KujfUvYS6STA88z7/udBqtuFzlf9zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBBqelmR6bkOUaL51ofDaDC3tEoXtyZOGD7eXlEuaBw=;
 b=uFEpePaP/O0FrlKm9Fvd2ourYNnL0mj6gA613Oja3xbuStGIS8Ql84PwfCj5hEfZBHZvzOazhMcGz+UgYxN6WsTo/kNBRQYyhoMPl8E8e5acPLHUUOxo2hRMnHsyixp0zv1mh2O267hOvC0wH3CV89gXB1K0v4hnIBB0zfQ7C8/mObdld30DtTRP7mKpnDC2wckI76rUjAeumWFQZ9ZoAmAUnoTSzgGy5o8tB7x/2TxeqZfEta4iAT2FPYLi5Dx00D5ge+5Kh4jBjbm80eXBExI+0MTIcRIQwfssB5v+RrCx39b5EiM+frOBgRjP+oB/VNtmSbXGQzb7pdsJfLVBuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBBqelmR6bkOUaL51ofDaDC3tEoXtyZOGD7eXlEuaBw=;
 b=Q4lSzmiPdmdTAUPWLF1GNGJJma1RG0HBAcXk42Z+mEzfF5oXO06NVx3XLsk8w6C0efwv+6bpdJr5LA1GhHjTToVFY6LZlPQ3OCBIkedR8fi5qOQx6WFCE21sdy/voZwZTwsfhYrrji1QkAOCH+sx88XXvxxL4G1ZVWrcyVXVO2U=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Harry Ramsey <Harry.Ramsey@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Harry
 Ramsey <yourmail@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/3] arm: Implement setup_mm for MPU systems
Thread-Topic: [PATCH 1/3] arm: Implement setup_mm for MPU systems
Thread-Index: AQHcRPwjhXV/u7H6OkO1vDTcVnOBzLTRby6A
Date: Fri, 24 Oct 2025 15:41:21 +0000
Message-ID: <A3747BFE-3210-491B-A745-8AA9CCD79C8C@arm.com>
References: <20251024153719.408806-1-harry.ramsey@arm.com>
 <20251024153719.408806-2-harry.ramsey@arm.com>
In-Reply-To: <20251024153719.408806-2-harry.ramsey@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DU0PR08MB8041:EE_|DU6PEPF0000B61C:EE_|DU0PR08MB9417:EE_
X-MS-Office365-Filtering-Correlation-Id: cb3d3d91-6724-41a2-c84a-08de1313dc27
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?QW5qWmg1OFVSVVZuSHpiVHhKN0VaMHF4YmMzNmlWQklVMHVVazVxYllUTDY1?=
 =?utf-8?B?ZGxMbVB1ZXViVndsSlJxQXhneDU1TytyVkVOQ2Y4djZyMG1VdEt4QmJUclpR?=
 =?utf-8?B?Rndnbmo1VVJjSkRCenhLWnp3Y0dwYlZYNUtuTFZPRzV6dkhVWFV4YmlQNmV5?=
 =?utf-8?B?cVAxQlV3VUJuUWNKTnhwU3BVRVJPSzM2SUFTZHNDdnYyekxyQW9UYkZQU3ZW?=
 =?utf-8?B?Q0dMN3VwcjRxcXpBSDBaV3B4WkVRWlU1SXpnaUtJdDJCU09HRjEzaHFrckVa?=
 =?utf-8?B?SGZUa2hScFNFcHZnZWhvM0JIM3BKWHE3Q0ZteXVPUitPelFmUGg1Q24yL2Ny?=
 =?utf-8?B?am9yREsrVHlRMGNTdjFva21uRnZFdUhGVHB6bWIvZ1h0NFV0VXRrMG91VlVB?=
 =?utf-8?B?Yi9VNUk1Yzd0ZjJkb0N4RzJSTnNXT1dtZFlqUXlCbFRGMmR0dlYyQnVSVWFD?=
 =?utf-8?B?QVJaQkNDa01zVXo2WERqL3k3NHlUR01jZTVvTFZ2a0wvYnk2ZmxsMUVnRjhB?=
 =?utf-8?B?Uk03Z01DRnNGL0xrNXNvR2E3Vmh3bXhWMjdlM1ZNd0JRdEdjL3dneUx5dldP?=
 =?utf-8?B?bmR0WkZDTkZ5N3VMVDhWUEZCaE5GM2JBdjYxRW9wMUZwd1RyeGljR3o1T0Mz?=
 =?utf-8?B?U3BvT041ekpINnFxMTJNK2c2NzdFcndiNTUvWTBNQmlON21YaTc2TnRaeDho?=
 =?utf-8?B?cU5pMXkwYUZpM2dRSlpjSTluN2ZLWkpXbUFpRXNzRWR6TEEzeURRdEM4Z3d5?=
 =?utf-8?B?SXNFTkJ5YktmMWNkS3Y4NWdkOGFZOTRMOEwxajlrcEZreDljcG5STlpKZzFV?=
 =?utf-8?B?R0gxTldZbFlXOHVBRUJmTUp6MGxRaEZ2TUJxKzl2blVnQmdiSnZPdFdpZnpz?=
 =?utf-8?B?TDZhRTdyV1dQaGU1Y3lhZkZFWFRhVTFVODhvbkpjeVY1K1ZaNEpsWnRNcEZ4?=
 =?utf-8?B?cVFRZkJzd2tPWkVGTkhrTzU3aTljSjhEbk02OWJUMCs3d2V2ZkUzaitiWDA3?=
 =?utf-8?B?dWxWcEo0ZEQ4Q2dtSHVScWtRRW54T1ZVTDB2OHBFL3d1T1huQnhLQzFmS3oy?=
 =?utf-8?B?MFFaUWxTay9BUmU2RzhDNWFGYk12SzlRWWNTZ1Y3M3FSeWpCdTZnODJSYXZt?=
 =?utf-8?B?RW1LbFovNUo3TVNna0hHL2E4YnUvNTdicS9yM0VsQzV5UXk4cUgwRW93S1lG?=
 =?utf-8?B?WGRDMnNaT3lxQVlianNCMVFLWVcraGdnK1c1cFdsbGR1OVk0TU1OQU8xRS9B?=
 =?utf-8?B?eXZMOTNobnVsUlRycngwVnNLMnlMcVJzQTJMNzhaSGZlRXhEekpBbTdwcnRI?=
 =?utf-8?B?dG9JcDRqVHRCM2dHd1N5K2FWbGVFd3k0TzVaQVI3anV6VnBnaklLeGF6cE1w?=
 =?utf-8?B?NmtmWHNvUDRjWHFJWFBjV2NWdjRVU2hidktjU2l0SXRTWGQrSnRraWYrOHhI?=
 =?utf-8?B?VXZLMDdZWWFTeVh4SXdoT1NqazI0bFFpVGN2cE0wMXVHT1FoTWI5YVY0THdQ?=
 =?utf-8?B?Nitkdy93TERNY1NDU2hEZUZrMTNpSnpGNUd3RC8rOS9CZjdpOWtHanBqbFpj?=
 =?utf-8?B?amxWVkNPTzJIVlpORkVCQlo3b2tRM3M1U0hJRHhucnZFUlVvYVVTY0xCV1Q0?=
 =?utf-8?B?Y0dEMHpmSGNKZ3liekRHcUFwUkZTWEpac2o0U016emJNVlVqUFNDNXVPQWtQ?=
 =?utf-8?B?UHdVdGRvZHBETGI5Y2VkcnFTMDlWSkNoc3E1TzJrK25pVGMwa2FZcWZBRXJr?=
 =?utf-8?B?R1dZMS9kdlRCZzJldXh2dDFhb3RiUFBpbmRjMFh5eUpERUZjZ1VpdUFvRDVE?=
 =?utf-8?B?RXR6bU8xKzVPZXBjeGdNL1NCL0kwZ0hnVFFuZkY0a245Y3lOcm04WEs1Rk1F?=
 =?utf-8?B?TVkxYXVxMXVsVmM2b1kvK0FVTzFPRDdiMGMwM0FqNkJYWmdVbzFNbDVzcEVS?=
 =?utf-8?B?N3g4dmFwQktwVGh2SkJ0eHM2Z1ZhSzZqVDVKL3dnVDJYdGFWSFZzWkc2UG5N?=
 =?utf-8?B?TTlHTU9jNkNNeEZkREc0WWE5dGkranliS282WG1OWXM1VHlWZjl1NEE1NFBl?=
 =?utf-8?Q?bEykhz?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AA948D37F500284C8C9420884B44DDD8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8041
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c12b509b-ed45-4476-7bd2-08de1313c826
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|35042699022|1800799024|14060799003|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmNrOFAyZlNSSWlyMWQvVHZrWmZNUjBvdjJqQmQ5aG5IYzRmamVYZkZobUlT?=
 =?utf-8?B?Ykw1YUVsbzE3NUZMSGlrSXRoM1BIK25sY1VSL3lnejFUcXI1MGZGSG1YMklo?=
 =?utf-8?B?WWlYTDV1SGxRb3dFdW9sM05FTFkzY3ZwM2w0Y0c3Y1pVS0JMTDljZ2J2cmda?=
 =?utf-8?B?ajdNWWlSOCs4QkR5cjFjcW9CQUUyZVJhc0FUSDlpbVM5QVhUcWtidjdtSThJ?=
 =?utf-8?B?MlVjdjMrTVRlbzJ2WkIxRXRqc213alNVSUd3Nmk0YzFxV053elZYS3pvMGpB?=
 =?utf-8?B?eHJkeDlxZnVNdGVKa2VzV3dvZ1dZbk5ZamZURm5JSXFMV28xaVl3dk5BT2Rr?=
 =?utf-8?B?YzNxd3pBa3VJMlBSd2wvRS9WcDFBa1dPWmJvR2hXUTZGYXIyL0JIZ0hsSnNt?=
 =?utf-8?B?OFRLQU9aVDNsSFFUTkhyS1JoTGJJRGtSS3czTkI0NExQVkxRa1lES0h4WTZv?=
 =?utf-8?B?VUIwdC9SRk1mZ05YQWh6SWxDdWdvdUVqN05WQW9sRk1yL256N2hqZTlDY2Vx?=
 =?utf-8?B?Ni9pcXB4dnJQNWViN2pzMWlhUnJOYkZOMUlyYXNQbDZhUTFvZHdEQ21OYTRs?=
 =?utf-8?B?cnBnZjY0VWExYUZDUjcvQWpEOXA0K21QbGEzVkdSemZBWC9WdEVTb0dody9B?=
 =?utf-8?B?RTVvT0tWVW1hRVZzOTYzNjUyaFlmV05FWDMzVzFkSXhjQlk4czZVRmpFUFBy?=
 =?utf-8?B?ZkZOa0ZWTERjVGhRWEtRQVZGaTJIbmZsbG54R2hkZS9mNWtsdGF4SktrOXZa?=
 =?utf-8?B?QXI2aVJmZkwzL1JneFJSS1hJQ1Rua0F3ajduYTNWbXNjZDhJOUU3M0ZGalJl?=
 =?utf-8?B?TnZwVUM5S1VHWWRjYWRkUVBYWmlTZTIreXZuOFZLWERtWFRFTk1hR1RnUzRz?=
 =?utf-8?B?eVJTNVhjaXlFY3FhODFnSlhxRndSTHRSUk4wQ2s2aFlON2kzdlNxeGZXdDdG?=
 =?utf-8?B?TVAzYzYyTGZrQTlxREEwR1Y0bDZCaFJFeEEzaTlScS9nR01zUWphMG95TWIx?=
 =?utf-8?B?OENuZDdpVlhRNm8vbUVDVjUyazQ4RzRyazVzc3BTd0ZhaEhaUGl5RUtJbVNH?=
 =?utf-8?B?b0hLNVc5YXo5SHpHZ051cHFwcTllelhHNnNodUJMSkVRY3ZzbFp5anluMXQv?=
 =?utf-8?B?em5IZTU5ZlpRaW82WDhIMG0rek9GeDgrUXNod2ZzZkZmRUlHVWI5Z0lreTdC?=
 =?utf-8?B?TTJ1d3czRVlYcXhtVWNEZlNPL0R5cGl1aUdqOVJwVGxndlFPTzg3NTJoaFMv?=
 =?utf-8?B?WEdBMTZ3VEd5em1DckF2VWtCSC9CSmxUaVc3STVIWDZrck9GODVKaHZOZWFC?=
 =?utf-8?B?Y3VKK1NHRDVEcVYwVXhCS3hFdVE4dTlHeGk5MEROUEtCdDNjZmdDd1o5NlMw?=
 =?utf-8?B?eW0vRmQvTHVvWWRBUVpFbmxzaEtNMW5yZTJVV0NsMjYvMDRoRzJVdkxxZUJN?=
 =?utf-8?B?U0dXeFd5cnNQTGVzR3ViYnZlNUhIcklZVEJmUGJaTGdBTVVrVmg0R01vOVRN?=
 =?utf-8?B?WXlpa2x1YzZiSSszRHlrTWRiK2Y4bUd5M3ZNSTRhdC8xeG1RT2Zsdml2YVU1?=
 =?utf-8?B?Ti9lbDJFaU51K1JRRnYzUTA0U0h3SzNnNmhtbDdscGhyZzFRVEphMTliS3Yy?=
 =?utf-8?B?Z1RDbThNMmw1d1gydmlhNFBmUkdGYmtEVjNxQnNBc0VtbXJTd3pRbkxQWkVZ?=
 =?utf-8?B?T094MFZWTTJlMW1Wb2xuMDBmcGd4NkRPRlFqSDlGU3luanFFYi8rcGJKVUhL?=
 =?utf-8?B?SmxDYVNDK2pDbzFBcFRKTFNsR3dLLzZIWkkvbHV2aUpsYlphSHZSTGgwWGo3?=
 =?utf-8?B?cDVKNHpoU2VOTUwrOWo4eVc3Yk1UR3hUWGE3ZFNhQXVCeDFJcnJUVTJtdHM4?=
 =?utf-8?B?MEpTWTlFbGVMZlpOWDRKTmptMTM5emtGUkpqYmswcC96aXlWdVVCUW04aDNu?=
 =?utf-8?B?TWhYbUdjeC9XTzk1SXBuY0NqaGcyWnZoRWlRV3pteGNobXJOdUM5TnpTOVFO?=
 =?utf-8?B?Tjg2M1VoTnpuT09SV0daOEhlbTc4dHFNVmkyV0ZKSUZNZy9HZ3Z3K25yd0lG?=
 =?utf-8?B?Nm1FR2c1eDVqQ2MrS1hjaWM2ZkJKbXdIMEdTUGF2SXVWYTI0bk1KRDFka1Rh?=
 =?utf-8?Q?lWfk=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(35042699022)(1800799024)(14060799003)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:41:55.1049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb3d3d91-6724-41a2-c84a-08de1313dc27
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9417

SGkgSGFycnksDQoNCj4gT24gMjQgT2N0IDIwMjUsIGF0IDE2OjM3LCBIYXJyeSBSYW1zZXkgPEhh
cnJ5LlJhbXNleUBhcm0uY29tPiB3cm90ZToNCj4gDQo+IEZyb206IEhhcnJ5IFJhbXNleSA8eW91
ciBtYWlsQGFybS5jb20+DQoNCndlIHdpbGwgZml4IHRoZSBhdXRob3JzaGlwIGluIHYyLCBmb3Ig
bm93IGxldOKAmXMgbGVhdmUgdGhpcyBzZXJpZSB0byBjb2xsZWN0IHRoZSBjb21tZW50cyBmcm9t
DQp0aGUgbWFpbGluZyBsaXN0Lg0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

