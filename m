Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P4EVAf6gTGo4nQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 08:47:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D78A7181BF
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 08:47:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b="NCvGjH/f";
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1355949.1610619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgza9-0007VM-I4; Tue, 07 Jul 2026 06:47:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355949.1610619; Tue, 07 Jul 2026 06:47:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgza9-0007Tx-FC; Tue, 07 Jul 2026 06:47:01 +0000
Received: by outflank-mailman (input) for mailman id 1355949;
 Tue, 07 Jul 2026 06:47:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wgza7-0007Tq-E5
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 06:47:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgza6-00CQoo-QV
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 08:46:58 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a4ca0da-bab6-0a2a0a5309dd-0a2a4505dd9a-22
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 08:46:58 +0200
Received: from [40.107.74.102]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a4ca0db-3cb2-0a2a45050019-286b4a66df13-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 08:46:53 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB6616.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:417::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Tue, 7 Jul
 2026 06:46:49 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 06:46:48 +0000
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
 b=jVAMAglEubYKddE4+sLaRZJe7q+LH8PssV048s6X2/wHaCrOhzwQbNItnwGvJ4UNDGRCK8qtkP/63u8AsznGgVvRgJk6lJWmfUmuMs0Vh5nyNgWfrl16GGX38p0eCI5Yu1eKTeiOw2UubHINnm5qLzBPRJ/Z8UtNAIKDbVV71xD9aZO83tf5F4YcnYdKEhVqNOKsjYby0BEMBLFmAjV3fohdHhyk/a59N9LOEzeAG1cMigXKfmFjLlngBKlvWHF1BRpxVFMtUPzAlU0aKrP2SO7VXnamxuOs71P6QUfPrVHFagvDHGo8sBT5frxA78xhD71OLFBCPErm7TqZyJ9PUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=feMlZfJtHOqlEdBjOIKXDlaHjBi1avph20RmCeUwH/A=;
 b=iZ+z3C9xCCascQX5dk3b62OlZmhNwtx4PcXHjnPwA3ojepq8xLgoiXJ6TjOJjtnagYhS2tI7QelvN6QZCF90gc1BzGgfgGGmxLajt3iqzLTa17H6VqUzLSZn0KySPL5LkIXjCo58SxmgCTWf9Ikvds2XedX0gUkXYfBWdyLIy8hDnSPhI5+MTHZ9o8YuK9H7p+QajbhpYxz0WebtLJ7cwfrwCa1xOM5R/7hv0cVCg3byz+FWboN+DneqW334Lvs06PrxGvMJNLeLNF3/4Dgo0BJZk6MICbEkrnkL3kIX7tiWKUZU+UEt6Lb7gmGpZHu/2vRzZJYsfUY3EUM1kEiXhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=feMlZfJtHOqlEdBjOIKXDlaHjBi1avph20RmCeUwH/A=;
 b=NCvGjH/fyBgI9slyc2T9Lv173CWNrOKx9M0BTPk4TuCx9CT8FOL9692wuQtGYFWhesL4jCFH88XGSRd4Q/mAFXj960iscn+mcXIkoDtQRK3s01g1lXsWu4u1CkxiN6Zros0UKH9uzjyOo7+OYmplrKUjS93WvCAegPSPOFbejpo=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Dario
 Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>
Subject: RE: [PATCH v4 2/3] xen/sched: Link CPU topology to scheduler
Thread-Topic: [PATCH v4 2/3] xen/sched: Link CPU topology to scheduler
Thread-Index: AQHdCsyKAF00d3K0tkaMQqAbl3ZPqLZbrPQAgAX19oA=
Date: Tue, 7 Jul 2026 06:46:48 +0000
Message-ID:
 <OS9P286MB72221AEE4CF7FD5C54CD218082F02@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260703091544.183548-1-taka@valinux.co.jp>
 <20260703091544.183548-3-taka@valinux.co.jp>
 <30e859e2-ee54-4d02-ac2c-08f8f80547bf@gmail.com>
In-Reply-To: <30e859e2-ee54-4d02-ac2c-08f8f80547bf@gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|OS9P286MB6616:EE_
x-ms-office365-filtering-correlation-id: da7f0901-0c88-4916-1992-08dedbf38517
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|7416014|38070700021|18002099003|22082099003|4143699003|56012099006;
x-microsoft-antispam-message-info:
 P1PoHY+XOzrGxrfwlW2IciUsNvF/Qn2UacA7Rc1NjMWJME9xOKpctaeRp4QKGQDHg8V5Ck1ZuuNiTk953QY76e9scgvfx3hUvCApO3i5K9OZD7DRaGXybTQB6maSQZZ5WUedzRD3IX+UYfNn/io7Q7HY6/c3TwTupl3r8ooanjrVR5cbc4wfcSVes2Z1rM5HjSOnXy/SqP5cj7RcWVoHOmVQbIX90uiFaY6mF4fTq1iQ9ptEuXXBGzC7IJDcx/awE+sTOgP/n0etn6Ji8E/9mX9EYUqUxqTRScu8PN6XU1OlBzzEoQhPwtOKFO+G2VSuBY+zlHZr+uKDnbSfRYMWdiVLqe6NqNbSkOmKsC0JfhsR7WZMw6hfZrOsIUbarbViVIgCToYnK+1JkTr2qyy3qsvlWRYH4XGGt1F/nf99DYSIOFAL/5n4XPtiGaKO/lLfgqnkY8SgUHeuxnd83JXajUhXb9tkkCUX9r3Wnfq1hThtI01rHt0W2LU+siBidCALFAQwrLRTW0hvs4iORavvSRbW7XchdFTa1VI+mVj82GnZVwitBU/CebZnMOUBHLhMCEfmtaDnLYlt++IoCEIbkKSz92jnSESh7mXhr615eNzWs++4WHl6FV9rFpriZkPo/RWurDpjvhdR7uviLu4zWXjLWhDdCQos9Q52e4CsdZfbMfaPkqs0rqK1mU9K1Rimwu6akCpdtBnHYsH+vgU3MXdQtMBu+Tn0xVXQKOP1Qgk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(7416014)(38070700021)(18002099003)(22082099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YzNwWXNmMUowcmVQMTBYUExJTXRsaHA1QWowWHpYRy9FQ01OT05UU05SbXRj?=
 =?utf-8?B?KzlGQXRMMGQ3dWc5NVhtQytMOTlURWE4UVZIeWtDb1lEVGZ2VU9LSEJ3TVN1?=
 =?utf-8?B?aC9IRk01YUdSTXJ5cUpsd2RUNFV2L1BOcitpMkhoTHRxMld1aU5ia1JVdndI?=
 =?utf-8?B?TERsNGRJR0RuSzRkL0JHQ044MEwyaWpPTkVlN2VuczEyTFliUXVsVzZkNVVj?=
 =?utf-8?B?cjJvYi9xRzFmaUpMRGdGbGhOYzkxZnhDVkpDZE8ybGwxMWx1bzZ1MlJ6NXZ1?=
 =?utf-8?B?TStFSWw3QmxWYnBPTXQzYWhrSUYzZ0hoUGg5NUlSTCtsVkYwTTZzNnl6K3ln?=
 =?utf-8?B?Q3BrcVhLT3V0THRtWDkvZ3h1NUdtK20va1crSjFrd1BhUU5ETTV5ZDlVc1Zn?=
 =?utf-8?B?RHV2QVRTMEpESGd2cU1sOHAxcGxvemtqSi9qUEM0YjR2N2M2Sy9SWi9TTUpr?=
 =?utf-8?B?Lzh6MXlaRE5SZW5SK2JBZ21aU240RjFxMmQ4STIrR293QU5wbGpTU0RzVzgr?=
 =?utf-8?B?UnJqRmg0bytFTldRMGU3Y21TR3pUZzVlRzFFdkFxSzZ0M1NxOW5HVUdxbW1U?=
 =?utf-8?B?TzdWUVorN01qSDV3Zm5pMklXdnhBSVlBUmVVRnhBQWhPSUFpK2xuK1lDM0dZ?=
 =?utf-8?B?ekpEOGdxMTJtYkc2MHA3MGxOREo4WDBmRlA4UW0xanh0bGZEVWxHWXhuYTJu?=
 =?utf-8?B?c2E0UTB3bE5tVzh2dDd4WUZuWmxFcUxzUHpaSlVmWVVDcHJ5LzdhRk5kUUVT?=
 =?utf-8?B?OWJxb0paWEJhTkdpZTZtc2VKaDFFOE84Z1ZRVnlBTldlWHlUTDJoZGFYRGVn?=
 =?utf-8?B?WnhYVlJlNG9MRHNhTTFiYlJJbXo3NkNhTCtlOGJsMG5pTzhpS1djZllESFlR?=
 =?utf-8?B?Q0FzcWI2Y0pVZjlBZmVNcml0c3ZQaGdaVWdldzZNQjMrcFU2ZXh3czJkVHV2?=
 =?utf-8?B?ZHJTMHhOZ1BQMzlVSVc4aitQVEl5SWVUelJxTWF6TmNZYXBJMnh1NkJXUGhJ?=
 =?utf-8?B?aFlJZHlJQjZ4ODNmVW1PRE9tNEJnNEhXVEUvSjFvQzRYZEl2ZUVsZGtmOVlC?=
 =?utf-8?B?QWdMZWsxazVERnhBaVR2OFZvMkt3R2sxY0tPa0lUandVTXFwdTRadm4zMEJ0?=
 =?utf-8?B?TWU3YkJkT29VWHlqNmtMVC9hUHUwODlwa0VVYzBGWFZZbDdBNVE2WUw2VUFa?=
 =?utf-8?B?UWRRTEpJdUp0VERGU0hiQnBlblJ2ZVRSTG1QQmFQMm8xaXJmc3UyVHhYMUxW?=
 =?utf-8?B?cnViYWNiRGkvWjFpbXNTbDRzeFZzUFdLVndjRlR6RU5ucW9KYjJNMzIxQzBE?=
 =?utf-8?B?UGRiMEM4TDg1ZE0wQWdWcTJRdEtidy8xMFpGSFNseW8yblJabS9odmx1TTI5?=
 =?utf-8?B?RVk2YkhYYnBSNjR1NTB1VVJjb29UeEJISDFISkFFbzB0Sm1yQzJycnVSNU56?=
 =?utf-8?B?MFZhcWI5SnJ2VWxaTmxhclVEUHJGV1o2S3lpelhKMm01SzZ5SjBXeG5qaksz?=
 =?utf-8?B?dFhwejRFQVpDc253QXNnTFFaZ1p5dVpBc1FmNEllRkIwMFVVbUR4KzQrRkN2?=
 =?utf-8?B?S2RMZTF1RDB0MW5ocXdZV3A5L2xhbDlHcHFqNUNTaUY0N0pIS2ptcGh0L21o?=
 =?utf-8?B?OEVjSnE0MkgwYml3d1JVZXdmZXpoZGNXQ1VEeUtSeEl4SXNjaVg4eHZOVVVi?=
 =?utf-8?B?M0ttMWpnZUtzZUN1NFR0U1ZyRVFRY1d3VW5MaU5wUW5ac3ltU3JlanpuUzM2?=
 =?utf-8?B?UkprQUtTRXErWmJnQ285WWRyWENyWmlTUUw4Z0s2QjJ4QTBId1QzZ1dQM25X?=
 =?utf-8?B?WmpoeWkzOWJQNlA2VU9YRnNSVDgzR0xOUTgrcTkybHJxVjN5a01id2xmbC9Z?=
 =?utf-8?B?NWhwZlJqdTFwS2VyR0tvdVNES0xzVlhjaVpKeDFuT1ZtREdDNGJuWGNKNnVy?=
 =?utf-8?B?Z3RDbDBVNFFmUHZ0cTZZMVowVVNVbURhQ2toaDh5c0E4b28yYWlrUFh2aDRZ?=
 =?utf-8?B?NzdXNThFc2l1dEkrZS9kMjFhOVA5NGtHN21kQWt0SlpXbU1KZWZGRndOTDF0?=
 =?utf-8?B?UXZpOVJ0ZElOUGhFMTVabStlU1Avay95QUpCZkRDZCtwa2Q0TE9Wb25Tb3o0?=
 =?utf-8?B?aHRmZmdWV2c1RVVsaE5BcCswR1lCQm54anM0V0RJWVdvZnBlUTZyUEw4enc4?=
 =?utf-8?B?cngyYkY0Y3hmUy9MNUdINXYrZk02cSt5THUxVDlnOTg2WjFhdUd2T1E0dVYv?=
 =?utf-8?B?Sk5sTGdWcnByVGNrazJ0aTZ3R1hYOGFZditOa2xtaWc1b2xPSzNrYTJZVmJV?=
 =?utf-8?Q?ldDZBZAlEtZgiE0l5J?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: da7f0901-0c88-4916-1992-08dedbf38517
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2026 06:46:48.9147
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vaPn76c/qkggMYaro0UFdTcZ4CnZyxb1Al6hD4BBGdKWVNzi5B1w23yLqVieb9krI6Cs/IxnIo7dGQsA9EeG9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB6616
X-purgate-ID: tlsNG-c201ff/1783406818-54DE02B8-20A3C312/0/0
X-purgate-type: clean
X-purgate-size: 1098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.41 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM:mid];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com,raptorengineering.com,wdc.com,gmail.com,xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D78A7181BF

SGVsbG8sDQoNCi8qDQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWQvY3JlZGl0Mi5j
IGIveGVuL2NvbW1vbi9zY2hlZC9jcmVkaXQyLmMNCj4gPiBpbmRleCA5NTk0NjYzNGQxLi5hZGE0
MzBmMjYyIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9jb21tb24vc2NoZWQvY3JlZGl0Mi5jDQo+ID4g
KysrIGIveGVuL2NvbW1vbi9zY2hlZC9jcmVkaXQyLmMNCj4gPiBAQCAtOSw2ICs5LDcgQEANCj4g
PiAgICAqIEJhc2VkIG9uIGFuIGVhcmxpZXIgdmVyc29uIGJ5IEVtbWFudWVsIEFja2FvdXkuDQo+
ID4gICAgKi8NCj4gPg0KPiA+ICsjaW5jbHVkZSA8eGVuL2NwdS10b3BvbG9neS5oPg0KPiA+ICAg
I2luY2x1ZGUgPHhlbi9lcnJuby5oPg0KPiA+ICAgI2luY2x1ZGUgPHhlbi9pbml0Lmg+DQo+ID4g
ICAjaW5jbHVkZSA8eGVuL2xpYi5oPg0KPiA+IEBAIC0zNyw2ICszOCw4IEBAIHN0YXRpYyB1bnNp
Z25lZCBpbnQgY3B1X25yX3NpYmxpbmdzKHVuc2lnbmVkIGludCBjcHUpDQo+ID4gICB7DQo+ID4g
ICAjaWZkZWYgQ09ORklHX1g4Ng0KPiA+ICAgICAgIHJldHVybiBjcHVfZGF0YVtjcHVdLng4Nl9u
dW1fc2libGluZ3M7DQo+ID4gKyNlbGlmIGRlZmluZWQoQ09ORklHX0NQVV9UT1BPTE9HWSkNCj4g
PiArICAgIHJldHVybiBjcHVfdG9wb2xvZ3kgPyBjcHVfdG9wb2xvZ3lbY3B1XS5udW1fc2libGlu
Z3MgOiAxOw0KPiANCj4gU2hvdWxkbid0IGhlcmUgYmUgQ09ORklHX0dFTkVSSUNfQ1BVX1RPUE9M
T0dZPw0KDQpPb3BzISBJIHdpbGwgZml4IGl0IHNvb24uDQoNCkhpcm9rYXp1IFRha2FoYXNoaS4N
Cg==

