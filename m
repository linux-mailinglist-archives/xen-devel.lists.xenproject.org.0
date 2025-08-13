Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 783C3B245CC
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 11:44:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079635.1440388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um81r-0001ag-5i; Wed, 13 Aug 2025 09:44:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079635.1440388; Wed, 13 Aug 2025 09:44:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um81r-0001Y0-2K; Wed, 13 Aug 2025 09:44:19 +0000
Received: by outflank-mailman (input) for mailman id 1079635;
 Wed, 13 Aug 2025 09:44:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gOuC=2Z=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1um81p-0001Xs-2o
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 09:44:17 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11032fcf-782a-11f0-b898-0df219b8e170;
 Wed, 13 Aug 2025 11:44:12 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS8PR03MB8805.eurprd03.prod.outlook.com (2603:10a6:20b:53e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Wed, 13 Aug
 2025 09:44:08 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 09:44:08 +0000
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
X-Inumbo-ID: 11032fcf-782a-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgXK8dIcT30lUMEQTA5RWNBPy8EOqOj+ErWGxPadqxdP78gQ3dCSt4pRUXXCgR+UY153HU9TwSSoUb2M6bvgUYfJfTU2RCLVbv2GhZm0mAbGoXP7cAxNnsDEETHunMSO6vsnj+dF/Qrk6e1DvGaOkQ352wA4f5ewULgVx/Bygdv2/Z0gbwq18WaNn+dPn+o9p1k7pzMYClJZy1KRxvdjORUscRN0yp3vTyTqALvUejEpdgKJJBFCbu2EAikqR5jlDq5urVrxyjicph7P+e5YgmoA5k2Sy3KJeEledWkuL50YKgQPRf0KHrfAaW4S2eEfpa+25H//1P6ieN0XooHphA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nlm47EtQuFAD7qCZ5Xyeyfx5Ro4LCAj2vS7viQWl120=;
 b=Qfyihqb6dFukUHuElvIxIeXSQiZvfeMaJnbSlutSFWnKfUutKgIsdzNWgHC/7MKF8n9CDguxwknn+ckbbNETI7Ar4sEV3D5hY4ELxczpGjPmiOL3J3QtDK35sucVXzRe3l+UkB316ysyaIU1l0J5ssY2Q96t9Xlo4xHDaMG81BkVSk6c7Zj6KQ2YcBRAi4HX0q7eHURf2m70SicsSXZWapWjrd2Eo1LHTO+M8wGp9L1SUfA5XrIUiqe0hntP9qrMbRS0gVUcyfPL+1WyZd0a5uGhkYoINToPvc70a8sph0xEo+U1wLJtm2AvkiU8vGOBpHSROBPRAyjf8j2IKM7MzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nlm47EtQuFAD7qCZ5Xyeyfx5Ro4LCAj2vS7viQWl120=;
 b=J2NrMvzWTQ24iWFzX1dBMft0z1OSWNKp8TXEQaN1P9Oe3U3MM9LdPEJfaqwJQAOA8Ls6MV3cBrkShNhs2PKBlTzr4F52pcP+isyIfH+ePsdhNAYSqf84y/M/1Y/eyywivKqUU5vt9aCqtetNISqrKrp/R0Q4I5Re4uuuHZ7SJmy5C2s2nGSArb56i1tFD/vLI3AAS+O3orM8rSft27jQj42wShuUPROXpwV3m81pT3aMGsJ1My7vz1RsWhkPQIePfkI06mptw1IwluSUj8iPH3DB0JoLfXB87GDyamDwn2tmyMYlNYvgDN1OOLto7nM9L/hRFawYFuL4r0UMwn6mug==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>, Nicola
 Vetrini <nicola.vetrini@bugseng.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] misra: add ASSERT_UNREACHABLE() in default clauses
Thread-Topic: [PATCH] misra: add ASSERT_UNREACHABLE() in default clauses
Thread-Index: AQHcCv7M4bE5kwDncUeSEAS4rjYqyLRd9fOAgACqo4CAAQGdgIAAtW4A
Date: Wed, 13 Aug 2025 09:44:07 +0000
Message-ID: <535b7f57-8955-42bf-bac7-790500a157f6@epam.com>
References:
 <7cd71ed21383c189fedb3250ddde54a593f7f98b.1754944131.git.dmytro_prokopchuk1@epam.com>
 <59396fd1-ca82-4655-9dcf-ec36e0d51ffc@xen.org>
 <aba2627f-b38d-4d6c-9c5e-4bdc4f5b563f@suse.com>
 <24d8591e-f669-4142-a783-c7cfea87034c@xen.org>
In-Reply-To: <24d8591e-f669-4142-a783-c7cfea87034c@xen.org>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS8PR03MB8805:EE_
x-ms-office365-filtering-correlation-id: 704e5225-72d8-49d6-49d8-08ddda4df2ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?S0E1N1Zvck5GSExTNzErUU5WRDV0UzdQb25hc3VmL29LSjhLS0hLb0tFNFAx?=
 =?utf-8?B?VEZNb2VpODJMQU5yNlZGQUpjQlhFNlJZMGNMMlBnbXA4S2creDRVV3RWUXVH?=
 =?utf-8?B?dUlQaWczamZrVFdpWDV2djFyT1JTSW5RK3BNUmoxekV0TlhUN1pOcGR1YmhU?=
 =?utf-8?B?UUpZNm04TE1XTThXdXBtbVQ4VGZFUEgzNDU3TlE0SER2SC9wS2dBSHN6RWtU?=
 =?utf-8?B?ZDVwa1NZdnZQaDJDS1FFanIvUklyMFhZMkJuajJ3OFRsRzNIakdiL09mN3dS?=
 =?utf-8?B?T0ZQdFhIUEx4aG5QcVJGQUsyZjRhMVNENzlwNEJWdVRITnZzR2N5dTNUdU9h?=
 =?utf-8?B?MEZpV1FpQ0l1ZWxHSm4vdUgwSU4xNmdNOHROWDYzbkE3WGk2aFhGQlcrclV6?=
 =?utf-8?B?TnJCWXlSdTdDUEIreXBLMWxTc3pCa01UUWlObzN4Qml0NmZsTW42SmRqMDFz?=
 =?utf-8?B?SFdjZkxRV0JlcnpOSEJwKzVKQUVwKzhXWm91RGNBT25FUmlCT2ttWHczL2pX?=
 =?utf-8?B?TVAxMTFUVFV1VEhKRTNMcHRQb1pJZmxWeFJGbENYcVRKNTZIREZlajZZZXJq?=
 =?utf-8?B?S3FvYjI0VW9UKzRXdXhnakZYSjdzN3MzaHRQdUdjWTBHLzFzR2VVZXdFcFhv?=
 =?utf-8?B?RU1yVFFMenFBTHUzWE5QTmtVcnIzdjFGeVJldk1TaFB1WUNDcXlialpveFRz?=
 =?utf-8?B?Rk9IWVpMT1JJcnY1Rk90bmQzbDNibGRlZm9FdGtJY3NxZkIxbzBBTjI2RSt5?=
 =?utf-8?B?VTNXVXRxbDhsc3JwZTUvOXNmK2t2MTRvVUtEb3BTSUM2T1dVYVVwM1cxUlZ2?=
 =?utf-8?B?YS8zK0FsU1RqOVZWQnpFL1JJRWpvRldDL0RNQ3NsTUdRVDdCb3R3Q3BQSW1j?=
 =?utf-8?B?VW1QbitnUVNGOU5lSS9EajNZbkRVa0dqTEhGZ2lQUkRWM3hkWnlTQythWld0?=
 =?utf-8?B?RzlaVDhiRjQ2Z1pwdTJ2My9aa05YQkRWS1Z4a3VvODdCSXNkS25VdldOQVo1?=
 =?utf-8?B?NVpVVUJETTlpamdWR0cya042M1pURnlLS0xNUWtDeEJuZkI1aW1hSDNobG9h?=
 =?utf-8?B?blR5QS9wTVlDWVNGMVZkNG1JNytxN21NNWxTL25nVG5qQnFVNDNNd3IxK2ht?=
 =?utf-8?B?cXhBTWtLTlA0UExxSFhFQkJuWHpxdklrYWJKTXhWblFzeHBDYUMvTjdPR0Rl?=
 =?utf-8?B?RkZzNzRqWC9EQmdBdjVzNndLcXc3eXpENmU3Sm9SdUlpUUwzamYzU2ZmYTRi?=
 =?utf-8?B?dWtib1A3T3QvYU1mUzJ2Zms3c3Z4dURndDZocjJlOTQvU2M3WkE3alhXWkFN?=
 =?utf-8?B?ZnVJRFpwVDNQbFpTYWpjZzFBcUNLc1Bjc2tmODBHTEExalZBUUR2WEhxbHhz?=
 =?utf-8?B?bjNjN29OVWtvdFJ2Vjd2V3BaV0lpRXBEdEM2WUxocEdYZmsrRXdPTjZhYzRG?=
 =?utf-8?B?VWtJSUxxTFk1Q05XRUVIWXJlRXpJSUJBSGt3TVVXdHJhaWxVN1JncG9BOXph?=
 =?utf-8?B?allHTnM0NHRKUWl4VDNmZGhDUUFGcDdDMG9BWEFIUFFZd3g5Uko2Y1gyN2ll?=
 =?utf-8?B?dThDMkFCeGZPVnhTeHdKaEYvQlpWanB5cG51dHcxTFhZU0pnZFM4RngrVHlt?=
 =?utf-8?B?U090U2VmNmNTQitYc0ViVTFqVWZtYW5rSWJJZGZGWFZsNjM3MElYSUZ0YnZ0?=
 =?utf-8?B?cVoyZWZobllKc0hmVjBqSXV5ZnpMdmZWQVQwNVo2N2ZBbXVsZzBuWDFkQm9o?=
 =?utf-8?B?bEZGMTAxOEFIbXRKRjliclZjWFBUSDNQNElRT2hDYnpXNmQ4ckxsY1I3cW92?=
 =?utf-8?B?L1pBdlFUazROM2RuZnVBMi8xZWZrTk9UQVNJRTJCak1tOUJEMkh5RktPdjNS?=
 =?utf-8?B?ZnpXRG9QVlJRaUNtS1lzdkNzai8yV1FMd1c4L1IyRXNPdGlXdlVQWUxpSG1L?=
 =?utf-8?B?YTFJclkxWGRFMEhSWGV3SHRiV3pWK24zMm1ueGJxemNpWCt0aGNTdFU0V0Vv?=
 =?utf-8?B?ZjRDaFpiSHFRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eWR0ZHpZQWFDbGpKNENadDdoV3RVTjEyNGkyOHVBU3ZnYjV3QWtodWJjOGVY?=
 =?utf-8?B?LzRROTd1K1I5NFpMaFNTZ1Y1NkszbExuVnpqWEp6SUExMUFjNU9WaVZrVkUr?=
 =?utf-8?B?Zk9JcVY0YnhEVUV5aVNHMUFJWmExSGlIZ1E0YXEzNjdJOTV3TTFFZ3hQKzZZ?=
 =?utf-8?B?SjFpTjBoWi9nbnMrV3h0RUh1TFB2eSsyNnRWR1pnem9uNlBhYndZNzZEVDZh?=
 =?utf-8?B?K2VYeW1PYTk0MTlFNkt0Z2ExRnR1SlUzYjN2WXI3SVh2Q0FmeEI5RzVjM09F?=
 =?utf-8?B?dE9jNmkzT1hYTDNuOFVKekpQcFBKYTcwWkpDVHZ5NlRGWFNYcjhiemxUK3pK?=
 =?utf-8?B?SVp5VURNZlZ0SS9wSEwxblZ5RGlFSmFYSGlWNlVEVWxZcU1pbmNPd3hLaUJl?=
 =?utf-8?B?RzJZVWc4Z3VSd21LTHBPWXZhdUR0alkzSFBPNkI1M05mVE9lZjJWNHZaRXJy?=
 =?utf-8?B?ZHBCUHB1c05hS3dxM1llZk9OR1FZd3RLY1FFa1UwTUtmaVA4cHg5SjhFU2J0?=
 =?utf-8?B?ZzNHYVVDYWZNZi9VQ3NsUGJKMlNSbENZbWlrT2VlSTBIaG5RUVRNb1E0eWkr?=
 =?utf-8?B?NS9CbExtQUFWdDZlMkxSMUhoc2xtNURnUUV0OURGSXZDT2FodW1WT0xlS2VB?=
 =?utf-8?B?blp6Q3diaXZIb3ZYakJQdkxHWEh0YjAzcUNGSmlOa3Z5WkM0Y0VMdVFlclRG?=
 =?utf-8?B?ZVFmeXFMN3pRM3ZLeEFQSXVtZUpXQk5lS0Y1UFdOVHNmenRpeENrNzlGQzgz?=
 =?utf-8?B?V2FUc3k3RGdheFJHOHBwWTBhK1duMkZPS1M1ZnRYcjdZRFRKZGlSMzNYdEM3?=
 =?utf-8?B?WHVCWHhrbW9WWGJxV1JNSmNZbFowS09vbWFPSzNHbGVERlFkZlhEZ1FVZytM?=
 =?utf-8?B?L05ERUtWL080S3M3ajVjaDRDNjAzZEQ1NWRzU1laL09iSWx1N0RMc3dNY01M?=
 =?utf-8?B?a01SMnFianhxRFFDWDNZSTl0OXF1RGhNbjlhaDJMazZMRk96STE3bnNucCtI?=
 =?utf-8?B?ekI3b3pyaVNlWDFPKzFLRmI2S1NPNXhiWTZMOEZDNDBaWHB1ZlJycWlpUG1V?=
 =?utf-8?B?WGJWWmFPNWl1eENzbVRxSzdQWEt5YUN3NUNpNWJpMzJlNWVWWHpvRUlhNCtU?=
 =?utf-8?B?M0dvVW1aT0RvNG1qZEdFeENIUzFacFRNdEozcThkYVExSEdoeHFRV3BZSDJH?=
 =?utf-8?B?YklLQ1ZqYWE1cFgyMldsMHVsKzFJUENvcDVFS0VKbSsvRXI0NnpkQkY1Zys1?=
 =?utf-8?B?b0lmOTVPWWQrVkl3c1pURHN4UXJiQ0ZYLzJld0p3cDR6UFpwK242WUFVR0s1?=
 =?utf-8?B?K2VvQiswTUhHa0JmeDY4NUUrUEpLRW9Bbm83a2w3K3p6NWJXaTZHUXNDd2d2?=
 =?utf-8?B?enpPWVRaWE5zQXY1cXlPa29uOGQ1RCtzRWhTaFpNYTRJZlNqeS9UcnhRMVZV?=
 =?utf-8?B?QkdyY01td1ljRmc4c2NnRzFScmZRd0QzQkRWb2NLdHVaNGlFWnd6anBxZHpU?=
 =?utf-8?B?Y1o3NW1rNmo5L0c0MFd3TXp6ZUE1NWF2OXRONG82eTVvT1ovQkFsaktjODZk?=
 =?utf-8?B?NStURk1leEx2bjlHYzNWSWpEMjJiTUJoVjgvUDRVZzVCUWtKWHo2L20yS0pG?=
 =?utf-8?B?SlJiWEl2ZXZaSWVoQnRMWUU4cHZ0ZldRUmJEYnozNjFnS2YxYXJuOFBWK3Vy?=
 =?utf-8?B?S0hyUm1hNmNSMG02aXlwYkYxZm5OWDBINWhYR1l2Y0VzYWxRRUlST3hoQ2p4?=
 =?utf-8?B?ZWdhUDFSQ3RoQWFBR1Z2TURDOG1sT0pzSVpSNnZwODRDYklkOXgveE8xdGxL?=
 =?utf-8?B?U1JQdE12aFZ0azRHMlNhSHM4VjdmYUtsWkUzVWZpY2F6L0JDV0NLWXVlaG9r?=
 =?utf-8?B?bXNoUXBmc09uOUxsMjhWcU1SeUd4anF2UDBYVjVoZ1ZyK01wdWJYS0hsTlRR?=
 =?utf-8?B?UmUxMHZqeXZtdlpDcGcwRSsySWtWWGFaS2lUWk9Fc2JoeHZWeVB2dFZyWjJZ?=
 =?utf-8?B?RzZwRFJYcVRqOXpLVXQ5aHNUYU9hU3NkWWZPQkhjMzYxR3RRa1J1dlpsN2Nn?=
 =?utf-8?B?T0hYWnNIKzlRTEFDam1IZWU4TmVVN1dxT3VraGpDMDZxUy9Memt3MnlUNnEw?=
 =?utf-8?B?ZEV6TG5VOEZPN0ZaZmcyaG1CbENseVU0Y2xYNG85N09sL283YUd5S09LTDdl?=
 =?utf-8?B?TEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C594363837A8C841B0948662DDFD3D0D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 704e5225-72d8-49d6-49d8-08ddda4df2ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2025 09:44:07.9135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +AxRCNnTsNFLtxsnmPIXtHVo9fs+5Lc+lQLRykV/mcsb0gBdLv1F6AFI073t6QTI/Jzs9VEfvsDgCnJp0+KmQ5VvzHKJVp/B1Kk2jYTaVo4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8805

DQoNCk9uIDgvMTMvMjUgMDE6NTQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSmFuLA0KPiAN
Cj4gT24gMTIvMDgvMjAyNSAwODozMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAxMS4wOC4y
MDI1IDIzOjIxLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4gT24gMTEvMDgvMjAyNSAyMTozMCwg
RG15dHJvIFByb2tvcGNodWsxIHdyb3RlOg0KPj4+PiAtLS0gYS94ZW4vY29tbW9uL2dyYW50X3Rh
YmxlLmMNCj4+Pj4gKysrIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jDQo+Pj4+IEBAIC0zMzAs
OSArMzMwLDEyIEBAIHNoYXJlZF9lbnRyeV9oZWFkZXIoc3RydWN0IGdyYW50X3RhYmxlICp0LCAN
Cj4+Pj4gZ3JhbnRfcmVmX3QgcmVmKQ0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBSZXR1
cm5lZCB2YWx1ZXMgc2hvdWxkIGJlIGluZGVwZW5kZW50IG9mIHNwZWN1bGF0aXZlIA0KPj4+PiBl
eGVjdXRpb24gKi8NCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmxvY2tfc3BlY3VsYXRpb24o
KTsNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuICZzaGFyZWRfZW50cnlfdjIodCwg
cmVmKS5oZHI7DQo+Pj4+ICsNCj4+Pj4gK8KgwqDCoCBkZWZhdWx0Og0KPj4+PiArwqDCoMKgwqDC
oMKgwqAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBicmVhazsN
Cj4+Pj4gwqDCoMKgwqDCoMKgIH0NCj4+Pj4gLcKgwqDCoCBBU1NFUlRfVU5SRUFDSEFCTEUoKTsN
Cj4+PiDCoCA+wqDCoMKgwqDCoMKgIGJsb2NrX3NwZWN1bGF0aW9uKCk7Pg0KPj4+PiDCoMKgwqDC
oMKgwqAgcmV0dXJuIE5VTEw7DQo+Pj4NCj4+PiBJIGtub3cgeW91IGFyZSB0cnlpbmcgdG8gYXBw
bHkgdGhlIE1JU1JBIHJ1bGUuIEJ1dCB0aGlzIGlzIG9kZCB0aGF0IHlvdQ0KPj4+IG1vdmUgdGhl
IEFTU0VSVF9VTlJFQUNIQUJMRSgpIGJ1dCB0aGVuIGNvZGUgYWZ0ZXIgaXMgc3RpbGwgb25seQ0K
Pj4+IHJlYWNoYWJsZSBmcm9tIHRoZSBkZWZhdWx0LiBJbiBmYWN0LCB0aGlzIGlzIGludHJvZHVj
aW5nIGEgcmlzayBpZg0KPj4+IHNvbWVvbmUgZGVjaWRlcyB0byBhZGQgYSBuZXcgY2FzZSBidXQg
dGhlbiBmb3Jnb3QgdG8gcmV0dXJuIGEgdmFsdWUuDQo+Pj4NCj4+PiBCeSBtb3ZpbmcgdGhlIHR3
byBvdGhlciBsaW5lcywgdGhlIGNvbXBpbGVyIHNob3VsZCBiZSBhYmxlIHRvIHRocm93IGFuDQo+
Pj4gZXJyb3IgaWYgeW91IGZvcmdvdCBhIHJldHVybi4NCj4+DQo+PiBJIHRoaW5rIHdlIGRpZCBk
aXNjdXNzIHRoaXMgcGF0dGVybiBpbiB0aGUgcGFzdC4gV2hpbGUgbW92aW5nIA0KPj4gZXZlcnl0
aGluZyB1cA0KPj4gdG8gdGhlICJyZXR1cm4iIGludG8gdGhlIGRlZmF1bHQ6IGhhbmRsaW5nIHdp
bGwgcGxlYXNlIEVjbGFpciAvIE1pc3JhLCANCj4+IHdlJ2xsDQo+PiB0aGVuIGVuZCB1cCB3aXRo
IG5vIHJldHVybiBzdGF0ZW1lbnQgYXQgdGhlIGVuZCBvZiBhIG5vbi12b2lkIGZ1bmN0aW9uLg0K
Pj4gQmV5b25kIGJlaW5nIGdvb2QgcHJhY3RpY2UgKGltbykgdG8gaGF2ZSBzdWNoIGEgIm1haW4i
IHJldHVybiBzdGF0ZW1lbnQsDQo+PiB0aGF0J3MgYWN0dWFsbHkgYW5vdGhlciBydWxlLCBqdXN0
IG9uZSB3ZSBhcHBhcmVudGx5IGRpZG4ndCBhY2NlcHQgDQo+PiAoMTUuNSkuDQo+IA0KPiBSZWFk
aW5nIDE1LjUsIHRoaXMgc2VlbXMgdG8gYmUgYWJvdXQgaGF2aW5nIGEgc2luZ2xlIHJldHVybiBp
biB0aGUgDQo+IGZ1bmN0aW9uLiBVbmxlc3MgSSBtaXN1bmRlcnN0b29kIHNvbWV0aGluZywgdGhp
cyBpcyBkaWZmZXJlbnQgZnJvbSB3aGF0IA0KPiB5b3Ugc3VnZ2VzdC4NCj4gDQo+IEFueXdheSwg
bXkgbWFpbiBwcm9ibGVtIHdpdGggdGhpcyBjaGFuZ2UgaXMgdGhhdCBBU1NFUlRfVU5SRUFDSEFC
TEUoKSBpcyANCj4gbW92ZWQuIEkgY291bGQgcG9zc2libHkgc2V0dGxlIHdpdGg6DQo+IA0KPiBk
ZWZhdWx0Og0KPiAgwqAgYnJlYWs7DQo+IH0NCj4gDQo+IEFTU0VSVF9VTlJFQUNIQUJMRSgpOw0K
PiAuLi4NCj4gDQo+IEJ1dCBhdCBsZWFzdCB0byBtZSwgdGhpcyBwYXR0ZXJuIGlzIG1vcmUgZGlm
ZmljdWx0IHRvIHJlYWQgYmVjYXVzZSBJIA0KPiBoYXZlIHRvIGxvb2sgdGhyb3VnaCB0aGUgc3dp
dGNoIHRvIHVuZGVyc3RhbmQgdGhlIHBhdGNoIGlzIG9ubHkgbWVhbnQgb3QgDQo+IGJlIHVzZWQg
YnkgdGhlICJkZWZhdWx0IiBjYXNlLg0KPiANCj4gQ2hlZXJzLA0KPiANCg0KSGkgYWxsIQ0KDQpM
ZXQncyBzdW1tYXJpemUgdGhlIGRpc2N1c3Npb24uDQoNCjEuIFRoZXJlIGFyZSB0d28gY2FzZXMs
IHdoZXJlICBgc3dpdGNoJyBzdGF0ZW1lbnQgaGFzIGEgY29udHJvbGxpbmcgDQp2YWx1ZSB0aGF0
IGlzIGNvbXBsZXRlbHkgY292ZXJlZCBieSBpdHMgbGFiZWxlZCBzdGF0ZW1lbnRzLg0KSGVyZToN
CiAgICAgc3dpdGNoICggb3BCICYgMHgzICkNCkFuZCBoZXJlOg0KICAgICBzd2l0Y2ggKCBwdGUu
d2Fsay5kdCApDQoNCk9yaWdpbmFsbHkgaXQgdmlvbGF0ZXMgcnVsZSAxNi40ICJgc3dpdGNoJyBz
dGF0ZW1lbnQgaGFzIG5vIGBkZWZhdWx0JyANCmxhYmVscyIuDQoNCldlbGwsIGFkZGluZyBlbXB0
eQ0KICAgICBkZWZhdWx0OiBicmVhazsNCmlzIG5vdCBhIHNvbHV0aW9uLCBiZWNhdXNlIGl0IHN0
YXJ0cyB0byB2aW9sYXRlIHJ1bGUgMi4xICJgYnJlYWsnIA0Kc3RhdGVtZW50IGlzIHVucmVhY2hh
YmxlIi4NCg0KQWRkaW5nDQogICAgIGRlZmF1bHQ6IEFTU0VSVF9VTlJFQUNIQUJMRSgpOyBicmVh
azsNCmxvb2tzIGZpbmUgZnJvbSBFY2xhaXIgcG9pbnQgb2YgdmlldywgYnV0IGFjdHVhbGx5IGBk
ZWZhdWx0JyBjYXNlIGlzIA0Kc3RpbGwgdW5yZWFjaGFibGUuDQoNCkkgdGhpbmsgdGhlIGVhc2ll
c3Qgd2F5IGlzIHRvIGluc2VydCBTQUYteHggbWFya2VyIGluc3RlYWQgb2YgdGhlIA0KYGRlZmF1
bHQnIGNhc2UuDQoNCkNoYW5naW5nIHRoZXNlIHRvIGVudW1zIC0gbm90IGZpbmUgYXMgZm9yIG1l
Lg0KDQpNYXliZSB0aGVyZSBpcyBhIHdheSB0byBjb25maWd1cmUgRWNsYWlyIHRvIGlnbm9yZSB0
aGUgcnVsZSAxNi40IGluIHN1Y2ggDQpjYXNlcy4NCk1heWJlIE5pY29sYSBjYW4gc3VnZ2VzdCBz
b21ldGhpbmcuLi4NCg0KDQoyLiBSZWdhcmRpbmcgbW92aW5nIEFTU0VSVF9VTlJFQUNIQUJMRSgp
OyBpbnNpZGUgYGRlZmF1bHQnIGNhc2UuDQpBY3R1YWxseSBzd2l0Y2ggY2hlY2sgR3JhbnR0YWJs
ZSB2ZXJzaW9uLg0KICAgICBzd2l0Y2ggKCBndC0+Z3RfdmVyc2lvbiApDQoNCkFuZCBpdCBtdXN0
IGJlICcxJyBvciAnMicuIE90aGVyIHZhbHVlcyBhcmUgd3JvbmcuDQpJIHRoaW5rIGBkZWZhdWx0
JyBjYXNlIHNob3VsZCBiZSB3aXRoIGFzc2VydDoNCg0KICAgICAgZGVmYXVsdDoNCiAgICAgICAg
ICBBU1NFUlQoZmFsc2UpOw0KICAgICAgICAgIHJldHVybjsNCg0KVGhpcyBjYW4gY2F0Y2ggd3Jv
bmcgJ2d0X3ZlcnNpb24nIHZhbHVlcy4NCg0KRG15dHJvLg==

