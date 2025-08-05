Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90850B1B2D2
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 13:53:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070410.1434040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujGET-0001ma-HW; Tue, 05 Aug 2025 11:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070410.1434040; Tue, 05 Aug 2025 11:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujGET-0001kd-EE; Tue, 05 Aug 2025 11:53:29 +0000
Received: by outflank-mailman (input) for mailman id 1070410;
 Tue, 05 Aug 2025 11:53:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L9Xd=2R=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ujGER-0001kT-Uv
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 11:53:27 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc18ba1f-71f2-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 13:53:27 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by GVXPR03MB10931.eurprd03.prod.outlook.com (2603:10a6:150:217::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 5 Aug
 2025 11:46:43 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 11:46:43 +0000
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
X-Inumbo-ID: cc18ba1f-71f2-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IcTJNrMNkihHIwLp4FzrEQLxsQScUb1fkVWpB0bY2Sh7IkUnOz3w6TkIxOZ31whWxg5W53mwgRSIQXp+A1cbWDQcmRKa8mIcygqaunsLanJFy1f+XkpXMfPBqXFilp9nheBwazCPjBTBJqcQ25On2PUtjKpF07O9Ch9+FxzDjmkYlD0/RHwYwzF8s9+gfgZt884ZJJQlRcf+m8BTQgihJU4fGt8WZRR58hphLCNmfqHcnfq0crNVvd4L326mgvlfdLqIT0POyCRF9BV0JJqI8AH0FdHNRF2r212Jf+RejxwBl1sZjrhVBsR8oeJ2VhsW3lGsSyXakO9MciH7hg86NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XFxl0p7WqvW6dsnhOQFeWIJBDpElqTY5n6pcYajung=;
 b=hBpjDoR7yg+f2NWqfF2BiPGRG+NY98MZyma6kcFJ63VaJZYrlWTz2MFJ/Kj+n9sCJ3LDXJLrYdlqH9YdVflPW9NkzFea+TEQRI/5XtU7lzchTaS0zHWW4vKDk8whb/K2ujNB4bknFkQMhztnztGhRKNMbzydlSEOaExQpN8yn0v7U5gsn1TzjCg14PEuE2hCYdeF2NJU+zL4sMDVSmlrW5SsTYMhby5mefOP7gvh28oaCip6EhL3epX/JU/ZdIyMzcCpWjYeJfw+UiftmfHZhF6VX56nq2dm82SBZPpPdN63HyJ5jMPpc25RoV7z0X8H43tHqo2RlF1ZYSwlY+xpww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XFxl0p7WqvW6dsnhOQFeWIJBDpElqTY5n6pcYajung=;
 b=bg2VGkmjO9zeqnxTPIEnsoYXJfCD5wIqhAM2bVrDIoTzymkVpMEwnY77FCqAvBxBp6cqmTwGfcR3KOtv4Cq+cFCgC+qATYd8DLgXzCp6adAZpkbyDJ/47fx1rETGoU1ywQqYMgDg7DcVnGmMpieqrse0O3dybGU5lI4E5hB0gGIKxY1DLYi1fLeOpHoqnZkzMUG1/A4lDgUID9hhWkL6O4divsxNFBxprPLlCu+iJ3zbnXvXLWKs8Xiums7DNmAEiaz5TZvJF2M+0BfzS8gNGtP5YWjL5HStCnyRAwmUTzyk6LJcQ7eIdM7e8uRs46kc7Kk73X67cKez4k6UXrFkXw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] misra: remove default case in single-clause switch
Thread-Topic: [PATCH] misra: remove default case in single-clause switch
Thread-Index: AQHcBWXfPSyq9APrf0Os3CWQrCUztbRTt4iAgAA65QA=
Date: Tue, 5 Aug 2025 11:46:42 +0000
Message-ID: <40ac0012-d396-4d6d-9931-7aa3b8366e9e@epam.com>
References:
 <725ec86ac1aa883c35fb30b8f226c95cbe0934e9.1754322299.git.dmytro_prokopchuk1@epam.com>
 <321d07ea-1688-4036-a031-37c46dab5c15@suse.com>
In-Reply-To: <321d07ea-1688-4036-a031-37c46dab5c15@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|GVXPR03MB10931:EE_
x-ms-office365-filtering-correlation-id: b066fadb-4bd6-45b3-34b2-08ddd415bf91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OXp1bzZUbDRRN0FmQlEvMjc5T2RsMDhrbExUVlYwNW5xa25Gam53ZVFKTGNK?=
 =?utf-8?B?WmRNbmlnS0tYMC9uV0FmQ3FoTG9vSUJPWE4vYjkyemtjTVNveTRjUk0rOWpN?=
 =?utf-8?B?enoySEVWajA3RmZqaWNQL1ZLTnFXZDlmUHRBTWRmLzVzWlJyY05jenVJMW9Z?=
 =?utf-8?B?L0dkblVBNktzK2czUVNvUWlxRzAvbVhuZUJtb3AzaVNEM01jcXQ4KzhWM1RE?=
 =?utf-8?B?bFFkZmNZYmYrRTU1RVlyVGV2enFJWFRVS3owOXkwRlR6ZmdCaVE0ZmI3Nno4?=
 =?utf-8?B?Rnhhak1HSEZxUjBvcHZ4Z2JiSUdpdi9vYU5iQjkybFRKRGljT2Yvb01VOXhn?=
 =?utf-8?B?Z2kvUzdPN3diL3ppemcyVUU5Zkh3bWdndjg2Ym1ZdTZueEVVNFd1OTcvSFZI?=
 =?utf-8?B?ODdZTVRNekJDaWRVSjNqNzNkVitlZHU4V0EwblpCVjg3bmpWTWhDbkdRWDh2?=
 =?utf-8?B?RWhGOEZnUjJ3S1pxQ3hKdFNia0paYTBSMWhFcWpxVmZNZVY0MmJTaTFvMlFV?=
 =?utf-8?B?OUFRK3NhVDNSRUUybGFYWkxaMGhBSm9FZ05tRVdUdlQyNU91VlBZT2ZHQTl6?=
 =?utf-8?B?bzFzY1RDMENWdWpNWUpiNllJR2t2VXJBdWNVOGV0NlBEWncyRGo1RkxJdldB?=
 =?utf-8?B?YTVDZHlkb1NkeTlJUnowYkRYYUFEckhKQlBuN3RxeVd4Skc5L0VzZUZocTBH?=
 =?utf-8?B?R2Y0c0hOL0k4WWVaRjRQaThJZitQZTVvVUJicTlIVi9sWnpOaEtqSStLYlZk?=
 =?utf-8?B?WmZZcjVkUzhNVGdDSjRRaW1GeEJxOXNYemo0VGdzUjl3TjR3RVpaL3JOUGxY?=
 =?utf-8?B?VjZpU1N5dmdsY1BmWTNjWnR2VlNmWC93VGlaZkwzMFVXbCtuZ3VtY3hObWd4?=
 =?utf-8?B?Q3FQcXlWeVk3RkNWWitmQ1EyUkF3Q1kxN1hPOHJvbUM4UktTTUF6WVJWbjB6?=
 =?utf-8?B?L3h0Uno1T3BaUTIzWW1nSVpYZjRBMGtvODY1Tm1GMHZ2ZWFWQjd1aVo5V090?=
 =?utf-8?B?MjBoT3c4Wjc4SldLV2N6N0N5K2N5SzNIWWtoUnZ1ZEtKM01BY3VwSnhMMFl5?=
 =?utf-8?B?dlpVNjJsS0NBeDhxSktBVm94M1czKzExbGRCUHJXbzAxL3l5OHg2UmtSRDB2?=
 =?utf-8?B?Sjlhb0x2UXhHNjdtUjYyaEFjc2QxM3AvcEFoSEM1dkhFZ2hkTmpSQlVQUG1k?=
 =?utf-8?B?S2RUN3NDalYvRTJ2L1J2ZVFhaFZ6SWpncWl2a1VERFNISlFFeGEvdUJjL0F0?=
 =?utf-8?B?Z3dqSHpOY29hVnE0bE9VTmMxOGlnQ2lZMExlc2hOU2J4aVRKR3p1NTBMRXNz?=
 =?utf-8?B?OFJMMm5TMWFEbkVrVUFRU3ZIbzdMV3IrYWlyZWwvVDErRE8xN1Mzc2c0ak9j?=
 =?utf-8?B?emRodnJsalQ2a05jcS9naVkwTk5VZmdQaE1kREpxSkJBQnRIWThJNGMrYjNp?=
 =?utf-8?B?ZFk0c3QwT0l2WXBqbjN1Vnc4bEU4TitNcTk2c2ovQm1IQ2FwSFNSNExDM2dp?=
 =?utf-8?B?andiUXJZV3JDVGFFNHJLRmduLzN1c3ZXUGtyc092NituUWJVSHlOaXJzSWov?=
 =?utf-8?B?dzFIMTAwYmJBSHBZNFl6UllJNm5hT2ZtQ2VNUFNoQnZId0t2bk5jamVnLzF0?=
 =?utf-8?B?dHJsZE5PWDBRNUp6dWpRYkFnWWVXYW1PVnJCOFhuSjViNktSbEdXanpjVlRW?=
 =?utf-8?B?bmtVZ2VvOUlZdEVzMDJCOExOa2s2SjAzNXluaHFiTGVkSUNnVmdseDFJTDdT?=
 =?utf-8?B?WWhnSkE2MnBSbnhCbkJRcXJTakxpSmlQcGhGalNzV25TMTBBSVMycmVTSzVq?=
 =?utf-8?B?WXJSTGZEdS9Cam50RE44UTg2TTBrVURqWU9kd0tOeE5KT0hObHNlNTlDYWo1?=
 =?utf-8?B?RXNHUWdNWFAvRnkyUTcySXV1SVovdjRzWFdTQlJtaHJZU2pwWFFoZGhHQmpB?=
 =?utf-8?B?MFVjRHYzNXdNMUhzQWNNZHZ5a0ZQUVZ5bmtTcVYzbVJCVFM4dTlMUHdXRGVG?=
 =?utf-8?Q?8lVx+6gULAsm7PVOfmQgmFll8fV5c4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?azBrUGFiRVFISHFLUzBmQVFyVDcwTU13YlRxK2VGaVFISEl4YXVCVVFnTW9S?=
 =?utf-8?B?SU14MHhzandxdVkvMEFKWkJwRG4rcTN1RzRFTFdoMGNlTU5ScWplUytheWZZ?=
 =?utf-8?B?WnZ6R1ZjZ1AzUjFRYXc1Y0hUSXB5MGNzRWJlQzhLQllENyt2M1FkbG5BNjF2?=
 =?utf-8?B?ck0wYkt3R21oL0FhYnduMFV6T1VJVmFjL0FQaDhrUXppTVgzaHZkWHU4TEpR?=
 =?utf-8?B?VExEdGptRmFjSWlyTEx3ajJ4L2xKNHZWVXdIYzdJZFRCMSs4UmVVVGQ4L043?=
 =?utf-8?B?dVNnamU1VXNvU0ZMelVmUUNZK2lYdFJGaHkwOVdFdEZQT25KWG1IaXNiaHlJ?=
 =?utf-8?B?OVYrbldrRnIrYUhzaXJOV2lNZ3hkb3FUaTZSeGFYV1RTS2sxV1U1SGdKUFli?=
 =?utf-8?B?Z3hUVFp4Qk5aK21BM0FkWE1nU3RydldHeGRCWDlpQk9YSUp1WmpzSHlPN2w4?=
 =?utf-8?B?SHhXMm1oSEl2TGg3eUllMDkzNlpxaHVkZS9nc20yNGE2Y0EvTE1BM1RIa0NY?=
 =?utf-8?B?WEQzL2x4ZEFJOUNQdE1UL2NnaHI1UXlMaXYxbkNtNmNTNnlDcWhvbjMrN2hH?=
 =?utf-8?B?cTZNNUliR2p3MDU2cHQxQ3NZckJRTm5zOHROTDVPaHRDVlExTW9pVWp3N1lF?=
 =?utf-8?B?TFh0M2dOdjJxekhqQnBRa25hZTZmMlQrL0lOaWdQUXpIMjVxcytPZEpYZzcy?=
 =?utf-8?B?bEpXeWR1WG1LL3B0SUxqRTZRcXNseFJmUXdWdkRoUFplTW1pM3lnbDM2TmZD?=
 =?utf-8?B?dGU0cUtkZHlNdTJsRGZxUE1jQzMyWDBXak53VWJJSFkxNUpveDMveWhjZ0lV?=
 =?utf-8?B?QzQvUDhTNEtyTEo2cVpBczFVYnd2amZSTUN6VEZ5QS9MSnlTQTJDN0t6ZUk5?=
 =?utf-8?B?a3JsUHVkajlaa1J0VmJBbFBFMmZBS3NhWnNvTkY1YlhudkJsQ0Zwd1U4UjNW?=
 =?utf-8?B?MzNkUzFPOWJHcDFPeFBvdXhIREZtakZxMFVLeGFaUlJOZ1djcG9kUWZmSGIv?=
 =?utf-8?B?bXdiSkdPTDR6L0pCeHIyOUdOekNmby9aT2Y2R2hYN2xNUVFSTjgvdmV0L0JP?=
 =?utf-8?B?aTlKL3pZOER0aXdlSEgxYXR1VWxTdThJS2lleWF2Q1VXcUs2dUg2clVzb05z?=
 =?utf-8?B?YzRiWS8vQlhyUXhtT2p3cUp3bEtwQm8xRzB3OXVIV2lQTXZhZDJYK1dNVG5T?=
 =?utf-8?B?RVpVdktvK3FhUXc4MituUjdZU3hidW1RUGZLWUtzbHdhR3BBeDI3a04xUmY1?=
 =?utf-8?B?aWE5T0g1Zi9wTGV5dTR5RU1QUGNNaTZ4THdXNHZVUnFUNE5udzFhUzRycGMy?=
 =?utf-8?B?Z1hnZThTb21VVStXTUtFa1NEd21TWkJrajNURnR2dXF5R3lJMlUrRzRqNlNR?=
 =?utf-8?B?RGlKSXltN2hTMngwMkJFOUxucEZKV0Q3emFtNFgwMUo0MWREMmNLcDczblND?=
 =?utf-8?B?TFVjMnVsWi9BVzkwZE1nSUVuaW1oLzZDdmF6ZEs2OHNUcGZHL2JZUmIvYzd1?=
 =?utf-8?B?UFRXRnpheEMvbDdMWkFQTTBiYlRTNkdzV0t2WUJtcis0bGJEcGJwaVdQelMz?=
 =?utf-8?B?ZWZyOFlTN1N1ZWFQdmNEeE9DN0tsRGZWYWhWZ3ljMGxlZVRETVFFaWQxOE0r?=
 =?utf-8?B?TnBFY1JZcE1wZzBtb1NRQWZNSERMMmgxRHd3NTRWVFZPTHdEaXo4djZmaDlX?=
 =?utf-8?B?M0NCY3l3RjNZb0N4V0hNUjBoUWkreWcvWkl4N1FCbzJnVjhQUWtRdWhaQ2lp?=
 =?utf-8?B?dTJoWXQ2b1FtZnNhVzZURm8vd2xaL1Nna1Z2bUlzMFhtWm9FdFVDU0ZHYkRi?=
 =?utf-8?B?bzNjUlQrZU9YSmFuVjh5cXdscEZZdDI3VUpBWm1aQ1JhWk51NDVZbnV0dWpv?=
 =?utf-8?B?VFNaTnNxN1Z6dlVtRDRsSytvSFFBRnYzbENaU3hydHNaS05raFJ6M3lXYXB6?=
 =?utf-8?B?eEUxK2NzOFB6OFlWNWFhQzRjT013Y0lsUG5oTFpqMjZaUThUczA5U3RRSERP?=
 =?utf-8?B?MStqbFZuTUNjeGpkanZ5c09rN2VsTFNlc0lwdElPTHdBUlUxcGJGYUtPUTdZ?=
 =?utf-8?B?Z28yUktWNFhEN3d1REEzejQ4TDdOSk9mdXRQb2tyQllzYjJuNml0MVBOUVhl?=
 =?utf-8?B?eWwvdXdwdStsZThxQ1VSSGh4R1RBbWltVW8xd0RSSUh0MWtMamhKWTlnUUhn?=
 =?utf-8?B?VVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6DDBF328555DAF489A2E088E90E394C1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b066fadb-4bd6-45b3-34b2-08ddd415bf91
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2025 11:46:42.9654
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n+mb8jHNMYrg14okHPzsAAY1yNCVPTZK4WA2XHTrD7q0r9JdKH/fP5UJb0ZJE7ZkyqGa+7yRHRMFjwTTlumQ0oUxspTf5ZRj3evtI2xdQBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10931

DQoNCk9uIDgvNS8yNSAxMToxNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA0LjA4LjIwMjUg
MTk6MzMsIERteXRybyBQcm9rb3BjaHVrMSB3cm90ZToNCj4+IE1JU1JBIFJ1bGUgMTYuNDogRXZl
cnkgc3dpdGNoIHN0YXRlbWVudCBzaGFsbCBoYXZlIGEgZGVmYXVsdCBsYWJlbC4NCj4+IFRoZSBk
ZWZhdWx0IGNsYXVzZSBtdXN0IGNvbnRhaW4gZWl0aGVyIGEgc3RhdGVtZW50IG9yIGEgY29tbWVu
dA0KPj4gcHJpb3IgdG8gaXRzIHRlcm1pbmF0aW5nIGJyZWFrIHN0YXRlbWVudC4NCj4+DQo+PiBI
b3dldmVyLCB0aGVyZSBpcyBhIGRvY3VtZW50ZWQgZGV2aWF0aW9uIGZvciB0aGlzIHJ1bGUgaW4g
WGVuOg0KPj4gJ2RvY3MvbWlzcmEvZGV2aWF0aW9ucy5yc3QnOg0KPj4gKiAtIFIxNi40DQo+PiAg
ICAtIEEgc3dpdGNoIHN0YXRlbWVudCB3aXRoIGEgc2luZ2xlIGNsYXVzZSBhbmQgbm8gZGVmYXVs
dCBsYWJlbA0KPj4gICAgICBtYXkgcmVwbGFjZSBhbiBlcXVpdmFsZW50IGlmIHN0YXRlbWVudCB0
byBpbXByb3ZlIHJlYWRhYmlsaXR5Lg0KPj4gICAgLSBUYWdnZWQgYXMgYGRlbGliZXJhdGVgIGZv
ciBFQ0xBSVIuDQo+Pg0KPj4gVGhpcyBjaGFuZ2UgcmVtb3ZlcyBlbXB0eSBkZWZhdWx0IGNhc2Vz
IGluIHNpbmdsZS1jbGF1c2Ugc3dpdGNoZXMNCj4+IHRvIGF2b2lkIHZpb2xhdGlvbnMgb2YgdGhl
IHJ1bGUgd2hlcmUgdGhlIGBkZWZhdWx0YCBjbGF1c2UgbGFja3MNCj4+IGEgc3VpdGFibGUgY29t
bWVudCBvciBzdGF0ZW1lbnQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogRG15dHJvIFByb2tvcGNo
dWsgPGRteXRyb19wcm9rb3BjaHVrMUBlcGFtLmNvbT4NCj4gDQo+IEl0J3MgYWxsIENQVSBub3Rp
ZmllcnMgdGhhdCB5b3UgYWx0ZXIsIGFuZCBpaXJjIHRoZSBvdXRjb21lIG9mIGVhcmxpZXINCj4g
ZGlzY3Vzc2lvbiB3YXMgdGhhdCBwYXJ0aWN1bGFybHkgZm9yIHRob3NlIHdlIF93YW50XyB0byBh
ZGQgY29tbWVudGFyeSwNCj4gY2xhcmlmeWluZyB3aHkgb25seSB0aGUgZ2l2ZW4gc3Vic2V0IG9m
IG5vdGlmaWNhdGlvbiBuZWVkIGhhbmRsaW5nIGluDQo+IHRoZSBwYXJ0aWN1bGFyIGNhc2UuIEl0
IG1heSBhbHNvIHdlbGwgYmUgdGhhdCB0aGUgKGF0IGxlYXN0KSBvbmUgY2FzZQ0KPiBvZiB0aGUg
cG9zc2libHkgbWlzc2luZyBoYW5kbGluZyBvZiBzb21lIG90aGVyIG5vdGlmaWNhdGlvbiBzdGls
bCBpcw0KPiB1bmFkZHJlc3NlZCAoYW5kIG1pZ2h0IGhlbmNlIGJlIHdyb25nbHkgaGlkZGVuIGJ5
IHRoZSBhZGp1c3RtZW50IGRvbmUNCj4gaGVyZSwgaWYgaXQncyBpbiBvbmUgb2YgdGhlIGZ1bmN0
aW9uIHRoYXQgYXJlIGJlaW5nIGFsdGVyZWQpLg0KPiANCj4gSmFuDQoNCkkgdW5kZXJzdG9vZC4N
Cg0KVGhhbmsgeW91LCBKYW4uDQoNCkRteXRybw==

