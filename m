Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDC9B141B0
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 20:03:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061839.1427432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugSC2-0005yJ-5t; Mon, 28 Jul 2025 18:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061839.1427432; Mon, 28 Jul 2025 18:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugSC2-0005wW-3C; Mon, 28 Jul 2025 18:03:22 +0000
Received: by outflank-mailman (input) for mailman id 1061839;
 Mon, 28 Jul 2025 18:03:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l9gA=2J=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ugSC0-0005wQ-St
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 18:03:21 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23bae0b0-6bdd-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 20:03:18 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DU0PR03MB9754.eurprd03.prod.outlook.com (2603:10a6:10:44d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 18:03:14 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 18:03:14 +0000
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
X-Inumbo-ID: 23bae0b0-6bdd-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BMexKH/p7Ks85Yq2HoVAtWyLbEzeCTGj6H3SFIyU6MRW5ffbB9zR0JuMLitQ/uv4+1ghxbV5FQB7Jpl9CTcYeP44PDFqoMTnkBCvS9dshTWdZO77WQq469pc1WdZSn9NUrR0hoEMdn9f2Kdh1YH9bsZOmTYYO/mf6stoDqBpGIeGd8J0/emLFQlhLhPjrojB4m9CkYyYBOqPoFm3zgGMiKrGAiWklnM50/sWtaiqkJEur20Igv8q4IXTCjJ3+hvR9IP6f7WRyfLtiJZuM/3aTIuio109ReelnyMapWYQIhjZxA5q3LrE9Z28Jmeh7z1XvRGigSLL6L8fRjQyv3FRug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+ZTP1Os1ZD6llE6pROBZu6cL/El+h75nipOOjwjImo=;
 b=yV9dImWBwRYd4oKnBJF829pPYk2+0fUD2uxZ8UifU5qNbhpo5Um6TmDkTcicuVJLwzPb85J/iH3k7LjcQGHiZ58vkYvXEDJ6ucHpvUXwgtXeIWMvPYRxBT0+P0PlZGpBN/ZKZxmufHv7qNXO40WxzMSHAKVr8A5sXhstcgI929d/3BZQcJaOZMq7iAqMilc6HP53utyv6mXQuKHyCCH9DSmlJKDIT79aIz9N69DrvyY/HnLxlfvsjSBieQ+tUmwvNQYw/W+hmDZSeLDnELdxw+1oDInvKMTW0IXwBaEx+gr8QK0Hsq0hC32nRnG6IVgt0+NHbH45TDVPQjBNoaOmsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+ZTP1Os1ZD6llE6pROBZu6cL/El+h75nipOOjwjImo=;
 b=ZoB3J9jNI71/9C/QIHhnRRgROJhQq4x29eYSN4N2Pjl3VIuJ5qjAMwUEgy9Rzev1hOWUQz9szHQ7gdZQTm/FA5qaFrbrw215ipsPTAFOfX/B0X8YxrrSt6+GMsuf8oZL2/QU8KvOH0G8ClffFCwg8nYUfrGtTObR1wKBn6RQw43PFRC+yU9XNFV0rHb6npSDmvAsAFSXFHle8H/Gp8/X73O6BcNLDl+DowWcvaOybN0qZ1vYjRycSIv0E7cidZWkhqLZrNxgCZWBtOaDpSVd7e8RZTOmBF7iyRGqndkBDq/krnWB0k5QQcocudL/UhdP4tvY6VwmBXYGYZtDiYvtAw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "consulting@bugseng.com"
	<consulting@bugseng.com>, Anthony PERARD <anthony.perard@vates.tech>, Michal
 Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] misra: deviate explicit cast for Rule 11.1
Thread-Topic: [PATCH] misra: deviate explicit cast for Rule 11.1
Thread-Index: AQHb/zTS/PoTkNo+DkioPyw1aNE6A7RHTViAgAAOt4CAAHPhAIAABWuA
Date: Mon, 28 Jul 2025 18:03:14 +0000
Message-ID: <a5781ddf-d353-470b-a072-1e0b4e6931dd@epam.com>
References:
 <181a03d5c7625d42c06cf9fa0cf48a9bc6825361.1753647875.git.dmytro_prokopchuk1@epam.com>
 <093601d7-691a-48ee-a0f4-2e86a0f2015e@suse.com>
 <43bea8dd-fbd3-4a64-ad9c-aac5813c15a9@citrix.com>
 <f1fa4da171fd7b6dbfed06cff3d4771b@bugseng.com>
In-Reply-To: <f1fa4da171fd7b6dbfed06cff3d4771b@bugseng.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DU0PR03MB9754:EE_
x-ms-office365-filtering-correlation-id: a188d3e0-f595-4953-0662-08ddce0105a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ekZhVlBLQmk4MnRhWkV6Rk4xY2p6WTZzV0RpNE5JRGNUUWFiaEMxZ2d1U1Bx?=
 =?utf-8?B?bExEOUIyYnRkWmtiNHV5cnh1ZzZKQWFBY0IzaXVSbFY4NnVSb0pXMDFEWEg3?=
 =?utf-8?B?aGZOU2VqZnRMRTd1QjhrZnhrdndBa1JlZ0dqa1FhV3JnUW5HOXJQczJTUWdj?=
 =?utf-8?B?NVV2WE50OGl2eHZFeGhJY0ZHVjRWc2R2RTlSWEJHRWFQTDVscXZaNWMxV0Ru?=
 =?utf-8?B?VXpOM00zZXRWMEFudGRKdWFWZHJaTy8yb2EyaGxaQlNSVEdzV2RRNjJEVXFx?=
 =?utf-8?B?c3dyN0lhK3BDQ2RxTWJ4UWtKN3ZDZGpvZWs3Y21ucXRsSW1JRC9Ua3NCWTJ2?=
 =?utf-8?B?WDFoSDduZ2F4SFdPUWVETVp6bUphUVk3S0ZLRTI2WERMR2YrclFqQmhpdHlh?=
 =?utf-8?B?MVNuY0lSVTR4ZnM4WXZXbnZpbmhHaXRsWmN1VEs5WGVwMjFDZWtVY1RqaWVL?=
 =?utf-8?B?V25paDYzOUpkdHNSZ0JNaVpnZ3BhdDVNb3lwTnIwakJYTzVYRUtsUDFjRk5l?=
 =?utf-8?B?WVVHRkFkalVmM2dQeEdHbGZpVGxuczByQWVCZVNoeHcybHVmWlY5MWhsRG16?=
 =?utf-8?B?Q3VnOGdabWpWMFdZeUlvdnY2bDY0UG41azEyNUZHWHNwRmdTaEtjK2oxaUNF?=
 =?utf-8?B?V3Jjc0pyRWNGc0ROYmU1bzMwUEZoMXRoWXRqeVVyaElLNi9mbS9TMldpWjh6?=
 =?utf-8?B?UkF2dTFXWWNlejR4NzhQWXJ3ZWpHN2M3THVuSG16SHRjaDlvUFNwVWFHazJl?=
 =?utf-8?B?OTE5dTVXWFpWWHlNbUVrc25yZHc0VDZHeTlZSkI5RjhJYTBxdVlRa1QySlhz?=
 =?utf-8?B?a0RrdHdiMDZtUUJrclNqMzd2TWhmaSs4ZmZBWTNXSFVUMzNsYmdwbTkzL29U?=
 =?utf-8?B?eEh5VEN6d2ZSY3B2aGFpcjZoTnVXR0NPcEhqU1dlZk8yNVBDdlEvMXFEU2ZJ?=
 =?utf-8?B?Z1B2U0ZSY0lRUjJiNy9KZjVlTW0rOWJaZ2JVWkV0SGNBN3paUWNQeHhRRE13?=
 =?utf-8?B?RVpQS0VHUGx2SjZIVmkwNEIxakVCT3BHUDFMWWErblI1bWJhd0VIamxyRG8r?=
 =?utf-8?B?NWRmWTJOT095NUNIRkUyRGQ5NUpLTVBaeXRVSEhzeTJMMmFVMnl0djAvclBO?=
 =?utf-8?B?enlud3JveTNHS3k1SUZNOVgrbG8wTmxNOEFGQUhNU3hsMytwMUw4elZyd25h?=
 =?utf-8?B?MStoMFZPK3JNR1NCQ3hZRitGeVZkMUZEbVRGMEUrTnk0Uy9SVEtHUS9xTHRj?=
 =?utf-8?B?M294SkZ3ZjdBaVZlMWxIeElTR2xxUXRRQzRzSVNkaWE3alFiSGdpenkvaFF4?=
 =?utf-8?B?YWRIMHpkZ21YbnpHY3pIdWgzMVpveW5OTFlMZitqMjVnTWlaME9pclhLNSt1?=
 =?utf-8?B?UlhMSnV5L2kydjlHejZ2ZFhpajZLMVF2ZWQxMDFzeS9TaC9iTFBJOGVuTzlX?=
 =?utf-8?B?eFlScmdDZDUvWldtc2lRTFVQNWVuRzhjSzRJeVVKbzN4R2NGSWhFcE41RFZo?=
 =?utf-8?B?SE1BWWpUVStjaGpMVy9vN1F1ZmFwQ3Uxb0puRXJwNitUU0YweTdDS1Y5dlZn?=
 =?utf-8?B?K0hxbVZBb1VJbWZHVnZTVzJRbFZaSGc0OEhqWW5CVExJOCtqUjFzWHl0eko4?=
 =?utf-8?B?cjNsNnJMM3NRL1VMcEhRM3BzeGkxaFBRdkZ6TUxSRWF4QnRoUThFUFpCRlRj?=
 =?utf-8?B?V0l0ZVNzaXJSN3N0UHQ0RXBGV3pHZ3psNUJFOWlQR1AyMTRkTHYzeTc0MnBG?=
 =?utf-8?B?K241T3VwSkJvOWltMmZnVU9HK1BLcCt5MjJYc0d1RHFDR0V2bGlCVTkxK1dr?=
 =?utf-8?B?OTc4RnpQSmdiUi9zLytPQ1BFTEordldDd3ZjSStWRE41NnF6ZlNXWjh2Qi8x?=
 =?utf-8?B?V3NQSW93QzVTNFBkQ0FCU2oxd29BK3FvSW1xc3NSRHlScWw4b1JEekljbWZZ?=
 =?utf-8?B?TWw0Z0Ryb3JxeFdVK1ZzRER2aDQvSXpIUEFjTGE4cjUvUi95SGo2aGdhT3pu?=
 =?utf-8?B?SmFSRGU1UzZRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MlVldW0wZHltL0xwa2xzWmhsNEdsUzh5TnoyNHdLOVBRN3BDZmNGL2RlYXdH?=
 =?utf-8?B?SjdKZnp6Qndvb3Y1dy92cWdtQko2ZlhQcEdaYVhXZ1RwYjZQWHFqU2JncFkw?=
 =?utf-8?B?eVlETVk5UXBGZEZDZDZaTTNuT3hydG5wcVhwSnI3UkVOcmNHRTB3bVRFdFdI?=
 =?utf-8?B?ZkYxL0JnakVDSUR4TTJqNldhQkRWcjNCUmUxRjhYOGhYazhQdjlzSWM5YzAz?=
 =?utf-8?B?YmZ3RTcrL21tSndtVUhReUd1bFk5d29Fa0YvSlhyVGdFUnlSQUxPRVUxM09v?=
 =?utf-8?B?V1V1VUtaRGZoSERISk1pSnM0SG00SCtwUmNudDloTjlISEdSNUhyRFo1UjQ4?=
 =?utf-8?B?MGRBQXFkdkRCU2ZnZ3RGSFB0NWtnQ3lnaGFoOUdjUTVNa0ZYMFRWcURqZDhP?=
 =?utf-8?B?OUZLczNHbFdsRmQ0eStYeXZMTUJkSW5pMWhiQkhTbUtWckpoNFNCT1N1Tjhp?=
 =?utf-8?B?OFJuQnFZMXlLSzY0WVNXcm9ZY05kYUl1TjhpNXVqL2M5ZVIxUGlyUGFSTWo5?=
 =?utf-8?B?TjJpbDNkK0lGTWhSMS8vWFJnd0dFcFRhV1dvaUhEeitPUmoyaGc5ckRnNWVO?=
 =?utf-8?B?VmFJR0JKUlpIeWF2NHpwL0tvQ3ZKY1hYS2lJUHoxZUoyNG04aEh3ZHhBS05k?=
 =?utf-8?B?d3RkZ0RSSWVBSi9tZXBqT0lvMktWWVRDdmcwZUZ6NVByMnk0bXMvWlg2eXl6?=
 =?utf-8?B?QllZSmF1RExOZXNrVW9zWXJCaXkwZC9MSTVnVTVOb2pDUSs2Q2tFdXJCOTh6?=
 =?utf-8?B?QkwwSjVpa2ZKWFZ6L2MrbmRPcS9vRitjY1ZRK0prVWVqTHJEUTdjMWt6Z3VQ?=
 =?utf-8?B?OENqank4VVVOS0JVOXRWdlRJaDdadHFQZnZZWUxpeVppS3JVTVcyV2xXdjMz?=
 =?utf-8?B?MnZhaTcxdTg5bWpUOUdERlNid01tdE00aDRCY2Fxa2ZQZEhIMGFHa0hRMEh3?=
 =?utf-8?B?Q0dhNWlIZkc0b0FQY3gwVXhTZkptYURwbVNURUJUbEFrdG9kaDNpdDY5VFhX?=
 =?utf-8?B?YjZiMHFuUEFyZnNnelBkSjFKUHEwWEcydmRoQ0pTRWI3TjQ1TU1iamUyUk1z?=
 =?utf-8?B?TFdUcnpZOVdKYUdlL244M0s2UkVEb1E1RzJhVXRNNXZhcEIyS2IyNjlCOWV1?=
 =?utf-8?B?VVRMNGpRZkVPeUo2aTNyL3JiaVZCQmVzSEtYZTY2SEljNnRCSjFqbmZzNTJU?=
 =?utf-8?B?anFMRHR5MnhYUmZFN3I4N00vdDRVbHd5OU41MFZ3WGg0UWpiY3RGa0NGVitq?=
 =?utf-8?B?SkdTRlgwUnlrZjlRUVlObDRQSlFrTENqY2ZLNlJKUVRqczhTZTdxSjAydFhV?=
 =?utf-8?B?b2laeHR3MG1sRnYwSHE3SVdXWmNIcUhTNW1RQ0c2SjRVcEMzaXJJWlU0YVdZ?=
 =?utf-8?B?QmJ0eUNNSTVGc1AxK3YrWlhLV1hHK3Q3YkQxMmlmMkdxUFhnWVJ2KzBIQVYr?=
 =?utf-8?B?VE1YOEdDV2Exd3RxY3J4NlIwR1Z6QVY0TnU0czMxektaMFBNeWFpeVF1QTI1?=
 =?utf-8?B?SE5RbytvT3Q3R0lzeXhzbHFUbDhMc3k0OUw3UDM3OWhsVkVTUmE1ck1JSE1I?=
 =?utf-8?B?UE0zdU5lemp6SDlib09hdGcwSVJhbS9wNEQ4d0NhMVk2ZHhRQURRMlVaekNI?=
 =?utf-8?B?cjM1aDA0MFJWZTE5Y3VrUU5zZktQb3BXM3pUc0RkdnkzanVGREVncUVtU0Fm?=
 =?utf-8?B?c0tXbE91V2pvK1RWZjBtamk2NWRkRlYra1FjYXhEb0xZL2dTVzFwRFRERm92?=
 =?utf-8?B?SEZ1emxtNEVOSWtyS0lxMmhUWmI4bWxiU1dPalEvOEowWmpuOWlFOVBQZ0lz?=
 =?utf-8?B?WmdYV3NRcXlwb2JaaWd4N1hwMG5SM2oxa05kME93bHFlZ1VPTjdKL3kyemF6?=
 =?utf-8?B?Q1JzVGkrWS9KbmE2WDVvQ2lERy9iTm0yNnB1OG5zZDRSTU9abHNsS1ZCa2gr?=
 =?utf-8?B?dk9NaTZiZjhSRDN5U2FCZytDSmVzZGNiUkxmSzh6cjV4ZWJ3YzZoQTh5Vitk?=
 =?utf-8?B?My9oTk11djh3em16ZllkbzBBNWVoaU52ZjlEcGFKOUNuUG9xVGVZMytDQjd6?=
 =?utf-8?B?YzBuWGs0cytvRXdvWGJncklYNW43TVkxZjg4dFRjQmhYaW92M0FpY2lMby8y?=
 =?utf-8?B?bXRGMVdLUURSbHROQzROUkZja0t0TzJJV21EUkpSTXNacXppcVptWWdvcVBY?=
 =?utf-8?B?eEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D78B080DA5D75A4B9DE7FC806704F74D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a188d3e0-f595-4953-0662-08ddce0105a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2025 18:03:14.0847
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oB/jZdGC7LLpM6XOACQiTkEeVKeMUywLLVD0vsJ7viI7/e1dQfZskjThJu+FG4U9b8wm0u6UcVtN14/2fZBnAtd+WAxyqmnJExZkPHg+T58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9754

DQoNCk9uIDcvMjgvMjUgMjA6NDMsIE5pY29sYSBWZXRyaW5pIHdyb3RlOg0KPiBPbiAyMDI1LTA3
LTI4IDEyOjQ5LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4gT24gMjgvMDcvMjAyNSAxMDo1NiBh
bSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMjcuMDcuMjAyNSAyMjoyNywgRG15dHJvIFBy
b2tvcGNodWsxIHdyb3RlOg0KPj4+PiBFeHBsaWNpdGx5IGNhc3QgJ2hhbHRfdGhpc19jcHUnIHdo
ZW4gcGFzc2luZyBpdA0KPj4+PiB0byAnc21wX2NhbGxfZnVuY3Rpb24nIHRvIG1hdGNoIHRoZSBy
ZXF1aXJlZA0KPj4+PiBmdW5jdGlvbiBwb2ludGVyIHR5cGUgJyh2b2lkICgqKSh2b2lkICppbmZv
KSknLg0KPj4+Pg0KPj4+PiBEb2N1bWVudCBhbmQganVzdGlmeSBhIE1JU1JBIEMgUjExLjEgZGV2
aWF0aW9uDQo+Pj4+IChleHBsaWNpdCBjYXN0KS4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTog
RG15dHJvIFByb2tvcGNodWsgPGRteXRyb19wcm9rb3BjaHVrMUBlcGFtLmNvbT4NCj4+PiBBbGwg
eW91IHRhbGsgYWJvdXQgaXMgdGhlIHJ1bGUgdGhhdCB5b3UgdmlvbGF0ZSBieSBhZGRpbmcgYSBj
YXN0LiBCdXQgDQo+Pj4gd2hhdCBpcw0KPj4+IHRoZSBwcm9ibGVtIHlvdSdyZSBhY3R1YWxseSB0
cnlpbmcgdG8gcmVzb2x2ZSBieSBhZGRpbmcgYSBjYXN0Pw0KPj4+DQo+Pj4+IC0tLSBhL3hlbi9h
cmNoL2FybS9zaHV0ZG93bi5jDQo+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9zaHV0ZG93bi5jDQo+
Pj4+IEBAIC0yNSw3ICsyNSw4IEBAIHZvaWQgbWFjaGluZV9oYWx0KHZvaWQpDQo+Pj4+IMKgwqDC
oMKgIHdhdGNoZG9nX2Rpc2FibGUoKTsNCj4+Pj4gwqDCoMKgwqAgY29uc29sZV9zdGFydF9zeW5j
KCk7DQo+Pj4+IMKgwqDCoMKgIGxvY2FsX2lycV9lbmFibGUoKTsNCj4+Pj4gLcKgwqDCoCBzbXBf
Y2FsbF9mdW5jdGlvbihoYWx0X3RoaXNfY3B1LCBOVUxMLCAwKTsNCj4+Pj4gK8KgwqDCoCAvKiBT
QUYtMTUtc2FmZSAqLw0KPj4+PiArwqDCoMKgIHNtcF9jYWxsX2Z1bmN0aW9uKCh2b2lkICgqKSh2
b2lkICopKWhhbHRfdGhpc19jcHUsIE5VTEwsIDApOw0KPj4+IE5vdyB0aGlzIGlzIHRoZSBraW5k
IG9mIGNhc3QgdGhhdCBpcyB2ZXJ5IGRhbmdlcm91cy4gVGhlIGZ1bmN0aW9uJ3MgDQo+Pj4gc2ln
bmF0dXJlDQo+Pj4gY2hhbmdpbmcgd2lsbCBnbyBlbnRpcmVseSB1bm5vdGljZWQgKGJ5IHRoZSBj
b21waWxlcikgd2l0aCBzdWNoIGEgDQo+Pj4gY2FzdCBpbiBwbGFjZS4NCj4+DQo+PiBJIGFncmVl
LsKgIFRoaXMgY29kZSBpcyAqZmFyKiBzYWZlciBpbiBwcmFjdGljZSB3aXRob3V0IHRoZSBjYXN0
LCB0aGFuDQo+PiB3aXRoIGl0Lg0KPj4NCj4+PiBJZiBNaXNyYSAvIEVjbGFpciBhcmUgdW5oYXBw
eSBhYm91dCBzdWNoIGFuIGV4dHJhIChiZW5pZ24gaGVyZSkgDQo+Pj4gYXR0cmlidXRlLCBJJ2QN
Cj4+PiBiZSBpbnRlcmVzdGVkIHRvIGtub3cgd2hhdCB0aGVpciBzdWdnZXN0aW9uIGlzIHRvIGRl
YWwgd2l0aCB0aGUgDQo+Pj4gc2l0dWF0aW9uDQo+Pj4gd2l0aG91dCBtYWtpbmcgdGhlIGNvZGUg
d29yc2UgKGFzIGluOiBtb3JlIHJpc2t5KS4gSSBmaXJzdCB0aG91Z2h0IA0KPj4+IGFib3V0IGhh
dmluZw0KPj4+IGEgbmV3IGhlbHBlciBmdW5jdGlvbiB0aGF0IHRoZW4gc2ltcGx5IGNoYWlucyB0
byBoYWx0X3RoaXNfY3B1KCksIHlldCANCj4+PiB0aGF0DQo+Pj4gd291bGQgcmVzdWx0IGluIGEg
ZnVuY3Rpb24gd2hpY2ggY2FuJ3QgcmV0dXJuLCBidXQgaGFzIG5vIG5vcmV0dXJuIA0KPj4+IGF0
dHJpYnV0ZS4NCj4+DQo+PiBJIGd1ZXNzIHRoYXQgRWNsYWlyIGNhbm5vdCBrbm93IHdoYXQgYW4g
YXJiaXRyYXJ5IGF0dHJpYnV0ZSBkb2VzIGFuZA0KPj4gd2hldGhlciBpdCBpbXBhY3RzIHRoZSBB
QkksIGJ1dCBpdCB3b3VsZCBiZSBsb3ZlbHkgaWYgRWNsYWlyIGNvdWxkIGJlDQo+PiB0b2xkICJu
b3JldHVybiBpcyBhIHNhZmUgYXR0cmlidXRlIHRvIGRpZmZlciBvbiI/DQo+Pg0KPiANCj4gSSdt
IGNvbnZpbmNlZCBpdCBjYW4gZG8gdGhhdC4gUGVyaGFwcyBzb21ldGhpbmcgbGlrZQ0KPiANCj4g
LWNvbmZpZz1NQzNBMi5SMTEuMSxjYXN0cys9e3NhZmUsIA0KPiAia2luZChiaXRjYXN0KSYmdG8o
dHlwZShwb2ludGVyKGlubmVyKHJldHVybihidWlsdGluKHZvaWQpKSYmYWxsX3BhcmFtKDEsIHBv
aW50ZXIoYnVpbHRpbih2b2lkKSkpKSkpKSYmZnJvbShleHByKHNraXAoIXN5bnRhY3RpYygpLCBy
ZWYocHJvcGVydHkobm9yZXR1cm4pKSkpKSJ9DQo+IA0KPiB3aGljaCBpcyBhIG1lc3MgYnV0IGRl
Y29kZXMgdG8gdGhhdCwgbW9yZSBvciBsZXNzLg0KPiANCj4gSSBoYXZlbid0IHRlc3RlZCBpdCB5
ZXQsIHRob3VnaCwgYnV0IG9uIGEgdG95IGV4YW1wbGUgWzFdIGl0IHdvcmtzLg0KPiANCj4gWzFd
DQo+IHZvaWQgX19hdHRyaWJ1dGVfXygobm9yZXR1cm4pKSBmKHZvaWQgKnApIHsNCj4gIMKgIF9f
YnVpbHRpbl9hYm9ydCgpOw0KPiB9DQo+IA0KPiB2b2lkIGcoaW50IHgsIHZvaWQgKCpmcCkodm9p
ZCAqcCkpIHsNCj4gIMKgIGlmICh4IDwgMykgew0KPiAgwqDCoMKgIGYoKHZvaWQqKXgpOw0KPiAg
wqAgfQ0KPiB9DQo+IA0KPiBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpIHsNCj4gIMKg
IGcoYXJnYywgZik7DQo+ICDCoCByZXR1cm4gMDsNCj4gfQ0KPiANClRoYW5rcywgTmljb2xhLg0K
SSB3aWxsIGNoZWNrIHRoaXMuDQoNCkRteXRyby4=

