Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEF9B22093
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 10:21:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078419.1439409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulkFb-00067j-0j; Tue, 12 Aug 2025 08:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078419.1439409; Tue, 12 Aug 2025 08:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulkFa-00065P-Sn; Tue, 12 Aug 2025 08:20:54 +0000
Received: by outflank-mailman (input) for mailman id 1078419;
 Tue, 12 Aug 2025 08:20:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3OTH=2Y=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ulkFZ-00063n-Pw
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 08:20:54 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42e85816-7755-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 10:20:52 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS8PR03MB9560.eurprd03.prod.outlook.com (2603:10a6:20b:5a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 08:20:49 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 08:20:49 +0000
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
X-Inumbo-ID: 42e85816-7755-11f0-a327-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/G0ZIQoYXC0oFKAr/zaDuOxiNsUMdfnHbr/ZE32npIcdBufa/wRztqjA5zraaWxzQUxptsKQtwrPSC4miPSzy6Wy4XFVc81eaSESP981wOJOnRbmkpXXYFGKdInhQltPHsWd0catRCN623OtcJW/LStvRY2LxbTOMch2y+o/63WTdGSeNoJxA4GWzSAp2adqZw9tufFCBOOGghgu3Ogfk714/mnCmpd11UddCbSn8uMwkZQT+NXVE8n5eUALxYLAxBp3ZvI8IKex474uyHbKNuKHQQVHXgbqUsojWEc5RZLqqyibSWr2VmQ/28r8cMidlQ14maa0vM6JNvmz3h8eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fj1dvLvEPVg5e8jFlR5BgUA5s9sJwN/DWxxqXvNOSc=;
 b=epoFqZ4nLpoYj7iI+c4EaUYARRFDKRUg6IPH9EinoFSKgFwj8MADEV+U4BvJvhbeSddUWm/janEwq+qqFXrHrcfPoa8dgAM/5q5MXroHJ+f+Q4EpY179ON1wN/2uu6JtCSs+rwSoJjcORxlPkdlzVHGwVkC7KJ3ll9lKD3e47dPNqvrRlnC4Qk54nByrI9sTwotCAO/Ll2DAqB+opX9EdSEW6GxduHoOZf6meNPOGGhfzodnfhJVPmUGa/F8ZKIEukDJ/f2tBX4J6EW3Z2RC0I3/2GgnoNLVIfegGqECn07Ml1WXTmXTNA4DUUgQlpamClVi5zG5Msy6cNPcbkQdHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fj1dvLvEPVg5e8jFlR5BgUA5s9sJwN/DWxxqXvNOSc=;
 b=AgzSQKdGKGwwFICm+Hi6i36WU8R8Dv0ay/qSVmqUb2kWB3kiSz9xBnRtko3eO/Q3yoK2+8Pc/XdOKZ9Wx05JD9fxoqmjBYkpIBOBJ/T1Wnw/kSNM/YgcJIZJtGL776oYjtJWThPeGvoWpB/W140lERaK6DAWtje5V/3XvVq/wACQ5LIR8n/wqaOUI4yLnbclXx0iP9Vzp2vnzQHU16AIX1AnwcdFCfuoPOnA0qFj5e38zBQQkg1JIl9BodLYVTOX394MrXiSkNkgLuE3uFs5QZ8ByLGkGolG/y1Il1aHI8uA4leaJlDRtOY6AHWUqRzw7JQYtY63EetExgcoOku8gQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH] misra: add ASSERT_UNREACHABLE() in default clauses
Thread-Topic: [PATCH] misra: add ASSERT_UNREACHABLE() in default clauses
Thread-Index: AQHcCv7M4bE5kwDncUeSEAS4rjYqyLRd9fOAgAC4EwA=
Date: Tue, 12 Aug 2025 08:20:48 +0000
Message-ID: <209225bf-38be-4e93-a79b-41842244f0e0@epam.com>
References:
 <7cd71ed21383c189fedb3250ddde54a593f7f98b.1754944131.git.dmytro_prokopchuk1@epam.com>
 <59396fd1-ca82-4655-9dcf-ec36e0d51ffc@xen.org>
In-Reply-To: <59396fd1-ca82-4655-9dcf-ec36e0d51ffc@xen.org>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS8PR03MB9560:EE_
x-ms-office365-filtering-correlation-id: 0bac9636-c970-4810-db44-08ddd97924f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|42112799006|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?M1lFazJ2RTFuV2NtN3JwMjFsd05BYklOQVUyZWdCd2ZDSXQrUDRoYm52Njhh?=
 =?utf-8?B?YmpmU1NtUkdaMTF6S21FbkxLSjZKUC95Zmswb0ZhVi84eEZQWVY5cXJuYnU1?=
 =?utf-8?B?VmVOUncvYnpaSmZybEhSSVBiRWNkQktYYnhZdTFRTkpQSlU5UUF3ZWdRdHZL?=
 =?utf-8?B?Z2VzRCtvWGlwbXJ5eC9LKzFLdmhOM2xwbklFNHVMNlhhK1N4RUZjd0hoY1p5?=
 =?utf-8?B?MmVibEpOM0NHL3UvNWdqbFg0Rzd2c255ZjVlTEN5TnlPVU9TMlVkZGZDSktX?=
 =?utf-8?B?Y0lmQk55dnhka0NwN2QzZ2Nvb2VPODdzQWQzOVFFMWFPSmp4cXdqQkNmTjJk?=
 =?utf-8?B?NEM5THVqK3UveEk2Y3h1ZC9uY0NFQVE3c29WeE82WktqTEZySXZCOXFEbklh?=
 =?utf-8?B?ZDRHem9KbThQRUNOb0prSkQ5ajZoU2hMbitFQTJqLzJ0aFBBVVdndlZTak01?=
 =?utf-8?B?eWFQaEdkOFVNL0lINXFzdVdOK1NpZjRub3NGMWV0QnBVd0E1MTJSQzBWNTFN?=
 =?utf-8?B?OVUvM01HdHRYUEdFVzg0bzk1R0IvdzBNUzFnYVkzNDY5cTZVUzFBYXpsWFoz?=
 =?utf-8?B?NlJWS2hPMUxiYW1jTGFvdnZqa3pwWU1xN0t4bkFDYnNoTExzNXR4N3pBa2NO?=
 =?utf-8?B?Mkx3bmlDR2RqeXFLcENlRUg1aCtiZ0NvV25MYkJwYi9YUXdvR2ZpS2c3bGQ4?=
 =?utf-8?B?NTdMMG1wYTR1VUVxYnR4eFM5L2JvejM5dGR5QlZ6N09ta090YW94cGRtdHJk?=
 =?utf-8?B?NnhDdkNSL3dIQ3RENnNqc0ZQNlVxL3ZqNkJ6V28rbXp1ZmZFQitjQU9ZRElZ?=
 =?utf-8?B?aDNIOE0vUTBWT3E0MTl4Yko0M3NvcXR4a3JWaUVaSW5QZnFuVmdvMm9lS3pu?=
 =?utf-8?B?YUd3c2hiVVJwMDk4b3UvT0orSVNmUCtMZThEeWVmRkxKZ1Z1YXp5RytwT2pI?=
 =?utf-8?B?ekVSUWt4QU1lS0NONEwwSVgwN3dpeVlyaXdXRk5yYUhhcTFKRWRyMDBadlJX?=
 =?utf-8?B?YXhHL2pDVTNPQ2pieVV2a1JVSUh1ZGV2U2RJRmVEWmg3dUFJcEhYUVZSU0NY?=
 =?utf-8?B?SnN2V2xIUEw1UnBQellpNytVOTYxYzNSVEtScjRTdzJzSTh2cFJnbVpMYVo5?=
 =?utf-8?B?Vmtpbys2Nmo3ZnlYa2d0bkdLY2xNMXFCb3VzdXdiOUNxdHZWZHNBMGRZVzFm?=
 =?utf-8?B?S0dXdVJFWlBuT1RLTXZuZWY0M2Z1cU96bS9CSEg3cmh4MXlvYnBpekhXUUNU?=
 =?utf-8?B?VEkwR25KOUk5UHZtMHAzVTIrWDJNZGQ3WXJRYWx6MzMyRUxjNE5jWk1HbjJ2?=
 =?utf-8?B?a3M1VjZ5R0xZdXp2clNncjZEV0Yxdm1DR0JIVlVZbzhicFVCdFY3UGJsVlpH?=
 =?utf-8?B?c2ZIWmpZMEZyZzFEK0lhQkh0L3pRcVFpYllCTXpCL1lMWjZSZ0hHR0ZOcFpl?=
 =?utf-8?B?KzBKbUl3KzFkeGpqQnM3bGFCTElZWjc5TEUxV0pxTUU3Z3JzcXp0T2xEMldz?=
 =?utf-8?B?cFhreXNIam43YmhNUFczV3c1VHV0NGFSZTZGVjlhcGs3UWhFR0kxaDhmbUtx?=
 =?utf-8?B?ZGUrZFZSM01ESFNBTHQzVFVDU0tUZEk1dURWSTJFOWhlbXlXVzBXZVNaVjNP?=
 =?utf-8?B?ZG1BVU43V3FJOFhNMXV3VGd6QUZubEFCR2VibDlwYWYvRXlWM3lqK05ERXM1?=
 =?utf-8?B?ZWQ5OVk2K09EVVl3VVJMZlg1VENoQVNXUnowdUpHMnJsemVDbEN1WWtyN3do?=
 =?utf-8?B?ZmtLWWIrbGh1U2haVVk0MmVoSllJL1pTTDF5YUpSQTNiSzVQNXZlTS90Q3I2?=
 =?utf-8?B?dUFJeWs0bDBWdUF0SndLUXZTb0FvTW95N2hoaVZaMXVlaFZ1VEY1QThybE55?=
 =?utf-8?B?RHE5QzRjWHRScU9xa1M5QlJUVFl6OUFIR0RXcnJpRzBQQ1prbGVyMzM5VUZZ?=
 =?utf-8?B?STBpVnVHOUxtMitXdGhCWURUWnV1YndnVVlMeWNrYlFUVG43dGlpZnpjZVd2?=
 =?utf-8?B?RUFaM2tQUE13PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YXcweWRRZW1kQmJDYm50UFRpSmczV3N5dWVSYlJVQjJsN2E4eVpOQkN0QTB3?=
 =?utf-8?B?elpyQmE4dm05bW56b2FKc1BIVUJOaGNvM24vclhWV1FBK1JidVczeDNEcTNn?=
 =?utf-8?B?eEh4ZjE1VUVLN09VMGtmNGRQMDZoWWwzZWFCV2c3Q3Y5WkJBVWhGNGtBRGJQ?=
 =?utf-8?B?SmM2eXZ6bituTTlvdVVtTkJXRWZNckJoaVgydkFPRkFYTTMxTVRiZnZIRFM0?=
 =?utf-8?B?dVoxOGhhUFAza1N5dTdQK3BzWkNiZGtNR3QyTnZzcklpa1ZzVmVjNnFvWTFC?=
 =?utf-8?B?UXEyeDYvc2Y1UEN5NzEvVWttNTBxVXB3QVBoN0lhb0MxS2JOSUpHc0RqeUFG?=
 =?utf-8?B?L2d0bFhSdWVQZVkwM083QjZwelc3MGd0VlRYOVFHaXNzai9tLzNYc2NFVUpQ?=
 =?utf-8?B?eFJ1T2lwa2RxUWtMM0JrbXV4dlFjYmZYSFAzMmhodndkcHU2aEEwcFlPVmFE?=
 =?utf-8?B?bEE2Sk9jK2JYOGlOMzd0N3U2eHZialZnSngrZUhWK0VZVUExMW9xdC9YZ1hM?=
 =?utf-8?B?U3A5U1RpZjNVeVl0NlcrUGp4UHY3WFY3S1NYb3R6dXhIdXpKMDdQN2UxVTkv?=
 =?utf-8?B?WHJCR081dkYzUGk4L1k5QUhGbkl6SkJZTGFBcUZoUzJERkFvVXJPLzlEREoz?=
 =?utf-8?B?NnByVjMyNEFiU2dJL1JKeG5RNE9vdmdtTUloNEFvd1p4dWFOYzZ3RkRtTVBE?=
 =?utf-8?B?OW1NS1d6bG8vdzFkVVpqTmIvRjJlZzlDc1FYcWZyeEloWFZBWlg2UVMwRGlU?=
 =?utf-8?B?QWpiVHdBODNxMDVjbEFhZm9VYUpqWHdremwxOWhiS2F2akdNbC9MQ3FLakV6?=
 =?utf-8?B?RS8wR1NULzZLTXZxZ1UxcHBsMEJhcjRJL2JMam45Z2lRbU5IbFB3a1plL05s?=
 =?utf-8?B?TUNyR2RLRyttNXVNNldOelFxbWtEM3l5S1RxTlZuZWJ4aHQrMVN4b3lETEo4?=
 =?utf-8?B?eEh6OXZTK0I0Q0Qrb2xxVC9nbFNyckU4ZU9ZTi8vUjU1V2JGczIwbWkreW85?=
 =?utf-8?B?WmZ6OGYveEZOTHVYKzJBenRXQ2VWQkdzNklBRGsxYzRFMXM4VlRwUVVCdEo5?=
 =?utf-8?B?eXlxT2xWRnFTSmE2anB3UzNxTHp3ZUR5eGhqQ0toZWQyRlh4V3lCTms0WnBB?=
 =?utf-8?B?R21kMVZXejI5K1VCQ3NwRFNOY1kwZENMeGJSVkt0bndLOFpkV3lHMkRVUXJZ?=
 =?utf-8?B?WjBVeG5POVBDSWZ6dDcvZExGOUt2akRIRUZ0Y1RSaHNvakw3UXR2QXVpUUZS?=
 =?utf-8?B?aHNCem44eDdadk9oTzhtMzhSRGdHTjBhdjFGYTFBeHhRb0RRR1U1cWRWV2NO?=
 =?utf-8?B?eFptTFlGK1l4OURBZXc3SXk1d0J6V2dxTEluK0pOSFp5dlN5ZWxsR0xNTjVT?=
 =?utf-8?B?UTZhdnlSZGRQYVVmMnJmMnZHOHZPdmNGblh4Z1R2dWtIVW13S2krNHpJVkJ0?=
 =?utf-8?B?UjRUNmVlZXdYVEd4czlxYVQ3aWV1UnJkRW90K0hLYzk3WERJd1lMRjVrWFp5?=
 =?utf-8?B?d2VjSFVmQWFUUGcvTmI0RmVIY1hoSjZpRkJiUFowK1huSXZHSWpJVUJEZFFH?=
 =?utf-8?B?Rnc2QTVQczBRNjBKZ1VCV084RU9ZNTdMSWVuOHBjQ3BibUpvamFBcU40bXFo?=
 =?utf-8?B?SW9RZ3ZBSkY1WTkyNWozTDVEd2J0MElOWXVZWmVQNGpEYXd4NzJnSWNZak1J?=
 =?utf-8?B?MHJndWd3RzFJa05YR2ZMNDFoWFllaXFIZ1VUMzlNbEN1WG1KaVFhNVczaDVu?=
 =?utf-8?B?Z3RwTVhEenJXbk0vNEFzUURTemlkaC91TUFCblJYZzRmUmdoMGNVVEF6SFJW?=
 =?utf-8?B?Q3NVV252eUY1RGRFRTNOdHphNlZBZWR5d3ZiQytSa1ZjVzN2SXZ0WHlFZklF?=
 =?utf-8?B?RXV6VWpwU2lOTm5TVHRiams2YlljWFlSV0xoMTFPbXdVbEF5YzYrcFI0L21u?=
 =?utf-8?B?c3F2VmRLVjlpUHNzTGlXVjZ5UFdrSVdpNTJsOFRmbktrS3BVYk1Gc0RldXFW?=
 =?utf-8?B?K3BkTC9FN1QrWU00d2xMSC82S2pIMWYwYVl3bkZ0NGlOSjE1L0JUTERqdG1t?=
 =?utf-8?B?cGVPV1lBWTlVRElaVi9xS1U4VUZwTTdUU25pY0hPRndEd2xuN3JtcW81a1B5?=
 =?utf-8?B?cUpnb2hEOGFlU09BWENyR1N1MmlLY2JuZEZHM1N6bTlGVnlTQ3ptejhQOFhj?=
 =?utf-8?B?Umc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5DE71142367644EA9EA11B1301AAE07@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bac9636-c970-4810-db44-08ddd97924f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 08:20:48.9960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NwgP0L1WbfGTQzVCv7h37efT4A7V8WM3BfyoPhSRBymHYVO/iS6r4tBYrqYPJmTMW2JZ051hbhl99ttROUg5TtrMBbT0QYuHBk/+KyIV+IE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9560

DQoNCk9uIDgvMTIvMjUgMDA6MjEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAxMS8wOC8yMDI1IDIxOjMwLCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBNSVNSQSBS
dWxlIDE2LjQ6IEV2ZXJ5IHN3aXRjaCBzdGF0ZW1lbnQgc2hhbGwgaGF2ZSBhIGRlZmF1bHQgbGFi
ZWwuDQo+PiBUaGUgZGVmYXVsdCBjbGF1c2UgbXVzdCBjb250YWluIGVpdGhlciBhIHN0YXRlbWVu
dCBvciBhIGNvbW1lbnQNCj4+IHByaW9yIHRvIGl0cyB0ZXJtaW5hdGluZyBicmVhayBzdGF0ZW1l
bnQuDQo+Pg0KPj4gSG93ZXZlciwgdGhlcmUgaXMgYSBkb2N1bWVudGVkIHJ1bGUgdGhhdCBhcHBs
eSB0byB0aGUgWGVuIGluDQo+PiAnZG9jcy9taXNyYS9ydWxlcy5yc3QnOg0KPj4gU3dpdGNoIHN0
YXRlbWVudHMgd2l0aCBpbnRlZ2VyIHR5cGVzIGFzIGNvbnRyb2xsaW5nIGV4cHJlc3Npb24NCj4+
IHNob3VsZCBoYXZlIGEgZGVmYXVsdCBsYWJlbDoNCj4+IMKgIC0gaWYgdGhlIHN3aXRjaCBpcyBl
eHBlY3RlZCB0byBoYW5kbGUgYWxsIHBvc3NpYmxlIGNhc2VzDQo+PiDCoMKgIGV4cGxpY2l0bHks
IHRoZW4gYSBkZWZhdWx0IGxhYmVsIHNoYWxsIGJlIGFkZGVkIHRvIGhhbmRsZQ0KPj4gwqDCoCB1
bmV4cGVjdGVkIGVycm9yIGNvbmRpdGlvbnMsIHVzaW5nIEJVRygpLCBBU1NFUlQoKSwgV0FSTigp
LA0KPj4gwqDCoCBkb21haW5fY3Jhc2goKSwgb3Igb3RoZXIgYXBwcm9wcmlhdGUgbWV0aG9kczsN
Cj4gID4gPiBUaGVzZSBjaGFuZ2VzIGFkZCBgQVNTRVJUX1VOUkVBQ0hBQkxFKClgIG1hY3JvIHRv
IHRoZSBkZWZhdWx0IA0KPiBjbGF1c2Ugb2YNCj4+IHN3aXRjaCBzdGF0ZW1lbnRzIHRoYXQgYWxy
ZWFkeSBleHBsaWNpdGx5IGhhbmRsZSBhbGwgcG9zc2libGUgY2FzZXMuIFRoaXMNCj4+IGVuc3Vy
ZXMgY29tcGxpYW5jZSB3aXRoIE1JU1JBLCBhdm9pZHMgdW5kZWZpbmVkIGJlaGF2aW9yIGluIHVu
cmVhY2hhYmxlDQo+PiBwYXRocywgYW5kIGhlbHBzIGRldGVjdCBlcnJvcnMgZHVyaW5nIGRldmVs
b3BtZW50Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IERteXRybyBQcm9rb3BjaHVrIDxkbXl0cm9f
cHJva29wY2h1azFAZXBhbS5jb20+DQo+PiAtLS0NCj4+IMKgIHhlbi9hcmNoL2FybS9kZWNvZGUu
Y8KgwqDCoMKgwqAgfMKgIDMgKysrDQo+PiDCoCB4ZW4vYXJjaC9hcm0vZ3Vlc3Rfd2Fsay5jwqAg
fMKgIDQgKysrKw0KPj4gwqAgeGVuL2NvbW1vbi9ncmFudF90YWJsZS5jwqDCoCB8IDEwICsrKysr
KysrLS0NCj4+IMKgIHhlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jIHzCoCAzICsrKw0KPj4gwqAg
NCBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZGVjb2RlLmMgYi94ZW4vYXJjaC9hcm0vZGVjb2Rl
LmMNCj4+IGluZGV4IDI1MzdkYmViYzEuLmNiNjQxMzdiM2IgMTAwNjQ0DQo+PiAtLS0gYS94ZW4v
YXJjaC9hcm0vZGVjb2RlLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9kZWNvZGUuYw0KPj4gQEAg
LTE3OCw2ICsxNzgsOSBAQCBzdGF0aWMgaW50IGRlY29kZV90aHVtYihyZWdpc3Rlcl90IHBjLCBz
dHJ1Y3QgDQo+PiBoc3JfZGFidCAqZGFidCkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlIDM6
IC8qIFNpZ25lZCBieXRlICovDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1cGRhdGVf
ZGFidChkYWJ0LCByZWcsIDAsIHRydWUpOw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
YnJlYWs7DQo+PiArwqDCoMKgwqDCoMKgwqAgZGVmYXVsdDoNCj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
YnJlYWs7DQo+IA0KPiBJIGFtIG5vdCBzdXJlIGFib3V0IHRoaXMgb25lLiBDYW4ndCB0aGUgY29t
cGlsZXIgb3IgZXZlbiBFQ0xBSVIgZGV0ZWN0IA0KPiB0aGF0IHRoZSB2YWx1ZSB3ZSBtYXRjaCAi
b3BCICYgMyIgYW5kIHRoZSA0IGRpZmZlcmVudCB2YWx1ZXMgYXJlIGhhbmRsZWQ/DQo+IA0KPiAg
PsKgwqDCoMKgwqDCoMKgwqDCoMKgIH0+DQoNClRoZSBFY2xhaXIgY2FuIGhhbmRsZSBzdWNoIGNh
c2Ugd2l0aCBlbnVtIHR5cGUuDQpJJ20gbm90IHN1cmUgdGhhdCB3ZSB3YW50IHRvIGFwcGx5IHN1
Y2ggY2hhbmdlcy4NCg0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOw0KPj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9ndWVzdF93YWxrLmMgYi94ZW4vYXJjaC9hcm0vZ3Vlc3Rfd2Fsay5j
DQo+PiBpbmRleCAwOWZlNDg2NTk4Li45MTk5YTI5NjAyIDEwMDY0NA0KPj4gLS0tIGEveGVuL2Fy
Y2gvYXJtL2d1ZXN0X3dhbGsuYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL2d1ZXN0X3dhbGsuYw0K
Pj4gQEAgLTE2Nyw2ICsxNjcsMTAgQEAgc3RhdGljIGJvb2wgZ3Vlc3Rfd2Fsa19zZChjb25zdCBz
dHJ1Y3QgdmNwdSAqdiwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICpwZXJtcyB8PSBH
VjJNX0VYRUM7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+PiArDQo+PiArwqDCoMKg
wqDCoMKgwqAgZGVmYXVsdDoNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFTU0VSVF9VTlJF
QUNIQUJMRSgpOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+PiDCoMKgwqDC
oMKgIH0NCj4+IMKgwqDCoMKgwqAgcmV0dXJuIHRydWU7DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2Nv
bW1vbi9ncmFudF90YWJsZS5jIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jDQo+PiBpbmRleCBj
ZjEzMWM0M2ExLi42MGZjNDdmMGM4IDEwMDY0NA0KPj4gLS0tIGEveGVuL2NvbW1vbi9ncmFudF90
YWJsZS5jDQo+PiArKysgYi94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMNCj4+IEBAIC0zMzAsOSAr
MzMwLDEyIEBAIHNoYXJlZF9lbnRyeV9oZWFkZXIoc3RydWN0IGdyYW50X3RhYmxlICp0LCANCj4+
IGdyYW50X3JlZl90IHJlZikNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBSZXR1cm5lZCB2YWx1
ZXMgc2hvdWxkIGJlIGluZGVwZW5kZW50IG9mIHNwZWN1bGF0aXZlIA0KPj4gZXhlY3V0aW9uICov
DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYmxvY2tfc3BlY3VsYXRpb24oKTsNCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gJnNoYXJlZF9lbnRyeV92Mih0LCByZWYpLmhkcjsNCj4+ICsNCj4+
ICvCoMKgwqAgZGVmYXVsdDoNCj4+ICvCoMKgwqDCoMKgwqDCoCBBU1NFUlRfVU5SRUFDSEFCTEUo
KTsNCj4+ICvCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+IMKgwqDCoMKgwqAgfQ0KPj4gLcKgwqDC
oCBBU1NFUlRfVU5SRUFDSEFCTEUoKTsNCj4gID7CoMKgwqDCoMKgwqAgYmxvY2tfc3BlY3VsYXRp
b24oKTs+DQo+PiDCoMKgwqDCoMKgIHJldHVybiBOVUxMOw0KPiANCj4gSSBrbm93IHlvdSBhcmUg
dHJ5aW5nIHRvIGFwcGx5IHRoZSBNSVNSQSBydWxlLiBCdXQgdGhpcyBpcyBvZGQgdGhhdCB5b3Ug
DQo+IG1vdmUgdGhlIEFTU0VSVF9VTlJFQUNIQUJMRSgpIGJ1dCB0aGVuIGNvZGUgYWZ0ZXIgaXMg
c3RpbGwgb25seSANCj4gcmVhY2hhYmxlIGZyb20gdGhlIGRlZmF1bHQuIEluIGZhY3QsIHRoaXMg
aXMgaW50cm9kdWNpbmcgYSByaXNrIGlmIA0KPiBzb21lb25lIGRlY2lkZXMgdG8gYWRkIGEgbmV3
IGNhc2UgYnV0IHRoZW4gZm9yZ290IHRvIHJldHVybiBhIHZhbHVlLg0KPiANCj4gQnkgbW92aW5n
IHRoZSB0d28gb3RoZXIgbGluZXMsIHRoZSBjb21waWxlciBzaG91bGQgYmUgYWJsZSB0byB0aHJv
dyBhbiANCj4gZXJyb3IgaWYgeW91IGZvcmdvdCBhIHJldHVybi4NCj4gDQo+IA0KPj4gQEAgLTcy
NywxMCArNzMwLDEzIEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgbnJfZ3JhbnRfZW50cmllcyhzdHJ1
Y3QgDQo+PiBncmFudF90YWJsZSAqZ3QpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgLyogTWFrZSBz
dXJlIHdlIHJldHVybiBhIHZhbHVlIGluZGVwZW5kZW50bHkgb2Ygc3BlY3VsYXRpdmUgDQo+PiBl
eGVjdXRpb24gKi8NCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBibG9ja19zcGVjdWxhdGlvbigpOw0K
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBmMmUobnJfZ3JhbnRfZnJhbWVzKGd0KSwgMik7
DQo+PiArDQo+PiArwqDCoMKgIGRlZmF1bHQ6DQo+PiArwqDCoMKgwqDCoMKgwqAgQVNTRVJUX1VO
UkVBQ0hBQkxFKCk7DQo+PiArwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+PiDCoCAjdW5kZWYgZjJl
DQo+PiDCoMKgwqDCoMKgIH0NCj4+IC3CoMKgwqAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7DQo+PiDC
oMKgwqDCoMKgIGJsb2NrX3NwZWN1bGF0aW9uKCk7DQo+PiDCoMKgwqDCoMKgIHJldHVybiAwOw0K
PiANCj4gU2FtZSByZW1hcmsgaGVyZS4NCg0KWWVzLCAnZGVmYXVsdCcgY2FzZSB3aXRoIGFwcHJv
cHJpYXRlIGNvbW1lbnQgd2lsbCBiZSBiZXR0ZXIsIEkgdGhpbmsuDQpBbnl3YXksIHdyb25nICdn
dF92ZXJzaW9uJyB3aWxsIGJlIGhhbmRsZWQgYmVsb3cgYnkgdGhlIA0KQVNTRVJUX1VOUkVBQ0hB
QkxFKCkuDQoNCj4gDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMg
Yi94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYw0KPj4gaW5kZXggOWJkNWI0ODI1ZC4uNjA4NjE2
ZjJhZiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jDQo+PiArKysg
Yi94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYw0KPj4gQEAgLTg4OSw2ICs4ODksOSBAQCBzdGF0
aWMgaW50IGNmX2NoZWNrIHBhcnNlX2NvbnNvbGVfdGltZXN0YW1wcyhjb25zdCANCj4+IGNoYXIg
KnMpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgb3B0X2Nvbl90aW1lc3RhbXBfbW9kZSA9IFRTTV9E
QVRFOw0KPj4gICAgICAgICAgIA0KPj4gY29uX3RpbWVzdGFtcF9tb2RlX3VwZChwYXJhbV8yX3Bh
cmZzKHBhcnNlX2NvbnNvbGVfdGltZXN0YW1wcykpOw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiAwOw0KPj4gK8KgwqDCoCBkZWZhdWx0Og0KPj4gK8KgwqDCoMKgwqDCoMKgIEFTU0VSVF9V
TlJFQUNIQUJMRSgpOw0KPiANCj4gTG9va2luZyBhdCB0aGUgaW1wbGVtZW50YXRpb24gb2YgcGFy
c2VfYm9vbCgpIGl0IGNhbiByZXR1cm4gLTEgaWYgdGhlIA0KPiBpbnB1dCBwcm92aWRlZCBpcyBp
bmNvcnJlY3QuIFNvIEkgZG9uJ3QgdGhpbmsgdGhpcyBwYXRoIHNob3VsZCBjb250YWluIA0KPiBB
U1NFUlRfVU5SRUFDSEFCTEUoKS4gSW4gZmFjdCwgaXQgc2hvdWxkIGZvbGxvdyB0aGlzIGRpcmVj
dGl2ZToNCj4gDQo+ICINCj4gIMKgwqDCoMKgwqDCoCAtIGlmIHRoZSBzd2l0Y2ggaXMgZXhwZWN0
ZWQgdG8gaGFuZGxlIGEgc3Vic2V0IG9mIGFsbCBwb3NzaWJsZQ0KPiAgwqDCoMKgwqDCoMKgwqDC
oCBjYXNlcywgdGhlbiBhbiBlbXB0eSBkZWZhdWx0IGxhYmVsIHNoYWxsIGJlIGFkZGVkIHdpdGgg
YW4NCj4gIMKgwqDCoMKgwqDCoMKgwqAgaW4tY29kZSBjb21tZW50IG9uIHRvcCBvZiB0aGUgZGVm
YXVsdCBsYWJlbCB3aXRoIGEgcmVhc29uIGFuZA0KPiAgwqDCoMKgwqDCoMKgwqDCoCB3aGVuIHBv
c3NpYmxlIGEgbW9yZSBkZXRhaWxlZCBleHBsYW5hdGlvbi4gRXhhbXBsZTo6DQo+IA0KPiAgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRlZmF1bHQ6DQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAvKiBOb3RpZmllciBwYXR0ZXJuICovDQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBicmVhazsNCj4gIg0KDQpZb3UgYXJlIHJpZ2h0LCBwYXJzZV9ib29sKCkg
Y2FuIHJldHVybiAtMS4NCkFwcHJvYWNoOiAnZGVmYXVsdCcgY2FzZSB3aXRoIGFwcHJvcHJpYXRl
IGNvbW1lbnQuDQoNCj4gDQo+IENoZWVycywNCj4gDQoNClRoYW5rcyENCkRteXRyby4=

