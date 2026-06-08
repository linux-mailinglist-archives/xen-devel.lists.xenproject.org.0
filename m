Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zEK2AD1HJmpUUQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 06:38:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9316529DC
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 06:38:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=krZU5Gvw;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1331386.1593957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWRkU-0005kD-3h; Mon, 08 Jun 2026 04:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331386.1593957; Mon, 08 Jun 2026 04:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWRkU-0005iH-0F; Mon, 08 Jun 2026 04:38:06 +0000
Received: by outflank-mailman (input) for mailman id 1331386;
 Mon, 08 Jun 2026 04:38:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wWRkR-0005i9-Ic
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 04:38:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWRkQ-000jYf-Gy
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 06:38:02 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a2646e6-5cb7-0a2a0a5109dd-0a2a4505973a-22
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 06:38:02 +0200
Received: from [52.101.229.104]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a264727-aaa8-0a2a45050019-3465e56818a3-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 06:38:01 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY7P286MB7668.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 04:37:57 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 04:37:57 +0000
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
 b=eFZTHNQVR4bM6EFOVDseAaMbT/lVDztP80wakxJanoprye3Kqu6GEuNtA/2LJRXwc+XZKHdjLGJrQVDX2b4nUyHDBusleEufqUEYehVwpdWyiZapd2ed0zIFh6j26qgLsx4LzzUBFk97s+IUuKXiWgCxqP3OYzEcq36ZShNu60K9ZAo9fOI52SgznuDtYfUlptLCvIE5RDpy5kZE9eturY4oOG5NNKfML33chEPzhVYluFHS9w2wZU9DyT7C/wKfpee6JPybUPq6FgcwB6qzEffwW5BQHrJiSamifZjK60z7Lbp/92VOOwKEMsB5/FSHrB8vjrHfMZkIx5g/IeU5Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/cuMG8nOimg2HUJXyvzjdNtaNyN9qEWk//NCJZQmeY=;
 b=fHvxPbXP/oxtIp8xDox7+BdfFr10QRRnlUh7gKVqMItGF9qEgyLxEWkVAJLTPhpQpXFz4f0BFRHkYZWVdMKTq9FXufMvgivTobApTrhreqh3Fofc2/YoI2O+xCwDFjzyK94mp0u/BMZfGAvjcsGFUVG0o0al4mv/WwIYeeBFdizb7DV6OTm4akAGeOMpBFIE3UnYK3kp4cggwULvUeGRqp0EZOiDAXDVrJ9zwb+H8eUcg6Cp/uzTBvh5TQopIns+tuM0Opm7y5+w36RFLMq2+SIwe/j9303Np+QRbgIYLVwYBw0QbMwl6YtN5VDArzRtRHtCuW6qQn2dS7fZBp+pOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/cuMG8nOimg2HUJXyvzjdNtaNyN9qEWk//NCJZQmeY=;
 b=krZU5GvwPvxfgocno8MDlBUDPoiXuOWQDjcr7LO1JnZRBvP6Rpj/P6UQZbjkxstuKincXyEvjkX2H6tDHopEKwbG4euqXZHCeuKbBmtgY4mnnjI6Lnc6YGkL5nKEufX9rAR6OG0/1XCl5BS/5ed9F+FIFtapbBxcCGTfK+d3W1w=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 07/24] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Topic: [PATCH v2 07/24] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Index: AQHc8U+PsZhvkHY9vEqKRtt8NHnfGrYrBomAgAF93dCAAEeY4IAABQUAgAdLQwA=
Date: Mon, 8 Jun 2026 04:37:57 +0000
Message-ID:
 <OS9P286MB7222F6BFFEACE09A7D2C296E821C2@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260531224755.9481-1-taka@valinux.co.jp>
 <20260531224755.9481-8-taka@valinux.co.jp>
 <7040c58f-2d4c-48f2-854f-c874efdcefbd@suse.com>
 <OS9P286MB72221F0A5D5195C7A4CAFD4082132@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
 <OS9P286MB722241B5C3E48A93F7E0BBA782132@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
 <4d52e642-c235-477b-92f8-f8d3af6db23e@suse.com>
In-Reply-To: <4d52e642-c235-477b-92f8-f8d3af6db23e@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TY7P286MB7668:EE_
x-ms-office365-filtering-correlation-id: 75cfb301-07de-4e93-a19d-08dec517b6b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|56012099006|4143699003|6133799003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 9/l4eo0NfgXkRLDQiNsseymR9qcmonrSndePjL/+FAaVtm8rUOpUCtMJkP+lZCwPqkuNUbqT/e5FvRYLwLkMIxpwRCjwGT28hORVAOyAvQVDNcDBqslnBNO2xHozu3XnGqsqR/l7aH7Hg8CiVJnoWayuJfLfljf5cUTqAM+nM5ebpL4RgsOsStoJYF9U1oatwmtOQKAMxC0p0QNPTK0tcbRxmpkjJkD4L4guOIPIX2AAv889JvrTzSmp+5jzr2K/Ymti0lQOrtACciFyBhTKMNamk7OLiHD+yK/baH3QhYKQzCfzaz6bt+xF5KNQfOAgUtm33n5X2NGd6jsA2k7HVBMhvlYY9S1PKBLCJ1kJvtwPPgdU0IhQbY4GDl5IEZQzyw/kJoAHQecwYP9ssyiJBe+S1P+AFzSGFEI+4T0QnwWt4sg6OSt03iqIY5xTwpiq0tquMSZnxPxNqBz/zqtEULIDNw31rBhFcVvnc7MdtCetNd0bbiX+1rCpRWsLb0i6pYhOr6//PUASeecBO8xu7uHo1Um4Ry5o/rHMTTmp74hOy1IkNKbcyBclta/Td9xC048zQmM0Dwu1tzK2zmOBpudtsTNu1wx9bdx1IJfd1LXwIP/KdsDWXpFR2UTnTTrxSvsD/oUyxJecyCK/AEeJvLwPuUjObcPAEsrLgXZPmJmQWSt0PBM681ArXRiFnG3TFy7snszIOJ4UUGbxwLxcOkAcK/rhR8t8s/ULNH6uguR5jYsHjuryzomkNEbk7s6K
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(56012099006)(4143699003)(6133799003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WGF3dE1RY0U4ZzVsY3NJN2tFYmpsMWZraW83SHZsU2d1UytIWHo3bnUyREV6?=
 =?utf-8?B?MC9oUDdmUFlWSDhycTZyL0tvYUgrZnczRmdWTDV1TmlYRUZOZnVUeHFrYW4z?=
 =?utf-8?B?RnZYd081eTdKU0dkZnVGSmErNWdPcS9sL3RGd29ISGl2bXVINWJPMXBZbTYx?=
 =?utf-8?B?NDFUN1NYOVd6aVRzQkFVVmc5dGZnbU1TVFdxcm9WLzZyaXRCR1Jmb2FhaDY4?=
 =?utf-8?B?Y2NHOWFrZkZFdmNrUjRma3FYblNRTzdndmtzVmNOZ0M5SkFMN1IzRTI5KzdX?=
 =?utf-8?B?aEFveXdsWmtINlE5QzEyZW9SU3pqVmpONFU0eEJ2cnNSM2l0SFFkK1FFbHRj?=
 =?utf-8?B?aXFCUlRXYzBPMDFnNzBtNk5jaUdiQ3UzM2dsTHl0ajdoSDN5UXF2WmhQeGQ3?=
 =?utf-8?B?QkYyYmVuWVoya0FOMUlhRkV5TFRyTmlpQ0hHUVplMjRKeXE3dFRNUU9FOFAr?=
 =?utf-8?B?ajF4bUlocmQrUWtVUUdJeEpSVzl0MGtPOFdneDRERFRUblNCMW9oeTJvb3Vv?=
 =?utf-8?B?Yk9zYVpPMStwcnRiamI1Y2ZSOU10NFBtL2lNSnlHemVHUTNORll5WTZUR1hE?=
 =?utf-8?B?d0lkajZFS3BLZndZcDl6MTdGT2NicW02VHhRcjRIZ05HN2V4SnE0STFHRS9u?=
 =?utf-8?B?eEVoV1Z5T2lLbU9DNlBpaEp2aWVQVkRBVGRPalYwRG9SVldUV0c1bkNNUERt?=
 =?utf-8?B?YWdhKzFxMnY1SDdlblVUUFhNeVFHdVE5azh0L05aTjlRc2lVeE90ZHhIdVAr?=
 =?utf-8?B?T1dqMGpTQjhxMXI3WVhjN1RwVEpVNTRmK0dnZjc1QW83ZG9HVVpwT09wOE9k?=
 =?utf-8?B?VXNySGFSYjZ0ZnRtUDdiZXdUSk9xV3p1N0lXYjNKNmtScldjZndxdUxzd2dT?=
 =?utf-8?B?bGo2Y28rSlljMnArdjU1eDBKTHhTY0hmWXZuTDZFWXhPdGZkODZ6SC8xU01R?=
 =?utf-8?B?K3N4K01kSTNEQzVKYk9ENy9hNDlKbEVDUTMyYUpva0hZSGx0VWt0dG81OFVT?=
 =?utf-8?B?YmlGeXVncTlsRkUxSWZXQnJXeDIvbDJZUEdFdG1ma0pmRE1NK2F6dEhVcVRz?=
 =?utf-8?B?MHhlVHo5R1JGMVYyZnRNQ0VyY0toaStkWS9Fd2hxTGdzVVNuZGZ3NEMvemth?=
 =?utf-8?B?WSszOWpVeHJlSS9YVlhSUkdOSU4wVGRKZUZ3Z3VWVXRNYnRzZ2ZEbWdvQ2VL?=
 =?utf-8?B?cDFaSEZEWlRISmZXL0d0SWZ1VmNDa0NXTmxxZUVFN3l2QUFGSzVXRVZuSVNN?=
 =?utf-8?B?VUUxQ3J0am5DVTVHcnNZUjJUNGtYT2Qzc1JXVVA2cFBLRG1oZXQyZEpmVXp0?=
 =?utf-8?B?Z3BBWEFGeGU1N1RwVVJwRldKTi9aa2d4eXh3YndWRFM1dkVuaExsWlMydHVa?=
 =?utf-8?B?bjdvcG84TlpOb1dQR0JSVHBGamxSNkgxZEVxMjVKZU45SzhvYkhNQ1hTa2ZP?=
 =?utf-8?B?cDlmeWJuSmxZaWVUdE51TE5pQy9obG9yZ2xIOHFIU2tqMVlYT0IvdnFaZUZE?=
 =?utf-8?B?WGgwUzVmV2gyNi85cHBrR3JXb2JCanFFY3FpVDBFVnZmU1pUTzU1am5kU1cw?=
 =?utf-8?B?Nkx3YmNENkVDODRPN1ZYREJDRmVHL3BxcU9td2VCTjFlbit0cStSR2NycVgz?=
 =?utf-8?B?a09wMjRNQ2h5NXkvajd3c3lGTVBCUHFrOTNoaVBlSFpWSEhnaDlabEZvdXVh?=
 =?utf-8?B?QllHTHR1N1lCWUxreFJwVE44SFFNbGk1THZnREVRd2xhQkltUU5BV25yOWpl?=
 =?utf-8?B?ZVRBRjZsSnA4V1BET3pHRzFlWklnam1QbzUzMjJZaGFlK1hNTVYrS3hneUlJ?=
 =?utf-8?B?ci9rR1E3eGdFQnUrWERIY1hxcExkb0Jwb3dPSkZqS0F0YjFEMGpIS2FjdXVv?=
 =?utf-8?B?YmgwVEJ6enZOMVlyMldabU50YWpDU3Q4aEo1ZHhhc0lScTVMNFNYVkpHTi9I?=
 =?utf-8?B?SHJxa3NENnRkcFBtRW5GL3VCUWdzSm41bEdTeW1zMkZUM1kwbWZrQlZnMTdi?=
 =?utf-8?B?ZVlYaysyWHluM0tQcUs4Vk4rV0drcFUreVMwKytsb2R5S2U4ZXdMd1dydTdD?=
 =?utf-8?B?a0ZXQ3d0dk9FbWpRdFZEdUdDZW1CemlMRjI4L0dhRVFXZnVFV1FGVjEyVE9R?=
 =?utf-8?B?QzVBdXBpcnJ6ZVF5TkhOSXBER3N2dDFXdWg3RlcvWmNKS1F5N3l0dWNPYVRH?=
 =?utf-8?B?MGJkb0tSYk94a2wrcmZ3SWVreFhYZXhLZkhUTGxSYktHamh0MXRieEprV1lS?=
 =?utf-8?B?dW90ZnFiTEEvZkNTcGhkWjBmQm5iZk5VWmRjdmkrbkE3RU9TMzUxSWFqaUEr?=
 =?utf-8?Q?hTmXfbCyeTkK8y6ER6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 75cfb301-07de-4e93-a19d-08dec517b6b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 04:37:57.3139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3h5mMISSJAKSKjUQFrYvtARegB/jTpAaQDoSfS3CbTKhiuGchcZfUAOhZsiB6HYAg2zh3hDjPA5QpS/gsPxW6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB7668
X-purgate-ID: tlsNG-c201ff/1780893482-E0A66443-74F5FF3F/0/0
X-purgate-type: clean
X-purgate-size: 2632
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.09 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:from_mime,valinux.co.jp:dkim,OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F9316529DC

SGVsbG8sDQoNCj4gPj4+PiArI2lmZGVmIENPTkZJR19EVF9DUFVfVE9QT0xPR1kNCj4gPj4+PiAr
ZXh0ZXJuIHN0cnVjdCBjcHVfdG9wb2xvZ3kgY3B1X3RvcG9sb2d5W05SX0NQVVNdOw0KPiA+Pj4N
Cj4gPj4+IElmIGF0IGFsbCBwb3NzaWJsZSwgbm8gbmV3IE5SX0NQVVMgZGltZW5zaW9uZWQgYXJy
YXlzIHBsZWFzZS4NCj4gPj4NCj4gPj4gVGhpcyBpcyBhbHNvIHBhcnQgb2YgdGhlIGNvZGUgaW1w
b3J0ZWQgZnJvbSBMaW51eCBrZXJuZWwgNy4wLCB3aGljaCBpcyB1c2VkIHRvDQo+ID4+IHN0b3Jl
DQo+ID4+IHVuaXF1ZSB0b3BvbG9neSBkYXRhIHBlciBDUFUuDQo+ID4+DQo+ID4+IEkga2VwdCBp
dCBhcyBhbiBhcnJheSB0byBtYXRjaCB0aGUgb3JpZ2luYWwgTGludXggc291cmNlLCBidXQgSSB1
bmRlcnN0YW5kIHRoZQ0KPiA+PiBjb25jZXJuDQo+ID4+IGFib3V0IGFkZGluZyBuZXcgTlJfQ1BV
UyBkaW1lbnNpb25lZCBhcnJheXMgaW4gWGVuLiBJIGNhbiByZWZhY3RvciBpdCB0bw0KPiB1c2UN
Cj4gPj4gWGVuJ3MNCj4gPj4gcGVyLUNQVSBpbmZyYXN0cnVjdHVyZSBpbnN0ZWFkLg0KPiA+DQo+
ID4gSnVzdCBhIHF1aWNrIGZvbGxvdy11cCB0byBteSBwcmV2aW91cyBlbWFpbDoNCj4gPg0KPiA+
IFdoaWxlIEkgd2FzIGxvb2tpbmcgaW50byBtb3ZpbmcgdGhlIHRvcG9sb2d5IGRhdGEgdG8gYSBw
ZXItQ1BVIHZhcmlhYmxlLA0KPiA+IEkgcmVtZW1iZXJlZCB0aGUgb25nb2luZyBlZmZvcnQgYnkg
dGhlIHRlYW0gd29ya2luZyBvbiBDUFUgaG90cGx1Zy4NCj4gPg0KPiA+IFRoaXMgaW50cm9kdWNl
cyBhIGRpbGVtbWE6IGR1cmluZyB0aGUgZWFybHkgYm9vdCBwaGFzZSB3aGVuIHdlIHBhcnNlDQo+
ID4gdGhlIERldmljZSBUcmVlIHRvcG9sb2d5LCB0aGUgcGVyLUNQVSBhcmVhcyBmb3IgQ1BVcyB0
aGF0IGFyZSBub3QgeWV0IGFjdGl2ZQ0KPiA+IChvciB5ZXQgdG8gYmUgaG90cGx1Z2dlZCkgaGF2
ZSBub3QgYmVlbiBhbGxvY2F0ZWQgeWV0LiBUaGVyZWZvcmUsIHdlIHdvdWxkbid0DQo+ID4gaGF2
ZSBhIHBsYWNlIHRvIHJlY29yZCB0aGUgdG9wb2xvZ3kgaW5mb3JtYXRpb24gZm9yIHRob3NlIGlu
YWN0aXZlIENQVXMNCj4gPiBhdCBib290IHRpbWUuDQo+ID4NCj4gPiBTaG91bGQgd2UgaGF2ZSB0
aGUgaG90cGx1ZyB0ZWFtIHBhcnNlIHRoZSBEZXZpY2UgVHJlZSB0b3BvbG9neSBpbmZvcm1hdGlv
bg0KPiA+IG9uLWRlbWFuZCB3aGVuIGEgQ1BVIGlzIGhvdC1wbHVnZ2VkPw0KPiA+DQo+ID4gQ3Vy
cmVudGx5LCB0aGUgZnVuY3Rpb25zIHVzZWQgdG8gcmVhZCB0aGUgdG9wb2xvZ3kgZnJvbSB0aGUg
RGV2aWNlIFRyZWUgYXJlDQo+ID4gbWFya2VkIHdpdGggJ19faW5pdCcuIFJlbW92aW5nICdfX2lu
aXQnIHRvIGtlZXAgdGhlc2UgZnVuY3Rpb25zIHJlc2lkZW50IGluDQo+ID4gbWVtb3J5IGZlZWxz
IGxpa2UgYSB3YXN0ZSBvZiBtZW1vcnkuDQo+IA0KPiBJbmRlZWQuDQo+IA0KPiA+IFdoYXQgZG8g
eW91IHRoaW5rIHdvdWxkIGJlIHRoZSBiZXN0IGFwcHJvYWNoIGhlcmU/DQo+IA0KPiBDYW4geW91
IGtub3cgZWFybHkgZW5vdWdoIGhvdyBtYW55IENQVXMgdGhlcmUgYXJlIGdvaW5nIHRvIGJlPyBJ
ZiBzbywNCj4gYWxsb2NhdGUgdGhlIGFycmF5IGp1c3QgYXQgdGhlIHNpemUgbmVlZGVkLiBOZXh0
IGJlc3Qgb3B0aW9uIG1heSBiZSB0bw0KPiBoYXZlIGEgTlJfQ1BVUy1kaW1lbnNpb25lZCBhcnJh
eSBpbiAuaW5pdC5kYXRhLCBmb3IgdGhlIHVzZWQgcGFydCB0aGVuDQo+IHRvIGJlIG1vdmVkIHRv
IGEgZHluYW1pY2FsbHkgYWxsb2NhdGVkLCBnZW5lcmFsbHkgbXVjaCBzbWFsbGVyIG9uZS4NCg0K
T2theSwgSSBjYW4gdXNlIG51bV9wb3NzaWJsZV9jcHVzKCkgZm9yIHRoZSBzaXplIG9mIHRoZSBh
cnJheS4NCg0KVGhhbmsgeW91LA0KSGlyb2thenUgVGFrYWhhc2hpLg0K

