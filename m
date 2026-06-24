Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vVONEdhTPGr9mggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 00:02:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7690F6C1AA6
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 00:01:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=LSaY7oqs;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1345221.1604152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcVfD-0003l2-9I; Wed, 24 Jun 2026 22:01:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345221.1604152; Wed, 24 Jun 2026 22:01:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcVfD-0003iM-6C; Wed, 24 Jun 2026 22:01:43 +0000
Received: by outflank-mailman (input) for mailman id 1345221;
 Wed, 24 Jun 2026 22:01:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wcVfB-0003iG-7W
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 22:01:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcVfA-003YnV-H1
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 00:01:40 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a3c53ab-5cb7-0a2a0a5109dd-0a2a450ab810-42
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 00:01:35 +0200
Received: from [40.107.74.82]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a3c53bb-e40e-0a2a450a0019-286b4a523dee-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 00:01:33 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYYP286MB4267.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:10f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 22:01:25 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0159.014; Wed, 24 Jun 2026
 22:01:24 +0000
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
 b=Ex8A8XGzaVDQtlbOmw+nieNJHxSS1cMnkP8YNzGlrwyKAOUe0nruR0ELKjsV2sCcDoXpfy9YMVA2tQrMgQh8DjEHgwOnKAS4xuTLjOar8hXktATA1ZCl6bjxzpwSvkXrnNSo119r6Tzq2FZQirjwVZlGCbi4IFvzOTMr7H6nbA1XJoO+NvzLwUjQXkszBa3UEKUDvK8gxObztSQCXQLejJI41DifdTgGQPl0AEsq31Qgv81u7upWZPg9BU8D1waCdyCBRCcXyWRHdYxJ7MXFZOtAFBvsbPP1p4J7lkNInsi/SECYSXafRBLj8rl1e7+TXU1mq0wOZ2tmeUxrqBrTiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXnIxs6edQgX6QwzZolx8BccmPQVP//yHqn+NvDR11M=;
 b=rDJowvzPGzITDUtz7yOl2/iHZezpEUCd1sKu+Rs0STUlsH5VC9oAaHwT4c1Z/atTAjd54UsOQzytt2h6iOLIqLBcRe5nztZqaniyURi+gyDrx9Mu3QaLJFTBbDvuxWAlfE2hAiCURkUUMQPpqXnK+DqypuIoD1hsgi9Pf7LVypyJXdJnI8PdoWSEpB8exOp874/SimdZ+Ft2DLbFuxFmL9msBrMGFXoTTwzQTYKJDao4XVUdtu/sLOTKbLTKOeXGUdS5f46HuZ2No8+AKc1JqrhUP5vNOcg3nRykBNEFDNZqojexVjCTlsnFFmYSv0j1W8hWfGuqS5J4I8Nb6tQsrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXnIxs6edQgX6QwzZolx8BccmPQVP//yHqn+NvDR11M=;
 b=LSaY7oqs40T8xNQu6PwF39unjQZ9mlMGsyICXt4i/EdYuiTW00Jmcdzs6csb1YtpER+/KnGsIw0mmoKcMupaIKKflcitvmw3MAGp9gOrPaFsFPSQKS7WyQ4Iva71TOLuuH87rScEIx0lMSCDONKSaMbx2l7ubTGSGHPP3IdTN8Y=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: "Mykyta_Poturai@epam.com" <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 1/3] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Topic: [PATCH v2 1/3] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Index: AQHc/iieS3lBNqoSEkmC0mA+RhjVELZKgS4AgALq9XCAACbVgIAArc7w
Date: Wed, 24 Jun 2026 22:01:24 +0000
Message-ID:
 <OS9P286MB72227B462A5DAEC97133EE3F82ED2@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260617071206.265599-1-taka@valinux.co.jp>
 <20260617071206.265599-2-taka@valinux.co.jp>
 <0c37c031-cc21-44d2-9ef6-4baf6f24d74b@suse.com>
 <OS9P286MB7222059ECD370CD6137B698982ED2@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
 <ed9cf5a8-c3d2-49ae-979a-56d2c474b738@suse.com>
In-Reply-To: <ed9cf5a8-c3d2-49ae-979a-56d2c474b738@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TYYP286MB4267:EE_
x-ms-office365-filtering-correlation-id: 76dff067-105f-413b-02e2-08ded23c224c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|38070700021|18002099003|22082099003|4143699003|56012099006|5023799004|6133799003;
x-microsoft-antispam-message-info:
 URa1zv14wXy4KbHIkNIlw3jll2NDWSbM2RRqr7lpXDn1A3HH705keAeMkBorIPq6Sf/WVZW97Apu4Ic4IUA6xLQ7l30qAW43q/aFJnRWB91gOwWO/mbXEmuQAn27uiAmCPOoEjbfs5sn6ttohfB2qmfH5jxMUHgDuW9To7IpI1Bdej7bYRd+/aqzYltPXlPUee94mxpxNAU3gLHTqYd8SQoj01sH7zx5ux5W7I4zRv6CacuDGpJ4tKAdMPvR7BrSQPTG6bcNnDlyIv+N7dy7vdDzZi2gqX4XGleul0bzN+j7x2Py4IYZyRUxBaihw3miMyoubmb9RPmPfef+MGyDBvCAetNbMcXWew97iq05iwaMuTLf/89RBYqJZWNVa/DyA2ctruc7oEmUoG3hkqySKie/oEVa+hNAAVvgQuKuEkH7RXsMhcEfa+VlAaHxQ4+1AmOT+tNsz9bXV6H3Nkehp4rr4GfciyUrjXrpJVQWoLiFRS+deYGNjuz3LS/GvyirpAfvOW/uYlXXicgO1s/JTAdqrVMbhu1A3Q9XeIQwWqaGgXyqbwB1xi4/zkC1JcwCKXB4xTuKMhH3n3tatct2xrjtLBgfkSxfb5ZxDiM9iDbttpBJXI6pVtaDWooXz9tGqYDW5EGiNppOLthVM43+2PZdtCGywuXXZErpGTbjuFUe0NTVf6BWg340MwtpQr5XpwsWz3a68l/mu2T7sXI0bl+Rd+3of0diFpz9JZ9IfnE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(38070700021)(18002099003)(22082099003)(4143699003)(56012099006)(5023799004)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VEcwK1o5dzhOK0xzT2h1RjlPOU9ZMnlOaE01WmtuRXNYTTd2NG1YYzU3VWs0?=
 =?utf-8?B?OFJZcURRcXAzcGFHcjVWTkNvak51MDZqTSs1bFJlK3N0dHd6czNQNCtYSUJV?=
 =?utf-8?B?OGVGWDdyckx0RWxwV3RpN0lwVFB2aGZ4UUhpd2VYMDlhQUZjZkFJeUFheXZh?=
 =?utf-8?B?YTlSalJJZEVuNjZMZ202MGZwUUsrY0RNNUlBQXpqYlVTdU4rQTFnT0pWZDAv?=
 =?utf-8?B?RDMydWlkQWpSd2VWdDRkeFJQQ3FubGRHcjl4NzllVk10N1lDc1FPeHdIdDhr?=
 =?utf-8?B?WE5WMllmazc4ZFVJcVVLOUVEMkxGdVhnNHhySHBKK25VelFIb3RQK25GMWVi?=
 =?utf-8?B?RlE5QURBcFZ5R0FnUVZ0dE81Wm9HV3VXbG84TWJVM0cyUnNoODlmeThVdER5?=
 =?utf-8?B?Z2I3cTJuekM1RUUvd2Jrc2kydm1xWGM5VHA2ZWJEK1ZiRnBrRDdGZWxhMFRo?=
 =?utf-8?B?MnEzTTVCK1QrZHd6NXB4WENHSGZwWDhBS3c0cFZRTU9oWVRvd2F1U3NRVUow?=
 =?utf-8?B?ZkRVeTg5enhhWk02Tmx2M3ZpUk8yL3NuVnN5aE5Jdm5RNWZyQnI2bkFlSktl?=
 =?utf-8?B?T1Q0MTMwbFZoMHB5ZWI2Z3VtbjlTYmMxYlFxVTU3ZGk2Z044WkRyMFBrVXJl?=
 =?utf-8?B?SWFjVjhvZkFKR1dQY2F3UjJ3dy9Ha2luSGpBakhsa2ZSS1ZkSExCeEd0dUJI?=
 =?utf-8?B?VUxka1RkU083NWtmUFdrcDN5NnVWVWFNbFQva0VCUWFxTDB1SUREang0RXND?=
 =?utf-8?B?Z0JjcFNHYzJDYzc1U1V2MGhLOUxGeW9aMkd0TXpUTUp3dks2YkFxVmpOUk54?=
 =?utf-8?B?Vk5wUGRHc0NFbVJRWEw1V3dzSWxRcjArMXV4dGwrTllzenRRQUdGNXphN1J0?=
 =?utf-8?B?aENtN1dHeDB2ZnArS2FEUURaM0Q3MnNZeWJCTWlubW5kNkpXZGNZTHpaem9x?=
 =?utf-8?B?cVJxMEsydU1hMi9kSlNsZHY1dyttQzFkcWg2aEFRanBrdUhRdnRYaE85S296?=
 =?utf-8?B?SmNFa2RiNmkyTXpSZ0RsdDl4amxZd0d0SHNteHM0OWZHZlpNQWZnRm0ra0pD?=
 =?utf-8?B?Vnp0eEJsTjRrdXAxRzFLTUphMUo3SUZNRHlCY0tkWGttMnQrT2Q2c1RWWE96?=
 =?utf-8?B?b2N4R080K0JHTmpoVGlWVit1azU2M2pRZFhSOVZjQlhlTlM3RC92eEtpdGRs?=
 =?utf-8?B?bVFETzYvTE83dmU3UlZnSk5oMitPQW1OWHFZSW43M0xyWHZWbklyZUxxY05J?=
 =?utf-8?B?QTg4UUdsaDlvU1YxaG9ZbmRSZ2FJYmFhdHZUbHc5SnZnTGFIRHJjbm9LVSsy?=
 =?utf-8?B?SUo4T1RuUjAzSWlPTVRGT1dKMjJOTGlLT2JTbHVvOW94bTlPTldNZWdKem95?=
 =?utf-8?B?cXVQTTA2cHB2RU1vS05tK08rN3R6WS90RXlRV1h6aWFpTGtvSjhodDZiMVlD?=
 =?utf-8?B?aWdFRklKNEtjb3pPM0RNb2l5aXJJYStmd0Y3RHh1RGRtT2hWaS8zYlJYUnBs?=
 =?utf-8?B?Y1JLQjA1S2dzZTBlalJIS2o5R0xUYm9ON1JNcVh1b2QyNndhTzlrZDJZeTdC?=
 =?utf-8?B?bzBmTjVMOVB0N3d6ZTl6NGZ1QzlzcU1yWHJYUHF5Y1o2WDZ6OWZ5dUdLS1gw?=
 =?utf-8?B?Y0t4cTFJNkZIc043azhJUUIzdEd4a2ZMZ2IwWUdvaWJoc05pWXRLczNDTE1k?=
 =?utf-8?B?WTlLM3pRYUl6WVVZTWZCdTR0dGx1OFZXaFhMemIwa1lBWnFiejEyc0FRRnQ5?=
 =?utf-8?B?UmNpSEtJTVFFRVNuLzBhNHZSZStZUlJVZko4Nmx0NFF4MndCQUtIOHI0ekt5?=
 =?utf-8?B?cWJTS1ZXUVZxOHdQdElndzdZOGdpVTdJT0h2cFRhQUhMSEdyOCtNNWV5OVBr?=
 =?utf-8?B?VHUzRnd6VEZCcnNFVzNRbXFxNUo4V1pYdE9LbHUxYnFmWW5aSTRrTU5VQmQ0?=
 =?utf-8?B?aFNqUnFXYkRCYlQzeXFNb2kvSGxuMkdkVTJRZUxhRWRtQ3lrNjd3M21xLytY?=
 =?utf-8?B?UThQVDlNdk5YZVhQNG1Da0x2dWcvN2JBWVM1ZUp0Y0lQWWJ0UC84N2R6STFj?=
 =?utf-8?B?U1dGek5TU3FVZTRrcTZuZVh5VkFrMjh2bldmYkhFVU8vNndtNXV5aHN5SXlV?=
 =?utf-8?B?ejkzQmw5U2kxWE5VKzhBeDF1WEgwSWpudDJWM1N1aEZYR0h5bkVQUU5hMFU1?=
 =?utf-8?B?Umt4SklzQlBxYXZQa0JHVWtnZC9zRDVGMHFqSk9RK1N2OVdXNkpxdEhOTWFy?=
 =?utf-8?B?ODdPbEZxSjJoTkxFSFJFL2h2bHhqcjBKT2VTN1IybkVvc3o1aC9qS25YUlF0?=
 =?utf-8?Q?wZf27itR7gHHbR+UWL?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 76dff067-105f-413b-02e2-08ded23c224c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2026 22:01:24.8385
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yMMtxUGCqVegyL17Et4WIaa6BJMnDZRMDwIz8saRvlh8la09RwRHrQ/6nj6eMkIranCkb7mKmRw5NI2iRBiYNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4267
X-purgate-ID: tlsNG-4011c0/1782338495-3C478DDE-05E6A87E/0/0
X-purgate-type: clean
X-purgate-size: 4562
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM:mid,valinux.co.jp:dkim,valinux.co.jp:from_mime];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7690F6C1AA6

SGVsbG8sIA0KDQo+ID4+IEFzIHRvIHRoZSBzaXplIG9mIHRoZSBhcnJheSwgaXQncyBub3QgcXVp
dGUgY2xlYXIgdG8gbWUgd2hldGhlciBieSBkb2luZyBpdA0KPiA+PiB0aGlzIHdheSAoaW5zdGVh
ZCBvZiB1c2luZyBucl9jcHVfaWRzKSB3ZSdyZSBub3Qgc2V0dGluZyBvdXJzZWx2ZXMgdXAgZm9y
DQo+ID4+IHRyb3VibGUuDQo+ID4NCj4gPiBPbiBBUk02NCBYZW4sIG5yX2NwdV9pZHMgcmVwcmVz
ZW50cyB0aGUgdG90YWwgbnVtYmVyIG9mIHBvcHVsYXRlZC9hdmFpbGFibGUNCj4gPiBDUFVzLCBi
dXQgdW5mb3J0dW5hdGVseSBpdCBjYW5ub3QgYmUgcmVsaWVkIHVwb24gYXMgdGhlIG1heGltdW0g
Q1BVIElELg0KPiA+DQo+ID4gRm9yIGluc3RhbmNlLCBpZiBhIENQVSBub2RlIGluIHRoZSBEZXZp
Y2UgVHJlZSBoYXMgYW4gaW52YWxpZCAnZW5hYmxlLW1ldGhvZCcNCj4gPiBwcm9wZXJ0eSwgdGhh
dCBDUFUgSUQgc2xvdCBpcyBzdGlsbCBjb25zdW1lZCBkdXJpbmcgdGhlIGluaXRpYWwgcGFyc2lu
ZywgYnV0DQo+ID4gdGhlIENQVSBpcyBub3QgY291bnRlZCB0b3dhcmRzIG5yX2NwdV9pZHMuIFRo
aXMgY2FuIHJlc3VsdCBpbiBhIHNwYXJzZSBDUFUgSUQNCj4gPiBhbGxvY2F0aW9uIHdoZXJlIHRo
ZSBtYXhpbXVtIENQVSBJRCBhY3R1YWxseSBleGNlZWRzLg0KPiA+DQo+ID4gSWYgd2Ugd2VyZSB0
byB1c2UgbnJfY3B1X2lkcyBhcyB0aGUgYXJyYXkgc2l6ZSBoZXJlLCB3ZSB3b3VsZCByaXNrIGFu
DQo+ID4gb3V0LW9mLWJvdW5kcyBhY2Nlc3MgdW5kZXIgc3VjaCBmYXVsdHkgRGV2aWNlIFRyZWUg
Y29uZmlndXJhdGlvbnMuIFRoaXMgaXMNCj4gPiB3aHkgSSB1c2VkICJjcHVtYXNrX2xhc3QoJmNw
dV9wb3NzaWJsZV9tYXApICsgMVUiIHRvIGVuc3VyZSB0aGUgYXJyYXkgaXMNCj4gPiBsYXJnZSBl
bm91Z2ggdG8gY292ZXIgdGhlIGhpZ2hlc3QgYWxsb2NhdGVkIENQVSBJRC4NCj4gPg0KPiA+IENv
bnNlcXVlbnRseSwgdGhlcmUgbWlnaHQgYWN0dWFsbHkgYmUgcG90ZW50aWFsIGJ1Z3MgaW4gb3Ro
ZXIgcGFydHMgb2YgWGVuDQo+ID4gd2hlcmUgbnJfY3B1X2lkcyBpcyBpbmNvcnJlY3RseSBhc3N1
bWVkIHRvIGJlIHRoZSB1cHBlciBib3VuZCBmb3IgQ1BVIElEDQo+ID4gaW5kZXhpbmcgb24gQVJN
Lg0KPiANCj4gU3BlY2lmaWNhbGx5IGNwdW1hc2tfdmFyX3QgYWxsb2NhdGlvbnMgYXJlIGRpbWVu
c2lvbmVkIGJ5IG5yX2NwdV9pZHMsIGFuZA0KPiBhbGwgY3B1bWFza3ssX3Zhcn1fdCBhY2Nlc3Nl
cyAoaW5jbHVkaW5nIHRoZSBjcHVtYXNrX2xhc3QoKSB5b3UgdXNlIGFib3ZlKQ0KPiBhbHNvIGhh
dmUgYm91bmRzIGNoZWNrcyBhZ2FpbnN0IG5yX2NwdV9pZHMgKHNvbWV0aW1lcyBvbmx5IGluIGRl
YnVnIGJ1aWxkcykuDQo+IElPVyBpZiB0aGVyZSBpcyBhbiBpc3N1ZSBhcyB5b3UgZGVzY3JpYmUg
aXQsIGFuZCBpZiB0aGF0IGNhbiBoYXBwZW4gaW4NCj4gcHJhY3RpY2UsIHRoZW4gdGhpcyB1cmdl
bnRseSBuZWVkcyBmaXhpbmcgb24gdGhlIEFybSBzaWRlLiBUaGlzIGNhbm5vdCBiZSBhbg0KPiBl
eGN1c2UgdG8gbm90IGRvIHRoZSBzYW5lIHRoaW5nIGhlcmUuDQoNCk9rYXksIEkgd2lsbCB1c2Ug
J25yX2NwdV9pZHMnIGFzIHRoZSBhcnJheSBzaXplLg0KDQpBbmQgSSBoYXZlIHRvIGZpeCB0aGUg
Zm9sbG93aW5nIGNvZGUuDQpBUk0gWGVuIG1heSBwb3NzaWJseSBjcmVhdGUgc3BhcnNlICdjcHVf
cG9zc2libGVfbWFwJyBhbmQgY2FsY3VsYXRlcw0KbnJfY3B1X2lkcyBmcm9tIHRoZSBudW1iZXIg
b2YgYml0cyBpbiBpdC4NCg0KeGVuL2NvbW1vbi9jcHUuYzoNCnVuc2lnbmVkIGludCBfX3JlYWRf
bW9zdGx5IG5yX2NwdV9pZHMgPSBOUl9DUFVTOw0KDQp4ZW4vYXJjaC9hcm0vc2V0dXAuYzoNCnZv
aWQgYXNtbGlua2FnZSBfX2luaXQgbm9yZXR1cm4gc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgZmR0
X3BhZGRyKQ0Kew0KICAgICAgICA6DQogICAgc21wX2luaXRfY3B1cygpOw0KICAgIG5yX2NwdV9p
ZHMgPSBzbXBfZ2V0X21heF9jcHVzKCk7DQogICAgcHJpbnRrKFhFTkxPR19JTkZPICJTTVA6IEFs
bG93aW5nICV1IENQVXNcbiIsIG5yX2NwdV9pZHMpOw0KICAgICAgICA6DQp9DQoNCnhlbi9hcmNo
L2FybS9zbXBib290LmM6DQovKiBtYXhjcHVzOiBtYXhpbXVtIG51bWJlciBvZiBDUFVzIHRvIGFj
dGl2YXRlLiAqLw0Kc3RhdGljIHVuc2lnbmVkIGludCBfX2luaXRkYXRhIG1heF9jcHVzOw0KaW50
ZWdlcl9wYXJhbSgibWF4Y3B1cyIsIG1heF9jcHVzKTsNCg0KdW5zaWduZWQgaW50IF9faW5pdCBz
bXBfZ2V0X21heF9jcHVzKHZvaWQpDQp7DQogICAgdW5zaWduZWQgaW50IGksIGNwdXMgPSAwOw0K
DQogICAgaWYgKCAoICFtYXhfY3B1cyApIHx8ICggbWF4X2NwdXMgPiBucl9jcHVfaWRzICkgKQ0K
ICAgICAgICBtYXhfY3B1cyA9IG5yX2NwdV9pZHM7DQoNCiAgICBmb3IgKCBpID0gMDsgaSA8IG1h
eF9jcHVzOyBpKysgKQ0KICAgICAgICBpZiAoIGNwdV9wb3NzaWJsZShpKSApDQogICAgICAgICAg
ICBjcHVzKys7DQoNCiAgICByZXR1cm4gY3B1czsNCn0NCg0Kc3RhdGljIHZvaWQgX19pbml0IGR0
X3NtcF9pbml0X2NwdXModm9pZCkNCnsNCiAgICAgICAgOg0KICAgICAgICA6DQogICAgZm9yICgg
aSA9IDA7IGkgPCBjcHVpZHg7IGkrKyApDQogICAgew0KICAgICAgICBpZiAoIHRtcF9tYXBbaV0g
PT0gTVBJRFJfSU5WQUxJRCApDQogICAgICAgICAgICBjb250aW51ZTsNCiAgICAgICAgY3B1bWFz
a19zZXRfY3B1KGksICZjcHVfcG9zc2libGVfbWFwKTsNCiAgICAgICAgY3B1X2xvZ2ljYWxfbWFw
KGkpID0gdG1wX21hcFtpXTsNCiAgICB9DQp9DQoNCg0KPiA+Pj4gKyAgICBpZiAoICFjcHVfdG9w
b2xvZ3kgKQ0KPiA+Pj4gKyAgICAgICAgcGFuaWMoIkZhaWxlZCB0byBhbGxvY2F0ZSBtZW1vcnkg
Zm9yIGNwdV90b3BvbG9neSBhcnJheVxuIik7DQo+ID4+DQo+ID4+IEkgcXVlc3Rpb24gc3VjaCB1
c2VzIG9mIHBhbmljKCk6IFN1cmVseSB3ZSBjYW4gZG8gd2l0aG91dCBhbnkgTlVNQSBpbmZvLA0K
PiA+PiBpdCdzIG9ubHkgcGVyZm9ybWFuY2Ugd2hpY2ggaXMgZ29pbmcgdG8gc3VmZmVyLg0KPiA+
DQo+ID4gT2theSwgSSB3aWxsIHJlcGxhY2UgdGhlIHBhbmljKCkgd2l0aCBhIFhFTkxPR19XQVJO
SU5HIHByaW50ay4NCj4gDQo+IFdoaWNoIG9mIGNvdXJzZSB5b3UgdW5kZXJzdGFuZCBpc24ndCBh
bGwgdGhhdCBuZWVkcyBjaGFuZ2luZyB0aGVuLg0KDQpZZXMsIEkgd2lsbCBlbnN1cmUgdGhhdCB0
aGUgcmVzdCBvZiB0aGUgY29kZSBoYW5kbGVzIGEgTlVMTCAnY3B1X3RvcG9sb2d5Jw0KUG9pbnRl
ci4NCg0KSGlyb2thenUgVGFrYWhhc2hpLg0K

