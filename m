Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9E7AC04AA
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 08:37:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992923.1376393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHzXp-0003r5-D3; Thu, 22 May 2025 06:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992923.1376393; Thu, 22 May 2025 06:36:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHzXp-0003oZ-AG; Thu, 22 May 2025 06:36:45 +0000
Received: by outflank-mailman (input) for mailman id 992923;
 Thu, 22 May 2025 06:36:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isH4=YG=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1uHzXn-0003lz-TR
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 06:36:44 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f9f0af5-36d7-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 08:36:42 +0200 (CEST)
Received: from AM8P189CA0026.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::31)
 by DB4PR08MB8079.eurprd08.prod.outlook.com (2603:10a6:10:385::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 06:36:39 +0000
Received: from AM4PEPF00027A6B.eurprd04.prod.outlook.com
 (2603:10a6:20b:218:cafe::8c) by AM8P189CA0026.outlook.office365.com
 (2603:10a6:20b:218::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.29 via Frontend Transport; Thu,
 22 May 2025 06:36:39 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A6B.mail.protection.outlook.com (10.167.16.89) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 06:36:37 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DB3PR08MB10336.eurprd08.prod.outlook.com (2603:10a6:10:43b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 06:36:03 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%3]) with mapi id 15.20.8699.022; Thu, 22 May 2025
 06:36:03 +0000
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
X-Inumbo-ID: 1f9f0af5-36d7-11f0-a2fb-13f23c93f187
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=v1KK+lpcmeZpVjVpR0FBlyCdHKmugnCKa74TVpV52Mjrp4J4trB34AXWba1CF8HNOkiSoDJ+UXhiRTUZ7Nv/tFjOUaXP8K6y7CMPvETfSdGtXrMBbSIaBOkgNavklU1dizbYvQ9e9bnKngZVWDa80/YHAGCe3wMXpxxrZ48txt7ukVtNzTcprZjFfByckoz/VL9dODr+WYoLPPJUKNlAAx8AXQW3R6Q4WRkbIRGg8LrwZ8eoftZk0/YlpSk4zLoLeVMi/gB/oIu2SxiExjZeGEu8cpj7WSpAa5Z1NgKR4sS3E6OCyG5YOd1E6NcHXFqGvpxrdmztJMpmHzs4W8EM3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=stk66sdxH8OrsM/SQCnppO1CCKo0b6N4+adgoZU3HQM=;
 b=Ir/WNjhDxyRy/z8B0/ULiLgsST4+Y8Cd+Lp2puUwWSr8KSfFLK7+3xvwQn2aU/AMPynSG1XW6ERPr6XQeHqSVXPPnpITMO7jcv/QVCBgqqxsFVoKsOdFZF7ShZwBH5xRgSI3KbtTA+h+wQaGBuLT9+anQGfeXkbI4tNNphV4cgSeVkwD9hh+bLAzIcirlv22K8VxnShvrSLiNosmXmM+FM/ZItemMpA4ert9AJsc7hFPkDZ/HU1GHS9Y6YgAA7z/Wm0Eapb0dj4z3RPPVpGy163xPBrmmpqSxprnHpxen8+XxlbGQRKaKIB1e462y7/NOFBOzWTn73WAVOwKq5XQqA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stk66sdxH8OrsM/SQCnppO1CCKo0b6N4+adgoZU3HQM=;
 b=PTZ2DorsJVyHBOPf4KCcDCI3E+ON3cXKnPADbEPgqOVBWwoMQsoV2tMJCPxEKKplie2fI1l19J5iCg596I4oxq9hrfMxvCDeiXa5vq9S4KsMNOnb+OtG49y+4kGLKLCNinfUkGo+819ETob192ufUWfMPZ2gjQuRDWhDnZKtgvo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GVQuxSDkxp5ZjLwCjbiR7V4BNVVKtVK4pB+qQ6SE9RtTzVT9R8coS5FAaILEPusWHMwgBOmTSBidh3INLXaRnhQ1louZ2wEvie2Osf37pnhiFIhus4EujJBeFb1YApXGkIQuoEoUSTirIw9lBnjPc+IPw3z4eG+XS+YTAfhaA3wxpDbW75x9u76FueQ6z5weT8LaZKmxn2j1ZD5W2Cj3y4CNji9GGyBZvaJcv5A/PhMuAJkXRL11fQ5eL9TrHyx7tud3kH8pM/SiRgr+cop+1Z3EwUXXg10vYH4uBxAiRiEc6UQRkcILtrtTGdPUnrD6w7YLDl1yoZt0MFHg7MCzoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=stk66sdxH8OrsM/SQCnppO1CCKo0b6N4+adgoZU3HQM=;
 b=khSGsgk6ElOj5SnoZotCh7FX+5xWAEMhzzMrLvcn75ElvF59hGCpXxeobFPZWfdf4S8hFQC55wte2t9Su4NjFwmZtqhW5WDaGBY4yM0W278QC/dHnxnkMrj2yZz5tXYCvyUsMDp/OTQnkgzmNtf7PGj7hh0DMmD+bVFnyAOakPy9TJeEqBWvvjm9xQMUSGwOInaeOx/H6nQyrZqiQTUgh0ZSgwndZiaDsctmAIGRqNDMgThtG3mytz47ujy/8rI3ENVe2I7P0rsWooQUqcpmTyZABB7/hZZIwzVK7ND+MbrNfsDg/WFjxn/aAqT6yT364dxA51QQ9Zqxw9ItKaqUoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stk66sdxH8OrsM/SQCnppO1CCKo0b6N4+adgoZU3HQM=;
 b=PTZ2DorsJVyHBOPf4KCcDCI3E+ON3cXKnPADbEPgqOVBWwoMQsoV2tMJCPxEKKplie2fI1l19J5iCg596I4oxq9hrfMxvCDeiXa5vq9S4KsMNOnb+OtG49y+4kGLKLCNinfUkGo+819ETob192ufUWfMPZ2gjQuRDWhDnZKtgvo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH v5 3/6] xen/arm: ffa: Introduce VM to VM support
Thread-Topic: [PATCH v5 3/6] xen/arm: ffa: Introduce VM to VM support
Thread-Index: AQHbrqLcUoVcqzY6y0GU3I61EJDkQrPdY1IAgAAESwCAABesgIAA6vmA
Date: Thu, 22 May 2025 06:36:03 +0000
Message-ID: <BE540F41-D201-4B3E-B88F-B2300D0B587C@arm.com>
References: <cover.1744787720.git.bertrand.marquis@arm.com>
 <f6c67adcae192bcbe9c7612fda1bef31c40bb9a0.1744787720.git.bertrand.marquis@arm.com>
 <CAHUa44HsTzvXtNGv+iSRP5X0JX00phu4yP08CWudU3zxWA-bsg@mail.gmail.com>
 <AACF07F9-7D48-45DF-AC97-B5B51D2A3AE3@arm.com>
 <CAHUa44HiOhdPSvEELt+n_JDcjep+AB08pzFyy4s9+1-mvASYRQ@mail.gmail.com>
In-Reply-To:
 <CAHUa44HiOhdPSvEELt+n_JDcjep+AB08pzFyy4s9+1-mvASYRQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DB3PR08MB10336:EE_|AM4PEPF00027A6B:EE_|DB4PR08MB8079:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b339b4e-a14c-4ff9-c7de-08dd98fb00bd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?V1JieTBONHBSd29NL2E5Q2doN1JxQWs3VW1Ec21sN21sS1MxdWlPbStIWHNk?=
 =?utf-8?B?R2pJcnhxTkFEZGhmcGd0eUM0Nnkrb0tFTTFya1FWUTdNZS9NWjNqNHkwS2dq?=
 =?utf-8?B?UHhNNU95S29YWjFjYzlSYUF4dVQ4d0JtQ1FzaHB3QnFLN1REQnBRRE5qbEFp?=
 =?utf-8?B?eUgwWTFQZGtkbDhCWW84SlBWWlBqeUJXd0ZUUjhPclJpVnRMN1JBTjNkbEJu?=
 =?utf-8?B?c09OTFpFZ3hVcHFET0l6RWtOdE5Pb0Z6YVpwNGdSYTU5N3g3WW5EQkxmaStQ?=
 =?utf-8?B?eGpQUkZ5ZHVCTnVMeEtlMzFJUlhDNk5MTWd4MHpXY3U0YmJmdlRFaHR2RzBX?=
 =?utf-8?B?QVFTTkluWTVXU1g3NG55Skc0RU5kV0RpT1Rqc2ZhcGkwdTVEekx0SzNqdE5z?=
 =?utf-8?B?K0FwcW10WjNYamlSZUJ6SlFLL2Rrd3NTQXU5WlhpME53d0lSV2xqTEU0K1dv?=
 =?utf-8?B?amxRR3VHVEVxNy8rOXRMaTdXUFd4dFN0V3NueFg1alpkNXkyaUJXaHpFUkxY?=
 =?utf-8?B?azA0QVI3bEJUdXFIMnd3NGc0bUkwbHVGenRlTy9jZGpvMW1mdWJuT2U2Z3lu?=
 =?utf-8?B?clU5UURRYmM5b2F6cERCWTQ3ZnE3TkNLME5jajBVOEdaUFlnWTNYR1VNQVpL?=
 =?utf-8?B?dDZ1b211L3JXY0U2MmJrOUluZDdtbzRpbWlxeFpSYVQreUlSS083L0czMmtQ?=
 =?utf-8?B?NnZxYmJlSmhERkhGUHhXd29VWXJaTCtMSjBXdUJaT2dxQ0I4SExDODIvU2Zw?=
 =?utf-8?B?ZFBmWHNLeng5MUEwOVdWSVRaaDNydXJnMUVOT2dQMW5PeVowMi9CUE03VlVs?=
 =?utf-8?B?QXRRd08rOHNtajhiU2Y3cms0N2lkQitadW9DZVdXajJwM2VsZmFRU3Y2RG9i?=
 =?utf-8?B?OVhuNFlBSnRqWXIwUjlGSzBRa0ZNMk9obEgwQ2tVY0JzZW4zRW5EWnhNNHQ0?=
 =?utf-8?B?RFRwY3ZFK2h6VmgyWWJrNnZjOWJhZnRsais4Wmh1UEhLYUEraElLWm1NbzhT?=
 =?utf-8?B?U3BVSWVJMDE0NzQxQks4cklWSVRFOVM3UGhEeXRNT2xiSUZldFBESkdSQlZz?=
 =?utf-8?B?a3BEUkpVNXFnQWNzMWY0cFhlbEg1MzRtVHVobGJINW9qVzR4VDFMS0RyVkZU?=
 =?utf-8?B?WWlrVGUwNUZBcjd4TDZyUlZaS0NEcGE0VUdyZEZ2NzZscjFOOHpTZC82ZDh3?=
 =?utf-8?B?WnI2TXBjaW81NmppZW5weFQ0QlVoRXJ5TS9UOGVUL3dsTGRCcFVvaEtOTnEr?=
 =?utf-8?B?MDBpakNIY25GTGJvR01nSk9VZ1czOUxXNDNQT2hxTG05bXE2U1VTVG1RYU5P?=
 =?utf-8?B?UmIzZjlyWExiMytTRm5aYXl2aVRjeHlDb1YwSkE1QzNtejl6anBlWlE0Z3dN?=
 =?utf-8?B?L3dUcGErMlVMNnhCOXdsdFFaejd0NTlwb0dPeVBlT2ZMU28rVEpmMDlaNm1k?=
 =?utf-8?B?ZzdlYUQ3eG4zcnJES2ZPU054Qk5DN1poQU9mL2xKOEt4VEFnTzF1dmRxZXdu?=
 =?utf-8?B?R25FS2ZJaU1xYUJ5cXAxamlETFpJdVYxdVZuaFVDNjdGS212MlhVMkVMVWd0?=
 =?utf-8?B?OVpNOWRrNFFvcHZieXpESjU4djVFQnUvOUpQak41TDdWV2IvM2h3MUFleXU0?=
 =?utf-8?B?c2o3eVZUVU0zWUpzdVFZbTlOM1VmODRBdy9sZS93bWpqeXRnVmhnUjg3Lzkv?=
 =?utf-8?B?K0xwS3d6OTZqWDVVMnA4eWVWdS8xa2N2VzZKYzdjQTdGV0lQNmVlN1Y0ai90?=
 =?utf-8?B?cDB1L2lseUJ6djRicVRVMXhVS0RIa0ZTNjlVOGREa3dsM0lGOWJWaHdlVVdQ?=
 =?utf-8?B?c2VrdGIyRkRVZUJTYkFUUmRnYm5tNnltRTJwVk5tNnkwdVdwZHdaYTdLK3pV?=
 =?utf-8?B?UTBGT0hVZVZzay9oc2JtVkxXSzNxaCt5SEtMRVpsTnNhcjY4TDYzQ2lURmd5?=
 =?utf-8?Q?yKXmfHxT30A=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <397CEF65CBBB4241A79BBE95512FFE6C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB10336
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2b5fb2cd-0049-4074-915a-08dd98faec87
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|36860700013|82310400026|14060799003|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T0hib0tZNXlBcWxsalQyZS9vUElxYWNQaW8yUFlndlNBS25LeTVNUGh2MENV?=
 =?utf-8?B?SldXRHpFY2w0dHl5Zk5kb2Y5Q0VKUk5JdTFJL1hoMnZ4bTZtZnJ6bXdsdEND?=
 =?utf-8?B?bHdzdXpiUjJ6TFFrd2tGYkRGMjEzVFJzWlM4MjJCR2MvcVFIYTduRFdQYlhW?=
 =?utf-8?B?RkhyN1lNdmZvMFVwMUpFemltTlF2dVNkUWxja1Z2VDNHbVY1dnBQSzhjYzF5?=
 =?utf-8?B?MTRXZlk5ck9VMHo2dWdPWTZjRGUvZnFHTUdyMXVxTVdMVDQ4OE4vNmQyQ1Qw?=
 =?utf-8?B?R0VXRzdPVFBteVkwYnVCeFNGT29CRTZuVE5GV1pFSGZSU1pYUmFNTjBvVWlV?=
 =?utf-8?B?bWV2UGFzUG1veUI0S0xaNXJmVHpMKzc2dEV1djZCRWlMa3o2cS95L01QTEtG?=
 =?utf-8?B?SW5oVUdKQXJ5Skx2bGRhMm9EcFhqMUM3UDU4ay8rMWJSU0ZKZTBmNHd1bzR5?=
 =?utf-8?B?cG13c25IVk8ydlJnM204dFhnNkh0ejR1Z3poNkliQ1MwTW5SWWh3aUxuZ0F3?=
 =?utf-8?B?cWZpMkplckk1VHpCRkNkczRQYXRCRTQ3SXQ1WlVCS0NBNWg1UlpRMXN1WlN2?=
 =?utf-8?B?dzRubHVNd0cxUnFEa25oMElIdlFGVjdvUVpVQUtIWGFKL0oxVDBtZzRlSHFj?=
 =?utf-8?B?bzcrS3Zoc001OGRCMFNZUzZ1M3YvNFA2N3NZMWoybmkwQ2F3UExUdGVYRWVS?=
 =?utf-8?B?aUpia25tem56cE14K3NNUlc2TWJiOUJKNGJaTmc1S21ZckdmL2FmL00xR1Fm?=
 =?utf-8?B?aW1CLzFwMUQ3WmRPQ3ovV1N2VGpQQjRJUlQwdlNnUGdMMUNDUCtmUUhYY0hX?=
 =?utf-8?B?bi96MnRPNVBRTjN5eEE4RmF6VnlwOFBhTzFCeW12N0REbkJQMTZTZFdqSlFu?=
 =?utf-8?B?T0lRUk5KRTdxNGFVQzgrK3ZRTGwrOE8rMFErdlVpN05tb2dqbEI5L2FIdzFT?=
 =?utf-8?B?SU9MeW9lbFZaQkYvMlE5RVFIbjRzamZQNS93WnJqLzg1d09QcWNHZWVEYjIw?=
 =?utf-8?B?K0Yza05iOFpyclVwWnVyWHIvNnJGNTI3TE1FdlIxWldEd2JpNmtnSTh1RFFq?=
 =?utf-8?B?MjBxWllPWnBSdzRCZnNPMUp5WGZkZlU5bFVsNUJzaDlqT2Fhc3JGM1lMTUlp?=
 =?utf-8?B?U1FYakQ4UVNOc21KNGszdWRPNTBjTURYZmp6cmJpVGxvQ3dDcGtVcEZ3WHdx?=
 =?utf-8?B?eWJWc3dpR3E3dkNBTnFiT3VUMkNTSkp3Y3A0bHFRQnI3eXVHMU1xY04xV0xo?=
 =?utf-8?B?YTEveGNMQ1RwQjV6UXdkRW1JdEE3OTNSTXhaMkRyRHFuT0Z5dTVEd2xybnY1?=
 =?utf-8?B?eHhHc1g2WUFuQUc3b0szME9XcTgxUWdBNjNtcjlrbldZTWU4TG5zK2MwN09B?=
 =?utf-8?B?ZzgraFFRNGt2eWFtU21RTkp4RVV3V204cEtPdy9KcmtlWFRjME9aZUNWMi94?=
 =?utf-8?B?b25MQS8rUm5mVnUrRGVDd1I1eDN1TFN6RFF5TkFnbndEeU5SZlcwUGl4TEJx?=
 =?utf-8?B?ZGJDS29WSW03WGt6ZGJZN0tZdFMyTnlYRk5FUlA2WFhxaVVwSlNMV0tWSVRQ?=
 =?utf-8?B?SVgvYnRLU1dRWkQwUmFIamdMbkVnNjkreEJrNVpGWllCRjdCanFudTUyYWJW?=
 =?utf-8?B?cTYrdWQ2bU80eDF2anhPOUpkNENKZGJESjVQb0JxTnVxQjFHM0t0WG1Oc0tT?=
 =?utf-8?B?NTRiYnZtZm01L1VaaEE3c2JyVHNWQ0I5WDNsSU56TmpNaThPd240bFJuZTAx?=
 =?utf-8?B?L1ZXTkhHeWdHbDdMRk1hMi9yaVdocjRXS0o4SDBYL0dobFlwZEpxMUp1ZnYx?=
 =?utf-8?B?WDhSSFlya004c0Nmd0tPampSTTJYZGhtejNqc0xQcWdpcllrSWhzVW1JZjdR?=
 =?utf-8?B?SkcyWUs5NGlXTldoYjEzVUZrVVFocWtzSHFRdWU2OFNXaEFFaURYbHUzNU1W?=
 =?utf-8?B?T2JMRDNJRkRObmt6bm42M0xBOHFYWTNhVVNtL1BnMWc5bmhtaTJCQURJTzFH?=
 =?utf-8?B?cE9jWktpUTR3PT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(36860700013)(82310400026)(14060799003)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 06:36:37.2261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b339b4e-a14c-4ff9-c7de-08dd98fb00bd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8079

SGkgSmVucywNCg0KPiBPbiAyMSBNYXkgMjAyNSwgYXQgMTg6MzQsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gT24gV2Vk
LCBNYXkgMjEsIDIwMjUgYXQgNToxMeKAr1BNIEJlcnRyYW5kIE1hcnF1aXMNCj4gPEJlcnRyYW5k
Lk1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+PiANCj4+IEhpIEplbnMsDQo+PiANCj4+PiBPbiAy
MSBNYXkgMjAyNSwgYXQgMTY6NTQsIEplbnMgV2lrbGFuZGVyIDxqZW5zLndpa2xhbmRlckBsaW5h
cm8ub3JnPiB3cm90ZToNCj4+PiANCj4+PiBIaSBCZXJ0cmFuZCwNCj4+PiANCj4+PiBPbiBXZWQs
IEFwciAxNiwgMjAyNSBhdCA5OjQw4oCvQU0gQmVydHJhbmQgTWFycXVpcw0KPj4+IDxiZXJ0cmFu
ZC5tYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4+PiANCj4+Pj4gQ3JlYXRlIGEgQ09ORklHX0ZG
QV9WTV9UT19WTSBwYXJhbWV0ZXIgdG8gYWN0aXZhdGUgRkZBIGNvbW11bmljYXRpb24NCj4+Pj4g
YmV0d2VlbiBWTXMuDQo+Pj4+IFdoZW4gYWN0aXZhdGVkIGxpc3QgVk1zIGluIHRoZSBzeXN0ZW0g
d2l0aCBGRi1BIHN1cHBvcnQgaW4gcGFydF9pbmZvX2dldC4NCj4+Pj4gDQo+Pj4+IFdoZW4gVk0g
dG8gVk0gaXMgYWN0aXZhdGVkLCBYZW4gd2lsbCBiZSB0YWludGVkIGFzIEluc2VjdXJlIGFuZCBh
DQo+Pj4+IG1lc3NhZ2UgaXMgZGlzcGxheWVkIHRvIHRoZSB1c2VyIGR1cmluZyB0aGUgYm9vdCBh
cyB0aGVyZSBpcyBubw0KPj4+PiBmaWx0ZXJpbmcgb2YgVk1zIGluIEZGLUEgc28gYW55IFZNIGNh
biBjb21tdW5pY2F0ZSBvciBzZWUgYW55IG90aGVyIFZNDQo+Pj4+IGluIHRoZSBzeXN0ZW0uDQo+
Pj4+IA0KPj4+PiBXQVJOSU5HOiBUaGVyZSBpcyBubyBmaWx0ZXJpbmcgZm9yIG5vdyBhbmQgYWxs
IFZNcyBhcmUgbGlzdGVkICEhDQo+Pj4+IA0KPj4+PiBUaGlzIHBhdGNoIGlzIHJlb3JnYW5pemlu
ZyB0aGUgZmZhX2N0eCBzdHJ1Y3R1cmUgdG8gbWFrZSBjbGVhciB3aGljaA0KPj4+PiBsb2NrIGlz
IHByb3RlY3Rpbmcgd2hhdCBwYXJ0cy4NCj4+Pj4gDQo+Pj4+IFRoaXMgcGF0Y2ggaXMgaW50cm9k
dWNpbmcgYSBjaGFpbiBsaXN0IG9mIHRoZSBmZmFfY3R4IHdpdGggYSBGRkEgVmVyc2lvbg0KPj4+
PiBuZWdvY2lhdGVkIGFsbG93aW5nIHRvIGNyZWF0ZSB0aGUgcGFydGluZm8gcmVzdWx0cyBmb3Ig
Vk1zIHdpdGhvdXQNCj4+Pj4gdGFraW5nIGEgbG9jayBvbiB0aGUgZ2xvYmFsIGRvbWFpbiBsaXN0
IGluIFhlbi4NCj4+Pj4gDQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJl
cnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IENoYW5nZXMgaW4gdjU6DQo+
Pj4+IC0gcmVtb3ZlIGludmFsaWQgY29tbWVudCBhYm91dCAxLjEgZmlybXdhcmUgc3VwcG9ydA0K
Pj4+PiAtIHJlbmFtZSB2YXJpYWJsZXMgZnJvbSBkIGFuZCBkb20gdG8gY3Vycl9kIGFuZCBkZXN0
X2QgKEp1bGllbikNCj4+Pj4gLSBhZGQgYSBUT0RPIGluIHRoZSBjb2RlIGZvciBwb3RlbnRpYWwg
aG9sZGluZyBmb3IgbG9uZyBvZiB0aGUgQ1BVDQo+Pj4+IChKdWxpZW4pDQo+Pj4+IC0gdXNlIGFu
IGF0b21pYyBnbG9iYWwgdmFyaWFibGUgdG8gc3RvcmUgdGhlIG51bWJlciBvZiBWTXMgaW5zdGVh
ZCBvZg0KPj4+PiByZWNvbXB1dGluZyB0aGUgdmFsdWUgZWFjaCB0aW1lIChKdWxpZW4pDQo+Pj4+
IC0gYWRkIHBhcnRpbmZvIGluZm9ybWF0aW9uIGluIGZmYV9jdHggKGlkLCBjcHVzIGFuZCA2NGJp
dCkgYW5kIGNyZWF0ZSBhDQo+Pj4+IGNoYWluIGxpc3Qgb2YgY3R4LiBVc2UgdGhpcyBjaGFpbiBs
aXN0IHRvIGNyZWF0ZSB0aGUgcGFydGluZm8gcmVzdWx0DQo+Pj4+IHdpdGhvdXQgaG9sZGluZyBh
IGdsb2JhbCBsb2NrIHRvIHByZXZlbnQgY29uY3VycmVuY3kgaXNzdWVzLg0KPj4+PiAtIE1vdmUg
c29tZSBjaGFuZ2VzIGluIGEgcHJlcGFyYXRpb24gcGF0Y2ggbW9kaWZ5aW5nIHBhcnRpbmZvIGZv
ciBzcHMgdG8NCj4+Pj4gcmVkdWNlIHRoaXMgcGF0Y2ggc2l6ZSBhbmQgbWFrZSB0aGUgcmV2aWV3
IGVhc2llcg0KPj4+PiBDaGFuZ2VzIGluIHY0Og0KPj4+PiAtIHByb3Blcmx5IGhhbmRsZSBTUE1D
IHZlcnNpb24gMS4wIGhlYWRlciBzaXplIGNhc2UgaW4gcGFydGluZm9fZ2V0DQo+Pj4+IC0gc3dp
dGNoIHRvIGxvY2FsIGNvdW50aW5nIHZhcmlhYmxlcyBpbnN0ZWFkIG9mICpwb2ludGVyICs9IDEg
Zm9ybQ0KPj4+PiAtIGNvZGluZyBzdHlsZSBpc3N1ZSB3aXRoIG1pc3Npbmcgc3BhY2VzIGluIGlm
ICgpDQo+Pj4+IENoYW5nZXMgaW4gdjM6DQo+Pj4+IC0gYnJlYWsgcGFydGluZm9fZ2V0IGluIHNl
dmVyYWwgc3ViIGZ1bmN0aW9ucyB0byBtYWtlIHRoZSBpbXBsZW1lbnRhdGlvbg0KPj4+PiBlYXNp
ZXIgdG8gdW5kZXJzdGFuZCBhbmQgbG9jayBoYW5kbGluZyBlYXNpZXINCj4+Pj4gLSByZXdvcmsg
aW1wbGVtZW50YXRpb24gdG8gY2hlY2sgc2l6ZSBhbG9uZyB0aGUgd2F5IGFuZCBwcmV2ZW50IHBy
ZXZpb3VzDQo+Pj4+IGltcGxlbWVudGF0aW9uIGxpbWl0cyB3aGljaCBoYWQgdG8gY2hlY2sgdGhh
dCB0aGUgbnVtYmVyIG9mIFZNcyBvciBTUHMNCj4+Pj4gZGlkIG5vdCBjaGFuZ2UNCj4+Pj4gLSB0
YWludCBYZW4gYXMgSU5TRUNVUkUgd2hlbiBWTSB0byBWTSBpcyBlbmFibGVkDQo+Pj4+IENoYW5n
ZXMgaW4gdjI6DQo+Pj4+IC0gU3dpdGNoIGlmZGVmIHRvIElTX0VOQUJMRUQNCj4+Pj4gLSBkb20g
d2FzIG5vdCBzd2l0Y2hlZCB0byBkIGFzIHJlcXVlc3RlZCBieSBKYW4gYmVjYXVzZSB0aGVyZSBp
cyBhbHJlYWR5DQo+Pj4+IGEgdmFyaWFibGUgZCBwb2ludGluZyB0byB0aGUgY3VycmVudCBkb21h
aW4gYW5kIGl0IG11c3Qgbm90IGJlDQo+Pj4+IHNoYWRvd2VkLg0KPj4+PiAtLS0NCj4+Pj4geGVu
L2FyY2gvYXJtL3RlZS9LY29uZmlnICAgICAgICB8ICAxMSArKysrDQo+Pj4+IHhlbi9hcmNoL2Fy
bS90ZWUvZmZhLmMgICAgICAgICAgfCAgNDcgKysrKysrKysrKysrKy0NCj4+Pj4geGVuL2FyY2gv
YXJtL3RlZS9mZmFfcGFydGluZm8uYyB8ICA5NSArKysrKysrKysrKysrKysrKysrKysrKystLS0N
Cj4+Pj4geGVuL2FyY2gvYXJtL3RlZS9mZmFfcHJpdmF0ZS5oICB8IDExMiArKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLQ0KPj4+PiA0IGZpbGVzIGNoYW5nZWQsIDIzMyBpbnNlcnRpb25z
KCspLCAzMiBkZWxldGlvbnMoLSkNCj4+Pj4gDQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9h
cm0vdGVlL0tjb25maWcgYi94ZW4vYXJjaC9hcm0vdGVlL0tjb25maWcNCj4+Pj4gaW5kZXggYzVi
MGY4OGQ3NTIyLi44OGE0YzRjOTkxNTQgMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS90
ZWUvS2NvbmZpZw0KPj4+PiArKysgYi94ZW4vYXJjaC9hcm0vdGVlL0tjb25maWcNCj4+Pj4gQEAg
LTI4LDUgKzI4LDE2IEBAIGNvbmZpZyBGRkENCj4+Pj4gDQo+Pj4+ICAgICAgICAgWzFdIGh0dHBz
Oi8vZGV2ZWxvcGVyLmFybS5jb20vZG9jdW1lbnRhdGlvbi9kZW4wMDc3L2xhdGVzdA0KPj4+PiAN
Cj4+Pj4gK2NvbmZpZyBGRkFfVk1fVE9fVk0NCj4+Pj4gKyAgICBib29sICJFbmFibGUgRkYtQSBi
ZXR3ZWVuIFZNcyAoVU5TVVBQT1JURUQpIiBpZiBVTlNVUFBPUlRFRA0KPj4+PiArICAgIGRlZmF1
bHQgbg0KPj4+PiArICAgIGRlcGVuZHMgb24gRkZBDQo+Pj4+ICsgICAgaGVscA0KPj4+PiArICAg
ICAgVGhpcyBvcHRpb24gZW5hYmxlcyB0byB1c2UgRkYtQSBiZXR3ZWVuIFZNcy4NCj4+Pj4gKyAg
ICAgIFRoaXMgaXMgZXhwZXJpbWVudGFsIGFuZCB0aGVyZSBpcyBubyBhY2Nlc3MgY29udHJvbCBz
byBhbnkNCj4+Pj4gKyAgICAgIGd1ZXN0IGNhbiBjb21tdW5pY2F0ZSB3aXRoIGFueSBvdGhlciBn
dWVzdC4NCj4+Pj4gKw0KPj4+PiArICAgICAgSWYgdW5zdXJlLCBzYXkgTi4NCj4+Pj4gKw0KPj4+
PiBlbmRtZW51DQo+Pj4+IA0KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RlZS9mZmEu
YyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhLmMNCj4+Pj4gaW5kZXggM2JiZGQ3MTY4YTZiLi5jMWM0
YzA5NTcwOTEgMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS90ZWUvZmZhLmMNCj4+Pj4g
KysrIGIveGVuL2FyY2gvYXJtL3RlZS9mZmEuYw0KPj4+PiBAQCAtMTE4LDYgKzExOCwxMyBAQCB2
b2lkICpmZmFfdHggX19yZWFkX21vc3RseTsNCj4+Pj4gREVGSU5FX1NQSU5MT0NLKGZmYV9yeF9i
dWZmZXJfbG9jayk7DQo+Pj4+IERFRklORV9TUElOTE9DSyhmZmFfdHhfYnVmZmVyX2xvY2spOw0K
Pj4+PiANCj4+Pj4gK3N0cnVjdCBsaXN0X2hlYWQgZmZhX2N0eF9oZWFkOw0KPj4+PiArLyogTG9j
ayB0byBwcm90ZWN0IGFkZGl0aW9uL3JlbW92YWwgaW4gZmZhX2N0eF9oZWFkICovDQo+Pj4+ICtE
RUZJTkVfU1BJTkxPQ0soZmZhX2N0eF9saXN0X2xvY2spOw0KPj4+PiArDQo+Pj4+ICsjaWZkZWYg
Q09ORklHX0ZGQV9WTV9UT19WTQ0KPj4+PiArYXRvbWljX3QgZmZhX3ZtX2NvdW50Ow0KPj4+PiAr
I2VuZGlmDQo+Pj4+IA0KPj4+PiAvKiBVc2VkIHRvIHRyYWNrIGRvbWFpbnMgdGhhdCBjb3VsZCBu
b3QgYmUgdG9ybiBkb3duIGltbWVkaWF0ZWx5LiAqLw0KPj4+PiBzdGF0aWMgc3RydWN0IHRpbWVy
IGZmYV90ZWFyZG93bl90aW1lcjsNCj4+Pj4gQEAgLTE2MCwxMCArMTY3LDIxIEBAIHN0YXRpYyB2
b2lkIGhhbmRsZV92ZXJzaW9uKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4+PiAgICAg
Ki8NCj4+Pj4gICAgaWYgKCBGRkFfVkVSU0lPTl9NQUpPUih2ZXJzKSA9PSBGRkFfTVlfVkVSU0lP
Tl9NQUpPUiApDQo+Pj4+ICAgIHsNCj4+Pj4gKyAgICAgICAgdWludDMyX3Qgb2xkX3ZlcnMgPSBB
Q0NFU1NfT05DRShjdHgtPmd1ZXN0X3ZlcnMpOw0KPj4+PiArDQo+Pj4+ICAgICAgICBpZiAoIEZG
QV9WRVJTSU9OX01JTk9SKHZlcnMpID4gRkZBX01ZX1ZFUlNJT05fTUlOT1IgKQ0KPj4+PiAtICAg
ICAgICAgICAgY3R4LT5ndWVzdF92ZXJzID0gRkZBX01ZX1ZFUlNJT047DQo+Pj4+ICsgICAgICAg
ICAgICBBQ0NFU1NfT05DRShjdHgtPmd1ZXN0X3ZlcnMpID0gRkZBX01ZX1ZFUlNJT047DQo+Pj4+
ICAgICAgICBlbHNlDQo+Pj4+IC0gICAgICAgICAgICBjdHgtPmd1ZXN0X3ZlcnMgPSB2ZXJzOw0K
Pj4+PiArICAgICAgICAgICAgQUNDRVNTX09OQ0UoY3R4LT5ndWVzdF92ZXJzKSA9IHZlcnM7DQo+
Pj4gDQo+Pj4gV2hhdCBpcyB0aGUgQUNDRVNTX09OQ0UoKSBzY2hlbWUgaW50ZW5kZWQgZm9yPw0K
Pj4+IA0KPj4+PiArDQo+Pj4+ICsgICAgICAgIGlmICggSVNfRU5BQkxFRChDT05GSUdfRkZBX1ZN
X1RPX1ZNKSAmJiAhb2xkX3ZlcnMgKQ0KPj4+IA0KPj4+IElmIGhhbmRsZV92ZXJzaW9uKCkgaXMg
Y2FsbGVkIGNvbmN1cnJlbnRseSBvbiB0d28gQ1BVcywgaXQgbWlnaHQgYmUNCj4+PiBwb3NzaWJs
ZSBmb3IgYSBjb250ZXh0IHRvIGJlIGFkZGVkIHR3aWNlLg0KPj4+IEhvdyBhYm91dCBhIHNlcGFy
YXRlIGZsYWcgdG8gaW5kaWNhdGUgd2hldGhlciBhIGNvbnRleHQgaGFzIGJlZW4gYWRkZWQNCj4+
PiB0byB0aGUgbGlzdD8NCj4+IA0KPj4gSSB3YW50ZWQgdG8gYXZvaWQgaGF2aW5nIGd1ZXN0X3Zl
cnMgYXMgYXRvbWljIG9yIGludHJvZHVjZSBhbiBvdGhlciBsb2NrLg0KPj4gQnV0IGkgdGhpbmsg
bm93IHRoYXQgdGhpcyBpcyBraW5kIG9mIGltcG9zc2libGUgdG8gYXZvaWQgYW5kIHRoaXMgd2F5
IHRvIGRvDQo+PiBpdCBpcyB3cm9uZy4NCj4+IA0KPj4gSSB3aWxsIHRha2UgdGhlIGNvbnRleHQg
bG9jayB0byBkbyB0aGlzIHByb2Nlc3NpbmcgdG8gYXZvaWQgdGhpcyBjb3JuZXIgY2FzZQ0KPj4g
YW5kIHJlbW92ZSB0aGUgQUNDRVNTX09OQ0UgdG8gcHJvdGVjdCBtb2RpZmljYXRpb25zIHRvIGd1
ZXN0X3ZlcnM6DQo+PiANCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jIGIv
eGVuL2FyY2gvYXJtL3RlZS9mZmEuYw0KPj4gaW5kZXggYjg2Yzg4Y2VmYThjLi4zMDZlZGI5Nzg2
M2EgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jDQo+PiArKysgYi94ZW4v
YXJjaC9hcm0vdGVlL2ZmYS5jDQo+PiBAQCAtMTU4LDYgKzE1OCw3IEBAIHN0YXRpYyB2b2lkIGhh
bmRsZV92ZXJzaW9uKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4gICAgIHN0cnVjdCBk
b21haW4gKmQgPSBjdXJyZW50LT5kb21haW47DQo+PiAgICAgc3RydWN0IGZmYV9jdHggKmN0eCA9
IGQtPmFyY2gudGVlOw0KPj4gICAgIHVpbnQzMl90IHZlcnMgPSBnZXRfdXNlcl9yZWcocmVncywg
MSk7DQo+PiArICAgIHVpbnQzMl90IG9sZF92ZXJzOw0KPj4gDQo+PiAgICAgLyoNCj4+ICAgICAg
KiBHdWVzdCB3aWxsIHVzZSB0aGUgdmVyc2lvbiBpdCByZXF1ZXN0ZWQgaWYgaXQgaXMgb3VyIG1h
am9yIGFuZCBtaW5vcg0KPj4gQEAgLTE2NywxMiArMTY4LDE0IEBAIHN0YXRpYyB2b2lkIGhhbmRs
ZV92ZXJzaW9uKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4gICAgICAqLw0KPj4gICAg
IGlmICggRkZBX1ZFUlNJT05fTUFKT1IodmVycykgPT0gRkZBX01ZX1ZFUlNJT05fTUFKT1IgKQ0K
Pj4gICAgIHsNCj4+IC0gICAgICAgIHVpbnQzMl90IG9sZF92ZXJzID0gQUNDRVNTX09OQ0UoY3R4
LT5ndWVzdF92ZXJzKTsNCj4+ICsgICAgICAgIHNwaW5fbG9jaygmY3R4LT5sb2NrKTsNCj4+ICsg
ICAgICAgIG9sZF92ZXJzID0gY3R4LT5ndWVzdF92ZXJzOw0KPj4gDQo+PiAgICAgICAgIGlmICgg
RkZBX1ZFUlNJT05fTUlOT1IodmVycykgPiBGRkFfTVlfVkVSU0lPTl9NSU5PUiApDQo+PiAtICAg
ICAgICAgICAgQUNDRVNTX09OQ0UoY3R4LT5ndWVzdF92ZXJzKSA9IEZGQV9NWV9WRVJTSU9OOw0K
Pj4gKyAgICAgICAgICAgY3R4LT5ndWVzdF92ZXJzID0gRkZBX01ZX1ZFUlNJT047DQo+PiAgICAg
ICAgIGVsc2UNCj4+IC0gICAgICAgICAgICBBQ0NFU1NfT05DRShjdHgtPmd1ZXN0X3ZlcnMpID0g
dmVyczsNCj4+ICsgICAgICAgICAgIGN0eC0+Z3Vlc3RfdmVycyA9IHZlcnM7DQo+PiArICAgICAg
ICBzcGluX3VubG9jaygmY3R4LT5sb2NrKTsNCj4+IA0KPj4gICAgICAgICBpZiAoIElTX0VOQUJM
RUQoQ09ORklHX0ZGQV9WTV9UT19WTSkgJiYgIW9sZF92ZXJzICkNCj4+ICAgICAgICAgew0KPj4g
DQo+PiBXaGF0IGRvIHlvdSB0aGluayA/DQo+IA0KPiBUaGF0IHdvcmtzLiBJdCBtaWdodCBiZSB3
b3J0aCBhZGRpbmcgYSBjb21tZW50IHRoYXQgY3R4LT5ndWVzdF92ZXJzIGlzDQo+IGFjY2Vzc2Vk
IHVubG9ja2VkIGVsc2V3aGVyZSwgYW5kIHdoeSB0aGF0IGlzIE9LLg0KDQpJbiBmYWN0IHRoZXJl
IGlzIGFuIG90aGVyIEFDQ0VTU19PTkNFIG9uIGd1ZXN0X3ZlcnMgdGhhdCBpIHdpbGwgcmVtb3Zl
DQphcyBpdCBpbiB0ZWFyZG93biBhbmQgdGhlcmUgaXMgbm8gbmVlZCBmb3IgaXQuDQoNCkkgd2ls
bCBhZGQgYSBjb21tZW50IGluIHRoZSBmZmFfcHJpdmF0ZS5oIHRvIHN0YXRlIHRoYXQgbW9kaWZp
Y2F0aW9uIGFyZSBwcm90ZWN0ZWQNCmJ5IHRoZSBjb250ZXh0IGxvY2suDQoNClRoaXMgY29kZSB3
aWxsIGJlIHJld29ya2VkIGluIHRoZSBuZXh0IHNlcmllIHdpdGggdjEuMiBzdXBwb3J0IGFzIHRo
ZSBndWlkYW5jZQ0KYmVjYW1lIGNsZWFyZXIgaW4gdGhlIHYxLjIgc3BlYyBhbmQgdGhpcyB3aWxs
IHJlbW92ZSBzb21lIGlzc3Vlcy4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQoNCj4gDQo+IENoZWVy
cywNCj4gSmVucw0KDQoNCg==

