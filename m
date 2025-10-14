Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C98BBDAA47
	for <lists+xen-devel@lfdr.de>; Tue, 14 Oct 2025 18:37:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142961.1476854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8i1T-0004rb-3E; Tue, 14 Oct 2025 16:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142961.1476854; Tue, 14 Oct 2025 16:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8i1T-0004q5-0Q; Tue, 14 Oct 2025 16:37:15 +0000
Received: by outflank-mailman (input) for mailman id 1142961;
 Tue, 14 Oct 2025 16:37:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MYj7=4X=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1v8i1R-0004L6-Ky
 for xen-devel@lists.xenproject.org; Tue, 14 Oct 2025 16:37:13 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 094a6492-a91c-11f0-9d15-b5c5bf9af7f9;
 Tue, 14 Oct 2025 18:37:13 +0200 (CEST)
Received: from DB4PR03MB9556.eurprd03.prod.outlook.com (2603:10a6:10:3f3::12)
 by AM9PR03MB6756.eurprd03.prod.outlook.com (2603:10a6:20b:2dd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 16:37:11 +0000
Received: from DB4PR03MB9556.eurprd03.prod.outlook.com
 ([fe80::ff66:ad9c:fa1:ef30]) by DB4PR03MB9556.eurprd03.prod.outlook.com
 ([fe80::ff66:ad9c:fa1:ef30%5]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 16:37:11 +0000
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
X-Inumbo-ID: 094a6492-a91c-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kt8vQCEcT5V3CCT+NoyDcIzliwhJgO/jlvQHj1WNMrAgCdbuYntT1a4bJcXmos9UA3oAZY5rtfKqDP3J4eb2bjF7EcumRACBX2riePq+mx51VgQ3rxeaO23MUllMNivbcB0+yGoW5oAN0dKGWdj+sVOy3O+McEF5Sk5LnBul9vNcv3wWfsntK6LshNyd4vy0JdlGzQLl/ZFWLxRm2FFxTfndzuyK1WxobQqGSBglDfnl6kO7T4d+OzN4JuySg2Ez1U0uuxDZVXaoioWDwD+AW4FIa1FUEc4Hd+Qs92ylADi6iuov/zxkOdyYCPh6CUApc4ti8uQSEfBaRVe+ecpMpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yo9YluAqRpwJjwuSG3biyePxzdZ+1Xi7kQSoPtsIXUU=;
 b=vqZbZZV1PCJwkcXKR99dtg8AJd0bQJVL8uj32XIOue/PKzJAghW98P9sxmivdOwGB7WNXwz2BVlU2yQrHeXQE3qpTzApkNN9nRyEW+dM24d0v0BQ1dWmiQEwIYZEsNajyis5if6LjwC4IRN0qPuCvXcYnXeJP9BoafF7vKjkMRY4X340rMmmcdtymPBhx1tQIs8hdmXYDnBmijPMOhQquICgV4hj1hkPzjLDeGDGox8cKlDN5bHQORypivqpNNVdFlz8eFTXw1DzIGDEEDF9jckhVRO0fNIrbkadbC0HkBmI/Gg79BxBxcSmzifTlhxpN/8viVe0Uwwt7omqBpmPKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yo9YluAqRpwJjwuSG3biyePxzdZ+1Xi7kQSoPtsIXUU=;
 b=mF0BbACgyDy1jCJ+LQkeXvBWUvtBe/7+gtP9RJ2Ahbmt4tFmwAEe0uNnUEKIHeyEvrb5OxB8qd5mL8QkJu4JkRcn5pVcydfGgLvzAvjqQ5+7llGJP+CO/9OZvo3yTlIoKXDNFyGO1NI6TWRo340RcdBv7W/0VnsWRLk/Ine4gLPmFLZPTMea3ThLJmKOTBm0OI0Ed6FJlNbZG8d1kMG6hPy9TTutmDPTFsFoOBj1b9naB+bbn9jY1ko8isqQKbJkoewvWqOcJl/Za5u5TlnTSYYlxv2eOzOlEpOrCHRGdIWxOr34bc3wqu+9AuvaS5RbeiU6Lgt7ot8G43HPijYxXw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Resend: [PATCH v4 0/2] arm: address violations of MISRA C Rule 2.1
Thread-Topic: Resend: [PATCH v4 0/2] arm: address violations of MISRA C Rule
 2.1
Thread-Index: AQHcMXDlieIVRZL5wEWYCDA6Feaxa7TB7rAA
Date: Tue, 14 Oct 2025 16:37:10 +0000
Message-ID: <9a3e591c-b94a-4dd4-9ab3-1e91ea155f5f@epam.com>
References: <cover.1759168391.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <cover.1759168391.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR03MB9556:EE_|AM9PR03MB6756:EE_
x-ms-office365-filtering-correlation-id: 9746552c-7f73-424f-0dc7-08de0b3fec60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?SjlOQ3dPUFlva1ZLa20zSHZuUUdQeGlibEpKNlNLRG9walQ1bWRjQjVMTkQ5?=
 =?utf-8?B?QndXQlo0OVlqYTVTUXVOM0pHQlh4R1FQeEZwZ1lIVDFOUXdDNXNLQWMvWnBt?=
 =?utf-8?B?VDlmT0I3RzVBbjBaQTA5akFaRmIycGVHVjFKcjZhRlphUzR1bGg0ZlJDdjY5?=
 =?utf-8?B?aUZZL0luYk5pR1ozYStBdzg1QW5jU3BwYklsMHgzcm9VRmljekFSV3RsRTZE?=
 =?utf-8?B?V1BCdjFTSm5NbmtVV2lHeGhYV2NSeEVRaVBUU09MZ0lvM2NPL3JVQmNuMUxC?=
 =?utf-8?B?R2VGOTdCSFprWnMvb3k4NU9jR3pwYURXWHZOU25IcDhpVURZM21yZlhRWnlh?=
 =?utf-8?B?UnVqcjA3bGc4R0pHVGUydVBoMXlrUEhGeDBPRUZYN0Fyamt1bDRDUDJHbHV4?=
 =?utf-8?B?cFpKSnVSWjlFbXd0elY1c1BGNnVmejFpeFdOTXBNS3J3QlV0R2E0TnhkN3Rj?=
 =?utf-8?B?cEg4TDlNSEtSRkRvSmJ5T0dmOVI4YmNoYm5nYncwbjRVZkpoUVozSXp4Rnk0?=
 =?utf-8?B?d2xvNDc4WENVekdOMkdrU2x4RmE0RzNSVXBwVzBCV2hZOVRVU2M0SU5aNHVX?=
 =?utf-8?B?WUxTREthcVBkNXRJaUxOS1FwSnNRTDdBWUVmeUZOMzJWUGVDZVRFc2xKS0da?=
 =?utf-8?B?UXFnVW1nM25GeHFvL2NuNnUvTXNNMU1EcXFkbmU0WlFCMkVxdGtZTnN0UE95?=
 =?utf-8?B?a1JrVk5oNGFVSkxCdGFmc0RuOUpJc2I3WlVmSzUzWUJoanhvQ3V0VEV5dG5Q?=
 =?utf-8?B?bm5wL0xLSGY4dlNuQUt0R1dsSlNpaytROFNQTDRwYm5JY24waUJYOWRseDNI?=
 =?utf-8?B?T3hWWGx3cWlUeWxrRkc2UnNkZXkyUEhmVXVEcWN5VnFoVEMyVzhTVDhXZ3dj?=
 =?utf-8?B?alA0WTFHMlFwZE0wd09KRlZ3bzFTTnlja2VKQUUrWXpkZFR2UjZLdTNiaWpu?=
 =?utf-8?B?elVqc0RjN1ZBdEx6OGoySGFNaC9SeGM3OEJjanpKVllJQVRkZmluelVrc3J2?=
 =?utf-8?B?MkcrZWpXZHgyM0F2WTRFcWFWUkkrbHU0eElCU0xvU2tHU0x2SlpPRkthL0Zp?=
 =?utf-8?B?dG1YdG5WUzRGNUpwelNkL2tDZ3B4cVdMeHcycWkvS25DZ0EzWW9JUmwvZ1Zv?=
 =?utf-8?B?NlVlSmErd2MyeFdMSFA0SDZ1eGZWK2hUbkxFUXJ2Nm91ZWxkR2lGVGp2Nm9U?=
 =?utf-8?B?TGcyTU5Xa09CMk1vVkNLOXhkbFgzaUhwZHFvNW4zUlNuTG12dnJ4dStYTmJX?=
 =?utf-8?B?QkNWQ2xBbFExS2JLZkJaalhzbnBVejVWR1kya2RtbjRIUThGWEFPeEVFdndE?=
 =?utf-8?B?cTJwV1doZXVtMThGVGFrTnp3cHJsdHd0YVl4SVNVdTM1SFl2UzJKUEhMSXlM?=
 =?utf-8?B?aVVQeWhINGtDblJFcHFkMVQyM0Q2eVd1L09QWldhd3RaY3VSa1h6VjVKemM0?=
 =?utf-8?B?amcrS1VzZ0lZcEwvQnh3WGpxQXBPWnpTQTJ5RXZQWlpSVFNMSWxid0tmc0Vy?=
 =?utf-8?B?OGxHQnplTTNLT2FhRTRkNS84RDV2RnMrQ0ZBK1RMemlXdWZXalJOWVRpSlAz?=
 =?utf-8?B?V1pIdXUvVGY4SXhVMkZVNkVvaDhOOW5hdlZ6elR0VGdZbUJpaStZbGM3Tkdx?=
 =?utf-8?B?aUdXTVl3M1IvcVJZaVYxaVVRcyt1dm0wT2pUTGJHU2hlZmJkbDB3SEkzWlRm?=
 =?utf-8?B?UTUxVTdPdTJ1ak5iZEY5Y0RzSnJ6Q3ZaMVVOSVAvWlY3UUY4THlLM0RXRWdn?=
 =?utf-8?B?MGR3c3pnenNmY1NkbkovQXJlNXoyWjVRQmkyNG8xeG9WWFhwVTI1R3VwNDVL?=
 =?utf-8?B?K3RRcWdQSzJZd3h6K1ZONGR3cGQ4SndRVTlDZXVqekV1QkhxWGQrb1lRUFpu?=
 =?utf-8?B?RW5yb0NHZldETmpZQ2VJSFZsbWJjOWN6M3NONlYwOU1XVWliZVBQVStCZVNS?=
 =?utf-8?Q?nIBGIWnXbCx+kEheO7beP4nrxmUYYP4p?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR03MB9556.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aHJrQ3RxMzFOK0tWUkt4UHJJekZWUmZ2SEJGS3hkMnZLTkg2THlZVmlka0JY?=
 =?utf-8?B?enhsb3ZXZ0pmNXBnZ0d1RlNuYzEyZ292YUh6azVCTDJzdm1BdzJBd1ZXUHI2?=
 =?utf-8?B?dmYwbVZYVHJ1Yyt5bkxGTlBraXNPNHd2QnYzb2VWU2ZIRG9Wcmw3Y2FMNW05?=
 =?utf-8?B?V0tZWSs0ODc2V0g1T0RKT2M0a2NUVUZ0a200b0RUakpma3Btd0RFRU1YU3Bo?=
 =?utf-8?B?alNNVmFYY0xPTXJLZEc0QXhoMmdqSENnWitIWVl4WW5TYWJNZUd6T3kyaEhL?=
 =?utf-8?B?V1JXdkZYRzhXRm84aC8rY3p6VWhGMmRQQXBHaS9OcXliMGRXOGpmMzFpZW8r?=
 =?utf-8?B?anZheTh0Ty9TV1g3MzlDQmxkQVhzMmtPL1NPTXN2cHpnTEJhRUREV1BWMlhH?=
 =?utf-8?B?N2NoM29mTWIvRXIrcHJoS08zbzJNMTR0MGlPOXplWTY0VmpEUDB3WTg5b245?=
 =?utf-8?B?OGNRMnFvMGhPWURhRHZPelRaeEhEaWpCRGFNaGpJckkrbCtWaFZGWDdiMkxH?=
 =?utf-8?B?ZjNJaXAyT3RaeitBSkFQMFFtU2NpUGpDVXd2RDBacHVxd3RVVjZvanBLUDVv?=
 =?utf-8?B?ckdzLzl1TDhDZE9oL0hnRnFxbjNoaEw1bWJ6YzVTaGdpcTJZMHowcnBNNEVu?=
 =?utf-8?B?Z3NsV0dMbWs3WHRoNEt4TVZNdHFuYURGWE9rdEVnWGEwNURRMFZNQUtheFZT?=
 =?utf-8?B?T3dkNXJUc2k0R0ZsSDNjS2dZbThJdzhJL2QzTUpUZXR6OHBVVVQydVdtWE1C?=
 =?utf-8?B?YUxlcEhIWEJxL1VsZkhXVEd4QnVmenBnRFVSeVlTMk94R2xGT2M4cHJQT3p0?=
 =?utf-8?B?dUNLcFVsQnRoekpMQkg2cVBDWHFlckNiSk13bmVpY1ltbDI4aUxJZ2p5K2pj?=
 =?utf-8?B?VXcrTk5BT0ZiK1JsYWplVkZHRXZUSVcvVC9hdVVNb0hqcnZXc1U3MTRHZUZR?=
 =?utf-8?B?YkU1VVJxd3k0UlpYUjBnaUR1RjNmdHFKVWJmVGpkUFhXNDh6QkNGZlpobHlz?=
 =?utf-8?B?N2xNRC9rWDhoS2xzNkwrTnEyclJlZmwwNFRGRjhINmxoREQ4Z2lheXV3QjhL?=
 =?utf-8?B?RjlHRld1UE5HekhUUUQvc2wxSnZUV3dpMnB6ajExQ0ZxQTI0eXFYd3dyWXFq?=
 =?utf-8?B?TVdVV2s1a2x5WFM5U0IzYXJKbFBOQWk1QzJQMndmblMyTHE5bVd1UUFraXhB?=
 =?utf-8?B?UnpBYk5wbzBnQlk1aUhxN0N1ZmpJZ1JFaks4bUtxbTFjN1NhRndWUHFvSmo0?=
 =?utf-8?B?SXFhNFJYT0lFMjBHUTdCWUtUYy92R1BMOG1IT3FKOXliMHNicVNkQlJNRjFv?=
 =?utf-8?B?TDkzUlhpcmNaNmk5cFVuQXUvZUt0K21WUFJaMDM3WDdJSHZBeCtrRE5pck93?=
 =?utf-8?B?T1hMQ0pRWnU5VkdJK0pLUXlUZ0RuVVRiZGpWSGdhUHRNbGFuTE9KbVV1K3pM?=
 =?utf-8?B?SS9vSXdBdEVJdXBOaDI2ZVNJVlFJaisweUV5bVdZYVFrdEprRnNKT3dNQlRZ?=
 =?utf-8?B?amJBUU1HNkxvbWJqeEsvRXJrZm1DUTBWWnpsVGNIMGh2U2JObFRsWjlrdUdv?=
 =?utf-8?B?OVFKQzJ3cjU3ZmZOV1RBVjEzdnkybXhmMU8xYjFHNDlCQjFoc3RBNm1Ja2hp?=
 =?utf-8?B?TmJWVHhmUFZlb2ZOMDRHdU1yWWVqa0xQWFdoN2dqTjVoN251NTZ1SnhnMXd4?=
 =?utf-8?B?di8yMm5yNUZ0WDBMdjgvdjlXR3BaNDMzdGsrbjdRcVgyblAvQklRdUFBNWlT?=
 =?utf-8?B?SDNOYWZGT29FbjlPeVdGYjkvVVB1NDJBSmN4U2Nzd3NxaGE4aDQ3eU1BR1g2?=
 =?utf-8?B?MWcwa2NzaUdlQXgwS3JJem1IZi9mTFZiSE5IR282L1FEQ1psa0ltMmN5SkVT?=
 =?utf-8?B?cGhsbXp2ZjFEWS9HaTBKUWJRdWhFb3N2eXhsMitrSm4rangvVklLQ3JiMllZ?=
 =?utf-8?B?dXlmVm1jSzFzbmliZEhwRmYwd3lTY2VhY0VyWWszditPLzZod2hPNnlMV08r?=
 =?utf-8?B?MVRwbm5VZVZ4djhZZ09raDJ3T3c1LzVpWTlOdHJIU092c1REekRWM3A2cGNQ?=
 =?utf-8?B?dnFBWlo4cDlCYk5FYk5RbVo0Q2Zxa0NaMG9ZUHExYXE4eWFYWlJSNWFSUlVn?=
 =?utf-8?B?ejd2ZkJJQWN3QUpqZ3JHYThyKzFHU01RcWsvYmw3TGs0VFFleTVvVktDaEY0?=
 =?utf-8?B?K3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B87CDBC9C9E45B48A77B68F93E8526FA@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR03MB9556.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9746552c-7f73-424f-0dc7-08de0b3fec60
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2025 16:37:10.9473
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dV2fcCqiSUtTMBRcRLyjLNbTgWfNK1U+SMk1n7ohpfQyP3UWpuZ5p2MLcIYRyWB3IoOaY4Fe9cpyzmSQunjScJvCNeku2pK6l/gbRRToZRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6756

SGVsbG8sDQpsb29raW5nIGZvcndhcmQgdG8gZmVlZGJhY2ssIHN1Z2dlc3Rpb25zLCBvciBhbnkg
cmVxdWlyZWQNCmNoYW5nZXMgdG8gZ2V0IHRoaXMgcGF0Y2ggYWNjZXB0ZWQuDQoNCkJSLCBEbXl0
cm8uDQoNCk9uIDkvMjkvMjUgMjE6NDMsIERteXRybyBQcm9rb3BjaHVrMSB3cm90ZToNCj4gVGhp
cyBwYXRjaCBzZXJpZXMgY29uc2lzdHMgb2YgdHdvIHBhdGNoZXMgdGhhdCB3ZXJlIHJlY2VpdmVk
IGJ5IGRpdmlkaW5nIFBBVENIIHYzLg0KPg0KPiBMaW5rIHRvIHYzOg0KPiBodHRwczovL3BhdGNo
ZXcub3JnL1hlbi82MjBlYjhmZTIyMjA0ZTIwNGNiNDcxZTkzZDJlYTc4OWY4NzlkODU0LjE3NTg3
NDQxNDQuZ2l0LmRteXRyby5fNUZwcm9rb3BjaHVrMUBlcGFtLmNvbS8NCj4NCj4gQ2hhbmdlcyBp
biB2NDoNCj4gLSBQQVRDSCB2MyB3YXMgZGl2aWRlZCBpbiB0d28gc2VwYXJhdGUgcGF0Y2hlcw0K
PiAtIGFkZGVkIG5vdGVzIGFib3V0IHByZWRpY2F0ZXMgd2hpY2ggZW5kIHVwIGFzIGNvbnN0YW50
cw0KPg0KPiBUZXN0IENJIHBpcGVsaW5lOg0KPiBodHRwczovL2dpdGxhYi5jb20veGVuLXByb2pl
Y3QvcGVvcGxlL2RpbWFwcmtwNGsveGVuLy0vcGlwZWxpbmVzLzIwNzAzMTcxNTMNCj4NCj4gRG15
dHJvIFByb2tvcGNodWsgKDIpOg0KPiAgICBhcm0vYWNwaTogYWRkcmVzcyB2aW9sYXRpb25zIG9m
IE1JU1JBIEMgUnVsZSAyLjENCj4gICAgYXJtL2dpY192MzogYWRkcmVzcyB2aW9sYXRpb25zIG9m
IE1JU1JBIEMgUnVsZSAyLjENCj4NCj4gICB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZG9tYWlu
X2J1aWxkLmggfCAgOSAtLS0tLS0tLS0NCj4gICB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZ2lj
X3YzX2l0cy5oICAgfCAxMSArKy0tLS0tLS0tLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkNCj4NCg==

