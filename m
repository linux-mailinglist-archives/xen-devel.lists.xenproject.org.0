Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0iNWMeRHMGo0QwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 20:43:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9D168942D
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 20:43:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=BC5fIlcb;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338508.1599539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZCHU-00037K-R5; Mon, 15 Jun 2026 18:43:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338508.1599539; Mon, 15 Jun 2026 18:43:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZCHU-00034W-Ny; Mon, 15 Jun 2026 18:43:32 +0000
Received: by outflank-mailman (input) for mailman id 1338508;
 Mon, 15 Jun 2026 18:43:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1wZCHT-00034Q-7k
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 18:43:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZCHR-001eoq-VF
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 20:43:29 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a3047c7-2eae-0a2a0a5409dd-0a2a450ce05e-14
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 20:43:29 +0200
Received: from [52.101.52.71]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a3047d0-62f1-0a2a450c0019-34653447aae3-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 20:43:29 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by BY1PR03MB7262.namprd03.prod.outlook.com (2603:10b6:a03:522::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 18:43:25 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 18:43:25 +0000
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
 b=jaObRey4xe91W6klfHFv518WgDatkXptajgaJEiiNxpCDnFr/NGyzyeDpEq4iiuyglmn4/H2G9NPreAC9o4Lwkb3cgWKXN98x1CUfDjbxBVF0os8F4/wCdyAa76y2tbwcxvfvaSCpBqdoOUT2XECCuttUZMtOhtkFKkoYwa89SAGE5j5mjMJ2g+41sU9BtVOON1qCiGnhYKfctncc2aTmpASeOhTwFnHMvEMK6f89+d1oni/Dpvt1mWN/98DGiKxlvdzQnpDimQBECPdNX74wZHNouni8skZmaI0DA4OBR+Xq9RuMUa9K1PVmdUtjdOd0eL3dSm4Y3YgS7bD4QmCIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ouyFQ0eU6ubnvg+fcK0usVcZr5Tkjl83MuVqcjkRDI=;
 b=D0vZYb2cMgUisysLJmc7mR3I3cVseiFbq2R7nF6/4NtaJVq8+k9ZXHb0fNGvuoh4r2vlYat208OC5K4Hy23CEhwPAyehKPKz7hNPEkfpG5a7MyoUSOUfSPSr65JAmBx1hAFftMhY0F0ypbqbKNSQCmJtYz57poKw990kAG37wgXobTvob2inMuQc15TTqytqBAwaEIFOghcnuHKGsYSpnBYPfDxdQU1n5GEONNr5KwE5kA1uau7MjpbqF3qlZpzSCJHTfJj/QAjh5eioVkMUO02zPlZOwTrf7y3yOQ3NCblb50dcwLWGDTh9SEody/PouzFCZkCLLc/MaeOlntU0+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ouyFQ0eU6ubnvg+fcK0usVcZr5Tkjl83MuVqcjkRDI=;
 b=BC5fIlcbV9ijwmYReC97QfxUF/mG9HAPIU3fsJhWTmq7yE+j6iA4IG/PYI/Ev+fti76ph4TdAYENrSjxOG7rvUwyVi5EE2NPZo6MGosvsf2d0NAF4ekYn8BMfO/YIzISASp93pJcrDDsD2PuMNr2sRefbg8S/efAM1ZdjfrHbeA=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "jbeulich@suse.com" <jbeulich@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH 4/7] x86/kexec: Support non-page-aligned kexec segments
Thread-Topic: [PATCH 4/7] x86/kexec: Support non-page-aligned kexec segments
Thread-Index: AQHc+CbsApGJa6zrgUWsa1X0ikSoUrY/cjuAgACCg5A=
Date: Mon, 15 Jun 2026 18:43:25 +0000
Message-ID:
 <BY1PR03MB799653CD160FBD7BA81CF931F3E62@BY1PR03MB7996.namprd03.prod.outlook.com>
References: <20260609154518.779757-1-kevin.lampis@citrix.com>
 <20260609154518.779757-5-kevin.lampis@citrix.com>
 <494de33a-5033-4c5b-a026-fa8a4ed26cd0@citrix.com>
In-Reply-To: <494de33a-5033-4c5b-a026-fa8a4ed26cd0@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY1PR03MB7996:EE_|BY1PR03MB7262:EE_
x-ms-office365-filtering-correlation-id: 93277227-7ea5-45cb-159b-08decb0dfbdf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|4143699003|11063799006|6133799003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 vUGU8IjtEPyOMRmK33HeHrkj795o5WWkTG4HIh4X5gySyPus7j/VRm/ZcFQILHs1Rf4JnGaoycnIZrUDaBuu16Lk0hnzhTGrOAg1/MoLUKcOR6H53GhjNjTMcx473G2Mwri1XBnI1ZXW4vHe0zDcutTGmWg78IId+BzY/pYGH3BsUyGKaSsa8RytUU86lEflLX9K0xl+gfyBpNT5ArJWvXD+/66VxIIiPKrUrs6CbsDx1iYxUyh68x6HPPk3A4S3sb9bEz4NAAK/ui33wyc6hl+Q9DC6d+iMl/cH4KPCwrxAg6Qnw262cW3es+ulzwe+19KSNwqaDA4i85vvucohDnXkghIuP87m5Y/cRWJUpNnzW+qvIQDId6512qs/mPwcS3gnG4oHrbuU/dQzmjXLX8eWEOj7QlYabQU4n+862LkuBI+TMOVzM7Nzt9rtfGQEl8fd2UwZfOns8B1nHlsZZuOdTnXnKEBOHTInWUh5No4+I5Y81LAdBcrZCANwRsv4XGIHtIH309qwyW8ByUndZZI+DeaoWhSoHbnQ9iL+D5qq80h0jA7SVN6CGUHO/G+ymBON4y1AROyuW/2hIWIOVGsiEbgOrhNFaY7vrX6j9j/fPU/FIVgr6RqHwJcxBn//bvSg1IEOgSvbZNHJCeuylOwFJphkKEfqmTPcowPt0tMNahvUMPWZTnzM6LLw/h16IAmvkZjVErBXi4ioXYdpvAdwJCdw2EtfLCzWmKAGRa7MFwj464hXZ4mimPEVDaG8
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(4143699003)(11063799006)(6133799003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?uZQTZ8W9NDpHj+0SAtPQJjc1ZRbW2T9PImpSTeX5r/so2023pUMo371csd?=
 =?iso-8859-1?Q?y5REwFaBTcVvK+qvHlXViGm+jm2bvMhZVi2cHVeK/O8ZmH9FdN7bPH2En/?=
 =?iso-8859-1?Q?QwP7yXJ+ngiFn+l/SPVSgViAno4JGZNfV26Ve9Tu+9zfRQUEcTCN1iEFPl?=
 =?iso-8859-1?Q?SxtmklpSrXC26jnmOyB/AmsUTE+KEeXrFKV4gk3Yi2LUmi5MdZfGor5ASD?=
 =?iso-8859-1?Q?0z5Y+kkuLEHjQmm/q69PWcts5ikIaB2MMYt2dBefXJoQVvX+Yzu651oCMQ?=
 =?iso-8859-1?Q?qzTQhy71J7GT/xbkEvwf8yrweCC+Vl6ksF7yG2Umy5Ajm6PI6usFFo2BAe?=
 =?iso-8859-1?Q?knxVjo1tU5lGVpUcg46ouzl9jySyB2lU/tw52bLcDM5gmID1mfWdTC0z81?=
 =?iso-8859-1?Q?+k+78+DJxFJa1OIfuEaXYeMsTuiAcXyGUBcXRUMzXNREmpeyDhcBkzppMx?=
 =?iso-8859-1?Q?DXBqUx0UZn2aHBXpOcVt64Qmsbt8qqQzmVRN188UqMVKvPY10k70iQjMKk?=
 =?iso-8859-1?Q?v5hE+wBMn1VEjfsf1eTcaKj961L/WWqiF5g8MIAEm6qKcU1RxcRHzZGuTX?=
 =?iso-8859-1?Q?gSEoaY1/zR5OlU3Z5ynFPpeOwSXS9pCx/0wqVOIO/Fc13yHi8WEW6k1Vgj?=
 =?iso-8859-1?Q?8yshTQUFXRc1T7rGpT4djjbTFrOdz3Jfj5Jj0LhY9mt4F2Bqu8nIgtrl1E?=
 =?iso-8859-1?Q?t0M7z1D2BeYr8p96cQdKDNt4rDD99LL9ZYIrUV6GgUg0+RrdU4YeOgOU/A?=
 =?iso-8859-1?Q?WXQM5yLmXoxWw2DwGCoqq79L8yrchMciT8lWuVN878n8PY00yUwp4EvLUG?=
 =?iso-8859-1?Q?4dZ7E55Bov/85IVx6I1ZLD9H0TJy/3QxDN8zuPE/xqm1xoBFeAf+/P/M6X?=
 =?iso-8859-1?Q?UXh6g192JgEIVrmhY2y1E9O/dNpVtWcke3L6wqq1SXfKQqNGF6oRwBVJW3?=
 =?iso-8859-1?Q?ZYnTW0ETGle5SDDcR9Ciqg7Ul5DbaNvbr3gvzmnDEXTFMllH1d7oD2GOWU?=
 =?iso-8859-1?Q?jBLcQK5goPzAHNszl2T0juFMuHq2VH25I1LNoZSCD1VRrV3c4rLS5PB2wP?=
 =?iso-8859-1?Q?0epve1bB9hli8Gk3aCs8Q+tbErmpeWGei/exm0q3GNjuJv1um91QSIIGXr?=
 =?iso-8859-1?Q?BNK2LaWeyMTT2vM4CsHMajQfcVH+6pRK+s/DYmrJxqih1veNVidtCBUH5e?=
 =?iso-8859-1?Q?CeDfhU5rJKNcsQiqYf05wS5MRHYKHk3PcH2HPXXssPZy8xvzDaGHU7Zyl3?=
 =?iso-8859-1?Q?B+2fu8VRtpgxWypxwXdoLFDFDd1+cZJy5dZk5e1P2FY2upvdbDjxnlGFtI?=
 =?iso-8859-1?Q?1PZaTTgPBMk6HuxUjyVl1IgvZb7BONGtZJ7+fgSbThH2IJiCzMDOHbdisX?=
 =?iso-8859-1?Q?rnt2GeRX9qg63D5sqBaHRK8jgY7WrEyvZmLhc29Jz7Vh0EJcZJx1Lj8FN+?=
 =?iso-8859-1?Q?jekIfG8WbIPrdaL7e00ZIYC1v+DQgqyTITtrbvhgaCpSo2lSLV1IIq5DXy?=
 =?iso-8859-1?Q?3M25BQU26ycjseOaB4/VobQxZjoxfkCQ3uV5BXhy2NRQYfZvQH5ROyb6Ub?=
 =?iso-8859-1?Q?bNRqFIS8gywQNKyW2y/xoFN4I8dchm/44jcFQlAO8dnYKQEzClGC9HubB5?=
 =?iso-8859-1?Q?3k4LfFhdfQ3cb+02UM9cYVoohnBG5qsWeg7Iwjuk4JIIzrbhSiB3nD7dqO?=
 =?iso-8859-1?Q?Zx4xjIbKFIXH7O2C8+3YUhhmq5klaQv0n/bq/AQUpzwDRLKy1dX9Sfv+Lx?=
 =?iso-8859-1?Q?V1BsQ1ClSxKUsgW7M/Spq4dKeiFo0D+kBcNKgp/U/TazoM?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93277227-7ea5-45cb-159b-08decb0dfbdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 18:43:25.3492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UQyV48IdXQsafv+wjPFIzCZOTn3mZuRu9HsMjMbeXjcKhlaT+36zBLb2rNY3WcgQkVUAdHOjHv19h8fS+9axAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7262
X-purgate-ID: tlsNG-d25034/1781549009-E0567CF5-0CC3EB1B/0/0
X-purgate-type: clean
X-purgate-size: 1052
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F9D168942D

>It's startup_32 not startup32.=A0 Yet we hand over in 64bit mode, so why=
=0A=
>is startup_32 relevant rather than startup_64?=0A=
=0A=
Probably just careless wording. I don't think it was the author's=0A=
intention to draw a distinction between 32 and 64.=0A=
=0A=
>I can't find any hard alignment restriction (beyond 4k).=A0 There is a=0A=
>check involving BP_kernel_alignment, which is set to 2M, which makes=0A=
>sense; it's the alignment we set Xen to too.=0A=
>So, what's the real bug/problem here?=0A=
=0A=
For normal kexec the userspace tools chop off the first part of the=0A=
kernel so everything aligns correctly.=0A=
=0A=
For Secure Boot we need to load the whole kernel unmodified to pass=0A=
the signature check and that means the startup function is not aligned=0A=
correctly anymore.=0A=
=0A=
We also changed the userspace tools to add padding to the start of the=0A=
kernel segment so the startup function is pushed out to the next 2M=0A=
byte boundary. So Secure Boot kexec does still work without this patch.=

