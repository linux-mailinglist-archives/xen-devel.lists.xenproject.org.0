Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4E4B3A698
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 18:40:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099671.1453463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urffu-0005a0-Qe; Thu, 28 Aug 2025 16:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099671.1453463; Thu, 28 Aug 2025 16:40:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urffu-0005WH-K8; Thu, 28 Aug 2025 16:40:34 +0000
Received: by outflank-mailman (input) for mailman id 1099671;
 Thu, 28 Aug 2025 16:40:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fCus=3I=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1urffr-0004ma-RN
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 16:40:31 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4b83012-842d-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 18:40:28 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by PA1PR03MB10844.eurprd03.prod.outlook.com (2603:10a6:102:48f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Thu, 28 Aug
 2025 16:40:26 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.9052.014; Thu, 28 Aug 2025
 16:40:26 +0000
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
X-Inumbo-ID: b4b83012-842d-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QdMixGTKM4nCZoewP+cnqLStwZkoyVS7gSOCmJFD6Uh/2r++Wq1FhixePwI61ZkRna5JxcovnUjWnEnhDyA/9NVPinJA2IOzetNOl3KI5/qXtAbNY5NbPePr+iEruLauPuHYWxZMwO6DdTKO6TtzrI6GulGDFUS/KdgNsEZEHFyU9HSHS2D26TEH/jVB5ZIwgSQUvFT7yrWC97KuSE+e1PryfTxYb9b9LVUMC44gd98B7rG8sWSD2mdEl/YrWdPee0rtqhuetWasiHWcJxc4TE0f9NLm8tlrhUA5AT+Ut43tpkDpLCMGMnwqHGJpxJORy3T67adkWgrBD+OuPMxebw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShcEtoWuhUl+psNNoff5agrR3HBStUEdIa2+C+P01lQ=;
 b=WfYr8RaongInOUIh1nTWRYOyS2hyyhod4gQIxkbuNE19ggn2nO3ZcTpOfZZCKB5zNgYZeUTdj7vSfOClaa1AqYIZG+4Vgpx63+Rt4ElxLxBxVkYT6apCMWD93YKNd2G0w4AlPDHtLKxBZq+4RuMtrTrH3Z6+3ik5E6Nev3oDLpgmZVs60h4NgFdZnQDn+5iSEr7HDpqOhtIOOD4NTWkWAhfBD5qoT5KJtsCElI3SNPCRDa9u77JLdKwjKdGKWUP+xzVvb4AJ2Matjqis2pUqNQl5hk4Kpw3BLFs2C1/Ey3U2RA54Vtgk0kBLzez90UyO1OJQkD9rUKAZeQ7kFCsIzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShcEtoWuhUl+psNNoff5agrR3HBStUEdIa2+C+P01lQ=;
 b=azCw8KmKa9z3yo5ZWAHIhbBzIqKiZKkZ5QuLLFDo8aoKLfGqlM31v+uNgU9d7sOwe3vCtXcVEfi0Y50If1NgBI4UJumQdzETDiSK7OqQjy0fKqDRvT9yUqNExL2tnE2Hsb4TZtvGiGdnzaFzNFIof1w545lFR9Y7ruSd6Njz0MmlHDbiSeV7hPSRVCAdjFByuGIEFNby7oFxWSyS1xn9iAjpDIQnEOvFlIMqe3N1MjuAFqVILWZ/TqkiUkaqT/CTLGpF0Zxbgn5CvGGAKXatvxnN5DIDdWEdqX6qAl9O/2Hbbw8fMp1/AiJv61ND0PsB62LmdMfBbJR+ovNoLVKnNg==
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
Subject: [PATCH v6 4/4] docs: arm: add docs for SCMI over SMC calls forwarding
 driver
Thread-Topic: [PATCH v6 4/4] docs: arm: add docs for SCMI over SMC calls
 forwarding driver
Thread-Index: AQHcGDp0tfvhJciRvkCRbdqW7TfbXw==
Date: Thu, 28 Aug 2025 16:40:26 +0000
Message-ID:
 <17e009a131e54ad68f0a182b1766d333cf1c63f8.1756399156.git.oleksii_moisieiev@epam.com>
References: <cover.1756399156.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1756399156.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|PA1PR03MB10844:EE_
x-ms-office365-filtering-correlation-id: 441a0f4d-ac48-4b90-61e6-08dde6519771
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?x/u69tCdDIgq/Dya+608ipHkkdaLudTHD//URKBBTRcmkcOg/gYXe1bmgz?=
 =?iso-8859-1?Q?cy4YQy1VP5vbjaiz/p9IOgeZuhHzqUL/4PPghPCEAvUFN1uJu8YyJOFzTH?=
 =?iso-8859-1?Q?3tfd1swYRExAMPBqQJppB1rOsvvLtCoDXksd6OLFj9Y7N8jOGsN2OHrViV?=
 =?iso-8859-1?Q?Z7dmN7DnGgHCKmLr4ta3Hpu5l1WZkcN1DUCgMBQiR34v5FWagnslIvu+UK?=
 =?iso-8859-1?Q?AeH0FUtf+n80dLvyLkgyNJ14wlYXrKDEmxQsiuNakTjDQzopwIWQeR8kZl?=
 =?iso-8859-1?Q?56qeXpaFms12DaQt4ZCKOb4xYVxVvhUkh57tqH5tRRdA1w4OrSmbKfSd2R?=
 =?iso-8859-1?Q?Kqt0tfun/RCszdkQBWyag/FY9T/Uy0AJ2XPxXjpd5dnFqDxtuWjJ9rfaxy?=
 =?iso-8859-1?Q?xaxWn6T/ZbvK45FZj3za3VB1NGPROs42O5BuYM7Mq8BfMrcdOLQMPvt/hX?=
 =?iso-8859-1?Q?wZfrRf4dCldwRRSNOUIVcg+mdR/sxb3OQd84Bs0SNqrc5IHpVHD3PRV2yN?=
 =?iso-8859-1?Q?bHsQSo+1fzxOj6No4GYpjvPX0VlDhNEsTd8ZqBN06byu1KdiQbu8WJKIOF?=
 =?iso-8859-1?Q?obBPGGKZXcwV6TJlEz4fZoF3HAdTNoDY6/wctkkpZCreBHcRpTTBRSkZ/+?=
 =?iso-8859-1?Q?yutO9V1dD7FlwhX4TELzeE3bV90WI4SRtDOoamN81t70ITPvL+E7zxmTiI?=
 =?iso-8859-1?Q?c4AYuqoeTa/jMJ/uG/jwI9vLGx4EIMrNZBQjih/VyyPN1HQ5k/E43wDDBz?=
 =?iso-8859-1?Q?3B7fbGpXqZdahKWXwFsfQZky3ymS7j6U9upILXKBco+KSDExXrDA7XG082?=
 =?iso-8859-1?Q?Gv6F/ahjwycT2wMf3I6Tm/jn4QpC/fnd6NuBP/8BON6VnSzEgFdziwybdl?=
 =?iso-8859-1?Q?zRwL5ovmg5KNsEwSrEfgnePJ9Iz8p0c2/sG2T0anXAPjjVVGZFfJMFfmTP?=
 =?iso-8859-1?Q?JXlhIm+O5A9mQz1VAVBQIL0r61qVw2pCwN4QMBJ+y5xW529gVUBKemulIT?=
 =?iso-8859-1?Q?IqxGexRra167kcS8UbZguMnjpr6Sbq2on09ywhjg7FPdz1cJa4EqTgjNg/?=
 =?iso-8859-1?Q?pcQBtsZ2KOkj8Wn8W78euTpSELTUdXDWcBmqxWxLGKaeObLNT1R7z+NZhC?=
 =?iso-8859-1?Q?1v6rp2l3s0SL877GaaE1yCzQ+gykAEhb2HHcTVEj//oOR3kUcEcrN1yBDp?=
 =?iso-8859-1?Q?ogg6I2nzz1GKT7d8sMnIyyFJnhUXRgH/ztRI6lkjEoNT5cfhtbCtOn4xWH?=
 =?iso-8859-1?Q?CLSmwFFn8Rd/a/gJlPgVjRosnB57qtbUNTJDfXejEAMiBMRTSNadJQmL77?=
 =?iso-8859-1?Q?hqHc4ih2oTyQGCu6aPAo2KaD+EhabboxLBHMLxqjyCpOYW8JMhQl2+kKE+?=
 =?iso-8859-1?Q?KkEwIy98LS3CGV48VQ/qLKjPKSH+bNAH6PJnWL3Ef/uQZ1tO/foWZk34m/?=
 =?iso-8859-1?Q?UGOZTcTn97wAlew/oIw6FW2xVhCzTY5ABiv3Ah9/sQOiUDzp9cprNDum6W?=
 =?iso-8859-1?Q?8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?c1DglysEbtLpEkFfmvN9MzsN2Ftp2s+BEuWaAhJ04W9dzw+2bCNRFo32bM?=
 =?iso-8859-1?Q?zekORw+QmRKcjm3K38i5kh2jsFUsFFgidgE/0SvS4XJveLX62TsEJh6MjK?=
 =?iso-8859-1?Q?59WIZ1eA0xW59MJtPuiPiiOFC+AgGeV7LZFy0aEAuYNZDjplDBagoIs+WE?=
 =?iso-8859-1?Q?VjGDBbkCHctKavjMTyLixKsZEaMkUSpCCMA18A1A30cmJ2chCFTIlYJ27Q?=
 =?iso-8859-1?Q?NsfEo/I2DNUlH5I2H+1vaZHG+0j5lqYZOJrRC7IOaDlB8x1Xm9lZhX/q3t?=
 =?iso-8859-1?Q?EE9/anuEo1vSWiKRUVZoboZFlFxJYF1+fmwa8+94MHjxWvF3Y5KlbfQUNp?=
 =?iso-8859-1?Q?cswymkXrdIPIK0A4WBI8bagV1fifccEurI8394Z2Qq2C1raIMfewuULpjx?=
 =?iso-8859-1?Q?3kNzDs9d3+jEJlOcWNigQmT4w2+Jzh8wGjjh43Dm5BzV4LyZjrihDUkr6Q?=
 =?iso-8859-1?Q?6UrMR98MjQvaMkCW1lJivLuf/dRctrpccDLbeoZ5lLUBbn7jb+IPkFxpSt?=
 =?iso-8859-1?Q?OBxt/SW7qz3vSMcyEn3bYjFZIFXMW/X8ZDkTKIl0iezvElK7DQXKTTlI9S?=
 =?iso-8859-1?Q?pAcSKfZ+P8amlQbdxJye7YAfA2NawJghKVkkFqhXFm28Hc/pmVwCF0Gvkw?=
 =?iso-8859-1?Q?guKev89oTk6gGW2CxSEJF6XJinxUh8WZ6Mm70/qHyXIwYvbgJrDTZTB+bY?=
 =?iso-8859-1?Q?DsPzLj0H+6WE2fG5j0ui+aOA1kx5jc8cA503zeCmsnmlW1YNsrWTzHHdGQ?=
 =?iso-8859-1?Q?+m6WXu2H6CBnHvIF3v14aXY8brkfdX/YkdMtF20O17rsE6B4PfLH3GdA9n?=
 =?iso-8859-1?Q?rZT1AvTvkp7rtrQKjTgDem+6MmXB/DUvfn7KUGwzmCoVoP43jWV4zIozH7?=
 =?iso-8859-1?Q?WNGojEZZPZ6aDp2jEJQc3JWGgHyglMHI91gE26XGVynNc6YiIuNbldP7Y8?=
 =?iso-8859-1?Q?u+LN0/cp+gurxyMBQVjTsDj40EMxqiOWWiSExnVjftbn9FstrE9YfhCG6P?=
 =?iso-8859-1?Q?ULmz0JY0/Koz3bhdw9xuJd9d9VE+7Tu4+RmAYT2TnDimI8B0hGqLE8uAKu?=
 =?iso-8859-1?Q?/q2/hgHSPPZHyqUNbDJcI9V7+BZ1cM3bq32fEnbSxrymIEm02MLD/dc035?=
 =?iso-8859-1?Q?7OG3AoL203AtKcQC4wPnKNkCUZY60BFcDpa51DjgRs5Iht6KXl73I69XiE?=
 =?iso-8859-1?Q?uQxstF71kG462t+jy2cv2RY1ewqmzRBX3iCu+Kc8qHLwEbogqmShTHsecz?=
 =?iso-8859-1?Q?Ucsxs7K0sFHvnpoo0ipoIIfFoaedOvo2Y7cwiZwyzTtrUGpq5cmRLUoUPC?=
 =?iso-8859-1?Q?6NTH6BzkhY4gFmkUPJ4utheYoQyGiq1W2xSjkFwW3BJp5jNXtzkcwXFhhV?=
 =?iso-8859-1?Q?2qGzsanqQ5Fm1u7QvSIylg23l6UPqvdlm33cmkL3ql0zFR9I50jD3muP9x?=
 =?iso-8859-1?Q?wBviFXMFmT76l8PwYthHlwhhD2ET8Q4VGYhLedGh7DG0gHTJO1OGrg9ANa?=
 =?iso-8859-1?Q?1GVhUEXlc5Wdt4vhIg2T5lQWiIHch+opIVG8KDpAMIHmdgKbx9eoVOeUYS?=
 =?iso-8859-1?Q?WSn9EQbEIFbme2a7nEwoiG1APPhFnYTZPnKBc6ZznbGvQL85Ncm0JP9GBE?=
 =?iso-8859-1?Q?lWwRKtG+76A5A7wJ7Qgv9pCnt06nBGr0r2/bxiVOm3S7PdDMdQZGijOQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 441a0f4d-ac48-4b90-61e6-08dde6519771
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 16:40:26.3874
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Kr1sJfpq6XKiRDHJAbdOD89e0DCjyyxLTRTsOFpB85D7MfYe5CynoFW/4suBvFlgE7lzR7RCNG4roVLh+kgQ/gRBVA5/jKxtetKebX/SzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB10844

From: Grygorii Strashko <grygorii_strashko@epam.com>

Add documentation section for Simple Arm SCMI over SMC calls forwarding
driver (EL3).

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Changes in v6:
- add link to the scmi bindings used in the doc
- remove mentions about HVC calls from doc
- rename cmdline parameter to scmi-smc-passthrough

Changes in v5:
- rename dom0_scmi_smc_passthrough in documentation

 .../arm/firmware/arm-scmi.rst                 | 180 ++++++++++++++++++
 docs/hypervisor-guide/arm/index.rst           |   9 +
 docs/hypervisor-guide/index.rst               |   1 +
 3 files changed, 190 insertions(+)
 create mode 100644 docs/hypervisor-guide/arm/firmware/arm-scmi.rst
 create mode 100644 docs/hypervisor-guide/arm/index.rst

diff --git a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst b/docs/hypervi=
sor-guide/arm/firmware/arm-scmi.rst
new file mode 100644
index 0000000000..4394c95431
--- /dev/null
+++ b/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
@@ -0,0 +1,180 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+ARM System Control and Management Interface (SCMI)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+
+The System Control and Management Interface (SCMI) [1], which is a set of =
operating
+system-independent software interfaces that are used in system management.=
 SCMI currently
+provides interfaces for:
+
+- Discovery and self-description of the interfaces it supports
+- Power domain management
+- Clock management
+- Reset domain management
+- Voltage domain management
+- Sensor management
+- Performance management
+- Power capping and monitoring
+- Pin control protocol.
+
+The SCMI compliant firmware could run:
+
+- as part of EL3 secure world software (like Trusted Firmware-A) with
+  ARM SMC shared-memory transport;
+- on dedicated System Control Processor (SCP) with HW mailbox shared-memor=
y transport
+
+The major purpose of enabling SCMI support in Xen is to enable guest domai=
ns access to the SCMI
+interfaces for performing management actions on passed-through devices (su=
ch as clocks/resets etc)
+without accessing directly to the System control HW (like clock controller=
s) which in most cases
+can't shared/split between domains. Or, at minimum, allow SCMI access for =
dom0/hwdom (or guest
+domain serving as Driver domain).
+
+The below sections describe SCMI support options available for Xen.
+
+| [1] `Arm SCMI <https://developer.arm.com/documentation/den0056/latest/>`=
_
+| [2] `System Control and Management Interface (SCMI) bindings <https://we=
b.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documenta=
tion/devicetree/bindings/firmware/arm,scmi.yaml>`_
+
+Simple SCMI over SMC calls forwarding driver (EL3)
+------------------------------------------------------
+
+The EL3 SCMI firmware (TF-A) with a single SCMI OSPM agent support is pret=
ty generic case for
+the default vendors SDK and new platforms with SCMI support. Such EL3 SCMI=
 firmware supports only
+single SCMI OSPM transport (agent) with Shared memory based transport and =
SMC calls as doorbell.
+
+The SCMI over SMC calls forwarding driver solves major problem for this ca=
se by allowing
+SMC calls to be forwarded form guest to the EL3 SCMI firmware.
+
+By default, the SCMI over SMC calls forwarding is enabled for Dom0/hwdom.
+
+::
+
+    +--------------------------+
+    |                          |
+    | EL3 SCMI FW (TF-A)       |
+    ++-------+--^--------------+
+     |shmem  |  | smc-id
+     +----^--+  |
+          |     |
+     +----|-+---+---+----------+
+     |    | |  FWD  |      Xen |
+     |    | +---^---+          |
+     +----|-----|--------------+
+          |     | smc-id
+     +----v-----+--+ +---------+
+     |             | |         |
+     | Dom0/hwdom  | | DomU    |
+     |             | |         |
+     |             | |         |
+     +-------------+ +---------+
+
+
+The SCMI messages are passed directly through SCMI shared-memory (zero-cop=
y) and driver only
+forwards SMC calls.
+
+Compiling
+^^^^^^^^^
+
+To build with the SCMI over SMC calls forwarding enabled support, enable K=
config option
+
+::
+
+    CONFIG_SCMI_SMC
+
+The ``CONFIG_SCMI_SMC`` is enabled by default.
+
+Pass-through SCMI SMC to domain which serves as Driver domain
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+This section describes how to configure the SCMI over SMC calls forwarding=
 driver to handle use
+case "thin Dom0 with guest domain, which serves as Driver domain". In this=
 case HW need to be
+enabled in Driver domain and dom0 is performing only control functions (wi=
thout accessing FW) and so,
+the SCMI need to be enabled in Driver domain.
+
+::
+
+     +--------------------------+
+     |EL3 SCMI FW (TF-A)        |
+     |                          |
+     +-------------^--+-------+-+
+             smc-id|  |shmem0 |
+                   |  +----^--+
+    +-------------++------+|----+
+    |Xen          |  FWD  ||    |
+    |             +--^----+|    |
+    +----------------|-----|----+
+              smc-id |     |
+    +-----------+ +--+-----v-----+
+    |           | |              |
+    | Dom0      | |    Driver    |
+    | Control   | |    domain    |
+    |           | |              |
+    +-----------+ +--------------+
+
+The SCMI can be enabled for one and only one guest domain.
+
+First. configure Dom0 to enable SCMI pass-through using Xen Command Line
+**"scmi-smc-passthrough"** option. This will disable SCMI for Dom0/hwdom a=
nd SCMI nodes will
+be removed from Dom0/hwdom device tree.
+
+**Configure SCMI pass-through for guest domain with toolstack**
+
+* In domain's xl.cfg file add **"arm_sci"** option as below
+
+::
+
+    arm_sci =3D "type=3Dscmi_smc"
+
+* In domain's xl.cfg file enable access to the "arm,scmi-shmem"
+
+::
+
+    iomem =3D [
+        "47ff0,1@22001",
+    ]
+
+.. note:: It's up to the user to select guest IPA for mapping SCMI shared-=
memory.
+
+* Add SCMI nodes to the Driver domain partial device tree as in the below =
example:
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
+                    shmem =3D <&scmi_shm_0>;
+                    ...
+                }
+        }
+    }
+
+Please refer to [2] for details of SCMI DT bindings.
+
+In general, the configuration is similar to any other HW pass-through, exc=
ept explicitly
+enabling SCMI with "arm_sci" xl.cfg option.
+
+**Configure SCMI pass-through for predefined domain (dom0less)**
+
+* add "xen,sci_type" property for required DomU ("xen,domain") node
+
+::
+
+       xen,sci_type=3D"scmi_smc"
+
+* add scmi nodes to the Driver domain partial device tree the same way as =
above and enable access
+  to the "arm,scmi-shmem" according to  dom0less documentation. For exampl=
e:
+
+.. code::
+
+      scmi_shm_0: sram@22001000 {
+            compatible =3D "arm,scmi-shmem";
+            reg =3D <0x00 0x22001000 0x00 0x1000>;
+    ->        xen,reg =3D <0x0 0x47ff0000 0x0 0x1000 0x0 0x22001000>;
+    ->        xen,force-assign-without-iommu;
+      };
diff --git a/docs/hypervisor-guide/arm/index.rst b/docs/hypervisor-guide/ar=
m/index.rst
new file mode 100644
index 0000000000..7aae4a0a03
--- /dev/null
+++ b/docs/hypervisor-guide/arm/index.rst
@@ -0,0 +1,9 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+ARM
+=3D=3D=3D
+
+.. toctree::
+   :maxdepth: 2
+
+   firmware/arm-scmi
diff --git a/docs/hypervisor-guide/index.rst b/docs/hypervisor-guide/index.=
rst
index e4393b0697..520fe01554 100644
--- a/docs/hypervisor-guide/index.rst
+++ b/docs/hypervisor-guide/index.rst
@@ -9,3 +9,4 @@ Hypervisor documentation
    code-coverage
=20
    x86/index
+   arm/index
\ No newline at end of file
--=20
2.34.1

