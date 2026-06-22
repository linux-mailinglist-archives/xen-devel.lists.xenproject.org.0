Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UXqmEMYOOWp8mAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 12:30:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3196AEB3F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 12:30:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=KRPZsAEM;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1343595.1602856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbbuH-00055O-Uw; Mon, 22 Jun 2026 10:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343595.1602856; Mon, 22 Jun 2026 10:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbbuH-00053r-RE; Mon, 22 Jun 2026 10:29:33 +0000
Received: by outflank-mailman (input) for mailman id 1343595;
 Mon, 22 Jun 2026 10:29:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wbbuG-00053l-Mk
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 10:29:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbbuF-00AH3e-Hn
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 12:29:31 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a390e7e-5cb7-0a2a0a5109dd-0a2a4506d112-20
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 12:29:31 +0200
Received: from [52.101.66.138]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a390e8a-b690-0a2a45060019-3465428a1843-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 12:29:31 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by PAVPR03MB9163.eurprd03.prod.outlook.com (2603:10a6:102:32f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 22 Jun
 2026 10:29:28 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 10:29:28 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uj6u4GJuv5+kG06bS4rfdSBsrUzK8z9fX2V8Zm+McURm5sDu4WpDF0lMWhu/p7OZ7/mqgP540s8TgadfShuVjDCyULiDBKe1TdmpBxn6zXzY+OXToxwwgE95oUus99CNgFl5AFza3WTBsOiFavJGinc/STOiS9/azQqygh8a7UGOFTYddpETKrOsB6etY+5XsStt1JdW5ny2vXE3NqjBdT4wYdxnhL9JePJHLYF5RpBQkSe98BMvvUELRnP+v4qI7rJZFxI6e07uc6zNg3WmV7SpN903muih8Qxy2W/ndb2lhpa8/TLC5ArAayVGzGPajKZ5JzyKLPW/XBTuL0uvwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OPj2m8WuMXVs5yKVJD9WdJyJiuolgLjdQcFIMGlPs3c=;
 b=ldCPhEZtQWdCdnDDQKBc96bhLOhKVWbOExV18nOKYOztfhtlATJwCqI3WVFS2Cgr9u+DLkctxbIfWVmHgZrKQo/frqA7t5p0eH3D+KuTntCNtiI+erhMnIyVpsdA+9gO938bTRGbNZGlVIzkN9+fpyoJbxysmGhmpVUVpxVW29lbFayBmyVgK6tD3cMNBemXQPRgh5Wz+YAFEcRu5IaCJf2szEwte16Nscnuy6YZn79DyKTGdxnI3kEcGJz5m5vtIsSy+W75k5LW3gx7QRHfdSq/7uNawrMAHmNGStErR6m4M3N0KjHa4Kq/DON10O7k8hlOektzg73/3q23DFLP8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPj2m8WuMXVs5yKVJD9WdJyJiuolgLjdQcFIMGlPs3c=;
 b=KRPZsAEMEnxMlPzZLnPcliYUqeiyg8kiV0Ga4pkN/0R92iB1pSehd4vpp2q946rNf4sGqAUPgtMOSK8TfhRYuLDy/Txgi2o9wKf8GojkSeLOSMmucmKdqtdAu3PHxy7vQW7rAc2+vtXx9S6nKRfwfGsw1qCAFdWb7Wfe6Zq2qda2dmbxJ5sfk9zYjMFgOFg+C+77rT5U8r97xvO3ylxLmZNYlpc1DOGnweP8tDg9dgwBaDvhBt0tTRy2dmCzg3Xm3nBlUrGaiTO1WAzCnByF0YVjRKaetq93fdJ7MHTBpb+sIfdvFffV02sMbPlJNd7rLlNER8T0RUP2us49G6ivUw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] generic/altp2m: address violations of MISRA C Rule 2.1
Thread-Topic: [PATCH] generic/altp2m: address violations of MISRA C Rule 2.1
Thread-Index: AQHcyEeH3FAPJgz8C0q4McY6u5ZElbXXzxqAgHMEWQA=
Date: Mon, 22 Jun 2026 10:29:28 +0000
Message-ID: <d6dcde3d-99eb-4fa3-9078-a13e35c8a1b4@epam.com>
References:
 <8b5ca213a097f7b221b06b6173e4621563779a73.1775752149.git.dmytro_prokopchuk1@epam.com>
 <3b2daddd-9afc-4c75-92c0-f7c6ace3f735@suse.com>
In-Reply-To: <3b2daddd-9afc-4c75-92c0-f7c6ace3f735@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|PAVPR03MB9163:EE_
x-ms-office365-filtering-correlation-id: ccd0296f-9dea-49fc-720e-08ded04923ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|42112799006|366016|23010399003|38070700021|4143699003|22082099003|18002099003|11063799006|56012099006|6133799003;
x-microsoft-antispam-message-info:
 97EOhXidIKQpa9nm5csCAAv4pcNiqZege1Wp7VbLsziNCqph3QjURwUZzesWvi7HIBCMkGqrTxuuyaB5k8boUMIfeQUVwcna+nTqoffQXtLtmodif92pSKYPp6eBtwCT7C+dfGRQ4DXnPQQFZQSP1yw6i2KqGd+syHhHRlB6z1KElxLt6FHrgmUgd41gH4PhWzZj19zci4wgIH73/9LEKOxl8Fw97HpoI0gB3ry/m2zpf1Z4CdDLrlztf5q/i4XGpwL7FFfAW0r/IPH68G6ikwdTgzIs68E6ptmcHuwEWFE0Duxiq7trQm+xkphgWdo+W8Aaygx851K9jeuX2NHKNcB1jstDcU/SnPgx2ReO97JZXF8x4XZ2/TNMipoTZrcZ59pbD1ijeIt5hGt76AqPYN/N6aIxC++Q5g4FhCOLWfbgpSrXqHsG/ruxxrVYFoEc+IkCg0ohAJMWCalnT6IQ/TZmh4c2N0re/IMK0tQUynHS3/ubdGWjLsb9oVjq/Ifz4k/OeT8iXbkmWVrZIJNTn8N1ZP3YmvvbuYAnvoqMkxR8MRsHtnGmjz2qR7i2/AzoAiAqrWXeSWIqV8JcsET1bJkDzkzIED2jpm8MaTJ/z8wortYtgQs4K6fMyTwZqJ5BxQjebZVOtEtGw0l8en8A9YIXf0rt/QDJZv+maPw8v8WjVRnpzBn76NWdmuLx8oAavxeGFIHkSV09dVk04sD8wGKa6jUA617DErwSuJRrDXY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(42112799006)(366016)(23010399003)(38070700021)(4143699003)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Tk1ZQmx0RUxzZkRWNlgvaFh3UEZtMUI1NDBoQmNoWHMvT2V3VXRmMVFnbmJa?=
 =?utf-8?B?YXJMTnFlaDYybnJWM0JJK0VnbUxDdnJHOUN3bmI1SkUyNDFYZjdLQzhwSGlG?=
 =?utf-8?B?aU1weVdYUEpNa01WcUcreHp5NzU1bUhuVnhTZk5aRlB0cTc4K2JtRTdmMWE5?=
 =?utf-8?B?ZTBmU2NQUG1ySi9JajdKamlhVldUeEpDSnBPYzJBbjdmVVIrV0haUURROGZm?=
 =?utf-8?B?OUdPOHlTa284MmUzZUlPQW9HUVpNcHUwWGppSm1JUXFUWVR0Tnl6VW5VZCtJ?=
 =?utf-8?B?ZWttY0ZSVzJtK3NNRGZnUk1OMWF3Nm9zSFhvbjd2UWxKK2NIL2V6ZnhheXA3?=
 =?utf-8?B?S0I5T25acU9EdS95czRwTlRaZllwTkF1U1pnMXpOVHVqdVNRSHpRaVVGUVFi?=
 =?utf-8?B?RzVoWjNtY29ZOEZWaDMyYldpZkIyamEvNnlBUzdBSUJjU3VtcGlaOVBNcjl6?=
 =?utf-8?B?TUVKenc0OTU5MXE3bjhhcFJqYnh5UlRvT240K1U4MVNYSWovMUhHdjJEUjR2?=
 =?utf-8?B?QytkT3ZMMmFOL2ZCUkNNWWh2WTFtTmtFaDhBeDBIcU8wQ3gxdkVIOEpPV1Rr?=
 =?utf-8?B?N3plRHNJTzVaT0VWejkrMmRZS1NWSnZhR2VzY2ZNWC8yUktPQ1RscnEyNjF6?=
 =?utf-8?B?aFM2d3MxY0xPcFdMVWVua2JJZjl3L1ZwWUszMVBJbGxzZzNPSExPUTlSWVZz?=
 =?utf-8?B?d1crOUwwakJhVnJrRFFVS0NHNXE2QzFYYjgwbjFUaEpsWUxsd0c4VmliSmZZ?=
 =?utf-8?B?WXJZWC8wQWpEQ2lGWG5hMkhMM0VyNXE1SnRsMFZnTERhRVpMSWVEMDJkVjM4?=
 =?utf-8?B?dXZUcGtza2hWbGtOR1kwWk9iZTlERTlVZCtXSEVKcTh4RUFCYjYrOWwwZWZY?=
 =?utf-8?B?ZHcwZjVBVVFvbi9ySFNUaDVmRHZ6aG1zWjJqejBOSGJmZ3F4WFZoN0lPdVND?=
 =?utf-8?B?c2U5SXFnRkJFcC8xK2FDQ1dHMjZ3bnBxU1RpNGY1eEgyYU9IL1RFL1EzNStl?=
 =?utf-8?B?UlFLTER5L3FidlpOemVQdmxvaWpZTE12L2pLVWtjSHp1Ynd0cnp3Z0JOYVgy?=
 =?utf-8?B?Z040SU5icFVmYm5wWDNzSlFnbkJUUytHS0FmRi91ZE1Jb0lCakx5R1B1ZzVC?=
 =?utf-8?B?bkRnbzJiUEhkSnVEMG5udFkxTEcxcWRrdkZ4Z0djZUZ0bDBMMlJUMVFadEUv?=
 =?utf-8?B?Y2ozRFlacSsrMHFxcHhBYUE5Yk9YTUlENlh6bFhNS1liOU8ranZjd1pvbUo3?=
 =?utf-8?B?TVhtS3R4blJZbEtCbVoxL3c5YjVMYW1zNDNYRSsrbFJqeitnOWtqbHpSSHRZ?=
 =?utf-8?B?U01wOWNYcDZ4Q2VaMjBocWtLYVpyd292eVZid3Z6cWlWRmlBSXpoZmpjT0VN?=
 =?utf-8?B?M1hvWG80K1h0cnpNWDYrUjdZOFo1ZnkyQmM2WVUvRy82RUpkY1g5djkvV3R4?=
 =?utf-8?B?MDU4YXpyaXVnR01jbm5Zbit1b3U0YnZKR1pPZVRYdWR3cE4xaER5bnBmVTNi?=
 =?utf-8?B?aWM5WmNvaW5kZ1lZZUwrY2JCd1YwSDROR084RzhPM3NHUzJBVGtkMEx2eCsz?=
 =?utf-8?B?V3l5RGdWQ2VqSDBIbzJjTnFPWTNIV2ZNZ09qTTV6dXh6NXowbkFHNXBTZDhZ?=
 =?utf-8?B?OGt6d3hEMENqdkJ6U1VMeTJES2pyUGRDV0ZuUGlZRUw5ZkJGUll3dWhPdG8x?=
 =?utf-8?B?RzdZNFplcHc4RFpNdm5jM1RlUGV4SlhuUGh5amsvVnBwL2R1am9IMGQ3R05J?=
 =?utf-8?B?QVRsazRGSEVyRUJvZk95Um5BbVFMNFNOY2R4MThqUmMxSWdRQ3lsMksycHNv?=
 =?utf-8?B?azRBVzBHWGpiUi9QWXBjNkFsYmRPeVQ4KzZWZ3puRkc4Y3pIR1BMRlh6QVpY?=
 =?utf-8?B?aUhkd1dnaXJkcGI4bUwxMTFyeU8wZldLKzdsYjNGdnRKU2ZjUnlkNUQ4WFRL?=
 =?utf-8?B?ejlMM3pmdUZDVGZnL1dCWXlhYlFmMUR6Q0cyaVY3bkRHMmpqSkIyTXVlQmVO?=
 =?utf-8?B?NFFLdWFMRVVYM1MxeDFqM2tBTU83M0U1dzBMbDJsZkptbk9BK2VvVSsybjE4?=
 =?utf-8?B?WTZWbzR5cStBdzRZTktkK29hKzVLQlczem0xVkt1TFlOTWNlcTZFS0VEL1dK?=
 =?utf-8?B?TVBHWW1HUlZWZjJTYmkvWkFsK1lVdGRFMVhCRSt2aUJoRHpRWXBpMEVoZkdD?=
 =?utf-8?B?SFp3d1BTZHg3Znc0UEttakFwU2VZSklWQjdTWUhud3ovRDVUa09ZL0ZyS01t?=
 =?utf-8?B?QkVIN0tZY0VGTXN5WWhRSjg1eGV2L3FoSVBlUDM3ZEtDSXBxZXY2UkUzWlBn?=
 =?utf-8?B?Zkp1KzVPcmFndHU1Q2dkRVcyNVN6cWpPQk1Vb0k2MDI0Tzc3RFB6V1Uvdmkz?=
 =?utf-8?Q?JiUFyjOzLvOwrA/w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D928434CC516AE41B4DB748D7469FBA7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd0296f-9dea-49fc-720e-08ded04923ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2026 10:29:28.8093
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N6UxvjqskK7OHsOU/JO2xIVUrhHUr4y9tjKH9mT8xTtmxKi2d3i33idthJJbtuV0vssH0LiuVlnzG5SL9wdummt5irzGG3uMrlf4Ortn1mE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9163
X-purgate-ID: tlsNG-16d1c6/1782124171-3BBE1853-7D67AEFE/0/0
X-purgate-type: clean
X-purgate-size: 3322
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:mid,epam.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B3196AEB3F

SGVsbG8sIEphbg0KDQpPbiA0LzEwLzI2IDA5OjA0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24g
MDkuMDQuMjAyNiAxOTozNywgRG15dHJvIFByb2tvcGNodWsxIHdyb3RlOg0KPj4gTUlTUkEgQyBS
dWxlIDIuMSBzdGF0ZXM6ICJBIHByb2plY3Qgc2hhbGwgbm90IGNvbnRhaW4gdW5yZWFjaGFibGUg
Y29kZSIuDQo+Pg0KPj4gSW4gY2VydGFpbiBidWlsZCBjb25maWd1cmF0aW9ucywNCj4gDQo+IENh
biB5b3UgZ2l2ZSBhbiBleGFtcGxlIHdoZXJlIC4uLg0KSWYgQ09ORklHX1ZNX0VWRU5UIGlzIGVu
YWJsZWQgb24gQVJNLg0KPiANCj4+IHRoZSBmdW5jdGlvbiAnYWx0cDJtX3ZjcHVfaWR4KCknIGlz
IGRlZmluZWQNCj4+IGFzIGFuIGlubGluZSBmdW5jdGlvbiB0aGF0IGNvbnRhaW5zIHRoZSAnQlVH
KCknIG1hY3JvLiBUaGlzIHJlc3VsdGVkIGluIGENCj4+IHZpb2xhdGlvbiBiZWNhdXNlIHRoZSAn
QlVHKCknIG1hY3JvIG1ha2VzIHRoZSBmdW5jdGlvbiBub24tcmV0dXJuaW5nLg0KPj4NCj4+IFRv
IGVuc3VyZSBjb21wbGlhbmNlIHdpdGggTUlTUkEgQyBSdWxlIDIuMSwgdGhpcyBwYXRjaCByZW1v
dmVzIHRoZSBpbmxpbmUNCj4+IGZ1bmN0aW9uIGltcGxlbWVudGF0aW9uIGFuZCBpdHMgQlVHKCkt
YmFzZWQgdW5yZWFjaGFibGUgY29kZS4gSXQgaXMgcmVwbGFjZWQNCj4+IHdpdGggYW4gdW5jb25k
aXRpb25hbCBmdW5jdGlvbiBkZWNsYXJhdGlvbiBmb3IgJ2FsdHAybV92Y3B1X2lkeCgpJy4NCj4g
DQo+IC4uLiBhIGRlY2xhcmF0aW9uIGlzIG5lZWRlZD8gVGhlIHNvbGUgbm9uLXg4NiByZWZlcmVu
Y2UgSSBzZWUgaXMgZnJvbQ0KWWVzLCBkZWNsYXJhdGlvbiBpcyBuZWVkZWQuIFRoZSBmaWxlICdj
b21tb24vbW9uaXRvci5jJyBjb250YWlucyBhIHVzYWdlIA0Kb2YgdGhlICdhbHRwMm1fdmNwdV9p
ZHgoKScgYW5kIGNvbXBpbGVyIG11c3Qgc2VlIGl0IHRvIGF2b2lkICJlcnJvcjogDQppbXBsaWNp
dCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhhbHRwMm1fdmNwdV9pZHjigJkiLg0KPiBjb21t
b24vbW9uaXRvci5jLCBhbmQgdGhlIHNvbGUgcmVsZXZhbnQgS2NvbmZpZyBvcHRpb24gSSBjYW4g
c3BvdCBpcw0KPiBWTV9FVkVOVC4gV2hlbiB0aGF0J3Mgb2ZmLCB0aGUgZmlsZSB3b24ndCBiZSBi
dWlsdCBhdCBhbGwuDQpCdXQgd2hlbiAnQ09ORklHX1ZNX0VWRU5UPXknIHRoaXMgZmlsZSBpcyBj
b21waWxlZCBvbiBBUk0uDQo+IA0KPiBGdXJ0aGVyLCBCVUcoKSBhbmQgYSBmZXcgbW9yZSBjb25z
dHJ1Y3RzIGhhdmUgYSBkZWRpY2F0ZWQgZGV2aWF0aW9uDQo+IGFscmVhZHkgaW4gcGxhY2UuIEkg
ZG9uJ3QgbWluZCBhIHVzZWxlc3MgZnVuY3Rpb24gdG8gYmUgc2hydW5rIChvciwgYXMNCj4gcGVy
IGFib3ZlLCBwZXJoYXBzIGV2ZW4gZHJvcHBlZCksIGJ1dCB0aGUganVzdGlmaWNhdGlvbiB0aGVu
IG5lZWRzIHRvDQo+IGJlIGRpZmZlcmVudC4NCldlbGwsIHdpdGggU3RlZmFubydzIGNvbW1lbnQg
cmVnYXJkaW5nIHJldHVybiB0eXBlLCB0aGUgY29tbWl0IHN1YmplY3QgDQphbmQgbWVzc2FnZSBj
b3VsZCBiZSByZXdyaXR0ZW4gbGlrZToNCg0KZ2VuZXJpYy9hbHRwMm06IGFsaWduIGFuZCBzaW1w
bGlmeSBhbHRwMm1fdmNwdV9pZHgoKQ0KDQpUaGUgcmV0dXJuIHR5cGUgb2YgJ2FsdHAybV92Y3B1
X2lkeCgpJyBpbiB0aGUgZ2VuZXJpYyBhbHRwMm0uaCBoZWFkZXIgaXMNCmN1cnJlbnRseSAndW5z
aWduZWQgaW50Jywgd2hpY2ggaXMgaW5jb25zaXN0ZW50IHdpdGggaXRzICd1aW50MTZfdCcNCnJl
dHVybiB0eXBlIG9uIHg4NiBhbmQgdGhlICdhbHRwMm1faWR4JyBtZW1iZXIgb2YgdGhlIG1vbml0
b3Igc3RydWN0dXJlcy4NCg0KVG8gZml4IHRoaXMgdHlwZSBpbmNvbnNpc3RlbmN5IGFuZCBzaW1w
bGlmeSB0aGUgaGVhZGVyLCB0aGlzIHBhdGNoDQpyZXBsYWNlcyB0aGUgc3RhdGljIGlubGluZSBp
bXBsZW1lbnRhdGlvbiBvZiAnYWx0cDJtX3ZjcHVfaWR4KCknIA0KKGNvbnRhaW5lZCBhIEJVRygp
IHN0dWIpIHdpdGggYSBzaW1wbGUgZnVuY3Rpb24gZGVjbGFyYXRpb24gcmV0dXJuaW5nDQp1aW50
MTZfdC4NCg0KRm9yIGFyY2hpdGVjdHVyZXMgdXNpbmcgdGhlIGdlbmVyaWMgYWx0cDJtLmggaGVh
ZGVyIChzdWNoIGFzIEFSTSB3aGVuDQpDT05GSUdfVk1fRVZFTlQgaXMgZW5hYmxlZCksIGNvbW1v
biBjb2RlIGNhbGxzIHRvICdhbHRwMm1fdmNwdV9pZHgoKScgaW4gDQpjb21tb24vbW9uaXRvci5j
IGFyZSBndWFyZGVkIGJ5ICdhbHRwMm1fYWN0aXZlKCknLCB3aGljaA0Kc3RhdGljYWxseSByZXR1
cm5zICdmYWxzZScuIFRoZSBjb21waWxlcidzIERDRSB3aWxsIG9wdGltaXplIG91dCB0aGVzZSAN
CmNhbGxzLCBhdm9pZGluZyBhbnkgbGlua2VyIGlzc3VlcyBmb3IgdGhlIG1pc3NpbmcgZGVmaW5p
dGlvbi4NCg0KPiANCj4gSmFuDQoNCkJSLCBEbXl0cm8u

