Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hAHsLVuPT2q+jgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 14:08:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EED9730D44
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 14:08:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=NfJjrgir;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1358078.1612358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whnYZ-0004qA-GQ; Thu, 09 Jul 2026 12:08:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358078.1612358; Thu, 09 Jul 2026 12:08:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whnYZ-0004nf-DQ; Thu, 09 Jul 2026 12:08:43 +0000
Received: by outflank-mailman (input) for mailman id 1358078;
 Thu, 09 Jul 2026 12:08:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1whnYX-0004nZ-6B
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 12:08:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whnYW-00BbsW-3T
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 14:08:40 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a4f8f47-e002-0a2a0a5209dd-0a2a4503d0ec-2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 14:08:40 +0200
Received: from [40.107.130.100]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a4f8f47-f2d2-0a2a45030019-286b8264fcf7-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 14:08:39 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by VI0PR03MB10445.eurprd03.prod.outlook.com (2603:10a6:800:201::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 12:08:37 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 12:08:37 +0000
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
 b=fezcNCTJ2ONvPaJIet5Ofh0PztGI/oRlPjCrECtEVo/FinJ3wuE+piNiz7COQ9rV1hTySRjxnr0Izo4lDC/7e0GGvw7PVYGjOEV5sWtjBXLHAkgUZ65RCXTna4ka/iZJbRFo4X87Hyyav1/2IrzilhUEy3hu+CaRW5hyLlDt5rNrmqRZ9X+CjpHv8b84Ag00hIDIlGRKc3t2nCR9Pj6KPdtxjuaElB2OAxOD5DFgNRBh/N2mAWSg4eA4buhaLu7gIL/H7rNl4NKGEzPkp7/57YCcSy6N3W4TtX1B24sWp/FI5BIo+BXi8H2io4GbKLODtj+kkCDEiQCB8DUpWkzKsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1nj5p1ftu6gvs7NNOcaOcvCCo1XAJuDIKFr6FHVlds=;
 b=pPUUV/sXvEPmpjehftY4ioZmXdEi+alYZx0WgWrk6jiRQt3/twOMxiPSpl1vX4s16VZzSRTXGmaT8G8Et1ahcKK2dICY+eVPvsNlXysc/VzxaYpwjNnb02iuNPL8Cy4IbfTFTd5IZzQthwsCspInd7HJ8+6hM917/n1nvZRCfRwP3anWAmG4xLoJIbYatvHaRWWnMIy90XuVzaAFJLqAYZDXSo9XceAamZglwv/0/h/fRoyLUdHnC/fK1IY17sJwRwryXrvo45EThN9VLOP7uFDBnUPLVIc2XSLTR/yt5bhH/JrT5g6E4r1JyOB1Z+6zwgWTCR1ctaOW701GCRakqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1nj5p1ftu6gvs7NNOcaOcvCCo1XAJuDIKFr6FHVlds=;
 b=NfJjrgirl1ksFi2ZvZC0Ulc/0bGtRscMrpG1touyl1FN+LE9SonZ0LzI2iijS0FrdSBYJeoPHpY33W7Eni5K1q2ccPGB5pkBIpYMBEM3qWDAZcKxG4wJNR4KdKP7iOH5SYfI+AkUOyGH+5LIKDNlVRgJ9NGFj/Pe7yJQQcXtH+0FPU/rKe1P3lpW/Gn50pcOwLFjOe/Sj5ApN1YpNwwVM9dS/ikOZohCkwU4PShH5Kl3ff2f7JyCr80vN/s/PVnxjK5LAj7pJiUIHzuJQlNf4CLn82ibgR9Dnp+b1bujCTT+hCm3E/uK64r0Q0Fx293XYEcsR150v7JmEmMfgcoISQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH for-4.22 v4] dom0less: Prevent division by zero in
 handle_passthrough_prop()
Thread-Topic: [PATCH for-4.22 v4] dom0less: Prevent division by zero in
 handle_passthrough_prop()
Thread-Index: AQHdD5jJCDOEjONIbkmZhLZ5uEYFY7ZlFQ0AgAADGYA=
Date: Thu, 9 Jul 2026 12:08:37 +0000
Message-ID: <ad7404d9-e241-44d8-88f9-cc7a2b5436bd@epam.com>
References:
 <b31a0f41a52d78091556352c3e961c8238806e0e.1783597523.git.dmytro_prokopchuk1@epam.com>
 <d5c84561-5138-4913-888b-231a054a91c1@gmail.com>
In-Reply-To: <d5c84561-5138-4913-888b-231a054a91c1@gmail.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|VI0PR03MB10445:EE_
x-ms-office365-filtering-correlation-id: 5c4d1987-d3d8-40f4-265e-08deddb2cea1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|42112799006|366016|38070700021|3023799007|56012099006|4143699003|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 f9d9TecGJvLe4ss+tXDKuVoc4ASHvFILtgW3NZ7B0SoeHaOVpPKjzM7gnN+aXMwxDderTG20y8zSzOdWa3w1HsNQu256BWNF/ngyCzagTllo/BrDFPR9JltD9LWOUsrtTJlZZnY8UCSyHWQKNU2CVRaUtyJEem+4jiVI+qDQom0mXtEN1W3eStMeNHXwGfpgNDkXi8KU7a+WjWxig5Ifr6RXG79T630kOGc5wW+PrGIuMJ9WEpbFBT87IA2r9aYWf8MtarJ2XjzGV5NRcW5ajE0Y9t91h+m6GF8bCWH6SzUDObU+EVz2se0LrIle97ZRLD58qi5+eUZm2rrFEzMg+CI22cdp1OxCjud0rM4558UO+0IghYE9S9QX2Uha7jKBx2A210rD7NNfD9boxW71QQydwzIsdZVC57rkeJHx69U7Ej/7I3ff49qDbt4KFBmL8WhS23lkip4fKYo9BVNUQ7ZXfiWCrQPdf/Je7MP4uTZjVIuFwfzJgexlmL8BN/z8Bz1Ko5VrsrVlNEP5t5FPM4R2YXtgDUa4P44D3HRXut473BLZF4QxwiWUAtcaLYnMdZPtpOB5+ag+4RvdxiQFJ0UEcRxzX1O9z1ACQ0aUu4/WByXQp6JvLWmwoqr2w8YMnrsoCCN1lb4a8bqW+X/hBkrIgI2ts+J0d/b5oPfOZHor7mkqShMbSDTiHXFCcUS2stJ5cD6mpxWgiTTtZDXwpYV8JlHASm2G8N0BT3Nvhv4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(42112799006)(366016)(38070700021)(3023799007)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?alhucXhsY1lVaEwxT3p1Zmo3aVJWUGxZQ3AxbC9USVFKSG42TUR2MlpzblQ5?=
 =?utf-8?B?MWxHdWN1WTd6Z0hsMVg2VWVZTTB1anZCN2NjNmsvSW1vaS9WUjBPdkxPa3ph?=
 =?utf-8?B?Z2RhWFkwa1BxYUxXVUJqOU00ZnQxb0pMTFowZ3VaQnFHeThvbjQzdE1WbWsz?=
 =?utf-8?B?TEdiU0dKN3FzME56Q3ZPTHFmKzFmQy8yU1BXUVpjUE92Z2tlYWdpMlhYYk5Y?=
 =?utf-8?B?bFplc3M1Z3VibWk0c1dLSUJXZHcyNVNhNkNKWVZjSjA5dTh5TXA1eHl3Qnhy?=
 =?utf-8?B?VkFnbFJmNWZrdUVEK2daeU5RaGNUT1gySCt4aElwUjFmdjZJdS9BS0lJM0NS?=
 =?utf-8?B?TW91dlQ1cHJiV0RmZ0svUkVrV2FnOFdBVHYrQUt4VG5LVml5MzcxTkpsOTFD?=
 =?utf-8?B?WExFU1llNlJSSnZHaEVqbis5RFF3WkZyRm80WVZOa0l6NkJjeG1BT2Zvdjd6?=
 =?utf-8?B?bVZPaTRUMXVWMUx3ZlU1WkNNWWFsTGVQTitmTUhKMDQyT2QyWE00a212RXgy?=
 =?utf-8?B?Szk2cktOemFPUVNxNGNYNVFveE41dyt5VUZydnphSXVCSGFyZ2lFT1YxeTRX?=
 =?utf-8?B?NkRmcEExd0JMRnlTOFZVb0VUVXFSamlOMloyS0lPdThIUVlpaTM1bzNHS3FQ?=
 =?utf-8?B?RStHeTQ1S3BJcHUxMVA4L0lRVCtpaW1GUG5PL0VlOStJODNCOFhlNXdhUjRU?=
 =?utf-8?B?Z0ZQQUcyZXZoZ0o1LzRFTjRRWUk0Z3NCWkE3Mm1Zakg3WkhTT1g1YVJQZytM?=
 =?utf-8?B?OHBBWWlZK3hFNEJTb1djSE5CVDNPNHNpUkVmaGFHRmh1VWxGbHdJS0hGT2tB?=
 =?utf-8?B?c0x5M21jbGx5bG12Ky9kcWp0Rmh2b3VrdE5ES3JReW9USEN6QitSSjdtM1U5?=
 =?utf-8?B?Qk1BQTBYUzRsL1FKbTdWRXEyUVJKdnZYNXhFQWZtRGJhS0pySVNyR24zL0ds?=
 =?utf-8?B?ZUtITGMzWkZMeTNKV3cwV1BmWU9mblgwVlN6eFNhTTU3NFcxa0VQS3pHRmQ1?=
 =?utf-8?B?a25Pa2NuaE4rMk4wTHJFVjNnSXcweHJZYlYyNUNPT3U5TFRTdGYvdXlwWGR0?=
 =?utf-8?B?VENUaTdaY2dDaGxNWHNqaHJ5M1JxN1Y5LzE3My84UDNXMnFjOEswaTNCYjRV?=
 =?utf-8?B?L1hJSnFBaWxRSGRzejNwTnA4Q0hlUlhaOWJXT2hiOHQ0Sjl6T2hkSkJJL2o5?=
 =?utf-8?B?SHZoUHVXUy90UkdhU1F3czNqbHg3Tkw5WTdiakNzYlYvQmxXclNMZzNVbjR5?=
 =?utf-8?B?RTRSakhzNjNyWGxCM1dVVWVaTGN3UnZ6cU1RTGlOMjRBTnlaNHpXQ1NGVjNr?=
 =?utf-8?B?cndMMGZCdFJGdzRqTVlLakpJZDFSd0NmMGhjYnFkaGUrQ2FwRU1SdDJ5NTQz?=
 =?utf-8?B?RG5GOEhBbDRsbEFqTkZmdEw0bDhBc2hVNU81VTJISkRZbkhpaWJiVFRZSk9w?=
 =?utf-8?B?bmx3MWpyRnRaZW5PRGtKZERhSW92U3RkcE9NVFVwZU41eVE3YmRNSkh5aFVs?=
 =?utf-8?B?TEtJcWhDL3hOQllxMnM5eGE3VWovY3BVbW15NVdSN1JKNVFnTFBBUXF0Rlk3?=
 =?utf-8?B?R3dNOE1rRFEyTnJNdmlIZkRGZVhiN3JSSWFZNXpwTVlsWmVPaU5hR2JoWWlF?=
 =?utf-8?B?UStMdXZ1VURNZDhMazdUZ0RiVVE4cEU4M3ZZNzY1MEVqU1VNeEQxWTZBWjNH?=
 =?utf-8?B?R2ZPV0dyRUNGZmtzemdURVpQUEhHellxaVpodGkvM2E1UUhJZzl0THlVMW1m?=
 =?utf-8?B?NnBteTR3RVR4enAwOVlXQWU3MDVld3puZW8xN0RPSUk3YnVGRzFldW0zazN0?=
 =?utf-8?B?aFhhV2tObXdCWENNdTRHbStKT2owbllsQkpkekwvck9rZjVWcEQwbGxOYmY0?=
 =?utf-8?B?YmFtODdDMkZLbGo1dkFVSFR5SE1tM0ZobVNwSDl6OEY4cW5xN3IzVk9NcWhB?=
 =?utf-8?B?Y1UwV013U1hRQWNYbjl3ZXdMSGVOdU1OVGRKc2VKY3k3UWJRYy9DZkttcmNs?=
 =?utf-8?B?OGtrN1lPemRrY3VSK0V0d2FXck5EYVhUUmVFbk1HYm5PZmp0MW8xYkxDRFhT?=
 =?utf-8?B?OGZwbVlrdzFSTGNEY0ZNaVoyUTlvaGJBQXFoVkF4TUVaTGRINmMwa2hSZnhB?=
 =?utf-8?B?dzFHKzRIZU84bzF2TXhGcEJ1bThUSXVseGsydHpKU09FcjhoaTJmbG0rUVRp?=
 =?utf-8?B?dWd5TWN6M0hWMWpFNjR3cGZMVUJ1a1prV09HMTk3bkNiUDhzc0dSWWFBNUtI?=
 =?utf-8?B?RmpPRkNWczF4OTNtc3dLQUhTTkdkWkQ4K1Z1TldMVUR2K01ZdzF0Zm9lM3d4?=
 =?utf-8?B?bnlVK1lDZkdnRWl5Tkk3cWI4RDZLbllWekJkcXlScDFHVHBYZWxMK3dnSTlz?=
 =?utf-8?Q?Mk93z62CAKhK2dkU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <64256E89919DE74BA5B9CEF0D0763330@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c4d1987-d3d8-40f4-265e-08deddb2cea1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 12:08:37.3534
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N8vaxgYMtbmNKYmAjBTgQDa7KLPwlT+1vhdMj/3BT9D+FngkYeyidTYmx+udFuhy/orhKALYUT2+undGtdL6kfBjQ+0bPiCIPxJsZWYf80w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10445
X-purgate-ID: tlsNG-33051d/1783598920-F3B54CF4-83BD65CB/0/0
X-purgate-type: clean
X-purgate-size: 3310
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:from_mime,epam.com:email,epam.com:mid,epam.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1EED9730D44

DQoNCk9uIDcvOS8yNiAxNDo1NywgT2xla3NpaSBLdXJvY2hrbyB3cm90ZToNCj4gDQo+IA0KPiBP
biA3LzkvMjYgMTo0NyBQTSwgRG15dHJvIFByb2tvcGNodWsxIHdyb3RlOg0KPj4gQSBtYWxmb3Jt
ZWQgcGFydGlhbCBEVEIgc3BlY2lmeWluZyBib3RoICcjYWRkcmVzcy1jZWxscyA9IDwwPicgYW5k
DQo+PiAnI3NpemUtY2VsbHMgPSA8MD4nIGNhdXNlcyAnKGFkZHJlc3NfY2VsbHMgKiAyICsgc2l6
ZV9jZWxscyknIHRvDQo+PiBldmFsdWF0ZSB0byAwLiBUaGlzIHN1bSBpcyBzdWJzZXF1ZW50bHkg
dXNlZCBhcyBhIGRpdmlzb3Igd2hlbg0KPj4gY2FsY3VsYXRpbmcgdGhlIG51bWJlciBvZiByZWdp
b25zIGluIHRoZSAneGVuLHJlZycgcHJvcGVydHkgaW5zaWRlDQo+PiBoYW5kbGVfcGFzc3Rocm91
Z2hfcHJvcCgpOg0KPj4NCj4+IMKgwqDCoMKgIGxlbiA9IGZkdDMyX3RvX2NwdSh4ZW5fcmVnLT5s
ZW4pIC8gKChhZGRyZXNzX2NlbGxzICogMiArIA0KPj4gc2l6ZV9jZWxscykgKg0KPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc2l6ZW9mKHVpbnQzMl90KSk7DQo+Pg0KPj4gVGhpcyBsZWFkcyB0
byBhIGRpdmlzaW9uIGJ5IHplcm8gZXhjZXB0aW9uIGluIHRoZSBYZW4gaHlwZXJ2aXNvciBkdXJp
bmcNCj4+IGJvb3QsIGNhdXNpbmcgYSBoeXBlcnZpc29yIHBhbmljL2NyYXNoLg0KPj4NCj4+IEZp
eCB0aGlzIGJ5IHZhbGlkYXRpbmcgdGhhdCBib3RoICdhZGRyZXNzX2NlbGxzJyBhbmQgJ3NpemVf
Y2VsbHMnDQo+PiBhcmUgd2l0aGluIHRoZSB2YWxpZCByYW5nZSBvZiBbMSwgMl0gYXQgdGhlIHJl
YWQgc2lkZSBpbiBzY2FuX3BmZHRfbm9kZSgpDQo+PiBpbW1lZGlhdGVseSBhZnRlciB0aGV5IGFy
ZSBwYXJzZWQuIEFueSBpbnZhbGlkIGNlbGwgc2l6ZSBjb21iaW5hdGlvbiBpcw0KPj4gc2FmZWx5
IHJlamVjdGVkIGVhcmx5IHdpdGggYW4gZXJyb3IgbWVzc2FnZSBhbmQgcmV0dXJuIC1FSU5WQUwu
DQo+Pg0KPj4gRml4ZXM6IDljZTk3NGM0NzU4OCAoInhlbi9hcm06IGFzc2lnbiBkZXZpY2VzIHRv
IGJvb3QgZG9tYWlucyIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBEbXl0cm8gUHJva29wY2h1ayA8ZG15
dHJvX3Byb2tvcGNodWsxQGVwYW0uY29tPg0KPj4gLS0tDQo+PiBDaGFuZ2VzIGluIHY0Og0KPj4g
LSBwdXQgdGhlIGV4cHJlc3Npb25zIGluIGJyYWNrZXRzDQo+PiAtIGltcHJvdmUgdGhlIG1lc3Nh
Z2UgYXMgQW5kcmV3IHN1Z2dlc3RlZA0KPj4gLS0tDQo+PiDCoCB4ZW4vY29tbW9uL2RldmljZS10
cmVlL2RvbTBsZXNzLWJ1aWxkLmMgfCA3ICsrKysrKysNCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kZXZpY2UtdHJl
ZS9kb20wbGVzcy1idWlsZC5jIGIveGVuL2NvbW1vbi8gDQo+PiBkZXZpY2UtdHJlZS9kb20wbGVz
cy1idWlsZC5jDQo+PiBpbmRleCBlYWNmZDkzMDg3Li40NzQ2NWEzNjA5IDEwMDY0NA0KPj4gLS0t
IGEveGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9kb20wbGVzcy1idWlsZC5jDQo+PiArKysgYi94ZW4v
Y29tbW9uL2RldmljZS10cmVlL2RvbTBsZXNzLWJ1aWxkLmMNCj4+IEBAIC0zNDEsNiArMzQxLDEz
IEBAIHN0YXRpYyBpbnQgX19pbml0IHNjYW5fcGZkdF9ub2RlKHN0cnVjdCANCj4+IGtlcm5lbF9p
bmZvICpraW5mbywgY29uc3Qgdm9pZCAqcGZkdCwNCj4+IMKgwqDCoMKgwqAgc2l6ZV9jZWxscyA9
IGRldmljZV90cmVlX2dldF91MzIocGZkdCwgbm9kZW9mZiwgIiNzaXplLWNlbGxzIiwNCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgRFRfUk9PVF9OT0RFX1NJWkVfQ0VMTFNfREVGQVVMVCk7DQo+PiAr
wqDCoMKgIGlmICggKGFkZHJlc3NfY2VsbHMgPCAxKSB8fCAoYWRkcmVzc19jZWxscyA+IDIpIHx8
DQo+PiArwqDCoMKgwqDCoMKgwqDCoCAoc2l6ZV9jZWxscyA8IDEpIHx8IChzaXplX2NlbGxzID4g
MikgKQ0KPj4gK8KgwqDCoCB7DQo+PiArwqDCoMKgwqDCoMKgwqAgZHByaW50ayhYRU5MT0dfRVJS
ICJJbnZhbGlkIGFkZHJlc3NfY2VsbHMgJXUgb3Igc2l6ZV9jZWxscyANCj4+ICV1XG4iKTsNCj4g
DQo+IEkgdGhpbmsgeW91IG1pc3NlZCBhcmd1bWVudHMgaGVyZToNCj4gDQo+IGRwcmludGsoWEVO
TE9HX0VSUiwNCj4gIMKgwqDCoMKgwqDCoMKgICJJbnZhbGlkIGFkZHJlc3NfY2VsbHMgJXUgb3Ig
c2l6ZV9jZWxscyAldVxuIiwNCj4gIMKgwqDCoMKgwqDCoMKgIGFkZHJlc3NfY2VsbHMsIHNpemVf
Y2VsbHMpOw0KPiANCj4gVGhhbmtzLg0KPiANCj4gfiBPbGVrc2lpDQoNClNvcnJ5LCBteSBiYWQu
DQpUaGFua3MgeW91LCBPbGVrc2lpLg0K

