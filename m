Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B58A886BE
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 17:18:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950657.1346909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4LZj-0004Dx-8J; Mon, 14 Apr 2025 15:18:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950657.1346909; Mon, 14 Apr 2025 15:18:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4LZj-0004BS-5B; Mon, 14 Apr 2025 15:18:19 +0000
Received: by outflank-mailman (input) for mailman id 950657;
 Mon, 14 Apr 2025 15:18:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bm2T=XA=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u4LZh-0004BK-Hg
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 15:18:17 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20613.outbound.protection.outlook.com
 [2a01:111:f403:260e::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af0e381c-1943-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 17:18:15 +0200 (CEST)
Received: from AS4P195CA0043.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::11)
 by PAXPR08MB7442.eurprd08.prod.outlook.com (2603:10a6:102:2b8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 15:18:10 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:20b:65a:cafe::70) by AS4P195CA0043.outlook.office365.com
 (2603:10a6:20b:65a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Mon,
 14 Apr 2025 15:18:10 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Mon, 14 Apr 2025 15:18:08 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 AS2PR08MB9392.eurprd08.prod.outlook.com (2603:10a6:20b:594::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 15:17:36 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 15:17:36 +0000
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
X-Inumbo-ID: af0e381c-1943-11f0-9eae-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=v00PYA6EWHVfVg8k+woAi/qXTqZGXX2TXQGt5vdwrghgYe31rXJ5ts4OVt06aTXUzvyM+heIirRhXRRnRplNgCD8gIXfiFfvJWzma3jBHkEOjRE4HkdI/uj/uU/gG/GkARGfZu9dNHKdBbVZzRZSidvlV6ijPkpZGFZGyThOqvX4Zl+Lgb6PYI2hrX+giE7DbN7x1s/rO2GHNsMTnFZ8ZZuT4QS8vsae6IimJ6S7RFGSUfgT3fIxieb6zVkGjG39ZqcfO+NHvkgji4SYZM/Gzo62gGmMVa+L8/yxWX11nteRNQluj6DUPVQ/GPQIa341zO92gItyCQndNw+nUIH1YQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+MA1cxj9Cc9vtjGDIpAVEEuIDJnU63CRrVmp05o6aI=;
 b=ec8/nif+CughualCpYQEeFvfn/dz3Yr7FtBeVB1T3n9UZf6emvgXETLiTJOASxdGLHTiqm5Hm0z5uStUTGClDnYN34LCveuQHxhiRha91Ez+4rbnZ3MwnsH7EOEp6mwxJCt44oU7mkXSTSyfRSBaL7fSKgOaDHB8+2GKaaSObGv0a0EEroNLBRtTlu2evAJJBHaVKi7vDG1/EIEiLaZ4SnHnjhU0vGzaMvMN2bwAH2/y1awEEZWKzk/ubWmosWrDIxT3zJgFew2udXeGl4UjBs7BDxfh3PU+bRTAJES9iomsojpO0Xb6vMzzzEhNqTcb/zS3CXDM9nVnZQTjHkdtyA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+MA1cxj9Cc9vtjGDIpAVEEuIDJnU63CRrVmp05o6aI=;
 b=USGFJkR2hBFJuo6k5KjRG1aEAvLwCaT0Lm7VxJYhTYAOB9rWt+vYAkLONiaTNTr1eSmVY2O55k3RUPKZg70Z3uXPsaM47nWjkbxImjz2XAZTU9K1cX5OojBEe8Yqjaa5qtlXdHLCCSe6H0yooW51zX4DgtoVNEKwPR6dDdM7ms4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lhQVoRIUN6ZShbwnEa7HYAR6F6lvMD5NvB/ryPPuNpHZ0imElfQC/D+BXKTXqll3/unx9x9NnVKsunYlAGa14MINDUZm74XwMHWGrt0dns9apbAmpZFIcLt5FFNaoi7mqS9z8gRYvmwysvOEfHwKe8bfGMRZ7HepeRK5rPvq/14vaTMRnJmVzPWjl6u5pnegdeYby6YSDIxnzb9oL5bQRfnLd1DX6q35+sHtmYuWYYqcBkH7WRb1eEfL9fAgfeN6+GS+/VV+APcA5Svy7+vekXFKfC7LNF2HnqOG7kUYnHQcwXjAQumbiL2br+HJnCBwcEUqeOxnmKLtr0q9x4mD4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+MA1cxj9Cc9vtjGDIpAVEEuIDJnU63CRrVmp05o6aI=;
 b=ILUwLfvnwPzj4ia7tD5NW9iFluNkydFcodwzcwrSLXGI75JNca2OpZ5dCOTg8vH/pSPFfLfyxjF4tSxRnLyCDfucreLy15IqEig1/PbcifC8NmX3E9qOMcToU+EGwtm/5JCv1jrqkvH2JdAiV8qMt2rYTGS6BtWF7ppmF9qneu8iejmeCI+/mOt84YavUkM3Y5UEJN0vand6hMfBhzpKxIPFjORj9rG8JjVU1RocFEzBiGsUkpfs0VmzYKZy1Ywa5bhXzjK7Gl/mAb/PQ3zwuwchw606dyI/VlK9zkyDFGMinKxmQcXQKNTDsa2RyJBRawn3QU0F82lDXPEUJkrUWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+MA1cxj9Cc9vtjGDIpAVEEuIDJnU63CRrVmp05o6aI=;
 b=USGFJkR2hBFJuo6k5KjRG1aEAvLwCaT0Lm7VxJYhTYAOB9rWt+vYAkLONiaTNTr1eSmVY2O55k3RUPKZg70Z3uXPsaM47nWjkbxImjz2XAZTU9K1cX5OojBEe8Yqjaa5qtlXdHLCCSe6H0yooW51zX4DgtoVNEKwPR6dDdM7ms4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 7/7] arm/mpu: Implement setup_mpu for MPU system
Thread-Topic: [PATCH v3 7/7] arm/mpu: Implement setup_mpu for MPU system
Thread-Index: AQHbqvIOcqFIKG0Dnkidmosr/dM7hLOjFvuAgAAzsIA=
Date: Mon, 14 Apr 2025 15:17:36 +0000
Message-ID: <4771188E-B307-4452-A900-2ACACC1CE333@arm.com>
References: <20250411145655.140667-1-luca.fancellu@arm.com>
 <20250411145655.140667-8-luca.fancellu@arm.com>
 <923a2fc0-4eeb-4e09-a56d-7471a56fe3bf@xen.org>
In-Reply-To: <923a2fc0-4eeb-4e09-a56d-7471a56fe3bf@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|AS2PR08MB9392:EE_|AMS0EPF000001A7:EE_|PAXPR08MB7442:EE_
X-MS-Office365-Filtering-Correlation-Id: faf8263e-0e69-4201-1d78-08dd7b678ff9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?cTVUWG5VaU9kREQyeHJMTXZhbHNWcjhEeGR2c2NQcUlCcXlVRXkrQlJNSVBU?=
 =?utf-8?B?b3dSMDd3UlV4c3FGK2lVa2hxYmwrRnh1cnFlbzFJNWZzM2Z2WHl2enA5emsv?=
 =?utf-8?B?YmlCaDcrcXZBMlNYYXJnTmIzaFV6SjdZRm1Fa244YWZjM2xVdkRKMU4rR2x2?=
 =?utf-8?B?SVJBMzNjWWVvZGNTVEJ1T3VLNGV6MmZzWElJVE5MeXZzT2pyUm42dXM5dzRu?=
 =?utf-8?B?RWMvZUgvUElSek0wY3J5VzY2eU9lV2t0WkphbGFWYVNyMEJudUxLT2o1cWNG?=
 =?utf-8?B?WnBGdDBROG43RXg0MVdJNlY5OUlqVGRqcUMwajlOY3Z5UDNLclNJbEljNDRP?=
 =?utf-8?B?TGJ3WU1zeVpDVFNldW93ZEJvRFdHTDFGRmR2Z0g1aGhmc2xjanRTWkxwNWZ5?=
 =?utf-8?B?UXlJSEdidDQ4K3duc3pLc2E3OHZoQUJ2TFZwZlBmYi9LMm9SMGEybndTUkxW?=
 =?utf-8?B?MFErdWlreGJmSkc2RlZ1ckhvRUhsZzNpOG5tN0ZIcm9JNVZ6QUpPODFXOTRZ?=
 =?utf-8?B?V2R0UlpueE9mU3ZEUzJEOGtzMTRRa2ZxUkJNT2NGZjlTanFhVTNobFRuUlpi?=
 =?utf-8?B?aUYybEllZXNHM3BpQTREbktSWHdXYVpJVHIxekJrYWVpZHY1Qm01ZjJFRGtY?=
 =?utf-8?B?TDdNQ0ZQRG9ZbmZiT2dUQzJnV0MzSzFKZk1BeFBrdkxtcHQ5c2hlNzh6MmlT?=
 =?utf-8?B?U0NoOWwwYUlGVi82RjVrTjlTWUEyM3gyVU9NNm51dmsrc2ZDaDlHdzZGd0dz?=
 =?utf-8?B?N0Y2Wmp5RE0yOGpGdW1tbzhmQmdnaDJ6VlFyYnZHcGFyK3ZvdHREMjBGZnhU?=
 =?utf-8?B?L1k3YmRYdlhja05EaHhlSndYa1IwNm92Z3BlZzQ1cE5OcmdUbWdzcUllMzM4?=
 =?utf-8?B?by9wdlRxZ2JYdSs0d2IwTjJyZ1Y5ZDdRb1k0UTAvUGszbnlRVjUwY21HcXpR?=
 =?utf-8?B?NDM4d05ZT2RHV082TGV2U1FKcW5KTkdTdDlmb0dKdTRPWHNTRVZKK0pHM3Vl?=
 =?utf-8?B?R0VPZ0lBNzhSeThWT0I2RmVEWlZGVjVPQnpqaVZXc2NpNnZkNk9kcXNQK1ZC?=
 =?utf-8?B?NUFhaUlIRE1tUTBPTldBM0VZaFFQenhTcFBTdDdjRDdwUjRmNFVOdVFHazA5?=
 =?utf-8?B?NDEraEpKN3VhTWM0NmxDWTFHMzZpL1h2b09EQU5oSnBRT01MclhXTGJVdEJk?=
 =?utf-8?B?dm5tWjRHMS9ndGU0d1ZJYjFqbWhodndrbXVENGlqMUJJTmdiSk9OclZXa0d4?=
 =?utf-8?B?d3NiOXhmZEZYTVFPNExOWUhMUWJTNmQwNHo2UWpvOUR1bkVCTXdBd0xKOUxL?=
 =?utf-8?B?NWJPU0xzb0tLeFhJZk4yOS9pQ0JlOThrK2ZoU1lUdGhwUEQxMnA1WEE2YldF?=
 =?utf-8?B?OE15WGpYaGpUb1BwZE15TWVnOW9VMUN4UDQyaGFsR01OSmhOVkZNYkxyTU1v?=
 =?utf-8?B?SWxXNWg2VEk5bXlxQkhycnpzbU9xQ2tkZENwelVLa2ZwY2l6QXVzbWlFdFYy?=
 =?utf-8?B?U1BCdWZJVVhFWitHcW9QWStOQzhPOWE3bHBsLzB5UVBoaW9GSHRaQTBnVW4x?=
 =?utf-8?B?YUhVanY2MlpvZ0RuT2R0WFhhekN3bXZBdElTekx0RE5kL0Vxc1hUaGZrbnhL?=
 =?utf-8?B?bzQ3cXVmdThhNHBmdFVGTWdLZGFlYkVObXljOTZqWmNELzA0UEl6VVZyQVFR?=
 =?utf-8?B?UXMzU09MdGcrMjlacFUzTW45VkREZzQvblR1U1Exa1VkNU5qaVBPbzRLMmtV?=
 =?utf-8?B?SVYzMUdGZVVPanQ2Q2RrLzhXS0tDM2xJUGN5SDRzYjJRbnBSa0VKN3NRVlFr?=
 =?utf-8?B?N0pmTmlzTlRkV0RSSVh4UENYdHhEV3RKU0tZYmpvMmtaVDNwQzdXWHAwMzh5?=
 =?utf-8?B?RjlGN3V3c3hoOGpWMEdFU3F6Vk4ydXZpTDZldHloOU9CZ3VyN1YvTjdNK0hs?=
 =?utf-8?B?blYxM2NpWmdVeVd6dW1oSC9CZ1Byc081MFdCOUJZaTBSaERtUmwvY2dqUHBI?=
 =?utf-8?B?RWs5SEUzZmpBPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <23241DB27576D246A6C512A932622146@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9392
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1bd3ceb7-a160-42b2-b849-08dd7b677cd1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|35042699022|82310400026|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N20rZVRzQ3hldHNTMmhVVTZVRUo4TW5KcEdGa3l3L2pnc3JUVjJCaWdRK1dj?=
 =?utf-8?B?UG5zaXFDOUJySWlNR0MraG9hNFlkSjdIeFFCUDVWK29sNGptQjJhdmZlQUNS?=
 =?utf-8?B?QldhQUl6eWczN3J5WWhSNlltS3BJeXFuOVB2TnE1OTVjNVBLK3llSlpNV2hP?=
 =?utf-8?B?ZndXZFZjTmRoOU5sWVo5SUJ3R2RhVVcxcWhxaWR0WHFkdjBNTHZTajhOZGtj?=
 =?utf-8?B?ZEVWUUJYTk5VVlIwWHNsK2FQVTlZSlNNdG5WMHZJUkNPSVFZazljUzA0UjdJ?=
 =?utf-8?B?LzNpMzRCQzk1blN1S0V6Wkl3b25NOHR0WnpxcmZTcXZZOE9Fb28xNzNuZlJI?=
 =?utf-8?B?cEN0YVYrQVhIdUdzalBMZmoxRFRuN1UwQnNZK3Q5dEhVQXduTWhpQTFVYUxu?=
 =?utf-8?B?ZG00Rnh3MWMxYzRMZ0RFQW9JaTczc3h5WTNtVWZnUlZmVkV5bC9OSzI1dGNY?=
 =?utf-8?B?N0ZWNzJQTXhvbGRLdVVOc1hyOUhrYWs4UnRUUS95NTZ3NnRLZGtBbHp6d3J3?=
 =?utf-8?B?RGp2WU5Mb3hpODVnS0szT3RRR09VTVNOUXlxczdlcXEzRGpOUFNBTnF5YkNo?=
 =?utf-8?B?UjBFdFJROGYrY3pHVk1nSDlJNkVPcGN0R2k5dVZXQlJ3U2ljNmVFWVJ6cEVi?=
 =?utf-8?B?OGNJa1ZXazUvNjJNc3pVVm5PVzZxcDRLWHkvMEhLa1B0c0lVVlV4WnNpQWQ0?=
 =?utf-8?B?b3JoY240YmFCMEZNLzhmeGdQeEZQZDljZlhGelRyTi9yTy93YWFjaEp6Vk1H?=
 =?utf-8?B?U0FBQ3ZJcmQ1anp2YnpSaDZ4RjhkaFJaUzhMeWhmbHNFN0RITU9TQVh3bmNj?=
 =?utf-8?B?UCtrLy9WV3BHSUJxaDhyVG9xR3p2Tzl6L3hNeW1hQmVtNXZ4bG9EUHZwYzdl?=
 =?utf-8?B?YVA2YUFQWXRIRXZpWXFGUUV3K202cGkyOEd3bVBpZTJqbWE5TUFLVnRPZFZy?=
 =?utf-8?B?ZG5MUGVWWTkyZEVPWTZudFF3NE5FOStZQTU4Sy82TTJyMVBtcndxckFqUzZy?=
 =?utf-8?B?ZzhLRno2TEsxOWhCR2tQaHhnU3NoQU1MMnJYcVpVWTI4d1RrNnhDMXR6TXJ5?=
 =?utf-8?B?Z25TVkY5YW9HaEdMbjEzRW1pRjJSRXBzc3UvcjV5SXVkclR1Yjd6c2l4dGZ2?=
 =?utf-8?B?a3BxNll4cnd4b1BidG56TVJEWTdhSGVTc2RJWENSVGFVSDRmT1F5dWthbGpS?=
 =?utf-8?B?cUR0QStndzNHdEUxakZZWGlkbW9kL0lreWZlWnM2NVM2VFpLQWtCUFlLdmF0?=
 =?utf-8?B?am44emJXOUFmSFVyV1dCQVNweGE3YzRkbHp6R3BQdGM2QW12dHluY0VhQ3hk?=
 =?utf-8?B?bHlYY1VzdEo0bXdpaW9RS3p5UjNmd05NeDdLemMzVnFaSndyM3FneWMrR2Qx?=
 =?utf-8?B?VklCVk1uM2RUUTY1S0JyY0RrZXJtakdyUEh4Wm82TU9qTkVZSGIrZ25CUFR6?=
 =?utf-8?B?S01RYTIrWFoxdlgzckg0bFBCbWl0bkNobm5KeEdzYmJJZDk2Y3ZlQTg5TXB6?=
 =?utf-8?B?V2J5OWsvSEhpeE9velZvY0QzZkhwaUJ5QktjYk5leG05akVNNE1ieUdJU1RH?=
 =?utf-8?B?S2pkWDZ6eEFFczZvMkNoc3ljNlAxSGZpc3pNVCtHd04rMmdQaUtxUm15NjRX?=
 =?utf-8?B?elVWUGpYMzN1QkFkREtVRkZlNTZIQU5ZQkNCU092QlVqVisvSVdmMlVJaUl0?=
 =?utf-8?B?aENvbFNreW5vK1F3RVp5OUFvY3M5RHd4RjlDMVNkQ1RjdEc3bmxaSjB3cjRo?=
 =?utf-8?B?TGc1elo5ZHBIZVFudmtLbEN2VUpWRGRTa2xBWVhVTCtlRlI4Qnh6ZmxQMVpz?=
 =?utf-8?B?ZU1qb1QvWWhyRFRoMFUwcy82NFJuV2pWRmFrOTVuU0J1eFBDc0htenc0MmJQ?=
 =?utf-8?B?bmhnUlFUYUJNNURJczNHUmRGd3FWT0dxdUUxT2ZPNCtwQ1h5cTZQSEVqV2x4?=
 =?utf-8?B?ckFlN0dLYkxuNFNWRHRWQWR1ejlVRzdaa2pYR3NMNEg3S0tURG9WcDdYRkdH?=
 =?utf-8?B?TllqdU9Ia20vajVFOExhNzdBOVp0MkdpSVNIWU5uZk9NSmVUKzFmTHMwZjVh?=
 =?utf-8?Q?Pj/Ma2?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(35042699022)(82310400026)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 15:18:08.2856
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: faf8263e-0e69-4201-1d78-08dd7b678ff9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7442

SEkgSnVsaWVuLA0KDQo+IE9uIDE0IEFwciAyMDI1LCBhdCAxMzoxMiwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBMdWNhLA0KPiANCj4gT24gMTEvMDQvMjAy
NSAyMzo1NiwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+IEltcGxlbWVudCB0aGUgZnVuY3Rpb24g
c2V0dXBfbXB1IHRoYXQgd2lsbCBsb2dpY2FsbHkgdHJhY2sgdGhlIE1QVQ0KPj4gcmVnaW9ucyBk
ZWZpbmVkIGJ5IGhhcmR3YXJlIHJlZ2lzdGVycywgc3RhcnQgaW50cm9kdWNpbmcgZGF0YQ0KPj4g
c3RydWN0dXJlcyBhbmQgZnVuY3Rpb25zIHRvIHRyYWNrIHRoZSBzdGF0dXMgZnJvbSB0aGUgQyB3
b3JsZC4NCj4+IFRoZSB4ZW5fbXB1bWFwX21hc2sgYml0bWFwIGlzIHVzZWQgdG8gdHJhY2sgd2hp
Y2ggTVBVIHJlZ2lvbiBhcmUNCj4+IGVuYWJsZWQgYXQgcnVudGltZS4NCj4+IFRoaXMgZnVuY3Rp
b24gaXMgY2FsbGVkIGZyb20gc2V0dXBfbW0oKSB3aGljaCBmdWxsIGltcGxlbWVudGF0aW9uDQo+
PiB3aWxsIGJlIHByb3ZpZGVkIGluIGEgbGF0ZXIgc3RhZ2UuDQo+PiBTaWduZWQtb2ZmLWJ5OiBM
dWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQo+PiAtLS0NCj4+IHYzIGNoYW5n
ZXM6DQo+PiAgLSBNb3ZlZCBQUkVOUl9NQVNLIGRlZmluZSB0byBjb21tb24uDQo+PiAtLS0NCj4+
IC0tLQ0KPj4gIHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tcHUuaCB8ICAyICsrDQo+PiAgeGVu
L2FyY2gvYXJtL21wdS9tbS5jICAgICAgICAgIHwgNDkgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLQ0KPj4gIDIgZmlsZXMgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQ0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tcHUuaCBi
L3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tcHUuaA0KPj4gaW5kZXggZWJhNTA4NmNkZTk3Li43
N2QwNTY2Zjk3ODAgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbXB1
LmgNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tcHUuaA0KPj4gQEAgLTIwLDYg
KzIwLDggQEANCj4+ICAjZGVmaW5lIE5VTV9NUFVfUkVHSU9OU19NQVNLICAgIChOVU1fTVBVX1JF
R0lPTlMgLSAxKQ0KPj4gICNkZWZpbmUgTUFYX01QVV9SRUdJT05TICAgICAgICAgTlVNX01QVV9S
RUdJT05TX01BU0sNCj4+ICArI2RlZmluZSBQUkVOUl9NQVNLICBHRU5NQVNLKDMxLCAwKQ0KPj4g
Kw0KPj4gIC8qIEFjY2VzcyBwZXJtaXNzaW9uIGF0dHJpYnV0ZXMuICovDQo+PiAgLyogUmVhZC9X
cml0ZSBhdCBFTDIsIE5vIEFjY2VzcyBhdCBFTDEvRUwwLiAqLw0KPj4gICNkZWZpbmUgQVBfUldf
RUwyIDB4MA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tcHUvbW0uYyBiL3hlbi9hcmNo
L2FybS9tcHUvbW0uYw0KPj4gaW5kZXggNjM1ZDFmNWEyYmEwLi5lMGE0MDQ4OWE3ZmMgMTAwNjQ0
DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vbXB1L21tLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9t
cHUvbW0uYw0KPj4gQEAgLTE0LDYgKzE0LDE3IEBADQo+PiAgICBzdHJ1Y3QgcGFnZV9pbmZvICpm
cmFtZV90YWJsZTsNCj4+ICArLyogTWF4aW11bSBudW1iZXIgb2Ygc3VwcG9ydGVkIE1QVSBtZW1v
cnkgcmVnaW9ucyBieSB0aGUgRUwyIE1QVS4gKi8NCj4gPiArdWludDhfdCBfX3JvX2FmdGVyX2lu
aXQgbWF4X3hlbl9tcHVtYXA7DQo+IA0KPiBBcmUgdGhpcyB2YXJpYWJsZSBhbmQgLi4uDQo+IA0K
Pj4gKw0KPj4gKy8qDQo+PiArICogQml0bWFwIHhlbl9tcHVtYXBfbWFzayBpcyB0byByZWNvcmQg
dGhlIHVzYWdlIG9mIEVMMiBNUFUgbWVtb3J5IHJlZ2lvbnMuDQo+PiArICogQml0IDAgcmVwcmVz
ZW50cyBNUFUgbWVtb3J5IHJlZ2lvbiAwLCBiaXQgMSByZXByZXNlbnRzIE1QVSBtZW1vcnkNCj4+
ICsgKiByZWdpb24gMSwgLi4uLCBhbmQgc28gb24uDQo+PiArICogSWYgYSBNUFUgbWVtb3J5IHJl
Z2lvbiBnZXRzIGVuYWJsZWQsIHNldCB0aGUgYWNjb3JkaW5nIGJpdCB0byAxLg0KPj4gKyAqLw0K
Pj4gK0RFQ0xBUkVfQklUTUFQKHhlbl9tcHVtYXBfbWFzaywgTUFYX01QVV9SRUdJT05TKTsNCj4g
DQo+IC4uLiB0aGlzIG9uZSBtZWFudCB0byBiZSBnbG9iYWw/IElmIHllcywgdGhlbiB0aGV5IG5l
ZWQgdG8gaGF2ZSBhIGRlY2xhcmF0aW9uIGluIHRoZSBoZWFkZXIuIElmIG5vdCwgdGhlbiB5b3Ug
d2FudCB0byBhZGQgJ3N0YXRpYycuDQoNCnllcyB0aGV5IGFyZSBtZWFudCB0byBiZSBnbG9iYWws
IEnigJlsbCBhZGQgYSBkZWNsYXJhdGlvbiBpbiB0aGUgaGVhZGVyLg0KDQo+IA0KPiA+ICsNCj4+
ICAvKiBFTDIgWGVuIE1QVSBtZW1vcnkgcmVnaW9uIG1hcHBpbmcgdGFibGUuICovDQo+PiAgcHJf
dCB4ZW5fbXB1bWFwW01BWF9NUFVfUkVHSU9OU107DQo+PiAgQEAgLTIyMiw5ICsyMzMsNDUgQEAg
cHJfdCBwcl9vZl94ZW5hZGRyKHBhZGRyX3QgYmFzZSwgcGFkZHJfdCBsaW1pdCwgdW5zaWduZWQg
YXR0cikNCj4+ICAgICAgcmV0dXJuIHJlZ2lvbjsNCj4+ICB9DQo+PiAgKy8qDQo+PiArICogVGhl
IGNvZGUgaW4gdGhpcyBmdW5jdGlvbiBuZWVkcyB0byB0cmFjayB0aGUgcmVnaW9ucyBwcm9ncmFt
bWVkIGluDQo+PiArICogYXJtNjQvbXB1L2hlYWQuUw0KPj4gKyAqLw0KPj4gK3N0YXRpYyB2b2lk
IF9faW5pdCBzZXR1cF9tcHUodm9pZCkNCj4+ICt7DQo+PiArICAgIHJlZ2lzdGVyX3QgcHJlbnI7
DQo+PiArICAgIHVuc2lnbmVkIGludCBpID0gMDsNCj4+ICsNCj4+ICsgICAgLyoNCj4+ICsgICAg
ICogTVBVSVJfRUwyLlJlZ2lvblswOjddIGlkZW50aWZpZXMgdGhlIG51bWJlciBvZiByZWdpb25z
IHN1cHBvcnRlZCBieQ0KPj4gKyAgICAgKiB0aGUgRUwyIE1QVS4NCj4+ICsgICAgICovDQo+PiAr
ICAgIG1heF94ZW5fbXB1bWFwID0gKHVpbnQ4X3QpKFJFQURfU1lTUkVHKE1QVUlSX0VMMikgJiBO
VU1fTVBVX1JFR0lPTlNfTUFTSyk7DQo+PiArDQo+PiArICAgIC8qIFBSRU5SX0VMMiBoYXMgdGhl
IE4gYml0IHNldCBpZiB0aGUgTiByZWdpb24gaXMgZW5hYmxlZCwgTiA8IDMyICovDQo+PiArICAg
IHByZW5yID0gKFJFQURfU1lTUkVHKFBSRU5SX0VMMikgJiBQUkVOUl9NQVNLKTsNCj4+ICsNCj4+
ICsgICAgLyoNCj4+ICsgICAgICogU2V0IHRoZSBiaXRmaWVsZCBmb3IgcmVnaW9ucyBlbmFibGVk
IGluIGFzc2VtYmx5IGJvb3QtdGltZS4NCj4+ICsgICAgICogVGhpcyBjb2RlIHdvcmtzIHVuZGVy
IHRoZSBhc3N1bXB0aW9uIHRoYXQgdGhlIGNvZGUgaW4gaGVhZC5TIGhhcw0KPj4gKyAgICAgKiBh
bGxvY2F0ZWQgYW5kIGVuYWJsZWQgcmVnaW9ucyBiZWxvdyAzMiAoTiA8IDMyKS4NCj4+ICsgICAg
IA0KPiBUaGlzIGlzIGEgYml0IGZyYWdpbGUuIEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIGlm
IHRoZSBiaXRtYXAgaXMgc2V0IGJ5IGhlYWQuUyBhcyB3ZSBhZGQgdGhlIHJlZ2lvbnMuIFNhbWUg
Zm9yIC4uLg0KDQpTbywgSSB3YXMgdHJ5aW5nIHRvIGF2b2lkIHRoYXQgYmVjYXVzZSBpbiB0aGF0
IGNhc2Ugd2UgbmVlZCB0byBwbGFjZSB4ZW5fbXB1bWFwIG91dCBvZiB0aGUgQlNTIGFuZCBzdGFy
dA0KbWFuaXB1bGF0aW5nIHRoZSBiaXRtYXAgZnJvbSBhc20sIGluc3RlYWQgSSB3YXMgaG9waW5n
IHRvIHVzZSB0aGUgQyBjb2RlLCBJIHVuZGVyc3RhbmQgdGhhdCBpZiBzb21lb25lDQp3YW50cyB0
byBoYXZlIG1vcmUgdGhhbiAzMSByZWdpb24gYXMgYm9vdCByZWdpb24gdGhpcyBtaWdodCBicmVh
aywgYnV0IGl04oCZcyBhbHNvIGEgYml0IHVubGlrZWx5Pw0KDQpTbyBJIHdhcyBiYWxhbmNpbmcg
dGhlIHByb3MgdG8gbWFuaXB1bGF0ZSBldmVyeXRoaW5nIGZyb20gdGhlIEMgd29ybGQgYWdhaW5z
dCB0aGUgY29ucyAoYm9vdCByZWdpb24gPiAzMSkuDQoNCklzIGl0IHN0aWxsIHlvdXIgcHJlZmVy
cmVkIHdheSB0byBoYW5kbGUgZXZlcnl0aGluZyBmcm9tIGFzbT8NCg0KQ2hlZXJzLA0KTHVjYQ0K
DQo=

