Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A32AD9150
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:31:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014573.1392700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6N4-0002yo-WF; Fri, 13 Jun 2025 15:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014573.1392700; Fri, 13 Jun 2025 15:31:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6N4-0002xI-Rw; Fri, 13 Jun 2025 15:31:10 +0000
Received: by outflank-mailman (input) for mailman id 1014573;
 Fri, 13 Jun 2025 15:31:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQd4=Y4=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uQ6N3-0002wh-0v
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:31:09 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d257372-486b-11f0-a309-13f23c93f187;
 Fri, 13 Jun 2025 17:31:08 +0200 (CEST)
Received: from DB8PR09CA0013.eurprd09.prod.outlook.com (2603:10a6:10:a0::26)
 by DBBPR08MB10411.eurprd08.prod.outlook.com (2603:10a6:10:536::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Fri, 13 Jun
 2025 15:31:05 +0000
Received: from DB5PEPF00014B91.eurprd02.prod.outlook.com
 (2603:10a6:10:a0:cafe::7f) by DB8PR09CA0013.outlook.office365.com
 (2603:10a6:10:a0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Fri,
 13 Jun 2025 15:31:05 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B91.mail.protection.outlook.com (10.167.8.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Fri, 13 Jun 2025 15:31:04 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 DBBPR08MB5963.eurprd08.prod.outlook.com (2603:10a6:10:205::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.24; Fri, 13 Jun 2025 15:30:33 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8813.024; Fri, 13 Jun 2025
 15:30:33 +0000
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
X-Inumbo-ID: 6d257372-486b-11f0-a309-13f23c93f187
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=X5yrAOypvwstGXzTq4brH42yrX4NL+IRnPKaRuvLlV3SPCodjTQGFKweNHqEXDC9+tMGMN7JvBE5CmKnlvcHIxVjvKja4HFVckZsJlSbp6aFNF5blCRXrBKI28fhQPIpzkOTdXJJg0fzHXQWW056y4+9k+1askIgcKIEZePPiUEZF8xX9KTG+JEQWlOgEJDaaA+3SAPfWewkY49z1/JuIT2cOPkHdMgxixeC4gD4fvFr0B41PZbPQrejDbAJ0IEfvgy1qqNbw03JJ9evfopO4Ws3n/LnKU3XxItCQjZlz6tKXQTABO068CRxAsMY8qHZRBFitx10iT08U4tGCz+n7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMIu5wUeJjbk+Ms45dViBZFyg9ZqYhOnoqv70elwZC8=;
 b=Lj0syba3sKWESx+FhGlGI7OYAb8ZzPrSniBx0RSZIwhd8XrHAai7snAax9GrvrcFEmpzKbLqZTJ/AILhRsvMDk2Wcr/SIvOUnlW1VmMp8646fkWOTMRAJJ9Mpcv/2sz/lVc8mydd15lLufo0dh1tZPY597ayAxHbsremV+OXcqrS9IbqYA2nh13BIhuhxwhEYP1vTh5XKM3OW2VXo2MxLAsFVl5ljCJeXnvnkMrTznXm4A1Tt1I+ffC3dlXTqfz3lOhq0n6jmrwk1Up6gxdNPU4gSf2fwlTo8QwHCL3X1hPz2R3V6pJy7WIAzAQE0Toy/TiSs897/77J9M00i4ftYQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMIu5wUeJjbk+Ms45dViBZFyg9ZqYhOnoqv70elwZC8=;
 b=MJejARUxB1etrro2595jLQLS6C/E6mmQ+Fb+JM2UPMynTJ9i1fWx+Ry2OoUD0693Y/9vy8160wY4G+AO8E5ic2pve+UinlcsTqk8N0WOysvYBcLitXH4dwi/Wg1yQmZAJIVyvVt4W1Lv/sTbCuKlU7gYKVkZXtGcjF1A1tw0llc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHLFM7R1bC6KidbrhaRJsRU3Qlj6dlVP0LiG3ycp0s3c5TccdaHYsKPPaEBJD7rBs1q7gnMlzihxoPSphMKr+xBljfNzygvR3lpuvhGKUbzazpaCdkgq0/DkFti8sZmIvp2HCtFVBT6MINXzplFHIlSBBbCozI8s6yZq9gh/3/lUJD5ZL+9NpYxG2YA/jg8nPTyOplmsTZNUfwMuHiGMt9Bbuhd/2Zk3m6Cw6EKc1ET7vfIj8+tndDpt43YcV/MkU2gsTR+VT4h+318CFyCAqpTA492/Pw7qUuISqSiFzWkdPLMWd/GCUZvRl8vBgnoBczRZnqPsCkriXNdjczebog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMIu5wUeJjbk+Ms45dViBZFyg9ZqYhOnoqv70elwZC8=;
 b=IsUQPOxN4OKj+w32NCSDCAERBIMnx2atZhPSkgy37/2Lu6iifzNVDn2iJH/nm8E14751jVMtQF2iZUHa7Al+jrXsMFn8ViyXBIUMaj7uceyv0lBhDDHYz8p3oGXYxoO0v4yrTUxcgGTObjtECX8oksPicoT3BUCtczHTnL+hS8psnZnZT2QqVgYaNYWhtoWRtSMnHZdGIO7zyV4sH0FwC3Q/qjxOWWI24h/31Fb4OA5eYeCs9aEa7oFfV7dZtSwT74hmY7hYoezYAuAcPvDfVUSIoP35qv6YKfCLq4iViXiEwgKBFK+wB3GdqZNCmZshU3yVbVe9vw9d/wlvZzHjLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMIu5wUeJjbk+Ms45dViBZFyg9ZqYhOnoqv70elwZC8=;
 b=MJejARUxB1etrro2595jLQLS6C/E6mmQ+Fb+JM2UPMynTJ9i1fWx+Ry2OoUD0693Y/9vy8160wY4G+AO8E5ic2pve+UinlcsTqk8N0WOysvYBcLitXH4dwi/Wg1yQmZAJIVyvVt4W1Lv/sTbCuKlU7gYKVkZXtGcjF1A1tw0llc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 1/6] arm/mpu: Introduce MPU memory region map structure
Thread-Topic: [PATCH v3 1/6] arm/mpu: Introduce MPU memory region map
 structure
Thread-Index: AQHb2t5CMbXSS0y8Xk2wSj8YvRec8LQBOlIA
Date: Fri, 13 Jun 2025 15:30:33 +0000
Message-ID: <99FAD22A-F056-40B3-81DF-A571AB6DD935@arm.com>
References: <20250611143544.3453532-1-ayan.kumar.halder@amd.com>
 <20250611143544.3453532-2-ayan.kumar.halder@amd.com>
In-Reply-To: <20250611143544.3453532-2-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|DBBPR08MB5963:EE_|DB5PEPF00014B91:EE_|DBBPR08MB10411:EE_
X-MS-Office365-Filtering-Correlation-Id: 91ee2932-dcb8-4f60-dc2c-08ddaa8f4faf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?WEZJRFdRSmVLNWs3Nk1hdFpDQTVURC9NNFgrTVpZOXdtZDA3MTNHTTBMRFdD?=
 =?utf-8?B?ZS9lQmZvVWM3b0tNVUdUMEg2NDBDQXVrMU9WVVFscldaeUhYR0lUNGxwendu?=
 =?utf-8?B?aUcvRHllb1JDYW90ZnpEMWc0Zjh6YWtjdWEzTHVTQU16aVkrR2hmTDlIR3hX?=
 =?utf-8?B?L0FkY0k5ZjBoT1pWQzk1Sm85end6K0hzcU1hWFRwYXhzaXNvd1cvUjIvd2tI?=
 =?utf-8?B?Znd3ZWlXYW9nUmJWWS80UGVEYXhpZnN6SHpYWTFCS3daVjV3bFBTeXpKV2tM?=
 =?utf-8?B?Q09XWDcwUUI1OUZqVGpibjl4WUJOL24vUjJ3bXJRazFrbDJ3TkdRVUR2eGlN?=
 =?utf-8?B?VlRqYkdWVVd5UjVtY3p2b3FlNWVSQ3Y3aTNMdTcxS0gwNDZMUitNamVrbEoz?=
 =?utf-8?B?Tk1tSmVHUkZXQXhjaEF5TVlyRk9pc2VrYmJCOVpIeVI5VU9DczZvVjhCRThJ?=
 =?utf-8?B?d0QxUFBxM1FHcFpmYStvamhnV0ViaFBxdGtnMXN2OHprZEhDUVJ1bElnTTZv?=
 =?utf-8?B?K3Q0ZlJoZDE3VUhjL0RaL0RzcVJ6R1kyejg0OVFRbU1iL2FmKzUySzFhZWFp?=
 =?utf-8?B?WndXQjJPaTNsZlBUVGN4anFFUHZ1dHhvVmhiVE9HTlBSd1VWSFdyY1NIVE5U?=
 =?utf-8?B?YUlWVG9COUE1aldEbDl5dUtNL29BUXpYaGNoZ1kyNUZ5dkx4K0R4RDBBaEtV?=
 =?utf-8?B?Zlo3ZS9aUGVsOHRIZXFvbERhY0thUzJRTzV0ODR1aW1obGV1eG9aZlBERWtQ?=
 =?utf-8?B?NVp4elF3dW9CdURmNG5LOFdIUk5HL2gyVEFCYndvMVBQNmVmM2RLUS9kNE1u?=
 =?utf-8?B?eEJabE82d0tsVEh1QXB3NEhmWWlmTmhqQVByeDFEaE9nYkF0YkFNVFpWV0NG?=
 =?utf-8?B?WjFnbnEyc1A4dWwvaHdLeERPYm43Y3c1R05SY1FuVkZRNVpRbVlUSm40aFVn?=
 =?utf-8?B?YWRwUkJLcWtlejM5Z3h5TDQ2a1VMdXNRUnFZMnNEQ0M4UFBVK2dTZ1NhYVh6?=
 =?utf-8?B?Ukg0YW92UXNvbXUzVFY4MWF0NTZJYjF3VzI4bEVmcS9lM1Y0cnF3TVREVldh?=
 =?utf-8?B?RlVmblY1cTVOY1BZU0Yza1BOc3hPL1YrUzI2RUsyRWtnQjBZT21lMWMvTmcw?=
 =?utf-8?B?RnNnZ0V0akFNZHZ2ODVVYWR3bGlxL2tKU29neTBIY0Exazg5bWMrMXd5UjIr?=
 =?utf-8?B?WlJjZXczMGdJdnZVR1VjMXM2M1dIQnQzVzZwbllxSXQrMFR4YytWdkc3ZVMw?=
 =?utf-8?B?b2c0c1MyaTJiRjRWWkJZdWJlTEM2aTNqQllUdE9iYysvbHR1d1dmWXJuSVBq?=
 =?utf-8?B?TSttd0RzelQ3MWpScmg5L2NKWVdNbFpkUVh6R0wvZkpvbVQ3d3FlSDVTS0Ft?=
 =?utf-8?B?SjdaTlNicndDaU85M2x1dU1SVnVlQWd0RTEzV1hEaDh4VHBkNkJiV3o1QjRa?=
 =?utf-8?B?Q1k5M2pJdlRVYldLNHRZT3Z5MU9LbmoxZ2gwb012aXA5QmNITnZUOTBVWUNZ?=
 =?utf-8?B?VEszL2htV1ZRNm05NnY2Y1VVaUVjWlhWZG12dXlXWlRrNTREUHA4d3NxNVVl?=
 =?utf-8?B?ak5FSm94cjZiQ0hIZllUNksyYUZJc2puMXNuK0xzcGsxQmZ6Y0pFRGVmbFRH?=
 =?utf-8?B?a1ljWUpBTjRzZ3IyNUNBaVZERXpVMU5DRnlqSVFVd0g1TmpXZDRzYXhiWmhn?=
 =?utf-8?B?a2poWXVBRk40elBHSGYvaHVjaGwzL0ZxT2RVZk9BQlRjZXo1ZDR3Vzk3NEJw?=
 =?utf-8?B?OFJTbmFBaExZek5sYVFnRFFTTDlISmJuMXhwY2tubWtvYU9KYWE1b1E2NVZT?=
 =?utf-8?B?aGRWOGVmYmtvNFpmeUoxMExyNldVbnJhaDlOalZUeCtXV0dJWC9NRkloK3pp?=
 =?utf-8?B?OG4zNWhoNmJ4MUI1b2JOQkVEUitYTWQ2R3AvOG1pWjM5cVg4Mm93MVlGRytL?=
 =?utf-8?B?SGlVNUgvbVpVNWM2c2ZDTi9JWFpkNG05UVJQOGFRN0pOYmhCVFhUWDhJcm1s?=
 =?utf-8?Q?Smum8ocuKJAU6Ed/xBXovjUBhSHv88=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5CA6007ED3FBC54883D04A9790164C39@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5963
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e8a727ce-4668-41fe-c4cd-08ddaa8f3cae
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|14060799003|36860700013|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NnhLMGFJeXFIVVY4R1hoOVFvaHV6dER4a255a2VhTFVndnpYd0N2QlpGc0Zu?=
 =?utf-8?B?TE1WamJHYWxjRGkzOXVKMjNLSlgrQURMeCtaSmM5YU1kUVdJRUNPd1NjT3lF?=
 =?utf-8?B?MFJLYjUrSW91OTlTN2ErYjZNOHpxQ09SOHhQZmlNRGlSUGgyQzJZR011VmMy?=
 =?utf-8?B?MmpPTWVWaWRWak5WczFLMk5NV290ODN1WXFBbksxTTNvdjJjVy81SGVHYUNE?=
 =?utf-8?B?cUJPbnlERkdacGtqMGNQZWk0QTNlbTRuTnZDT0dkV2VkRFFzeEJXR0c4MGJz?=
 =?utf-8?B?S3Y4OHdmRFk2RXZUdmRQbVFLVUsxOUt4bXlPS29SSjVpNHZ6aUd5UE5lVkIr?=
 =?utf-8?B?SDV1Zjg4MHhVTFV5UDN0NitRNDZla3NGZ2tlcDNaUGk4RmxkcGZwTHBnNHcv?=
 =?utf-8?B?U3AvWFZTRXh4NjcvR0gwblZmK2h5RDBWdW11L3FpRVlvakw3QnpPRWZ0ODZ6?=
 =?utf-8?B?cnhEbDV1REd1RHVsSDZTNmxnYno1dm1mY2ZQUWVLamV3ZUJvWXFvaTJlaFY3?=
 =?utf-8?B?UFd6Ulc1N3dsSHp6OFdaaDA3SlBtYldJVXVsUzhJN2FEaWNCOGFaOERPMVpL?=
 =?utf-8?B?MU42ejdJczRFTnZHR2Jja3B3MUJxNmlNU2lJYmtUUWV3bkxUaU84NlNlL3ho?=
 =?utf-8?B?WThNTFpDMlZBUFB5VUxjR3A4UnZSak1wZ3EweFB1NUdVMEQ2dUQ4K1pUTHBm?=
 =?utf-8?B?VEhNOUhBU1p2a1N6bDlrNEFpYkNkUEtIcGZMRTVGbkc4L0ppcG9NK1FKbk9l?=
 =?utf-8?B?SHpqOXg5alVHQ0hSYkRPQXVQSDc2Tjc4WnRJOVN2M0c3ZWxIM3MzZUo1UHF3?=
 =?utf-8?B?eUNCcjF4OGtjQ05kNjVQSm9tbWcvaWI5bEh1WnBRVzZDazJlK0JwK2R5Rm9r?=
 =?utf-8?B?N0ZkSXZnMmlyejI4Vnoxb0REU2NoaEQyWllJVm1QQlJxU3hYa0c2N1BqdFgr?=
 =?utf-8?B?eVhNbVBXVmhLSVBhelVmanpUMnJoUGVDd0ZPNXNzZ2lVUjdTa1Z5MGd6WDVJ?=
 =?utf-8?B?dXlWemFWTkpSQWhtclU4blBxZDYyYlRxZjJYbndIc0ZrL00wcHpRQW9sZVl6?=
 =?utf-8?B?dHNIbUlhaGp1N2V3NUlRTUFYSmE5MFV5ZDNQVEFkeU0wSG9PeEVxVEU3WXUv?=
 =?utf-8?B?RDRyNWVMUW5ITjhsZG1sTGExSjJ0Nkd3WXRUZ2FiT055cm5jNGU4RXFVME1r?=
 =?utf-8?B?UGVhVFpNckdJVkVtelpEOEFJUGRCdXRxS2JMT1VoZS94eDFyNUIrR2hZMnFB?=
 =?utf-8?B?b1JSTUJxZ1g0cmk2RmExdjMwTjh0OTNHazlBNE1BQTZxOC91bDJoWjRHMUE1?=
 =?utf-8?B?ZlZKbVJzeDNxUW5yVmczSXp3MHRIWFFlZW4xekZVK0NSVy84eEJuU2I0L3c3?=
 =?utf-8?B?QXZMSWt6bUZsaXVYcUc3WERONWduZXZ4bldSNVlUNFZKNjBhbXJxbVQxVCtJ?=
 =?utf-8?B?RXFOM2F6RFRVYjJJVnc1WGkvL2JERlMzTFJPL0VtNERULzVIeTJrN211cHQx?=
 =?utf-8?B?a3RFUVZMcW9vNlpvR3ZQQ3pQdHlRSTQvYlltVlYrZlBvNTJ4aHU3TmRMa2Jj?=
 =?utf-8?B?WGxzS1NOU2pXNzJ3KzFTQU5YYWVYcGVhVkVycXYxU0lmRUYydnBiWXhPdjJP?=
 =?utf-8?B?bmJOeGh0TjlpVlBOZUN1TGtCL2FNRHd0QTRrNzgvWnZsTFhVSGxBOFozZVBk?=
 =?utf-8?B?TldYdFAwWndXTStNcVU0TStqajBsb1JCWDFFemdXUHdER0JYcXF0VWxpZ01n?=
 =?utf-8?B?bE5TZUo1bHhVNkNQZlFlcm93MWsxWnVISTRITVVMODhlRlhPOVg2TEY4TkNN?=
 =?utf-8?B?cUF0Um9wYmFXRDR3cW1SL1B1ME91aVFRRnM5d043UE5ubUhibmRudEIwYkZW?=
 =?utf-8?B?aDRmd0VtMk0rejhoV0h2NXRnT1JJRGdPVHpHZTZXeGpuOEp5OUhiT2JHcGZ2?=
 =?utf-8?B?V3JWbElId2txc1ExeVozbXZZcjltTllvaEl6NGJHRzVJV0k0VWlDMUpXVlFl?=
 =?utf-8?B?YjJycDMydS9xdmFzSlg3RVgva1E4TGE0cnZKcGVRdmJOZGE5TVc2ZFNBWW8x?=
 =?utf-8?Q?rfH2sD?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(14060799003)(36860700013)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 15:31:04.9353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ee2932-dcb8-4f60-dc2c-08ddaa8f4faf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10411

SGkgQXlhbiwNCg0KPiBPbiAxMSBKdW4gMjAyNSwgYXQgMTU6MzUsIEF5YW4gS3VtYXIgSGFsZGVy
IDxheWFuLmt1bWFyLmhhbGRlckBhbWQuY29tPiB3cm90ZToNCj4gDQo+IEludHJvZHVjZSBwcl90
IHR5cGVkZWYgd2hpY2ggaXMgYSBzdHJ1Y3R1cmUgaGF2aW5nIHRoZSBwcmJhciBhbmQgcHJsYXIg
bWVtYmVycywNCj4gZWFjaCBiZWluZyBzdHJ1Y3R1cmVkIGFzIHRoZSByZWdpc3RlcnMgb2YgdGhl
IEFBcmNoMzIgQXJtdjgtUiBhcmNoaXRlY3R1cmUuDQo+IA0KPiBBbHNvLCBkZWZpbmUgTVBVX1JF
R0lPTl9SRVMwIHRvIDAgYXMgdGhlcmUgYXJlIG5vIHJlc2VydmVkIDAgYml0cyBiZXlvbmQgdGhl
DQo+IEJBU0Ugb3IgTElNSVQgYml0ZmllbGRzIGluIHByYmFyIG9yIHBybGFyIHJlc3BlY3RpdmVs
eS4NCj4gDQo+IEluIHByX29mX2FkZHIoKSwgZW5jbG9zZSBwcmJhciBhbmQgcHJsYXIgYXJtNjQg
c3BlY2lmaWMgYml0ZmllbGRzIHdpdGgNCj4gYXBwcm9wcmlhdGUgbWFjcm9zLiBTbywgdGhhdCB0
aGlzIGZ1bmN0aW9uIGNhbiBiZSBsYXRlciByZXVzZWQgZm9yIGFybTMyIGFzDQo+IHdlbGwuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBBeWFuIEt1bWFyIEhhbGRlciA8YXlhbi5rdW1hci5oYWxkZXJA
YW1kLmNvbT4NCg0KTEdUTSEgSeKAmXZlIGFsc28gYnVpbHQgZm9yIEFybTMyIGFuZCBBcm02NC4N
Cg0KUmV2aWV3ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCg0K

