Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E66A5C9E28C
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 09:11:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176433.1500915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQhwk-0002cB-41; Wed, 03 Dec 2025 08:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176433.1500915; Wed, 03 Dec 2025 08:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQhwk-0002ZO-06; Wed, 03 Dec 2025 08:10:46 +0000
Received: by outflank-mailman (input) for mailman id 1176433;
 Wed, 03 Dec 2025 08:10:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PcFb=6J=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vQhwi-0002ZI-6J
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 08:10:44 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8de3219c-d01f-11f0-9d1a-b5c5bf9af7f9;
 Wed, 03 Dec 2025 09:10:40 +0100 (CET)
Received: from DU7P251CA0001.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::14)
 by VI0PR08MB10582.eurprd08.prod.outlook.com (2603:10a6:800:20f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 08:10:36 +0000
Received: from DU6PEPF0000B621.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::5) by DU7P251CA0001.outlook.office365.com
 (2603:10a6:10:551::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Wed,
 3 Dec 2025 08:10:36 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B621.mail.protection.outlook.com (10.167.8.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Wed, 3 Dec 2025 08:10:34 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DBBPR08MB10435.eurprd08.prod.outlook.com (2603:10a6:10:52a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 08:09:29 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::b27c:9593:1074:949d]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::b27c:9593:1074:949d%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 08:09:29 +0000
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
X-Inumbo-ID: 8de3219c-d01f-11f0-9d1a-b5c5bf9af7f9
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rUB8i9KE0VWVtqkPSEzjte4/scWoXUaFzlAK1qkACVU5ZGUxGL8K+V8TP1OfG1cQJvtTF+6QuFs0e6HeSmyf/9nMMEEvE1eqYsGjaBhEMqTuHF0KQW30nY/VHhN14G3zo2/QXQ97nuqpNUqnlsqkoxdMMkCZchFYKb5cUyctR/X3Cy7/dvwT4HM09hdi7Wc8pK2pS45mgiZ94/YSon6Bs3fQf+iZxlwxcBGK3QlMD4YHMgiOs5Xb+yrMS15qoaAIuDKHxqDthxLeJ1FiH0uj63ZiErKxkQX95THwveQtZPteGV/WYbuROD9vJlmxuxqGQhyZ1+7vQ88TjafTnulLVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d78r7dK2BNhBZRSpuf6193+G9CJ2z0umvXCKFdMSYRg=;
 b=LsFNnE02TWv7OUDbgT5Avh/lZWjFwRJJdzJlQV7V8mqMH3kq1sKLZ/FSC9+ljsQ0Ze7YvwytwomBbxTtxJs7pKkL7fjVmUphKjenP1jiM7UTJ4cGZIhVz9SXXr7P2MR99asRbTG7W1TBdLN04fIk5rf15fDQUN7NTUmm+YaV59XpUGFiFjJaGzfqJhOxAgVfocwTCx+N1dXv0xyU1qnS0DKEYz/sNKPKVM5z7PhQBySFDynssQ1cc/2Fmq3De57g0lqDPBEyjqd2554ri6GDjN0NFZHjJHoKnFnye66571Y0P/ryONrnQU9K9uk31rI5zAcLoxf7feSzxE6L/ib+oQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d78r7dK2BNhBZRSpuf6193+G9CJ2z0umvXCKFdMSYRg=;
 b=heGoevEXCuJhOBgZPAP4CDuNU5tw4Vx/pE1vS0vkdoXAup2zwQ6fYKaaDv4Al59A5wBbLt9glLldYW7swtFW+lr0MyQut0gfes4aRlV2OO9pe53MOBcMg+NgJEsFJ7FISor8ka9snxtSIf8byXyLH3yNfL0iciI3uVqwlt0yaXs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3QJcPRSjPse0p+Cly8nj+SpXbzTUpFqMuEqvu7GbjX/N32QK+lhUFmqwupnrdyXrcgDjxU+EqYR8t+T0/BgI3t1/yqeCuqJMm28O6ot+7gOWUXUDh7NDZCovw1Yk8mHpRzgNfvAZ1eiXiJdr+i+dBQSitIduoI5FgbAC98+ZM+ulkxNZtFzs9E3seQYKxTnvfGYkuQo+9MKMfm6ljehcRJ//8YNtvKdjFQev7c6PmWCVWLPzkuQKUN3NSl3KUY7zWDRt/6Vgu23Zqd0l56YqgQm6lRlac3fRZmiBOCwha5svlmwhRryMDLHsjbTRS4kEe51IdnLgbFDwNG4yFCoug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d78r7dK2BNhBZRSpuf6193+G9CJ2z0umvXCKFdMSYRg=;
 b=uB9WbJ4KY45skRRbMLrM0vbU5UIYGsTbY+k5OenjfUbW/mUKGSweR8a0NzbxDyFt+QucrfAopRPc9h2T3khGPnFAdfr7ZSIAyLdghm0HUvtFdMGpzZCTmSkt15SWT+Aa0SmnHBHgXJ6pc7qXaYUtzKNwWVTK1hzN5W+v4zdbA06vRaQrwt0sQqmfiQpCLIMYnXxjqy8Kt7TFau7kNyDXauhkI8Qs1V6aONtIaam8a+66zqzQSnJUUfQHtOgmt9dV0VrVWmsn+LjP+fibnxljPb/jwbODyx5cgkK7o2cxiqfG69aGoWLYj/hAn5JuTF1XBEQ/6PwFzt25Pwb/S7F5xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d78r7dK2BNhBZRSpuf6193+G9CJ2z0umvXCKFdMSYRg=;
 b=heGoevEXCuJhOBgZPAP4CDuNU5tw4Vx/pE1vS0vkdoXAup2zwQ6fYKaaDv4Al59A5wBbLt9glLldYW7swtFW+lr0MyQut0gfes4aRlV2OO9pe53MOBcMg+NgJEsFJ7FISor8ka9snxtSIf8byXyLH3yNfL0iciI3uVqwlt0yaXs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Mykola Kvach <xakep.amatop@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: irq: Use appropriate priority for SGIs in
 setup_irq()
Thread-Topic: [PATCH] xen/arm: irq: Use appropriate priority for SGIs in
 setup_irq()
Thread-Index: AQHcHH4xsTo+MqBrSUGlzawFWy7VyrSQKKUAgAWFLACAeYuAgIAA5fEA
Date: Wed, 3 Dec 2025 08:09:29 +0000
Message-ID: <8133A491-4245-4376-A00C-D6D98C10A2AC@arm.com>
References:
 <f7475c0083bf4995f2ec4afa3aaf44b9676fd1ab.1756867760.git.mykola_kvach@epam.com>
 <0d0f4689-97e2-408f-91e4-dd59f47bdb95@xen.org>
 <CAGeoDV9zgfyHaHb5W6+T4F9Hjxv_R5wnGkcbwcN2xgRUhY+v2w@mail.gmail.com>
 <b3e97c6a-b93b-424f-a10e-1d3c93afbe35@xen.org>
In-Reply-To: <b3e97c6a-b93b-424f-a10e-1d3c93afbe35@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.200.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DBBPR08MB10435:EE_|DU6PEPF0000B621:EE_|VI0PR08MB10582:EE_
X-MS-Office365-Filtering-Correlation-Id: 97b4e6ed-390a-4795-1570-08de32436f8a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Sm9TRGUxSmxHQ0pHWlB0dzBGbUlkL0xhd1l4QlQ2VFpOVTE4VEx3am02OXJr?=
 =?utf-8?B?VFdNdjlCM3JqK3RScHZZMFh5N2hHbTVENUdHQU1ZOXUxN21HV0hsMU5Va0xT?=
 =?utf-8?B?UjIrc2NiSm1aOE43Qjgra2pTcTJYSS81dFBXSkgxUkNCS0ZGNTN1QUlJUUdU?=
 =?utf-8?B?T25xMCszVmVlb2pUOEE4RFFUZ3NydDFkMGR1LzU4TElrRHpBNkE4VEg5QVlx?=
 =?utf-8?B?Z1J6WTNIR1R0VW5vbzE4YXRLZU1uRDNPcEdsT3hGeHIvcHNQNkd3RlVjN1Iy?=
 =?utf-8?B?a1RFdWtxWUhRdUtNSkpQUVRPeXRaODArazBlN2lSSmxkT29GUy9wb1JESW5C?=
 =?utf-8?B?ZlZ6b1BUbnI2Nm83SjEzZVAzTzRGN0QxQTlqdzQzeExpaVY4ZXozaXJFdFpl?=
 =?utf-8?B?cVUyS1F1WmMxbDIwY3ptM2hoM2JMU1VIWFZSV0VYaUFLUjBUTC9nY0d5T1ZY?=
 =?utf-8?B?OGNQcEdyTVkrNXNic3Y1NzFFOE1wbkR0ak9tV3hzRm44NkxxaktDYWIxT29y?=
 =?utf-8?B?UUV0OEVMM3lGRmNHWFcrVG91Y0tZT2svWlVhWURHNzRSVDNRNlhNN2VGVjFE?=
 =?utf-8?B?WlhuY1J1WE5BcVlNd25LQjFLak1ocDdPVFVhSmFUM3lBMzFtSEVBSEVxckVq?=
 =?utf-8?B?bFRNQXBGRjVOYzVRWDVDRTBiNjJjVDhqMkVSL3U0dnROZlNBVXhITzNzYThY?=
 =?utf-8?B?bHJ5ODI1amhjNlk2cUIyQ24ybEpHQ2U2VGxQK21vc1dsWTl4ZUtIOWExUGQ3?=
 =?utf-8?B?aFZXNHhiWFVqZjVxTEhJY0Q5TTJ3bHZUMGhRd0c5dW1WU0tYTDVyb21LM0NS?=
 =?utf-8?B?VFNPRW5TQWpJWlVmczB0NSsxVXhhUFlhVy9xalFMLzcxbngvZiswRWw1ekdw?=
 =?utf-8?B?VVNwbDhHSlBnbDM2VzNxM28zZXg1ekhJTGNKSmFxeDNaa0FPSEZMMDNKWG9o?=
 =?utf-8?B?RkMrRnpjbUNjR0RQNmVUbDJUd0lUa0FTMm1LZlQ3UjFOZXpZUERyZVN4aXF6?=
 =?utf-8?B?bWdnQ3VlQkltY0h0emZRQ0tOZTJSc2tmZnl4WVRSbjRFNlE0RmRLc2prSldU?=
 =?utf-8?B?VVZvWklLNXd4TnJjNzI4UDZ0WGZwK2JZaTNQVjhaOXBDcHc0bFc0Z0xJVlhS?=
 =?utf-8?B?N3ovOElaL2M4RlU5WnZpRXZIU3FRb003OUJEYk5VUGNPRmUyNEFLenJwY0c3?=
 =?utf-8?B?eU16ZGJuQ2Q4MGVxRGYyMHFBMFhHbnJhSngyQ05ySzNsVFM3WUtNTy9nb1Y4?=
 =?utf-8?B?Zm5keWRqYjhWVE0yNGhQc1VGYkJyY0g0RkdEREd4MHk2YXV0elNNMzNuSUZJ?=
 =?utf-8?B?V0dvbVArSjNOQmV6OFpYZUhqQUY0Z2FYanhEd3Q4ZzdqbjJxOXV1Mjd1WjRZ?=
 =?utf-8?B?NWhoSmlISHM1SlZNY0V0c0NYT3pCREdOQ01HZmxOQ3M4bXpJTTNDcVhaa0dI?=
 =?utf-8?B?a1R4R1IrbHVnL0lxdmh5NGIrZ3FHa3BWWXpxcjFEZ0VRcFlLRXh2WDB2MW93?=
 =?utf-8?B?Z0ZoeURFSjk2Zm9ZamwyZ1l3VXBWdWpVU1ZlcWVJRkJOaUVYRGZTZ2ZsMnho?=
 =?utf-8?B?dHVTU3h6c0FhODBVdFVKUzMwREd6TEdPc2gyczY0bFRzYVFuM3BHMkI0aFNj?=
 =?utf-8?B?MFpLYWx5QkczcmpjNXRZTnBqeWs0VGpUK2E2Y0V3NWVDMjJ2SVpFV1I4OWFW?=
 =?utf-8?B?Q3lmYXBMMkxQa2ZkMWdJclY3Tms1YWl2cStPMUdLRE5nWFkwMnBWdk1sZXBj?=
 =?utf-8?B?NmxuR090cUZERTluaGJxSm5NM1o4dXZ4QVhKNk9xQ1FHdmRKM3RxVldDNTAz?=
 =?utf-8?B?N2ZuNnFGcVF0OXJZQWNnYXpmaEVxQWJGb2NqZ2EveXZEaE41eUp3V3dPeUhk?=
 =?utf-8?B?U1IwbGVqUE9aaXo0Z3RudjJVZlVIU3Q5S2VHTllHNWZpT3c0UXhCMnBBUG9a?=
 =?utf-8?B?YzgrQjZ6Y1hHS3ZGVmtJLzJPSVltWjlmNHcyaG9EQk5FR1J5NURGWlliZHRX?=
 =?utf-8?B?NVFyZ2tPWVpJQWlRSzZuYlhnZVVZVzB4QWY0ZnR6UHpJSWlRMmdkdy9lM0Rm?=
 =?utf-8?Q?RuuZPE?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CFEF53C94A092844B571B331A0525392@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10435
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	461dbcad-a84b-4c12-9e4d-08de32434860
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|376014|36860700013|14060799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUdhS04vaG5yUkVOQWhXYjVuaUdRR1E5TzdzQ1NtSGNwbFBDWFFzTm0zODRM?=
 =?utf-8?B?Mmo2cytLMXdrbmpVWkJNLytZRk5oRWRWUVhaeHJudjIzcFZhVDEyM1pOUWYy?=
 =?utf-8?B?YU9RMlpZY01LbXJ4TE9vanBvb0dVVlkvdUdJQWtmTUtNRWxvNGFVQmx3WTV3?=
 =?utf-8?B?Z2pDb2hGamRIU3p3Ymd0K1NDVHgvZFhxUFhBZS9SWm1SQXZaUHNCVzcyMHhm?=
 =?utf-8?B?aE9lZ2tFNHNPUnBNTDhOWGRYbjNUNHFWamhmdElxWXc5ano4QTdtZElKWEox?=
 =?utf-8?B?ZVliU1B1YnRGMnk3d1lwNDlzV3l0a1A5c1AvNjVtclhkRHlaL2xCTUJEc2ZE?=
 =?utf-8?B?d01ZSUFRSTliMUtkclZUYnZBamxZZFQvd1hidEtQc1ZIL0RsME1iMGtucGNx?=
 =?utf-8?B?RlJmWWMrWHhzNTV4cTlMS0dCanZNQnFDcC90eFpaL1hlYitTOC9kVW8xeExs?=
 =?utf-8?B?UXpuSTQvZWtqTGNBSlBmdUZONzA1NGJ4Rzg3MkhOd3h1U3NhVjdJWnltKzlL?=
 =?utf-8?B?aXk0N1kzZXNYL1hiQkltTFQzeklDMkFPZE5sb2NkQnBuaXIwUnZnZjVHeWNO?=
 =?utf-8?B?QlNPYlVtSkpXY2dCRSt5MC9HRjNCbzIvaE03YWgrZnJ4Z3NaNHNZVXlvcDdw?=
 =?utf-8?B?dGFuK1VBV2NQVjZHdWt2dndMUVJ3dXlybjVNV2N6RmZlLzF4NDVQV3FYMHgx?=
 =?utf-8?B?MFZIalMzWWdSd2l0NktRNDQwY1FKaTRGK2gwMkQwOWovMmZLTHd2dE5vNFFx?=
 =?utf-8?B?OGdIbXV0Z0Z3cVFiN3dSMGFZdEJuTllzalA3aWRMZ1dmNkFNdWFYOFBXNFFI?=
 =?utf-8?B?TUFUZWRqeUNHdktrdUQvY2F5dGJOeE5MZ2hoaUNxYlZrSUthWmNDSDNKZExp?=
 =?utf-8?B?cXIzcXFRRHhVQjhkbXM5Y3FYaHpOYm95cFhYeXBHOW9RT1N3WXM4QUl3MWto?=
 =?utf-8?B?dGp5TDFiaE5OVFdoRXVndHlCNXJXeXNDSitsaDBjVXAvdWZDcVV0YTBKWE1P?=
 =?utf-8?B?YUsxU053U25mQW4wOGp6TEYzN04rQzRZYmxlNlVRNVNGSmxoaER1RmpvYUoy?=
 =?utf-8?B?SVpaNmdOOGNnM0xyeDFKVkVndnBBU1RTTzUwWUlwaUVSbFpoNk5uUmlIV0Rx?=
 =?utf-8?B?Z1U2a3NFR05ZenVKa1NPWUFqQUhWeHhzV0JBZFNRckp1VnAzUWF1N3JDcXlM?=
 =?utf-8?B?ZW1NT3lLWm93MnBTLzRRVFkwckRESituSW5rajVZMUFCTUxuL01SZW9YZDJp?=
 =?utf-8?B?U3BkdXVCenJmeGZOYTNlaW5xeE96WGdzZVVrc1A4OHNlL0xHTVdYbHVsWXI1?=
 =?utf-8?B?cTFmNUFvRTlDMVZ4Q2JKaHllRituQmt6b2R2cVU1YmI2ZXZLZVNEMmZYV0xS?=
 =?utf-8?B?ZGw3ZXJIVXJvMkl3R0lmeUdpM1BhZkd6WCtJRXZyMGJIcytlVU9URE43TkJN?=
 =?utf-8?B?b3BKemkxOW1BelYxTVlGVXlZYWdldFJySFk2TVZpNk1UTXhvU1BIYjh4TUlh?=
 =?utf-8?B?WE9Ua0pXMGNaSTg2Y2hVQnV1TUczVHlwTkNWL2xqWTBUU1ZQdG9oSHhqQUdh?=
 =?utf-8?B?Vy9tKzNkcFVqMUNPR1M5aGVuVjVweFlFY0dxUXNQaU1EWCtzdnBZVFpBcU5v?=
 =?utf-8?B?bGM3cDZlRDVvQmdtVHFSZjdGUFNmczhKU3V4Y00rRko3alI2QTJaaTIwenJt?=
 =?utf-8?B?cXl5QjBiR2U0aWJyZWhSYUxPckVaL25rQldJcG9OTkQ4VXNlY2hIZ1RPQUFM?=
 =?utf-8?B?QzJEb3hDY1FQZW9XUnh2N3hFc2FDd0prZXVSU2tLTlJWVkFIZEJMSVB2S3FH?=
 =?utf-8?B?aWhsVklGampoSzU4a3pFUFlxSnNVS3AzaXdWdTRKcVBPbVpnV2MyOXV0amZm?=
 =?utf-8?B?RTVZbldSNkQya1hMYW94eUs4OW43U2dlV2JUZGx1Vm5GMXkxa2JMeU5pU25W?=
 =?utf-8?B?UjdvWnZrL3NyVlE2WnBKM0FiZmoxU1JyUVVtSFp6MlJwT0dOVGZid2lxZEVs?=
 =?utf-8?B?Ny9IdUxlYzljTlNzRlZ3ZWROWjRuTWxZcTJmb2N5Y1N0TkVQRnRCa2svR3ZS?=
 =?utf-8?B?WDRza3hlNFhLZWNCQXlvVlkwVW5JVVQwU0xLdFRzdEhPM1NkcHZOVG5YK1Nl?=
 =?utf-8?Q?cIK0=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(376014)(36860700013)(14060799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 08:10:34.7634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b4e6ed-390a-4795-1570-08de32436f8a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10582

SGkgSnVsaWVuL015a29sYSwNCg0KPiBPbiAyIERlYyAyMDI1LCBhdCAxOToyNiwgSnVsaWVuIEdy
YWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSwNCj4gDQo+IFNvcnJ5IGZvciB0
aGUgbGF0ZSBhbnN3ZXIuDQo+IA0KPiBPbiAxNi8wOS8yMDI1IDExOjE5LCBNeWtvbGEgS3ZhY2gg
d3JvdGU6DQo+PiBPbiBTYXQsIFNlcCAxMywgMjAyNSBhdCAxOjAx4oCvQU0gSnVsaWVuIEdyYWxs
IDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IE15a29sYSBLdmFj
aCA8bXlrb2xhX2t2YWNoQGVwYW0uY29tPg0KPj4+PiAtLS0NCj4+Pj4gICB4ZW4vYXJjaC9hcm0v
aXJxLmMgfCA4ICsrKysrKystDQo+Pj4+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPj4+PiANCj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9p
cnEuYyBiL3hlbi9hcmNoL2FybS9pcnEuYw0KPj4+PiBpbmRleCAwMmNhODJjMDg5Li4xN2M3YWM5
MmI1IDEwMDY0NA0KPj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vaXJxLmMNCj4+Pj4gKysrIGIveGVu
L2FyY2gvYXJtL2lycS5jDQo+Pj4+IEBAIC0zOTcsNyArMzk3LDEzIEBAIGludCBzZXR1cF9pcnEo
dW5zaWduZWQgaW50IGlycSwgdW5zaWduZWQgaW50IGlycWZsYWdzLCBzdHJ1Y3QgaXJxYWN0aW9u
ICpuZXcpDQo+Pj4gQUZBSUssIHdlIGFyZSBub3QgdXNpbmcgc2V0dXBfaXJxKCkgdG8gaGFuZGxl
IFNHSXMgYmVjYXVzZSB0aGV5IGFyZSBhbGwNCj4+PiBzdGF0aWMgYW5kIGFsd2F5cyBlbmFibGVk
LiBBcmUgeW91IHBsYW5uaW5nIHRvIGhhbmRsZSBkeW5hbWljIFNHSXM/IElmDQo+Pj4geWVzLCB0
aGVuIGNhbiB5b3UgcHJvdmlkZSBtb3JlIGRldGFpbHM/QXMgZmFyIGFzIEkga25vdywgdGhlcmUg
Y2FuIGJlIGF0IGxlYXN0IG9uZSDigJxkeW5hbWlj4oCdIFNHSSBpbiBYZW4uDQo+PiBBcyBmYXIg
YXMgSSBrbm93LCB0aGVyZSBpcyBhdCBsZWFzdCBvbmUg4oCcZHluYW1pY+KAnSBTR0kgaW4gWGVu
LiBGb3INCj4+IGV4YW1wbGUsIHNlZSBmZmFfbm90aWYuYyBpbiB0aGUgZnVuY3Rpb25zIGZmYV9u
b3RpZl9pbml0X2ludGVycnVwdA0KPj4gYW5kIGZmYV9ub3RpZl9pbml0LCB3aGljaCBoYW5kbGUg
aW5pdGlhbGl6YXRpb24gb2Ygc3VjaCBTR0lzLg0KPiANCj4gQmVydHJhbmQgY2FuIHlvdSBjb21t
ZW50IG9uIHRoaXM/IEluIHBhcnRpY3VsYXIsIGRvIHdlIHdhbnQgdGhlIEZGQSBTR0lzIHRvIGhh
dmUgdGhlIHByaW9yaXR5IG9mIHRoZSBpbnRlcm5hbCBvbmVzPw0KDQpUaGUgZm9sbG93aW5nIGlz
IG9ubHkgYW4gYWR2aWNlLCBkZWZpbml0ZWx5IG5vdCBhIHJlcXVpcmVtZW50LiBJIHdvdWxkDQpi
ZSBvayB0byBhY2sgdGhlIGN1cnJlbnQgd2F5IHRvIGRvIHRoaW5ncyBhcyByaWdodCBub3cgRkYt
QSBpcyB1bnN1cHBvcnRlZCBhbmQNCmlzIHRoZSBvbmx5IGNhc2Ugb2YgdXNhZ2Ugb2YgZHluYW1p
YyBTR0kuDQpJIHdvdWxkIHRob3VnaCByZXF1aXJlIHRvIGhhdmUgYSBsb2cgbWVzc2FnZSB0byB3
YXJuIHRoZSB1c2VyIHRoYXQgU0dJIHh4DQpoYXMgdGhlIHNhbWUgcHJpb3JpdHkgYXMgeGVuIGlu
dGVybmFsIGludGVycnVwdHMgZHVyaW5nIHJlcXVlc3RfaXJxLg0KDQpIZXJlIGlzIHdoYXQgSSB0
aGluazoNCg0KRkZBIFNHSXMgY2FuIG9ubHkgYmUgZ2VuZXJhdGVkIGJ5IHRoZSBzZWN1cmUgd29y
bGQgYW5kIGluIHByYWN0aWNlIHRoZXkgd2lsbA0KYmUgZ2VuZXJhdGVkIG1vc3RseSB3aGVuIGNv
bWluZyBjb21pbmcgYmFjayBmcm9tIHRoZSBzZWN1cmUgd29ybGQgKGVpdGhlcg0KYWZ0ZXIgYSBw
cmVlbXB0aW9uIG9yIG9uIGEgcmV0dXJuIHRvIGFuIHNtYyBjYWxsKSBidXQgb25lIGNvdWxkIGFs
c28gYmUNCmdlbmVyYXRlZCBmcm9tIHRoZSBzZWN1cmUgd29ybGQgZnJvbSBhbm90aGVyIGNvcmUs
IHByZWVtcHRpbmcgd2hhdGV2ZXIgcnVucw0KKGJ1dCBzYW1lIHdvdWxkIG9jY3VyIHdoZW4gYW4g
aW50ZXJydXB0IGlzIGRpcmVjdGx5IGhhbmRsZWQgaW4gdGhlIHNlY3VyZSB3b3JsZCkuDQoNCkxp
bnV4IGtlcm5lbCBpbXBsZW1lbnRhdGlvbiBpcyBub3QgbG93ZXJpbmcgdGhlIEZGLUEgU0dJIGlu
dGVycnVwdCBhcyBmYXIgYXMgSSBrbm93Lg0KDQpJbiBteSB2aWV3IGhhdmluZyB0aGUgRkZBIFNH
SSBoYXZpbmcgdGhlIHNhbWUgcHJpb3JpdHkgYXMgZmZhIGludGVybmFsIFNHSSB3b3VsZCBtZWFu
DQp3ZSBoYXZlIHNvbWUgdHJ1c3QgdGhhdCB0aGUgc2VjdXJlIHdvcmxkIHdpbGwgbm90IG92ZXJs
b2FkIHVzLg0KDQpCdXQgaW4gcmVhbGl0eSBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvIGhhdmUgYSBw
cmlvcml0eSBvcmRlcmluZyBsaWtlOg0KLSBYZW4gaW50ZXJuYWwgU0dJcw0KLSBGRi1BIFNHSSAo
b3IgYW55IG90aGVyIGR5bmFtaWMgU0dJKQ0KLSBhbnkgb3RoZXIga2luZCBvZiBpbnRlcnJ1cHQg
DQoNClNvIHRoYXQgWGVuIGludGVybmFsIFNHSXMgaGF2ZSB0aGUgaGlnaGVzdCBwcmlvcml0eSwg
YnV0IGhhdmluZyBvdGhlciBTR0lzIHN0aWxsIGhhdmluZw0KYSBiZXR0ZXIgcHJpb3JpdHkgdGhh
biBvdGhlciBpbnRlcnJ1cHRzLg0KDQpJbiBhbnkgY2FzZSwgd2hhdGV2ZXIgd2UgZG8sIHdlIHNo
b3VsZCBrZWVwIGl0IHBvc3NpYmxlIHRvIGhhdmUgb25lIHNwZWNpZmljIGR5bmFtaWMNClNHSSBh
dCB0aGUgbWF4aW11bSBsZXZlbCBvciBldmVuIGF0IGFuIGhpZ2hlciBsZXZlbCAoaWUgbG93ZXIg
ZG93biB4ZW4gaW50ZXJuYWwgU0dJcykNCmZvciBzcGVjaWZpYyB1c2UgY2FzZXMgKGhhbmRsaW5n
IGhhcmR3YXJlIGVycm9ycyBjb21lcyB0byBtaW5kKSBidXQgdGhpcyBpcyBvayB0byBtYWtlDQp0
aGlzIHBvc3NpYmxlIG9ubHkgYnkgY2hhbmdpbmcgeGVuIGNvZGUgb3Igd2hlbiBjcmVhdGluZyBz
dWNoIGEgc3BlY2lmaWMgZHJpdmVyLg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCg==

