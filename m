Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MQyjF2ekRmpsawsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 19:48:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E36A26FBA34
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 19:48:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=XH98sYS0;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1352279.1609107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfLVf-0006PL-GS; Thu, 02 Jul 2026 17:47:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1352279.1609107; Thu, 02 Jul 2026 17:47:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfLVf-0006Nd-Co; Thu, 02 Jul 2026 17:47:35 +0000
Received: by outflank-mailman (input) for mailman id 1352279;
 Thu, 02 Jul 2026 17:47:33 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mhklinux@outlook.com>) id 1wfLVd-0006NX-Iy
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 17:47:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfLVc-00EjrA-F0
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 19:47:32 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mhklinux@outlook.com>)
 id 6a46a428-2eae-0a2a0a5409dd-0a2a4501ec4c-14
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 19:47:32 +0200
Received: from [52.103.1.13]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mhklinux@outlook.com>)
 id 6a46a433-400f-0a2a45010019-3467010d4978-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 19:47:32 +0200
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by LV8PR02MB10144.namprd02.prod.outlook.com (2603:10b6:408:18f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 17:47:27 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6%3]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 17:47:27 +0000
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
 b=gSn+/upNAJrnk7n/jLvrZH8A+EKxHEVv0SWT6UOtd9kvD6EaN+j9XA8qzA9NcTWd5yFp2p9ECeFXgA7HBIHPcw6Fl6D25Ipk5RFh/kQ3IX5XeweUHyDWJrjhHTy0tQvt3UxBVLNz4InTPH6ItWdzu9j1jMv9/dLRYuT+pkqUwe7cZaslp22Ujk5L0cRmWOpJDf5OYlTjKPedjPMwiA1+IZS399PlGh/dBe5voUyGlt8n1jvZwtKQeM6XX45eLLeT0XppqYSLu2Ubt/ORXn5bCqJN6Ze6tBFJZkSSMWJRaJbRMEwkl8ldAlefUzgDi/6sDFBxaqbDQOYGMw9tY6Ae2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/U4V13hwZGhvpkdmcDFMNobqvgip4Nea0yy3TPSYIXU=;
 b=ksEr7f9RhHMeKiJztHTt4Y6jklvB5/rXs8sziM4stDKlmB4ySXgMdxggyThAhYwyX9ZbdV4+2JfHpRlTSoK8Fpe0ocdC/AStfO0HoXzbssmd3y0vV5zX33GLFA8pRki1V1u0wmmLkvJC4wPGLnk1xML7Ihv7sNyeHX/dPvnfXC6kZfAVeQcw9vfFrPjX0rqK3CsCuQ9qb4hQocQ5il3hKKle4VE//Lb4Iq5LsARUzLUzYVf+/f7IzZZH1jNC3GGcCc1iUcBicyYKy76M8vHIWrNxGvWK3TQ/VaBKFIs52aLGrCYqtfm3NcZd/3wCP6ZCLWmSy+K9PExc2z+C8HauvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/U4V13hwZGhvpkdmcDFMNobqvgip4Nea0yy3TPSYIXU=;
 b=XH98sYS0dJjEqeyiWejkonzIYf66AGNfD4NPxx/eqqaEHr7NWC4itSdhkjxXiBywUEn0Qe55cYBg4VpBNR/xeqvZh6eY9kPWpmYkRJar++K8FkExWLHgf+UyA+rKb2L7AifOJApZhEfOp9erpb9vgD2ndpdC/D3BSp3cU4pfJBk3lUH22OaLMOprrkUHadg0BRHnNiaGyDNPRx6YILngX/K3fmLpuUYFB8Bl6Bc7ytnED0V/sF//aayztm0DuYk8x0SI35V2lisJXIiO+3hkUb3mguv2Jkd+jPfR05lqYDmHCqDtNS5i7dGRX28olPBb/RmCTcpZHye0EbX40M8Ynw==
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
Subject: RE: [PATCH v5 01/51] x86/apic: Provide helpers to set local APIC
 timer period in hz and khz
Thread-Topic: [PATCH v5 01/51] x86/apic: Provide helpers to set local APIC
 timer period in hz and khz
Thread-Index: AQHdCZBe6TYzIJYr/E2B6pv9f83kWbZago1g
Date: Thu, 2 Jul 2026 17:47:26 +0000
Message-ID:
 <SN6PR02MB41578D3C34AB283B892C27A4D4F52@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20260701193212.749551-1-seanjc@google.com>
 <20260701193212.749551-2-seanjc@google.com>
In-Reply-To: <20260701193212.749551-2-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|LV8PR02MB10144:EE_
x-ms-office365-filtering-correlation-id: 8a00adf4-ed81-48ed-ddee-08ded861fb20
x-ms-exchange-slblob-mailprops:
 LVbdfIC7uFA0GyAFqbKW0EprdbA2EYzU3cYeZ/aYpf+3yv7G/lcFWJP9wfJT3Dq57DaLrgkhDqJ2vgZCqdiCRIJ19cEqRknj6rpg6LHTipbc4xDgvVAkJ8HKHGisnQwrh3KvL4zs26qbcKpMP9PjggGt2NV4XStGOEFDzZuNamyyBijUY+O7kKWznDLctv6dGUJXR4NBNsKsJUY7N2vt10LLefGC9qN9cC2/UsL/bBxU8rZjEArpONcppmF3c2V/uk27/RNe93WaOuvv0wXt+voNWk2fMqJ89ZvY7G4Yh/9VnPWzTR7e9AjiNZ6HnHZxdP+u1TCNBr/vGZ6Pfed/9A0LiwHIYgyD1ilbMGRGWmtSzT6qT1hE67GhS0/oXAv7XzLZwWI1n8VcHyKN19cB6Oc8DOVow5S7UuyPVNVxUTi6Kw4K04uxMsIApYi/GyVe5CZHXr2/o3Zhd7Q/FRmsKxyvAJTWdNxp2DivvOWFDkEtZ8viIGlhlyv1xMdl5Lv5luNC0xY1DWkW13GycTnlpIsJ5TevNY59u7MSGsT6qd7u77vZJNoxFk6wQw3z1cmUl+jPLSkbN4lxBbdYMk3Bc8y3um2qgvxk4WTElrTHSFTgWrvrh7zYZHuuGgFgiz04mR6ktfwTSA1KzE+WVb9QfYuV9KAeRyFpV27GVESCgPGw3DNNOVc/bsNMnFHgsyBmqd8+VfZggKVWXHxam/DEEffBEM1eyje8k8Vo39sGtftt5ST9xz86sg==
x-microsoft-antispam:
 BCL:0;ARA:14566002|51005399006|19101099003|37011999003|13091999003|8060799015|8062599012|31061999003|41001999006|19110799012|25010399006|15080799012|4140399003|40105399003|102099032|440099028|3412199025|1710799026;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?peMOuPd68er2iuBIlvPe1FpE3avD7jemrANNs0NhGvaJrfYlTxTbu/H8uXg1?=
 =?us-ascii?Q?NNrfa6Nrk4M6KpZyLgYBu656L2r5Ifgi0ei28OgUHTdRDWqxloSru/zKPRgK?=
 =?us-ascii?Q?xH2WOrWQ/HjQGtczFrSdGvogN+IeGusA/TQL74aBMwzgzJViWITZrxoYIBHp?=
 =?us-ascii?Q?n7sYMT2VJMOBzuA0TzVyChWb4cSvztuv/m0/vIkopp1DVb9Oa101dTN4ItgH?=
 =?us-ascii?Q?AgtUg94Cqv6+o0iRpjq4XrNwFL/YPWmweB+Ae2zJKMpgO0ATCmhXRXaXXDVA?=
 =?us-ascii?Q?0/FwYpN+dOgN0BALPK3IWub4IxVI36N9hb4QhRdEHVxUdxSmGVozr4g5cYFI?=
 =?us-ascii?Q?2OBf3lruU8SZiSn1V7pF7NgMLGpj4jAQhx7m8qwUIshkR1/TPBsvRzZsKmQ2?=
 =?us-ascii?Q?oC9ht8w4Nib6hOWl07bSTetcV0swX8j1FIYlthKdgUeqGQ7uoiYINrRRDRXl?=
 =?us-ascii?Q?ESeS276omrEdz2lJAYXbFErxU/G0leXrOGHVXNci2i4DVaF7IznaUqpxbcuw?=
 =?us-ascii?Q?jCXsf416h/u0jWGSAh7ckYczBoT9VqlSv9AVHULbapWveKirnSZtsGbpvPGQ?=
 =?us-ascii?Q?7GdClRCaEYfcgdBZpDyMx5w9qLx7s2pKjvPtCzd8ksr/h3SOXk5F06XqDkKT?=
 =?us-ascii?Q?OjoL4nBw6b9l8ZelwJX7e2aYGxbvHvhScxG9UOYcA8X7TFaw7LlfZBfEz+iH?=
 =?us-ascii?Q?6SuFJ/Iw7fkMXganMFObKMyY1wdDrKxFGXuBTpUbWFSM00c10MJ92LZjeIHI?=
 =?us-ascii?Q?/ty0LiP+ZhFerfWVwyq3SJxev1xyvU3pTIb7xUUT+AujbPhJ8mbZjDKjc1hP?=
 =?us-ascii?Q?brBYZHZj1cKoawpkh+U9DuFWb4eXZAww6rRsv+vY3DN5iFv4yT5apCxxmnWq?=
 =?us-ascii?Q?ypgMQk3FLlnJpWJMLfHOpunIwzTGHAxMIKoyGOrPORkVMN2jchdYZD+PjjOx?=
 =?us-ascii?Q?9KeC6X7TN+Annkybz9T1cgzhKyRcULulACNvcI36AE+Os8/F1IgYgvvg/wtm?=
 =?us-ascii?Q?LI9Gtpgy8dR+dE36bXPvdS1K2QTWpUXyHE2j9kj/GlU2R+t7QWKcTXGiZwxQ?=
 =?us-ascii?Q?XKHnKTWZ?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?XV/LB4nUK5W2uqNGw2+DJZYQaEYI1lVpWtyir20MVFp+xOnXOezB9mOnwfWt?=
 =?us-ascii?Q?eWv0WvajOIgLD6OWDKzqH1wyM4TD2DKNplWEVIlyk6vBRwXJTSJ5ZLx2g6tE?=
 =?us-ascii?Q?7gZQgUEFkgw/vSfr2Eq+xxztw3cfYnmWoDZNjQJJPfqhVborUWcB5mR/YrdI?=
 =?us-ascii?Q?9drt1+O1mN+gyQ52LgX1hpTGDXOjPeqYEhccT7nb+7srQhPFqRn1T9z+JSis?=
 =?us-ascii?Q?88ieDllzG7Yiklw7mPQOyhCxK90doRezcj4OxaKAj8uhDaS9phWPjFLDUMG+?=
 =?us-ascii?Q?PCPnlaKRZ5/xPBjpMwIG+G+IcCBRgL+JLeQjXfvXHQ3H21FWSV9fcB3uJn2l?=
 =?us-ascii?Q?gEMUXKv111C9ojwhYQLfJZF4hkHmLaUui6g9JWx0iRz9dw1QIHREvGt+IeNp?=
 =?us-ascii?Q?YS6SYyl9MoH1ZOyuiGn+AdRSmZKx7gHi/oYZWDS+MMAQItV+S1cx+WPeoEsP?=
 =?us-ascii?Q?ldc/lhmdQaiCicDXLgpoVRjP66YYK2o+D4BLw1N7e0pY9hDcZF8+KaOU/npQ?=
 =?us-ascii?Q?MeG8T5BTVnyUaVjsc1fPx7ABGTGqKdKl7pRCUsA901eps7DVeaBnp7Ahoks4?=
 =?us-ascii?Q?l36F9Ie2GkYSmb8M62m7RxRdbw27U5BgGMCxYBnIpSwB0vKo56guMScsYyUz?=
 =?us-ascii?Q?d4ovntZA6Z3cfJBUZmqYWfKMeEzy1snPAi3jrrOskQZlu7aMQwVRX2NlXkNe?=
 =?us-ascii?Q?vXpEn/JYCzCGquVScbVa6NF700q0M2JyRWeP/PhUcie0PF5IDqCEkuasqaGG?=
 =?us-ascii?Q?9erURcOyzC3kKABockUZ+kGOsNVbcTIfKuQBU+3wH8xmkJLnh/U8GyL0YE0I?=
 =?us-ascii?Q?NSTgOSmS3XZAPvl7EaZQ6TZPJpgwfeuUHFyHh191N3Q7WstfAavl1HNRMnLi?=
 =?us-ascii?Q?d/Mv9SXiLTj05T+r0wGUrmkfGMfKydAihTjnjVvg+stkKGXjtICWoXfstcjb?=
 =?us-ascii?Q?0OLVT86x3pYU1vnFvlWNcuZM1/IfeIM9jCf1ZU11tIcZxCSpt0jrqA7+W9uo?=
 =?us-ascii?Q?SACY/ntosJF5kBkzp4JTg0rRQ1gkP1uJyPZ9trEpTU+UaU/bdInhb9nzw7gM?=
 =?us-ascii?Q?IvtFftmHn7l93SwkoNxwjTdXq/2bQa5cIwZEa3+0sSy0h398dxGZj7mnn9Dx?=
 =?us-ascii?Q?wX0uPOOTiug0q1vxgiqJpxMifqAiQpumi4zxOL2CbXvTIM9X6kLYJjdNhYsq?=
 =?us-ascii?Q?Hwv4Y1lTm6yKVRxy1UTNXO+Abzi/ncw3W+Y+PQya61q31wYkfUTDFldt3PM6?=
 =?us-ascii?Q?mpiXiUoKglCX8ELQG4hB5bih5q/yIYZq56Ca7ZNV7apWBsEQdEYOIlH/teek?=
 =?us-ascii?Q?FpIHE/zM5n3uunuYobC47I2CJp/+50Q5xUBK727khNabUOZ0Cyr42AtbyQC8?=
 =?us-ascii?Q?jbTSbIU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a00adf4-ed81-48ed-ddee-08ded861fb20
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2026 17:47:26.9688
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR02MB10144
X-purgate-ID: tlsNG-d62444/1783014452-D26C61E0-A8379AE9/0/0
X-purgate-type: clean
X-purgate-size: 6457
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[SN6PR02MB4157.namprd02.prod.outlook.com:mid,outlook.com:dkim,outlook.com:from_mime];
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
X-Rspamd-Queue-Id: E36A26FBA34

From: Sean Christopherson <seanjc@google.com> Sent: Wednesday, July 1, 2026=
 12:31 PM
>=20
> Add and use APIs to set the local APIC timer period instead of open codin=
g
> the subtle HZ math in a all external callers, and make lapic_timer_period

Spurious word "a".

> local to apic.c.  Provide APIs to specify the frequency in both hertz and
> kilohertz so that Hyper-V and VMware code aren't forced to lose precision=
.
>=20
> Opportunistically use mul_u64_u32_div() to harden against the possibility
> that the period in Khz is greater than 4294967, i.e. if the APIC timer ru=
ns
> at ~4.29 GHz.  As pointed out by Sashiko, 4294968 * 1000 =3D=3D 0x1_00000=
2c0,
> and thus a Khz period of 4294968 would silently overflow the 32-bit
> unsigned integer used by most callers.
>=20
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/include/asm/apic.h    |  3 ++-
>  arch/x86/kernel/apic/apic.c    | 12 +++++++++++-
>  arch/x86/kernel/cpu/mshyperv.c |  5 +----
>  arch/x86/kernel/cpu/vmware.c   |  4 +---
>  arch/x86/kernel/jailhouse.c    |  2 +-
>  arch/x86/kernel/tsc.c          |  2 +-
>  arch/x86/kernel/tsc_msr.c      |  2 +-
>  7 files changed, 18 insertions(+), 12 deletions(-)
>=20
> diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
> index 9cd493d467d4..cd84a94688a2 100644
> --- a/arch/x86/include/asm/apic.h
> +++ b/arch/x86/include/asm/apic.h
> @@ -63,7 +63,6 @@ extern int apic_verbosity;
>  extern int local_apic_timer_c2_ok;
>=20
>  extern bool apic_is_disabled;
> -extern unsigned int lapic_timer_period;
>=20
>  extern enum apic_intr_mode_id apic_intr_mode;
>  enum apic_intr_mode_id {
> @@ -138,6 +137,8 @@ void register_lapic_address(unsigned long address);
>  extern void setup_boot_APIC_clock(void);
>  extern void setup_secondary_APIC_clock(void);
>  extern void lapic_update_tsc_freq(void);
> +extern void apic_set_timer_period_hz(u64 period_hz, const char *source);
> +extern void apic_set_timer_period_khz(u64 period_khz, const char *source=
);
>=20
>  #ifdef CONFIG_X86_64
>  static inline bool apic_force_enable(unsigned long addr)
> diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
> index aa1e19979aa8..8d3d930576fd 100644
> --- a/arch/x86/kernel/apic/apic.c
> +++ b/arch/x86/kernel/apic/apic.c
> @@ -176,7 +176,7 @@ static struct resource lapic_resource =3D {
>  };
>=20
>  /* Measured in ticks per HZ. */
> -unsigned int lapic_timer_period =3D 0;
> +static unsigned int lapic_timer_period;
>=20
>  static void apic_pm_activate(void);
>=20
> @@ -796,6 +796,16 @@ bool __init apic_needs_pit(void)
>  	return lapic_timer_period =3D=3D 0;
>  }
>=20
> +void apic_set_timer_period_khz(u64 period_khz, const char *source)
> +{
> +	lapic_timer_period =3D mul_u64_u32_div(period_khz, 1000, HZ);
> +}
> +
> +void apic_set_timer_period_hz(u64 period_hz, const char *source)
> +{
> +	lapic_timer_period =3D div_u64(period_hz, HZ);
> +}

A string "source" argument is passed in, but not used. Is there an
envisioned future use? Also, this function doesn't output a pr_info()
message like the existing Hyper-V and VMware code does. I don't
know that the message is all that useful, though I do remember
one case where I was debugging some clock/timer issue when I
looked at it.=20

Michael

> +
>  static int __init calibrate_APIC_clock(void)
>  {
>  	struct clock_event_device *levt =3D this_cpu_ptr(&lapic_events);
> diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyper=
v.c
> index 185d4f677ec0..87beecec76f0 100644
> --- a/arch/x86/kernel/cpu/mshyperv.c
> +++ b/arch/x86/kernel/cpu/mshyperv.c
> @@ -646,10 +646,7 @@ static void __init ms_hyperv_init_platform(void)
>  		u64	hv_lapic_frequency;
>=20
>  		rdmsrq(HV_X64_MSR_APIC_FREQUENCY, hv_lapic_frequency);
> -		hv_lapic_frequency =3D div_u64(hv_lapic_frequency, HZ);
> -		lapic_timer_period =3D hv_lapic_frequency;
> -		pr_info("Hyper-V: LAPIC Timer Frequency: %#x\n",
> -			lapic_timer_period);
> +		apic_set_timer_period_hz(hv_lapic_frequency, "Hyper-V hypervisor");
>  	}
>=20
>  	register_nmi_handler(NMI_UNKNOWN, hv_nmi_unknown, NMI_FLAG_FIRST,
> diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
> index 34b73573b108..36f779dd311d 100644
> --- a/arch/x86/kernel/cpu/vmware.c
> +++ b/arch/x86/kernel/cpu/vmware.c
> @@ -424,9 +424,7 @@ static void __init vmware_platform_setup(void)
>=20
>  #ifdef CONFIG_X86_LOCAL_APIC
>  		/* Skip lapic calibration since we know the bus frequency. */
> -		lapic_timer_period =3D ecx / HZ;
> -		pr_info("Host bus clock speed read from hypervisor : %u Hz\n",
> -			ecx);
> +		apic_set_timer_period_hz(ecx, "VMware hypervisor");
>  #endif
>  	} else {
>  		pr_warn("Failed to get TSC freq from the hypervisor\n");
> diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
> index f58ce9220e0f..f2d4ef89c085 100644
> --- a/arch/x86/kernel/jailhouse.c
> +++ b/arch/x86/kernel/jailhouse.c
> @@ -65,7 +65,7 @@ static void jailhouse_get_wallclock(struct timespec64 *=
now)
>=20
>  static void __init jailhouse_timer_init(void)
>  {
> -	lapic_timer_period =3D setup_data.v1.apic_khz * (1000 / HZ);
> +	apic_set_timer_period_khz(setup_data.v1.apic_khz, "Jailhouse hypervisor=
");
>  }
>=20
>  static unsigned long jailhouse_get_tsc(void)
> diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
> index ce10ae4b298b..f9ecc9256863 100644
> --- a/arch/x86/kernel/tsc.c
> +++ b/arch/x86/kernel/tsc.c
> @@ -717,7 +717,7 @@ unsigned long native_calibrate_tsc(void)
>  	 * lapic_timer_period here to avoid having to calibrate the APIC
>  	 * timer later.
>  	 */
> -	lapic_timer_period =3D crystal_khz * 1000 / HZ;
> +	apic_set_timer_period_khz(crystal_khz, "CPUID 0x15/0x16");
>  #endif
>=20
>  	return crystal_khz * ebx_numerator / eax_denominator;
> diff --git a/arch/x86/kernel/tsc_msr.c b/arch/x86/kernel/tsc_msr.c
> index 48e6cc1cb017..7e990871e041 100644
> --- a/arch/x86/kernel/tsc_msr.c
> +++ b/arch/x86/kernel/tsc_msr.c
> @@ -211,7 +211,7 @@ unsigned long cpu_khz_from_msr(void)
>  		pr_err("Error MSR_FSB_FREQ index %d is unknown\n", index);
>=20
>  #ifdef CONFIG_X86_LOCAL_APIC
> -	lapic_timer_period =3D (freq * 1000) / HZ;
> +	apic_set_timer_period_khz(freq, "MSR_FSB_FREQ");
>  #endif
>=20
>  	/*
> --
> 2.55.0.rc0.799.gd6f94ed593-goog
>=20


