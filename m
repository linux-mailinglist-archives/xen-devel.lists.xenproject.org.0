Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vOoLGKSbQ2r1dAoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 12:34:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B006E2EB3
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 12:34:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=J8wEcR73;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1348652.1606387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weVmX-0000vG-Ge; Tue, 30 Jun 2026 10:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348652.1606387; Tue, 30 Jun 2026 10:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weVmX-0000ts-DP; Tue, 30 Jun 2026 10:33:33 +0000
Received: by outflank-mailman (input) for mailman id 1348652;
 Tue, 30 Jun 2026 10:33:31 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1weVmU-0000tl-Sx
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 10:33:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weVmT-00H0u6-Ee
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 12:33:29 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a439b78-2eae-0a2a0a5409dd-0a2a4509ce9a-4
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 12:33:28 +0200
Received: from [52.101.125.84]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a439b74-97e6-0a2a45090019-34657d542f8c-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 12:33:27 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY4P286MB6192.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:33a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 10:33:22 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 10:33:22 +0000
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
 b=jS+XHD4CL8baal23rlbYhtCDBuz+NYyhsr+HaaAK5xW5/fS6WsgM+JDGys8P2sxSfhw5A6Xx4yLeviQLyVG+MiFs9OJv+7KCYSQhM8KGd2s6bCGSok2CipzBsC6Hiq5ygprKZM3LWibjyDWYHydhLIOAh4Sa/CsdfnXMiiYVzOp2dfEbscf6xO7+NpqJtgDquY/wte63yetRECRCmGRVQ7tPhsZ/el+0VmBDc24WSnqYpabtB1m2j7r1VBW4A4eStdEj1B5rIiZz+hUxmFc92XFZME+/LXc32Fmwh94ZCPWj+2nwUW3Jb3mxSxwlPOyfzfFYiZkUNi+eyU8FqyUFLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gjyme+Voc2Y7rGpC+biXtvuZnuRXuhLQ7xH6fCtuErI=;
 b=PRKY4vld62FUsDA7hpUhacPOTlqz2XNnZLu1BZhDpJLeIjsGgj7owZQkD9J5xpvoSZIBZkRJPWwh6q7xpShyRvYEpanJPHUJYsGT0JHCfqNsddUowobgeio65C2uhvUhpjfoysCUtJmXio8hWp2dP0sO5EHp2HMPI/vzyom9LJOhHbVcTKnsbUfYkC3ZFVCCgLpvL4bqlipwFdUQR8l3iLD1KDLn3CH5x0nvYr7j2pt4EZF7hPbmTX3jPaXHIdDgL4LxhvFrR8hyWSevohT2RumAzku12Qd2DcL+L2F+LnyAJDWx5AIsh5fDcTKTfFnOhIS+z4pao0QFAid36sE9HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gjyme+Voc2Y7rGpC+biXtvuZnuRXuhLQ7xH6fCtuErI=;
 b=J8wEcR73Puvb+3leNV9rR/UvykyYgz7AhR3h7VsqrnV8Kmd4vgtHWfGCWWbZDUwujj2TZXBhOpTFgbkibZQcYisyp0Gxk9Dc1SkLgvmUrZWEI5GjpCDt3Jt3zRhwDHGRZyCpdAlqKOUGhzhZX4lGczPvTA4q9rMg/tXsOuP9SRw=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: "Orzel, Michal" <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: RE: [PATCH v2 1/1] xen/arm: fix sparse cpu_possible_map calculation
 on SMP boot
Thread-Topic: [PATCH v2 1/1] xen/arm: fix sparse cpu_possible_map calculation
 on SMP boot
Thread-Index: AQHdB1CiAuAriThuJkCQWNdHuGHoRbZW2yCAgAAKtHA=
Date: Tue, 30 Jun 2026 10:33:21 +0000
Message-ID:
 <OS9P286MB7222C37BD865BB565019BD7E82F72@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260628225115.9337-1-taka@valinux.co.jp>
 <966af02d-ebc1-4395-9476-8722c2b967b4@amd.com>
In-Reply-To: <966af02d-ebc1-4395-9476-8722c2b967b4@amd.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TY4P286MB6192:EE_
x-ms-office365-filtering-correlation-id: e9ac567b-ef88-41db-0266-08ded693023a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|56012099006|4143699003|6133799003|38070700021;
x-microsoft-antispam-message-info:
 7CaCtglPCUP7I+RX0Z7edoQHyIwHIn/RKlqXnZvsY0RTJb9XpjsZlnHrNFRidrrfHitl4d+IsZkStj/zIr14l4re5jqa2Elk4roVmYQB+1IKgroAl1JwW4PNIkog4BJR+nSvP2UMRXYced8ql+/HiA5erOcAaGoH77+73l0i3PshiJaFTG0WnniEDd5tRZprHRDYizN9jRsHpRmULSPQq/fDsWNkLTKEodMJxGYVGQktJTpz+w4oEu256xc9Vssh4bDFcAEwTFa+CQuIyTeiYRamBg8OmFwE8JMj/yiuGYtUGfTiUsVhSJvclSLvjqtkNlHWKWvB+cB33HAIZ9d/0YSosYEPAnP1obwmomeWHa0L4toMsjAuKJHN3VjEXKheS0iPnVMlwgPZYmoKdYzzeJXlIg9FrgbwHQxlWN/MvYKTk77OaIg4NY4SXZrht2AcfBjSbEd7cxfMweVMnMhKJlUbcO9daVtswN31qhoPgfr+Qq4L16HW10ziXgb3IC9mAwZY4pzCkDgYhUTbRmJRWiXDczyU38tuL51kXQDeRtAsYY6UcUWnZ6GXXPcflMOCBiwKt5hpENDHNMSdA/a2eGBzqkqUXLCY2ZHr4CssH8n/rVGU9rZymdDRnYV+xGpC2xJ09JzS8u/TyhG7zJ16zC+vEo00qw875xTwnPW3dwkwIVAJheCzEat65TG3adgnz/iuiA4rmdjKJspR9PWnQtBMEE0M4fpGkWFlCHRPK0I=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(4143699003)(6133799003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MDA2VmJPSWYraEt0WWo1R2ZheDhKM0dNZWpTSFc4YXJjc1VUK2NlRS9VTzBt?=
 =?utf-8?B?bmI2NVRGcHNXWGI0bmFmbVBKaDQ3M01JaEZNL0hzVmhQSmNqTlZPS0E3VHdQ?=
 =?utf-8?B?dXllV0d1MGV5d21GZGN3SDhBYm9MeUhqTmIxaDJ0bmRoQVY0Wkc1YlloZG9M?=
 =?utf-8?B?UERIRUdTejJPOG13dFZVZUVweEM5dVRCVHJadFJaSjBWQ3U0YmwrZFo2WDkv?=
 =?utf-8?B?VHZhSzc0QVVqZWpWMk9KdW9qVDlTKzNZT1lac3FmY0IxOWNESUtjYklpNjB2?=
 =?utf-8?B?N2lPUjBtQTIvWkJrY0hPUEFWdFFoY050KzRtS3VORlRUSHVVeUkrL3Q0cU1E?=
 =?utf-8?B?cUd2dHhETzIzelpMOFllK011WE5Wb2ZJZHAxR2FWTEcrRlpKWTlJSTB3VWJi?=
 =?utf-8?B?M0dEWS9yVFFkOUlaN3BoV21YTXBYaldvMXdpSm9kMzNRYUNVRUZrSHV1endh?=
 =?utf-8?B?WHdBdTlLQm8ycDg0Z0pOQlFraUNFUzhEeVFkRVIwNXBMVEUwSE5WUHNWcVZp?=
 =?utf-8?B?OUVWaENGV0NBNGgxSlRtbktQUHFhS0RHYnRZL2h6QnU0aTg5SThueUFwdVhh?=
 =?utf-8?B?emRoR2VUTXZBbmFnUnVQbVZSamFJSm9aL0pFVGxISmY0aVlKYmdUbnhQTEFL?=
 =?utf-8?B?WGUxdkt2RmYrZ1c1bUVLR2V6K2FKUk1UTHVKRXZIVG9DbHhKQzhxcWIrRjJN?=
 =?utf-8?B?dTZOa2hZM3crcktCb29xbTRzWTNtaFhHcmxPb1h2WVdFaWdCdVJqMnl1THo4?=
 =?utf-8?B?L0xzWlpVcFcyWTVjVG1iNE9zb3lhdm9MMzZLSHhYQ2RkNjRrLzlRZjN4RkEr?=
 =?utf-8?B?V2JreVMvMTRnOGZMemJiVFdNeTE5RXliUW45ZFRlRmVxS3p3OVI5QzFsZ3V0?=
 =?utf-8?B?UVJicGZ6ZHRMMWFzVHVadW8vbWdDUFdybi9mOEo3ZnBJb0R1WmlDeFdhNi92?=
 =?utf-8?B?WHphR2JOZXRuMGhZY3ZqdS9DNWFOUjJaYVdKei9aT0xEaU1XN0VrK2k3Zngw?=
 =?utf-8?B?cW5HSkU4WWgvM1NSY2E2aWdhRGtYNGFTVEw5WVBNMXUySGhjYTZoRnVRbVY3?=
 =?utf-8?B?QmRlZ0k0ZThLQ3Z6WExNNk9FRllXSHZZN3BpYnRDUnlRcUpnSEpTWFoxUlpm?=
 =?utf-8?B?eUx2blhVMVkyYm93Z0VDMDFiY2FJaUFxMjJUYmRSUUhlU0F3LzV1M0hxTDlR?=
 =?utf-8?B?bUNuSlQzNm8wbit2dnFNYnoxVExSTVNZUzhhUWpuWm5oN3RvR0huemdsK3d0?=
 =?utf-8?B?RG56YlovSlJOaFN1MEl5T1B1OHgrbEkwYlhrTVh6ZXhqd2sxWS9KL3FrRUxz?=
 =?utf-8?B?M0Z5ZURneE5NdVlDZkxoaks4ZzRBdndLaVhsVjFUYXE2QWVUWXNleEQ2L0Fr?=
 =?utf-8?B?ckdpcU5SNjFUMjNtR3NWTXI0djlmNzl3bG1KdU9lbmZWbVZtM1FhUjZsa3hn?=
 =?utf-8?B?REt6VjV1Zml4Wk9GRmZnN0x4NCtxeGN0N0hZaTJ3ZVYySkNkaWJtTS9UQ2JJ?=
 =?utf-8?B?T0pkQzJJVElNSlZ6V3Mva0VuU2xWd21oY2lha1RkMCs2eC9vWUVDVXhSck8w?=
 =?utf-8?B?UUtUelFJYUtPVGFBNXhaVTByYnF1WDJPZVlHdnlpcEplM0JiY2xZQ29qRFN5?=
 =?utf-8?B?WU9Uem1zd0RCOWRZTXpXUDduNk5xbXJEZnJqVnZHMC84amFXbC9RR0dwSDd1?=
 =?utf-8?B?N0dYNU9VMjdDQjI1VVZZOFhLQkxNVFpSL1hLQ2pteGp5NnhjWHhJUlptZjVX?=
 =?utf-8?B?VTFNeGNRR0FuSDdPWnBLcmNKRlBBUjN0WUd1ckQ1Yi9LRmVCMWdtQjNOL2l0?=
 =?utf-8?B?NnFxckY1YXlhZVNjZzRjNHZHckord1BtVGIwMEg4VGtUU3dGM29MdjMxWnhO?=
 =?utf-8?B?dUMyM3FHb1owSmJ3Qk5rRnpydXBBWUY3cmZrSERkaWN4QTV2ekJtUFUwdWxX?=
 =?utf-8?B?VHJhcDl6MmVObmZvMWVtLzU0SitJUThhamN2S0ZkL0pERnR0d2JJaE4ySHg2?=
 =?utf-8?B?aWtqS0FjazlvZ1Z0VUlKUk5YOVhpTGFuNEN2U0k4dk80bllDci81V2NkTUo0?=
 =?utf-8?B?aE0wTklEQXJrNUduNklBQnJMTzhNMlF0bTVGbWNpamJzT0JVZXRVcTFkMGZ4?=
 =?utf-8?B?M25CRzNUZmhJK1QrVjV1UnY4NmR1QmkxUWwvOVpuY0NKTHRJVDZpLzNrU1Jl?=
 =?utf-8?B?RWNBYXpvTXRzMityKzM1a1c4c0Rlb1BXbS83UFZ6c0NuRjhyOWs0RlBTcE83?=
 =?utf-8?B?OFkybGdXR3ZibUpwRjU4MlFHZnpNdGhqbjNZRjB3TlNhSjgwOVl3QjA1TzZE?=
 =?utf-8?Q?dBEYgyt/yGK1jDFjtm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ac567b-ef88-41db-0266-08ded693023a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 10:33:21.8853
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /qIpBxYs3MjFjEM4IikTfgmY2icnHwjMmgslnC8FtNsKH4JS5yoZ6/+5X+Acr5l55q93n7Xw7SbYENEDF5+xIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB6192
X-purgate-ID: tlsNG-bad1c0/1782815608-46F3D986-7A312DA4/0/0
X-purgate-type: clean
X-purgate-size: 5330
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.09 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM:mid,valinux.co.jp:dkim,valinux.co.jp:email,valinux.co.jp:from_mime];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 65B006E2EB3

SGVsbG8sDQoNCj4gPiBUaGUgaXNzdWUgaGVyZSBpcyB0aGF0IG5yX2NwdV9pZHMgaXMgY2FsY3Vs
YXRlZCBpbiBhIHdheSB0aGF0DQo+ID4gZG9lc24ndCBwcm9wZXJseSBhY2NvdW50IGZvciB0aGUg
bWF4aW11bSBDUFUgSUQgd2hlbiB0aGUgbWFwIGlzDQo+ID4gc3BhcnNlLCBjYXVzaW5nIGEgbWlz
bWF0Y2guIEZvciBleGFtcGxlLCBpZiBjcHVfcG9zc2libGVfbWFwIGlzDQo+ID4gMHhmZjBmLCBu
cl9jcHVfaWRzIGJlY29tZXMgMTIsIGJ1dCB0aGUgYWN0dWFsIG1heGltdW0gQ1BVIElEDQo+ID4g
aXMgMTUuIFhlbidzIGNvbW1vbiBjb2RlIGlzIGJ1aWx0IG9uIHRoZSBhc3N1bXB0aW9uIHRoYXQN
Cj4gPiAnQ1BVIElEIDwgbnJfY3B1X2lkcycsIHNvIHRoaXMgbWlzbWF0Y2ggY2FuIGJyZWFrIHRo
aW5ncy4NCj4gPg0KPiA+IFRvIGZpeCB0aGlzLCBtb2RpZnkgZHRfc21wX2luaXRfY3B1cygpIHNv
IHRoYXQgaWYgdGhlDQo+ID4gYXJjaF9jcHVfaW5pdCgpIGNhbGwgZmFpbHMsIHdlIGRvbid0IGNv
bnN1bWUgdGhlIENQVSBJRCBzbG90Lg0KPiA+DQo+ID4gQ2hhbmdlcyBpbiB2MjoNCj4gVGhpcyBz
aG91bGQgY29tZSBhZnRlciAtLS0sIG5vdCB0byBiZSBpbmNsdWRlZCBpbiB0aGUgZmluYWwgY29t
bWl0IG1zZy4NCg0KT2theS4NCiANCj4gPiBGaXggYW4gaXNzdWUgd2hlcmUgY3B1X2xvZ2ljYWxf
bWFwKDApIGlzIGNsZWFyZWQgd2hlbiBib290IENQVQ0KPiA+IGluaXRpYWxpemF0aW9uIGZhaWxz
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSGlyb2thenUgVGFrYWhhc2hpIDx0YWthQHZhbGlu
dXguY28uanA+DQo+IFRoaXMgc2hvdWxkIGhhdmUgYSBGaXhlcyB0YWcgKEkgdHJhY2VkIHRvIDQ1
NTdjMjI5Mjg1NCkuDQoNCk9rYXksIEkgd2lsbCBhZGQgYSB0YWcgaW4gdjMuDQogDQo+ID4gLS0t
DQo+ID4gIHhlbi9hcmNoL2FybS9zbXBib290LmMgfCAyOSArKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRp
b25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3NtcGJvb3QuYyBiL3hl
bi9hcmNoL2FybS9zbXBib290LmMNCj4gPiBpbmRleCA3ZjNjZmE4MTJlLi4wYWI5NjE5Mzk4IDEw
MDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9zbXBib290LmMNCj4gPiArKysgYi94ZW4vYXJj
aC9hcm0vc21wYm9vdC5jDQo+ID4gQEAgLTE5MSw2ICsxOTEsMTQgQEAgc3RhdGljIHZvaWQgX19p
bml0IGR0X3NtcF9pbml0X2NwdXModm9pZCkNCj4gPiAgICAgICAgICAgICAgY29udGludWU7DQo+
ID4gICAgICAgICAgfQ0KPiA+DQo+ID4gKyAgICAgICAgaWYgKCBod2lkICE9IG1waWRyICYmIGNw
dWlkeCA+PSBOUl9DUFVTICkNCj4gVGhpcyBzaG91bGQgc3RheSB3aGVyZSBpdCB3YXMgd2l0aCBq
dXN0IGkgPj0gTlJfQ1BVUy4gQnkgbW92aW5nIGl0IGhlcmUsIGFib3ZlIGENCj4gZHVwbGljYXRl
IGZpbHRlciwgeW91IGFyZSBjYXVzaW5nIGEgcmVncmVzc2lvbi4gV2hlbiB0aGUgQ1BVIGxpc3Qg
aXMgZnVsbCBhbmQgaXQNCj4gaGl0cyBhIGR1cGxpY2F0ZSwgaW5zdGVhZCBvZiBpZ25vcmluZyB0
aGUgZHVwbGljYXRlIGFuZCBtb3Zpbmcgb24sIGl0IHN0b3BzDQo+IHJlYWRpbmcgdGhlIGxpc3Qg
ZW50aXJlbHkgKHRoZSBib290IENQVSBjYW4gYmUgcGFzdCB0aGF0KS4gQWxzbywgaXQgbWFrZXMg
dGhlIGRpZmYgc21hbGxlci4NCg0KT2theSwgSSB3aWxsIHRyeSB0byByZXdyaXRlIHRoZSBjb2Rl
Lg0KDQo+ID4gKyAgICAgICAgew0KPiA+ICsgICAgICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5J
TkcNCj4gPiArICAgICAgICAgICAgICAgICAgICJEVCAvY3B1ICV1IG5vZGUgZXhjZWVkcyB0aGUg
bWF4IGNvcmVzICV1LCBjYXBwaW5nDQo+IHRoZW1cbiIsDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICBjcHVpZHgsIE5SX0NQVVMpOw0KPiA+ICsgICAgICAgICAgICBicmVhazsNCj4gPiArICAgICAg
ICB9DQo+ID4gKw0KPiA+ICAgICAgICAgIC8qDQo+ID4gICAgICAgICAgICogRHVwbGljYXRlIE1Q
SURScyBhcmUgYSByZWNpcGUgZm9yIGRpc2FzdGVyLiBTY2FuIGFsbCBpbml0aWFsaXplZA0KPiA+
ICAgICAgICAgICAqIGVudHJpZXMgYW5kIGNoZWNrIGZvciBkdXBsaWNhdGVzLiBJZiBhbnkgZm91
bmQganVzdCBza2lwIHRoZSBub2RlLg0KPiA+IEBAIC0yMjQsMjQgKzIzMiwxOSBAQCBzdGF0aWMg
dm9pZCBfX2luaXQgZHRfc21wX2luaXRfY3B1cyh2b2lkKQ0KPiA+ICAgICAgICAgICAgICBib290
Y3B1X3ZhbGlkID0gdHJ1ZTsNCj4gPiAgICAgICAgICB9DQo+ID4gICAgICAgICAgZWxzZQ0KPiA+
IC0gICAgICAgICAgICBpID0gY3B1aWR4Kys7DQo+ID4gLQ0KPiA+IC0gICAgICAgIGlmICggY3B1
aWR4ID4gTlJfQ1BVUyApDQo+ID4gLSAgICAgICAgew0KPiA+IC0gICAgICAgICAgICBwcmludGso
WEVOTE9HX1dBUk5JTkcNCj4gPiAtICAgICAgICAgICAgICAgICAgICJEVCAvY3B1ICV1IG5vZGUg
Z3JlYXRlciB0aGFuIG1heCBjb3JlcyAldSwgY2FwcGluZyB0aGVtXG4iLA0KPiA+IC0gICAgICAg
ICAgICAgICAgICAgY3B1aWR4LCBOUl9DUFVTKTsNCj4gPiAtICAgICAgICAgICAgY3B1aWR4ID0g
TlJfQ1BVUzsNCj4gPiAtICAgICAgICAgICAgYnJlYWs7DQo+ID4gLSAgICAgICAgfQ0KPiA+ICsg
ICAgICAgICAgICBpID0gY3B1aWR4Ow0KPiA+DQo+ID4gICAgICAgICAgaWYgKCAocmMgPSBhcmNo
X2NwdV9pbml0KGksIGNwdSkpIDwgMCApDQo+ID4gICAgICAgICAgew0KPiA+ICAgICAgICAgICAg
ICBwcmludGsoImNwdSVkIGluaXQgZmFpbGVkIChod2lkICUiUFJJcmVnaXN0ZXIiKTogJWRcbiIs
IGksIGh3aWQsIHJjKTsNCj4gPiAtICAgICAgICAgICAgdG1wX21hcFtpXSA9IE1QSURSX0lOVkFM
SUQ7DQo+ID4gICAgICAgICAgfQ0KPiA+ICAgICAgICAgIGVsc2UNCj4gPiArICAgICAgICB7DQo+
ID4gICAgICAgICAgICAgIHRtcF9tYXBbaV0gPSBod2lkOw0KPiA+ICsNCj4gPiArICAgICAgICAg
ICAgaWYgKCBpICE9IDAgKQ0KPiA+ICsgICAgICAgICAgICAgICAgY3B1aWR4Kys7DQo+ID4gKyAg
ICAgICAgfQ0KPiA+ICAgICAgfQ0KPiA+DQo+ID4gICAgICBpZiAoICFib290Y3B1X3ZhbGlkICkN
Cj4gPiBAQCAtMjUxLDEwICsyNTQsOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgZHRfc21wX2luaXRf
Y3B1cyh2b2lkKQ0KPiA+ICAgICAgICAgIHJldHVybjsNCj4gPiAgICAgIH0NCj4gPg0KPiA+IC0g
ICAgZm9yICggaSA9IDA7IGkgPCBjcHVpZHg7IGkrKyApDQo+ID4gKyAgICBmb3IgKCBpID0gMTsg
aSA8IGNwdWlkeDsgaSsrICkNCj4gU3RhcnRpbmcgYXQgaW5kZXggMSBpcyBjb3JyZWN0LCBzaW5j
ZSBzbXBfcHJlcGFyZV9ib290X2NwdSgpIGFscmVhZHkNCj4gc2V0IGNwdV9wb3NzaWJsZV9tYXAg
Yml0IDAgYW5kIGNwdV9sb2dpY2FsX21hcCgwKS4gVGhhdCByZWFzb24gbGl2ZXMgaW4NCj4gYSBk
aWZmZXJlbnQgZnVuY3Rpb24gdGhvdWdoLCBzbyBwbGVhc2UgYWRkIGEgc2hvcnQgY29tbWVudCBo
ZXJlIHRvIG1ha2UNCj4gY2xlYXIgaW5kZXggMCBpcyBza2lwcGVkIG9uIHB1cnBvc2UuDQoNCk9r
YXksIEkgd2lsbC4NCg0KPiA+ICAgICAgew0KPiA+IC0gICAgICAgIGlmICggdG1wX21hcFtpXSA9
PSBNUElEUl9JTlZBTElEICkNCj4gPiAtICAgICAgICAgICAgY29udGludWU7DQo+ID4gICAgICAg
ICAgY3B1bWFza19zZXRfY3B1KGksICZjcHVfcG9zc2libGVfbWFwKTsNCj4gPiAgICAgICAgICBj
cHVfbG9naWNhbF9tYXAoaSkgPSB0bXBfbWFwW2ldOw0KPiA+ICAgICAgfQ0KPiANCj4gT3RoZXIg
dGhhbiB0aGF0LCB0aGlzIGlzIGEgZ29vZCBmaXgsIHRoYW5rcy4NCg0KVGhhbmsgeW91LA0KSGly
b2thenUgVGFrYWhhc2hpLg0K

