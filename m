Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 705FAB1753A
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 18:49:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066121.1431454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhWSS-00022I-4e; Thu, 31 Jul 2025 16:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066121.1431454; Thu, 31 Jul 2025 16:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhWSS-00020B-1U; Thu, 31 Jul 2025 16:48:44 +0000
Received: by outflank-mailman (input) for mailman id 1066121;
 Thu, 31 Jul 2025 16:48:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GSHe=2M=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uhWSQ-000205-FX
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 16:48:42 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34021d81-6e2e-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 18:48:37 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by PA4PR03MB6829.eurprd03.prod.outlook.com (2603:10a6:102:e7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Thu, 31 Jul
 2025 16:48:33 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8989.011; Thu, 31 Jul 2025
 16:48:33 +0000
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
X-Inumbo-ID: 34021d81-6e2e-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WUsO4U5KLrbjN6gOMvxSxGUi/S1aqhIp7RHwQwLNtXHGJ+AACuBWPr0YOFppOneoM+DmwTTNpHzTyhLWn1u9nK7gAihDInUW7rZ2hdnDG1l64kjGsx7zxfKgzXgNxSTTTmfjZ+N0CnHuuJDWtwpmMGu6BYmMN1ARmoBcs3dmAPOSYADBZsqbjqjn6GUkczeaJ36Ptp1AljUY4iQOIxz/WZV9cxJC6XYmKb9YVudCqax3BVOSh7K7i/DeFCtFjgrk2xJTGm/hRjj3u0mvN+/QyVs6K9bjyR+rq0N/oOIFeW5+qavZ1gSG8oLzGZf8gUAa+qKvcaLihbLUCJ3bvexm5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzUZaIaTjl2BqusVKImSmE0hjO688BNvqMwAaOLEoqQ=;
 b=HFlzSifvsINukcjfGYgTZt8uyslEhgGcQnYBaADXyzq23hvjUIodPn8o3jlodc+zJraLZ8OkTNJ/vjToMx6BVEs3lFbsm5mh0KuTHjxHnFYV5kSwqMlW6Oy4QH5etCnUOnzc/Q+nmzxOtHx2rChSZ8NYZL/kPnZsdNcFhnLP7BPaQiLwGutz7bjVEhmyPl0gYtz9UgdadNmaszI21gWJqL7E2Mv+JhPXPSGFq3Yaapsg6WrMkHQIMUrW2aFxtuaZUDAp5fhp1lGebEoip7szw+1KvAgUTuCbQnVnLOZVeuzr4q4VmDZbfZOZf3fEkBlyuv5MCHY31xxL4n5h75BQ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzUZaIaTjl2BqusVKImSmE0hjO688BNvqMwAaOLEoqQ=;
 b=tR9VoWpKylxwfdH3ZrRGlcbAU6Yz2bPNwy0j7Lqq8cjFpifqYShwFfxghyqozONeEJtzgFy1KR2NQ0og/neU+uMvkLMbagZ+A8nCmnw4wbjUj4gaYviFQlHVM5ms6+o+F4iJ2g6Gd4AgCIu5VLwd+7p63XlyigdtOxnhq1aEYKwtWMCfjs1B8XOWd+3Al5SHwJIEPo1nfWUAcIvXm9/a37FSYBfk9hdqiQcuSq+e3QCUk2ZzieDrNDYRRcc+6i5ImA4iPDPvSJrrpNUjlLjJLp7Y46sMBcLQoge1jQCILNOZZTrDiIfo4yY7lLtDOfFkAQsGhOMiVBPo2kUO36DKPQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] misra: allow discarding 'noreturn' during function
 pointer conversions
Thread-Topic: [PATCH v3] misra: allow discarding 'noreturn' during function
 pointer conversions
Thread-Index: AQHcAZuXMk8luH5qyUihUMZTH0cl+7RL1AuAgACepIA=
Date: Thu, 31 Jul 2025 16:48:33 +0000
Message-ID: <0999ccba-37cf-4222-8b6e-82aa95371b75@epam.com>
References:
 <63d5d311e6502d5b957009be59e1c97599015b46.1753911912.git.dmytro_prokopchuk1@epam.com>
 <46e8dd16-11e4-4d96-95cb-f13b652e7317@suse.com>
In-Reply-To: <46e8dd16-11e4-4d96-95cb-f13b652e7317@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|PA4PR03MB6829:EE_
x-ms-office365-filtering-correlation-id: 90d20fc2-ad18-44f0-9a3d-08ddd052165c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|42112799006|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UXpBR2ZlaGtGdUs2VE1aamlHUlBnTDhsYkFsRGhZZTd1c2EveHJuaHlRaHpZ?=
 =?utf-8?B?T0k5cTJDZlJ4blVRemNWOVg2ZkRWa041enZhVWp6QjM0OWhXK1ljSzVHZWJP?=
 =?utf-8?B?QzdZV1VDU0ppQzVYNHZWbVZkY2o5bHVqaGtIMGZiZEZQL2RXZEZvVnFqckRx?=
 =?utf-8?B?eTZrRUpzUkFCdVk1YUdMZUIreStUN0ZEaGVxZGl6V2lET0p3K2JVbmtEWXcz?=
 =?utf-8?B?T05XT3owMUpmbE51bTlldTYrenV0WlNKNTgyN3JVZGNVY0JYVnIvTDhFMnpQ?=
 =?utf-8?B?VkdJb213L3ZZM2xSd1N1MW1IcFFMajZ5UGhjQXRGTTAzZ3p0RiswWGF4RTVQ?=
 =?utf-8?B?R1JWUkNBUUVlWEJiUkwxYVJQT3hLQWFydUZHaGxzMjVtYXByVjRZaGMzUTJw?=
 =?utf-8?B?WlB0eTZaY1BjK21YbFpwUUE3ZjRMaG9CSE03TVo1YlBRcjV4b2xnaldaeEkr?=
 =?utf-8?B?emdBSDJzTnNTVmtObEhPQXhtb1FTRmpHa09uQzJyRVFibWRqbUZKTlRVekU2?=
 =?utf-8?B?U3Y0NjAyZ1BqbGVpNk4wYUlEdmpGUWZ2a2lLellQZzJZalRaSzRtUExPS3kr?=
 =?utf-8?B?TEl0RGd2TmRuUDRRMStuNldETzhIZGNVa1pkMzFaUjI1Y3UvdXNFZmMyb3Y3?=
 =?utf-8?B?RUE4QXM0VVNOZ25NTFdEdTBOTVJiMmpzb1ZoK2xtVENxMDhhZUR5dEhDR2Ey?=
 =?utf-8?B?TW1jQ1RIUGNQa0RaUENzODVwWDY0bDJEL1QvZHRJNGsrdFd5ZGFYNURidGt4?=
 =?utf-8?B?NEtvRG5ScnFSTTBQYkEyb1kyYm1kbUR0bW5jbUxYbkpKS0FqTFdKWkxoaE9z?=
 =?utf-8?B?WGRnOGZuWmh6ZHlCMVFxWWpCZDFlSXZBYnNjYUlKV1FZbWhXdkxtYlVQRHpj?=
 =?utf-8?B?OFU0dGFKQ25UNndoR0JJZGIwZWxhZVR5N2psVmdQdWlyR3hhT05Mb1VRM1pV?=
 =?utf-8?B?YW01bUlMcHF5WEVVRTRJbk9kUnhHVzZVOEYwUithelZSZEh0aHdGc1ZoY0p2?=
 =?utf-8?B?S3o3Q2FnN0QrL0tnUElJYVI0Q2N3QnZIZy9YdHlnQ2d5aXlTeHdqU1MxNDc5?=
 =?utf-8?B?NHI4YmlGMEcxMHlSbGpDaHNma0h5TExlMldKd1o0bE56YmUxTExaWlk4REdW?=
 =?utf-8?B?R3ZBK3o4RHRlWUt2OW1TblJNbW9uYnFLYWtpQjhiTThRaVk0aEtHTTJ3VnAw?=
 =?utf-8?B?Z1Fia2hlZXF0QWVQQUdDbStpUE9SVFBxcmFFRzllaUtoaENJTDl5aU40UG5S?=
 =?utf-8?B?dVhDcXI3d2hDeUZoMEorSUJqemhxWHhZZ0ZpUlVlVWhoM0U5S08xbE0xWkxS?=
 =?utf-8?B?U0lodUoxNk1DZVNHOEs4ekd0K0RZeXNnbHlaMUlvR013K0VVZEFaRGZWSUJi?=
 =?utf-8?B?R044V2RnaVlYQ1BFdmZmbDhhSVdxblMzMXppZ1dXN0JJVndBSXoyb0x5NW5E?=
 =?utf-8?B?U1VYZmVHT0FMblZLNzZlR2FzSHlUTEdTNjgzL0FYcHArNEQ5cEw0Sld4Z1cr?=
 =?utf-8?B?NnRIZzJBckc2YWN3aHMzdVVlb1RlQ29kaUp1OFZMb2xKaHhjSGk4d0pXeXJl?=
 =?utf-8?B?TlJINE90UW9BTTE1d0UvWEx4bnlzdTB0cEZUajVWdWV2SGJ6S1ByVTBmSVRK?=
 =?utf-8?B?SmNBZ2FTWHM1N202WDNIa0hEQ05heHdjeHhZd0k0eGR6OENNaEZ0YndNdTNa?=
 =?utf-8?B?T2pDbTRwSnlPbDdndHUyTFRuRk5lNCtwVGJKd3RIT3pxbU9OUkRCVnNVYlRH?=
 =?utf-8?B?OXVubS9UNFRGVEVDV2l4SXF5YzllYVRCaHBhRUZ6RGxpOXpHaytIQng5T1J0?=
 =?utf-8?B?czhtaHN3ZXQ0SUdaR3NpK2QyMU52Y1c2TlJ0SlZGenRYbUF5K3lvS0hHZ01r?=
 =?utf-8?B?S25WVnJMd1hJOHZlajlMMmt2U21teSt4VE0yV2dBVkg3Q01nckVXc2J3NC9P?=
 =?utf-8?B?WTF0Y2xkOGVEUXlONk9lclY0QU0yS041elBKRWdOdnZCdDd5dktYNEs2c3dm?=
 =?utf-8?B?V2N2Yit0OUxBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(42112799006)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V3VIQWVOKzR5blB0cXVUU1lEKzdjb3hKUG0wendLVFNkRkFvWnZhQW4wT0pV?=
 =?utf-8?B?OVV6Nm9lUVA4WUtTN0VMRTUwK3htUzJVUkhObFFBQzJJWFVSSnI2ZEpsNkRP?=
 =?utf-8?B?aktwdXRDWUhYZFR2eHBvUFRKM05KR0tuRXZCUG83d3FRSVI2UmhWQ0VCQ2J5?=
 =?utf-8?B?WXdkMllmeWx4R28wZHhxWHlFSzdCU3JIUmxLM3ErenhBZ0taVnBzUU1YOG05?=
 =?utf-8?B?ZGQ4c1Z3NVMwUWl5eGdvNXRhbzZFVTBFMDJOTm9zSTlNUG5LQnJCbU1Mb01T?=
 =?utf-8?B?QnB3aEdvVC84aFVDbDVHZWZBR05YOTNxSWlGcWczZ1hUdDkzY2FIMk1rbnNn?=
 =?utf-8?B?TlJ3ZTAxSTkyeHpsT1dDSUdva2tBSS9jeHVRZXhVeXdET0pQbmpZVUhhdUtC?=
 =?utf-8?B?aExMcGRiRUVQRm94eHA3YW1vZGRpZUxvZWZERVdGZVRweUhPOFhWMHd5clJ5?=
 =?utf-8?B?dDdQQ2JrNFA1blpGMFJlRENvSlFPbG1sYlFuaHU4S2RqNlRjZ3RIZkYxZmR0?=
 =?utf-8?B?cmF5K1dMMTlwNjZiTGtadHhqY3JMTnNzV0JtakJ0dHRHV2VxREp2QUR0ZURE?=
 =?utf-8?B?YmRRWjB5UytqNzlNK1RzQ0ZoaVhQbVlDa041MEJhd3c2WlFzZEpoMmwzVHhM?=
 =?utf-8?B?anVjNks4ckpzUzc4aWFpaEs1ZXpGbkw0MVY4NTBoWDJHUE5WSFZIZ1lDaVhl?=
 =?utf-8?B?NGdIVTI0VWdFeFAraXNZanRxTGNTQzdTbVRRRmVHMU5TQU9TYlMyUk5sNHhz?=
 =?utf-8?B?d0V2VUtieWtCQWV6YmN0Vi9HZ1JjRlZNK3R2RnJmQm5kbHY0NjJrSFNsWEJG?=
 =?utf-8?B?em12eXRRTEtTVEk5eHM0bFBUOStXV0JCQk02RmZUN3ZOOUtUdXI3VVd4Mkxm?=
 =?utf-8?B?OXMxdklwN1JTMFo4cFo2MGt0QTV5RCtRRVpTUXBsVSt1UlhuTFg4MUtXZFli?=
 =?utf-8?B?QXF6VUk1WVVRWGFuMzBzNlJCWnRLRVN4L0ZpZmliOXhOYWdMTDhDR1dMdjlS?=
 =?utf-8?B?MWt3Y1JsaXVvWTJMZW1yaFJwaXNTNmIyVVNKanMyekVIM1BIcmxMNThtdGZZ?=
 =?utf-8?B?ZSsvekhnZzdnWWIwNDBDNVJjZkNtbmppVklxdUNOeDdmbURpaUZzSFhDV2Fn?=
 =?utf-8?B?ZVNBOUhOZnc4VjcrL0s1T3VaL1lXMEorYmZqSlF1dlVqOGphSFRSQW0yNXcx?=
 =?utf-8?B?cUdmOFFTSFZiSHZDcEhnTm9ON2diSFJoQkN3K3R4WE5GZjczcHRPYnZvVWNT?=
 =?utf-8?B?bFhRNFhIcWtENGcwa1hINWhEV08xNEFFQTRZbnJtRUFmZzJZc2lCbkJoaEJ3?=
 =?utf-8?B?QUUxa2poR3BZMWpmVzVDT1Jpdjc1YmU4cWU1NHRhNStJWWxkQzdiUFdxZjdh?=
 =?utf-8?B?RVdSKzZzMDYrVjBXcm9JNHRhTVl3RHlYK1BuKy8yRlowb2pvWWFaSnYyYW5y?=
 =?utf-8?B?alJBUVFRdmhkNHEvMGNSa1R2VkFlTEk2c09TUisvajFsWCtvVXo4eDlFSkdi?=
 =?utf-8?B?a3VscHUvai9GRzdFeG9rUE92RXR5MHdPVUphNS85VCt4aTlIZmpVUlJDbjY5?=
 =?utf-8?B?NzMxbHR5RUtIaXBsWEhyUnk1b1F4ZzI5cXZ4a3FRQ0NzNGhyMTc5bWl5cVZ3?=
 =?utf-8?B?dVpqVUNHY1lia21BRlNtQUIvTHM0bTlBeFJNemc4REJLWHdSY2FCRC9lMmJo?=
 =?utf-8?B?alBCRXhMRmxCVHhpdTdhTHpNblZhaXQ5S29ZejVpc1RnVVU5ajV4dGJTYkRt?=
 =?utf-8?B?MmhBNnplWXExeks4cmhMeDF4cHJ5VDRQNWh1RGc5R3h1UlZVayt1cmFTcFl4?=
 =?utf-8?B?eUtKY2hPMmYzcjQxUm1kbm9RMXZIa2oxbHhTWWZtQVhYL0MyU1R5U2ZDcjhr?=
 =?utf-8?B?K1I3QWdCcmhUMVg3ckNrMWthV0pXTlBKcVRIWkQxc1JrNFc2eDd3Q1crMEhq?=
 =?utf-8?B?WnBGREJ4VnVtM2M3RTVkWmtIY0hWTTk0Ty9CK0hGQllLV0dvS3BuM2J4V2RM?=
 =?utf-8?B?RnAvWVE4OFE0K1htTy8rckIvMDlOOWhZSXk1REp3QmdPUzdoZkhrdkdZRFZE?=
 =?utf-8?B?dUJRd21KYXRWaC9JT2pkayt0VjI5dkZKNjhDOVlObXc0eDhVYS91blh0QW1F?=
 =?utf-8?B?VGMvbVhZUVZlank1UFo0ek8zSzZaR2FNY1ZRbC9FQkJPMTRGRFUwcjdzWUtJ?=
 =?utf-8?B?QVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5956EF97FA34BF4D8B50A16E79261C5E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d20fc2-ad18-44f0-9a3d-08ddd052165c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 16:48:33.7002
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nc/IeWpe/AXk/+Axbp3iNayEHhEhrpiBKaVHxNLjC5ECm/4jMeAasoJfga5+nV5saqNY09FkyL6MFA0WB1EGyqXiETi3EHl8czH7C7pJFn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6829

DQoNCk9uIDcvMzEvMjUgMTA6MjAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAzMC4wNy4yMDI1
IDIzOjQ3LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiAtLS0gYS9kb2NzL21pc3JhL2Rl
dmlhdGlvbnMucnN0DQo+PiArKysgYi9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQo+PiBAQCAt
MzQyLDYgKzM0MiwxMiBAQCBEZXZpYXRpb25zIHJlbGF0ZWQgdG8gTUlTUkEgQzoyMDEyIFJ1bGVz
Og0KPj4gICAgICAgICAgc2VtYW50aWNzIHRoYXQgZG8gbm90IGxlYWQgdG8gdW5leHBlY3RlZCBi
ZWhhdmlvdXIuDQo+PiAgICAgICAgLSBUYWdnZWQgYXMgYHNhZmVgIGZvciBFQ0xBSVIuDQo+PiAg
IA0KPj4gKyAgICogLSBSMTEuMQ0KPj4gKyAgICAgLSBUaGUgY29udmVyc2lvbiBmcm9tICd2b2lk
IG5vcmV0dXJuICgqKSh2b2lkICopJyB0byAndm9pZCAoKikodm9pZCAqKScNCj4+ICsgICAgICAg
aXMgc2FmZSBiZWNhdXNlIHRoZSBzZW1hbnRpY3Mgb2YgdGhlICdub3JldHVybicgYXR0cmlidXRl
IGRvIG5vdCBhbHRlcg0KPj4gKyAgICAgICB0aGUgY2FsbGluZyBjb252ZW50aW9uIG9yIGJlaGF2
aW9yIG9mIHRoZSByZXN1bHRpbmcgY29kZS4NCj4+ICsgICAgIC0gVGFnZ2VkIGFzIGBzYWZlYCBm
b3IgRUNMQUlSLg0KPiANCj4gQXMgYmVmb3JlLCBpbW8gc3VjaCBhIGRldmlhdGlvbiBzaG91bGQg
YmUgZ2VuZXJpYywgaS5lLiBoZXJlIGluZGVwZW5kZW50DQo+IG9mIHdoYXQgcGFyYW1ldGVycyBh
IGZ1bmN0aW9uIHRha2VzLiBJZiB0aGF0IGNhbid0IGJlIGVhc2lseSBleHByZXNzZWQNCj4gdG8g
RWNsYWlyLCB0aGVuIHRoYXQgd2FudHMgc3RhdGluZyBhcyBhIGp1c3RpZmljYXRpb24gZm9yIHRo
ZQ0KPiBkZXZpYXRpb25zLmVjbCBjaGFuZ2UgdG8gbm90IGZ1bGx5IGNvdmVyIHRoZSBkZXZpYXRp
b24gd2UgcHV0IGluIHBsYWNlLg0KPiBIYXZpbmcgdGhlIHRleHR1YWwgZGV2aWF0aW9uIGdlbmVy
aWMgbWVhbnMgbGF0ZXIgcG9zc2libGUgbmVlZHMgY2FuIGJlDQo+IGVhc2lseSBhZGRyZXNzZWQg
YnkganVzdCBhIGRldmlhdGlvbnMuZWNsIGNoYW5nZSwgd2l0aG91dCBhbnkgYWRqdXN0bWVudA0K
PiB0byB0aGUgZGV2aWF0aW9ucyB0aGVtc2VsdmVzLg0KPiANCj4gSmFuDQoNCkhpLCBKYW4NCg0K
Q3VycmVudGx5IEVjbGFpciBjaGVja3MgZXhhY3QgcG9pbnRlciB0eXBlICd2b2lkICgqKSh2b2lk
ICopJywgYXMgDQpkZXNjcmliZWQgaW4gdGhlIGNvbmZpZ3VyYXRpb246DQoNCnRvKHR5cGUocG9p
bnRlcihpbm5lcihyZXR1cm4oYnVpbHRpbih2b2lkKSkmJmFsbF9wYXJhbSgxLCANCnBvaW50ZXIo
YnVpbHRpbih2b2lkKSkpKSkpKQ0KDQpOaWNvbGEgd3JvdGU6ICJ0aGVuIGlmIGl0IG5lZWRzIHRv
IGJlIGV4dGVuZGVkIHdoZW4gbW9yZSBjYXNlcyBlbWVyZ2UgSSANCmNhbiBkbyB0aGF0Ii4NCg0K
U28sIGZvciBjbGFyaWZpY2F0aW9uLg0KDQoxLiBJbiB0aGUgZmlsZSAiZGV2aWF0aW9ucy5lY2wi
IEkgbGVhdmUgZXhpc3QgZGVzY3JpcHRpb24gYW5kIGNvbmZpZzoNCiJUaGUgY29udmVyc2lvbiBm
cm9tICd2b2lkIG5vcmV0dXJuICgqKSh2b2lkICopJyB0byAndm9pZCAoKikodm9pZCAqKScgDQpp
cyBzYWZlIGJlY2F1c2UgdGhlIHNlbWFudGljcyBvZiB0aGUgJ25vcmV0dXJuJyBhdHRyaWJ1dGUg
ZG8gbm90IGFsdGVyIA0KdGhlIGNhbGxpbmcgY29udmVudGlvbiBvciBiZWhhdmlvciBvZiB0aGUg
cmVzdWx0aW5nIGNvZGUuIg0KDQoyLiBJbiB0aGUgZmlsZSAiZGV2aWF0aW9ucy5yc3QiIEkgY2hh
bmdlIHRoZSBkZXNjcmlwdGlvbiB0bzoNCiJUaGUgY29udmVyc2lvbiBmcm9tIGB2b2lkIG5vcmV0
dXJuICgqKSguLi4pYCB0byBgdm9pZCAoKikoLi4uKWANCmlzIHNhZmUgYmVjYXVzZSB0aGUgc2Vt
YW50aWNzIG9mIHRoZSAnbm9yZXR1cm4nIGF0dHJpYnV0ZSBkbyBub3QgYWx0ZXINCnRoZSBjYWxs
aW5nIGNvbnZlbnRpb24gb3IgYmVoYXZpb3Igb2YgdGhlIHJlc3VsdGluZyBjb2RlLCBwYXJhbWV0
ZXIgDQpoYW5kbGluZyByZW1haW4gY29uc2lzdGVudC4iDQoNCjMuIEluIHRoZSBmaWxlICJydWxl
cy5yc3QiIEkgY2hhbmdlIHRoZSBkZXNjcmlwdGlvbiB0bzoNCiJDb252ZXJzaW9ucyBmcm9tICd2
b2lkIG5vcmV0dXJuICgqKSguLi4pJyB0byAndm9pZCAoKikoLi4uKScgYXJlIA0KcGVybWl0dGVk
LiINCg0KSXQgbWVhbnMgdGhhdCBvbmx5ICJkZXZpYXRpb25zLmVjbCIgbmVlZHMgdG8gYmUgdXBk
YXRlZCBpZiBhIG5ldyANCmRldmlhdGlvbiBuZWVkcyB0byBiZSBhZGRyZXNzZWQuDQoNCg0KSXMg
aXQgT0s/DQoNCkRteXRybw==

