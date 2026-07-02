Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CtG4J3ukRmp2awsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 19:48:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 044496FBA4F
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 19:48:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=R7APknHl;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1352308.1609142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfLWb-0008A8-Np; Thu, 02 Jul 2026 17:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1352308.1609142; Thu, 02 Jul 2026 17:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfLWb-00087f-Jd; Thu, 02 Jul 2026 17:48:33 +0000
Received: by outflank-mailman (input) for mailman id 1352308;
 Thu, 02 Jul 2026 17:48:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mhklinux@outlook.com>) id 1wfLWa-00085M-K0
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 17:48:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfLWa-008Pbt-0f
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 19:48:32 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mhklinux@outlook.com>)
 id 6a46a462-2eae-0a2a0a5409dd-0a2a4506bc76-34
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 19:48:32 +0200
Received: from [52.103.12.22]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mhklinux@outlook.com>)
 id 6a46a46f-08de-0a2a45060019-34670c168653-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 19:48:31 +0200
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by LV8PR02MB10144.namprd02.prod.outlook.com (2603:10b6:408:18f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 17:48:27 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6%3]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 17:48:27 +0000
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
 b=ieEeUfKOgC00JIcY3PvHgwK7QYDQvGSCasQvpxg6c8IH7ncCF09epUR7IORg7pwa1yzjTTnRDBmQfxNAlUJEwsdHgcLJjkqYmnkt2tM3Ib2sXeUE80hbPZvhwjPzUTiyrpbnq7s1CKbp7Ux3T3unDi+ZLE/YFVdk+vFUHLDk2RadfBsfpKnnVVPsP2cxn9col1omt8zj0yHkoQH2oSs35Qh5ColbY5Y/wxCBZ3t/wla9l0nIV9Sl1S72iCdIk0Lev32HMOC5TsWSqOytSAcRePbN9PTZbS5N/TzFNmXc//HWZjSgGu6K/tHCn9ewIdHYdFcLSBhSKXMD/WUZ2a83DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NbBFbp/nzUuGrsjGnl+g4Yfp6IgxX5osOjXE0eNcIFY=;
 b=VG3s8DbNm0ylTYmmX0zWdJvU4dLxDOU8uW0u2fuPPDx4OyjnhCiyj1MRa7H4f2k9bvNQ2ewKmx5+t9xs3KQRKgZQ6SJQwzlBHF18ZsvWxeCqxe7YIY0QuPb1w6RqCbrFqVd2O+a7+IqIkqT1aOk7/jRTrhg5li9IYaaDrvhPZ6E8o1d9a6PNLM+JU53PI6iWh7RN6TiM+W4qjYFWdRR+BtJaH5rvbFL7IOfAH7oFmZ69xRhCB2YjzSfVbTBMAiE+cX7nGjcehn44Wn3UsCWa32Y9LcSooamEPMxfJwUL5tIlLyBF4mqfNnth0FxKFbhs9l9ZTC1jf4wEpDJ0pOPrdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbBFbp/nzUuGrsjGnl+g4Yfp6IgxX5osOjXE0eNcIFY=;
 b=R7APknHlBYFtJGoVLN5EBazyu5cgiI9bcsty7hyFb13oOSvuxvDls2gyoPIlZoeVg8NV9phoaMsMu+B9P1EopBpCZkj5HWwoVxsljT1mDpn4Kf5ZzqPy0tmGbM18+HiAl9nwUgsmRYk1DV1LTMY9wJPCyHw9VPlOheU2/lGwhRgHw1HWbDGHaIKXEDzuoI2dWpifmqf1D3Vif4VxbG7t9tZg61ffJawpS4SI8cqcSz9yu0SdVxX6oqDdT9y7Oa1O66XNOi9q4SJG9eTLE4zDxgubRJquL/hQL7udfZNSZF0vpCSYtOojHpBjNPZv4dcOAao4yEogaDQsXAxc0YlmHw==
From: Michael Kelley <mhklinux@outlook.com>
To: Sean Christopherson <seanjc@google.com>, Jonathan Corbet <corbet@lwn.net>,
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, Kiryl
 Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, "K.
 Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Long Li
	<longli@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov
	<alexey.makhalov@broadcom.com>, Jan Kiszka <jan.kiszka@siemens.com>, Andy
 Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Juergen
 Gross <jgross@suse.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, John
 Stultz <jstultz@google.com>
CC: Shuah Khan <skhan@linuxfoundation.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>, Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "linux-hyperv@vger.kernel.org"
	<linux-hyperv@vger.kernel.org>, "virtualization@lists.linux.dev"
	<virtualization@lists.linux.dev>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Tom Lendacky <thomas.lendacky@amd.com>,
	Nikunj A Dadhania <nikunj@amd.com>, David Woodhouse <dwmw@amazon.co.uk>,
	David Woodhouse <dwmw2@infradead.org>, Michael Kelley <mhklinux@outlook.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: RE: [PATCH v5 47/51] x86/paravirt: Don't use a PV sched_clock in CoCo
 guests with trusted TSC
Thread-Topic: [PATCH v5 47/51] x86/paravirt: Don't use a PV sched_clock in
 CoCo guests with trusted TSC
Thread-Index: AQHdCZB9X/lWZeCwrUy8v9Xjt7LqZrZagtZQ
Date: Thu, 2 Jul 2026 17:48:27 +0000
Message-ID:
 <SN6PR02MB4157453D405AB80859B12DF9D4F52@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20260701193212.749551-1-seanjc@google.com>
 <20260701193212.749551-48-seanjc@google.com>
In-Reply-To: <20260701193212.749551-48-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|LV8PR02MB10144:EE_
x-ms-office365-filtering-correlation-id: 5bf48bad-71fc-4fda-a241-08ded8621f36
x-ms-exchange-slblob-mailprops:
 qdrM8TqeFBvhuFgLLe5qs4jWk9CHdv0AYy8cQ/QUVhQUEcb7T5SCn14eOaFpictd8GSq+faiQenIYJC3hGGrRCyh+R4fFG3ungSx8vvHg6Tjppm2dQnX30ASlF2J96QIDukoKi+xo7ESP1SYnfq23VqRdmy4dlG1AImTkwtYVhea+dWishLk7ttaDW5e2MCVTeygprhy6mIjolk5/1ZkSCiLgGXo/7gwBvYMwpsk/fFicMxPgE1dL52nd/rhroAqmrRKfO+NNNgpZlYYEt2eDv5KwnzFeljrtJ3b6MadCUpbo6jUr6cKoQIKhKAQzjb++BfqdoPQWSANfgUv9sVrqwoNJFtrgJ0xG5h1yPAVKiYuNLEYW9ZbyML6iQU+b2tNL0uDDuwRReAvWedIRwzl2V0XzfR/JVqg8nGAj0sMpdrgdGvZmpt87zaFiUuILg0yDo8iTQRZ3MaGZcIh2sRuGfHJAlo6AU+LJWJoOqUgCyguuK/Zblb6CFmUxoDfAznroIyLhua0X/accY6iVlFXFEJJ/jdlNdan73cTEXblbhVTQbGEQbV/43vfoQopcX5g2ROdfHk3BJJweSzOR5U29C143Rh5etZR1sVjLbPSr4/ifndXV6afz5bxvfPGRxqRRrULlrDQYWa776RnE3r4cN84Q8De9cD6C6M0tpxkns64W++g7SC/15nyqLx03lOosuKPf31tAMBbtHUB/3Ev2QLp0nsFrqt8v/79G33kP2t0BfC0NZBRp0EGQoTcV2rCju4mAXp1g+O7/fbjSJnS7lWGyb1FRNMk
x-microsoft-antispam:
 BCL:0;ARA:14566002|16051099003|51005399006|19101099003|2604032031799003|704163111799003|37011999003|13091999003|8060799015|8062599012|31061999003|41001999006|19110799012|25010399006|15080799012|40105399003|12091999003|102099032|440099028|3412199025|1710799026;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?5q25IsYCsTrASI9NXfU4P8ec+nkHfyWyOIdXMISJZkyJv0QJ7STvp5XcT1W7?=
 =?us-ascii?Q?/QKhsM5M3Miw6nR+GJ6iwocnKGOnuL/6RkuMyjUY3MpNToGlVOkxjLb+8nT3?=
 =?us-ascii?Q?+fFDQWdp/6r9O1Jc+EGvh2PUBXWRRqp28RUTSaXZNxmg4kFfaAvKzjbSFuTo?=
 =?us-ascii?Q?TqDqyzBlR6mdHcE5kz41tPHZiScYWwAhhR+IH8jMMREKrxVO0pdIuRfF2U3l?=
 =?us-ascii?Q?opBVxRkyjKFv7VXnnoOTPiBSlf6Oh0JMz5p5F3GWpYwCZcRNoyTGhk3Tuvzh?=
 =?us-ascii?Q?f+zyK+U2GLO2hhXDEjjmNdqg6ZJE/17O7gxDFW/j4bED5LKa1aPzDt2LifD1?=
 =?us-ascii?Q?PavW6l8RW/bmbbUPXpoMFkM1UjRXHf4R6q+A8uyeaUVUYTfEujzUvulKEWhY?=
 =?us-ascii?Q?lmhylgj8nZGoxzB4Mg6Db82p8IAvfqWRJHopDwP+2qKeX9sAEsEBoIXsgtX7?=
 =?us-ascii?Q?kj5UdvFVAI9F479/BOhDgRS9g01bef0+khEuvG95gNCWP8jh8vULlZThaSqo?=
 =?us-ascii?Q?9cjUoxk1uOWXSVQhdh1GSCCZwEiivnIv3WB+gf7lC1g7eKw8jDG3pKgSKgDy?=
 =?us-ascii?Q?XQRIqrWsh/+s/FhRUVEzJRiymsoRNQqnfR/YwuM57Dd33lP02HkKFsMfrc5Q?=
 =?us-ascii?Q?DZaavCwuekpRC9PUpiLvK/7QmyYuCBRh5D/PCK/SwvXRf58DNKFM72HZB9C8?=
 =?us-ascii?Q?d60fJGMNhaolO2amArN70YOnG9mdjpj2kGAD7Xu8m/p0qtBLXvW4/DPWrAuN?=
 =?us-ascii?Q?lmdf4lv8h36ypDREoeUYLgJcJlLy/JsmRGKaGUj4GhRRl1u8MYs6I05wjcHI?=
 =?us-ascii?Q?WvfocHk38DfI1bMfRXe3rXkPDXenVW6WgaV0badRV7kxbWsEUoHt1Rhh7Sbf?=
 =?us-ascii?Q?keTVebboyDJqEh+q1dh1RjWbX2LHTW3shgPTEenOVvu16/SADvIMwRV1SthY?=
 =?us-ascii?Q?yPYEBgnTjbsVTl9dmWaSw16Giy4xdtrHNYOXe8/FOzN7ZLjlfRvxwExp/WBA?=
 =?us-ascii?Q?HCOE4TrHVGz0CcQ4T5dPSHolsfLYmeKIDvaqbExVwEq6Scck1/x8rhQWXsoX?=
 =?us-ascii?Q?N3HXqjHt5BoNS4vFRJNJO1gmxRtBcsfeeQkZsvKPSWirB/oKkKQxPdiiTYVx?=
 =?us-ascii?Q?3Ep2Ifg1ZvbXynIkGkm5HIZK7kEmQIodZLFwYFmCKrAXnDBqz6AxVgMwO80x?=
 =?us-ascii?Q?kYOb8ZVrEng6XqO7NM7f3GWeHViBVsmUDrJ7gw=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7ZODV6s9+KgwoUB9aH93lAXzLBMUrLUPS6UpHgZTToRjFFPgYrhYHnGagxox?=
 =?us-ascii?Q?z5xnafvLdobfSsJY9UmQbFDepqNijntrvvz9mJ/2aor1u0ClTVJFtHVzuPMa?=
 =?us-ascii?Q?eVR0QU1Ex9kgHxXryv9nlRbKaVVsv0I9Ao12/ePQRyzD4TmOG65wwEGqvLge?=
 =?us-ascii?Q?Nbd2MrQI9qX4j5MS0kzCCXLdvj0AIWY1yK3fcLBPoMIcYgnikE9M9SRSvXCp?=
 =?us-ascii?Q?KIvQqwobbHXjb+hClkOz4blrKqZE+0eijqFqYVji15kEAZ+D3hU4WLi0Y40L?=
 =?us-ascii?Q?9pwn1kfnIBAHmxoThDW/Y4vso5XmizuweJbViqyycyq3Md+d8oRCvBr4WaBk?=
 =?us-ascii?Q?tJIcrjjJnNnB1iSmx17WQ6Xf7snGDPLfbCFRIQH5bCpAca0rHsySxFwLL6C4?=
 =?us-ascii?Q?Kz1b6DAGMHvGzRa+4vf+KLp4jCGH00ieS9scORtZutlhZWmFh3K07vqywkMp?=
 =?us-ascii?Q?8XIO1YKikGOXuJTWa9c0+XRBZlHZJtfASPJ7FHfVDectRzVWdUYOS2x9kfuj?=
 =?us-ascii?Q?qBPwsXEylWkjWW8hKm3W5z5jVVfKdICUbqeum9S2nFDkltjMAUoDZcKPg+hZ?=
 =?us-ascii?Q?GRvgfD5shKwi0tVO4BR657VS5yHHmaDjxHi03txTRzckmEWLpps3ep8kM3Hl?=
 =?us-ascii?Q?BvbNuptg4i0r3setc4pHerG9YbaOhtc5jGL6pA85bLOw3kgONsAzlIDLd/0p?=
 =?us-ascii?Q?FbOEMHbixneKp451NYZ+D7ODJyI08ydYOGv2lwUTmWCkVCffLeDIbfB8/IZi?=
 =?us-ascii?Q?D/NzRZu4OZm+49Fmnml69sq8z79Q1jROgKiKSdYfDpjh+7BhScgrq9JiXcvQ?=
 =?us-ascii?Q?9pKcto81Te9x9HCYf4gelvZ8oL3SPam2fV2N621arFvM1gphFNUxivUucnWM?=
 =?us-ascii?Q?NeLzFim7/IQFP2WM0n2EMfk+qwGY09T3Aw5Rt+2o+QWyeYwjeSQ8r/6+8RwQ?=
 =?us-ascii?Q?jyTyfgi8YHhdSoe+weDeCFNj27v9HMzk5WOulPd3BnlkGd2jLsuVQYDSFe1G?=
 =?us-ascii?Q?VIOv0JuLrxnBENW3AOQzgq3kt7bZS9EbVr5Kz3esENIJaX1bk2ff5fKi2mWZ?=
 =?us-ascii?Q?L9UeJcI81yWWpQY2uumolT/EJwNxRXViH5VlUgr9q2r3BCw/l8AT+aGyH2UU?=
 =?us-ascii?Q?MRZgCf4h+ssxwRiddWTLXvwv3Jzj0MM8wZidGxhEeWHfAh8OlhOK1oOtj/yS?=
 =?us-ascii?Q?QBWyD6Qjn2dV4IGzcJb47teDLTv4873vJhGIzD2CfUKnpYT+U8aQxrI452q8?=
 =?us-ascii?Q?miyTh8sSu+2SESot8bC3VX6aHBvM/zuCAOC0xmBKyYR3FrwTjAmzeymOF9HG?=
 =?us-ascii?Q?ftisthux+koPRFIisQZ5TyogjMEGb0FEQmPFh/s/e+JT/h5xCsOeZDuBJywh?=
 =?us-ascii?Q?wZSjFIw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bf48bad-71fc-4fda-a241-08ded8621f36
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2026 17:48:27.4623
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR02MB10144
X-purgate-ID: tlsNG-16d1c6/1783014511-C712768D-021FBCAD/0/0
X-purgate-type: clean
X-purgate-size: 1712
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,zytor.com,redhat.com,broadcom.com,oracle.com,kernel.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,amd.com,amazon.co.uk,infradead.org,outlook.com,linutronix.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:seanjc@google.com,m:corbet@lwn.net,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:kas@kernel.org,m:rick.p.edgecombe@intel.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:jstultz@google.com,m:skhan@linuxfoundation.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:linux-doc@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:dwmw@amazon.co.uk,m:dwmw2@infradead.org,m:mhklinux@outlook.com
 ,m:tglx@linutronix.de,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amazon.co.uk:email,SN6PR02MB4157.namprd02.prod.outlook.com:mid,outlook.com:dkim,outlook.com:from_mime];
	FORGED_SENDER(0.00)[mhklinux@outlook.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[outlook.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhklinux@outlook.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 044496FBA4F

From: Sean Christopherson <seanjc@google.com> Sent: Wednesday, July 1, 2026=
 12:32 PM
>=20
> Silently ignore attempts to switch to a paravirt sched_clock when running
> as a CoCo guest with trusted TSC.  In hand-wavy theory, a misbehaving
> hypervisor could attack the guest by manipulating the PV clock to affect
> guest scheduling in some weird and/or predictable way.  More importantly,
> reading TSC on such platforms is faster than any PV clock, and sched_cloc=
k
> is all about speed.
>=20
> Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kernel/tsc.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
> index 012321fed5e5..a146fc7b5e74 100644
> --- a/arch/x86/kernel/tsc.c
> +++ b/arch/x86/kernel/tsc.c
> @@ -283,6 +283,15 @@ bool using_native_sched_clock(void)
>  int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
>  				      void (*save)(void), void (*restore)(void))
>  {
> +	/*
> +	 * Don't replace TSC with a PV clock when running as a CoCo guest and
> +	 * the TSC is secure/trusted; PV clocks are emulated by the hypervisor,
> +	 * which isn't in the guest's TCB.
> +	 */
> +	if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC) ||
> +	    boot_cpu_has(X86_FEATURE_TDX_GUEST))
> +		return -EPERM;

Do a pr_warn() in the error case? Your commit message says to
do the ignore silently, but I wonder if that's a good idea. At least
for Hyper-V, the error case shouldn't happen.

Michael

> +
>  	if (!stable)
>  		clear_sched_clock_stable();
>=20
> --
> 2.55.0.rc0.799.gd6f94ed593-goog
>=20


