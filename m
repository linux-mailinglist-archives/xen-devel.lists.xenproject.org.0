Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C558B0FC99
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 00:17:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054787.1423427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uehmA-0007o7-Up; Wed, 23 Jul 2025 22:17:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054787.1423427; Wed, 23 Jul 2025 22:17:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uehmA-0007le-Rh; Wed, 23 Jul 2025 22:17:26 +0000
Received: by outflank-mailman (input) for mailman id 1054787;
 Wed, 23 Jul 2025 22:17:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VoQP=2E=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uehm9-0007lI-K7
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 22:17:25 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ced9b61e-6812-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 00:17:24 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DU0PR03MB8719.eurprd03.prod.outlook.com (2603:10a6:10:3ee::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.27; Wed, 23 Jul
 2025 22:17:20 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 22:17:20 +0000
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
X-Inumbo-ID: ced9b61e-6812-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KbZnbSoCTVNmh5/VEFnwsz+4KCa76jGljlPkbtzbdnhcl1tCokFzR6nugqedNLacfQAGU7/HfGHD8TO/Rcoj+aMXa+eF9bX4rGomxGGS/M31YkIfGjCcausYjaI/ygaglc2R020GNnx4gyKQSab9bDH6T3Suvu3Rsb1OVDFJol80/9H/KT94/9wvRr2snN96TLZgSgXPIlVvi1aCPUOtq6MJeewbzozKQZES1FX+BkKh101SmKl2e8prIH8f9U5ouRgOURwFH/oDefAiTOLDY+TfThmMvPsgJb/VTlHVvOE0TJg2sJjX4JYkB6bN9NK+NtWJaVUZPE+POtyI37Jx+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLVr/S3nC2+msn4ROijM8WQCJE4+QWcHPEDA241iRKc=;
 b=KVpxN7rE9Wme9CzOgJmQPe9Yeql5U6+rp0pmSgjUUqKnmDj1morXryH97PdTLRBAuZUhzi+1E5K6Wk43FJC9GVO96UzaXDAzTK9oH+QVD5NCoz9LWc6qzpDdDiTcn9Hm91DrVvD9Av3A4QZ5PZ0R/qzY7d+ASsvg3AaD16vREtJy+BCQP9FQGVIml34mEfPPCU3Z94C92AwERMYl2HeHTD59R3QFSJ4lykIGDOe6YRZKWK94xwn2/T5qMcKwZ6Bwz0XClYui6lxCHIhEdr9XyskRACuDhH22WAhSZy6qJmJDSVztLwXHZuIC9obpm2j2N75mejIUwEQePpRqb2jkng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLVr/S3nC2+msn4ROijM8WQCJE4+QWcHPEDA241iRKc=;
 b=d9F3/WPqO9Aawt+InTcRgMhfhy+BCozVBThhyTiljNIuJahXDU7PI7St1CgP3a6NLt35SYMIcl6F5HaVBmsuTJkInkwOInPuT1sB5yJ+JXnVx4ZA7CHna2+bZnJt84b8xLXagKexg3SgoXppFZgDIrqZEogtXa0VOfxqoQJi2vd1qrLzCc/MCVbajRrQPOStXRdUTYnlBsrsRtfT3eZklWJNgcY+Kjdkaws43OV9X8QLlfwYlnbcUQMawauqvlW5Bf/JjNkq9Y5S5lnuexBkxaWJAiVauaFpi6Akh4Z/GqDdip32PMelggqpHy/OOvflr/eCt30etUC/V+i/CGbOWg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3] automation/eclair: monitor rules 11.6, 17.2, 18.3, 21.11,
 21.14-16
Thread-Topic: [PATCH v3] automation/eclair: monitor rules 11.6, 17.2, 18.3,
 21.11, 21.14-16
Thread-Index: AQHb/B+ODup9r+4xjEKrKJombx948g==
Date: Wed, 23 Jul 2025 22:17:20 +0000
Message-ID:
 <2d8d4c94058606647e8c2c3bc8e51fcb3126a1ef.1753308869.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DU0PR03MB8719:EE_
x-ms-office365-filtering-correlation-id: 1fa153ef-99e5-4bab-04d7-08ddca36b120
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|42112799006|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?rGg3CrOlbN/heKIrDOPA3mcuc3S4RDJbr/aIzOGDmX1FZ2fX1ViOpL76fZ?=
 =?iso-8859-1?Q?AonDIQ923Q9pJMhoWP/9PM9XXWu4edhMO/uaTczB79u/EMgN8UV2rOKUCi?=
 =?iso-8859-1?Q?qM2RBwAUIT3nPr3nEPii9zeBqMsP2CnbG56O421GhnqMKXjrk1akNFNNpX?=
 =?iso-8859-1?Q?n5oGBbqQbhRPXDkxB/23FPIFRy5AjoVfAXAj5bvdD13xpyIUfb64BAvzdU?=
 =?iso-8859-1?Q?nKkpGePBEC9BEe9yokQITYFMdD9jpY2WWrhmlPSmZdG+WtbBYKyh5rnEtT?=
 =?iso-8859-1?Q?DFo/Urq59416p64rxRDKHwaPNtnvxIjYJvvSeZiTMnhyW7omtmEozmVBHJ?=
 =?iso-8859-1?Q?ePAIlZEgH0sM9bqZ0ixSzLFdskp+px3a3q2DPo59ArzXQZCi6AZtmiNXFF?=
 =?iso-8859-1?Q?U1yavivC70Rw5wungHQ5qmos6pJwS6z+yefWmDyCwGsAplKEIC89E7IERQ?=
 =?iso-8859-1?Q?FnC1i5O7j86pAmGLP4Lhv6OLNA7GL/FHFvCSrsya/aLQ83hx8u3Ipy39G7?=
 =?iso-8859-1?Q?hFx9TZlHtq+cttFzrvtjL6PDjqCR8ZJXc1TCJH2C+xs4LehoT11N2t0Zfx?=
 =?iso-8859-1?Q?TeLvoK852ObO3s1VKywsxWFpaipcLUjdSEU9TbUEcEjStPPEZUa3Ngf65I?=
 =?iso-8859-1?Q?D7Miakd/H6ttcCqIqR2PN9trkYh3dYB3D9SlVTbpy4kJaUHztRFCreiGzj?=
 =?iso-8859-1?Q?vOKaPAmHzQVlQx+qjazy3JyUFuwNID6DynkX8UbvJAjMA+fqUIRZYfZPHa?=
 =?iso-8859-1?Q?HFRMTjS15M9Wu2HKX6HqujDfmwu1eHp/zB3vx80E+j2BhUALFkJxUhigjb?=
 =?iso-8859-1?Q?H704MJenVWlhQRziV3RiaX7iykhH5elTyL3aRNB3CWtzyHsVe9TZPtfMyB?=
 =?iso-8859-1?Q?VnWbHmftF97weJoBiBuJPRomNdvjuKrOnD7b2y7/WCaQ16ZlGIJ4Exlkg8?=
 =?iso-8859-1?Q?ZIAQfo2rYQXeR8BmoygVL1nruYw+I34E0w6bPJoJItDJz6aS5t27DgygZn?=
 =?iso-8859-1?Q?Yq03kUQKUoKOmeKqdR2zQAvdqQoC34nalZV9/baXZKcSRSHetCxLwLC2wi?=
 =?iso-8859-1?Q?LWDOtCAYxBgrmB+jbY7bRBAKxGbJ7Z7/dYtN6nmL6aojhMMsCL7erYc/f3?=
 =?iso-8859-1?Q?gXyzJHpKo/FDMdGCn5LnlZ+ryYrRFRyKrqIeVMCqyd2isg7SRgeMZs8AHV?=
 =?iso-8859-1?Q?Mg9JKiS7HT6jj1HNSY7Cefe6s74o/GA0qBzKlGJTY36jQ/C1K2fDWISmv9?=
 =?iso-8859-1?Q?D6dH64YHBC412mCejQQOUf14AzTuU4UYjKbNcDMSdxSbU5x9Mriis4GeCP?=
 =?iso-8859-1?Q?xAldP0Z4u24SzXfKjhzEemKx9aqGRJ/TUkrohT3Lh/MRTSVaV3aMFDL/tV?=
 =?iso-8859-1?Q?HLDs94nU8NUCfxBe9VNOFRXqD1mVdKYUX63AYCFRQ7sJdG3xP/DxbYGVAG?=
 =?iso-8859-1?Q?rIf47oi9V+inj7HMWU42vhZ0KQeErQ9sOnUMpuTg20lf8afVm11+jBOCfd?=
 =?iso-8859-1?Q?gxazXbBnbg/BQbiOFU4o64w3U9eCJK4VOUv1NoxsIN//unD+mTs91sM+wk?=
 =?iso-8859-1?Q?u+/5Ryc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(42112799006)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?v4eTktt1jL38Wr+njog2MdloN23s0wvitmmkYSC+14jVu0iRgePaQ6amMV?=
 =?iso-8859-1?Q?PzJEbZ2NEqXjIUbYJHP5ZkDqFfmtN0iUG1zUVKKGpV6ZofTDXAH1skfm9W?=
 =?iso-8859-1?Q?n7UsP2R2imX1a3dUExHmq30t8jGtAeoEgWWP4QRFg3l7+I8OVAux12t6Nr?=
 =?iso-8859-1?Q?i2LSP7JgfyKtm6yhINUEO7ANZJP7L/L4ytl8OB7CAYPL1Bm0DZ0/MuIYZB?=
 =?iso-8859-1?Q?ZtXFMUppyRark/72dcvjdbeEjlsNYOmNn5vkZomk0kma9fc11QPSsb15Js?=
 =?iso-8859-1?Q?RkdQAAQyOkPwxMgJ8yMDcIj3lLuh6bdvqSdWE7RgihdMiQKrdEVnK6JtkV?=
 =?iso-8859-1?Q?okPY8Pljk7LS6/iUSZithKWlrk52JDKelAbb4mCqYdBRnHr99QnwMNs5BF?=
 =?iso-8859-1?Q?lyqUREckD4DyC+t025xFn8CRW6stw7pWAjLAe6rJfBru3TgXwcIYaem7U7?=
 =?iso-8859-1?Q?4lefQykN/6mF39DqDiCLxfq94gX3AcY4MrXYpU/BMQJVpIr5/V6Kpbx25S?=
 =?iso-8859-1?Q?XPAFtnEkt3FgblVpSJmH5rJN7lirCq66GJ7rZFMHIMcrcAqRbtQJxsIdhy?=
 =?iso-8859-1?Q?dhPTz6CeamKU7iUy6jnL4PsLz0KSNKHpKc0hE1Jby3PQ4FFxvqgTejddDq?=
 =?iso-8859-1?Q?TMD3xOJdz5oXwqxCWB4/zIUmxjDnEs3v1Bp6b6qHvyjckZsZEYmpEYMIEm?=
 =?iso-8859-1?Q?HXqVC0To4OeaVgd+VcppbbCQezZ/ougmjPMPMYHnanQFfT4WaEZu2k1H91?=
 =?iso-8859-1?Q?RHynG0kGh4iX4L7J69zX8HLyqn6rGmlxwjG/bkASwgm+AieQ8ur5aNbAQs?=
 =?iso-8859-1?Q?Wl3Xrn2zy0V4iH0A3pTkb1Kr0NO7hX31g3Sq2NuNXbOFD76Mo4jViX7QqH?=
 =?iso-8859-1?Q?yJFsbYGDY40RdToUHBbgI4AwRV8mNvBDLVcLTWvWBye01FsBsyQz9rdDIo?=
 =?iso-8859-1?Q?KA4tuKIBVMwjlI19sy0/2GIJdPzSrvLTOYxQK+2hR/6sz4l+BMFBCwrbB7?=
 =?iso-8859-1?Q?mmTgQZppMRwOPCYLuvCtkmbx9qigCTmrkVGV0JHGw0e2tE2SdlTUZSZgiT?=
 =?iso-8859-1?Q?Rxuih34qhid+PdEs4cybDsdR+8u3x2umV1GapU6MfXBaxQvIxE7IhAH5zV?=
 =?iso-8859-1?Q?+klgiLv4NqUV/s97xqt/roiKqJbwiYJ9BwID+XeGD+/Iyxr9hH0zGJoVsT?=
 =?iso-8859-1?Q?Xy9BA0hPzMIYQDmBdBkNThfAml1s+QMsy2sQ718I9YCBFvqChJonJ6qP63?=
 =?iso-8859-1?Q?cb31ATZauSxNLRK5Qq0gIvFRVgLKro9UjZarvo74XATy5CHI+YIe7EbYKM?=
 =?iso-8859-1?Q?gEh5dFxWMWCgm3qRmSBXXy+FJ3yxQ4ZXGxSj9IVVB5jB4bKs8609RQn2lM?=
 =?iso-8859-1?Q?A8mOcmu9hsZo/VRWMCFnzr/MepyblKmgTkt4W+iptuMkEv5/k+DQUD4ixS?=
 =?iso-8859-1?Q?svB0JBbXCDgD0nhF7G7crOPVaXcMb9QxWvsJ39Z+nIUwM5xorO8uxY0tG2?=
 =?iso-8859-1?Q?ytga3Sebf9/waMUX4zHWUyx04NelWPV1vbh7UIIBsFvPQSFP2jwX9zFTui?=
 =?iso-8859-1?Q?JugdrUnAN2lc0bIuoyerkTXlRX3b5tbiuCbOBF4HrfiQyF0vgb5KbpuEFa?=
 =?iso-8859-1?Q?W7eO2dI3pP1cqJSwV06l2se+KpDF9a4orU6Ph6EfdSZOdrnp9c7jeloQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa153ef-99e5-4bab-04d7-08ddca36b120
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 22:17:20.4917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pQy0RF9kxQr2DAbClrrL1pwmIv61iwEzMxsR9VW52U1BEWjduXUl0EpYogcptSThDHAlIaKzAzptVxgWImhBUgsFhwrU7Tw/VhHyp4Vb2DQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8719

Add MISRA C rules to the monitored set.
All these rules are 'accepted' for XEN, have zero or few violations,
and should be enabled for the ECLAIR scan.

Rule 17.2 is enabled to detect accidental direct recursion.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Test CI pipeline: https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pi=
pelines/1943607023

Changes in v3:
- updated commit message
- added link to a passed pipeline
---
 automation/eclair_analysis/ECLAIR/monitored.ecl | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/e=
clair_analysis/ECLAIR/monitored.ecl
index 00bff9edbe..72698b2eb1 100644
--- a/automation/eclair_analysis/ECLAIR/monitored.ecl
+++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
@@ -45,6 +45,7 @@
 -enable=3DMC3A2.R10.2
 -enable=3DMC3A2.R11.1
 -enable=3DMC3A2.R11.2
+-enable=3DMC3A2.R11.6
 -enable=3DMC3A2.R11.7
 -enable=3DMC3A2.R11.8
 -enable=3DMC3A2.R11.9
@@ -62,12 +63,14 @@
 -enable=3DMC3A2.R16.6
 -enable=3DMC3A2.R16.7
 -enable=3DMC3A2.R17.1
+-enable=3DMC3A2.R17.2
 -enable=3DMC3A2.R17.3
 -enable=3DMC3A2.R17.4
 -enable=3DMC3A2.R17.5
 -enable=3DMC3A2.R17.6
 -enable=3DMC3A2.R18.1
 -enable=3DMC3A2.R18.2
+-enable=3DMC3A2.R18.3
 -enable=3DMC3A2.R18.6
 -enable=3DMC3A2.R18.8
 -enable=3DMC3A2.R19.1
@@ -83,14 +86,18 @@
 -enable=3DMC3A2.R20.14
 -enable=3DMC3A2.R21.3
 -enable=3DMC3A2.R21.4
--enable=3DMC3A2.R21.6
 -enable=3DMC3A2.R21.5
+-enable=3DMC3A2.R21.6
 -enable=3DMC3A2.R21.7
 -enable=3DMC3A2.R21.8
 -enable=3DMC3A2.R21.9
 -enable=3DMC3A2.R21.10
+-enable=3DMC3A2.R21.11
 -enable=3DMC3A2.R21.12
 -enable=3DMC3A2.R21.13
+-enable=3DMC3A2.R21.14
+-enable=3DMC3A2.R21.15
+-enable=3DMC3A2.R21.16
 -enable=3DMC3A2.R21.17
 -enable=3DMC3A2.R21.18
 -enable=3DMC3A2.R21.19
--=20
2.43.0

