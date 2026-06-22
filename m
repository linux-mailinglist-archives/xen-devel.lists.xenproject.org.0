Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LbBGKjT3OGrTkgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 10:49:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A79856ADE7C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 10:49:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=f8WGpWQq;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1343531.1602819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbaLN-0007im-Fz; Mon, 22 Jun 2026 08:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343531.1602819; Mon, 22 Jun 2026 08:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbaLN-0007gN-D3; Mon, 22 Jun 2026 08:49:25 +0000
Received: by outflank-mailman (input) for mailman id 1343531;
 Mon, 22 Jun 2026 08:49:24 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wbaLL-0007gF-FD
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 08:49:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbaLK-00CvKc-6i
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 10:49:22 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a38f70d-bab6-0a2a0a5309dd-0a2a45059114-6
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 10:49:21 +0200
Received: from [52.101.228.110]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a38f70f-ef3d-0a2a45050019-3465e46e5893-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 10:49:21 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYTP286MB3593.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:39f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 08:49:15 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.011; Mon, 22 Jun 2026
 08:49:15 +0000
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
 b=vCkKFkFISr3ue+0dlsUYtChiTw3OjhfdmQW9WVW+aewZSQyUiAgTTKNSyFVYn1jxk9LsK4qyPhkJBCSxRIxd2U3yqlVJguZeQoljmV2trj1LK0gGCD/hWNRWvw1lJZmRy49uqXuWdtR2x9GgYHFMYek+OI5VUGzgVauf2Z3VA2vT5UZJ+/WhrybvKEMVZ9eDYptHSqF5LX9oNill0Huztmt1g6fS0qYUiNfvHhqxkQSGyiGDsxInEpuScpmhta+fF/HhHUIWswQUlgZmL1TlvXeurtBoqKk8EjjwEcuphoRovojRp2iD1fiKeL/QWKzOi3KuKUlB6QVE+deUSVs1Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXE1xC2RoOlm/GNSVVn1OMIsj1mPTKUyiFQyYUwVAyY=;
 b=wZR4xpy1nCJer3F1ibjYt/tWS3Eg02I414FvwOsvXrBSvYLPLsoLi1YTmq0mU2i579WCZBp9bXrzj2Bx4+ukA4WU/Mly0724pa4K+PQXcfBM02CbKvxJ5r8B0rjqBgoMJVPNmjD5SADBFnP7X2ewUznrIdAttJrBNAxEu+pDIZN9MAI09AHVfFr95PmRd0sk2kBJQHUHfJ7dCAMILM+fPQ74BEkPYLF8yXKFxOh03BeQMZu6iRd5ljJNml/W3us14OLlFTzuvWjKv7vVJN18Z+mXjJTho72rK66XvAihxFZzKxMAOqoX1Y0XcTXwgg3Zv0gQFUKypu8H3hmruBZaAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXE1xC2RoOlm/GNSVVn1OMIsj1mPTKUyiFQyYUwVAyY=;
 b=f8WGpWQqdv/Dj29HFZQXJQldagIEe3k5XC5YslqTWc+wS53Pk+15CgV4wZLDgSNN2oGEGdl+ldoNW6n9PiuvUv5mPsg/wQhmMHaGU6jnBnR9wf75SCuR8zU2cENcmCE8JW4YL5Sfu2ayd4DRADsIEOj6WW8OWgG4vtiH4DwPu3A=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 07/22] xen/device-tree: Read NUMA node distance from
 Device Tree 'distance-map'
Thread-Topic: [PATCH v3 07/22] xen/device-tree: Read NUMA node distance from
 Device Tree 'distance-map'
Thread-Index: AQHc/8BKTM3OweAnP0qpxuJk/PcKwrZFkCwAgAIwFqCAAn5KgIAACM8Q
Date: Mon, 22 Jun 2026 08:49:15 +0000
Message-ID:
 <OS9P286MB7222754F42C2E61187C4CE7182EF2@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260619075011.377116-1-taka@valinux.co.jp>
 <20260619075011.377116-8-taka@valinux.co.jp>
 <926d2a7a-e278-4c3a-b168-aad003da6652@suse.com>
 <OS9P286MB7222340F4909B9873B89D45082E12@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
 <42f16737-1aad-4e01-9966-671453cf1b52@suse.com>
In-Reply-To: <42f16737-1aad-4e01-9966-671453cf1b52@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TYTP286MB3593:EE_
x-ms-office365-filtering-correlation-id: 29be81ff-84d9-4758-5be7-08ded03b239e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|22082099003|18002099003|38070700021|56012099006|4143699003;
x-microsoft-antispam-message-info:
 JMtcV8o/TH58T7VgeWz+g1plPGRzcubTcPjbcST0i4u3VUrBO9nx77dJJRiRIr2bP7ZpyXklJ3bdPdR4adO0FB1nelZ5K4uM3Lsurn5fprS+9l4YyyVAbV0cF0KR93F1z8jrwTc6XT9pnYZIzsY+Ruhicvopjd/W73dASErId3C5srPemm8kEPfkq4MetMDFgAaESSkirdKJOlsUX/p3fpqhe56xUNPn4CK9q8VC4DZkP6kNWlq80QGXzNXCxKmvUy5cI4W/bGS58R4BZPmliobMotzX9kFMbvHr6DkAszgNN64ZuPX7rTNQrwxIhwdrenOTw7EkRU3XxInxCzSLNrz7R9Ra2b/fn8qRPhvNOKOOfZzJgHkkl889onqgm37XhlWN39FXKmwmxcqOU7FWbL4WWcD1P480Pl59hOLWirKikh9HbBb67JCerIelRhMH3yuAqxmhGMJ40XRYsFgOBsjTbFXID/O9V/z+G3KCPKzqM+vhzMlVzWZDU6p5e1YQuZOM4oAc5GrtRPHzwNJ12jywz6x8kEfDT058k5Nu7RIRHB93tlyDPhFXkWyZv73s8XTIejho9lpGveBC1Xqibs3O1u3OgNrVywp8gT+vfvGH2wrWLusjP0YCPGD4v2hKizLawkgBGnpuz0tINoBa7lVRnFcTJpoEx4xjFRveyb8OMytCTmZsxRRHKi2oSHvUEkVbbK6Nvk3q+yYtcF6+dg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(22082099003)(18002099003)(38070700021)(56012099006)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ekhJR0U3dUp6Nm9RbWlpc3QzTEFaR0IxWVlUMEVldHNnYXZ6SERSR1JKbHI1?=
 =?utf-8?B?U1JIMTJ1elpNVmdIWmtCZmVVT0x1R0hOT2lwZDNnYnBET01vTlNuZU9YSTJr?=
 =?utf-8?B?OGNxVnhoNUdOSXR4YlRyMjRXM0NRTVhZNE9RQXVHZDZ5UUhFOW9NLzRabGNC?=
 =?utf-8?B?TEptQkFUNjc1U3FDOE1nbE9qc1JJb09Ccm5QWmViL0dUbDN1SkQ2SUxHMzds?=
 =?utf-8?B?NVVWMnExL3VURnpJYkdxZ1R4ZXpsUk1waTJJcDRHYUpmSVFzTHVXNUVxbExO?=
 =?utf-8?B?R2xTb01LazVLWU1BODExK0hWQjYzSHR0TmZQbFlLR3dvWUxvczJLTk16UEY2?=
 =?utf-8?B?Y2FIQ01RZEZKeU1XWmhpYzhxRHJnVmsrN0tiMlgwbG1OMUxqcjQ3OFJYRngy?=
 =?utf-8?B?czFiMFBPRys2dHRFQU41Y1lHM2o1VEFFaG9tMkdjZCt0K1VMN2hsRm1zdmlo?=
 =?utf-8?B?bWRJZ3lUamlDQ1c4MmtyemVveUthZ21ZUStndm1HUjF6eUFBNzZzYWVZWCth?=
 =?utf-8?B?V3V0Tkx3MVR6V2FlOVN3QldsdXJkN3ZVTFlIRGhHbVdkb01PT0RpMDNxOTEz?=
 =?utf-8?B?eXl2bU1YY3FTMFc3NkRjUEw5SEZBTTgzN3RtcTZiaDJpTGMrYW0zQ0pXZUxn?=
 =?utf-8?B?dnQ3c21TbjNTNXd5OW1rWmUyekpCWTErdE9kWnJxbFlpNW0yWll3WnRxUjE1?=
 =?utf-8?B?bXpWUkF3MGMva2lQa2VVTDREUmhFNUdHRVpldFEzSHNDVWN3b0dUL1QwNzhZ?=
 =?utf-8?B?V1hqbzFWTlUxYXNqS0JzU3lnV3hBQTc5WWY5azloZEdwUUlEVC9ldUNzemo3?=
 =?utf-8?B?dzhYNmFidUN4TjR4bmdZRktCNlI5SDdLWUJCWlIxZm9rcXZ6bkhMNTVEU3ls?=
 =?utf-8?B?NHZJQngxV00wK1Y3RkNOditia2lGcngxaGtjVnNiVUMya2pSYVNqclhtSUpm?=
 =?utf-8?B?Tlk4azRDZDJ4TTg2ZGRIWURGTmFWNUhkNld2MWV2UU1EdEs3MWV0T1ZZc3E4?=
 =?utf-8?B?a3JtRmdJSEFES3p3djdzdE5sVDJ4M2dGN1hQaWZuMVR4K2gvMnY1TzhPQ0Jn?=
 =?utf-8?B?dzhPYmxINEEwdXQwQjF5KytadU8vZnNFWGdSNElJYkFMZjZmdDg2YnlMdmsx?=
 =?utf-8?B?Z1NQVks5Qm03aU1RaThmZEYxNU1kaFBteGd4K05pZlFNTXJUUlRqbUkwL09C?=
 =?utf-8?B?a1FBYVhMWnlCWlhmWHJOZWFNcE95SjhDT2s2UGhBZDFoSVpsV2IxMEpXcGw1?=
 =?utf-8?B?RnRKeUFVMXJLWlNJUVJLOEROenREWG50cEhEeHJlenNDS2RXQUpHQW5Ua0dM?=
 =?utf-8?B?YW9pSXpmcVNRcW4ydThheWtKbzdoT0ZCYnVFLzQrRGN3SFpwcXhsRCtRejEz?=
 =?utf-8?B?ZEFPQk8zM0Q3S1NhR3hBTDZvSW1TOC8xNDRkSGo3RkVWaUVtSDJMMkduY2ZD?=
 =?utf-8?B?blJUSUNXemlCd1AzODFGcERWODE1WmdvdityQmZZQStBRVFwTHFiNDlBWkVS?=
 =?utf-8?B?cDNlNVd1RVZBWFBqLzB6R0YvZjRDd1FGcmtzMUs1M2wyK2lMelZkRjlNVWhF?=
 =?utf-8?B?SEY4dEtCejlUbUZXSDlvTW4rREJSTXNQTzdyMGFFOFMwQTlpVjR1ZE9XOXBo?=
 =?utf-8?B?b0FsaERhM2tSMngxNUpKRDZzaG1wbnFsMWlwNzlYZk8wL21OUW9RRlN1cXBl?=
 =?utf-8?B?M1l5R2diSEx2QXkxck40ZnhjM0lvUzVmcFdZNzByeEhmNkhaYW50aHJITzN2?=
 =?utf-8?B?Y01hVSt0SXlBL1VsMWJuSTZCK1BQa285MnMrOGFwYVlmYmxOOTBKR2g5c2NE?=
 =?utf-8?B?Ymw3NTV5M21YOUd4SVhuRE91MVJLTEJSUHpDWWhqSmxybEd3U1Z3UmhLT0Nq?=
 =?utf-8?B?TjhiNzRUM0F4RlJCVVZpMiszMDVHNEJmREJna1NaclI3TEYrZnVFNms5WEVl?=
 =?utf-8?B?QmliWkZIeWxxN1g4Y1ZTdG5aTktycXZuN25jV1Zjdy9KN2FQb3Uyc3g2ZHRn?=
 =?utf-8?B?bFZCTVRXRDRBa1IxS3QrY2tzelE5bFl3Wnh3L3pjWmVrdlFST3Q1eWRqb2tF?=
 =?utf-8?B?VkdpcU41aGFTbTNrWnVNWmVuZDZ6djl2ZkhuNTl4SGw3b2ppNTRBRm5PR1dt?=
 =?utf-8?B?TUozT1VhcDd1TG4zSGJJemlheHVVMDhDSzNvQWd2RllJam5LQi92RWk2YVJH?=
 =?utf-8?B?SmltNE03S1NzZitwUXdSMG40VHJvblc4bTBQZE5jakpmWnNsN2RKTmVjblAz?=
 =?utf-8?B?VGYvZER6d3RYbjN5ZGZEQ1pqWWh3MVhZRkQ1dU5Vc3ZUNERzZWxmMnNJbDV6?=
 =?utf-8?Q?uQDNsWlsdFDKNhOdUK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 29be81ff-84d9-4758-5be7-08ded03b239e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2026 08:49:15.2247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9SFOyTdKu/XW3A1aRXlFpD9f0rPFT6UjQUOKRp8azk/fGkPoiU6rYgA53JrALZBs+bJu4oo7YRFJIaWHss/Amw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTP286MB3593
X-purgate-ID: tlsNG-c201ff/1782118161-9D1C9127-10774314/0/0
X-purgate-type: clean
X-purgate-size: 1804
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: A79856ADE7C

SGVsbG8sDQoNCj4gPj4+ICsgICAgZW50cnlfY291bnQgPSBsZW4gLyBzaXplb2YoX19iZTMyKTsN
Cj4gPj4NCj4gPj4gTml0OiBCZXR0ZXIgc2l6ZW9mKDxleHByZXNzaW9uPikuDQo+ID4NCj4gPiBJ
cyB0aGUgZm9sbG93aW5nIGxpbmUgYmV0dGVyPw0KPiA+IGVudHJ5X2NvdW50ID0gbGVuIC8gc2l6
ZW9mKCptYXRyaXgpOw0KPiANCj4gWWVzLg0KDQpPa2F5Lg0KDQo+ID4+PiArICAgIGNvbnN0IHVu
c2lnbmVkIGludCBucl9ub2RlcyA9IGxhc3Rfbm9kZShub2RlX29ubGluZV9tYXApICsgMVU7DQo+
ID4+PiArDQo+ID4+PiArICAgIGlmICggZnJvbSA+PSBucl9ub2RlcyB8fCB0byA+PSBucl9ub2Rl
cyApDQo+ID4+PiArICAgICAgICByZXR1cm4gZnJvbSA9PSB0byA/IExPQ0FMX0RJU1RBTkNFIDog
UkVNT1RFX0RJU1RBTkNFOw0KPiA+Pg0KPiA+PiBXaGF0IGlmIGVpdGhlciBub2RlIGlzIE5VTUFf
Tk9fTk9ERT8NCj4gPg0KPiA+IFRoaXMgYmVoYXZpb3IgY29tZXMgZnJvbSB0aGUgTGludXgga2Vy
bmVsLiBJdCBzZWVtcyBpdCBleGlzdHMgYXMgYSBkZWZlbnNpdmUNCj4gPiBmYWxsYmFjayB0byBr
ZWVwIHRoZSBzeXN0ZW0gcnVubmluZyBldmVuIHdpdGggaW52YWxpZCBvciB1bmFzc2lnbmVkIG5v
ZGVzLg0KPiA+DQo+ID4gRG8geW91IHRoaW5rIGl0IGlzIGJldHRlciB0byBtYWtlIGl0IHJldHVy
biAweEZGIGluc3RlYWQgd2hlbmV2ZXIgYW55DQo+ID4gb3V0LW9mLWJvdW5kcyBub2RlIG9yIE5V
TUFfTk9fTk9ERSBpcyBwYXNzZWQ/DQo+IA0KPiBXaGV0aGVyIGl0J3MgMHhmZiBvciBSRU1PVEVf
RElTVEFOQ0UgSSdtIG5vdCBxdWl0ZSBzdXJlLiBCdXQgaXQgY2VydGFpbmx5DQo+IHNob3VsZG4n
dCBiZSBMT0NBTF9ESVNUQU5DRS4NCg0KWWVzLCB0aGF0IG1ha2VzIHNlbnNlLg0KDQo+ID4+PiAr
ICAgIGZvciAoIGkgPSAwVTsgaSA8IG5yX25vZGVzOyBpKysgKQ0KPiA+Pj4gKyAgICAgICAgZm9y
ICggaiA9IDBVOyBqIDwgbnJfbm9kZXM7IGorKyApDQo+ID4+DQo+ID4+IFdoeSB0aGUgVSBzdWZm
aXhlcz8NCj4gPg0KPiA+IEkgYWRkZWQgdGhlIFUgc3VmZml4ZXMgYmVjYXVzZSB2YXJpYWJsZXMg
aSBhbmQgaiBhcmUgdW5zaWduZWQgdHlwZXMuDQo+ID4gSWYgYSBwbGFpbiAwIGlzIHByZWZlcnJl
ZCBoZXJlLCBJIHdpbGwgcmVtb3ZlIHRoZW0uDQo+IA0KPiBUaGV5LCBldmVuIGlmIG9ubHkgc2xp
Z2h0bHksIGhhbXBlciByZWFkYWJpbGl0eS4gV2UgdGVuZCB0byBhZGQgdGhlbSBvbmx5DQo+IHdo
ZW4gdGhlcmUgYWN0dWFsbHkgaXMgYSBuZWVkLg0KDQpPa2F5Lg0KDQpIaXJva2F6dSBUYWthaGFz
aGkuDQo=

