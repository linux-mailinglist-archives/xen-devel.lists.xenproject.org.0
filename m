Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DD8B0D872
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 13:42:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052284.1420950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBNY-0003uc-FB; Tue, 22 Jul 2025 11:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052284.1420950; Tue, 22 Jul 2025 11:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBNY-0003rU-Ai; Tue, 22 Jul 2025 11:41:52 +0000
Received: by outflank-mailman (input) for mailman id 1052284;
 Tue, 22 Jul 2025 11:41:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibko=2D=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1ueBNW-0002RD-2p
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 11:41:50 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da7f7dff-66f0-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 13:41:49 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS2PR03MB10194.eurprd03.prod.outlook.com (2603:10a6:20b:5fc::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 11:41:45 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.8943.025; Tue, 22 Jul 2025
 11:41:44 +0000
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
X-Inumbo-ID: da7f7dff-66f0-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rz1JK0mAS7P6eGQkGhI1Aa5vL6HyrB6voNdvugAu9TC39BwjSmcXwJp9fPsI0j0LwUWJeACBzOP57Ip1rtxuNJnfAJWAHIEDEkxb63zn29ncR0LK9z5LnyCWxZINog0pHu3aLfYB/K8gXE6KZuu6p+hETjkK50/ZttFqJTe86TtBtMBW9G6GlBw7b/erqAOu1dVa2tjxagRiMnA9BL1W5eoEI7Kud9R078pyIEhcywalFyjkQ0HzQkCy63B3UDlAylyNWAcTT6LTxsPJhKKmWECKNiMTYyhKK24Yp54bE77FNhXb2kAPMvV6T9loX66eUqygu6kxKuOMn8/ip/sWWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtBHyckLFU+FReIE1TwgxoajvyZ0FNCU8yRZKhlrmvo=;
 b=s0jF1MiEOU9fvMCn9XRauzYwFr++JUNpwRXGaEu3O+zRufsWA+RTFjWvlkbJGGVGbLBSoVByPRk4NV67rhmrYpUIIWm+dvh2JDh4O8ACdB1Cxbmp1HVVKWTB8QKUdjm15wIxn8ff9yqk0l+cFIuDEDGOycx6UmKdbRl8OAtx/XT7MomlKzpuWDBh94GjI+j3m59KFuCfPiwYlEuevQKac6RyocMOF93TwVO7yTPJkF4mwhD0ndITvaBuFbd3k/+OjbZBEJ5t3HEMKhAOnk9hfX4RZnFH0tCq/JWAd723C2tLPW18xt5aTpESkdg3FUNfPduXKOl8kLSTHaYvvqDHog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtBHyckLFU+FReIE1TwgxoajvyZ0FNCU8yRZKhlrmvo=;
 b=AKzB+VCtz3M3cVhzlXnDm3S17Z37yR3n4BE6FMwKND4qvY7kjlzT80Gr8Z+MckKCc8tYRRGbWV9l9weU8EpvlOr/qlTWqn4b8/NP9zVoROTKbIhiDQ1QNT4xnylX8Rb4146Gblf2dKwWMxexMo35V9O3oyR4FDNycSwCF9H/P9jq+VvfecIQ/UcadZfjmuyiQwQbuKfAzzbN972G5j17Nnh2ila0zSD7tkj/N+pdxiGuJrvkWo6sDaKUQarkgAk5U9VMdTPbdjAC74mh93sOhSls2/k946bwF7oFPusu5bLk7T1SHB9BFgQRVINT/3zqjTCdoGw6x52Mqv6XnVTzdw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [RFC PATCH v5 10/10] docs: arm: add SCI SCMI SMC multi-agent driver
 docs
Thread-Topic: [RFC PATCH v5 10/10] docs: arm: add SCI SCMI SMC multi-agent
 driver docs
Thread-Index: AQHb+v2YthkFbL0cM0C5xOxn1VGgFQ==
Date: Tue, 22 Jul 2025 11:41:42 +0000
Message-ID:
 <79e357dbe97fbb8c8148e75fa65182e611665695.1753184487.git.oleksii_moisieiev@epam.com>
References: <cover.1753184487.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1753184487.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS2PR03MB10194:EE_
x-ms-office365-filtering-correlation-id: 7ef3e670-9df9-4e97-2eb8-08ddc914bb8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?fj7DONMXw4jrxu+iRCYeEpGPhPaoTSKO6HIX9bL1DeB7b/2VEWarU8yEzG?=
 =?iso-8859-1?Q?bC8OfOBarSAytmmHMmQ0gD/uzzdTjvPV6VwNqJeX4nW7ewNGpnu3IQsj4U?=
 =?iso-8859-1?Q?RvKVl4DAXHRQMLPxSZIAeapCw8SG7HdN+TpjtUzLYb8ik5gvCejyWP/1pf?=
 =?iso-8859-1?Q?k5K219qQDb8my+MGuKYCXCJiJaKPDA5oYDhKlh2L4nofPkuPWGiEohxSfF?=
 =?iso-8859-1?Q?3raTi+kOV/BFnmab1Aql0HfK0BCt0S9cdf0f9Y5LJxUId5mTh4ApKrT0ec?=
 =?iso-8859-1?Q?cvq7bY3ASXJbbxgthqJmaHXSBRHNtx1zjCn5VF5w82IcU/GfTekbIqPaUx?=
 =?iso-8859-1?Q?Xj6C4YI567Cj3gKo99YG4upHf6fDmbKJmhuZRIVkWE3zb9Ho8NdeuSn15V?=
 =?iso-8859-1?Q?Crh/XoNYVsLakQRATXFZfCCyXzKEkw5dUeEX+bgOA0A2hcozuOS4m1bx9N?=
 =?iso-8859-1?Q?QLkjuLpWIYhyhDPlilN7rz/6xiGi4CpN1MZTH/JiKA4G9iurYz1LMpe4Pg?=
 =?iso-8859-1?Q?pTPxmu6rHMQmH/USiOeamyGYSlVLgoQ9cT6jnwY9ZHGbdf6Athq1a0Jni+?=
 =?iso-8859-1?Q?ABdFssqvsUnonCTuokZc3lHCP0vqEXd0Y8dglDxioxFOmfPI6SbwU8BSfH?=
 =?iso-8859-1?Q?66SRwhOiZt6HuO9cOYoFSSZ4e9f5biftNtM+cmohkgXcZQd8M+S16II8Sb?=
 =?iso-8859-1?Q?A56kBkcpj9IqmJ4biuK0slyx7kYj0cgxZAkZEgUeXjqDVa/psivlCHTpAi?=
 =?iso-8859-1?Q?RNIl93C80yJfH5quy7iVSDLBPKPWmJDoibDC2uK9llQ2Fxc/FV+C8fVsJU?=
 =?iso-8859-1?Q?DZSpFXvsnE3ZoySdS1VwaF1baJts1Be3giaaOM9U28kua8UShYi0WijHqr?=
 =?iso-8859-1?Q?WEa7iLcLAluqhb6YU0FvUl6nsX1dgY+9PQ0jr9UWNmkJDinujqpXDEsICY?=
 =?iso-8859-1?Q?qNCcRYmeXbpBEJQxwvAxQYfWnfYEBXy3Q6kQ2rX10DzvaZuITDPAVDOlG9?=
 =?iso-8859-1?Q?+ag9EoDJ8SzM94qHZH/uRo1isa+t7pHdGrNsa+AYrbEhwXkNyJE9Oy9Skk?=
 =?iso-8859-1?Q?YFUqHpz5gbtaNz0YpHWK8cpGNV6hh7HmaR7SwVvttWsje5V98GhsG7tvOp?=
 =?iso-8859-1?Q?xjISdEJTE1bdD9JwBt7k44DlAa/INbHwEkXt1qC/gnAG43WL2f7qk15TeE?=
 =?iso-8859-1?Q?ZkXzzCi0N1aosTMBIZzSW7nQqAJjvqNPXCyuSVZh3hiJSdJDQ26/o5tE7k?=
 =?iso-8859-1?Q?jKUeNMAtVDcmkCeUmq6O6PA6xuGV8mO2zRKMOJ6/9PMpvMtDFRm8Yll9O9?=
 =?iso-8859-1?Q?lQ6xEb+I/CtmeV2wYCOwc+HM4rXVA8nJwKoktYYzSLpxm7GL7SqsBoKXpo?=
 =?iso-8859-1?Q?8sCDPpv5T/H7yszMh27Yo1R5vfk9cZP9tkit7DxbgiWJYnJA5wp7VsQvPA?=
 =?iso-8859-1?Q?j19tAWcJyGJL4zwTtgT3CKwhTzxLMRequRsEA5zJaLYAgbpk/IpO9UX0mj?=
 =?iso-8859-1?Q?A=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0TESWup1DPw23PB0uBS7nESjyYudP8+6r21EXNsHZM3Ia0iIBcAovzGa1/?=
 =?iso-8859-1?Q?ULVV9VsGTZVrKeTAuKBFH71RVTRBd77K6ozH8/jMD29YtEmG2WRZ32fpm+?=
 =?iso-8859-1?Q?eSxt/rAzo4x+NW2C1xpd1a3dO67Xiyu/B39EXW24HawUUD9oYv5Bl9TTf1?=
 =?iso-8859-1?Q?7qQ35XHtGPc7K203gkDWoihZZYm7D6jLjSnL2yFVlXcYKPgJeecyDhSAec?=
 =?iso-8859-1?Q?BYpxSJJIwxjnMkaZ3UtyWZ4zClifWM+w3FR6lgpOiuMTlCY2o3iyf7rO1J?=
 =?iso-8859-1?Q?diboAvRmJsaK/PD3Ad0WCxFycWNeMwY/63w1nfyUBsftCBTv76ZqNM3sYb?=
 =?iso-8859-1?Q?1EuuEU82lcId/02Y5LpsVpaBxfLoS5Y/ssauvRkWdPAJOaDxE33kU/fSpx?=
 =?iso-8859-1?Q?DOm+efeWewIqRXBnfPYy63QoaI3IfgB2VRsGb3GUDlvMVQ/ug8CAbRp7Kj?=
 =?iso-8859-1?Q?lNBmpUyxk9czvqQiyMaL6wAxy/FQXe0QSyTyNYQ4HyC67G0KshBA6ClDIO?=
 =?iso-8859-1?Q?iJq2V4+mtybXsencU20hV4X7XY2fADcdMyOpUwniCD9AT6lpwP56i+RCwE?=
 =?iso-8859-1?Q?GGJ3kXHSy+tsdzlFJ7a3sodTG5mu1V5SK6Bn4fwd6imrQjVVdK9Llz+YqL?=
 =?iso-8859-1?Q?vWNrL0cnzVB393FNPJvc80ov45fPFdzX1/NBUqi31oymeiApXdLZSRAk5s?=
 =?iso-8859-1?Q?5N+/CEgBHGOxnzbZjNqFWRkgtxgPBl94DWQQ9vX0E2/OCVCd/FNDgJRKe/?=
 =?iso-8859-1?Q?IRaP/LyJiuQO1MqYrM22Y/et4c0gtFcu+zyVvRcyamOtndsyGIpzE7yB++?=
 =?iso-8859-1?Q?6uISHO+hr8e1oJoGBZUq0+5xi/AXruB3GTCD7HxN77d+MShoioJ+9BN7ji?=
 =?iso-8859-1?Q?Jc/CdzK07e3HwTG73lpgEGZexj7bWPucv1OZ1hEuzfv3J7cjpGZW1NuM2f?=
 =?iso-8859-1?Q?ejvJI+PktmDxiSNLqmiwvsN6TLEeWJtQehbyTxVmWmdVQPQ2FX5tYeOnQo?=
 =?iso-8859-1?Q?ydwq8uyilbIV9bFxFpb1ZcKo+3adcmyJ+Gf3Rmxv/RD3s5vOfS3ZWDNECz?=
 =?iso-8859-1?Q?O27fZL5kS0KMzbwkNvcuWmYt6Dyxj+0fDnprL/uX9TqHS+7C3eB97qBOrC?=
 =?iso-8859-1?Q?4NzWaGeZWL+3qvfXxzTh1xbxKJi2ScdTFr1kU+saC2y7sJ9hCwvZnJq65R?=
 =?iso-8859-1?Q?v4moG9UWjXy3hJu3saKKNNSQpQppctlUQbtCYs1ODAv7EeSV0fRFWVVBsR?=
 =?iso-8859-1?Q?ZaOiTWkvIAevizwbIaDBe1OU7Evg5L5U75WEqbEH90YFMg44w+CgsSHAzN?=
 =?iso-8859-1?Q?Nhewb+OM4CKqDRb4eiASRWR/wmsDjQwQuht6YeCHzZBTG9HArjPIe8iKXs?=
 =?iso-8859-1?Q?3jdCxWM3n4fqyf4uOMHz2LCd1Qy02WRzSA+mn7DciO/qAp9jjcS3KUADSV?=
 =?iso-8859-1?Q?H1swmYNh17I6Z0v7w46ZM5tqKxTE8nzFEleLiW/w61gbqp4wXJMXYzfo30?=
 =?iso-8859-1?Q?RFm6tEhPb2WTFcQCK2sZLaaqWY99zZpyA5fCJb3YtiG4STHh0RataZACZ1?=
 =?iso-8859-1?Q?Bf74kJE1DK2Abtjtsszw6QtVcVDuRoz6JhvgEXbx6AgRNx+NtaIvVWSUso?=
 =?iso-8859-1?Q?/Ezy8ywbiLM10c4fqScO3J09gxBIUIUDTVpzaQWAHGKO8oXKcqc4zXIw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef3e670-9df9-4e97-2eb8-08ddc914bb8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2025 11:41:42.3906
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4EB9b0qqc71irp/A155wllLivhcpLt1s0WXthAOIAWT0QsuTfB/8lRR6TxGET1M51pj8FV6cKgpZuCecO+/9T+TgYERuTo5YqaauyLR+fus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB10194

From: Grygorii Strashko <grygorii_strashko@epam.com>

Add SCI SCMI SMC multi-agent driver documentation.
It includes a detailed description of the SCMI multi-agent driver.
This document explains the driver's functionality, configuration,
and the compilation process. The Xen SCMI multi-agent driver is
designed to provide SCMI access to system resources from different
domains.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Changes in v5:
- rework multi-agent driver to leave Host Device-tree unmodified

 .../arm/firmware/arm-scmi.rst                 | 341 +++++++++++++++++-
 1 file changed, 340 insertions(+), 1 deletion(-)

diff --git a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst b/docs/hypervi=
sor-guide/arm/firmware/arm-scmi.rst
index a084c0caa3..2ab56af879 100644
--- a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
+++ b/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
@@ -31,7 +31,10 @@ domain serving as Driver domain).
=20
 The below sections describe SCMI support options available for Xen.
=20
-[1] `Arm SCMI <https://developer.arm.com/documentation/den0056/latest/>`_
+| [1] `Arm SCMI <https://developer.arm.com/documentation/den0056/latest/>`=
_
+| [2] `System Control and Management Interface (SCMI) bindings <https://we=
b.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documenta=
tion/devicetree/bindings/firmware/arm,scmi.yaml>`_
+| [3] `Generic Domain Access Controllers bindings <https://web.git.kernel.=
org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetr=
ee/bindings/access-controllers/access-controllers.yaml>`_
+
=20
 Simple SCMI over SMC/HVC calls forwarding driver (EL3)
 ------------------------------------------------------
@@ -175,3 +178,339 @@ enabling SCMI with "arm_sci" xl.cfg option.
     ->        xen,reg =3D <0x0 0x47ff0000 0x0 0x1000 0x0 0x22001000>;
     ->        xen,force-assign-without-iommu;
       };
+
+SCMI SMC/HVC multi-agent driver (EL3)
+-------------------------------------
+
+The SCMI SMC/HVC multi-agent driver enables support for ARM EL3 Trusted Fi=
rmware-A (TF-A) which
+provides SCMI interface with multi-agnet support, as shown below.
+
+::
+
+      +-----------------------------------------+
+      |                                         |
+      | EL3 TF-A SCMI                           |
+      +-------+--+-------+--+-------+--+-------++
+      |shmem1 |  |shmem0 |  |shmem2 |  |shmemX |
+      +-----+-+  +---+---+  +--+----+  +---+---+
+    smc-id1 |        |         |           |
+    agent1  |        |         |           |
+      +-----v--------+---------+-----------+----+
+      |              |         |           |    |
+      |              |         |           |    |
+      +--------------+---------+-----------+----+
+             smc-id0 |  smc-id2|    smc-idX|
+             agent0  |  agent2 |    agentX |
+                     |         |           |
+                +----v---+  +--v-----+  +--v-----+
+                |        |  |        |  |        |
+                | Dom0   |  | Dom1   |  | DomX   |
+                |        |  |        |  |        |
+                |        |  |        |  |        |
+                +--------+  +--------+  +--------+
+
+The EL3 SCMI multi-agent firmware expected to provide SCMI SMC/HVC shared-=
memory transport
+for every Agent in the system. The SCMI Agent transport channel defined by=
 pair:
+
+- smc-id: SMC/HVC function id used for Doorbell
+- shmem: shared memory for messages transfer, **Xen page aligned**.
+  Shared memory is mapped with the following flags: MT_DEVICE_nGnRE and _P=
AGE_DEVICE, indicating that this
+  memory is mapped as device memory.
+
+The following SCMI Agents expected to be defined by SCMI FW to enable SCMI=
 multi-agent functionality
+under Xen:
+
+- Xen management agent: trusted agents that accesses to the Base Protocol =
commands to configure
+  agent specific permissions
+- OSPM VM agents: non-trusted agent, one for each Guest domain which is  a=
llowed direct HW access.
+  At least one OSPM VM agent has to be provided by FW if HW is handled onl=
y by Dom0 or Driver Domain.
+
+The EL3 SCMI FW expected to implement following Base protocol messages:
+
+- BASE_DISCOVER_AGENT (optional if agent_id was provided)
+- BASE_RESET_AGENT_CONFIGURATION (optional)
+- BASE_SET_DEVICE_PERMISSIONS (optional)
+
+The number of supported SCMI agents and their transport specifications are=
 SCMI FW implementation
+specific.
+
+Compiling with multi-agent support
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+To build with the SCMI SMC/HVC multi-agent driver support, enable Kconfig =
option:
+
+::
+
+    CONFIG_SCMI_SMC_MA
+
+
+Driver functionality
+^^^^^^^^^^^^^^^^^^^^
+
+The SCI SCMI SMC multi-agent driver implements following functionality:
+
+- The driver is initialized based on the ``xen,config`` node under ``chose=
n``
+  (only one SCMI interface is supported), which describes the Xen manageme=
nt
+  agent SCMI interface.
+
+.. code::
+
+    scmi_shm_1: sram@47ff1000 {
+              compatible =3D "arm,scmi-shmem";
+              reg =3D <0x0 0x47ff1000 0x0 0x1000>;
+    };
+    scmi_xen: scmi {
+            compatible =3D "arm,scmi-smc";
+            arm,smc-id =3D <0x82000002>; <--- Xen manegement agent smc-id
+            #address-cells =3D < 1>;
+            #size-cells =3D < 0>;
+            #access-controller-cells =3D < 1>;
+            shmem =3D <&scmi_shm_1>; <--- Xen manegement agent shmem
+    };
+
+- The driver obtains Xen specific SCMI Agent's configuration from the Host=
 DT, probes Agents and
+  builds SCMI Agents list. The Agents configuration is taken from "scmi-se=
condary-agents"
+  property where first item is "arm,smc-id", second - "arm,scmi-shmem" pha=
ndle and third is
+  optional "agent_id":
+
+.. code::
+
+    chosen {
+      ranges; <--- set default ranges so address can be translated when pa=
rsing scmi_shm node
+      xen,config {
+        ranges; <--- set default ranges so address can be translated when =
parsing scmi_shm node
+        scmi-secondary-agents =3D <
+                      0x82000003 &scmi_shm_0 0
+                      0x82000004 &scmi_shm_2 2
+                      0x82000005 &scmi_shm_3 3
+                      0x82000006 &scmi_shm_4 4>;
+        #scmi-secondary-agents-cells =3D <3>; <--- optional, default 3
+
+        scmi_shm_0 : sram@47ff0000 {
+            compatible =3D "arm,scmi-shmem";
+            reg =3D <0x0 0x47ff0000 0x0 0x1000>;
+        };
+
+        scmi_shm_2: sram@47ff2000 {
+                compatible =3D "arm,scmi-shmem";
+                reg =3D <0x0 0x47ff2000 0x0 0x1000>;
+        };
+        scmi_shm_3: sram@47ff3000 {
+                compatible =3D "arm,scmi-shmem";
+                reg =3D <0x0 0x47ff3000 0x0 0x1000>;
+        };
+        scmi_shm_4: sram@47ff4000 {
+                compatible =3D "arm,scmi-shmem";
+                reg =3D <0x0 0x47ff4000 0x0 0x1000>;
+        };
+
+        // Xen SCMI management channel
+        scmi_shm_1: sram@47ff1000 {
+                compatible =3D "arm,scmi-shmem";
+                reg =3D <0x0 0x47ff1000 0x0 0x1000>;
+        };
+
+        scmi_xen: scmi {
+            compatible =3D "arm,scmi-smc";
+            arm,smc-id =3D <0x82000002>; <--- Xen manegement agent smc-id
+            #address-cells =3D < 1>;
+            #size-cells =3D < 0>;
+            #access-controller-cells =3D < 1>;
+            shmem =3D <&scmi_shm_1>; <--- Xen manegement agent shmem
+        };
+      };
+    };
+
+    /{
+        // Host SCMI OSPM channel - provided to the Dom0 as is if SCMI ena=
bled for it
+        scmi_shm: sram@47ff1000 {
+                compatible =3D "arm,scmi-shmem";
+                reg =3D <0x0 0x47ff1000 0x0 0x1000>;
+        };
+
+        firmware {
+            scmi: scmi {
+                compatible =3D "arm,scmi-smc";
+                arm,smc-id =3D <0x82000003>; <--- Host OSPM agent smc-id
+                #address-cells =3D < 1>;
+                #size-cells =3D < 0>;
+                shmem =3D <&scmi_shm>; <--- Host OSPM agent shmem
+
+                protocol@X{
+                };
+            };
+        };
+    };
+
+  This approach allows defining multiple SCMI Agents by adding Xen-specifi=
c properties under
+  the ``/chosen`` node to the Host Device Tree, leaving the main part unch=
anged. The Host DT
+  SCMI channel will be passed to Dom0.
+
+  The Xen management agent is described as a ``scmi_xen`` node under the `=
`/chosen`` node, which
+  is used by Xen to control other SCMI Agents in the system.
+
+  All secondary agents' configurations are provided in the ``scmi-secondar=
y-agents`` property with
+  an optional ``agent_id`` field.
+
+  The ``agent_id`` from the ``scmi-secondary-agents`` property is used to =
identify the agent in the
+  system and can be omitted by setting ``#scmi-secondary-agents-cells =3D =
<2>``, so the Secondary
+  Agents configuration will look like this:
+
+.. code::
+
+    chosen {
+      xen,config {
+        scmi-secondary-agents =3D <
+                      0x82000003 &scmi_shm_0
+                      0x82000004 &scmi_shm_2
+                      0x82000005 &scmi_shm_3
+                      0x82000006 &scmi_shm_4>;
+        #scmi-secondary-agents-cells =3D <2>;
+      };
+    }
+
+  In this case, Xen will use the ``SCMI_BASE_DISCOVER_AGENT`` call to disc=
over the ``agent_id``
+  for each secondary agent. Providing the ``agent_id`` in the ``scmi-secon=
dary-agents`` property
+  allows skipping the discovery call, which is useful when the secondary a=
gent's shared memory is
+  not accessible by Xen or when boot time is important because it allows s=
kipping the agent
+  discovery procedure.
+
+.. note::
+
+    Note that Xen is the only one entry in the system which need to know a=
bout SCMI multi-agent support.
+
+- The driver implements the SCI subsystem interface required for configuri=
ng and enabling SCMI
+  functionality for Dom0/hwdom and Guest domains. To enable SCMI functiona=
lity for guest domain
+  it has to be configured with unique supported SCMI Agent_id and use corr=
esponding SCMI SMC/HVC
+  shared-memory transport ``[smc-id, shmem]`` defined for this SCMI Agent_=
id.
+
+- Once Xen domain is configured it can communicate with EL3 SCMI FW:
+
+  - zero-copy, the guest domain puts/gets SCMI message in/from shmem;
+  - the guest triggers SMC/HVC exception with agent "smc-id" (doorbell);
+  - the Xen driver catches exception, do checks and synchronously forwards=
 it to EL3 FW.
+
+- the Xen driver sends BASE_RESET_AGENT_CONFIGURATION message to Xen manag=
ement agent channel on
+  domain destroy event. This allows to reset resources used by domain and =
so implement use-case
+  like domain reboot.
+
+
+Configure SCMI for Dom0
+^^^^^^^^^^^^^^^^^^^^^^^
+The **"dom0_scmi_agent_id=3D<dom0_agent_id>"** Xen command line is used to=
 enable SCMI functionality for
+Dom0. if not provided SCMI will be disabled for Dom0 and all SCMI nodes re=
moved from Dom0 DT.
+
+Xen utilizes Host DT SCMI node to configure Dom0 SCMI Agent so the device-=
tree remains unchanged
+except for the Xen specific properties under ``/chosen`` node. If Xen devi=
ce-tree doesn't include
+``/firmware/scmi`` node or it's disabled, the Dom0 SCMI Agent will not be =
configured.
+
+.. note::
+
+    The **dom0_scmi_agent_id** value should match the ``func_id`` and ``sh=
mem`` in the ``/firmware/scmi`` node
+    to set the correct Dom0 SCMI Agent.
+
+Configure SCMI for for guest domain with toolstack
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+* In domain's xl.cfg file add **"arm_sci"** option as below
+
+::
+
+    arm_sci =3D "type=3Dscmi_smc_multiagent,agent_id=3D2"
+
+* In domain's xl.cfg file enable access to the "arm,scmi-shmem" which shou=
ld correspond
+  assigned "agent_id" for the domain, for example:
+
+::
+
+    iomem =3D [
+        "47ff2,1@22001",
+    ]
+
+.. note:: It's up to the user to select guest IPA for mapping SCMI shared-=
memory.
+
+* Add SCMI nodes to the Driver domain partial device tree as in the below =
example.
+  The "arm,smc-id" should correspond assigned agent_id for the domain:
+
+.. code::
+
+    passthrough {
+       scmi_shm_0: sram@22001000 {
+           compatible =3D "arm,scmi-shmem";
+           reg =3D <0x0 0x22001000 0x0 0x1000>;
+       };
+
+       firmware {
+            compatible =3D "simple-bus";
+                scmi: scmi {
+                    compatible =3D "arm,scmi-smc";
+                    arm,smc-id =3D <0x82000004>;
+                    shmem =3D <&scmi_shm_0>;
+                    ...
+                }
+        }
+    }
+
+**Device specific access control**
+
+The XEN SCMI SMC/HVC multi-agent driver performs "access-controller" provi=
der function in case
+EL3 SCMI FW implements SCMI "4.2.1.1 Device specific access control" and p=
rovides the
+BASE_SET_DEVICE_PERMISSIONS command to configure the devices that an agent=
s have access to.
+The Host DT SCMI node should have "#access-controller-cells=3D<1>" propert=
y and DT devices should
+be bound to the SCMI node using Access Controllers bindings [3].
+
+For example:
+
+.. code::
+
+    &i2c1 {
+            access-controllers =3D <&scmi 0>;
+    };
+
+Use domain's xl.cfg file **"dtdev"** property to assign SCMI devices from =
toolstack to the guest:
+
+::
+
+    dtdev =3D [
+        "/soc/i2c@e6508000",
+    ]
+
+.. note::
+
+    xl.cfg:"dtdev" need contain all nodes which are under SCMI management =
(not only those which are
+    behind IOMMU) and passed-through to the guest domain.
+
+Configure SCMI for predefined domains (dom0less)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+* add "xen,sci_type" and "xen,sci_agent_id" properties for required DomU (=
"xen,domain") node
+
+::
+
+    xen,sci_type=3D"scmi_smc_multiagent"
+    xen,sci_agent_id=3D2
+
+* add scmi nodes to the Driver domain partial device tree the same way as =
above (toolstack case) and
+  enable access to the "arm,scmi-shmem" according to the dom0less document=
ation. For example:
+
+.. code::
+
+      scmi_shm_0: sram@22001000 {
+            compatible =3D "arm,scmi-shmem";
+            reg =3D <0x00 0x22001000 0x00 0x1000>;
+    ->        xen,reg =3D <0x0 0x47ff0000 0x0 0x1000 0x0 0x22001000>;
+    ->        xen,force-assign-without-iommu;
+      };
+
+* For SCMI device access control configure pass-through devices in the gue=
st partial DT according to
+  the dom0less documentation and ensure that devices SCMI management has "=
xen,path" property set:
+
+.. code::
+
+		i2c@e6508000 {
+            ...
+			reg =3D <0x00 0xe6508000 0x00 0x1000>;
+    ->        xen,path =3D "/soc/i2c@e6508000"
+    ->        xen,reg =3D <0x0 0xe6508000 0x0 0x1000 0x0 0xe6508000>;
+    ->        xen,force-assign-without-iommu;
+        };
--=20
2.34.1

