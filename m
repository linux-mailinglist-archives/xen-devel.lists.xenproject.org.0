Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B93B1DD15
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 20:32:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073337.1436339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5Oz-0001Mj-Qo; Thu, 07 Aug 2025 18:31:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073337.1436339; Thu, 07 Aug 2025 18:31:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5Oz-0001E4-Da; Thu, 07 Aug 2025 18:31:45 +0000
Received: by outflank-mailman (input) for mailman id 1073337;
 Thu, 07 Aug 2025 16:59:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5oaB=2T=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1uk3xd-000773-BM
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 16:59:25 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de729565-73af-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 18:59:23 +0200 (CEST)
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AS8PR03MB7336.eurprd03.prod.outlook.com (2603:10a6:20b:2ec::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 16:59:21 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 16:59:21 +0000
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
X-Inumbo-ID: de729565-73af-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YyaKF9QaRa7MqtmUYgfjKKLs/ZZJujI7yOfLJw2wmxKIUINTrSUYPi0koxChrUAwq0cztICulF7sbJR00BJyzJGv2PfiFl92ycqvv5uiysMiFlJBZu3GEkSnxOV28unRmnqbqtVAWNoyXs0Z/BMkWfUEAcCv5gP+nZ716YL26safsEzFCPiTxClk/QY0J412nN9hbW1/Z8ESmts/1adpbt/ZuK9zPm7wqvjr/yTozkm6z1/RYMZ+thAvZ+UB+v0ttc1FpS6JuysBjQCqn3Ker18/VsDgV92TUusV5reg3Epr1go9lbPCbLyYV6pflB3yceXa7eR5IuPlpuxsEDNfvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68Lx4fYKL1tbLIfAe1PTz0kH1D8goLZ77LQnqJ/GQNI=;
 b=WRSDfGM+P0HL3VEDy4O+7YubluhxW64/+LEuxWSEt3ZMrxH62w41nVilQFDeP+JaQjUJ9RHlJPPfZ5YQjSRQpgT+X2tjcjKKYdPdmfHlMuS2caSY4hHDgnjTqBSTM2r8+cp5qghq2ywEDXzmqr3LpbQViP3F+osl4S1rT/42gGrPnxrf47hxhwVIL841mTuEapDu1go8OC3lj+3eQAzib3UW3t5pvW2IcH2u6kYmzA/B/mJLjD34ttNNOECiVvuDeoynp5sNX7gjG3F7woOhxoMjNNGQro3woD08l5KLDT5f7SwgFgSb8x2dYmsEpabw8GqFJcpQT1TZwP5IdZxOqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68Lx4fYKL1tbLIfAe1PTz0kH1D8goLZ77LQnqJ/GQNI=;
 b=HzFC/mSsMiCBiVsd8htYoPg8Z3kAkPDdrAEmZoBidWbrQKQV8GWP23LY3Sni7PWIcez9ULdwTL3rhzHKlQn2G6sw7hXQpo2JveTAl+d2JZlhDt40ofjQmxcCtQ8CVSQ53c0c02hRNbPp+PeiAJUuQ6eZa1nvXHCadWl45JYt/C1zb+ufMM9burz9k/NVLmNcPtlv7/vupMcBUgNlAv6tY5lwB7r9ktFZHMGlVkCSmk4lqrRfI/dFE53Uu+q70Cp8vxLmcRJoCdEnFbzqRzrfhJKCZqqP7C5Z7hsReo2ICMax/MGjUI5ZdQuOb3/7w1hH1kCVkIy1MlkcN2v/uGHYhA==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Nick Rosbrook <enr0n@ubuntu.com>, George Dunlap
	<gwd@xenproject.org>, Juergen Gross <jgross@suse.com>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH 06/20] xen/domctl: Add XEN_DOMCTL_CONFIG_VIOMMU_* and viommu
 config param
Thread-Topic: [PATCH 06/20] xen/domctl: Add XEN_DOMCTL_CONFIG_VIOMMU_* and
 viommu config param
Thread-Index: AQHcB7yeWtqOMnUc4US5ATSpbJFzIQ==
Date: Thu, 7 Aug 2025 16:59:21 +0000
Message-ID:
 <76c461a4af7c824bc9a3d0958733ddb12ee724b7.1754580688.git.milan_djokic@epam.com>
References: <cover.1754580687.git.milan_djokic@epam.com>
In-Reply-To: <cover.1754580687.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR03MB7136:EE_|AS8PR03MB7336:EE_
x-ms-office365-filtering-correlation-id: 3e2796bb-0ade-4324-bcb6-08ddd5d3c146
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?QCA/y03v3my8S98zN6F7XKkqts3vaCMR0jsLzbX8CH3uD1LXIfDgIWm6uD?=
 =?iso-8859-1?Q?mp1En9GAs53Ay7VwFrtEP+4whznZSqkD2NFCmuZZlNacKJUbHyNfbZENZn?=
 =?iso-8859-1?Q?Kxy7L8A27qd99xGMIPHy9KDxnzJ05OW8KePnAEg6QoGFg1KqORFj+vexAu?=
 =?iso-8859-1?Q?liwSpGq34/CD8MfDqZzbUKsUO6pDCJoT6Hcug0j31Af+Lpp7N6Ahcqr4La?=
 =?iso-8859-1?Q?YoHh99P6wMKBZmqV1+GR8NoEXr8iLw+MHO9EB2MMB9FZBRFdN4zzyd8fW4?=
 =?iso-8859-1?Q?1LFQ1xRTikSU8ryHqYsYqdH4uwaDQ6FoZZ39g7Aoo5qrwpKwEBJctfLLF1?=
 =?iso-8859-1?Q?ok7B/Gm9vS+WW+YesjsmB7JG7ZeqnUqareItYLO5jeGzQNqF6R60C086ex?=
 =?iso-8859-1?Q?6eFeMFz/1P7wPxcMWftGJvi5HvxGguGRDVQNWeYFvXcmVaNGoVcfkALiLU?=
 =?iso-8859-1?Q?R8HxiS/vhgIuhprp1EW6vE9i7UG9jyMr/0h2ocuTdqVJh8A6YEPVzk0E4+?=
 =?iso-8859-1?Q?jhViY2A0p4O86yMB0VKdxLL063KTj0psWCjd5l0CTeBUAhBgcLJEjz7Jcb?=
 =?iso-8859-1?Q?etpFHPfFhH6iTvQSuSpYTdKePpaQHQUcsSytyM/WJ9xGiu6gFQFcRbc1Gu?=
 =?iso-8859-1?Q?Efh0mZCO58IAhzIMcXPlzDJ1dB8LRzck/7/JU43rds8QxqFubWZDFECckX?=
 =?iso-8859-1?Q?C31mZbzo5hDHXAFRFf4Q42Six4+wA/hLMhsK/5GvRDZ4hQX8h6yp4UIGdg?=
 =?iso-8859-1?Q?iPNk3+KCxSLKLzM3hzxMDtQjAhoyga41FVlhe3ns8HrnhfFrBvpR9mbMOC?=
 =?iso-8859-1?Q?Hbkslnbfvuk3hbAXg+hughdCaGdMeR+QusL5W4W7FpsxxBY33QYWaggZ7C?=
 =?iso-8859-1?Q?308+tq6J44Pf7TJ8otJcCcAtbB2PRugOeLUPXwD1CF2wuXWk3hZJ/miQxg?=
 =?iso-8859-1?Q?hc2tmdX8NV3ufovWiyqc9FqVVBXstpzeiQoJUdzWQpz7rHb/zPEwJSK6Lt?=
 =?iso-8859-1?Q?GAHlyfPOqcHy4zTJ9AIWgFqII1mHFkT40vzVlF2CS323Zh3EqwsxblBMcR?=
 =?iso-8859-1?Q?0K2iryrBliYgt9/8Ls9npwbNS/77Vq1nzvqYGYcwn/TX40CHyMLsUM9oio?=
 =?iso-8859-1?Q?qAbqDwudL8sAV+mmBxwhQ8zrsOwNVy/4JqcQONiSH08wzNZoKhA60ZHOPl?=
 =?iso-8859-1?Q?s0AxIajhedS7U6SC1swGEcQ5sv5U6gumOnWnQNle5PwuiadMLOtmMk5kCm?=
 =?iso-8859-1?Q?XkZIWlWnkhEMmqlDA49F5fL0j0BaeZGtYH7lh6uByD7CwE3qgEvCTtzXDy?=
 =?iso-8859-1?Q?IET0jGWWoRBGra9RbN+Z8htOyOuBptCBxlkh53NIeERHL0V3PR2wAkblhM?=
 =?iso-8859-1?Q?rNO76/lhvQfO/Jo/soM2FottNZwSuh1fex746WU7vCe1BRZaa8ykds1XSy?=
 =?iso-8859-1?Q?ZdTLXkQLWNzOSa/OUvuU4wU8cFLhnSoTeeLTGH+GQlsHBskLZoLS4Z1m6m?=
 =?iso-8859-1?Q?c2efFXfWy5VDb5jtR3HKS9qcL5E241B2ZRk4LL6n8iUQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?D1JxLFcwcj5o9FdhXPHc3DJc88eBi1fblIItGhQJOxzBM7h9bMeKrhjCkc?=
 =?iso-8859-1?Q?xzL4S8G9t/7WV12o4c0IHi9uMlMVN78OaTKMQ1LCMoCdFdv5kpg0lIlgPL?=
 =?iso-8859-1?Q?0x/WjeTsSFguhovO7DceQ0vW4tPyfwc26NuM5i0/kH+DWSOcKAPzBdao9I?=
 =?iso-8859-1?Q?CfrqP4JaqmtNXxEL3BkwSf+czBnN5VPQh5eetq6v/5EyxYS0x1Hp6IK1zx?=
 =?iso-8859-1?Q?VnRK4B3d+LV2HOU4zWzpL3lMUFTIdgSnk+eRSMQzegrEE5bT4XZJP3lkT0?=
 =?iso-8859-1?Q?rw2+SEa9DEN5PCd1sqBbZvMrQwCIzoyMj+drnQdMUHfgUtCGGJamERh0v3?=
 =?iso-8859-1?Q?vbk77xOOaDcJbsYmQD/z3urpCx2nESObinRcWY229VioxbvErw78pR6qhi?=
 =?iso-8859-1?Q?1cfv/nc/gSzEcoKreezOaY8KFPbkYmAKXY+vrcGEavHIPG1LgnfYf0rgwA?=
 =?iso-8859-1?Q?LeCbzekrG3arkkUoCV//nO6jSj07JxavqT6BiORdFkKqPRwrMXjej47fa3?=
 =?iso-8859-1?Q?87xoFauEfciFvLGPisaA83HAAwmONf5+f6FrCFbzsd6zTqTmJ6nM7P2JH4?=
 =?iso-8859-1?Q?ji+uX805vxHJQlPfVOk10kt0KRA5a6SKpG6G/KRwryJBcQE9ZT73yQn/JW?=
 =?iso-8859-1?Q?1ZkKA0RGKBLsZ00PwM/A0lAWqkJQoLLHFgJ+3SuKk8xv7JPuHfSf935/3i?=
 =?iso-8859-1?Q?tGAyR0ae3SgzBV1I93EWZ9GJm1aZrAltSbDANOTbMKeTh0uDNVI0VpiPL7?=
 =?iso-8859-1?Q?NoLW3oHZQPYwPJw9i5t5Y6/aPag2dig3LXCJmgcLJfrrcvtshunsLh2bc2?=
 =?iso-8859-1?Q?TaiVz8seGYQzdxZ4NPzIo4E/v+PPWkAoiL/s1GQVOOqt80Jw+N67pFu9dX?=
 =?iso-8859-1?Q?7YDUKOYHpqqQOwt8+nbJSgsMmrNdPXdQwczvIy3p2VFNco8Gib6vm+YdEQ?=
 =?iso-8859-1?Q?GQwNJkZLR7hScf+M/PUS+5xLvpzPRYaE+CRVxSU5ZGEOISRf1IrkJ8Wvdr?=
 =?iso-8859-1?Q?4/JO9S9U3QoekAolmaul2tmsyuVKyKM6FVjxThFZJic9CtroflrOj/72mV?=
 =?iso-8859-1?Q?9zIiy/Hi2OJT0uPKzwLUQt0ntCd8c5JJmF3rHpDSwI1QmR5PZe2h7qjIiI?=
 =?iso-8859-1?Q?954t4ze11JVrjyvGJEu+W1gr6tI+D9SFJzCoprvnXGy46exTAiD55mkZGR?=
 =?iso-8859-1?Q?YHObHO9qsu+F8/ri0DQAjy5C+ElDseDxQpm85wIdTydlCvQkjEFRvt0eoo?=
 =?iso-8859-1?Q?mUeCUCe0Sb4q+pTbTkPdbu/wmyAwHk2evl0lEyR7N49NW8SzVVdAN43Xh3?=
 =?iso-8859-1?Q?0KkSnQi8z2zHX3/9004TpAmghbZfQdIhFdBM1mwuEyjJBU6daiO4CDhL5h?=
 =?iso-8859-1?Q?aQYrluVL4AGZW5uVxaIiqnsivcJHKQsOaEk2ykdqnLZ5apVibth4yed9Xl?=
 =?iso-8859-1?Q?vJJ7jUGaLvbD6jmlA82KiKee5Jsh5YkSHeO/T3J2eXVRlTgJUFesZwrFMW?=
 =?iso-8859-1?Q?RzUKVKo44l/yC7T3VTDTci7+Xolwc0oMTbFxYBrrycl9u0NC9gR7rYUQj2?=
 =?iso-8859-1?Q?E9dyJX7XHYZRu5d1OP7ryIuNLC/157VE3ROq+WnT2LwvhyWwvVQpLYuvnC?=
 =?iso-8859-1?Q?qxxo8UjKmLO/vFqnQYEzqEfEAZE4ex5AUz?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2796bb-0ade-4324-bcb6-08ddd5d3c146
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 16:59:21.3727
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2ORdUYyjCsDXmmxg+2nHqwmJgnmkYZipz8YThVl9ZpZiuI0lLf233zBtDllfNXkQhbvp0YlRcp0cxJvajzdzig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7336

From: Rahul Singh <rahul.singh@arm.com>

Add new viommu_type field and field values XEN_DOMCTL_CONFIG_VIOMMU_NONE
XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3 in xen_arch_domainconfig to
enable/disable vIOMMU support for domains.

Also add viommu=3D"N" parameter to xl domain configuration to enable the
vIOMMU for the domains. Currently, only the "smmuv3" type is supported
for ARM.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 docs/man/xl.cfg.5.pod.in             | 13 +++++++++++++
 tools/golang/xenlight/helpers.gen.go |  2 ++
 tools/golang/xenlight/types.gen.go   |  1 +
 tools/include/libxl.h                |  5 +++++
 tools/libs/light/libxl_arm.c         | 13 +++++++++++++
 tools/libs/light/libxl_types.idl     |  6 ++++++
 tools/xl/xl_parse.c                  | 10 ++++++++++
 7 files changed, 50 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index f0c920b39d..25e9be073c 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3125,6 +3125,19 @@ This option is only implemented for Arm where the de=
fault is enabled.
=20
 =3Dback
=20
+=3Dover 4
+
+=3Ditem B<viommu=3D"N">
+
+To enable viommu, user must specify the following option in the VM
+config file:
+
+viommu =3D "smmuv3"
+
+Currently, only the "smmuv3" type is supported for ARM.
+
+=3Dback
+
 =3Dhead3 x86
=20
 =3Dover 4
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/h=
elpers.gen.go
index 667030cbd7..23635afefe 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1163,6 +1163,7 @@ x.ArchArm.GicVersion =3D GicVersion(xc.arch_arm.gic_v=
ersion)
 x.ArchArm.Vuart =3D VuartType(xc.arch_arm.vuart)
 x.ArchArm.SveVl =3D SveType(xc.arch_arm.sve_vl)
 x.ArchArm.NrSpis =3D uint32(xc.arch_arm.nr_spis)
+x.ArchArm.Viommu =3D ViommuType(xc.arch_arm.viommu)
 if err :=3D x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err !=3D =
nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
@@ -1699,6 +1700,7 @@ xc.arch_arm.gic_version =3D C.libxl_gic_version(x.Arc=
hArm.GicVersion)
 xc.arch_arm.vuart =3D C.libxl_vuart_type(x.ArchArm.Vuart)
 xc.arch_arm.sve_vl =3D C.libxl_sve_type(x.ArchArm.SveVl)
 xc.arch_arm.nr_spis =3D C.uint32_t(x.ArchArm.NrSpis)
+xc.arch_arm.viommu =3D C.libxl_viommu_type(x.ArchArm.Viommu)
 if err :=3D x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err !=3D n=
il {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/typ=
es.gen.go
index e26b3cdfc7..23f5a300e0 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -599,6 +599,7 @@ GicVersion GicVersion
 Vuart VuartType
 SveVl SveType
 NrSpis uint32
+Viommu ViommuType
 }
 ArchX86 struct {
 MsrRelaxed Defbool
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 185f74d8a8..f985426ae1 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -313,6 +313,11 @@
  */
 #define LIBXL_HAVE_BUILDINFO_ARCH_NR_SPIS 1
=20
+/*
+ * libxl_domain_build_info has the arch_arm.viommu_type field.
+ */
+#define LIBXL_HAVE_BUILDINFO_ARM_VIOMMU 1
+
 /*
  * LIBXL_HAVE_SOFT_RESET indicates that libxl supports performing
  * 'soft reset' for domains and there is 'soft_reset' shutdown reason
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 4a19a8d22b..44b7bcd672 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -233,6 +233,19 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         config->arch.sve_vl =3D d_config->b_info.arch_arm.sve_vl / 128U;
     }
=20
+    switch (d_config->b_info.arch_arm.viommu_type) {
+    case LIBXL_VIOMMU_TYPE_NONE:
+        config->arch.viommu_type =3D XEN_DOMCTL_CONFIG_VIOMMU_NONE;
+        break;
+    case LIBXL_VIOMMU_TYPE_SMMUV3:
+        config->arch.viommu_type =3D XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3;
+        break;
+    default:
+        LOG(ERROR, "Unknown vIOMMU type %d",
+            d_config->b_info.arch_arm.viommu_type);
+        return ERROR_FAIL;
+    }
+
     return 0;
 }
=20
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_type=
s.idl
index a6030a2dbd..0c8d2c7156 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -551,6 +551,11 @@ libxl_sve_type =3D Enumeration("sve_type", [
     (2048, "2048")
     ], init_val =3D "LIBXL_SVE_TYPE_DISABLED")
=20
+libxl_viommu_type =3D Enumeration("viommu_type", [
+    (0, "none"),
+    (1, "smmuv3")
+    ], init_val =3D "LIBXL_VIOMMU_TYPE_NONE")
+
 libxl_rdm_reserve =3D Struct("rdm_reserve", [
     ("strategy",    libxl_rdm_reserve_strategy),
     ("policy",      libxl_rdm_reserve_policy),
@@ -725,6 +730,7 @@ libxl_domain_build_info =3D Struct("domain_build_info",=
[
                                ("vuart", libxl_vuart_type),
                                ("sve_vl", libxl_sve_type),
                                ("nr_spis", uint32, {'init_val': 'LIBXL_NR_=
SPIS_DEFAULT'}),
+                               ("viommu_type", libxl_viommu_type),
                               ])),
     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
                               ])),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 90c9386f5b..32236f7e5f 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2989,6 +2989,16 @@ skip_usbdev:
     xlu_cfg_get_defbool(config, "trap_unmapped_accesses",
                         &b_info->trap_unmapped_accesses, 0);
=20
+
+    if (!xlu_cfg_get_string (config, "viommu", &buf, 1)) {
+        e =3D libxl_viommu_type_from_string(buf, &b_info->arch_arm.viommu_=
type);
+        if (e) {
+            fprintf(stderr,
+                    "Unknown vIOMMU type \"%s\" specified\n", buf);
+            exit(-ERROR_FAIL);
+        }
+    }
+
     parse_vkb_list(config, d_config);
=20
     d_config->virtios =3D NULL;
--=20
2.43.0

