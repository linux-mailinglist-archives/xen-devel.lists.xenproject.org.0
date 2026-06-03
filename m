Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YFKYK7ejIGpk6AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 23:59:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D063163B7C5
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 23:59:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=lRSsKiyw;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327208.1592371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUtbL-0007PJ-SS; Wed, 03 Jun 2026 21:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327208.1592371; Wed, 03 Jun 2026 21:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUtbL-0007Mv-Pl; Wed, 03 Jun 2026 21:58:15 +0000
Received: by outflank-mailman (input) for mailman id 1327208;
 Wed, 03 Jun 2026 21:58:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wUtbJ-0007Mp-DX
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 21:58:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUtbI-00HAyr-QY
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 23:58:12 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a20a35e-e002-0a2a0a5209dd-0a2a4502a76a-20
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 23:58:12 +0200
Received: from [52.101.229.75]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a20a371-af86-0a2a45020019-3465e54bd2b2-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 23:58:11 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYWP286MB3823.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:442::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 21:58:06 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 21:58:06 +0000
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
 b=PMJQQjIT1+W2j6hkItZq1DEY/pcSvlwIweJW85jCRhMxFbVNSmEGrZlBrhlqN/YW3d67dhfAclBn9IJyhRT9PJIlMF6/Y/R+y0pq5q8Xb7fgIPN16PtMC7GqXt3ifSFUNWpd440W+oERHhGli3Dz3Zc6gty2rXBYwoq8LssCIIjFMPm0YfCEXk6z3Pwxymf8rCoryWoVXdwZ1wxPMNnQOfpZ67hPB1st1NLhasZ6wVKt6YedTinhh8rUSJduBPElDAOuCFa4QGWFtuXPtPT2oo6zigcf9a4f8cTCy+AcsBuMjKYCUtTme7FqXw1vaDsthal15hAuafMf1/2ZceELCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUAGAjeXgbYmTFp6J6k89mlhonl9GGok2uTRyPTb0eQ=;
 b=YDXP5RP2sCIZEXUtZK5TX81Wk5VHmW5ABQOAhzHOT9Xzu6iSm2xpDu/KIoab3dETmqQoY3Okr79wdGAuGxRBUm3pHhPqnZUjmW9C6JtFQ2o7U6URcOwzv12XrEpxQ1oe5BhspvOIEMwL7hUigCvavwNXHi+xxiHtUsw9N8WuJA3NRmC+11mnIye/zONBM92ruS3rOPVodSW452scroVSQZ96Jl/Eqm8GzWU2WeondR6v2oIc+zFm1hZoJ2J1uW6qqff6T1qD1rsYd4LauIhunxmiAIfjqt1zovqbyp0raEP/xcQTWzKP3cDz+vz2HnCYICy2HnVP9adY8A2Fw25ICg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUAGAjeXgbYmTFp6J6k89mlhonl9GGok2uTRyPTb0eQ=;
 b=lRSsKiywKwYii+0HZwPm/e4yO9onDD9NrhLVm/rM+Zx7hxBfoJ9Kt5kHS0KpBW8DJBaypeGB6sgrX0pMLYdrgYAPxl+hXEauitkGRsWAYyZnykS4mZgiytZhFvuSv+1yzi4f/tEln1ac3TrHOim7DgrvpHlbXE3FohHvv6F3Xy0=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 03/24] xen/arm: Introduce CONFIG_DEVICE_TREE_NUMA
 config option
Thread-Topic: [PATCH v2 03/24] xen/arm: Introduce CONFIG_DEVICE_TREE_NUMA
 config option
Thread-Index: AQHc8U+LMsab0l8GlEOATMpCtUjho7YrBYyAgAF1I1M=
Date: Wed, 3 Jun 2026 21:58:05 +0000
Message-ID:
 <OS9P286MB72227077B2748C869F4F762182132@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260531224755.9481-1-taka@valinux.co.jp>
 <20260531224755.9481-4-taka@valinux.co.jp>
 <accbb6c7-3681-41ae-a712-5f481bea9a5a@suse.com>
In-Reply-To: <accbb6c7-3681-41ae-a712-5f481bea9a5a@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TYWP286MB3823:EE_
x-ms-office365-filtering-correlation-id: 95ce6204-e651-497a-3f65-08dec1bb311e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700021|22082099003|18002099003|4143699003|8096899003|56012099006;
x-microsoft-antispam-message-info:
 6bs4XgdZktUyBijWHGLXIeF76poaj72/JaHfXbEt7NlQnbaAl6KULOgcGTHTtGtx1zp4LF6EsOeLmTUI8stsK8ymcE++Fv6ZmHpNCYoof0IqiJQ0YUWoww0B1CkuJOBhu2Zl/nv4V+OKNvjSiv7K02tcQVZgk/+Obb56Px3aN65W+STtfXUiYbl5Z6C02i5q30c5m/G5xZkSicyJk/ZjzE2JW6Qbb7G+oSSfS31kZvBiy4e5n3/KJ7Yx5z4TSCOFAZgKfi7yb6YBcmV1RWrzsECoIdixyLboX72ttgvWypbWB+MZfQu2KnOVsOZJHDQwzvgMDHP1vFUBj28G1i5K1NZ5r1eZ/GJd2jE189KCUhcBe0h/AI5NZF17fNKLxtM5L8yM/dlb3q4QMlSFTNtovScauuW6tnvim27kUenJUqtjKS40KX2Bz0SzWeiPp6Ehf7wPBpYm+x3KOApnzGeZ1NKZF6GU10bIdaMFdfhwBOQXRllaD9Hw4zYwZNu1BGQMZP+Aa0YWrPEatIQuSId5dc5PxKs5uv28rsUFQVKjUDHv66xvfSqwyriUH8a0z7/NiMe9hOENj4yYXCaHZa6HD2j+NMiNJP31Nlushf+9kdrrn79KAuN+5rOhZrHIoCA0CalYcL5xRvqUEk46EkoQ1/lZkhFCCwc0dl75tx2Bp66wWk3f/EA5V21O7VYbNrSDuRHf1avhupqwlkPAmo71o8RJJH5m6cldY8rIleZcOSiZpGIvUgldMLRazuLJ+WHg
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700021)(22082099003)(18002099003)(4143699003)(8096899003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?wYvpBUd4xgLLTi3iUIAxAE250nxRClwOcA5sTSlwE3Z+TpRaB2PyXO19o6?=
 =?iso-8859-1?Q?qaIyUMmsgK0vk10aSTZCTQxHJEuiIfxb9Yf3Op7YDFyVuUyl75kDH2TYJR?=
 =?iso-8859-1?Q?8vLevyDizs10+mslp82LWQ2kq1NNBgrkTloZ1bAYM+J28MZNy2DWHVJkfw?=
 =?iso-8859-1?Q?TDe9ctOsMk160hrOPFvVboiCBCxzHWNBb3wZZ0+HJo+nGMBd4HWC9MwAhb?=
 =?iso-8859-1?Q?iBSop/PiVfYuD5qYYW8S7E7FTDFDsX8uxtQvfqTEfOwmpSn0ByBQAv7ZuP?=
 =?iso-8859-1?Q?AkUUiAMhufikVYKmJJZJ8/AFex6T8Bhr1spPsoQnQJsJMUv9QqDk33PNo+?=
 =?iso-8859-1?Q?mPWzA4Jvhl/LivZlOeZHzzj8KFUgm5MCMeIP6zcz7XYhxIM67CLaScdoPa?=
 =?iso-8859-1?Q?wnGoHXSL4QopxnGDSEXBXtn1WIHfOiYJf73rPdW8fhJNNlxTOa6cK8oDmb?=
 =?iso-8859-1?Q?TFperqUea9xmLVWE04exQoPHoLKjgEqIe0bD0dOmlkc+mI/ci+gjihOnEr?=
 =?iso-8859-1?Q?g/jHqbU5Evo0Dl5XreevOO7Ob14VAkoGFPyN6IzpOXx0/4BX4jrD6Lah2f?=
 =?iso-8859-1?Q?EssdZmtVRPA+1ofsv0wTTAymbsylWQdR+YmKjar4P6CY4W4UH+WYVjxNsS?=
 =?iso-8859-1?Q?tHPiRSy5C24VlW8xbkWb0LwhMo+R6WuX+N9cFw4TvdmfI0KOOJMqugrrmC?=
 =?iso-8859-1?Q?EyvD7WA34ZoIC98dVGl0G0S8Jt7aEZ+Ct+23X2QXsS/RIfD+AveDkInOM9?=
 =?iso-8859-1?Q?Ly1pfiUchpApG0GzYy/+tXsljzmOCyXB05EBJM0B4ucNQjTMLtpeiQkoJE?=
 =?iso-8859-1?Q?9zvdyLvNymeuUF4CYtFZlgbCLlC0Kt75VH8d2OkFVJLOmDPNSi0CtB2Qm3?=
 =?iso-8859-1?Q?mOLRey0MyiBQJTEdSR1K3YF6WcDeK1QgOJmnzIaxiER4GmXmK2MH9ur2yx?=
 =?iso-8859-1?Q?xOU3dVaqBAMFUtcatObvqisA0TJKzwd7fdLsWRbMAYpVNAOTh2UIIrQ0L7?=
 =?iso-8859-1?Q?GxLSXMyMbD0QjRQaQGXhUBVuYUt1KBDfqgHKHLNdAp0huGPoPsr9F+eF3r?=
 =?iso-8859-1?Q?ePP5Mtguz4D+t6KtLOlsHHcZ3a2KV9de96gIRj4D3OiwqlaKIeZeSyJ2k/?=
 =?iso-8859-1?Q?kJpfRQHG0MJcCe2Q2XcP/Xqv27CA6w9xGM1ZfdmOQSXqJAKfackPn69hnG?=
 =?iso-8859-1?Q?/DEGfBcK5P1V/eGD3er1dzfpqo8Ny3kmjleAUc1cmXV5/pthD20HfqPkgI?=
 =?iso-8859-1?Q?kSUWrpxQbij9anX7xRg0bHBG3F/qGKk2EGXYBzcs0DEeCQau70SYUXptgO?=
 =?iso-8859-1?Q?Qnb0jFvNbkl/Kh4OFAp5h7sO+nqUGFIWzTyynqQLin7S8z+O0OID3Su3jG?=
 =?iso-8859-1?Q?tpE0248leVuWSGmxDEB9UPBnE5cJM+LDEz7WvGHo3FMiIRl7G+LGU9M+/c?=
 =?iso-8859-1?Q?Rl9i+UwRz6aibmz26L3sR+Tz2cVUyBRiAHueqKkIE8Ya8dyk14Uy3zVLMF?=
 =?iso-8859-1?Q?xDJbJ0rufVoCS8PyV49Sy933ov5VTTkh2u15Jvmgc7asZW6MSYXBT8oebw?=
 =?iso-8859-1?Q?6N44JNjjJDDhZIJ4x/nhU713RtjsJ/YTUbPNkuO4+XKI4rzJkmmmUcZbwp?=
 =?iso-8859-1?Q?nVR0ietumb9jI3NmS83zpTqZonnVV92mSKje8FYYYBuVpEKEw8kE1tQWQS?=
 =?iso-8859-1?Q?qQ30XZJPl1MfYMjb9eNxXrQKwAhVsMsy7Aej961JjPzBqdgLrtJTTmxD9K?=
 =?iso-8859-1?Q?rFWnJMWMo9Y2fYoEDEf/atr5XFjzS9RmnfF2NZhnQvb+KV?=
Content-Type: multipart/alternative;
	boundary="_000_OS9P286MB72227077B2748C869F4F762182132OS9P286MB7222JPNP_"
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ce6204-e651-497a-3f65-08dec1bb311e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2026 21:58:05.9701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VniRyjzwWpNinkhIvXg9eVLuRuyoCDjGptJg5dr8fnl01DXuSjWhmlX5wFx/z1QRxx28XwZL2Kt6EkSHXuoN7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB3823
X-purgate-ID: tlsNG-720697/1780523891-ABF66161-DA4FF693/0/0
X-purgate-type: clean
X-purgate-size: 9032
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:from_mime,valinux.co.jp:dkim];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D063163B7C5

--_000_OS9P286MB72227077B2748C869F4F762182132OS9P286MB7222JPNP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
> > @@ -99,6 +99,14 @@ config MPU
> >          systems supporting EL2. (UNSUPPORTED)
> >  endchoice
> >
> > +config ARM_NUMA
> > +     bool "Device tree based NUMA support (UNSUPPORTED)" if UNSUPPORTE=
D
> > +    select DEVICE_TREE_NUMA
>
> Nit: Indentation.

ok, I wiil fix it.

> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -188,6 +188,10 @@ config VM_EVENT
> >  config NEEDS_LIBELF
> >        bool
> >
> > +config DEVICE_TREE_NUMA
> > +     select NUMA
> > +     bool
>
> Nit: Can we have type ("bool") first, with "select" (or "depends on") com=
ing
> afterwards?

ok. I will.

--_000_OS9P286MB72227077B2748C869F4F762182132OS9P286MB7222JPNP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0mm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
span.19
	{mso-style-type:personal-compose;
	font-family:"Times New Roman",serif;
	color:black;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:99.25pt 30.0mm 30.0mm 30.0mm;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026">
<v:textbox inset=3D"5.85pt,.7pt,5.85pt,.7pt" />
</o:shapedefaults></xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"JA" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;color=
:black">Hello,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:black"><br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;color:black">&gt; </s=
pan><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibr=
i&quot;,sans-serif;color:black">&gt; --- a/xen/arch/arm/Kconfig<br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;color:black">&gt; </s=
pan><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibr=
i&quot;,sans-serif;color:black">&gt; +++ b/xen/arch/arm/Kconfig<br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;color:black">&gt; </s=
pan><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibr=
i&quot;,sans-serif;color:black">&gt; @@ -99,6 +99,14 @@ config MPU<br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;color:black">&gt; </s=
pan><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibr=
i&quot;,sans-serif;color:black">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; systems supporting EL2. (UNSUPPORTED)<br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;color:black">&gt; </s=
pan><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibr=
i&quot;,sans-serif;color:black">&gt;&nbsp; endchoice<br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;color:black">&gt; </s=
pan><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibr=
i&quot;,sans-serif;color:black">&gt;&nbsp;<br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;color:black">&gt; </s=
pan><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibr=
i&quot;,sans-serif;color:black">&gt; +config ARM_NUMA<br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;color:black">&gt; </s=
pan><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibr=
i&quot;,sans-serif;color:black">&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;D=
evice tree based NUMA support (UNSUPPORTED)&quot; if UNSUPPORTED<br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;color:black">&gt; </s=
pan><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibr=
i&quot;,sans-serif;color:black">&gt; +&nbsp;&nbsp;&nbsp; select DEVICE_TREE=
_NUMA<br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;color:black">&gt;&nbs=
p;</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;C=
alibri&quot;,sans-serif;color:black"><br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;color:black">&gt; </s=
pan><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibr=
i&quot;,sans-serif;color:black">Nit: Indentation.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:black">ok, I wiil fix it.<br>
<br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;color:black">&gt; </s=
pan><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibr=
i&quot;,sans-serif;color:black">&gt; --- a/xen/common/Kconfig<br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;color:black">&gt; </s=
pan><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibr=
i&quot;,sans-serif;color:black">&gt; +++ b/xen/common/Kconfig<br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;color:black">&gt; </s=
pan><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibr=
i&quot;,sans-serif;color:black">&gt; @@ -188,6 +188,10 @@ config VM_EVENT<b=
r>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;color:black">&gt; </s=
pan><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibr=
i&quot;,sans-serif;color:black">&gt;&nbsp; config NEEDS_LIBELF<br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;color:black">&gt; </s=
pan><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibr=
i&quot;,sans-serif;color:black">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bool<br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;color:black">&gt; </s=
pan><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibr=
i&quot;,sans-serif;color:black">&gt;&nbsp;<br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;color:black">&gt; </s=
pan><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibr=
i&quot;,sans-serif;color:black">&gt; +config DEVICE_TREE_NUMA<br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;color:black">&gt; </s=
pan><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibr=
i&quot;,sans-serif;color:black">&gt; +&nbsp;&nbsp;&nbsp;&nbsp; select NUMA<=
br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;color:black">&gt; </s=
pan><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibr=
i&quot;,sans-serif;color:black">&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool<br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;color:black">&gt;&nbs=
p;</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;C=
alibri&quot;,sans-serif;color:black"><br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;color:black">&gt; </s=
pan><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibr=
i&quot;,sans-serif;color:black">Nit: Can we have type (&quot;bool&quot;) fi=
rst, with &quot;select&quot; (or &quot;depends on&quot;) coming<br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;color:black">&gt; </s=
pan><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibr=
i&quot;,sans-serif;color:black">afterwards?<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span>=
</p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span lang=3D"EN-US" =
style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:=
black">ok. I will.<o:p></o:p></span></p>
</div>
</div>
</body>
</html>

--_000_OS9P286MB72227077B2748C869F4F762182132OS9P286MB7222JPNP_--

