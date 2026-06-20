Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tRAuNqzTNmpLFQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 20 Jun 2026 19:53:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA2C6A96D7
	for <lists+xen-devel@lfdr.de>; Sat, 20 Jun 2026 19:53:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=c+S+V7zN;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1343097.1602757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wazs3-0004QN-DE; Sat, 20 Jun 2026 17:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343097.1602757; Sat, 20 Jun 2026 17:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wazs3-0004Na-AJ; Sat, 20 Jun 2026 17:52:43 +0000
Received: by outflank-mailman (input) for mailman id 1343097;
 Sat, 20 Jun 2026 17:52:42 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wazs1-0004NU-7F
 for xen-devel@lists.xenproject.org; Sat, 20 Jun 2026 17:52:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wazs0-0095ah-DG
 for xen-devel@lists.xenproject.org; Sat, 20 Jun 2026 19:52:40 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a36d337-5cb7-0a2a0a5109dd-0a2a4505c14e-10
 for <xen-devel@lists.xenproject.org>; Sat, 20 Jun 2026 19:52:39 +0200
Received: from [52.101.228.110]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a36d364-ef3d-0a2a45050019-3465e46ecc77-3
 for <xen-devel@lists.xenproject.org>; Sat, 20 Jun 2026 19:52:38 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY4P286MB6718.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:33d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Sat, 20 Jun
 2026 17:52:34 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.011; Sat, 20 Jun 2026
 17:52:34 +0000
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
 b=boZfn4ZzzlpctAXUihK8Jmdl6H5iHUG4sEPvyh538waQ4fILPxT5IadoaNa47DVw+/T1Vo79LkhXdnnAQOk/jeXuK1wtf/5PIRDX/c0CooBSZbvjmK6u4FAgIj3CH0VWaAsyGisCu3D7gX2XTIh00jMeYkiGhNcYEtZapqf3G8FuEid36P+gJ76K6p7gg9HezKtdOtztH7hZDCwofVUgg63ww/baH5kMptwhWuv0a8MKU58APpGvyHpF5rkMiq+ZbpKYQyBrkOIi3uO/VjsqKben2YlbaLR4OuGzDWrQwWNvdhrN7ZexbvAHjwnrMyrMZLOrK1GVhlj8ywWkLQemeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9rNCRJjLYIvtFhKmifqrGKvfDo6GGujgJo78R3/Eiw=;
 b=M9DJMB4I1d50Es3ngyxj44WFnJiQe1frKCqBPCYh26i156RBvV7Py4+VJJxv2vsHpdXCTNYLEYvInnQ6+CA71nbt/oAz+yDw8oVejzGzKr2tCRzV+n3V9fxJfAooru7FAeydDde2WxnCxSgZCbxRXRX6wO/M4F9gcD29ZzCL31tgjjZUY7vuXAsEkaassbOIpxhkXLjG/E4VWuCjNMC00anpIs3qoQU4OET7EMcxJ0JXW0OqMkNRj4G7lvjhXXXTRgZsLXtzSdtjKp/rXxEdIPlZaQvllfg7o+xrBCAh205xcVYOtvmOmUx8bAJOYcMG0SHsEumhDUhpTvcR7j21qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9rNCRJjLYIvtFhKmifqrGKvfDo6GGujgJo78R3/Eiw=;
 b=c+S+V7zNLSBZ1/2mje+Wg89+2b0duUGPyzsnJzCOLkaXkRBLIbdLz5SO/Lg1HJ+1ttn+7pMZVRIfORqMwTZeo+iKDN8O9qAKw1FGlyVRe0x5XI+7yOsYbbeaoyodQ3C8Ib4TU6zwHfrAD5yiu/mDZogJKWr5lIC/Lh81h3pCMJg=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 02/22] xen/common: Default function to get the distance
 between nodes
Thread-Topic: [PATCH v3 02/22] xen/common: Default function to get the
 distance between nodes
Thread-Index: AQHc/8BFrLztQEh49k68JcxFGb2JAbZFinQAgAEHD2A=
Date: Sat, 20 Jun 2026 17:52:33 +0000
Message-ID:
 <OS9P286MB7222E20745070B2C562BCE7A82E12@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260619075011.377116-1-taka@valinux.co.jp>
 <20260619075011.377116-3-taka@valinux.co.jp>
 <3aefcd7c-d911-42b7-b731-5fc657b26622@suse.com>
In-Reply-To: <3aefcd7c-d911-42b7-b731-5fc657b26622@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TY4P286MB6718:EE_
x-ms-office365-filtering-correlation-id: 85955d8b-6552-41ba-42ef-08decef4b527
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|38070700021|18002099003|22082099003|4143699003|3023799007|56012099006;
x-microsoft-antispam-message-info:
 bRHBus5VsH7NgP18hSo5qoHiD4akcCW+bbFie6tlo9/nGdW1nLg5R3Efl5K5c6QXP3sEJmFZXlJbzBCcMTMunbCBLX4u9vJz0Ms/5KhfIBlNzowNfvXDwbIN3VeztL9v1174FDVSVJEZKVN0Iyt0Ccb4bMzjukZrE72M8SCi0b++7qF0LpVuzLjXXWR5jYHhIoWkO8jJiDiYEgiXvmEmOvOZls3+AJTC24S8Z0OkMGgFKL/ignw8Li3i+AWjJbom+DJRNY6BB3hDDy0cbq854RAsxPMYLQ8R4fMZmtTw/bpQvy/JIhf4Jrs1RKom2Y91mKA9tnyvEdRFujRgGzObN3jLB9rKkZc2Zjw4wF5HnhYaIrZQu9FICH2pCTWrWKV1CNdV+PeQ1hXvcI1urgT64j/MIy5QFzZUHvrky5WQrZ/cw5zrnoe3Uj/t77ZSAuBtuEC5c5Bhvd8LgnUjTqdcRwlwEENnNExJ5mCYzouqkogyivVfQRcocwWIdNFlvpJuI0eU6x73c+6LABBnZuE+xjXkJ0tmC92diOOPvoKBo8cuwFuWKK1BVGcasSxd0DYyFYatlh3DiCuiWvZu5Q48gatilJATEMCecA2GQAIAvkpRI/heVKkhJGAtRKIYCOWZYorgxV2z56i3m0xhIhfHshKQ5GhRqiKu7BwmQTppCCcO80ygwRM3rlc1WMdotKnssKiX344DcbnyoENi1HZgmVs12DNbobKbDHV2WgR9/DA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(38070700021)(18002099003)(22082099003)(4143699003)(3023799007)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WVE1ZXNURDNPczc3a0NGUW83MVpYd2VHOGZSVEhBa3JYUGVOa1FIblRlcklO?=
 =?utf-8?B?d2VIdmY2UmNHc1hGMVFXOWNqWXlLOUsvUkpZa2NJWGRobmwyVUd0RDhyN1Iz?=
 =?utf-8?B?YmhhTFVUZllDV05nYVlwdDNPazE5a0F0ZmxPNTNLdXI1S3dhZkl2NWpOci8x?=
 =?utf-8?B?eEJmZFFQT1NyOTVkV1ZOMHNMT05tcTFHQW5jYzcvRVk5WEhoR3kwRlRiL0J3?=
 =?utf-8?B?U0lKM1hTQzZ2SWxFVmdJRzlvS1lhaWhybnVtbjVUVC9EUExZMVRJeFlCd2xv?=
 =?utf-8?B?NFBObW1pKy9tRTUzUFNKeDFUdTVBM1lqbllRUnFPd0o2N1A3SHpHeEFDVllX?=
 =?utf-8?B?QkwrY0VYSk51YTlYUllmcEk4aVhFVk5FZ01GSk55THFjUWYwKzJKM012Nzlt?=
 =?utf-8?B?RkRIZk9KVzhsZGM4REJwK2prbzNhbStjMmQzQW9rZjdLMktDdWtPaFdBRW5C?=
 =?utf-8?B?TTFKd21jY1lnb1NxUGtnSXBGUmRzTnpvY3p1OU9EckhXNjVGM04wZ2wvbWIw?=
 =?utf-8?B?cERKalNMSmo1RExZdDFzU3lGMWRwVE9lSkxjRVhqZmRNZ01JRlZXTnQrbGZ6?=
 =?utf-8?B?Z0V4RnQ3QVNRQTBZMHFxNk5STHhmYVpOdEMxRkhEekdFUi9NMTUyWTBKZU52?=
 =?utf-8?B?cDZUSlB6YXBuTTlzQmpqZ1c5L096QVlXdS9RVmc2U0VWQ3VMUTBUSUNma0JU?=
 =?utf-8?B?YXJmNzR6NHNGQzlpajcxZ2pzc3pDb3N5Ui9OTG96R0cvYUF1LzhOa1NPTkdx?=
 =?utf-8?B?QThXRmdMYTZlSUdUQTZmQmt1UGNmcGhGZnJzbW5sSFNxeEx0ZU9zblBERUtJ?=
 =?utf-8?B?T3VseHIxNmNaKzE4OVdrM0YwaDhRK1BXUTNEdElyMWx2MXVzWDZtZHV4dUNn?=
 =?utf-8?B?MUJyelUwOHd4VXdSM1owTG11NUVhNHZRMjhSd0VKMk82cGFCZkZpZlFIVnVr?=
 =?utf-8?B?U3FUbjV5SXI5dnJvUTJSN1BPeXNya2I0MHZEYjFSbWNKdy8rWXE3bm5PQjNI?=
 =?utf-8?B?MFZEQU5nSGpsY1hvaUpUQytiQTg4UnRqNU5SaUNaMHd4TE5kNUE2WTNYdVdT?=
 =?utf-8?B?Q295Y3FtM1RBeTVvdHFqNXZiQXF2eWk0UERNQk81Zm9BWEtPQzRLbnFFcmYr?=
 =?utf-8?B?a1l2YUpHUjlxa0RpaU1JRGZPbmpMRnI4ekxmTFgvd243ajdyTk1LdkdaaXkv?=
 =?utf-8?B?c3pPNmlUOWg0R2dSaUZtT3M3Y05WWW8yQitZS1pidzFTWmErT3BUWFZFRGJB?=
 =?utf-8?B?WHlWU3UzTG1sTVgrY0lxaVhNOXE5ekVKcUJrZjR4dThGL1hpQzdVUS9LNk5a?=
 =?utf-8?B?SWFsR2NvNlVMRy9FYStCTi9TQkdQTGlER2ZwNDg4Q3V2b29DWFRibnNoMTgr?=
 =?utf-8?B?UXZDYzd5bXZvczVXQXpPMXU2bEc2MkNNUytDbFJsb0Z0NTI4NVRSMlBnS2Jz?=
 =?utf-8?B?MGVNQUxSNXZ5dzkzUUhuNk5xMFIyU0dWdWc1SjkzUVBhRE5EOS9YQmFidi9L?=
 =?utf-8?B?ZmtsWUU5OWt6WFN0M0dSbnNjWEFiWVZRUWtzYURaMHN2QzVuaDdrRUFBc09G?=
 =?utf-8?B?SGVaUDZCMFY3WXdTbFRWTVQ3alBKSUJRbHV0WmpFbkdEck43QXk1M1ZnQVRy?=
 =?utf-8?B?aHhBRGpkTzVKTmRtdnIvYTI5YUFIaUtBcTVDOWNuT29CdFIxalVqQkxKalFo?=
 =?utf-8?B?a1N1MG8vOWs3cENqYW9vbFlDa1JaWTAwR3VFWUFxMjN3QzBtUlMvK2t4RGNk?=
 =?utf-8?B?RWlQbForSFRXWkpzUGxZZGZwM3dUKzJDcVgwVmhsT3d3WFYyTWZlZTQ2ZTdE?=
 =?utf-8?B?K0xKam9TUUZOelZEa0krRUdDRDJzQ0NqVnV3NzRPY2tuUlZtQjNxMWo3MTFn?=
 =?utf-8?B?STM1bEZUVFVtSDluTDRua2Ixa3djSm4vNi9vdTk3ZzBRWngzNHlhaUtIYVlW?=
 =?utf-8?B?TkE3NkltUTZLVlRRTkhNZENtRURtU0NDb0ErNUVlaHJFQ3ZNakFsNkN6eU9n?=
 =?utf-8?B?NkorUjZIZnErclRkT2NHODVud0I5R09tUXoyalgzUWNYMjdtVjJkWExpV3U0?=
 =?utf-8?B?dkFsYnpkRVhiRVpaQUxFNDFpMHExdVczQVhHbE1nVHVEVFdadjJwZXl4VnNt?=
 =?utf-8?B?cXJRd1NxQ1E0NEtUOVRSc0kvSkNYYWszd3dPejZncVZtWVQ5VGpNdlJSakx5?=
 =?utf-8?B?L3cveVV5UjQ1aHhPQkpVQ215bzIza0JjSG9NRW9hd2tkSkdsUWlnOHErSzZM?=
 =?utf-8?B?VTdldXVwajh0QlJzYWpjRWRqU0JmUHlMTkxFTWZ2YVNYZVAveWZzT2xPZmtS?=
 =?utf-8?Q?KE61Hg3MqXjZXhXsTx?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 85955d8b-6552-41ba-42ef-08decef4b527
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2026 17:52:33.9227
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sPYEZUtplxEV2rXNRQ8duNDFP4/AL3Jj6+sXkdJdRzWcuhButyTRkwXWHFrQFvUJ6//jHeAnZxdudxcNRqQMqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB6718
X-purgate-ID: tlsNG-c201ff/1781977959-9FFD2127-A3CB8825/0/0
X-purgate-type: clean
X-purgate-size: 2456
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM:mid];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2FA2C6A96D7

SGVsbG8sDQoNClRoYW5rcyBmb3IgdGhlIGNvbW1lbnRzLg0KDQo+ID4gLS0tIC9kZXYvbnVsbA0K
PiA+ICsrKyBiL3hlbi9jb21tb24vbnVtYS1kaXN0YW5jZS1tYXAuYw0KPiA+IEBAIC0wLDAgKzEs
MTkgQEANCj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIg
Ki8NCj4gPiArDQo+ID4gKyNpbmNsdWRlIDx4ZW4vZXJybm8uaD4NCj4gPiArI2luY2x1ZGUgPHhl
bi9pbml0Lmg+DQo+ID4gKyNpbmNsdWRlIDx4ZW4vbm9kZW1hc2suaD4NCj4gDQo+IFdoeSB3b3Vs
ZCBhbnkgb2YgdGhlc2UgYmUgbmVlZGVkIGhlcmU/DQoNCk9rLCBJIHdpbGwgcmVtb3ZlIHRoZW0u
DQogDQo+ID4gKyNpbmNsdWRlIDx4ZW4vbnVtYS5oPg0KPiA+ICsNCj4gPiArI2RlZmluZSBMT0NB
TF9ESVNUQU5DRSAgICAgIDEwDQo+ID4gKyNkZWZpbmUgUkVNT1RFX0RJU1RBTkNFICAgICAyMA0K
PiA+ICsNCj4gPiArLyoNCj4gPiArICogR2V0IHRoZSBkaXN0YW5jZSBiZXR3ZWVuIG5vZGUgJ2Zy
b20nIGFuZCBub2RlICd0bycuDQo+ID4gKyAqLw0KPiANCj4gSW4gdGhlIGRlc2NyaXB0aW9uIHlv
dSBzYXkgdGhpcyBpcyBhIGZhbGxiYWNrLCBidXQgdGhhdCBkb2Vzbid0IGJlY29tZQ0KPiBjbGVh
ciBmcm9tIHRoaXMgY29tbWVudCBhdCBhbGwuDQo+IA0KPiA+ICt1aW50OF90IG51bWFfbm9kZV9k
aXN0YW5jZSh1bnNpZ25lZCBpbnQgZnJvbSwgdW5zaWduZWQgaW50IHRvKQ0KPiANCj4gSWYgYm90
aCBwYXJhbWV0ZXJzIGFyZSBub2RlIElEcywgdGhlbiB3aHkgYXJlbid0IHRoZXkgb2YgdHlwZSBu
b2RlaWRfdD8NCg0KT2theSwgSSB3aWxsIHVzZSBub2RlaWRfdC4NCg0KT3JpZ2luYWxseSwgdGhp
cyBmdW5jdGlvbiB3YXMgaW4gdGhlIERldmljZSBUcmVlIGNvZGUgd2hlcmUgbm9kZWlkX3QgY291
bGQgbm90IA0KYmUgdXNlZCBkdWUgdG8gYSBoZWFkZXIgZGVwZW5kZW5jeSBpc3N1ZSAodGhlIEFS
TSBOVU1BIGhlYWRlciBkZWZpbmVkIG5vZGVpZF90IA0Kb25seSBhZnRlciBpbmNsdWRpbmcgdGhl
IERUIE5VTUEgaGVhZGVyLCBtYWtpbmcgaXQgdW5hdmFpbGFibGUgZm9yIGV4dGVybiANCmRlY2xh
cmF0aW9ucyB0aGVyZSkuIA0KDQpOb3cgdGhhdCB0aGUgZnVuY3Rpb24gaGFzIGJlZW4gc2VwYXJh
dGVkIGludG8gY29tbW9uIGNvZGUsIHRoaXMgcmVzdHJpY3Rpb24gbm8gDQpsb25nZXIgYXBwbGll
cy4NCiANCj4gQW5kIHRoZW4gd2h5IGlzIHRoZSByZXR1cm4gdmFsdWUgYSBmaXhlZCB3aWR0aCB0
eXBlPyBTZWUgLi9DT0RJTkdfU1RZTEUuDQoNCk9rYXksIEkgd2lsbCBjaGFuZ2UgdGhlIHJldHVy
biB0eXBlIHRvIHVuc2lnbmVkIGludC4NClRoZSBub2RlIGRpc3RhbmNlIHZhbHVlcyByYW5nZSBm
cm9tIDBVIHRvIDB4RkZVLCBzbyBJIGluaXRpYWxseSB1c2VkIGEgZml4ZWQNCndpZHRoIHR5cGUg
YXMgdGhlIHg4NiBpbXBsZW1lbnRhdGlvbiBkb2VzLg0KDQo+ID4gK3sNCj4gPiArICAgIGlmICgg
ZnJvbSAhPSB0byApDQo+ID4gKyAgICAgICAgcmV0dXJuIFJFTU9URV9ESVNUQU5DRTsNCj4gPiAr
ICAgIHJldHVybiBMT0NBTF9ESVNUQU5DRTsNCj4gPiArfQ0KPiANCj4gTml0IChzdHlsZSk6IElm
IHlvdSBkb24ndCB3YW50IHRvIHVzZSB0aGUgY29uZGl0aW9uYWwgb3BlcmF0b3IgKHNvIHRoZQ0K
PiBib2R5IHdvdWxkIGJlIGEgc2luZ2xlIGxpbmUpLCBwbGVhc2UgaGF2ZSBhIGJsYW5rIGxpbmUg
YWhlYWQgb2YgdGhlDQo+IGZ1bmN0aW9uJ3MgbWFpbiByZXR1cm4gc3RhdGVtZW50Lg0KDQpPa2F5
Lg0KDQpIaXJva2F6dSBUYWthaGFzaGkuDQo=

