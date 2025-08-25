Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67289B340AA
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 15:28:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093176.1448738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqXEp-0006PH-2e; Mon, 25 Aug 2025 13:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093176.1448738; Mon, 25 Aug 2025 13:27:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqXEo-0006Mf-Vh; Mon, 25 Aug 2025 13:27:54 +0000
Received: by outflank-mailman (input) for mailman id 1093176;
 Mon, 25 Aug 2025 13:27:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/bS3=3F=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uqXEn-0006MZ-FD
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 13:27:53 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a0aa0f8-81b7-11f0-a32c-13f23c93f187;
 Mon, 25 Aug 2025 15:27:47 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by VI2PR03MB10858.eurprd03.prod.outlook.com (2603:10a6:800:27c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Mon, 25 Aug
 2025 13:27:44 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 13:27:44 +0000
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
X-Inumbo-ID: 4a0aa0f8-81b7-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFCc2XU8NZnJmq71ded1bBaeAG888sRu5sT+aL2KMtFUVjW4rRXeVDMPv876nCtJdlqDGvql7mUfuV3sNOrn4zJjIiBexZMcBbr+5tRgvVomcaU+6azh6DFK6cLJI7r539yRUXPAh8BJl3zFQGG8f6/ZGQMb5rYlnbwF3ojBvgEef2n5vs5Cb34jTZlWDWI8MOfqlnM+tuOt7+qZP6Lo+aZK9owgJC+EJjaSTPJJTmLGDPb8VycY4D8X+QyvzPPSkYQlnMeNO9ey7dQqs6RxXTp7zmAOvIB+BUjpGLIm8mVrLcY+2u9KS+HbqZ0M8zeYJmUiGyGeVdcMCDXC+IrAAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+X5jyYQeGpg9rJyPL3XVX1P8S6+1/ZgUDi67/qI/grA=;
 b=NlIc8cztIGenQfuqvxT2UEIRNAIZU2cIlpQzGHJxLFmaHqv04bXP1NzuFmUjQ1Tvog5exIQ6Msj5y5l/T0pAJw7DbokdPwWV+WY3NECGtVsUSQzACgc2Q9h1Om3IIvRFPbUr6/vHas95ESxA3Mbbo0GrMC1fQPgspoaGDSZBybMzwLd84vcjXQu9OpJlpUizDj6olMM+eEDbOvS3dEQHR3o1aua7c9uFUuLnhVhhMyaXDyVBZFrtKrOitiTEfYO0zcbS1VS+oo3/Kv1qppm3qh0qjwyit63TaCt4yHBGLFzGpeODoeqxBwOFQ6OdLHbRMSUUcb3wDqqNekf8t9hq4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+X5jyYQeGpg9rJyPL3XVX1P8S6+1/ZgUDi67/qI/grA=;
 b=CbVn1eGfOLIrXxzOtImwLT46qXz0Z5dGrl+UCiwuYPlDkijOlluA08C207MKc+9aKQ1i6MDnE6dioSBCrCgq+IrKrfpDuZmKM3DoRQ8nsGodFGaxKp0rCRhOjbpvFnbxD6JXqPH7uG90mOe69vzlx0KUfYto8Sxl637+INeA+jtZWmghyjbBpLOr7SvTdGBdN8pF7OC0rJmEo1nJrzC5CTtwCnQjqoInjdR+MyLxgW6uO+sEwbsYFp5NVPJ8msE7r2WozM9aPOQRYFTyPBoPeJRjMBwwrp2jF0Rd13EaxJi4IBcnrNyncKnQvhu7RuHsbxtzyXTo06MlXPHkAzICzA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] misra: add deviation of Rule 17.7
Thread-Topic: [PATCH] misra: add deviation of Rule 17.7
Thread-Index: AQHcFZ9zsboRH18vd0iLUvum4pfwBbRzK0qAgAAH1ACAAAJ8AIAAJzmA
Date: Mon, 25 Aug 2025 13:27:44 +0000
Message-ID: <37bb8530-c9e4-4ad4-8959-d1f13316a0fd@epam.com>
References:
 <ad15582787e675fadf92502f85041c3232749a99.1756112701.git.dmytro_prokopchuk1@epam.com>
 <53d5cee3-9001-49a2-9da2-e56950a77683@suse.com>
 <83267937-938d-43d8-ba2c-a07d6adb93a9@epam.com>
 <330f8ee8-9fcd-40e4-96c0-ac126b047070@suse.com>
In-Reply-To: <330f8ee8-9fcd-40e4-96c0-ac126b047070@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|VI2PR03MB10858:EE_
x-ms-office365-filtering-correlation-id: 14692636-1f8a-48b6-b78e-08dde3db2ce2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?c0I4UWo3UUdpZVkyV05xUytYU3JReFZQcGhoNG1WS3Z1L2xQeDMwdWdUTjFl?=
 =?utf-8?B?VTBhWjJURnoyUWxkZ09LQmcxUGtKWXRWTForQ0pVNW5WOS80Z0NCanoyWStN?=
 =?utf-8?B?dHRtMGZ1WGpndnFSVXpGWERlcnRVTFBWbTdjb3VGZVhqUFVlazJ6NmVJcXFt?=
 =?utf-8?B?Q1QzOUZOcm8yZHpiak96Sk1FdFM1SGNWQXRBaUxMTVpsdVFjTnR2Wk5vS1M0?=
 =?utf-8?B?OEt1YUFWMFBrUzQ4WVZEQTN4dzJ1U1ZmV0R2REFZSUt1aGtzVDM4VDZwU0pM?=
 =?utf-8?B?WVJRMlh1ajA3S1UrQmljcFR3cWxpaG1OZzd1Ly9JYVVubjlnZUhFR1V5b1Fh?=
 =?utf-8?B?TnZxY3hWaXZTc2ZtMnhoVUhnejZhSVNFZG9RVTFDcVU5NXhac2wzemtmL0I0?=
 =?utf-8?B?UHJMQmlNRElzM0JzZFFVTlQ4QlFHSWRGUjdxQlpTSmFIbmRxUFUzMEFYMWNI?=
 =?utf-8?B?azhqRVZBclJOOWNkd1RtRndUdTV5M0lvSGFqTExyQTR5b0tpcW1SenJNMUo0?=
 =?utf-8?B?N2YxU0JPVm5FUWVwS3dpOFFObVl1MkhmY0p0NTZUMitsTUt6dlNPVExUaWRt?=
 =?utf-8?B?UGlSajhyRnZvcjJVNEx0L1JyNUVhY0NlL0V2R1RFalhSUzd4eS9lUGFINkRs?=
 =?utf-8?B?NzE1Ti9qc3JmZXMrZWZuWmIrWmg4bzdUaEJQV2JSbDZhTTZXUytQektZNUE3?=
 =?utf-8?B?R2hJZDQxNGNDRWg2eWs4VDIreDZOQStCMFlJalh6RlF6UEJIMWZhUE5rRHE1?=
 =?utf-8?B?TFQ3QmlWVEQybW1FVWZpZzRiR09waGZYRmZ2UHdpUC9ONkdobjFhVnl5UDdm?=
 =?utf-8?B?SUdVd3h1UlBhT1ZrLzlmbHYvSE1PRHM5bnhuSGhnU3Y0Z3JKR1VCTnhDemRO?=
 =?utf-8?B?OTgxYmkycjBiTS9mTGIzWFBoaGd2bXVVQzRqaFVuRThOQk9Ka3ZrVmphdm5H?=
 =?utf-8?B?Q0lqRGpYenZvb3pzRVI1QWV5UkttR2hialVtT080b3lUMVB6b0RoRS82bXhy?=
 =?utf-8?B?NG9lK2ZPZkw0aHR3SEptYWxIOXgwd3pzSUIrVmE4YzB5L1E2NTdIYXI3d3hT?=
 =?utf-8?B?d01namZkdG1YQlhvVEJZNkN1Q2ltR2xHSHY1VnB0UkRFQlRsd3VhT25wYi9m?=
 =?utf-8?B?VEZTcXNwekZXQ2gxeU5UcFh2M2dPNnBuandSVFF2TVhoU0ExZEFDZDRrb2Zs?=
 =?utf-8?B?YVU2K3dkb0NjRWhSUUZzTnBHRW5iT2d3SGtCb0Jhb3VRRW93N0dLeFp6OHpu?=
 =?utf-8?B?RGZNU0tFQXA4TXBxVGJ1M3VLV29VckhJQ0V1REVCY0VweWFtMXBxUmpqTFp6?=
 =?utf-8?B?aWlWREVkclAvRWxSRHVZbWx2MmYyMkxRWWVFNnE3ditIRUxxbVhmdGcrSFU4?=
 =?utf-8?B?TVpIbW4yak81UU9pQm5rNlFWOHBIR1BPVEx4OEFUT0o0KzlvNEgxVWs4dnJX?=
 =?utf-8?B?a290azdxMmo3aTRYaGdhZ25scXltNXVsTEN1bEZkb1N4THIwR21iSDVmcHVq?=
 =?utf-8?B?TDE1eHlpdDZ2OVV6SjV1RXlZSnRmSTMxRXhHOWVZbDAxdGRkc0ZtN2ZjM25p?=
 =?utf-8?B?QldmRHBPYkZ1ZHhjbXVlbWtsTDhSeE56MWFuTGVBMi90YXdPdXVQalNMN3k2?=
 =?utf-8?B?Nzd5RnZEZDQ3bUpCZEVZNGp5c1hjVFRaVEh4R2hSelhGejRjS0dqZ29XdDRy?=
 =?utf-8?B?VjJmWGtVaVdQU0JmUVRkVENjckpkNHVHaW1jQUwyeXlpTXI4ejVSVmJaeUYy?=
 =?utf-8?B?SGR0M1plUnhyY0R3WmppaUcrZERuT0I5SkcvdVF3TEkwS3R2elAybGc2R0Yz?=
 =?utf-8?B?eWNZbzluQUFBZFZuTGxKS1VyTnpFcmJqSUxpdmFUNXh2NTQ2UExJbVFHcSt5?=
 =?utf-8?B?MzJzb2JLYnM1RzVQdWZpSG9JdDNGaitYUWNoQng1VTRleEdFVW1RN3E5K0Fi?=
 =?utf-8?B?Z2dVdHg3dGoyRU5XRnpZc0dQc2h0aElyR0VWUUVnNS83b3kxRmlYTUs4cERj?=
 =?utf-8?B?dFpwL0krU293PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QXpUMGwzUVZNbXNyNWpsaUxqRE8wVnl4bkhWeGlSZ1VCV1RCeXUxN0tFTUZ4?=
 =?utf-8?B?TWtPcGNUTTNWc3NLSTVTYTgzRjk0dkpsMStUcHROS0RvN1RxazR0Y0xJUlpo?=
 =?utf-8?B?VTBTVzRaQkx1TytqVGcrbnl4MEsvVGRaTEdnNHhsZXUzUFkwbzBPY2RQdHgv?=
 =?utf-8?B?bXRnTFBZL0x3bzVFK20wbzlaZnpUdDc2TXd5VnU4ZXp3YytHWHJmRkJ1K3ha?=
 =?utf-8?B?RTRWVTFqdUNoT3B1alhuMkhZWkNRdUIwSkU3TWhsSEdDMW83THJnU3JxTWVW?=
 =?utf-8?B?Snk5eUlST3JtVC9CL1lQcDI2N2lqcVcxRjFQMFEza2J6QVZ6TDB5bFBXeHM1?=
 =?utf-8?B?QkdaVTZOWnNaWkF6Y2RYRVB1V0ppSm9ya3NPcUdIcDIyRGNHeDU1Wkk1VXhP?=
 =?utf-8?B?RllOSk9EVExnSHZyU0w1M05XeTdIR1M3SFZSQ25KV1FvS2ViL0hzVm83akJM?=
 =?utf-8?B?Q0cxQnJIWGt6REROTVZuTkF0ZVdhTlhWTm9wUEtwQUtBWTR6YjhXNzVjUFhw?=
 =?utf-8?B?bDQ0M1diS2hHSzJ2em1td3EvcHhTMDNYR1N3Y2QwM3RuTzFBekRLMUNkMERR?=
 =?utf-8?B?YUx1eWd2cmVic1JUaUI4eEw5WWpQY1I3aXBzSGRDT0dLL0FNcXp3KzN1MllN?=
 =?utf-8?B?emxubmpTdXdoSk9aQjVPOUJ4b3ZNVkhmTVpGWW0vclNtb1NINWQ5UUZvUUZQ?=
 =?utf-8?B?Sm5WVkxpcW5DQUtiSmVWajNvbWhtMDJYRER3bzNkQWdlSzFNYXJRSTlvODBB?=
 =?utf-8?B?Yk5LaVRYcjdaSUJOa3RKSWVLQzdoM3lLbHdjblUzNHV6aDBsWUV5OU9ZWk9r?=
 =?utf-8?B?WlBRTHQ1cTdQVjFGczl6SWxWSXRNajNyVU15UXFGK2t0L3ZsSHNYRm1nWkph?=
 =?utf-8?B?QXdIT0c4OVE0LzNhS2VaSk9pQ0EwY2IwRWt3ZmRwSTllbzNZZUFuVDc5YzUy?=
 =?utf-8?B?eFJCcjlVYmpQUGJVNmxVbWdWVEF3N3RPbFo2djRIVDc5bGZseWtDRGt0bTFr?=
 =?utf-8?B?Z0VpNmxMdzFEWGQ4QU1hQmlvMGJiUHphalJ2amdhSjEvN1Q5YzRhWUZxZXVS?=
 =?utf-8?B?TEpVWEVyMTg5ZkRLUy9LNXUrWnNJODdOSmpHVGI2U0hhWmRvS1BDbFEwZEpS?=
 =?utf-8?B?OXlabkgyZXRWdjlwOTJZc28welVxQUZxL0NiZXBNbGhMYWxsZEo3VldrSlFL?=
 =?utf-8?B?WVhtY01BWFFSYXpBakFhZkc0MDdMRW42RW1XUFNqWDV6bHZkUW5VUW1lT0hw?=
 =?utf-8?B?TXBIY0pKcEUyY1RpaU4vTVdQVVVVcnV0eWpDTDZOZHkydk9VOGd2TnFmN1Vr?=
 =?utf-8?B?NG5NOUhNR1RxanpndGVUUkNLanZUUDJWbklyZjRQbGw5d0xxWW9wUDFJMUxk?=
 =?utf-8?B?MGVTUkZBQnZkUGhHRmsrakRteGIrWHhVRXkwVStyTXlqUVZreVpUblJKNDJ2?=
 =?utf-8?B?eUNKaUlWNkY4aHpHNXdCRG1QcFB1RnhHb0pVRDA2b1BGYldwdkRMU0ZUUnpG?=
 =?utf-8?B?ZW9TY2FUalZGcEI2S0UyVDBJKzBkaHJtcldXNzlqTGV6VElnL0RrZ25JaTNu?=
 =?utf-8?B?S3hweWpjMEFNVmlhUG5xWloya3o4emFOWXNhbkpqcDU5SklNbmxJSGt0VVow?=
 =?utf-8?B?Vjh5cWZjNGtZY3d6NHhwQjZlTlR0TWRtNE1mOGxMdGJ4cWZ3Z2xabmthY3Nq?=
 =?utf-8?B?ZGlIQVJnNW15bE1BSU4zaURzWmI4S0FJa2lWUzFZVDRSeE1jOFMzT01oOWJw?=
 =?utf-8?B?VDRvSkZkckVnb1pJVmFzNldOaEIvTmdWc2NyYlNTZjI5WndzUUd4d2xNSnB4?=
 =?utf-8?B?N3A5Y2ZYNjVWMFR0Mk1OVnF6NHdXT2dTTlhieDVxcnlrWEMwMjV3N2JEbTJF?=
 =?utf-8?B?MmRBZms4U0RySXN5UlROdERRQ1ZhWUlvcTdJSi9mUkY0Tjc0RVd4NmhrUmJF?=
 =?utf-8?B?TzRWMW5zakZBWXFiUlNQZmEzU2srQklZTVNtYk8rQkZLcVpXaWFDWnlhR0xZ?=
 =?utf-8?B?VTh5Wk1XMVhqak5GckJmM2JRKzk4eVhRZWYzbTl2d3hoODBRQVpZeXVSWWE1?=
 =?utf-8?B?d2hydHlvS0lWMUZGd3FVYkhnRTJFL1RmZ2hHT042bXpXVFpQVlpkSHlaZmRX?=
 =?utf-8?B?R0hxNEdMMlN5S01vbUJIT1NUb3pQUHM2VXdpcFV1YU9qY1lhR20xUi9VaVY0?=
 =?utf-8?B?V3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E27608956AB94E42B941B6E82747D1FD@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14692636-1f8a-48b6-b78e-08dde3db2ce2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 13:27:44.6827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SwZzZ17esmBXmcdG/lMSwEp3smtGgH/JhisoU+pJ9ONsB34s8WHErs0k0dsZLJwj6mL9I16HUBn/qNrLvXw3LivwkCqP8Hn60QmRAXkcyqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10858

DQoNCk9uIDgvMjUvMjUgMTQ6MDcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNS4wOC4yMDI1
IDEyOjU4LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBPbiA4LzI1LzI1IDEzOjMwLCBK
YW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAyNS4wOC4yMDI1IDExOjA1LCBEbXl0cm8gUHJva29w
Y2h1azEgd3JvdGU6DQo+Pj4+IE1JU1JBIEMgUnVsZSAxNy43IHN0YXRlczogIlRoZSB2YWx1ZSBy
ZXR1cm5lZCBieSBhIGZ1bmN0aW9uIGhhdmluZw0KPj4+PiBub24tdm9pZCByZXR1cm4gdHlwZSBz
aGFsbCBiZSB1c2VkLiINCj4+Pj4NCj4+Pj4gRGV2aWF0ZSBmdW5jdGlvbnMgbGlrZSAnbWVtY3B5
KCknLCAnbWVtc2V0KCknLCAnbWVtbW92ZSgpJywgJ3NucHJpbnRmKCknLA0KPj4+PiAnc3RybGNw
eSgpJywgJ3N0cmxjYXQoKScsIGFzIHRoZXkgcmV0dXJuIGEgdmFsdWUgcHVyZWx5IGZvciBjb252
ZW5pZW5jZSwNCj4+Pj4gdGhlaXIgcHJpbWFyeSBmdW5jdGlvbmFsaXR5IChlLmcuLCBtZW1vcnkg
b3Igc3RyaW5nIG9wZXJhdGlvbnMpIHJlbWFpbnMNCj4+Pj4gdW5hZmZlY3RlZCwgYW5kIHRoZWly
IHJldHVybiB2YWx1ZXMgYXJlIGdlbmVyYWxseSBub24tY3JpdGljYWwgYW5kIHNlbGRvbQ0KPj4+
PiByZWxpZWQgdXBvbi4gVXBkYXRlICdkZXZpYXRpb25zLnJzdCcgZmlsZSBhY2NvcmRpbmdseS4N
Cj4+Pg0KPj4+IEhvdyBjb21lIHNucHJpbnRmKCkgaXMgYW1vbmcgdGhpcyBzZXQ/IEl0cyByZXR1
cm4gdmFsdWUgaXNuJ3QgcXVpdGUganVzdA0KPj4+IGZvciBjb252ZW5pZW5jZSwgaW1vLg0KPj4N
Cj4+IFllcywgc25wcmludGYoKSdzIHJldHVybiB2YWx1ZSBpc24ndCBqdXN0IGZvciBjb252ZW5p
ZW5jZS4gVGhlIGRldmlhdGlvbg0KPj4ganVzdGlmaWNhdGlvbiBpcyBwcmltYXJpbHkgYmFzZWQg
b24gdGhlIGZhY3QgdGhhdCBpdHMgcmV0dXJuIHZhbHVlIGlzDQo+PiByYXJlbHkgdXNlZCBpbiB0
aGUgWGVuIHNvdXJjZSBiYXNlLiBNb3N0IGNhbGxlcnMgb2Ygc25wcmludGYoKSBkb24ndA0KPj4g
Y2FyZSBhYm91dCByZXR1cm4gdmFsdWUuIFNvLCBzbnByaW50ZigpIGlzIGluIHRoaXMgbGlzdC4N
Cj4+DQo+PiBNYXliZSBzZXBhcmF0ZSB3b3JkaW5nIGlzIHJlcXVpcmVkIGZvciB0aGUgc25wcmlu
dGYoKSA/DQo+IA0KPiBNaW5pbWFsbHkuIFBlcnNvbmFsbHkgSSBkb24ndCB0aGluayBpdCBzaG91
bGQgYmUgZGV2aWF0ZWQgZ2xvYmFsbHkuDQo+IA0KPiBKYW4NCg0KVGhlcmUgYXJlIGFwcHJveGlt
YXRlbHkgMjMwIGluc3RhbmNlcyBvZiBzbnByaW50ZigpIGJlaW5nIHVzZWQgd2l0aG91dCANCmNo
ZWNraW5nIGl0cyByZXR1cm4gdmFsdWUgKGFjcm9zcyBBUk0gYW5kIHg4NikgaW4gYXJvdW5kIDIw
IGRpZmZlcmVudCANCnNvdXJjZSBmaWxlcy4gRGV2aWF0aW9uIGVhY2ggb2YgdGhlbSBjb3VsZCBi
ZSBjb21wbGljYXRlZC4NCg0KRG15dHJvLg0K

