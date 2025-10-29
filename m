Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB5BC1AC83
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 14:38:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152769.1483279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE6No-0007El-UM; Wed, 29 Oct 2025 13:38:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152769.1483279; Wed, 29 Oct 2025 13:38:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE6No-0007D7-Rb; Wed, 29 Oct 2025 13:38:36 +0000
Received: by outflank-mailman (input) for mailman id 1152769;
 Wed, 29 Oct 2025 13:38:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Sed=5G=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1vE6Nn-0007D1-El
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 13:38:35 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90b4d70e-b4cc-11f0-9d16-b5c5bf9af7f9;
 Wed, 29 Oct 2025 14:38:34 +0100 (CET)
Received: from DB7PR03MB4140.eurprd03.prod.outlook.com (2603:10a6:5:34::10) by
 DU7PR03MB10948.eurprd03.prod.outlook.com (2603:10a6:10:5b0::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.13; Wed, 29 Oct 2025 13:38:30 +0000
Received: from DB7PR03MB4140.eurprd03.prod.outlook.com
 ([fe80::e16e:b655:974f:43f3]) by DB7PR03MB4140.eurprd03.prod.outlook.com
 ([fe80::e16e:b655:974f:43f3%6]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 13:38:30 +0000
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
X-Inumbo-ID: 90b4d70e-b4cc-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwJkG0afAR5cWdQ2hpNpTXjmQkX2JoujXqUFQJalxGbWAAAXf+r0TmHV2eMJ5MB0Y6OZXFUA+0CNiJi9tRFwYVP/WNYCLSzCFnHINFE7l0EWagLwZXIJ6cMpOmyjxkr5USIikxKe1jyFz+VobG5V/GR2dx8kOkezXQxB1b9JAIVX2PO9ZmDBXMpBubn1qD4ViWpxCO1OhpXO6Gqym017R7E3EHipHUImPyVCBA3AbY2An60Z0oKrSggs130PTxUYVJqsOA/kymfNAK4BhKmGSmpYWJPAy09oqyp3rW8SfoC0XdA0GHOOvUN5tRJV8mSOnVj9Kwbs8NesaQCV7XqA3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIbI4qbOf9rCB0d5CTNEPvbK++/EFYj/AMDKCJiDaBE=;
 b=P+KE9z4kQIwlKfNFfvRT+NlBbrBk8jq23KuIWQohJkWdI0QtXVtZSwnV0RgBl3SYsWY13gy4zKUIz+COVDV+qVyqAdU1FefDJyM88RsQeNC3IWrdlhhDCi+RSY+sNriUAYaM65qllpf0bvQ7AypLHtrRQTYkdTPyHSLjyzgOxGClteIogsD7kcnmWdf9vhqmJ8CtmECA8ygQb0XjmBnBKOlEppOsRXgop7OEJ4j+Hb/2IC1w7EZ9WefQFdxQaN6ZPNMhtC4BZCtmBIFjTSXPINfQ5OurZHvmelYqq6syNgCtffKMFbgKQkOarh4qoHu2tusJdF7nriDU1bZin5lJwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIbI4qbOf9rCB0d5CTNEPvbK++/EFYj/AMDKCJiDaBE=;
 b=Q2X1rO19TTnRZkgmnXsrsQbQOiEDraHo2a58H2JzWRQ8y2n7nSvikNpyCeqfrpchZnUxS/MLzWt5Yd8sxCkom/kQBr2isP2N8dotZc1hpfFtTd8X67SMhcOQQAvCmZim5PyjYhWsQ9/To2jnKm+tUGImkFzbpQ5Q6QeP3LMW0ZT2lt8z1RFExO/lU+RwKtYpKO4GN25VE+w1PtKHpbUkQ30ISmS4QCsv2RECMHfMjD+NzDjdc6qmhrevPqGFtK/dnwXfBpJGePtAJfx1rZkdrtVrAbHNquE5Yhi2pLBGVt/7no9mAxkt+3CIyQaREEg+LJEp3SFiFhsVZyKwFDTVJg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] kconfig: remove references to
 docs/misc/kconfig{,-language}.txt files
Thread-Topic: [PATCH] kconfig: remove references to
 docs/misc/kconfig{,-language}.txt files
Thread-Index: AQHcSNlQlJpHEC5jN02048Fc+YbROQ==
Date: Wed, 29 Oct 2025 13:38:30 +0000
Message-ID:
 <6f72dcebf5dbb69e9496b7f0ef96198e9bb9f1e9.1761745058.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR03MB4140:EE_|DU7PR03MB10948:EE_
x-ms-office365-filtering-correlation-id: eb6db9a1-6555-43d0-f824-08de16f072e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|376014|1800799024|38070700021|13003099007;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?lEifgVFZEZMObXX74LYpQmQKkNCMT3rRFsQlmoi89jjwxsk0H7HsICxqcE?=
 =?iso-8859-1?Q?/mDDaWdK+NA9A0a2+Nny2YWJIfKLmT3zF1GvgDbqzZrROAkfpqdtVrDKbJ?=
 =?iso-8859-1?Q?C0srN0N/5zYr/R85c5brJgpI/RqBBqNBrxh3K/FVYX+xF+iU3TfXHtmsxH?=
 =?iso-8859-1?Q?yTOjMrhAaR3OHG2As8xZuRhiEu4gLggusiHXAjFivA3tyA74JFezRNXfQf?=
 =?iso-8859-1?Q?vUd+H7xq3RiwhuYCGkaKEH9/FqiDQYAjgJ4tBa7Qm+LnjrBnACjJPKaidG?=
 =?iso-8859-1?Q?Sb0nCp2LNiS6E9FOh1IO9usy/DAQzpl+HO4coE2e0l8QB8P5litemXocWU?=
 =?iso-8859-1?Q?AwSgFixpOttgRcSwyX/CKUpUiHX7SHMHJifNnb/6r740Jw/xDPlxb1VAGZ?=
 =?iso-8859-1?Q?IrkCBLAMsnX6Xo2q6bFRGv3ZRisvbgK+mOHRl8NBtiqd5ShNoNbUSfyGKP?=
 =?iso-8859-1?Q?aGTyx3Vuq6IxmnGvS+pgFgcgEP5Bn5w04RG7MHwUSmx9WfyPp+M4DDTFhA?=
 =?iso-8859-1?Q?R34Z5CaK3mhKp2eELTloP29mStUOhRy0BaziZknnul/r9q+PpVoXrtZKvy?=
 =?iso-8859-1?Q?0dLooihEwW8nyGTvV3fNGVOcVy84CKtbAhplaRwne8sR9/BIJyMxVtFUNg?=
 =?iso-8859-1?Q?DLl/IecOvtHkCI+RHZIuP9OWcqttFPApdRq5YZfdUi1pQbnPPI0a6zM5dc?=
 =?iso-8859-1?Q?s0yXPiacoCzy4m6NMqze1rv9SudxPt86mj+SkEvqrmIJWaA3W8Kss+E68O?=
 =?iso-8859-1?Q?CDgu4JKTTqjbzNI+LcmrhntRqB7rySidaj1kAKbikOI67Ua//PFy+KQeZB?=
 =?iso-8859-1?Q?iw6LbAKOqHrRnZ03qlwCyk1KmE5L4IjvUSq2whIy7ZzXSmNYRxu6h7phcA?=
 =?iso-8859-1?Q?LHWCEdOGZzwLUxBWIugL8JPqn/OkGf2dK8jtRiQZVAJxWMcIx+UY8/CAz9?=
 =?iso-8859-1?Q?zK29TNNqhT67kz8unjkflI8issMCwOAm/whFEIUKpZFcL+vUlFsyuorlI5?=
 =?iso-8859-1?Q?NDNbpyhS3sCfN9DIxXbrXdHSNNa6YCRf9uYwRWG4LijsZOYZkAgKweIPDM?=
 =?iso-8859-1?Q?T1bjkqaN8JoqqTln9gTcCs4nrC5i0goJUuWoqKFKq5IlgjVIoxcf8oEdZ5?=
 =?iso-8859-1?Q?9s0rJ+JhNPhFXae3oejGlAb6h6q1+fgtcb7ndflTQF3ZP2hPQE12Fu+Egj?=
 =?iso-8859-1?Q?tKEilZb8OIugs2qTHfsz3/X3Bk1cGVZNlkLoaIt7WpRuJQ2ECKnf92IaNa?=
 =?iso-8859-1?Q?nop695gbBZaxEXoA5oyKJ8Nq+qs0r7HOYp4kTdAb7a+e+f0kUzT4X9e73C?=
 =?iso-8859-1?Q?yt0sYy0XS7V3EoHv+YhX1uqqcfAkLCkBuY0Hl2xx+Kg5bY8nrjv10WOXJl?=
 =?iso-8859-1?Q?tWRrxXypwl3YodSCTTxAPBbQgxQF5jhtk4VVLW7hII+GQSFLLMqgiBGGer?=
 =?iso-8859-1?Q?HPy2alFXbtZxS38ZWk+chISJ+gv1vXpbvsxvlo976SfViXs1mJiwlrG+qh?=
 =?iso-8859-1?Q?PeWOXY55yt9rP5WCF56TrMo+pEDfFkh+f9uBkZ5mg4+v9CM4zR8gczLD6X?=
 =?iso-8859-1?Q?6/SNCByujdpT0vISGKcpsRXfhzIm?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4140.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(376014)(1800799024)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?NUaoGDyALowzeYhunleO6FnByXVAHCxeupRz0F3dKSY1V7PNK/h2h9sNge?=
 =?iso-8859-1?Q?13Z7xAC+iMYGXLkpZbjdxKXQwItz5ll0gLqwliflikGfUVqxp+EN8Sm+XY?=
 =?iso-8859-1?Q?+2WPhiS/8uaHOng8rG7Wr2ABf15YIwMSa42pI2AozE41KMkxs/CrnC7yM0?=
 =?iso-8859-1?Q?1n6dgFijjFPacl2Se7w6CG3T5v/CqVq1xDdZGPdWNeSNMCzZajguOdfgYZ?=
 =?iso-8859-1?Q?6q0ud6DwSUazLv4x5EEGh7pIHvU5TavSw+dvr67xLRFWH+/aL/+EdaWuZd?=
 =?iso-8859-1?Q?zXatGRzpkt48FU84JhiUQTpFydPbI/Kr8I39bG3jFx3lSW4HHk76CECDa+?=
 =?iso-8859-1?Q?q1ntZbaf47WLoy9ykVqwrcjEOpxL4hF2rQAJdhzVMx4i/PQf4c5aZ7RlDO?=
 =?iso-8859-1?Q?eBi9ctom2vlY32x6Ngb8R703xYGb0rdtK4uUaeX1+2AvNfBzdYuc5G7g0T?=
 =?iso-8859-1?Q?qbU6gwhEE0CpZW9+Yl9DQooawfpnqjTqiiNhJGYVwHvdu7uPRsdSQruHHb?=
 =?iso-8859-1?Q?w4lTtuonM2q1VGlDHwSca1AQE4LzS4kttZobhgIoFiksERGgIdf6yEKPIn?=
 =?iso-8859-1?Q?m80KosR/IQX9t7L8ak4cIpfZVSEb+F4n/vznfga3j5NNCF8656wL2YxDc1?=
 =?iso-8859-1?Q?/5vujhxbX1OHu+u0ZE60MfmN8WDRnXl9eyaiLOkJ8U5XWMUhSRe/yf40V0?=
 =?iso-8859-1?Q?L8+AxZmPefJXwJXr7am4qQ3G84BYCZd8/hdXJgvYIDgNicBYkkwn2ORXpX?=
 =?iso-8859-1?Q?v1TPZV955KSANsel38uANabU4tVOX3xP6Y0Mx1PYFdGK7SLyRb3xkzhvZm?=
 =?iso-8859-1?Q?lj542rx7HODrByGoCFEOlxnYiJk0H88jiidIgYSUb2I8sMJ7sDKZpJ63Mo?=
 =?iso-8859-1?Q?ipLpmGGpn8PAJYMDSiqBu2VUgPWj3iW6Ma+QrIL7MjdbA79m77g2sU1u5x?=
 =?iso-8859-1?Q?QJPv5olxJrj0APCwunAwyG/7RH0gKQXv5qvAzCTgClGqf5cS3wkhin/HQe?=
 =?iso-8859-1?Q?as+9s1/MzuVnlII+vzBuzsvFYVXfK+hCWe7SW6d6NrK+1zQjweIfu6lOKX?=
 =?iso-8859-1?Q?VHLU5Ul6ajNjtQoZK1RTgIuN1hzWVKr6zNBPf2LVGZi8JhZtPgJyiz4krZ?=
 =?iso-8859-1?Q?pBHHWfgdzM6rtSvlpIP04wfP4tpUYn1vdKXzuwlAod/ztRO3gRadi4RyS4?=
 =?iso-8859-1?Q?1ua4CdfJMSlsdTi7ay3WvEGo0a6I1P35jWytuH5TUNimycmz0HxGWHZSO1?=
 =?iso-8859-1?Q?/cbBsj/N7LVhUSTqd7jz/xRyaW1mUNPb5zioY3vj/+b9BWq0YLdUbKPCbQ?=
 =?iso-8859-1?Q?BLpH5K5ATMBmi2KTksDNz9P6gOu5a+y7KrFI4C/yKQMFwsQ2efZdusEEWY?=
 =?iso-8859-1?Q?Otj55ajoGdQAyxt74Qp40sz+cFeeMe6YscPitdKqoONZEYDyRyoNOFV9QM?=
 =?iso-8859-1?Q?3uhizyDZA62g/gJ3HldZEw5+J2PTkFyzTnHOao4rbJ5Y5pX3y9BREVz1QN?=
 =?iso-8859-1?Q?KUI+Xgtg+jMRLcCoLM+gR/3JQCL1FGfxnGLEZb4ipYTNYSQ+hnfl/gYz4u?=
 =?iso-8859-1?Q?rRGcjcOz+zI/zRYMpVhEzCRhHN05A3DLFSr67yVeI2CKyKn4JBv01+lUoY?=
 =?iso-8859-1?Q?60W9sidXbF+THTtPe5rgKdMcu+1tKDotA6BtG+fkG8V2tQlfGw5AlnJw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4140.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb6db9a1-6555-43d0-f824-08de16f072e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2025 13:38:30.8369
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FoB1WnR1vT7jcBM3R4DC2wpWohMxJvj1xxhG40QjxkD3GLPIPcz2hQYgz7IboOPhMIMbgbpbS3urxgEyYVO6l5OCOdlRTMb7V49NzK8Yi0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR03MB10948

These files 'docs/misc/kconfig{,-language}.txt' were deleted, but
references are still present in Xen. Remove them to clean-up.

Fixes: f80fe2b34f08 ("xen: Update Kconfig to Linux v5.4")
Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 INSTALL     | 2 +-
 MAINTAINERS | 1 -
 xen/Kconfig | 2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/INSTALL b/INSTALL
index eadf108aa5..fbf7bcbcf1 100644
--- a/INSTALL
+++ b/INSTALL
@@ -23,7 +23,7 @@ Xen Hypervisor
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 Xen itself is configured via a `kconfig' system borrowed from Linux.
-See docs/misc/kconfig.txt.
+See https://www.kernel.org/doc/html/latest/kbuild/.
=20
 Note that unlike with Linux, and contrary to that document, you cannot
 look at Kconfig files, or the default or generated config files etc.,
diff --git a/MAINTAINERS b/MAINTAINERS
index ecd3f40df8..190da0cddb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -389,7 +389,6 @@ F:	xen/include/xen/iommu.h
 KCONFIG
 M:	Doug Goldstein <cardoe@cardoe.com>
 S:	Supported
-F:	docs/misc/kconfig{,-language}.txt
 F:	xen/tools/kconfig/
=20
 KDD DEBUGGER
diff --git a/xen/Kconfig b/xen/Kconfig
index 07c4accf88..444b022699 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -1,6 +1,6 @@
 #
 # For a description of the syntax of this configuration file,
-# see docs/misc/kconfig-language.txt
+# see https://www.kernel.org/doc/html/latest/kbuild/
 #
 mainmenu "Xen/$(SRCARCH) $(XEN_FULLVERSION) Configuration"
=20
--=20
2.43.0

