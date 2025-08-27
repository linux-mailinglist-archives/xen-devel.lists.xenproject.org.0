Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAF6B3823E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 14:27:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095980.1450803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urFEW-0001e5-0k; Wed, 27 Aug 2025 12:26:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095980.1450803; Wed, 27 Aug 2025 12:26:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urFEV-0001c7-UF; Wed, 27 Aug 2025 12:26:31 +0000
Received: by outflank-mailman (input) for mailman id 1095980;
 Wed, 27 Aug 2025 12:26:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mrvt=3H=arm.com=Hari.Limaye@srs-se1.protection.inumbo.net>)
 id 1urFEU-0001ba-LF
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 12:26:31 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bf52b46-8341-11f0-ae26-e363de0e7a9e;
 Wed, 27 Aug 2025 14:26:24 +0200 (CEST)
Received: from DU2PR04CA0276.eurprd04.prod.outlook.com (2603:10a6:10:28c::11)
 by PAXPR08MB7576.eurprd08.prod.outlook.com (2603:10a6:102:23e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 12:26:22 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::77) by DU2PR04CA0276.outlook.office365.com
 (2603:10a6:10:28c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.15 via Frontend Transport; Wed,
 27 Aug 2025 12:26:22 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.11
 via Frontend Transport; Wed, 27 Aug 2025 12:26:21 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com (2603:10a6:20b:55d::22)
 by DB9PR08MB7558.eurprd08.prod.outlook.com (2603:10a6:10:305::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 12:25:45 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5]) by AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5%5]) with mapi id 15.20.9031.019; Wed, 27 Aug 2025
 12:25:45 +0000
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
X-Inumbo-ID: 0bf52b46-8341-11f0-ae26-e363de0e7a9e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TT8gz4LpNNm9PGZ3O9Sqi3VUmasrreOIqFb10iZlFM09C9IlK1MOVotA0lZezQP0GXPGEQwn7amttgeeLDaacTRuGsJcPBvsEruTos3OZWJ84+wzXG+T8VBmqwp096Uw511VzCTYSodmhPKIUMsJUxO8GWdhJwU350YVE5Nc1fQ9Crc7rtYPAt1VtPc0NamngELW7R56QV3Qe3ABQcd3tELg/9npIc9Bn4XgcPr7zAj4xoZfqriwGjHQf21d2myVdN3R3A2GoejysZCQAIhOPZyrB0LXb6pWSknPNm+6AUwlvFIBjgK6ysB8gWzIlExUTrwQBQwYf4tyy1V6aY1UeQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKmhsdNUzQbr3Ja1zHQ/k6AJXdET1rTC4/GgK9+u1Ts=;
 b=EJ5W4G7ETRvUEmImdh3ajartoslDksez13I3eqDS1sMMzr/H8cZVlhQF5wJf1uGUOtf+VxYHtAslJh8GcnuqoCxpVwJYjuY8DEauFzXdNsUVMCMAbagK2b3+u231rfKmyaJOjzyYTdQA0x6NYhQm1nyLxAoNqZhJWjd5k9z89oQxaPBeNFQ5x1IWvLGLBlLnDPXlzwxuea5UKdUZgm1mjcc6bVfiM74ghayTL9QMfM5HIInmKyImsgAFxotpioUofL/cP56oPn2FmffQI+9o767LKJyO3UH4pPbi1GrJM6A+jk0WUlrZFfH/BPEoHKg2L6Q1eC5sjP+al/YL+eoa1g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKmhsdNUzQbr3Ja1zHQ/k6AJXdET1rTC4/GgK9+u1Ts=;
 b=Tc7KIypJb/NqvZn1swghK3sz7nNdvLHKzx/ZtyRTwc3/WONEn8ydZuDlmW+xqSyPeFWdqCFYhcHVSXjEy/uce+QJn0vobSLQOaYLPwzoH+vcEvaxbljw5InagbNK/NkazqHvD+dr0P6p4NaJahSGLpFMioCJKQMu0NZQ9wKbSy0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lZEat4D1Ufu/LBe7j5fEI7EA8DvUhGNixFYVR8AhzpTVe7IXrwbcwoh1KJHs2EgZNjze4tg/6wGO4+mr0zNf21D2Zo2xBbswhuxGKIVKvzgv91jrVtm81gQuUm/cnZfq11oAWozUJoZ8wp+KrCZmFxKqjFxbE9clHM5kBUWox2QlYS8z0dzoXvAYRuHChNO6h44RtTTvO3F5nPIKBnhwh9BEc1Mw0FNsr6V9lRKCOJ8/OGWIs2kMZRtufwn1NKBRORDZCvle9uRapXU5gMsp+E+6G2dTXvrzMOaLXntwr40j3NYgzkfJwOMSNQ7bsAN2bhNTaZpOLUaM4tsZCpQ9/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKmhsdNUzQbr3Ja1zHQ/k6AJXdET1rTC4/GgK9+u1Ts=;
 b=GdFBhAPROU/tvfQcviyGYySznWMDRr0J35giTPBZ96BzryND6di4O7eJBb/AZdItTG1e2kxOpD60WxDvIFwzw5aVNUPpcU9pOXQf0CUHGYnWXDW8sNQhf+oHIAGrYKZghu1fqy6dVVAgGUcOgJAWx0epDd/UPhg6GPr1B+jFXGjIJYvnD4D9DhzeqOtsBsKuBCsIpuYsxI50CdQOmb6SwLcMhBDC1zJS3HDQ08LTliSjENk6HqAaYoxdbUCjd8HS+R3ZPv3sQ8ok8fFQ1AqrN7x/U3dB1WESMrgPp6Tzdwwo5OwF+pmiDPKB0DTv67bSkPcsGys+c4XIjTslbcQMmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKmhsdNUzQbr3Ja1zHQ/k6AJXdET1rTC4/GgK9+u1Ts=;
 b=Tc7KIypJb/NqvZn1swghK3sz7nNdvLHKzx/ZtyRTwc3/WONEn8ydZuDlmW+xqSyPeFWdqCFYhcHVSXjEy/uce+QJn0vobSLQOaYLPwzoH+vcEvaxbljw5InagbNK/NkazqHvD+dr0P6p4NaJahSGLpFMioCJKQMu0NZQ9wKbSy0=
From: Hari Limaye <Hari.Limaye@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Luca
 Fancellu <Luca.Fancellu@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 4/5] arm/mpu: Implement ioremap_attr for MPU
Thread-Topic: [PATCH 4/5] arm/mpu: Implement ioremap_attr for MPU
Thread-Index: AQHcEzkCJOS9/PWe+UmuJdsGAsOPLbR2dO0A
Date: Wed, 27 Aug 2025 12:25:44 +0000
Message-ID: <D815DF92-F23B-4016-84F0-04826A61F684@arm.com>
References: <cover.1753864612.git.hari.limaye@arm.com>
 <ad8cc76fb027efa52e0eb51f6ba7a918fad0ae52.1753864612.git.hari.limaye@arm.com>
 <7b0d40b6-667b-4bce-89b9-397a647b48f2@amd.com>
In-Reply-To: <7b0d40b6-667b-4bce-89b9-397a647b48f2@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS2PR08MB8745:EE_|DB9PR08MB7558:EE_|DB1PEPF000509FA:EE_|PAXPR08MB7576:EE_
X-MS-Office365-Filtering-Correlation-Id: d2814177-3fa3-4aa2-da62-08dde564eea0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?bE13ME91RjVuYWdiRi9WSzhRTC9GVWdXS0ppQlhHSDlzMFNCd2IrbG85RGRR?=
 =?utf-8?B?alU0ZlJUeDNNVGVUT2RxYzR6V1N5K1dsT3UvakNPcGFMc1NPd1ZlQ1EwU0Zp?=
 =?utf-8?B?dVk1Y0oxd201cmFzbkNZV0x6ZXU5RDZQSlZRemJsblJrUFNKVDVTUzh5V1FP?=
 =?utf-8?B?dlQrL0I3eFBwdC9DWUt3UllmckFaVG1xS0RIYXNneExrWDRpK3NJZ2RyYkVs?=
 =?utf-8?B?TjZSM1JQZHZoT3UzWEdUdnRCbkVvSTR6M0w1YStreTQ1UEU3Y3M4NWpITzFV?=
 =?utf-8?B?ZnY2QWNRN2xzRi9Ub1ZCY2tScVU1RGZ2RkNaZ1JlTU5SOFByQUZLbEQ0eFZK?=
 =?utf-8?B?dHJ3WmpYY0xOcHYvd3pCeTNaa1dGblFxemZSMk16S1Yyay9YRXdlMEZHb3M0?=
 =?utf-8?B?cXFIbUhMelJOQ0pIcU5CQU9wZXJ5bHduekdiY3NHWHFkbG5rOGJkaEZ4VVZR?=
 =?utf-8?B?RlVXUzUrN2JzNUE1VUFnM3ZsZ1dwekwyQmxENDVkU1pvOExPWkJXaDMrc2xm?=
 =?utf-8?B?TkY3L2VZNERjcU5NV05qZjY2YXNIcTFEZVhjQjdlLzU5QzlwUmplNEgzdnZC?=
 =?utf-8?B?T0RCcEMwbTJNQjd2OUNZOWtZK2RESjRXczk4Q3FaUk5kdHJqc0JCSk9GZ3ZU?=
 =?utf-8?B?Nkt0bGsrdU5FOFJHR2k5TlAwOEFYT3hKR3VXdk03aEdrV2FqZk5rc1hESXVh?=
 =?utf-8?B?ZEZFNjRWSTVIWWM5Y3kyY0o4dlZXQ0NzMGpXSDdXWXcwNW1rRThvd2tXaWlU?=
 =?utf-8?B?VVNUa2hHQnF4QWRpeVZKUWt1VkswRTdneHVCeEZmbGFsVlQ5NmFKc0dFUnNu?=
 =?utf-8?B?SGZWc04zZFB2cGZHRFlBQ25sT3lxUHo0WDZxWGRJLzFhRG43a1Zsb3EvYlNw?=
 =?utf-8?B?ZHBQRVU2MDNDLy9ic0gwa3N1VzNPa1JDdHgxL0dPRVBaZzBWTm9Qa0tabVN6?=
 =?utf-8?B?T1dvNmhNTld6Qi9sQVpWSXM4Qm91Y3BBOGpKRnN5cEY3Nk5xZGJvZXFQMllx?=
 =?utf-8?B?WjVHTVFySitrMEpKell2V0ZDYk1DVDQ1bmMzUWNnd0Q4NjVkYkVGdTYrYXZJ?=
 =?utf-8?B?TFM2WldWaTRhMktZRjNTRW9YNEtzbTZNMkNTN2lFdnM5S2F6R3VrTUZpay9Z?=
 =?utf-8?B?ME9VMjBnOVhHdkxaenJPS3M1bXhpNTZraEhhdWY4cnFkSHNkZksvcDYyYSsw?=
 =?utf-8?B?eXFobk1ZWW8wWE9Eby90NGxyWGxiYjhZTDFqd0NnQm16aTBWRDE2d2JjdlJU?=
 =?utf-8?B?bHRuSHlIZGNuY0Z4VERSWHNGU2xEN2tnM0dQOW01aGRKeFMreTRkbDB6Z1NG?=
 =?utf-8?B?empJSS9EbWRJbndQbEhrUEYwTEROMEhvNTR4S2ZUd0Vqb2R6aWRReWZPTk85?=
 =?utf-8?B?OFNHZnJGVVBsczZmUkZ0SjhoTm9pb3c1dnZucFhadlZ1by9Xc2E2b1d4RnNB?=
 =?utf-8?B?RDEvK3Mydkd2OVJSellRclhkOTkzbTk4UUVXMmpUT0V4Tnpxa1N1SW1mLzR5?=
 =?utf-8?B?eFV1dmkyS1hyM1FHS2lhckZQWmhrcm1XOVdTWnJvS1pBaTdERmJRTVFMQm9P?=
 =?utf-8?B?MkJNZHRubDlOb1VNbytiWDNBK3VBZnhCNDRUV241amtQNUdJU3plVzN1ck5J?=
 =?utf-8?B?M05YMjZOTEFrWkFiQ1hTbmJBOERnMCtBYmRSWStkQjRPWmIxdFB0OUxjQVhu?=
 =?utf-8?B?VTM1RkVqKzNCVVBrekNTUjNuRURFbjBRejE5N0t5NXFPaHpsYmdKVlZEOXFV?=
 =?utf-8?B?b1JFbUQxUDFIQWdLeU1YRktSWlhzUm1ZcHRHZmRoTzFUTFpma0QrTmd3aGZY?=
 =?utf-8?B?RjRoTE9CdFR3UWxOemxZKzNPQ0MvODJQTDg0elg5MnYzd1FLRWlNUUYrTllW?=
 =?utf-8?B?V0NPYmNFaStCLzVhL3lRbUFDeHgzaENWWFVRZnJCUENHcWU5U3YvMUhyTFVH?=
 =?utf-8?B?OUhBYml6TEZGYlJrSmR1dU9vZWxkRHoydEUvaFE0dEYwUE9LRkZUWDlsUHpa?=
 =?utf-8?B?VWhmMEdWOFBRPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5FE279E13DF2F4F9C9A310CB50DF90A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7558
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4a12083b-a1d5-4b83-a554-08dde564d8a2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|376014|14060799003|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SXpxK1FQaEpZYTBndXJxNi9jUXgxKzlXeldSMVZIQlpPS0daNUVzSlVJYURB?=
 =?utf-8?B?U2JJSFA5Z29jS0ZNcU9na3QzYk9iWFlEdXRjUmpsRmQ5T0t2VmNxaDl5SCtk?=
 =?utf-8?B?TmkxZWdkak13Z0pQbzRXS2xJakhCbGRKR1B1K2p4Rk9ZSW5aTDZBeEVnZGhS?=
 =?utf-8?B?YUlaSDBlaEtlNUoxQ2RWaUR5WmpVY3F6dEFzSFgrUFRTaTlaWnZMRFM3L3BE?=
 =?utf-8?B?MXlRMDF2bjdqTGs5UUppNDI1Q0xCRHNDQWFlU3AvWWtnSzIrd0REa25YUEdB?=
 =?utf-8?B?MVpobGFZVzExaEordml2d1dESkdPWS81eEdSVC9XODdBRG9KQkhtTTR1Wk8w?=
 =?utf-8?B?RENuVGFsTU5qN2tEVXF0emRvWlZJRm5PWWVCQnlXQ1hUSGdGeUdzQ2ZJTVhx?=
 =?utf-8?B?d0R2Y2FUNE5KUW9Cc0VOUXBObHdZN0xvUFM5YmNjeHMzcWN0cFlxRTVyekxh?=
 =?utf-8?B?NVdFbFNSRVM1OE1ZMFF0ZzVQTXBzWmZMd3R3dHA2Tlh2dXVZU3liME96YS9X?=
 =?utf-8?B?Q1hZQ3RXTEYzS3FIa2owdkNneGdJelVES3J4R05rd1BJZk0xS3JXT203V1ho?=
 =?utf-8?B?RjRWNEJsai94Zml5alA0a2V4aGJjOFRkMXpJbE1kbTFkV1pGcFNhNytRaFM5?=
 =?utf-8?B?bkkwVkw2NG9ML0lxK2l2TTJ5M3cxaVNOU2NtQXJ6bHo3ZDRsMEJ6YXZEME5K?=
 =?utf-8?B?dGlLVjVpSVBla1phbHNUcE96Z05YRTlvRDRGWk0ydUQvcDMvbTNnZnFlWE9Z?=
 =?utf-8?B?cFFVTjZLM0liS1VPNHoydFVtb0tsbmR4Q1lHa2lIK1JuYUk4bEdNUVhaY1pq?=
 =?utf-8?B?SU93K0lYdlZCaHF6ZmNCa1N5cEZnREl2dVBGWHJxVUtPbDdGTHBYTFZJYkVD?=
 =?utf-8?B?bkdCa1pNamJWdjJWSnkveU1XeWJNeVpUSCtuWWhwTVVPN2VnL2hVeWRCL0Ro?=
 =?utf-8?B?MkRDQUF4M1krb2lOVkZkdUlzY1g5NWR6b1l1MWQrenFRc0ZHNEw1SzRjaE16?=
 =?utf-8?B?cktRNXIvbk5jYVE1ektZRVp4bzB4MTVTVVFXSU0xVjFBVUthY0tVUmN2TXhz?=
 =?utf-8?B?bVA1S0ZMNFRPV053OWhOdVhhU3p3QlNqMHRJS3hlM2xEdklPdGg4cjZBaXY3?=
 =?utf-8?B?aEJneUgxRDZGdThHa1lBN3ExckFMSS9FVnNkSEdCL0lZayt6Y2dJTHYxakF5?=
 =?utf-8?B?LzhIazJiSWhIaURYZHNPNFU5ajRKUzl6UHc5b0dYN3ZiTzBuK1BZcWxZV2Fl?=
 =?utf-8?B?d2VzNTlPNlM1cm4zSlJla0hpcTFOVElOUVQ4RUpJcmRzYmFGWWlPRjVQQ3Mv?=
 =?utf-8?B?aDFQak9pNldJdi9kSTNKY0RmWGl6My9LdURFbUVvK0JkZlVpOUo1NTUxNmF4?=
 =?utf-8?B?T25HMDhKSWo3MGRkekpCK1VnSG9uQkc0VlA5Wjl6aS9BWHBpNGRhTzNid2dE?=
 =?utf-8?B?N2VwTm1XaE5qQVRpZnBRQUJmaGJwSnlCcXA2UDFVaEppQlhEc1V4Q29Db1pY?=
 =?utf-8?B?WmpXVld2cTR2WW5VUjVsUzZ4QnVYUGhSLy9VZXdVUUVzSVhvN3lxRnhPbHNy?=
 =?utf-8?B?ZUJ4NFAwamw2eUlISDY1aFBRRGUwOXFtbHNldklSYVpXdTFLMzhrME5QalJB?=
 =?utf-8?B?SUdpWnJjOUlWbzNVTk1BU2RMUER2NDVxWHhlQ09XUVAramowZ01taXQ0c1F2?=
 =?utf-8?B?eHFpWHZLUS9CcnpkOXc4S01ENUh0Y3BQRHEweVJQbVRiL3U0bG9ZSzhzam9x?=
 =?utf-8?B?WkhyYkkyOFluN2xwYXZMZkZSWnlwbzZxdVZJVURiTlNwUi9yZ1VxejUvOTY1?=
 =?utf-8?B?aGhMaVd4bHI4aldPZDhReE93enhlWThIczkvRldyd1RuYmM3dmtuMW9kSmNJ?=
 =?utf-8?B?MkRtc1NUSDlsME8rT1Nnc29Gc1dNL3I5bUZTdkJwVHF5aHdYekI3c3k0USsv?=
 =?utf-8?B?V2VtYWdaM3JtcWVCSkVpaGhoZXQrUmhwWkh3dndncXEzR24raUpNMUZjOW9R?=
 =?utf-8?B?Q0h2WUpCbmJkYTFJVFNWS0tNT0RpVitIL1htaFpSMDRQK1B0ZnB6VVNnZTUx?=
 =?utf-8?Q?Aqs4Su?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(376014)(14060799003)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 12:26:21.8510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2814177-3fa3-4aa2-da62-08dde564eea0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7576

SGkgTWljaGFsLA0KDQo+PiArICogTWFwcyBhIHRlbXBvcmFyeSByYW5nZSBvZiBtZW1vcnkgd2l0
aCBhdHRyaWJ1dGVzIGBmbGFnc2A7IGlmIHRoZSByYW5nZSBpcw0KPiBXaHkgZG8geW91IGFsd2F5
cyBtZW50aW9uICd0ZW1wb3JhcnknIGluIHRoZSBjb250ZXh0IG9mIHRoZXNlIGZ1bmN0aW9ucz8g
V2hhdA0KPiBwcmV2ZW50cyB1cyBmcm9tIHVzaW5nIHRoZW0gdG8gbWFwIGEgcmVnaW9uIGZvciBh
IGxvbmdlciBwZXJpb2Qgb2YgdGltZT8NCj4gQWxzbywgdGVtcG9yYXJ5IHJhbmdlIGlzIGEgYml0
IGNvbmZ1c2luZyB0ZXJtIGFuZCBzaG91bGQgYmV0dGVyIGJlIHJlcGxhY2VkIHdpdGgNCj4gJ01h
cHMgdGVtcG9yYXJpbHkgYSByYW5nZSBvZiBtZW1vcnkgLi4uJw0KVGhlIGludGVuZGVkIG1lYW5p
bmcgb2Yg4oCZdGVtcG9yYXJ54oCZIGluIHRoZSBjb250ZXh0IG9mIHRoZXNlIGZ1bmN0aW9ucyBp
cyB0aGF0IHRoZSBtYXBwaW5nIGlzIGNyZWF0ZWQsIHVzZWQsIGFuZCB0aGVuIGRlc3Ryb3llZCBp
biBhIHNlcXVlbmNlIGUuZy4gd2hlcmUgbWFwX2RvbWFpbl9wYWdlIGFuZCB1bm1hcF9kb21haW5f
cGFnZSBhcmUgdXNlZC4gVGhlIHRlcm0gdHJhbnNpZW50IGlzIHBvc3NpYmx5IG1vcmUgZml0dGlu
ZyB0aGFuIHRlbXBvcmFyeSwgYW5kIHRoaXMgaXMgdGhlIHRlcm0gdXNlZCBpbiB4ZW4vY29tbW9u
L3BhZ2VfYWxsb2MuYy4gTm90aGluZyBhY3R1YWxseSBwcmV2ZW50cyB1cyBmcm9tIHVzaW5nIHRo
ZW0gdG8gbWFwIGEgcmVnaW9uIGZvciBhIGxvbmdlciBwZXJpb2Qgb2YgdGltZSwgaXQgaXMganVz
dCB0aGF0IHRoZSBpbnRlbmRlZCB1c2Ugb2YgdGhlIEFQSSBpcyBmb3IgdHJhbnNpZW50IG1hcHBp
bmcuIFJlZ2FyZGluZyB0aGUgY29uZnVzaW5nIGNvbW1lbnQgLSBub3RlZCBJIHdpbGwgZml4IHRo
aXMgaW4gdGhlIG5leHQgdmVyc2lvbiBvZiB0aGUgc2VyaWVzLg0KDQo+PiArICogYWxyZWFkeSBt
YXBwZWQgd2l0aCB0aGUgc2FtZSBhdHRyaWJ1dGVzLCBpbmNsdWRpbmcgYW4gaW5jbHVzaXZlIG1h
dGNoLCB0aGUNCj4+ICsgKiBleGlzdGluZyBtYXBwaW5nIGlzIHJldHVybmVkLiBUaGlzIEFQSSBp
cyBpbnRlbmRlZCBmb3IgbWFwcGluZ3MgdGhhdCBleGlzdA0KPiBXaGF0IGFyZSB0aGUgdXNlIGNh
c2VzIHlvdSB3YW50IHRvIGNvdmVyIHRvIHRyeSB0byBtYXAgdGhlIHNhbWUgcmFuZ2Ugd2l0aCB0
aGUNCj4gc2FtZSBhdHRyaWJ1dGVzIG1vcmUgdGhhbiBvbmNlICh3aXRob3V0IHVubWFwcGluZyBp
biB0aGUgbWVhbnRpbWUpPw0KVGhlIHVzZSBjYXNlIGhlcmUgaXMgc29tZSBwbGFjZXMgd2hlcmUg
YSBtZW1vcnkgcmVnaW9uIGlzIHJlcXVlc3RlZCB0aGF0IGhhcyBhbHJlYWR5IGJlZW4gbWFwcGVk
LCBzbyB3ZSB3YW50IHRvIHNpbXBseSByZXR1cm4gdGhlIG1hcHBpbmcuIEZvciBleGFtcGxlIHdo
ZW4gdGhlIGZkdCBpcyByZWxvY2F0ZWQgaW4gc3RhcnRfeGVuIHRoaXMgdXNlcyBhIGNhbGwgdG8g
YHhtYWxsb2NgLCB3aGljaCBldmVudHVhbGx5IGNhbGxzIGBtYXBfZG9tYWluX3BhZ2VgIGZvciBh
biBhZGRyZXNzIGluIHRoZSBzdGF0aWMgaGVhcCB3aGljaCBoYXMgYWxyZWFkeSBiZWVuIG1hcHBl
ZC4NCg0KPj4gKyAqIHRyYW5zaWVudGx5IGZvciBhIHNob3J0IHBlcmlvZCBiZXR3ZWVuIGNhbGxz
IHRvIHRoaXMgZnVuY3Rpb24gYW5kDQo+PiArICogYHVubWFwX21tX3JhbmdlYC4NCj4+ICsgKg0K
Pj4gKyAqIEBwYXJhbSBzdGFydCAgICAgQmFzZSBhZGRyZXNzIG9mIHRoZSByYW5nZSB0byBtYXAg
KGluY2x1c2l2ZSkuDQo+PiArICogQHBhcmFtIGVuZCAgICAgICBMaW1pdCBhZGRyZXNzIG9mIHRo
ZSByYW5nZSB0byBtYXAgKGV4Y2x1c2l2ZSkuDQo+PiArICogQHBhcmFtIGZsYWdzICAgICBGbGFn
cyBmb3IgdGhlIG1lbW9yeSByYW5nZSB0byBtYXAuDQo+PiArICogQHJldHVybiAgICAgICAgICBQ
b2ludGVyIHRvIHN0YXJ0IG9mIHJlZ2lvbiBvbiBzdWNjZXNzLCBOVUxMIG9uIGVycm9yLg0KPj4g
KyAqLw0KPj4gK3ZvaWQgKm1hcF9tbV9yYW5nZShwYWRkcl90IHN0YXJ0LCBwYWRkcl90IGVuZCwg
dW5zaWduZWQgaW50IGZsYWdzKTsNCj4gU28gZmFyLCBhbGwgdGhlIE1QVSByZWxhdGVkIGZ1bmN0
aW9ucyB1c2UgW2Jhc2UsIGxpbWl0KSBpbnN0ZWFkIG9mIFtzdGFydCwgZW5kKS4NCj4gRG8gd2Ug
c2VlIHRoZSBiZW5lZml0IG9mIGRpdmVyZ2luZyBoZXJlPw0KPiANCj4gfk1pY2hhbA0KDQpOb3Rl
ZCwgSSB3aWxsIGFsaWduIHRoaXMgdG8gdXNlIFtiYXNlLCBsaW1pdCkgaW4gdGhlIG5leHQgdmVy
c2lvbiBvZiB0aGUgc2VyaWVzLg0KDQpNYW55IHRoYW5rcywNCkhhcmk=

