Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13633B4A99D
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 12:09:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1116144.1462584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvHs-0002h8-1K; Tue, 09 Sep 2025 10:09:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1116144.1462584; Tue, 09 Sep 2025 10:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvHr-0002eQ-Ta; Tue, 09 Sep 2025 10:09:19 +0000
Received: by outflank-mailman (input) for mailman id 1116144;
 Tue, 09 Sep 2025 10:09:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=noAm=3U=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uvvHq-0001My-EZ
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 10:09:18 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bb086af-8d65-11f0-9d13-b5c5bf9af7f9;
 Tue, 09 Sep 2025 12:09:17 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DU4PR03MB10645.eurprd03.prod.outlook.com (2603:10a6:10:58f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 10:09:11 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 10:09:11 +0000
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
X-Inumbo-ID: 0bb086af-8d65-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpdVPZseqiZb+jjjCmdhSOSUKkKUnoQB7hOYBSiWtFt2QpA0IFYKXov6mha4LvYecu18cA32W6o4tvglZMxP2AcOObUQ/EngQtwiNTH+/Mkp7KbV25j1jjHfM37BtBgBprPdKk9J9QWvI/R3iezuJ68IgF43PQr9OndILzHiFJ0vUAwXVR7DFcJlQMgMiEG7weBF0GELlVbA0R8gJl+9Z1OEaJdhih6+ounPJGmqNcjP7nDGtKNZLTGiVBTXoea6PO/wRZDNTzMOKC+OjsgOlpfiz+Zky6XxBz5I9KHdpxhdmTM0Rk7Yw0e/exPWzYnogzB7TnzoWX5Fp1l7bKyuYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4PYhi77IQgahxEQTGPMvFa33vUCsdzd8Q2rC0SD60M=;
 b=nNDO4Mndavx8auNyc5cxs5fG8MOcapr6C1PrOjeYwrJYrtq2wRmrUzuqK41i2qSdspn22pTgk9RhaSdXdjzlRdIezRahnrqBq3nqBOV41r5ke49eWZW6arsf6T2omgWPUGjvjeYBP9ObOZxN37zNlrZJ+dRXn5VQY1P9kwn0FPwDkCzVoMZdt2tPJ0kVTQkl7+CBTnbOoG90n3PTnv3ExB2GoFn/wMhZiILI9CvBkB676YcmWKxpwhC0uedwVPwjZJ250nbOnaHSjqNlLmquQW5tTQqXjPw12CZn1lNItlcx/VnwIYUTsPIUeRit0S2wSBUk79bF6SoLAOOa9CqLRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4PYhi77IQgahxEQTGPMvFa33vUCsdzd8Q2rC0SD60M=;
 b=DlqRnzhKdTwkqtpKyBwK0wm4rDiwiefLyLb6shumhhF83aIc4DoD3YWUklTM5b21coArLMUYj5sH7cYsTM0qr1ufMHoYrV93ae6MtNAJVQG1uOIXEYtXsI3xcXGKjvyX1jlxLlPZzzdimjsa3ggyI94VkNJeDEiCodwA4R3QN8EO4TxP8Ad2ESvDfznR9FOi16w6HWM3iQ3NqHic9aZbaIW9me102soNYjlp7aJR3ihVeeCsC+pTjrjk+dZkbDR6PLID1r1zRHQQx18GwHgAshOsp/QUc9uIg+8FYEkdniaaM4QtqrUqYKEK4Aq0hZ4wT/8il/trVr5xLwO/AdRPQw==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Subject: [PATCH v8 04/12] xen/arm/irq: add handling for IRQs in the eSPI range
Thread-Topic: [PATCH v8 04/12] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Index: AQHcIXHJOikwNnexEE+HQmODShsy3Q==
Date: Tue, 9 Sep 2025 10:09:11 +0000
Message-ID:
 <6e356dde3a90bff04bc3a8ec0a3a490780f55e0d.1757412099.git.leonid_komarianskyi@epam.com>
References: <cover.1757412099.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1757412099.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|DU4PR03MB10645:EE_
x-ms-office365-filtering-correlation-id: 5c274eff-0147-4b8d-e507-08ddef88ec2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Il8JF79mDwfX4ku2zNHNf51fVG5B8tZci+BBkTwK1J+Z5GO8Tc/hg8/n19?=
 =?iso-8859-1?Q?PjvpKO14/zHd2Z2eAGzL/TTbom+L0w9nXvV58HWWL10S1GZIyuO1hN0I1A?=
 =?iso-8859-1?Q?T8S2LiTv/MO/jhvmKyjKbmA8rIRWQq7ZTTbdwPA7Pz6CXcwU6LNOpmcVOj?=
 =?iso-8859-1?Q?uOcyOQKJllozQUcJwkQ59fwCpc5DKkN/b8RnmVSurP8uGRAPNS7lLC199s?=
 =?iso-8859-1?Q?lV6shwvxVg7+71LFYuKztoW+4T/1AF41KxzLR7B3WijdxYBsPvTqyAetZ4?=
 =?iso-8859-1?Q?aN5nGFJXX+0eLt0wzJ64STEIkMYmfxC2iTvWJwe8+98EwmYFYNVDIEzGew?=
 =?iso-8859-1?Q?sUtuiWsH6KQe8bb5sZubgOQq7RE4NsGypNLNOdw61h57hGum/Fo7owpaDx?=
 =?iso-8859-1?Q?xfXziJ03fwzDhEDvt5hZnk9iTUn+dsQsf9BYUeb2lqfRKLEtO8gBTh6Vld?=
 =?iso-8859-1?Q?PV6B3k31iT1dNmm5NJaxFA6LxxqLX2kF6MPrZmwW/pdAbMzGM5pyRkkbwE?=
 =?iso-8859-1?Q?2Y2S7/sTHqzhBSWT0+ae639ghUqa5eRXpqXogkK5KroYhukXTSnHtyeTg2?=
 =?iso-8859-1?Q?T0uC1i9Ln50LgzG5oAZljzSEdBTfYcm7YtpMVDyyWwDwDuglBVXeScgHum?=
 =?iso-8859-1?Q?ZD2t4HiDTx4o3J86ncG9q0sZwanbx70F7mgbgUP8GUZ+DSorhkK9H0Bfqk?=
 =?iso-8859-1?Q?RKj3bzILJMQGNapYdCwUyNE7jbXpEIyVyl/ACxwkvRxRr5JA+4Uut+ghXc?=
 =?iso-8859-1?Q?idYc7EGysfnXU+qYdt1jENFKl7VFtCJbrMPX3daZtchPprq93Lh9L5K0+v?=
 =?iso-8859-1?Q?QI1LkVziuw8QIyOdqnXTAJ7PKxkbgvW4s6A54oi+0DU1ImRnsckvhjNv9N?=
 =?iso-8859-1?Q?X5/S0lKXKk+nOGHSBd2J7Y9BuINYjvEosfeMlcK80MmmoZK6e9M4Xk+QZG?=
 =?iso-8859-1?Q?2tcrie/rN1UfQsTe9/DvBwSZFjBoT8tlFuIQLzNgrBFtuwY0GOzddliKEV?=
 =?iso-8859-1?Q?MT0D4323dsDDI17lgv9w5rTfUzFu3QLv/dxUdyLK9EYbo4tM4IzxlFR76n?=
 =?iso-8859-1?Q?Haw3EmGASSKC3JKatoIMZ363WLKEDODAW4pHgGsBuJ3PKyMjZ/EmauRrzs?=
 =?iso-8859-1?Q?2dmW6RuyqiG+DrQxLcOj9IuxRph8l4KD4LeivuHXAseNhVk3zHPrS/WtmM?=
 =?iso-8859-1?Q?Z9BOhV/rhDz/EfJO1055tDGlKur9TlL3FYejQoB8lc1q0P+uZ0AC5tqWRi?=
 =?iso-8859-1?Q?8Xhc2DlE9UjpHUCEiGQvGZoemfqf6kFM6APZ9hscoqAWz7MlXGaPhMB9l5?=
 =?iso-8859-1?Q?/pO2VwmaIud6MmHdRVckQ/2R704PbcU3GsDxjf0Ftp7VJxAm3kpX4ZiYZi?=
 =?iso-8859-1?Q?4Q/x9E0tJHYfbzXx0mS1S5HnOhOMJHvki9I5+fzvwzp7op5Mub6u/3UUbT?=
 =?iso-8859-1?Q?SJ1RdcUIQ7J3HIlsZ4QsmA5mnEcG1eWB1iYVfeeraltPRnQXupogiH6WWk?=
 =?iso-8859-1?Q?zP2MNX6oKFexb/b7iIUu/Kk5P933+sfraCksWbMHDJl2Y/fRITYDDCQWAk?=
 =?iso-8859-1?Q?6/XgT0k=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?wrMFG8Rqi/tmDNRGpp1Hj+VWl27Et5p/PvdEX5w+6hsf9iqmR1oLGolocS?=
 =?iso-8859-1?Q?Nulw+2NaM9yOnpF2yA+RHAckBNA8Cn1I8d7Lg4s2SpIxn7wWib/MEX9NF0?=
 =?iso-8859-1?Q?KaE5kana0sHFHsvP8HLfRHsxWJYzp1eBzFpEp+M5K6NAP9S8j1PipgOiWJ?=
 =?iso-8859-1?Q?fF+bl3dLhiox+Kh/lNAiiDrriLR4H1GCkvDVhjMKKPpdCnZoSlFnExllZK?=
 =?iso-8859-1?Q?yIcHKW0ifuXtTHhZb2rycv6Da6abJXt3kzR7gaFVRq1mdiwLVSXRMLWtgV?=
 =?iso-8859-1?Q?/QywzHzdu3PSJ+/pvXTauZDiMhoyOHXIgPo0urozE3AYm95p+NnEm6JkJm?=
 =?iso-8859-1?Q?IGeMBM8SPEcQSn5blIGr4IH61DIztrQ6IkAa4+fTX9cS7Wo/K1bIwveWiO?=
 =?iso-8859-1?Q?Af+Zy+mbyGd9liLKkeHXuoFnKnfCzzac6ZxyimXwbBxgERKBIq97DdljAB?=
 =?iso-8859-1?Q?k08e+ER1sAIE2RCyemBntV9qbARpP1TlhTfofzas7b18yWoywXU9Y4xNig?=
 =?iso-8859-1?Q?OVsyQ/yIkijx08wxh9EHRXSNr2o0trVxMzZ8qGDO3LsqVlFGq0axhA1s1Q?=
 =?iso-8859-1?Q?A0NgXL7TdVT+twrK7E9EmFNyPpGJK6OfZLKyPtOuznqbENMq+qe2Aal7ML?=
 =?iso-8859-1?Q?TwUesVPq1vrQohqLaLcAms9cz45TfPW2NsO39evbAJR2ZRgoOWln4GLTG+?=
 =?iso-8859-1?Q?ho2/brhxQH9FXTxYV78Z7/g1jDCZhsXn3eYYtgH9igkrHpFbhU2wMEBWLz?=
 =?iso-8859-1?Q?A956ph2qWHZ8GWswWuriPuRsnQWwr25gR/XFPoMCiLAg0ChQuO68AbuuT+?=
 =?iso-8859-1?Q?OMr1hSF52D9aeCDRGjI/fdTFvReW3EV5bfQJfOsik1TUdGp/GVwdI/AfkA?=
 =?iso-8859-1?Q?XOiNbvJeon6r4J6S0Zy1oLzuoo8giKwjTaT5BqLKofvhFKaHBtrvdStAX7?=
 =?iso-8859-1?Q?Lld5WqgNdfBEEyJHjfiJ7zIHxAyY/yhoY7LBY8BrR3fP+htukH54EWq+uM?=
 =?iso-8859-1?Q?IHrVFhfcYQqUeK8dXhoJT89SXAHNHqQvTq193ch+FUWYT+dlS6D6QKt5xM?=
 =?iso-8859-1?Q?Av+wTeIbNvVgJLqboNid4eDTqqyJ+Lad96hxTXT3toTVR0h0CyjnFICxqd?=
 =?iso-8859-1?Q?Vskkv0afABb1R4S90LoMAfTqVyTAni2RnoTyShVmUbfb7l+a5rRULzcF+S?=
 =?iso-8859-1?Q?HhQ1r5oMtChR8XIAA9MC6LI0dTcrV4sjShbMYtkCWWsyetvbPN5qAI+xiB?=
 =?iso-8859-1?Q?ABjrWALm2u/qVpfHX4aDvtsFCZqnNhxtOc8pYzDBFfd3XbELTC5TMo+0MM?=
 =?iso-8859-1?Q?YxpmyvWFlkSAtaDFb7q6HmXiDmFwx4NrbFhOC3sGxGmwfpukgQx6gEaeyn?=
 =?iso-8859-1?Q?rKHvcOLqgSS7eNzvfZO3CN6gGeexLEM/tAOdVaitiS5zy/1Qg6ZWvMpFos?=
 =?iso-8859-1?Q?0IztBqz983B8KfRWHNiUmkAuxMgCtdAy19tMT6iVj7C4Jf+oF4CMDl25HK?=
 =?iso-8859-1?Q?DYiVUhpDmTcXGb6xH05kTFpcYjNRbE+GyhWtFlK0ZOugoe/QC6VNHZsKT+?=
 =?iso-8859-1?Q?BEBUEp2Gg3Z9tnXSZPGDgP0hlbvVc8gNP1zAYB/aaGF/3+QR6aCbrAjY8r?=
 =?iso-8859-1?Q?WqJnY0Gij3VZt6ViZX5EDY7SXz2yUVsFYDAIC8ZLYKqNuwSNPfcnae6tsD?=
 =?iso-8859-1?Q?RiR3cgCG2RwixZOi260=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c274eff-0147-4b8d-e507-08ddef88ec2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 10:09:11.3354
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +hD25DzUOQr2gMuzeT2+FKg4O7Pj6N8otL/cDPyR3qsu8PJKyOXf3pYIyKFHQ5x/B4PBYUqmo51m/Lys0X5skoUlS9/U/nLnyG+yeS6/1RQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10645

Currently, Xen does not support eSPI interrupts, leading
to a data abort when such interrupts are defined in the DTS.

This patch introduces a separate array to initialize up to
1024 interrupt descriptors in the eSPI range and adds the
necessary defines and helper function. These changes lay the
groundwork for future implementation of full eSPI interrupt
support. As this GICv3.1 feature is not required by all vendors,
all changes are guarded by ifdefs, depending on the corresponding
Kconfig option.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

---
Changes in V8:
- minor: fixed typo (s/asignmant/assignment/)
- minor: removed the non-relevant part of the comment
- fixed MISRA caution of 18.1 while moving is_espi() check under
  #ifdef and as a result avoid caution with overflowing index.
  Also, removed prototype of espi_to_desc() for builds with
  CONFIG_GICV3_ESPI=3Dn, as it is not needed now.
- added reviewed-by from from Volodymyr Babchuk and Oleksandr Tyshchenko

Changes in V7:
- fixed the condition in the is_espi assert for non-eSPI builds: the
  previous condition was mistakenly added with a wrong check and led to
  triggering asserts for all non-eSPI INTIDs, when it should be triggered
  in this case in the other way around
- minor: used is_espi() in the espi_intid_to_idx() ASSERT, as is_espi
  performs the same verification

Changes in V6:
- added an assert in is_espi() when CONFIG_GICV3_ESPI=3Dn to ensure that
  out-of-range array resources are not accessed, e.g., in __irq_to_desc()
- removed unnecessary parentheses in is_espi()
- converted helper macro to inline functions and added sanity checks
  with ASSERTs to them
- defined espi_to_desc for non-eSPI builds as a prototype
- updates the comments
- used the IS_ENABLED(CONFIG_GICV3_ESPI) macro to initialize nr_irqs

Changes in V5:
- no functional changes introduced by this version compared with V4, only
  minor fixes and removal of ifdefs for macroses
- added TODO comment, suggested by Oleksandr Tyshchenko
- changed int to unsigned int for irqs
- removed ifdefs for eSPI-specific defines and macros to reduce the
  number of ifdefs and code duplication in further changes
- removed reviewed-by as moving defines from ifdefs requires additional
  confirmation from reviewers

Changes in V4:
- removed redundant line with 'default n' in Kconfig, as it is disabled
  by default, without explicit specification
- added reviewed-by from Volodymyr Babchuk

Changes in V3:
- introduced a new define NR_ESPI_IRQS to avoid confusion, like in the
  case of using NR_IRQS for espi_desc array
- implemented helper functions espi_to_desc and init_espi_data to make
  it possible to add stubs with the same name, and as a result, reduce
  the number of #ifdefs
- disable CONFIG_GICV3_ESPI default value to n

Changes in V2:
- use (ESPI_MAX_INTID + 1) instead of (ESPI_BASE_INTID + NR_IRQS)
- remove unnecessary comment for nr_irqs initialization
---
 xen/arch/arm/Kconfig           |  8 ++++++
 xen/arch/arm/include/asm/irq.h | 37 +++++++++++++++++++++++++++
 xen/arch/arm/irq.c             | 46 ++++++++++++++++++++++++++++++++--
 3 files changed, 89 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 17df147b25..43b05533b1 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -135,6 +135,14 @@ config GICV3
 	  Driver for the ARM Generic Interrupt Controller v3.
 	  If unsure, use the default setting.
=20
+config GICV3_ESPI
+	bool "Extended SPI range support"
+	depends on GICV3 && !NEW_VGIC
+	help
+	  Allow Xen and domains to use interrupt numbers from the extended SPI
+	  range, from 4096 to 5119. This feature is introduced in GICv3.1
+	  architecture.
+
 config HAS_ITS
         bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORT=
ED
         depends on GICV3 && !NEW_VGIC && !ARM_32
diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.=
h
index 5bc6475eb4..09788dbfeb 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -32,6 +32,10 @@ struct arch_irq_desc {
 #define SPI_MAX_INTID   1019
 #define LPI_OFFSET      8192
=20
+#define ESPI_BASE_INTID 4096
+#define ESPI_MAX_INTID  5119
+#define NR_ESPI_IRQS    1024
+
 /* LPIs are always numbered starting at 8192, so 0 is a good invalid case.=
 */
 #define INVALID_LPI     0
=20
@@ -39,7 +43,12 @@ struct arch_irq_desc {
 #define INVALID_IRQ     1023
=20
 extern const unsigned int nr_irqs;
+#ifdef CONFIG_GICV3_ESPI
+/* This will cover the eSPI range, to allow assignment of eSPIs to domains=
. */
+#define nr_static_irqs (ESPI_MAX_INTID + 1)
+#else
 #define nr_static_irqs NR_IRQS
+#endif
=20
 struct irq_desc;
 struct irqaction;
@@ -55,6 +64,34 @@ static inline bool is_lpi(unsigned int irq)
     return irq >=3D LPI_OFFSET;
 }
=20
+static inline bool is_espi(unsigned int irq)
+{
+#ifdef CONFIG_GICV3_ESPI
+    return irq >=3D ESPI_BASE_INTID && irq <=3D ESPI_MAX_INTID;
+#else
+    /*
+     * The function should not be called for eSPIs when CONFIG_GICV3_ESPI =
is
+     * disabled. Returning false allows the compiler to optimize the code
+     * when the config is disabled, while the assert ensures that out-of-r=
ange
+     * array resources are not accessed.
+     */
+    ASSERT(!(irq >=3D ESPI_BASE_INTID && irq <=3D ESPI_MAX_INTID));
+    return false;
+#endif
+}
+
+static inline unsigned int espi_intid_to_idx(unsigned int intid)
+{
+    ASSERT(is_espi(intid));
+    return intid - ESPI_BASE_INTID;
+}
+
+static inline unsigned int espi_idx_to_intid(unsigned int idx)
+{
+    ASSERT(idx <=3D NR_ESPI_IRQS);
+    return idx + ESPI_BASE_INTID;
+}
+
 #define domain_pirq_to_irq(d, pirq) (pirq)
=20
 bool is_assignable_irq(unsigned int irq);
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index b8eccfc924..80befc2913 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -19,7 +19,9 @@
 #include <asm/gic.h>
 #include <asm/vgic.h>
=20
-const unsigned int nr_irqs =3D NR_IRQS;
+const unsigned int nr_irqs =3D IS_ENABLED(CONFIG_GICV3_ESPI) ?
+                                        (ESPI_MAX_INTID + 1) :
+                                        NR_IRQS;
=20
 static unsigned int local_irqs_type[NR_LOCAL_IRQS];
 static DEFINE_SPINLOCK(local_irqs_type_lock);
@@ -46,6 +48,41 @@ void irq_end_none(struct irq_desc *irq)
 }
=20
 static irq_desc_t irq_desc[NR_IRQS - NR_LOCAL_IRQS];
+#ifdef CONFIG_GICV3_ESPI
+/* TODO: Consider allocating an array dynamically */
+static irq_desc_t espi_desc[NR_ESPI_IRQS];
+
+static struct irq_desc *espi_to_desc(unsigned int irq)
+{
+    return &espi_desc[espi_intid_to_idx(irq)];
+}
+
+static int __init init_espi_data(void)
+{
+    unsigned int irq;
+
+    for ( irq =3D ESPI_BASE_INTID; irq <=3D ESPI_MAX_INTID; irq++ )
+    {
+        struct irq_desc *desc =3D irq_to_desc(irq);
+        int rc =3D init_one_irq_desc(desc);
+
+        if ( rc )
+            return rc;
+
+        desc->irq =3D irq;
+        desc->action  =3D NULL;
+    }
+
+    return 0;
+}
+#else
+
+static int __init init_espi_data(void)
+{
+    return 0;
+}
+#endif
+
 static DEFINE_PER_CPU(irq_desc_t[NR_LOCAL_IRQS], local_irq_desc);
=20
 struct irq_desc *__irq_to_desc(unsigned int irq)
@@ -53,6 +90,11 @@ struct irq_desc *__irq_to_desc(unsigned int irq)
     if ( irq < NR_LOCAL_IRQS )
         return &this_cpu(local_irq_desc)[irq];
=20
+#ifdef CONFIG_GICV3_ESPI
+    if ( is_espi(irq) )
+        return espi_to_desc(irq);
+#endif
+
     return &irq_desc[irq-NR_LOCAL_IRQS];
 }
=20
@@ -79,7 +121,7 @@ static int __init init_irq_data(void)
         desc->action  =3D NULL;
     }
=20
-    return 0;
+    return init_espi_data();
 }
=20
 static int init_local_irq_data(unsigned int cpu)
--=20
2.34.1

